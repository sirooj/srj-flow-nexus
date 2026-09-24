# Tabulate RECON60-RESQUAT-V12 vs RECON59-EVICT-V1 (literal .Contains counts, same method both sides; set-diffs on wall-stripped lines).
$Hdir = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$seg60 = Join-Path $Hdir 'RECON60-RESQUAT-V12_JOURNAL.log'
$seg59 = Join-Path $Hdir 'RECON59-EVICT-V1_JOURNAL.log'
$outFile = Join-Path $Hdir 'RECON60-RESQUAT-V12_TABULATION.txt'
if (Test-Path -LiteralPath $outFile) { 'TABULATE_EXISTS_HALT'; exit 1 }
if (-not (Test-Path -LiteralPath $seg60)) { 'SEG60_MISSING_HALT'; exit 1 }
if (-not (Test-Path -LiteralPath $seg59)) { 'SEG59_MISSING_HALT'; exit 1 }
$lines60 = Get-Content -LiteralPath $seg60
$lines59 = Get-Content -LiteralPath $seg59
'PRECOUNT_60=' + $lines60.Count
'PRECOUNT_59=' + $lines59.Count
function CountHit($cell, $pat) { return @($cell | Where-Object { $_.Contains($pat) }).Count }
function CountHit2($cell, $pa, $pb) { return @($cell | Where-Object { $_.Contains($pa) -and $_.Contains($pb) }).Count }
function StripWall($ln) { return ($ln -replace "^[^\t]*\t[^\t]*\t[^\t]*\t", '') }
$pats = @('ALERT SRJ SIGNAL','ALERT SRJ EXIT','ALERT SRJ HEADS-UP','ALERT SRJ STAND-DOWN','MTSNAP','EXECUTE_ACCT','PRE-SEND','order performed','deal performed','MTLIFE fields=','MTEXIT','DAY_CLOSE','TP_ELECT','EXITVERDICT','FRESH_VETO','A6REFUSED','HEADS-UP','STAND-DOWN','RENEW','MTCOLLISION','SEEDVOID','DIV_FALLBACK','EVICT_UNEXPECTED_ORIGIN','S5_GATE_CHECK->S4_ARMED','S5_GATE_CHECK->ABORT','S5_GATE_CHECK->SIGNAL','ABORT reason=','DIV_WAIT','CONFIRM_DIV_WAIT','SUPPRESSED','SIDE1C_CHAIN','SIDE1C_PREEMPT','FRESHCOUNT','VETOCLEAR','TP_TOUCH','EXITCENSUS','LTFFLIP','XOB-PROMOCENSUS','WS161_CENSUS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','TPCENSUS','DEMO_GUARD','TP_RR_FAIL','FRESH_OPP_FVG','SESSION_CLOSED','LTF_MISALIGN','FRESH_OB_DEAD','LINEWIDTH','MTCLOSE bar=','MTCLOSE_FAIL','ENTRY_TICKET','EVICTSUPPRESS bar=','EVICTSUPPRESS_FIRE','RESEED_BLOCKED','EVICTSUPPRESS_SKIP','INDEX-INVALID','SESSION_LIMIT','ANCHOR_ELECT','POIREPLACE','MTEXEC')
$tx = @()
$tx += '# RECON60-RESQUAT-V12 TABULATION (seg60 4824FE61/6465733/34269 vs seg59 7A7E74C0/6618090/34993; literal .Contains, same method both sides; zeros re-proved by second patterns below)'
$tx += ''
$tx += 'pattern | RECON60 | RECON59'
foreach ($pp in $pats) { $tx += ($pp + ' | ' + (CountHit $lines60 $pp) + ' | ' + (CountHit $lines59 $pp)) }
$tx += ''
$tx += '## Zero re-proofs (second differently-formed patterns)'
$tx += ('MTCOLLISION-2 COLLISION | ' + (CountHit $lines60 'COLLISION') + ' | ' + (CountHit $lines59 'COLLISION'))
$tx += ('SEEDVOID-2 SEED_VOID | ' + (CountHit $lines60 'SEED_VOID') + ' | ' + (CountHit $lines59 'SEED_VOID'))
$tx += ('DEMOGUARD-2 ABORT_DEMO_GUARD | ' + (CountHit $lines60 'ABORT_DEMO_GUARD') + ' | ' + (CountHit $lines59 'ABORT_DEMO_GUARD'))
$tx += ('EVICT-2 EVICT_UNEXPECTED | ' + (CountHit $lines60 'EVICT_UNEXPECTED') + ' | ' + (CountHit $lines59 'EVICT_UNEXPECTED'))
$tx += ('MTCLOSE-SKIP SKIP-NO-SEND | ' + (CountHit $lines60 'SKIP-NO-SEND') + ' | ' + (CountHit $lines59 'SKIP-NO-SEND'))
$tx += ('MTCLOSE-NOTHING NOTHING-TO-CLOSE | ' + (CountHit $lines60 'NOTHING-TO-CLOSE') + ' | ' + (CountHit $lines59 'NOTHING-TO-CLOSE'))
$tx += ('OLDNAME MTEXEC | ' + (CountHit $lines60 'MTEXEC') + ' | ' + (CountHit $lines59 'MTEXEC'))
$tx += ('MTCLOSE-ACTION0 MTCLOSE+action=0 | ' + (CountHit2 $lines60 'MTCLOSE' 'action=0') + ' | ' + (CountHit2 $lines59 'MTCLOSE' 'action=0'))
$tx += ('MTCLOSE-DONE MTCLOSE+retcode=10009 | ' + (CountHit2 $lines60 'MTCLOSE' 'retcode=10009') + ' | ' + (CountHit2 $lines59 'MTCLOSE' 'retcode=10009'))
$tx += ('ENTRYTICKET-ZERO ENTRY_TICKET+ticket=0 | ' + (CountHit2 $lines60 'ENTRY_TICKET' 'ticket=0') + ' | ' + (CountHit2 $lines59 'ENTRY_TICKET' 'ticket=0'))
$tx += ''
$tx += '## G2 joins (60 only unless noted)'
$tx += ('DIVABORT-S5 ABORT+DIV_FALLBACK+S5_GATE_CHECK | ' + (CountHit2 @($lines60 | Where-Object { $_.Contains('ABORT') -and $_.Contains('DIV_FALLBACK') }) 'S5_GATE_CHECK' 'poi=') + ' vs EVICTSUPPRESS bar= ' + (CountHit $lines60 'EVICTSUPPRESS bar='))
$tx += ('SKIP-POST655 RESEED_BLOCKED+SKIP+2026.09.01 | ' + (CountHit2 $lines60 'RESEED_BLOCKED' '2026.09.01') + ' (rows follow the 16:55 ARM)')
$tx += ('HOLD-IN-SPAN SUPPRESSED+2026.09.01 17:+heldPoi=Yearly-POC | ' + (CountHit2 @($lines60 | Where-Object { $_.Contains('SUPPRESSED') -and $_.Contains('2026.09.01 17:') }) 'heldPoi=Yearly-POC' 'bar=') + ' (second form below)')
$tx += ('HOLD-IN-SPAN-2 SUPPRESSED bar=+Yearly-POC-held in 17:00-17:35 | ' + @($lines60 | Where-Object { $_.Contains('SUPPRESSED bar=') -and $_.Contains('heldPoi=Yearly-POC') -and ($_.Contains('2026.09.01 17:00') -or $_.Contains('2026.09.01 17:05') -or $_.Contains('2026.09.01 17:10') -or $_.Contains('2026.09.01 17:15') -or $_.Contains('2026.09.01 17:20') -or $_.Contains('2026.09.01 17:25') -or $_.Contains('2026.09.01 17:30') -or $_.Contains('2026.09.01 17:35')) }).Count)
$tx += ('FIRE-DAY EVICTSUPPRESS_FIRE day=2026.09.01 | ' + (CountHit2 $lines60 'EVICTSUPPRESS_FIRE' 'day=2026.09.01'))
$tx += ('S5SIG-901 S5_GATE_CHECK->SIGNAL+2026.09.01 | ' + (CountHit2 $lines60 'S5_GATE_CHECK->SIGNAL' '2026.09.01') + ' | ' + (CountHit2 $lines59 'S5_GATE_CHECK->SIGNAL' '2026.09.01'))
$tx += ('SIG-901 ALERT SRJ SIGNAL+2026.09.01 | ' + (CountHit2 $lines60 'ALERT SRJ SIGNAL' '2026.09.01') + ' | ' + (CountHit2 $lines59 'ALERT SRJ SIGNAL' '2026.09.01'))
$tx += ''
$tx += '## G3 joins (MTCLOSE rows + paired MTEXIT rows)'
$mtRows = @($lines60 | Where-Object { $_.Contains('MTCLOSE bar=') })
$mxRows = @($lines60 | Where-Object { $_.Contains('MTEXIT') })
foreach ($mm in $mtRows) { $tx += ('MTCLOSE> ' + (StripWall $mm)) }
foreach ($mm in $mtRows) {
  $barVal = ($mm -replace '.*bar=([0-9.]+ [0-9:]+).*', '$1')
  $refVal = ($mm -replace '.*ref=([0-9.]+).*', '$1')
  $mate = @($mxRows | Where-Object { $_.Contains('bar=' + $barVal) })
  $exVal = 'NONE'
  if ($mate.Count -ge 1) { $exVal = ($mate[0] -replace '.*exit=([0-9.]+).*', '$1') }
  $flag = 'MISMATCH'
  if ($refVal -eq $exVal) { $flag = 'MATCH' }
  $tx += ('JOIN bar=' + $barVal + ' ref=' + $refVal + ' exit=' + $exVal + ' ' + $flag)
}
$tx += ''
$tx += '## Per-day localization (60/59; all delta families)'
$days = @('2026.08.28','2026.08.31','2026.09.01','2026.09.04','2026.09.07','2026.09.08')
$fams = @('SUPPRESSED','FRESHCOUNT','TPCENSUS','EXITCENSUS','A6REFUSED','ABORT reason=','SIDE1C_CHAIN','VETOCLEAR','SESSION_CLOSED','FRESH_OB_DEAD','FRESH_OPP_FVG','HEADS-UP','STAND-DOWN','TP_ELECT','EXITVERDICT','ANCHOR_ELECT')
foreach ($dd in $days) {
  $row = $dd
  foreach ($ff in $fams) { $row += (' | ' + $ff + '=' + (CountHit2 $lines60 $ff $dd) + '/' + (CountHit2 $lines59 $ff $dd)) }
  $tx += $row
}
$tx += ''
$tx += '## Set-diffs (wall-stripped unique lines; 60-only vs 59-only counts + the differing lines)'
$sdFams = @('MTSNAP','PRE-SEND','MTEXIT','MTLIFE fields=','ABORT reason=','order performed','deal performed')
foreach ($ff in $sdFams) {
  $aa = @($lines60 | Where-Object { $_.Contains($ff) } | ForEach-Object { StripWall $_ } | Sort-Object -Unique)
  $bb = @($lines59 | Where-Object { $_.Contains($ff) } | ForEach-Object { StripWall $_ } | Sort-Object -Unique)
  $onlyA = @($aa | Where-Object { $bb -notcontains $_ })
  $onlyB = @($bb | Where-Object { $aa -notcontains $_ })
  $tx += ('FAMILY ' + $ff + ' only60=' + $onlyA.Count + ' only59=' + $onlyB.Count)
  foreach ($ll in $onlyA) { $tx += ('  60> ' + $ll) }
  foreach ($ll in $onlyB) { $tx += ('  59> ' + $ll) }
}
$tx += ''
$tx += '(End of file)'
$tx | Set-Content -LiteralPath $outFile -Encoding utf8
'WROTE_LINES=' + $tx.Count
'POSTCOUNT_FILE=' + (Get-Content -LiteralPath $outFile).Count
