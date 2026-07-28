# PreToolUse hook - cuong che CLAUDE.md muc 7.4
#
# Chan 3 lenh git rewrite lich su: commit --amend, rebase, push --force.
# Ly do ton tai: CLAUDE.md la context, khong phai enforcement. Claude doc va co
# theo nhung khong dam bao tuyet doi. Luat nao phai chac chan thi phai la hook.
#
# Exit 2 = chan tool call, stderr hien ve cho Claude doc.
# Exit 0 = cho chay tiep.
#
# QUAN TRONG: file nay phai la ASCII thuan. Windows PowerShell 5.1 doc .ps1
# khong BOM theo ANSI, ky tu UTF-8 nhieu byte se lam vo parse va hook im lang
# fail-open. Da dinh mot lan (2026-07-28) vi dung em-dash. Xem _ops/GOTCHAS.md.

$ErrorActionPreference = 'Stop'

$raw = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }

try { $payload = $raw | ConvertFrom-Json } catch { exit 0 }

$cmd = $payload.tool_input.command
if ([string]::IsNullOrWhiteSpace($cmd)) { exit 0 }

# Moi pattern buoc `git` di kem subcommand (cho phep flag global o giua),
# va gioi han trong 1 dong de tranh khop nham qua heredoc.
$rules = @(
    @{ Re = '\bgit\s+(-\S+\s+)*commit\b[^\r\n]*--amend' ; Name = 'git commit --amend' },
    @{ Re = '\bgit\s+(-\S+\s+)*rebase\b'                ; Name = 'git rebase' },
    @{ Re = '\bgit\s+(-\S+\s+)*push\b[^\r\n]*(--force\b|--force-with-lease\b|\s-f\b)' ; Name = 'git push --force' }
)

foreach ($rule in $rules) {
    if ($cmd -match $rule.Re) {
        $msg = "CHAN boi PreToolUse hook: '" + $rule.Name + "' vi pham CLAUDE.md muc 7.4. " +
               "Lich su git la append-only, khong rewrite. Muon sua thi tao commit moi. " +
               "Neu that su can lenh nay, user phai tu chay tu terminal."
        [Console]::Error.WriteLine($msg)
        exit 2
    }
}

exit 0
