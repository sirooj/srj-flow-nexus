# Fill v77 markers mechanically from disk (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$PKT = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
$R77 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v77-C1-CLOSEDSET.md'
$utf8 = [System.Text.Encoding]::UTF8
$rt = [System.IO.File]::ReadAllText($R77, $utf8)
$pktText = [System.IO.File]::ReadAllText($PKT, $utf8).Trim()
$rt = $rt.Replace("<!--PACKET-TEXT-->", $pktText)
$vs = Select-String -LiteralPath $ARC -Pattern "SIDE1C_BOTHDIRS" -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf("SIDE1C_BOTHDIRS")) } | Where-Object { $_ -match "longTerm=B_BODY" } | Sort-Object
$rt = $rt.Replace("<!--VOID-SET-->", ($vs -join "`r`n"))
[System.IO.File]::WriteAllText($R77, $rt, $utf8)
'markers-left={0}' -f ((Select-String -LiteralPath $R77 -Pattern "<!--(PACKET-TEXT|VOID-SET)-->" | Measure-Object).Count)
'void-in-relay={0}' -f ((Select-String -LiteralPath $R77 -Pattern "longTerm=B_BODY" | Measure-Object).Count)
'pkt-sha-now={0}' -f (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
