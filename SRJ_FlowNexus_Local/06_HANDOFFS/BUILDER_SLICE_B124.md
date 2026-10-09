# BUILDER SLICE B-124 - raw diff, raw rows, raw code (no-late-latch trial, RESTORED)

Scope: one EA hunk + one compile + RECON62 j47 + June j48 + restore-on-STOP. Indicator/includes/HTFEngine untouched.

## START GATE (raw)

- `git ls-remote backup builder/B-123` = `0cf90ad72d5ad7e2601141f9c695dbdc5620d35c` (verified; cut builder/B-124 here).
- `git log -1` = `0cf90ad B-123 HTF staleness and panel flavor (relay B-123); verdict MEASURED`.
- `git status --short` count = 454 (pre-existing + untracked, preserved, none staged).
- Seven-path diff vs 0cf90ad EMPTY. Ledger `^1268.`=1, `^1269.`=0, `B124-`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 / EX5 FA4C924978F6 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 (all PASS).
- terminal64: NONE running at gate (verified empty).

## PART B (counts)

- Operator message: verification + relay paste (HTF-parking = planner X1 lesson text, relay-authorized, not a strategy rule). `no new rule words`; appended nothing.

## K1 SPOTS (authority + checked-against)

- Spec 3.2: "Both may hold; no precedence, no differential treatment. Neither → the candidate does not advance." Spec 3.1: POI retest fires a candidate inside a window. Spec 6: live-key retest updates the candidate. GATE-AUTH line 115 ("Silence ... never consent"). B-120 R2 MIXED. Line 198 reason 1. Checked: SEED-CARRY line 81 (persistence, regimes unmeasured); lines 51-52 (potential vs setup); line 83 default-keep (R2-renewal scope, builder-owned). No authorizer, no contradictor → proceed.

## K2 RAW PREDICTION ROWS

- 4JUN retests: `RETESTBOOK bar=2026.06.04 09:10 hits=1 Daily-POC:r10:dS`; `09:15 hits=0`; `09:20 hits=1 Daily-VWAP:r11:dS`; `09:25/09:30/09:35/09:40 hits=0`; `09:45 hits=1 Daily-POC:r10:dS`. Census SHORT votes=1 trendOk=0 every bar 09:10-09:40 (#110-116), first votes=2 at 09:45 (#117). No ANCHOR_ELECT SEED after 09:10 on kept.
- A2 preempt code EA:8184 (`if(t78_opp && (g_state == ST_S2_LTF_ALIGN || ...))` — fresh opposite retest + S2 holder; no same-direction hold consulted) + transfer EA:8188-8209 (anchor/dir/seed-time rewritten). SHORT holder seed census #117 votes=2 (B-120 slice).
- A6: RETESTBOOK 10:00 hits=0; 10:05 hits=1 Monthly-POC:r6:dS. Census #186 (10:00 bar) votes=2 TREND.
- Other retains: 2JUN SHORT 09:20+/10:55+ S1WAITs never fired; 3JUN 18:30+ SHORT retains never fired; 09-01 09:50 LONG yield (no S1, no fire).

## K3 BACKUPS (raw SHAs)

- `.preB124` src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (kept PASS) + ex5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (kept PASS); terminal.ini.preB124 `4082A94F`; Profiles.preB124 131 files. No terminal64 before launch (0).

## K4 DIFF (complete, vs .preB124; +1/-1 one line, EA:8683-8684)

```
@@ -8681,7 +8681,7 @@
-        { ... PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", ...); return; }
+        { ... PrintFormat("[SRJ-EA] S1RELEASE bar=%s dir=%s poi=%s sess=%s - regime unclassified at retest, candidate RELEASED (B-124; votes/sweepTag on same-pass REGIMECENSUS row)", ...); GoAbort(ABORT_NO_REGIME, g_state); return; }
```

- Full text: old prints S1WAIT + `return` (retain); new prints S1RELEASE + `GoAbort(ABORT_NO_REGIME, g_state); return;` (ABORT_NO_REGIME defined EA:393, hooks EA:6850/6857/7400 never before wired; GoAbort → ST_ABORT + ResetSequence → IDLE, EA:6868-6871, so next retest seeds fresh).
- Print-field note: S1RELEASE carries bar/dir/anchor/sess; votes/sweepTag/mrOk live on the same-pass REGIMECENSUS row (ClassifyRegime returns regime only — no signature change). Join key: bar+dir.
- Edited `.B124NOLATCH` = `43490AFBA9F5772E7C4869DB92700D02FF8042F0E0C19C714085B9F7D75B8A9F` (695450 B, CR=0). Scope: zero buffer/payload/bias/CQD/target/stop/exit/concurrency lines. S1WAIT print gone (remaining hits: comments 7624/7761 only).

## K5 COMPILE (raw)

- `Result: 0 errors, 0 warnings, 10571 ms elapsed, cpu='X64 Regular'`; ok=true; binary_fresh=true. Trial EX5 `4953000C65F233B2B901B79E01774484C226E8953FDA1EEE2ADE8C1E41A680CA` (466176 B; SHA filed, binary overwritten by restore). Indicator ex5 still 27B5F272DCFA.

## T1 RECON62 j47 (raw proof)

- Launch `launch_recon62_b124.ps1` (RECON50 ini identical); WMI_PID=5448 RC=0; RUNNING 08-26→08-27; window `testing ... from 2026.08.26 00:00 to 2026.09.10 00:00`; wrapper killed (terminal 22456 survived); watcher 8012 3-arg PID-verified; genuine DONE `RUN=RECON62-B124 RESULT=PASSED DONE=2026-10-09 12:47:47`.
- Completion `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:04:29.363` (slot fix active).
- Deals (complete): #2 S 08-28 10:05 1.16466 + #3 B 11:45:02 1.16440; #4 B 09-04 16:00 1.16019 + #5 S 23:55 1.16129; #6 B 09-07 09:20 1.16138 + #7 S 10:53:07 1.16201; #8 B 09-07 16:45 1.16264 + #9 S 17:13:30 1.16315; #10 S 09-08 10:10 1.16205 + #11 B 10:42:46 1.16102; #12 S 09-08 17:00 1.16220 + #13 B 17:26:29 1.16275. NO 09-01 deal (A2 LOST). Must-never: zero deals. Balance vs 10474.64: NOT FOUND (no balance print in log/STATUS; no .htm; method stated).
- A2 kill rows: `17:35:01 STATE IDLE->S1_REGIME LONG Monthly-VWAP` (fresh seed, NO SHORT holder → no preempt) → census NONE → `S1RELEASE bar=2026.09.01 17:30 ...` → `ABORT reason=NO_REGIME` (+A6REFUSED ABSENT_DECLINED). PREEMPT-family rows at 17:25-17:35: 16:55 transfer + 17:15 WOULDPREEMPT-eval only — no 17:30 transfer.
- S1RELEASE examples: 08-27/08-28/08-31 LONG/SHORT sequences; 09-08 09:30/09:40/09:50 SHORT Weekly-POC.

## T2 JUNE j48 (raw proof)

- Launch `launch_june0525_b124.ps1` (June ini identical); WMI_PID=416 RC=0; RUNNING 05-25 synced; window `testing ... from 2026.05.25 00:00 to 2026.06.13 00:00`; wrapper killed (terminal 2104 survived); watcher 8424 3-arg PID-verified; genuine DONE `RUN=JUNE0525-B124 RESULT=PASSED DONE=2026-10-09 12:56:17`.
- Completion `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:05:53.872` (same scale).
- Deals (complete): #2 B 05-27 15:35 159.344 + #3 S 20:08:14 159.535; #4 B 06-03 09:10:00 159.932 + #5 S 09:59:40 159.983; #6 S 06-04 09:55:00 159.868 + #7 B 10:40:20 159.920; #8 B 06-05 16:55:00 160.120 + #9 S 19:16:32 160.298 (no 16:15); #10 B 06-09 16:55:03 160.209 + #11 S 17:15 160.194 (NEW); #12 B 06-11 14:40:22 160.530 + #13 S 15:23:06 160.588 (5.61). No 06-01/06-02/06-05-morn/06-08/06-10/06-12 deals. Must-never: zero. Balance vs 10395.28: NOT FOUND (same method).
- 4 June rows: S1RELEASE 09:10 D-POC + 09:20 D-VWAP (09:15/09:25-09:40: no retests); census #232-234 NONE; CQDRECHECK state=IDLE (candidate gone); fresh `ANCHOR_ELECT bar=2026.06.04 09:45 action=SEED Daily-POC` (IDLE→S1) + census #235 votes=2 TREND + S1→S2→S3→S4 same 09:50 pass → 09:50 confirm=1 → deal #6.
- 9 June rows: day-long S1RELEASEs (09:55/10:00/10:35/11:10/11:15/11:30/11:35/14:15 LONGs freed the slot) → fresh `SEED 16:45 Weekly-VWAP` + census #493/#494 votes=2 TREND → IDLE→S1→S2→S3 same 16:50 pass → deal #10 (kept: a retained holder blocked this seed — slot-freeing side effect).

## T3 PREDICTION MARKS

- (a) fire persists via fresh 09:45 seed → HELD (rows above). (b) A2 via preempt → WRONG (no 17:30 transfer; fresh LONG aborted NO_REGIME). (c) A6 via fresh 10:05 retest → HELD (deal #10 same bar/price). (d) no other retained-fire → HELD (9 June filed under (f)).

## T4 VERDICT LINES + T5 RESTORE (raw SHAs)

- (a) A1-A7 NOT identical (A2 lost). (b) B3/C3 identical YES. (c) 4 June gone? NO. (d) new must-never: 9 June NEW fire YES. (e) B2 16:15? NO. (f) 9 June #10/#11 + A2 absent. → RESTORED.
- Restored: EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` + EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (from .preB124, re-verified). terminal.ini `4082A94F` + Profiles 131/131. Terminals 22456/2104 stopped by PID (0 at file time). Indicator/HTFEngine untouched.

## RECORD LINES (exact)

- X1 §4: `- B123-HTF-LANE-PARKED (planner lesson 2026-10-09): B-121 to B-123 found the EA already reads the confirmed HTF candle; of nine machine-vs-chart splits one is a one-candle lag that moves no trade and eight persist past the close, mostly against session-level journal cells and inside the spec 9.1 feed bound; equalizing to his chart threatens B3 and C3. The HTF read lane is parked with no edit; reopen only on new bar-named reads of his.`
- X2 §4: `- B124-NO-LATE-LATCH (planner lesson 2026-10-09): grade a necessary-condition reading by whether every valid take passes and the ruled-out fire fails, not by whether ruled-out rows that other gates already silence also fail; B-120 RA was read as DOES NOT SEPARATE on 2 June, 10 June and 5 June London, which stay silent by other gates.`
- X3 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-124; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X4 §3: `- B-124: trial removing the late regime latch (a seed with no regime at its retest candle is released, not held for a later bar), graded on RECON62 and June.`
- X5 ledger `1269.` (tag `B124-NO-LATE-LATCH`; K1/K2/T/verdict/SHAs/runs; no rule invention).
- X6 register: RESTORED → nothing appended.
- X7 pointer (cap 35): latest B-124 RESTORED; T4 (a)-(f); kept SHAs; HTF parked (X1); 5JUN-1615 open; goal open.
- Pre-commit: X1/X2/X3/X4 counts 1; X5 count 1; `^1268.` = 1; staged = 6 relay files (register untouched, unstaged); no source/EX5/journal/log/settings diff.

(End of slice)
