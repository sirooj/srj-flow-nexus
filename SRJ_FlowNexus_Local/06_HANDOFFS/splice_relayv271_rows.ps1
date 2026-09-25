# Patch relay v271 Friday rows (mechanical: replace 2 samples with all 16 pulled rows; tab-exact splice).
$Hdir = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$rl = Join-Path $Hdir 'BUILDER_RELAY_COUNCIL_v271-DAY2355-CLEAR1.md'
$seg = Join-Path $Hdir 'RECON60-RESQUAT-V12_JOURNAL.log'
$rr = Get-Content -LiteralPath $rl
'PRECOUNT_RELAY=' + $rr.Count
$idx = @()
for ($kk = 0; $kk -lt $rr.Count; $kk++) { if ($rr[$kk].Contains('FRIDAY-2355-EVAL hits=16 (first 2 shown')) { $idx += $kk } }
'HEADERHITS=' + $idx.Count
if ($idx.Count -ne 1) { 'PATCH_HEADER_HALT'; exit 1 }
$at = $idx[0]
if (-not $rr[$at + 1].Contains('  sample: ')) { 'PATCH_S1_HALT'; exit 1 }
if (-not $rr[$at + 2].Contains('  sample: ')) { 'PATCH_S2_HALT'; exit 1 }
$sl = Get-Content -LiteralPath $seg
$fri = @($sl | Where-Object { $_ -match 'Core 04\t2026\.09\.04 23:55' })
'FRI16=' + $fri.Count
if ($fri.Count -ne 16) { 'PATCH_FRI_HALT'; exit 1 }
$block = @('FRIDAY-2355-EVAL hits=16 (all 16 whole inline, mechanical pull):')
foreach ($ff in $fri) { $block += ('  row: ' + $ff.Substring($ff.IndexOf('Core'))) }
'BLOCKLINES=' + $block.Count
$nn = @()
for ($kk = 0; $kk -lt $at; $kk++) { $nn += $rr[$kk] }
foreach ($bb in $block) { $nn += $bb }
for ($kk = $at + 3; $kk -lt $rr.Count; $kk++) { $nn += $rr[$kk] }
'DELTA=' + ($nn.Count - $rr.Count)
if (($nn.Count - $rr.Count) -ne 14) { 'PATCH_DELTA_HALT'; exit 1 }
$nn | Set-Content -LiteralPath $rl -Encoding utf8
'WROTE_LINES=' + $nn.Count
'POSTCOUNT_FILE=' + (Get-Content -LiteralPath $rl).Count
$bk = Get-Content -LiteralPath $rl
'RT_ROW16=' + @($bk | Where-Object { $_.Contains('  row: Core 04') }).Count
'RT_SAMPLE0=' + @($bk | Where-Object { $_.Contains('  sample: ') }).Count
'RT_SESSION1=' + @($bk | Where-Object { $_.Contains('Session: NEW council session') }).Count
'RT_ELLIPSIS=' + @($bk | Where-Object { $_.Contains('...') }).Count
