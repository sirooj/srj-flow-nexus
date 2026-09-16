# Report raw lines containing byte 0xC2 (mechanical, ASCII-only logic).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$B = [System.IO.File]::ReadAllBytes($R92)
$starts = New-Object System.Collections.Generic.List[int]
$starts.Add(0)
for ($i = 0; $i -lt $B.Length; $i++) {
  if ($B[$i] -eq 10) { $starts.Add($i + 1) }
}
'LINES=' + $starts.Count
for ($s = 0; $s -lt $starts.Count; $s++) {
  $e = $B.Length
  if ($s + 1 -lt $starts.Count) { $e = $starts[$s + 1] }
  for ($i = $starts[$s]; $i -lt $e; $i++) {
    if ($B[$i] -eq 194) {
      $seg = $B[$i..([Math]::Min($i + 6, $e - 1))] | ForEach-Object { $_.ToString('X2') }
      [string](('L' + ($s + 1).ToString() + ' bytes=' + ($seg -join ' ')))
      break
    }
  }
}
