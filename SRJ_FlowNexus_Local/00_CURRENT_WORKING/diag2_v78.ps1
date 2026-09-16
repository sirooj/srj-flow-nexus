# Byte-level integrity: em-dash presence vs mojibake marker in relay appendix.
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$raw = [System.IO.File]::ReadAllText($R78, $utf8)
$nDash = 0; $nAcirc = 0
foreach ($c in $raw.ToCharArray()) {
  if ($c -eq [char]0x2014) { $nDash = $nDash + 1 }
  if ($c -eq [char]0x00C2) { $nAcirc = $nAcirc + 1 }
}
'EMDASH-U2014={0} ACIRC-U00C2={1}' -f $nDash, $nAcirc
'Zero-LONG(found-case-insensitive)={0}' -f ($raw.ToLower().Contains('zero long counterexamples'))
