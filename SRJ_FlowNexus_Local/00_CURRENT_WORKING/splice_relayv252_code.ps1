# Splice relay v252 disk-code fences from EA (hand transcription drifts; splice is the cure). Proposed fences (E1-after, E2-after) are NOT spliced - they twin against the packet instead.
$EA = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v252-EVICT-2.md'
$r = @(Get-Content -LiteralPath $RL)
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',') + ' N=' + $fi.Count
$e = @(Get-Content -LiteralPath $EA)
$g_go = @($e[6294..6328])
$g_re = @($e[6265..6292])
$g_se = @($e[1801..1816])
$g_q3 = @($e[7507..7519])
'GO=' + $g_go.Count + ' RE=' + $g_re.Count + ' SE=' + $g_se.Count + ' Q3=' + $g_q3.Count
$out = @($r[0..$fi[4]] + $g_go + $r[$fi[5]..$fi[6]] + $g_re + $r[$fi[7]..$fi[8]] + $g_se + $r[$fi[9]..$fi[10]] + $g_q3 + $r[$fi[11]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
