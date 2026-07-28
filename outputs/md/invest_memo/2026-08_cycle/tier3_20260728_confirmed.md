---
type: invest_memo_tier3
date: 2026-07-28
inputs:
  - outputs/md/invest_memo/2026-08_cycle/tier2_20260728_confirmed.md
  - outputs/md/invest_memo/2026-08_cycle/tier3_20260728_draft.md
  - "agent_db (query 2026-07-28)"
derived: []
status: final
---

# Tier 3 confirmed — Danh sách mã cycle 2026-08

**Đây là deliverable cuối của cycle.** Theo quyết định user, chu kỳ này dừng ở Tier 3 — không chạy Tier 5 (memo deep-dive) và Tier 6 (portfolio construction). Vì vậy file này được viết để **dùng trực tiếp** làm danh sách theo dõi và vào lệnh, không phải làm đầu vào cho tier sau.

Hệ quả cần biết trước: **không mã nào trong danh sách này đã qua memo 7 phần, variant perception, bear case steelmanned, hay exit trigger viết trước.** Theo Nguyên tắc 1 và 2 của `P_invest_memo_00`, đó là điều kiện tiên quyết để vào position. Danh sách dưới đây là **kết quả sàng lọc, không phải khuyến nghị đã qua đủ gate**. Mục 7 và 8 bù lại phần kỷ luật tối thiểu.

## 1. Summary

**Giữ toàn bộ 20 mã**, phân ba nhóm ưu tiên thay vì cắt xuống 9. Theo chỉ đạo user: thêm được, không cần bớt, mã nào tốt thì giữ.

| Nhóm | Số mã | Vai trò |
|---|---|---|
| **Ưu tiên 1 — Lõi** | 9 | Top 3 mỗi ngành theo bảng chấm. Danh mục thực tế nên xây quanh nhóm này |
| **Ưu tiên 2 — Bổ sung** | 8 | Điểm sát top 3, có lý do riêng đủ mạnh để giữ. Dùng khi muốn mở rộng hoặc thay thế |
| **Nhóm 3 — Giao dịch thuần** | 3 | Cơ bản yếu rõ, chỉ giữ vì dòng tiền. Size nhỏ, kỷ luật thoát chặt |

**Regime kế thừa:** Risk-on selective, cash buffer 30%.
**Conviction toàn danh sách: 0 High · 15 Medium · 5 Low.** Không mã nào đạt 15/18.

## 2. Danh sách đầy đủ 20 mã

Sắp theo ngành rồi theo điểm giảm dần.

| Mã | Ngành | Điểm | Conviction | Bucket | Nhóm | Size gợi ý | Ghi chú một dòng |
|---|---|---|---|---|---|---|---|
| **VND** | CK | 13 | Medium | 1 | **1** | 3-5% | Khối ngoại mua ròng +323 tỷ, room 100% |
| **MBS** | CK | 13 | Medium | 2 | **1** | 3-5% | Pha loãng đã xong, không còn cung treo |
| **VCI** | CK | 11 | Medium | 2 | **1** | 3-5% | Cổ đông lớn mua 31,05 triệu cp, 04/08–02/09 |
| SSI | CK | 11 | Medium | 2 | 2 | 2-3% | Q2 +32%, thị phần top 2; bán ròng 892 tỷ |
| SHS | CK | 11 | Medium | 1 | 2 | 2-3% | P/B 1,06 rẻ nhất nhóm; Q2 −81% |
| VIX | CK | 11 | Medium → **Low** | 2 | **3** | 1-2% | Thanh khoản lớn nhất sàn; **Q2 −95%** |
| **KDH** | BĐS | 13 | Medium | 2 | **1** | 3-5% | Sạch nợ TP, 3 CTCK Mua, lãnh đạo mua 350 tỷ |
| **CEO** | BĐS | 10 | Low | 2 | **1** | 1-2% | Hồi sau đáy tốt nhất ngành; dòng tiền KD −380 tỷ |
| **DXG** | BĐS | 10 | Low | 2 | **1** | 1-2% | Thanh khoản cao nhất mid-cap BĐS; ROE giảm |
| NLG | BĐS | 10 | Low | 2 | 2 | 1-2% | Backlog 10.878 tỷ; hoà tuyệt đối với CEO/DXG |
| HDG | BĐS | 9 | Low | 2 | 2 | 1-2% | **Duy nhất có dòng tiền KD dương 6 quý liên tiếp** |
| TAL | BĐS | 9 | Low | 2 | **3** | ≤0,8 tỷ | ROE cao nhất ngành nhưng **size trần ~800 triệu** |
| **SHB** | NH | 12 | Medium | 3 | **1** | 3-5% | Krungsri hoàn tất giữa Q3; thanh khoản số 1 |
| **LPB** | NH | 12 | Medium | 1 | **1** | 3-5% | NN mua ròng 122 tỷ; **P/B 3,23 đắt nhất nhóm** |
| **MBB** | NH | 11 | Medium | 2 | **1** | 3-5% | NPL 1,42%, room ngoại 49% |
| HDB | NH | 11 | Medium | 2 | 2 | 2-3% | **NN mua ròng +338 tỷ — cao nhất 20 mã**; LLCR 50% |
| ACB | NH | 11 | Medium | 1 | 2 | 2-3% | NPL 0,97% thấp nhất; **nợ nhóm 2 +93,4%** |
| CTG | NH | 11 | Medium | 3 | 2 | 2-3% | Q2 dự phóng cao nhất ngành; LLCR 167,2% |
| MSB | NH | 11 | Medium | 2 | 2 | 2-3% | Q2 dự phóng +48%, cao nhất 10 NH khảo sát |
| STB | NH | 10 | Low | 1 | **3** | 1-2% | Dòng tiền mạnh nhất nhóm; **NPL 6,62%, Q2 −50%** |

**Nếu vào hết theo size gợi ý:** nhóm 1 chiếm 24-38%, nhóm 2 chiếm 15-22%, nhóm 3 chiếm 3-6%. Tổng 42-66%, tức cash còn 34-58%.

**Khuyến nghị của tôi: không vào cả 20 mã.** Danh mục dưới 1 triệu USD giữ 20 mã là quá phân tán — mỗi mã 3,5% thì một mã tăng 30% chỉ đóng góp 1% cho danh mục, không đủ bù công theo dõi. Nhóm 1 với 9 mã đã là giới hạn thực tế; nhóm 2 nên coi là danh sách dự bị để thay khi một mã nhóm 1 hỏng luận điểm.

## 3. Nhóm ưu tiên 1 — 9 mã lõi

Lý do chọn và điểm từng tiêu chí ở `tier3_20260728_draft.md` mục 4. Tóm tắt điều cần theo dõi:

| Mã | Luận điểm một câu | Điều phải theo dõi |
|---|---|---|
| **VND** | Khối ngoại mua ròng mạnh nhất nhóm chứng khoán giữa lúc cả thị trường bị bán | Thị phần HOSE đã rơi về 3,96%, đáy nhiều năm — nếu quý 3 tiếp tục giảm thì luận điểm hỏng |
| **MBS** | Mã chứng khoán duy nhất không còn nguồn cung pha loãng treo | Dư nợ margin 16.670 tỷ kỷ lục — kiểm trích lập khi BCTC quý 3 ra |
| **VCI** | Cổ đông lớn nhất mua 31,05 triệu cp trong đúng cửa sổ | **Ngày 02/09/2026** — sau ngày này lực đỡ biến mất, phải đánh giá lại |
| **KDH** | Bảng cân đối sạch nhất ngành, ba CTCK cùng khuyến nghị Mua | Giá mục tiêu 32.800–42.600đ so với 16.950đ là chênh 94–151% — bất thường, đừng dùng thẳng |
| **CEO** | Hiệu suất hồi sau đáy tốt nhất ngành: +221% và +162% | **Dòng tiền kinh doanh −380 tỷ**, âm sâu nhất 6 quý. Vị thế giao dịch, không phải giá trị |
| **DXG** | Thanh khoản cao nhất nhóm mid-cap BĐS, câu chuyện tái cấu trúc | ROE trailing đang giảm 2,6% → 1,7%; Dragon Capital đã thoái sạch ghế cổ đông lớn |
| **SHB** | Krungsri hoàn tất mua 50% SHBFinance giữa quý 3, thanh khoản số 1 thị trường | NPL 2,60% và LLCR 71,2% — bộ đệm mỏng, vừa qua ngưỡng tối thiểu |
| **LPB** | Khối ngoại mua ròng 122 tỷ, phiên 27/07 dẫn đầu toàn thị trường | **P/B 3,23 gấp 2,4 lần trung bình ngành**; lợi nhuận 6 tháng −3,1%; room ngoại chỉ 5% |
| **MBB** | Chất lượng tài sản tốt nhất trong nhóm đã nén; room ngoại vừa nới lên 49% | Khối ngoại bán ròng 207 tỷ trong tháng |

## 4. Nhóm ưu tiên 2 — 8 mã giữ lại có lý do

Đây là nhóm mà bảng chấm xếp dưới top 3 nhưng mỗi mã có một lý do riêng đủ mạnh để không loại.

| Mã | Vì sao không vào nhóm 1 | Vì sao vẫn giữ |
|---|---|---|
| **HDB** | Thua MBB đúng 1 điểm ở tổng bốn tiêu chí đầu (8 so với 9), do NPL 2,60% vượt ngưỡng 2% | **Khối ngoại mua ròng +338 tỷ trong tháng — cao nhất trong toàn bộ 20 mã.** Sáu tháng lãi trước thuế +44%, room ngoại 49%. Là mã user chỉ định |
| **ACB** | Cùng 11 điểm, thua ở tiêu chí phân định; tiêu chí catalyst chỉ 1 điểm | **NPL 0,97% thấp nhất nhóm**, LLCR 114%, ở Bucket 1 nên vào được ngay. Là mã user chỉ định. ⚠ Nợ nhóm 2 tăng 93,4% là cảnh báo có hướng rõ |
| **CTG** | Cùng 11 điểm; free float chỉ 15% nên tiêu chí thanh khoản mất 1 điểm | Lợi nhuận quý 2 dự phóng **cao nhất toàn ngành**, có thể soán ngôi VCB; **LLCR 167,2% mạnh nhất nhóm**; giá mục tiêu 50.900đ |
| **MSB** | Cùng 11 điểm; NPL 2,66% và LLCR 51,6% kéo tiêu chí 1 xuống | Lợi nhuận quý 2 dự phóng **+48%, cao nhất trong 10 ngân hàng khảo sát**; YTD trên 30% |
| **SSI** | Cùng 11 điểm, thua VCI ở tổng bốn tiêu chí đầu | **Mã chứng khoán duy nhất có lợi nhuận quý 2 thực sự tốt: +32%**, thị phần HOSE 11,17% top 2, HSC Mua giá mục tiêu 33.000đ. ⚠ Bán ròng 892 tỷ và pha loãng 20% không hạn chế chuyển nhượng |
| **SHS** | Cùng 11 điểm; lợi nhuận quý 2 −81% | **P/B 1,06 rẻ nhất nhóm chứng khoán**; phiên 28/07 khớp trên 16 triệu cp, cao nhất sàn HNX; đang ở Bucket 1 |
| **NLG** | Hoà tuyệt đối với CEO và DXG trên bảng chấm, chỉ thua ở vòng quay thanh khoản | **Backlog 10.878 tỷ** đã ký chưa ghi nhận — cơ sở doanh thu tương lai chắc chắn nhất nhóm BĐS; đang giảm đòn bẩy. Nếu ưu tiên cơ bản hơn dòng tiền thì NLG hơn CEO |
| **HDG** | Điểm thấp (9) vì tiêu chí quản trị chỉ 1 điểm — phiên nằm sàn 06/07 không có tin chính thức giải thích | **Mã duy nhất trong 10 mã BĐS soi sâu có dòng tiền kinh doanh dương 6 quý liên tiếp** (+467, +339, +258, +190, +457, +105 tỷ). ROE 10,11% cao thứ hai ngành. BSC Mua giá mục tiêu 32.500đ |

**Đánh giá riêng của tôi:** trong tám mã này, **HDG và CTG là hai mã tôi thấy bảng chấm đối xử thiếu công bằng nhất**. HDG mất điểm vì một phiên biến động không giải thích được, nhưng chất lượng dòng tiền của nó là tốt nhất ngành. CTG mất điểm thanh khoản vì free float 15%, nhưng giá trị giao dịch tuyệt đối vẫn 263,9 tỷ/phiên — thừa cho mọi size trong danh mục dưới 1 triệu USD.

## 5. Nhóm 3 — Giao dịch thuần, ba mã

Ba mã này **cơ bản yếu rõ ràng** và chỉ giữ vì dòng tiền. Phải gọi đúng tên: đây là vị thế giao dịch, không phải vị thế đầu tư theo luận điểm giá trị.

| Mã | Cơ bản | Dòng tiền | Kỷ luật bắt buộc |
|---|---|---|---|
| **VIX** | Lợi nhuận quý 2 **−94/−95% YoY**, thấp nhất 13 quý; tự doanh lỗ ròng 200 tỷ | Phiên 28/07 khớp **trên 55,9 triệu cp**, vượt xa mọi mã chứng khoán | Size 1-2%. Thoát khi vòng quay 5 phiên giảm dưới 60% mức 20 phiên |
| **STB** | **NPL 6,62% cao nhất ngành**, lợi nhuận quý 2 ước −50%, dự phòng trên 4.700 tỷ | Khối lượng tuần 13-17/7 **tăng trên 110%, dẫn đầu HOSE** | Size 1-2%. Luận điểm phụ thuộc NHNN duyệt đấu giá 32,5% cổ phần VAMC — chưa có ngày |
| **TAL** | Cơ bản thực ra tốt: ROE 15,62% cao nhất ngành BĐS, ICR 8,1, pass đủ 4/4 | Vòng quay 5,3 — **thấp nhất trong 22 mã BĐS đã đo** | **Size trần cứng ~800 triệu** theo trần 5% khối lượng bình quân. Mã tốt nhưng gần như không vào được size có ý nghĩa |

**TAL nằm ở nhóm này vì lý do ngược với hai mã kia** — không phải cơ bản yếu mà là thanh khoản quá mỏng. Ghi rõ để không đọc nhầm.

## 6. Cảnh báo mức độ conviction — giữ nguyên từ bản draft

**Không mã nào đạt tier High.** Điểm cao nhất 13/18. Theo `P_invest_memo_04` mục 5, portfolio không có mã High nghĩa là conviction tổng thấp, và khuyến nghị của quy trình là cân nhắc **tăng cash buffer** thay vì giải ngân đủ.

Ba nguyên nhân: tiêu chí vị thế ngành yếu diện rộng (chỉ 7/20 mã đạt 2 điểm, **không mã nào đạt 3**); tiêu chí khối ngoại yếu vì cả thị trường bị bán ròng (chỉ 2/20 mã đạt 3 điểm); và sáu mã vào universe qua đường dòng tiền nên theo thiết kế không thể có điểm cơ bản cao.

Điều này **nhất quán với regime Defensive only mà tôi đề xuất ở Tier 0** và user đã override sang Risk-on selective. Ghi lại để kỳ review sau đánh giá được override đó.

## 7. Kỷ luật vào lệnh — thay cho Tier 6 không chạy

Vì cycle dừng ở đây, phần này bù lại tối thiểu những gì Tier 6 lẽ ra phải làm.

### 7.1. Theo bucket

| Bucket | Mã | Cách vào |
|---|---|---|
| **1** | VND · SHS · LPB · ACB · STB | Vào **30-50% size**, không phải 50-70% như spec mặc định — vì nhịp bật ngày 28/07 mới một phiên |
| **2** | MBS · VCI · SSI · VIX · KDH · CEO · DXG · NLG · HDG · TAL · MBB · HDB · MSB | Vào **30-50%**, chờ tuần thứ hai xác nhận rồi vào tiếp |
| **3** | SHB · CTG | **Chưa vào.** Chờ đến khi có tuần tăng hoặc phiên bật trên 2% kèm khối lượng trên mức bình quân 20 phiên |

### 7.2. Trần size theo thanh khoản

Áp trần 5% khối lượng bình quân 20 phiên mỗi phiên, build 3 phiên:

| Mã | ADV (tỷ) | Size trần cả vị thế |
|---|---|---|
| TAL | 5,3 | **~800 triệu** |
| HDG | 38,1 | ~5,7 tỷ |
| NLG | 42,7 | ~6,4 tỷ |
| CEO | 71,3 | ~10,7 tỷ |
| KDH | 90,0 | ~13,5 tỷ |
| Còn lại | ≥ 114 | ≥ 17 tỷ — không vướng |

### 7.3. Ba mã có ngày hết hạn luận điểm

| Mã | Ngày | Sau ngày đó |
|---|---|---|
| **VCI** | **02/09/2026** | Giao dịch của cổ đông lớn kết thúc. Lực đỡ biến mất, phải đánh giá lại từ đầu |
| **SHB** | Giữa quý 3/2026 | Thương vụ Krungsri hoàn tất. Nếu chậm hoặc đổi điều khoản, catalyst hỏng |
| **Toàn nhóm CK** | Liên tục | Thanh khoản khớp lệnh HOSE — cần trung bình 5 phiên **vượt 15.000 tỷ** để xác nhận; **dưới 10.000 tỷ hai tuần liên tiếp thì thoát**, không chờ |

### 7.4. Kỷ luật thoát cho sáu mã vào bằng đường dòng tiền

VIX · CEO · DXG · HDB · STB · LPB — mua vì dòng tiền thì thoát khi dòng tiền rút, **không chờ cơ bản xác nhận**.

Ngưỡng: **vòng quay thanh khoản 5 phiên giảm dưới 60% mức bình quân 20 phiên thì thoát bất kể giá.**

## 8. Điều kiện huỷ toàn cycle

Kiểm hàng tuần. Chạm bất kỳ điều nào thì dừng giải ngân mới và xem lại toàn bộ danh sách:

1. **VNINDEX mất mốc 1.600 điểm** kèm khối lượng tăng — hiện 1.680,62, đệm 4,8%
2. **Tỷ giá bán vượt trần biên độ 26.557** — hiện 26.520, đệm 37 đồng
3. **Fed tăng lãi suất ngoài dự kiến**, hoặc Mỹ mở rộng thuế Section 301 sang nhóm hàng chủ lực khác
4. **Khối ngoại bán ròng một tuần vượt 8.000 tỷ** — tuần gần nhất đã 6.472 tỷ

Ba dấu hiệu xác nhận đáy, đủ hai trong ba thì nâng size lên mức đầy đủ và cân nhắc giảm cash buffer về 15-20%:

1. Khối ngoại bán ròng tuần **dưới 2.000 tỷ** hai tuần liên tiếp, hoặc chuyển mua ròng
2. Số mã tăng vượt số mã giảm ở **3 trên 5 phiên** liên tiếp, không còn mã giảm sàn theo cụm
3. Không có phiên giảm quá 2% kèm khối lượng vượt bình quân 20 phiên, trong hai tuần

## 9. Việc chưa làm — giới hạn của danh sách này

Phải đọc mục này trước khi dùng danh sách.

1. **Không mã nào có memo 7 phần.** Chưa có variant perception, chưa có bear case steelmanned, chưa có exit trigger viết trước theo Nguyên tắc 2. Mục 7 chỉ là kỷ luật tối thiểu, không thay được memo.
2. **Chưa soi BCTC bản PDF.** Toàn bộ đánh giá dựa trên dữ liệu tổng hợp và tin tức, chưa có forensic 6 tác vụ của Tier 5A. Red flag tinh vi trong thuyết minh sẽ không được phát hiện.
3. **Chưa định giá.** Không có target giá base/bull/bear, không có DCF hay peer multiples của Tier 5B. Các giá mục tiêu nêu trong file là **của công ty chứng khoán khác**, chưa được kiểm giả định.
4. **Dữ liệu tài chính trong kho dừng ở quý 1/2026.** Nhiều số quý 2 lấy từ tin tức và một phần là **dự phóng, không phải số công bố** — đặc biệt MBB, CTG, MSB, HDB và toàn bộ nhóm bất động sản.
5. **Ba mâu thuẫn nguồn chưa giải quyết:** danh sách ngân hàng trong rổ FTSE (SSB theo bản Tier 0 so với EIB theo nguồn mới) · số nền kinh tế chịu thuế Section 301 (60 so với 42) · backlog VCG (16.753 so với 26.000 tỷ).
6. **Không đo được dư luận nhà đầu tư cá nhân.** f319.com ngừng hoạt động từ 11/06/2026; mọi đánh giá về mức độ quan tâm là suy ra gián tiếp từ báo chí, danh sách dòng tiền và khối lượng khớp lệnh.

## 10. Link audit log

`audit_overrides.md` cùng thư mục — bảy entry cho cycle này, gồm hai entry ở Tier 3: quyết định giữ 20 mã thay vì cắt xuống 9, và quyết định dừng cycle ở Tier 3.
