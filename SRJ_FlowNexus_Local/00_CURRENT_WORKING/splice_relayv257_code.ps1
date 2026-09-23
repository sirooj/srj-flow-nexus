# Splice relay v257 before-state fence from EA (pair 2). Proposed pairs twin vs packet.
$EA = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v257-EVICT-7.md'
$r = @(Get-Content -LiteralPath $RL)
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',') + ' N=' + $fi.Count
$e = @(Get-Content -LiteralPath $EA)
$b = @($e[8800..8807])
'B=' + $b.Count
$out = @($r[0..$fi[4]] + $b + $r[$fi[5]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
