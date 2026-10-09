# BUILDER SLICE B-126 - raw spots, raw diff, raw rows (flip-candle trial, RESTORED)

Scope: one EA hunk + one compile + RECON62 j47 + June j48 + restore. Indicator/includes/HTFEngine untouched.

## START GATE (raw)

- `git ls-remote backup builder/B-125` = `da7308b3309d7f8cd500f6af1d9d6cb966988bcd` (verified; same on github URL; cut builder/B-126 here).
- `git log -1` = `da7308b B-125 flip-candle reading on 5 June NY (relay B-125); verdict MEASURED`.
- `git status --short` count = 465 (pre-existing + untracked, preserved, none staged).
- Ten-path diff vs da7308b EMPTY (seven relay files + both skills + spec). Ledger `^1270.`=1, B125-tag=1, `^1271.`=0, `B126-`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 / EX5 FA4C924978F6 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (all PASS).
- terminal64: NONE running at gate (verified empty).

## PART B (counts)

- Operator message = B-125 reply line only. `no new rule words`; appended nothing.

## K1 SPOTS (authority + checked-against, skill identical-bytes)

- B-61 lines 169-174 (ruling + scope note + planner paraphrase). B-65 lines 176-179 + 187. Lines 116 (5M-FLIP-KILL + 6/5-TIMING tail), 139, 151, 117, 115 (GATE-AUTH), 81, 85, 107. Spec 3.2/3.1/6 (temp copy 35807 B). No authorizer for holding; no contradictor for the hunk → proceed.

## K2 BEHAVIOR (his words only)

- Deferred LTF_MISALIGN abort applies → holder dies as today → same-direction retest at this bar seeds immediately on its own line, seedBT = this bar → S1 next pass → unchanged pipeline onward. Guards reused: inWindow, session-unused (LIVE-TRADE-BLOCKS-ALL), Detect found, same-dir. Else falls through IDLE.

## K3 SPOTS (buildability, kept EA)

- Deferred application EA:8750-8764 (`if(uj_saAbort)` + identity match EA:8753 + UJDEFERAPPLY print EA:8755 + `GoAbort(ABORT_LTF_MISALIGN, g_state); return;` EA:8756-8757 + DROP/else + `uj_saAbort = false` EA:8763).
- Reseed gate s1f_seedArmed=(IDLE) EA:8355 + IDLE seed EA:8357 + window/session gates EA:8359-8376 + Detect EA:8377 + RESQUAT EA:8379-8411 + seed assignments EA:8412-8429 (legDir, seedShift, anchorLine, rowkey, S2ResolveLive, side note, anchorBarTime=barTime, anchorPrice, S54Snap, sessionAtEntry, divLatch=false, S1 EA:8428, ANCHOR_ELECT EA:8434).
- SUPPRESSED census EA:8296-8331 (Detect EA:8306; HELD/SUPERSEDED print EA:8316-8325; never writes — B3 supersession never writes EA:307).
- RESQUAT arms ONLY on DIV_FALLBACK EA:9626-9636 → LTF aborts pass it vacuously. S1 EA:8680 + S2 EA:8691-8694 run subsequent passes (5m judgment from next candle).

## K4 PREDICTION ROWS (stated, never grades)

- 4JUN retests: 09:10 D-POC r10:dS hits=1 (seed); 09:15 0; 09:20 D-VWAP r11:dS hits=1; 09:25-09:40 0; 09:45 D-POC r10:dS hits=1. Census NONE 09:10-09:40 (#110-116), TREND 09:45 (#117). No kept reseed (IDLE-gated).
- A2: PREEMPT EA:8184 (fresh opposite + S2 holder; no same-dir consult) + transfer EA:8188-8209; SHORT census #117 votes=2 → holder independent of LONG retention.
- A6: RETESTBOOK 10:00 hits=0; 10:05 hits=1 Monthly-POC:r6:dS; census #186 votes=2 TREND.
- Others: 2JUN SHORT 09:20+/10:55+ S1WAITs never fired; 3JUN 18:30+ retains never fired; 09-01 09:50 yield (no S1, no fire).

## K5 BACKUPS (raw SHAs)

- `.preB126` src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` + ex5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5`; terminal.ini.preB126 `4082A94F`; Profiles.preB126 131 files. Terminal64 0 before both launches.

## K6 DIFF (complete, vs .preB126; +33/-0, EA:8750-8764 deferred-apply block)

```
@@ -8753,7 +8753,40 @@
-          if(uj_saA == ... && ...) { UJDEFERAPPLY print; GoAbort(ABORT_LTF_MISALIGN, g_state); return; }
+          if(uj_saA == ... && ...) { UJDEFERAPPLY print; b126_deadDir = g_dir; GoAbort(...); uj_saAbort = false;
+            [B-126] comment (12 lines); PoiRetestResult b126_pr;
+            if(inWindow && !SessionAlreadyUsed(sess, barTime) && DetectPoiRetest(barShift, b126_pr) && found
+               && same-dir as b126_deadDir) {
+              B126RESEED print; legDir/seedShift/anchorLine/rowkey/S2ResolveLive/side-note/anchorBarTime=barTime/
+              anchorPrice/S54Snap/sessionAtEntry/divLatch=false/seedBiasAl=-1/state=S1/LogState; } return; }
```

- Full text in result file K6 (byte-exact). Edited `.B126FLIPRT` = `9C1F8D3344820A86CD2A5D4C38B330CFBFFE3C897A18F0442225477475AFD458` (697526 B, CR=0). Scope: zero foreign lines (no 5m/bias/CQD/XOB/target/stop/exit/concurrency/number/tolerance/buffer).

## K7 COMPILE (raw)

- `Result: 0 errors, 0 warnings, 13937 ms elapsed, cpu='X64 Regular'`; ok=true; binary_fresh=true. Trial EX5 `C52C12FBBF046236AA89F8EFD0774E390B3950FDB7A812F31FA329211F8D50E1` (466176 B; SHA filed; binary overwritten by restore). Indicator ex5 still 27B5F272DCFA.

## T1 RECON62 j47 (raw proof)

- Launch `launch_recon62_b126.ps1`; WMI_PID=15296 RC=0; RUNNING 08-26 verified; window `testing ... from 2026.08.26 00:00 to 2026.09.10 00:00`; wrapper killed (terminal 8024 survived); watcher 8348 3-arg PID-verified; genuine DONE `RUN=RECON62-B126 RESULT=PASSED DONE=2026-10-09 13:37:25`.
- Completion `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:04:13.087` (same scale).
- Deals (complete, only #2-#15): #2 S 08-28 10:05 1.16466 + #3 B 11:45:02 1.16440; #4 B 09-01 17:35:01 1.16024 + #5 S 17:51:04 1.15975; #6 B 09-04 16:00 1.16019 + #7 S 23:55 1.16129; #8 B 09-07 09:20 1.16138 + #9 S 10:53:07 1.16201; #10 B 09-07 16:45 1.16264 + #11 S 17:13:30 1.16315; #12 S 09-08 10:10 1.16205 + #13 B 10:42:46 1.16102; #14 S 09-08 17:00 1.16220 + #15 B 17:26:29 1.16275. All 7 identical. Must-never: zero.
- B126RESEED rows (15, both windows): 08-27 18:15 SHORT W-POC; 08-28 17:45 SHORT Y-POC; 08-31 14:50 LONG W-POC; 09-01 15:35/15:45/15:55 SHORT M-POC; 09-03 11:05 SHORT D-POC; 09-03 18:20 LONG D-POC; 05-29 11:55 SHORT D-POC; 06-01 15:25 LONG M-POC; 06-02 10:45 LONG M-POC; 06-05 16:00 LONG M-POC; 06-09 09:45 SHORT W-VWAP; 06-09 16:15 SHORT W-POC; 06-10 10:20 LONG D-POC. Zero EU effect (no new/lost EU deal).

## T3 JUNE j48 (raw proof)

- Launch `launch_june0525_b126.ps1`; WMI_PID=13828 RC=0; RUNNING 05-25→05-26 verified; window `testing ... from 2026.05.25 00:00 to 2026.06.13 00:00`; wrapper killed (terminal 2860 survived); watcher 24084 3-arg PID-verified; genuine DONE `RUN=JUNE0525-B126 RESULT=PASSED DONE=2026-10-09 13:43:01`.
- Completion `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:03:32.889` (same scale).
- Deals (complete): #2 B 05-27 15:35 159.344 + #3 S 20:08:14 159.535; #4 B 06-03 09:10:00 159.932 + #5 S 09:59:40 159.983; #6 S 06-04 09:55:00 159.868 + #7 B 10:40:20 159.920; #8 B 06-11 14:40:22 160.530 + #9 S 15:23:06 160.588. NO 06-05 deal (neither 16:15 nor 16:55). No 06-01/06-02/06-08/06-09/06-10/06-12 deals. Must-never: zero.
- 5 June rows: `B126RESEED bar=2026.06.05 16:00 Monthly-POC` (16:05 pass) → `STATE IDLE->S1` → census #141 votes=3 TREND (16:05-bar) → `S1→S2→S3` 16:10 pass → CONFIRMPOLL 16:10 touchAttr=0 confirm=0 → holds 16:15 (touchAttr=0)/16:20 → sits S3 through 16:55 (SUPPRESSED the 16:45 Daily-POC retest; second seed never fires) → dies 18:30 ABORT FRESH_OB_DEAD (was S4). TPCENSUS #128/#129 best=160.723 priced, unreachable w/o confirm.
- 4 June rows: S1RELEASE n/a (B-124 print, reverted); no B126RESEED 06-04 (no flip/kill on path) → kept path untouched → deal #6 same bar/price.

## T4 VERDICT LINES + T5 RESTORE (raw SHAs)

- (a) YES (7/7). (b) YES (B3/C3/27May identical). (c) NO 16:15 (16:55 gone-but-blocked). (d) YES (no must-never). (e) NO (16:55 lost unreplaced). (f) 5JUN mechanism HELD, confirmation/entry WRONG; EU HELD. → RESTORED.
- Restored: EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` + EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5`. terminal.ini `4082A94F` + Profiles 131/131. Terminals 8024/2860 stopped (0 at file). Indicator/HTFEngine untouched.

## RECORD LINES (exact)

- X1 §4: `- B126-NAME-THE-DEAD-CANDIDATE (planner lesson 2026-10-09): before drafting a fix for a missed take, name the candidate that died by seed time, line and kill row on the kept rows, not by an earlier result's shorthand; B-117 named the 5 June 16:05 death a seed-bias refusal of his 16:00 retest, but B-125 rows show the 15:20 Monthly POC long's deferred 5m abort, with his 16:00 retest held behind it and never seeded.`
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-126; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: `- B-126: kept-build trial letting the flip-candle retest live on as its own potential after the 5m flip kills the formed setup (5 June 16:00 retest, 16:10 confirmation, 16:15 entry), graded on RECON62 then June.`
- X4 ledger `1271.` (tag `B126-FLIP-RETEST-SURVIVES`; K1-K7/T/verdict/SHAs/runs; no rule invention).
- X5 register: RESTORED → nothing appended.
- X6 pointer (cap 35): latest B-126 RESTORED; T4 (a)-(f); kept SHAs; 4JUN status; goal open.
- Pre-commit: X1/X2/X3 counts 1; X4 count 1; `^1270.` = 1; staged = 6 relay files (register untouched, unstaged); no source/EX5/journal/log/settings diff.

(End of slice)
