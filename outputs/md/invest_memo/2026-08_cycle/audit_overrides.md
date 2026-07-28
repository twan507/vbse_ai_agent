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

## 2026-07-28 — CP3 — Loại: thay đổi nguyên tắc xếp hạng (dòng tiền trên cơ bản)

**Đây là override có sức lan rộng nhất của cycle — nó đổi kiến trúc bộ lọc, không chỉ đổi một quyết định.**

**Quyết định Agent:** loại CEO và DXG khỏi shortlist bất động sản vì trượt Vòng B — CEO 2/4 (ROE trailing 3,24% đứng im 6 quý, P/E 32,92 vượt ngưỡng 23,18, dòng tiền kinh doanh quý gần nhất âm 380 tỷ), DXG 2/4 (ROE 1,65% và đang giảm, P/E 58,96). Giữ TAL ngoài danh sách vì vòng quay thanh khoản 5,3 điểm cơ bản, thấp nhất trong 22 mã đã đo.

**User override:** "ceo dxg tal cũng được chứ sao, sóng ngắn nên ưu tiên hút dòng tiền".

**Lý do user:** với vị thế đánh sóng ngắn, khả năng hút dòng tiền quan trọng hơn chất lượng cơ bản.

**Agent xử lý:** đưa cả ba vào shortlist, nâng nhóm bất động sản từ 4 lên 7 mã, và **xếp lại toàn bộ danh sách theo vòng quay thanh khoản làm trục chính, cơ bản làm trục phụ**. CEO lên rank 1, DXG rank 2.

**Vì sao đây không phải override thường:** kiến trúc gốc của `P_invest_memo_03` dùng công thức universe `(B ∩ D) ∪ (C ∩ D)`, trong đó **B là bộ lọc loại thẳng** — mã không đạt cơ bản thì không vào universe bất kể dòng tiền mạnh đến đâu, và dòng tiền chỉ được dùng ở tầng xếp hạng. Override này **đảo ngược thứ tự hai tầng**, tạo ra một **đường vào thứ ba chưa có tên trong spec**: vào universe nhờ thanh khoản và lịch sử hồi phục, không nhờ cơ bản cũng không nhờ catalyst cá thể.

**Ba hệ quả agent đã ghi vào bản confirmed:**

1. Hai trong bảy mã vào universe dù trượt Vòng B — vẫn trong giới hạn 1-3 mã/ngành của đường phụ, nhưng lý do vào khác với lý do spec quy định.
2. **Biên an toàn khi sai giảm rõ.** CEO P/E 32,92 và DXG P/E 58,96 đều vượt ngưỡng. Nếu nhịp hồi không đến, hai mã này không có đệm định giá — cùng dạng vấn đề đã nêu cho ngành Chứng khoán ở Tier 1.
3. **Kỷ luật thoát phải khác.** Vị thế mua vì dòng tiền phải thoát khi dòng tiền rút, không chờ cơ bản xác nhận. Agent đề xuất ngưỡng cụ thể cho Tier 6: vòng quay thanh khoản 5 phiên giảm dưới 60% mức bình quân 20 phiên thì thoát bất kể giá.

**Một mâu thuẫn nội tại agent phải nêu:** TAL được thêm vào theo cùng lý do "ưu tiên hút dòng tiền", nhưng TAL có **vòng quay 5,3 — thấp nhất trong toàn bộ 22 mã đã đo**, và giá trị giao dịch 5,3 tỷ/phiên đúng sát ngưỡng loại. Đợt hồi +123% của TAL sau đáy 2025 diễn ra trên nền thanh khoản rất mỏng; theo trần 5% khối lượng bình quân thì size tối đa cả vị thế chỉ khoảng 800 triệu đồng. Tức TAL **đi ngược chính nguyên tắc được dùng để đưa nó vào**. Agent giữ ở rank cuối và đã đề nghị user cân nhắc lại.

**Cách đánh giá override này sau 3-6 tháng:** so lợi suất nhóm vào bằng dòng tiền (CEO, DXG) với nhóm vào bằng cơ bản (HDG, KDH, DXS) tại mốc 30/09/2026 và 31/12/2026. Kiểm riêng hai câu: (a) nhóm dòng tiền có hồi mạnh hơn thật không; (b) trong kịch bản thị trường giảm tiếp, nhóm dòng tiền có mất nhiều hơn không — tức đệm định giá có giá trị thực hay không.

---

## 2026-07-28 — CP3 — Loại: loại mã khỏi shortlist theo nhận định định tính của user

**Quyết định Agent:** shortlist bất động sản 6 mã — DIG (rank 1), KDH, HDG, IJC, HDC, NVL. Chấm bằng bộ lọc định lượng đọc **quý gần nhất**: Vòng D thanh khoản, Vòng B cơ bản, Vòng A xếp hạng bằng đại lượng khách quan.

**User override:** DIG kém; IJC và HDC "đánh đấm kém, khó hút dòng tiền". Yêu cầu rà soát lại từ tin tức và diễn đàn kèm phân tích cơ bản sâu hơn.

**Lý do user:** nhận định thực chiến về đặc tính giao dịch và khả năng thu hút dòng tiền của từng mã — thông tin không có trong bộ chỉ tiêu định lượng mà agent dùng.

**Agent kiểm chứng và xác nhận user đúng cả ba mã, mỗi mã vì một lý do khác nhau.** Bổ sung ba thước đo mà bản gốc thiếu — chuỗi 6 quý thay vì 1 quý, vòng quay thanh khoản trên vốn hoá, hiệu suất thực tế sau hai đáy chu kỳ — cộng tra tin tức và dư luận:

- **DIG:** thanh khoản thực ra rất tốt (vòng quay 123,6 điểm cơ bản, cao thứ hai trong 22 mã). Vấn đề nằm chỗ khác: ROE trailing 7,7% bị **kéo lên gần trọn bởi riêng quý 4/2025** (dòng tiền +1.356 tỷ), trong khi quý gần nhất ICR **âm 0,8** và dòng tiền **âm 437 tỷ**; báo chí xác nhận quý 1/2026 lỗ ròng 9,9 tỷ. Gia đình Chủ tịch bị giải chấp hơn 14,3 triệu cp trong bốn phiên 21–24/07, **doanh nghiệp không còn cổ đông lớn nào**, rủi ro giải chấp tiếp diễn. Cổ đông đợt phát hành giá 12.000đ đang lỗ, tạo lực bán khi giá hồi.
- **IJC:** đúng là mã khó hút dòng tiền, ba nguồn độc lập trùng khớp. Vòng quay **31,2 điểm cơ bản, bằng một phần tư DIG**, thấp thứ ba trong 22 mã. Hồi sau hai đáy chỉ +65% và +57%, dưới trung vị cả hai lần. Báo Tin nhanh Chứng khoán 01/06/2026 đặt tít "Lợi nhuận cải thiện, cổ phiếu vẫn trầm lắng"; không có báo cáo khuyến nghị nào trong 3 tháng; vắng mặt khỏi mọi danh sách dòng tiền tháng 7; không có tên trong nhóm mã nhà đầu tư cá nhân bàn luận.
- **HDC:** bộ lọc quý gần nhất che mất **ICR âm ba quý liên tiếp** (−0,3 · −0,5 · −0,4) đúng ba quý ROE trailing nhảy lên 25% — lợi nhuận không tạo tiền, dòng tiền kinh doanh âm 579, 462 và 276 tỷ. Cộng giải chấp gia đình Chủ tịch tháng 3/2026 và pha loãng dồn dập phía trước (~51 triệu cp cộng trái phiếu chuyển đổi 500 tỷ).

**Agent phát hiện thêm một lỗi bản gốc mà user chưa nêu:** **NVL chậm trả 111,6 tỷ nợ gốc trái phiếu ngày 23/07/2026**, chỉ thanh toán được 611,95 triệu đồng. Bản gốc xếp NVL **Bucket 1**. Đây là sự kiện tín dụng đang hoạt động, xảy ra năm ngày trước ngày chạy báo cáo. Đã loại.

**Kết quả:** shortlist bất động sản giảm từ 6 xuống **4 mã** — HDG, KDH, DXS, NLG. Không nới tiêu chí để lấp cho đủ 6.

**Bài học phương pháp, đáng ghi to:** bộ lọc Vòng B theo spec chỉ đọc **quý gần nhất**. Với ngành có lợi nhuận lumpy như bất động sản, một quý đột biến đủ để kéo chỉ tiêu trailing qua ngưỡng và che lấp ba quý xấu liền trước. **Cả DIG lẫn HDC đều lọt Vòng B nhờ đúng cơ chế này.** Nếu cycle sau vẫn dùng spec hiện hành cho ngành bất động sản, phải đọc tối thiểu chuỗi 4–6 quý cho ICR và dòng tiền kinh doanh, không chỉ quý cuối.

**Phát hiện cấu trúc:** trong ngành bất động sản dân dụng thời điểm này, **chất lượng cơ bản và khả năng hút dòng tiền gần như loại trừ nhau**. Bốn mã hồi mạnh nhất sau đáy 2025 là CEO (+162%), DXS (+132%), TAL (+123%), DXG (+98%) — chỉ DXS và TAL pass Vòng B, và cả hai đều vướng thanh khoản. Hai mã cơ bản tốt nhất là HDG và KDH thì hồi phục chỉ mức trung bình đến kém.

**Cách đánh giá override này sau 3-6 tháng:** so lợi suất bốn mã bị loại (DIG, IJC, HDC, NVL) với bốn mã thay thế (HDG, KDH, DXS, NLG) tại mốc 30/09/2026 và 31/12/2026. Kiểm riêng: (a) DIG có tiếp tục giảm vì giải chấp không; (b) IJC có tiếp tục "trầm lắng" không, đo bằng vòng quay thanh khoản; (c) NVL có xử lý được nghĩa vụ trái phiếu không.

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
