$seg='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON3-BUILD3_JOURNAL.log'
$L = Get-Content -LiteralPath $seg
'BARS_S2POLL_SWINGPICK=' + @($L | Where-Object { $_ -match 'SWINGPICK site=S2POLL' }).Count
'BARS_SLREF_S2POLL=' + @($L | Where-Object { $_ -match 'SL_REF branch=.* site=S2POLL' }).Count
'DIFF=' + ($a - $b)
'DONE'
