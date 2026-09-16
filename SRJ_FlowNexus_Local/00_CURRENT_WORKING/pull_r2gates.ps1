# R2 10:35 gate context + validity-gate inventory refs (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
'---R2-ORDER---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'ORDER fields=10 bar=1 barTime=2026.09.04 10:35' -SimpleMatch)) {
  $ln = $hit.Line
  $k = $ln.IndexOf('barTime=')
  [string]$ln.Substring($k, [Math]::Min(200, $ln.Length - $k))
}
'---R2-SESSION---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern '2026.09.04 10:3' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'SESSION|SessionAlreadyUsed|MarkSessionUsed|CQD DIV|biasOpposed|DIVERG') {
    $k = $ln.IndexOf('[SRJ-EA]')
    if ($k -ge 0) { [string]$ln.Substring($k, [Math]::Min(160, $ln.Length - $k)) }
  }
}
'---GATE-REFS---'
foreach ($pat in @('MarkSessionUsed\(g_session', 'SessionAlreadyUsed\(g_session', 'UpdateDivergenceLatch', 'g_latchedR ', 'gateOutcome=RR_FAIL')) {
  $h = Select-String -LiteralPath $EA -Pattern $pat | Select-Object -First 2
  foreach ($x in $h) { [string]('{0}:{1}' -f $x.LineNumber, $x.Line.Trim().Substring(0, [Math]::Min(90, $x.Line.Trim().Length))) }
}
