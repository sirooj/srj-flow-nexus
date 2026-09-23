# Splice relay v253 disk fences from EA (pairs 2-5; proposed pairs 0-1 twin vs packet instead).
$EA = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v253-EVICT-3.md'
$r = @(Get-Content -LiteralPath $RL)
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',') + ' N=' + $fi.Count
$e = @(Get-Content -LiteralPath $EA)
$b3 = @($e[8791..8808])
$b4 = @($e[8628..8629])
$b5 = @($e[8740..8746])
$b6 = @($e[1722..1728])
'B3=' + $b3.Count + ' B4=' + $b4.Count + ' B5=' + $b5.Count + ' B6=' + $b6.Count
$out = @($r[0..$fi[4]] + $b3 + $r[$fi[5]..$fi[6]] + $b4 + $r[$fi[7]..$fi[8]] + $b5 + $r[$fi[9]..$fi[10]] + $b6 + $r[$fi[11]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
