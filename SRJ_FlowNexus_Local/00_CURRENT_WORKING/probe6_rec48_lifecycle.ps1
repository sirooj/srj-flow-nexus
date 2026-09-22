$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo '--- 09-04 15:55 lifecycle ---'
foreach ($x in $L) {
  if ($x.Contains('2026.09.04 15:5') -or $x.Contains('2026.09.04 16:0')) {
    $i = $x.IndexOf('[SRJ')
    if ($i -ge 0) {
      $m = $x.Substring($i)
      if ($m.Length -gt 220) { $m = $m.Substring(0, 220) }
      echo $m
    }
  }
}
echo '--- A1 16:20/16:25 lifecycle (STATE/ABORT/HOLD/SIGNAL only) ---'
foreach ($x in $L) {
  if (($x.Contains('2026.08.28 16:2') -or $x.Contains('2026.08.28 16:3')) -and ($x.Contains('STATE ') -or $x.Contains('ABORT') -or $x.Contains('HOLD') -or $x.Contains('SIGNAL') -or $x.Contains('SESSION'))) {
    $i = $x.IndexOf('[SRJ')
    if ($i -ge 0) {
      $m = $x.Substring($i)
      if ($m.Length -gt 220) { $m = $m.Substring(0, 220) }
      echo $m
    }
  }
}
echo '--- Sep-8 17:00 candidate lines ---'
$c = 0
foreach ($x in $L) {
  if ($x.Contains('2026.09.08 17:00') -and $x.Contains('[SRJ-EA]')) {
    $i = $x.IndexOf('[SRJ-EA] ')
    $m = $x.Substring($i + 9)
    if ($m.Length -gt 200) { $m = $m.Substring(0, 200) }
    echo $m
    $c++
    if ($c -ge 25) { break }
  }
}
echo ('shown17=' + $c)
