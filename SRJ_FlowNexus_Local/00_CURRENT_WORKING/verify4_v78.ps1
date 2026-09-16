# Post-rev3 check (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$raw = [System.IO.File]::ReadAllText($R78, $utf8)
$nA = 0
foreach ($c in $raw.ToCharArray()) { if ($c -eq [char]0x00C2) { $nA = $nA + 1 } }
'ACIRC={0}' -f $nA
'DUALROUTED={0}' -f $raw.Contains('DUAL-ROUTED')
'ASK1BOTH={0}' -f $raw.Contains('Ask 1 (BOTH')
'SINGLESTREAM={0}' -f $raw.Contains('Single-stream return')
'TABLE56={0}' -f ((($raw.Split("`n") | Where-Object { $_.Contains('SIDE1C_BOTHDIRS bar=') }).Count) -eq 56)
'ASK3={0} BRANCH={1}' -f $raw.Contains('CLEAR-ON-SIGHT'), $raw.Contains('v79 clearance relay')
