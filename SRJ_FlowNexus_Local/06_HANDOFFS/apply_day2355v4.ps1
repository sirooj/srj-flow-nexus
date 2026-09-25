# S2 apply PACKET_P-DAY2355-1 v4 E1 (single 4-line insert after the mark-hit line; packet-sourced block, byte-verified, fail-closed with restore).
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-DAY2355-1.md'
$bakPath = 'C:\Users\winar\AppData\Local\Temp\opencode\EA_pre_day2355v4.mq5'
$raw = [System.IO.File]::ReadAllBytes($eaPath)
$hasBom = ($raw.Length -ge 3 -and $raw[0] -eq 239 -and $raw[1] -eq 187 -and $raw[2] -eq 191)
'PRE_BOM=' + $hasBom
'PRE_DIGEST=' + ((Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash).Substring(0, 8)
$ea = [System.IO.File]::ReadAllLines($eaPath)
'PRE_COUNT=' + $ea.Count
if ($ea.Count -ne 11502) { 'S2_HALT_PRECOUNT'; exit 1 }
$markIdx = @()
for ($kk = 0; $kk -lt $ea.Count; $kk++) { if ($ea[$kk].Contains('g_mtrade.fillBarTime <= g_news_dayMarks[dc]')) { $markIdx += $kk } }
'MARKHITS=' + $markIdx.Count
if ($markIdx.Count -ne 1) { 'S2_HALT_ANCHOR'; exit 1 }
$at = $markIdx[0]
'MARKLINE=' + ($at + 1)
if (@($ea | Where-Object { $_.Contains('[P-EXITMODEL-2 F3] day-close-minus-5 exit') }).Count -ne 1) { 'S2_HALT_F3'; exit 1 }
if (@($ea | Where-Object { $_.Contains('barTime + PeriodSeconds') }).Count -ne 0) { 'S2_HALT_ALREADY'; exit 1 }
$pkt = [System.IO.File]::ReadAllLines($pktPath)
$newLbl = -1
for ($kk = 0; $kk -lt $pkt.Count; $kk++) { if ($pkt[$kk].Contains('new (insert after the mark-hit line')) { $newLbl = $kk; break } }
'NEWLBL=' + $newLbl
if ($newLbl -lt 0) { 'S2_HALT_PKTLBL'; exit 1 }
$rawBlock = @($pkt[($newLbl + 1)..($newLbl + 4)])
'RAWBLOCK=' + $rawBlock.Count
$block = @()
foreach ($bl in $rawBlock) { if ($bl.StartsWith('`') -and $bl.EndsWith('`')) { $block += $bl.Substring(1, $bl.Length - 2) } else { 'S2_HALT_BT'; exit 1 } }
'BLOCKSTRIP=4'
if (-not $block[0].Contains('[P-DAY2355-1]')) { 'S2_HALT_B0'; exit 1 }
if (-not $block[1].StartsWith('      //---')) { 'S2_HALT_B1'; exit 1 }
if (-not $block[2].StartsWith('      //---')) { 'S2_HALT_B2'; exit 1 }
if (-not $block[3].Contains('PeriodSeconds()) { vDAY = true; break; }')) { 'S2_HALT_B3'; exit 1 }
'BLOCK_OK=3-comments-plus-if'
Copy-Item -LiteralPath $eaPath -Destination $bakPath -Force
'BACKUP_WRITTEN'
$nn = New-Object System.Collections.Generic.List[string]
for ($kk = 0; $kk -le $at; $kk++) { $nn.Add($ea[$kk]) }
foreach ($bb in $block) { $nn.Add($bb) }
for ($kk = $at + 1; $kk -lt $ea.Count; $kk++) { $nn.Add($ea[$kk]) }
'POST_COUNT=' + $nn.Count
if ($nn.Count -ne 11506) { 'S2_HALT_POSTCOUNT'; exit 1 }
if ($nn[$at] -ne $ea[$at]) { 'S2_HALT_ANCHORMOVED'; exit 1 }
$match = 1
for ($jj = 0; $jj -lt 4; $jj++) { if ($nn[$at + 1 + $jj] -ne $block[$jj]) { $match = 0 } }
'INSERT_EXACT=' + $match
if ($match -ne 1) { 'S2_HALT_INSERT'; exit 1 }
if ($nn[$at + 5] -ne $ea[$at + 1]) { 'S2_HALT_NEIGHBOR'; exit 1 }
'NEIGHBOR_OK=close-brace-follows'
if ($hasBom) { $enc = New-Object System.Text.UTF8Encoding($true) } else { $enc = New-Object System.Text.UTF8Encoding($false) }
[System.IO.File]::WriteAllLines($eaPath, $nn.ToArray(), $enc)
'WRITTEN'
$raw2 = [System.IO.File]::ReadAllBytes($eaPath)
$hasBom2 = ($raw2.Length -ge 3 -and $raw2[0] -eq 239 -and $raw2[1] -eq 187 -and $raw2[2] -eq 191)
'POST_BOM=' + $hasBom2
if ($hasBom2 -ne $hasBom) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_BOM'; exit 1 }
$re = [System.IO.File]::ReadAllLines($eaPath)
'RECOUNT=' + $re.Count
if ($re.Count -ne 11506) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_COUNT'; exit 1 }
$markPost = @()
for ($kk = 0; $kk -lt $re.Count; $kk++) { if ($re[$kk].Contains('g_mtrade.fillBarTime <= g_news_dayMarks[dc]')) { $markPost += $kk } }
'MARKPOST=' + ($markPost -join ',')
if ($markPost.Count -ne 2) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_MARK'; exit 1 }
if ($markPost[0] -ne $at) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_MARKPOS'; exit 1 }
if ($markPost[1] -ne ($at + 4)) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_NEWPOS'; exit 1 }
if ($re[$at] -ne $ea[$at]) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_OLDTEXT'; exit 1 }
'MARK_OK=old-retained-plus-new'
if (@($re | Where-Object { $_.Contains('barTime + PeriodSeconds') }).Count -ne 1) { Copy-Item -LiteralPath $bakPath -Destination $eaPath -Force; 'S2_RESTORED_NEW'; exit 1 }
'POST_DIGEST=' + ((Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash).Substring(0, 8)
'S2_DONE_BUDGET_11502_PLUS4'
