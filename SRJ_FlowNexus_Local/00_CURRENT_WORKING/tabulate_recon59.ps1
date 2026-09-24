# Tabulate RECON59-EVICT-V1 vs RECON58 (2026-09-24; literal .Contains counts, same method both sides; set-diffs on wall-stripped lines).
$H = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$seg59 = Join-Path $H 'RECON59-EVICT-V1_JOURNAL.log'
$seg58 = Join-Path $H 'RECON58-RETEST-V1_JOURNAL.log'
$out = Join-Path $H 'RECON59-EVICT-V1_TABULATION.txt'
if (Test-Path -LiteralPath $out) { 'TABULATE_EXISTS_HALT'; exit 1 }
if (-not (Test-Path -LiteralPath $seg59)) { 'SEG59_MISSING_HALT'; exit 1 }
if (-not (Test-Path -LiteralPath $seg58)) { 'SEG58_MISSING_HALT'; exit 1 }
$L59 = Get-Content -LiteralPath $seg59
$L58 = Get-Content -LiteralPath $seg58
'PRECOUNT_59=' + $L59.Count
'PRECOUNT_58=' + $L58.Count
function Count-Hit($lines, $pat) { return @($lines | Where-Object { $_.Contains($pat) }).Count }
function Count-Hit2($lines, $a, $b) { return @($lines | Where-Object { $_.Contains($a) -and $_.Contains($b) }).Count }
function Strip-Wall($lines) { return @($lines | ForEach-Object { $_ -replace '^[^\t]*\t[^\t]*\t[^\t]*\t', '' }) }
$pats = @('ALERT SRJ SIGNAL','ALERT SRJ EXIT','ALERT SRJ HEADS-UP','ALERT SRJ STAND-DOWN','MTSNAP','EXECUTE_ACCT','PRE-SEND','order performed','deal performed','MTLIFE fields=','MTEXIT','DAY_CLOSE','TP_ELECT','EXITVERDICT','FRESH_VETO','A6REFUSED','HEADS-UP','STAND-DOWN','RENEW','MTCOLLISION','SEEDVOID','DIV_FALLBACK','EVICT_UNEXPECTED_ORIGIN','S5_GATE_CHECK->S4_ARMED','S5_GATE_CHECK->ABORT','S5_GATE_CHECK->SIGNAL','ABORT reason=','DIV_WAIT','CONFIRM_DIV_WAIT','SUPPRESSED','SIDE1C_CHAIN','SIDE1C_PREEMPT','FRESHCOUNT','VETOCLEAR','TP_TOUCH','EXITCENSUS','LTFFLIP','XOB-PROMOCENSUS','WS161_CENSUS','BIASCENSUS_FINAL','ZONECENSUS_FINAL','TPCENSUS','DEMO_GUARD','TP_RR_FAIL','FRESH_OPP_FVG','SESSION_CLOSED','LTF_MISALIGN','FRESH_OB_DEAD','FRESH_VETO','LINEWIDTH')
$tx = @()
$tx += '# RECON59-EVICT-V1 TABULATION (seg59 7A7E74C0/6618090/34993 vs seg58 424A5A0C/6624800/35016; literal .Contains, same method both sides; zeros re-proved by second patterns below)'
$tx += ''
$tx += 'pattern | RECON59 | RECON58'
foreach ($p in $pats) { $tx += ($p + ' | ' + (Count-Hit $L59 $p) + ' | ' + (Count-Hit $L58 $p)) }
$tx += ''
$tx += '## Zero re-proofs (second differently-formed patterns)'
$tx += ('MTCOLLISION-2 COLLISION | ' + (Count-Hit $L59 'COLLISION') + ' | ' + (Count-Hit $L58 'COLLISION'))
$tx += ('SEEDVOID-2 SEED_VOID | ' + (Count-Hit $L59 'SEED_VOID') + ' | ' + (Count-Hit $L58 'SEED_VOID'))
$tx += ('DEMOGUARD-2 ABORT_DEMO_GUARD | ' + (Count-Hit $L59 'ABORT_DEMO_GUARD') + ' | ' + (Count-Hit $L58 'ABORT_DEMO_GUARD'))
$tx += ('EVICT-2 EVICT_UNEXPECTED | ' + (Count-Hit $L59 'EVICT_UNEXPECTED') + ' | ' + (Count-Hit $L58 'EVICT_UNEXPECTED'))
$tx += ''
$tx += '## 9/1-focused census (59 only unless noted)'
$tx += ('SUPPRESSED and 2026.09.01 | ' + (Count-Hit2 $L59 'SUPPRESSED' '2026.09.01') + ' | ' + (Count-Hit2 $L58 'SUPPRESSED' '2026.09.01'))
$tx += ('SIGNAL and 2026.09.01 | ' + (Count-Hit2 $L59 'ALERT SRJ SIGNAL' '2026.09.01') + ' | ' + (Count-Hit2 $L58 'ALERT SRJ SIGNAL' '2026.09.01'))
$tx += ('S5->SIGNAL and 2026.09.01 | ' + (Count-Hit2 $L59 'S5_GATE_CHECK->SIGNAL' '2026.09.01') + ' | ' + (Count-Hit2 $L58 'S5_GATE_CHECK->SIGNAL' '2026.09.01'))
$tx += ('DIV_FALLBACK and 2026.09.01 | ' + (Count-Hit2 $L59 'DIV_FALLBACK' '2026.09.01') + ' | ' + (Count-Hit2 $L58 'DIV_FALLBACK' '2026.09.01'))
$tx += ('ABORT and 2026.09.01 | ' + (Count-Hit2 $L59 'ABORT reason=' '2026.09.01') + ' | ' + (Count-Hit2 $L58 'ABORT reason=' '2026.09.01'))
$tx += ''
$tx += '## Set-diffs (wall-stripped unique lines; A-only vs B-only counts + the differing lines)'
$fams = @('MTSNAP','PRE-SEND','order performed','deal performed','MTEXIT','MTLIFE fields=','ABORT reason=')
foreach ($f in $fams) {
  $a = @(Strip-Wall @($L59 | Where-Object { $_.Contains($f) }) | Sort-Object -Unique)
  $b = @(Strip-Wall @($L58 | Where-Object { $_.Contains($f) }) | Sort-Object -Unique)
  $onlyA = @($a | Where-Object { $b -notcontains $_ })
  $onlyB = @($b | Where-Object { $a -notcontains $_ })
  $tx += ('FAMILY ' + $f + ' only59=' + $onlyA.Count + ' only58=' + $onlyB.Count)
  foreach ($l in $onlyA) { $tx += ('  A> ' + $l) }
  foreach ($l in $onlyB) { $tx += ('  B> ' + $l) }
}
$tx += ''
$tx += '(End of file)'
$tx | Set-Content -LiteralPath $out -Encoding utf8
'WROTE_LINES=' + $tx.Count
'POSTCOUNT_FILE=' + (Get-Content -LiteralPath $out).Count
