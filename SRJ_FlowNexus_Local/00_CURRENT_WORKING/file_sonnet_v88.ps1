# File Sonnet v88 review (verbatim append + tail verify + staging clean).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$tgt = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$src = 'C:\Users\winar\AppData\Local\Temp\opencode\V88_SONNET_STAGE.md'
$raw = [System.IO.File]::ReadAllText($src, $utf8)
$block = "`r`n## REVIEW (non-verdict, NO Ruling-ID stated; fresh-session disclaimer restated) - Sonnet live-session, answers v88 2026-09-16`r`n`r`n" + $raw
if (-not $block.EndsWith("`r`n")) { $block += "`r`n" }
$bb = $utf8.GetBytes($block)
[System.IO.File]::AppendAllText($tgt, $block, $utf8)
$t = [System.IO.File]::ReadAllBytes($tgt)
$tail = $t[($t.Length - $bb.Length)..($t.Length - 1)]
$m = $true
for ($i = 0; $i -lt $bb.Length; $i++) { if ($tail[$i] -ne $bb[$i]) { $m = $false; break } }
'APPENDED-BYTES=' + $bb.Length + ' TAIL-MATCH=' + $m + ' SHA256=' + (Get-FileHash -LiteralPath $tgt -Algorithm SHA256).Hash
Remove-Item -LiteralPath $src -Force
Remove-Item -LiteralPath 'C:\Users\winar\AppData\Local\Temp\opencode\V88_LUNA_STAGE.md' -Force
'STAGING-CLEANED'
