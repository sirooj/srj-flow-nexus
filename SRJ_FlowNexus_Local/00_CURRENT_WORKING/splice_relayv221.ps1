# splice_relayv215.ps1 - fill v215 twin + region blocks from disk (asserted, console proof only)
$ErrorActionPreference = 'Stop'
$base = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$relayPath = Join-Path $base 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v221-EXITMODEL2-CLEAR8.md'
$pktPath = Join-Path $base 'SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'
$eaPath = Join-Path $base 'Experts\SRJ_FlowNexus_EA.mq5'
$R = [IO.File]::ReadAllLines($relayPath)
$P0 = [IO.File]::ReadAllLines($pktPath)
$E0 = [IO.File]::ReadAllLines($eaPath)
function Clean([string[]]$a) {
  $b = @()
  foreach ($x in $a) { $b += ($x -replace "`r", '') }
  if ($b.Count -gt 0) { $last = $b[$b.Count - 1]; if ($last -eq '') { $b = $b[0..($b.Count - 2)] } }
  return $b
}
$relay = Clean $R
$pkt = Clean $P0
$ea = Clean $E0
Write-Output "PKT-LINES=$($pkt.Count)"
$fail = 0
if ($pkt.Count -ne 48) { Write-Output 'PKT-COUNT FAIL'; $fail++ }
$trail = 0
foreach ($pl in $pkt) { if ($pl.EndsWith(' ') -or $pl.EndsWith("`t")) { $trail++ } }
Write-Output "PKT-TRAILING-WS=$trail"
if ($trail -ne 0) { Write-Output 'PKT-TRAIL FAIL'; $fail++ }
function FindMark($lines, $mark) {
  for ($k = 0; $k -lt $lines.Count; $k++) { if ($lines[$k] -ceq $mark) { return $k } }
  return -1
}
$tb = FindMark $relay '[[TWIN-B]]'
$te = FindMark $relay '[[TWIN-E]]'
$tspan = $te - $tb - 1
Write-Output "TWIN-SPAN=$tspan"
if ($tb -lt 0 -or $te -lt 0 -or $tspan -ne 48) { Write-Output 'TWIN-SPAN FAIL'; $fail++ }
$regions = @()
$regions += ,@('R-F1OLD', 2321, 2359)
$regions += ,@('R-F2OLD', 129, 132)
$regions += ,@('R-F3ENUM', 151, 161)
$regions += ,@('R-F3NAME', 259, 272)
$regions += ,@('R-VDECL', 11087, 11090)
$regions += ,@('R-HDR', 11030, 11032)
$regions += ,@('R-HTF', 11165, 11187)
$regions += ,@('R-RET', 11202, 11210)
$regions += ,@('R-DAYDEF', 10330, 10342)
$rspans = @{}
foreach ($rg in $regions) {
  $nm = $rg[0]
  $bi = FindMark $relay ('[[' + $nm + '-B]]')
  $ei = FindMark $relay ('[[' + $nm + '-E]]')
  $sp = $ei - $bi - 1
  $want = [int]$rg[2] - [int]$rg[1] + 1
  $rspans[$nm] = @($bi, $ei, $sp, $want)
  Write-Output "$nm SPAN=$sp WANT=$want"
  if ($bi -lt 0 -or $ei -lt 0 -or $sp -ne 1) { Write-Output "$nm SPAN FAIL"; $fail++ }
}
if ($fail -ne 0) { Write-Output 'ASSERTS FAILED - NOT WRITING'; exit }
$out = New-Object Collections.ArrayList
for ($k = 0; $k -lt $relay.Count; $k++) { [void]$out.Add($relay[$k]) }
$tw = New-Object Collections.ArrayList
for ($i = 0; $i -lt 48; $i++) {
  $tag = 'P{0:d2}' -f ($i + 1)
  $ln = $i + 1
  $body = $pkt[$i]
  if ($body -eq '') { [void]$tw.Add("$tag (= packet L$ln, whole):") }
  else { [void]$tw.Add("$tag (= packet L$ln, whole): $body") }
}
$pre = @($out[0..$tb])
$post = @($out[$te..($out.Count - 1)])
$out = New-Object Collections.ArrayList
foreach ($x in $pre) { [void]$out.Add($x) }
foreach ($x in $tw) { [void]$out.Add($x) }
foreach ($x in $post) { [void]$out.Add($x) }
foreach ($rg in $regions) {
  $nm = $rg[0]
  $lo = [int]$rg[1]
  $hi = [int]$rg[2]
  $bi = FindMark $out ('[[' + $nm + '-B]]')
  $ei = FindMark $out ('[[' + $nm + '-E]]')
  $src = @($ea[($lo - 1)..($hi - 1)])
  $npre = @($out[0..$bi])
  $npost = @($out[$ei..($out.Count - 1)])
  $mid = New-Object Collections.ArrayList
  foreach ($x in $src) { [void]$mid.Add($x) }
  $out = New-Object Collections.ArrayList
  foreach ($x in $npre) { [void]$out.Add($x) }
  foreach ($x in $mid) { [void]$out.Add($x) }
  foreach ($x in $npost) { [void]$out.Add($x) }
  Write-Output "$nm SPLICED n=$($src.Count)"
}
$arr = $out.ToArray()
[IO.File]::WriteAllLines($relayPath, $arr)
$c = [IO.File]::ReadAllLines($relayPath)
Write-Output "AFTER-LINES=$($c.Count)"
Write-Output "RELAY-HASH=$((Get-FileHash -LiteralPath $relayPath -Algorithm SHA256).Hash)"
Write-Output "RELAY-BYTES=$((Get-Item -LiteralPath $relayPath).Length)"
