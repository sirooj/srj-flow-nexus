$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo ('lines=' + $L.Count)
$sr = @()
foreach ($x in $L) { if ($x.Contains('[SRJ-EA] STOPRESOLVE ')) { $sr += $x } }
echo ('stopresolve-lines=' + $sr.Count)
$types = @{}
foreach ($x in $sr) {
  $i = $x.IndexOf(' type=')
  $t = 'NOTYPE'
  if ($i -ge 0) {
    $rest = $x.Substring($i + 6)
    $sp = $rest.IndexOf(' ')
    if ($sp -gt 0) { $t = $rest.Substring(0, $sp) } else { $t = $rest }
  }
  if (-not $types.ContainsKey($t)) { $types[$t] = 0 }
  $types[$t]++
}
foreach ($k in ($types.Keys | Sort-Object)) { echo ('type ' + $k + '=' + $types[$k]) }
echo '--- SCHEMA whole ---'
foreach ($x in $sr) { if ($x.Contains('type=SCHEMA')) { echo $x } }
echo '--- first 3 NORMAL lines whole ---'
$n = 0
foreach ($x in $sr) {
  if ($x.Contains('type=NORMAL')) {
    echo $x
    $n++
    if ($n -ge 3) { break }
  }
}
$maxsr = 0
foreach ($x in $sr) { if ($x.Length -gt $maxsr) { $maxsr = $x.Length } }
echo ('max-stopresolve-line=' + $maxsr)
$maxall = 0
foreach ($x in $L) { if ($x.Length -gt $maxall) { $maxall = $x.Length } }
echo ('max-segment-line=' + $maxall)
