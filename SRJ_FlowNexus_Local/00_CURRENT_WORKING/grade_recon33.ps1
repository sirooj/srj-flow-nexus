# RECON33 probe-content grade (read-only).
$B = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON33-PROBE_JOURNAL.log'
$rows = Select-String -LiteralPath $B -Pattern 'SIDE1D_BOTHDIRS' -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf('SIDE1D_BOTHDIRS')) } | Sort-Object -Unique
$bars = @($rows | ForEach-Object { ([regex]::Match($_, 'bar=(\d+\.\d+\.\d+ \d+:\d+)')).Groups[1].Value } | Sort-Object -Unique)
'SIDED-ROWS={0} SIDED-BARS={1}' -f $rows.Count, $bars.Count
'---S1-ROWS---'
$rows | Where-Object { $_ -match '2026\.09\.08 09:15' } | ForEach-Object { Write-Output $_ }
'---MAXLEN---'
$mx = 0
$r = [System.IO.File]::OpenText($B)
$ln = $r.ReadLine()
while ($null -ne $ln) { if ($ln.Length -gt $mx) { $mx = $ln.Length }; $ln = $r.ReadLine() }
$r.Close()
$ex = 0
if ($mx -gt 537) { $ex = 1 }
'MAXLEN={0} EXCEED537={1}' -f $mx, $ex
'SELHALT-upper={0}' -f ((Select-String -LiteralPath $B -Pattern 'SELHALT' -CaseSensitive | Measure-Object).Count)
'SELHALT-lower={0}' -f ((Select-String -LiteralPath $B -Pattern 'selhalt' -CaseSensitive | Measure-Object).Count)
