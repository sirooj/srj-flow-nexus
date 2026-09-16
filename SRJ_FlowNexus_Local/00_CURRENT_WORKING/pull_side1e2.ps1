# Pull SIDE1E at R1/R4 eval bars (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SIDE1E_STOPSHADOW' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'bar=2026\.08\.28 10:00|bar=2026\.09\.07 09:15') {
    $ln.Substring($ln.IndexOf('[SRJ-EA]'))
  }
}
