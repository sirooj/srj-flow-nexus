$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- FAKE DATE CHECK ---'
'FAKE_SIGNALS=' + @($L | Where-Object { $_ -match '2026\.08\.31 11:40|2026\.09\.01 15:50|2026\.09\.02 15:55|2026\.09\.08 15:55' } | Where-Object { $_ -match 'ALERT SRJ SIGNAL' }).Count
'--- WS161 full ---'
@($L | Where-Object { $_ -match 'WS161_CENSUS' })
@($L | Where-Object { $_ -match 'WS161_LOAD' })
'MISM=' + @($L | Where-Object { $_ -match 'WS161_MISMATCH' }).Count
'FIELD=' + @($L | Where-Object { $_ -match 'WS161_FIELD' }).Count
'--- FROM-TO tier inversion check ---'
@($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' } | ForEach-Object { if($_ -match 'from=(\S+) rank=(\d+) tier=(\d+) to=(\S+) rank=(\d+) tier=(\d+)'){ if([int]$Matches[3] -le [int]$Matches[6]){ $_ } } })
'INVERSION_ABOVE_COUNT done'
'--- STRUCTFAIL ---'
'STRUCTFAIL=' + @($L | Where-Object { $_ -match 'CONFIRM_STRUCT_FAIL' }).Count
'--- FRESHCOUNT scope ---'
'FRESH_PRE=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=pre' }).Count
'FRESH_POST=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=post' }).Count
'--- PROMO identity ---'
@($L | Where-Object { $_ -match 'XOB-PROMOCENSUS t=2026\.09\.04 15' })
