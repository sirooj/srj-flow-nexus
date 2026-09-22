$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON47-EXT1LIVE-V1_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
$pay = @()
foreach ($x in $L) { $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE '); if ($i -ge 0) { $pay += $x.Substring($i + 21) } }
echo "stopresolve-payloads=$($pay.Count)"
$norm = @(); $schema = ''
foreach ($x in $pay) {
  if ($x.Contains('type=SCHEMA')) { $schema = $x }
  if ($x.Contains(' type=NORMAL')) { $norm += $x }
}
echo "normal=$($norm.Count)"
$keys38 = @('barTime','dir','entryPx','tpPx','incomingSlRef','liveSel','slLive','pxExt1','ext1Defined','ext1Imb','rLive','rExt1','gateConst','wouldGate','vetoStateAtSite','sessionUseAtSite','ext1Slot','ext1BarTime','s0slot','s0imb','s1slot','s1imb','ladOriginPx','ladOriginBarTime','ladOriginSite','extSideOk','extDistPts','rawNumLive','rawDenLive','rawNumExt1','rawDenExt1','wouldAdopt_monotone','actualGate','emitSeq','currentPrice','s0px','s1px','ladOriginStamp')
$sn = $schema.Substring($schema.IndexOf('names=') + 6).Split(@(','), [System.StringSplitOptions]::None)
$sok = 1
if ($sn.Count -ne 38) { $sok = 0 }
for ($k = 0; $k -lt 38; $k++) { if ($sn[$k] -cne $keys38[$k]) { $sok = 0; echo ("schema-mismatch pos" + $k) } }
echo "schema-38-ordered-ok=$sok"
$maxp = 0
foreach ($x in $norm) { if ($x.Length -gt $maxp) { $maxp = $x.Length } }
echo "max-normal-payload=$maxp"
$pref = 0; $q = 0; $w0ok = 0; $w0bad = 0; $r1ok = 0; $r1bad = 0
$dirs = @{}; $bars = @()
foreach ($x in $norm) {
  $toks = $x.Split(@(' '), [System.StringSplitOptions]::RemoveEmptyEntries)
  $d = @{}
  foreach ($t in $toks) { $e = $t.IndexOf('='); if ($e -gt 0) { $d[$t.Substring(0, $e)] = $t.Substring($e + 1) } }
  if ($d.Count -ge 23) { $pref++ }
  $badk = 0
  foreach ($kk in $d.Keys) {
    $ki = [System.Array]::IndexOf($keys38, $kk)
    if ($ki -lt 0 -or $ki -gt 22) { $badk++ }
  }
  if ($badk -eq 0) { $q++ }
  if ($d.ContainsKey('dir')) { if (-not $dirs.ContainsKey($d['dir'])) { $dirs[$d['dir']] = 0 }; $dirs[$d['dir']]++ }
  if ($d.ContainsKey('barTime')) { $bars += $d['barTime'] }
  if ($d.ContainsKey('rExt1') -and $d.ContainsKey('wouldGate')) {
    $rv = 0; $okp = [double]::TryParse($d['rExt1'], [ref]$rv)
    if ($okp -and $rv -ge 1.0 -and $d['wouldGate'] -eq '1') { $w0ok++ }
    elseif ($okp -and $rv -lt 1.0 -and $d['wouldGate'] -eq '0') { $w0ok++ }
    else { $w0bad++; echo ("GATE-SIGN row " + $d['barTime'] + " rExt1=" + $d['rExt1'] + " wouldGate=" + $d['wouldGate']) }
  }
  if ($d.ContainsKey('rExt1') -and $d.ContainsKey('rawNumExt1') -and $d.ContainsKey('rawDenExt1')) { $r1ok++ }
}
echo "rows-with-23-prefix-fields=$pref rows-clean-prefix-keys=$q"
echo ("dir-values=" + (($dirs.Keys | Sort-Object) -join ','))
echo "wouldgate-sign-consistent=$w0ok inconsistent=$w0bad"
echo "bars-first=$($bars[0]) bars-last=$($bars[$bars.Count-1]) bars-n=$($bars.Count)"
$qm = 0; $iv = 0
foreach ($x in $norm) {
  if ($x -match '(^| )[^ =]+=\?( |$)') { $qm++ }
  if ($x.Contains('INVALID')) { $iv++ }
}
echo "qmark=$qm invalid-present-region=$iv"
$se = 0; $sx = 0; $sl = 0
foreach ($x in $L) {
  if ($x.Contains('[SRJ-EA] SIDE1E_STOPSHADOW ')) { $se++ }
  if ($x.Contains('[SRJ-EA] SIDE1X_STOPREF ')) { $sx++ }
  if ($x.Contains('[SRJ-EA] SLEXT481 ') -and $x.Contains(' site=S5 ')) { $sl++ }
}
echo "side1e=$se side1x=$sx slext-s5=$sl"
function ShowBar($bar) {
  foreach ($x in $norm) { if ($x.Contains('barTime=' + $bar)) { echo $x; return } }
  echo ("BAR-NOT-FOUND " + $bar)
}
echo '--- A1 2026.08.28-16:20 ---'
ShowBar '2026.08.28-16:20'
echo '--- A3 2026.09.08-16:40 ---'
ShowBar '2026.09.08-16:40'
echo '--- A2 2026.09.04-10:35 ---'
ShowBar '2026.09.04-10:35'
