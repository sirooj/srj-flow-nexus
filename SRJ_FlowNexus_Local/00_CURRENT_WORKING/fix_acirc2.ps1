# Repair attempt 2 via regex + dump raw bytes around hits (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$B = [System.IO.File]::ReadAllBytes($R92)
'BYTELEN=' + $B.Length
$hits = New-Object System.Collections.Generic.List[int]
for ($i = 0; $i -lt $B.Length - 1; $i++) {
  if ($B[$i] -eq 0xC3 -and $B[$i + 1] -eq 0x82) { $hits.Add($i) }
}
'HIT-C3-82=' + $hits.Count
foreach ($h in $hits) {
  $a = [Math]::Max(0, $h - 20)
  $b = [Math]::Min(50, $B.Length - $a)
  $seg = $B[$a..($a + $b - 1)] | ForEach-Object { $_.ToString('X2') }
  [string]('at=' + $h + ' hex=' + ($seg -join ' '))
}
