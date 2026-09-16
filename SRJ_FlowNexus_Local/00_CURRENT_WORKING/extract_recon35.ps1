# Extract + tabulate RECON35 (mechanical, zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35-LIVE_JOURNAL.log'
$EXT = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON35_EXTRACT.txt'
$out = New-Object System.Collections.Generic.List[string]
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SIDE1C_PREEMPT' -SimpleMatch)) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLNONFIRE fields=11 bar=2026.09.08' -SimpleMatch)) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'SLEXT1 fields=29 bar=2026.09.08' -SimpleMatch)) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
foreach ($hit in (Select-String -LiteralPath $A -Pattern 'ALERT SRJ' -SimpleMatch | Where-Object { $_.Line -match '2026\.09\.08' })) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
[System.IO.File]::WriteAllLines($EXT, $out.ToArray(), $utf8)
'EXTRACT_LINES=' + $out.Count
