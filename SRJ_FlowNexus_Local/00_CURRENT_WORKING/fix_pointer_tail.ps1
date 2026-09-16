# Trim dangling non-ASCII tail on pointer State line (ASCII-only logic).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$noBom = New-Object System.Text.UTF8Encoding($false)
$P = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SESSION_POINTER.md'
$L = [System.IO.File]::ReadAllLines($P, $utf8)
$i = 4
while ($L[$i].Length -gt 0) {
  $c = [int]$L[$i][$L[$i].Length - 1]
  if ($c -gt 127) { $L[$i] = $L[$i].Substring(0, $L[$i].Length - 1) } else { break }
}
$L[$i] = $L[$i].TrimEnd() + ')'
[System.IO.File]::WriteAllLines($P, $L, $noBom)
'done'
