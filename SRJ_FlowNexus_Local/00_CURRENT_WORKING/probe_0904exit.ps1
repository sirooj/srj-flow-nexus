$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- 9-4 15:55-16:05 FULL EA TRACE ---'
@($L | Where-Object { $_ -match '2026\.09\.04 1[56]:' } | Where-Object { $_ -match '\[SRJ-EA\]' } | Select-Object -First 80)
