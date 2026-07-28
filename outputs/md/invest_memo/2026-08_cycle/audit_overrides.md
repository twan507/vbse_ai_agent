# Audit log override — cycle 2026-08

Ghi mỗi lần user override quyết định hoặc phương pháp mặc định của quy trình. Rà lại sau 3-6 tháng để đánh giá chất lượng override so với kết quả thực tế.

---

## 2026-07-28 — CP1 — Loại: thay đổi phương pháp (nguồn input)

**Quyết định Agent theo spec:** `P_invest_memo_01` mục 2 quy định bốn input bắt buộc, trong đó Input 1 (market trend đa khung + vận động 20 phiên) dùng tầng chỉ báo nội bộ của hệ thống — chỉ báo xu hướng 4 khung tuần/tháng/quý/năm, vùng kỹ thuật, và phân loại 1 trong 5 pattern vận động. Bảng quyết định regime ở mục 3 tham chiếu trực tiếp các ngưỡng của chỉ báo này (ví dụ "3/4 khung > 0.75", "2/4 khung < 0.2").

**User override:** không sử dụng tầng chỉ báo nội bộ của hệ thống, bỏ qua trạng thái pha thị trường hiện tại, và lập báo cáo độc lập thay vì nối tiếp hai tài liệu tham khảo user gửi. Agent tự chọn regime dựa trên tin vĩ mô.

**Lý do user:** muốn báo cáo đứng độc lập, không phụ thuộc chỉ báo và trạng thái pha của hệ thống nội bộ.

**Agent xử lý:** thay Input 1 bằng dữ liệu khách quan tương đương — giá đóng cửa và khối lượng thực tế, biến động 1 tháng / 3 tháng / 1 năm, mức giảm từ đỉnh, độ rộng thị trường theo số mã tăng giảm. Bổ sung hai trục không có trong spec gốc: định giá tự tính theo phân vị lịch sử, và mức đòn bẩy toàn ngành. Bảng ngưỡng regime ở `P_invest_memo_01` mục 3 vì vậy **không áp dụng máy móc được**; regime được quyết định bằng tổng hợp định tính sáu trục, ghi rõ lập luận ở Phần 3 của báo cáo.

**Rủi ro của override này:** mất tính so sánh với các kỳ chạy tier 0 sau nếu các kỳ đó dùng lại chỉ báo hệ thống. Điều kiện nâng/hạ regime ở Phần 5 vì vậy được viết bằng các đại lượng khách quan quan sát được (giá trị bán ròng khối ngoại theo tuần, độ rộng thị trường, mốc điểm số chỉ số) chứ không bằng ngưỡng chỉ báo nội bộ, để kỳ sau vẫn kiểm tra lại được.

---

## 2026-07-28 — CP1 — Loại: thay đổi quyết định (regime)

**Quyết định Agent:** **Defensive only**, quota 2 ngành × 3 mã, cash buffer 60%. Lập luận: bốn trong sáu trục bất lợi, trong đó ba điều kiện đang diễn ra có bằng chứng định lượng — Fed xoay hawkish với dự phóng lãi suất cuối 2026 nâng từ 3,4% lên 3,8%, khối ngoại bán ròng tăng tốc (tuần gần nhất 6.472 tỷ, hơn nửa lượng bán cả tháng 12.100 tỷ), và giải chấp margin thật từ nền dư nợ 418.725 tỷ tăng 50,2% so với cùng kỳ. Agent đã ghi rõ đây là quyết định sát nút với Risk-on selective.

**User override:** **Risk-on selective**, quota 3 ngành × 3 mã. Thiên về kịch bản bắt đáy.

**Lý do user:** thiên về kịch bản bắt đáy.

**Agent xử lý:** áp regime selective theo `P_invest_memo_01` mục 3, nhưng chọn cash buffer ở **đầu trên của dải 20-30%, tức 30%** thay vì 20%. Lý do: rủi ro chính của việc bắt đáy giữa chu kỳ giảm đòn bẩy không phải sai hướng mà là hết dư địa mua trước khi luận điểm đúng. Đồng thời viết vào bản confirmed **ba điều kiện huỷ regime** có ngưỡng số cụ thể (VNINDEX mất 1.600 điểm; tỷ giá bán vượt trần biên độ 26.557; Fed tăng lãi suất ngoài dự kiến hoặc Mỹ mở rộng Section 301) để override này không thành một trạng thái vô điều kiện.

**Lập luận thật đứng về phía user, ghi lại để đánh giá công bằng sau này:** định giá phần lõi thị trường loại nhóm Vingroup đang ở phân vị 0,6% của 3 năm về P/E và 1,3% về P/B — rẻ nhất toàn bộ 5,5 năm dữ liệu. Và quan trọng hơn, mẫu hình "tăng mạnh trước ngày hiệu lực nâng hạng rồi đảo chiều sau" — thứ đã hạ gục Dubai, Qatar, Pakistan — **đã không xảy ra** ở Việt Nam: thị trường giảm 12,8% từ đỉnh 18/05 thay vì tăng. Nghĩa là phần bọt mua đón đầu phần lớn chưa hình thành hoặc đã bị xả, nên rủi ro đảo chiều hậu 21/09 thấp hơn tiền lệ.

**Cách đánh giá override này sau 3-6 tháng:** so VNINDEX ngày 28/07/2026 (1.680,62 điểm) với mức tại 30/09/2026 và 31/12/2026. Kiểm thêm hai câu riêng biệt, vì chúng có thể ra kết quả trái nhau: (a) regime selective có đúng không, tức thị trường có tạo đáy quanh đây không; (b) mức cash buffer 30% có hợp lý không, tức có phiên nào thủng 1.600 điểm để cần đến dư địa đó không.

---

## 2026-07-28 — CP2 — Loại: thêm ngành vào shortlist

**Quyết định Agent:** universe (B ∩ C) = 2 ngành — Tài chính ngân hàng (catalyst 4đ), Bất động sản Dân dụng (3đ). Công ty Chứng khoán **trượt Funnel C với 2 điểm**, dưới ngưỡng 3, vì catalyst duy nhất chiếu vào ngành là dòng vốn nâng hạng và nhóm này chỉ nhận khoảng 6,96 triệu USD trong 128,18 triệu đợt 1, tức 5,4%. Agent trình 2 ngành thay vì ép đủ quota 3, theo `P_invest_memo_02` mục 10.2.

**User override:** thêm **Công ty Chứng khoán** thành ngành thứ ba. Đồng thời chỉ định hai ngành theo sau không cấp quota: **Thi công Xây dựng** và **Bất động sản Khu công nghiệp**.

**Lý do user:** chốt rổ 3 ngành gồm chứng khoán, bất động sản, ngân hàng.

**Agent đánh giá override này — ủng hộ, và bằng chứng mạnh hơn cả lập luận catalyst mà nó thay thế.** Đo lợi suất 6 tháng sau hai đáy chu kỳ gần nhất trên toàn bộ 24 ngành, Công ty Chứng khoán xếp **hạng 1 sau đáy 11/2022 (+101,2%)** và **hạng 2 sau đáy 04/2025 (+79,2%)**. Không ngành nào khác giữ được nhóm dẫn đầu ở cả hai lần. Cơ chế lặp lại được: lợi nhuận ngành gắn trực tiếp vào thanh khoản thị trường, mà thanh khoản hồi phục sớm nhất sau đáy. Bảng catalyst Tier 0 không có kênh này — đó là thiếu sót của Tier 0, không phải của ngành.

**Nhưng agent giữ nguyên hai cảnh báo, và một trong hai đã mạnh lên sau khi tính thêm số liệu định giá tại đáy:**

1. **Không có bất kỳ đệm định giá nào.** P/B 1,63 đúng bằng median 3 năm (dư địa hồi phục 0,0%), và **cao hơn P/B tại đáy 2022 43,0% và tại đáy 2025 45,5%**. Muốn về mức định giá của hai đáy trước, giá phải giảm thêm khoảng 30%. Đây là ngành đắt nhất so với chính nó tại đáy trong cả năm ngành đang xét.
2. **Đây chính là bên cho vay margin**, trong lúc dư nợ toàn ngành 418.725 tỷ tăng 50,2% so cùng kỳ và giải chấp đang diễn ra thật.

**Agent xử lý:** đưa vào shortlist với rank ngang hàng, nhưng gắn ba điều kiện định lượng ở mục 4.1 của bản confirmed, trong đó **điều kiện thanh khoản là điều kiện sống còn chứ không phải điều kiện phụ**: cần trung bình 5 phiên khớp lệnh HOSE vượt 15 nghìn tỷ để xác nhận; xuống dưới 10 nghìn tỷ hai tuần liên tiếp là thoát, không chờ. Flag cho Tier 2: ưu tiên Bucket 2, Bucket 1 chỉ cho mã đầu ngành thanh khoản cao.

**Cách đánh giá override này sau 3-6 tháng:** so lợi suất ngành Chứng khoán với hai ngành còn lại và với VNINDEX tại mốc 30/09/2026 và 31/12/2026. Kiểm riêng hai giả thuyết vì chúng có thể ra kết quả trái nhau: (a) ngành có dẫn đầu như hai tiền lệ sau đáy không; (b) việc thiếu đệm định giá có làm mức sụt lớn hơn hai ngành kia trong kịch bản thị trường giảm tiếp không.

---

## 2026-07-28 — CP2 — Loại: thay đổi phương pháp (kế thừa override CP1 sang Funnel A)

Không phải override mới của user — là hệ quả bắt buộc của override phương pháp ở CP1, ghi lại để truy vết.

**Quyết định Agent theo spec:** `P_invest_memo_02` mục 5 xếp hạng Funnel A bằng bốn tiêu chí R1-R4, toàn bộ dựa trên tầng chỉ báo nội bộ — xếp hạng dòng tiền ngành theo điểm dòng tiền tuần, điểm dòng tiền tuần, xu hướng quý, xu hướng năm. Mục 6 phân loại pattern 20 phiên cũng đọc chỉ báo xu hướng.

**Áp dụng override CP1:** user đã yêu cầu không dùng tầng chỉ báo nội bộ cho cycle này, nên R1-R4 và pattern 20 phiên không dùng được.

**Agent thay bằng bốn đại lượng khách quan:**

1. **Dòng tiền khối ngoại theo ngành** — tự tổng hợp từ dữ liệu giao dịch từng mã ghép phân loại ngành, cộng dồn 1 tháng. Thay cho R1 và R2.
2. **Biến động giá 4 khung** tuần / tháng / quý / năm — số điểm phần trăm thực tế. Thay cho R3 và R4.
3. **Phân vị định giá lịch sử** trên chuỗi tuần 156 điểm. Không có trong spec gốc, thêm vào vì regime lần này là bắt đáy nên biên an toàn định giá là trục xếp hạng chính đáng.
4. **Mùa vụ tháng 8 giai đoạn 2020-2025** — hit rate và trung bình. Không có trong spec gốc.

Pattern 20 phiên thay bằng **đường giá thực tế 8 phiên gần nhất**, đọc trực tiếp giá đóng cửa và phần trăm thay đổi từng phiên.

**Rủi ro:** thứ tự xếp hạng không so sánh được với các kỳ chạy Tier 1 khác nếu kỳ đó dùng R1-R4 gốc. Bù lại, mọi đại lượng dùng ở đây đều tái tạo được từ dữ liệu giá và giao dịch thô, nên kiểm lại được bất cứ lúc nào.

**Ảnh hưởng thực tế tới kết quả:** đáng kể và theo chiều bất lợi cho ngân hàng. Dòng tiền khối ngoại cho thấy Tài chính ngân hàng bị bán ròng nặng nhất toàn sàn (−5.515 tỷ trong tháng) — thông tin này không xuất hiện trong R1-R4 gốc, và nó ngược với flag tôi ghi ở Tier 0 khi xếp ngân hàng là ứng viên hàng đầu. Ngân hàng vẫn giữ rank 1 nhưng vì lý do khác: mức sụt nhẹ nhất và định giá sạch không cần hiệu chỉnh.

---

## 2026-07-28 — CP1 — Loại: ghi chú chấm điểm catalyst (không phải override)

Ghi lại để minh bạch, không phải override của user.

Quy trình chuẩn ở `P_invest_memo_01` mục 4 chấm catalyst 1 điểm khi timing trên 6 tháng, và mục 7.3 quy định loại catalyst 1 điểm trước khi vượt trần 10 catalyst. Lộ trình nâng hạng FTSE kéo dài đến 20/09/2027 nên nếu tính cả lộ trình sẽ rơi vào nhóm bị loại đầu tiên — một kết quả nghịch lý với catalyst có tác động toàn thị trường.

Agent xử lý bằng cách **tách đợt 1 (hiệu lực 21/09/2026, timing 0-2 tháng) thành một catalyst riêng**, chấm theo timing của chính đợt đó. Điểm cuối là 2 chứ không phải 3, vì magnitude dòng vốn đợt 1 nhỏ so với quy mô bán ròng khối ngoại hiện tại và mức độ đã phản ánh vào giá không xác định được. Cách xử lý này nằm trong spec, không cần override.
