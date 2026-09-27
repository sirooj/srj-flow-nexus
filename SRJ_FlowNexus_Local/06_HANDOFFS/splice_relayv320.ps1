# splice_relayv320.ps1 - mechanical relay fill for v320 (twin + companion + rows)
# ASCII-ONLY. Every computed string proves non-empty beside it (generator-write gate).
$ErrorActionPreference = 'Stop'
$Root = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$Pkt = Join-Path $Root 'SRJ_FlowNexus_Local\01_TASKS\PACKET_P-UJIMPL-IMPL-2.md'
$Ea = Join-Path $Root 'Experts\SRJ_FlowNexus_EA.mq5'
$R63 = Join-Path $Root 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON63-USDJPY-JUNE_JOURNAL.log'
$R71 = Join-Path $Root 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON71-V8-UJ_JOURNAL.log'
$Rel = Join-Path $Root 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v320-IMPL2-5.md'
function NormLines([string]$p) {
  $t = [IO.File]::ReadAllText($p)
  $a = $t -split "`n"
  $b = @()
  foreach ($x in $a) { $b += $x.TrimEnd("`r") }
  if ($b.Count -gt 0 -and $b[$b.Count - 1] -eq '') { $b = $b[0..($b.Count - 2)] }
  return $b
}
function Sha8([string[]]$lines) {
  $j = [string]::Join("`n", $lines)
  $by = [Text.Encoding]::UTF8.GetBytes($j)
  $h = [Security.Cryptography.SHA256]::Create().ComputeHash($by)
  return ([BitConverter]::ToString($h)).Replace('-','').Substring(0,8)
}
# ---- TWIN (dynamic count, diff 0 asserted) ----
$pl = NormLines $Pkt
if ($pl.Count -lt 100) { throw ('packet lines=' + $pl.Count + ' expect 100+') }
$tw = @()
for ($i = 0; $i -lt $pl.Count; $i++) { $tw += ('P' + ($i + 1).ToString('000') + ': ' + $pl[$i]) }
if ($tw.Count -eq 0) { throw 'twin empty' }
$ph = Sha8 $pl
$tb = @()
foreach ($x in $tw) { $tb += $x.Substring(6) }
$th = Sha8 $tb
if ($ph -ne $th) { throw ('twin diff: ' + $ph + ' vs ' + $th) }
$twinBlock = @('twin ' + $tw.Count + '/' + $tw.Count + ' diff 0 (packet body ' + $ph + ' / twin body ' + $th + ')') + $tw
$twinText = [string]::Join("`r`n", $twinBlock)
if ($twinText.Length -eq 0) { throw 'twin text empty' }
echo ('TWIN-OK lines=' + $tw.Count + ' hash=' + $th)
# ---- COMPANION (control first) ----
$eaAll = [IO.File]::ReadAllLines($Ea)
if ($eaAll.Count -eq 0) { throw 'EA read empty' }
$ctl = 0
foreach ($ln in $eaAll) { if ($ln.Contains('MTSNAP')) { $ctl++ } }
if ($ctl -eq 0) { throw 'control MTSNAP missed' }
echo ('CONTROL-OK MTSNAP-lines=' + $ctl)
$regs = @(
  @('C10388-C10421 guard + latch + MTSNAP', 10388, 10421),
  @('C2399-C2402 becomes-best close', 2399, 2402),
  @('C2484-C2489 session walk with mask filter', 2484, 2489),
  @('C2498-C2514 Compute POI loop + fallback site', 2498, 2514),
  @('C2536-C2546 census session walk without mask', 2536, 2546),
  @('C2559-C2572 census POI loop', 2559, 2572),
  @('C11361-C11368 Mt POI loop', 11361, 11368),
  @('C8190-C8200 S2 block', 8190, 8200),
  @('C91-C105 authority table', 91, 105),
  @('C394-C397 abort define', 394, 397),
  @('C8920-C8926 touch book', 8920, 8926),
  @('C10422-C10430 admission tuple', 10422, 10430),
  @('C8896-C8905 leg-touch setter', 8896, 8905),
  @('C7444-C7458 poll 1R gate + memo write', 7444, 7458),
  @('C10369-C10386 fire fallback memo write', 10369, 10386),
  @('C11957-C11969 OnTick boundary order', 11957, 11969),
  @('C11748-C11770 signatures', 11748, 11770)
)
$comp = @()
foreach ($r in $regs) {
  $name = $r[0]
  $a = [int]$r[1]
  $b = [int]$r[2]
  $n = $b - $a + 1
  if ($n -le 0) { throw ('bad range ' + $name) }
  $comp += ('--- ' + $name + ' (' + $n + ' lines) ---')
  for ($ln = $a; $ln -le $b; $ln++) { $comp += ('C' + $ln + ': ' + $eaAll[$ln - 1]) }
}
$compText = [string]::Join("`r`n", $comp)
if ($compText.Length -eq 0) { throw 'companion empty' }
echo ('COMPANION-OK lines=' + $comp.Count)
# ---- ROWS (each pattern exactly 1x; files read once) ----
$all63 = [IO.File]::ReadAllLines($R63)
$all71 = [IO.File]::ReadAllLines($R71)
if ($all63.Count -eq 0) { throw 'R63 empty' }
if ($all71.Count -eq 0) { throw 'R71 empty' }
echo ('JOURNALS-OK R63=' + $all63.Count + ' R71=' + $all71.Count)
$rows = @(
  @('R01', 'R63', 'ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983'),
  @('R02', 'R63', 'MTSNAP bar=2026.06.03 09:05 dir=LONG anchor=Daily-VWAP entry=159.929 sl=159.889 tp=159.983'),
  @('R03', 'R63', 'SLMEMO bar=2026.06.03 09:05 site=S2POLL result=COMPUTE ok=1 slRef=159.905'),
  @('R04', 'R63', 'memoExt1=159.889 freshExt1=159.889'),
  @('R05', 'R71', 'memo_tp=159.983 memo_sl=159.905 fire_tp=159.983 fire_sl=159.889 memo_src=POLL'),
  @('R06', 'R71', 'UJPROBE bar_key=2026.06.05 09:35'),
  @('R07', 'R71', 'CONFIRMPOLL bar=2026.06.05 09:40 anchor=Daily-POC dir=SHORT'),
  @('R08', 'R71', 'S2WAIT bar=2026.06.05 09:35 dir=SHORT'),
  @('R09', 'R71', 'TPCENSUS #27 bar=2026.06.05 16:05'),
  @('R10', 'R71', 'SWEPTMASK bar=2026.06.05 16:05 raw=4182845.0'),
  @('R11', 'R71', 'TPCENSUS #76 bar=2026.06.11 14:35'),
  @('R12', 'R71', 'TPCENSUS #77 bar=2026.06.11 14:40'),
  @('R13', 'R71', 'UJ1R bar=2026.06.11 14:40 src=POLL'),
  @('R14', 'R71', 'UJPROBE bar_key=2026.06.05 09:25'),
  @('R15', 'R71', 'UJPROBE bar_key=2026.06.11 14:30'),
  @('R16', 'R71', 'S2WAIT bar=2026.06.11 14:30'),
  @('R17', 'R71', 'LEGTOUCH bar=2026.06.11 14:35'),
  @('R18', 'R71', 'UJPROBE bar_key=2026.06.05 09:30'),
  @('R19', 'R71', 'UJPROBE bar_key=2026.06.05 09:05'),
  @('R20', 'R71', 'UJPROBE bar_key=2026.06.05 09:10'),
  @('R21', 'R71', 'UJPROBE bar_key=2026.06.05 09:15'),
  @('R22', 'R71', 'UJPROBE bar_key=2026.06.05 09:20')
)
$rb = @()
foreach ($r in $rows) {
  $tag = $r[0]
  $src = $r[1]
  $pat = $r[2]
  $all = if ($src -eq 'R63') { $all63 } else { $all71 }
  $hits = @()
  foreach ($ln in $all) { if ($ln.Contains($pat)) { $hits += $ln } }
  if ($hits.Count -ne 1) { throw ($tag + ' hits=' + $hits.Count + ' expect 1') }
  $rb += ($tag + ' [' + $src + ' 1x]: ' + $hits[0])
}
$rowsText = [string]::Join("`r`n", $rb)
if ($rowsText.Length -eq 0) { throw 'rows empty' }
echo ('ROWS-OK n=' + $rb.Count)
# ---- SPLICE ----
$relBefore = [IO.File]::ReadAllText($Rel)
$h0 = (Get-FileHash -LiteralPath $Rel -Algorithm SHA256).Hash.Substring(0,8)
$m1 = ($relBefore -split "`n" | Where-Object { $_ -match '@@TWIN@@' } | Measure-Object).Count
$m2 = ($relBefore -split "`n" | Where-Object { $_ -match '@@COMPANION@@' } | Measure-Object).Count
$m3 = ($relBefore -split "`n" | Where-Object { $_ -match '@@ROWS@@' } | Measure-Object).Count
if ($m1 -ne 1 -or $m2 -ne 1 -or $m3 -ne 1) { throw ('markers=' + $m1 + '/' + $m2 + '/' + $m3) }
$out = $relBefore.Replace('@@TWIN@@', $twinText).Replace('@@COMPANION@@', $compText).Replace('@@ROWS@@', $rowsText)
if ($out.Length -eq 0) { throw 'spliced empty' }
[IO.File]::WriteAllText($Rel, $out)
$h1 = (Get-FileHash -LiteralPath $Rel -Algorithm SHA256).Hash.Substring(0,8)
if ($h0 -eq $h1) { throw 'digest unchanged, filed nothing' }
$b = (Get-Item -LiteralPath $Rel).Length
$lf = ([IO.File]::ReadAllBytes($Rel) | Where-Object { $_ -eq 10 } | Measure-Object).Count
echo ('RELAY-DONE ' + $h1 + '/' + $b + '/' + $lf)
