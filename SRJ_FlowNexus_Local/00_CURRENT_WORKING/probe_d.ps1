# probe_d.ps1 — P-TRIM-S2POLL Probe D: seed-cascade subset M of applied=1 (READ-ONLY)
$j = 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON5-FVGVALIDITY_JOURNAL.log'
$lines = Get-Content -LiteralPath $j
function Mkt($l) { if ($l -match 'Core 04\s+(\d{4}\.\d\d\.\d\d \d\d:\d\d:\d\d)') { return $Matches[1] }; return '' }
$applied = @{}; $appliedMkt = @{}
foreach ($l in $lines) {
  if ($l -match 'INPLAYCOMMIT' -and $l -match 'applied=1' -and $l -match 'bar=(\d{4}\.\d\d\.\d\d \d\d:\d\d)') {
    $applied[$Matches[1]] = (Mkt $l)
  }
}
'APPLIED1=' + $applied.Count
$seedBars = @{}
foreach ($l in $lines) {
  if ($l -match 'ANCHOR_ELECT' -and $l -match 'action=SEED' -and $l -match 'bar=(\d{4}\.\d\d\.\d\d \d\d:\d\d)') {
    $seedBars[$Matches[1]] = 1
  }
}
$transMkts = @{}
foreach ($l in $lines) {
  if ($l -match 'STATE S1_REGIME->S2_LTF_ALIGN') { $transMkts[(Mkt $l)] = 1 }
}
$m = @()
foreach ($b in $applied.Keys) {
  if ($seedBars.ContainsKey($b) -or $transMkts.ContainsKey($applied[$b])) { $m += $b }
}
'M=' + $m.Count
$m | Sort-Object | ForEach-Object { 'CASCADE bar=' + $_ + ' mkt=' + $applied[$_] + ' seed=' + $seedBars.ContainsKey($_) + ' trans=' + $transMkts.ContainsKey($applied[$_]) }
'P_S2POLL=432 A=157 EXPECTED: demands=' + (432+157) + ' computes=' + (432+$m.Count) + ' hits=' + (157-$m.Count)
