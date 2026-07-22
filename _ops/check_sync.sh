#!/usr/bin/env bash
# check_sync.sh — kiểm tra đồng bộ K_agent_db_* (agent_analyst) vs agent_db_* (agent_db).
#
# Nguyên lý: 2 bản trùng nội dung, chỉ khác có-chủ-đích (prefix cross-ref, số mục
# system_prompt, wording audience). Các khác biệt có-chủ-đích đó được chốt trong
# _ops/sync_baseline/db_XX.diff. Script diff lại hiện trạng và so với baseline:
#   - Khớp baseline  → OK (chỉ còn khác biệt có chủ đích)
#   - Lệch baseline  → DRIFT (có sửa đổi chưa port, hoặc sửa ngoài kiểm soát) → BÁO USER
#
# Khi cố ý sửa methodology cả 2 bản: sửa xong, port xong, chạy với --rebase để chốt
# baseline mới, và ghi _ops/CHANGELOG.md.
#
# Chạy từ đâu cũng được: ./_ops/check_sync.sh [--rebase]

cd "$(dirname "$0")/.." || exit 1
mkdir -p _ops/sync_baseline
status=0

for i in 01 02 03 04 05 06; do
  a="agent_analyst/K/K_agent_db_${i}.md"
  b="agent_db/agent_db_${i}.md"
  base="_ops/sync_baseline/db_${i}.diff"

  if [ ! -f "$a" ] || [ ! -f "$b" ]; then
    echo "LOI  db_${i}: thieu file ($a / $b)"
    status=1
    continue
  fi

  cur=$(mktemp)
  diff <(sed 's/K_agent_db_/agent_db_/g' "$a") "$b" > "$cur"

  if [ "$1" = "--rebase" ]; then
    cp "$cur" "$base"
    echo "REBASE db_${i}: baseline cap nhat ($(grep -c '^[<>]' "$base") dong khac co chu dich)"
  elif [ ! -f "$base" ]; then
    echo "LOI  db_${i}: chua co baseline — chay --rebase de khoi tao"
    status=1
  elif diff -q "$cur" "$base" >/dev/null 2>&1; then
    echo "OK   db_${i}: khop baseline"
  else
    echo "DRIFT db_${i}: lech so voi baseline — chi tiet:"
    diff "$base" "$cur" | sed 's/^/    /' | head -40
    status=1
  fi
  rm -f "$cur"
done

echo
if [ "$1" = "--rebase" ]; then
  echo "== Baseline da chot. Ghi _ops/CHANGELOG.md neu vua sua methodology. =="
elif [ $status -eq 0 ]; then
  echo "== Dong bo OK =="
else
  echo "== Co DRIFT/LOI — bao user, khong tu sua (CLAUDE.md muc 2.2) =="
fi
exit $status
