# File Luna second text (verbatim append + tail verify; ASCII-only script).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$tgt = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$src = 'C:\Users\winar\AppData\Local\Temp\opencode\V92_LUNA2_STAGE.md'
$raw = [System.IO.File]::ReadAllText($src, $utf8)
$block = "`r`n" + $raw
if (-not $block.EndsWith("`r`n")) { $block += "`r`n" }
$bb = $utf8.GetBytes($block)
[System.IO.File]::AppendAllText($tgt, $block, $utf8)
$t = [System.IO.File]::ReadAllBytes($tgt)
$tail = $t[($t.Length - $bb.Length)..($t.Length - 1)]
$m = $true
for ($i = 0; $i -lt $bb.Length; $i++) {
  if ($tail[$i] -ne $bb[$i]) { $m = $false; break }
}
'APPENDED-BYTES=' + $bb.Length + ' TAIL-MATCH=' + $m + ' SHA256=' + (Get-FileHash -LiteralPath $tgt -Algorithm SHA256).Hash
Remove-Item -LiteralPath $src -Force
'STAGING-CLEANED'
