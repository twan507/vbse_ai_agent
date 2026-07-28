# CLAUDE.md — Workspace VBSE AI

Cửa vào cho mọi session AI. Đọc file này trước, rồi đọc tiếp theo bảng router bên dưới tuỳ loại task. Kiến trúc chi tiết cho người đọc: `README.md`.

## 1. Bản chất workspace

Hai tầng, không trộn lẫn:

- **ENGINE** — `engine/`: knowledge, process, output spec. Ổn định, chỉ sửa khi user yêu cầu maintenance, mọi thay đổi ghi log.
- **KHO** — `inputs/`, `outputs/`: artifact. Chỉ ghi thêm (append-only), không sửa ngược nội dung đã lưu. Báo cáo cần đính chính → tạo bản mới, đánh dấu bản cũ superseded trong INDEX, không ghi đè.

```
engine/    engine phân tích chứng khoán — 1 engine duy nhất
           system_prompt + KERNEL_SKELETON + OUTPUT_MASTER + K/ P/ O/
           cần MongoDB `agent_db` qua MCP
inputs/    đầu vào đã dùng cho deliverable (bctc/ theo ticker, external/)
outputs/   deliverable 4 cây (md/ pptx/ docx/ sent/) + INDEX.md (sổ cái)
_ops/      CHANGELOG.md, GOTCHAS.md, specs/
.claude/   settings.json — hook cưỡng chế luật git
```

Version control: git local, branch `main` — quy tắc mục 7.

## 2. Luật vận hành — đọc kỹ, không có ngoại lệ

**2.1. AI là người ghi duy nhất.** User KHÔNG tự tay sửa/thêm/xoá file trong workspace. Hệ quả logic: mọi trạng thái bất thường đều là lỗi sync hoặc lỗi session trước, không phải "user vừa sửa".

**Ngoại lệ duy nhất — `outputs/sent/`:** AI tạo và đặt file ở đó (copy từ `outputs/pptx/` hoặc `docx/`), **user sửa nội dung** trước khi gửi khách. Đây là nơi duy nhất user ghi. Mọi thư mục khác vẫn AI ghi duy nhất.

**2.2. Phát hiện bất thường → BÁO, không tự xử.** Bất thường gồm: file sai naming convention, file lạ ở root, bản sao conflict OneDrive (`*-DESKTOP-*`, `*conflict*`), file tạm (`~$*`, `*.tmp`), binary không được liệt kê trong carrier MD nào. Khi gặp: báo user hiện trạng + nguyên nhân khả dĩ + đề xuất xử lý, chờ duyệt rồi mới động tay. Không im lặng sửa, không im lặng bỏ qua.

**Không tính là bất thường:** file trong `outputs/sent/` khác nội dung với bản render tương ứng — đó là bản user đã sửa tay, đúng thiết kế (mục 2.1, mục 6).

**2.3. Luồng intake — bất biến với mọi file user gửi qua chat:**

1. Nhận diện loại: BCTC → `inputs/bctc/`; tài liệu ngoài → `inputs/external/`; báo cáo cũ backfill → `outputs/md/<loại>/` đúng vị trí.
2. Chuẩn hoá: đổi tên đúng convention (mục 4-5), text về LF, binary giữ nguyên bytes.
3. Lưu đúng vị trí. Deliverable → cập nhật `outputs/INDEX.md` cùng lượt.
4. Báo lại user: đường dẫn cuối + tên đã đổi.

Không lưu thẳng file với tên gốc user gửi. Chuẩn hoá xong mới lưu — luôn như vậy.

**2.4. Sửa engine:** chỉ khi user yêu cầu maintenance. Mỗi lần sửa: ghi `_ops/CHANGELOG.md` (ngày + file + nội dung + lý do). Không sửa engine giữa chừng khi đang chạy dở một báo cáo.

**2.5. Không có binary mồ côi.** Mọi file không phải MD (pptx/docx/png/pdf output) phải được liệt kê trong front-matter `derived` của một carrier MD, ghi **đường dẫn tương đối đầy đủ từ `outputs/`** — vì binary nằm ở cây khác với MD. File binary không truy được về carrier nào = bất thường (mục 2.2).

## 3. Router domain

| Yêu cầu | Đọc theo thứ tự |
|---|---|
| Tra cứu nhanh: giá, dòng tiền, tin, phase | `engine/system_prompt.md` → K pack liên quan. **KHÔNG activate P/O pack** |
| Báo cáo phân tích: memo, tuần, chiến lược, cổ phiếu | `engine/system_prompt.md` → `KERNEL_SKELETON.md` + `OUTPUT_MASTER.md` → pack `_00` master trước file con (master-first, bắt buộc) |
| Lưu trữ / intake file user gửi | Mục 2.3 file này là đủ |
| Maintenance workspace | `README.md` + `_ops/CHANGELOG.md` + `_ops/specs/` |

**Luật gate — mặc định là tra cứu, không phải chạy workflow:**

- Mặc định mọi query là **inline lookup**. Chỉ activate P/O pack khi query có **ý định deliverable tường minh** ("viết báo cáo", "memo deep-dive", "chiến lược tháng", "stock report", tên tier/giai đoạn cụ thể).
- Nghi ngờ thì **hỏi**, không tự activate. Activate nhầm tốn cả chục nghìn token và đổi hẳn dạng output.
- Tiền tố `tra nhanh:` **ép** inline, cấm activate pack bất kể nội dung câu hỏi.
- Pack không có trong `KERNEL_SKELETON.md` = không tồn tại. Không suy diễn pack ngoài danh sách.

Pack file nằm trong 3 thư mục con `K/`, `P/`, `O/` — cross-reference trong nội dung pack là tên trần (`K_agent_db_04`) nên không phụ thuộc đường dẫn. Trigger activation từng pack: `KERNEL_SKELETON.md`.

Tìm tiền lệ / báo cáo kỳ trước (Stage 0 của `P_vbse_strategy` cần N-1, `P_weekly_overview` cần W-1): tra `outputs/INDEX.md` hoặc đường dẫn xác định theo mục 4.

## 4. Kho outputs — 4 cây song song

```
outputs/
├── INDEX.md
├── md/     ← AI ghi, nguồn phân tích        (git: commit)
├── pptx/   ← AI render, bản máy             (git: ignore)
├── docx/   ← AI render, bản máy             (git: ignore)
└── sent/   ← AI copy sang, USER sửa tay     (git: commit)
```

Dưới mỗi cây, **đường dẫn và basename giống hệt nhau**, chỉ khác extension. Biết một file là suy ra được ba file kia.

```
md/vbse_strategy/monthly/<YYYY>/vbse_strategy_monthly_<YYYYMM>.md
md/vbse_strategy/weekly/<YYYY>/vbse_strategy_weekly_<YYYYMMDD>.md
md/weekly_overview/<YYYY>/weekly_overview_<YYYYMMDD>.md
md/stock_report/<TICKER>/stock_report_<TICKER>_<YYYYMMDD>_<mode>.md
md/invest_memo/<YYYY-MM>_cycle/tier{N}_<YYYYMMDD>_confirmed.md
```

`sent/` **không chia theo format** — extension đã phân biệt, và đây là cây user mở bằng mắt nên để nông.

**Carrier MD:** mọi deliverable có đúng một MD nguồn, nằm trong `md/`. Bản render và bản gửi đi là phái sinh của nó.

**Front-matter** đầu mỗi carrier MD (metadata lưu trữ — bản render KHÔNG chứa khối này):

```yaml
---
type: weekly_overview
date: 2026-07-19
inputs:
  - inputs/bctc/VNM/2025Q4_soatxet.pdf
  - "agent_db (query 2026-07-19)"
  - "https://... (tiêu đề, ngày truy cập)"
derived:
  - pptx/weekly_overview/2026/weekly_overview_20260719.pptx
  - sent/weekly_overview/2026/weekly_overview_20260719.pptx
status: final          # draft | final | sent | superseded
---
```

**INDEX.md:** một dòng mỗi deliverable, ghi ngay khi lưu, không dồn. Cột Đường dẫn trỏ bản **MD**. Cột Định dạng cho biết đã render và đã gửi những gì. Cột key call → kết quả điền ở kỳ review sau (phục vụ Stage 0 và Best/Worst call attribution).

## 5. Kho inputs

- BCTC: `inputs/bctc/<TICKER>/<YYYY>Q<N>_<loại>.pdf` — loại: `soatxet` | `kiemtoan` | `hopnhat` | `rieng`. Báo cáo năm: `<YYYY>_kiemtoan.pdf`.
- Tài liệu ngoài: `inputs/external/<YYYYMMDD>_<nguồn>_<mô tả ngắn>.<ext>`.
- **Lưu vs cite:** lưu thứ không lấy lại được (PDF user gửi, tài liệu đã tải). Bài web → cite URL + ngày truy cập trong front-matter, không lưu file. Số liệu DB → cite collection + ngày query.

## 6. Render binary

Điều kiện: **filesystem + thư viện Python** (`python-pptx`, `python-docx`, `openpyxl`). Skill `document-skills` là tiện nghi, không phải điều kiện cần.

- Style baseline: render spec trong O pack tương ứng (kể cả section đánh dấu `[LEGACY]` — dùng làm reference spec), cộng branding info user cung cấp ở pre-flight khi cần bản branded.
- Font body: Roboto, fallback Roboto → Open Sans → Arial (`engine/system_prompt.md` mục 4).
- Render xong: đặt vào `outputs/pptx/` hoặc `docx/` đúng đường dẫn gương với MD, rồi **copy một bản sang `outputs/sent/`** để user sửa tay. Ghi cả hai vào front-matter `derived` + cập nhật INDEX.

**Quan hệ MD ↔ binary:**

- **MD là nguồn của phân tích.** Sửa nội dung phân tích thì sửa MD rồi re-render.
- **Bản trong `sent/` là nguồn của thứ khách thực sự nhận.** User sửa tay ở đó; nội dung có thể khác MD — hợp lệ, không phải bất thường.
- **Re-render chỉ ghi đè `pptx/` và `docx/`. TUYỆT ĐỐI không chạm `sent/`.** Muốn thay bản đã gửi thì hỏi user trước, hoặc đổi tên bản cũ.

## 7. Quy tắc git

Repo local, branch duy nhất `main`. Remote `origin`: `git@github.com:twan507/vbse_ai_agent.git` (repo public — user đã chấp nhận rủi ro, 2026-07-22). Lịch sử git là audit trail máy — bổ trợ, không thay thế `_ops/CHANGELOG.md` (log ngữ nghĩa cho sửa engine).

**7.1. Đầu session:** `git status` phải sạch. Working tree bẩn hoặc có file untracked lạ = bất thường (mục 2.2) → báo user trước khi làm tiếp.

**7.2. Commit theo lượt việc — 1 lượt việc hoàn chỉnh = 1 commit:**

- Deliverable mới: carrier MD (`md/`) + bản đã gửi (`sent/`) + dòng INDEX + inputs mới dùng — cùng 1 commit. **`pptx/` và `docx/` không vào git** (gitignore): chúng là bản máy sinh lại được, còn bản không tái tạo được đã nằm ở `sent/`. `since: 2026-07 | review: 2027-Q1` — xem lại khi có script render xác định.
- Intake file rời (chưa gắn deliverable): commit riêng.
- Sửa engine: commit riêng, CHANGELOG entry nằm trong cùng commit. Không trộn engine với deliverable — để revert độc lập.
- Cuối session không để working tree bẩn: hoặc commit trọn vẹn, hoặc báo user phần đang dở.

**7.3. Message:** `<type>: <mô tả ngắn tiếng Việt>` — type: `report` (deliverable) | `intake` (input) | `engine` (mọi thứ trong `engine/`) | `ops` (cấu trúc workspace, CLAUDE.md, README, `_ops/`, `.claude/`) | `fix` (đính chính → bản superseded). Ví dụ: `report: weekly_overview 20260719 (md+sent)`. Body ghi đường dẫn chính khi không hiển nhiên từ message.

**7.4. Cấm:** amend/rebase/force lên commit đã tạo — lịch sử append-only như kho; commit file bất thường (conflict copy, temp) — xử lý theo mục 2.2 trước; tự tạo branch/remote khi user chưa yêu cầu. Ba lệnh đầu được cưỡng chế bằng PreToolUse hook ở `.claude/settings.json` — CLAUDE.md là context, hook mới là enforcement.

**7.5. Line-ending:** `.gitattributes` ép LF cho text — không override bằng autocrlf, không tắt.

**7.6. OneDrive:** repo nằm trong folder OneDrive — chấp nhận với 1 máy + 1 session ghi tại một thời điểm; không chạy song song nhiều session cùng ghi.

**7.7. Push — phân công:** AI commit local (mục 7.2); push do USER chạy thủ công từ máy (`git push`, xác thực SSH của máy user). Sandbox không có credential SSH/PAT nên AI KHÔNG tự push được — không thử, không coi là lỗi. Cuối session nếu có commit mới chưa push → nhắc user một câu. Mọi trường hợp: cấm force push.

## 8. Behavioral guidelines

1. **Think before acting** — không giả định ngầm; nhiều cách hiểu thì hỏi, surface tradeoff.
2. **Simplicity first** — giải pháp tối thiểu đủ dùng, không thêm cấu trúc/feature đón đầu.
3. **Surgical changes** — chỉ chạm file phải chạm, giữ style hiện có, không refactor ngoài yêu cầu.
4. **Goal-driven execution** — định nghĩa tiêu chí xong việc trước, verify xong mới báo done.

## 9. Ghi chú môi trường

Mỗi ghi chú có hạn xem lại. Quá hạn thì kiểm chứng lại rồi gia hạn hoặc xoá — đừng để mặc định là còn đúng.

| Ghi chú | since | review |
|---|---|---|
| Workspace trên OneDrive: lệnh bash lỗi với file cloud-only → dùng tool Read (tự tải về). Di chuyển/ghi hàng loạt gây một đợt sync — bình thường, không phải lỗi | 2026-07 | 2027-Q1 |
| Git trong sandbox Cowork cần quyền xoá file. Gặp "unable to unlink ... Operation not permitted" → xin quyền delete cho folder, dọn `index.lock` + `tmp_obj_*` trong `.git/objects/`, thao tác lại. Không kết luận "git không dùng được" | 2026-07 | 2026-Q4 |
| MongoDB `agent_db` **đã kết nối được** qua MCP — verify 2026-07-28: 35 collection, 122 MB, đọc được. Phiên nào mất kết nối thì chỉ làm được phần methodology, phải nói rõ với user | 2026-07 | 2026-Q4 |
| Skill `document-skills` (docx/pptx/xlsx của Anthropic) cài qua `claude plugin install`, nằm ở `~/.claude/plugins/` — **ngoài git**, máy mới phải cài lại. Không copy file skill vào repo: license cấm redistribute/derivative và repo này public | 2026-07 | 2026-Q4 |
| **Auto memory của Claude Code không có thẩm quyền.** Nó machine-local, ngoài git, không sync giữa máy. Mọi tri thức cần giữ phải nằm trong repo. Mâu thuẫn giữa auto memory và file trong repo → file trong repo thắng | 2026-07 | 2027-Q1 |
