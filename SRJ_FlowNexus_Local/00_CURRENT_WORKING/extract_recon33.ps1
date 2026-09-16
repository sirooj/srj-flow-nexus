# RECON33 extract (mechanical pull, no transcription).
$B = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON33-PROBE_JOURNAL.log'
$E = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON33_EXTRACT.txt'
function pay($p) { Select-String -LiteralPath $B -Pattern $p -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf($p)) } | Sort-Object -Unique }
$out = @()
$out += '## RECON33 EXTRACT (mechanical pull from RECON33-PROBE_JOURNAL.log SHA CF8389DD, no transcription)'
$out += '### TALLY/LIVE/N1/WS161'
$out += pay 'SIDE1G_TALLY'; $out += pay 'SEL61LIVE'; $out += pay 'N1EQUALS'; $out += pay 'WS161_CENSUS'
$out += '### SIDE1P3_SRC (2)'
$out += pay 'SIDE1P3_SRC'
$out += '### SIGNALS (4)'
$out += pay 'ALERT SRJ SIGNAL'
$out += '### SIDE1D_BOTHDIRS S1 row (the reading)'
$out += pay 'SIDE1D_BOTHDIRS' | Where-Object { $_ -match '2026\.09\.08 09:15' }
$out += '### SIDE1D_BOTHDIRS full bar-deduped set'
$out += pay 'SIDE1D_BOTHDIRS'
$out | Set-Content -LiteralPath $E -Encoding utf8
'EXTRACT-DONE'
