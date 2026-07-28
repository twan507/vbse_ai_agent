---
type: invest_memo_tier0
date: 2026-07-28
inputs:
  - outputs/md/invest_memo/2026-08_cycle/tier0_20260728_draft.md
  - inputs/external/20260717_VBSE_dinh-gia-thi-truong-PE-PB.pptx
  - inputs/external/20260722_VBSE_nghien-cuu-nang-hang-FTSE.docx
  - "agent_db (query 2026-07-28)"
derived: []
status: final
---

# Tier 0 confirmed — Gate vĩ mô 28/07/2026

Bản chốt sau Checkpoint 1. **Regime do user override**, không phải kết luận gốc của agent — chi tiết và lý do ở `audit_overrides.md` cùng thư mục.

Toàn bộ phần nghiên cứu nền — định giá P/E và P/B gồm/loại nhóm Vingroup kèm phân vị, thống kê mùa vụ tháng 8 giai đoạn 2020-2025 cho 8 chỉ số và 24 ngành, và phần nâng hạng FTSE đầy đủ kèm tiền lệ quốc tế — nằm ở `tier0_20260728_draft.md`. File này không lặp lại, chỉ chốt đầu ra để Tier 1 dùng.

## 1. Regime đã chốt

**Risk-on selective.**

| Tham số | Giá trị |
|---|---|
| Quota | **3 ngành × 3 mã** |
| Cash buffer | **30%** — chọn đầu trên của dải 20-30% |
| Tiêu chí Tier 2-3 | Khắt khe hơn mặc định, yêu cầu cao hơn ở Funnel B (cơ bản) và Funnel C (catalyst) |
| Luận điểm chủ đạo | Bắt đáy có chọn lọc trên nền định giá phân vị dưới 2% |

**Vì sao cash buffer ở đầu trên dải.** Agent đề xuất gốc là Defensive only vì đợt giải chấp đòn bẩy chưa kết thúc. User override sang selective. Giữ buffer ở 30% thay vì 20% là cách dung hoà: chấp nhận luận điểm bắt đáy nhưng vẫn chừa dư địa mua thêm nếu thị trường thủng sâu hơn. Rủi ro lớn nhất của việc bắt đáy giữa chu kỳ giảm đòn bẩy không phải sai hướng, mà là **hết đạn trước khi đúng**.

## 2. Ba điều kiện huỷ, kiểm tra hàng tuần

Regime selective này **không vô điều kiện**. Chạm bất kỳ điều nào thì hạ về Defensive only hoặc Đứng ngoài, không chờ hết chu kỳ:

1. VNINDEX mất mốc **1.600 điểm** kèm khối lượng tăng — hiện 1.680,62, tức đệm khoảng 4,8%
2. Tỷ giá bán vượt trần biên độ **26.557** buộc Ngân hàng Nhà nước điều chỉnh biên độ hoặc tỷ giá trung tâm mạnh — hiện 26.520, tức đệm 37 đồng
3. Fed tăng lãi suất ngoài dự kiến, hoặc Mỹ mở rộng thuế Section 301 sang nhóm hàng chủ lực khác của Việt Nam

Ba dấu hiệu xác nhận đáy đã hình thành, dùng để cân nhắc nâng lên Risk-on full hoặc giảm cash buffer về 15-20%:

1. Khối ngoại bán ròng tuần dưới **2.000 tỷ VND** hai tuần liên tiếp, hoặc chuyển mua ròng — hiện tuần gần nhất −6.472 tỷ, còn xa
2. Số mã tăng vượt số mã giảm ở 3 trên 5 phiên liên tiếp, không còn mã giảm sàn theo cụm
3. Không có phiên giảm quá 2% kèm khối lượng vượt bình quân 20 phiên, trong hai tuần

## 3. Bảng catalyst active

Đầu vào trực tiếp cho Funnel C ở Tier 1. Mười catalyst, chỉ cấp ngành trở lên; catalyst cấp doanh nghiệp quét ở Tier 2.

| Catalyst | Loại | Timing | Điểm | Ngành hưởng lợi | Ngành bất lợi |
|---|---|---|---|---|---|
| Fed xoay hawkish, dự phóng lãi suất cuối 2026 nâng từ 3,4% lên 3,8% | 1 | 0-6 tháng | 3 | — | Toàn thị trường, nặng nhất nhóm nhạy tỷ giá và vay USD |
| Thuế Section 301 bổ sung 12,5%, hiệu lực 24/07/2026 | 2 | Đã hiệu lực, tác động Q3-Q4 | 3 | — | Chế biến Thủy sản, Dệt may Xuất khẩu |
| Giải chấp đòn bẩy từ nền dư nợ margin 418.725 tỷ (+50,2% YoY) | 1 | Đang diễn ra, 0-2 tháng | 3 | — | Toàn thị trường, nặng nhất nhóm đầu cơ thanh khoản cao |
| Việt Nam rời FTSE Frontier trong một đợt duy nhất, tháng 9/2026 | 1 | 0-2 tháng | 2 | — | Chính nhóm mã trong rổ FTSE Việt Nam |
| Nâng hạng FTSE đợt 1 hiệu lực 21/09/2026, dòng thụ động ròng 3.371 tỷ | 1 | 0-2 tháng | 2 | Chứng khoán, Ngân hàng, BĐS vốn hoá lớn | — |
| Dư địa tín dụng nửa cuối năm, tín dụng +7,86% so mục tiêu ~15% | 1 | 0-5 tháng | 2 | Ngân hàng, Thi công Xây dựng, BĐS | — |
| Áp lực tỷ giá, giá bán 26.520 sát trần biên độ 26.557 | 1 | 0-3 tháng | 2 | — | Nhóm nợ USD, nhập khẩu nguyên liệu |
| Mùa công bố kết quả kinh doanh quý 2/2026 | 1 | 0-1 tháng | 2 | Nhóm có lợi nhuận vượt kỳ vọng | Nhóm hụt kỳ vọng |
| Hy Lạp rời FTSE Emerging đúng 21/09/2026, giải phóng trọng số | 1 | 0-2 tháng | 2 | Nhóm mã FTSE Việt Nam | — |
| Giá dầu Brent dự báo bình quân 86 USD/thùng quý 3 | 3 | 0-3 tháng | 2 | Dịch vụ Dầu khí | Vận tải Kho bãi, nhóm chi phí năng lượng cao |

Ba catalyst 3 điểm đều là catalyst **tiêu cực**. Đây là điều Tier 1 phải cân khi xếp hạng Funnel C — không có catalyst tích cực nào đạt 3 điểm ở chu kỳ này.

## 4. Flags bối cảnh cho Tier 1

### 4.1. Ngành ứng viên — giao thoa định giá rẻ và mùa vụ tháng 8 thuận

Đây là **danh sách ứng viên, không phải danh sách đã chọn**. Tier 1 chạy đủ Funnel B, C, D rồi mới chốt 3 ngành.

| Ngành | P/B (phân vị 3Y) | P/E (phân vị 3Y) | Mùa vụ T8 | Ghi chú cho Tier 1 |
|---|---|---|---|---|
| Hóa chất Phân bón | 1,10 (0,6%) | 7,56 (14,7%) | +12,74% · 6/6 | Mạnh nhất cả hai trục. Cầu nội địa, ít lộ thuế Section 301 |
| BĐS Khu công nghiệp | 1,40 (0,6%) | 13,61 (1,3%) | +6,70% · 6/6 | Định giá đáy, mùa vụ nhất quán. ⚠ Câu chuyện FDI có thể bị Section 301 làm nguội |
| Tài chính ngân hàng | 1,36 (3,8%) | 8,69 (16,0%) | +7,28% · 5/6 | Thanh khoản tốt nhất, hưởng dư địa tín dụng ~7 điểm %, có mặt trong rổ FTSE |
| Thi công Xây dựng | 0,63 (0,6%) | 7,65 (0,6%) | +9,46% · 4/6 | Dưới giá sổ sách. Gắn đầu tư công |
| Vận tải Kho bãi | 1,40 (1,3%) | 10,45 (6,4%) | +9,69% · 5/6 | ⚠ Chịu chi phí dầu, Brent dự báo 86 USD/thùng Q3 |

### 4.2. Loại hoặc hạ nặng bất kể định giá

- **Chế biến Thủy sản** — chịu thuế Section 301 trực tiếp và nặng nhất. Chênh 2,5 điểm phần trăm so với tôm Ấn Độ, Ecuador, Indonesia là mất thị phần thật.
- **Dệt may Xuất khẩu** — vừa chịu Section 301, vừa có mùa vụ tháng 8 âm ba năm liền 2023, 2024, 2025 và chỉ dương 2/6. Định giá rẻ nhất nhì sàn nhưng đây đúng là mẫu bẫy giá trị.
- **Kim loại công nghiệp** — dương 3/6, âm cả 2023, 2024, 2025. Hàng chu kỳ, P/E thấp có thể là dấu hiệu đỉnh lợi nhuận.

### 4.3. Trường hợp cần cân nhắc riêng — Công ty Chứng khoán

Mùa vụ tháng 8 tốt nhất toàn sàn: **dương 6/6 năm, trung bình +15,38%**, không năm nào dưới +7%. Là nhóm hưởng lợi trực tiếp nhất nếu thanh khoản hồi phục và nếu dòng vốn nâng hạng vào thật, với bốn mã trong danh sách dự báo.

Nhưng hai điểm trừ nặng đúng ở chu kỳ này. Thứ nhất, định giá **không rẻ** — P/B 1,63 ở phân vị 48,7%, tức mặt bằng trung tính, không có biên an toàn. Thứ hai và quan trọng hơn: đây chính là nhóm **cho vay margin**, tức là bên chịu trực tiếp rủi ro của đợt giải chấp đang diễn ra. Mua nhóm chứng khoán để bắt đáy trong lúc dư nợ margin đang bị ép giảm là đặt cược ngược vào chính rủi ro mình đang lo.

Đề xuất: nếu Tier 1 muốn lấy nhóm này thì xếp vào Bucket 2 hoặc 3 ở Tier 2, đợi tín hiệu xác nhận đáy ở mục 2 trước, không vào ngay.

### 4.4. Cảnh báo kỹ thuật khi đọc số ở Tier 1

1. **P/E và P/B của BĐS Dân dụng là số gồm Vingroup** — 23,65 và 3,12 ở phân vị 92,3%, trông đắt nhất sàn. Ba trụ Vingroup nằm trong ngành này; bản tham khảo ngày 17/07 cho thấy loại ba trụ ra thì phần còn lại có P/B **0,86**, tức dưới giá trị sổ sách. **Phải tính lại loại ba trụ trước khi loại ngành này khỏi universe.** Đây là việc chưa làm.
2. **Mẫu số P/E của nhóm xuất khẩu là số cũ** — lợi nhuận 4 quý gần nhất chưa phản ánh thuế Section 301 hiệu lực 24/07. Định giá rẻ ở các ngành này có thể là ảo.
3. **Không dùng chuỗi định giá lịch sử làm tín hiệu kiểm định quá khứ** — báo cáo tài chính gán vào ngày kết thúc kỳ, không phải ngày công bố, nên chuỗi có độ lệch 1-2 tháng.
4. **Hai hệ định giá không trộn được** — chuỗi tự tính ở bản draft và chỉ tiêu tổng hợp sẵn trong hệ thống dữ liệu lệch nhau khoảng 5% do khác phạm vi rổ mã. Trong một bảng chỉ dùng một hệ.

### 4.5. Cảnh báo về luận điểm nâng hạng

Nếu Tier 1 hoặc Tier 2 định dùng nâng hạng làm catalyst chính cho một ngành, ba phép chia sau phải được nêu trong lập luận:

- Dòng mua thụ động đợt 1 là 3.371 tỷ VND, bằng khoảng **28%** lượng bán ròng khối ngoại một tháng gần nhất, và **4,1%** lượng bán ròng nửa đầu năm.
- Cấu trúc kỳ cơ cấu tháng 9 là **bán 100% khỏi rổ Frontier so với mua 10% vào rổ Emerging** — bất đối xứng nghịch, giống Pakistan 2017 hơn giống Iceland 2022.
- Bằng chứng học thuật trên 8 sự kiện tương tự: **+23,2%** từ công bố đến hiệu lực rồi **−12,4%** trong 12 tháng sau, và không có cải thiện thanh khoản có ý nghĩa thống kê.

Điểm nghiêng tích cực: mẫu hình tăng mạnh trước ngày hiệu lực **đã không xảy ra** ở Việt Nam — thị trường giảm 12,8% từ đỉnh 18/05 thay vì tăng. Phần bọt mua đón đầu, thứ đã hạ gục Dubai, Qatar và Pakistan sau ngày hiệu lực, phần lớn chưa hình thành hoặc đã bị xả. Đây là lập luận thật cho phía bắt đáy.

### 4.6. Lịch cần bám trong 0-2 tháng

| Ngày | Sự kiện | Việc cần làm |
|---|---|---|
| Đầu 08/2026 | CPI tháng 7 công bố | Kiểm lại giả định lạm phát 4,38% |
| 10/08/2026 | FTSE công bố danh sách theo dõi | Tín hiệu sớm về rổ mã |
| **21/08/2026** | **Tệp chỉ báo FTSE** | Mã ngoài dự báo bị loại có thể chịu áp lực bán nhanh |
| 04/09/2026 | Tệp rà soát cuối cùng | Danh mục chốt |
| **18/09/2026** | **Phiên cơ cấu** | Ba lực đồng thời: quỹ Emerging mua, quỹ Frontier bán, người đón đầu chốt lời |
| 21/09/2026 | Hiệu lực đợt 1 | — |

## 5. Link audit log

`audit_overrides.md` cùng thư mục — hai entry ngày 28/07/2026: override phương pháp (không dùng tầng chỉ báo nội bộ) và override regime (Defensive only sang Risk-on selective).

## 6. Đầu vào Tier 1 đã sẵn sàng

Tier 1 chạy `P_invest_memo_02` với: regime **Risk-on selective**, quota **3 ngành × 3 mã**, bảng catalyst ở Phần 3, danh sách ứng viên và loại trừ ở Phần 4. Ưu tiên xử lý cảnh báo 4.4 mục 1 (tính lại BĐS Dân dụng loại ba trụ Vingroup) trước khi chốt universe.
