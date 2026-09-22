$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo '--- LOT_TOO_SMALL lines whole ---'
foreach ($x in $L) { if ($x.Contains('LOT_TOO_SMALL')) { echo $x } }
echo '--- ABORT reason LOT lines (second pattern) ---'
$c = 0
foreach ($x in $L) { if ($x.Contains('ABORT reason=LOT')) { $c++; echo $x } }
echo ('abort-lot-count=' + $c)
echo '--- camel lot symbols (calc/min/req/vol/size, cut 200, cap 20) ---'
$n = 0
foreach ($x in $L) {
  $xl = $x.ToLower()
  if (($xl.Contains('calc') -or $xl.Contains('minlot') -or $xl.Contains('reqlot') -or $xl.Contains('ordervol') -or $xl.Contains('lotsize') -or $xl.Contains('lots')) -and $x.Contains('[SRJ')) {
    $m = $x.Substring($x.IndexOf('[SRJ'))
    if ($m.Length -gt 200) { $m = $m.Substring(0, 200) }
    echo $m
    $n++
    if ($n -ge 20) { break }
  }
}
echo '--- 17:00 lifecycle S-stage lines (cut 200, cap 60) ---'
$m2 = 0
foreach ($x in $L) {
  if (($x.Contains('2026.09.08 17:0')) -and ($x.Contains('STATE ') -or $x.Contains('S1_') -or $x.Contains('S2') -or $x.Contains('S3') -or $x.Contains('S4') -or $x.Contains('S5') -or $x.Contains('ARM') -or $x.Contains('SEED') -or $x.Contains('BIRTH') -or $x.Contains('REJECT') -or $x.Contains('KILL') -or $x.Contains('VETO') -or $x.Contains('HOLD') -or $x.Contains('SIGNAL') -or $x.Contains('CONFIRM') -or $x.Contains('DIV') -or $x.Contains('ABORT'))) {
    $i = $x.IndexOf('[SRJ')
    if ($i -ge 0) {
      $m = $x.Substring($i)
      if ($m.Length -gt 200) { $m = $m.Substring(0, 200) }
      echo $m
      $m2++
      if ($m2 -ge 60) { break }
    }
  }
}
echo '--- S5 evals at 17:00 (second pattern: STOPRESOLVE 17:0x) ---'
$s5 = 0
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] STOPRESOLVE ') -and ($x.Contains('barTime=2026.09.08-17:0'))) { $s5++; echo $x }
}
echo ('stopresolve-170x=' + $s5)
