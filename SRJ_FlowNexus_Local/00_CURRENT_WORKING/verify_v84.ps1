# Verify v84 relay + companion (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V84SEED_WHOLE.md'
$R84 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v84-TEST-TIMEOUT-CLOSEDSET.md'
function scan($f) {
  $t = [System.IO.File]::ReadAllText($f, $utf8)
  $nA = 0
  foreach ($c in $t.ToCharArray()) { if ($c -eq [char]0x00C2) { $nA = $nA + 1 } }
  return @($t, $nA)
}
$rc = scan $R84; $cc = scan $COMP
'R84-ACIRC={0} COMP-ACIRC={1}' -f $rc[1], $cc[1]
'R84-markers={0} COMP-markers={1}' -f $rc[0].Contains('<!--'), $cc[0].Contains('<!--R-')
'R84-fate={0} R84-luna={1} R84-sonnet={2} R84-asks={3} R84-branch={4}' -f $rc[0].Contains('ANCHOR_SUPERSEDE bar=2026.09.08 09:20'), $rc[0].Contains('confirmationCloseValid'), $rc[0].Contains('ABORT_CONFIRM_TIMEOUT'), $rc[0].Contains('Ask 1 (BOTH)'), $rc[0].Contains('QUIESCENT unless HE rules')
'R84-notfound={0}' -f ($rc[0].Contains('NOT-FOUND') -or $cc[0].Contains('NOT-FOUND'))
$EL = [System.IO.File]::ReadAllLines($EA, $utf8)
$CL = [System.IO.File]::ReadAllLines($COMP, $utf8)
$mis = 0; $cnt = 0
foreach ($l in $CL) {
  $p = $l.IndexOf(': ')
  if ($p -le 0) { continue }
  $n = 0
  if (-not [int]::TryParse($l.Substring(0, $p), [ref]$n)) { continue }
  $inO = ($n -ge 7526 -and $n -le 7548)
  $inP = ($n -ge 7396 -and $n -le 7446)
  $inQ = (($n -ge 7366 -and $n -le 7376) -or ($n -ge 7470 -and $n -le 7480) -or ($n -ge 7515 -and $n -le 7523))
  if (-not ($inO -or $inP -or $inQ)) { continue }
  $cnt = $cnt + 1
  if ($l.Substring($p + 2) -cne $EL[$n - 1]) { $mis = $mis + 1 }
}
'O+P+Q={0} MISMATCHES={1}' -f $cnt, $mis
