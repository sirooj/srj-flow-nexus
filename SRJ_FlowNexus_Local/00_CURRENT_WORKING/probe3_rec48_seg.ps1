# probe3 RECON48 leg-B archive intervals + TP_ELECT/SIGNAL joins (segment-only)
$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
$inv = [System.Globalization.CultureInfo]::InvariantCulture
$wire = @{}
foreach ($x in $L) {
  $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
  if ($i -lt 0) { continue }
  $msg = $x.Substring($i + 21)
  if ($msg.Contains(' type=NORMAL') -and $msg.Contains(' part=1/3')) {
    $toks = $msg.Split(@(' '), [System.StringSplitOptions]::RemoveEmptyEntries)
    $bar = ''; $rE = ''
    foreach ($t in $toks) {
      if ($t.StartsWith('barTime=')) { $bar = $t.Substring(8) }
      if ($t.StartsWith('rExt1=')) { $rE = $t.Substring(6) }
    }
    $wire[$bar] = $rE
  }
}
$arch = @(
  @('2026.08.28-10:00', '1.16466', '1.16322', '1.16508'),
  @('2026.08.28-16:20', '1.16430', '1.16322', '1.16508'),
  @('2026.09.04-15:55', '1.16018', '1.16315', '1.15847'),
  @('2026.09.07-09:15', '1.16135', '1.16315', '1.16098'),
  @('2026.09.07-16:40', '1.16261', '1.16315', '1.16238'),
  @('2026.09.08-10:05', '1.16205', '1.16072', '1.16258'),
  @('2026.09.08-16:40', '1.16213', '1.16114', '1.16359')
)
echo '--- leg-B archive intervals (archive table ex v193 P017-P026) ---'
foreach ($a in $arch) {
  $bar = $a[0]
  $en = [double]::Parse($a[1], $inv)
  $tp = [double]::Parse($a[2], $inv)
  $st = [double]::Parse($a[3], $inv)
  $ptv = 0.00001
  $n = [Math]::Round([Math]::Abs($en - $tp) / $ptv)
  $d = [Math]::Round([Math]::Abs($en - $st) / $ptv)
  $r = [double]::Parse($wire[$bar], $inv)
  $lo = ($n - 1) / ($d + 1)
  $hi = ($n + 1) / ($d - 1)
  $din = ($r -ge $lo -and $r -le $hi)
  $bits = [System.BitConverter]::DoubleToInt64Bits($r)
  $mant = $bits -band 0xFFFFFFFFFFFFF
  $exp = (($bits -shr 52) -band 0x7FF)
  if ($exp -eq 0) { $m = [System.Numerics.BigInteger]$mant; $e = -1074 }
  else { $m = ([System.Numerics.BigInteger]$mant) + ([System.Numerics.BigInteger]::Pow(2, 52)); $e = $exp - 1075 }
  $nnB = [System.Numerics.BigInteger]$n
  $ddB = [System.Numerics.BigInteger]$d
  $twoE = [System.Numerics.BigInteger]::Pow(2, -$e)
  $bi = ((($m * ($ddB + 1)) -ge (($nnB - 1) * $twoE)) -and (($m * ($ddB - 1)) -le (($nnB + 1) * $twoE)))
  echo ($bar + ' n=' + $n + ' d=' + $d + ' rE=' + $wire[$bar] + ' lo=' + $lo + ' hi=' + $hi + ' dbl=' + $din + ' bigint=' + $bi)
}
$c = 0
foreach ($x in $L) { if ($x.Contains('[SRJ-EA] TP_ELECT ') -and $x.Contains('bar=2026.09.04 10:35')) { $c++ } }
echo ('tp-elect-at-A2bar=' + $c)
echo '--- TP_ELECT fire bars ---'
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] TP_ELECT ')) {
    $i = $x.IndexOf(' R=')
    $rest = $x.Substring($i + 3)
    $rv = [double]::Parse($rest.Substring(0, $rest.IndexOf(' ')), $inv)
    $j = $x.IndexOf(' bar=')
    $rb = $x.Substring($j + 5)
    $bar = $rb.Substring(0, $rb.IndexOf(' '))
    if ($rv -ge 1.0) { echo ('FIRE bar=' + $bar + ' R=' + $rv) }
  }
}
echo '--- SIGNAL EA timestamps ---'
foreach ($x in $L) {
  if ($x.Contains('ALERT SRJ SIGNAL')) {
    $i = $x.IndexOf('Core 04')
    $ts = $x.Substring($i + 8, 19)
    $j = $x.IndexOf('ALERT SRJ SIGNAL')
    echo ($ts + ' :: ' + $x.Substring($j + 17))
  }
}
