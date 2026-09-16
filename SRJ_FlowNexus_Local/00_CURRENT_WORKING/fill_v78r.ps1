# Fill v78-rev2 appendix markers mechanically from disk (zero transcription).
# All match strings ASCII-only (standing lesson: non-ASCII anchors break PS matching).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$PKT = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
$SON = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$LUN = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
function pay($f,$p) { Select-String -LiteralPath $f -Pattern $p -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf($p)) } | Sort-Object }
function seclines($f,$startMark,$endMark,$afterMark) {
  $L = Get-Content -LiteralPath $f
  $o = 0
  if ($afterMark -ne '') {
    for ($i=0; $i -lt $L.Count; $i++) {
      if ($L[$i].Contains($afterMark)) { $o = $i; break }
    }
  }
  $a = -1; $b = -1
  for ($i=$o; $i -lt $L.Count; $i++) {
    if ($a -eq -1 -and $L[$i].Contains($startMark)) { $a = $i }
    elseif ($a -ge 0 -and $L[$i].Contains($endMark)) { $b = $i; break }
  }
  if ($a -lt 0 -or $b -lt 0) { return @('SECTION-NOT-FOUND') }
  return $L[$a..($b-1)]
}
$rt = [System.IO.File]::ReadAllText($R78, $utf8)
$rt = $rt.Replace('<!--TABLE56-->', ((pay $ARC 'SIDE1C_BOTHDIRS') -join "`r`n"))
$rt = $rt.Replace('<!--PKT-S3-->', ((seclines $PKT 'acceptance thresholds' ('## ' + [char]0xA7 + '4.') '') -join "`r`n"))
$rt = $rt.Replace('<!--SONNET-CORE-->', ((seclines $SON '**Ask 2' '**Ask 3' 'answers v77') -join "`r`n"))
$rt = $rt.Replace('<!--LUNA-CORE-->', ((seclines $LUN '## Ask 2' '## Ask 3' 'V77-C1-CLOSEDSET-01') -join "`r`n"))
[System.IO.File]::WriteAllText($R78, $rt, $utf8)
'markers-left={0}' -f ((Select-String -LiteralPath $R78 -Pattern '<!--(TABLE56|PKT-S3|SONNET-CORE|LUNA-CORE)-->' | Measure-Object).Count)
'table-rows={0}' -f ((Select-String -LiteralPath $R78 -Pattern 'SIDE1C_BOTHDIRS bar=' -SimpleMatch | Measure-Object).Count)
'notfound-flags={0}' -f ((Select-String -LiteralPath $R78 -Pattern 'SECTION-NOT-FOUND' -SimpleMatch | Measure-Object).Count)
