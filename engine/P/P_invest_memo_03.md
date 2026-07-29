# P_invest_memo_03 — Tier 2: Screen mã trong ngành

Giai đoạn 3 của quy trình. Trong mỗi ngành đã chọn ở tier 1, thu còn 6-10 mã qua kiến trúc 2 tầng (universe filter → ranking filter) + phân bucket entry timing.

Reference: `P_invest_memo_00` phần Flow chi tiết (overview), `P_invest_memo_00` phần Cơ chế checkpoint review, `P_invest_memo_02` (tier 1 output làm input), pack `K_agent_db` (`K_agent_db_01` schema, `K_agent_db_02` query patterns, `K_agent_db_04` interpretation).

---

## 1. Mục tiêu & output expected

**Mục tiêu:** trong mỗi ngành shortlist từ tier 1, sàng lọc từ full_ticker_list xuống 6-10 mã qua:
- **Universe filter:** loại thẳng mã không đạt fundamental + liquidity, hoặc catalyst mạnh
- **Ranking filter:** xếp hạng mã trong universe theo flow + kỹ thuật
- **Phân bucket entry timing:** chia 3 bucket dựa trên zone tuần+tháng cho tier 6 sizing

**Input:**

1. File output tier 1 (`tier1_YYYYMMDD_confirmed.md`) — shortlist 3-5 ngành + flags bối cảnh
2. Bảng catalyst ngành đã lọc từ tier 1 (chỉ liên quan các ngành shortlist)
3. Quota: 6-10 mã/ngành tuỳ universe size

**Output chính:**

1. Cho mỗi ngành shortlist: 6-10 mã qua ranking + phân bucket 1/2/3
2. Mã sát nút — lọt universe nhưng ranking thấp (user có thể override)
3. Flags kỹ thuật từng mã chuyển sang tier 3 (chấm điểm)
4. Report checkpoint 3 theo khung 6 phần

**Tần suất:** sau khi tier 1 được confirm. Mỗi ngành là 1 session con — user có thể xem hết tại 1 session lớn hoặc tách nhỏ.

**Thời gian session:** 30-60 phút Agent work cho 3-5 ngành (10-15 phút/ngành). User review checkpoint 30-45 phút.

---

## 2. Kiến trúc 3 tầng filter

### Tầng 1 — Universe filter (loại thẳng)

Mã phải lọt điều kiện universe mới được xem xét tiếp. Công thức:

**Universe = T ∩ { [(B ∩ D) ∪ (C ∩ D) ∪ (E ∩ D)] − F }**

Trong đó:
- **T — Xu hướng giá (gate bắt buộc, áp TRƯỚC mọi vòng khác):** mã phải có bằng chứng đã ngừng giảm. Xem Section 2b
- **B — Fundamental mã:** mã có trạng thái kinh doanh cơ bản đủ chất lượng
- **D — Liquidity:** giá trị giao dịch đủ cao để vào/ra không gây slippage nặng
- **C — Catalyst mã (optional):** mã có catalyst cá thể mạnh, có thể không đạt B nhưng có catalyst
- **E — Sức hút dòng tiền (optional, chỉ mở khi horizon ngắn):** mã không đạt B nhưng có bằng chứng hút dòng tiền mạnh và bền. Xem Section 5b
- **F — Loại trừ cứng:** sự kiện pháp lý, quản trị, hoặc nguồn cung cổ phiếu làm mã không dùng được bất kể B/C/E/D. Xem Section 5c

Logic:
- **T là gate chặn trước tiên** — mã trượt T không vào universe bất kể B, C, E, D tốt đến đâu. Không có đường vòng, không có exception tự động
- Đường chính: B ∩ D — mã fundamental tốt + đủ thanh khoản
- Đường phụ 1 (optional): C ∩ D — catalyst play không đạt B nhưng có catalyst mạnh
- Đường phụ 2 (optional): E ∩ D — flow play không đạt B nhưng dòng tiền chứng minh được bằng số
- D là bắt buộc cho cả 3 đường — không có exception cho liquidity
- **F áp SAU cùng và loại thẳng**, kể cả mã đã lọt B ∩ D

**Constraint đường phụ:** tối đa 1-3 mã/ngành qua đường C, và tối đa 1-3 mã/ngành qua đường E. **Tổng hai đường phụ không vượt 3 mã/ngành** — tránh shortlist ngập mã thiếu nền tảng.

**Đường E chỉ mở khi user chốt horizon ngắn (1-3 tháng) và tuyên bố ưu tiên dòng tiền trên cơ bản.** Mặc định đường E ĐÓNG. Mở đường E là quyết định của user, phải ghi `audit_overrides.md`, vì nó đảo thứ tự hai tầng của kiến trúc gốc.

### Tầng 1b — Vòng T: bộ lọc xu hướng giá (v2 từ 2026-07-29)

**Nguyên tắc:** với horizon 1-6 tháng, **xu hướng giá là điều kiện CẦN, định giá và cơ bản là điều kiện ĐỦ.** Không đưa vào universe cổ phiếu chưa có bằng chứng ngừng giảm, bất kể định giá rẻ đến đâu và chỉ báo quá bán đến đâu.

**Hai đại lượng, tính từ giá đóng cửa thô (`history_stock`), không dùng tầng chỉ báo nội bộ:**

1. **Khoảng cách tới MA200** — trung bình đơn 200 phiên đóng cửa.
2. **Chuỗi 120 phiên chia ba đoạn** — so giá đóng cửa tại các mốc T−120, T−60, T−20 và hiện tại; đếm số đoạn giảm trên 3.

**Phân tầng:**

| Tầng | Điều kiện | Xử lý |
|---|---|---|
| **Loại thẳng** | Dưới MA200 quá **20%** VÀ giảm cả **3/3** đoạn | **Không vào universe.** Chuyển sang danh sách theo dõi kèm điều kiện kích hoạt |
| **Chờ xác nhận** | Dưới MA200 từ 0 đến 20%, hoặc giảm 2/3 đoạn | Vào universe nhưng **không được cấp size đầy đủ** cho tới khi có 2 tín hiệu: đóng cửa trên MA20 ba phiên liên tiếp VÀ không tạo đáy mới trong 10 phiên |
| **Mua được** | Trên MA200 VÀ không giảm quá 2/3 đoạn | Vào universe bình thường |

**Vì sao MA200 chứ không phải MA20/MA50.** MA20 và MA50 phản ứng quá nhanh nên trong một nhịp bật kỹ thuật chúng cho tín hiệu mua rồi rút lại ngay. MA200 trả lời đúng câu duy nhất cần trả lời trước khi bắt đáy: **thị trường có còn coi mức giá này là hợp lý theo quan điểm một năm không.** Chậm là ưu điểm ở đây.

**Vì sao chia ba đoạn.** Một con số phần trăm duy nhất che mất hình dạng đường đi. Ba đoạn phân biệt được ba trường hợp có cùng mức giảm tổng: giảm rồi đi ngang (đoạn cuối phẳng — đáng quan tâm), giảm đều liên tục (3/3 âm — dao rơi), giảm rồi hồi rồi giảm tiếp (đoạn giữa dương — bẫy).

**Ngoại lệ duy nhất:** mã niêm yết dưới 200 phiên chưa đủ chuỗi để tính MA200 — dùng MA khả dụng dài nhất, **ghi rõ trong checkpoint** rằng phép so sánh yếu hơn vì mã chưa trải qua chu kỳ giảm nào.

**Vòng T không được nới bởi Agent.** Universe sau T nhỏ hơn quota thì **giảm quota**, không hạ ngưỡng. Nới T là quyết định của user và phải ghi `audit_overrides.md`.

**Ca thật đã vấp (cycle 2026-08), lý do vòng này ra đời:** bản khuyến nghị ngày 28/07 đưa 8 mã vào danh sách mua trong khi cả 8 đều thuộc tầng loại thẳng, gồm 5 mã ở nhóm lõi. Nặng nhất: KDH ở −37,9% dưới MA200 với 3/3 đoạn giảm và tốc độ giảm còn tăng dần, được xếp nhóm lõi nhờ định giá ngành rẻ, chỉ báo quá bán 19,4 và một phiên khối ngoại mua ròng. Toàn bộ 6/6 mã ngành BĐS Dân dụng khi đó đều ở tầng loại thẳng.

### Tầng 2 — Ranking filter (xếp hạng, không loại)

Sau khi có universe, dùng **Vòng A (Flow + kỹ thuật trung-dài hạn)** xếp hạng top 6-10 mã/ngành. Mã không lọt Vòng A (zone quý+năm yếu) vẫn ở trong universe, chỉ xếp hạng thấp — nếu universe nhỏ thì vẫn có thể vào shortlist.

### Tầng 3 — Phân bucket entry timing

Sau khi có shortlist ranked, phân mỗi mã vào 1 trong 3 bucket dựa trên **zone tuần + tháng + điểm dòng tiền tuần**. Bucket quyết định timing và tỷ lệ size khi vào position ở tier 6.

---

## 3. Vòng B — Fundamental mã

### Query DB

Bước 1 — lấy full_ticker_list của ngành (từ tier 1 hoặc query lại):
```
collection: industry_info
filter: { "industry_name": "<tên ngành>" }
projection: { "_id": 0, "industry_name": 1, "full_ticker_list": 1 }
```

Bước 2 — lấy stock_finstats cho toàn bộ ticker trong ngành (4 kỳ quarterly + valuation):
```
collection: stock_finstats
pipeline: [
  { "$match": { "ticker": { "$in": [<full_ticker_list>] } } },
  { "$project": {
      "_id": 0, "ticker": 1, "industry": 1, "type": 1,
      "valuation_ratios": 1,
      "quarterly_recent": { "$slice": [ "$financial_statements.quarterly", -4 ] }
  } }
]
```

Bước 3 — lấy industry_finstats làm benchmark:
```
collection: industry_finstats
filter: { "industry_name": "<tên ngành>" }
projection: { "_id": 0 }
```

### Quy tắc bắt buộc — đọc CHUỖI, không đọc một quý

**Đây là quy tắc quan trọng nhất của Vòng B. Vi phạm nó là nguyên nhân của mọi lỗi chọn mã đã ghi nhận.**

Bước 2 ở trên lấy 4 kỳ quarterly. **Phải dùng cả 4 kỳ, không được chỉ đọc kỳ cuối.** Với ngành có lợi nhuận lumpy (bất động sản, xây dựng, chứng khoán, hàng hoá chu kỳ), lấy **6 kỳ** thay vì 4.

Ba chỉ tiêu bắt buộc đọc theo chuỗi, không được đọc điểm:

| Chỉ tiêu | Vì sao phải đọc chuỗi |
|---|---|
| **ICR** | Doanh nghiệp có thể có 1 quý ICR cao nhờ khoản bất thường, che 3 quý âm liền trước |
| **Dòng tiền kinh doanh (CFO)** | ROE cao đi kèm CFO âm kéo dài = lợi nhuận không tạo tiền |
| **Tăng trưởng lợi nhuận** | Một quý đột biến kéo nền so sánh, làm quý sau trông xấu và ngược lại |

### Kiểm tra bắt buộc — độ tươi kỳ báo cáo (v2 từ 2026-07-29)

**Chạy kiểm tra này TRƯỚC mọi kiểm tra khác của Vòng B.**

So kỳ báo cáo mới nhất trong `stock_finstats` với kỳ gần nhất doanh nghiệp **đã công bố thật**. Hai tình huống, xử lý khác hẳn nhau — không phân biệt thì quy tắc thành cứng nhắc vô ích:

| Tình huống | Dấu hiệu | Xử lý |
|---|---|---|
| **A — Số mới ĐÃ CÓ nhưng kho chưa cập nhật** | Doanh nghiệp đã công bố BCTC kỳ N nhưng kho dừng ở kỳ N−1 | **Lỗi. Phải đi tìm số mới** — web search BCTC, công bố thông tin doanh nghiệp, hoặc yêu cầu user cung cấp. **Cấm dùng số cũ rồi chấm điểm như thường.** Không tìm được thì ghi **"chưa đủ cơ sở khuyến nghị"** và để mã ngoài universe |
| **B — Doanh nghiệp CHƯA công bố** | Chưa tới hoặc vừa qua hạn công bố, chưa có BCTC | Số cũ là số mới nhất hợp lệ, **được dùng** — nhưng phải ghi nhãn kỳ báo cáo cạnh mỗi con số và **hạ một bậc mức tin cậy** cho tới khi số mới về |

**Quy tắc nhãn bắt buộc:** mỗi con số tài chính trong checkpoint phải kèm **kỳ báo cáo** và nhãn **[công bố]** hoặc **[dự phóng]**. Cấm trộn hai loại trong cùng một bảng chấm điểm mà không phân biệt — đó là cách một dự phóng của bên thứ ba trở thành căn cứ cấp tỷ trọng.

**Mốc lịch cần thuộc:** BCTC quý riêng lẻ hạn 20 ngày sau quý (30 ngày với công ty mẹ); BCTC bán niên soát xét hạn 45 ngày (60 ngày với công ty mẹ). Nếu ngày chạy báo cáo nằm sát các mốc này, **hoãn phần chấm điểm cho tới khi số về** thay vì chạy trên số cũ.

**Hai ca thật (cycle 2026-08):** nhóm công ty chứng khoán rơi vào tình huống A — BCTC quý 2 đã công bố từ giữa tháng 7 mà báo cáo vẫn dùng số quý 1, dẫn tới xếp VCI và VND vào nhóm lõi trong khi số quý 2 cho thấy VCI **vốn chủ giảm 872 tỷ dù báo lãi 591 tỷ** và VND xếp hạng chót về chất lượng lợi nhuận. Nhóm ngân hàng rơi vào tình huống B — 5 trên 8 mã chưa công bố BCTC quý 2 tại thời điểm chạy, nên số quý 1 hợp lệ nhưng phải ghi nhãn.

### Kiểm tra bắt buộc — đối chiếu trailing với quý gần nhất

Trong `stock_finstats`, **ROE và các chỉ tiêu sinh lời là số trailing 4 quý**, còn `valuation_ratios` cũng tính trên lợi nhuận trailing. Nghĩa là **một quý cũ rất mạnh có thể giữ chỉ tiêu trailing qua ngưỡng dù quý gần nhất đã sụp**.

Agent bắt buộc chạy kiểm tra này cho mọi mã trước khi kết luận pass B:

1. Lấy tăng trưởng lợi nhuận YoY của **riêng quý gần nhất**.
2. Nếu quý gần nhất **âm sâu hơn −30%** trong khi ROE trailing vẫn ≥ median ngành → **cờ đỏ "trailing che quý gần nhất"**.
3. Mã bị cờ đỏ **không tự động loại**, nhưng phải: ghi rõ cả hai con số trong checkpoint, hạ một bậc ưu tiên xếp hạng, và nêu trong Phần 6 để user quyết.

**Ba ca thật đã vấp (cycle 2026-08), ghi lại để không lặp:**

| Mã | Chỉ tiêu trailing | Quý gần nhất | Hệ quả nếu không kiểm |
|---|---|---|---|
| DIG | ROE 7,7% — pass B | ICR **−0,8**, CFO **−437 tỷ**, lỗ ròng | Xếp rank 1 ngành BĐS |
| HDC | ROE 24,8% — pass B | **ICR âm 3 quý liên tiếp**, CFO −579/−462/−276 tỷ | Vào shortlist |
| VIX | ROE 25,58%, P/E 5,82 | LNST **−94/−95% YoY**, tự doanh lỗ ròng 200 tỷ | Xếp rank 1 ngành CK |

### Tiêu chí đạt Vòng B — theo 4 type doanh nghiệp

Mỗi type có bộ chỉ tiêu riêng. Agent đọc field `type` trong stock_finstats rồi áp đúng bộ tiêu chí.

#### B-SXKD (585 mã, 21 ngành)

Mã phải đạt **≥ 3/4 tiêu chí**:

- **B1. Tăng trưởng:** Revenue Growth YoY hoặc NPAT Growth YoY quý gần nhất không âm sâu (≥ -10%)
- **B2. Hiệu quả sinh lời:** ROE ≥ median ngành (từ industry_finstats cùng type)
- **B3. Định giá:** P/E không vượt 150% median ngành (cross-sectional, peer hiện tại) VÀ không rơi vào "bẫy giá trị" (P/E quá rẻ + ROE thấp + ICR < 2). Benchmark khác tier 1 intentional: tier 1 dùng historical 3Y của ngành, tier 2 dùng cross-sectional peer hiện tại — hai mục đích khác nhau.
- **B4. Sức khoẻ tài chính:** ICR (Interest Coverage Ratio — chỉ số khả năng trả lãi vay, EBIT / chi phí lãi vay) ≥ 3 (không phải bẫy nợ), biên không co hẹp 4 quý liên tiếp

#### B-NGANHANG (29 mã, 1 ngành)

Mã phải đạt **≥ 3/5 tiêu chí**:

- **B1. Loan Growth YoY** dương hoặc đi ngang (phản ánh nhu cầu tín dụng ổn định)
- **B2. NIM** (Net Interest Margin — biên lãi ròng = thu nhập lãi thuần / tài sản sinh lãi) không co hẹp rõ rệt 3 quý liên tiếp
- **B3. NPL** (Non-Performing Loans — tỷ lệ nợ xấu) ≤ 2.5% HOẶC ≤ median ngành (nợ xấu kiểm soát)
- **B4. LLCR** (Loan Loss Coverage Ratio — tỷ lệ bao phủ nợ xấu = dự phòng rủi ro / dư nợ xấu) ≥ 70% (dự phòng đủ)
- **B5. ROE** ≥ median ngành (ROE annualized ≥ 12%)

#### B-CHUNGKHOAN (41 mã, 1 ngành)

Mã phải đạt **≥ 3/4 tiêu chí**:

- **B1. Revenue Growth** YoY dương hoặc gần 0 (tương quan thị trường — dùng thận trọng khi thị trường điều chỉnh)
- **B2. ROE** ≥ median ngành (dễ biến động, so với ngành thay vì ngưỡng cứng)
- **B3. Margin Loans / Equity** trong range 100-200% (không quá thấp = thiếu đòn bẩy sinh lợi, không quá cao = rủi ro margin call)
- **B4. FVTPL / Equity** (FVTPL = Fair Value Through Profit or Loss — tài sản tài chính ghi nhận theo giá trị hợp lý qua lãi lỗ; tỷ lệ này đo exposure tự doanh trên vốn chủ sở hữu) ≤ 250% (exposure tự doanh không quá lớn)

#### B-BAOHIEM (10 mã, 1 ngành)

Mã phải đạt **≥ 2/3 tiêu chí**:

- **B1. Revenue Growth** (phí bảo hiểm) ≥ 0
- **B2. ROE** ≥ median ngành (ROE annualized ≥ 8%)
- **B3. NPAT Growth** YoY không âm 3 quý liên tiếp

Ngành bảo hiểm nhỏ (10 mã), tiêu chí nới hơn để có universe đủ.

### Workaround khi data không đủ

- Mã không có stock_finstats (< 1% universe): loại thẳng khỏi universe
- Mã thiếu dữ liệu (field bị omit khỏi doc — v2 không còn `NaN`) ở > 50% chỉ tiêu: loại
- Mã thiếu dữ liệu ở 20-50% chỉ tiêu: đánh giá với chỉ tiêu còn lại, downgrade yêu cầu từ 3/4 xuống 2/3 (SXKD/CK/BH) hoặc 3/5 xuống 2/4 (NGANHANG)
- Mã mới niêm yết < 4 quý: chỉ đánh giá valuation + ROE, bỏ qua growth

### Ngưỡng tham khảo theo type

Dựa trên benchmark thực tế từ DB (`K_agent_db_04`):

| Chỉ tiêu | SXKD median | NGANHANG | CK | BH |
|---|---|---|---|---|
| P/E | ~14.6x | N/A (dùng P/B) | ~18x | ~9.6x |
| P/B | ~1.5x | ~1.3x | ~1.9x | ~1.8x |
| ROE annualized | theo ngành | ~17% | ~10.5% | ~8.4% |
| Leverage | ≤ 2.5x | 10-15x (đặc thù) | 2-2.5x | 7-11x (đặc thù) |

---

## 4. Vòng D — Liquidity

### Tiêu chí liquidity

Mã phải đạt **tất cả** 3 tiêu chí (không nới):

- **D1. Trading value trung bình 20 phiên** ≥ 5 tỷ đồng/phiên
- **D2. Volume 20 phiên trung bình** ≥ 100,000 cp/phiên
- **D3. market_rank_pct > 0** (rank_pct = 0 = không đủ điều kiện xếp hạng do thanh khoản quá thấp)

### Query DB

Từ stock_snapshot (có market_rank_pct):
```
collection: stock_snapshot
filter: { "ticker": { "$in": [<full_ticker_list>] } }
projection: { "_id": 0, "ticker": 1,
              "price.volume": 1, "price.trading_value": 1,
              "money_flow_score.market_rank_pct": 1,
              "money_flow_score.industry_rank_pct": 1 }
```

Trading value tức thời (`price.trading_value`) là giá trị phiên hôm nay. Để có trung bình 20 phiên, query thêm `stock_recent`:

```
collection: stock_recent
filter: { "ticker": { "$in": [<full_ticker_list>] } }
projection: { "_id": 0, "ticker": 1,
              "series.price.trading_value": 1,
              "series.price.volume": 1 }
```

Tính average trading_value qua 20 phiên ở agent side.

### Lý do D quan trọng

Horizon 1-6 tháng với portfolio < 1 triệu USD vẫn chịu slippage lớn nếu mã thanh khoản thấp. Nguyên tắc ≤ 5% ADV 20 phiên từ `P_invest_memo_00` Nguyên tắc 3 áp dụng ở tier 5 cho sizing — nhưng ở tier 2 phải loại trước để tránh phí resource cho mã không vào được.

**Ngoại lệ:** D không được nới tự động bởi Agent (cascading từ master Nguyên tắc 3 — 5% ADV slippage protection). User có thể override với audit log nêu lý do mạnh (vd theo dõi mã thanh khoản đặc biệt). Nếu universe sau D < 6 mã, default action: chấp nhận shortlist ngành nhỏ hơn thay vì nới D.

---

## 5. Vòng C — Catalyst mã (optional)

### Scope

Đây là đường vào riêng cho catalyst play — mã có thể fail B nhưng có catalyst cá thể mạnh, vẫn có thể vào universe. Đường C **thêm vào** universe, không thay B.

Mã đã pass B + D không cần qua C. Chỉ xét C cho mã pass D nhưng fail B.

### Phân loại catalyst mã (catalyst loại 4 từ `P_invest_memo_01`)

Catalyst cá thể quét ở tier 2 (không phải tier 0 — tier 0 chỉ quét catalyst vĩ mô/ngành/chu kỳ hàng hoá). 5 loại:

| Loại | Ví dụ | Độ chắc | Timing impact |
|---|---|---|---|
| 1. KQKD sắp công bố | Quý tới dự báo tăng trưởng mạnh, EPS đảo chiều | Trung — cần dự báo từ sell-side hoặc forecast nội bộ | 0-1 tháng |
| 2. M&A / Thoái vốn | Thâu tóm doanh nghiệp, NN thoái vốn, strategic partner | Cao nếu đã công bố chính thức | 0-6 tháng |
| 3. Hợp đồng lớn | Contract trị giá ≥ 20-30% doanh thu năm | Cao nếu có hợp đồng ký | 0-3 tháng |
| 4. Tăng room NN | Nới room từ 30% lên 49% hoặc 49% → 100% | Cao — có văn bản | 0-1 tháng sau khi có hiệu lực |
| 5. Niêm yết/chuyển sàn | Chuyển sàn HSX, phát hành thêm lớn | Trung — cần xem ngày cụ thể | 0-3 tháng |

### Quét catalyst mã

**Bước 1 — News DB:**
```
collection: news_history_feed
filter: { "tickers": { "$in": [<full_ticker_list ngành>] },
          "type": "news_feed",
          "created_at": { "$gte": ISODate("<cách đây 60 ngày>") } }
sort: { "created_at": -1 }
limit: 100
projection: { "_id": 0, "title": 1, "sapo": 1, "article_slug": 1,
              "tickers": 1, "created_at": 1 }
```

**Bước 2 — Duyệt title + sapo**, tìm pattern 5 loại catalyst. Với tin khả nghi, query `news_history_content` để đọc chi tiết.

**Bước 3 — Web search bổ sung** (song song với DB):
- KQKD forecast cho ngành (các mã lớn)
- Nghị quyết ĐHCĐ gần nhất của các mã trong ngành
- Tin room NN mới
- Các deal M&A đã công bố

### Tiêu chí đạt Vòng C

Mã đạt C nếu có ≥ 1 catalyst thoả đủ 3 đặc tính từ `P_invest_memo_01`:
1. **Timing cụ thể** — ngày hoặc khung thời gian ước lượng được
2. **Magnitude đo được** — impact doanh thu/LNST/định giá ước lượng được
3. **Verifiable** — biết được sau sự kiện là đúng hay sai

Tin đồn không có timing cụ thể → không tính.

### Constraint số lượng

- **Tối đa 1-3 mã/ngành qua đường C** (fail B nhưng có catalyst mạnh)
- Ngành có universe B+D lớn (> 10 mã): tối đa 1 mã qua C (không cần thêm catalyst play)
- Ngành có universe B+D nhỏ (< 6 mã): tối đa 3 mã qua C để bù

Giữ tỷ lệ catalyst play / fundamental stable ở mức hợp lý. Shortlist toàn catalyst play = rủi ro cao, thiếu nền tảng.

---

## 5b. Vòng E — Sức hút dòng tiền (chỉ mở khi horizon ngắn)

### Vì sao có vòng này

Kiến trúc gốc đặt cơ bản làm bộ lọc loại thẳng và dòng tiền chỉ làm bộ lọc xếp hạng. Với horizon 3-6 tháng trở lên, thứ tự đó đúng. **Với horizon 1-3 tháng và luận điểm bắt nhịp hồi, nó sai** — lợi nhuận đến từ mức nén giá phục hồi, mà phục hồi cần dòng tiền, không cần EPS.

Vòng E cho phép mã **fail B nhưng chứng minh được sức hút dòng tiền bằng số** vào universe. Đây là đường vào thứ ba, tách bạch với đường catalyst (Vòng C).

**Mặc định ĐÓNG.** Chỉ mở khi user chốt horizon 1-3 tháng và tuyên bố ưu tiên dòng tiền trên cơ bản. Ghi `audit_overrides.md`.

### Ba chỉ tiêu, cần đạt ít nhất 2/3

**E1. Vòng quay thanh khoản** = giá trị giao dịch bình quân 20 phiên ÷ vốn hoá, tính bằng điểm cơ bản (nhân 10.000).

Đây là thước tốt hơn giá trị giao dịch tuyệt đối, vì nó chuẩn hoá theo quy mô. Một mã 15 tỷ/phiên trên vốn hoá 2.000 tỷ hút tiền tốt hơn một mã 15 tỷ/phiên trên vốn hoá 60.000 tỷ.

- ≥ 80 điểm cơ bản: rất mạnh
- 40-80: đạt
- 20-40: yếu
- < 20: không đạt

**E2. Hiệu suất sau đáy chu kỳ.** Đo lợi suất 6 tháng của mã tính từ các đáy chỉ số gần nhất (tối thiểu 2 đáy). Mã có lợi suất **trên trung vị ngành ở ít nhất 2 trong 2 đáy** thì đạt.

Cách xác định đáy: lấy phiên có giá đóng cửa thấp nhất của chỉ số trong mỗi đợt điều chỉnh lớn. Cycle 2026-08 dùng 15/11/2022 và 09/04/2025.

**E3. Bằng chứng dòng tiền đang hoạt động.** Cần ít nhất một trong:
- Có tên trong danh sách "hút tiền" của bản tin phiên hoặc tuần trong 30 ngày gần nhất, **có ngày và nguồn cụ thể**
- Khối lượng khớp lệnh một phiên trong 10 phiên gần nhất dẫn đầu ngành hoặc dẫn đầu sàn
- Khối ngoại mua ròng trong 20 phiên gần nhất

### Cảnh báo bắt buộc khi dùng Vòng E

1. **Kiểm mâu thuẫn nội tại.** Mã vào bằng lý do "hút dòng tiền" mà **E1 dưới 20 điểm cơ bản** là mâu thuẫn — phải flag và đề nghị user xem lại. Ca thật: TAL vào shortlist cycle 2026-08 theo đường E nhưng vòng quay chỉ 5,3, thấp nhất trong 22 mã đã đo.
2. **Mức tăng khối lượng theo phần trăm không phải bằng chứng.** Mã nhỏ tăng khối lượng 200-300% vẫn có thể chỉ 2-3 tỷ/phiên. Luôn kiểm giá trị tuyệt đối. Ca thật: bản tin nêu AGG, IDJ, NDN trong nhóm hút tiền, nhưng giá trị giao dịch lần lượt 2,9 · 1,7 · 1,5 tỷ/phiên — đều trượt ngưỡng D.
3. **Mã vào bằng đường E phải có kỷ luật thoát riêng**, chuyển thẳng cho Tier 6: thoát khi dòng tiền rút, không chờ cơ bản xác nhận. Ngưỡng đề xuất — vòng quay 5 phiên giảm dưới 60% mức bình quân 20 phiên thì thoát bất kể giá.

## 5c. Vòng F — Loại trừ cứng

Áp **sau cùng**, loại thẳng kể cả mã đã lọt B ∩ D. Đây là các điều kiện làm mã không dùng được bất kể chất lượng cơ bản hay dòng tiền.

### F1. Sự kiện pháp lý và quản trị

Loại nếu có bất kỳ điều nào trong 12 tháng gần nhất:

- Lãnh đạo hoặc nguyên lãnh đạo **bị khởi tố, bắt tạm giam**, chưa có kết luận
- Cổ phiếu bị sở giao dịch đưa vào **diện cảnh báo, kiểm soát, hoặc hạn chế giao dịch**
- Có cá nhân bị xử phạt vì **thao túng chính cổ phiếu đó**
- Doanh nghiệp **chậm trả gốc hoặc lãi trái phiếu**
- Cổ đông lớn hoặc lãnh đạo **bị bán giải chấp** dẫn tới mất tư cách cổ đông lớn

### F2. Nguồn cung cổ phiếu tương lai rơi trong horizon

Loại hoặc hạ size nếu có đợt phát hành, chuyển đổi, hoặc đấu giá **thực hiện trong đúng khung thời gian nắm giữ dự kiến**:

- Phát hành riêng lẻ hoặc chào bán cho cổ đông hiện hữu, tỷ lệ ≥ 10% vốn, thực hiện trong horizon → **loại**
- Cổ phiếu thưởng hoặc cổ tức cổ phiếu **không hạn chế chuyển nhượng**, tỷ lệ ≥ 20%, về tài khoản trong horizon → hạ một bậc ưu tiên
- **Trái phiếu chuyển đổi có giá chuyển đổi sát hoặc dưới thị giá** → loại, vì pha loãng gần như chắc chắn kích hoạt

### Cách quét F — bắt buộc, không để đến Tier 5A

**Không có thông tin nào của Vòng F nằm trong `agent_db`.** Phải quét bằng web search cho **từng mã trong universe** trước khi chốt shortlist.

Đây là thay đổi so với spec cũ, vốn để việc soi red flag đến Tier 5A. Lý do đổi: ở cycle 2026-08, **8 trong 18 mã shortlist ban đầu bị loại vì lý do Vòng F**, và nếu để đến Tier 5A thì đã tốn toàn bộ công Tier 3 và Tier 5B cho những mã không dùng được.

Ca thật đã ghi nhận, cả 5 ngành đều có: VCG và DGC (khởi tố lãnh đạo), DGC (HoSE hạn chế giao dịch), DPG (thao túng giá), NVL (chậm trả nợ gốc), DIG và HDC (giải chấp lãnh đạo), TPB (bị loại khỏi VN30), BID và VND và VPB và BCM và DPM (pha loãng lớn trong horizon), CII (trái phiếu chuyển đổi giá sát thị giá).

## 6. Vòng A — Ranking (Flow + Kỹ thuật trung-dài hạn)

### Query DB

```
collection: stock_snapshot
filter: { "ticker": { "$in": [<ticker trong universe>] } }
projection: { "_id": 0, "ticker": 1, "snapshot_date": 1,
              "price": 1,
              "money_flow_score": 1,
              "change": 1,
              "technical_zone.overall": 1 }
```

```
collection: stock_nntd
filter: { "ticker": { "$in": [<ticker trong universe>] } }
projection: { "_id": 0, "ticker": 1,
              "nn.month.net_value": 1, "nn.week.net_value": 1 }
```

### Tiêu chí xếp hạng

Không ngưỡng cứng để loại — đây là **ranking tool**. Xếp hạng theo tổng hợp 4 tiêu chí:

**A1. Technical zone quý (`technical_zone.overall.q`):**
- AAA / AA: rất mạnh (ưu tiên rank đầu)
- A: mạnh
- B: trung bình
- C: yếu (rank cuối)

**A2. Technical zone năm (`technical_zone.overall.y`):**
- AAA / AA: structural mạnh dài hạn
- A: OK
- B: sideways
- C: downtrend dài hạn — cảnh báo

**A3. market_rank_pct (xếp hạng dòng tiền toàn thị trường — percentile 0-100):**
- ≥ 90: top 10%
- 75-90: top 25%
- 50-75: trên trung vị
- < 50: dưới trung vị (rank thấp)

**A4. week_score (điểm dòng tiền tuần):**
- > 20: tốt
- 10-20: OK
- 0-10: yếu
- < 0: âm — cảnh báo

### Ưu tiên xếp hạng

Cho horizon 1-6 tháng, ưu tiên A1 (zone quý) khi có tranh chấp. Zone quý = 60 phiên ~ 3 tháng, khớp với horizon. Zone năm (240 phiên) là structural, dùng làm context.

Nguyên tắc ranking:
- Mã có ≥ 3/4 tiêu chí ở mức "rất mạnh" → rank đầu
- Mã có 2-3 tiêu chí "OK trở lên" → rank giữa
- Mã chỉ đạt 1-2 tiêu chí → rank cuối trong universe

### Chọn top N theo quota ngành

- Ngành có universe lớn (> 15 mã): chọn top 10
- Ngành có universe vừa (6-15 mã): chọn top 6-8
- Ngành có universe nhỏ (< 6 mã): lấy hết universe, không ép ranking

Nếu universe ngành < 3 mã: flag rõ trong checkpoint — ngành này có thể cần user review lại tier 1 (có thật sự nên có trong shortlist không).

---

## 7. Phân bucket entry timing

Sau khi có shortlist ranked, phân mỗi mã vào 1 trong 3 bucket. Bucket quyết định timing + tỷ lệ size khi tier 6 vào position.

### 3 bucket — logic phân

| Bucket | Điều kiện | Horizon | Size khi vào |
|---|---|---|---|
| 1 — Vào ngay | zone w ∈ {A, AA, AAA} VÀ zone m ∈ {A, AA, AAA} VÀ week_score ≥ 6 | 1-3 tháng | 50-70% full size ngay |
| 2 — Chờ xác nhận (pullback) | zone q ∈ {A, AA, AAA} hoặc zone y ∈ {A, AA, AAA} NHƯNG zone w HOẶC zone m ∈ {B, C} | 3-6 tháng | 30-50% trước, thêm khi tuần bật A |
| 3 — Watchlist | zone q ∈ {A, AA, AAA} hoặc zone y ∈ {A, AA, AAA} NHƯNG zone w VÀ zone m đều ∈ {C} | Chờ | 0% — chưa vào |

### Logic chi tiết

**Bucket 1 — Vào ngay được:**

Mã đã break out và vẫn giữ momentum. Tuần + tháng đồng thuận A trở lên = ngắn-trung hạn đều mạnh. week_score ≥ 6 xác nhận dòng tiền tuần hiện đang vào.

Phù hợp horizon 1-3 tháng — mã đã momentum, vào ngay để hưởng đoạn cuối của trend tuần/tháng. Size 50-70% full size để đảm bảo có slot nếu mã pullback.

**Bucket 2 — Chờ xác nhận (pullback trong uptrend):**

Mã trong uptrend quý/năm nhưng tuần hoặc tháng đang điều chỉnh (zone B/C). Đây là **kịch bản "ngắn yếu + dài khỏe"** từ `K_agent_db_04` — cơ hội pullback trong xu hướng dài.

Phù hợp horizon 3-6 tháng. Rủi ro: pullback có thể kéo dài hoặc chuyển thành đảo chiều thật sự. Xử lý: vào 30-50% full size trước, chờ xác nhận (zone tuần bật A + day_score dương 2-3 phiên liên tiếp) rồi vào tiếp 30-50% còn lại.

**Điều kiện loại mã khỏi bucket 2:** sau 4 tuần kể từ lúc vào 30-50%, nếu zone tuần vẫn chưa bật A thì thesis pullback thất bại, phải thoát phần đã vào (xem `P_invest_memo_09`).

**Bucket 3 — Watchlist:**

Mã trong uptrend quý/năm nhưng tuần + tháng đều rơi sâu (zone C). Có thể là:
- Đầu đảo chiều structural xấu (tín hiệu early)
- Pullback rất sâu nhưng vẫn trong uptrend dài hạn

Rủi ro cao — chưa vào position. Chờ đến khi:
- zone tuần chuyển B hoặc A (2-3 phiên liên tiếp)
- week_score chuyển từ âm sang dương
- day_score dương 3 phiên liên tiếp

Khi đó chuyển mã từ Bucket 3 → Bucket 2 và bắt đầu vào 30-50% size.

### Lưu ý với mã qua đường C (catalyst play, fail B)

Mã catalyst play có thesis thời hạn (catalyst xảy ra trong 0-3 tháng), ưu tiên vào Bucket 1 hoặc Bucket 2. 

Nếu mã catalyst play rơi vào Bucket 3 (tuần+tháng đều C) → cảnh báo quan trọng: thị trường có thể đang priced-in tiêu cực trước catalyst, hoặc thị trường chưa nhận ra catalyst. Agent **không tự loại** mã khỏi shortlist — thay vào đó:

- Flag rõ trong checkpoint: "Mã [X] catalyst play nhưng vào Bucket 3 — thị trường đang phản ứng tiêu cực hoặc chưa nhận ra"
- Ghi rõ 2 khả năng giải thích để user quyết định:
  - **Khả năng 1:** thị trường đã priced-in tiêu cực → catalyst có thể không đủ mạnh như đánh giá, cân nhắc loại
  - **Khả năng 2:** thị trường chưa biết hoặc chưa nhận ra → cơ hội vào sớm nhưng rủi ro timing cao
- Đề xuất user review lại catalyst: có văn bản chính thức chưa, timing cụ thể chưa, magnitude có rõ ràng không

User quyết định cuối cùng — giữ mã (Bucket 3, chờ confirm tuần) hoặc loại khỏi shortlist.

### Cảnh báo flag từ tier 1

Nếu tier 1 flag ngành có pattern "đang rơi từ đỉnh" hoặc "dao động biên độ lớn" → tier 2 nên:
- Giảm số mã Bucket 1 (mã đang mạnh có thể là late momentum)
- Ưu tiên Bucket 2 và Bucket 3 (chờ pullback confirm)

Nếu ngành có flag "đang bật từ đáy" → tier 2 ưu tiên Bucket 1 và Bucket 2 — early entry trong trend mới.

**Handler flag y_trend > 0.8 từ tier 1** (xem `P_invest_memo_02` Section 6): nếu ngành có flag này, default downgrade Bucket 1 → Bucket 2 cho mọi mã trong ngành (vùng quá mua dài hạn → rủi ro đảo chiều). Agent flag rõ trong CP3 Phần 5 (Lựa chọn sát nút) để user xác nhận downgrade hoặc override.

---

## 8. Workflow đầy đủ — 6 bước

**Bước 1 — Load input tier 1**

Đọc file `tier1_YYYYMMDD_confirmed.md`. Extract:
- Shortlist ngành (3-5 ngành)
- Flags bối cảnh từng ngành
- Bảng catalyst ngành đã lọc

**Bước 2 — Với mỗi ngành shortlist, query DB**

Chạy song song:
- `industry_info` lấy full_ticker_list
- `stock_finstats` cho toàn ticker trong ngành
- `stock_snapshot` cho toàn ticker
- `industry_finstats` làm benchmark
- `stock_recent` để tính trading value trung bình 20 phiên
- `stock_nntd` cho flow NN/TD

6 query song song. Quản lý batch: nếu ngành > 50 mã, split batch để tránh timeout.

**Bước 3 — Áp Vòng B (Fundamental) + D (Liquidity)**

- Đọc `type` mỗi mã, áp đúng bộ tiêu chí B-SXKD / B-NGANHANG / B-CK / B-BH
- Áp D: trading value, volume, market_rank_pct
- Lưu list mã pass B + D

**Bước 4 — Quét Vòng C (Catalyst mã, optional) và Vòng E (Dòng tiền, nếu mở)**

- Chỉ xét mã pass D nhưng fail B
- Vòng C: quét news + web search theo 5 loại catalyst. Giới hạn 1-3 mã/ngành
- Vòng E: chỉ chạy nếu user đã mở đường E (horizon 1-3 tháng, ưu tiên dòng tiền). Tính E1, E2, E3 theo Section 5b. Giới hạn 1-3 mã/ngành
- **Tổng hai đường phụ không vượt 3 mã/ngành**

**Bước 4b — Quét Vòng F (Loại trừ cứng) — BẮT BUỘC**

Quét web search cho **từng mã** đã lọt B, C, hoặc E. Kiểm F1 (pháp lý, quản trị) và F2 (nguồn cung cổ phiếu trong horizon) theo Section 5c.

Không skip bước này với lý do "để Tier 5A soi". Ở cycle 2026-08, bỏ qua bước này dẫn tới 8 trong 18 mã shortlist phải loại ở vòng rà sau.

**Bước 5 — Xác định universe + ranking**

- Universe = [(B ∩ D) ∪ (C ∩ D) ∪ (E ∩ D)] − F
- Áp Vòng A ranking: A1-A4 với ưu tiên A1 (zone quý). Nếu đường E đang mở, dùng E1 làm trục xếp hạng chính thay cho A3
- Chọn top N theo quota ngành

**Bước 6 — Phân bucket + xuất checkpoint**

- Mỗi mã shortlist → Bucket 1/2/3
- Flag các cảnh báo đặc biệt (mã catalyst play, mã có red flag liquidity, v.v.)
- Xuất checkpoint 3 theo template Section 9

---

## 9. Template báo cáo Checkpoint 3

Theo khung 6 phần `P_invest_memo_00` phần Cơ chế checkpoint review.

```
# Checkpoint 3 — Screen mã [ngày]

## 1. Summary quyết định
Shortlist [tổng số] mã qua [N] ngành:
- Ngành A: [X] mã — [x1 Bucket 1, x2 Bucket 2, x3 Bucket 3]
- Ngành B: [Y] mã — [...]
...

Tổng mã qua đường catalyst override (fail B, pass C): [số]. Tổng mã vào Bucket 3 (chưa vào position): [số].

## 2. Bối cảnh đầu vào
- Tier 1 confirmed: [ngày]
- 3-5 ngành shortlist: [liệt kê]
- Flags bối cảnh từ tier 1: [liệt kê ngành + pattern + flag]
- Ngày snapshot DB: [snapshot_date]
- Cảnh báo độ tươi: [nếu BCTC quý gần nhất > 2 tháng, hoặc recent data < 20 phiên]

## 3. Quyết định + lý do

### Ngành [Tên] — [N] mã shortlist

Universe gốc: [X] mã trong ngành → pass D ([Y]) → pass B ([Z]) → pass C catalyst ([W]) → pass E dòng tiền ([V], ghi "đường E đóng" nếu không mở) → loại bởi F ([U]) → Universe = [Z] + [W] + [V] − [U] = [tổng] mã → Top [N] theo ranking.

Mã bị loại bởi Vòng F phải liệt kê riêng kèm lý do — đây là thông tin user cần thấy, không được nuốt vào con số tổng.

Bảng shortlist (Top [N]):
| # | Ticker | Type | Bucket | Đường vào | Zone w | Zone m | Zone q | Zone y | market_rank_pct | week_score |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ... | SXKD | 1 | B∩D | AA | AA | A | AA | 85 | 25 |
| 2 | ... | SXKD | 2 | B∩D | B | A | AA | AAA | 70 | 12 |
| 3 | ... | SXKD | 3 | B∩D | C | C | AA | A | 55 | -5 |
| 4 | ... | NGANHANG | 1 | C∩D (catalyst) | A | A | B | B | 60 | 18 |
...

Lý do rank:
- Ticker #1: rank 1 vì zone q+y đồng AA trở lên, market_rank_pct 85, week_score 25. Fundamental pass 4/4. Bucket 1.
- Ticker #2: rank 2 vì zone q+y mạnh nhưng tuần đang pullback (zone w=B). Bucket 2.
...

(Lặp cho mỗi ngành trong shortlist)

## 4. Số liệu kỹ thuật key

Bảng tổng hợp tất cả shortlist:
| Ticker | Ngành | Bucket | Đường | market_rank_pct | week_score | Zone q | Zone y | NN 1 tháng (tỷ) |
|---|---|---|---|---|---|---|---|---|
| ... | ... | 1 | B∩D | 85 | 25 | AA | AA | +120 |
...

## 5. Lựa chọn sát nút

### Mã suýt lọt universe (pass D nhưng fail B, không có catalyst):
- Ngành A: [Ticker X]: ROE thấp hơn median ngành, biên co hẹp 3 quý. Nếu user có insight ngược → override
- Ngành B: [Ticker Y]: định giá vượt 180% median P/E ngành. Override nếu có lý do fundamental mạnh

### Mã lọt universe nhưng ranking thấp:
- Ngành A: [Ticker Z]: pass B+D, rank 8/8 universe, zone q=B. Nếu user muốn thêm mã Bucket 3 → có thể thêm vào

### Mã catalyst play cân nhắc:
- Ngành C: [Ticker W]: fail B (growth âm 2 quý), có tin M&A catalyst 3đ. Đã đưa vào qua đường C. User review catalyst có thực sự mạnh không?

## 6. Flags kỹ thuật chuyển sang tier 3

Các cảnh báo cho tier 3 (chấm điểm):
- Mã [X]: market_rank_pct 45 — chỉ dưới trung vị, điểm ranking tiêu chí 5 (dòng tiền NN/TD) có thể thấp
- Mã [Y]: catalyst play, thesis phụ thuộc sự kiện. Tier 3 cần đánh giá kỹ tiêu chí 4 (catalyst cá thể)
- Mã [Z]: trading value 6 tỷ/phiên — sát ngưỡng D. Tier 6 sizing constraint 5% ADV per-phiên = ~300 triệu; với N=3 phiên build → max tổng vị thế ~900 triệu (≈3-4% portfolio). Nếu conviction High target 6-8% → phải giảm size thực tế. Công thức đầy đủ `P_invest_memo_08` Section 3.4
- Mã [W]: catalyst play nhưng rơi Bucket 3 — thị trường có thể priced-in tiêu cực hoặc chưa nhận ra catalyst. User review kỹ catalyst trước khi quyết định giữ/loại

## 7. Câu hỏi chờ user

Xác nhận shortlist [tổng số] mã qua [N] ngành để sang tier 3?
Hoặc muốn:
- (a) Thêm mã sát nút [cụ thể] vào shortlist (ghi audit log)
- (b) Loại mã khỏi shortlist vì lý do qualitative (scandal Agent chưa index, regulatory risk, insider selling)
- (c) Đổi bucket của 1 mã (ví dụ: Agent phân Bucket 2 nhưng bạn thấy thesis pullback yếu, đổi sang Bucket 3)
- (d) Request deep-dive 1 mã trước khi sang tier 3

Nếu confirm → end session, lưu output.
Nếu override → Agent ghi audit log rồi revise.
```

**Độ dài target:** 3-4 trang tuỳ số ngành (bảng chiếm nhiều dòng).

---

## 10. Ví dụ generic

Case: tier 1 đã chọn 3 ngành (A, B, D). Agent chạy tier 2 cho từng ngành.

### Ngành A — 45 mã trong full_ticker_list

**Sau Vòng D (Liquidity):** 18 mã đạt (trading value ≥ 5 tỷ + volume + rank_pct > 0). 27 mã thanh khoản thấp — loại.

**Sau Vòng B (Fundamental):** trong 18 mã pass D, 13 mã pass B (đủ 3/4 tiêu chí cho SXKD). 5 mã fail B (ROE dưới median, biên co hẹp, định giá vượt ngưỡng).

**Vòng C (Catalyst):** trong 5 mã fail B, có 2 mã có catalyst mạnh:
- Mã M: catalyst M&A đã công bố (3đ), chuẩn bị ĐHCĐ phê duyệt Q2
- Mã N: KQKD sắp công bố, consensus dự báo LNST đảo chiều từ âm sang dương (2đ)

Áp constraint "tối đa 1 mã/ngành qua C khi universe B+D lớn": chọn mã M (catalyst mạnh hơn).

**Universe ngành A:** 13 (B∩D) + 1 (C∩D) = 14 mã.

**Vòng A ranking + chọn top 8:**

| Rank | Ticker | Zone q | Zone y | market_rank_pct | week_score | Bucket |
|---|---|---|---|---|---|---|
| 1 | Mã a1 | AA | AAA | 88 | 28 | 1 |
| 2 | Mã a2 | AA | AA | 82 | 22 | 1 |
| 3 | Mã a3 | AAA | AA | 75 | 15 | 2 (zone w=B pullback) |
| 4 | Mã a4 | A | AA | 70 | 18 | 1 |
| 5 | Mã a5 | AA | A | 65 | 8 | 2 |
| 6 | Mã M | A | B | 55 | 12 | 2 (catalyst play) |
| 7 | Mã a6 | A | A | 52 | 3 | 2 |
| 8 | Mã a7 | B | AA | 48 | -2 | 3 (zone w+m đều C) |

### Ngành B — 28 mã

**Sau Vòng D:** 15 mã.
**Sau Vòng B:** 11 mã pass.
**Vòng C:** universe đủ lớn, không cần catalyst override.
**Universe:** 11 mã. Chọn top 6.

Phân bucket:
- Bucket 1: 2 mã
- Bucket 2: 3 mã (trong đó 1 pullback điển hình)
- Bucket 3: 1 mã

### Ngành D — 12 mã (ngành nhỏ)

**Sau Vòng D:** 6 mã.
**Sau Vòng B:** 4 mã pass.
**Vòng C:** trong 2 mã fail B, 1 mã có catalyst KQKD. Universe nhỏ, cho qua 1 mã.
**Universe:** 4 + 1 = 5 mã. Lấy hết.

Phân bucket:
- Bucket 1: 1 mã
- Bucket 2: 3 mã
- Bucket 3: 1 mã (flag: nếu tier 3 chấm điểm thấp → loại, đi sang ngành khác xét)

### Tổng shortlist

- 8 mã ngành A + 6 mã ngành B + 5 mã ngành D = 19 mã shortlist sang tier 3
- Trong đó: 2 mã catalyst play (Mã M ngành A + 1 mã ngành D)
- Bucket 1: 5 mã | Bucket 2: 10 mã | Bucket 3: 4 mã

### Sát nút (cho user review)

- Mã a8 ngành A: pass B+D, rank 9/14 universe — không vào top 8. Zone q=B. Có thể thêm nếu user muốn
- Mã b_ ngành B: fail B (1/4 tiêu chí), không có catalyst. Agent loại, nhưng user có thể thấy có insight qualitative
- Mã N ngành A: catalyst KQKD 2đ, đã bị Mã M lấn vì constraint 1 mã/ngành. User có thể swap nếu muốn

---

## 11. Failure mode

### 11.1. Bỏ qua đọc `type` trước khi áp B

Agent áp bộ tiêu chí SXKD cho ngân hàng (NGANHANG) → toàn bộ bank fail B vì ICR thấp, biên theo NIM thay vì Gross Margin. Dẫn đến universe ngành ngân hàng = 0.

**Xử lý:** bước đầu tiên trong Vòng B bắt buộc là đọc field `type` của mỗi mã, sau đó branch logic theo type. Viết rõ 4 bộ tiêu chí riêng trong pseudocode thay vì gộp 1 hàm chung.

### 11.2. Loại mã qua đường C vì "fail B"

Catalyst override là exception có ý đồ — mã fail B nhưng pass C + D vẫn vào universe qua đường phụ. Agent dễ máy móc loại thẳng mã fail B, bỏ qua đường C.

**Xử lý:** logic universe phải là `(B ∩ D) ∪ (C ∩ D)`, không phải `B ∩ D` thuần. Bước 3 và Bước 4 của workflow tách riêng — pass B-D là set 1, pass C-D không phải pass B là set 2, union làm universe.

### 11.3. Bucket quyết định sai vì đọc sai zone

`technical_zone.overall` có 5 bậc AAA > AA > A > B > C. Agent dễ nhầm "A trở lên" thành "A, AA, AAA" nhưng code logic lại chỉ check `== "A"` thiếu AA và AAA.

**Xử lý:** logic bucket phải dùng `$in: ["A", "AA", "AAA"]` hoặc equivalent. Test với mã có zone AAA để đảm bảo không bị rơi khỏi bucket 1 do lỗi logic.

### 11.4. Mã catalyst play vào Bucket 3

Mã fail B qua đường C (catalyst play) nếu rơi vào Bucket 3 (tuần+tháng đều C) nghĩa là thị trường đang phản ứng tiêu cực trước catalyst hoặc thị trường chưa nhận ra. Agent dễ máy móc phân bucket theo zone mà không đối chiếu với đường vào.

**Xử lý:** sau khi phân bucket, flag tất cả mã qua đường C nếu rơi Bucket 3 — KHÔNG tự loại. Trình bày rõ 2 khả năng giải thích (priced-in tiêu cực vs chưa nhận ra) trong checkpoint Phần 6, để user review catalyst kỹ hơn trước khi quyết định giữ hay loại. Đây là dạng cảnh báo cần user input, không phải rule cứng của Agent.

### 11.5. Mã có trading value sát ngưỡng 5 tỷ

Mã trading value 5-8 tỷ/phiên vừa đạt D1. Tier 6 sizing per-phiên cap 5% ADV = 250-400 triệu; với N=3 phiên build → max tổng vị thế 750M-1.2 tỷ. Conviction cao muốn vào 5-7% portfolio (50k USD = 1.2 tỷ) sẽ vướng constraint. Agent không flag sớm → tier 6 phải giảm size khi conviction cao.

**Xử lý:** trong checkpoint 3 Phần 6, flag rõ các mã có trading value < 10 tỷ/phiên để tier 5 biết constraint sizing trước khi làm modeling. Mã 10-20 tỷ cũng ghi nhận nếu conviction dự kiến cao.

### 11.6. Universe size < 3 không báo

Một số ngành có universe rất nhỏ sau B+D (mạnh lên tiêu chí + liquidity khắt khe). Agent vẫn cố ép ra 6-10 mã bằng cách nới B → shortlist chất lượng thấp.

**Xử lý:** nếu universe < 3 mã, flag rõ trong checkpoint và đề xuất user:
- (a) Giảm số mã ngành này xuống 2-3
- (b) Loại ngành khỏi shortlist (đề xuất lên user, không tự quyết)
- (c) Thay ngành này bằng ngành sát nút từ tier 1

Không ép shortlist 6 mã khi universe chỉ 3.

### 11.7. Bỏ qua flag từ tier 1

Tier 1 đã flag ngành có pattern "đang rơi từ đỉnh" = cảnh báo. Tier 2 vẫn screen bình thường, đưa nhiều mã vào Bucket 1 (vào ngay) → rủi ro cao.

**Xử lý:** Bước 1 workflow phải extract đầy đủ flags tier 1 và áp vào bucket assignment (Section 7 cuối). Ngành có flag "rơi từ đỉnh" → tối thiểu 50% shortlist ngành đó vào Bucket 2 hoặc 3 (chờ pullback confirm), không mở rộng Bucket 1.

### 11.8. Đọc chỉ tiêu trailing như thể là số quý gần nhất

Lỗi nghiêm trọng nhất đã ghi nhận, tái diễn ở 3 ngành trong một cycle. ROE và các hệ số định giá trong `stock_finstats` là số **trailing 4 quý**. Một quý cũ rất mạnh giữ chỉ tiêu qua ngưỡng dù quý gần nhất đã sụp.

**Xử lý:** chạy kiểm tra đối chiếu trailing với quý gần nhất ở Section 3, cho **mọi mã**, trước khi kết luận pass B. Mã có quý gần nhất âm sâu hơn −30% trong khi ROE trailing vẫn qua ngưỡng phải bị gắn cờ đỏ và hạ một bậc ưu tiên.

### 11.9. Bỏ qua Vòng F vì cho rằng Tier 5A sẽ soi

Spec cũ để việc soi red flag đến Tier 5A. Thực tế ở cycle 2026-08: 8 trong 18 mã shortlist ban đầu phải loại vì sự kiện pháp lý, quản trị hoặc pha loãng — toàn bộ nằm ngoài `agent_db`.

**Xử lý:** Bước 4b là bắt buộc, không phải tuỳ chọn. Chi phí quét web cho 15-25 mã universe nhỏ hơn nhiều so với chi phí chạy Tier 3 và Tier 5B cho mã không dùng được.

### 11.10. Nhầm mức tăng khối lượng phần trăm với sức hút dòng tiền

Bản tin thị trường hay nêu mã "tăng khối lượng 200-300%". Với mã vốn hoá nhỏ, mức tăng đó vẫn có thể chỉ là 2-3 tỷ/phiên.

**Xử lý:** mọi kết luận về dòng tiền phải dựa trên **giá trị tuyệt đối** và **vòng quay trên vốn hoá** (E1), không dựa trên phần trăm thay đổi khối lượng.

### 11.11. Không tính trading value trung bình 20 phiên

Agent chỉ đọc `price.trading_value` từ stock_snapshot = giá trị phiên hôm nay. Phiên có thể spike bất thường (có tin) hoặc tụt đột ngột (nghỉ tết). 1 phiên không đại diện thanh khoản thực.

**Xử lý:** bắt buộc query stock_recent 20 phiên và tính average trading_value. Dùng average để check D1, không dùng snapshot value.

---

## 12. Đầu ra chuẩn để tier 3 dùng

Output tier 2 lưu file `tier2_YYYYMMDD_confirmed.md` (sau khi user confirm), gồm:

1. **Header:** ngày chạy, tier 1 ref, tổng mã shortlist
2. **Shortlist từng ngành:** bảng đầy đủ với cột bucket, đường vào, zone, rank, flag
3. **Chi tiết mã catalyst play:** tên catalyst, điểm, timing, magnitude ước lượng (để tier 3 chấm điểm tiêu chí 4)
4. **Flags kỹ thuật** chuyển cho tier 3 (mã rank thấp, mã thanh khoản sát ngưỡng, mã catalyst play trong Bucket 3)
5. **Bảng benchmark ngành** — industry_finstats gọn (median ROE, P/E, P/B theo type) để tier 3 không query lại
6. **Danh sách mã sát nút** — để tier 3 tham khảo nếu shortlist không đạt chất lượng
7. **Link audit log** nếu có override

File này lưu tại `outputs/md/invest_memo/<YYYY-MM>_cycle/`; tier 3 đọc trực tiếp từ đó ở session kế tiếp. Tier 3 dùng làm input chính, không re-run B/C/D/A cho mã khác.
