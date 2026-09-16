# Verify v81 relay + companion (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V81DET_WHOLE.md'
$R81 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v81-DE-COMPLETE.md'
function scan($f) {
  $t = [System.IO.File]::ReadAllText($f, $utf8)
  $nA = 0
  foreach ($c in $t.ToCharArray()) { if ($c -eq [char]0x00C2) { $nA = $nA + 1 } }
  return @($t, $nA)
}
$rc = scan $R81; $cc = scan $COMP
'R81-ACIRC={0} COMP-ACIRC={1}' -f $rc[1], $cc[1]
'R81-markers={0} COMP-markers={1}' -f $rc[0].Contains('<!--'), $cc[0].Contains('<!--R-')
'R81-closedset={0} R81-clear={1} R81-branch={2}' -f $rc[0].Contains('Closed set (probe-vs-direct'), $rc[0].Contains('CLEAR-ON-SIGHT'), $rc[0].Contains('QUIESCENT unless HE rules')
$EL = [System.IO.File]::ReadAllLines($EA, $utf8)
$CL = [System.IO.File]::ReadAllLines($COMP, $utf8)
$mis = 0; $cntH = 0; $cntI = 0; $cntJ = 0; $cntK = 0
foreach ($l in $CL) {
  $p = $l.IndexOf(': ')
  if ($p -le 0) { continue }
  $n = 0
  if (-not [int]::TryParse($l.Substring(0, $p), [ref]$n)) { continue }
  $inH = ($n -ge 1894 -and $n -le 1948)
  $inI = ($n -ge 91 -and $n -le 105)
  $inJ = ($n -ge 6165 -and $n -le 6192)
  $inK = ($n -ge 6698 -and $n -le 6710)
  if (-not ($inH -or $inI -or $inJ -or $inK)) { continue }
  if ($inH) { $cntH = $cntH + 1 }
  if ($inI) { $cntI = $cntI + 1 }
  if ($inJ) { $cntJ = $cntJ + 1 }
  if ($inK) { $cntK = $cntK + 1 }
  if ($l.Substring($p + 2) -cne $EL[$n - 1]) { $mis = $mis + 1 }
}
'H={0} I={1} J={2} K={3} TOTAL={4} MISMATCHES={5}' -f $cntH, $cntI, $cntJ, $cntK, ($cntH + $cntI + $cntJ + $cntK), $mis
