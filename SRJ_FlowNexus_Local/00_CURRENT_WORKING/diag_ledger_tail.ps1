$P = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_LEDGER_QUEUE.md'
$L = [System.IO.File]::ReadAllLines($P)
echo ('nlines=' + $L.Count)
$last = $L[$L.Count - 1]
echo ('lastlen=' + $last.Length)
echo $last
$codes = @()
foreach ($c in $last.ToCharArray()) {
  $n = [int]$c
  if ($n -gt 126) { $codes += ($n + '@' + $last.IndexOf($c)) }
}
echo ('nonascii=' + ($codes -join ' '))
$prev = $L[$L.Count - 2]
echo ('prevlen=' + $prev.Length)
echo $prev.Substring(0, 60)
