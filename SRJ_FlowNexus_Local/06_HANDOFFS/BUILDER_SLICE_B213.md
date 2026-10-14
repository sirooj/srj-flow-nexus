# BUILDER SLICE B-213 - raw rows (OB-dead print-only, always restored; under 600 lines)
Base: builder/B-213 cut at 1b7372e (= B-212 head). Verdict MEASURED (F1 2/6; S10a DOES NOT SEPARATE breaking 22Jul second paint; S10b SEPARATES; no trial).
## Start gate
```
log-1 1b7372e (backup exact; B-213 cut here; push via backup, never origin).
diff 1b7372e EMPTY on 0.3 files + skills + CONTEXT + HANDOFF + ledger (LF-normalized).
Disk: EA src 7c392767 / ex5 83ac8bde; Panels 4335f703; flow a8201128/c82f175e; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437. .B212D/.preB212 unstaged.
Journal: OPERATOR_TRADE_JOURNAL 1092 lines (day-log 20261014.log fresh PRE0; 341 ACCOUNTED refers to B-212 day-log generation, deleted per housekeeping; current generation T1 PRE0 + T2 PRE1057532 JL-continuous). Ledger ^1359=1 ^1360=0 pre. No terminal64. Python 3.13.16 embed. B-38 dates write+readback every launch (RECON 1787702400/1788998400; EU 1779667200/1791936000).
```
## Part B (grep-first)
```
B1 rules/46 DEAD-UNTIL-RENEWED count 1 -> ALREADY_BANKED d81d71d. No new rule words.
```
## Part R raw
```
R1 5747 S 10:00 1.13524-1.13587 lvl 1.13556 inBias1 reg 10:15 (B-210 R2; FLAGS_B210 25Jun row). Bars: 10:00 o1.13529 h1.13587 l1.13524 c1.13582 + 10:05 o1.13583 h1.13604 l1.13567 c1.13574>lvl (only pre-entry close beyond; 10:10-10:45 o/h/l/c ABSENT - B196BAR euro rows not in kept CUTs, Tester-logs rotated; activation false throughout via low test, skip yes, tickOB 1). Activation gate OrderblockMgr 102-117 shouldActivate barLow<ob.low bear / barHigh>ob.high bull; 10:00 low 1.13524<1.13524 false; 10:05 low 1.13567<1.13524 false. Skip-if-not-activated 119-121 Only attempt invalidation if activated on PRIOR bar. Live 449-455 shouldActivate live + 499-511 closedBeyondInvalidation + guards (quoted by text, line numbers real).
R2 grep activation/departure tied to OB kill: strategy rules 46 files 0; spec 1 file 1.md:16 vocabulary only ("Not on validation, not on activation"); findings 0 (code refs only); register 0. Verdict NOT FOUND. Planner reading stands (kill on body close, veto-able): 0625 words (rules/43 L16: 10:00 OB + 10:05-10:15 FVG invalidated before entry) + only pre-entry close beyond 10:05 => kill candle 10:05.
R3 22Jul 14:50 double paint (B212COLOR + B213OB, both ren0): first JL4556057/B213 2601348/2601349 ob0 n2 id9076 code3 tick0 (9076 S 13:45 1.14046-1.14061 lvl1.14054 act1 inv116025=14:35 close 1.14064 skip0); second JL4556107/B213 2601399/2601400 ob1 n1 id9080 code4 tick1 (9080 1.14033-1.14065 lvl1.14049 act1 inv116028 skip0). Writer code4 live opposite skip id9080 flag=true overwrites 9076 dead (OrderblockMgr 563-572: tickOBIsValid=true code4 quoted raw). EA FRESHCOUNT #3434 bar14:50 obDead0 fvgDead1 opp0 adverse1 HOLD pre (CUT JL4556611) reads second (alive) paint via buffer write order (FlowLogic BiasPane 1139-1140 before export 1156 g_bufOBValid/tickOB + 1157/1158; EA buffers 3/4/5 FL_BUF_LTF_OB_VALID/FVG/OPP).
R4 other doubles (all ren0, no renewal): A2 17:30 opp 0->1 (hasPersistedOpposingFVG writer ImbalanceMgr 234/357, n0->1); 10Jun 15:50 fvg 1->0 (TickValid recompute ImbalanceMgr 495 tickFVG=!filled, n0->1) + 15:55 opp 0->1 (opp writer, n1->2); 25Jun 10:35 fvg 1->0 (TickValid, n0->1). Writers quoted by text; renewal 0 all.
R5 wrapper DONE miss + day-log break (read-only): run_tester_v2.ps1 full day-log re-read every 10s (Read-Journal 52-63, scan new 99-108, 1GB+ on 2GB log) - launcher killed per RAM order after window verify, so no DONE on long runs; watch_run.ps1 64KB tail every 25s (Get-TailText 20-38, DONE on Test passed etc 42-48) only started on fast runs (<5min auto-detect), so 26-min runs use marker + confirmations (B-211/B-212 precedent; B-213 T2 marker Test passed 0:25:28 6171443/29373 + your completion confirm, disclosed). Day-log break: T0 PRE0 fresh + T1 PRE0? Actually B-212 T0 CUT orphaned (pre-1967015 generations excluded, log rotated/deleted per housekeeping); T1 PRE1967014 + archived1054401 = T2 PRE3021415 JL-continuous self-coherent by brackets+continuity. B-213 chain T1 PRE0 + archived1057532 = T2 PRE1057532 JL-continuous, no overlap/gap, verified by cut counts.
```
## Part T raw
```
Backups .preB213: Panels 4335f703 + OB 8bbf936b + flow src a8201128 + flow ex5 c82f175e + EA ex5 83ac8bde (SHAs given, before compile) + tini c725e437 content copy.
Hunk: re-applied B212COLOR byte-exact (verified True) + B213OB (tickOB setter OB life, lean PrintFormat ~170 chars, locals + read-only GetOB/g_orderblocks/g_s only). [B212COLOR] once, [B213OB] once; braces 46/46 -> 52/52 (+6/+6 hunk delta).
Compile FlowLogic 0 errors + 3 warnings at ORIGINAL 1576/1798/1872 (none in hunks) = B-208 K2 class.
ex5: post-compile Flow f54bfb54 (EA 83ac8bde untouched); pre-T1 same; post-T1 same; pre-T2 same; post-T2 same (binary proof, no mid-run move).
T1 RECON62-B213D DONE PASSED (0:03:48, 563338/3168 = B-212 fingerprint; 16/16 identical; colour + OB rows fire, e.g., tail B213OB 9/9). Leftover 21016 stopped by PID.
T2 EU0525TD-B213D PASSED per marker (0:25:28, 6171443/29373 = B-212 fingerprint; 44/44 identical; B213OB fires, e.g., 22Jul 9076/9080, 25Jun id0 code6, A1 13650; wrapper DONE absent via server restart, marker + your completion confirm used, disclosed). Leftover 17544 stopped by PID. D: 193.16 free pre, post to record after push (disk untouched by print-only).
One batch cut job_cut_b213.py (single pass, binary UTF-16 stream, PRE0/T2 PRE1057532, CRLF, CSV quoting, journal_line prefix; T1 1057532 + T2 3440396 rows, no overlap/gap True). STOP: 0 deal differs, 0 new warnings, ex5 static. No STOP.
Save/restore: .B213D Panels 3b699813 + Flow f54bfb54 verify; restored Panels 4335f703 + OB 8bbf936b + flow src a8201128 + flow ex5 c82f175e + EA ex5 83ac8bde + tini c725e437 byte-identical.
```
## Filed-trade table (vs DEALS B206T, every deal, side/date/time/price)
```
RECON62-B213D 16/16 identical, 0 mismatches side/date/time/price:
2 sell 2026-08-28 10:05 1.16466; 3 buy 2026-08-28 11:35 1.16467; 4 buy 2026-09-01 17:35 1.16024; 5 sell 2026-09-01 17:50 1.15987; 6 sell 2026-09-02 14:45 1.15747; 7 buy 2026-09-02 15:20 1.15822; 8 buy 2026-09-04 16:00 1.16019; 9 sell 2026-09-04 23:55 1.16129; 10 buy 2026-09-07 09:20 1.16138; 11 sell 2026-09-07 10:53 1.16201; 12 buy 2026-09-07 16:45 1.16264; 13 sell 2026-09-07 17:13 1.16319; 14 sell 2026-09-08 10:10 1.16205; 15 buy 2026-09-08 10:42 1.16102; 16 sell 2026-09-08 17:00 1.16220; 17 buy 2026-09-08 17:26 1.16275.
EU0525TD-B213D 44/44 identical, 0 mismatches:
2 sell 2026-05-26 15:50 1.16336; 3 buy 2026-05-26 16:51 1.16238; 4 buy 2026-05-28 11:50 1.16134; 5 sell 2026-05-28 12:12 1.16177; 6 buy 2026-06-04 10:05 1.16117; 7 sell 2026-06-04 10:21 1.16069; 8 buy 2026-06-10 16:15 1.15551; 9 sell 2026-06-10 18:00 1.15523; 10 sell 2026-06-25 10:45 1.13540; 11 buy 2026-06-25 11:00 1.13606; 12 buy 2026-06-29 16:15 1.14039; 13 sell 2026-06-29 17:19 1.14152; 14 sell 2026-07-08 14:50 1.14002; 15 buy 2026-07-08 16:32 1.14095; 16 buy 2026-07-15 10:35 1.14227; 17 sell 2026-07-15 12:32 1.14189; 18 sell 2026-07-22 14:55 1.14048; 19 buy 2026-07-22 14:59 1.14075; 20 sell 2026-07-28 10:45 1.13689; 21 buy 2026-07-28 11:25 1.13714; 22 buy 2026-08-05 11:20 1.15409; 23 sell 2026-08-05 11:41 1.15346; 24 buy 2026-08-17 15:55 1.15947; 25 sell 2026-08-17 17:15 1.15961; 26 sell 2026-08-28 10:05 1.16466; 27 buy 2026-08-28 11:35 1.16467; 28 buy 2026-09-01 17:35 1.16024; 29 sell 2026-09-01 17:51 1.15975; 30 sell 2026-09-02 14:45 1.15747; 31 buy 2026-09-02 15:20 1.15822; 32 buy 2026-09-04 09:30 1.16296; 33 sell 2026-09-04 10:51 1.16249; 34 buy 2026-09-07 09:20 1.16138; 35 sell 2026-09-07 10:53 1.16201; 36 buy 2026-09-07 16:45 1.16264; 37 sell 2026-09-07 21:25 1.16239; 38 sell 2026-09-08 10:10 1.16205; 39 buy 2026-09-08 10:42 1.16102; 40 sell 2026-09-08 17:00 1.16220; 41 buy 2026-09-08 17:26 1.16275; 42 sell 2026-09-22 19:00 1.14314; 43 buy 2026-09-22 19:13 1.14306; 44 sell 2026-10-08 11:35 1.11884; 45 buy 2026-10-08 12:13 1.11819.
```
## Part S (OBLIFE_B213.csv 23 rows, SEPARATOR_B213.csv 28 rows)
```
S10a (dead on body close, activated or not) DOES NOT SEPARATE, breaking 22Jul second paint 1 (25Jun 1->2 fixed, 10Jun 2 holds, A1-A7 <=1 holds).
S10b (S10a + dead until renewed, ren0 repaint not alive, rules/46) SEPARATES (A1-A7 <=1 all passes/paints; 10Jun 2, 25Jun 2, 22Jul 2/2; C OTHER-GATE; others INFO unchanged for review).
A OBs: A1 13650 dead already changed no; A2-A7 renewal/flip alive changed no. Others: S10a/b = S9a changed no (28Jul 2 holds; rest 0/1). Full per-paint OB + writer + ren + counts in OBLIFE; per-take verdicts in SEPARATOR.
Buildability (B-84/B-149): buffers 3/4/5 FOUND EA-readable; fvgExists display unexported; S10a kill + S10b no-reset indicator-side. Smallest hunks for EA=S10b: H1 OB-leg dead (S10a kill + S10b persist) + H2 fvgExists export.
```
## X records
```
LESSONS +1 B-213-READ-THE-PAINT (folded HISTORY for cap; <20k). CONTEXT 5+1 Brain B-213. HANDOFF 3a F1 2/6 + 3b B-213 (keep 10). FIXPLAN F2 two misses with times/prices. Ledger 1360. Pointer lane F1 2/6 + S10a/b + R5 (35-line cap).
```
## Size gate (READ_MAP files)
```
pointer/6000+35 PASS; result/12000 PASS (5423); CONTEXT PASS; LESSONS PASS (<20k folded); HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy max PASS; relay PASS; READ max PASS; FIXPLAN PASS; OBLIFE PASS; SEPARATOR PASS; BOOTSTRAP PASS; READ_MAP rewritten PASS. All under cap or STOP (none).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads 40m; edits+compile 15m; T1 0:03:48 + verify/archive 6m; T2 0:25:28 + verify/cut 30m (server restart disclosed, marker+confirm used); cut 3m; grade 1m; S-grade 10m; X/records 15m; push/filing follow. Total ~120m.
Final disk: sources kept byte-identical (EA 7c392767, Panels 4335f703, flow a8201128, OB 8bbf936b, SESS 16573a5b, POI 5AF5E035); flow ex5 c82f175e; EA ex5 83ac8bde kept of record (T1 16/16 + T2 44/44); .B213D/.preB213 unstaged; tini blessed c725e437; no terminal64; CUT_B213 (T1+T2 JL-continuous) unstaged; day log stays (housekeeping manifests next); MQL5 live log stays (not relay evidence). No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
```
(End of slice)
