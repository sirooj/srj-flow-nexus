# skillgate483.ps1 - append SESSION-STATEMENT gate to srj-council SKILL.md (ASCII-only; CRLF-preserving; NO other edits)
$ErrorActionPreference = 'Stop'
$F = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\.opencode\skills\srj-council\SKILL.md'
$raw = [IO.File]::ReadAllBytes($F)
$hasBom = ($raw.Length -ge 3 -and $raw[0] -eq 0xEF -and $raw[1] -eq 0xBB -and $raw[2] -eq 0xBF)
"PRE_BOM=$hasBom PRE_BYTES=$($raw.Length)"
$lines = [IO.File]::ReadAllLines($F)
if ($lines.Count -ne 77) { throw "count $($lines.Count)" }
if ($lines[59] -ne '## 4. Assurance pass') { throw 'anchor' }
"ANCHOR_OK=line60"
$bullet = '- Session-statement (his order 2026-09-20 - the v199 council-session correction: hedging CONTINUE-vs-NEW cost a full dispute turn): every relay carries an explicit one-line session verdict, stated outright, never hedged - CONTINUE previous council session (short/delta form lawful; same-session note names the remembered round) or NEW council session (full form: every operative line plus every graded row rides whole inline; zero digest-only references for attested content; the leftover sweep proves it). Battery checks the claim both ways: CONTINUE requires the same-session note plus the remembered round filed and ruled; NEW requires the full-form proof. A relay without its session line is BLOCKED, never sent. First ruling banked: v199 CONTINUE-previous (ledger 482).'
foreach ($ch in $bullet.ToCharArray()) { if ([int]$ch -gt 127) { throw 'nonascii' } }
"ASCII_OK=true"
$new = @()
$new += $lines[0..58]
$new += $bullet
$new += $lines[59..($lines.Count - 1)]
[IO.File]::WriteAllText($F, (($new -join "`r`n") + "`r`n"), (New-Object Text.UTF8Encoding($hasBom)))
$post = [IO.File]::ReadAllLines($F)
"POST_COUNT=$($post.Count)"
if ($post.Count -ne 78) { throw 'postcount' }
if ($post[59] -ne $bullet) { throw 'landing' }
$b2 = [IO.File]::ReadAllBytes($F)
$lf = ($b2 | Where-Object { $_ -eq 10 }).Count; $cr = ($b2 | Where-Object { $_ -eq 13 }).Count
"POST_LF=$lf POST_CR=$cr POST_BYTES=$($b2.Length)"
$h = (Get-FileHash -LiteralPath $F -Algorithm SHA256).Hash
"POST_HASH=$h"
