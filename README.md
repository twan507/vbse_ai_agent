# Claude Project — Hệ thống agent phân tích chứng khoán

Workspace AI cho VBSE: **một engine** phân tích chứng khoán (tri thức + quy trình + output spec) và kho lưu trữ deliverable/input. Runtime: **filesystem** (Claude Code / Cowork đọc thẳng thư mục). AI session đọc `CLAUDE.md` trước (router + luật vận hành); file này cho con người và cho AI khi cần hiểu sâu kiến trúc engine.

---

## 1. Tổng quan dự án

### 1.1. Một engine

| Thành phần | Folder | Mục đích | Số file |
|---|---|---|---|
| **engine** | `engine/` | Tri thức + quy trình + output spec cho toàn bộ phân tích chứng khoán VN. Mọi báo cáo tham chiếu từ đây | 51 |

Trước rev 8 workspace có 2 agent (`agent_analyst` + `agent_db`) với 2 bản knowledge gần identical. Ràng buộc sinh ra chúng là Claude Desktop Project — mỗi project upload knowledge riêng, không share file được. Runtime nay chỉ còn filesystem nên ràng buộc mất; 2 agent gộp làm 1. Chi tiết: mục 8.3.

### 1.2. Hai chế độ dùng — cùng một engine

- **Tra cứu nhanh (mặc định)** — "VNM giá bao nhiêu", "thị trường tuần qua dòng tiền thế nào", "chỉ báo zone AAA nghĩa là gì". Chỉ đọc K pack, **không activate P/O pack**, trả lời inline. Đây là chế độ mặc định của mọi query.
- **Chạy workflow** — khi cần deliverable hoàn chỉnh: memo deep-dive 1 mã, báo cáo thị trường tuần 12 phần, chiến lược tháng, stock report. Activate P + O pack, có checkpoint, output MD final structured.

Ranh giới giữa 2 chế độ do **luật gate** giữ (`CLAUDE.md` mục 3): mặc định là tra cứu; chỉ activate pack khi query có ý định deliverable tường minh; tiền tố `tra nhanh:` ép inline.

### 1.3. Quy tắc kiến trúc cốt lõi

**Ba tầng, mỗi tầng một địa chỉ duy nhất.** Đây là bài học từ rev 8: hai bản knowledge cũ lệch nhau ở 27 chỗ, và cả 27 chỉ là con trỏ cross-reference — hệ quả của việc tầng "luật nền" bị cất ở hai nơi.

| Tầng | Ở đâu | Nội dung |
|---|---|---|
| 1. Persona, audience, tone nền | `engine/system_prompt.md` mục 11 | Vai trò, negative scope, audience (tham số), tone khi không có O pack |
| 2. Luật nền domain | `engine/K/K_agent_db_00.md` | Nguồn dữ liệu, luật query, đơn vị, K hygiene, phase, domain rules |
| 3. Dữ liệu & methodology | `engine/K/K_agent_db_01..06.md` | Schema, query patterns, anti-patterns, methodology, news, phase |

Hệ quả thực tế:
- File tầng 3 **không được trỏ ngược lên system_prompt của một runtime cụ thể** — chỉ trỏ tới `K_agent_db_00`. Đây chính là thứ khiến bản cũ không dùng chung được dù nội dung giống hệt.
- Audience là **tham số**, không phải hằng số nhúng trong knowledge (`system_prompt.md` mục 11.2).
- `K_agent_db_*` giữ tên: `agent_db` ở đây là tên **database MongoDB** đang vận hành, không phải thư mục agent cũ.

### 1.4. Cấu trúc workspace (rev 8 — 2026-07-28)

Workspace tách 2 tầng: **engine** (knowledge/process/output spec — ổn định, sửa có kiểm soát, log tại `_ops/CHANGELOG.md`) và **kho** (artifact — append-only, không sửa ngược).

```
CLAUDE.md    cửa vào cho AI: router domain + luật gate + luật vận hành repo
engine/      tri thức + quy trình + output spec
             gốc: system_prompt, KERNEL_SKELETON, OUTPUT_MASTER; pack trong K/ P/ O/
inputs/      đầu vào đã dùng (bctc/<TICKER>/, external/)
outputs/     deliverable 4 cây (md/ pptx/ docx/ sent/) + INDEX.md sổ cái
_ops/        CHANGELOG.md + GOTCHAS.md + specs/
.claude/     settings.json — PreToolUse hook cưỡng chế luật git
```

Bốn thư mục gốc sắp alphabet ra đúng thứ tự đọc: `_ops` → `engine` → `inputs` → `outputs`. Ranh giới: **`engine/` = làm thế nào cho đúng nghiệp vụ; `CLAUDE.md` = làm thế nào cho đúng repo.**

**Luật vận hành cốt lõi (chi tiết `CLAUDE.md` mục 2):** AI là người ghi duy nhất — ngoại lệ duy nhất là `outputs/sent/`, nơi user sửa tay bản gửi khách; input user gửi qua chat, AI chuẩn hoá tên theo convention rồi mới lưu; AI phát hiện bất thường thì báo user, không tự xử; kho append-only — đính chính bằng bản mới + đánh dấu superseded trong INDEX, không ghi đè.

**Version control:** git local branch `main`, AI commit theo lượt việc (deliverable / intake / engine / ops tách commit riêng), lịch sử append-only không rewrite, `.gitattributes` ép LF. Remote `origin` = GitHub `twan507/vbse_ai_agent`; **AI commit xong thì push luôn** — verify 2026-07-28 là push từ sandbox chạy được qua SSH của máy user (chi tiết `CLAUDE.md` mục 7.7). `outputs/pptx/` và `outputs/docx/` gitignore — bản máy sinh lại được; bản không tái tạo được nằm ở `outputs/sent/`. Chuỗi truy vết 4 lớp: front-matter (file tự mô tả) → `outputs/INDEX.md` (sổ cái) → `_ops/CHANGELOG.md` (log ngữ nghĩa engine) → git log (audit trail máy).

---

## 2. Runtime

### 2.1. Filesystem, không upload

Runtime là **Claude Code / Cowork đọc thẳng thư mục**. Không còn bước upload knowledge, không còn re-upload khi sửa file — sửa file là session sau thấy ngay.

Session khởi động đọc `CLAUDE.md` (nạp tự động), rồi theo bảng router mục 3 của file đó mà đọc tiếp `engine/system_prompt.md` và pack cần thiết. Toàn bộ `engine/` **không** nạp tự động — chỉ đọc theo nhu cầu, đúng mô hình một tầng chỉ mục (`KERNEL_SKELETON.md`) rồi lấy nội dung khi cần.

### 2.2. Đổi máy hoặc môi trường mới

Những gì đi theo repo: toàn bộ `engine/`, `CLAUDE.md`, `_ops/`, `.claude/settings.json` (hook).

Những gì **không** đi theo repo, phải cài lại:
- Kết nối MongoDB `agent_db` qua MCP
- Thư viện render: `python-pptx`, `python-docx`, `openpyxl`, `pypdf`
- Plugin `document-skills` (`claude plugin install document-skills@anthropic-agent-skills`) — license cấm copy file skill vào repo
- Auto memory của Claude Code (machine-local, không có thẩm quyền — xem `CLAUDE.md` mục 9)

### 2.3. MongoDB connection

Engine giả định quyền **read-only** trên MongoDB database `agent_db`, cung cấp qua MCP server. Verify 2026-07-28: 35 collection, 122 MB, đọc được. Schema và query patterns document ở `engine/K/K_agent_db_01.md` và `_02.md`.

Không có kết nối thì chỉ làm được phần methodology — phải nói rõ với user, không đoán số.

### 2.4. Behavioral guidelines (`CLAUDE.md`)

File `CLAUDE.md` ở root là cửa vào cho mọi session AI: router domain, **luật gate** (tra cứu vs chạy workflow), luật vận hành workspace (AI là người ghi duy nhất, luồng intake, báo bất thường), convention kho outputs/inputs, và 4 behavioral guidelines (think before acting, simplicity first, surgical changes, goal-driven execution).

Ranh giới với `engine/system_prompt.md`: **`CLAUDE.md` lo repo** (ghi file ở đâu, đặt tên thế nào, commit ra sao); **`system_prompt.md` lo nghiệp vụ** (persona, router pack, meta-rules phân tích, self-audit). Không trộn.

`CLAUDE.md` là **context, không phải enforcement** — Claude đọc và cố theo, nhưng không có gì đảm bảo tuân thủ tuyệt đối. Luật nào phải chắc chắn thì viết thành hook (`.claude/settings.json`), hiện đang cưỡng chế 3 lệnh git ở mục 7.4.

---

## 3. `engine/` — chi tiết

### 3.1. Kiến trúc 3 layer + 1 index

Pack vận hành theo kiến trúc module 3 layer:

- **K (Knowledge)** — schema, methodology, translation rules, query patterns, domain constraints. "Biết gì". Là thư viện, P và O re-queryable nhiều lần xuyên suốt session.
- **P (Process)** — workflow pipeline có thứ tự, checkpoint, audit. "Làm theo bước nào".
- **O (Output)** — structure rigid của deliverable (heading bắt buộc, độ dài, citation, K hygiene), tone, format, length, xưng hô. "Trình bày gì ở đâu". Output cuối là **MD final**.

**Index:** `KERNEL_SKELETON.md` ở gốc folder — liệt kê pack có sẵn + trigger activation. Đọc đầu session, mỗi session 1 lần.

### 3.2. Pack có sẵn

| Pack | Files | Mục đích |
|---|---|---|
| `K_agent_db` | 7 (`_00` master + `_01` đến `_06`) | Knowledge MongoDB `agent_db` chứng khoán VN (35 collection, gồm tầng phase & danh mục ở `_06`) |
| `K_sector_framework` | 1 | Khung phân tích ngành CFA institutional buy-side (DD/MP/SI/PM/ESG + per-sector quick-ref cho 18 ngành whitelist + Industry 4.0 lens) |
| `P_invest_memo` | 10 (`_00` master + `_01` đến `_09`) | Quy trình đầu tư cá nhân, horizon 1-6 tháng, long only, portfolio < 1 triệu USD |
| `P_weekly_overview` | 5 (`_00` master + `_01` đến `_04`) | Broadcast tổng quan thị trường tuần 12 phần fundamental-driven, audience nội bộ + KH |
| `P_vbse_strategy` | 10 (`_00` master + `_01` đến `_09`) | Chiến lược đầu tư VBSE deep nội bộ, 2 cycle (monthly parent + weekly child), 6 trục, 2-phase watchlist |
| `P_stock_report` | 5 (`_00` master + `_01` đến `_04`) | Báo cáo phân tích chuyên sâu 1 cổ phiếu (single hoặc pair 2-3 mã). Stage 1 16 sub-step (1a-1p) + 4 type framework (SXKD/NH/CK/BH; SXKD có mục 2.6 chuỗi giá trị áp dụng Porter + Smile Curve + GVC + Industry 4.0 + CFA Sector Analysis 2020) + 3 depth mode + audience flex. BCTC PDF mandatory |
| `O_invest_memo` | 7 (`_00` master + `_01` đến `_06`) | Render spec cho 6 deliverables của `P_invest_memo` |
| `O_weekly_overview` | 1 (`_00`) | Render spec broadcast tuần 12 phần rigid + 3 mode branding |
| `O_vbse_strategy` | 1 (`_00`) | Render spec chiến lược 2 mode (monthly + weekly) flex 6 trục |
| `O_stock_report` | 1 (`_00`) | Render spec báo cáo 1 cổ phiếu 6-7 phần rigid + 3 depth mode + audience flex (nội bộ/KH) |

### 3.3. `P_invest_memo` — workflow tóm tắt

5 giai đoạn + giai đoạn 6 song song:

```
Giai đoạn 1 (Tier 0)  — Gate vĩ mô + catalyst (file 01)        → CP1
Giai đoạn 2 (Tier 1)  — Chọn 3-5 ngành (file 02)               → CP2
Giai đoạn 3 (Tier 2)  — Screen 6-10 mã/ngành (file 03)         → CP3
Giai đoạn 4 (Tier 3)  — Chấm điểm top 3/ngành (file 04)        → CP4
Giai đoạn 5           — Memo deep-dive:
  Tier 5A (file 05)   — PDF forensic                            → CP5A per-stock
  Tier 5B (file 06)   — Valuation modeling                      → CP5B per-stock
  Tier 5C (file 07)   — Memo 7 phần                             → CP5C per-stock
Giai đoạn 6 (song song):
  Tier 6 (file 08)    — Portfolio construction
  Tier 7 (file 09)    — Monitoring + exit (4 review cycles: daily/weekly/monthly/quarterly)
```

**Note numbering:** Tier mapping không liên tục — bỏ qua Tier 4 do giai đoạn 5 (deep-dive) đã được tách thành 3 sub-tier 5A/5B/5C ở refactor lịch sử. File con vẫn dùng "Tier 5A/5B/5C" giữ nguyên để tránh phá hệ thống cross-reference.

**6 nguyên tắc Agent bất biến** (xem `P_invest_memo_00.md` mục 5):
1. Không skip variant perception (flex+downgrade nếu không có, không auto-reject)
2. Không vào position nếu chưa viết exit trigger measurable
3. Không size mỗi phiên giải ngân vượt 5% ADV 20 phiên (tổng vị thế = 5% × ADV × N với N=2-4 phiên)
4. Bear case steelman trước khi long (flex+downgrade size 30-70% nếu yếu, không auto-reject)
5. Dòng tiền dương + catalyst tiêu cực → loại
6. Mỗi giai đoạn kết bằng checkpoint, không tự chuyển tier

### 3.4. `P_weekly_overview` — 12 phần fundamental-driven

```
Pre-flight: hỏi file W-1 + context + branding info

Stage 1: Compose phần 2-9
  Phần 2  Review tuần trước (3 scorecard tables)
  Phần 3  Bối cảnh quốc tế
  Phần 4  Thị trường Việt Nam (aggregate 18 ngành whitelist)
  Phần 5  Vĩ mô & hàng hoá (institutional table 5 cột: Magnitude + Persistence)
  Phần 6  Biến động 18 ngành whitelist + earnings beat candidate
  Phần 7  Top dẫn dắt 2 góc nhìn + cảnh báo trap setup
  Phần 8  Tin tức & catalyst (+ conviction impact)
  Phần 9  Định vị VNINDEX + 3 kịch bản fundamental-driven + Risk map

CHECKPOINT 1: Regime + Sector bias (conviction + disconfirming bắt buộc)

Stage 2: Compose phần 10-12 + Phần 1
  Phần 10  Watchlist tách 2 hướng (cơ hội + cảnh báo)
  Phần 11  Lịch sự kiện tuần tới
  Phần 12  Tuyên bố miễn trừ trách nhiệm
  Phần 1   Tóm tắt điều hành (Key calls / Watch / Risk) — viết cuối
```

**Constraint chính:**
- Whitelist 18 ngành default (xem `K_agent_db_01` Section B); override khi user yêu cầu cụ thể
- 3 kịch bản phần 9 trigger primary là vĩ mô/cơ bản/chính sách/catalyst (technical chỉ confirmation phụ ≤30%)
- Cap technical toàn báo cáo ≤15%
- Mỗi call (regime, sector bias, watchlist mã) có conviction HIGH/MID/LOW + horizon 1-2 tuần / 2-4 tuần + 1-2 disconfirming signal
- KHÔNG dùng chỉ báo trend nội bộ
- Wording observation, không command
- Rank ngành tự tổng hợp theo `week_score` (DB không lưu industry_rank tĩnh)

### 3.5. `P_vbse_strategy` — Monthly parent + Weekly child, 6 trục flex

Pack chia 10 file:

```
_00  Master (philosophy fundamental supremacy + weight balance + 4 nguyên tắc)
_01  Trục 1 — Vĩ mô & tài chính
_02  Trục 2 — Định vị thị trường VN (fundamental-first)
_03  Trục 3 — Themes & narratives
_04  Trục 4 — Sector allocation (whitelist 18)
_05  Trục 5 — Risk scenarios (trigger macro/fundamental/policy ONLY)
_06  Trục 6 — Watchlist 2-phase (Phase 1 Screen cơ bản + Phase 2 Bucket entry PTKT)
_07  Workflow Monthly (Pre-flight + Stage 0 eval + CP0 + Stage 1-3 + CP1)
_08  Workflow Weekly (HARD GATE + Stage 0 + tracking với technical-as-noise rule + rebucket)
_09  User overlay + Self-audit + Edge cases + Output contract
```

**Constraint chính:**
- Fundamental supremacy: PTKT chỉ tồn tại ở Phase 2 Bucket entry Trục 6 (entry timing). Cap technical ≤15% toàn báo cáo (trừ Phase 2 Bucket)
- Trục 5 Risk: trigger macro/fundamental/policy ONLY, cấm technical primary
- Whitelist 18 ngành áp dụng default; user override được phép
- Weekly HARD GATE: không có monthly active → REFUSE
- Conviction + horizon + disconfirming bắt buộc mỗi theme/sector/mã
- Watchlist Phase 1: cơ bản + catalyst + thanh khoản (cấm PTKT filter). Phase 2: technical_zone đa khung → Bucket 1/2/3

### 3.6. `P_stock_report` — Single-stock deep analysis (ad-hoc / pair compare)

Pack chia 5 file (+ render spec `O_stock_report_00`):

```
_00  Master (mục đích, scope, differentiate với P_invest_memo Tier 5C, 6 nguyên tắc)
_01  Pre-flight 6 câu + Stage 1 Data Acquisition 16 sub-step (1a-1p)
       1a stock info + type SXKD/NH/CK/BH → 1b FA DB → 1c dòng tiền + tech zone
       → 1d khối ngoại + tự doanh → 1e major shareholders → 1f corporate actions
       → 1g news DB → 1h web search news → 1i BCTC PDF forensic 15-point
       → 1j sector context → 1k macro → 1l peer compare → 1m ADV
       → 1n earnings calendar → 1o ESG controversy
       → 1p Value chain data (top KH/NCC/channel/R&D/Industry 4.0 — SXKD mandatory)
_02  Type-specific framework cho 4 type (SXKD/NH/CK/BH)
       SXKD có mục 2.6 Chuỗi giá trị 10 sub-mục áp dụng 6 framework chuẩn quốc tế:
       Porter Value Chain (1985) + Porter 5 Forces (1979) + Smile Curve (Stan Shih 1992)
       + GVC governance (Gereffi 2005) + Industry 4.0 (CFA Sector Analysis 2020)
       + CFA chapter mapping (21 chapter ↔ VN whitelist)
_03  Stage 2 compose + 6-7 phần output rigid + 3 depth mode (Quick/Standard/Deep)
       + Variant Perception rule + Pair compare mode + Checkpoint 1+2
       (Phần 2 sub-section 3 Vị trí chuỗi giá trị MANDATORY SXKD với 6 sub-sub 3a-3f)
_04  Self-audit 47 điểm SXKD / 35 điểm NH/CK/BH + Edge cases + 10 failure modes
```

**Constraint chính:**
- **BCTC PDF mandatory** — REFUSE chạy nếu không upload (gate strict tuyệt đối)
- **Long-only** (Long / Watch / Avoid, không Short)
- **Web search VN cho equity, EN cho macro** (tài chính/dầu khí/kim loại)
- **Peer compare internet-first** + filter ADV ≥ 30 tỷ/ngày + market cap top 50
- **Strict reject Long pattern:** dòng tiền dương + catalyst tiêu cực material → auto Watch
- **Conviction CAP** at LOW cho penny (< 1.000 tỷ), at MID cho newly listed (< 2 năm)
- **Audience flex** (nội bộ analyst / KH) — wording + K hygiene khác nhau; KH KHÔNG nhận TP/SL số cụ thể
- **Value chain MANDATORY cho SXKD Standard+** — áp dụng đầy đủ 6 framework (Porter VC + 5 Forces + Smile Curve + GVC + Industry 4.0 + CFA). SKIP NH/CK/BH (đã có lens type-specific)

**Quan hệ với `P_invest_memo`:** Complement, không thay thế. P_stock_report dùng pre-screening / pitch nhanh / ad-hoc deep-dive 1 mã. P_invest_memo Tier 5C dùng full conviction memo cycle (sau Tier 0-3). KHÔNG auto-escalate sang Tier 5C — user phải explicit yêu cầu.

### 3.7. Triết lý flex+downgrade (xuyên suốt P_invest_memo + P_vbse_strategy)

Khi gate (Variant Perception, Bear Case, R/R) không pass strict, **agent KHÔNG tự reject** mã. Thay vào đó:
- Flag cảnh báo cụ thể (lý do gate yếu)
- Downgrade conviction / size theo mức độ yếu (ví dụ: bear yếu vừa → giảm size 30-50%, bear target dưới giá hiện tại → giảm size 50-70% coin-flip bet)
- User quyết định cuối: proceed với size nhỏ + audit log, hoặc loại mã

Triết lý: discipline ở dạng force user explicit aware về rủi ro, không che giấu. Chi tiết Gate 1 + Gate 2 ở `P_invest_memo_07.md` mục 4.

---

## 4. `K_sector_framework` — knowledge phụ trợ phân tích ngành

Pack K mới (1 file `K_sector_framework.md`) cung cấp khung phân tích ngành theo chuẩn institutional buy-side (chắt lọc từ CFA Sector Analysis Framework 2020), bao gồm:

- **Universal 5-dimension framework:** Demand Drivers / Market Position / Structural Influences / Performance Metrics / ESG — áp dụng cho mọi ngành
- **Per-sector quick-reference** cho 10-12 ngành trong whitelist 18 có direct CFA cover (NGANHANG, TIENICH, BDS, KCN, BANLE, VANTAI, CONGNGHE, XAYDUNG, THUCPHAM, NONGNGHIEP, CHUNGKHOAN, BAOHIEM override)
- **Guidance generic** cho 6-7 ngành whitelist không có direct CFA cover (DAUKHI, HOACHAT, KIMLOAI, DETMAY, KHOANGSAN, THUYSAN, CONGNGHIEP)
- **Industry 4.0 lens** — digital footprint, automation, AI/IoT disruption áp dụng cross-sector

**Khi nào active:** P pack tham chiếu khi cần deep-dive sector-level analysis. Cụ thể:
- `P_invest_memo_05/06/07` (Tier 5A/B/C deep-dive memo) — section "Business" trong memo 7 phần
- `P_vbse_strategy_04` (Trục 4 Sector allocation) — per-sector analytical lens
- `P_weekly_overview_02` (Phần 6 Biến động 18 ngành) — structural watch khi có chuyển động bất thường

**Không thay thế** `K_agent_db_04` (methodology diễn giải chỉ báo). 2 pack bổ trợ nhau: `K_agent_db_04` chuyên về **dòng tiền + PTCB 4 type doanh nghiệp** từ data DB, `K_sector_framework` chuyên về **industry structure + competitive dynamics + ESG** từ chuẩn CFA.

---

## 5. Chế độ tra cứu nhanh — không activate pack

### 5.1. Vai trò

Trả lời **single-shot, conversational**. Query MongoDB `agent_db`, kết hợp web search, đưa nhận định chuyên môn có luận cứ. Không workflow đa stage, không deliverable file, không checkpoint.

Use case điển hình:
- Tra cứu nhanh: "VNM giá hôm nay", "KLGD HPG tuần qua"
- Nhận định nhanh: "thị trường tuần này dòng tiền thế nào", "ngành thép Q1 2026 có gì đáng chú ý"
- Lookup methodology: "chỉ báo zone AAA nghĩa là gì"

Trước rev 8 đây là một agent riêng với bản knowledge riêng. Nay nó là **trạng thái không-pack-nào-active** của cùng engine — đúng đường fallback đã có sẵn ở `KERNEL_SKELETON.md` mục 4.

### 5.2. Đọc gì

`engine/system_prompt.md` (persona + meta-rules + tone nền mục 11) → `K_agent_db_00` (luật nền) → file con `K_agent_db_01..06` theo nhu cầu câu hỏi.

**Không** đọc `KERNEL_SKELETON.md` khi không cần deliverable — đó là chỉ mục P/O pack, đọc nó là mở cửa cho việc activate nhầm. **Ngoại lệ duy nhất:** query nằm ở vùng rìa thì được đọc riêng khối **Trigger** để phân định, không đọc phần mô tả pack (`CLAUDE.md` mục 3).

`K_sector_framework` **dùng được ở chế độ này** khi user hỏi đích danh về một ngành ("phân tích sâu ngành X", "outlook ngành X"). Nó là K pack, mà gate chỉ chặn P/O — pull nó không phá gate, miễn trả lời inline chứ không sinh deliverable file. Nó không tự activate; phải có bên chủ động pull (P pack, hoặc câu hỏi ngành tường minh).

### 5.3. Ranh giới giữ bằng gate, không bằng thư mục

Trước rev 8, ranh giới là vật lý: 2 thư mục, 2 bộ knowledge upload riêng. Với runtime filesystem thì ranh giới đó **đã mất từ trước** — một phiên nhìn thấy cả hai thư mục cùng lúc.

Nay ranh giới nằm ở **luật gate** (`CLAUDE.md` mục 3): mặc định inline; activate P/O chỉ khi có ý định deliverable tường minh; `tra nhanh:` ép inline; pack ngoài `KERNEL_SKELETON.md` coi như không tồn tại.

Đánh đổi phải biết: gate là **văn bản, không phải enforcement**. Rủi ro còn lại là activate nhầm khi câu hỏi mập mờ — nên luật viết rõ "nghi ngờ thì hỏi, không tự activate".

---

## 6. Luồng làm việc end-to-end

```
Câu hỏi ──► gate (CLAUDE.md mục 3)
             │
             ├── không có ý định deliverable ──► inline lookup
             │                                    K pack → trả lời trong chat
             │
             └── có ý định deliverable ────────► K + P + O
                                                  │
                     outputs/md/<loại>/... ◄──────┘  carrier MD, nguồn phân tích
                              │
                              ├─► outputs/pptx|docx/  bản render máy (gitignore)
                              │            │
                              │            └─► outputs/sent/  AI copy sang
                              │                      │
                              │                      └─► USER sửa tay ──► gửi khách
                              │
                              └─► outputs/INDEX.md   1 dòng sổ cái
```

**Điểm mấu chốt:** re-render ghi đè `pptx/` và `docx/`, **không bao giờ chạm `sent/`**. Bản trong `sent/` chứa chỉnh sửa tay của user, không tái tạo được — đó là lý do nó vào git còn hai cây kia thì không.

---

## 7. Convention chuẩn

### 7.1. Locale vi-VN

- Số: dấu chấm ngăn nghìn, dấu phẩy thập phân — `18.200 tỷ`, `15,5%`
- Phần trăm có dấu rõ: `+18,2%` / `-3,5%`
- Tiền VND: `tỷ VND` cho tổng, `đồng` cho giá per share, `nghìn`/`k` cho giá ngắn (`33.000 đ` hoặc `33k`)
- Date: `Q1/2026`, `tháng 4/2026`, `ngày 27/4/2026`. Không dùng `Q1 2026` hay `2026-04-15` trong prose (OK trong bảng)

### 7.2. Ticker

- UPPERCASE, không nháy: `VNM` (không `'VNM'`, `vnm`)

### 7.3. K hygiene — không lộ ký hiệu raw

3 nhóm cần dịch trước khi xuất output:
- **Nhóm 1 — DB raw:** `vsi`, `day_score`, `week_score`, `zone: A/AA/AAA`, `f382`, `poc`, `period: "2025_4"`, `*_pct`, `*_trend`, `rank_pct`...
- **Nhóm 2 — Taxonomy nội bộ:** "Kịch bản A-G/E1-E3", "Pitfall F1-F12", "HIGH/MID/LOW impact", "framework chấm điểm", tên section như "B5/B6/B7"
- **Nhóm 3 — Thuật ngữ EN chưa dịch:** "mean-reversion", "exhaustion", "Value Trap", "dead-cat bounce", "priced-in"...

Bảng dịch đầy đủ ở `K_agent_db_00` mục 5; bảng taxonomy đầu `K_agent_db_04`; thuật ngữ tin tức ở `K_agent_db_05` phần 9.

**Exception:** `article_slug` / `report_slug` khi ghép thành URL `https://finext.vn/news/{slug}` là output hợp lệ.

### 7.4. Citation — 4 nhóm

| Nhóm | Format | Ví dụ |
|---|---|---|
| Nhóm 1 — Dữ liệu agent_db nội bộ | `(nguồn: Tổng hợp)` | `Revenue VNM 2025 đạt 18.200 tỷ VND (nguồn: Tổng hợp)` |
| Nhóm 2 — Tin/báo cáo trong hệ thống | Markdown link | `[Tin tổng hợp, 18/4/2026](https://finext.vn/news/<slug>)` |
| Nhóm 3 — PDF user upload | Tên tài liệu + trang | `BCTC VNM Q4/2025 soát xét, mục 8` |
| Nhóm 4 — Web external | Markdown link | `[NYU Stern country risk](https://pages.stern.nyu.edu/...)` |

### 7.5. File naming output

**Basename deliverable:**
- `tier{N}_<YYYYMMDD>_confirmed.md` (state files cycle)
- `tier5C_<TICKER>_<YYYYMMDD>_confirmed.md` (memo deep-dive per-stock)
- `tier6_portfolio_<YYYYMMDD>_confirmed.md`
- `tier7_weekly_<YYYYMMDD>.md` / `tier7_monthly_<YYYYMM>.md` / `tier7_quarterly_<YYYY_Q>.md`
- `weekly_overview_<YYYYMMDD>.md` (ngày cuối tuần — Chủ Nhật)
- `vbse_strategy_monthly_<YYYYMM>.md` (tháng báo cáo chiến lược)
- `vbse_strategy_weekly_<YYYYMMDD>.md` (ngày cuối tuần update chiến lược)

**Vị trí lưu:** carrier MD nằm ở `outputs/md/<loại>/...` (chi tiết `CLAUDE.md` mục 4): weekly_overview theo năm, vbse_strategy tách monthly/weekly theo năm, stock_report theo ticker, invest_memo theo cycle `<YYYY-MM>_cycle/`.

Bản render và bản gửi đi dùng **đúng đường dẫn và basename đó** ở ba cây còn lại, chỉ khác extension:

```
outputs/md/weekly_overview/2026/weekly_overview_20260803.md      carrier
outputs/pptx/weekly_overview/2026/weekly_overview_20260803.pptx  bản máy
outputs/sent/weekly_overview/2026/weekly_overview_20260803.pptx  bản đã sửa tay
```

`sent/` không chia theo format — extension đã phân biệt. Mỗi deliverable có front-matter metadata (`derived` ghi đường dẫn tương đối đầy đủ) + 1 dòng trong `outputs/INDEX.md`.

### 7.6. Constraint cốt lõi (audience cuối có thể là KH)

Pack `P_weekly_overview` và `P_vbse_strategy` (có mode branded gửi KH) tuân chặt:
- **Không dùng chỉ báo trend nội bộ** (`*.trend`, `*_recent.recent_trend`) khi render branded — audience cuối không hiểu methodology
- **Không command** (mua/bán/giảm tỷ trọng) — diễn đạt observation
- **Không xác suất % cho kịch bản** — dùng if-then trigger objective
- **Không level giá vào/ra/stop trong watchlist** (chỉ luận điểm + signal theo dõi + disconfirming)
- **Conviction + horizon + disconfirming** bắt buộc mỗi call (chuẩn institutional)
- **Whitelist 18 ngành default, override khi user yêu cầu** — rank ngành tự tổng hợp theo `week_score`

`P_invest_memo` (audience analyst nội bộ) được dùng trend, target giá modeling, scoring framework cụ thể.

---

## 8. Design decisions chính

### 8.1. Render binary IN scope (đảo lại từ rev 6)

**Rev 6 chốt render binary out of scope; rev 8 đảo lại.** Lý do: runtime nay có filesystem và thư viện Python (`python-pptx`, `python-docx`, `openpyxl`) nên render là việc engine làm được ngay, không phải "concern downstream".

Điều kiện thật là **filesystem + thư viện Python**. Skill `document-skills` của Anthropic chỉ là tiện nghi — nó cũng chỉ gọi hai thư viện đó.

**Đính chính về nhãn `[LEGACY]` (2026-07-28, đã sửa lại lần 2):** README các rev trước ghi "16/16 section Guide render docx/pptx bị marked `[LEGACY]`", và `CLAUDE.md` mục 6 chỉ định dùng chúng làm style baseline.

Sự thật, kiểm bằng `git log --all -S"[LEGACY]"` (**không giới hạn path** — bản đính chính đầu tiên giới hạn `-- engine/` nên ra 0 kết quả và kết luận sai):

- **Không section nào trong `engine/` mang nhãn `[LEGACY]`** — grep `engine/` = 0. Đây là điều thực sự quan trọng, và nó đúng.
- Nhưng **chuỗi đó có trong repo**: `CLAUDE.md:101`, `README.md:391`, `README.md:450` ở baseline rev 7 (`5fb0ecb`) — dưới dạng *tham chiếu tới* nhãn, không phải nhãn. Nhãn thật nếu từng tồn tại thì ở rev 6 tiền-git, ngoài tầm lịch sử này.

Đã gỡ tham chiếu khỏi `CLAUDE.md` mục 6 và `system_prompt.md` mục 4. **Bài học:** lệnh verify viết vào tài liệu phải là lệnh đã chạy đúng nguyên văn — giới hạn path rồi phát biểu ở phạm vi toàn cục là cách tự tạo ra một đính chính sai.

**Hiện trạng spec render binary** (verify 2026-07-28, đếm trên cả 10 file O pack):

| O pack | Spec layout binary |
|---|---|
| `O_invest_memo_*` | **Có thật** — bảng slide 15-20 slide ở `_02`, layout docx/pptx ở `_00`/`_01`/`_03`/`_05` |
| `O_weekly_overview_00` · `O_vbse_strategy_00` · `O_stock_report_00` | **Không có** — 0 lần nhắc "slide"; chỗ duy nhất nhắc pptx là con trỏ ngược về `system_prompt.md` mục 4, mà mục đó lại trỏ ngược về O pack. Tham chiếu vòng tròn |

Với 3 pack sau, render binary vẫn **trong scope** nhưng style phải hỏi user (`system_prompt.md` mục 4 Bước 2). Viết spec cho chúng sau khi chạy 2-3 báo cáo thật và biết layout ổn định trông thế nào — cùng lý do với mục 8.1b.

**MD vẫn là source of truth của phân tích**, nhưng không còn là output cuối duy nhất. Chuỗi đầy đủ: MD → render → user sửa tay ở `outputs/sent/` → gửi khách. Vì có bàn tay người ở cuối nên **không theo đuổi render xác định byte-by-byte** — script render (nếu làm sau này) chỉ cần đưa tới bản nháp tốt.

### 8.1b. Ba việc cố ý hoãn tới khi có dữ liệu thật

`outputs/` còn rỗng, chưa có deliverable nào. Ba việc dưới đây đều là **đặc tả cho thứ chưa từng làm** nếu làm bây giờ — đúng sai lầm đã mắc với `agent_marketing/` và `brand/` (dựng khung rồi xoá vì chưa bao giờ có nội dung).

| Việc hoãn | Điều kiện gỡ chặn | Vì sao chưa làm |
|---|---|---|
| **Script render xác định** | Sau 2–3 báo cáo thật, khi layout đã ổn định | Render còn ad-hoc; giữ code chạy được ở scratchpad, đóng băng thành script khi biết layout đúng trông thế nào. Và vì bản gửi khách đằng nào cũng qua tay người sửa (mục 8.1), script chỉ cần đưa tới bản nháp tốt — không cần tái lập từng byte |
| **Spec layout binary cho 3 O pack** (`weekly_overview`, `vbse_strategy`, `stock_report`) | Cùng điều kiện trên | Hiện phải hỏi style user mỗi lần. Viết spec trước khi biết user muốn gì là đoán mò |
| **Hook kiểm toàn vẹn kho** — mỗi carrier MD phải có front-matter hợp lệ + đúng 1 dòng INDEX; mỗi binary phải truy được về carrier | Sau khi có ít nhất 3–5 deliverable trong `outputs/` | Đây là hai luật quan trọng mà hiện **không có gì cưỡng chế** — xem mục 2.4 về ranh giới context vs enforcement. Nhưng validator viết cho cấu trúc chưa có dữ liệu sẽ đúng trên giấy và sai khi gặp ca thật |

Thứ tự đề xuất: chạy báo cáo thật → script render → spec binary → hook toàn vẹn. Mỗi bước sau đều cần đầu ra của bước trước làm mẫu.

### 8.2. Triết lý flex+downgrade thay strict reject

Khi gate methodology không pass strict (Variant Perception yếu, Bear Case rebuttal yếu, R/R thấp), agent **không tự reject** mã. Thay vào đó:
- Flag cảnh báo cụ thể
- Downgrade conviction / size theo mức độ
- User quyết định cuối: proceed với size nhỏ + audit log, hoặc loại mã

Lý do: discipline ở dạng force user explicit aware về rủi ro, không che giấu. User là người ra quyết định — agent đưa thông tin đầy đủ, không tự ý filter.

**Exception — Nguyên tắc 5 (P_invest_memo) vẫn strict reject:** "Dòng tiền dương + catalyst tiêu cực → loại" giữ behavior strict (không flex+downgrade). Khác với 5 nguyên tắc còn lại — Variant Perception / Bear Case / R/R là đánh giá **chủ quan** có thể debate, còn pattern "dòng tiền dương + catalyst tiêu cực" là **objective historical pattern** với base rate lỗi rất cao (retail trap kinh điển ở thị trường VN: dòng tiền vào muộn priced-in tin xấu chưa lộ). Đưa cho user "quyết" với pattern này là ép user override discipline về 1 loại lỗi đã có evidence rõ. Giữ strict reject ở đây là design decision có chủ đích.

### 8.3. Gộp 2 agent thành 1 engine (rev 8, đảo lại rev 7)

Rev 7 chấp nhận duplicate knowledge vì ưu tiên "agent độc lập 100%" cao hơn DRY. Rev 8 bỏ quyết định đó.

**Lý do đảo:** luật độc lập sinh ra từ ràng buộc Claude Desktop Project (mỗi project upload knowledge riêng, không share file được). Runtime nay chỉ còn filesystem → ràng buộc mất. Và cách ly vật lý **thực ra đã mất từ trước**: một phiên filesystem nhìn thấy cả hai thư mục cùng lúc, nên duplicate không còn mua được cách ly nào.

**Bằng chứng quyết định:** khảo sát 6 file baseline trong `_ops/sync_baseline/` (đã xoá — xem lại bằng `git show 4763865:_ops/sync_baseline/db_03.diff`) cho thấy **27/29 khác biệt chỉ là con trỏ cross-reference** (`system prompt mục 8.5` vs `K_agent_db_00 mục 5` — cùng một luật, khác chỗ cất). Chỉ 2 khác biệt là ngữ nghĩa thật: ghi chú audience, và policy clarification. Tức nguyên nhân gốc không phải duplication mà là **file knowledge trỏ ngược lên system_prompt của một agent cụ thể** — khiến nó không tái sử dụng được dù nội dung giống hệt.

**Đã xoá kèm:** `agent_db/` (7 file), `_ops/check_sync.sh`, `_ops/sync_baseline/` (6 diff), và mệnh đề "port hai chiều" ở `CLAUDE.md` mục 2.4.

**Giữ lại có chủ đích:** tên `K_agent_db_*` — `agent_db` ở đây là tên database MongoDB đang vận hành, không phải thư mục đã xoá. Đổi tên nhóm file này mới là làm sai.

Spec đầy đủ: `_ops/specs/2026-07-28-tai-cau-truc-workspace-design.md`.

### 8.4. Conviction memo mới được vào position (`P_invest_memo`)

Trong workflow đầu tư (P_invest_memo), không vào position nếu chưa hoàn thành memo deep-dive (Tier 5C). Memo là gate cuối cùng — viết được memo 7 phần (Recommendation / Thesis / Variant / Business / Financial / Catalysts / Bear / Exit) đủ chuẩn mới được conviction để sizing.

---

## 9. Hướng mở rộng

### 9.1. Thêm pack mới trong `engine/`

Pattern 3 layer K/P/O:
1. Identify domain — pack mới là K, P, hay O?
2. Tạo file theo naming convention: `K_{domain}_{NN}.md` / `P_{flow_name}_{NN}.md` / `O_{format_or_style}_{NN}.md`, đặt vào `engine/K|P|O/`
3. Pack có ≥3 file phải có file `_00` master (mục đích pack + manifest file con + flow + output contract)
4. Thêm entry vào `KERNEL_SKELETON.md` với **trigger activation cụ thể** — trigger mơ hồ là nguyên nhân activate nhầm, xem luật gate `CLAUDE.md` mục 3
5. Ghi `_ops/CHANGELOG.md`, commit type `engine`

Cross-reference trong nội dung pack dùng **tên trần** (`K_agent_db_04`), không dùng đường dẫn — nhờ vậy di chuyển thư mục không phải sửa nội dung.

### 9.2. Thêm domain mới (vd thị trường ngoài VN)

Engine hiện scope cho thị trường VN (giả định MongoDB `agent_db` chứa data VN). Để extend ra thị trường khác:
- Build pack K mới (`K_us_market_*` chẳng hạn) cho schema/data nguồn US
- Build pack P mới phù hợp methodology US (DCF, peer multiples — khác VN ở P/E benchmark, dynamics ngành)
- Build pack O mới cho format US (USD, MM-DD-YYYY, etc.)
- KHÔNG mix VN + US trong cùng pack — methodology + locale + audience khác nhau

### 9.3. Thêm audience mới

**Từ rev 8, audience là tham số chứ không phải hằng số** — không cần build agent riêng nữa. Hai audience đã hỗ trợ sẵn (`engine/system_prompt.md` mục 11.2, `K_agent_db_00` mục 4.4):

| Audience | Được nhận | Hành văn |
|---|---|---|
| analyst / broker nội bộ (default) | Khuyến nghị cụ thể, conviction, TP/SL số | Thuật ngữ dùng thẳng |
| NĐT cá nhân / khách hàng | Quan điểm định tính, không TP/SL số | Thuật ngữ kèm giải thích ngắn |

Thêm audience thứ ba: bổ sung dòng vào bảng đó, không tạo K pack mới. O pack có bảng audience riêng (vd `O_stock_report_00` mục 5) override trong phạm vi pack đó.

---

## 10. Note về deployment legacy

**Lịch sử:** Một số file P/O packs từng có reference đến path `/mnt/user-data/outputs/`, tool `present_files`, skill `/mnt/skills/public/docx|pptx`. Đây là legacy từ deployment Claude Code / Claude skill đời cũ.

Rev 6 clean các reference active, thay bằng wording "xuất MD trong message, user copy/save thủ công" — hợp với runtime Claude Desktop lúc đó.

**Rev 8 đảo lại lần nữa:** runtime là filesystem, agent ghi thẳng file vào `outputs/`. Wording "user copy/save thủ công" ở các pack nay đã lỗi thời theo hướng ngược lại. Đường dẫn đúng: `outputs/md/<loại>/...` theo `CLAUDE.md` mục 4.

**Đã dọn xong** ở commit `ca5c61f` (17 file). Verify 2026-07-28: grep `engine/` với 6 từ khoá (`project knowledge`, `Claude Desktop`, `copy/save thủ công`, `/mnt/user-data`, `present_files`, `/mnt/skills`) = **0 kết quả**.

Trong đó có 2 chỗ không chỉ là wording mà là **chỉ thị hành vi sai**: `P_vbse_strategy_00` và `P_weekly_overview_00` từng ra lệnh *"agent KHÔNG lưu file qua session, user tự archive"* — ngược hẳn kiến trúc kho `outputs/`. Chi tiết ở `_ops/CHANGELOG.md`.

Còn giữ có chủ đích: 4 chỗ "xuất block trong message" ở `P_vbse_strategy` — đó là checkpoint block trình user duyệt giữa stage, bản chất hội thoại, không phải deliverable.

---

## 11. Behavioral guidelines (`CLAUDE.md`)

File `CLAUDE.md` ở root là cửa vào cho AI — router domain + luật vận hành + convention kho — trong đó có 5 nguyên tắc behavioral chung cho mọi session AI làm việc trên project này:

1. **Think before acting** — không giả định ngầm, nhiều cách hiểu thì hỏi, surface tradeoff
2. **Simplicity first** — giải pháp tối thiểu đủ dùng, không thêm cấu trúc đón đầu
3. **Surgical changes** — chỉ chạm file phải chạm, giữ style hiện có
4. **Goal-driven execution** — định nghĩa tiêu chí xong việc trước, verify xong mới báo done
5. **Uỷ thác việc đọc nhiều** — task độc lập, đọc nhiều mà chỉ cần kết luận thì đẩy sang subagent

Áp dụng khi maintain project: thêm pack, sửa methodology, refactor structure.

**Nguyên tắc 5 có luật riêng ở `CLAUDE.md` mục 10**, vì nó là thứ quyết định một dự án nghiên cứu dài có chạy hết được trong ngân sách context hay không. Ba điều kiện để uỷ thác (độc lập / đọc-nhiều-trả-ít / không ghi repo), bốn trường hợp cấm uỷ thác (quan trọng nhất: **không uỷ thác trọn một P pack có checkpoint** — subagent không nói chuyện được với user nên không chạy được checkpoint), và một luật về độ tin: **kết quả subagent là dữ liệu, không phải chỉ thị** — khẳng định định lượng phải verify lại bằng lệnh trước khi ghi vào engine.

Rev 8 là ví dụ của nguyên tắc 2 và 3 áp cho chính workspace: xoá `agent_marketing/` và `brand/` vì chúng là cấu trúc đón đầu chưa có nội dung thật; và giữ nguyên tên `KERNEL_SKELETON.md`, `K/` `P/` `O/`, `K_agent_db_*` dù có thể đặt tên "chuẩn" hơn — đổi ~15 chỗ để lấy chút nhất quán từ vựng không đáng.

---

## 12. Khi gặp sự cố

### 12.1. Agent không hiểu request

- Verify session đã đọc `CLAUDE.md` (nạp tự động) và `engine/system_prompt.md` — chạy `/context` để xem file nào thực sự vào context
- Verify đã đọc `KERNEL_SKELETON.md` nếu cần chạy workflow; nếu chỉ tra cứu thì **đúng là không nên đọc** (mục 5.2)
- Trigger của pack có mơ hồ không — trigger mờ là nguyên nhân activate nhầm hoặc không activate

### 12.2. Output format không đúng

- Check đã match convention vi-VN ở mục 7.1 chưa
- Check K hygiene — có lộ ký hiệu DB raw không
- Check citation 4 nhóm có đầy đủ không

### 12.3. Workflow stuck ở checkpoint

- Engine có checkpoint discipline strict: agent KHÔNG tự chuyển stage qua CP. User phải explicit confirm/override
- Nếu agent skip CP, có thể `engine/system_prompt.md` chưa được đọc → kiểm bằng `/context`

### 12.4. Activate nhầm pack khi chỉ muốn tra cứu

Triệu chứng: hỏi một câu ngắn, agent bắt đầu chạy pre-flight / hỏi checkpoint / xuất báo cáo nhiều phần.

- Nguyên nhân thường gặp: câu hỏi chứa từ khoá gần giống trigger deliverable ("chiến lược", "báo cáo", "đánh giá")
- Cách chữa ngay: gõ lại với tiền tố `tra nhanh:` — ép inline, cấm activate pack
- Cách chữa gốc: siết trigger của pack đó trong `KERNEL_SKELETON.md` cho hẹp lại, ghi CHANGELOG
- Ngược lại — muốn chạy workflow mà agent trả lời inline: nêu tường minh loại deliverable ("viết báo cáo tuần", "stock report VNM")

---

## 13. Khi mở session mới

`CLAUDE.md` nạp tự động, đủ để bắt đầu. Đọc thêm tuỳ task:

| Task | Đọc |
|---|---|
| Tra cứu nhanh | `engine/system_prompt.md` → `K_agent_db_00` → file con theo nhu cầu. **Không** đọc `KERNEL_SKELETON.md` |
| Chạy báo cáo | + `KERNEL_SKELETON.md` → `_00` master của pack trước file con. `OUTPUT_MASTER.md` đọc muộn hơn, lúc sắp compose |
| Sửa engine | `engine/system_prompt.md` + `KERNEL_SKELETON.md` + master file pack liên quan + `_ops/CHANGELOG.md` |
| Tái cấu trúc workspace | File này + `_ops/specs/` |
| Gặp lỗi đã gặp trước đó | `_ops/GOTCHAS.md` |

**Đầu session:** `git status` phải sạch (`CLAUDE.md` mục 7.1). Bẩn = bất thường, báo user trước khi làm tiếp.

---

**Cập nhật convention/methodology:** sửa nội dung file → ghi `_ops/CHANGELOG.md` → commit git type `engine` (CHANGELOG entry nằm trong cùng commit). Không còn bước re-upload nào — runtime đọc thẳng filesystem.

**Cuối session:** working tree phải sạch, và **không còn commit nào chưa push** — AI push được, xem `CLAUDE.md` mục 7.7.
