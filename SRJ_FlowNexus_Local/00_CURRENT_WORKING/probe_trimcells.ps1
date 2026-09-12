# probe_trimcells.ps1 — TRIM zero-run probes A/B/C (council P-FIX-S2POLL verbatim S6)
# READ-ONLY. No canonical edit, no compile, no run. Input: archived segment journal.
$j = 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON5-FVGVALIDITY_JOURNAL.log'
$lines = Get-Content -LiteralPath $j
function Mkt($l) { if ($l -match 'Core 04\s+(\d{4}\.\d\d\.\d\d \d\d:\d\d:\d\d)') { return $Matches[1] }; return '' }
function GetF($l,$n) { if ($l -match "$n=([0-9.\-]+)") { return $Matches[1] }; return '' }

$ipc = @(); $slref = @{}; $slstruct = @{}; $xob2 = @{}
foreach ($l in $lines) {
  if ($l -match 'INPLAYCOMMIT' -and $l -match 'applied=1') {
    $bv=''; if ($l -match 'bar=(\d{4}\.\d\d\.\d\d \d\d:\d\d)') { $bv=$Matches[1] }
    $ipc += [pscustomobject]@{ mkt=(Mkt $l); bar=$bv; bounded=(GetF $l 'bounded');
      scanned=(GetF $l 'scanned'); committed=(GetF $l 'committed'); zlo=(GetF $l 'zoneLo');
      zhi=(GetF $l 'zoneHi'); haveStop=(GetF $l 'haveStop') }
  }
  if ($l -match 'SL_REF' -and $l -match 'site=S3ARM') { $slref[(Mkt $l)] = (GetF $l 'slRef') }
  if ($l -match 'SL_STRUCT' -and $l -match 'site=S3ARM') { $slstruct[(Mkt $l)] = (GetF $l 'prevTop') }
  if ($l -match 'XOBINPLAY2' -and $l -match 'bar=') {
    if ($l -match 'bar=(\d{4}\.\d\d\.\d\d \d\d:\d\d)') { $xob2[$Matches[1]] = (GetF $l 'unc_hits') }
  }
}
'IPC_APPLIED1=' + $ipc.Count
'== PROBE A literal (bounded x S3ARM-line presence) =='
$a11=0; $a01=0; $a10=0; $a00=0
foreach ($r in $ipc) {
  $hasArm = $slref.ContainsKey($r.mkt) -or $slstruct.ContainsKey($r.mkt)
  if ($r.bounded -eq '1' -and $hasArm) { $a11++ }
  elseif ($r.bounded -eq '0' -and $r.scanned -eq '0') { $a01++ }
  elseif ($r.bounded -eq '1' -and (-not $hasArm)) { $a10++ }
  elseif ($r.bounded -eq '0' -and $r.scanned -ne '0') { $a00++ }
}
"CELL11_bounded1+arm=$a11 CELL01_bounded0+scan0=$a01 CELL10_bounded1+NOarm=$a10 CELL00_bounded0+scanGT0=$a00"
'== PROBE A direct (bounded x haveStop, applied=1) =='
$ipc | Group-Object { $_.bounded + '/' + $_.haveStop } | ForEach-Object { 'CELL b/h=' + $_.Name + ' n=' + $_.Count }
'== PROBE B (stop-inside-zone flip prediction on committed=0) =='
$flip = @()
foreach ($r in $ipc) {
  if ($r.committed -ne '0') { continue }
  $stop = ''; $src = ''
  if ($slref.ContainsKey($r.mkt)) { $stop = $slref[$r.mkt]; $src = 'SLREF' }
  elseif ($slstruct.ContainsKey($r.mkt)) { $stop = $slstruct[$r.mkt]; $src = 'SLSTRUCT' }
  if ($stop -eq '') { $flip += ('NOMSTOP bar=' + $r.bar); continue }
  $s=[double]$stop; $lo=[double]$r.zlo; $hi=[double]$r.zhi
  if ($s -ge $lo -and $s -le $hi) { $flip += ('FLIP bar=' + $r.bar + ' src=' + $src + ' stop=' + $stop + ' zone=[' + $r.zlo + ',' + $r.zhi + ']') }
}
'COMMITTED0=' + ($ipc | Where-Object { $_.committed -eq '0' }).Count + ' FLIPS=' + ($flip | Where-Object { $_ -match '^FLIP' }).Count
$flip | Select-Object -First 30
'== PROBE C (XOBINPLAY2 unc_hits on FLIP bars) =='
foreach ($f in ($flip | Where-Object { $_ -match '^FLIP' })) {
  if ($f -match 'bar=(\d{4}\.\d\d\.\d\d \d\d:\d\d)') { $b=$Matches[1]; 'bar=' + $b + ' unc_hits=' + $xob2[$b] }
}
