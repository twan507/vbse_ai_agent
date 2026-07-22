# agent_marketing — engine marketing & thiết kế

## Trạng thái

Khởi tạo tối thiểu (2026-07-22). Chưa có K/P/O — lớn dần khi có việc thật, theo nguyên tắc Simplicity First: pattern nào lặp ≥2 lần mới đáng đóng thành pack.

## Scope

Thiết kế, lên ý tưởng marketing, nội dung truyền thông cho Finext/VBSE: campaign brief, ý tưởng ấn phẩm, banner/visual, bài đăng, landing content, chuyển thể báo cáo phân tích thành nội dung hướng khách hàng.

## Quy tắc làm việc

- Brand asset lấy từ `../brand/` — không tự chế màu/logo/font khác khi đã có brand_spec.
- Đầu ra lưu `../outputs/marketing/<YYYY>/<YYYYMM>_<slug>/` dạng bundle: carrier MD trùng tên thư mục (brief + ý tưởng + quyết định + manifest file), asset vào `assets/` đánh số `NN_<mô tả>.<ext>`. Cập nhật `outputs/INDEX.md` khi lưu (CLAUDE.md mục 4).
- Chuyển thể từ báo cáo phân tích: đọc bản MD trong `outputs/`, tuân K hygiene của O pack gốc — nội dung gửi khách hàng không lộ ký hiệu nội bộ, không command mua/bán, không target giá (ràng buộc audience KH ở README gốc mục 7.6 áp cả sang ấn phẩm marketing).
- Số liệu trong ấn phẩm marketing phải truy được về báo cáo gốc hoặc nguồn cite — no fabrication áp toàn workspace.

## Khi trưởng thành

Đủ pattern lặp → tách K (brand knowledge, audience persona, channel spec), P (quy trình campaign, quy trình chuyển thể báo cáo → ấn phẩm), O (spec từng loại ấn phẩm) theo đúng naming convention pack của workspace, có `system_prompt.md` riêng nếu tách thành runtime độc lập.
