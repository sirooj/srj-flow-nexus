# Diagnose packet §-mark bytes + relay core-sample integrity (read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$PKP = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
$pb = [System.IO.File]::ReadAllBytes($PKP)
$hasBom = ($pb[0] -eq 239 -and $pb[1] -eq 187 -and $pb[2] -eq 191)
'PKT-BYTES={0} BOM={1}' -f $pb.Length, $hasBom
$g = $utf8.GetString($pb)
$i = $g.IndexOf('4. Type-(ii)')
'PKT-CTX-OK={0}' -f ($g.Substring($i - 8, 6) -ceq ('## ' + [char]0xA7))
$raw = [System.IO.File]::ReadAllText($R78, $utf8)
$k = $raw.IndexOf('direction-keyed carve-out')
'RELAY-CORE-FOUND={0}' -f ($k -ge 0)
$j = $raw.IndexOf('zero LONG counterexamples')
'RELAY-ZERO-FOUND={0}' -f ($j -ge 0)
