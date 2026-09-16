# Recount + locate U+00C2 in one pass (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$T = [System.IO.File]::ReadAllText($R92, $utf8)
$n = 0
for ($k = 0; $k -lt $T.Length; $k++) {
  if ($T[$k] -eq [char]0x00C2) {
    $n++
    $a = [Math]::Max(0, $k - 30)
    $b = [Math]::Min(70, $T.Length - $a)
    [string]('pos=' + $k + ':...' + $T.Substring($a, $b) + '...')
  }
}
'total=' + $n
