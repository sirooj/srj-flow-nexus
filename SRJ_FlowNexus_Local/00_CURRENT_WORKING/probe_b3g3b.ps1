$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- 09-08 09:20 LIFETIME ---'
@($L | Where-Object { $_ -match '2026\.09\.08 09:(2[05]|3[05]|4[05])' } | Where-Object { $_ -match 'ANCHOR|STATE|ABORT|SIGNAL|CONFIRM_PREBIND|HEADS' } | Select-Object -First 25)
'--- 09-08 14:45 LIFETIME ---'
@($L | Where-Object { $_ -match '2026\.09\.08 1[45]:' } | Where-Object { $_ -match 'ANCHOR|STATE|ABORT|SIGNAL|CONFIRM_PREBIND|HEADS' } | Select-Object -First 30)
