# CHANGELOG — thay đổi engine & cấu trúc workspace

Ghi mỗi lần sửa engine (K/P/O, system_prompt, KERNEL_SKELETON, OUTPUT_MASTER, agent_db_*) hoặc thay đổi cấu trúc workspace. Mục đích: biết mỗi báo cáo trong `outputs/` được sinh trên phiên bản spec nào. Dòng mới thêm lên đầu.

Format: `## YYYY-MM-DD — tiêu đề` + file đụng tới + nội dung + lý do.

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
