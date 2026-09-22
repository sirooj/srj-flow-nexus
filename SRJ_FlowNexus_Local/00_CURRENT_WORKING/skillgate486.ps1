# skillgate486.ps1 - append LABEL-HYGIENE gate to srj-council SKILL.md (defect seen twice: v200/v201 P009 prose collision)
$ErrorActionPreference = 'Stop'
$F = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\.opencode\skills\srj-council\SKILL.md'
$raw = [IO.File]::ReadAllBytes($F)
$hasBom = ($raw.Length -ge 3 -and $raw[0] -eq 0xEF -and $raw[1] -eq 0xBB -and $raw[2] -eq 0xBF)
$lines = [IO.File]::ReadAllLines($F)
"PRE_COUNT=$($lines.Count) PRE_BOM=$hasBom"
$anchor = '- Session-statement (his order 2026-09-20'
$ai = -1
for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i].StartsWith($anchor)) { $ai = $i } }
if ($ai -lt 0) { throw 'session-gate-anchor-missing' }
"ANCHOR_OK=line$($ai+1)"
$bullet = '- Label-hygiene (v200/v201 trips, same class twice: relay File/lines prose carried a parenthetical reading `pasted at P009 (conjunct added)`, colliding with the P009 P-block header assert and halting two green assemblies pre-write): relay prose never contains a P-label-like token (`P0NN (`) outside the P-block headers; the P-sequence assert runs on the assembled body before any write, so the collision fails closed pre-file, never post-transport. Author P-block cross-references as `at P009;` with detail after the semicolon, never parenthesized beside the label.'
foreach ($ch in $bullet.ToCharArray()) { if ([int]$ch -gt 127) { throw 'nonascii' } }
"ASCII_OK=true"
$new = @()
$new += $lines[0..$ai]
$new += $bullet
$new += $lines[($ai+1)..($lines.Count - 1)]
[IO.File]::WriteAllText($F, (($new -join "`r`n") + "`r`n"), (New-Object Text.UTF8Encoding($hasBom)))
$post = [IO.File]::ReadAllLines($F)
"POST_COUNT=$($post.Count)"
$b2 = [IO.File]::ReadAllBytes($F)
"POST_LF=$((($b2 | Where-Object { $_ -eq 10 }).Count)) POST_CR=$((($b2 | Where-Object { $_ -eq 13 }).Count)) POST_BYTES=$($b2.Length)"
"POST_HASH=" + (Get-FileHash -LiteralPath $F -Algorithm SHA256).Hash
