$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- ALL ANCHOR_SUPERSEDE ---'
@($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' })
'--- DIRECTION CHECK ---'
'BAD_OPPDIR=' + @($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' } | Where-Object { $_ -match 'from=.*dir=SHORT.*to=.*dir=LONG|from=.*dir=LONG.*to=.*dir=SHORT' }).Count
'--- TIER CHECK: from-tier numerically LOWER (better) than to-tier ---'
@($L | Where-Object { $_ -match 'ANCHOR_SUPERSEDE' } | Where-Object { $_ -match 'from=\S+ rank=\d+ tier=(\d+) to=\S+ rank=\d+ tier=(\d+)' } | ForEach-Object { if($_ -match 'from=(\S+) rank=(\d+) tier=(\d+) to=(\S+) rank=(\d+) tier=(\d+) dir=(\w+)'){ $ft=[int]$Matches[3]; $tt=[int]$Matches[6]; if($ft -le $tt){ $_ } } })
'--- 08-31 LIFETIME ---'
@($L | Where-Object { $_ -match '2026\.08\.31 1[45]:' } | Where-Object { $_ -match 'ANCHOR|STATE IDLE|ABORT|SIGNAL|CONFIRM' } | Select-Object -First 20)
'--- 09-01 LIFETIME ---'
@($L | Where-Object { $_ -match '2026\.09\.01 09:[12]' } | Where-Object { $_ -match 'ANCHOR|STATE IDLE|ABORT|SIGNAL|CONFIRM' } | Select-Object -First 20)
'--- SUPPRESSED opp0 higher1 survivor lines ---'
@($L | Where-Object { $_ -match 'SUPPRESSED .*opp=0 higher=1' })
