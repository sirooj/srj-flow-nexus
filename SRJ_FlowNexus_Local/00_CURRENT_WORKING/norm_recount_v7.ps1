$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$bt = [char]96
$two = '  ' + $bt
$PL = [IO.File]::ReadAllLines($pktPath)
$heads = @('E1 suppression set', 'E2 FIRE', 'E3 read gate', 'E4 write arm', 'E5 ticket-close', 'E6a vDAY', 'E6b vDAY', 'E7 executor', 'E8a ticket field', 'E8b ticket reset', 'E8c ticket latch')
$hi = @()
foreach ($h in $heads) { for ($i = 0; $i -lt $PL.Count; $i++) { if ($PL[$i].StartsWith('- ' + $h)) { $hi += $i; break } } }
echo "headers=$($hi.Count)"
$spanEnd = $PL.Count
for ($j = 0; $j -lt $PL.Count; $j++) { if ($PL[$j].StartsWith('- Named residuals')) { $spanEnd = $j; break } }
$fixed = 0
for ($k = 0; $k -lt $hi.Count; $k++) {
  $s = $hi[$k]
  $e = $spanEnd
  if ($k + 1 -lt $hi.Count) { $e = $hi[$k + 1] }
  $ni = -1
  for ($j = $s; $j -lt $e; $j++) { $t = $PL[$j].Trim(); if ($t -eq 'new:' -or $t.StartsWith('new (')) { $ni = $j } }
  for ($j = $ni + 1; $j -lt $e; $j++) {
    if ($PL[$j].StartsWith($two)) { $PL[$j] = $PL[$j].Substring(2); $fixed++ }
  }
}
[IO.File]::WriteAllLines($pktPath, $PL)
echo "normalized=$fixed"
echo '---audit---'
$QL = [IO.File]::ReadAllLines($pktPath)
$flags = 0
for ($k = 0; $k -lt $hi.Count; $k++) {
  $s = $hi[$k]
  $e = $spanEnd
  if ($k + 1 -lt $hi.Count) { $e = $hi[$k + 1] }
  $oi = -1; $ni = -1
  for ($j = $s; $j -lt $e; $j++) { $t = $QL[$j].Trim(); if ($t -eq 'old:' -or $t.StartsWith('old (')) { $oi = $j }; if ($t -eq 'new:' -or $t.StartsWith('new (')) { $ni = $j } }
  for ($j = $oi + 1; $j -lt $ni; $j++) { if (-not $QL[$j].StartsWith($two) -and $QL[$j].TrimStart().StartsWith($bt)) { echo "OLD-SPAN-FLAG $($heads[$k]) line $($j+1)"; $flags++ } }
  for ($j = $ni + 1; $j -lt $e; $j++) { if ($QL[$j].StartsWith($two)) { echo "NEW-SPAN-FLAG $($heads[$k]) line $($j+1)"; $flags++ } }
}
echo "flags=$flags"
echo '---recount---'
$tot = 0
for ($k = 0; $k -lt $hi.Count; $k++) {
  $s = $hi[$k]
  $e = $spanEnd
  if ($k + 1 -lt $hi.Count) { $e = $hi[$k + 1] }
  $oi = -1; $ni = -1
  for ($j = $s; $j -lt $e; $j++) { $t = $QL[$j].Trim(); if ($t -eq 'old:' -or $t.StartsWith('old (')) { $oi = $j }; if ($t -eq 'new:' -or $t.StartsWith('new (')) { $ni = $j } }
  $oc = 0; for ($j = $oi + 1; $j -lt $ni; $j++) { if ($QL[$j].TrimStart().StartsWith($bt)) { $oc++ } }
  $nc = 0; for ($j = $ni + 1; $j -lt $e; $j++) { if ($QL[$j].TrimStart().StartsWith($bt)) { $nc++ } }
  $net = $nc - $oc; $tot += $net
  echo "$($heads[$k]): old=$oc new=$nc net=$net"
}
echo "TOTAL=$tot POST=$((11330 + $tot))"
echo '---E7old-bytes---'
$EL = [IO.File]::ReadAllLines($eaPath)
$mis = 0; $r = 0
$oldRows = @('    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",', '                TimeToString(barTime, TIME_DATE|TIME_MINUTES),', '                MtExitName(g_mtrade.exitReason),', '                (vBREAK ? breakLineName : "-"),', '                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),', '                DoubleToString(g_mtrade.entryPrice, _Digits),', '                DoubleToString(g_mtrade.exitPrice, _Digits));', '    if(InpDebugLog) MtLifeEmit();')
foreach ($orow in $oldRows) { if ($orow -cne $EL[11293 + $r]) { echo "MISMATCH row $r"; $mis++ }; $r++ }
echo "E7old mismatch=$mis"
echo '---packet identity---'
echo "digest=$((Get-FileHash -LiteralPath $pktPath -Algorithm SHA256).Hash)"
echo "bytes=$((Get-Item -LiteralPath $pktPath).Length)"
$pt = [IO.File]::ReadAllText($pktPath)
echo "lines=$(($pt.Split(@([char]10), [StringSplitOptions]::None).Count - 1))"
echo "ellipsis=$(($pt.Split(@('...'), [StringSplitOptions]::None).Count - 1))"
