---
type: invest_memo_client_report
date: 2026-07-29
inputs:
  - outputs/md/invest_memo/2026-08_cycle/client_report_20260728.md
  - outputs/md/invest_memo/2026-08_cycle/tier0_20260728_draft.md
  - outputs/md/invest_memo/2026-08_cycle/tier0_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/tier1_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/tier2_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/tier3_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/audit_overrides.md
  - inputs/external/20260723_VBSE_bao-cao-CTCK-Q2-2026.docx
  - inputs/external/20260717_VBSE_dinh-gia-thi-truong-PE-PB.pptx
  - inputs/external/20260722_VBSE_nghien-cuu-nang-hang-FTSE.docx
  - "agent_db (query 2026-07-29) — history_stock, history_index, market_recent, stock_nntd"
derived: []
status: final
supersedes: outputs/md/invest_memo/2026-08_cycle/client_report_20260728.md
---

# Báo cáo chiến lược đầu tư — Chu kỳ tháng 8/2026 (bản sửa lần 2)

**Ngày lập:** 29/07/2026 · **Dữ liệu giá chốt:** phiên 28/07/2026
**Thay thế:** `client_report_20260728.md` ngày 28/07/2026
**Khung thời gian khuyến nghị:** 30/07/2026 → 28/08/2026

---

# ĐÍNH CHÍNH — VÌ SAO CÓ BẢN NÀY

Bản ngày 28/07 có **ba lỗi phương pháp**, và ba lỗi đó dẫn tới **danh sách khuyến nghị sai ở cả ba ngành**. Bản này sửa cả phương pháp lẫn danh sách. Phần vĩ mô và chọn ngành (Phần I–II) giữ nguyên vì không bị ảnh hưởng; toàn bộ phần chọn mã, kỹ thuật và kế hoạch tuần được viết lại.

Nêu thẳng ba lỗi trước, vì chúng quan trọng hơn danh sách mới.

## Lỗi 1 — Dòng tiền khối ngoại bị dùng như tiêu chí quyết định, trong khi nó chỉ là thông tin tham khảo

**Bản cũ đã làm gì.** Khối ngoại là một trong sáu tiêu chí chấm điểm (trọng số 1/6), và tệ hơn: ở phần kế hoạch tuần, số liệu **một phiên** và **một tuần** được dùng để quyết định mua hay loại.

Hậu quả cụ thể, đều là quyết định sai:

| Mã | Bản cũ làm gì | Căn cứ | Vì sao sai |
|---|---|---|---|
| **ACB** | Loại hoàn toàn khỏi kế hoạch | Khối ngoại bán ròng 295 tỷ **trong một tuần** | ACB là mã ngân hàng **đứng trên MA200 (+6,2%)** và chỉ cách đỉnh 52 tuần 11,5% — cấu trúc giá tốt thứ tư nhóm |
| **HDB** | Hạ xuống "chưa giải ngân" | Dòng tiền tuần đảo chiều từ +338 tỷ/tháng sang −133 tỷ/tuần | Một tuần đảo chiều không phủ định được gì. Cấu trúc giá của HDB tốt hơn SHB rất xa |
| **SHB** | Đưa vào nhóm lõi, mua ngay phiên đầu 5% | Khối ngoại mua ròng **+92 tỷ trong đúng một phiên** | SHB là mã **xấu nhất nhóm ngân hàng trên mọi thước xu hướng**: −24,2% dưới MA200, −40,5% từ đỉnh 52 tuần, giảm ở cả ba đoạn |
| **KDH** | Đưa vào nhóm lõi, mua từ phiên đầu | Khối ngoại mua ròng **+50 tỷ trong đúng một phiên** (56% giá trị giao dịch) | KDH ở **−37,9% dưới MA200**, −55,5% từ đỉnh, giảm cả ba đoạn. Đây là dao rơi |
| **SSI** | Loại hoàn toàn | Bán ròng 403 tỷ/tuần | SSI có **chất lượng số liệu tốt nhất** trong 8 công ty chứng khoán theo báo cáo chuyên đề quý 2 |

**Nhìn lại thì rõ:** trong năm quyết định trên, **bốn quyết định đảo ngược hoàn toàn khi bỏ trọng số khối ngoại đi**. Một tiêu chí mà khi tháo ra thì bốn phần năm kết luận đổi chiều thì nó không phải tiêu chí phụ — nó đang lái cả báo cáo.

**Vì sao dòng tiền khối ngoại không xứng đáng trọng số đó.** Ba lý do, xếp theo sức nặng:

1. **Nhiễu ở khung ngắn.** Một phiên hoặc một tuần có thể bị chi phối bởi một lệnh thoả thuận, một quỹ cơ cấu, hoặc một giao dịch ETF — không mang thông tin gì về doanh nghiệp. Khối ngoại mua SHB 92 tỷ trong phiên 28/07 chỉ bằng 14% giá trị giao dịch phiên đó của chính mã này.
2. **Tỷ trọng sở hữu nhỏ dần.** Ở thị trường mà nhà đầu tư cá nhân trong nước chiếm phần lớn thanh khoản, khối ngoại là bên tham gia thiểu số trong đa số phiên.
3. **Nó là hệ quả chứ không phải nguyên nhân.** Khối ngoại bán ròng 12.100 tỷ trong tháng gần nhất trên **toàn thị trường** — đó là biến vĩ mô (Fed hawkish, chỉ số USD tăng), không phải đánh giá về từng doanh nghiệp. Dùng nó để phân biệt mã tốt với mã xấu là dùng sai công cụ.

**Sửa thế nào.** Xem Nguyên tắc 2 ở phần dưới.

## Lỗi 2 — Dùng dữ liệu tài chính quý 1/2026 làm cơ sở khuyến nghị, khi số quý 2 đã có

**Bản cũ đã làm gì.** Ghi nhận rõ trong Phần VIII rằng dữ liệu dừng ở quý 1/2026 và nhiều số quý 2 là dự phóng — **rồi vẫn dùng số cũ để chấm điểm và xếp hạng**. Ghi cảnh báo không phải là xử lý cảnh báo.

**Việc lẽ ra phải làm:** dữ liệu trong hệ thống thiếu thì **đi tìm bên ngoài hoặc yêu cầu cung cấp**, và nếu không có thì ghi "chưa đủ cơ sở khuyến nghị" — chứ không thay bằng số cũ ba tháng rồi khuyến nghị như thường.

**Chi phí thật của lỗi này, đo bằng chính báo cáo chuyên đề quý 2 của bộ phận nghiên cứu:**

| Mã | Bản cũ đánh giá | Số quý 2/2026 thật cho thấy |
|---|---|---|
| **VCI** | Nhóm lõi, size 5%, "catalyst duy nhất có ngày bắt đầu và kết thúc" | **Vốn chủ sở hữu GIẢM 872 tỷ dù báo lãi 591 tỷ**, do lỗ đánh giá lại danh mục 1.251 tỷ ghi thẳng vào vốn chủ. ROE 9,8% thấp nhất mẫu. Bị **loại khỏi nhóm khuyến nghị** của báo cáo chuyên đề |
| **VND** | Nhóm lõi, size 5%, mã chứng khoán ưu tiên số một | **Xếp hạng 8/8 — thấp nhất mẫu.** 88% mức tăng lợi nhuận đến từ hoàn nhập dự phòng; phụ thuộc tự doanh 44,5% cao nhất mẫu; **là công ty duy nhất có dư nợ cho vay THU HẸP** (−10,2% từ đầu năm) trong quý toàn ngành mở rộng |
| **SSI** | Loại khỏi kế hoạch | Xếp hạng 5/8 nhưng **chất lượng số liệu tốt nhất mẫu**, khoản một lần chỉ 0,3%, lãi đánh giá lại dương |
| **MBS** | Nhóm lõi — đánh giá đúng | Xếp hạng **2/8**, cơ cấu thu nhập ổn định nhất mẫu, độ lệch biên lợi nhuận 1,9 thấp nhất. **Nhưng bản cũ bỏ sót: EPS 6 tháng GIẢM 20,5%** do pha loãng 52% |

Ba trên bốn mã chứng khoán trong danh sách cũ bị đánh giá sai, và mã bị loại oan lại là mã có chất lượng số liệu tốt nhất.

**Nặng hơn cả bốn trường hợp trên:** ba công ty chứng khoán chất lượng cao nhất theo báo cáo chuyên đề — **VCK (73,3 điểm, cách mã thứ hai 21,2 điểm), TCX, VPX, HCM** — **không hề có mặt trong universe của bản cũ**, dù cả bốn đều niêm yết trên HOSE. Bộ lọc đã bỏ sót chúng vì tiêu chí thanh khoản và tiêu chí khối ngoại, chứ không phải vì chất lượng.

## Lỗi 3 — Khuyến nghị mua cổ phiếu đang trong xu hướng giảm chưa dừng, chỉ vì định giá rẻ và chỉ báo quá bán

Đây là lỗi gốc, và hai lỗi trên là hệ quả của nó.

**Bản cũ lập luận thế này:** ngành rẻ theo phân vị lịch sử → mã trong ngành bị nén sâu → chỉ báo sức mạnh tương đối dưới 20 là quá bán → tỷ lệ phần thưởng trên rủi ro tính tới đường trung bình 20 phiên rất đẹp → mua.

**Chỗ hỏng:** toàn bộ chuỗi đó **không có một bước nào kiểm xem giá đã ngừng giảm hay chưa**. Chỉ báo quá bán trong xu hướng giảm mạnh không phải tín hiệu mua — nó là mô tả của chính xu hướng giảm đó. Một cổ phiếu giảm 55% từ đỉnh có thể quá bán suốt đường đi xuống.

**Bằng chứng trong chính danh sách cũ.** Sáu mã bất động sản được khuyến nghị mua đều nằm ở **−27% đến −40% dưới đường trung bình 200 phiên**, và **cả sáu đều giảm ở cả ba đoạn** khi chia chuỗi 120 phiên thành ba chặng. Không mã nào có dấu hiệu dừng rơi.

| Mã BĐS | Dưới MA200 | Từ đỉnh 52 tuần | Chuỗi 120→60→20→nay |
|---|---|---|---|
| CEO | −39,9% | −64,6% | −12,7% · −10,4% · −24,5% |
| KDH | −37,9% | −55,5% | −11,0% · −10,5% · −21,7% |
| TAL | −35,4% | −49,1% | −9,8% · −11,2% · −25,4% |
| HDG | −33,6% | −50,5% | −5,9% · −10,9% · −22,2% |
| NLG | −29,5% | −54,0% | −6,1% · −0,7% · −21,7% |
| DXG | −27,1% | −52,3% | +1,7% · −8,9% · −17,0% |

**Đọc bảng này rồi khuyến nghị mua cả sáu là sai, không có cách nào bào chữa.** Định giá ngành rẻ hơn cả hai đáy chu kỳ là sự thật, nhưng nó là lý do để **theo dõi**, không phải lý do để **mua khi giá vẫn đang rơi**.

---

# BA NGUYÊN TẮC ĐÃ SỬA

Đây là phần quan trọng nhất của bản này. Ba nguyên tắc dưới đây áp cho toàn bộ phần chọn mã và kế hoạch tuần, và nên áp cho các chu kỳ sau.

## Nguyên tắc 1 — Xu hướng giá là điều kiện CẦN. Định giá và cơ bản là điều kiện ĐỦ.

**Phát biểu:** với vị thế horizon 1–3 tháng, **không mua cổ phiếu chưa có bằng chứng ngừng giảm, bất kể định giá rẻ đến đâu và chỉ báo quá bán đến đâu.**

**Bộ lọc xu hướng, ba tầng — áp trước mọi tiêu chí khác:**

| Tầng | Điều kiện | Kết luận |
|---|---|---|
| **Loại thẳng** | Dưới MA200 quá 20% **và** giảm ở cả ba đoạn của chuỗi 120 phiên | Không mua trong chu kỳ này, bất kể điểm số. Chỉ đưa vào danh sách theo dõi |
| **Chờ xác nhận** | Dưới MA200 từ 0 đến 20%, hoặc giảm ở 2 trên 3 đoạn | Chỉ mua sau khi có **hai tín hiệu**: giá đóng cửa trên MA20 và không tạo đáy mới trong 10 phiên |
| **Mua được** | Trên MA200 **và** không giảm quá 2 trong 3 đoạn | Mua được ngay theo vùng đã định |

**Vì sao dùng MA200 chứ không phải MA20 hay MA50.** MA20 và MA50 phản ứng quá nhanh, nên trong một nhịp bật kỹ thuật chúng cho tín hiệu mua rồi rút lại ngay. MA200 trả lời đúng một câu duy nhất cần trả lời trước khi bắt đáy: **thị trường có còn coi mức giá này là hợp lý theo quan điểm một năm không.** Nó chậm, và chậm là ưu điểm ở đây.

**Vì sao chia chuỗi 120 phiên thành ba đoạn.** Một con số phần trăm thay đổi duy nhất che mất hình dạng đường đi. Chia ba đoạn phân biệt được ba trường hợp mà mức giảm tổng cộng giống hệt nhau: giảm rồi đi ngang (đoạn cuối phẳng — đáng quan tâm), giảm đều liên tục (ba đoạn cùng âm — dao rơi), và giảm rồi hồi rồi giảm tiếp (đoạn giữa dương — bẫy).

**Điều nguyên tắc này KHÔNG nói.** Nó không nói định giá vô dụng. Nó nói định giá quyết định **mua mã nào trong số các mã đã ngừng rơi**, chứ không quyết định **có mua hay không**. Thứ tự hai câu hỏi đó là toàn bộ vấn đề.

## Nguyên tắc 2 — Dòng tiền khối ngoại là thông tin tham khảo, không phải tiêu chí chấm điểm

**Phát biểu:** khối ngoại **bị loại khỏi bộ tiêu chí chấm điểm**. Nó được ghi lại và đọc, nhưng không cộng điểm, không trừ điểm, và **không bao giờ là lý do duy nhất để mua hay loại một mã**.

**Ba quy tắc sử dụng:**

1. **Khung tối thiểu là một tháng.** Số một phiên và một tuần chỉ ghi để tham khảo, **không được dùng làm căn cứ quyết định**. Đây là quy tắc mà bản cũ vi phạm bốn lần.
2. **Chỉ dùng như tín hiệu xác nhận, không dùng như tín hiệu khởi tạo.** Nếu một mã đã đạt bộ lọc xu hướng và bộ lọc cơ bản, thì khối ngoại mua ròng đều là điểm cộng định tính. Nếu mã chưa đạt hai bộ lọc kia, khối ngoại mua bao nhiêu cũng không đủ.
3. **Ngoại lệ duy nhất được coi là tín hiệu mạnh:** bán ròng **liên tục trên ba tháng với quy mô vượt 20% vốn hoá tự do chuyển nhượng**. Đó là thay đổi cấu trúc sở hữu, khác hẳn dao động tuần.

## Nguyên tắc 3 — Không khuyến nghị trên dữ liệu tài chính cũ quá một quý

**Phát biểu:** nếu số liệu mới nhất trong hệ thống đã cũ hơn một kỳ báo cáo so với kỳ gần nhất doanh nghiệp đã công bố, thì **phải đi tìm số mới** — từ công bố thông tin của doanh nghiệp, báo cáo tài chính công bố, hoặc yêu cầu cung cấp. **Không được thay bằng số cũ.**

**Nếu không tìm được số mới:** ghi thẳng **"chưa đủ cơ sở khuyến nghị"** và để mã đó ngoài danh sách. Một mã bị bỏ sót vì thiếu dữ liệu là chi phí nhỏ; một mã được khuyến nghị trên dữ liệu sai là chi phí lớn.

**Ghi cảnh báo không thay được việc xử lý cảnh báo.** Bản cũ ghi rất rõ ở Phần VIII rằng dữ liệu cũ ba tháng và nhiều số là dự phóng — rồi vẫn xếp hạng và cấp tỷ trọng như thể dữ liệu đầy đủ. Phần cảnh báo khi đó chỉ có tác dụng miễn trừ trách nhiệm, không có tác dụng bảo vệ người đọc.

**Phân biệt hai tình huống — nếu không phân biệt thì nguyên tắc này thành cứng nhắc vô ích:**

| Tình huống | Xử lý |
|---|---|
| **A — Số mới ĐÃ CÓ nhưng hệ thống chưa cập nhật** | Đây là lỗi. Phải đi tìm bên ngoài. Đây đúng là trường hợp nhóm công ty chứng khoán: báo cáo tài chính quý 2 đã công bố từ giữa tháng 7 mà bản cũ vẫn dùng số quý 1 |
| **B — Doanh nghiệp CHƯA công bố số mới** | Số cũ là số mới nhất hợp lệ, được dùng — nhưng **phải ghi nhãn kỳ báo cáo ngay cạnh mỗi con số**, và **hạ mức tin cậy** cho tới khi số mới về |

**Áp dụng cho bản này — kết quả tra cứu ngày 29/07/2026:**

- **Nhóm công ty chứng khoán:** tình huống A. Số quý 2/2026 của tám công ty niêm yết HOSE đã có, lấy từ báo cáo chuyên đề nội bộ ngày 23/07/2026 dựng trên báo cáo tài chính đã công bố. **Bản cũ đã sai vì không dùng.**
- **Nhóm ngân hàng:** tình huống B với **năm trên tám mã**. Tính đến 29/07/2026, chỉ **ACB, LPB, MSB** đã công bố kết quả 6 tháng 2026. **MBB, HDB, CTG, SHB, STB chưa công bố báo cáo tài chính quý 2** — mọi con số quý 2 đang lưu hành cho năm mã này là **dự phóng của công ty chứng khoán**, không phải số công bố.

**Hệ quả trực tiếp cho kế hoạch tuần:** năm mã ngân hàng chưa có số quý 2 **không được cấp tỷ trọng đầy đủ trước ngày có báo cáo**. Hạn công bố báo cáo tài chính riêng lẻ rơi vào khoảng 30/07, hợp nhất khoảng 14/08 — tức nằm trọn trong cửa sổ của kế hoạch này. Đây là lý do tuần 3 được đặt làm tuần giải ngân chính thay vì tuần 1.

**Và một quy tắc nhãn bắt buộc từ nay:** mỗi con số tài chính trong báo cáo phải kèm **kỳ báo cáo** và **nhãn [công bố] hoặc [dự phóng]**. Bản cũ trộn hai loại này trong cùng một bảng chấm điểm mà không phân biệt — đó là cách một dự phóng của bên thứ ba trở thành căn cứ cấp tỷ trọng.

---

# PHẦN A — BỘ LỌC XU HƯỚNG ÁP CHO TOÀN BỘ DANH SÁCH

Áp Nguyên tắc 1 cho 24 mã của bản cũ, cộng bốn công ty chứng khoán có mặt trong báo cáo chuyên đề quý 2 nhưng không nằm trong universe cũ (HCM, TCX, VCK, VPX). Dữ liệu giá đóng cửa 28/07/2026.

## A.1. Bảng xếp theo cấu trúc xu hướng

| Mã | Ngành | Giá | vs MA200 | vs MA50 | Từ đỉnh 52T | Chuỗi 120→60→20→nay | Số đoạn giảm | **Tầng** |
|---|---|---|---|---|---|---|---|---|
| **MSB** | NH | 15,90 | **+21,0%** | +3,0% | −3,3% | +6,6 · +22,7 · −0,3 | 1/3 | **Mua được** |
| **LPB** | NH | 53,50 | **+17,9%** | +4,3% | −8,5% | +21,9 · +7,7 · +2,7 | **0/3** | **Mua được** |
| **HCM** | CK | 25,30 | **+17,9%** | — | — | — | — | **Mua được** |
| **VCK** | CK | 28,60 | **+16,5%** | — | — | — | — | **Mua được** |
| **STB** | NH | 72,50 | **+16,3%** | +2,1% | −5,6% | +16,1 · −1,5 · −0,1 | 2/3 | **Mua được** |
| **VPX** | CK | 24,70 | **+11,9%** | — | — | — | — | **Mua được** |
| **ACB** | NH | 22,50 | **+6,2%** | +1,2% | −11,5% | −3,6 · +14,8 · −0,7 | 2/3 | **Mua được** |
| HDB | NH | 25,10 | −3,8% | −3,4% | −16,3% | −1,1 · −3,3 · −5,6 | 3/3 | Chờ xác nhận |
| TCX | CK | 38,10 | −5,0% | — | — | — | — | Chờ xác nhận |
| VND | CK | 16,40 | −7,9% | −6,0% | −38,3% | −8,0 · +11,2 · −8,9 | 2/3 | Chờ xác nhận |
| MBB | NH | 22,15 | −9,9% | −7,2% | −21,9% | −4,4 · −1,8 · −10,2 | 3/3 | Chờ xác nhận |
| IDC | Dự bị | 32,20 | −11,6% | −10,2% | −29,5% | −5,0 · −9,8 · −11,2 | 3/3 | Chờ xác nhận |
| VGC | Dự bị | 35,75 | −15,1% | −9,6% | −42,2% | −16,5 · −0,8 · −12,6 | 3/3 | Chờ xác nhận |
| CTG | NH | 29,00 | −16,2% | −11,7% | −32,3% | −9,0 · −4,3 · −14,0 | 3/3 | Chờ xác nhận |
| MBS | CK | 17,80 | −16,3% | −11,0% | −46,5% | −7,3 · +4,6 · −13,2 | 2/3 | Chờ xác nhận |
| HHV | Dự bị | 9,83 | −17,8% | −8,7% | −39,1% | +1,6 · −9,1 · −9,5 | 2/3 | Chờ xác nhận |
| **SSI** | CK | 23,00 | **−21,7%** | −12,4% | −41,7% | −8,0 · −4,4 · −15,1 | 3/3 | **Loại thẳng** |
| **SHS** | CK | 15,00 | −22,3% | −15,8% | −50,0% | −8,5 · +9,3 · −20,2 | 2/3 | **Loại thẳng** |
| **VCI** | CK | 19,70 | −23,5% | −16,7% | −45,0% | −2,2 · −4,1 · −20,7 | 3/3 | **Loại thẳng** |
| **CTD** | Dự bị | 57,60 | −23,6% | −17,0% | −37,9% | +7,5 · −10,7 · −20,0 | 2/3 | **Loại thẳng** |
| **SHB** | NH | 11,40 | **−24,2%** | −14,3% | **−40,5%** | −9,1 · −2,8 · −16,8 | **3/3** | **Loại thẳng** |
| **DXG** | BĐS | 10,25 | −27,1% | −17,5% | −52,3% | +1,7 · −8,9 · −17,0 | 2/3 | **Loại thẳng** |
| **NLG** | BĐS | 20,60 | −29,5% | −18,6% | −54,0% | −6,1 · −0,7 · −21,7 | 3/3 | **Loại thẳng** |
| **HDG** | BĐS | 16,10 | −33,6% | −19,2% | −50,5% | −5,9 · −10,9 · −22,2 | 3/3 | **Loại thẳng** |
| **VIX** | CK | 12,30 | −35,4% | −24,8% | −64,0% | −4,3 · −4,5 · −27,2 | 3/3 | **Loại thẳng** |
| **TAL** | BĐS | 20,00 | −35,4% | −24,4% | −49,1% | −9,8 · −11,2 · −25,4 | 3/3 | **Loại thẳng** |
| **KDH** | BĐS | 16,95 | **−37,9%** | −20,7% | −55,5% | −11,0 · −10,5 · −21,7 | 3/3 | **Loại thẳng** |
| **CEO** | BĐS | 11,10 | **−39,9%** | −23,3% | **−64,6%** | −12,7 · −10,4 · −24,5 | **3/3** | **Loại thẳng** |

*Bốn mã HCM, VCK, TCX, VPX niêm yết từ tháng 10–12/2025 nên chưa đủ 52 tuần lịch sử để tính các cột đỉnh 52 tuần và chuỗi 120 phiên. Phân tầng dựa trên vị trí so với MA200 khả dụng.*

## A.2. Kết quả lọc — và mức độ nghiêm trọng của sai lệch bản cũ

| Tầng | Số mã | Danh sách |
|---|---|---|
| **Mua được** | 7 | MSB · LPB · HCM · VCK · STB · VPX · ACB |
| **Chờ xác nhận** | 9 | HDB · TCX · VND · MBB · IDC · VGC · CTG · MBS · HHV |
| **Loại thẳng** | 12 | SSI · SHS · VCI · CTD · SHB · DXG · NLG · HDG · VIX · TAL · KDH · CEO |

**Ba điều bảng này nói, và cả ba đều ngược với bản cũ:**

**Một — trong bảy mã "mua được", bản cũ chỉ có ba (MSB, LPB, STB) và trong đó hai mã bị xếp vào nhóm không mua hoặc nhóm giao dịch thuần.** LPB là mã duy nhất bản cũ đánh giá đúng. ACB bị loại hoàn toàn. MSB bị xếp "không mua". STB bị xếp nhóm 3 giao dịch thuần với size 1–2% và lệnh bán trước kỳ nghỉ. Ba trong bảy mã tốt nhất bị đối xử như mã kém nhất.

**Hai — trong mười hai mã "loại thẳng", bản cũ khuyến nghị mua tám mã**, gồm cả bốn mã ở nhóm lõi với tỷ trọng 5% mỗi mã: VCI, KDH, CEO, DXG. Cộng thêm SHB cũng ở nhóm lõi.

**Ba — toàn bộ ngành bất động sản dân dụng nằm ở tầng loại thẳng.** Không có ngoại lệ nào. Sáu trên sáu mã.

## A.3. Vì sao bộ lọc này không mâu thuẫn với luận điểm định giá ở Phần I–II

Phần vĩ mô và chọn ngành của bản cũ **vẫn đúng và được giữ nguyên**: bất động sản dân dụng loại ba trụ Vingroup có P/B 1,07, rẻ hơn cả đáy 2022 (1,54) lẫn đáy 2025 (1,18). Đó là sự thật.

Nhưng hai câu sau đây khác nhau, và bản cũ đã trộn chúng làm một:

- *"Ngành này rẻ hơn cả hai đáy chu kỳ gần nhất"* — đúng, và là lý do để **theo dõi rất sát**.
- *"Vậy nên mua ngay bây giờ"* — sai, vì chưa có gì cho thấy giá đã ngừng rơi.

**Khoảng cách giữa hai câu đó chính là chỗ mất tiền.** Định giá cho biết phần thưởng cuối cùng có đáng không; xu hướng cho biết đã đến lúc chưa. Một mã có thể vừa rẻ nhất lịch sử vừa còn giảm thêm 30% — đó chính là điều đã xảy ra với ngành bất động sản trong 120 phiên vừa qua, khi ngành đã rẻ từ đầu giai đoạn đó.

**Cách xử lý đúng với bất động sản trong chu kỳ này:** giữ nguyên đánh giá ngành, chuyển toàn bộ sáu mã sang **danh sách theo dõi có điều kiện kích hoạt cụ thể** (mục B.3), và **không cấp tỷ trọng nào cho tới khi điều kiện được thoả**. Ngành sẽ rất đáng mua — nhưng sau khi giá ngừng rơi, không phải trước.

---

# PHẦN B — CHỌN MÃ ĐÃ SỬA

## B.1. Tài chính ngân hàng — SHB bị rút, ACB được đưa lên đầu

Đây là thay đổi anh chỉ ra trực tiếp, và dữ liệu xác nhận hoàn toàn.

### B.1.1. Trạng thái dữ liệu — phải đọc trước bảng xếp hạng

Tra cứu ngày 29/07/2026 cho kết quả quan trọng: **chỉ ba trên tám ngân hàng đã công bố kết quả 6 tháng 2026.**

| Đã công bố số 6T/2026 | Chưa công bố BCTC quý 2 |
|---|---|
| **ACB · LPB · MSB** | **MBB · HDB · CTG · SHB · STB** |

Với năm mã chưa công bố, mọi con số quý 2 đang lưu hành trên báo chí là **dự phóng của công ty chứng khoán**. Theo Nguyên tắc 3, năm mã này **không được cấp tỷ trọng đầy đủ** cho tới khi có báo cáo thật — dự kiến 30/07 (riêng lẻ) và 14/08 (hợp nhất).

*Cảnh báo nguồn cụ thể: con số "13.187 tỷ, tăng 31%" đang bị các báo gán lẫn lộn cho cả CTG lẫn HDB. Không dùng con số này cho bất kỳ mã nào cho tới khi đối chiếu báo cáo gốc.*

### B.1.2. Bảng ghép — xu hướng giá và dữ liệu tài chính

| Mã | Tầng xu hướng | vs MA200 | Từ đỉnh 52T | Dữ liệu Q2 | Chất lượng tài sản | **Kết luận** |
|---|---|---|---|---|---|---|
| **ACB** | **Mua được** | +6,2% | −11,5% | **[công bố]** | **NPL 1,03% · LLCR 105%** | **Ưu tiên 1** |
| **LPB** | **Mua được** | +17,9% | −8,5% | **[công bố]** | Chưa công bố NPL/LLCR | **Ưu tiên 2** |
| **MSB** | **Mua được** | +21,0% | −3,3% | **[công bố]** | NPL 1,64% riêng lẻ · CASA ~29% | **Ưu tiên 3 — trừ điểm pha loãng** |
| **STB** | Mua được | +16,3% | −5,6% | **[chưa công bố]** | NPL ~5,6% [ước tính] | **Động lượng thuần, size tối thiểu** |
| HDB | Chờ xác nhận | −3,8% | −16,3% | [chưa công bố] | **LLCR ~43,4% Q1 — thấp nhất nhóm** | Theo dõi |
| MBB | Chờ xác nhận | −9,9% | −21,9% | [chưa công bố] | NPL 1,42% (Q1) | Theo dõi |
| CTG | Chờ xác nhận | −16,2% | −32,3% | [chưa công bố] | **LLCR 163% tại 31/05 — mạnh nhất** | Theo dõi |
| **SHB** | **Loại thẳng** | **−24,2%** | **−40,5%** | [chưa công bố] | **NPL ~3,0% · LLCR 71% (Q1)** | **Rút khỏi danh mục** |

### B.1.3. SHB — vì sao rút, và bản cũ đã sai ở đâu

**Bản cũ xếp SHB vào nhóm lõi, mua 5% ngay phiên đầu tiên của kế hoạch.** Ba căn cứ: khối ngoại mua ròng +92 tỷ trong phiên 28/07 và +46 tỷ trong tuần; thanh khoản số 1 thị trường; catalyst Krungsri hoàn tất giữa quý 3.

**Kiểm lại từng căn cứ:**

**Căn cứ khối ngoại — không hợp lệ theo Nguyên tắc 2.** Khoản mua 92 tỷ là **một phiên**, và bằng khoảng 14% giá trị giao dịch của chính mã đó trong phiên. Số một tháng thực ra là **bán ròng 10 tỷ**. Bản cũ đã chọn đúng khung thời gian ủng hộ kết luận mình muốn.

**Catalyst Krungsri là thật và đang tiến triển** — Ngân hàng Nhà nước đã chấp thuận thủ tục chuyển đổi SHBFinance sang công ty một thành viên khoảng ngày 20/07/2026, dự kiến hoàn tất và thanh toán **giữa quý 3/2026**. Nhưng giá trị thương vụ và mức thặng dư cụ thể **không tra được từ nguồn công khai** — tức đây là catalyst có hướng nhưng **không định lượng được độ lớn**.

**Ba dữ kiện bản cũ bỏ sót, và cả ba đều nặng:**

1. **Xu hướng giá xấu nhất nhóm và xấu nhất một cách rõ rệt.** −24,2% dưới MA200, −40,5% từ đỉnh 52 tuần, giảm ở cả ba đoạn của chuỗi 120 phiên. Mã đứng thứ hai từ dưới lên là CTG với −16,2%. **Khoảng cách giữa SHB và phần còn lại lớn hơn khoảng cách giữa các mã còn lại với nhau.**
2. **Chất lượng tài sản yếu nhất nhóm theo số quý 1 đã công bố:** nợ xấu 16.320 tỷ tăng 12% từ đầu năm, tỷ lệ nợ xấu khoảng **3,0%** — cao nhất trong tám mã sau STB; **tỷ lệ bao phủ nợ xấu chỉ 71%** và đang giảm từ 72%; chi phí dự phòng quý 1 tăng **146,7%** so cùng kỳ.
3. **Pha loãng lớn đã công bố:** kế hoạch phát hành **750 triệu cổ phiếu** nâng vốn điều lệ lên 53.442 tỷ, dự kiến thu trên 10.000 tỷ. Bản cũ có mục riêng liệt kê rủi ro pha loãng của nhóm chứng khoán nhưng **bỏ sót trường hợp này**.

**Không tìm được tin xấu riêng lẻ nào giải thích cú giảm** — không có bê bối, không có cảnh báo từ cơ quan quản lý, không có tin đồn được báo chính thống xác nhận. Nói cách khác, **thị trường đang định giá lại chất lượng tài sản và mức pha loãng chứ không phản ứng với một sự kiện**. Loại giảm này thường kéo dài hơn loại giảm do tin.

**Kết luận:** SHB rút khỏi danh mục. Đưa vào theo dõi với điều kiện kích hoạt: **giá đóng cửa trên MA20 ba phiên liên tiếp, và báo cáo tài chính quý 2 cho thấy tỷ lệ bao phủ nợ xấu đã ngừng giảm.** Catalyst Krungsri không đủ để bù cho ba điểm trên.

### B.1.4. ACB — từ bị loại hoàn toàn lên ưu tiên số một

**Bản cũ loại ACB khỏi mọi tuần của kế hoạch**, với một căn cứ duy nhất: khối ngoại bán ròng 295 tỷ trong một tuần, vượt cả số ròng cả tháng.

Theo Nguyên tắc 2, đó không phải căn cứ để loại. Và số liệu thật cho thấy ACB là mã tốt nhất nhóm:

**Xu hướng giá — tầng mua được.** Đứng trên MA200 6,2%, chỉ cách đỉnh 52 tuần 11,5% — mức sụt nhỏ thứ ba trong tám mã. Chuỗi 120 phiên: **−3,6% · +14,8% · −0,7%** — tức đã tạo đáy quanh đoạn giữa và đi ngang ở đoạn gần nhất, không phải đang rơi.

**Dữ liệu quý 2 đã công bố** — mã duy nhất trong nhóm vừa đạt bộ lọc xu hướng vừa có số thật:

| Chỉ tiêu | Giá trị | Ghi chú |
|---|---|---|
| Lợi nhuận trước thuế Q2/2026 | 5.366 tỷ, **−11,9%** | Giảm do dự phòng tăng 128,9% |
| Lợi nhuận trước thuế 6T/2026 | ~10.735 tỷ, **≈0%** | Đi ngang |
| Thu nhập lãi thuần Q2 | 7.784 tỷ, **+16,5%** | Mảng lõi vẫn tăng tốt |
| NIM Q2 | **3,02%**, tăng 0,2 điểm % so Q1 | Đang mở rộng |
| Tỷ lệ nợ xấu 30/06 | **1,03%** | **Thấp nhất nhóm** |
| **Tỷ lệ bao phủ nợ xấu** | **105%** | Trên 100%, so với 80% toàn ngành |
| Tăng trưởng tín dụng 6T | **+8,6%** | Trên mức chung |

**Và điểm quan trọng nhất — cảnh báo nợ nhóm 2 của bản cũ cần được đọc lại.**

Bản cũ (kế thừa từ tầng sàng lọc) ghi: *"nợ nhóm 2 tăng 93,4% trong 6 tháng — đây là rủi ro có hướng rõ, nợ xấu của 1-2 quý tới"*, và dùng nó làm lý do chính để cảnh giác.

Số liệu chi tiết cho thấy **toàn bộ mức tăng đó hình thành trong quý 1, không phải tích luỹ đều hai quý**:

| Mốc | Nợ nhóm 2 |
|---|---|
| Đầu năm 2026 | 2.493 tỷ |
| 31/03/2026 | **~5.000 tỷ** — đã tăng gấp đôi trong ba tháng |
| 30/06/2026 | **4.822 tỷ** — **giảm nhẹ so với cuối quý 1** |

Tức là **nợ nhóm 2 đã tạo đỉnh trong quý 1 và đi ngang, hơi giảm trong quý 2.** Con số "+93,4% trong sáu tháng" đúng về số học nhưng gây hiểu sai về hướng — nó mô tả một sự kiện đã xảy ra và đã dừng, không phải một xu hướng đang tiếp diễn.

**Phần cảnh báo còn nguyên giá trị:** áp lực đã dịch chuyển xuống nhóm dưới — nợ nhóm 3 tăng 76,6%, nhóm 4 tăng 74% — và dự phòng quý 2 tăng từ 463 tỷ lên 1.060 tỷ, là nguyên nhân chính khiến lợi nhuận trước thuế quý 2 giảm 11,9%. Nhưng với **bao phủ nợ xấu 105%**, ngân hàng có bộ đệm để hấp thụ phần đó, khác hẳn SHB ở mức 71%.

**Kết luận:** ACB lên **ưu tiên 1 nhóm ngân hàng**. Đây là mã duy nhất trong toàn bộ 28 mã khảo sát đồng thời có: xu hướng giá còn nguyên, số quý 2 đã công bố, và chất lượng tài sản tốt nhất nhóm.

### B.1.5. LPB và MSB — xu hướng tốt nhất, nhưng mỗi mã một điểm trừ thật

**LPB — cấu trúc giá tốt nhất trong toàn bộ 28 mã.** Chuỗi 120 phiên **+21,9% · +7,7% · +2,7% — không đoạn nào giảm**, mã duy nhất đạt được điều đó. Đứng trên MA200 17,9%, chỉ cách đỉnh 52 tuần 8,5%. Tín dụng 6 tháng tăng 9,6% [công bố].

Hai điểm trừ giữ nguyên từ bản cũ và vẫn đúng:
- **Lợi nhuận trước thuế 6 tháng giảm 3,1%** — 5.973 tỷ so với 6.163 tỷ cùng kỳ [công bố]. Giá tăng trong khi lợi nhuận giảm là cấu hình cần theo dõi.
- **P/B 3,23, gấp khoảng 2,4 lần trung bình ngành 1,36.** Đây là mã ngân hàng đắt nhất nhóm. Mua LPB là mua động lượng và chất lượng vận hành, **không phải mua rẻ**.

**MSB — mã đứng cao nhất so với MA200 trong nhóm (+21,0%) và gần đỉnh 52 tuần nhất (−3,3%).** Lợi nhuận 6 tháng trên 3.400 tỷ, tăng khoảng 8% [công bố]; nợ xấu 1,64% riêng lẻ; CASA gần 29% — mức tốt.

**Điểm trừ mới, bản cũ không có và nó đủ nặng để hạ một bậc:** Ngân hàng Nhà nước đã chấp thuận cho MSB **tăng vốn điều lệ từ 31.200 tỷ lên tối đa 37.440 tỷ, phát hành 624 triệu cổ phiếu tỷ lệ 20% cho cổ đông hiện hữu** [công bố]. Đây là pha loãng 20% nằm trong hoặc sát horizon của kế hoạch.

Bản cũ có hẳn một mục liệt kê rủi ro pha loãng nhưng chỉ soi nhóm chứng khoán. **Áp cùng tiêu chuẩn đó cho nhóm ngân hàng thì MSB và SHB đều phải bị trừ điểm.**

### B.1.6. STB — nghịch lý giá mạnh trên nền lợi nhuận sụp

STB đạt bộ lọc xu hướng: trên MA200 16,3%, cách đỉnh 52 tuần chỉ 5,6%.

Nhưng dữ liệu cơ bản đi ngược hoàn toàn:
- **Chưa công bố báo cáo tài chính quý 2.** Ước tính 6 tháng khoảng 1.900–2.000 tỷ, **giảm khoảng 50%**.
- **Nợ xấu ước tính khoảng 5,6%** — cao nhất trong tám mã.
- Luận điểm phụ thuộc việc Ngân hàng Nhà nước duyệt đấu giá 32,5% cổ phần liên quan xử lý nợ — **chưa có ngày**.

**Đây là trường hợp ngược với SHB và cần được gọi đúng tên: giá đang giữ rất tốt trong khi lợi nhuận có thể giảm một nửa.** Có hai cách giải thích — thị trường đang định giá trước việc xử lý xong khối nợ tồn đọng, hoặc giá chưa phản ánh kết quả sắp công bố. **Không phân biệt được hai khả năng đó trước khi báo cáo tài chính quý 2 ra.**

**Xử lý:** STB chỉ được cấp **size tối thiểu như một vị thế động lượng**, và **đánh giá lại ngay khi có báo cáo quý 2**. Không nâng size trước ngày đó trong mọi trường hợp.

### B.1.7. Ba mã ở tầng chờ xác nhận

**HDB** — trên hai điểm anh nêu, dữ liệu ủng hộ một phần. Xu hướng giá của HDB (−3,8% dưới MA200) **tốt hơn SHB rất xa** (−24,2%), đúng như anh nói. Nhưng HDB chưa đủ điều kiện mua vì hai lý do riêng: chuỗi 120 phiên **giảm cả ba đoạn**, và **tỷ lệ bao phủ nợ xấu hợp nhất quý 1 chỉ khoảng 43,4%** — thấp hơn cả mức 50% mà bản cũ ghi, và **không có bằng chứng đã cải thiện**. Ban lãnh đạo nêu định hướng nâng lên 75–80% nhưng đó là kế hoạch, không phải số thực hiện. Room ngoại 49% là thật nhưng ngân hàng **chủ động khoá ở 17,5%** và chưa có tin bán vốn cho đối tác cụ thể.

**MBB** — cần nói thẳng một điểm: dữ liệu **không ủng hộ** việc xếp MBB cùng nhóm "giữ giá tốt" với ACB. MBB đang ở **−9,9% dưới MA200, −21,9% từ đỉnh 52 tuần, giảm cả ba đoạn** — yếu hơn ACB và HDB rõ rệt. Điểm mạnh thật của MBB là chất lượng tài sản (nợ xấu 1,42% theo số quý 1) và room ngoại vừa nới lên 49%. **So với SHB thì MBB tốt hơn nhiều — điều đó đúng. Nhưng so với ACB thì kém hơn đáng kể.**

**CTG** — có **tỷ lệ bao phủ nợ xấu 163% tại 31/05, mạnh nhất nhóm**, và cắt lỗ kỹ thuật chỉ −2,6% nếu vào. Nhưng xu hướng ở −16,2% dưới MA200 và giảm cả ba đoạn nên chưa đạt điều kiện. Đây là mã đáng chờ nhất trong ba mã tầng này.

### B.1.8. Tóm tắt thay đổi nhóm ngân hàng

| Mã | Bản 28/07 | **Bản này** | Lý do đổi |
|---|---|---|---|
| **ACB** | Loại hoàn toàn | **Ưu tiên 1** | Bỏ trọng số khối ngoại; số Q2 công bố; nợ nhóm 2 đã tạo đỉnh; LLCR 105% |
| **LPB** | Nhóm lõi 5% | **Ưu tiên 2** | Giữ — cấu trúc giá tốt nhất 28 mã. Nhắc lại P/B 3,23 đắt nhất nhóm |
| **MSB** | Không mua | **Ưu tiên 3** | Xu hướng tốt nhất nhóm; số Q2 công bố. Trừ điểm pha loãng 20% |
| **STB** | Nhóm 3, bán trước lễ | **Động lượng, size tối thiểu** | Xu hướng đạt nhưng chưa có BCTC Q2 và NPL ~5,6% |
| **MBB** | Nhóm lõi 6,5% | **Chờ xác nhận** | Xu hướng −9,9% dưới MA200, giảm cả ba đoạn; chưa có số Q2 |
| **CTG** | Nhóm 2, 5% | **Chờ xác nhận** | LLCR 163% rất mạnh nhưng xu hướng −16,2% |
| **HDB** | Không mua | **Chờ xác nhận** | Nâng từ loại lên theo dõi; LLCR 43,4% là điểm chặn thật |
| **SHB** | **Nhóm lõi 5%, mua phiên đầu** | **Rút khỏi danh mục** | Xu hướng xấu nhất nhóm; LLCR 71%; pha loãng 750 triệu cp |

## B.2. Công ty Chứng khoán — danh sách đổi gần như hoàn toàn

Đây là ngành có thay đổi lớn nhất, vì lần đầu có **số quý 2/2026 thật** từ báo cáo chuyên đề ngày 23/07/2026 phân tích tám công ty niêm yết HOSE trên báo cáo tài chính đã công bố.

### B.2.1. Ghép hai bộ lọc

| Mã | Tầng xu hướng | vs MA200 | Hạng chất lượng Q2 | Điểm | ADV (tỷ) | **Kết luận** |
|---|---|---|---|---|---|---|
| **VCK** | Mua được | **+16,5%** | **1/8** | **73,3** | 92,4 | **Ưu tiên 1 — đạt cả hai bộ lọc** |
| **HCM** | Mua được | +17,9% | 6/8 | 47,9 | 150,7 | **Ưu tiên 2 — xu hướng tốt nhất, tăng trưởng bị chặn** |
| **VPX** | Mua được | +11,9% | 7/8 | 47,3 | 37,7 | Ưu tiên 3 — size nhỏ, chất lượng lợi nhuận kém |
| TCX | Chờ xác nhận | −5,0% | **3/8** | 51,2 | 74,7 | Theo dõi — gần chạm điều kiện mua |
| MBS | Chờ xác nhận | −16,3% | **2/8** | 52,1 | 216,2 | Theo dõi — chất lượng tốt, xu hướng chưa cho phép |
| VND | Chờ xác nhận | −7,9% | **8/8** | 42,9 | 289,2 | **Loại** — xu hướng đỡ nhất nhóm gãy nhưng cơ bản tệ nhất mẫu |
| SSI | Loại thẳng | −21,7% | 5/8 | 48,4 | 526,5 | Theo dõi — chất lượng số liệu tốt nhất mẫu |
| VCI | Loại thẳng | −23,5% | 4/8 nhưng **bị loại định tính** | 50,4 | 210,0 | **Loại kép** |
| SHS · VIX | Loại thẳng | −22,3% · −35,4% | không có trong mẫu | — | — | **Loại** |

### B.2.2. VCK — mã duy nhất đạt cả hai bộ lọc một cách thuyết phục

**Điểm chất lượng 73,3 trên 100, cách mã đứng thứ hai 21,2 điểm.** Đây là khoảng cách đủ lớn để kết luận vững, khác hẳn nhóm từ hạng 2 đến hạng 7 chỉ chênh nhau chưa tới 5 điểm.

Cấu hình mà không mã nào khác trong mẫu có được:

| Chỉ tiêu | VCK | Vị trí trong mẫu 8 mã |
|---|---|---|
| Lợi suất cho vay ký quỹ | **13,36%** | Cao nhất |
| Chi phí vốn bình quân | **5,74%** | Thấp nhất |
| **Chênh lệch lãi** | **7,62%** | Cao nhất, hơn mã thứ hai trên 1 điểm % |
| Đòn bẩy tài chính | **1,53 lần** | Thấp nhất |
| Dư nợ / vốn chủ sở hữu | **1,00 lần** | Còn nguyên dư địa gấp đôi trước trần 200% |
| ROE 12 tháng | **19,9%** | Cao nhất |
| Lợi nhuận chưa thực hiện / LNTT | 0,5% | Rất sạch |
| Lãi đánh giá lại ghi vốn chủ | **+31 tỷ** | Dương |
| Độ lệch biên lợi nhuận 4 quý | 3,0 | Nhóm ổn định nhất |

**Cộng với xu hướng giá đứng trên MA200 16,5%** — VCK là mã duy nhất trong toàn bộ 28 mã khảo sát vừa đứng đầu bảng chất lượng vừa còn nguyên xu hướng tăng.

**Bốn rủi ro phải ghi rõ:**

1. **EPS gần như đi ngang dù lợi nhuận tăng 62,7%**, do số cổ phiếu lưu hành tăng **60%** trong sáu tháng. Vốn mới cần 2–3 quý để sinh lời. Nếu chỉ nhìn EPS thì mã này trông tầm thường.
2. **Thị phần môi giới lớn nhất thị trường** nên chịu tác động nặng nhất khi thanh khoản cạn — doanh thu môi giới quý 2 đã giảm 15% so cùng kỳ.
3. **Mới niêm yết 16/12/2025**, chưa đủ mười tháng lịch sử công bố thông tin để kiểm chứng chất lượng quản trị và tính nhất quán của chính sách kế toán.
4. **Chưa qua bộ lọc loại trừ cứng đầy đủ** của quy trình — xem cảnh báo ở B.2.5.

**Điều kiện huỷ luận điểm:** chênh lệch lãi cho vay xuống dưới 6% trong hai quý liên tiếp; hoặc dư nợ ngừng tăng trong khi doanh thu môi giới tiếp tục giảm; hoặc xuất hiện trích lập dự phòng lớn cho hoạt động cho vay; hoặc giá đóng cửa thủng MA200.

### B.2.3. Ba mã bị loại và lý do — đều là đảo ngược so với bản cũ

**VCI — loại kép, và đây là trường hợp nghiêm trọng nhất.**

Bản cũ xếp VCI vào nhóm lõi với 5% tỷ trọng, mô tả là "catalyst duy nhất trong 24 mã có cả ngày bắt đầu và ngày kết thúc" — chỉ giao dịch mua 31,05 triệu cổ phiếu của cổ đông lớn từ 04/08 đến 02/09.

Số quý 2 cho thấy điều bản cũ không thấy: **sáu tháng đầu năm VCI báo lãi sau thuế 591 tỷ nhưng vốn chủ sở hữu GIẢM 872 tỷ**, từ 18.010 tỷ cuối 2025 xuống 17.138 tỷ tại 30/06/2026 — bất chấp việc số cổ phiếu lưu hành đã tăng 35%. Nguyên nhân là khoản **lỗ đánh giá lại danh mục tài sản sẵn sàng để bán 1.251 tỷ**, ghi thẳng vào vốn chủ không đi qua báo cáo lãi lỗ.

**Xét trên tổng thu nhập toàn diện, VCI lỗ chứ không lãi trong nửa đầu năm.** Lợi nhuận công bố phản ánh phần danh mục đã bán, còn phần còn nắm giữ mất giá nhiều hơn thế. Cộng thêm ROE 9,8% thấp nhất mẫu, EPS giảm 8,5%, tự doanh ròng âm 8,2% doanh thu.

Cộng với xu hướng giá ở −23,5% dưới MA200 và giảm cả ba đoạn: **loại bởi cả hai bộ lọc, độc lập với nhau**. Một giao dịch nội bộ có ngày không bù được cho việc vốn chủ đang bị bào mòn.

**VND — loại, và đây là đảo ngược mạnh nhất.**

Bản cũ xếp VND là mã chứng khoán ưu tiên số một, 13 điểm, nhóm lõi, mua ngay tuần đầu. Lý do chính: **khối ngoại mua ròng +323 tỷ trong tháng** — tức đúng tiêu chí mà Nguyên tắc 2 vừa hạ xuống mức tham khảo.

Số quý 2 xếp VND **hạng 8 trên 8, thấp nhất mẫu**:

- **88% mức tăng lợi nhuận trước thuế đến từ chênh lệch dự phòng** — hoàn nhập 313 tỷ quý 2 so với trích lập 230 tỷ cùng kỳ. Hoàn nhập dự phòng là khoản không tái diễn theo định nghĩa.
- **Phụ thuộc tự doanh 44,5% doanh thu — cao nhất mẫu.** Đây là cấu phần biến động nhất, phụ thuộc trực tiếp giá tài sản.
- **Là công ty duy nhất trong tám công ty có dư nợ cho vay THU HẸP** — giảm 10,2% từ đầu năm, trong đúng quý toàn ngành mở rộng 7% và lập kỷ lục 454 nghìn tỷ. Công ty chủ động thu hẹp trong khi chênh lệch lãi 6,57% khá tốt — đó là tín hiệu về khẩu vị rủi ro nội bộ, không phải về cơ hội.
- 98 tỷ lợi nhuận chưa thực hiện quý 2 và 148 tỷ luỹ kế — một phần lợi nhuận chỉ tồn tại trên giấy.

**SSI — chuyển sang theo dõi, không loại vĩnh viễn.**

Bản cũ loại SSI hoàn toàn với lý do duy nhất: khối ngoại bán ròng 403 tỷ trong một tuần và 892 tỷ trong tháng. Theo Nguyên tắc 2, đó không phải căn cứ để loại.

Số quý 2 cho thấy SSI có **chất lượng số liệu tốt nhất mẫu**: khoản một lần chỉ 0,3% lợi nhuận trước thuế, lãi đánh giá lại ghi vốn chủ **dương** 68 tỷ, chênh lệch lãi 5,59% đứng thứ ba. Điểm trừ thật là phụ thuộc tự doanh 33,5% khiến điểm bền vững chỉ 13,6/35.

**Lý do SSI vẫn chưa mua được là xu hướng giá, không phải khối ngoại:** −21,7% dưới MA200, giảm cả ba đoạn. Khi giá phục hồi lên tầng "chờ xác nhận", SSI là ứng viên bổ sung đầu tiên.

### B.2.4. MBS và TCX — đúng chất lượng, sai thời điểm

**MBS** xếp hạng 2/8 với cơ cấu thu nhập ổn định nhất mẫu: thu nhập định kỳ 88,0%, phụ thuộc tự doanh chỉ 6,7% thấp nhất, độ lệch biên lợi nhuận 1,9 thấp nhất tuyệt đối, không có khoản một lần đáng kể, không có lỗ đánh giá lại ghi vốn chủ. Đợt phát hành 3.400 tỷ đã hạ dư nợ trên vốn chủ từ 1,88 xuống 1,41 lần, mở lại dư địa cho vay khoảng 7.000 tỷ.

Bản cũ đánh giá MBS đúng về hướng nhưng **bỏ sót một con số quan trọng: EPS sáu tháng GIẢM 20,5%** do pha loãng 52%. Bản cũ mô tả "pha loãng đã xong, không còn cung treo" như một điểm cộng thuần — thực tế nó vừa là điểm cộng (không còn cung tương lai) vừa là điểm trừ (mẫu số đã tăng đủ nhưng vốn mới chưa sinh lời).

Xu hướng giá ở −16,3% dưới MA200 nên **chưa mua được**. Đây là mã đáng chờ nhất trong tầng chờ xác nhận.

**TCX** xếp hạng 3/8, có mảng ngân hàng đầu tư mang tính cấu trúc thật — doanh thu lưu ký và đại lý phát hành chiếm 25,0% quý 2/2026 và 25,1% quý 2/2025, tỷ trọng gần như không đổi qua hai kỳ chứng minh đây là nguồn thu lặp lại. Đây là nguồn thu **không phụ thuộc thanh khoản thị trường cổ phiếu**, tức có tính phòng thủ cao đúng bối cảnh hiện nay. Lợi nhuận 12 tháng 6.092 tỷ lớn nhất ngành.

Điểm trừ: chi phí vốn 8,21% cao nhất mẫu và chênh lệch lãi 3,41% thấp nhất mẫu — đang mua tăng trưởng bằng nguồn vốn đắt. Cổ đông lớn nhất nắm gần 80% vốn nên tỷ lệ tự do chuyển nhượng thấp.

Xu hướng ở −5,0% dưới MA200, **gần chạm điều kiện mua nhất trong tầng chờ xác nhận**.

### B.2.5. Cảnh báo bắt buộc về bốn mã mới

**VCK, HCM, TCX, VPX chưa từng đi qua quy trình sàng lọc đầy đủ của chu kỳ này.** Chúng lọt vào bản này qua hai bộ lọc — xu hướng giá và chất lượng lợi nhuận quý 2 — chứ chưa qua bộ lọc loại trừ cứng vốn đã loại 13 mã ở bản cũ vì các lý do như lãnh đạo bị khởi tố, chậm trả trái phiếu, pha loãng trong horizon, hay bị loại khỏi rổ chỉ số.

**Hệ quả thực tế:** trước khi cấp tỷ trọng cho bất kỳ mã nào trong bốn mã này, cần rà ba việc — tin quản trị và pháp lý ba tháng gần nhất, kế hoạch phát hành thêm trong nửa cuối 2026, và tình trạng cổ đông lớn. Kế hoạch tuần ở Phần C vì vậy đặt VCK vào tuần 1 với size thăm dò và chỉ nâng sau khi rà xong.

**Ba mã VCK, TCX, VPX niêm yết từ tháng 10–12/2025** nên lịch sử công bố thông tin dưới mười tháng — chưa đủ để kiểm chứng chất lượng quản trị qua một chu kỳ. Đây là rủi ro không định lượng được và không nên bỏ qua khi cấp size.

---

## B.3. Bất động sản Dân dụng — rút toàn bộ khỏi kế hoạch mua

**Đây là thay đổi lớn thứ hai của bản này, và là thay đổi anh chỉ ra trực tiếp.**

### B.3.1. Sáu trên sáu mã đều ở tầng loại thẳng

Không có ngoại lệ nào. Đã trình bày ở bảng A.1 và nhắc lại vì tính quyết định:

| Mã | Bản cũ xếp | Dưới MA200 | Từ đỉnh 52T | Đoạn giảm | Bản này |
|---|---|---|---|---|---|
| **KDH** | **Nhóm lõi, 6,5%, mua tuần 1** | −37,9% | −55,5% | 3/3 | **Theo dõi, 0%** |
| **CEO** | **Nhóm lõi, 3%, mua tuần 2** | −39,9% | −64,6% | 3/3 | **Theo dõi, 0%** |
| **DXG** | **Nhóm lõi, 3%, mua tuần 3** | −27,1% | −52,3% | 2/3 | **Theo dõi, 0%** |
| **NLG** | Nhóm 2, 4%, mua tuần 2 | −29,5% | −54,0% | 3/3 | **Theo dõi, 0%** |
| **HDG** | Nhóm 2, 3%, mua tuần 3 | −33,6% | −50,5% | 3/3 | **Theo dõi, 0%** |
| **TAL** | Nhóm 3, size trần 800 triệu | −35,4% | −49,1% | 3/3 | **Theo dõi, 0%** |

Bản cũ cấp cho ngành này khoảng **19,5% tỷ trọng danh mục ở tuần 3**. Bản này cấp **0%**.

### B.3.2. Trường hợp KDH — vì sao bản cũ sai một cách điển hình

KDH đáng phân tích riêng vì nó là ví dụ gọn nhất của cả ba lỗi cùng lúc.

**Bản cũ lập luận:** điểm cao nhất ngành (13/18) · bảng cân đối sạch nhất ngành, sạch nợ trái phiếu · ba công ty chứng khoán cùng khuyến nghị Mua với giá mục tiêu 32.800–42.600đ · Phó Tổng giám đốc đăng ký mua 20 triệu cổ phiếu bằng tiền cá nhân · **khối ngoại mua ròng +50 tỷ đúng phiên 28/07, bằng 56% giá trị giao dịch cả phiên** · chỉ báo quá bán 19,4 · tỷ lệ phần thưởng trên rủi ro 3,14.

Nghe rất thuyết phục. Nhưng:

- **Giá đang ở −37,9% dưới MA200 và −55,5% dưới đỉnh 52 tuần.**
- **Giảm ở cả ba đoạn của chuỗi 120 phiên: −11,0%, −10,5%, −21,7%** — tốc độ giảm còn **tăng dần** ở đoạn gần nhất.
- Khoản mua ròng 50 tỷ của khối ngoại là **một phiên**. Theo Nguyên tắc 2 nó không được dùng làm căn cứ.
- Giá mục tiêu 32.800–42.600đ so với thị giá 16.950đ là kỳ vọng tăng **94–151%** — bản cũ đã tự ghi rằng mức chênh này "bất thường, không dùng thẳng" **rồi vẫn xếp mã vào nhóm lõi**.

**Không có bằng chứng nào cho thấy giá đã ngừng rơi.** Toàn bộ lập luận là về việc mã này *đáng giá bao nhiêu*, không có một dòng nào về việc *thị trường đã ngừng bán chưa*. Với horizon 1–3 tháng, câu thứ hai mới là câu phải trả lời trước.

### B.3.3. Điều kiện kích hoạt lại — cụ thể, đo được

Ngành này **sẽ đáng mua**, và luận điểm định giá ở Phần II vẫn nguyên giá trị: loại ba trụ Vingroup, P/B 1,07 rẻ hơn cả đáy 2022 lẫn đáy 2025, phân vị 0,6% của ba năm. Vấn đề duy nhất là thời điểm.

**Cấp tỷ trọng trở lại khi một mã thoả ĐỒNG THỜI ba điều kiện:**

1. **Giá đóng cửa trên MA20 trong ba phiên liên tiếp** — bằng chứng tối thiểu của việc ngừng rơi.
2. **Không tạo đáy mới trong 15 phiên gần nhất.**
3. **Khoảng cách tới MA200 thu hẹp về dưới 25%** — nếu vẫn dưới 25–40% thì kể cả có nhịp bật, đó là bật trong xu hướng giảm.

**Thứ tự ưu tiên khi điều kiện được thoả**, dựa trên chất lượng cơ bản đã phân tích ở bản cũ và giữ nguyên giá trị:

1. **NLG** — backlog 10.878 tỷ đã ký chưa ghi nhận, cơ sở doanh thu chắc chắn nhất nhóm; đang giảm đòn bẩy
2. **HDG** — mã duy nhất trong mười mã BĐS soi sâu có **dòng tiền kinh doanh dương sáu quý liên tiếp**; ROE 10,11% cao thứ hai ngành
3. **KDH** — bảng cân đối sạch nhất, sạch nợ trái phiếu, lãnh đạo mua vào bằng tiền cá nhân
4. **DXG** — thanh khoản cao nhất nhóm mid-cap
5. **CEO, TAL** — chỉ khi ba mã trên đã vào và còn dư địa. CEO có dòng tiền kinh doanh −380 tỷ; TAL có trần size cứng 800 triệu

**Lưu ý về thứ tự này:** nó **đảo so với bản cũ**, vốn xếp CEO và DXG lên nhóm lõi còn NLG và HDG xuống nhóm 2, với lý do CEO và DXG có vòng quay thanh khoản cao hơn. Khi ưu tiên dòng tiền giao dịch trên chất lượng cơ bản đã được hạ xuống (Nguyên tắc 2 và tinh thần Nguyên tắc 1), thứ tự tự nhiên đảo lại theo chất lượng.

---

# PHẦN C — KẾ HOẠCH TUẦN ĐÃ SỬA

Dải tỷ trọng giữ nguyên theo quyết định phân bổ: **sàn 30% — trần 70%**.

Nhưng có một thay đổi về bản chất so với bản cũ, và nó phải nói trước.

## C.0. Trần 70% giờ là trần CÓ ĐIỀU KIỆN, không phải lịch trình

Bản cũ đặt lộ trình 30% → 44% → 62% → 70% như một **lịch trình theo thời gian**: cứ đến tuần đó thì nâng đến mức đó. Cách đó chỉ đúng nếu số mã đủ điều kiện luôn sẵn có — mà sau khi áp ba nguyên tắc mới thì không còn đúng.

**Số mã đạt điều kiện mua ngay hôm nay là bảy**, trên tổng 28 mã khảo sát. Bảy mã ở size hợp lý cho khoảng **32–36%** danh mục. Đó là mức sàn, và nó **đạt được ngay trong tuần 1**.

Từ 36% lên 70% phụ thuộc hoàn toàn vào việc **các mã ở tầng chờ xác nhận có thật sự xác nhận không** — và điều đó do thị trường quyết, không do lịch quyết.

> **Nói thẳng: nếu không mã nào ở tầng chờ xác nhận vượt được điều kiện trong tháng 8, thì tỷ trọng đúng của danh mục là 35–40%, không phải 70%. Đó là kết quả đúng, không phải kế hoạch thất bại.** Ép cho đủ 70% bằng cách hạ tiêu chuẩn là quay lại đúng lỗi của bản cũ.

## C.1. Lộ trình

| Tuần | Phiên | **Sàn** | **Trần nếu xác nhận đủ** | Điều kiện mở khoá phần trên sàn |
|---|---|---|---|---|
| **T1** 30–31/07 | 2 | **32%** | 36% | Không có — vào thẳng nhóm bảy mã đạt điều kiện |
| **T2** 03–07/08 | 5 | 34% | **45%** | BCTC riêng lẻ quý 2 nhóm ngân hàng (hạn ~30/07) xác nhận MBB hoặc CTG |
| **T3** 10–14/08 | 5 | 36% | **60%** | BCTC hợp nhất quý 2 (hạn 14/08) + mã tầng chờ xác nhận vượt MA20 ba phiên |
| **T4** 17–21/08 | 5 | 36% | **70%** | Nhóm BĐS thoả ba điều kiện kích hoạt ở mục B.3.3 |
| **T5** 24–28/08 | 5 | **30%** | 60% | **Bắt buộc hạ 10 điểm % so tuần 4** trước kỳ nghỉ 5 ngày |

## C.2. TUẦN 1 — 30 và 31/07 (2 phiên)

### Chủ đề: đưa danh mục về sàn bằng bảy mã đã đạt cả hai bộ lọc

Quyết định FOMC công bố rạng sáng 30/07 giờ Việt Nam. Vào lệnh **sau khi có kết quả**, tức từ phiên 30/07.

| Mã | Ngành | Size | Vùng mua | Cắt lỗ | Vì sao mã này ở tuần 1 |
|---|---|---|---|---|---|
| **ACB** | NH | **7%** | 21,7 – 22,8 | 21,33 (−4,3%) | Mã duy nhất trong 28 mã có đủ ba thứ: xu hướng còn nguyên, số Q2 đã công bố, chất lượng tài sản tốt nhất nhóm (NPL 1,03%, LLCR 105%) |
| **LPB** | NH | **6%** | 52,7 – 53,8 | 51,19 (−3,8%) | Cấu trúc giá tốt nhất toàn bộ 28 mã — không đoạn nào giảm trong 120 phiên. Số Q2 đã công bố |
| **VCK** | CK | **6%** | 27,8 – 29,0 | 26,2 (−8%) | Đứng đầu bảng chất lượng quý 2 với khoảng cách 21,2 điểm, đồng thời trên MA200 16,5%. Vào 2/3 size, chờ rà quản trị |
| **MSB** | NH | **5%** | 15,3 – 16,1 | 15,12 (−3,9%) | Trên MA200 21,0%, gần đỉnh 52 tuần nhất. Số Q2 công bố. Size hạ một bậc vì pha loãng 20% |
| **HCM** | CK | **4%** | 24,6 – 25,6 | 23,3 (−7%) | Trên MA200 17,9%, thanh khoản 151 tỷ/phiên. Size hạn chế vì dư nợ/vốn chủ 1,98 lần đã sát trần quy định |
| **VPX** | CK | **2%** | 24,0 – 25,1 | 22,8 (−7%) | Trên MA200 11,9%. Size nhỏ vì 49,7% lợi nhuận trước thuế quý 2 đến từ khoản một lần |
| **STB** | NH | **2%** | 71,4 – 72,9 | 69,5 (−3,7%) | Xu hướng đạt nhưng **chưa có BCTC quý 2** và nợ xấu ước tính ~5,6%. Vị thế động lượng thuần |

**Tổng cuối tuần 1: 32%.** Đạt sàn.

**Ba việc bắt buộc song song với vào lệnh:**

1. **Rà quản trị bốn mã mới — VCK, HCM, VPX và TCX.** Ba việc: tin pháp lý và quản trị ba tháng gần nhất, kế hoạch phát hành nửa cuối 2026, tình trạng cổ đông lớn. Bốn mã này chưa qua bộ lọc loại trừ cứng vốn đã loại 13 mã ở bản cũ. **Nếu phát hiện vấn đề thì cắt ngay, không chờ giá.**
2. **Theo dõi công bố BCTC riêng lẻ quý 2 nhóm ngân hàng** — hạn khoảng 30/07, tức rơi đúng trong tuần này.
3. **Không mua bất kỳ mã nào ngoài bảy mã trên**, kể cả mã cũ đã quen.

### Không mua trong tuần 1 — và đây là danh sách quan trọng nhất

**Toàn bộ mười hai mã ở tầng loại thẳng**, gồm năm mã bản cũ xếp nhóm lõi: **SHB · VCI · KDH · CEO · DXG**. Cộng SSI, SHS, VIX, NLG, HDG, TAL, CTD.

**Toàn bộ chín mã ở tầng chờ xác nhận**, gồm **MBB, VND, MBS, CTG, HDB** — bản cũ mua cả năm mã này trong tuần 1 hoặc tuần 2.

## C.3. TUẦN 2 — 03 đến 07/08 (5 phiên)

### Chủ đề: số liệu vĩ mô 03/08 và đợt BCTC riêng lẻ đầu tiên

**Sàn 34% — trần 45%.**

**Ba việc của tuần:**

**03/08 — số liệu kinh tế xã hội tháng 7.** Ba con số theo thứ tự quan trọng: CPI bình quân 7 tháng (nếu vượt 4,5% thì luận điểm dư địa tín dụng của cả ngân hàng lẫn bất động sản yếu đi rõ); cán cân thương mại tháng 7 (tỷ giá chỉ còn cách trần biên độ 37 đồng); FDI đăng ký tháng 7 (số đầu tiên đo sau ngày thuế Section 301 hiệu lực).

**Đối chiếu BCTC riêng lẻ quý 2 nhóm ngân hàng** — hạn khoảng 30/07 nên số về trong tuần này. Đây là dữ liệu mở khoá phần trên sàn.

| Mã | Điều kiện nâng lên mức mua | Size nếu đạt |
|---|---|---|
| **MBB** | Nợ xấu quý 2 giữ dưới 1,6% **và** giá đóng cửa trên MA20 ba phiên | 4% |
| **CTG** | Bao phủ nợ xấu quý 2 giữ trên 140% **và** giá đóng cửa trên MA20 ba phiên | 4% |
| **HDB** | **Bao phủ nợ xấu cải thiện lên trên 60%** — đây là điều kiện chặn thật, hiện ~43,4% | 3% |

**Nếu cả ba đều không đạt thì tỷ trọng tuần 2 giữ ở 34%, không thay bằng mã khác.**

**Nâng size mã đã nắm nếu giữ được vùng mua:** VCK lên 6% đầy đủ sau khi rà xong quản trị; ACB lên 8%.

**Không mua:** toàn bộ nhóm bất động sản, SHB, VCI, VND, SSI, VIX, SHS.

## C.4. TUẦN 3 — 10 đến 14/08 (5 phiên)

### Chủ đề: BCTC hợp nhất quý 2 — tuần dữ liệu đầy đủ nhất tháng

**Sàn 36% — trần 60%. Đây là tuần giải ngân chính, không phải tuần 1.**

Hạn công bố BCTC bán niên soát xét là **14/08**. Sau ngày này, độ bất định về dữ liệu quý 2 được giải quyết gần hết cho cả ba ngành.

**Bốn nhóm ứng viên, theo thứ tự ưu tiên:**

| Ưu tiên | Mã | Điều kiện | Size |
|---|---|---|---|
| 1 | **TCX** | Vượt MA200 (hiện −5,0%, gần nhất trong tầng chờ) **và** duy trì tỷ trọng doanh thu đại lý phát hành trên 20% | 4% |
| 2 | **MBS** | Vượt MA20 ba phiên **và** EPS quý 3 có dấu hiệu hồi phục sau pha loãng 52% | 4% |
| 3 | **MBB · CTG · HDB** | Nếu chưa vào ở tuần 2 và nay đã đạt điều kiện | 3–4% mỗi mã |
| 4 | **VGC · IDC** | BCTC quý 2 xác nhận biên gộp ngừng co hẹp **và** vượt MA20 ba phiên | 2–3% mỗi mã |

**Kiểm chứng bắt buộc với mã đang nắm:**

| Mã | Con số phải kiểm trong BCTC soát xét | Ngưỡng cắt |
|---|---|---|
| **STB** | Lợi nhuận 6 tháng thật so với ước tính −50%; nợ xấu thật so với ~5,6% | Nếu nợ xấu trên 6% hoặc lợi nhuận giảm quá 50% → **cắt hết**, bất kể giá |
| **ACB** | Nợ nhóm 3 và nhóm 4 có tiếp tục tăng không | Nếu nhóm 3 tăng tiếp trên 30% trong quý → hạ về 4% |
| **MSB** | Ngày chốt quyền phát hành 20% | Nếu rơi trong tháng 8 → hạ về 3% trước ngày chốt |
| **VCK** | Chênh lệch lãi cho vay có giữ trên 6% không | Dưới 6% hai quý liên tiếp → cắt hết |
| **HCM** | Tiến độ đợt chào bán ~2.700 tỷ | Nếu chậm → giữ nguyên, không nâng |

## C.5. TUẦN 4 — 17 đến 21/08 (5 phiên)

### Chủ đề: đáo hạn phái sinh 20/08, FTSE danh sách cuối 21/08, và cửa sổ duy nhất cho nhóm bất động sản

**Sàn 36% — trần 70%.**

**Hai sự kiện, xử lý khác nhau — giữ nguyên từ bản cũ vì phần này không bị ảnh hưởng bởi ba lỗi:**

- **20/08 đáo hạn VN30F2608.** Không mua trong phiên. Biến động ATC là kỹ thuật thuần tuý.
- **21/08 FTSE công bố danh sách cuối.** Trong danh mục mới, mã có câu chuyện FTSE là **STB** và có thể là **HCM, VCK** tuỳ danh sách. **Hạ các mã này xuống 2/3 size chậm nhất phiên 19/08**, mua lại sau khi có danh sách. Đây là rủi ro nhị phân không quản trị được bằng cắt lỗ.

**Cửa sổ nhóm bất động sản.** Tính từ đáy 22–27/07, điều kiện "không tạo đáy mới trong 15 phiên" sớm nhất được thoả vào khoảng **18–19/08**. Đây là tuần đầu tiên nhóm này có thể đạt đủ ba điều kiện ở mục B.3.3.

| Mã | Size nếu đủ ba điều kiện | Thứ tự |
|---|---|---|
| **NLG** | 3% | 1 — backlog 10.878 tỷ, cơ sở doanh thu chắc nhất nhóm |
| **HDG** | 3% | 2 — dòng tiền kinh doanh dương sáu quý liên tiếp |
| **KDH** | 3% | 3 — bảng cân đối sạch nhất, lãnh đạo mua bằng tiền cá nhân |
| **DXG** | 2% | 4 — thanh khoản cao nhất mid-cap |

**Kiểm ba điều kiện riêng cho từng mã, không kiểm cho cả ngành.** Rất có thể chỉ một hoặc hai mã đạt. **Nếu không mã nào đạt thì nhóm này vẫn ở 0%** — và tỷ trọng danh mục dừng ở mức của tuần 3.

## C.6. TUẦN 5 — 24 đến 28/08 (5 phiên)

### Chủ đề: hạ rủi ro trước rào 5 ngày nghỉ — không đổi so với bản cũ

**Hạ 10 điểm phần trăm so với tuần 4, sàn 30%.**

Ba rủi ro chồng nhau rơi vào cửa sổ thị trường đóng cửa: Jackson Hole 27–29/08; ngày tái cơ cấu MSCI 31/08 trùng phiên nghỉ lễ Việt Nam; và gap 5 ngày lịch không có công cụ phòng vệ. **Phiên giao dịch cuối tháng 8 là thứ Sáu 28/08**, không phải 31/08.

| Ngày | Hành động |
|---|---|
| 24–25/08 | Chốt lời từng phần: mã nào lãi trên 12% từ giá vốn thì bán 1/3 |
| **26/08** | **Ngừng mở vị thế mới** |
| 27/08 | Bán hết **STB** (động lượng thuần, chưa xác minh cơ bản) và **VPX** (49,7% lợi nhuận từ khoản một lần) |
| 28/08 | Chỉ giữ nhóm có đệm thật. Không giao dịch trừ khi bắt buộc |

**Giữ qua kỳ nghỉ:** ACB, LPB, VCK, MSB, HCM — cộng các mã mới vào ở tuần 3–4 nếu đã có xác nhận cơ bản.
**Đóng trước kỳ nghỉ:** STB, VPX, và toàn bộ mã vào bằng động lượng chưa có số quý 2.

## C.7. Bảng tổng hợp — mã nào, tuần nào

Con số là tỷ trọng tích luỹ cuối tuần. **?** = có điều kiện, có thể không xảy ra.

| Mã | Ngành | T1 30–31/07 | T2 03–07/08 | T3 10–14/08 | T4 17–21/08 | T5 24–28/08 |
|---|---|---|---|---|---|---|
| **ACB** | NH | **M 7%** | M 8% | G 8% | G 8% | G 8% |
| **LPB** | NH | **M 6%** | G 6% | G 6% | G 6% | G 6% |
| **VCK** | CK | **M 6%** | G 6% | G 6% | H 4% trước 21/08 → M 6% | G 6% |
| **MSB** | NH | **M 5%** | G 5% | G 5% ? | G 5% | G 5% |
| **HCM** | CK | **M 4%** | G 4% | G 4% | H 2,7% trước 21/08 → M 4% | G 4% |
| **VPX** | CK | **M 2%** | G 2% | G 2% | G 2% | **B 0%** |
| **STB** | NH | **M 2%** | G 2% | G 2% ? | H 1,3% trước 21/08 | **B 0%** |
| MBB | NH | — | **M? 4%** | M? 4% | G 4% | G 4% |
| CTG | NH | — | **M? 4%** | M? 4% | G 4% | G 4% |
| HDB | NH | — | **M? 3%** | M? 3% | G 3% | H 1,5% |
| TCX | CK | — | — | **M? 4%** | G 4% | G 4% |
| MBS | CK | — | — | **M? 4%** | G 4% | H 2% |
| VGC · IDC | Dự bị | — | — | **M? 2–3%** mỗi mã | G | G |
| NLG · HDG · KDH · DXG | BĐS | — | — | — | **M? 2–3%** mỗi mã | G |
| SHB · VCI · VND · SSI · SHS · VIX · CEO · TAL · CTD · HHV | | **Không** | Không | Không | Không | Không |
| **TỔNG — sàn** | | **32%** | **34%** | **36%** | **36%** | **30%** |
| **TỔNG — nếu xác nhận đủ** | | 32% | **45%** | **60%** | **70%** | **60%** |

## C.8. Nhánh xấu — không đổi về ngưỡng, đổi về danh sách bán

**Kích hoạt:** VNINDEX đóng cửa dưới **1.651,20** hai phiên liên tiếp, hoặc một phiên dưới mức đó kèm khối lượng vượt 1,3 lần bình quân 20 phiên.

| Bước | Hành động |
|---|---|
| 1 | Dừng toàn bộ giải ngân mới |
| 2 | Bán hết mã vào bằng động lượng chưa có số quý 2: **STB, VPX** |
| 3 | Hạ nhóm chứng khoán xuống 1/3 |
| 4 | Hạ về sàn 30%, ưu tiên giữ **ACB, LPB** — hai mã có xu hướng tốt nhất và số quý 2 đã công bố |
| 5 | **Thủng 1.600 kèm khối lượng tăng** → regime chuyển sang Defensive only, dải 30–70% hết hiệu lực, hạ về 15–20% |

**Điểm khác bản cũ:** danh mục mới ít mã dao rơi hơn hẳn, nên bước 2 và 3 nhẹ hơn nhiều. Đó chính là giá trị thực của Nguyên tắc 1 — nó không làm tăng lợi nhuận khi đúng, nó làm giảm thiệt hại khi sai.

---

# PHẦN D — NHỮNG GÌ GIỮ NGUYÊN TỪ BẢN 28/07

Ba lỗi đã nêu **không chạm tới phần vĩ mô và phần chọn ngành**. Các nội dung sau giữ nguyên hiệu lực, đọc ở bản `client_report_20260728.md`:

| Nội dung | Vị trí bản cũ | Trạng thái |
|---|---|---|
| Sáu trục đánh giá thị trường | Phần I mục 1.1 | **Giữ nguyên** |
| Định giá thị trường loại nhóm Vingroup, phân vị lịch sử | Phần I mục 1.2 | **Giữ nguyên** |
| Định giá 24 ngành | Phần I mục 1.3 | **Giữ nguyên** |
| Mùa vụ tháng 8 và hai bẫy giá trị | Phần I mục 1.4 | **Giữ nguyên** |
| Nâng hạng FTSE — cơ chế, chín tiền lệ, ba phép chia, nghiên cứu học thuật | Phần I mục 1.5 | **Giữ nguyên**, kể cả đính chính mốc 21/08 là danh sách cuối |
| Bảng catalyst | Phần I mục 1.6 | **Giữ nguyên** |
| Regime và bốn điều kiện huỷ | Phần I mục 1.7 | **Giữ nguyên** |
| So sánh hai đáy chu kỳ, định giá và lợi suất sau đáy | Phần II mục 2.2 | **Giữ nguyên** |
| Phân tích ba ngành chính và hai ngành dự bị | Phần II mục 2.3–2.4 | **Giữ nguyên** |
| Vì sao loại Hóa chất Phân bón | Phần II mục 2.6 | **Giữ nguyên** |
| Lịch sự kiện 29/07–31/08 | Phần V | **Giữ nguyên** |

**Một điểm cần đọc lại với con mắt mới:** mục 2.2.5 của bản cũ trình bày lợi suất ngành sau hai đáy chu kỳ, trong đó Chứng khoán đứng hạng 1 và hạng 2 với trung bình +90,2% sau 6 tháng. Con số đó đúng, **nhưng nó đo từ ĐÁY đã xác nhận, không phải từ giữa đường giảm.** Bản cũ dùng nó để biện minh cho việc mua ngay; cách đọc đúng là nó biện minh cho việc **chuẩn bị sẵn danh sách để mua khi đáy hình thành** — chính là điều Nguyên tắc 1 đang làm.

---

# PHẦN E — GIỚI HẠN CỦA BẢN NÀY

## E.1. Bốn việc chưa làm

1. **Bốn mã mới chưa qua bộ lọc loại trừ cứng.** VCK, HCM, TCX, VPX lọt vào qua hai bộ lọc, chưa qua vòng rà tin quản trị, pháp lý, pha loãng và sự kiện lịch vốn đã loại 13 mã ở bản cũ. **Việc rà này được đặt thành nhiệm vụ bắt buộc của tuần 1** và phải xong trước khi nâng size.
2. **Năm ngân hàng chưa có báo cáo tài chính quý 2.** MBB, HDB, CTG, SHB, STB. Mọi đánh giá về năm mã này đứng trên số quý 1 [công bố] hoặc dự phóng của bên thứ ba, và đã được ghi nhãn.
3. **Không mã nào có memo phân tích đầy đủ.** Vẫn chưa có variant perception, bear case được lập luận nghiêm túc, exit trigger viết trước. Phần C là kỷ luật vào lệnh, không thay được memo.
4. **Chưa định giá độc lập.** Không có giá mục tiêu cơ sở / lạc quan / bi quan cho bất kỳ mã nào. Giá mục tiêu nêu ở bản cũ là của bên thứ ba, chưa kiểm giả định.

## E.2. Hai rủi ro riêng của chính bản sửa này

**Một — nguy cơ sửa quá tay theo hướng ngược lại.** Bộ lọc xu hướng ở Nguyên tắc 1 là bộ lọc chặt. Nó **sẽ bỏ lỡ đáy thật**: nếu thị trường tạo đáy V ngay tuần này thì danh mục 32% sẽ thua danh mục 70%. Đây là chi phí đã biết và chấp nhận có ý thức — đổi phần đuôi trên lấy việc không cầm dao rơi. **Nếu ba tháng sau nhìn lại thấy các mã bị loại đều tăng mạnh từ đúng vùng này, thì ngưỡng 20% dưới MA200 cần được nới, chứ không phải bỏ nguyên tắc.**

**Hai — bốn mã mới có thể tốt vì lý do sai.** VCK, HCM, VPX đứng trên MA200 một phần vì **mới niêm yết cuối 2025**, nên MA200 của chúng tính trên nền giá thấp hơn và chưa trải qua chu kỳ giảm nào. Đây là điểm yếu thật của phép so sánh và không khắc phục được bằng dữ liệu hiện có. **Xử lý: size ba mã này cộng lại chỉ 12%, và VPX bị hạ xuống 2% vì chất lượng lợi nhuận.**

## E.3. Hàm ý cho quy trình, cần quyết định riêng

Ba lỗi ở phần đầu **không phải lỗi thực thi, chúng là lỗi thiết kế của bộ tiêu chí**:

- Tiêu chí khối ngoại là một trong sáu tiêu chí chấm điểm trong quy trình chuẩn.
- Đường vào universe bằng dòng tiền giao dịch được mở ở chu kỳ này và không có bộ lọc xu hướng đi kèm.
- Bộ lọc cơ bản đọc quý gần nhất mà không kiểm độ tươi của kỳ báo cáo.

**Sửa ba điểm này nằm ở tầng quy trình, không nằm trong báo cáo.** Đây là việc bảo trì engine và cần quyết định riêng của anh — tôi không tự sửa. Nếu anh đồng ý, ba thay đổi đề xuất là: bỏ khối ngoại khỏi bộ tiêu chí chấm điểm và chuyển thành ghi chú tham khảo; thêm bộ lọc xu hướng làm vòng bắt buộc trước mọi vòng khác; và thêm điều kiện kiểm độ tươi kỳ báo cáo vào vòng cơ bản.

---

## Khuyến cáo

Báo cáo này thay thế bản ngày 28/07/2026. Bản cũ được giữ lại trong hồ sơ để truy vết, **không dùng cho quyết định đầu tư**.

Nội dung được lập cho mục đích tham khảo, dựa trên dữ liệu giá đến hết phiên 28/07/2026 và dữ liệu tài chính đến ngày 29/07/2026. Báo cáo không phải lời chào mua hay chào bán, và không tính đến mục tiêu đầu tư hay tình hình tài chính riêng của từng nhà đầu tư.

Ba điểm phải đọc kèm mọi khuyến nghị trong báo cáo: **năm trên tám ngân hàng chưa công bố báo cáo tài chính quý 2**; **bốn mã chứng khoán mới chưa qua bộ lọc loại trừ cứng đầy đủ**; và **toàn bộ khung vẫn giả định thị trường đang trong vùng tạo đáy — giả định này hiện chưa được xác nhận bởi bất kỳ dấu hiệu nào trong ba dấu hiệu ở mục 7.2 của bản cũ.**

---

*Kết thúc bản sửa lần 2. Lập ngày 29/07/2026.*
