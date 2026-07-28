# INDEX — Sổ cái deliverable

Một dòng mỗi deliverable, ghi ngay khi lưu. AI là người ghi duy nhất (CLAUDE.md mục 2.1).

Quy tắc cột:

- **Đường dẫn** — trỏ bản **MD**, tương đối từ `outputs/md/`. Ba cây kia (`pptx/`, `docx/`, `sent/`) dùng đúng đường dẫn và basename đó, chỉ khác extension, nên không cần ghi lại.
- **Định dạng** — đã có những gì: `md` · `md+pptx` · `md+pptx+sent` · `md+docx+sent`. Render thêm hoặc copy sang `sent/` → cập nhật dòng.
- **Trạng thái** — draft / final / sent / superseded. Có file trong `sent/` thì trạng thái phải là `sent`. Superseded ghi kèm đường dẫn bản thay thế.
- **Key call → kết quả** — khi xuất báo cáo: ghi call chính (regime, sector bias, mã + conviction). Kỳ review sau (Stage 0 / review N-1): điền vế kết quả.

| Ngày | Loại | Đường dẫn (bản MD) | Định dạng | Trạng thái | Key call → kết quả | Ghi chú |
|---|---|---|---|---|---|---|
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier0_20260728_draft.md | md | draft | Regime Defensive only, quota 2 ngành × 3 mã, cash 60%; phòng thủ HATANGTIENICH + THUCPHAM → (điền kỳ sau) | CP1 chờ user confirm. Báo cáo độc lập, không dùng tầng chỉ báo nội bộ (audit_overrides.md). Có 3 mục mở rộng: định giá P/E-P/B loại nhóm Vingroup, mùa vụ tháng 8 giai đoạn 2020-2025, nâng hạng FTSE kèm tiền lệ quốc tế |

<!-- Ví dụ format dòng (xoá comment này khi có dòng thật):
| 2026-07-19 | weekly_overview | weekly_overview/2026/weekly_overview_20260719.md | md+pptx+sent | sent | Regime thận trọng MID 1-2w; bias NGANHANG/KCN → (điền kỳ sau) | bản sent đã chỉnh tay thêm slide bìa |
| 2026-08-03 | stock_report | stock_report/VNM/stock_report_VNM_20260803_standard.md | md | final | VNM Long MID 3-6m → (điền kỳ sau) | audience nội bộ |
-->
