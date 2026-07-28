# GOTCHAS — lỗi đã gặp và vì sao cách sửa hiển nhiên lại sai

Ghi **sau khi** debug xong một lỗi tốn hơn 3 lần thử. Không ghi trước, không ghi phỏng đoán.

Format mỗi entry: **Symptom / Root cause / Fix / Where**, và bắt buộc nêu **vì sao cách sửa hiển nhiên là sai** — đó mới là phần đáng giữ. Thứ chỉ cần đọc code là biết thì không thuộc file này.

Phân biệt với `_ops/CHANGELOG.md`: CHANGELOG ghi *đã đổi gì và vì sao*; GOTCHAS ghi *cái bẫy sẽ đạp lại lần sau nếu quên*.

Entry mới thêm lên đầu.

---

## Hook PowerShell im lặng fail-open khi script có ký tự ngoài ASCII

**Symptom.** PreToolUse hook chặn git viết xong, test thử thì **mọi** case đều lọt — kể cả `git commit --amend`. Chạy tay script thấy exit code 1 ở tất cả input, không phải 0 hay 2.

**Root cause.** Script `.ps1` lưu UTF-8 không BOM, trong nội dung có một em-dash (`—`) nằm trong chuỗi thông báo. **Windows PowerShell 5.1 đọc file `.ps1` không BOM theo ANSI**, nên ký tự nhiều byte đó vỡ thành `â€"`, làm hỏng dấu nháy đóng của chuỗi → ParserError → script chết trước khi kiểm tra được gì. `pwsh` 7 đọc UTF-8 mặc định nên chạy đúng, che mất lỗi khi test bằng shell 7.

**Vì sao nguy hiểm hơn vẻ ngoài:** hook chết = **fail-open**, không phải fail-closed. Tool call vẫn chạy bình thường. Không có cảnh báo nào. Một hook hỏng trông giống hệt một hook đang hoạt động mà chưa gặp vi phạm — nên nếu không test bằng case phải-bị-chặn thì không bao giờ phát hiện.

**Fix.** Giữ script hook **ASCII thuần**. Không dùng em-dash, không dấu tiếng Việt, không ký tự đặc biệt — kể cả trong comment.

**Cách sửa hiển nhiên lại sai:** đổi hook sang gọi `pwsh` thay vì `powershell`. Nó làm test xanh ngay nên rất dễ tin là đã xong, nhưng `pwsh` không có sẵn trên mọi máy Windows — máy nào thiếu thì hook lại fail-open, đúng chế độ hỏng nguy hiểm nhất. Sửa ở nguồn (bỏ ký tự ngoài ASCII) thì chạy đúng trên cả 5.1 lẫn 7. Thêm BOM cũng chữa được nhưng đụng `.gitattributes` ép LF và quy ước "không BOM" của workspace.

**Where.** `.claude/hooks/block-git-rewrite.ps1`, `.claude/settings.json`

**Kiểm chứng.** Test phải gồm **cả hai chiều**: case phải chặn (`--amend`, `rebase`, `push -f`) và case không được chặn nhầm (`git log --grep="rebase"`, `git commit` thường). Chỉ test một chiều thì hook luôn-cho-qua vẫn đỗ.
