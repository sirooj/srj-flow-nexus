# cite_resolver_v1.ps1 - fold-battery cite check (GLM-B + Sonnet-B proposal, built 2026-09-29)
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File cite_resolver_v1.ps1 <packetPath> [relayPath]
# ASCII-only. Reads UTF8 explicit. Every number carries its deriving output.
$ErrorActionPreference = "Stop"
$Pkt = $args[0]
$Rel = ""
if ($args.Count -ge 2) { $Rel = $args[1] }
if (-not (Test-Path -LiteralPath $Pkt)) { Write-Output "NO PACKET"; exit 1 }
$pl = [System.IO.File]::ReadAllLines($Pkt, [System.Text.Encoding]::UTF8)
Write-Output ("packet-lines=" + $pl.Count)
$seen = @{}
for ($k = 0; $k -lt $pl.Count; $k++) {
  $m = [regex]::Matches($pl[$k], "P\d\d\d")
  foreach ($x in $m) {
    $t = $x.Value
    if (-not $seen.ContainsKey($t)) { $seen[$t] = @(($k + 1), 0) }
    $seen[$t][1] = $seen[$t][1] + 1
  }
}
Write-Output ("unique-P=" + $seen.Count)
$bad = 0
foreach ($t in ($seen.Keys | Sort-Object)) {
  $n = [int]$t.Substring(1, 3)
  $at = $seen[$t][0]
  $c = $seen[$t][1]
  if ($n -lt 1 -or $n -gt $pl.Count) { Write-Output ($t + " UNRESOLVED first@" + $at + " x" + $c); $bad = $bad + 1 }
  else {
    $tl = $pl[$n - 1]
    if ($tl.Length -gt 90) { $tl = $tl.Substring(0, 90) }
    Write-Output ($t + " -> L" + $n + " x" + $c + " :: " + $tl)
  }
}
Write-Output ("P-unresolved=" + $bad)
$rseen = @{}
for ($k = 0; $k -lt $pl.Count; $k++) {
  $m = [regex]::Matches($pl[$k], "R\d\d")
  foreach ($x in $m) {
    $t = $x.Value
    if (-not $rseen.ContainsKey($t)) { $rseen[$t] = @(0) }
    $rseen[$t][0] = $rseen[$t][0] + 1
  }
}
Write-Output ("unique-R=" + $rseen.Count)
foreach ($t in ($rseen.Keys | Sort-Object)) { Write-Output ($t + " x" + $rseen[$t][0]) }
if ($Rel -ne "") {
  if (-not (Test-Path -LiteralPath $Rel)) { Write-Output "NO RELAY"; exit 1 }
  $rl = [System.IO.File]::ReadAllLines($Rel, [System.Text.Encoding]::UTF8)
  Write-Output ("relay-lines=" + $rl.Count)
  $miss = 0
  for ($n = 1; $n -le 24; $n++) {
    $tok = "R" + $n.ToString("00") + " "
    $f = 0
    foreach ($l in $rl) { if ($l.StartsWith($tok)) { $f = $f + 1 } }
    if ($f -ne 1) { Write-Output ($tok + "COUNT=" + $f); $miss = $miss + 1 }
  }
  Write-Output ("rows-off=" + $miss)
  $el = 0
  foreach ($l in $rl) { if ($l.Contains("...")) { $el = $el + 1 } }
  Write-Output ("ellipsis-lines=" + $el)
}
Write-Output "DONE"
