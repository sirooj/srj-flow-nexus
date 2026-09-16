# Fill v92 companion markers mechanically via pure .NET UTF-8, no-BOM (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$noBom = New-Object System.Text.UTF8Encoding($false)
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V92GATE_WHOLE.md'
function reg($a,$b) {
  $L = [System.IO.File]::ReadAllLines($EA, $utf8)
  $o = New-Object System.Collections.Generic.List[string]
  for ($n = $a; $n -le $b; $n++) { $o.Add(('{0}: {1}' -f $n, $L[$n - 1])) }
  return $o.ToArray()
}
function pay1($p) {
  $h = Select-String -LiteralPath $ARC -Pattern $p -SimpleMatch | Select-Object -First 1
  $ln = $h.Line
  return $ln.Substring($ln.IndexOf('[SRJ-EA]'))
}
$ct = [System.IO.File]::ReadAllText($COMP, $utf8)
$ct = $ct.Replace('<!--R-G1-->', ((reg 9464 9466) -join "`r`n"))
$ct = $ct.Replace('<!--R-G2-->', ((reg 9531 9541) -join "`r`n"))
$ct = $ct.Replace('<!--R-G3-->', ((reg 9561 9599) -join "`r`n"))
$ct = $ct.Replace('<!--R-G4-->', ((reg 9697 9707) -join "`r`n"))
$ct = $ct.Replace('<!--R-G5-->', ((reg 7248 7252) -join "`r`n"))
$g6 = New-Object System.Collections.Generic.List[string]
$g6.Add((pay1 'ORDER fields=10 bar=1 barTime=2026.09.04 10:35'))
$g6.Add((pay1 'SLNONFIRE fields=11 bar=2026.09.04 10:35'))
$g6.Add((pay1 'SLNONFIRE fields=11 bar=2026.09.08 10:05'))
$g6.Add((pay1 'SLNONFIRE fields=11 bar=2026.09.08 16:40'))
$ct = $ct.Replace('<!--R-G6-->', ($g6.ToArray() -join "`r`n"))
[System.IO.File]::WriteAllText($COMP, $ct, $noBom)
'done'
