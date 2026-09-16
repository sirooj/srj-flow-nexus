# Locate every U+00C2 line in the relay (read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$lines = [System.IO.File]::ReadAllLines($R78, $utf8)
for ($i = 0; $i -lt $lines.Count; $i++) {
  if ($lines[$i].Contains([char]0x00C2)) {
    $s = $lines[$i]
    if ($s.Length -gt 160) { $s = $s.Substring(0, 160) }
    'LINE {0}: {1}' -f ($i + 1), $s
  }
}
