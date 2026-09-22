# verify_relayv227.ps1 - twin + snippet + annex + hygiene checks for v227 draft (ASCII only)
$h = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\"
$norm = { param($a) @( $a | ForEach-Object { ($_ -replace "`r", "") } ) }
$exitCode = 0
$rel = & $norm ([System.IO.File]::ReadAllLines($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v227-VALIDITY-CLEAR2.md"))
Write-Output ("RELAY lines=" + $rel.Count)
# --- TWIN: relay Q01-Q50 vs packet v2 lines ---
$pkt = & $norm ([System.IO.File]::ReadAllLines($h + "01_TASKS\PACKET_P-VALIDITY-1.md"))
Write-Output ("PKT lines=" + $pkt.Count)
$twinMiss = 0
$twinTotal = 0
foreach ($rl in $rel) {
  if ($rl -match "^Q(\d\d) \(= packet L(\d+), whole\): ?(.*)$") {
    $twinTotal++
    $pn = [int]$Matches[1]
    $ln = [int]$Matches[2]
    $body = $Matches[3]
    if ($pn -ne $twinTotal) { Write-Output ("PSEQ-BREAK at Q" + $pn); $twinMiss++ }
    if ($ln -ne $pn) { Write-Output ("Q-LINE-MISMATCH Q" + $pn); $twinMiss++ }
    if ($body -ne $pkt[$ln - 1]) { Write-Output ("TWIN-MISS Q" + $pn); $twinMiss++ }
  }
}
Write-Output ("TWIN total=" + $twinTotal + " miss=" + $twinMiss)
if ($twinTotal -ne 50) { Write-Output "TWIN-COUNT-FAIL"; $exitCode = 1 }
if ($twinMiss -ne 0) { $exitCode = 1 }
# --- SNIPPET: regions vs disk ---
$checks = @(
  @("Experts\SRJ_FlowNexus_EA.mq5", 2261, 15, "R-FILTER-B", "R-FILTER-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 2282, 11, "R-POOL-B", "R-POOL-E"),
  @("Indicators\SRJ_FlowLogic.mq5", 1371, 22, "R-MASK-B", "R-MASK-E"),
  @("Include\SRJ\SRJ_Sessions.mqh", 275, 9, "R-RESET-B", "R-RESET-E"),
  @("Include\SRJ\SRJ_Sessions.mqh", 365, 9, "R-DETECT-B", "R-DETECT-E"),
  @("Include\SRJ\SRJ_State.mqh", 199, 10, "R-STATE-B", "R-STATE-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 7706, 3, "R-SEED2-B", "R-SEED2-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 10907, 8, "R-E6-B", "R-E6-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 7777, 2, "R-S1F-B", "R-S1F-E")
)
foreach ($c in $checks) {
  $disk = & $norm ([System.IO.File]::ReadAllLines("C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\" + $c[0]))
  $want = @()
  for ($i = 0; $i -lt $c[2]; $i++) { $want += $disk[$c[1] - 1 + $i] }
  $inb = $false
  $got = @()
  foreach ($rl in $rel) {
    if ($rl -eq "[[" + $c[3] + "]]") { $inb = $true; continue }
    if ($rl -eq "[[" + $c[4] + "]]") { $inb = $false; continue }
    if ($inb) { $got += $rl }
  }
  $ok = ($got.Count -eq $want.Count)
  if ($ok) { for ($i = 0; $i -lt $want.Count; $i++) { if ($got[$i] -cne $want[$i]) { $ok = $false; break } } }
  if ($ok) { Write-Output ("SNIPPET-OK " + $c[3]) } else { Write-Output ("SNIPPET-MISS " + $c[3] + " got=" + $got.Count + " want=" + $want.Count); $exitCode = 1 }
}
# --- ANNEX: KIMI-D2 block vs filed KIMI lines 299-302 ---
$kf = & $norm ([System.IO.File]::ReadAllLines($h + "06_HANDOFFS\BUILDER_VERDICTS_KIMI.md"))
$kwant = @($kf[298], $kf[299], $kf[300], $kf[301])
$inb = $false
$kgot = @()
foreach ($rl in $rel) {
  if ($rl -eq "[[R-KIMID2-B]]") { $inb = $true; continue }
  if ($rl -eq "[[R-KIMID2-E]]") { $inb = $false; continue }
  if ($inb) { $kgot += $rl }
}
$kok = ($kgot.Count -eq $kwant.Count)
if ($kok) { for ($i = 0; $i -lt $kwant.Count; $i++) { if ($kgot[$i] -cne $kwant[$i]) { $kok = $false; break } } }
if ($kok) { Write-Output "ANNEX-OK KIMI-D2" } else { Write-Output ("ANNEX-MISS KIMI-D2 got=" + $kgot.Count); $exitCode = 1 }
# --- HYGIENE (report only; documented classes) ---
$raw = [System.IO.File]::ReadAllText($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v227-VALIDITY-CLEAR2.md")
$bytes = [System.IO.File]::ReadAllBytes($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v227-VALIDITY-CLEAR2.md")
Write-Output ("ellipsis=" + @([regex]::Matches($raw, "\.\.\.")).Count)
Write-Output ("nonASCII=" + @($bytes | Where-Object { $_ -gt 127 }).Count)
Write-Output ("banned=" + @([regex]::Matches($raw, "(?i)\bmorning\b|\bafternoon\b")).Count)
Write-Output "VERIFY-DONE"
exit $exitCode
