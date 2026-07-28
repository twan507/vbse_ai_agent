# CHANGELOG — thay đổi engine & cấu trúc workspace

Ghi mỗi lần sửa engine (K/P/O, system_prompt, KERNEL_SKELETON, OUTPUT_MASTER, agent_db_*) hoặc thay đổi cấu trúc workspace. Mục đích: biết mỗi báo cáo trong `outputs/` được sinh trên phiên bản spec nào. Dòng mới thêm lên đầu.

Format: `## YYYY-MM-DD — tiêu đề` + file đụng tới + nội dung + lý do.

## 2026-07-28 — P_invest_memo: thêm Vòng E, Vòng F, catalyst loại 5, luật đọc chuỗi

**Bối cảnh:** rút từ cycle invest_memo 2026-08 chạy thật qua Tier 0 → Tier 2, có ba vòng phản hồi của user và một đợt rà tin tức 5 ngành bằng 5 subagent. Đây là lần đầu pack `P_invest_memo` được chạy đầy đủ trên dữ liệu thật, và nó lộ ra bốn lỗ hổng mà spec viết trên lý thuyết không thấy.

**File đụng tới:** `engine/P/P_invest_memo_03.md` (mục 2, 3, 5b mới, 5c mới, 8, 11) · `engine/P/P_invest_memo_01.md` (mục 4).

### Lỗ hổng 1 — Vòng B chỉ đọc quý gần nhất, bị chỉ tiêu trailing đánh lừa

**Đây là lỗi nghiêm trọng nhất, tái diễn ở 3 ngành trong cùng một cycle.**

`stock_finstats` trả ROE và các hệ số định giá dưới dạng **trailing 4 quý**. Một quý cũ rất mạnh giữ chỉ tiêu qua ngưỡng dù quý gần nhất đã sụp. Ba ca thật:

| Mã | Chỉ tiêu trailing | Quý gần nhất | Hệ quả |
|---|---|---|---|
| DIG | ROE 7,7% — pass B | ICR **−0,8**, dòng tiền **−437 tỷ**, lỗ ròng 9,9 tỷ | Đã xếp rank 1 ngành BĐS |
| HDC | ROE 24,8% — pass B | **ICR âm 3 quý liên tiếp**, dòng tiền −579/−462/−276 tỷ | Đã vào shortlist |
| VIX | ROE 25,58%, P/E 5,82 | LNST **−94/−95% YoY**, tự doanh lỗ ròng 200 tỷ | Đã xếp rank 1 ngành CK |

Cả ba lọt Vòng B nhờ đúng một cơ chế. Không có bước nào trong spec cũ đối chiếu hai loại số.

**Sửa:** thêm hai khối vào `P_invest_memo_03` Section 3 — quy tắc **đọc chuỗi 4-6 quý** cho ICR, dòng tiền kinh doanh và tăng trưởng lợi nhuận; và **kiểm tra đối chiếu trailing với quý gần nhất**, gắn cờ đỏ khi quý gần nhất âm sâu hơn −30% mà ROE trailing vẫn qua ngưỡng. Thêm failure mode 11.8.

### Lỗ hổng 2 — không có đường vào cho mã hút dòng tiền mạnh nhưng fail cơ bản

Kiến trúc gốc `(B ∩ D) ∪ (C ∩ D)` đặt cơ bản làm bộ lọc loại thẳng, dòng tiền chỉ ở tầng xếp hạng. Đúng với horizon 3-6 tháng. **Sai với horizon 1-3 tháng bắt nhịp hồi** — lợi nhuận đến từ mức nén giá phục hồi, cần dòng tiền chứ không cần EPS.

User yêu cầu đưa CEO, DXG, TAL vào dù trượt Vòng B, với lý do "sóng ngắn nên ưu tiên hút dòng tiền". Không có chỗ nào trong spec cho việc này — nó không phải catalyst play.

**Sửa:** thêm **Vòng E — Sức hút dòng tiền** (Section 5b mới), ba chỉ tiêu cần đạt 2/3: vòng quay thanh khoản trên vốn hoá tính bằng điểm cơ bản · hiệu suất 6 tháng sau các đáy chu kỳ so với trung vị ngành · bằng chứng dòng tiền đang hoạt động có ngày và nguồn. Công thức universe thành `[(B ∩ D) ∪ (C ∩ D) ∪ (E ∩ D)] − F`.

**Vòng E mặc định ĐÓNG**, chỉ mở khi user chốt horizon ngắn và tuyên bố ưu tiên dòng tiền — vì nó đảo thứ tự hai tầng của kiến trúc gốc. Mở là quyết định của user, phải ghi audit.

Kèm ba cảnh báo bắt buộc, trong đó có một rút từ mâu thuẫn thật: **TAL vào bằng lý do hút dòng tiền nhưng vòng quay chỉ 5,3 điểm cơ bản, thấp nhất trong 22 mã đã đo** — mã đi ngược chính nguyên tắc đưa nó vào.

### Lỗ hổng 3 — không có bộ loại trừ cứng cho sự kiện ngoài dữ liệu

Spec để việc soi red flag đến Tier 5A. Thực tế: **8 trong 18 mã shortlist ban đầu phải loại vì sự kiện pháp lý, quản trị hoặc pha loãng**, toàn bộ nằm ngoài `agent_db`. Nếu để đến 5A thì đã tốn trọn công Tier 3 và 5B cho mã không dùng được.

Cả 5 ngành đều có ca: VCG và DGC khởi tố lãnh đạo · DGC bị HoSE hạn chế giao dịch · DPG bị phạt thao túng giá · NVL chậm trả nợ gốc trái phiếu · DIG mất hết cổ đông lớn vì giải chấp · TPB bị loại khỏi VN30 · BID, VND, VPB, BCM, DPM pha loãng lớn trong horizon · CII trái phiếu chuyển đổi giá sát thị giá.

**Sửa:** thêm **Vòng F — Loại trừ cứng** (Section 5c mới), áp sau cùng, loại thẳng kể cả mã đã lọt B ∩ D. F1 sự kiện pháp lý và quản trị; F2 nguồn cung cổ phiếu tương lai rơi trong horizon. Thêm **Bước 4b bắt buộc** vào workflow. Thêm failure mode 11.9.

Riêng F2 là **biến hoàn toàn không có trong spec cũ**, dù ngành ngân hàng đang huy động ~128.000 tỷ vốn cổ phần trong 2026, gấp hơn 7 lần năm trước.

### Lỗ hổng 4 — thiếu loại catalyst có độ chắc cao nhất

Bảng 4 loại catalyst ở `P_invest_memo_01` gộp mọi sự kiện doanh nghiệp vào loại 4 với độ chắc "biến động — tin đồn vs công bố". Nhưng có một nhóm con **độ chắc cao nhất bảng**: sự kiện đã có văn bản và ngày cụ thể.

**Sửa:** tách **loại 5 — Sự kiện lịch**: kỳ cơ cấu chỉ số, giao dịch nội bộ đã đăng ký, đợt phát hành đã có ngày, thương vụ đã ký chờ hoàn tất. Ghi rõ **catalyst loại 5 có thể mang dấu âm** — đợt phát hành lớn trong horizon là catalyst âm mạnh.

Bốn ca thật minh hoạ: TPB rời VN30 (giải thích trọn vẹn việc bị bán ròng 554 tỷ mà dữ liệu định lượng thấy nhưng không giải thích được) · VCI cổ đông lớn nhất đăng ký mua 31,05 triệu cp giao dịch 04/08–02/09 · BID phát hành 498,2 triệu cp quý 2–quý 3 · SHB thương vụ Krungsri hoàn tất giữa quý 3.

### Điều KHÔNG sửa, và lý do

**Không đổi Vòng A và logic bucket** dù cycle này không dùng được chúng. Cycle 2026-08 có override riêng của user là không dùng tầng chỉ báo nội bộ, nên phải thay bằng đại lượng khách quan. Đó là **hoàn cảnh của một cycle, không phải lỗi của spec** — cycle sau không có override thì Vòng A gốc vẫn đúng. Ghi lại ở đây để người sau không nhầm bản thay thế tạm thời là chuẩn mới.

**Không đổi constraint 10 catalyst** ở Tier 0 dù nghịch lý đã nêu (catalyst timing dài bị loại đầu tiên dù tác động toàn thị trường). Cycle này xử lý bằng cách tách đợt 1 của lộ trình thành catalyst riêng, nằm trong spec, không cần sửa.

## 2026-07-28 — Sửa 6 sai lệch schema K_agent_db so với DB thật

**Bối cảnh:** phát hiện khi chạy Tier 0 của cycle invest_memo 2026-08. Cần lấy chuỗi chỉ số nhiều năm để tính mùa vụ tháng 8, đọc doc thấy ghi `history_index` chỉ có VNINDEX, query thật thì ra 8 chỉ số. Kéo dây thì lòi thêm 5 chỗ nữa.

**Toàn bộ đều verify bằng query thật ngày 2026-07-28, không suy đoán:**

| Chỗ | Doc ghi | Thực tế | File |
|---|---|---|---|
| `history_index` số doc | 1 doc, "hiện tại chỉ VNINDEX" | **8 doc** — VNINDEX, VN30, HNXINDEX, HNX30, UPINDEX, VNXALL, FNXINDEX, FNX100; mỗi doc 1.638 phiên từ 2020-01-02 | `K_agent_db_01` |
| `history_index.volume` | "thường là 0 hoặc bị omit (index là tính toán)" | **Có dữ liệu đủ cả 8 chỉ số** — phiên cuối từ ~16,2 triệu (UPINDEX) tới ~701,8 triệu (FNXINDEX) | `K_agent_db_01` |
| `other_data` | 70 doc | **74 doc** | `K_agent_db_01` |
| `stock_info` | ~674 doc | **679 doc** | `K_agent_db_01` |
| `history_stock` | ~500 mã / ~500 doc | **679 doc** — bằng đúng `stock_info` và `history_nntd_stock` | `K_agent_db_01` |
| Ngưỡng `day_score` | "percentile 674 mã" | **679 mã** | `K_agent_db_04` |

**Sửa kèm — cảnh báo ghép cặp sai phạm vi.** Hai chỗ (`K_agent_db_01` khối `history_nntd_index`, `K_agent_db_02` mục 1.5) viết *"`history_nntd_index` là 3 sàn gộp, khác `history_index` (chỉ VNINDEX)"*. Vế sau sai nên lời khuyên cũng lệch. Viết lại: `history_index` **có** đủ HNXINDEX và UPINDEX, nhưng **chỉ số là điểm số không cộng được với nhau** — muốn so dòng tiền khối ngoại 3 sàn với diễn biến giá thì dùng rổ rộng (`VNXALL`/`FNXINDEX`) làm đại diện, hoặc nói rõ đang so riêng VNINDEX. Thêm nhắc bắt buộc lọc `index` khi query, vì không lọc là kéo về 8 × 1.638 phiên.

**Thêm mới, không phải sửa lỗi:** ghi chú survivorship bias ở `history_stock` — giá đã backfill cho cả mã niêm yết sau 2020 nên số mã đứng im suốt lịch sử. Ai tính thống kê rổ cho giai đoạn 2020-2022 mà không biết điều này sẽ ra kết quả sai lệch có hệ thống.

**Không sửa vì kiểm ra là ĐÚNG:** con số "35 collection" ở `K_agent_db_00` và `KERNEL_SKELETON`. Một subagent khảo sát DB báo là 36, có thêm `temp_history_stock`. Chạy `list-collections` thì `totalCount` = **35** và không có collection nào tên như vậy. Doc đúng, subagent sai.

**Đây là lần thứ hai trong cùng một ngày luật `CLAUDE.md` mục 10.4 cứu một lỗi sắp bị ghi vào engine** — lần trước là `O_invest_memo` có spec render binary thật, lần này là số collection. Cả hai đều là khẳng định định lượng từ subagent, cả hai đều sai theo chiều "báo có cái không có". Giữ nguyên luật: khẳng định định lượng từ subagent phải verify bằng lệnh trước khi ghi vào engine.

**Lý do sửa:** schema doc sai làm agent bỏ qua dữ liệu đang có. Cụ thể ở cycle này, nếu tin doc thì đã không tra được VN30/HNXINDEX/UPINDEX để đối chiếu mùa vụ tháng 8 giữa các rổ — mà đó chính là chỗ cho thấy nhóm vốn hoá vừa và nhỏ có hiệu ứng tháng 8 mạnh hơn nhóm trụ (FNX100 +8,92% so với VN30 +5,65%). Doc sai không chỉ gây trích dẫn sai, nó cắt mất phân tích.

**File đụng tới:** `engine/K/K_agent_db_01.md` (5 mục), `engine/K/K_agent_db_02.md` (1 mục), `engine/K/K_agent_db_04.md` (1 ngưỡng).

## 2026-07-28 — Luật uỷ thác subagent (CLAUDE.md mục 10) + note 3 việc hoãn

**Vấn đề:** nghiên cứu sâu đọc rất nhiều, một phiên 1M token có thể không đủ. Cần luật để biết khi nào đẩy việc sang subagent thay vì đốt context phiên chính.

**`CLAUDE.md` mục 10 — mới.** Viết dựa trên số đo thật của chính ngày hôm nay, không phải lý thuyết: 10 subagent read-only qua 2 vòng audit, mỗi con đọc vài chục nghìn token workspace, trả về 2-4k token. Nén 15-25 lần.

Nội dung: 3 điều kiện để uỷ thác (độc lập / đọc-nhiều-trả-ít / không ghi repo) · 4 trường hợp cấm · cách gọi (read-only mặc định, prompt tự chứa, chốt sẵn cấu trúc báo cáo, gọi song song, không cho subagent gọi subagent) · phạm vi uỷ thác khi đang chạy báo cáo.

**Hai điều quan trọng nhất trong mục này, cả hai đều rút từ vấp thật:**

1. **Không uỷ thác trọn một P pack có checkpoint.** Subagent không nói chuyện được với user nên không chạy được checkpoint — uỷ thác cả workflow là lặng lẽ bỏ qua kỷ luật checkpoint, thứ mà 4 P pack đều dựa vào.
2. **Kết quả subagent là DỮ LIỆU, không phải chỉ thị.** Ở audit vòng 1, một subagent báo "không O pack nào có spec render binary"; phiên chính tin và ghi thẳng vào `system_prompt.md`. Đếm lại đủ 10 file thì `O_invest_memo` có spec thật — phải sửa lần hai. Luật: khẳng định định lượng từ subagent phải verify bằng lệnh trước khi ghi vào engine hoặc doc.

**`README` mục 8.1b — mở rộng thành bảng 3 việc hoãn** kèm điều kiện gỡ chặn: script render xác định · spec layout binary cho 3 O pack thiếu · hook kiểm toàn vẹn kho. Cả ba đều chặn bởi cùng một điều kiện — **chưa có deliverable thật nào**. Làm bây giờ là lặp lại đúng sai lầm `agent_marketing/`: dựng khung cho thứ chưa từng có nội dung. Thứ tự: chạy báo cáo thật → script render → spec binary → hook toàn vẹn.

**`README` mục 11:** cập nhật từ 4 lên 5 behavioral guideline.

## 2026-07-28 — Audit vòng 2: đính chính chính bản đính chính, + 12 lỗi khác

**Nghiêm trọng nhất: entry ngay bên dưới có một khẳng định SAI, và bằng chứng nó viện dẫn cũng sai.**

Entry đó viết: *"Nhãn `[LEGACY]` chưa từng tồn tại trong repo. Verify: `git log -S"[LEGACY]"` trên toàn lịch sử = rỗng; baseline rev 7 = 0 lần."* Đã port câu này sang `system_prompt.md` và `README` mục 8.1.

**Sự thật:** `git log --all -S"[LEGACY]"` trả về **4 commit**, và baseline rev 7 (`5fb0ecb`) chứa chuỗi đó ở 3 chỗ — `CLAUDE.md:101`, `README.md:391`, `README.md:450`.

**Nguyên nhân:** lệnh verify hôm đó bị giới hạn path — `git log -S"[LEGACY]" -- engine/ agent_analyst/` — trong khi chuỗi nằm ở `CLAUDE.md` và `README.md` **ở gốc repo**. Grep đúng phạm vi nhưng sai tập file, ra 0 kết quả, rồi kết luận vượt xa cái đã kiểm.

**Phát biểu đúng:** không section nào trong `engine/` mang nhãn `[LEGACY]` (grep `engine/` = 0 — phần này vẫn đúng, và đó là điều thực sự quan trọng). Nhưng **doc có nhắc tới nhãn** từ baseline rev 7; nhãn thật nếu từng tồn tại thì ở rev 6 tiền-git, ngoài tầm với của lịch sử này. Đã sửa ở `system_prompt.md` mục 4 và `README` mục 8.1.

**Vì sao đáng ghi to:** một đính chính sai còn hại hơn lỗi gốc. Nó kèm sẵn một lệnh "tự kiểm chứng đi" — người sau chạy đúng lệnh đó, thấy 4 kết quả ngược lại, rồi mất niềm tin vào cả phần đúng. **Luật rút ra: lệnh verify viết vào tài liệu phải là lệnh đã chạy đúng nguyên văn, không được giới hạn path rồi phát biểu ở phạm vi toàn cục.**

**Các lỗi khác cùng đợt:**

- `README` dòng cuối vẫn ghi *"AI không tự push được"* rồi trỏ về `CLAUDE.md` mục 7.7 — chính mục đã bác bỏ nó. Lần trước sửa dòng 57, sót dòng cuối file. Đây là **lần thứ hai** cùng một lỗi ở cùng một file.
- `CLAUDE.md` bảng router mục 3 và `README` mục 13 vẫn bảo đọc `OUTPUT_MASTER.md` ngay từ đầu, trong khi 3 file engine đã chốt "chỉ đọc khi sắp compose". Lần trước sửa 3 chỗ engine, quên 2 chỗ doc — **bài học "sửa doc không tự sửa engine" chạy ngược chiều, cũng lần thứ hai**.
- Ngoại lệ "query vùng rìa được đọc riêng khối Trigger" mới thêm ở `CLAUDE.md` chưa port sang `system_prompt.md`, `KERNEL_SKELETON.md`, `README` — ba chỗ đó vẫn dùng từ tuyệt đối ("bỏ qua hoàn toàn", "Không đọc"). Đã port.
- `README` mục 10 còn ghi *"Chưa dọn: wording đó còn rải rác trong P/O packs"* — thực tế đã dọn ở commit `ca5c61f`, grep 6 từ khoá = 0. Đã sửa.
- **Danh sách ngành sai 3 chỗ trong `KERNEL_SKELETON`:** (a) kê BAOHIEM là "ngành whitelist" trong khi `K_agent_db_01` nêu đích danh "Bảo hiểm" làm ví dụ ngành **ngoài** whitelist; (b) bỏ sót THUYSAN khỏi danh sách ngành không có CFA cover (6 → đúng là 7), mà THUYSAN lại có trong whitelist 18; (c) "21 ngành whitelist" là con số không tồn tại — đúng phải là 24 ngành DB, 18 whitelist, 21 phi tài chính; và phép cộng "18 whitelist + 3 financial" sai vì whitelist đã gồm NGANHANG + CHUNGKHOAN.

**Đánh giá phương pháp:** vòng 2 dùng 5 probe khác hẳn vòng 1 (tiền tố `tra nhanh:`, luồng intake, đính chính báo cáo cũ, sửa engine, đọc nguội tổng thể). Hành vi vẫn 5/5 đúng. Nhưng tìm thêm được **13 lỗi văn bản** sau khi vòng 1 đã sửa 9 — trong đó 3 lỗi là **tàn dư của chính các bản sửa ở vòng 1**. Kết luận: mỗi lần sửa luật đều có xác suất sinh lỗi mới, nên audit phải chạy **sau** mỗi đợt sửa chứ không phải một lần cho xong.

## 2026-07-28 — Sửa 4 mâu thuẫn engine do subagent audit phát hiện

> ⚠ **ĐÍNH CHÍNH (xem entry trên cùng ngày, phía trên):** mục 4 của entry này khẳng định nhãn `[LEGACY]` "chưa từng tồn tại trong repo" — **SAI**. Nó có trong `CLAUDE.md`/`README.md` từ baseline rev 7. Phần đúng: `engine/` không có nhãn nào. Giữ entry nguyên văn theo luật append-only, đọc kèm đính chính.

**Phương pháp:** thả 5 subagent read-only đóng vai session mới, mỗi con nhận một câu hỏi user khác nhau, rồi đọc lại response xem luật có đứng vững không. Hành vi: **5/5 đúng ở mọi điểm cốt lõi**. Nhưng chúng bắt được 4 mâu thuẫn trong chính văn bản engine mà cả 3 pass audit thủ công trước đó đều bỏ sót.

**1. `KERNEL_SKELETON.md` tự mâu thuẫn, cách nhau 4 dòng.** Khối mới thêm nói *"chỉ khi cần chạy workflow deliverable. Tra cứu nhanh thì không đọc"*; mục "Cách dùng file này" điểm 1 ngay dưới vẫn nói *"Agent scan file này đầu session"*. Lỗi của tôi khi thêm luật gate mà không rà phần cũ trong cùng file. Đã sửa điểm 1.

**2. `OUTPUT_MASTER.md` cùng bệnh, 3 chỗ.** `system_prompt.md` mục 1, `KERNEL_SKELETON.md` mục OUTPUT_MASTER, và chính `OUTPUT_MASTER.md` dòng 5 đều ghi "Đọc đầu session" — trong khi `system_prompt.md` mục 5.8 chốt chỉ áp khi compose deliverable cuối. Phiên tra cứu nạp glossary là phí. Đã đổi cả 3 thành "khi sắp compose deliverable".

**3. `K_sector_framework` — trigger tự mâu thuẫn.** Dòng đầu ghi *"không tự activate"*, bốn dòng dưới lại ghi *"Standalone: khi user hỏi phân tích sâu ngành X"*. Giải quyết bằng cách nói rõ điều mà cả hai vế đều bỏ sót: **đây là K pack, luật gate chỉ chặn P/O** — nên pull standalone ở chế độ tra cứu là hợp lệ, miễn không sinh deliverable file.

**4. Nhãn `[LEGACY]` chưa từng tồn tại trong repo.** `CLAUDE.md` mục 6 và `README` mục 8.1 đều chỉ định dùng "section đánh dấu `[LEGACY]`" làm style baseline khi render. Verify: `git log -S"[LEGACY]"` trên toàn lịch sử = **rỗng**; baseline rev 7 = 0 lần. Nhãn này là tàn dư mô tả từ rev 6 tiền-git, và tôi đã nhân bản nó sang README khi sửa mục 8.1.

Đi kèm là một sai sót nghiêm trọng hơn: 3 chỗ khẳng định `O_weekly_overview_00` có spec pptx/docx, thực tế file đó có **đúng 1 chữ "pptx"** và nó trỏ ngược về `system_prompt.md` mục 4 — mà mục 4 lại trỏ ngược về "O pack có render spec". **Tham chiếu vòng tròn, không có layout nào.**

Kiểm đủ 10 file O pack thay vì kết luận vội (lần sửa đầu tôi đã viết sai thành "không O pack nào có spec"):

| O pack | Spec layout binary |
|---|---|
| `O_invest_memo_*` | **Có thật** — bảng slide 15-20 slide ở `_02`, docx/pptx layout ở `_00`/`_01`/`_03`/`_05` |
| `O_weekly_overview_00` · `O_vbse_strategy_00` · `O_stock_report_00` | **Không có** — 0 lần nhắc "slide" |

`system_prompt.md` mục 4 nguồn (1) nay có bảng hiện trạng này; ba pack thiếu spec thì phải hỏi style user theo Bước 2, không đoán.

**Bài học:** ba pass grep thủ công không bắt được lỗi nào trong bốn lỗi trên, vì grep tìm được thứ mình nghĩ ra để tìm. Subagent đọc như người dùng thật thì vấp phải mâu thuẫn một cách tự nhiên. Với thay đổi kiến trúc, chạy audit bằng subagent là bước nên có, không phải tuỳ chọn.

## 2026-07-28 — Dọn tàn dư runtime Claude Desktop trong engine (rev 8, pass cuối)

**Phạm vi:** 17 file. Lượt trước ghi "chưa dọn, cố ý"; user yêu cầu dọn hết trước khi vào việc thật. Phân loại kỹ vì phần lớn chữ "upload" là **đúng** — user gửi BCTC PDF qua chat vẫn là luồng hiện hành, không đụng.

**Nhóm 1 — chỉ thị hành vi SAI (nặng nhất).** Hai pack ra lệnh agent không được lưu file:
- `P_vbse_strategy_00` mục 2 và `P_weekly_overview_00` mục 2: *"agent KHÔNG lưu file qua session. User tự archive"* → nay agent ghi carrier MD vào `outputs/md/...` kèm front-matter + dòng INDEX.
- Kéo theo: chỗ nào bảo "user upload báo cáo N-1 / W-1 / monthly active" nay đổi thành **tra `outputs/INDEX.md` trước**, chỉ khi kho chưa có mới yêu cầu upload. Sửa ở `P_vbse_strategy_00/07`, `P_weekly_overview_00`. Trực tiếp phục vụ Stage 0 (`P_vbse_strategy` cần N-1, `P_weekly_overview` cần W-1) — trước đây mâu thuẫn với `CLAUDE.md` mục 3.

**Nhóm 2 — `system_prompt.md` execution loop trái luật gate.** Bước 1 cũ là *"Đọc `KERNEL_SKELETON.md` nếu chưa đọc trong session"* — tức mọi câu hỏi, kể cả tra cứu giá, đều nạp chỉ mục pack. Ngược hẳn luật gate vừa lập ở `CLAUDE.md` mục 3. Loop mới: **phân loại intent trước**, tra cứu thì bỏ qua chỉ mục pack luôn. Ghi tương ứng ở `KERNEL_SKELETON.md` đầu file. Đây là chỗ luật gate thực sự có hiệu lực — không có nó thì gate chỉ nằm trên giấy.

**Nhóm 3 — wording "project knowledge" / "Claude Desktop".** 14 chỗ mô tả cơ chế lưu file của runtime cũ. Đổi sang đường dẫn kho thật: state file tier 0-7 của `P_invest_memo` nằm ở `outputs/md/invest_memo/<YYYY-MM>_cycle/`, tier sau đọc trực tiếp file tier trước. Mục "Setup project knowledge" đổi thành "File cần đọc".

**Bắt được nhân tiện:** `P_vbse_strategy_00` và `P_weekly_overview_00` ghi `K_agent_db` có **6 file `_00`–`_05`**; thực tế **7 file `_00`–`_06`** (`_06` phase & danh mục thêm ở v2). Đã sửa.

**Không đụng:** 4 chỗ "xuất block trong message" ở `P_vbse_strategy_00/07` — đó là **checkpoint block** trình user duyệt giữa stage, bản chất hội thoại, không phải deliverable. Hành vi vẫn đúng.

## 2026-07-28 — Audit rev 8: gỡ 5 chỉ thị "render binary out of scope" trong engine

**Phát hiện khi audit sau khi đã đóng rev 8.** Sửa README mục 8.1 và CLAUDE.md mục 6 ở commit trước là chưa đủ — mâu thuẫn còn sống **bên trong engine**, ở dạng chỉ thị hành vi chứ không phải mô tả.

Năm chỗ ra lệnh cho agent từ chối render:

- `KERNEL_SKELETON.md` dòng 234 (mô tả pack `O_stock_report`)
- `O/O_stock_report_00.md` dòng 9 và 517
- `P/P_stock_report_00.md` dòng 164
- `P/P_stock_report_04.md` dòng 444 (mục 4.5 Render output channel)

**Vì sao nghiêm trọng hơn mâu thuẫn ở README:** đây không phải wording lỗi thời vô hại. `system_prompt.md` mục 9 nói *"User yêu cầu render binary: chạy workflow render binary — **không từ chối**"*, còn `O_stock_report_00` dòng 9 nói *"out of scope"*. Hai chỉ thị ngược nhau trong cùng một engine, và pack file được đọc **sau** system prompt nên nhiều khả năng thắng. Kết quả thực tế sẽ là agent từ chối render đúng lúc user cần.

Đã đổi cả 5 sang "trong scope", kèm đường dẫn ghi file mới (`outputs/md/`, `outputs/pptx|docx/`, copy sang `outputs/sent/`) và trỏ về `CLAUDE.md` mục 6.

**Bài học ghi lại:** sửa mâu thuẫn ở tầng doc (CLAUDE.md, README) không tự động sửa tầng engine. Lần sau đổi một quyết định kiến trúc, phải grep chính từ khoá của quyết định đó (`out of scope`, `không hỗ trợ`, `không render`) trên toàn `engine/`, không chỉ trên doc.

**Không đụng:** wording "project knowledge" / "Claude Desktop" còn ~11 chỗ trong P/O packs. Chúng mô tả cơ chế lưu file cũ, **không chặn hành vi** — agent theo `CLAUDE.md` mục 4 vẫn ghi đúng chỗ. Khác bản chất với 5 chỗ trên. Xem README mục 10.

## 2026-07-28 — Tái cấu trúc workspace rev 8 (A2-A4, B1-B2)

**Phạm vi:** cấu trúc thư mục, luật vận hành, tooling. Spec: `_ops/specs/2026-07-28-tai-cau-truc-workspace-design.md`.

**A2 — xoá thứ không còn lý do tồn tại.** `_ops/check_sync.sh` + `_ops/sync_baseline/` (6 diff): chỉ phục vụ đồng bộ 2 bản knowledge, không còn 2 bản. `agent_marketing/` + `brand/`: vỏ rỗng, mỗi thư mục đúng 1 file README, sinh cùng giả định Desktop Project đã bị bác. Verify trước khi xoá `brand/`: mode "default branded" của `O_weekly_overview_00` dùng placeholder `[TÊN CÔNG TY]` điền từ pre-flight, không đọc `brand/` — xoá an toàn.

**A3 — `agent_analyst/` → `engine/`.** Dùng `git mv` nên lịch sử từng file giữ được (`git log --follow` truy tới commit baseline). Lý do đổi: `CLAUDE.md` mục 1 vốn đã dùng từ "ENGINE" cho đúng tầng này; sau khi gộp còn một engine nên thư mục mang đúng tên kiến trúc.

**A4 — viết lại CLAUDE.md + README.** Thay đổi luật đáng chú ý:
- **Luật gate mới** (CLAUDE.md mục 3): mặc định mọi query là inline lookup; activate P/O pack chỉ khi có ý định deliverable tường minh; tiền tố `tra nhanh:` ép inline. Đây là thứ thay thế cách ly vật lý cũ giữa 2 agent.
- **`outputs/` thành 4 cây** `md/ pptx/ docx/ sent/`, đường dẫn và basename gương nhau. `sent/` là bản user sửa tay trước khi gửi khách.
- **Ngoại lệ đầu tiên của luật 2.1** (AI là người ghi duy nhất): user được sửa nội dung file trong `outputs/sent/`. Kèm mục 2.2 nói rõ đó không phải bất thường.
- **Re-render không bao giờ chạm `sent/`** (mục 6). Trước đây luật là "MD là source of truth, không edit binary trực tiếp" — sai với thực tế vì user luôn chỉnh tay pptx/docx trước khi gửi.
- `pptx/` `docx/` vào `.gitignore`: bản máy sinh lại được; bản không tái tạo được nằm ở `sent/`. Giải luôn bài toán phình repo do ZIP không delta được.
- **Sửa mâu thuẫn README mục 8.1 ↔ CLAUDE.md mục 6:** README nói render binary out of scope (rev 6), CLAUDE.md nói in scope kèm quy trình. Chốt lại: **in scope**, điều kiện là "filesystem + thư viện Python" chứ không phải "+ skill". Nhãn `[LEGACY]` trên 16 section O pack nay đọc là "reference spec", không phải "đã bỏ".
- Mục 9 chuyển thành bảng có `since:` / `review:` cho từng ghi chú môi trường — phần thối nhanh nhất.

**B1 — PreToolUse hook.** `.claude/hooks/block-git-rewrite.ps1` chặn `git commit --amend`, `git rebase`, `git push --force` (CLAUDE.md mục 7.4). Test 11/11 pass trên Windows PowerShell 5.1, kiểm cả hai chiều: case phải chặn và case không được chặn nhầm (`git log --grep="rebase"`). `.claude/settings.json` tracked để hook đi theo repo; `.claude/settings.local.json` gitignore.

**B2 — `_ops/GOTCHAS.md`.** Khung + entry đầu tiên: hook fail-open khi script `.ps1` chứa ký tự ngoài ASCII.

**Lệch so với spec, ghi lại để khỏi tin nhầm số cũ:**
- A3 spec ước 9 tham chiếu `agent_analyst` trong 5 file pack; thực tế **2** (`K_agent_db_00` dòng 140, `P_stock_report_00` dòng 200). Con số 9 đến từ grep gộp cả `KERNEL_SKELETON`/`OUTPUT_MASTER`.
- Bỏ hạng mục C15 của spec (thêm cờ `rendered`/`hand-edited`/`sent` vào front-matter `derived`). Vị trí thư mục đã mang đúng thông tin đó — thêm cờ là dư.

**Chưa làm, cố ý:** wording "user copy/save thủ công" còn rải rác trong P/O packs (tàn dư runtime Claude Desktop). Nằm ngoài phạm vi "cấu trúc + dọn trùng lặp" và không gây lỗi runtime vì agent theo `CLAUDE.md` mục 4 để biết ghi ở đâu. Dọn ở pass sau, khi chạy báo cáo thật và biết chỗ nào thực sự vướng. Xem README mục 10.

## 2026-07-28 — Mục lục section cho 2 file K lớn (rev 8, B3)

**Lý do:** `K_agent_db_05` 127 KB và `K_agent_db_04` 73 KB — mỗi file là một "chunk" chiếm tới ~1/6 context window. Đọc trọn file cho một câu hỏi chỉ cần một mục là mất luôn khả năng chọn lọc mà kiến trúc flat progressive disclosure sinh ra để có. Không tách file (đụng cấu trúc pack, không đáng); chỉ thêm bảng "đọc khi nào" ở đầu để session đọc lát cắt.

- `K/K_agent_db_04.md`: thêm mục lục 7 mục A-F + ghi chú D6 là canonical cho câu hỏi đắt/rẻ.
- `K/K_agent_db_05.md`: thêm mục lục 12 mục, chia theo loại tin để định vị nhanh.
- Không đổi nội dung methodology nào.

## 2026-07-28 — Gộp `agent_db` vào engine chính (rev 8, A1)

**Lý do:** runtime chỉ còn filesystem (Claude Code / Cowork), bỏ Claude Desktop Project. Luật "2 agent độc lập 100%" sinh ra từ ràng buộc Desktop Project (mỗi project upload knowledge riêng, không share file được) — ràng buộc mất thì duplication thành chi phí thuần. Khảo sát 6 file baseline cho thấy 27/29 khác biệt chỉ là con trỏ cross-reference, chỉ 2 khác biệt ngữ nghĩa thật. Spec: `_ops/specs/2026-07-28-tai-cau-truc-workspace-design.md`.

- `agent_analyst/system_prompt.md`: thêm **mục 11 Persona, audience & tone nền** (bê từ `agent_db/system_prompt.md` mục 1–2). Đặt ở cuối, KHÔNG renumber — tránh vỡ 12 cross-ref nội bộ và tham chiếu từ pack. Sửa mục 1, mục 6, mục 10 để trỏ tới mục 11 (trước đó cả 3 chỗ đều khai "không chứa tone").
- `agent_analyst/system_prompt.md` mục 5.4: chốt **Rule 4 bản NỚI** — mặc định nêu giả định rồi trả lời, chỉ clarify khi có ≥2 cách hiểu dẫn tới kết luận khác nhau hoặc gặp biệt danh không đoán được. Trước đây 2 bản knowledge mâu thuẫn nhau ở điểm này.
- `K/K_agent_db_00.md` mục 1 + 4.2 + 4.4: **audience thành tham số** (analyst nội bộ mặc định / NĐT cá nhân — KH), thay vì hằng số "analyst nội bộ" chốt cứng. Đồng bộ mục 4.2 theo Rule 4 bản nới.
- `K/K_agent_db_03.md`: đồng bộ Rule 4 ở bảng rule đầu file + nguyên tắc rút ra của Case 7.
- **Xoá `agent_db/`** (7 file). 27 cross-ref trong `K_agent_db_01..06` đã trỏ về `K_agent_db_00` nên không phải sửa cross-ref nào.
- Lưu ý: `K_agent_db_*` GIỮ NGUYÊN TÊN — `agent_db` ở đây là tên database MongoDB đang vận hành (verify 2026-07-28: 35 collection, 122 MB), không phải thư mục vừa xoá.

## 2026-07-22 — Khởi tạo git (chuẩn hoá cuối trước vận hành)

- `git init` branch `main`, config repo-local: user Finext <finext.vn@gmail.com>, `core.autocrlf false`, `core.fileMode false`. Chưa có remote — lập khi user yêu cầu.
- `.gitattributes`: ép LF cho text, đánh dấu binary (pdf/png/docx/pptx/xlsx/font). `.gitignore`: chỉ temp Office/OS; conflict copy OneDrive cố ý KHÔNG ignore để lộ trong `git status` như bất thường.
- Quy tắc làm việc git ghi tại `CLAUDE.md` mục 7: status sạch đầu session, 1 lượt việc = 1 commit (report/intake/engine/ops/fix), không rewrite history, caveat OneDrive 1 máy 1 session.
- Initial commit: baseline toàn bộ workspace sau rev 7 + hygiene pass.

## 2026-07-22 — Port ghi chú phase_trading sang agent_db_03 + hygiene pass (user duyệt)

- `agent_db/agent_db_03.md` dòng 105: thêm qualifier "cho kịch bản chỉ số" + ghi chú "(sổ backtest `phase_trading` là của hệ phase danh mục — KHÔNG dùng làm base rate cho xác suất kịch bản chỉ số)" — port từ `K_agent_db_03`, đóng mục "Phát hiện chờ xử lý" ở entry dưới.
- Hygiene pass toàn workspace: không BOM, mọi file kết thúc newline — sạch sẵn, không phải sửa gì.
- `check_sync.sh --rebase`: baseline mới db_03 còn 29 dòng khác có chủ đích (trước 31); verify OK cả 6 file.
- **Nếu còn dùng Claude Desktop Project "DB Agent": cần re-upload `agent_db_03.md`.**

## 2026-07-22 — Tái cấu trúc workspace (rev 7)

**Phạm vi:** cấu trúc thư mục + chuẩn hoá, KHÔNG sửa nội dung pack nào.

- Chia `agent_analyst/` thành 3 tầng `K/` (8 file), `P/` (30 file), `O/` (10 file); 3 file meta giữ ở gốc (`system_prompt`, `KERNEL_SKELETON`, `OUTPUT_MASTER`). Cross-reference trong pack là tên trần, không có path → không sửa nội dung.
- Tạo tầng kho: `outputs/` (+ `INDEX.md`), `inputs/` (bctc/, external/), `brand/`, `agent_marketing/` (stub), `_ops/`.
- Chuẩn hoá line-ending: 44 file md có CRLF → LF toàn bộ workspace.
- Tạo `_ops/check_sync.sh` + baseline `_ops/sync_baseline/db_01..06.diff` (chốt khác biệt có-chủ-đích giữa 2 bản knowledge: prefix cross-ref, số mục system_prompt, audience wording).
- Tạo `CLAUDE.md` (router + governance: AI là người ghi duy nhất, luồng intake chuẩn hoá trước khi lưu, báo bất thường không tự xử).
- Phát hiện chờ xử lý: `K_agent_db_03` dòng ~105 có ghi chú "sổ backtest `phase_trading` không dùng làm base rate kịch bản chỉ số" mà `agent_db_03` không có — nghi sync miss, đã báo user, chưa port (baseline hiện chấp nhận trạng thái này; port xong phải `--rebase`).
