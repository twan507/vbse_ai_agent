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

## 2026-07-28 — CP1 — Loại: ghi chú chấm điểm catalyst (không phải override)

Ghi lại để minh bạch, không phải override của user.

Quy trình chuẩn ở `P_invest_memo_01` mục 4 chấm catalyst 1 điểm khi timing trên 6 tháng, và mục 7.3 quy định loại catalyst 1 điểm trước khi vượt trần 10 catalyst. Lộ trình nâng hạng FTSE kéo dài đến 20/09/2027 nên nếu tính cả lộ trình sẽ rơi vào nhóm bị loại đầu tiên — một kết quả nghịch lý với catalyst có tác động toàn thị trường.

Agent xử lý bằng cách **tách đợt 1 (hiệu lực 21/09/2026, timing 0-2 tháng) thành một catalyst riêng**, chấm theo timing của chính đợt đó. Điểm cuối là 2 chứ không phải 3, vì magnitude dòng vốn đợt 1 nhỏ so với quy mô bán ròng khối ngoại hiện tại và mức độ đã phản ánh vào giá không xác định được. Cách xử lý này nằm trong spec, không cần override.
