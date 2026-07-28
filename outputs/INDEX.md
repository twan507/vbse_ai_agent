# INDEX — Sổ cái deliverable

Một dòng mỗi deliverable, ghi ngay khi lưu. AI là người ghi duy nhất (CLAUDE.md mục 2.1).

Quy tắc cột:

- **Đường dẫn** — trỏ bản **MD**, tương đối từ `outputs/md/`. Ba cây kia (`pptx/`, `docx/`, `sent/`) dùng đúng đường dẫn và basename đó, chỉ khác extension, nên không cần ghi lại.
- **Định dạng** — đã có những gì: `md` · `md+pptx` · `md+pptx+sent` · `md+docx+sent`. Render thêm hoặc copy sang `sent/` → cập nhật dòng.
- **Trạng thái** — draft / final / sent / superseded. Có file trong `sent/` thì trạng thái phải là `sent`. Superseded ghi kèm đường dẫn bản thay thế.
- **Key call → kết quả** — khi xuất báo cáo: ghi call chính (regime, sector bias, mã + conviction). Kỳ review sau (Stage 0 / review N-1): điền vế kết quả.

| Ngày | Loại | Đường dẫn (bản MD) | Định dạng | Trạng thái | Key call → kết quả | Ghi chú |
|---|---|---|---|---|---|---|
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier0_20260728_draft.md | md | final | Đề xuất gốc của agent: regime Defensive only, cash 60% → (điền kỳ sau) | Bản nghiên cứu nền đầy đủ, giữ nguyên giá trị tham chiếu. Chứa 3 mục mở rộng: định giá P/E-P/B loại nhóm Vingroup kèm phân vị, mùa vụ tháng 8 giai đoạn 2020-2025 cho 8 chỉ số + 24 ngành, nâng hạng FTSE kèm tiền lệ 9 thị trường. Regime đã bị user override ở bản confirmed |
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier2_20260728_rev2_draft.md | md | draft | 19 mã: CK (VIX/VND/SSI/SHS/MBS/CTS) · BĐS (CEO/DXG/HDG/KDH/NLG/DXS/TAL) · NH (SHB/TPB/MBB/CTG/ACB/BID) → (điền kỳ sau) | CP3 rev2, chờ user confirm. Sửa nhóm BĐS sau phản hồi user: loại DIG (hết cổ đông lớn, giải chấp, ICR −0,8 quý gần nhất), IJC (vòng quay 31,2 thấp nhất, không có coverage), HDC (ICR âm 3 quý liên tiếp), NVL (chậm trả nợ gốc trái phiếu 23/07) |
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier2_20260728_draft.md | md | superseded | 18 mã, nhóm BĐS gồm DIG/IJC/HDC/NVL → (không dùng) | Superseded bởi tier2_20260728_rev2_draft.md. Giữ làm tham chiếu cho phần Chứng khoán và Ngân hàng (không đổi) và để truy vết lý do sửa |
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier1_20260728_confirmed.md | md | final | Shortlist 3 ngành: CHUNGKHOAN + BDS Dân dụng + NGANHANG; dự bị XAYDUNG + KCN → (điền kỳ sau) | Tier 1 chốt, đầu vào cho Tier 2. Chứng khoán do user override (trượt Funnel C 2đ) — bảo chứng bằng lợi suất sau đáy hạng 1 và hạng 2, nhưng P/B cao hơn đáy 2022/2025 tới 43-46%. Có 5 phụ lục giữ lại toàn bộ nghiên cứu: mùa vụ T8, định giá 24 ngành, nâng hạng FTSE, phân bón vs giá dầu, ghi chú phương pháp |
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier1_20260728_draft.md | md | draft | Universe 2 ngành: NGANHANG rank 1, BDS Dân dụng rank 2 (loại 3 trụ Vin P/B 1,07 phân vị 0,6%) → (điền kỳ sau) | CP2 chờ user confirm. Không ép đủ quota 3 vì universe chỉ 2 — ràng buộc là thành phần bảng catalyst Tier 0, không phải chất lượng ngành. Đã tính lại BĐS Dân dụng loại VIC/VHM/VRE: từ phân vị P/B 92,3% gộp về 0,6% |
| 2026-07-28 | invest_memo | invest_memo/2026-08_cycle/tier0_20260728_confirmed.md | md | final | Regime Risk-on selective (user override), quota 3 ngành × 3 mã, cash 30%; ứng viên HOACHAT + KCN + NGANHANG, loại THUYSAN + DETMAY → (điền kỳ sau) | Tier 0 chốt, đầu vào cho Tier 1. Regime do user override từ Defensive only, kèm 3 điều kiện huỷ có ngưỡng số (audit_overrides.md). Phần nghiên cứu nền không lặp lại, nằm ở bản draft |

<!-- Ví dụ format dòng (xoá comment này khi có dòng thật):
| 2026-07-19 | weekly_overview | weekly_overview/2026/weekly_overview_20260719.md | md+pptx+sent | sent | Regime thận trọng MID 1-2w; bias NGANHANG/KCN → (điền kỳ sau) | bản sent đã chỉnh tay thêm slide bìa |
| 2026-08-03 | stock_report | stock_report/VNM/stock_report_VNM_20260803_standard.md | md | final | VNM Long MID 3-6m → (điền kỳ sau) | audience nội bộ |
-->
