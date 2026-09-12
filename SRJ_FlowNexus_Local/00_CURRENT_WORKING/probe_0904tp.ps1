$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- 16:00 SIGNAL + TP lines ---'
@($L | Where-Object { $_ -match '2026\.09\.04 16:00' } | Where-Object { $_ -match 'SIGNAL|TP_ELECT|TPCENSUS|SWING|SL_REF|S5' })
'--- EXIT lines for this trade ---'
@($L | Where-Object { $_ -match 'MTSNAP bar=2026\.09\.04 15:55|MTEXIT bar=2026\.09\.04 16:00|EXITVERDICT.*2026\.09\.04 16:00' })
'--- ALL TPCENSUS 15:55-16:05 ---'
@($L | Where-Object { $_ -match 'TPCENSUS #.*bar=2026\.09\.04 1[56]:' })
