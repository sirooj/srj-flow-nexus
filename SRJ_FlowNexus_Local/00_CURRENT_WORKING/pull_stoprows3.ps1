# Pull R-fire SLEXT1 rows + raw PREEMPT 0930-1005 + S2-1640 SLNONFIRE (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
'---R3-R4-R5-EXT1---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLEXT1 fields=29' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'bar=2026\.09\.04 1[56]:|bar=2026\.09\.07 (09:2|16:4)') {
    $k = $ln.IndexOf('bar=')
    [string]$ln.Substring($k, [Math]::Min(230, $ln.Length - $k))
  }
}
'---PREEMPT-0930-1005---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SIDE1C_PREEMPT bar=2026.09.08' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'bar=2026\.09\.08 (09:30|09:50|10:05)') {
    $ln.Substring($ln.IndexOf('[SRJ-EA]'))
  }
}
'---S2-NONFIRE---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLNONFIRE fields=11 bar=2026.09.08 16:40' -SimpleMatch)) {
  $ln = $hit.Line
  $k = $ln.IndexOf('bar=')
  [string]$ln.Substring($k, [Math]::Min(230, $ln.Length - $k))
}
