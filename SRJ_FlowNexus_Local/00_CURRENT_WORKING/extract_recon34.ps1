# Extract RECON34 shadow rows + signals (mechanical, zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON34-SHADOW_JOURNAL.log'
$EXT = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON34_EXTRACT.txt'
$out = New-Object System.Collections.Generic.List[string]
$rows = Select-String -LiteralPath $ARC -Pattern 'SIDE1H_WOULDPREEMPT' -SimpleMatch
foreach ($hit in $rows) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
$sigs = Select-String -LiteralPath $ARC -Pattern 'ALERT SRJ SIGNAL' -SimpleMatch
foreach ($hit in $sigs) { $ln = $hit.Line; $out.Add($ln.Substring($ln.IndexOf('[SRJ-EA]'))) }
[System.IO.File]::WriteAllLines($EXT, $out.ToArray(), $utf8)
'EXTRACT_LINES=' + $out.Count
