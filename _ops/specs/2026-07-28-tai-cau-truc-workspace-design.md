# Design — Tái cấu trúc workspace (rev 8)

*Chốt 2026-07-28. Thi hành trong cùng ngày.*

---

## 1. Vì sao

Rev 7 thiết kế cho runtime **Claude Desktop Project**: mỗi agent là một project riêng, upload knowledge riêng, không share file được. Ràng buộc đó sinh ra ba thứ:

- Luật "mỗi agent độc lập 100%" (README 1.3)
- Hai bản knowledge gần identical: `agent_analyst/K/K_agent_db_01..06` và `agent_db/agent_db_01..06`
- Bộ máy giữ đồng bộ: `_ops/check_sync.sh` + 6 file baseline + luật port hai chiều (CLAUDE.md 2.4)

Runtime nay chỉ còn **filesystem** (Claude Code / Cowork). Ràng buộc gốc biến mất, ba thứ trên thành chi phí thuần.

Thêm nữa: cách ly vật lý giữa 2 agent **thực ra đã mất rồi**. Nó chỉ hoạt động nhờ Desktop Project upload hai bộ knowledge tách biệt. Với runtime filesystem, một phiên nhìn thấy cả hai thư mục cùng lúc. Gộp không làm mất đảm bảo nào — nó thôi giả vờ rằng đảm bảo đó còn tồn tại.

## 2. Phát hiện nền tảng

Đọc 6 file `_ops/sync_baseline/db_0*.diff`: **27/29 khác biệt chỉ là con trỏ cross-reference**, không phải nội dung.

| Bản trong `K/` | Bản trong `agent_db/` |
|---|---|
| `system prompt mục 5.5 + K_agent_db_00 mục 5` | `system prompt mục 8.5 + 9` |
| `K_agent_db_00 mục 4.6` | `system prompt mục 5` |

Cùng một luật, khác chỗ cất. Chỉ 2 khác biệt là ngữ nghĩa thật:

1. `db_06` — ghi chú audience (NĐT cá nhân vs analyst nội bộ)
2. `db_03` — Rule 4 clarification (bản chặt vs bản nới)

**Nguyên nhân gốc không phải duplication mà là:** file knowledge trỏ ngược lên system_prompt của một agent cụ thể. Một file mô tả dữ liệu lại phụ thuộc cách đánh số mục trong prompt → không dùng chung được dù nội dung giống hệt.

Workspace thực chất có **3 tầng**, và tầng giữa đang bị cất ở hai nơi:

| Tầng | `agent_analyst` | `agent_db` | Giống nhau? |
|---|---|---|---|
| 1. Persona — audience, tone | *(không có)* | `system_prompt` mục 1–2 | Bổ sung nhau |
| 2. Luật nền domain | `K_agent_db_00` | `system_prompt` mục 3–14 | Giống, khác chỗ cất |
| 3. Dữ liệu & methodology | `K_agent_db_01..06` | `agent_db_01..06` | Giống hệt |

`agent_analyst/system_prompt.md` tự khai ở mục 1: *"không chứa tone"*. `agent_db/system_prompt.md` mục 1–2 lấp đúng chỗ trống đó. Hai prompt bổ sung nhau chứ không xung đột.

## 3. Quyết định

**Một engine.** `agent_db/` biến mất. "Tra cứu nhanh" trở thành trạng thái **không pack nào active** của cùng một engine — đúng đường fallback đã có sẵn ở `KERNEL_SKELETON.md` mục 4.

Giữ `K_agent_db_00` làm tầng 2 (không giữ bản `agent_db/system_prompt.md` mục 3–14), vì 27 cross-ref đã trỏ về nó → **không phải sửa một cross-ref nào**.

Xoá `agent_marketing/` và `brand/`: vỏ rỗng, sinh cùng lúc với giả định đã bị bác. Khi làm marketing thật sẽ dựng lại — lúc đó biết nó cần gì thay vì đoán.

**`K_agent_db_*` giữ nguyên tên.** `agent_db` ở đây là tên **database MongoDB** đang sống (đã verify: 35 collection, 122 MB), không phải thư mục bị xoá.

## 4. Cây thư mục mới

```
ai_agent/
├── CLAUDE.md          luật vận hành repo — ghi file, intake, INDEX, git
├── README.md          kiến trúc cho người đọc
├── .claude/
│   └── settings.json  hook cưỡng chế luật git (tracked)
│
├── engine/            TẦNG ENGINE — tri thức + quy trình + output spec
│   ├── system_prompt.md      persona, tone nền, orchestration
│   ├── KERNEL_SKELETON.md    chỉ mục pack + trigger + luật gate
│   ├── OUTPUT_MASTER.md      glossary EN→VN
│   ├── K/  K_agent_db_00..06 · K_sector_framework
│   ├── P/  30 file
│   └── O/  10 file
│
├── inputs/            TẦNG KHO
│   ├── bctc/<TICKER>/
│   └── external/
│
├── outputs/           TẦNG KHO — 4 cây theo chủ sở hữu
│   ├── INDEX.md
│   ├── md/     <loại>/<năm>/<tên>.md      AI ghi — nguồn phân tích
│   ├── pptx/   <loại>/<năm>/<tên>.pptx    AI render — gitignore
│   ├── docx/   <loại>/<năm>/<tên>.docx    AI render — gitignore
│   └── sent/   <loại>/<năm>/<tên>.pptx    USER sửa tay — commit
│
└── _ops/
    ├── CHANGELOG.md
    ├── GOTCHAS.md
    └── specs/
```

Đổi `agent_analyst/` → `engine/` vì CLAUDE.md mục 1 **đã dùng sẵn từ "ENGINE"** cho đúng tầng này. Sau khi gộp còn một engine, thư mục mang đúng tên kiến trúc đã viết. Bốn thư mục gốc sắp alphabet ra đúng thứ tự đọc: `_ops` → `engine` → `inputs` → `outputs`.

## 5. Gate — tra cứu không kích hoạt pack

Cách ly chuyển từ "nhân đôi thư mục" sang "chặn ở chỉ mục". Hai lớp:

1. **Mặc định đảo chiều.** Mặc định là inline lookup. Activate P/O pack chỉ khi query có **ý định deliverable tường minh**. Nghi ngờ thì hỏi, không tự activate.
2. **Từ khoá ép.** Tiền tố `tra nhanh:` buộc inline, cấm activate pack bất kể nội dung câu hỏi.

Cơ chế đã tồn tại và đã chạy (`KERNEL_SKELETON` mục 4 fallback); thay đổi là biến nó từ **đường thoát** thành **mặc định**.

## 6. Quan hệ MD ↔ binary

User sẽ **sửa tay** pptx/docx trước khi gửi khách. Điều này phá luật cũ *"MD là source of truth — không edit binary trực tiếp"* (CLAUDE.md mục 6).

Quan hệ đúng:

```
MD → render → pptx/docx (bản máy) → AI copy sang sent/ → USER sửa tay → gửi khách
```

Ba hệ quả:

- Bản trong `sent/` **không tái tạo được** → bắt buộc commit
- Bản trong `pptx/`, `docx/` là bản máy, sinh lại được → **gitignore**, cắt phần gây phình repo
- **Re-render chỉ ghi đè `pptx/` `docx/`, không bao giờ chạm `sent/`**

Phát biểu đúng: **MD là nguồn của phân tích; binary trong `sent/` là nguồn của thứ khách thực sự nhận.**

Kéo theo: bỏ tham vọng script render xác định. Byte-reproducibility vô nghĩa khi có bàn tay người ở cuối. Script (nếu làm sau này) chỉ cần đưa tới bản nháp tốt.

**Ngoại lệ luật 2.1.** AI tạo và đặt file ở mọi nơi; user chỉ sửa **nội dung** file trong `sent/`. Đây là ngoại lệ duy nhất, phải viết vào CLAUDE.md — nếu không, mỗi lần user sửa file là session sau báo bất thường theo luật 2.2.

## 7. Kế hoạch thi hành

### Phase A — tái cấu trúc

| Commit | Loại | Nội dung |
|---|---|---|
| A1 | `engine` | Persona & tone nền vào `system_prompt.md` (mục mới ở cuối, **không renumber**) · audience thành tham số (`K_agent_db_00` mục 1 + 4.4) · Rule 4 chốt **bản nới** (`K_agent_db_03`) · xoá `agent_db/` 7 file |
| A2 | `ops` | Xoá `check_sync.sh` + `sync_baseline/` (6) + `agent_marketing/` + `brand/` |
| A3 | `ops` | `git mv agent_analyst engine` + sửa 9 tham chiếu trong 5 file pack |
| A4 | `ops` | Viết lại CLAUDE.md + README (mục 8 dưới) |

### Phase B — bổ sung

| Commit | Loại | Nội dung |
|---|---|---|
| B1 | `ops` | PreToolUse hook chặn `git commit --amend`, `git rebase`, `git push --force` + track `.claude/settings.json` |
| B2 | `ops` | Tạo `_ops/GOTCHAS.md` (khung rỗng, format Symptom / Root cause / Fix / Where) |
| B3 | `engine` | Mục lục section đầu `K_agent_db_04` (73 KB) và `K_agent_db_05` (127 KB) |

### Phase D — môi trường, không commit

`pip install python-pptx pypdf` · `claude plugin install document-skills@anthropic-agent-skills`

## 8. Sửa luật — gộp vào A4

| # | Chỗ | Nội dung |
|---|---|---|
| C1 | CLAUDE.md 1 | Cây thư mục mới |
| C2 | CLAUDE.md 2.3 | Bỏ nhánh intake brand asset |
| C3 | CLAUDE.md 2.4 | **Xoá** mệnh đề port hai chiều + check_sync + baseline |
| C4 | CLAUDE.md 3 | Router gộp 1 dòng + **luật gate** |
| C5 | CLAUDE.md 4 | Bỏ `outputs/marketing/`; 4 cây song song; **bỏ quy tắc bundle** |
| C6 | CLAUDE.md 6 | Bỏ `brand/`; **"filesystem + skill" → "filesystem + thư viện Python"**; re-render không chạm `sent/` |
| C7 | CLAUDE.md 7.2 | Commit `md/` + `sent/`; `pptx/` `docx/` gitignore |
| C8 | CLAUDE.md 7.3 | Định nghĩa lại phạm vi type `engine` |
| C9 | CLAUDE.md 9 | Bỏ Desktop Project · MongoDB đã kết nối · document-skills ngoài git · auto memory không có thẩm quyền |
| C10 | CLAUDE.md 9 | Gắn `since:` / `review:` cho từng ghi chú môi trường |
| C11 | CLAUDE.md 2.1 | **Ngoại lệ:** user sửa được nội dung file trong `sent/` |
| C12 | CLAUDE.md 2.2 | Sửa file trong `sent/` không phải bất thường |
| C13 | CLAUDE.md 2.5 | `derived` ghi đường dẫn tương đối đầy đủ |
| C14 | `.gitignore` | Thêm `outputs/pptx/`, `outputs/docx/` |
| C15 | README 8.1 | **Sửa mâu thuẫn:** render binary IN scope (README đang nói out of scope, ngược CLAUDE.md 6) |
| C16 | README 1.x, 2.x | Bỏ bảng 2 agent, bỏ mục triển khai Desktop Project |
| C17 | `outputs/INDEX.md` | Cột Đường dẫn trỏ bản MD; ký hiệu cho biết đã có bản `sent/` |

## 9. Đã quyết KHÔNG làm

| Việc | Lý do |
|---|---|
| Tạo `AGENTS.md` | Không dùng Codex/Cursor/Copilot; rước bài toán đồng bộ 2 file |
| Dựng `memory-bank/` | Workspace đã có tương đương; trùng lặp đo được là +23% chi phí, −2% chất lượng (arXiv:2602.11988) |
| Tách `POSITIONS.md` / `DEAD-ENDS.md` / `SOURCES.md` | Front-matter + INDEX + superseded đã phủ; DEAD-ENDS chính là B2 |
| Tách `.claude/rules/` | CLAUDE.md 98 dòng, dư gấp đôi. Rule không có `paths` vẫn nạp mọi phiên |
| Copy skill docx/pptx của Anthropic vào repo | LICENSE.txt cấm redistribute + derivative works; repo public |
| Viết render script ngay | `outputs/` rỗng. Làm 2–3 báo cáo thật trước |
| Đổi tên `K_agent_db_*` | Trỏ tới database `agent_db` đang sống |
| Lưu file nghiên cứu vào `inputs/external/` | User chọn để dự án trắng |
| Đổi tên `KERNEL_SKELETON.md`, `K/` `P/` `O/` | ~15 chỗ để đổi lấy chút nhất quán từ vựng — vi phạm guideline 3 "surgical changes" |

## 10. Rủi ro

| Rủi ro | Giảm thiểu |
|---|---|
| Renumber mục `system_prompt.md` làm vỡ 12 cross-ref nội bộ + tham chiếu từ pack | Thêm mục mới ở **cuối**, không chèn giữa, không đánh lại số |
| `git mv` bị hiểu thành xoá + thêm, mất lịch sử file | Dùng `git mv` chứ không `mv`; verify bằng `git log --follow` |
| Sót tham chiếu `agent_analyst` sau khi đổi tên | Grep lại sau A3; `_ops/CHANGELOG.md` **cố ý giữ tên cũ** (log append-only) |
| Xoá `brand/` làm hỏng mode "default branded" của `O_weekly_overview` | Đã verify: mode đó dùng placeholder `[TÊN CÔNG TY]` điền từ pre-flight, không đọc `brand/` |
| Git trong sandbox lỗi unlink | CLAUDE.md mục 9 — dọn `index.lock` + `tmp_obj_*`, thao tác lại |
