# Show exact leading whitespace for lines 7634-7658 (dots for spaces).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$L = [System.IO.File]::ReadAllLines($EA, $utf8)
for ($n = 7634; $n -le 7658; $n++) {
  $ln = $L[$n - 1]
  $k = 0
  while ($k -lt $ln.Length) {
    if ($ln[$k] -ne ' ') { break }
    $k++
  }
  $tail = $ln.Substring($k, [Math]::Min(60, $ln.Length - $k))
  [string](($n).ToString() + ' sp=' + $k + ' |' + $tail)
}
