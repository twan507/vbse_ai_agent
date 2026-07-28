# CHANGELOG — thay đổi engine & cấu trúc workspace

Ghi mỗi lần sửa engine (K/P/O, system_prompt, KERNEL_SKELETON, OUTPUT_MASTER, agent_db_*) hoặc thay đổi cấu trúc workspace. Mục đích: biết mỗi báo cáo trong `outputs/` được sinh trên phiên bản spec nào. Dòng mới thêm lên đầu.

Format: `## YYYY-MM-DD — tiêu đề` + file đụng tới + nội dung + lý do.

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
