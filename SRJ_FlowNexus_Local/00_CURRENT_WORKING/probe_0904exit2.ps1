$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- 16:00 EXIT full block ---'
@($L | Where-Object { $_ -match '2026\.09\.04 16:0[05]' } | Where-Object { $_ -match 'EXITVERDICT|MTEXIT|MTSNAP|EXITCENSUS|TP_TOUCH|HTF' })
'--- TP lines: every LOH/PMH/NYH mention near 16:00 ---'
@($L | Where-Object { $_ -match '2026\.09\.04 16:00' } | Where-Object { $_ -match 'LOH|PMH|NYH|winner=|best=' })
'--- EXITVERDICT for this trade: all bars ---'
@($L | Where-Object { $_ -match 'EXITVERDICT.*entry=1\.16018' })
'--- all MTEXIT in run ---'
@($L | Where-Object { $_ -match 'MTEXIT ' })
