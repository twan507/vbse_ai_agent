---
type: invest_memo_tier1
date: 2026-07-28
inputs:
  - outputs/md/invest_memo/2026-08_cycle/tier0_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/tier1_20260728_draft.md
  - inputs/external/20260717_VBSE_dinh-gia-thi-truong-PE-PB.pptx
  - inputs/external/20260722_VBSE_nghien-cuu-nang-hang-FTSE.docx
  - "agent_db (query 2026-07-28)"
derived: []
status: final
---

# Tier 1 confirmed — Chọn ngành 28/07/2026

Bản chốt sau Checkpoint 2. Shortlist do **user quyết định**, khác kết quả universe gốc của quy trình — chi tiết và lý do ở `audit_overrides.md`.

## 1. Summary quyết định

**Ba ngành chọn:** Công ty Chứng khoán · Bất động sản Dân dụng · Tài chính ngân hàng. Quota 3 mã mỗi ngành.

**Hai ngành theo sau (dự bị):** Thi công Xây dựng · Bất động sản Khu công nghiệp. Không cấp quota, dùng khi một ngành chính bị loại ở Tier 2 hoặc khi điều kiện ở mục 5 được thoả.

Universe gốc theo quy trình chỉ có 2 ngành (Ngân hàng, BĐS Dân dụng) vì Công ty Chứng khoán trượt Funnel C với 2 điểm. User override thêm Chứng khoán.

**Và dữ liệu thực nghiệm ủng hộ override này rất mạnh** — mạnh hơn cả lập luận catalyst mà nó thay thế. Đo hiệu suất sau hai đáy chu kỳ gần nhất, Công ty Chứng khoán là ngành dẫn đầu ở cả hai lần: **+101,2% sau đáy 11/2022** và **+79,2% sau đáy 04/2025** trong 6 tháng, xếp hạng 1 và 2 trên tổng 24 ngành. Không ngành nào khác có tính nhất quán đó. Chi tiết ở mục 3.

## 2. Bối cảnh đầu vào

- Regime kế thừa Tier 0: **Risk-on selective** (user override từ Defensive only), cash buffer 30%
- Quota: 3 ngành × 3 mã
- VNINDEX 28/07/2026: **1.680,62** điểm, giảm **12,8%** từ đỉnh 1.927,94 ngày 18/05/2026
- Bảng catalyst active: 10 catalyst, trong đó 3 catalyst 3 điểm đều tiêu cực

**Cảnh báo độ tươi:**

- BCTC ngành mới nhất là **quý 1/2026**, cũ khoảng 3 tháng. Mùa công bố quý 2/2026 đang diễn ra nhưng chưa vào dữ liệu. Mọi đánh giá Funnel B dưới đây đứng trên số quý 1.
- Dư nợ margin toàn ngành là số **cuối quý 1/2026**, cũ 4 tháng.
- Chuỗi định giá lịch sử có độ lệch thời gian 1-2 tháng do BCTC gán vào ngày kết thúc kỳ. Dùng để định vị, không dùng làm tín hiệu kiểm định quá khứ.

**Ghi chú phương pháp:** cycle này không dùng tầng chỉ báo nội bộ của hệ thống theo yêu cầu user. Funnel A xếp hạng bằng bốn đại lượng khách quan thay thế — dòng tiền khối ngoại theo ngành tự tổng hợp, biến động giá 4 khung, phân vị định giá lịch sử, mùa vụ tháng 8. Chi tiết ở Phụ lục E.

## 3. So sánh với hai đáy chu kỳ — định giá trước, lợi suất sau

Đây là trục chính của cycle này và là nền cho toàn bộ phần kỳ vọng ở mục 4. Luận điểm là bắt đáy, nên có đúng hai câu hỏi phải trả lời bằng số: **định giá hôm nay đã về mức của đáy chưa**, và **sau khi tạo đáy thì ngành nào thực sự chạy**.

### 3.1. Hai đáy đối chiếu

| Đáy | Ngày | VNINDEX tại đáy | Đỉnh 12 tháng trước | Mức giảm |
|---|---|---|---|---|
| Khủng hoảng trái phiếu | 15/11/2022 | 911,90 | 1.528,57 | **−40,3%** |
| Cú sốc thuế quan | 09/04/2025 | 1.094,30 | 1.336,26 | **−18,1%** |
| **Hiện tại (chưa xác nhận đáy)** | 28/07/2026 | 1.680,62 | 1.927,94 | **−12,8%** |

Mốc định giá dùng điểm chuỗi tuần gần nhất: **14/11/2022** và **08/04/2025**.

### 3.2. Định giá toàn thị trường tại hai đáy so với hiện tại

Hai hệ số, hai bản — gồm và loại nhóm Vingroup. Chuỗi tự tính từ dữ liệu cấp mã, cùng một phương pháp cho cả ba mốc.

| Mốc | P/E gồm Vin | P/B gồm Vin | P/E loại Vin | P/B loại Vin |
|---|---|---|---|---|
| Đáy 14/11/2022 | 11,59 | 1,58 | 11,57 | 1,61 |
| Đáy 08/04/2025 | 11,71 | 1,43 | 12,01 | 1,48 |
| **Hiện tại 28/07/2026** | **13,37** | **1,87** | **11,28** | **1,54** |
| So đáy 2022 | +15,4% | +18,4% | **−2,5%** | −4,3% |
| So đáy 2025 | +14,2% | +30,8% | **−6,1%** | +4,1% |

**Đây là phát hiện định giá quan trọng nhất của cycle.** Đọc theo số gộp, thị trường hôm nay **đắt hơn cả hai đáy** — P/E cao hơn 14-15%, P/B cao hơn 18-31%. Kết luận sẽ là chưa tới vùng mua.

Đọc theo số loại nhóm Vingroup thì đảo ngược: **P/E hiện tại 11,28 THẤP HƠN cả hai đáy** (11,57 và 12,01), còn P/B 1,54 nằm giữa hai đáy (thấp hơn đáy 2022, cao hơn đáy 2025 4,1%).

Và điểm mấu chốt giải thích vì sao: **tại hai đáy trước, nhóm Vingroup gần như không bóp méo gì cả.** Năm 2022, P/E gộp 11,59 so với loại Vin 11,57 — chênh 0,02. Năm 2025, chênh cũng nhỏ. Chỉ đến hiện tại mới có khoảng cách 13,37 so với 11,28, tức **2,09 điểm P/E**. Hiện tượng bóp méo này là **mới**, không tồn tại ở hai chu kỳ trước, nên mọi phép so sánh định giá với quá khứ mà dùng số gộp đều sai hệ quy chiếu.

Đối chiếu với chỉ tiêu tổng hợp sẵn trong hệ thống dữ liệu (khác phương pháp, xem Phụ lục B.1): đáy 2022 P/E 9,52 · P/B 1,50; đáy 2025 P/E 10,31 · P/B 1,33; hiện tại P/E 12,68 · P/B 1,82. Hai con số đáy này **khớp với bảng trong tài liệu tham khảo ngày 17/07** (9,52/1,50 và 10,26/1,32), xác nhận chéo tốt giữa hai nguồn độc lập.

### 3.3. Định giá năm ngành tại hai đáy so với hiện tại

| Ngành | P/E đáy 2022 | P/E đáy 2025 | P/E nay | P/B đáy 2022 | P/B đáy 2025 | **P/B nay** | Chênh P/B so đáy rẻ nhất |
|---|---|---|---|---|---|---|---|
| **Công ty Chứng khoán** | 5,74 | 11,67 | **14,32** | 1,14 | 1,12 | **1,63** | **+45,5%** |
| **BĐS Dân dụng** (gộp) | 14,29 | 15,39 | 24,15 | 1,44 | 1,09 | 3,12 | +186,2% |
| **BĐS Dân dụng** (loại 3 trụ Vin) | 19,40 | 184,36 | **15,08** | 1,54 | 1,18 | **1,07** | **−9,3%** |
| **Tài chính ngân hàng** | 9,20 | 7,77 | **8,69** | 1,51 | 1,25 | **1,36** | +8,8% |
| Thi công Xây dựng | 12,77 | 15,01 | **7,65** | 0,72 | 0,69 | **0,63** | **−8,7%** |
| BĐS Khu công nghiệp | 9,70 | 16,09 | 13,61 | 0,95 | 1,54 | 1,40 | +47,4% |

Bảng này nói bốn điều, và có điều ngược với trực giác:

**Một — Công ty Chứng khoán là ngành ĐẮT NHẤT so với chính nó tại đáy.** P/B 1,63 hôm nay so với 1,14 tại đáy 2022 và 1,12 tại đáy 2025, tức **cao hơn 43-46%**. Để về mức định giá của hai đáy trước, giá ngành này phải giảm thêm khoảng 30%. Đây là cảnh báo nghiêm túc cho ngành có kỳ vọng cao nhất rổ, và nó nhất quán với nhận định "không có biên an toàn định giá" ở mục 4.1.

**Hai — BĐS Dân dụng loại ba trụ Vin đã rẻ hơn cả hai đáy** về P/B: 1,07 so với 1,54 và 1,18. P/E cũng thấp hơn đáy 2022 (15,08 so với 19,40). Con số P/E 184,36 tại đáy 2025 phản ánh phần ngoài Vin gần như không có lợi nhuận ở thời điểm đó — lợi nhuận đã phục hồi thật kể từ đó, nên mức P/E 15,08 hiện tại là cải thiện chất lượng chứ không phải rẻ do lỗ.

**Ba — tỷ trọng Vingroup trong ngành đã tăng vọt:** 55,2% tại đáy 2022 · 56,3% tại đáy 2025 · **85,0% hiện tại** (tính trên cùng tập mã). Mức bóp méo cấp ngành là hiện tượng của riêng chu kỳ này.

**Bốn — Thi công Xây dựng là ngành duy nhất rẻ hơn cả hai đáy trên CẢ hai hệ số**: P/E 7,65 so với 12,77 và 15,01; P/B 0,63 so với 0,72 và 0,69. Ngành dự bị lại có định giá tuyệt đối tốt nhất — điểm chặn vẫn là ICR 1,53 và ràng buộc thanh khoản ở mục 5.1.

**Ngân hàng nằm giữa hai đáy:** P/B 1,36 rẻ hơn đáy 2022 (1,51) nhưng đắt hơn đáy 2025 (1,25) 8,8%. Đây là vị trí cân bằng, phù hợp vai trò neo của rổ.

### 3.4. Khoảng cách tới median 3 năm — dư địa hồi phục định giá

Nếu P/B chỉ cần trở về median 3 năm của chính ngành, chưa cần vượt:

| Ngành | P/B nay | Median P/B 3 năm | Dư địa |
|---|---|---|---|
| Thi công Xây dựng | 0,63 | 0,85 | **+34,9%** |
| BĐS Khu công nghiệp | 1,40 | 1,76 | +25,7% |
| Tài chính ngân hàng | 1,36 | 1,52 | +11,8% |
| Công ty Chứng khoán | 1,63 | 1,63 | **0,0%** |

Chứng khoán đang **đúng bằng** median 3 năm, tức không có dư địa hồi phục định giá nào. Toàn bộ lợi suất kỳ vọng của ngành này phải đến từ **tăng trưởng lợi nhuận** theo thanh khoản, không từ việc định giá rẻ trở lại mức trung bình. Đây là khác biệt bản chất so với ba ngành còn lại và phải được nêu trong memo Tier 5C nếu ngành này vào danh mục.

### 3.5. Lợi suất ngành sau đáy, tính từ giá đóng cửa phiên đáy

| Ngành | Sau đáy 11/2022 |  |  | Sau đáy 04/2025 |  |  | TB 6 tháng |
|---|---|---|---|---|---|---|---|
|  | 1 tháng | 3 tháng | 6 tháng | 1 tháng | 3 tháng | 6 tháng |  |
| **Công ty Chứng khoán** | +63,3% | +52,6% | **+101,2%** | +15,1% | +29,7% | **+79,2%** | **+90,2%** |
| Thi công Xây dựng | +39,3% | +43,9% | +66,2% | +18,0% | +31,5% | +63,5% | +64,9% |
| **BĐS Dân dụng** | +30,9% | +17,9% | +44,1% | +22,6% | +45,9% | **+82,7%** | **+63,4%** |
| **Tài chính ngân hàng** | +28,7% | +31,1% | +42,3% | +16,5% | +31,5% | +67,9% | **+55,1%** |
| BĐS Khu công nghiệp | +43,8% | +41,1% | +57,7% | +12,6% | +22,7% | +31,5% | +44,6% |
| Hóa chất Phân bón | +27,9% | +17,5% | +16,5% | +32,7% | +49,1% | +50,8% | 33,7% |

Xếp hạng trên tổng 24 ngành theo lợi suất 6 tháng: Chứng khoán **hạng 1 rồi hạng 2**; Thi công Xây dựng hạng 4 rồi hạng 5; BĐS Dân dụng hạng 13 rồi **hạng 1**; Ngân hàng hạng 16 rồi hạng 3; BĐS KCN hạng 6 rồi hạng 21; Hóa chất Phân bón hạng 21 rồi hạng 8.

### 3.6. Đọc bảng lợi suất thế nào cho đúng

**Ba điều bảng này nói được:**

1. **Chứng khoán là ngành bắt đáy nhất quán nhất.** Hạng 1 và hạng 2, không lần nào ra khỏi nhóm dẫn đầu. Cơ chế hợp lý và lặp lại được: lợi nhuận công ty chứng khoán gắn trực tiếp vào thanh khoản thị trường, mà thanh khoản là thứ hồi phục sớm nhất sau đáy.
2. **Ngân hàng cải thiện thứ hạng rõ rệt giữa hai chu kỳ** — hạng 16 lên hạng 3. Phù hợp với việc chất lượng tài sản ngành đã khác hẳn giai đoạn khủng hoảng trái phiếu.
3. **BĐS Dân dụng có phương sai cao nhất** — hạng 13 rồi hạng 1. Phần thưởng lớn nhất nhưng kém tin cậy nhất về thứ hạng.

**Bốn điều bảng này KHÔNG nói được, phải nêu rõ:**

1. **Cỡ mẫu bằng 2.** Không đủ cho bất kỳ kết luận thống kê nào. Đây là hai quan sát lịch sử, không phải phân phối xác suất.
2. **Chưa biết hiện tại có phải đáy hay không.** Toàn bộ bảng giả định đã tạo đáy. Nếu thị trường còn giảm tiếp thì mọi con số ở trên vô nghĩa cho việc vào lệnh hôm nay.
3. **Mức giảm hiện tại nông hơn cả hai tiền lệ** — 12,8% so với 40,3% và 18,1%. Quan hệ trong chính mẫu này là giảm càng sâu thì bật càng mạnh: Chứng khoán bật 101,2% sau cú giảm 40,3% và 79,2% sau cú giảm 18,1%. Suy ra **kỳ vọng hợp lý cho cú giảm 12,8% phải thấp hơn cả hai**, không được lấy trung bình +90,2% làm mục tiêu.
4. **Hai đáy đó không có Fed đang xoay hawkish.** Bối cảnh vĩ mô lần này khác: chi phí vốn toàn cầu đang tăng chứ không giảm.

### 3.7. Hiệu chỉnh kỳ vọng dùng cho mục 4

Trung bình hai lần cho lợi suất 6 tháng, chiết khấu theo tỷ lệ độ sâu điều chỉnh (12,8% so với trung bình 29,2% của hai tiền lệ, hệ số khoảng 0,44), làm tròn xuống cho thận trọng:

| Ngành | TB thực tế 6 tháng | Kỳ vọng đã chiết khấu | Dải hợp lý |
|---|---|---|---|
| Công ty Chứng khoán | +90,2% | ~+40% | +25% đến +55% |
| BĐS Dân dụng | +63,4% | ~+28% | +15% đến +45% |
| Tài chính ngân hàng | +55,1% | ~+24% | +15% đến +35% |

**Đây là kỳ vọng có điều kiện, không phải dự báo.** Điều kiện tiên quyết là thị trường đã tạo đáy quanh vùng hiện tại. Nếu VNINDEX thủng 1.600 thì toàn bộ khung này phải tính lại từ đáy mới.

## 4. Ba ngành đã chọn

### 4.1. Công ty Chứng khoán

**Quy mô:** vốn hoá 483.610 tỷ VND · 41 mã · EPS 1.514 đ · BVPS 13.081 đ (nguồn: Tổng hợp).

**Định giá**

| Chỉ tiêu | Hiện tại | Median 3 năm | Tỷ lệ | Phân vị 3 năm |
|---|---|---|---|---|
| P/E | 14,32 | 16,34 | 0,88 | 37,2% |
| P/B | 1,63 | 1,63 | **1,00** | 48,7% |

**Đây là ngành duy nhất trong ba ngành không rẻ.** P/B đúng bằng median 3 năm, phân vị 48,7% tức trung tính hoàn toàn. Không có biên an toàn định giá. Toàn bộ luận điểm nằm ở đòn bẩy lợi nhuận theo thanh khoản, không ở chiết khấu tài sản.

**So với chính nó tại hai đáy chu kỳ, ngành này đang ĐẮT (mục 3.3):**

| Mốc | P/E | P/B |
|---|---|---|
| Đáy 14/11/2022 | 5,74 | 1,14 |
| Đáy 08/04/2025 | 11,67 | 1,12 |
| Hiện tại | **14,32** | **1,63** |

P/B cao hơn đáy 2022 **43,0%** và cao hơn đáy 2025 **45,5%**. Muốn về mức định giá của hai đáy trước, giá ngành phải giảm thêm khoảng **30%**. Cộng với dư địa về median 3 năm bằng **0,0%** (mục 3.4), kết luận thẳng: **ngành này không có bất kỳ đệm định giá nào**. Đây là vị thế đặt cược hoàn toàn vào phục hồi thanh khoản và tăng trưởng lợi nhuận, không phải vị thế giá trị.

Đó là lý do điều kiện thanh khoản ở dưới không phải điều kiện phụ mà là **điều kiện sống còn** của luận điểm.

**Funnel B: 3/4 đạt**
- B1 Tăng trưởng doanh thu YoY quý 1/2026: **+43,64%** — đạt mạnh. Bốn quý gần nhất: +16,37% · +77,16% · +62,15% · +43,64%
- B2 Biên gộp: 63,70% → 71,24% → 61,90% → **57,03%** — co hẹp **6,67 điểm phần trăm** qua 4 quý, vượt ngưỡng fail 3 điểm. **Không đạt**
- B3 Định giá: P/B tỷ lệ 1,00, xa ngưỡng fail 1,5 — đạt
- B4 Đòn bẩy: Vay trên vốn chủ sở hữu **1,00 lần**, dưới trần 2,00 — đạt. Đòn bẩy tài chính 2,14 lần

**Funnel C: 2 điểm — không đạt ngưỡng 3.** Catalyst duy nhất chiếu vào ngành là dòng vốn nâng hạng, và nhóm chứng khoán chỉ nhận khoảng **6,96 triệu USD trong 128,18 triệu đợt 1, tức 5,4%** (SSI 2,16 · VIX 1,75 · VCI 1,57 · VND 1,48 triệu USD). Đây là lý do ngành trượt universe gốc.

**Kênh hưởng lợi thật không có trong bảng catalyst Tier 0** và đó là thiếu sót của Tier 0: lợi nhuận ngành gắn vào **thanh khoản thị trường**, không vào lượng tiền chảy vào chính cổ phiếu ngành. Thanh khoản khớp lệnh HOSE hiện khoảng 13,4 nghìn tỷ/phiên.

**Funnel A — xếp hạng khách quan**
- Khối ngoại 1 tháng: **−1.413 tỷ VND** — bán ròng, nhưng chỉ bằng 26% mức của ngân hàng và 30% mức của BĐS Dân dụng
- Biến động giá: 1 tuần −3,38% · 1 tháng −12,92% · 3 tháng −8,81% · 1 năm −26,84%
- Mùa vụ tháng 8: **+15,38%, dương 6/6 năm**, năm thấp nhất vẫn +7,05% — tốt nhất trong 24 ngành
- Độ rộng: 25 mã tăng / 2 mã giảm
- Lợi suất sau đáy: **hạng 1 và hạng 2** trên 24 ngành

**Kỳ vọng:** ~+40% trong 6 tháng nếu đáy đã hình thành, dải hợp lý +25% đến +55%. Đây là ngành có kỳ vọng cao nhất rổ và cũng biến động mạnh nhất.

**Ba điều kiện phải theo dõi, kiểm hàng tuần:**

1. **Thanh khoản khớp lệnh HOSE.** Luận điểm sống hay chết ở đây. Cần trung bình 5 phiên **vượt 15 nghìn tỷ/phiên** để xác nhận. Xuống dưới 10 nghìn tỷ hai tuần liên tiếp là luận điểm hỏng — thoát, không chờ.
2. **Dư nợ margin.** Đây là rủi ro riêng lớn nhất: ngành này **chính là bên cho vay margin**, dư nợ toàn ngành 418.725 tỷ tăng 50,2% so với cùng kỳ, và giải chấp đang diễn ra. Số quý 2/2026 công bố trong tháng 8 là dữ liệu quyết định. Nếu dư nợ giảm mạnh kèm trích lập tăng, hạ conviction một bậc.
3. **Biên gộp quý 2/2026.** Đã co 6,67 điểm phần trăm qua 4 quý. Nếu quý 2 co tiếp xuống dưới 55% thì tiêu chí B2 chuyển từ "không đạt" thành "xấu đi có hệ thống", cần xem lại vị thế.

**Rủi ro chính:** không có biên an toàn định giá. Nếu thị trường không tạo đáy ở đây, ngành này giảm mạnh nhất — hệ số beta cao thể hiện rõ trong đường giá 8 phiên gần nhất: −5,18% · −0,55% · −0,78% · +2,91% · −3,71% · −5,26% · **+3,72%**, biên độ lớn nhất trong sáu ngành đã kiểm.

### 4.2. Bất động sản Dân dụng

**Quy mô:** vốn hoá 2.530.100 tỷ VND · 83 mã · EPS 3.081 đ · BVPS 22.908 đ.

**Cấu trúc vốn hoá — con số quan trọng nhất của ngành này:**

| Nhóm | Vốn hoá (tỷ) | Tỷ trọng ngành |
|---|---|---|
| VIC | 1.659.555 | 65,6% |
| VHM | 541.768 | 21,4% |
| VRE | 48.400 | 1,9% |
| **Cộng ba trụ Vingroup** | **2.249.723** | **88,9%** |
| 80 mã còn lại | 280.377 | 11,1% |

**Gần chín phần mười vốn hoá ngành nằm ở ba mã.** Phần "rẻ" mà luận điểm dựa vào chỉ là 280.377 tỷ, tức 11,1% ngành. Đây là ràng buộc quyết định cho Tier 2.

Ghi chú kỹ thuật: tỷ trọng 88,9% tính bằng vốn hoá ba mã chia tổng vốn hoá ngành lấy từ chỉ tiêu tổng hợp sẵn. Tính trong cùng một tập mã của chuỗi tự tính thì ra **85,0%**. Chênh lệch đến từ đúng vấn đề hai hệ định giá đã nêu ở Phụ lục E.2 mục 5 — dùng số nào cũng được, miễn không trộn; kết luận không đổi. Để so sánh theo thời gian thì dùng số tự tính: tỷ trọng Vingroup trong ngành là **55,2% tại đáy 2022 · 56,3% tại đáy 2025 · 85,0% hiện tại**.

**Định giá so với hai đáy chu kỳ (mục 3.3):** loại ba trụ Vin, P/B 1,07 hiện tại **rẻ hơn cả đáy 2022 (1,54) lẫn đáy 2025 (1,18)**. Đây là ngành duy nhất trong ba ngành chính đạt được điều đó.

**Định giá — bắt buộc đọc hai bản**

| Chỉ tiêu | Gồm ba trụ Vin | Loại ba trụ Vin |
|---|---|---|
| P/E | 24,15 | **15,08** |
| Phân vị P/E 3 năm | 76,3% | **0,6%** |
| P/B | 3,12 | **1,07** |
| Phân vị P/B 3 năm | 92,3% | **0,6%** |
| P/E so median 3 năm (14,88) | 1,59 — **fail B3** | pass rõ |

Chuỗi tự tính từ dữ liệu cấp mã của 83 mã trong ngành, 156 điểm tuần. Ngành trông đắt nhất sàn theo số gộp thực chất đang ở mức **rẻ nhất trong 3 năm** ở cả hai hệ số sau khi bỏ ba mã. Bản tham khảo nội bộ ngày 17/07 báo P/B loại ba trụ là 0,86 tức dưới giá trị sổ sách; tôi tính được **1,07** — khác phương pháp và rổ mã, dùng số của mình.

**Funnel B: 3/4 đạt**
- B1 Doanh thu YoY quý 1/2026: **+11,06%** — đạt. Bốn quý: +12,46% · +18,18% · +8,30% · +11,06%, dương liên tục
- B2 Biên gộp: 18,03% → 9,14% → 30,89% → **34,74%**; biên EBIT 2,86% → −9,79% → 21,34% → **26,28%** — mở rộng mạnh, đạt. Biến động giữa các quý rất lớn, đặc thù ghi nhận doanh thu theo tiến độ bàn giao dự án
- B3 Định giá: **không đạt trên số gộp** (1,59 > 1,5), đạt rõ trên số loại ba trụ
- B4 Sức khoẻ: ICR **4,35** ≥ 3 — đạt

**Funnel C: 3 điểm — đạt**
- Nâng hạng FTSE đợt 1 (2 điểm) — **nhóm hưởng lợi cơ học lớn nhất**: VIC 60,08 + VHM 18,94 + VRE 2,14 = **81,16 triệu USD, chiếm 63,3%** toàn bộ dòng vốn đợt 1
- Dư địa tín dụng nửa cuối năm (1 điểm, hạ từ 2 vì hưởng lợi gián tiếp hơn ngân hàng)

**Nghịch lý phải nêu rõ:** dòng vốn nâng hạng chảy vào đúng ba mã **đắt**, còn biên an toàn định giá nằm ở 80 mã **không nhận đồng nào** từ dòng vốn đó. Hai luận điểm này không cộng dồn được — phải chọn một khi xuống Tier 2.

**Funnel A — xếp hạng khách quan**
- Khối ngoại 1 tháng: **−4.740 tỷ VND**, nặng thứ hai toàn sàn
- Biến động giá: 1 tuần −4,69% · 1 tháng −16,11% · 3 tháng −22,09% · **1 năm −28,34%**
- Mùa vụ tháng 8: +7,79%, **dương 6/6 năm**
- Độ rộng: **39 mã tăng / 6 mã giảm** — tốt nhất trong ba ngành
- Lợi suất sau đáy: hạng 13 rồi **hạng 1**

**Kỳ vọng:** ~+28% trong 6 tháng, dải +15% đến +45%. Phương sai cao nhất rổ.

**Ba điều kiện phải theo dõi:**

1. **Tách bạch hai luận điểm ngay từ Tier 2.** Hoặc chơi dòng vốn nâng hạng qua ba trụ Vin, hoặc chơi chiết khấu tài sản qua 80 mã còn lại. Trộn hai luận điểm là tự lừa mình. Khuyến nghị của tôi: đi hướng thứ hai, vì luận điểm cycle này là bắt đáy theo định giá.
2. **Tín dụng bất động sản.** Tăng trưởng tín dụng toàn hệ thống mới +7,86% so mục tiêu ~15%; phần giải ngân vào bất động sản trong nửa cuối năm là biến quyết định thanh khoản ngành. Theo dõi số liệu tín dụng hàng tháng.
3. **Mức giảm còn động lượng.** Ngành đã giảm 28,34% trong một năm và 22,09% trong ba tháng — sâu nhất rổ. Cần thấy **hai tuần liên tiếp không tạo đáy mới** trước khi vào quá 50% size dự kiến.

### 4.3. Tài chính ngân hàng

**Quy mô:** vốn hoá 2.527.825 tỷ VND · 30 mã · EPS 3.015 đ · BVPS 19.230 đ. Vốn hoá xấp xỉ BĐS Dân dụng nhưng chỉ 30 mã, tập trung hơn nhiều và thanh khoản tốt nhất thị trường.

**Định giá**

| Chỉ tiêu | Hiện tại | Median 3 năm | Tỷ lệ | Phân vị 3 năm |
|---|---|---|---|---|
| P/E | 8,69 | 9,26 | 0,94 | 16,0% |
| P/B | 1,36 | 1,52 | 0,89 | **3,8%** |

**Đây là định giá sạch nhất rổ** — không mã nào bóp méo, không cần hiệu chỉnh gì, phân vị P/B 3,8% là con số dùng thẳng được.

**So với hai đáy chu kỳ (mục 3.3):** P/B 1,36 hiện tại **rẻ hơn đáy 2022 (1,51) 9,9%** nhưng **đắt hơn đáy 2025 (1,25) 8,8%** — nằm giữa hai đáy. Về P/E, mức 8,69 cũng nằm giữa 9,20 và 7,77. Dư địa về median 3 năm là **+11,8%**. Vị trí cân bằng này đúng với vai trò neo của ngành trong rổ: không rẻ nhất, cũng không có rủi ro định giá như Chứng khoán.

**Funnel B: 3/4 đạt** (áp bộ tiêu chí ngân hàng)
- B1 Tăng trưởng: **NII +10,13%**, **dư nợ +15,66%**, huy động +12,07% — đạt
- B2 Biên: **NIM 3,00%**. Chỉ có số quý gần nhất, không đủ chuỗi đánh giá xu hướng — không tính là đạt
- B3 Định giá: P/B tỷ lệ 0,89 — đạt
- B4 Chất lượng tài sản: **NPL 1,99%** ≤ 2,5% — đạt

**Bộ số ngân hàng đầy đủ, quý 1/2026:** ROE 4,02% (quý) · ROA 0,35% · NIM 3,00% · Lợi suất tài sản sinh lãi 1,85% · Chi phí vốn 1,07% · Thu ngoài lãi trên NII 20,72% · **CIR 29,39%** · **CASA 20,24%** · NPL 1,99% · **LLCR 80,03%** · Dự phòng trên dư nợ 1,60% · Chi phí tín dụng 0,21% · **LDR 112,72%** · Vốn chủ trên tổng tài sản 8,63%.

Hai con số cần lưu ý: **LLCR 80,03%** nghĩa là dự phòng chưa phủ hết nợ xấu, bộ đệm mỏng nếu chất lượng tài sản xấu đi. **LDR 112,72%** cao, phụ thuộc nguồn vốn thị trường. Bù lại CIR 29,39% là mức hiệu quả tốt và chi phí tín dụng 0,21% thấp.

**Funnel C: 4 điểm — cao nhất rổ**
- Nâng hạng FTSE đợt 1 (2 điểm) — VCB 5,16 + STB 4,09 + SHB 2,27 + BID 1,88 + SSB 1,80 = **15,2 triệu USD, chiếm 11,9%** dòng vốn đợt 1
- Dư địa tín dụng nửa cuối năm (2 điểm) — **hưởng lợi trực tiếp nhất** trong ba ngành được gán catalyst này. Tín dụng mới +7,86% so mục tiêu ~15%, tức còn khoảng 7 điểm phần trăm để bơm trong 5 tháng

**Funnel A — xếp hạng khách quan**
- Khối ngoại 1 tháng: **−5.515 tỷ VND — bán ròng nặng nhất toàn sàn.** Điểm trừ lớn nhất của ngành
- Biến động giá: 1 tuần −3,16% · 1 tháng −9,12% · 3 tháng −5,30% · **1 năm −2,82%**
- Mùa vụ tháng 8: +7,28%, dương 5/6 năm
- Độ rộng: 20 mã tăng / 6 mã giảm
- Lợi suất sau đáy: hạng 16 rồi **hạng 3** — cải thiện rõ giữa hai chu kỳ

**Đây là ngành phòng thủ nhất trong rổ tấn công.** Giảm 2,82% trong một năm và 5,30% trong ba tháng, so với mức giảm 12,8% của chỉ số và −26,84% của Chứng khoán, −28,34% của BĐS. Nếu luận điểm bắt đáy sai, đây là ngành mất ít nhất.

**Kỳ vọng:** ~+24% trong 6 tháng, dải +15% đến +35%. Thấp nhất rổ về kỳ vọng nhưng cũng chắc chắn nhất.

**Ba điều kiện phải theo dõi:**

1. **Dòng tiền khối ngoại cấp mã.** Ngành bị bán ròng nặng nhất sàn, nhưng 30 mã không bị bán đều nhau. Tier 2 phải tách mã đang bị bán mạnh khỏi mã trung tính — đây là việc bắt buộc, không phải tuỳ chọn.
2. **LLCR từng mã.** Toàn ngành 80,03%. Mã nào dưới mức đó là bộ đệm mỏng hơn trung bình ngành, phải hạ size hoặc loại.
3. **Tốc độ giải ngân tín dụng.** Luận điểm catalyst mạnh nhất của ngành phụ thuộc vào việc 7 điểm phần trăm dư địa có thực sự được bơm trong 5 tháng còn lại hay không. Nếu đến hết tháng 9 tín dụng mới quanh 10%, catalyst này phải hạ từ 2 điểm xuống 1.

## 5. Hai ngành theo sau

Không cấp quota mã. Kích hoạt khi một trong ba ngành chính bị loại ở Tier 2, hoặc khi điều kiện riêng dưới đây được thoả.

### 5.1. Thi công Xây dựng

**Bộ số định giá tốt nhất trong cả 24 ngành**, và là ngành duy nhất trong nhóm quan tâm được khối ngoại **mua ròng**.

| Chỉ tiêu | Giá trị | Median 3 năm | Tỷ lệ | Phân vị 3 năm |
|---|---|---|---|---|
| P/E | 7,65 | 16,18 | **0,47** | 0,6% |
| P/B | **0,63** | 0,85 | 0,74 | 0,6% |

P/B 0,63 nghĩa là toàn ngành đang bán ở **63% giá trị sổ sách**. Tỷ lệ P/E bằng 0,47 lần median 3 năm là mức rẻ nhất trong 24 ngành theo thước này.

- Khối ngoại 1 tháng: **+215 tỷ VND mua ròng** — một trong ba ngành duy nhất toàn sàn được mua ròng
- Mùa vụ tháng 8: +9,46%, dương 4/6
- Lợi suất sau đáy: **+66,2% và +63,5%**, hạng 4 rồi hạng 5 — nhất quán cao
- Funnel B 3/4: doanh thu +10,35%, biên gộp mở rộng 10,80% → 12,77%, B3 đạt rõ
- Funnel C: 2 điểm (dư địa tín dụng) — trượt ngưỡng 3

**Hai lý do không đưa vào nhóm chính:**

1. **ICR chỉ 1,53** — EBIT chỉ phủ 1,53 lần chi phí lãi vay, dưới cả ngưỡng fail 2,0 của tiêu chí B4. Bốn quý gần nhất: 1,75 · 1,92 · 1,59 · 1,53, xu hướng **xấu dần**. Ngành rẻ vì có lý do thật.
2. **Ràng buộc thanh khoản nghiêm trọng.** Vốn hoá toàn ngành chỉ **70.803 tỷ VND** trên **95 mã**, tức bình quân **745 tỷ/mã** — nhỏ nhất trong năm ngành đang xét, kém BĐS KCN 27 lần về vốn hoá bình quân. Với nguyên tắc không giải ngân quá 5% khối lượng bình quân 20 phiên mỗi phiên, phần lớn mã trong ngành này không hấp thụ nổi size có ý nghĩa.

**Điều kiện kích hoạt:** có tin giải ngân đầu tư công cụ thể với quy mô và mốc thời gian (catalyst loại 2, đủ 3 điểm), **và** Tier 2 xác định được ít nhất 3 mã có ICR trên 2,5 cùng khối lượng bình quân 20 phiên đủ cho size dự kiến.

### 5.2. Bất động sản Khu công nghiệp

| Chỉ tiêu | Giá trị | Median 3 năm | Tỷ lệ | Phân vị 3 năm |
|---|---|---|---|---|
| P/E | 13,61 | 17,81 | 0,76 | 1,3% |
| P/B | 1,40 | 1,76 | 0,80 | 0,6% |

Vốn hoá 231.479 tỷ · 16 mã · EPS 2.066 đ · BVPS 20.069 đ. Cấu trúc gọn, 16 mã dễ soát hơn nhiều so với 83 mã của BĐS Dân dụng hay 95 mã của Xây dựng.

- Khối ngoại 1 tháng: −192 tỷ, mức bán rất nhẹ
- Mùa vụ tháng 8: +6,70%, **dương 6/6 năm** — một trong bốn ngành nhất quán nhất
- Lợi suất sau đáy: +57,7% rồi +31,5%, hạng 6 rồi **hạng 21** — không nhất quán
- Funnel C: 0 điểm, không có catalyst nào trong bảng Tier 0

**Hai lý do không đưa vào nhóm chính:**

1. **Biên lợi nhuận co hẹp rõ:** biên gộp 33,69% → 30,16% → 29,75% → **27,18%**, mất **6,51 điểm phần trăm** qua 4 quý; biên EBIT 24,59% → 19,41%, mất 5,18 điểm. Đây là fail B2 thật, không phải nhiễu. Tăng trưởng doanh thu cũng chậm lại còn **+1,16%** ở quý gần nhất, từ mức trên 10% các quý trước. Lợi nhuận sau thuế **âm 21,17%** so cùng kỳ.
2. **Câu chuyện FDI đang chịu sức ép từ thuế Section 301.** Luận điểm cốt lõi của ngành là dòng vốn FDI vào sản xuất; thuế bổ sung 12,5% hiệu lực 24/07 phủ khoảng 37% giá trị xuất khẩu sang Mỹ là yếu tố làm nguội chính luận điểm đó, và mới có hiệu lực bốn ngày nên chưa phản ánh vào số liệu.

**Điều kiện kích hoạt:** biên gộp quý 2/2026 ngừng co hẹp (giữ trên 27%), **và** có tín hiệu FDI đăng ký mới không suy giảm sau khi thuế Section 301 có hiệu lực.

## 6. Bảng tổng hợp

| | Chứng khoán | BĐS Dân dụng | Ngân hàng | Xây dựng (dự bị) | BĐS KCN (dự bị) |
|---|---|---|---|---|---|
| Vốn hoá (tỷ) | 483.610 | 2.530.100 | 2.527.825 | 70.803 | 231.479 |
| Số mã | 41 | 83 | 30 | 95 | 16 |
| P/E | 14,32 | 24,15 / **15,08** ex-Vin | 8,69 | 7,65 | 13,61 |
| Phân vị P/E 3Y | 37,2% | 76,3% / **0,6%** | 16,0% | 0,6% | 1,3% |
| P/B | 1,63 | 3,12 / **1,07** ex-Vin | 1,36 | **0,63** | 1,40 |
| Phân vị P/B 3Y | 48,7% | 92,3% / **0,6%** | **3,8%** | 0,6% | 0,6% |
| P/B tại đáy 11/2022 | 1,14 | 1,54 ex-Vin | 1,51 | 0,72 | 0,95 |
| P/B tại đáy 04/2025 | 1,12 | 1,18 ex-Vin | 1,25 | 0,69 | 1,54 |
| **Chênh P/B so đáy rẻ nhất** | **+45,5%** | **−9,3%** | +8,8% | **−8,7%** | +47,4% |
| Dư địa P/B về median 3Y | **0,0%** | — | +11,8% | +34,9% | +25,7% |
| Funnel B | 3/4 | 3/4 | 3/4 | 3/4 | 3/4 |
| Funnel C | 2đ | 3đ | **4đ** | 2đ | 0đ |
| Khối ngoại 1T (tỷ) | −1.413 | −4.740 | **−5.515** | **+215** | −192 |
| Giá 1 tháng | −12,92% | −16,11% | −9,12% | −12,85% | −14,93% |
| Giá 1 năm | −26,84% | −28,34% | **−2,82%** | −18,32% | −20,66% |
| Mùa vụ T8 | **+15,38% · 6/6** | +7,79% · 6/6 | +7,28% · 5/6 | +9,46% · 4/6 | +6,70% · 6/6 |
| Sau đáy 6T, TB | **+90,2%** | +63,4% | +55,1% | +64,9% | +44,6% |
| Kỳ vọng 6T đã chiết khấu | ~+40% | ~+28% | ~+24% | — | — |

## 7. Điều kiện huỷ chung cho cả rổ

Áp cho toàn bộ shortlist, kiểm hàng tuần. Chạm bất kỳ điều nào thì dừng giải ngân mới và xem lại toàn bộ cycle, không xử lý từng ngành riêng lẻ:

1. **VNINDEX mất mốc 1.600 điểm** kèm khối lượng tăng — hiện 1.680,62, đệm 4,8%. Đây là ngưỡng huỷ giả định đáy.
2. **Tỷ giá bán vượt trần biên độ 26.557** — hiện 26.520, đệm 37 đồng.
3. **Fed tăng lãi suất ngoài dự kiến**, hoặc Mỹ mở rộng thuế Section 301 sang nhóm hàng chủ lực khác.
4. **Khối ngoại bán ròng tăng tốc thêm** — tháng gần nhất đã 12.100 tỷ toàn thị trường, tuần gần nhất 6.472 tỷ. Nếu một tuần đơn lẻ vượt 8.000 tỷ, hạ toàn bộ size.

Ba dấu hiệu xác nhận đáy, đủ hai trong ba thì được nâng size lên mức đầy đủ và cân nhắc giảm cash buffer về 15-20%:

1. Khối ngoại bán ròng tuần **dưới 2.000 tỷ** hai tuần liên tiếp, hoặc chuyển mua ròng
2. Số mã tăng vượt số mã giảm ở **3 trên 5 phiên** liên tiếp, không còn mã giảm sàn theo cụm
3. Không có phiên giảm quá 2% kèm khối lượng vượt bình quân 20 phiên, trong hai tuần

## 8. Flags chuyển sang Tier 2

**Pattern giá 8 phiên:** cả năm ngành đều giảm liên tục từ 20/07 đến 27/07 rồi bật ở phiên 28/07 — nhịp bật đầu tiên, **mới một phiên, chưa xác nhận**. Biên độ bật: Chứng khoán +3,72% · BĐS Dân dụng +1,90% · BĐS KCN +0,75% · Ngân hàng +0,48%.

| Ngành | Flag | Gợi ý phân bổ bucket |
|---|---|---|
| Chứng khoán | Biến động mạnh nhất, không có biên an toàn định giá | Bucket 2 là chính. Bucket 1 chỉ cho mã đầu ngành thanh khoản cao |
| BĐS Dân dụng | Giảm sâu nhất, còn động lượng giảm | Bucket 2 và Bucket 3. Hạn chế Bucket 1 |
| Ngân hàng | Giảm nhẹ nhất, định giá sạch | Bucket 1 được cho mã có dòng tiền tự thân; phần còn lại Bucket 2 |

**Năm việc bắt buộc ở Tier 2:**

1. **BĐS Dân dụng — chọn một trong hai luận điểm, không trộn.** Ba trụ Vin chiếm 88,9% vốn hoá ngành và nhận 63,3% dòng vốn nâng hạng, nhưng biên an toàn định giá nằm trọn ở 80 mã còn lại (280.377 tỷ, 11,1% ngành). Khuyến nghị đi hướng 80 mã còn lại vì khớp luận điểm bắt đáy theo định giá.
2. **Ngân hàng — tách dòng tiền khối ngoại cấp mã.** Ngành bị bán ròng nặng nhất sàn nhưng 30 mã không bị bán đều.
3. **Ngân hàng — lọc LLCR.** Loại hoặc hạ size mã có LLCR dưới 80,03% của ngành.
4. **Chứng khoán — kiểm dư nợ margin và trích lập từng mã** khi BCTC quý 2 công bố. Đây là ngành cho vay margin trong lúc đang có giải chấp.
5. **Cả ba ngành — ưu tiên mã đã công bố BCTC quý 2/2026.** Dữ liệu ngành hiện dừng ở quý 1, cũ 3 tháng.

**Ràng buộc thanh khoản:** áp nguyên tắc không giải ngân quá 5% khối lượng bình quân 20 phiên mỗi phiên. Với Chứng khoán (vốn hoá bình quân 11.795 tỷ/mã) và Ngân hàng (84.261 tỷ/mã) thì thoải mái; với BĐS Dân dụng phần ngoài ba trụ (bình quân 3.505 tỷ/mã) cần kiểm từng mã.

## 9. Xác nhận

Shortlist đã chốt theo quyết định user. Tier 2 chạy `P_invest_memo_03` với: 3 ngành × 3 mã, regime Risk-on selective, cash buffer 30%, kèm năm việc bắt buộc ở mục 8.

---

# Phụ lục

Phần nghiên cứu đã thực hiện trong cycle này, giữ lại để tra cứu và tái sử dụng ở các tier sau.

## Phụ lục A — Mùa vụ tháng 8, giai đoạn 2020-2025

Lợi suất tháng 8 = giá đóng cửa phiên cuối tháng 8 chia giá đóng cửa phiên cuối tháng 7, trừ 1. Sáu quan sát.

### A.1. Chỉ số

| Chỉ số | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 | TB | Dương |
|---|---|---|---|---|---|---|---|---|
| FNX100 | +14,15 | +6,73 | +8,24 | +6,53 | +2,72 | +15,12 | +8,92 | 6/6 |
| FNXINDEX | +15,75 | +14,82 | +7,33 | +2,63 | +1,14 | +8,92 | +8,43 | 6/6 |
| HNX30 | +16,93 | +13,11 | +0,77 | +10,15 | +1,97 | +6,90 | +8,30 | 6/6 |
| VNXALL | +11,45 | +2,48 | +5,35 | +2,28 | +2,14 | +14,44 | +6,36 | 6/6 |
| HNXINDEX | +16,13 | +8,88 | +1,15 | +4,26 | +0,93 | +5,12 | +6,08 | 6/6 |
| VN30 | +11,23 | −1,28 | +5,64 | +0,30 | +2,50 | +15,49 | +5,65 | 5/6 |
| **VNINDEX** | +10,43 | +1,64 | +6,15 | +0,09 | +2,59 | +11,96 | **+5,48** | **6/6** |
| UPINDEX | +7,34 | +7,87 | +3,16 | +4,44 | −0,95 | +4,46 | +4,39 | 5/6 |

VNINDEX trung vị +4,37%. Nhóm vốn hoá vừa và nhỏ mạnh hơn nhóm trụ: FNX100 +8,92% so với VN30 +5,65%.

### A.2. Hai mươi bốn ngành

| Ngành | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 | TB | Dương |
|---|---|---|---|---|---|---|---|---|
| Công ty Chứng khoán | +14,18 | +25,18 | +12,53 | +13,14 | +7,05 | +20,19 | +15,38 | **6/6** |
| Hóa chất Phân bón | +23,68 | +30,50 | +14,48 | +4,10 | +1,25 | +2,44 | +12,74 | **6/6** |
| Kinh doanh Bảo hiểm | +22,82 | +19,55 | +5,77 | −1,02 | −1,82 | +13,77 | +9,85 | 4/6 |
| Vận tải Kho bãi | +15,39 | +35,09 | +2,93 | +1,73 | −1,57 | +4,54 | +9,69 | 5/6 |
| Thi công Xây dựng | +21,42 | +20,83 | +6,85 | −0,31 | −3,20 | +11,20 | +9,46 | 4/6 |
| Chế biến Thủy sản | +14,59 | +19,44 | +13,29 | −0,16 | −1,16 | +5,07 | +8,51 | 4/6 |
| Bán lẻ Tiêu dùng | +24,43 | +9,19 | +11,58 | +1,14 | +5,17 | −2,94 | +8,10 | 5/6 |
| BĐS Dân dụng | +14,54 | +10,42 | +6,29 | +4,92 | +1,37 | +9,20 | +7,79 | **6/6** |
| Nông nghiệp Chăn nuôi | +18,12 | +10,33 | +8,05 | −4,11 | +1,74 | +12,39 | +7,75 | 5/6 |
| Cao su Săm lốp | +17,07 | +22,47 | +4,93 | −3,60 | +0,22 | +5,07 | +7,69 | 5/6 |
| Dịch vụ Dầu khí | +18,96 | +5,73 | +15,81 | −2,27 | +3,05 | +4,12 | +7,57 | 5/6 |
| Kim loại công nghiệp | +17,71 | +19,87 | +12,56 | −2,44 | −3,70 | −0,09 | +7,32 | 3/6 |
| Tài chính ngân hàng | +14,03 | −3,70 | +5,36 | +4,12 | +2,12 | +21,76 | +7,28 | 5/6 |
| Vật liệu Xây dựng | +12,91 | +29,61 | −0,60 | −2,03 | −1,31 | +3,95 | +7,09 | 3/6 |
| Y tế Giáo dục | +17,08 | +33,96 | −1,57 | −3,68 | −1,68 | −1,73 | +7,06 | 2/6 |
| Tài nguyên cơ bản | +11,53 | +22,28 | +2,87 | −0,60 | −3,69 | +9,48 | +6,98 | 4/6 |
| BĐS Khu công nghiệp | +15,19 | +15,88 | +5,54 | +0,64 | +0,34 | +2,58 | +6,70 | **6/6** |
| Hạ tầng Tiện ích | +9,88 | +21,18 | +6,83 | −0,05 | −2,44 | +2,66 | +6,34 | 4/6 |
| Công nghệ Viễn thông | +13,85 | +8,30 | +4,23 | +8,50 | −1,07 | −1,28 | +5,42 | 4/6 |
| Thực phẩm Đồ uống | +13,83 | +5,86 | +4,69 | −0,08 | +1,00 | +5,61 | +5,15 | 5/6 |
| Dệt may Xuất khẩu | +13,69 | +18,57 | −0,85 | −4,32 | −0,09 | −4,01 | +3,83 | 2/6 |
| Nhựa và Bao bì | +20,21 | +13,21 | +0,38 | −7,67 | −3,36 | −1,94 | +3,47 | 3/6 |
| Thiết bị Công nghiệp | +9,63 | +8,70 | +6,04 | −0,09 | −0,13 | −4,11 | +3,34 | 3/6 |
| Du lịch Giải trí | +5,67 | +9,60 | −1,39 | −4,49 | −0,92 | +6,34 | +2,47 | 3/6 |

**Giới hạn:** cỡ mẫu 6, rất nhỏ. Hai năm 2020-2021 hậu đại dịch kéo trung bình lên mạnh; giai đoạn 2023-2024 hiệu ứng gần như biến mất ở đa số ngành. Hit rate đáng tin hơn trung bình. Đây là thống kê mô tả, không phải tín hiệu dự báo.

## Phụ lục B — Định giá thị trường và 24 ngành

### B.1. Toàn thị trường, gồm và loại nhóm Vingroup

Chuỗi tự tính từ dữ liệu cấp mã, 289 điểm tuần từ 04/01/2021 đến 28/07/2026. P/E = tổng vốn hoá ÷ tổng lợi nhuận 4 quý; P/B = tổng vốn hoá ÷ tổng vốn chủ sở hữu. Nhóm Vingroup loại bỏ gồm VIC, VHM, VRE, VPL.

| Cửa sổ | n | P/E gồm Vin | P/B gồm Vin | P/E loại Vin | P/B loại Vin |
|---|---|---|---|---|---|
| Giá trị hiện tại | | 13,37 | 1,87 | **11,28** | **1,54** |
| Phân vị 1 năm | 53 | 3,8% | 5,7% | 1,9% | 1,9% |
| Phân vị 3 năm | 156 | 8,3% | 63,5% | **0,6%** | **1,3%** |
| Phân vị 5 năm | 260 | 18,5% | 54,2% | **0,4%** | **0,8%** |

Loại nhóm Vingroup, thị trường ở mức rẻ nhất toàn bộ 5,5 năm dữ liệu trên cả hai hệ số, trong khi P/B headline nhìn như vùng trung tính 63,5% của 3 năm. Nguyên nhân bóp méo gần như trọn ở VIC: P/B 10,80 lần với vốn hoá 1.659.555 tỷ, lớn nhất thị trường. Ba mã còn lại VHM 1,99 · VPL 3,51 · VRE 0,97.

**Hai hệ định giá không trộn được:** chuỗi tự tính ở trên lệch khoảng 5% so với chỉ tiêu tổng hợp sẵn trong hệ thống dữ liệu, do khác phạm vi rổ mã và cách xử lý mã lỗ. Trong một bảng chỉ dùng một hệ.

### B.2. Hai mươi bốn ngành, phân vị 3 năm, ngày 28/07/2026

Số liệu hệ tổng hợp sẵn, sắp theo phân vị P/B tăng dần. Dấu sao là ngành ngoài danh sách 18 ngành theo dõi mặc định.

| Ngành | P/E | Median P/E 3Y | Tỷ lệ | Phân vị P/E | P/B | Phân vị P/B |
|---|---|---|---|---|---|---|
| Vật liệu Xây dựng* | 9,06 | 12,79 | 0,71 | 0,6% | 1,05 | 0,0% |
| Bán lẻ Tiêu dùng | 10,44 | 19,22 | 0,54 | 0,6% | 1,90 | 0,6% |
| Dệt may Xuất khẩu | 5,47 | 7,85 | 0,70 | 0,6% | 0,69 | 0,6% |
| Hóa chất Phân bón | 7,56 | 11,99 | 0,63 | 14,7% | 1,10 | 0,6% |
| BĐS Khu công nghiệp | 13,61 | 17,81 | 0,76 | 1,3% | 1,40 | 0,6% |
| Thi công Xây dựng | 7,65 | 16,18 | **0,47** | 0,6% | **0,63** | 0,6% |
| Vận tải Kho bãi | 10,45 | 13,17 | 0,79 | 6,4% | 1,40 | 1,3% |
| Kim loại công nghiệp | 8,71 | 13,91 | 0,63 | 1,3% | 1,12 | 1,9% |
| Tài chính ngân hàng | 8,69 | 9,26 | 0,94 | 16,0% | 1,36 | 3,8% |
| Chế biến Thủy sản | 7,98 | 11,55 | 0,69 | 14,7% | 1,02 | 6,4% |
| Y tế Giáo dục* | 13,24 | 17,28 | 0,77 | 1,3% | 1,48 | 9,0% |
| Nông nghiệp Chăn nuôi | 8,03 | 13,43 | 0,60 | 0,6% | 1,06 | 9,6% |
| Du lịch Giải trí* | 17,83 | 15,57 | 1,15 | 70,5% | 2,77 | 13,5% |
| Dịch vụ Dầu khí | 13,47 | 14,47 | 0,93 | 21,2% | 1,62 | 17,9% |
| Công nghệ Viễn thông | 15,37 | 24,92 | 0,62 | 0,6% | 3,41 | 20,5% |
| Cao su Săm lốp* | 11,56 | 11,53 | 1,00 | 50,0% | 1,11 | 23,7% |
| Thiết bị Công nghiệp | 8,13 | 8,78 | 0,93 | 26,9% | 1,19 | 37,2% |
| Kinh doanh Bảo hiểm* | 10,01 | 10,84 | 0,92 | 30,1% | 1,28 | 46,8% |
| Công ty Chứng khoán | 14,32 | 16,34 | 0,88 | 37,2% | 1,63 | 48,7% |
| Hạ tầng Tiện ích | 9,40 | 15,18 | 0,62 | 3,2% | 1,23 | 53,2% |
| Thực phẩm Đồ uống | 15,87 | 17,39 | 0,91 | 21,8% | 2,87 | 61,5% |
| Nhựa và Bao bì* | 9,75 | 11,20 | 0,87 | 9,0% | 1,51 | 62,8% |
| **Toàn bộ thị trường** | **12,68** | 12,87 | 0,99 | **39,7%** | **1,82** | **68,6%** |
| Tài nguyên cơ bản | 16,29 | 14,56 | 1,12 | 63,5% | 1,88 | 76,3% |
| BĐS Dân dụng | 23,65 | 14,88 | **1,59** | 78,2% | 3,12 | 92,3% |

### B.3. Hiệu chỉnh ngành bị mã chi phối

Chỉ hai ngành trong 24 ngành bị một nhóm mã làm lệch nghiêm trọng chỉ tiêu ngành:

- **Bất động sản Dân dụng** — ba trụ Vingroup chiếm 88,9% vốn hoá ngành. Số liệu hiệu chỉnh ở mục 4.2.
- **Du lịch Giải trí** — chứa VPL với P/B 3,51 và vốn hoá 133.601 tỷ. Chưa tính lại vì ngành không nằm trong phạm vi xét của cycle này. **Nếu cycle sau xét ngành này thì phải hiệu chỉnh trước.**

## Phụ lục C — Nâng hạng FTSE Russell

### C.1. Lịch trình

FTSE Russell xác nhận ngày 07/04/2026. Bốn đợt: **21/09/2026 (10%)** · 22/03/2027 (20%, lũy kế 30%) · 21/06/2027 (35%, 65%) · 20/09/2027 (35%, 100%).

Mốc trong 0-2 tháng: 10/08 công bố danh sách theo dõi · **21/08 tệp chỉ báo** · 24/08-04/09 giai đoạn truy vấn · **04/09 tệp cuối cùng** · 07/09 phong toả · **18/09 phiên cơ cấu** · 21/09 hiệu lực.

### C.2. Dòng vốn và mức độ tập trung

Trọng số Việt Nam khi đủ 100%, dự phóng FTSE trên dữ liệu 31/03/2026: **0,192%** FTSE Emerging · 0,329% Emerging All Cap · 0,020% All-World · 0,034% Global All Cap.

Dòng vốn thụ động **ròng đợt 1: 128,18 triệu USD = 3.370,61 tỷ VND, 19 mã** — dự báo ACBS 13/07/2026 trên dữ liệu 30/06/2026, **không phải danh mục FTSE đã chốt**. Bản dự báo sớm hơn của cùng đơn vị ngày 08/04/2026 cho 171,37 triệu USD và 32 mã. Hai bản là hai phiên bản của cùng mô hình ở hai thời điểm, cho thấy biên sai số vài chục phần trăm.

Tập trung: **VIC 46,9% · VHM 14,8% · hai mã cộng lại 61,6% · năm mã lớn nhất 74,3%.**

**Ba phép chia đặt dòng vốn này vào đúng tỷ lệ:**

1. Dòng mua đợt 1 là 3.371 tỷ, bằng khoảng **28%** lượng bán ròng khối ngoại một tháng gần nhất (12.100 tỷ), và **4,1%** lượng bán ròng nửa đầu năm (81.457 tỷ).
2. **Hai đợt 35% năm 2027 lớn hơn đợt đầu về tiền tuyệt đối.** Chỉ nhìn tháng 9/2026 là bỏ qua phần lớn dòng vốn.
3. Dòng vốn chủ động không suy ra được bằng phép nhân trọng số với tổng tài sản quỹ.

### C.3. Cấu trúc bất đối xứng

**Việt Nam rời FTSE Frontier trong MỘT đợt tháng 9/2026, nhưng vào rổ toàn cầu theo BỐN đợt.** Trong cùng kỳ cơ cấu, quỹ Frontier bán 100% vị thế còn quỹ Emerging chỉ mua 10% trọng số mục tiêu.

Đối chiếu: MSCI với Kuwait 2020 làm ngược lại có chủ ý — thêm vào Emerging một lần nhưng chia việc xoá khỏi rổ Frontier thành **năm kỳ**. Pakistan 2017 có đúng cấu trúc như Việt Nam và kết cục là **bán ròng** thay vì mua ròng.

**Yếu tố thuận không có tiền lệ:** Hy Lạp được nâng lên Developed **hiệu lực đúng ngày 21/09/2026**, nên quỹ theo FTSE Emerging đồng thời giải phóng trọng số Hy Lạp và nhận trọng số Việt Nam trong cùng kỳ rà soát.

### C.4. Tiền lệ quốc tế

| Thị trường | Chỉ số | Hiệu lực | Số đợt | Số mã | Trọng số | Công bố → hiệu lực | Tháng hiệu lực | Cả năm | Sau 1-2 năm |
|---|---|---|---|---|---|---|---|---|---|
| Kuwait | FTSE | 09+12/2018 | 2 (50/50) | 12 | 0,51% EM All Cap | — | Khối lượng kỷ lục | +1,59% | Tốt. 2019 +23,7% |
| Iceland | FTSE | 09/2022→03/2023 | 3 (33,3%) | 15 | 0,1336% EM | — | Chỉ 3 mã tăng | **−26,5%** | Trung tính |
| Romania | FTSE | 21/09/2020 | 1 (100%) | 2 | 0,038% EM | Trước 1 năm | **−2,46%** | +3,4% | Rất tốt. 2021 +33,2% |
| Saudi Arabia | FTSE | 03/2019→06/2020 | **6** | 79 | 3,1% EM | — | — | +7,19% | Tốt |
| China A | FTSE | 06/2019→06/2020 | 4 | 1.051 | ~6% EM | — | — | +37% | Ổn định |
| Dubai | MSCI | 02/06/2014 | 1 | 9 | — | **+112%** | **−22,5%** | +11,94% | Xấu |
| Qatar | MSCI | 02/06/2014 | 1 | 10 | — | **+44%** | **−16,1%** | +18,4% | Xấu. 2015 −16,40% |
| Pakistan | MSCI | 01/06/2017 | 1 | 6 | 0,10% EM | Đỉnh trước 1 tuần | **−3,58%** | **−15,34%** | **Hạ về Frontier 11/2021** |
| Argentina | MSCI | 28/05/2019 | 1 | 8 | 0,26% EM | — | +22,87% sau 1T | **−20,83%** | **Chuyển Standalone 11/2021** |

**Dự báo dòng vốn so với thực tế:**

| Thị trường | Dự báo | Thực tế |
|---|---|---|
| Pakistan 2017 | 300-500 triệu USD vào | **Bán ròng 652 triệu USD** |
| UAE 2014 | 370 triệu (HSBC) đến 3 tỷ (BNY Mellon) | **300 triệu USD** |
| Qatar 2014 | 430 triệu (HSBC) | **2.482 triệu USD** |
| Kuwait FTSE 2018 | 950 triệu - 1,1 tỷ (NBK Capital) | ~780 triệu USD |

Ba trên bốn trường hợp dòng vốn thực tế ở hoặc dưới cận dưới dự báo.

**Danh sách chỉ báo không phải danh sách cuối.** Iceland: FTSE loại Sildarvinnslan vì hạn chế sở hữu nước ngoài, loại Eik fasteignafelag và Reginn vì trượt kiểm tra thanh khoản. Pakistan: MSCI xoá 10 trong 16 mã sau khi áp ngưỡng Emerging.

**Lịch trình có thể sửa.** Saudi công bố 5 đợt thực hiện 6 đợt. China A cắt đợt 03/2020 từ 40% xuống 10%. MSCI dời Kuwait từ 05/2020 sang 11/2020.

### C.5. Nghiên cứu định lượng

**Burnham, Gakidis & Wurgler (2017), NBER Working Paper 23557.** Mẫu toàn bộ tái phân loại MSCI từ 2000.

- Nhóm chuyển sang chỉ số có tỷ lệ sở hữu theo chuẩn cao hơn (8 sự kiện, gồm Frontier lên Emerging): **+23,2%** từ công bố đến hiệu lực, rồi **−12,4%** trong 12 tháng sau. Có ý nghĩa thống kê (t = −2,1 và t = 2,6)
- Loại cửa sổ ngắn quanh ngày sự kiện: còn +21,3% và −9,2% — hiệu ứng khả thi để giao dịch
- **Không tìm thấy thay đổi có ý nghĩa về thanh khoản** (đo qua beta và tự tương quan bậc nhất) trước và sau tái phân loại. Luận điểm "nâng hạng cải thiện thanh khoản vĩnh viễn" không có bằng chứng
- Quỹ theo chuẩn Emerging mua đúng ngày hiệu lực là **mua tại đỉnh**

**Nghiên cứu cho Sở giao dịch Lima (2019):** hiệu ứng ngắn hạn hai chữ số nhưng **tan trong 2-4 tháng**, tác động dài hạn còn −4% đến 0%. Độ lớn phụ thuộc mức độ bất ngờ.

**Tỷ lệ đảo ngược:** trong các trường hợp MSCI nâng lên Emerging từ 2014 (Qatar, UAE, Pakistan, Argentina, Kuwait, Saudi), **hai bị đảo ngược trong 2-4 năm** — khoảng một phần ba. Với FTSE (Kuwait, Saudi, Romania, Iceland): chưa có trường hợp nào.

### C.6. Hàm ý cho cycle này

Mẫu hình "tăng mạnh từ công bố đến hiệu lực rồi đảo chiều" **đã không xảy ra ở Việt Nam** — từ ngày xác nhận 07/04/2026 thị trường giảm chứ không tăng, hiện thấp hơn đỉnh 18/05 tới 12,8%. Phần bọt mua đón đầu, thứ đã hạ gục Dubai, Qatar và Pakistan sau ngày hiệu lực, phần lớn chưa hình thành hoặc đã bị xả. Đây là lập luận thật nghiêng về phía bắt đáy.

## Phụ lục D — Vì sao Hóa chất Phân bón bị loại khỏi nhóm ưu tiên

Ngành này ban đầu là ứng viên bổ sung mạnh nhất: P/B 1,10 ở phân vị 0,6%, P/E 7,56 bằng 0,63 lần median, mùa vụ tháng 8 dương 6/6 với trung bình +12,74%. Sau khi kiểm chi phí đầu vào, hạ xuống **ứng viên có điều kiện**.

### D.1. Neo chi phí vào giá dầu là có thật và bằng hợp đồng

Giá khí đầu vào của Đạm Phú Mỹ tính theo công thức `46% × giá FO Singapore + 0,63 USD/MMBTU`. Đạm Cà Mau dùng `50% × (46% FO) + 50% × (12,7% Brent) + 1,09 USD/MMBTU`. Khí chiếm **60-70% giá vốn** urê. Không có bao tiêu giá khí cố định, không có phòng vệ giá — dầu tăng là giá vốn tăng tự động ở kỳ sau.

### D.2. Nhưng độ nhạy lệch 3:1 về phía giá bán

Với urê quanh 400 USD/tấn: giá urê đổi 10% tác động khoảng **40 USD/tấn**; dầu đổi 10% tác động khoảng **12-14 USD/tấn** qua chi phí khí. Biến chi phối là giá đầu ra, không phải giá dầu.

### D.3. Lưỡi kéo đang khép từ cả hai phía

| | Giá trị 28/07/2026 | Biến động 1 tháng |
|---|---|---|
| Urê Trung Đông (đầu ra) | 400 USD/tấn | **−1,07%** |
| Dầu Brent (neo đầu vào) | 85,78 USD/thùng | **+19,25%** |
| Khí thiên nhiên giao ngay | 2,76 USD/MMBtu | −8,51% |
| Urê Trung Quốc | 1.756 CNY/tấn | +1,66% |

Đầu vào theo công thức neo vào dầu tăng gần 20% trong tháng, đầu ra đứng yên ở vùng sát đáy 52 tuần (387,5 USD/tấn) và giảm khoảng 14% so cùng kỳ. Khí giao ngay giảm không cứu được vì công thức neo vào FO chứ không vào khí giao ngay. Đạm Phú Mỹ đã ghi nhận giá khí bình quân 6 tháng **cao hơn kế hoạch 16%**.

### D.4. Bằng chứng thị trường đã định giá lại

Ngành giảm **35,09% trong một năm — tệ nhất trong cả 24 ngành** — trong khi doanh nghiệp báo lãi kỷ lục (Đạm Cà Mau quý 1 tăng 83%, quý 2 dự phóng tăng 67%). Giới phân tích gọi quý 2/2026 là quý đỉnh, dự báo 2027 giảm 12%.

**P/E 7,56 là P/E trên lợi nhuận đỉnh chu kỳ** — đúng cái bẫy đã cảnh báo cho Kim loại công nghiệp ở Tier 0. Lợi suất sau đáy cũng yếu nhất nhóm: hạng 21 sau đáy 2022 (+16,5%) và hạng 8 sau đáy 2025 (+50,8%).

Điểm bào chữa còn đứng được: P/B 1,10 ở phân vị 0,6% không phụ thuộc lợi nhuận đỉnh, và mức giảm 35% cho thấy phần lớn chu kỳ đã phản ánh vào giá.

### D.5. Điều kiện kích hoạt lại

Urê Trung Đông giữ **trên 400 USD/tấn hai tuần liên tiếp**, hoặc bật khỏi đáy 52 tuần 387,5 USD/tấn. Trước khi có tín hiệu đó, đây là bẫy định giá của cổ phiếu chu kỳ, không phải cơ hội bắt đáy.

### D.6. Lưu ý phạm vi

Cơ chế trên áp cho **nhóm urê** (Đạm Phú Mỹ, Đạm Cà Mau). Nhóm còn lại trong ngành dùng nguyên liệu khác — quặng apatit, lưu huỳnh, than cốc — nên **không suy luận từ nhóm urê sang toàn ngành**. Hóa chất Đức Giang chịu sức ép riêng từ giá lưu huỳnh và việc dừng khai thác khai trường.

## Phụ lục E — Ghi chú phương pháp và sai lệch đã biết

### E.1. Không dùng tầng chỉ báo nội bộ

Theo yêu cầu user, cycle này không dùng chỉ báo xu hướng 4 khung, vùng kỹ thuật, điểm dòng tiền, trạng thái pha thị trường. Funnel A theo spec gốc xếp hạng bằng chính các chỉ báo đó nên đã thay bằng bốn đại lượng khách quan: dòng tiền khối ngoại theo ngành tự tổng hợp từ giao dịch từng mã, biến động giá 4 khung, phân vị định giá lịch sử, mùa vụ tháng 8. Pattern 20 phiên thay bằng đường giá thực tế 8 phiên.

**Ảnh hưởng thực tế:** đáng kể. Dòng tiền khối ngoại cho thấy Tài chính ngân hàng bị bán ròng nặng nhất toàn sàn — thông tin không xuất hiện trong bộ tiêu chí gốc và ngược với flag ban đầu ở Tier 0.

### E.2. Sai lệch đã biết trong dữ liệu

1. **Look-ahead 1-2 tháng** ở chuỗi định giá lịch sử: BCTC gán vào ngày kết thúc kỳ, không phải ngày công bố. Dùng để định vị, cấm dùng làm tín hiệu kiểm định quá khứ.
2. **Survivorship bias:** giá đã backfill cho mã niêm yết sau 2020 nên số mã đứng im suốt lịch sử. Thống kê rổ cho giai đoạn 2020-2022 bị lệch có hệ thống.
3. **Chuỗi định giá tần suất tuần**, không phải phiên. Cấm mô tả biến động chuỗi này bằng đơn vị phiên.
4. **P/E ngành là cap-weighted**, không phải trung bình cộng P/E các mã — đây chính là lý do một mã như VIC bóp méo được cả ngành.
5. **Hai hệ định giá lệch khoảng 5%** — chuỗi tự tính từ cấp mã so với chỉ tiêu tổng hợp sẵn. Không trộn trong cùng một bảng.
6. **Cỡ mẫu nhỏ:** mùa vụ tháng 8 có 6 quan sát; lợi suất sau đáy có 2 quan sát. Cả hai là thống kê mô tả, không đủ cho suy luận xác suất.

### E.3. Mâu thuẫn nguồn đã xử lý

- **Giá dầu Brent:** nghiên cứu web trả về "~72 USD/thùng", kho dữ liệu nội bộ ghi **85,78 ngày 28/07** và khớp với WTI 81,76. Dùng số của kho. Điều này đảo chiều kết luận ở Phụ lục D.
- **Đỉnh VNINDEX 2026:** tin báo ghi "~1.903", dữ liệu thật là **1.927,94 ngày 18/05/2026**. Dùng số dữ liệu.
- **Dòng vốn nâng hạng:** hai bản dự báo ACBS ngày 08/04 (32 mã, 171,37 triệu USD) và 13/07 (19 mã, 128,18 triệu USD). Dùng bản mới hơn, nêu bản cũ như dải sai số.
- **Số collection trong kho dữ liệu:** một subagent báo 36 kèm một collection tạm; kiểm bằng lệnh cho **35** và không có collection đó. Tài liệu engine đúng, subagent sai.
