$Seg = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON47-EXT1LIVE-V1_JOURNAL.log'
$L = [System.IO.File]::ReadAllLines($Seg)
$skip = @('2026.08.28-16:20','2026.09.08-16:40','2026.09.04-10:35')
$n = 0
foreach ($x in $L) {
  $i = $x.IndexOf('[SRJ-EA] STOPRESOLVE ')
  if ($i -lt 0) { continue }
  $s = $x.Substring($i)
  if (-not $s.Contains(' type=NORMAL')) { continue }
  $hit = $false
  foreach ($b in $skip) { if ($s.Contains('barTime=' + $b)) { $hit = $true } }
  if ($hit) { continue }
  $pl = $s.Substring($s.IndexOf(' type=NORMAL') + 13)
  $toks = $pl.Split(@(' '), [System.StringSplitOptions]::RemoveEmptyEntries)
  $keep = @()
  for ($k = 0; $k -lt ($toks.Length - 1); $k++) { $keep += $toks[$k] }
  echo ('ROW: ' + ($keep -join ' '))
  $n++
}
echo ('shipped=' + $n)
