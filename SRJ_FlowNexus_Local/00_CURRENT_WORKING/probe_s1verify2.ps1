$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'--- S2POLL block entries: SWINGPICK vs SL_REF per bar ---'
$sw=@($L | Where-Object { $_ -match 'SWINGPICK site=S2POLL' })
$ok=@($L | Where-Object { $_ -match 'SL_REF branch=.* site=S2POLL' })
'SWINGPICK_S2POLL=' + $sw.Count
'SLREF_S2POLL_OK=' + $ok.Count
'DIFF(calls-success)=' + ($sw.Count - $ok.Count)
'--- bars where SWINGPICK fired but no SL_REF on same eval bar ---'
$swBars=@($sw | ForEach-Object { if($_ -match '(\d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2})\s+\[SRJ-EA\] SWINGPICK site=S2POLL'){ $Matches[1] } })
$okBars=@($ok | ForEach-Object { if($_ -match '(\d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2})\s+\[SRJ-EA\] SL_REF'){ $Matches[1] } })
$missing=@($swBars | Where-Object { $okBars -notcontains $_ })
'MISSING_BARS=' + $missing.Count
$missing | Select-Object -First 10
'--- S3INPLAY lines on missing bars (LONG/SHORT split) ---'
foreach($b in ($missing | Select-Object -First 10)){ @($L | Where-Object { $_ -match ([regex]::Escape($b)) } | Where-Object { $_ -match 'S3INPLAY|ZONEADOPT|STATE.*S4' } | Select-Object -First 2) }
