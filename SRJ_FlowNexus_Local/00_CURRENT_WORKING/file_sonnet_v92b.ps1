# File two Sonnet texts for v92 round 2 (verbatim appends + tail verify + staging clean).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$tgt = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
function FileOne($src, $header) {
  $raw = [System.IO.File]::ReadAllText($src, $utf8)
  $block = "`r`n" + $header + "`r`n`r`n" + $raw
  if (-not $block.EndsWith("`r`n")) { $block += "`r`n" }
  $bb = $utf8.GetBytes($block)
  [System.IO.File]::AppendAllText($tgt, $block, $utf8)
  $t = [System.IO.File]::ReadAllBytes($tgt)
  $tail = $t[($t.Length - $bb.Length)..($t.Length - 1)]
  $m = $true
  for ($i = 0; $i -lt $bb.Length; $i++) {
    if ($tail[$i] -ne $bb[$i]) { $m = $false; break }
  }
  [string]('FILED bytes=' + $bb.Length + ' TAIL-MATCH=' + $m)
  Remove-Item -LiteralPath $src -Force
}
FileOne 'C:\Users\winar\AppData\Local\Temp\opencode\V92_SONNET_C_STAGE.md' '## REVIEW (Sonnet-channel, SECOND text under Review-ID V92-SPLIT-REVIEW-001; first text under this ID filed earlier this round, both kept; review-only, keyless for live) - answers v92 2026-09-16'
FileOne 'C:\Users\winar\AppData\Local\Temp\opencode\V92_SONNET_D_STAGE.md' '## REVIEW (Sonnet-live web UI, second text this round, no ID, keyless; re-asks Q-A/Q-B through to operator) - answers v92 2026-09-16'
'FILE-HASH=' + (Get-FileHash -LiteralPath $tgt -Algorithm SHA256).Hash
'STAGING-CLEANED'
