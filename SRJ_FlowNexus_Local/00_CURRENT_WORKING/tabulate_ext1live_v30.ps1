# tabulate RECON48-EXT1LIVE-V30 (v30 3-part shape; pattern from tabulate_ext1live2.ps1, segment-only)
$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo ('seg-lines=' + $L.Count)
$keys38 = @('barTime','dir','entryPx','tpPx','incomingSlRef','liveSel','slLive','pxExt1','ext1Defined','ext1Imb','rLive','rExt1','gateConst','wouldGate','vetoStateAtSite','sessionUseAtSite','ext1Slot','ext1BarTime','s0slot','s0imb','s1slot','s1imb','ladOriginPx','ladOriginBarTime','ladOriginSite','extSideOk','extDistPts','rawNumLive','rawDenLive','rawNumExt1','rawDenExt1','wouldAdopt_monotone','actualGate','emitSeq','currentPrice','s0px','s1px','ladOriginStamp')
$pay = @()
foreach ($x in $L) { $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE '); if ($i -ge 0) { $pay += $x.Substring($i + 21) } }
echo ('stopresolve-payloads=' + $pay.Count)
$npf = 0
foreach ($x in $L) { $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE '); if ($i -ge 0 -and $i -ne 48) { $npf++ } }
echo ('non48-prefix=' + $npf)
$fmtBad = 0; $pktBad = 0; $baseBad = 0
foreach ($x in $pay) {
  if (-not $x.Contains('format=2 ')) { $fmtBad++ }
  if (-not $x.Contains('pkt=PACKET_EXT1LIVE-001-v28 ')) { $pktBad++ }
  if (-not $x.Contains('base=6C2E4028 ')) { $baseBad++ }
}
echo ('envelope-bad format=' + $fmtBad + ' pkt=' + $pktBad + ' base=' + $baseBad)
$schCount = 0; $schema = ''
foreach ($x in $pay) { if ($x.Contains(' type=SCHEMA')) { $schCount++; $schema = $x } }
echo ('schema-count=' + $schCount)
$sn = $schema.Substring($schema.IndexOf('names=') + 6).Split(@(','), [System.StringSplitOptions]::None)
$sok = 1
if ($sn.Count -ne 38) { $sok = 0 }
for ($k = 0; $k -lt 38; $k++) { if ($sn[$k] -cne $keys38[$k]) { $sok = 0; echo ('schema-mismatch pos' + $k) } }
echo ('schema-38-ordered-ok=' + $sok)
$norm = @()
foreach ($x in $pay) { if ($x.Contains(' type=NORMAL')) { $norm += $x } }
echo ('normal-parts=' + $norm.Count)
$pt = @{}
foreach ($x in $norm) {
  $i = $x.IndexOf(' part=')
  $t = 'NOPART'
  if ($i -ge 0) { $rest = $x.Substring($i + 6); $sp = $rest.IndexOf(' '); if ($sp -gt 0) { $t = $rest.Substring(0, $sp) } }
  if (-not $pt.ContainsKey($t)) { $pt[$t] = 0 }
  $pt[$t]++
}
foreach ($k in ($pt.Keys | Sort-Object)) { echo ('parttag ' + $k + '=' + $pt[$k]) }
$ordBad = 0; $seqMissing = 0; $combo = @{}; $dupCombo = 0
$recParts = @{}
$partMax = @{'1/3'=0; '2/3'=0; '3/3'=0}
$rows = @{}
foreach ($x in $norm) {
  $msg = $x
  $toks = $msg.Split(@(' '), [System.StringSplitOptions]::RemoveEmptyEntries)
  $si = -1; $pnum = ''
  for ($j = 0; $j -lt $toks.Count; $j++) {
    if ($toks[$j].StartsWith('part=')) { $pnum = $toks[$j].Substring(5) }
    if ($toks[$j].StartsWith('emitSeq=') -and $si -eq -1) { $si = $j }
  }
  if ($si -lt 0) { $seqMissing++; continue }
  $seq = $toks[$si].Substring(8)
  $ck = $seq + '|' + $pnum
  if ($combo.ContainsKey($ck)) { $dupCombo++ } else { $combo[$ck] = 1 }
  if (-not $recParts.ContainsKey($seq)) { $recParts[$seq] = @() }
  $recParts[$seq] += $pnum
  $plen = $toks[$si].Length
  $pi2 = $msg.IndexOf(' type=NORMAL')
  $mmsg = $msg.Substring($pi2 + 13)
  if ($mmsg.Length -gt $partMax[$pnum]) { $partMax[$pnum] = $mmsg.Length }
  $pt2 = @()
  for ($j = ($si + 1); $j -lt $toks.Count; $j++) { $pt2 += $toks[$j] }
  $lo = 0; $hi = 0
  if ($pnum -eq '1/3') { $lo = 0; $hi = 12 }
  elseif ($pnum -eq '2/3') { $lo = 13; $hi = 25 }
  elseif ($pnum -eq '3/3') { $lo = 26; $hi = 37 }
  else { $ordBad++; echo ('badpart ' + $pnum); continue }
  if ($pt2.Count -ne ($hi - $lo + 1)) { $ordBad++; echo ('ar-botch seq=' + $seq + ' part=' + $pnum + ' ntok=' + $pt2.Count) }
  for ($k = $lo; $k -le $hi; $k++) {
    $e = $pt2[$k - $lo].IndexOf('=')
    $kk = $pt2[$k - $lo].Substring(0, $e)
    if ($kk -cne $keys38[$k]) { $ordBad++; echo ('order-mismatch seq=' + $seq + ' pos=' + $k + ' got=' + $kk) }
  }
  if ($pnum -eq '3/3') {
    $env = $toks[$si].Substring(8)
    $pl = ''
    foreach ($t in $pt2) { if ($t.StartsWith('emitSeq=')) { $pl = $t.Substring(8) } }
    if ($env -cne $pl) { $ordBad++; echo ('seq-envelope-vs-payload seq=' + $seq) }
  }
  if (-not $rows.ContainsKey($seq)) { $rows[$seq] = @{} }
  foreach ($t in $pt2) {
    $e = $t.IndexOf('=')
    $rows[$seq][$t.Substring(0, $e)] = $t.Substring($e + 1)
  }
}
echo ('parts-missing-seq=' + $seqMissing + ' dup-combo=' + $dupCombo)
echo ('partmsg-max 1/3=' + $partMax['1/3'] + ' 2/3=' + $partMax['2/3'] + ' 3/3=' + $partMax['3/3'])
echo ('order-bad=' + $ordBad)
$seqs = @($recParts.Keys | Sort-Object)
echo ('records=' + $seqs.Count + ' first=' + $seqs[0] + ' last=' + $seqs[$seqs.Count - 1])
$recBad = 0
foreach ($s in $seqs) {
  $pp = ($recParts[$s] | Sort-Object) -join ','
  if ($pp -cne '1/3,2/3,3/3') { $recBad++; echo ('rec-incomplete seq=' + $s + ' parts=' + $pp) }
  if ($rows[$s].Count -ne 38) { $recBad++; echo ('rec-keycount seq=' + $s + ' n=' + $rows[$s].Count) }
}
echo ('record-bad=' + $recBad)
$inv = [System.Globalization.CultureInfo]::InvariantCulture
$w0ok = 0; $w0bad = 0; $dirs = @{}; $bars = @()
$gcBad = 0; $defBad = 0; $entryEq = 0; $entryNe = 0; $stampMiss = 0; $stampEq = 0; $stampNe = 0
$chgOk = 0; $legAok = 0; $legAbad = 0; $legBselfOk = 0; $legBselfBad = 0
$biAok = 0; $biAbad = 0
foreach ($s in $seqs) {
  $d = $rows[$s]
  if (-not $dirs.ContainsKey($d['dir'])) { $dirs[$d['dir']] = 0 }
  $dirs[$d['dir']]++
  $bars += $d['barTime']
  if ($d['gateConst'] -cne '1') { $gcBad++ }
  if ($d['ext1Defined'] -cne '1') { $defBad++ }
  $rv = [double]::Parse($d['rExt1'], $inv)
  if (($rv -ge 1.0 -and $d['wouldGate'] -eq '1') -or ($rv -lt 1.0 -and $d['wouldGate'] -eq '0')) { $w0ok++ } else { $w0bad++; echo ('GATE-SIGN seq=' + $s + ' rExt1=' + $d['rExt1'] + ' wouldGate=' + $d['wouldGate']) }
  if ($d['entryPx'] -ceq $d['currentPrice']) { $entryEq++ } else { $entryNe++; echo ('ENTRY-NE seq=' + $s) }
  if (-not $d.ContainsKey('ladOriginStamp')) { $stampMiss++ }
  else {
    $st = $d['ladOriginStamp']
    $bt = $d['barTime']
    if ($st -ceq $bt) { $stampEq++ } else { $stampNe++; echo ('STAMP-NE seq=' + $s + ' bar=' + $bt + ' stamp=' + $st) }
  }
  if ($d['liveSel'] -eq '1' -and $d['slLive'] -ceq $d['pxExt1'] -and $d['rLive'] -ceq $d['rExt1']) { $chgOk++ }
  $rE = [double]::Parse($d['rExt1'], $inv)
  $nE = [double]::Parse($d['rawNumExt1'], $inv)
  $dE = [double]::Parse($d['rawDenExt1'], $inv)
  $rL = [double]::Parse($d['rLive'], $inv)
  $nL = [double]::Parse($d['rawNumLive'], $inv)
  $dL = [double]::Parse($d['rawDenLive'], $inv)
  $okA = (($nE / $dE) -eq $rE) -and (($nL / $dL) -eq $rL)
  if ($okA) { $legAok++ } else { $legAbad++; echo ('LEG-A seq=' + $s) }
  $ptv = 0.00001
  $nn = [Math]::Round($nE / $ptv)
  $dd = [Math]::Round($dE / $ptv)
  $loB = ($nn - 1) / ($dd + 1)
  $hiB = ($nn + 1) / ($dd - 1)
  if ($dd -gt 1 -and $rE -ge $loB -and $rE -le $hiB) { $legBselfOk++ } else { $legBselfBad++; echo ('SELF-IV seq=' + $s + ' n=' + $nn + ' d=' + $dd) }
  $bits = [System.BitConverter]::DoubleToInt64Bits($rE)
  $mant = $bits -band 0xFFFFFFFFFFFFF
  $exp = (($bits -shr 52) -band 0x7FF)
  if ($exp -eq 0) { $m = [System.Numerics.BigInteger]$mant; $e = -1074 }
  else { $m = ([System.Numerics.BigInteger]$mant) + ([System.Numerics.BigInteger]::Pow(2, 52)); $e = $exp - 1075 }
  $nnB = [System.Numerics.BigInteger]$nn
  $ddB = [System.Numerics.BigInteger]$dd
  $twoE = [System.Numerics.BigInteger]::Pow(2, -$e)
  $loOk = ($m * ($ddB + 1)) -ge (($nnB - 1) * $twoE)
  $hiOk = ($m * ($ddB - 1)) -le (($nnB + 1) * $twoE)
  if ($loOk -and $hiOk) { $biAok++ } else { $biAbad++; echo ('BIGINT-IV seq=' + $s) }
}
echo ('dir-values=' + (($dirs.Keys | Sort-Object) -join ','))
echo ('wouldgate-sign-consistent=' + $w0ok + ' inconsistent=' + $w0bad)
echo ('gateConst-bad=' + $gcBad + ' ext1Defined-bad=' + $defBad)
echo ('entry-eq-currentPrice=' + $entryEq + ' ne=' + $entryNe)
echo ('stamp-present-eq-bar=' + $stampEq + ' ne=' + $stampNe + ' miss=' + $stampMiss)
echo ('sel1-triple-identical=' + $chgOk)
echo ('legA-exact=' + $legAok + ' bad=' + $legAbad)
echo ('self-interval-dbl=' + $legBselfOk + ' bad=' + $legBselfBad)
echo ('self-interval-bigint=' + $biAok + ' bad=' + $biAbad)
echo ('bars-first=' + $bars[0] + ' bars-last=' + $bars[$bars.Count - 1] + ' bars-n=' + $bars.Count)
$qm = 0; $iv = 0; $iv2 = 0; $qm2 = 0
foreach ($x in $norm) {
  if ($x -match '(^| )[^ =]+=\?( |$)') { $qm++ }
  if ($x.Contains('INVALID')) { $iv++ }
  if ($x.Contains('=?')) { $qm2++ }
}
foreach ($x in $norm) { if ($x -cmatch 'invalid') { $iv2++ } }
echo ('qmark=' + $qm + ' qmark2=' + $qm2 + ' invalid=' + $iv + ' invalid2=' + $iv2)
$se = 0; $sx = 0; $sl = 0; $tp = 0
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] SIDE1E_STOPSHADOW ')) { $se++ }
  if ($x.Contains('[SRJ-EA] SIDE1X_STOPREF ')) { $sx++ }
  if ($x.Contains('[SRJ-EA] SLEXT481 ') -and $x.Contains(' site=S5 ')) { $sl++ }
  if ($x.Contains('[SRJ-EA] TP_ELECT ')) { $tp++ }
}
echo ('side1e=' + $se + ' side1x=' + $sx + ' slext-s5=' + $sl + ' tp_elect=' + $tp)
$cap1 = 0; $cap2 = 0; $bs1 = 0; $bs2 = 0
foreach ($x in $L) {
  if ($x.Contains('type=CAP')) { $cap1++ }
  if ($x.Contains('BSAVE_FAIL')) { $bs1++ }
}
foreach ($x in $L) {
  if ($x -cmatch 'CAP') { $cap2++ }
  if ($x -cmatch 'BSAVE') { $bs2++ }
}
echo ('cap-p1=' + $cap1 + ' cap-p2=' + $cap2 + ' bsave-p1=' + $bs1 + ' bsave-p2=' + $bs2)
$sig = @()
foreach ($x in $L) { if ($x.Contains('ALERT SRJ SIGNAL')) { $sig += $x } }
echo ('signals=' + $sig.Count)
foreach ($x in $sig) {
  $i = $x.IndexOf('ALERT SRJ SIGNAL')
  echo $x.Substring($i)
}
$xob = 0
foreach ($x in $L) { if ($x.Contains('XOB-PROMOCENSUS')) { $xob++ } }
echo ('xob-promocensus=' + $xob)
$tst = 0; $cc = 0; $tpass = 0
foreach ($x in $L) {
  if ($x.Contains('testing of Experts\SRJ_FlowNexus_EA.ex5')) { $tst++ }
  if ($x.Contains('connection closed')) { $cc++ }
  if ($x.Contains('Test passed in')) { $tpass++ }
}
echo ('testing-start=' + $tst + ' conn-closed=' + $cc + ' test-passed=' + $tpass)
foreach ($x in $L) {
  if ($x.Contains('BIASCENSUS_FINAL') -or $x.Contains('ZONECENSUS_FINAL') -or $x.Contains('WS161_CENSUS') -or $x.Contains('final balance') -or $x.Contains('bars generated')) { echo $x.Substring($x.IndexOf('Core 04') + 8) }
}
$qall = 0; $qall2 = 0
foreach ($x in $L) {
  if ($x.Contains('?')) { $qall++ }
  if ($x -cmatch '\?') { $qall2++ }
}
echo ('qmark-filewide-p1=' + $qall + ' p2=' + $qall2)
$mx = 0; $at537 = 0; $sr537 = 0
foreach ($x in $L) {
  if ($x.Length -gt $mx) { $mx = $x.Length }
  if ($x.Length -eq 537) { $at537++; if ($x.Contains('[SRJ-EA] STOPRESOLVE ')) { $sr537++ } }
}
echo ('max-seg-line=' + $mx + ' lines-at-537=' + $at537 + ' stopresolve-at-537=' + $sr537)
$msr = 0
foreach ($x in $L) { if ($x.Contains('[SRJ-EA] STOPRESOLVE ') -and $x.Length -gt $msr) { $msr = $x.Length } }
echo ('max-stopresolve-line=' + $msr)
function ShowSeq($s) {
  foreach ($x in $norm) {
    if ($x.Contains('emitSeq=' + $s + ' ') -or $x.EndsWith('emitSeq=' + $s)) {
      $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
      echo $x.Substring($i + 21)
    }
  }
}
echo '--- SEQ-by-bar A1 ---'
foreach ($s in $seqs) { if ($rows[$s]['barTime'] -ceq '2026.08.28-16:20') { echo ('seq=' + $s); ShowSeq $s } }
echo '--- SEQ-by-bar A3 ---'
foreach ($s in $seqs) { if ($rows[$s]['barTime'] -ceq '2026.09.08-16:40') { echo ('seq=' + $s); ShowSeq $s } }
echo '--- SEQ-by-bar A2 ---'
foreach ($s in $seqs) { if ($rows[$s]['barTime'] -ceq '2026.09.04-10:35') { echo ('seq=' + $s); ShowSeq $s } }
echo '--- wouldGate=1 bars ---'
foreach ($s in $seqs) { if ($rows[$s]['wouldGate'] -eq '1') { echo ($rows[$s]['barTime'] + ' seq=' + $s + ' rExt1=' + $rows[$s]['rExt1'] + ' actualGate=' + $rows[$s]['actualGate'] + ' liveSel=' + $rows[$s]['liveSel']) } }
echo '--- per-row actualGate/liveSel/dir ---'
foreach ($s in $seqs) { echo ($rows[$s]['barTime'] + ' seq=' + $s + ' dir=' + $rows[$s]['dir'] + ' sel=' + $rows[$s]['liveSel'] + ' wg=' + $rows[$s]['wouldGate'] + ' ag=' + $rows[$s]['actualGate'] + ' rE=' + $rows[$s]['rExt1'] + ' slot=' + $rows[$s]['ext1Slot'] + ' px=' + $rows[$s]['pxExt1']) }
