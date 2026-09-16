# Dump raw bytes around APPENDIX anchor (no char comparisons).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$B = [System.IO.File]::ReadAllBytes($R92)
'BYTELEN=' + $B.Length
$anch = [byte[]](65, 80, 80, 69, 78, 68, 73, 88, 32, 65)
for ($i = 0; $i -lt $B.Length - $anch.Length; $i++) {
  $ok = $true
  for ($j = 0; $j -lt $anch.Length; $j++) {
    if ($B[$i + $j] -ne $anch[$j]) { $ok = $false; break }
  }
  if ($ok) {
    $seg = $B[$i..($i + 30)] | ForEach-Object { $_.ToString('X2') }
    [string]('anchor-at=' + $i + ' bytes=' + ($seg -join ' '))
  }
}
