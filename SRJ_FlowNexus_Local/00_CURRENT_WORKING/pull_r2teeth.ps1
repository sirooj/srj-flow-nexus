# R2 10:35 decline mechanics + 1655 identity (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON36-STOPSHADOW_JOURNAL.log'
'---R2-NONFIRE---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLNONFIRE fields=11 bar=2026.09.04 10:35' -SimpleMatch)) {
  $ln = $hit.Line
  $k = $ln.IndexOf('bar=')
  [string]$ln.Substring($k, [Math]::Min(230, $ln.Length - $k))
}
'---R2-CQD---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'CQD DIV verdict' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match '2026\.09\.04 10:3') {
    $k = $ln.IndexOf('CQD DIV')
    [string]$ln.Substring($k, [Math]::Min(120, $ln.Length - $k))
  }
}
'---1655-ANCHOR---'
foreach ($hit in (Select-String -LiteralPath $A -Pattern '2026.09.08 16:55' -SimpleMatch)) {
  $ln = $hit.Line
  if ($ln -match 'SEL52CTX|S5_GATE_CHECK|ANCHOR_ELECT|SEED') {
    $k = $ln.IndexOf('[SRJ-EA]')
    if ($k -ge 0) { [string]$ln.Substring($k, [Math]::Min(170, $ln.Length - $k)) }
  }
}
