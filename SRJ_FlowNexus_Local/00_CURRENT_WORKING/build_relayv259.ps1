# Build v259 from v258 by scripted amend (Q1/Q2 carried byte-identical) + splice E/X markers + battery. Console prints counts/hashes only.
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$PKT = Join-Path 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS' 'PACKET_P-EVICT-1.md'
$SEG59 = Join-Path $H 'RECON59-EVICT-V1_JOURNAL.log'
$V258 = Join-Path $H 'BUILDER_RELAY_COUNCIL_v258-RESQUAT-SOLVE.md'
$V259 = Join-Path $H 'BUILDER_RELAY_COUNCIL_v259-RESQUAT-PLUS-EXIT.md'
if (Test-Path -LiteralPath $V259) { 'V259_EXISTS_HALT'; exit 1 }
$eaLines = Get-Content -LiteralPath $EA
$jb59 = Get-Content -LiteralPath $SEG59
$base = Get-Content -LiteralPath $V258
'BASE_LINES=' + $base.Count
function HasOnce($lines, $m) { return @($lines | Where-Object { $_.Contains($m) }).Count }
function RangeOf($lines, $a, $b) { return @($lines[($a - 1)..($b - 1)]) }
function RowsOf($lines, $nums) { $o = @(); foreach ($n in $nums) { $o += $lines[$n - 1] }; return $o }
$R1 = '# BUILDER RELAY COUNCIL v258-RESQUAT-SOLVE (2026-09-24, NEW solve-request: rule the cause + propose the code; session CONTINUE)'
$R2 = '- Session: CONTINUE (same evict tree, same window, same question family as v257, new ask).'
$R3 = '- R-e alert-only demo bounds, no live money ever; exits untouched (exit-model work is out of scope on his word); 48 indicator buffers (no new buffers without a same-edit bump).'
$R4 = '- Owed back: two verdicts (Q1 cause + Q2 edit spec) in the answer forms above, same text compared across seats; a checkable discrepancy from any seat halts per standing rule 19 with same-turn disk verification.'
$R5 = 'Counts: DIV_FALLBACK 9/0, S5-to-S4 0-vs-3, takes whole-line set-diff 0, veto-on-9/1 61-vs-62, feed 563338 ticks + 3168 bars both runs.'
$R6 = '## 6. Seat packaging (same text all four seats)'
'ANCHOR_R1=' + (HasOnce $base $R1)
'ANCHOR_R2=' + (HasOnce $base $R2)
'ANCHOR_R3=' + (HasOnce $base $R3)
'ANCHOR_R4=' + (HasOnce $base $R4)
'ANCHOR_R5=' + (HasOnce $base $R5)
'ANCHOR_R6=' + (HasOnce $base $R6)
$N1 = '# BUILDER RELAY COUNCIL v259-RESQUAT-PLUS-EXIT (2026-09-24, COMBINED solve-request: re-squat cause+code PLUS exit-executor code; supersedes untransported v258; session CONTINUE)'
$N2x = '- Scope merge on his COMBINE word: exit-executor legs join as Q3 so one build plus one run settles both the re-squat and the D2 paper-exit defects; v258 was superseded untransported and never carried; Q1/Q2 text below is byte-identical to v258. Grading disclosure: executing exits shifts the balance path, so later takes re-derive lots while bars and entries stay identical; grading is bars-first, lots-second.'
$N3 = '- R-e alert-only demo bounds, no live money ever; exits joined ONLY by Q3 execution legs on his COMBINE word (exit-model direction still out; live stays alerts-only with tester closes only); 48 indicator buffers (no new buffers without a same-edit bump).'
$N4 = '- Owed back: three verdicts (Q1 cause + Q2 re-squat edit + Q3 exit-executor edit) in the answer forms above, same text compared across seats; a checkable discrepancy from any seat halts per standing rule 19 with same-turn disk verification.'
$N5 = 'Counts: DIV_FALLBACK 9/0, S5-to-S4 0-vs-3, takes whole-line set-diff 0, veto-on-9/1 61-vs-62, feed 563338 ticks + 3168 bars both runs. Exit side: MTEXIT 6, EXITVERDICT 155, want=1 0/0, SL/TP fills broker-side, BREAK/DAY fills absent.'
$Q3 = @(
'## Q3. Propose the exact exit-executor code (his COMBINE word joins exit legs to this relay so one build plus one run settles both the re-squat and the paper-exit defects).',
'- Context in one paragraph: entries attach broker SL/TP at send (E2), so stop and target exits fill on their own; EvaluateManagedTrade (E1) computes five verdicts, but on any verdict it only flips paper state, prints MTEXIT/MTLIFE, and alerts - its own header states ALERT-ONLY preserved, never an order. Hence the 8/28 11:40 Daily-POC body-break verdict (X1: EXITVERDICT vBREAK=Daily-POC, MTEXIT exit 1.16439) never closes the short, which dies at the 17:00 stop fill 1.16510; and the 9/4 23:55 DAY_CLOSE verdict (X2: MTEXIT exit 1.16093) never flattens the long, which exits at the 9/7 target fill 1.16307. His exit rules are settled (11:35 break exit on 8/28 London; always flat near day close): only the legs are unbuilt. MT_HTF_EXIT stays false (E3: his trend experiment), so HTF exits are out; vSL/vTP already execute through the broker; the pending CANCEL_BIAS path is out.',
'- Q3 verdict: implement ___. (file + function + anchored old-to-new + line budget)',
'- Answer form: (i) edit spec as whole old blocks and whole new blocks on the post-build tree digest, naming the close call, the position identity used (session magic at E4; g_mtrade carries no ticket - propose), and the close print price (nextOpenPx, same as the paper leg); (ii) line budget arithmetic from literal counts; (iii) rule-preservation list, one line per rule R-a..R-e (amended R-e), each naming the lines that hold it - live stays alerts-only with tester closes only, per the standing alert-only rule; (iv) observability: EXITVERDICT prints no vDAY field today (X2 proves it: vSL/vTP/vBREAK/vHTF only) - the proposal carries its own execution prints for every leg it adds; (v) grading bar accepted: 8/28 exit 11:40 near 1.16439 plus 9/4 flat 23:55 near 1.16093 (his 11:35 versus tester 11:40 is the same event at bar granularity, on record) plus 9/1 take plus 5 other takes identical bars and entries (lots re-derive downstream of changed exits, graded second) plus 9/4-invalid still refused plus MTCOLLISION 0, any other election delta halts.',
'- Scope notes the proposal must respect: SL/TP legs untouched (broker-owned); HTF leg untouched (experiment holds); CANCEL_BIAS pending path untouched; one managed record only (MTCOLLISION REPLACED path untouched); priority order SL, TP, BREAK, HTF, DAY_CLOSE stands.',
'',
'## EVIDENCE C - exit code (byte-spliced; whole contiguous EA regions, post-build line numbers)',
'',
'<<E1-EA11095-11309>>',
'',
'<<E2-EA10214-10222>>',
'',
'<<E3-EA128-132>>',
'',
'<<E4-EA10168-10172>>',
'',
'## EVIDENCE D - exit rows (byte-spliced; TAB-separated)',
'',
'<<X1-SEG59-6927-7873>>',
'',
'<<X2-SEG59-17323-18022>>',
''
)
$built = @()
foreach ($bl in $base) {
  if ($bl -eq $R1) { $built += $N1 }
  elseif ($bl -eq $R2) { $built += $bl; $built += $N2x }
  elseif ($bl -eq $R3) { $built += $N3 }
  elseif ($bl -eq $R4) { $built += $N4 }
  elseif ($bl -eq $R5) { $built += $N5 }
  elseif ($bl -eq $R6) { $built += $Q3; $built += $bl }
  else { $built += $bl }
}
'BUILT_LINES=' + $built.Count
$emark = @('<<E1-EA11095-11309>>','<<E2-EA10214-10222>>','<<E3-EA128-132>>','<<E4-EA10168-10172>>','<<X1-SEG59-6927-7873>>','<<X2-SEG59-17323-18022>>')
foreach ($mk in $emark) { 'EMARK_' + $mk + '=' + (HasOnce $built $mk) }
$blocks = @{}
$blocks['<<E1-EA11095-11309>>'] = @('--- EA 11095-11309 EvaluateManagedTrade (215) ---') + (RangeOf $eaLines 11095 11309) + @('--- end E1 ---')
$blocks['<<E2-EA10214-10222>>'] = @('--- EA 10214-10222 broker send (9) ---') + (RangeOf $eaLines 10214 10222) + @('--- end E2 ---')
$blocks['<<E3-EA128-132>>'] = @('--- EA 128-132 exit scope + HTF toggle (5) ---') + (RangeOf $eaLines 128 132) + @('--- end E3 ---')
$blocks['<<E4-EA10168-10172>>'] = @('--- EA 10168-10172 execute + session magic (5) ---') + (RangeOf $eaLines 10168 10172) + @('--- end E4 ---')
$blocks['<<X1-SEG59-6927-7873>>'] = @('--- SEG59 8/28 break verdict + stop fill (5) ---') + (RowsOf $jb59 @(6927,6939,6940,6941,7873)) + @('--- end X1 ---')
$blocks['<<X2-SEG59-17323-18022>>'] = @('--- SEG59 9/4 day-close verdict + target fill (5) ---') + (RowsOf $jb59 @(17323,17324,17325,18021,18022)) + @('--- end X2 ---')
$checks = @(
  @('<<E1-EA11095-11309>>',215,'void EvaluateManagedTrade'),
  @('<<E2-EA10214-10222>>',9,'g_trade.SetExpertMagicNumber'),
  @('<<E3-EA128-132>>',5,'MT_EXIT_SCOPE'),
  @('<<E4-EA10168-10172>>',5,'Phase 2 Execution Logic'),
  @('<<X1-SEG59-6927-7873>>',5,'verdict=BREAK'),
  @('<<X2-SEG59-17323-18022>>',5,'reason=DAY_CLOSE')
)
$fail = 0
foreach ($ck in $checks) {
  $body = $blocks[$ck[0]]
  $inner = @($body | Where-Object { -not ($_.StartsWith('--- EA') -or $_.StartsWith('--- SEG') -or $_.StartsWith('--- end')) })
  $okN = ($inner.Count -eq $ck[1])
  $okF = (@($inner | Where-Object { $_.Contains($ck[2]) }).Count -ge 1)
  if (-not $okN) { 'CHECKFAIL_N ' + $ck[0] + ' got=' + $inner.Count + ' want=' + $ck[1]; $fail++ }
  if (-not $okF) { 'CHECKFAIL_F ' + $ck[0]; $fail++ }
}
'CHECKS_FAIL=' + $fail
if ($fail -gt 0) { 'SPLICE_HALTED'; exit 1 }
$new = @()
foreach ($rl in $built) { if ($blocks.ContainsKey($rl.Trim())) { $new += $blocks[$rl.Trim()] } else { $new += $rl } }
$new | Set-Content -LiteralPath $V259 -Encoding utf8
'POST_V259_LINES=' + (Get-Content -LiteralPath $V259).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $V259 | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $V259 | Where-Object { $_.Contains('...') }).Count
'Q3_PRESENT=' + @(Get-Content -LiteralPath $V259 | Where-Object { $_.Contains('Q3 verdict: implement') }).Count
'V258_TITLE_GONE=' + @(Get-Content -LiteralPath $V259 | Where-Object { $_.Contains('v258-RESQUAT-SOLVE (2026') }).Count
'EA_HASH=' + (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
'PKT_HASH=' + (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
'V259_HASH=' + (Get-FileHash -LiteralPath $V259 -Algorithm SHA256).Hash
'V259_BYTES=' + (Get-Item -LiteralPath $V259).Length
'S59_HASH=' + (Get-FileHash -LiteralPath $SEG59 -Algorithm SHA256).Hash
$raw = [System.IO.File]::ReadAllBytes($V259)
'NONASCII_BYTES=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
