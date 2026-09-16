# Locate U+00C2 chars in v92 (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$L = [System.IO.File]::ReadAllLines($R92, $utf8)
for ($i = 0; $i -lt $L.Length; $i++) {
  $idx = $L[$i].IndexOf([char]0x00C2)
  if ($idx -ge 0) {
    $a = [Math]::Max(0, $idx - 40)
    $b = [Math]::Min(80, $L[$i].Length - $a)
    [string](($i + 1).ToString() + ' @' + $idx + ':...' + $L[$i].Substring($a, $b) + '...')
  }
}
