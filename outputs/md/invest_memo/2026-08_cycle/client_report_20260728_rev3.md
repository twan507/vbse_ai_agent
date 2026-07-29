---
type: invest_memo_client_report
date: 2026-07-29
inputs:
  - outputs/md/invest_memo/2026-08_cycle/client_report_20260728.md
  - outputs/md/invest_memo/2026-08_cycle/client_report_20260728_rev2.md
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
supersedes: outputs/md/invest_memo/2026-08_cycle/client_report_20260728_rev2.md
---

# Báo cáo chiến lược đầu tư — Chu kỳ tháng 8/2026 (bản sửa lần 3)

**Ngày lập:** 29/07/2026 · **Dữ liệu giá chốt:** phiên 28/07/2026
**Thay thế:** `client_report_20260728_rev2.md` (cùng ngày)
**Khung thời gian khuyến nghị:** 30/07/2026 → 28/08/2026

---

# THAY ĐỔI SO VỚI BẢN SỬA LẦN 2

Bốn thay đổi, đều theo quyết định phân bổ.

| # | Thay đổi | Bản rev2 | **Bản này** |
|---|---|---|---|
| 1 | **HDB** | Chờ xác nhận, không cấp tỷ trọng tuần 1 | **Lõi có điều kiện, vào một phần ngay tuần 1** — override Nguyên tắc 1, ghi audit |
| 2 | **Hạ tầng Tiện ích** | Không có trong phạm vi | **Nâng lên ngành chính** — NT2, POW, GEG, tất cả vào theo điều kiện, không mã nào ở tuần 1 |
| 3 | **Công ty Chứng khoán** | Ngành chính, ba mã ở tuần 1 | **Hạ xuống ngành dự bị** — giữ VCK và HCM ở vai trò bổ sung, loại VPX |
| 4 | **Cách trình bày tỷ trọng** | Ghi phần trăm cho từng mã | **Bỏ tỷ trọng cấp mã.** Chỉ công bố tổng tỷ trọng danh mục và thứ tự ưu tiên |

**Về thay đổi 1 — cần ghi rõ để không tự lừa mình.** HDB đang ở −3,8% dưới MA200 và **giảm cả ba đoạn** của chuỗi 120 phiên, tức thuộc tầng chờ xác nhận. Quyết định mua ngay tuần 1 bỏ qua bước xác nhận mà nguyên tắc yêu cầu.

Cơ sở thật của việc nâng: bộ yếu tố xúc tác đã được xác minh lại và **mạnh hơn mức bản rev2 ghi nhận**. Ba việc đã hoàn tất trong nửa đầu 2026 mà bản rev2 bỏ sót — nâng sở hữu HD SAISON lên 75%, nâng sở hữu Chứng khoán HD lên 90% kèm hợp nhất từ quý 2, và hệ số an toàn vốn 16,2% cao nhất nhóm ngân hàng niêm yết. Chi tiết ở mục B.1.4.

Cách xử lý để override không thành quyết định vô điều kiện: **vào khoảng ba phần năm phần dự kiến ngay tuần 1, giữ lại phần còn lại cho tới khi có xác nhận kỹ thuật**, kèm ba ngưỡng huỷ luận điểm có số cụ thể. Toàn bộ ghi `audit_overrides.md`.

**Về thay đổi 4.** Con số phần trăm từng mã giả vờ chính xác ở mức bảng chấm không hỗ trợ được, không dùng chung được vì quy mô danh mục mỗi nhà đầu tư khác nhau, và kéo chú ý khỏi thứ thật sự quan trọng là tổng exposure cùng thứ tự ưu tiên. **Trần thanh khoản 5% khối lượng bình quân 20 phiên vẫn giữ nguyên** — đó là ràng buộc an toàn, khác với mục tiêu tỷ trọng.

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

Áp Nguyên tắc 1 cho 24 mã của bản cũ, cộng bốn công ty chứng khoán có mặt trong khảo sát chất lượng quý 2 nhưng không nằm trong universe cũ (HCM, TCX, VCK, VPX), cộng ba mã ngành Hạ tầng Tiện ích được đưa vào ở bản này (NT2, POW, GEG). **Tổng 31 mã.** Dữ liệu giá đóng cửa 28/07/2026.

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
| **POW** | Tiện ích | 13,30 | **+1,2%** | −4,7% | −21,1% | +0,0 · +3,8 · −10,7 | 1/3 | **Mua được** |
| HDB | NH | 25,10 | −3,8% | −3,4% | −16,3% | −1,1 · −3,3 · −5,6 | 3/3 | Chờ xác nhận |
| TCX | CK | 38,10 | −5,0% | — | — | — | — | Chờ xác nhận |
| VND | CK | 16,40 | −7,9% | −6,0% | −38,3% | −8,0 · +11,2 · −8,9 | 2/3 | Chờ xác nhận |
| MBB | NH | 22,15 | −9,9% | −7,2% | −21,9% | −4,4 · −1,8 · −10,2 | 3/3 | Chờ xác nhận |
| **NT2** | Tiện ích | 20,70 | −12,7% | −7,2% | −29,7% | −9,0 · −6,2 · −9,4 | 3/3 | Chờ xác nhận |
| **GEG** | Tiện ích | 12,05 | −15,9% | −8,7% | −31,4% | −2,7 · −0,1 · −12,7 | 3/3 | Chờ xác nhận |
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
| **Mua được** | 8 | MSB · LPB · HCM · VCK · STB · VPX · ACB · **POW** |
| **Chờ xác nhận** | 11 | HDB · TCX · VND · MBB · **NT2** · **GEG** · IDC · VGC · CTG · MBS · HHV |
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

## B.0. Cơ cấu ngành và cách đọc phần này

| Vai trò | Ngành |
|---|---|
| **Chính** | Tài chính Ngân hàng · **Hạ tầng Tiện ích** · Bất động sản Dân dụng |
| **Dự bị** | **Công ty Chứng khoán** · Thi công Xây dựng · Bất động sản Khu công nghiệp |

Hai thay đổi so với bản rev2: **Hạ tầng Tiện ích được nâng lên ngành chính**, và **Công ty Chứng khoán hạ xuống ngành dự bị**.

> **Báo cáo này không ghi tỷ trọng phần trăm cho từng cổ phiếu.** Đầu ra phân bổ gồm đúng hai thứ: **tổng tỷ trọng cổ phiếu của cả danh mục** theo dải regime kèm lộ trình, và **thứ tự ưu tiên từng mã** kèm trần thanh khoản riêng.
>
> Lý do: con số phần trăm từng mã giả vờ chính xác ở mức bảng chấm không hỗ trợ được — chênh một điểm trên thang mười lăm không biện minh được cho chênh hai điểm phần trăm tỷ trọng. Nó cũng không dùng chung được vì quy mô danh mục mỗi nhà đầu tư khác nhau. Việc chia tổng tỷ trọng ra từng mã là quyết định của người quản lý danh mục.
>
> **Vẫn giữ trần thanh khoản** — không giải ngân quá 5% khối lượng bình quân 20 phiên mỗi phiên, build tối thiểu ba phiên. Đó là ràng buộc an toàn, trả lời "tối đa vào được bao nhiêu", khác với mục tiêu tỷ trọng.

### Danh mục theo vai trò

| Vai trò | Mã | Ý nghĩa |
|---|---|---|
| **Lõi** | **ACB · LPB · MSB** | Vào trước, giữ lâu nhất, cắt sau cùng |
| **Lõi có điều kiện** | **HDB** | Vào một phần ngay, phần còn lại khi có xác nhận kỹ thuật |
| **Bổ sung** | **STB · VCK · HCM** | Vào sau khi nhóm lõi đã đủ |
| **Chờ xác nhận — Ngân hàng** | MBB · CTG | Mở khoá theo báo cáo tài chính quý 2 |
| **Chờ điều kiện — Tiện ích** | **NT2 · POW · GEG** | Không mã nào vào tuần 1 |
| **Theo dõi — Bất động sản** | NLG · HDG · KDH · DXG · CEO · TAL | 0% cho tới khi thoả ba điều kiện kích hoạt |
| **Theo dõi — dự bị khác** | TCX · MBS · IDC · VGC · HHV | Mở khoá có điều kiện |
| **Loại khỏi danh mục** | SHB · VCI · VND · SSI · SHS · VIX · CTD · VPX | Không mua trong chu kỳ này |

---

## B.1. Tài chính ngân hàng

### B.1.1. Trạng thái dữ liệu — phải đọc trước bảng xếp hạng

Tra cứu ngày 29/07/2026: **chỉ ba trên tám ngân hàng đã công bố kết quả 6 tháng 2026.**

| Đã công bố số 6T/2026 | Chưa công bố BCTC quý 2 |
|---|---|
| **ACB · LPB · MSB** | **MBB · HDB · CTG · SHB · STB** |

Với năm mã chưa công bố, mọi con số quý 2 đang lưu hành trên báo chí là **dự phóng của công ty chứng khoán**. Theo Nguyên tắc 3, năm mã này không được nâng lên vai trò lõi trước khi có báo cáo thật — dự kiến 30/07 (riêng lẻ) và 14/08 (hợp nhất).

*Cảnh báo nguồn: con số "13.187 tỷ, tăng 31%" đang bị các báo gán lẫn lộn cho cả CTG lẫn HDB. Không dùng cho mã nào.*

### B.1.2. Bảng đánh giá

| Mã | Tầng xu hướng | vs MA200 | Từ đỉnh 52T | Dữ liệu Q2 | Chất lượng tài sản | **Vai trò** |
|---|---|---|---|---|---|---|
| **ACB** | Mua được | +6,2% | −11,5% | **[công bố]** | **NPL 1,03% · LLR 105%** | **Lõi — ưu tiên 1** |
| **LPB** | Mua được | +17,9% | −8,5% | **[công bố]** | Chưa công bố chi tiết | **Lõi** |
| **MSB** | Mua được | +21,0% | −3,3% | **[công bố]** | NPL 1,64% riêng lẻ · CASA ~29% | **Lõi — trừ điểm pha loãng** |
| **HDB** | Chờ xác nhận — **override** | −3,8% | −16,3% | [chưa công bố] | LLR ~50% Q1 · NPL 1,86% | **Lõi có điều kiện** |
| **STB** | Mua được | +16,3% | −5,6% | [chưa công bố] | NPL ~5,6% [ước tính] | **Bổ sung — động lượng thuần** |
| MBB | Chờ xác nhận | −9,9% | −21,9% | [chưa công bố] | NPL 1,42% (Q1) | Chờ xác nhận |
| CTG | Chờ xác nhận | −16,2% | −32,3% | [chưa công bố] | **LLR 163% tại 31/05 — mạnh nhất** | Chờ xác nhận |
| **SHB** | **Loại thẳng** | **−24,2%** | **−40,5%** | [chưa công bố] | **NPL ~3,0% · LLR 71% (Q1)** | **Loại** |

### B.1.3. ACB — ưu tiên hàng đầu

ACB là cổ phiếu duy nhất trong 31 mã khảo sát hội tụ đồng thời ba điều kiện: cấu trúc xu hướng còn nguyên, kết quả quý 2 đã công bố, và chất lượng tài sản tốt nhất nhóm.

**Xu hướng.** Trên MA200 6,2%, chỉ cách đỉnh 52 tuần 11,5%. Chuỗi 120 phiên: **−3,6% · +14,8% · −0,7%** — đã tạo đáy quanh đoạn giữa và đi ngang ở đoạn gần nhất.

**Kết quả 6 tháng 2026 [công bố]:**

| Chỉ tiêu | Giá trị |
|---|---|
| Lợi nhuận trước thuế 6 tháng | **10.735 tỷ, hoàn thành 107% kế hoạch 6 tháng** |
| Lợi nhuận trước thuế quý 2 | 5.366 tỷ, **−11,9%** — do dự phòng tăng 128,9% |
| Thu nhập lãi thuần quý 2 | 7.784 tỷ, **+16,5%** |
| NIM quý 2 | **3,02%**, tăng 0,2 điểm % so quý 1 |
| Tăng trưởng tín dụng 6 tháng | **+8,6%** (745.759 tỷ), cao hơn bình quân ngành |
| Bán lẻ / SME quý 2 | **+3,8% / +5%** — mảng lõi bắt đầu khởi sắc |
| Tỷ lệ nợ xấu 30/06 | **1,03%** — thấp nhất nhóm |
| Bao phủ nợ xấu | **105%** |
| CIR quý 2 | Dưới 30% |
| Cổ tức 2025 đã chi trả | 20% — **7% tiền mặt + 13% cổ phiếu**, vốn điều lệ vượt 58.000 tỷ |

**Cảnh báo nợ nhóm 2 cần đọc lại cho đúng hướng.** Chỉ tiêu này tăng 93,4% trong sáu tháng, từ 2.493 lên 4.822 tỷ. Nhưng diễn biến theo quý cho thấy **toàn bộ mức tăng hình thành trong quý 1**: tại 31/03 đã ở khoảng 5.000 tỷ, tại 30/06 **giảm nhẹ về 4.822 tỷ**. Nợ nhóm 2 đã tạo đỉnh và đi ngang, không phải đang trên đà tăng.

**Bốn rủi ro giữ nguyên, không được bỏ qua vì mã ở vai trò lõi:**

1. **Lợi nhuận quý 2 giảm 11,9%** — con số 6 tháng đẹp che đi việc quý 2 đi lùi. Sáu tháng mới đạt khoảng 48% kế hoạch cả năm 22.338 tỷ, áp lực dồn về nửa sau.
2. **Áp lực đã dịch xuống nhóm dưới:** nợ nhóm 3 tăng 76,6%, nhóm 4 tăng 74%. Chi phí dự phòng 6 tháng 1.746 tỷ, tăng 60,3%.
3. **Cơ cấu nguồn vốn xấu đi:** tiền gửi khách hàng **giảm 1,5%** từ đầu năm trong khi tín dụng tăng 8,6%; khoảng trống bù bằng **giấy tờ có giá phát hành tăng 49,3%** lên 199.013 tỷ. Nguồn vốn đắt hơn và kém ổn định hơn; LDR lên 81,4%.
4. **CAR 11,8%** — mỏng so với mặt bằng, và vừa chi khoảng 3.600 tỷ cổ tức tiền mặt. Thu ngoài lãi cũng yếu: lãi ngoại hối −56,3%, mua bán chứng khoán từ lãi 446,1 tỷ chuyển thành **lỗ 21,3 tỷ** trong quý 2.

*Ghi chú: Công ty Bảo hiểm Phi nhân thọ ACB vốn điều lệ 500 tỷ mới ở mức đại hội thông qua, cơ cấu góp vốn đã đổi thành ACBA 91% và ACBS 9%; **chưa có giấy phép của Bộ Tài chính**, nên chưa tính vào luận điểm lợi nhuận.*

### B.1.4. HDB — nâng lên vai trò lõi có điều kiện

> **Đây là override của Nguyên tắc 1, ghi rõ để không tự lừa mình.** HDB đang ở −3,8% dưới MA200 và **giảm ở cả ba đoạn** của chuỗi 120 phiên, tức thuộc tầng chờ xác nhận. Theo nguyên tắc thì phải có hai tín hiệu xác nhận trước khi mua; quyết định đưa vào tuần 1 bỏ qua bước đó. Đã ghi `audit_overrides.md`.

**Cơ sở của việc nâng — ba việc đã HOÀN TẤT trong nửa đầu 2026, bản rev2 bỏ sót:**

| Nội dung | Trạng thái |
|---|---|
| Nâng sở hữu **HD SAISON từ 50% lên 75%** | **[công bố — hoàn tất 24/03/2026]** |
| Nâng sở hữu **Chứng khoán HD (HDS) từ 30% lên 90%** | **[công bố — hoàn tất]**, hợp nhất vào báo cáo HDB **từ quý 2/2026** |
| **HDS đã công bố quý 2/2026** | LNTT **1.118 tỷ, gấp gần 4 lần cùng kỳ** [công bố 23/07/2026] |
| **CAR 16,16–16,2%** tại 31/03/2026 | **[công bố]** — cao nhất nhóm ngân hàng niêm yết. Tier 1 10,4%, LDR 67,7% |
| Nhận chuyển giao bắt buộc **Vikki Digital Bank** (nguyên DongA Bank) | [công bố] — nay là công ty con 100% |
| Kế hoạch lợi nhuận trước thuế 2026 **30.100 tỷ, +41%** | **[kế hoạch — ĐHĐCĐ 24/04/2026]** |
| **IPO Chứng khoán HD** | **[mục tiêu — tháng 9/2026]**, chưa nộp hồ sơ công bố |
| IPO HD SAISON | [đang xem xét trong năm 2026] — **chưa có mốc cụ thể** |

**Hai đính chính bắt buộc so với luận điểm đang lưu hành:**

| Nội dung lưu hành | Thực tế xác minh được |
|---|---|
| "Hạn mức tăng trưởng tín dụng được cấp tới 37%, dẫn đầu hệ thống" | **37% là kế hoạch tự đặt của HDBank** (dư nợ mục tiêu 804.562 tỷ), **không phải hạn mức Ngân hàng Nhà nước cấp**. Không có công bố nào về việc được cấp room 37%. Dự phóng thị trường ở dải 27–34%; một đơn vị phân tích ghi mục tiêu 35% |
| "Cổ tức tổng tỷ lệ 30% bằng cổ phiếu và tiền mặt" | **30% hoàn toàn bằng cổ phiếu, không có cấu phần tiền mặt.** Báo chí đưa tít rõ "chưa chia cổ tức bằng tiền mặt" |

**Bốn rủi ro thật, luận điểm chưa nhắc — và chúng là lý do HDB chỉ vào một phần ở tuần 1:**

1. **Bộ đệm dự phòng mỏng nhất nhóm.** Tỷ lệ bao phủ nợ xấu hợp nhất quý 1 khoảng **43,4–50%**, so với bình quân ngành quý 1 khoảng 87,65% và ACB 105%. Ban lãnh đạo đặt mục tiêu nâng lên 75–80% — tức chính họ thừa nhận cần trích lập thêm, và phần đó ăn vào lợi nhuận. NPL hợp nhất quý 1 **1,86%**, tăng từ 1,66% cuối 2025.
2. **Pha loãng đáng kể và gần như chắc chắn kích hoạt.** Đại hội thông qua tăng vốn điều lệ thêm tới **9.891 tỷ lên 59.945 tỷ**, gồm **phát hành riêng lẻ 700 triệu cổ phiếu** và **chuyển đổi 2.891 tỷ trái phiếu ở giá 13.100 đồng** so với thị giá quanh 26.800 đồng ngày 21/07. Mức chênh hơn gấp đôi khiến chuyển đổi gần như chắc chắn xảy ra. Cộng thêm cổ tức cổ phiếu 30%.
3. **Chất lượng tăng trưởng 2026 có yếu tố một lần.** Phần lớn mức tăng lợi nhuận dự kiến đến từ **thu nhập khi nâng sở hữu HD SAISON và hợp nhất HDS** — không phải lợi nhuận lõi lặp lại. Một đơn vị phân tích dự phóng cả năm chỉ **+32% (28.043 tỷ)**, thấp hơn kế hoạch 30.100 tỷ, trong khi quý 1 chỉ tăng 14%.
4. **Chưa công bố báo cáo tài chính quý 2** tính đến 29/07/2026. Room ngoại 49% là thật nhưng ngân hàng **chủ động khoá ở 17,5%** và chưa có đối tác cụ thể.

**Ba ngưỡng huỷ luận điểm HDB — kiểm khi báo cáo quý 2 ra:**

1. **Bao phủ nợ xấu không cải thiện lên trên 60%** → hạ về vai trò bổ sung, không giữ ở lõi.
2. **Ngày chốt quyền phát hành riêng lẻ hoặc chuyển đổi trái phiếu rơi trong tháng 8** → giảm vị thế trước ngày chốt.
3. **IPO Chứng khoán HD trượt khỏi tháng 9/2026** → luận điểm mở khoá định giá hệ sinh thái mất mốc thời gian, đánh giá lại từ đầu.

### B.1.5. LPB, MSB và STB

**LPB — cấu trúc giá tốt nhất trong toàn bộ danh sách khảo sát.** Chuỗi 120 phiên **+21,9% · +7,7% · +2,7%, không đoạn nào giảm** — mã duy nhất đạt được điều đó. Trên MA200 17,9%, cách đỉnh 52 tuần 8,5%. Tín dụng 6 tháng +9,6% [công bố]. Hai điểm trừ: lợi nhuận trước thuế 6 tháng **5.973 tỷ, giảm 3,1%**; và **P/B 3,23, gấp khoảng 2,4 lần trung bình ngành** — mua LPB là mua động lượng và chất lượng vận hành, không phải mua rẻ.

**MSB — đứng cao nhất so với MA200 (+21,0%) và gần đỉnh 52 tuần nhất (−3,3%).** Lợi nhuận 6 tháng trên 3.400 tỷ, +8% [công bố]; nợ xấu 1,64% riêng lẻ; CASA gần 29%. **Điểm trừ:** Ngân hàng Nhà nước đã chấp thuận tăng vốn từ 31.200 lên tối đa 37.440 tỷ, **phát hành 624 triệu cổ phiếu tỷ lệ 20% cho cổ đông hiện hữu** [công bố] — pha loãng 20% nằm trong hoặc sát horizon.

**STB — nghịch lý giá mạnh trên nền lợi nhuận sụp.** Đạt bộ lọc xu hướng (trên MA200 16,3%, cách đỉnh 5,6%) nhưng **chưa công bố BCTC quý 2**; ước tính 6 tháng khoảng 1.900–2.000 tỷ, **giảm khoảng 50%**; nợ xấu ước khoảng **5,6%**, cao nhất nhóm. Luận điểm phụ thuộc việc phê duyệt đấu giá 32,5% cổ phần liên quan xử lý nợ, chưa có mốc. **Chỉ giữ ở vai trò bổ sung với vị thế động lượng, đánh giá lại ngay khi báo cáo quý 2 ra.**

### B.1.6. SHB — rút khỏi danh mục

Cấu trúc xu hướng yếu nhất nhóm và yếu rõ rệt: **−24,2% dưới MA200, −40,5% từ đỉnh 52 tuần, giảm cả ba đoạn**. Mã đứng thứ hai từ dưới lên là CTG với −16,2% — khoảng cách giữa SHB và phần còn lại lớn hơn khoảng cách giữa các mã còn lại với nhau.

Chất lượng tài sản yếu nhất theo số quý 1 [công bố]: nợ xấu 16.320 tỷ tăng 12% từ đầu năm, tỷ lệ khoảng **3,0%**; **bao phủ nợ xấu chỉ 71%** và đang giảm; chi phí dự phòng quý 1 tăng **146,7%**. Cộng kế hoạch phát hành **750 triệu cổ phiếu** nâng vốn lên 53.442 tỷ.

Thương vụ Krungsri là thật và đang tiến triển — Ngân hàng Nhà nước chấp thuận thủ tục khoảng 20/07/2026, dự kiến hoàn tất giữa quý 3. Nhưng **giá trị thương vụ và mức thặng dư không tra được từ nguồn công khai**, tức catalyst có hướng nhưng không định lượng được độ lớn. Không đủ bù cho ba điểm trên.

**Điều kiện đưa lại:** đóng cửa trên MA20 ba phiên liên tiếp, **và** báo cáo quý 2 cho thấy bao phủ nợ xấu đã ngừng giảm.

### B.1.7. MBB và CTG — chờ xác nhận

**MBB** có chất lượng tài sản tốt theo số quý 1 (nợ xấu 1,42%) và room ngoại vừa nới lên 49%. Nhưng xu hướng ở −9,9% dưới MA200, cách đỉnh 21,9%, **giảm cả ba đoạn** — yếu hơn ACB và HDB. **Điều kiện mở khoá:** nợ xấu quý 2 giữ dưới 1,6% và đóng cửa trên MA20 ba phiên.

**CTG** có **bao phủ nợ xấu 163% tại 31/05, mạnh nhất nhóm**, và ngưỡng dừng lỗ kỹ thuật chỉ −2,6% nếu vào. Xu hướng ở −16,2% nên chưa đạt. **Điều kiện mở khoá:** bao phủ nợ xấu quý 2 giữ trên 140% và đóng cửa trên MA20 ba phiên.

---

## B.2. Hạ tầng Tiện ích — nâng lên ngành chính

Ngành này đứng đầu danh sách phòng thủ trong đánh giá vĩ mô gốc và bị bỏ qua ở hai bản trước. Nền ngành ủng hộ: **P/E 9,40 ở phân vị 3,2% của ba năm**, mùa vụ tháng 8 dương 4/6 năm với trung bình +6,34%, và là ngành cầu ít co giãn, **không chịu tác động trực tiếp từ thuế Section 301**.

### B.2.1. Ba mã đã duyệt, không mã nào vào tuần 1

| Chỉ tiêu | **NT2** | **POW** | **GEG** |
|---|---|---|---|
| Vốn hoá (tỷ) | 5.959 | **40.802** | 4.477 |
| P/E trailing | **4,68** | 12,83 | 8,34 |
| P/B | 1,18 | 0,99 | **0,66** |
| EV/EBITDA | **4,19** | 9,27 | 7,14 |
| ROE trailing 5 quý | 6,79 → 11,62 → 15,35 → 24,98 → **27,24%** | 4,00 → 4,61 → 5,81 → 7,33 → **9,15%** | 8,92 → 11,79 → 13,55 → 15,09 → **10,70%** |
| **BCTC quý 2** | **[công bố]** | **[công bố]** | **chưa công bố** |
| Doanh thu quý 2 | 2.800 tỷ, **+36%** | — | — |
| Lợi nhuận quý 2 | LNST **403 tỷ, +23%** | LNTT **~3.594 tỷ, gấp 4,6 lần** | [dự phóng] ~62 tỷ, **−63%** |
| Kết quả 6 tháng | DT 4.996 tỷ (+42%) · LNTT **727 tỷ (+78%)** | DT **33.520 tỷ (+87%)** · LNTT **5.002 tỷ, gấp 3,9 lần** | Quý 1 lợi nhuận **−57%** |
| ADV (tỷ/phiên) | 11,0 | **121,9** | 3,0 |
| Trần vị thế theo thanh khoản | ~1,7 tỷ | **~18 tỷ** | **~450 triệu** |
| vs MA200 | −12,7% | **+1,2%** | −15,9% |
| Đoạn giảm 120 phiên | 3/3 | 1/3 | 3/3 |

### B.2.2. Thứ tự ưu tiên trong ngành: NT2 → POW → GEG

**NT2 đứng đầu** vì là mã duy nhất hội tụ bốn điều: định giá rẻ nhất nhóm (P/E 4,68, EV/EBITDA 4,19); ROE trailing tăng liên tục năm quý không gãy, từ 6,79% lên 27,24%; **quý 2 đã công bố và tốt**; và **còn dư địa lớn so với kế hoạch của chính nó** — kế hoạch cả năm 2026 đặt lợi nhuận sau thuế 430,03 tỷ, giảm 62%, trên giả định giá khí cao, nhưng sáu tháng đã đạt lợi nhuận trước thuế 727 tỷ. Một đơn vị phân tích ước cả năm 948 tỷ. Cổ tức kế hoạch 2026 **15%**, nâng từ 10% của 2025. Đang tích luỹ tiền mặt cho dự án Nhơn Trạch 5 công suất 300–600 MW, vốn khoảng 9.000 tỷ.

*Điểm trừ NT2:* biên gộp quý 1/2026 rơi về **10,02%** từ 25,06% của quý 4 — đặc thù giá khí đầu vào. Doanh nghiệp đang lấy ý kiến cổ đông về hợp đồng mua bán khí, đây là biến cần theo dõi. Thanh khoản 11 tỷ/phiên cho trần vị thế khoảng 1,7 tỷ.

**POW đứng thứ hai — và lý do không phải vì kém.** Đây là mã duy nhất trong ngành vừa đạt bộ lọc xu hướng (trên MA200 +1,2%, chỉ 1/3 đoạn giảm) vừa vào được size có ý nghĩa (ADV 121,9 tỷ, trần vị thế khoảng 18 tỷ). Quý 2 bùng nổ: lợi nhuận trước thuế khoảng 3.594 tỷ, gấp 4,6 lần cùng kỳ; sáu tháng doanh thu 33.520 tỷ tăng 87%, lợi nhuận trước thuế 5.002 tỷ gấp 3,9 lần; sản lượng 13.034 triệu kWh tăng 42%, đạt 115% kế hoạch sáu tháng. ROE trailing tăng đều năm quý.

> **Nhưng đây là điểm phải đọc kỹ nhất của cả mục B.2: kế hoạch nửa cuối năm của POW chỉ bằng khoảng một phần năm nửa đầu.** Doanh nghiệp đặt nửa sau sản lượng trên 10,3 tỷ kWh, doanh thu 23.932 tỷ và **lợi nhuận trước thuế 1.028 tỷ** — so với 5.002 tỷ của sáu tháng đầu. Tức chính doanh nghiệp không kỳ vọng lặp lại quý 2.
>
> Với horizon 1–3 tháng, mua ngay sau một quý bùng nổ mà hướng dẫn nửa sau giảm mạnh là mua vào đỉnh của nhịp ngắn. Đây là lý do POW xếp sau NT2 dù mọi chỉ tiêu quy mô và thanh khoản đều vượt trội.

**GEG đứng cuối, và yếu trên cả ba trục.**

- **Cơ bản đang xấu đi:** doanh thu quý 1/2026 **giảm 31,0%** so cùng kỳ; ROE trailing đảo chiều từ 15,09% xuống **10,70%**; hệ số PEG âm 18,4 xác nhận lợi nhuận đang co. Quý 1 lợi nhuận giảm 57%. Quý 2 **chưa công bố**, dự phóng lợi nhuận sau thuế khoảng 62 tỷ, **giảm 63%** — một phần do nền cao vì quý 2/2025 có hơn 100 tỷ từ thoái vốn thuỷ điện Trường Phú.
- **Doanh thu điện gió quý 1 giảm 47% còn 440 tỷ dù sản lượng vẫn tăng 2%** — tức vấn đề nằm ở **giá bán**, không phải sản lượng. Đây là rủi ro chính sách giá, khó tự hết theo thời gian.
- **Xu hướng xa điểm xác nhận nhất** và **thanh khoản mỏng nhất** (3,0 tỷ/phiên, trần vị thế khoảng 450 triệu).

*Điểm cộng thật của GEG:* P/B 0,66 rẻ nhất nhóm; đã **cắt khoảng 1.000 tỷ dư nợ**, dư nợ vay chịu lãi còn 8.176 tỷ giảm 10% so cùng kỳ; nhà máy điện mặt trời Đức Huệ 2 vận hành từ tháng 5/2026 và dự án điện gió VPL2 là động lực sản lượng phía trước.

> **Cảnh báo định giá:** P/E 8,34 của GEG là **hệ số trailing**, tính trên lợi nhuận bốn quý trong đó có ba quý trước khi doanh thu sụt. Đây đúng dạng bẫy đã cảnh báo với cổ phiếu chu kỳ ở phần chọn ngành.

### B.2.3. Điều kiện mua — không mã nào vào tuần 1

Áp tầng chờ xác nhận của Nguyên tắc 1: **đóng cửa trên MA20 ba phiên liên tiếp và không tạo đáy mới trong 10 phiên.**

| Mã | Ngưỡng MA20 cần vượt | Khoảng cách hiện tại | Điều kiện bổ sung |
|---|---|---|---|
| **NT2** | **21,57** | +4,2% | Biên gộp quý 2 không tiếp tục co dưới 10% |
| **POW** | **13,96** | +5,0% | **Chỉ vào nếu giá đã chiết khấu đủ so với đỉnh sau tin quý 2** — không đuổi giá ngay sau kết quả bùng nổ |
| **GEG** | **12,77** | +6,0% | **Khối lượng phiên vượt phải trên bình quân 20 phiên**, và quý 2 công bố không xấu hơn dự phóng −63% |

Điều kiện siết thêm cho GEG là có chủ ý: chuỗi ba đoạn của mã này là **−2,7% · −0,1% · −12,7%** — hai đoạn đầu gần như đi ngang rồi đoạn cuối rơi mạnh, tức vừa gãy chứ chưa bào mòn xong. Dạng này dễ có nhịp bật giả trên thanh khoản cạn.

### B.2.4. Hạn chế của ngành này về khả năng hấp thụ vốn

**Chỉ POW vào được size có ý nghĩa.** Trần vị thế theo thanh khoản: POW khoảng 18 tỷ, NT2 khoảng 1,7 tỷ, GEG khoảng 450 triệu. Với danh mục từ vài chục tỷ trở lên, NT2 và GEG chỉ đóng vai trò vệ tinh.

Hệ quả thực tế: dù là ngành chính, Hạ tầng Tiện ích **khó gánh được tỷ trọng tương đương nhóm ngân hàng** trừ khi POW là mã chủ lực. Cần nhìn thẳng điều này khi lập kế hoạch phân bổ, thay vì giả định ba mã chia đều.

*Phần chưa xác minh được: lịch đại tu và sửa chữa lớn của NT2 năm 2026, sản lượng hợp đồng Qc được giao, và cơ chế chuyển ngang chi phí khí vào giá điện. Ba nội dung này ảnh hưởng trực tiếp tới biên quý 3 và cần bổ sung trước khi nâng NT2 lên vai trò lõi.*

---

## B.3. Công ty Chứng khoán — hạ xuống ngành dự bị

Ngành này bị hạ từ ngành chính xuống dự bị. Lý do không phải chất lượng doanh nghiệp mà là **điều kiện sống còn của luận điểm chưa đạt**: lợi nhuận ngành gắn trực tiếp vào thanh khoản thị trường, và thanh khoản đang thu hẹp chứ không mở rộng.

Giá trị giao dịch HOSE bình quân 5 phiên đạt 15.269 tỷ, nhìn qua thì đã vượt ngưỡng xác nhận. Nhưng con số này bị nâng bởi riêng phiên 22/07 với 21.255 tỷ trên nền chỉ số giảm 3,58% — khối lượng bán tháo, không phải dòng tiền vào. Loại phiên đó ra, bốn phiên còn lại bình quân 13.772 tỷ; **ba phiên gần nhất chỉ còn 12.590 tỷ**.

Bối cảnh ngành quý 2 cũng không thuận: giá trị giao dịch bình quân ba sàn giảm còn khoảng **24.083 tỷ/phiên** so với khoảng 35.000 tỷ của quý 1; riêng tháng 6 chỉ 19.981 tỷ, thấp nhất kể từ tháng 2/2025. Ngược lại dư nợ cho vay toàn ngành lập kỷ lục khoảng **454 nghìn tỷ, tăng 49%** so cùng kỳ, với lãi suất cho vay ký quỹ đã nâng lên vùng 13–14%/năm. **Đây không phải quý thuận lợi của nghề môi giới, mà là quý thuận lợi của nghề cho vay** — và loại dư nợ tăng thêm mang đặc tính tín dụng nhiều hơn đặc tính môi giới.

### B.3.1. Hai mã giữ lại ở vai trò bổ sung

| Mã | Tầng xu hướng | vs MA200 | Hạng chất lượng Q2 | Điểm | ADV (tỷ) | Vai trò |
|---|---|---|---|---|---|---|
| **VCK** | Mua được | **+16,5%** | **1/8** | **73,3** | 92,4 | **Bổ sung** |
| **HCM** | Mua được | +17,9% | 6/8 | 47,9 | 150,7 | **Bổ sung** |
| VPX | Mua được | +11,9% | 7/8 | 47,3 | 37,7 | **Loại** |
| TCX | Chờ xác nhận | −5,0% | 3/8 | 51,2 | 74,7 | Theo dõi |
| MBS | Chờ xác nhận | −16,3% | **2/8** | 52,1 | 216,2 | Theo dõi |
| VND | Chờ xác nhận | −7,9% | **8/8** | 42,9 | 289,2 | **Loại** |
| SSI | Loại thẳng | −21,7% | 5/8 | 48,4 | 526,5 | Theo dõi |
| VCI | Loại thẳng | −23,5% | 4/8, **loại định tính** | 50,4 | 210,0 | **Loại** |
| SHS · VIX | Loại thẳng | −22,3% · −35,4% | ngoài mẫu | — | — | **Loại** |

**VCK giữ lại vì đây là mã duy nhất trong toàn bộ danh sách khảo sát vừa đứng đầu bảng chất lượng quý 2 vừa còn nguyên xu hướng tăng.** Điểm 73,3 trên 100, cách mã thứ hai **21,2 điểm** — khoảng cách đủ lớn để kết luận vững, khác hẳn nhóm hạng 2 đến hạng 7 chỉ chênh nhau chưa tới 5 điểm.

Cấu hình mà không mã nào khác trong mẫu có: lợi suất cho vay ký quỹ **13,36%** cao nhất · chi phí vốn **5,74%** thấp nhất · **chênh lệch lãi 7,62%** cao nhất, hơn mã thứ hai trên 1 điểm phần trăm · đòn bẩy tài chính **1,53 lần** thấp nhất · dư nợ trên vốn chủ **1,00 lần**, còn nguyên dư địa gấp đôi trước trần 200% · ROE 12 tháng **19,9%** cao nhất · lợi nhuận chưa thực hiện chỉ 0,5% lợi nhuận trước thuế · lãi đánh giá lại ghi vốn chủ **dương 31 tỷ**.

*Rủi ro VCK:* lãi cơ bản trên cổ phiếu gần như đi ngang dù lợi nhuận tăng 62,7%, do số cổ phiếu tăng **60%** trong sáu tháng; thị phần môi giới lớn nhất thị trường nên chịu tác động nặng khi thanh khoản cạn, doanh thu môi giới quý 2 đã giảm 15%; **mới niêm yết 16/12/2025** nên chưa đủ mười tháng lịch sử công bố thông tin.

**HCM giữ lại** vì cấu trúc xu hướng tốt nhất nhóm (+17,9% trên MA200) và thanh khoản 150,7 tỷ/phiên. Chất lượng lợi nhuận rất thận trọng — lợi nhuận chưa thực hiện **âm 222 tỷ** ở quý 2, tức lợi nhuận đã thực hiện cao hơn lợi nhuận kế toán. **Điểm chặn:** dư nợ trên vốn chủ **1,98 lần đã sát trần quy định 200%**, chênh lệch lãi 3,57% mỏng, ROE 10,5% thấp. Câu chuyện tăng trưởng phụ thuộc hoàn toàn vào đợt chào bán khoảng 2.700 tỷ đang triển khai.

**VPX bị loại** dù đạt bộ lọc xu hướng: **49,7% lợi nhuận trước thuế quý 2 đến từ khoản một lần** — 822 tỷ phí bảo lãnh phát hành và 350 tỷ tư vấn tài chính, vốn bằng không cùng kỳ. Độ lệch biên lợi nhuận ròng 13,8 cao nhất mẫu. Cần thêm ít nhất hai quý để xác lập mặt bằng lợi nhuận thật.

### B.3.2. Điều kiện kích hoạt lại cả ngành

Nâng Chứng khoán trở lại vai trò ngành chính khi **giá trị giao dịch HOSE bình quân 5 phiên vượt 15.000 tỷ mà trong 5 phiên đó không có phiên nào chỉ số giảm quá 2%**. Nếu bình quân 5 phiên xuống dưới 11.000 tỷ, cắt cả VCK và HCM.

### B.3.3. Ba mã bị loại — giữ nguyên lý do từ bản rev2

**VCI** — sáu tháng báo lãi 591 tỷ nhưng **vốn chủ sở hữu GIẢM 872 tỷ**, do lỗ đánh giá lại danh mục 1.251 tỷ ghi thẳng vào vốn chủ. Xét trên tổng thu nhập toàn diện, doanh nghiệp lỗ chứ không lãi. Cộng xu hướng −23,5% dưới MA200 — **loại bởi cả hai bộ lọc, độc lập với nhau**.

**VND** — xếp **hạng 8 trên 8**. 88% mức tăng lợi nhuận đến từ hoàn nhập dự phòng, là khoản không tái diễn theo định nghĩa; phụ thuộc tự doanh **44,5%** cao nhất mẫu; và là **doanh nghiệp duy nhất có dư nợ cho vay thu hẹp** (−10,2% từ đầu năm) trong đúng quý toàn ngành mở rộng 7%.

**SSI, SHS, VIX** — đều ở tầng loại thẳng theo bộ lọc xu hướng. SSI có chất lượng số liệu tốt nhất mẫu và là ứng viên bổ sung đầu tiên khi xu hướng phục hồi; lý do chưa mua là xu hướng giá, **không phải dòng tiền khối ngoại**.

---

## B.4. Bất động sản Dân dụng — giữ ngành chính, tỷ trọng 0%

Toàn bộ sáu mã đều thuộc tầng loại thẳng, không có ngoại lệ.

| Mã | Dưới MA200 | Từ đỉnh 52T | Đoạn giảm |
|---|---|---|---|
| CEO | −39,9% | −64,6% | 3/3 |
| KDH | −37,9% | −55,5% | 3/3 |
| TAL | −35,4% | −49,1% | 3/3 |
| HDG | −33,6% | −50,5% | 3/3 |
| NLG | −29,5% | −54,0% | 3/3 |
| DXG | −27,1% | −52,3% | 2/3 |

Giữ vị trí ngành chính vì **luận điểm định giá vẫn nguyên giá trị** — loại ba trụ Vingroup, P/B ngành 1,07 rẻ hơn cả đáy tháng 11/2022 (1,54) lẫn đáy tháng 4/2025 (1,18), phân vị 0,6% của ba năm. Vấn đề duy nhất là thời điểm.

**Ba điều kiện kích hoạt, phải thoả đồng thời, kiểm riêng từng mã:**

1. Giá đóng cửa trên MA20 trong **ba phiên liên tiếp**.
2. Không tạo đáy mới trong **15 phiên** gần nhất.
3. Khoảng cách tới MA200 thu hẹp về **dưới 25%**.

**Thứ tự ưu tiên khi điều kiện được thoả:** NLG (backlog 10.878 tỷ, cơ sở doanh thu chắc chắn nhất nhóm, đang giảm đòn bẩy) → HDG (mã duy nhất có dòng tiền kinh doanh dương sáu quý liên tiếp, ROE 10,11% cao thứ hai ngành) → KDH (bảng cân đối sạch nhất, sạch nợ trái phiếu, lãnh đạo mua bằng tiền cá nhân) → DXG → CEO và TAL.

Cửa sổ sớm nhất điều kiện thứ hai có thể được thoả là khoảng **18–19/08**, tính từ đáy 22–27/07.

---

# PHẦN C — KẾ HOẠCH TRIỂN KHAI THEO TUẦN

## C.0. Hai thay đổi về cách trình bày

**Một — không còn tỷ trọng phần trăm cho từng cổ phiếu.** Phần này công bố **tổng tỷ trọng cổ phiếu của cả danh mục** và **thứ tự ưu tiên** từng mã. Việc chia tổng đó ra từng mã là quyết định của người quản lý danh mục, phụ thuộc quy mô vốn và vị thế đang có.

**Hai — trần 70% là trần CÓ ĐIỀU KIỆN, không phải lịch trình.** Số mã đạt điều kiện mua ngay hôm nay là **bảy**, trên tổng 31 mã khảo sát. Phần từ sàn lên trần phụ thuộc hoàn toàn vào việc các mã ở nhóm chờ có xác nhận hay không — điều đó do thị trường quyết, không do lịch quyết.

> **Nếu không mã nào ở nhóm chờ vượt được điều kiện trong tháng 8, tỷ trọng đúng của danh mục là 30–35%. Đó là kết quả đúng của khung phương pháp, không phải kế hoạch chưa hoàn thành.** Nâng tỷ trọng bằng cách hạ tiêu chuẩn lựa chọn là quay lại đúng lỗi của bản gốc.

## C.1. Lộ trình tổng tỷ trọng danh mục

**Dải hoạt động: sàn 30% — trần 70%.**

| Tuần | Phiên | **Sàn** | **Trần nếu xác nhận đủ** | Cửa mở khoá phần trên sàn |
|---|---|---|---|---|
| **T1** 30–31/07 | 2 | **30%** | 35% | Quyết định Fed rạng sáng 30/07 |
| **T2** 03–07/08 | 5 | 32% | **45%** | Số liệu vĩ mô 03/08 · BCTC riêng lẻ quý 2 nhóm ngân hàng |
| **T3** 10–14/08 | 5 | 35% | **60%** | BCTC hợp nhất quý 2, hạn 14/08 — **tuần giải ngân chính** |
| **T4** 17–21/08 | 5 | 35% | **70%** | Cửa sổ duy nhất cho nhóm BĐS · FTSE danh sách cuối 21/08 |
| **T5** 24–28/08 | 5 | **30%** | 60% | **Bắt buộc hạ 10 điểm %** trước rào 5 ngày nghỉ |

## C.2. TUẦN 1 — 30 và 31/07 (2 phiên)

**Chủ đề: đưa danh mục về sàn 30% bằng nhóm đã đạt bộ lọc. Tổng mục tiêu 30–35%.**

Quyết định của Cục Dự trữ Liên bang Mỹ công bố rạng sáng 30/07 giờ Việt Nam. **Giải ngân sau khi có kết quả.**

**Thứ tự vào:**

| Thứ tự | Mã | Vai trò | Vùng mua | Ngưỡng dừng lỗ | Cơ sở |
|---|---|---|---|---|---|
| 1 | **ACB** | Lõi | 21,7 – 22,8 | 21,33 (−4,3%) | Mã duy nhất đủ ba điều kiện: xu hướng nguyên, Q2 công bố, chất lượng tài sản tốt nhất |
| 2 | **LPB** | Lõi | 52,7 – 53,8 | 51,19 (−3,8%) | Cấu trúc giá tốt nhất toàn bộ danh sách, 0/3 đoạn giảm |
| 3 | **MSB** | Lõi | 15,3 – 16,1 | 15,12 (−3,9%) | Trên MA200 21,0%, gần đỉnh 52 tuần nhất. Trừ điểm pha loãng 20% |
| 4 | **HDB** | Lõi có điều kiện | 24,2 – 25,5 | 24,08 (−3,1%) | **Override Nguyên tắc 1.** Vào khoảng 3/5 phần dự kiến, giữ lại 2/5 cho tới khi đóng cửa trên MA20 ba phiên |
| 5 | **VCK** | Bổ sung | 27,8 – 29,0 | 26,20 (−8,0%) | Đứng đầu bảng chất lượng Q2 với khoảng cách 21,2 điểm |
| 6 | **HCM** | Bổ sung | 24,6 – 25,6 | 23,30 (−7,0%) | Xu hướng tốt nhất nhóm chứng khoán. Dư địa tăng trưởng bị chặn bởi trần dư nợ |
| 7 | **STB** | Bổ sung | 71,4 – 72,9 | 69,48 (−3,7%) | Động lượng thuần, chưa có BCTC Q2. Vị thế nhỏ nhất nhóm |

**Ba việc bắt buộc song song:**

1. **Rà quản trị ba mã mới — VCK, HCM và TCX.** Ba nội dung: tin pháp lý và quản trị ba tháng gần nhất, kế hoạch phát hành nửa cuối 2026, tình trạng cổ đông lớn. Ba mã này chưa qua vòng loại trừ cứng vốn đã loại 13 mã. **Phát hiện vấn đề thì cắt ngay, không chờ giá.**
2. **Theo dõi công bố BCTC riêng lẻ quý 2 nhóm ngân hàng** — hạn khoảng 30/07, rơi đúng trong tuần.
3. **Không mua bất kỳ mã nào ngoài bảy mã trên**, kể cả ba mã Tiện ích vừa được duyệt.

**Không mua trong tuần 1:** toàn bộ nhóm Tiện ích (NT2, POW, GEG) · toàn bộ nhóm Bất động sản · MBB, CTG · toàn bộ 12 mã ở tầng loại thẳng.

## C.3. TUẦN 2 — 03 đến 07/08 (5 phiên)

**Chủ đề: số liệu vĩ mô và đợt BCTC riêng lẻ đầu tiên. Sàn 32% — trần 45%.**

**03/08 — số liệu kinh tế xã hội tháng 7.** Ba chỉ tiêu theo thứ tự quan trọng: CPI bình quân 7 tháng — nếu vượt 4,5% thì dư địa nới lỏng đóng lại và luận điểm tín dụng của cả ngân hàng lẫn bất động sản yếu đi; cán cân thương mại tháng 7 — tỷ giá chỉ còn cách trần biên độ 37 đồng; FDI đăng ký tháng 7 — số đầu tiên đo sau ngày thuế Section 301 hiệu lực.

**Mở khoá theo BCTC riêng lẻ quý 2:**

| Mã | Điều kiện nâng lên mức mua |
|---|---|
| **MBB** | Nợ xấu quý 2 giữ dưới 1,6% **và** đóng cửa trên MA20 ba phiên |
| **CTG** | Bao phủ nợ xấu quý 2 giữ trên 140% **và** đóng cửa trên MA20 ba phiên |
| **HDB** | Nâng nốt 2/5 phần còn lại nếu **bao phủ nợ xấu cải thiện lên trên 60%** |

**Nhóm Tiện ích — kiểm điều kiện kỹ thuật hằng ngày:** NT2 vượt 21,57 · POW vượt 13,96 · GEG vượt 12,77, mỗi mã cần ba phiên đóng cửa liên tiếp. Mã nào đạt thì vào, không chờ hết tuần.

**Nếu không mã nào đạt, giữ tỷ trọng ở 32% và không thay bằng mã khác.**

## C.4. TUẦN 3 — 10 đến 14/08 (5 phiên)

**Chủ đề: BCTC hợp nhất quý 2 — tuần dữ liệu đầy đủ nhất tháng. Sàn 35% — trần 60%. Đây là tuần giải ngân chính, không phải tuần 1.**

Hạn công bố BCTC bán niên soát xét là **14/08**. Sau ngày này, độ bất định về dữ liệu quý 2 được giải quyết gần hết cho cả ba ngành chính.

**Ứng viên bổ sung theo thứ tự ưu tiên:**

| Ưu tiên | Mã | Điều kiện |
|---|---|---|
| 1 | **NT2 · POW · GEG** | Điều kiện kỹ thuật ở mục B.2.3, cộng điều kiện bổ sung riêng từng mã |
| 2 | **MBB · CTG** | Nếu chưa vào ở tuần 2 và nay đã đạt |
| 3 | **TCX** | Vượt MA200 (hiện −5,0%, gần nhất trong nhóm chờ) **và** duy trì tỷ trọng doanh thu đại lý phát hành trên 20% |
| 4 | **MBS** | Vượt MA20 ba phiên **và** lãi cơ bản trên cổ phiếu có dấu hiệu hồi phục sau pha loãng 52% |
| 5 | **VGC · IDC** | BCTC quý 2 xác nhận biên gộp ngừng co hẹp **và** vượt MA20 ba phiên |

**Kiểm chứng bắt buộc với mã đang nắm:**

| Mã | Nội dung kiểm | Ngưỡng xử lý |
|---|---|---|
| **STB** | Lợi nhuận và nợ xấu 6 tháng thật so với ước tính | Nợ xấu trên 6% hoặc lợi nhuận giảm quá 50% → **cắt hết** |
| **HDB** | Bao phủ nợ xấu; ngày chốt quyền phát hành riêng lẻ và chuyển đổi trái phiếu | Bao phủ không lên trên 60% → hạ về vai trò bổ sung. Ngày chốt rơi trong tháng 8 → giảm vị thế trước ngày đó |
| **ACB** | Nợ nhóm 3 và nhóm 4 có tiếp tục tăng không | Nhóm 3 tăng tiếp trên 30% trong quý → hạ ưu tiên |
| **MSB** | Ngày chốt quyền phát hành 20% | Rơi trong tháng 8 → giảm vị thế trước ngày chốt |
| **VCK** | Chênh lệch lãi cho vay có giữ trên 6% không | Dưới 6% hai quý liên tiếp → **cắt hết** |
| **HCM** | Tiến độ đợt chào bán khoảng 2.700 tỷ | Chậm tiến độ → giữ nguyên, không nâng |
| **NT2** *(nếu đã vào)* | Biên gộp quý 2; tiến độ hợp đồng mua bán khí | Biên gộp co tiếp dưới 10% → hạ ưu tiên trong ngành |

## C.5. TUẦN 4 — 17 đến 21/08 (5 phiên)

**Chủ đề: đáo hạn phái sinh 20/08, FTSE danh sách cuối 21/08, và cửa sổ duy nhất cho nhóm Bất động sản. Sàn 35% — trần 70%.**

**20/08 — đáo hạn VN30F2608.** Không mua trong phiên. Biến động phiên khớp lệnh đóng cửa là kỹ thuật thuần tuý.

**21/08 — FTSE công bố danh sách cuối cùng.** Đây là rủi ro nhị phân không quản trị được bằng lệnh dừng lỗ. Trong danh mục, mã có câu chuyện FTSE gồm **STB, VCK, HCM**. **Hạ ba mã này xuống hai phần ba vị thế chậm nhất phiên 19/08**, mua lại sau khi có danh sách. Mã bị loại khỏi danh sách thì **cắt hết ngay, không chờ hồi**.

**Cửa sổ nhóm Bất động sản.** Tính từ đáy 22–27/07, điều kiện "không tạo đáy mới trong 15 phiên" sớm nhất thoả vào khoảng **18–19/08**. Kiểm ba điều kiện riêng cho từng mã, không kiểm cho cả ngành. Thứ tự: NLG → HDG → KDH → DXG. **Nếu không mã nào đạt thì nhóm này vẫn ở 0%** và tỷ trọng dừng ở mức tuần 3.

## C.6. TUẦN 5 — 24 đến 28/08 (5 phiên)

**Chủ đề: hạ rủi ro trước rào 5 ngày nghỉ. Hạ 10 điểm phần trăm so với tuần 4, về sàn 30%.**

Phiên giao dịch cuối tháng 8 là **thứ Sáu 28/08**. Thị trường nghỉ Quốc khánh 31/08 – 02/09, giao dịch lại 03/09.

Ba rủi ro rơi vào cửa sổ thị trường đóng cửa: Jackson Hole 27–29/08; ngày tái cơ cấu MSCI 31/08 trùng phiên nghỉ lễ Việt Nam; và khoảng trống 5 ngày lịch không có công cụ phòng vệ.

| Ngày | Hành động |
|---|---|
| 24–25/08 | Chốt lời từng phần: mã nào lãi trên 12% từ giá vốn thì bán một phần ba |
| **26/08** | **Ngừng mở vị thế mới** |
| 27/08 | Bán hết **STB** (động lượng thuần, chưa xác minh cơ bản) và các mã Low conviction mới vào chưa có xác nhận |
| 28/08 | Chỉ giữ nhóm có nền tảng đã xác nhận. Theo dõi biến động phiên đóng cửa do lệch ngày tái cơ cấu MSCI |

**Giữ qua kỳ nghỉ:** ACB, LPB, MSB, VCK, HCM, cùng HDB nếu bao phủ nợ xấu đã cải thiện, và các mã Tiện ích đã vào có quý 2 công bố tốt (NT2, POW).

**Đóng trước kỳ nghỉ:** STB, GEG nếu đã vào, và mọi mã vào bằng động lượng chưa có số quý 2.

## C.7. Bảng tổng hợp — thứ tự vào theo tuần

**M** = vào hoặc nâng · **G** = giữ · **H** = hạ · **B** = bán hết · **?** = có điều kiện · **—** = chưa vào

| Mã | Vai trò | T1 30–31/07 | T2 03–07/08 | T3 10–14/08 | T4 17–21/08 | T5 24–28/08 |
|---|---|---|---|---|---|---|
| **ACB** | Lõi | **M** | G | G | G | G |
| **LPB** | Lõi | **M** | G | G | G | G |
| **MSB** | Lõi | **M** | G | G ? | G | G |
| **HDB** | Lõi có điều kiện | **M** 3/5 | **M?** nốt 2/5 | G ? | G | G ? |
| **VCK** | Bổ sung | **M** | G | G | **H** trước 21/08 → M sau | G |
| **HCM** | Bổ sung | **M** | G | G | **H** trước 21/08 → M sau | G |
| **STB** | Bổ sung | **M** | G | G ? | **H** trước 21/08 | **B** |
| **NT2** | Tiện ích | — | **M?** | **M?** | G | G |
| **POW** | Tiện ích | — | **M?** | **M?** | G | G |
| **GEG** | Tiện ích | — | — | **M?** | G | **B?** |
| MBB · CTG | Chờ xác nhận | — | **M?** | **M?** | G | G |
| TCX · MBS | Theo dõi | — | — | **M?** | G | H |
| VGC · IDC | Theo dõi | — | — | **M?** | G | G |
| NLG · HDG · KDH · DXG | Theo dõi BĐS | — | — | — | **M?** | G |
| SHB · VCI · VND · SSI · SHS · VIX · CTD · VPX · CEO · TAL · HHV | Loại / chưa tới lượt | **Không** | Không | Không | Không | Không |
| **TỔNG — sàn** | | **30%** | **32%** | **35%** | **35%** | **30%** |
| **TỔNG — nếu xác nhận đủ** | | 35% | **45%** | **60%** | **70%** | **60%** |

## C.8. Nhánh xấu

**Kích hoạt:** VNINDEX đóng cửa dưới **1.651,20** hai phiên liên tiếp, hoặc một phiên dưới mức đó kèm khối lượng vượt 1,3 lần bình quân 20 phiên.

| Bước | Hành động |
|---|---|
| 1 | Dừng toàn bộ giải ngân mới. Không bình quân giá xuống |
| 2 | Bán hết mã vào bằng động lượng chưa có số quý 2: **STB**, và **GEG** nếu đã vào |
| 3 | Hạ nhóm chứng khoán (VCK, HCM) xuống một phần ba |
| 4 | **Hạ HDB về vai trò bổ sung** — đây là mã vào bằng override, phải là nhóm giảm trước |
| 5 | Hạ về sàn 30%, ưu tiên giữ **ACB và LPB** — hai mã có xu hướng tốt nhất và số quý 2 đã công bố |
| 6 | **Thủng 1.600 kèm khối lượng tăng** → regime chuyển sang Defensive only, dải 30–70% hết hiệu lực, hạ về 15–20% |

**Điểm quan trọng về sàn 30%:** đây là sàn **của regime**, không phải sàn tuyệt đối. Chừng nào bốn điều kiện huỷ chưa bị chạm thì không hạ dưới 30%; hạ dưới đó tức là đã ngầm bỏ regime mà không thừa nhận. **Không có trạng thái trung gian "vẫn Risk-on selective nhưng nắm 15%".**

## C.9. Nhánh tốt

**Kích hoạt:** đủ 2 trong 3 dấu hiệu xác nhận đáy, **và** VNINDEX đóng cửa trên MA20 (~1.783) kèm khối lượng vượt bình quân 20 phiên.

| Bước | Hành động |
|---|---|
| 1 | Đạt trần 70% sớm hơn lịch — kéo mốc từ tuần 4 về tuần 3. **Không vượt 70%** |
| 2 | Ưu tiên nâng **nhóm đã nén trước nhóm chưa nén** — MBB, CTG, và nhóm Bất động sản khi đủ điều kiện |
| 3 | **Nâng Chứng khoán trở lại ngành chính** chỉ khi thanh khoản HOSE bình quân 5 phiên vượt 15.000 tỷ mà không có phiên giảm quá 2% |
| 4 | Kích hoạt đầy đủ hai ngành dự bị còn lại: VGC, IDC, HHV |
| 5 | **Vẫn giữ nguyên kỷ luật hạ tỷ trọng ở tuần 5** — kỳ nghỉ 5 ngày là rủi ro độc lập với xu hướng thị trường |

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

## E.1. Năm việc chưa làm

1. **Bốn mã mới chưa qua bộ lọc loại trừ cứng.** VCK, HCM, TCX, VPX lọt vào qua hai bộ lọc, chưa qua vòng rà tin quản trị, pháp lý, pha loãng và sự kiện lịch vốn đã loại 13 mã ở bản cũ. **Việc rà này được đặt thành nhiệm vụ bắt buộc của tuần 1** và phải xong trước khi nâng size.
2. **Năm ngân hàng chưa có báo cáo tài chính quý 2.** MBB, HDB, CTG, SHB, STB. Mọi đánh giá về năm mã này đứng trên số quý 1 [công bố] hoặc dự phóng của bên thứ ba, và đã được ghi nhãn.
3. **Không mã nào có memo phân tích đầy đủ.** Vẫn chưa có variant perception, bear case được lập luận nghiêm túc, exit trigger viết trước. Phần C là kỷ luật vào lệnh, không thay được memo.
4. **Chưa định giá độc lập.** Không có giá mục tiêu cơ sở / lạc quan / bi quan cho bất kỳ mã nào. Giá mục tiêu nêu ở bản cũ là của bên thứ ba, chưa kiểm giả định.

## E.2. Ba rủi ro riêng của chính bản sửa này

**Một — nguy cơ sửa quá tay theo hướng ngược lại.** Bộ lọc xu hướng ở Nguyên tắc 1 là bộ lọc chặt. Nó **sẽ bỏ lỡ đáy thật**: nếu thị trường tạo đáy V ngay tuần này thì danh mục 32% sẽ thua danh mục 70%. Đây là chi phí đã biết và chấp nhận có ý thức — đổi phần đuôi trên lấy việc không cầm dao rơi. **Nếu ba tháng sau nhìn lại thấy các mã bị loại đều tăng mạnh từ đúng vùng này, thì ngưỡng 20% dưới MA200 cần được nới, chứ không phải bỏ nguyên tắc.**

**Hai — HDB vào bằng override, và đó là rủi ro có tên.** Mã này không đạt bộ lọc xu hướng; việc đưa vào tuần 1 dựa trên bộ yếu tố xúc tác chứ không dựa trên bằng chứng giá đã ngừng giảm. Nếu nhịp giảm tiếp diễn, đây là vị thế mất nhiều nhất trong nhóm lõi, và nó cũng là vị thế **phải giảm trước tiên** ở nhánh xấu. Ba ngưỡng huỷ ở mục B.1.4 là cơ chế kiểm soát duy nhất cho rủi ro này — nếu không thực thi nghiêm thì override trở thành quyết định vô điều kiện.

**Ba — bốn mã mới có thể tốt vì lý do sai.** VCK, HCM, VPX đứng trên MA200 một phần vì **mới niêm yết cuối 2025**, nên MA200 của chúng tính trên nền giá thấp hơn và chưa trải qua chu kỳ giảm nào. Đây là điểm yếu thật của phép so sánh và không khắc phục được bằng dữ liệu hiện có. **Xử lý: size ba mã này cộng lại chỉ 12%, và VPX bị hạ xuống 2% vì chất lượng lợi nhuận.**

## E.3. Hàm ý cho quy trình, cần quyết định riêng

Ba lỗi ở phần đầu **không phải lỗi thực thi, chúng là lỗi thiết kế của bộ tiêu chí**:

- Tiêu chí khối ngoại là một trong sáu tiêu chí chấm điểm trong quy trình chuẩn.
- Đường vào universe bằng dòng tiền giao dịch được mở ở chu kỳ này và không có bộ lọc xu hướng đi kèm.
- Bộ lọc cơ bản đọc quý gần nhất mà không kiểm độ tươi của kỳ báo cáo.

**Sửa ba điểm này nằm ở tầng quy trình, không nằm trong báo cáo.** Đây là việc bảo trì engine và cần quyết định riêng của anh — tôi không tự sửa. Nếu anh đồng ý, ba thay đổi đề xuất là: bỏ khối ngoại khỏi bộ tiêu chí chấm điểm và chuyển thành ghi chú tham khảo; thêm bộ lọc xu hướng làm vòng bắt buộc trước mọi vòng khác; và thêm điều kiện kiểm độ tươi kỳ báo cáo vào vòng cơ bản.

---

## Khuyến cáo

**Báo cáo này KHÔNG đứng độc lập.** Nó thay thế phần chọn cổ phiếu và kế hoạch triển khai của bản ngày 28/07/2026, nhưng **không chép lại phần vĩ mô và phần lựa chọn ngành** — hai phần đó vẫn nằm ở bản 28/07 và **vẫn giữ nguyên hiệu lực** (danh sách chi tiết ở Phần D).

Để có bức tranh đầy đủ, đọc **Phần I và Phần II của bản 28/07** cùng với bản này. Phần III trở đi của bản 28/07 đã bị thay thế, không dùng.

Bản sửa lần 2 ngày 29/07 bị thay thế hoàn toàn bởi bản này.

Nội dung được lập cho mục đích tham khảo, dựa trên dữ liệu giá đến hết phiên 28/07/2026 và dữ liệu tài chính đến ngày 29/07/2026. Báo cáo không phải lời chào mua hay chào bán, và không tính đến mục tiêu đầu tư hay tình hình tài chính riêng của từng nhà đầu tư.

Ba điểm phải đọc kèm mọi khuyến nghị trong báo cáo: **năm trên tám ngân hàng chưa công bố báo cáo tài chính quý 2**; **bốn mã chứng khoán mới chưa qua bộ lọc loại trừ cứng đầy đủ**; và **toàn bộ khung vẫn giả định thị trường đang trong vùng tạo đáy — giả định này hiện chưa được xác nhận bởi bất kỳ dấu hiệu nào trong ba dấu hiệu ở mục 7.2 của bản cũ.**

---

*Kết thúc bản sửa lần 2. Lập ngày 29/07/2026.*
