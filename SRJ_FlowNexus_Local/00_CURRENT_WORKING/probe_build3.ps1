$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- WS161_LOAD ---'
@($L | Where-Object { $_ -match 'WS161_LOAD' })
'--- WS161_CENSUS all ---'
@($L | Where-Object { $_ -match 'WS161_CENSUS' })
'--- MTEXIT all ---'
@($L | Where-Object { $_ -match 'MTEXIT ' })
'--- MTSNAP all ---'
@($L | Where-Object { $_ -match 'MTSNAP ' })
'--- SIGNAL-adjacent fakes check ---'
@($L | Where-Object { $_ -match '2026\.08\.31 11:40|2026\.09\.01 15:50|2026\.09\.02 15:55|2026\.09\.08 15:55' } | Where-Object { $_ -match 'ALERT SRJ SIGNAL' })
'FAKES_ABOVE_COUNT=' + @($L | Where-Object { $_ -match '2026\.08\.31 11:40|2026\.09\.01 15:50|2026\.09\.02 15:55|2026\.09\.08 15:55' } | Where-Object { $_ -match 'ALERT SRJ SIGNAL' }).Count
'--- 9-4 signal chain ---'
@($L | Where-Object { $_ -match '2026\.09\.04 1[56]:' } | Where-Object { $_ -match 'ANCHOR|CONFIRM|SL_REF|S5|ABORT|SIGNAL|LATCH' } | Select-Object -First 30)
'--- CONFIRM_STRUCT_FAIL ---'
'STRUCTFAIL=' + @($L | Where-Object { $_ -match 'CONFIRM_STRUCT_FAIL' }).Count
'--- FRESHCOUNT scope split ---'
'FRESHCOUNT_PRE=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=pre' }).Count
'FRESHCOUNT_POST=' + @($L | Where-Object { $_ -match 'FRESHCOUNT #.*scope=post' }).Count
'--- total lines ---'
'TOTAL=' + $L.Count
