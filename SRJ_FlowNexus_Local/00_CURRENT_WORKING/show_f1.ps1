# Show F1 comment lines raw (ASCII-safe display, hex for high bytes).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$L = [System.IO.File]::ReadAllLines($EA, $utf8)
for ($n = 7635; $n -le 7643; $n++) {
  $ln = $L[$n - 1]
  $out = ''
  foreach ($ch in $ln.ToCharArray()) {
    $c = [int]$ch
    if ($c -lt 128) { $out += $ch } else { $out += ('<U+' + $c.ToString('X4') + '>') }
  }
  [string](($n).ToString() + ':' + $out)
}
