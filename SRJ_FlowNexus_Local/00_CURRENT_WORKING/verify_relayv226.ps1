# verify_relayv226.ps1 - twin + snippet + hygiene checks for v226 draft (ASCII only)
$h = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\"
$norm = { param($a) @( $a | ForEach-Object { ($_ -replace "`r", "") } ) }
$exitCode = 0
# --- TWIN: relay P01-P46 vs packet lines ---
$pkt = & $norm ([System.IO.File]::ReadAllLines($h + "01_TASKS\PACKET_P-VALIDITY-1.md"))
$rel = & $norm ([System.IO.File]::ReadAllLines($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v226-VALIDITY-CLEAR1.md"))
Write-Output ("PKT lines=" + $pkt.Count + " RELAY lines=" + $rel.Count)
$twinMiss = 0
$twinTotal = 0
foreach ($rl in $rel) {
  if ($rl -match "^P(\d\d) \(= packet L(\d+), whole\): ?(.*)$") {
    $twinTotal++
    $pn = [int]$Matches[1]
    $ln = [int]$Matches[2]
    $body = $Matches[3]
    if ($pn -ne $twinTotal) { Write-Output ("PSEQ-BREAK at " + $rl); $twinMiss++ }
    if ($ln -ne $pn) { Write-Output ("P-LINE-MISMATCH " + $rl); $twinMiss++ }
    if ($body -ne $pkt[$ln - 1]) { Write-Output ("TWIN-MISS P" + $pn); $twinMiss++ }
  }
}
Write-Output ("TWIN total=" + $twinTotal + " miss=" + $twinMiss)
if ($twinTotal -ne 46) { Write-Output "TWIN-COUNT-FAIL"; $exitCode = 1 }
if ($twinMiss -ne 0) { $exitCode = 1 }
# --- SNIPPET: regions vs disk ---
$checks = @(
  @("Experts\SRJ_FlowNexus_EA.mq5", 2261, 15, "R-FILTER-B", "R-FILTER-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 2282, 11, "R-POOL-B", "R-POOL-E"),
  @("Indicators\SRJ_FlowLogic.mq5", 1371, 22, "R-MASK-B", "R-MASK-E"),
  @("Include\SRJ\SRJ_Sessions.mqh", 275, 9, "R-RESET-B", "R-RESET-E"),
  @("Include\SRJ\SRJ_Sessions.mqh", 365, 9, "R-DETECT-B", "R-DETECT-E"),
  @("Include\SRJ\SRJ_State.mqh", 199, 10, "R-STATE-B", "R-STATE-E"),
  @("Experts\SRJ_FlowNexus_EA.mq5", 7657, 3, "R-SEED-B", "R-SEED-E")
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
# --- HYGIENE ---
$raw = [System.IO.File]::ReadAllText($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v226-VALIDITY-CLEAR1.md")
$bytes = [System.IO.File]::ReadAllBytes($h + "06_HANDOFFS\BUILDER_RELAY_COUNCIL_v226-VALIDITY-CLEAR1.md")
Write-Output ("ellipsis=" + @([regex]::Matches($raw, "\.\.\.")).Count)
Write-Output ("nonASCII=" + @($bytes | Where-Object { $_ -gt 127 }).Count)
Write-Output ("banned=" + @([regex]::Matches($raw, "(?i)\bmorning\b|\bafternoon\b")).Count)
Write-Output "VERIFY-DONE"
exit $exitCode
