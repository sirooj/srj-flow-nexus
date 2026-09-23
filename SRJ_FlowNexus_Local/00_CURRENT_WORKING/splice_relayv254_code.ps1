# Splice relay v254 disk fences from EA (pairs 2-9; proposed 0-1 twin vs packet; rows pair 10 separate).
$EA = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v254-EVICT-4.md'
$r = @(Get-Content -LiteralPath $RL)
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',') + ' N=' + $fi.Count
$e = @(Get-Content -LiteralPath $EA)
$b2 = @($e[8791..8808])
$b3 = @($e[8599..8609])
$b4 = @($e[8628..8629])
$b5 = @($e[8740..8746])
$b6 = @($e[6294..6328])
$b7 = @($e[1722..1727])
$b8 = @($e[10144..10149])
$b9 = @($e[10239..10242])
'B2=' + $b2.Count + ' B3=' + $b3.Count + ' B4=' + $b4.Count + ' B5=' + $b5.Count + ' B6=' + $b6.Count + ' B7=' + $b7.Count + ' B8=' + $b8.Count + ' B9=' + $b9.Count
$out = @($r[0..$fi[4]] + $b2 + $r[$fi[5]..$fi[6]] + $b3 + $r[$fi[7]..$fi[8]] + $b4 + $r[$fi[9]..$fi[10]] + $b5 + $r[$fi[11]..$fi[12]] + $b6 + $r[$fi[13]..$fi[14]] + $b7 + $r[$fi[15]..$fi[16]] + $b8 + $r[$fi[17]..$fi[18]] + $b9 + $r[$fi[19]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
