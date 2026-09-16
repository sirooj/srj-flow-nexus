# Pull SLEXT1 rows for S1/S2/R-fires + R-row fires (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
$OUT = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\R35_STOPROWS.txt'
$out = New-Object System.Collections.Generic.List[string]
foreach ($pat in @('SLEXT1 fields=29 bar=2026.09.08 10:05', 'SLEXT1 fields=29 bar=2026.09.08 16:40', 'SLEXT1 fields=29 bar=2026.08.28 10:05', 'SLEXT1 fields=29 bar=2026.09.04 16:00', 'SLEXT1 fields=29 bar=2026.09.07 09:20', 'SLEXT1 fields=29 bar=2026.09.07 16:45')) {
  foreach ($hit in (Select-String -LiteralPath $A -Pattern $pat -SimpleMatch)) {
    $ln = $hit.Line
    $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]')))
  }
}
foreach ($pat in @('SLIMBR bar=2026.09.08 16:40', 'SLIMBR bar=2026.08.28 10:05', 'SLIMBR bar=2026.09.04 16:00', 'SLIMBR bar=2026.09.07 09:20', 'SLIMBR bar=2026.09.07 16:45')) {
  foreach ($hit in (Select-String -LiteralPath $A -Pattern $pat -SimpleMatch)) {
    $ln = $hit.Line
    $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'), [Math]::Min(200, $ln.Length - $ln.IndexOf('[SRJ-EA]'))))
  }
}
[System.IO.File]::WriteAllLines($OUT, $out.ToArray(), $utf8)
'STOPROWS=' + $out.Count
