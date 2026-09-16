# Verify v82 relay + companion (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V82RESET_WHOLE.md'
$R82 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v82-PROBEIMPL-CLEAR.md'
function scan($f) {
  $t = [System.IO.File]::ReadAllText($f, $utf8)
  $nA = 0
  foreach ($c in $t.ToCharArray()) { if ($c -eq [char]0x00C2) { $nA = $nA + 1 } }
  return @($t, $nA)
}
$rc = scan $R82; $cc = scan $COMP
'R82-ACIRC={0} COMP-ACIRC={1}' -f $rc[1], $cc[1]
'R82-markers={0} COMP-markers={1}' -f $rc[0].Contains('<!--'), $cc[0].Contains('<!--R-')
'R82-closedset={0} R82-clear={1} R82-branch={2}' -f $rc[0].Contains('ADOPT the probe implementation'), $rc[0].Contains('CLEAR-ON-SIGHT'), $rc[0].Contains('QUIESCENT unless HE rules')
$EL = [System.IO.File]::ReadAllLines($EA, $utf8)
$CL = [System.IO.File]::ReadAllLines($COMP, $utf8)
$mis = 0; $cntL = 0; $cntM = 0; $cntN = 0
foreach ($l in $CL) {
  $p = $l.IndexOf(': ')
  if ($p -le 0) { continue }
  $n = 0
  if (-not [int]::TryParse($l.Substring(0, $p), [ref]$n)) { continue }
  $hit = $false
  if ($n -ge 6194 -and $n -le 6228) { $cntL = $cntL + 1; $hit = $true }
  if ($n -ge 9561 -and $n -le 9568) { $cntM = $cntM + 1; $hit = $true }
  if ($n -ge 9649 -and $n -le 9654) { $cntM = $cntM + 1; $hit = $true }
  if ($n -ge 7144 -and $n -le 7177) { $cntN = $cntN + 1; $hit = $true }
  if (-not $hit) { continue }
  if ($l.Substring($p + 2) -cne $EL[$n - 1]) { $mis = $mis + 1 }
}
'L={0} M={1} N={2} TOTAL={3} MISMATCHES={4}' -f $cntL, $cntM, $cntN, ($cntL + $cntM + $cntN), $mis
