# probe2 RECON48 follow-ups (segment-only)
$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
echo '--- testing-of lines whole ---'
foreach ($x in $L) { if ($x.Contains('testing of Experts\SRJ_FlowNexus_EA.ex5')) { echo $x } }
echo '--- first 2 segment lines ---'
echo $L[0]
echo $L[1]
echo '--- CAP lines (cut 200) ---'
foreach ($x in $L) {
  if ($x -cmatch 'CAP') {
    $i = $x.IndexOf('[SRJ')
    if ($i -lt 0) { $i = 0 }
    $m = $x.Substring($i)
    if ($m.Length -gt 200) { $m = $m.Substring(0, 200) }
    echo $m
  }
}
echo '--- TP_ELECT R split ---'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
$fire = 0; $nonf = 0
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] TP_ELECT ')) {
    $i = $x.IndexOf(' R=')
    if ($i -ge 0) {
      $rest = $x.Substring($i + 3)
      $sp = $rest.IndexOf(' ')
      $rv = [double]::Parse($rest.Substring(0, $sp), $inv)
      if ($rv -ge 1.0) { $fire++ } else { $nonf++ }
    }
  }
}
echo ('tp-fire=' + $fire + ' tp-nonfire=' + $nonf)
echo '--- per-part full-message maxima ---'
$mx1 = 0; $mx2 = 0; $mx3 = 0; $s1 = ''; $s2 = ''; $s3 = ''
foreach ($x in $L) {
  $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
  if ($i -ge 0) {
    $msg = $x.Substring($i + 21)
    if ($msg.Contains(' type=NORMAL')) {
      $j = $msg.IndexOf(' part=')
      $rest = $msg.Substring($j + 6)
      $tag = $rest.Substring(0, $rest.IndexOf(' '))
      $k = $msg.IndexOf(' emitSeq=')
      $rq = $msg.Substring($k + 9)
      $sp2 = $rq.IndexOf(' ')
      if ($sp2 -gt 0) { $rq = $rq.Substring(0, $sp2) }
      if ($tag -eq '1/3' -and $msg.Length -gt $mx1) { $mx1 = $msg.Length; $s1 = $rq }
      if ($tag -eq '2/3' -and $msg.Length -gt $mx2) { $mx2 = $msg.Length; $s2 = $rq }
      if ($tag -eq '3/3' -and $msg.Length -gt $mx3) { $mx3 = $msg.Length; $s3 = $rq }
    }
  }
}
echo ('maxmsg-1of3=' + $mx1 + ' seq=' + $s1 + ' margin-vs-439=' + (439 - $mx1) + ' margin-vs-489=' + (489 - $mx1))
echo ('maxmsg-2of3=' + $mx2 + ' seq=' + $s2 + ' margin-vs-372=' + (372 - $mx2) + ' margin-vs-489=' + (489 - $mx2))
echo ('maxmsg-3of3=' + $mx3 + ' seq=' + $s3 + ' margin-vs-448=' + (448 - $mx3) + ' margin-vs-489=' + (489 - $mx3))
echo '--- emitSeq numeric contiguity ---'
$set = @{}
foreach ($x in $L) {
  $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
  if ($i -ge 0) {
    $msg = $x.Substring($i + 21)
    if ($msg.Contains(' type=NORMAL')) {
      $k = $msg.IndexOf(' emitSeq=')
      $rq = $msg.Substring($k + 9)
      $sp2 = $rq.IndexOf(' ')
      if ($sp2 -gt 0) { $rq = $rq.Substring(0, $sp2) }
      $n = [int]$rq
      if (-not $set.ContainsKey($n)) { $set[$n] = 0 }
      $set[$n]++
    }
  }
}
$nums = @($set.Keys | Sort-Object)
echo ('n-distinct=' + $nums.Count + ' min=' + $nums[0] + ' max=' + $nums[$nums.Count - 1])
$miss = 0
for ($n = 1; $n -le 13; $n++) { if (-not $set.ContainsKey($n)) { $miss++; echo ('missing seq=' + $n) } if ($set[$n] -ne 3) { echo ('seq-parts seq=' + $n + ' n=' + $set[$n]) } }
echo ('missing-seq=' + $miss)
echo '--- 537-line family breakdown ---'
$fam = @{}
foreach ($x in $L) {
  if ($x.Length -eq 537) {
    $i = $x.IndexOf('[SRJ')
    $tag = 'NOTAG'
    if ($i -ge 0) {
      $m = $x.Substring($i)
      $sp3 = $m.IndexOf(' ')
      if ($sp3 -gt 0) {
        $sp4 = $m.IndexOf(' ', $sp3 + 1)
        if ($sp4 -gt 0) { $tag = $m.Substring(0, $sp4) } else { $tag = $m }
      }
    }
    if (-not $fam.ContainsKey($tag)) { $fam[$tag] = 0 }
    $fam[$tag]++
  }
}
foreach ($k in ($fam.Keys | Sort-Object)) { echo ($k + '=' + $fam[$k]) }
echo '--- chrono bars min/max ---'
$bb = @()
foreach ($x in $L) {
  $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
  if ($i -ge 0) {
    $msg = $x.Substring($i + 21)
    if ($msg.Contains(' type=NORMAL') -and $msg.Contains(' part=1/3')) {
      $k = $msg.IndexOf(' barTime=')
      $rq = $msg.Substring($k + 9)
      $bb += $rq.Substring(0, $rq.IndexOf(' '))
    }
  }
}
$bs = @($bb | Sort-Object)
echo ('chrono-first=' + $bs[0] + ' chrono-last=' + $bs[$bs.Count - 1] + ' n=' + $bs.Count)
echo '--- A1/A3/A2 SIDE1E + SIDE1X + SLEXT481-S5 from THIS segment ---'
foreach ($bar in @('bar=2026.08.28 16:20', 'bar=2026.09.08 16:40', 'bar=2026.09.04 10:35')) {
  echo ('== ' + $bar + ' ==')
  foreach ($x in $L) {
    if ($x.Contains($bar) -and ($x.Contains('[SRJ-EA] SIDE1E_STOPSHADOW ') -or $x.Contains('[SRJ-EA] SIDE1X_STOPREF '))) {
      $i = $x.IndexOf('[SRJ-EA] ')
      echo $x.Substring($i + 9)
    }
  }
  foreach ($x in $L) {
    if ($x.Contains($bar) -and $x.Contains('[SRJ-EA] SLEXT481 ') -and $x.Contains(' site=S5 ')) {
      $i = $x.IndexOf('[SRJ-EA] ')
      echo $x.Substring($i + 9)
    }
  }
}
