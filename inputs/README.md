# inputs/ — kho đầu vào

Chứa đầu vào đã dùng cho deliverable, phục vụ truy vết và tái sử dụng. AI lưu theo luồng intake (CLAUDE.md mục 2.3) — chuẩn hoá tên xong mới lưu, không giữ tên gốc file user gửi.

## Naming

- `bctc/<TICKER>/<YYYY>Q<N>_<loại>.pdf` — loại: `soatxet` | `kiemtoan` | `hopnhat` | `rieng`. Báo cáo năm: `<YYYY>_kiemtoan.pdf`. Ví dụ: `bctc/VNM/2025Q4_soatxet.pdf`.
- `external/<YYYYMMDD>_<nguồn>_<mô tả ngắn>.<ext>` — ví dụ: `external/20260715_VCBS_trien-vong-nganh-thep.pdf`.

## Lưu vs cite

Lưu vào đây: thứ không lấy lại được (PDF user gửi, tài liệu đã tải về). Không lưu: bài web (cite URL + ngày truy cập trong front-matter báo cáo), số liệu DB (cite collection + ngày query).
