$ErrorActionPreference = 'Stop'
$dirH = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$dirT = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS'
$relFile = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$pktFile = Join-Path $dirT 'PACKET_EXT1LIVE-001.md'
$relLines = [System.IO.File]::ReadAllLines($relFile)
Write-Output ('relay_lines=' + $relLines.Count)
Write-Output ('relay_hash=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $relFile).Hash)
Write-Output ('relay_bytes=' + (Get-Item -LiteralPath $relFile).Length)
$p1 = -1; $p46 = -1
for ($k = 0; $k -lt $relLines.Count; $k++) {
  if ($relLines[$k].StartsWith('P001:')) { $p1 = $k }
  if ($relLines[$k].StartsWith('P046:')) { $p46 = $k }
}
Write-Output ('p1idx=' + $p1 + ' p46idx=' + $p46)
$seq = @()
for ($k = 0; $k -lt $relLines.Count; $k++) {
  if ($relLines[$k] -match '^P([0-9][0-9][0-9]): ') { $seq += $Matches[1] }
}
Write-Output ('pseq_count=' + $seq.Count + ' first=' + $seq[0] + ' last=' + $seq[$seq.Count - 1])
$dup = ($seq | Group-Object | Where-Object { $_.Count -ne 1 }).Count
Write-Output ('pseq_dups=' + $dup)
$CR13 = [string][char]13; $LF10 = [string][char]10
$norm = { param($s) $x = $s.Replace($CR13, ''); if ($x.EndsWith($LF10)) { $x = $x.Substring(0, $x.Length - 1) }; return $x }
$pa = (& $norm ([System.IO.File]::ReadAllText($pktFile))) -split $LF10
$ra = (& $norm ([System.IO.File]::ReadAllText($relFile))) -split $LF10
$rp = @()
foreach ($ln in $ra) { if ($ln -match '^P[0-9][0-9][0-9]: ') { $rp += $ln.Substring(6) } }
Write-Output ('twin_packet=' + $pa.Count + ' twin_relay=' + $rp.Count)
$mis = 0
for ($k = 0; $k -lt 46; $k++) { if ($pa[$k] -ne $rp[$k]) { $mis++ } }
Write-Output ('twin_mismatches=' + $mis)
function Cnt([string]$x, [string]$a) { if ($a.Length -eq 0) { return -1 }; return (($x.Length - $x.Replace($a, '').Length) / $a.Length) }
$relText = [System.IO.File]::ReadAllText($relFile)
$pktText = [System.IO.File]::ReadAllText($pktFile)
Write-Output ('ellipsis_relay=' + (Cnt $relText '...') + ' ellipsis_packet=' + (Cnt $pktText '...'))
$oldTerms = @('v27 narrowed contract', 'INCOMPLETE acceptance plus prefix partial-pass', 'single-line 38-field NORMAL', '09448475', 'prefix partial-pass', 'partial-pass')
foreach ($ot in $oldTerms) {
  $hits = @()
  for ($k = 0; $k -lt $relLines.Count; $k++) { if ($relLines[$k].IndexOf($ot) -ge 0) { $hits += ($k + 1) } }
  Write-Output ('OLD[' + $ot + ']=' + ($hits -join ','))
}
$hex = [regex]::Matches($relText, '[0-9A-Fa-f]{8}')
$grp = $hex | ForEach-Object { $_.Value } | Group-Object | Sort-Object Name
foreach ($g in $grp) { Write-Output ('HEX ' + $g.Name + ' x' + $g.Count) }
Write-Output '---tail-459-471---'
for ($k = 458; $k -lt $relLines.Count; $k++) {
  $ln = $relLines[$k]
  if ($ln.Length -gt 220) { $ln = $ln.Substring(0, 220) }
  Write-Output (($k + 1) + ': ' + $ln)
}
Write-Output '---pkt-Nconst-full---'
$pt = [System.IO.File]::ReadAllText($pktFile)
$ix = $pt.IndexOf('key structure EA-measured')
Write-Output ($pt.Substring([Math]::Max(0, ($ix - 200)), 1400))
