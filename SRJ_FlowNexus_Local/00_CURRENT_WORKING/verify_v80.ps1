# Verify v80 relay + companion (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V80DE_WHOLE.md'
$R80 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v80-DE-EVIDENCE.md'
function scan($f) {
  $t = [System.IO.File]::ReadAllText($f, $utf8)
  $nA = 0
  foreach ($c in $t.ToCharArray()) { if ($c -eq [char]0x00C2) { $nA = $nA + 1 } }
  return @($t, $nA)
}
$rc = scan $R80; $cc = scan $COMP
'R80-ACIRC={0} COMP-ACIRC={1}' -f $rc[1], $cc[1]
'R80-markers={0} COMP-markers={1}' -f ($rc[0].Contains('<!--BRIEF-->')), ($cc[0].Contains('<!--R-'))
'R80-brief={0} R80-asks={1} R80-branch={2}' -f $rc[0].Contains('Stage-E opening evidence'), $rc[0].Contains('Ask 1 (BOTH)'), $rc[0].Contains('QUIESCENT unless HE rules')
$EL = [System.IO.File]::ReadAllLines($EA, $utf8)
$CL = [System.IO.File]::ReadAllLines($COMP, $utf8)
$mis = 0; $tot = 0
foreach ($l in $CL) {
  if ($l.Length -gt 6 -and $l[0] -ge [char]48 -and $l[0] -le [char]57 -and $l.Contains(': ')) {
    $p = $l.IndexOf(': ')
    $ns = $l.Substring(0, $p)
    $n = 0
    if ([int]::TryParse($ns, [ref]$n)) {
      if ($n -ge 8428 -and $n -le 8459) { $tot = $tot + 1; if ($l.Substring($p + 2) -cne $EL[$n - 1]) { $mis = $mis + 1 } }
      if ($n -ge 9389 -and $n -le 9461) { $tot = $tot + 1; if ($l.Substring($p + 2) -cne $EL[$n - 1]) { $mis = $mis + 1 } }
    }
  }
}
'COMP-NUMBERED={0} MISMATCHES={1}' -f $tot, $mis
