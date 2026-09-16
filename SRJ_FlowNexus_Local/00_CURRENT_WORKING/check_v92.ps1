# Inspect v92 appendix region (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$L = [System.IO.File]::ReadAllLines($R92, $utf8)
'RAW-LINES=' + $L.Length
for ($i = 40; $i -lt 62; $i++) {
  $t = $L[$i]
  if ($t.Length -gt 80) { $t = $t.Substring(0, 80) }
  [string](($i + 1).ToString() + ':' + $t)
}
