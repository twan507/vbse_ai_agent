# CHANGELOG — thay đổi engine & cấu trúc workspace

Ghi mỗi lần sửa engine (K/P/O, system_prompt, KERNEL_SKELETON, OUTPUT_MASTER, agent_db_*) hoặc thay đổi cấu trúc workspace. Mục đích: biết mỗi báo cáo trong `outputs/` được sinh trên phiên bản spec nào. Dòng mới thêm lên đầu.

Format: `## YYYY-MM-DD — tiêu đề` + file đụng tới + nội dung + lý do.

## 2026-07-28 — Sửa 4 mâu thuẫn engine do subagent audit phát hiện

**Phương pháp:** thả 5 subagent read-only đóng vai session mới, mỗi con nhận một câu hỏi user khác nhau, rồi đọc lại response xem luật có đứng vững không. Hành vi: **5/5 đúng ở mọi điểm cốt lõi**. Nhưng chúng bắt được 4 mâu thuẫn trong chính văn bản engine mà cả 3 pass audit thủ công trước đó đều bỏ sót.

**1. `KERNEL_SKELETON.md` tự mâu thuẫn, cách nhau 4 dòng.** Khối mới thêm nói *"chỉ khi cần chạy workflow deliverable. Tra cứu nhanh thì không đọc"*; mục "Cách dùng file này" điểm 1 ngay dưới vẫn nói *"Agent scan file này đầu session"*. Lỗi của tôi khi thêm luật gate mà không rà phần cũ trong cùng file. Đã sửa điểm 1.

**2. `OUTPUT_MASTER.md` cùng bệnh, 3 chỗ.** `system_prompt.md` mục 1, `KERNEL_SKELETON.md` mục OUTPUT_MASTER, và chính `OUTPUT_MASTER.md` dòng 5 đều ghi "Đọc đầu session" — trong khi `system_prompt.md` mục 5.8 chốt chỉ áp khi compose deliverable cuối. Phiên tra cứu nạp glossary là phí. Đã đổi cả 3 thành "khi sắp compose deliverable".

**3. `K_sector_framework` — trigger tự mâu thuẫn.** Dòng đầu ghi *"không tự activate"*, bốn dòng dưới lại ghi *"Standalone: khi user hỏi phân tích sâu ngành X"*. Giải quyết bằng cách nói rõ điều mà cả hai vế đều bỏ sót: **đây là K pack, luật gate chỉ chặn P/O** — nên pull standalone ở chế độ tra cứu là hợp lệ, miễn không sinh deliverable file.

**4. Nhãn `[LEGACY]` chưa từng tồn tại trong repo.** `CLAUDE.md` mục 6 và `README` mục 8.1 đều chỉ định dùng "section đánh dấu `[LEGACY]`" làm style baseline khi render. Verify: `git log -S"[LEGACY]"` trên toàn lịch sử = **rỗng**; baseline rev 7 = 0 lần. Nhãn này là tàn dư mô tả từ rev 6 tiền-git, và tôi đã nhân bản nó sang README khi sửa mục 8.1.

Đi kèm là một sai sót nghiêm trọng hơn: 3 chỗ khẳng định `O_weekly_overview_00` có spec pptx/docx, thực tế file đó có **đúng 1 chữ "pptx"** và nó trỏ ngược về `system_prompt.md` mục 4 — mà mục 4 lại trỏ ngược về "O pack có render spec". **Tham chiếu vòng tròn, không có layout nào.**

Kiểm đủ 10 file O pack thay vì kết luận vội (lần sửa đầu tôi đã viết sai thành "không O pack nào có spec"):

| O pack | Spec layout binary |
|---|---|
| `O_invest_memo_*` | **Có thật** — bảng slide 15-20 slide ở `_02`, docx/pptx layout ở `_00`/`_01`/`_03`/`_05` |
| `O_weekly_overview_00` · `O_vbse_strategy_00` · `O_stock_report_00` | **Không có** — 0 lần nhắc "slide" |

`system_prompt.md` mục 4 nguồn (1) nay có bảng hiện trạng này; ba pack thiếu spec thì phải hỏi style user theo Bước 2, không đoán.

**Bài học:** ba pass grep thủ công không bắt được lỗi nào trong bốn lỗi trên, vì grep tìm được thứ mình nghĩ ra để tìm. Subagent đọc như người dùng thật thì vấp phải mâu thuẫn một cách tự nhiên. Với thay đổi kiến trúc, chạy audit bằng subagent là bước nên có, không phải tuỳ chọn.

## 2026-07-28 — Dọn tàn dư runtime Claude Desktop trong engine (rev 8, pass cuối)

**Phạm vi:** 17 file. Lượt trước ghi "chưa dọn, cố ý"; user yêu cầu dọn hết trước khi vào việc thật. Phân loại kỹ vì phần lớn chữ "upload" là **đúng** — user gửi BCTC PDF qua chat vẫn là luồng hiện hành, không đụng.

**Nhóm 1 — chỉ thị hành vi SAI (nặng nhất).** Hai pack ra lệnh agent không được lưu file:
- `P_vbse_strategy_00` mục 2 và `P_weekly_overview_00` mục 2: *"agent KHÔNG lưu file qua session. User tự archive"* → nay agent ghi carrier MD vào `outputs/md/...` kèm front-matter + dòng INDEX.
- Kéo theo: chỗ nào bảo "user upload báo cáo N-1 / W-1 / monthly active" nay đổi thành **tra `outputs/INDEX.md` trước**, chỉ khi kho chưa có mới yêu cầu upload. Sửa ở `P_vbse_strategy_00/07`, `P_weekly_overview_00`. Trực tiếp phục vụ Stage 0 (`P_vbse_strategy` cần N-1, `P_weekly_overview` cần W-1) — trước đây mâu thuẫn với `CLAUDE.md` mục 3.

**Nhóm 2 — `system_prompt.md` execution loop trái luật gate.** Bước 1 cũ là *"Đọc `KERNEL_SKELETON.md` nếu chưa đọc trong session"* — tức mọi câu hỏi, kể cả tra cứu giá, đều nạp chỉ mục pack. Ngược hẳn luật gate vừa lập ở `CLAUDE.md` mục 3. Loop mới: **phân loại intent trước**, tra cứu thì bỏ qua chỉ mục pack luôn. Ghi tương ứng ở `KERNEL_SKELETON.md` đầu file. Đây là chỗ luật gate thực sự có hiệu lực — không có nó thì gate chỉ nằm trên giấy.

**Nhóm 3 — wording "project knowledge" / "Claude Desktop".** 14 chỗ mô tả cơ chế lưu file của runtime cũ. Đổi sang đường dẫn kho thật: state file tier 0-7 của `P_invest_memo` nằm ở `outputs/md/invest_memo/<YYYY-MM>_cycle/`, tier sau đọc trực tiếp file tier trước. Mục "Setup project knowledge" đổi thành "File cần đọc".

**Bắt được nhân tiện:** `P_vbse_strategy_00` và `P_weekly_overview_00` ghi `K_agent_db` có **6 file `_00`–`_05`**; thực tế **7 file `_00`–`_06`** (`_06` phase & danh mục thêm ở v2). Đã sửa.

**Không đụng:** 4 chỗ "xuất block trong message" ở `P_vbse_strategy_00/07` — đó là **checkpoint block** trình user duyệt giữa stage, bản chất hội thoại, không phải deliverable. Hành vi vẫn đúng.

## 2026-07-28 — Audit rev 8: gỡ 5 chỉ thị "render binary out of scope" trong engine

**Phát hiện khi audit sau khi đã đóng rev 8.** Sửa README mục 8.1 và CLAUDE.md mục 6 ở commit trước là chưa đủ — mâu thuẫn còn sống **bên trong engine**, ở dạng chỉ thị hành vi chứ không phải mô tả.

Năm chỗ ra lệnh cho agent từ chối render:

- `KERNEL_SKELETON.md` dòng 234 (mô tả pack `O_stock_report`)
- `O/O_stock_report_00.md` dòng 9 và 517
- `P/P_stock_report_00.md` dòng 164
- `P/P_stock_report_04.md` dòng 444 (mục 4.5 Render output channel)

**Vì sao nghiêm trọng hơn mâu thuẫn ở README:** đây không phải wording lỗi thời vô hại. `system_prompt.md` mục 9 nói *"User yêu cầu render binary: chạy workflow render binary — **không từ chối**"*, còn `O_stock_report_00` dòng 9 nói *"out of scope"*. Hai chỉ thị ngược nhau trong cùng một engine, và pack file được đọc **sau** system prompt nên nhiều khả năng thắng. Kết quả thực tế sẽ là agent từ chối render đúng lúc user cần.

Đã đổi cả 5 sang "trong scope", kèm đường dẫn ghi file mới (`outputs/md/`, `outputs/pptx|docx/`, copy sang `outputs/sent/`) và trỏ về `CLAUDE.md` mục 6.

**Bài học ghi lại:** sửa mâu thuẫn ở tầng doc (CLAUDE.md, README) không tự động sửa tầng engine. Lần sau đổi một quyết định kiến trúc, phải grep chính từ khoá của quyết định đó (`out of scope`, `không hỗ trợ`, `không render`) trên toàn `engine/`, không chỉ trên doc.

**Không đụng:** wording "project knowledge" / "Claude Desktop" còn ~11 chỗ trong P/O packs. Chúng mô tả cơ chế lưu file cũ, **không chặn hành vi** — agent theo `CLAUDE.md` mục 4 vẫn ghi đúng chỗ. Khác bản chất với 5 chỗ trên. Xem README mục 10.

## 2026-07-28 — Tái cấu trúc workspace rev 8 (A2-A4, B1-B2)

**Phạm vi:** cấu trúc thư mục, luật vận hành, tooling. Spec: `_ops/specs/2026-07-28-tai-cau-truc-workspace-design.md`.

**A2 — xoá thứ không còn lý do tồn tại.** `_ops/check_sync.sh` + `_ops/sync_baseline/` (6 diff): chỉ phục vụ đồng bộ 2 bản knowledge, không còn 2 bản. `agent_marketing/` + `brand/`: vỏ rỗng, mỗi thư mục đúng 1 file README, sinh cùng giả định Desktop Project đã bị bác. Verify trước khi xoá `brand/`: mode "default branded" của `O_weekly_overview_00` dùng placeholder `[TÊN CÔNG TY]` điền từ pre-flight, không đọc `brand/` — xoá an toàn.

**A3 — `agent_analyst/` → `engine/`.** Dùng `git mv` nên lịch sử từng file giữ được (`git log --follow` truy tới commit baseline). Lý do đổi: `CLAUDE.md` mục 1 vốn đã dùng từ "ENGINE" cho đúng tầng này; sau khi gộp còn một engine nên thư mục mang đúng tên kiến trúc.

**A4 — viết lại CLAUDE.md + README.** Thay đổi luật đáng chú ý:
- **Luật gate mới** (CLAUDE.md mục 3): mặc định mọi query là inline lookup; activate P/O pack chỉ khi có ý định deliverable tường minh; tiền tố `tra nhanh:` ép inline. Đây là thứ thay thế cách ly vật lý cũ giữa 2 agent.
- **`outputs/` thành 4 cây** `md/ pptx/ docx/ sent/`, đường dẫn và basename gương nhau. `sent/` là bản user sửa tay trước khi gửi khách.
- **Ngoại lệ đầu tiên của luật 2.1** (AI là người ghi duy nhất): user được sửa nội dung file trong `outputs/sent/`. Kèm mục 2.2 nói rõ đó không phải bất thường.
- **Re-render không bao giờ chạm `sent/`** (mục 6). Trước đây luật là "MD là source of truth, không edit binary trực tiếp" — sai với thực tế vì user luôn chỉnh tay pptx/docx trước khi gửi.
- `pptx/` `docx/` vào `.gitignore`: bản máy sinh lại được; bản không tái tạo được nằm ở `sent/`. Giải luôn bài toán phình repo do ZIP không delta được.
- **Sửa mâu thuẫn README mục 8.1 ↔ CLAUDE.md mục 6:** README nói render binary out of scope (rev 6), CLAUDE.md nói in scope kèm quy trình. Chốt lại: **in scope**, điều kiện là "filesystem + thư viện Python" chứ không phải "+ skill". Nhãn `[LEGACY]` trên 16 section O pack nay đọc là "reference spec", không phải "đã bỏ".
- Mục 9 chuyển thành bảng có `since:` / `review:` cho từng ghi chú môi trường — phần thối nhanh nhất.

**B1 — PreToolUse hook.** `.claude/hooks/block-git-rewrite.ps1` chặn `git commit --amend`, `git rebase`, `git push --force` (CLAUDE.md mục 7.4). Test 11/11 pass trên Windows PowerShell 5.1, kiểm cả hai chiều: case phải chặn và case không được chặn nhầm (`git log --grep="rebase"`). `.claude/settings.json` tracked để hook đi theo repo; `.claude/settings.local.json` gitignore.

**B2 — `_ops/GOTCHAS.md`.** Khung + entry đầu tiên: hook fail-open khi script `.ps1` chứa ký tự ngoài ASCII.

**Lệch so với spec, ghi lại để khỏi tin nhầm số cũ:**
- A3 spec ước 9 tham chiếu `agent_analyst` trong 5 file pack; thực tế **2** (`K_agent_db_00` dòng 140, `P_stock_report_00` dòng 200). Con số 9 đến từ grep gộp cả `KERNEL_SKELETON`/`OUTPUT_MASTER`.
- Bỏ hạng mục C15 của spec (thêm cờ `rendered`/`hand-edited`/`sent` vào front-matter `derived`). Vị trí thư mục đã mang đúng thông tin đó — thêm cờ là dư.

**Chưa làm, cố ý:** wording "user copy/save thủ công" còn rải rác trong P/O packs (tàn dư runtime Claude Desktop). Nằm ngoài phạm vi "cấu trúc + dọn trùng lặp" và không gây lỗi runtime vì agent theo `CLAUDE.md` mục 4 để biết ghi ở đâu. Dọn ở pass sau, khi chạy báo cáo thật và biết chỗ nào thực sự vướng. Xem README mục 10.

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
