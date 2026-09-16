# Pull SIDE1E at R bars + 1010 + full-row R-fire comparison (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
'---R-ROWS---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SIDE1E_STOPSHADOW' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'bar=2026\.08\.28 10:05|bar=2026\.09\.04 1[56]:|bar=2026\.09\.07 (09:2|16:4)|bar=2026\.09\.04 10:35|bar=2026\.09\.08 10:10') {
    $ln.Substring($ln.IndexOf('[SRJ-EA]'))
  }
}
'---1010-COUNT---'
'E1010=' + (Select-String -LiteralPath $A -Pattern 'SIDE1E_STOPSHADOW bar=2026.09.08 10:10' -SimpleMatch | Measure-Object).Count
'---SIGNALS---'
'SIG=' + (Select-String -LiteralPath $A -Pattern 'ALERT SRJ SIGNAL' -SimpleMatch | Measure-Object).Count
