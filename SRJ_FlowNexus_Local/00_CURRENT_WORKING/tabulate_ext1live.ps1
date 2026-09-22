$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON47-EXT1LIVE-V1_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo "seg-lines=$($L.Length)"
$sr = @()
foreach ($x in $L) { $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE '); if ($i -ge 0) { $sr += $x.Substring($i) } }
echo "stopresolve-total=$($sr.Count)"
$types = @{}
$maxAll = 0; $maxNormal = 0
foreach ($x in $sr) {
  if ($x.Length -gt $maxAll) { $maxAll = $x.Length }
  if ($x -match ' type=([A-Z_]+)') { $t = $Matches[1]; if (-not $types.ContainsKey($t)) { $types[$t] = 0 }; $types[$t]++ }
  if ($x.Contains(' type=NORMAL')) { if ($x.Length -gt $maxNormal) { $maxNormal = $x.Length } }
}
foreach ($k in $types.Keys) { echo ("type-" + $k + "=" + $types[$k]) }
echo "maxlen-all=$maxAll maxlen-normal=$maxNormal"
$q = 0; $inv = 0
foreach ($x in $sr) {
  if ($x -match '(^| )[^ =]+=\?( |$|: )') { $q++ }
  if ($x.Contains('INVALID')) { $inv++ }
}
echo "qmark-rows=$q invalid-rows=$inv"
$keys38 = @('barTime','dir','entryPx','tpPx','incomingSlRef','liveSel','slLive','pxExt1','ext1Defined','ext1Imb','rLive','rExt1','gateConst','wouldGate','vetoStateAtSite','sessionUseAtSite','ext1Slot','ext1BarTime','s0slot','s0imb','s1slot','s1imb','ladOriginPx','ladOriginBarTime','ladOriginSite','extSideOk','extDistPts','rawNumLive','rawDenLive','rawNumExt1','rawDenExt1','wouldAdopt_monotone','actualGate','emitSeq','currentPrice','s0px','s1px','ladOriginStamp')
$norm = @()
foreach ($x in $sr) { if ($x.Contains(' type=NORMAL')) { $norm += $x } }
echo "normal-count=$($norm.Count)"
if ($norm.Count -gt 0) {
  $p0 = $norm[0].Substring($norm[0].IndexOf(' type=NORMAL') + 13)
  $toks = $p0.Split(@(' '), [System.StringSplitOptions]::RemoveEmptyEntries)
  $ok = 1
  if ($toks.Length -ne 38) { $ok = 0; echo "first-normal-tokens=$($toks.Length)" }
  for ($k = 0; $k -lt 38 -and $k -lt $toks.Length; $k++) {
    $kn = $toks[$k].Substring(0, $toks[$k].IndexOf('='))
    if ($kn -cne $keys38[$k]) { $ok = 0; echo ("key-mismatch pos" + $k + " got=" + $kn + " want=" + $keys38[$k]) }
  }
  echo "first-normal-keyorder-ok=$ok"
}
$seqs = @()
foreach ($x in $sr) { if ($x -match 'emitSeq=(\d+)') { $seqs += [int]$Matches[1] } }
$u = $seqs | Sort-Object -Unique
echo "emitseq-n=$($seqs.Count) distinct=$($u.Count) min=$($u[0]) max=$($u[$u.Count-1])"
$dirs = @{}
foreach ($x in $norm) { if ($x -match ' dir=(-?\d+)') { $d = $Matches[1]; if (-not $dirs.ContainsKey($d)) { $dirs[$d] = 0 }; $dirs[$d]++ } }
echo ("dir-values=" + (($dirs.Keys | Sort-Object) -join ','))
$side1e = 0; $side1x = 0; $slext = 0
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] SIDE1E_STOPSHADOW ')) { $side1e++ }
  if ($x.Contains('[SRJ-EA] SIDE1X_STOPREF ')) { $side1x++ }
  if ($x.Contains('[SRJ-EA] SLEXT481 ') -and $x.Contains(' site=S5 ')) { $slext++ }
}
echo "side1e=$side1e side1x=$side1x slext-s5=$slext"
$pxinv = 0
foreach ($x in $norm) { if ($x -match ' pxExt1=INVALID') { $pxinv++ } }
echo "normal-pxExt1-INVALID=$pxinv"
$stampbad = 0; $stampn = 0
foreach ($x in $norm) {
  if (($x -match ' barTime=([^ ]+)') -and ($x -match ' ladOriginStamp=([^ ]+)')) {
    $stampn++
    if ($Matches[1] -cne $Matches[2]) { $stampbad++ }
  }
}
echo "stamp-checked=$stampn stamp-mismatch=$stampbad"
function ShowBar($bar) {
  foreach ($x in $norm) { if ($x -match (' barTime=' + $bar + ' ')) { echo $x; return } }
  echo ("BAR-NOT-FOUND " + $bar)
}
echo '--- A1 bar=2026.08.28 16:20 ---'
ShowBar '2026.08.28 16:20'
echo '--- A3 bar=2026.09.08 16:40 ---'
ShowBar '2026.09.08 16:40'
echo '--- A2 bar=2026.09.04 10:35 ---'
ShowBar '2026.09.04 10:35'
