# Splice relay v251 fence-2 from disk (hand-transcribed indent drifted; splice-from-disk is the banked cure).
$EA = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$RL = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v251-EVICT-1.md'
$disk = @(Get-Content -LiteralPath $EA)[8755..8808]
'DISK-N=' + $disk.Count
'DISK-EMPTY=' + @($disk | Where-Object { $_.Length -eq 0 }).Count
$r = @(Get-Content -LiteralPath $RL)
$fi = @()
for ($k = 0; $k -lt $r.Count; $k++) { if ($r[$k] -eq '```') { $fi += $k } }
'FENCES=' + ($fi -join ',')
$out = @($r[0..$fi[2]] + $disk + $r[$fi[3]..($r.Count - 1)])
'OUT-N=' + $out.Count
$out | Set-Content -LiteralPath $RL
'WROTE=1'
