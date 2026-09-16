# Diagnose SLEXT1 coverage + print S1/S2/R stop rows (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
'EXT1N=' + (Select-String -LiteralPath $A -Pattern 'SLEXT1 fields=29' -SimpleMatch | Measure-Object).Count
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLEXT1 fields=29 bar=2026.09.08' -SimpleMatch)) {
  $ln = $hit.Line
  $k = $ln.IndexOf('bar=')
  [string]$ln.Substring($k, [Math]::Min(220, $ln.Length - $k))
}
'---RFIRES---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLEXT1 fields=29 bar=2026.08.28' -SimpleMatch)) {
  $ln = $hit.Line
  $k = $ln.IndexOf('bar=')
  [string]$ln.Substring($k, [Math]::Min(220, $ln.Length - $k))
}
