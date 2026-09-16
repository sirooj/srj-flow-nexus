# Locate remaining ACIRC + inspect section D (read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$lines = [System.IO.File]::ReadAllLines($R78, $utf8)
for ($i = 0; $i -lt $lines.Count; $i++) {
  if ($lines[$i].Contains([char]0x00C2)) {
    $s = $lines[$i]
    if ($s.Length -gt 150) { $s = $s.Substring(0, 150) }
    'ACIRC LINE {0}: {1}' -f ($i + 1), $s
  }
}
for ($i = 0; $i -lt $lines.Count; $i++) {
  if ($lines[$i].StartsWith('### D. Luna')) {
    'D-HEAD-AT={0}' -f ($i + 1)
    for ($k = $i; $k -lt [Math]::Min($i + 6, $lines.Count); $k++) {
      'D+{0}: {1}' -f ($k - $i), $lines[$k].Substring(0, [Math]::Min(100, $lines[$k].Length))
    }
    break
  }
}
