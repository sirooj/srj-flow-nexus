# Set tester window Fri 9/4 -> Mon 9/8 for RECON61-DAY2355-V4 (mechanical line replacement in [Tester] only; fail-closed with restore).
$ti = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\config\terminal.ini'
$bak = 'C:\Users\winar\AppData\Local\Temp\opencode\terminal_pre_day2355v4.ini'
$raw = [System.IO.File]::ReadAllBytes($ti)
$hasBom = ($raw.Length -ge 3 -and $raw[0] -eq 239 -and $raw[1] -eq 187 -and $raw[2] -eq 191)
'PRE_BOM=' + $hasBom
'PRE_DIGEST=' + ((Get-FileHash -LiteralPath $ti -Algorithm SHA256).Hash).Substring(0, 8)
$tx = [System.IO.File]::ReadAllLines($ti)
'PRE_COUNT=' + $tx.Count
if ($tx[418] -ne 'DateFrom=1787702400') { 'INI_HALT_FROM'; exit 1 }
if ($tx[419] -ne 'DateTo=1788998400') { 'INI_HALT_TO'; exit 1 }
if ($tx[406] -ne '[Tester]') { 'INI_HALT_SECT'; exit 1 }
'ANCHOR_OK=tester-pair-419-420'
$newFrom = 1787702400 + 9 * 86400
$newTo = $newFrom + 4 * 86400
'NEWFROM=' + $newFrom + ' NEWTO=' + $newTo
if ($newFrom -ne 1788480000) { 'INI_HALT_ARITH1'; exit 1 }
if ($newTo -ne 1788825600) { 'INI_HALT_ARITH2'; exit 1 }
Copy-Item -LiteralPath $ti -Destination $bak -Force
'BACKUP_WRITTEN'
$tx[418] = 'DateFrom=' + $newFrom
$tx[419] = 'DateTo=' + $newTo
if ($hasBom) { $enc = New-Object System.Text.UTF8Encoding($true) } else { $enc = New-Object System.Text.UTF8Encoding($false) }
[System.IO.File]::WriteAllLines($ti, $tx, $enc)
'WRITTEN'
$re = [System.IO.File]::ReadAllLines($ti)
if ($re[418] -ne 'DateFrom=1788480000') { Copy-Item -LiteralPath $bak -Destination $ti -Force; 'INI_RESTORED_FROM'; exit 1 }
if ($re[419] -ne 'DateTo=1788825600') { Copy-Item -LiteralPath $bak -Destination $ti -Force; 'INI_RESTORED_TO'; exit 1 }
if (@($re | Where-Object { $_ -eq 'DateFrom=1777420800' }).Count -ne 1) { Copy-Item -LiteralPath $bak -Destination $ti -Force; 'INI_RESTORED_TICK'; exit 1 }
if (@($re | Where-Object { $_ -eq 'DateTo=1780358400' }).Count -ne 1) { Copy-Item -LiteralPath $bak -Destination $ti -Force; 'INI_RESTORED_TICK2'; exit 1 }
$raw2 = [System.IO.File]::ReadAllBytes($ti)
$hasBom2 = ($raw2.Length -ge 3 -and $raw2[0] -eq 239 -and $raw2[1] -eq 187 -and $raw2[2] -eq 191)
'POST_BOM=' + $hasBom2
if ($hasBom2 -ne $hasBom) { Copy-Item -LiteralPath $bak -Destination $ti -Force; 'INI_RESTORED_BOM'; exit 1 }
'POST_DIGEST=' + ((Get-FileHash -LiteralPath $ti -Algorithm SHA256).Hash).Substring(0, 8)
'INI_DONE_WINDOW_FRI0904_MON0908'
