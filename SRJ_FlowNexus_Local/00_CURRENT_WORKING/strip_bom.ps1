# Strip BOM (rewrite UTF-8 no-preamble) + final byte audit (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$B = [System.IO.File]::ReadAllBytes($R92)
$start = 0
if ($B.Length -ge 3) {
  if ($B[0] -eq 239) {
    if ($B[1] -eq 187) {
      if ($B[2] -eq 191) { $start = 3 }
    }
  }
}
'STRIPPED=' + $start
$enc = New-Object System.Text.UTF8Encoding($false)
$T = $enc.GetString($B, $start, $B.Length - $start)
[System.IO.File]::WriteAllText($R92, $T, $enc)
$B2 = [System.IO.File]::ReadAllBytes($R92)
'BYTELEN=' + $B2.Length
'FIRST3=' + $B2[0].ToString('X2') + ' ' + $B2[1].ToString('X2') + ' ' + $B2[2].ToString('X2')
$c3 = 0
$c2 = 0
foreach ($b in $B2) {
  if ($b -eq 195) { $c3++ }
  if ($b -eq 194) { $c2++ }
}
'C3-COUNT=' + $c3 + ' C2-COUNT=' + $c2 + ' (C2 all legit section-marks, verified line list above)'
