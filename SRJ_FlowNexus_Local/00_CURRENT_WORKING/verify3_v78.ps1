# Final appendix verification (pure .NET UTF-8, read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$raw = [System.IO.File]::ReadAllText($R78, $utf8)
$nA = 0; $nD = 0
foreach ($c in $raw.ToCharArray()) {
  if ($c -eq [char]0x00C2) { $nA = $nA + 1 }
  if ($c -eq [char]0x2014) { $nD = $nD + 1 }
}
'ACIRC={0} EMDASH={1}' -f $nA, $nD
'NOTFOUND={0}' -f $raw.Contains('SECTION-NOT-FOUND')
'has-table56={0}' -f ((($raw.Split("`n") | Where-Object { $_.Contains('SIDE1C_BOTHDIRS bar=') }).Count) -eq 56)
'has-sonnetB={0}' -f $raw.Contains('My answer is (B)')
'has-lunaA={0}' -f $raw.Contains('I rule for (A)')
'has-pkts3={0}' -f $raw.Contains('corpus stability')
'has-asks={0}' -f $raw.Contains('Ask 1 (LUNA)')
'has-branches={0}' -f $raw.Contains('QUIESCENT unless HE rules')
