# BUILDER RESULT B-123 - one-candle staleness of the confirmed HTF read, and which read his chart panel shows, MEASURED

Trader summary: your local MT5 panel and the machine are reading two different flavors, and I can show you exactly where. All four of your local charts (three USDJPY, one EURUSD, all live feed) load the indicator with the confirmed word switched OFF — so your MT5 panel shows the open-instant read — while the machine's handle asks for the confirmed closed-candle read. Your TradingView reads behave like the confirmed side. Against that frame, only one of the nine splits is a one-candle lag: at 1 September 17:30 the machine holds the closed 17:15 15m candle (bearish) and the very next candle's read flips bullish with your chart. The other eight splits are still there after their candles close — 4 June on all three timeframes, 11 June on all three, 3 June on 4H and 15m. So staleness explains one split, not the rest; the rest is in what the detection reads, not when it reads it. Nothing was edited, compiled or run.

## Relay order (B-123, read-only staleness + panel flavor)

- Part 0 fresh start on builder/B-122 at b948399247ec427993fa26a5800bf37932afc7d7, both skills loaded whole first (relay skill 73 lines; strategy skill 69755 B identical-bytes, all 0.1 terms on record).
- Part B banking (no new rule words; appended nothing). Part R read-only (R0 provenance corrected; R1 V8-IE1 dating true/true/false; R2 panel flavor open-instant vs EA confirmed; R3 1×LAG + 8×PERSISTS; R4 open-instant NOT READABLE on these bars; R5 no moves; R6 one-argument shape described, flavor-not-the-cause stated). Part X records (ledger 1268). Part F file + push builder/B-123 via backup.
- Verdict MEASURED. No source edit, no compile, no tester run, no chart/profile edited (read only). Engine never framed as wrong; no replacement/copy/mirror. No new rule/tolerance/number. No question to him.

## Part 0 - fresh-session start

- 0.1 Skills loaded whole first/second as ordered (.agents copy stub, never reconciled).
- 0.2 `git ls-remote backup builder/B-122` = `b948399247ec427993fa26a5800bf37932afc7d7` (verified exact). Cut `builder/B-123` at it (log -1 = b948399). Dirty tree kept (count only). Push via `backup`, never `origin`.
- 0.3 Read on builder/B-122 in order: pointer (20 lines, B-122 STOP); RESULT_B122 + SLICE_B122 whole (63/54 lines; K2 spots are the base); RESULT_B121 whole (78 lines; R2/R3/R5 reused, R1/R6 open-instant attribution superseded); RESULT_B16 whole (58 lines; D1 UJALIGN rows); spec v4.2 whole via fresh temp copy (35807 B identical; cited 1.1 structural bias, 3.2 regime, 4 evaluation timing, 9.1 feed bound, 9.6 replay defect); register whole (65 lines, 9E0C6295, disk = HEAD); PLANNER_CONTEXT whole (26436→26595 B with B-122 history; §4/§5 tails verified); PLANNER_HANDOFF whole (8106 B; B-122 absent per X3-skip, verified); HTFAUDIT-1 whole (125 lines: §1 datums, §3 explicit-false binding Sep-9 build, §4-6 mechanics/answers, §7 suspected fault, §8 unissued options, §9 discipline); journal grep-only (1066 lines); ledger/AGENTS/.clinerules grep-only (849/850 verified raw; AGENTS/.clinerules ZERO for FIX-NOT-REPLACE/15M-READS).
- 0.4 Names: kept EA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (695359 B LF-only) + handle EA:11486-11491 (passes true); EX5 FA4C924978F6; indicator 956BF3E3ADB7 / ex5 27B5F272DCFA (line 252 default false); HTFEngine D5FD5B063E75 (outBias 507, outCBias closed-only 512-516, RunOne gate 545-551, GetOutputs 598-605); runs kept-June 04:52-04:54 + RECON62 [TRIAL] 05:06-05:08 (flagged); j43 STATUS located (RUN + window only, no probe prints — not usable); UJPROBE everywhere; chart/profile/template/set files searched (below); tag B123-HTF-STALENESS; ledger 1268.
- 0.5 Start gate: log -1 = b948399; status count 454 (kept, untouched). Seven-file diff vs b948399 EMPTY. Ledger `^1267.` = 1, `^1268.` = 0, `B123-` = 0. Journal 1066 lines. SHAs (all PASS): EA 137076D9CF85, EX5 FA4C924978F6, indicator 956BF3E3ADB7, ind-ex5 27B5F272DCFA, HTFEngine D5FD5B063E75. terminal64: NONE running (verified empty; the note-and-go clause unneeded). No STOP.
- 0.6 Scope MEASURED, observed in full.

## Part B - banking

- B1 No new rule words in the current operator message (verification + paste instruction). Record `no new rule words`; appended nothing.

## Part R - records (journal + EA 137076D9 / indicator 956BF3E3 per row; UNKNOWN where absent, never filled)

- R0 Provenance as B-121 R0, corrected by B-122 K2: every UJPROBE h4/h1/m15 value is the CONFIRMED (last closed HTF candle) read, confirmedFeed=1, because the EA handle passes true (EA:11491).
- R1 Dating the V8 IE1 "confirmed selection" (ledger/packets/findings, raw with file:line): the `true` first appears in commit 8e061b1 (2026-09-27, "V8 built 14C7476C EA 0/0 + FlowLogic 0/0", ledger 876; sole -S introducer; never reverted — `PERIOD_M15, false, 60` recurs nowhere after it; 8e061b1 is an ancestor of both the B-15 chain and kept). (a) A-Q1 7-take builds (B-13 T1 7/7 exonerated, B-20 all-reproved KEPT, early Oct, post-V8): TRUE. (b) B-16 j3-era build (EA F04AF9C3 on disk 2026-10-04, post-V8 ancestor chain): TRUE. (c) 2026-09-09 HTFAUDIT-1 build (EA 82DDAB33): FALSE — explicit positional `false` (HTFAUDIT-1 lines 36-46, seven-arg call without the group slot). Corollary: the B-16 D1 UJALIGN splits were measured under confirmed=true already (guard-print flavor caveat stands).
- R2 Which read his chart panel shows, record first: (a) chart/profile/template/set files loading SRJ_FlowLogic: Profiles/Charts/Default/chart01-04.chr (all four: `path=Indicators\SRJ_FlowLogic.ex5`), each carrying `inHtf1_manual=16388||inHtf2_manual=16385||inHtf3_manual=15||inUseConfirmedHTFOnly=false||...` (raw; explicit false in every file); stock Templates/*.tpl carry no SRJ block; Profiles/Tester/SRJ_FlowLogic.set (tester-saved 2026-08-14) also `inUseConfirmedHTFOnly=false`; no file on disk sets it true; no .set/.chr loads any other SRJ indicator flavor. (b) chart01/03/04 = USDJPY, chart02 = EURUSD; all LIVE symbols (no _RAW suffix); chart timeframes UNKNOWN from file bytes (no text marker; not inferred); local MT5 Profiles/Charts/Default (his terminal). (c) MTFBox follows the same switch: FlowLogic 1463-1465 passes h1_b/h1_2/h1_3/h1_o (×3 legs) from the 1195-1197 ternary — panel on THESE charts shows the open-instant flavor too (paste raw in slice). (d) where he reads structure: spec 9.1 (TradingView/OANDA vs Dukascopy demo feed, raw in slice); HTFAUDIT-1 §1 (15m HTF chart attached; attachment unreadable, verbatim description is the datum) + §6 answer 1 (his chart's CONFIRMED 15m flip at 17:30 vs the EA's 16:45 open-instant — on THAT build). Flavor verdict: his LOCAL MT5 panel = OPEN-INSTANT (explicit false); his TradingView/OANDA reads behave CONFIRMED-style (HTFAUDIT §5-6 evidence); the EA handle = CONFIRMED. So EA-vs-local-panel differ in flavor; EA-vs-TradingView share the family, with staleness/feed deltas. Re-decided nothing.
- R3 Staleness table on existing UJPROBE rows, no run ((i) held confirmed value + closed HTF candle open time; (ii) containing candle's confirmed value at first M5 row after it closes; (iii) his read with B-121 R2 tags; (iv) ONE-CANDLE-LAG / PERSISTS / UNKNOWN; (ii) uses post-candle price — measurement, never rule):

| cell | (i) held = closed-candle open | (ii) after containing close | (iii) his read | (iv) |
|---|---|---|---|---|
| 1 Sep 15m @17:30/17:35 | -1 = M15 [17:15,17:30) | 17:45 bar: m15=+1.0 | bullish (bar-named W6) | ONE-CANDLE-LAG |
| 4 Jun 4H @09:10-09:55 | +1 = H4 [08:00,12:00) | 12:00/12:05 bars: h4=+1.0 | Bear (setup row 13) | PERSISTS |
| 4 Jun 1H @09:10-09:55 | -1 = H1 [09:00,10:00) | 10:00/10:05 bars: h1=-1.0 | Bull (row 13) | PERSISTS |
| 4 Jun 15m flip @09:50 | -1 = M15 [09:45,10:00) | 10:00/10:05 bars: m15=-1.0 | Bull (row 13; session-level) | PERSISTS |
| 11 Jun 4H @14:20-14:40 | +1 = H4 [12:00,16:00) | 16:00 bar: h4=+1.0 | Bear (setup rows 33-36) | PERSISTS |
| 11 Jun 1H @14:20-14:40 | +1 = H1 [14:00,15:00) | 15:00/15:05 bars: h1=+1.0 | Bear (rows 33-36) | PERSISTS |
| 11 Jun 15m @14:35-14:40 | -1 = M15 [14:15,14:30) | 14:45 bar: m15=-1.0 | Bull (rows 33-36) | PERSISTS |
| 3 Jun 4H @09:00-09:10 | +1 = H4 [08:00,12:00) | 12:00 bar: h4=+1.0 | Bear (setup row 9) | PERSISTS |
| 3 Jun 15m @09:00-09:10 | +1 = M15 [08:45,09:00) | 09:15 bar: m15=+1.0 | Bear (row 9) | PERSISTS |
| 7 Sep 09:15 15m (SAME) | +1 = M15 [09:00,09:15) | 09:30 bar: +1.0 | bullish (bar-named) | lag-agrees (visible) |
| 8 Sep 10:05 15m (SAME) | -1 = M15 [09:45,10:00) | 10:15 bar: -1.0 | bearish (bar-named) | lag-agrees (visible) |

  - Counts: ONE-CANDLE-LAG 1 cell, PERSISTS 8 cells. The staleness hypothesis covers the 1 Sep split only.
- R4 Open-instant value at the same candles: NOT READABLE for every cell — no run on record combined EA-passing-false with these bars (HTFAUDIT-era false build covered August bars only; B-16 j3 already passed true per R1(b); P-HTFLOG per-leg prints never shipped). Per cell: value + run + build, or NOT READABLE → all NOT READABLE. No new run.
- R5 Projection, never a grade (majority + spec 3.2 trend under (ii); open-instant column uniformly NOT READABLE): 1 Sep under (ii) (-1/-1/+1): LONG votes=1 → NONE (unchanged; preempt path anyway). 4 Jun under (ii) (+1/-1/-1): SHORT TREND (unchanged; fire stands). 11 Jun under (ii) (+1/+1/-1): LONG TREND (unchanged; B3 stands). 3 Jun under (ii) (+1/-1/+1): LONG TREND (unchanged; C3 stands). NO row changes classification under (ii); no A take, B3 or C3 moves. (Contrast B-121 R5's equalize-to-chart projection, which threatened B3/C3: the confirmed-lag frame moves nothing.)
- R6 Buildability, code only: R2 finds his local panel (open-instant, explicit false) a different flavor from the EA handle (confirmed, explicit true). Narrowest shape making the EA read equal his panel at the bar: ONE argument at the EA handle — position 7 `true`→`false` at EA:11491 (reverts all three legs engine-wide; single site; NOT engine code). Drafted nothing. And since R3 is mostly PERSISTS: the flavor is not the cause — R3/R4 point instead at the detection content of confirmed reads (structure reads disagreeing past the close) inside the 9.1 feed bound. Note the tension, plainly: flipping the handle to false would contradict his confirmed-read order (FIX-NOT-REPLACE) and GATE-AUTHORIZATION blocks it without a new pin — described, never proposed.

## Part X - text records (grep-first, each appended once, verify 1)

- X1 §4 grep `B122-LIVE-HANDLE-FIRST` = 0 → append the relay's lesson line. X2 §4 grep `B123-HTF-STALENESS` = 0 → append the relay's lesson line. X3 §5 grep `relay B-123` = 0 → append the history line. X4 §3 grep `B-122:` = 0 → append the B-122 arc line (missing: X3 skipped in B-122 with reason; lands now). X5 §3 grep `B-123:` = 0 → append the B-123 arc line. X6 ledger item 1268 (grep `B123-HTF-STALENESS` = 0 and `^1268.` = 0; verify both 1, `^1267.` = 1 beside). X7 pointer (35-line cap): latest B-123 MEASURED; R1 dating; R2 panel flavor; R3 class counts; kept EA/EX5/indicator unchanged; 4 June short and 5 June 16:15-vs-16:55 still open; project goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw rows, raw code, raw chart-file lines; under 600 lines). F3 ledger. F4 pointer. F5 stage explicit paths only (never EA/indicator/includes/ex5/journals/logs/inis/charts/profiles/backups). F6 commit + push via backup + ls-remote check. Reply exactly per relay (verdict MEASURED).

## Final disk state (MEASURED turn; kept RKD build on disk, verified)

- EA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (695359 B, LF-only) + `.preB118`/`.B1184JUN` copies kept uncommitted. EX5 FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5. Indicator src/ex5 at gate SHAs, untouched (chart files read only, never written). No compile, no launch, no tester run, no terminal/config/chart modification (no terminal64 at close — verified empty). Strategy skill, journal CSV (1066 lines), register, spec, tasks, findings untouched (read-only; greps only). Launch scripts, STATUS/DONE, watcher artifacts unstaged. Temp spec copy removed. No edit stands beyond the relay's text records.

(No carried note: every record-first search returned rows or a clean reported absence; nothing needs his eyes.)
