# Trace Sep-8 post-1005 and post-1650 fates (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
$rows = Select-String -LiteralPath $A -Pattern '2026.09.08 1' -SimpleMatch
foreach ($hit in $rows) {
  $ln = $hit.Line
  if ($ln -notmatch '2026\.09\.08 (10:([0-5][0-9])|11:|12:0)') { continue }
  if ($ln -match 'ABORT reason=|STATE S|action=SEED|STAND-DOWN|ALERT SRJ|SESSION_CLOSED') {
    $k = $ln.IndexOf('[SRJ-EA]')
    if ($k -ge 0) { $ln.Substring($k, [Math]::Min(150, $ln.Length - $k)) } else { $ln }
  }
}
'---EVE2---'
foreach ($hit in $rows) {
  $ln = $hit.Line
  if ($ln -notmatch '2026\.09\.08 1(6:(5[0-9])|7:|8:)') { continue }
  if ($ln -match 'ABORT reason=|STATE S|action=SEED|STAND-DOWN|ALERT SRJ|SESSION_CLOSED|PREEMPT') {
    $k = $ln.IndexOf('[SRJ-EA]')
    if ($k -ge 0) { $ln.Substring($k, [Math]::Min(150, $ln.Length - $k)) } else { $ln }
  }
}
