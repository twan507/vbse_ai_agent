# CLAUDE.md — Workspace VBSE AI

Cửa vào cho mọi session AI. Đọc file này trước, rồi đọc tiếp theo bảng router bên dưới tuỳ loại task. Kiến trúc chi tiết cho người đọc: `README.md`.

## 1. Bản chất workspace

Hai tầng, không trộn lẫn:

- **ENGINE** — `agent_analyst/`, `agent_db/`, `agent_marketing/`, `brand/`: knowledge, process, output spec, brand asset. Ổn định, chỉ sửa khi user yêu cầu maintenance, mọi thay đổi ghi log.
- **KHO** — `inputs/`, `outputs/`: artifact. Chỉ ghi thêm (append-only), không sửa ngược nội dung đã lưu. Báo cáo cần đính chính → tạo bản mới, đánh dấu bản cũ superseded trong INDEX, không ghi đè.

```
agent_analyst/   engine phân tích chứng khoán (system_prompt + KERNEL_SKELETON + OUTPUT_MASTER + K/ P/ O/)
agent_db/        engine tra cứu nhanh (system_prompt + agent_db_01..06, cần MongoDB `agent_db` qua MCP)
agent_marketing/ engine marketing/thiết kế — khởi tạo tối thiểu, lớn dần khi dùng thật
brand/           logo, palette, font, disclaimer — dùng chung (O pack branded mode + marketing)
inputs/          đầu vào đã dùng cho deliverable (bctc/ theo ticker, external/)
outputs/         deliverable + INDEX.md (sổ cái)
_ops/            check_sync.sh, sync_baseline/, CHANGELOG.md
```

Version control: git local, branch `main` — quy tắc mục 7.

## 2. Luật vận hành — đọc kỹ, không có ngoại lệ

**2.1. AI là người ghi duy nhất.** User KHÔNG BAO GIỜ tự tay sửa/thêm/xoá file trong workspace. Hệ quả logic: mọi trạng thái bất thường đều là lỗi sync hoặc lỗi session trước, không phải "user vừa sửa".

**2.2. Phát hiện bất thường → BÁO, không tự xử.** Bất thường gồm: file sai naming convention, file lạ ở root, bản sao conflict OneDrive (`*-DESKTOP-*`, `*conflict*`), file tạm (`~$*`, `*.tmp`), binary không được liệt kê trong carrier MD nào, `check_sync.sh` báo DRIFT. Khi gặp: báo user hiện trạng + nguyên nhân khả dĩ + đề xuất xử lý, chờ duyệt rồi mới động tay. Không im lặng sửa, không im lặng bỏ qua.

**2.3. Luồng intake — bất biến với mọi file user gửi qua chat:**

1. Nhận diện loại: BCTC → `inputs/bctc/`; tài liệu ngoài → `inputs/external/`; brand asset → `brand/`; báo cáo cũ backfill → `outputs/<loại>/` đúng vị trí.
2. Chuẩn hoá: đổi tên đúng convention (mục 4-5), text về LF, binary giữ nguyên bytes.
3. Lưu đúng vị trí. Deliverable → cập nhật `outputs/INDEX.md` cùng lượt.
4. Báo lại user: đường dẫn cuối + tên đã đổi.

Không lưu thẳng file với tên gốc user gửi. Chuẩn hoá xong mới lưu — luôn như vậy.

**2.4. Sửa engine:** chỉ khi user yêu cầu maintenance. Mỗi lần sửa: ghi `_ops/CHANGELOG.md` (ngày + file + nội dung + lý do). Riêng khi đụng `K_agent_db_*` hoặc `agent_db_*`: sửa xong phải port sang bản đối ứng bên kia, chạy `_ops/check_sync.sh`, cập nhật baseline trong `_ops/sync_baseline/`. Không sửa engine giữa chừng khi đang chạy dở một báo cáo.

**2.5. Không có binary mồ côi.** Mọi file không phải MD (pptx/docx/png/pdf output) phải được liệt kê trong front-matter `derived` của một carrier MD, hoặc nằm trong bundle có carrier. File binary không truy được về carrier nào = bất thường (mục 2.2).

## 3. Router domain

| Yêu cầu | Engine | Đọc theo thứ tự |
|---|---|---|
| Báo cáo phân tích: memo, tuần, chiến lược, cổ phiếu | `agent_analyst/` | `system_prompt.md` → `KERNEL_SKELETON.md` + `OUTPUT_MASTER.md` → pack `_00` master trước file con (master-first, bắt buộc) |
| Tra cứu nhanh: giá, dòng tiền, tin, phase | `agent_db/` | `system_prompt.md` → `agent_db_01..06` khi cần |
| Marketing, thiết kế, nội dung, ý tưởng | `agent_marketing/` | `README.md` của nó + `brand/` |
| Lưu trữ / intake file user gửi | — | Mục 2.3 file này là đủ |
| Maintenance workspace | — | `README.md` + `_ops/CHANGELOG.md` |

Pack file trong `agent_analyst/` nay nằm trong 3 thư mục con `K/`, `P/`, `O/` — tên file giữ nguyên, mọi cross-reference trong nội dung pack là tên trần (`K_agent_db_04`) nên không đổi. Trigger activation từng pack: `KERNEL_SKELETON.md`.

Tìm tiền lệ / báo cáo kỳ trước (Stage 0 của P_vbse_strategy cần N-1, P_weekly_overview cần W-1): tra `outputs/INDEX.md` hoặc đường dẫn xác định theo mục 4.

## 4. Kho outputs

```
outputs/
├── INDEX.md
├── vbse_strategy/monthly/<YYYY>/vbse_strategy_monthly_<YYYYMM>.md
├── vbse_strategy/weekly/<YYYY>/vbse_strategy_weekly_<YYYYMMDD>.md
├── weekly_overview/<YYYY>/weekly_overview_<YYYYMMDD>.md
├── stock_report/<TICKER>/stock_report_<TICKER>_<YYYYMMDD>_<mode>.md
├── invest_memo/<YYYY-MM>_cycle/tier{N}_<YYYYMMDD>_confirmed.md   (naming đầy đủ: README mục 7.5)
└── marketing/<YYYY>/<YYYYMM>_<slug>/
```

**Quy tắc hình dạng:** deliverable 1 file → nằm phẳng trong thư mục loại/năm; bản render binary đặt cạnh cùng basename khác extension. Deliverable nhiều asset (brief + ảnh + deck) → một thư mục bundle, carrier MD trùng tên thư mục, ảnh vào `assets/` bên trong, đánh số `NN_<mô tả>.<ext>`.

**Carrier MD:** mọi deliverable có đúng một MD nguồn. Báo cáo: MD là nội dung gốc. Đầu ra thuần ảnh/thiết kế: MD ghi brief, ý tưởng, quyết định, manifest file sinh ra.

**Front-matter** đầu mỗi carrier MD (metadata lưu trữ — bản render/bản gửi đi KHÔNG chứa khối này):

```yaml
---
type: weekly_overview          # loại deliverable
date: 2026-07-19
domain: analyst                # analyst | marketing
inputs:
  - inputs/bctc/VNM/2025Q4_soatxet.pdf
  - "agent_db (query 2026-07-19)"
  - "https://... (tiêu đề, ngày truy cập)"
derived:
  - weekly_overview_20260719.pptx
status: final                  # draft | final | sent | superseded
---
```

**INDEX.md:** một dòng mỗi deliverable, ghi ngay khi lưu, không dồn. Cột key call → kết quả dành cho nhóm báo cáo phân tích, điền kết quả ở kỳ review sau (phục vụ Stage 0 và Best/Worst call attribution).

## 5. Kho inputs

- BCTC: `inputs/bctc/<TICKER>/<YYYY>Q<N>_<loại>.pdf` — loại: `soatxet` | `kiemtoan` | `hopnhat` | `rieng`. Báo cáo năm: `<YYYY>_kiemtoan.pdf`.
- Tài liệu ngoài: `inputs/external/<YYYYMMDD>_<nguồn>_<mô tả ngắn>.<ext>`.
- **Lưu vs cite:** lưu thứ không lấy lại được (PDF user gửi, tài liệu đã tải). Bài web → cite URL + ngày truy cập trong front-matter, không lưu file. Số liệu DB → cite collection + ngày query.

## 6. Render binary (môi trường có filesystem + skill)

- Style baseline: render spec trong O pack tương ứng (kể cả section đánh dấu `[LEGACY]` — dùng làm reference spec), cộng brand asset từ `brand/` khi cần bản branded.
- Font body: Roboto, fallback Roboto → Open Sans → Arial (theo `agent_analyst/system_prompt.md` mục 1).
- MD là source of truth — sửa nội dung thì sửa MD rồi re-render, không edit binary trực tiếp.
- Render xong: đặt cạnh MD cùng basename, ghi vào front-matter `derived`, cập nhật cột định dạng trong INDEX.

## 7. Quy tắc git

Repo local, branch duy nhất `main`, chưa có remote. Lịch sử git là audit trail máy — bổ trợ, không thay thế `_ops/CHANGELOG.md` (log ngữ nghĩa cho sửa engine).

**7.1. Đầu session:** `git status` phải sạch. Working tree bẩn hoặc có file untracked lạ = bất thường (mục 2.2) → báo user trước khi làm tiếp.

**7.2. Commit theo lượt việc — 1 lượt việc hoàn chỉnh = 1 commit:**

- Deliverable mới: carrier MD + binary derived + dòng INDEX + inputs mới dùng — cùng 1 commit.
- Intake file rời (chưa gắn deliverable): commit riêng.
- Sửa engine: commit riêng, CHANGELOG entry nằm trong cùng commit. Không trộn engine với deliverable — để revert độc lập.
- Cuối session không để working tree bẩn: hoặc commit trọn vẹn, hoặc báo user phần đang dở.

**7.3. Message:** `<type>: <mô tả ngắn tiếng Việt>` — type: `report` (deliverable) | `intake` (input/brand) | `engine` (K/P/O/system_prompt/agent_db) | `ops` (cấu trúc, script, doc workspace) | `fix` (đính chính → bản superseded). Ví dụ: `report: weekly_overview 20260719 (md+pptx)`; `engine: port phase_trading note sang agent_db_03`. Body ghi đường dẫn chính khi không hiển nhiên từ message.

**7.4. Cấm:** amend/rebase/force lên commit đã tạo — lịch sử append-only như kho; commit file bất thường (conflict copy, temp) — xử lý theo mục 2.2 trước; tự tạo branch/remote khi user chưa yêu cầu.

**7.5. Line-ending:** `.gitattributes` ép LF cho text — không override bằng autocrlf, không tắt.

**7.6. OneDrive:** repo nằm trong folder OneDrive — chấp nhận với 1 máy + 1 session ghi tại một thời điểm; không chạy song song nhiều session cùng ghi. Nếu chuyển đa máy: đề xuất user lập remote (private) làm nguồn chính trước.

## 8. Behavioral guidelines (áp cho mọi session làm việc trên workspace)

1. **Think before acting** — không giả định ngầm; nhiều cách hiểu thì hỏi, surface tradeoff.
2. **Simplicity first** — giải pháp tối thiểu đủ dùng, không thêm cấu trúc/feature đón đầu.
3. **Surgical changes** — chỉ chạm file phải chạm, giữ style hiện có, không refactor ngoài yêu cầu.
4. **Goal-driven execution** — định nghĩa tiêu chí xong việc trước, verify xong mới báo done.

## 9. Ghi chú môi trường

- Workspace nằm trên OneDrive: lệnh bash lỗi với file cloud-only → dùng tool Read (tự tải về). Di chuyển/ghi hàng loạt gây một đợt sync — bình thường, không phải lỗi.
- Git trong sandbox Cowork cần quyền xoá file (git unlink `index.lock` + object tạm mỗi thao tác). Gặp "unable to unlink ... Operation not permitted" → gọi tool xin quyền delete cho folder, dọn `index.lock` + `tmp_obj_*` trong `.git/objects/`, thao tác lại. Không được kết luận "git không dùng được".
- `agent_db` cần MongoDB `agent_db` qua MCP; không có kết nối thì chỉ làm được phần methodology, phải nói rõ với user.
- Claude Desktop Project (nếu còn dùng làm runtime): knowledge upload là bản sao tĩnh — sửa file ở đây xong phải re-upload thủ công, xem README mục 2.
