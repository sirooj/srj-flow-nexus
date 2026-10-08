# BUILDER RESULT B-88 - why B-87 refused four valid takes; his "XOB retracement or touch" words on the selected XOB do not reproduce the B-83 separation, MEASURED

Trader summary: read his words on the machine's selected XOB at the candle the machine counts, from inputs the EA can read, on all fourteen register rows. The pick-only reading PX meets on six of his takes (4 Sep, both 7 Sep, 11 June, 3 June, 5 June owed) but not on four (28 Aug, 1 Sep, both 8 Sep) - the same four B-87 refused. So the selected-XOB reading does not reproduce the B-83 separation, which came from every-live-XOB penetration windows the EA cannot read back. Three measured differences explain the B-87 losses: a different test (stop-less in-play verdict vs his retracement-or-touch), a different candle (kept seed time vs the B60C counted candle - same only on 28 Aug and 7 Sep London), and the verdict-print coverage (prints exist only at evaluated bars). No edit, no compile, no run. Source untouched.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines), then strategy skill whole (199 lines; relevant pins re-read: s177-178, s185, RETEST-DIES-BY-BODY-CLOSE-ONLY, QUOTE-WORDS-POINT-AT-ROWS).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-87` returns `c5fa75cbe888545f4e0f9a343e1098552eb88fde` (verified). Cut `builder/B-88` at it. Push via `backup` (never `origin`).
- 0.3 Read in order on `builder/B-87`: pointer (30 lines, stale block noted for X4); RESULT_B87 (63) + SLICE_B87 (90) whole; RESULT_B86 R1-R7 + SLICE_B86 R3 rows; RESULT_B84 whole (K3 readable pieces); RESULT_B83 whole + SLICE_B83 conventions (line 3), R1 quotes, R2 table, R3 cells (2004), R3 rollup, R4 table (65 passes); PLANNER_CONTEXT whole (90, B-87 lesson present); PLANNER_HANDOFF whole (34, B-87 arc present); spec v4.2 focus sections re-read (§1.2, §3.5, §3.5.1, §3.6, §8, §9.7, §9.10, §9.11, §10; whole read verified current via gate); register whole (65, unchanged via gate); journal CSV grep only (1066 lines; rows 9/13/33/257/301/312/313 verified present; 310/314 whole on SLICE_B83 record); ledger/AGENTS/.clinerules grep only.
- 0.4 Names per relay (kept EA 137076D9CF85 / ex5 FA4C924978F6; .B82C 55D91C7E / .B87PICKXOB 5066BAB9 read-only; j43 8EDD1254 / j44 113541CF / j45 BF03B8A2 / j46 9B2F44B6 / jB87 8EA948C5 disk + F19B32C5 LFnorm, 16251676 B; code names and register labels as listed; tag B88-PICKX-RECONCILE; ledger 1233).
- 0.5 Start gate: `git log -1` = c5fa75c. `git status --short` line count 359 (untracked lane dirt). `git diff c5fa75c --stat -- <paths>` (flags before `--` per the B-87 owned defect) EMPTY on every 0.3 committed text file + ledger + register + both skills + spec + SLICE_B84. Pre-existing multi-lane drift outside 0.3 ACCOUNTED, untouched, unstaged. Ledger `^1232.` = 1, `^1233.` = 0, `B88-` = 0. Journal CSV 1066 lines. Result-against-commit: `B-87-PICK-XOB-INPLAY-DIAG` = 1, `B-87:` = 1. Disk SHAs: EA 137076D9CF85 ✓, ex5 FA4C924978F6 ✓, .B82C 55D91C7E ✓, .B87PICKXOB 5066BAB9 ✓, j43-j46 prefixes ✓, jB87 as above (new record). terminal.ini 5F0336A0 ≠ 88A0DEB1 + 3 chart files drifted: ACCOUNTED terminal re-save noise on exit (Tester Symbol/Dates = last-run RECON62 state, LastScan, docking bytes; content-diffed vs `.preB87`), semantics unchanged, no launch this turn, ini/chart writes forbidden in scope, never staged. No terminal64 running. No STOP.
- 0.6 Scope MEASURED (reads/greps/arithmetic on existing journals + source; zero tolerance; no edit/compile/run; text records only).

## Part B - banking

- B1 Grep-first: skill phrase `not yet a valid bias for short` = 1 (ALREADY_BANKED pattern). His message carries the B-87 reply line only. Record `no new rule words`; append nothing.

## Part R - reading (every row names journal + EA SHA)

- R1a ZoneInPlay whole pasted from kept EA (raw in slice, :7118-7169): bar-range overlap → true; nearest protective-side swing → true; stop-less: second distinct swing → else false (two-swing depth); with stop: swing walk back to stopRef. 4th/5th args = SL-leg bound (stop reference + have-stop flag). Vs spec §3.5 (penetration by bar range or confirmed protective swing at any point in the leg; no recency, no bar-count limit) + §9.10 (build consults eval bar + two swings): shape SAME, depth DIFFERENT - the exact contradiction §9.10 names. Record only.
- R1b Kept prints + computations pasted (raw in slice): ZONEPICK :8872-8883 over :8865-8869 (`ZoneInPlay(barShift, ..., s1_stopRef, s1_haveStop)`); INPLAYCOMMIT :9286-9289 over the t133 walk (:9260-9282, own stop-leg implementation). Vs B-87 call `ZoneInPlay(b87_cntShift, hi, lo, 0.0, false)`: zone source SAME (buffers 22/23), shift DIFFERENT (anchorBarTime-derived vs evaluation barShift), stop args DIFFERENT (0.0/false vs s1/stop-leg). Three in-play implementations on disk. B-86 R3 read the ZONEPICK verdict with committed alongside; PX-retrace uses the ZONEPICK verdict the same way.
- R1c B60C cSrc/rBar code pasted from .B82C (:2541-2557): retestShift via `iBarShift(..., g_b61RetestTime, true)`; rBar = bar at shift; cSrc RETEST/PRIOR/BOTH. B-87 cntBar at each take's confirmation bar (jB87 EA 5066BAB9) vs B-83 counted (j45/j46 EA 55D91C7E): A1 09:55 vs 09:55 SAME; A2 17:30 vs 16:45+17:25 DIFFERENT; A3 15:45 vs 15:40+15:50 DIFFERENT; A4 09:00 vs 09:00+09:10 SAME-first; A5 16:15 vs 16:05+16:35 DIFFERENT; A6 10:05 vs 10:00 DIFFERENT; A7 16:30 vs 16:45+16:50 DIFFERENT. B-87 read its seed candle, matching the counted candle only twice.
- R2 The four lost takes (jB87 EA 5066BAB9 beside j43 EA 137076D9; B-83 MACH cells from SLICE_B83 R3):
  - 28 Aug London SHORT: first B87 REFUSE at its own 10:00 bar (cntBar 09:55, zone 1.16492-1.16507, inPlay=0; conf-bar rows REFUSE). B83: same 2149 zone reads P-MACH MET at 09:55 (formation-window penetration); touch NOT MET on both readings (09:55 high 1.16491 vs zone lo 1.16492, 1pt short, zero tolerance). Cause: TEST (same candle; stop-less verdict vs penetration + AGAINST close).
  - 1 Sep NY LONG: B87 REFUSEs 15:55-16:05 on the seed path (xob 1.15855-1.15862, inPlay=0); conf-bar 17:30 rows exist with PASS (cntBar 17:30, xob 1.15975-1.16013, inPlay=1) yet no fire (seed dead upstream; S2 SHORT holder at 17:30 on jB87). B83 MACH MET at 16:45/17:25 (touch via 2549 at 17:25). Cause: CASCADE + CANDLE (upstream refusal; 17:30 ≠ counted candles).
  - 8 Sep London SHORT: B87 REFUSE at conf 10:05 (cntBar 10:05 ≠ counted 10:00; zone 1.16362-1.16377 = B83's 2898, P-MACH MET at 10:00). Cause: CANDLE + TEST.
  - 8 Sep NY SHORT: B87 REFUSE rows cntBar 16:30 (≠ counted 16:45/16:50; same 2898 zone, B83 P-MACH MET); conf-bar 16:55 rows REFUSE. Cause: CANDLE + TEST.
- R3 PX table (pick = latest ZONEPICK/INPLAYCOMMIT print at-or-before the candle; promo from buffer-33 print; zero tolerance; BOTH either-MET; full cells in slice):

| row | counted candle(s) | pick (latest≤candle) | PX-touch | PX-retrace | PX | MACH X | verdict |
|---|---|---|---|---|---|---|---|
| A1 | 09:55 | 1.16492-1.16507 @09:55, inplay 0, promo 06:40 | NOT MET | NOT MET | NOT MET | MET | DIFFERENT |
| A2 | 16:45, 17:25 | 1.16081-1.16100 @16:05, inplay 0, promo 09:15 | NOT MET | NOT MET | NOT MET | MET | DIFFERENT |
| A3 | 15:40, 15:50 | 1.15907-1.15933 @15:40/@15:45, inplay 1, promo 09-03 | MET (15:40) | MET (15:50) | MET | MET | SAME |
| A4 | 09:00, 09:10 | 1.16098-1.16109 @09:00, inplay 1, promo 08:55 | MET | MET | MET | MET | SAME |
| A5 | 16:05, 16:35 | 16:05: 1.16362-1.16377 @15:05 inplay 0; 16:35: 1.16229-1.16253 @16:15 inplay 1 | NOT MET / MET | NOT MET / MET | MET | MET | SAME |
| A6 | 10:00 | 1.16362-1.16377 @10:00, inplay 0, promo 09-03 | NOT MET | NOT MET | NOT MET | MET | DIFFERENT |
| A7 | 16:50 | 1.16362-1.16377 @16:50, inplay 0, promo 09-03 | NOT MET | NOT MET | NOT MET | MET | DIFFERENT |
| B3 | 14:05, 14:30 | 160.489-160.504 @11:05, inplay 1, promo 08:30 (next 14:35 same zone) | NOT MET / NOT MET | NOT MET / MET | MET | MET | SAME |
| C3 | 09:00 | 159.906-159.913 @09:00, inplay 1, promo 09:00 | MET | MET | MET | MET | SAME |
| B2 | 16:00 | 159.881-159.916 @15:55, inplay 1, promo 15:40 (next 16:05 same) | MET | MET | MET | MET | SAME |
| F1 | 14:20 | 159.679-159.694 @11:55, inplay 0, promo 11:30 (unchanged thru 14:55+) | NOT MET | NOT MET | NOT MET | NOT MET | SAME |
| F2 | 16:25 | 1.16612-1.16640 @11:55, inplay 0, promo 08-26 (next 17:00 same) | NOT MET | NOT MET | NOT MET | MET | DIFFERENT |
| F3 | 09:10, 09:45 | 09:10: 159.861-159.913 @06-03 18:50 (stale 14h, next 09:45 differs); 09:45: 160.001-160.012 @09:45 inplay 0 | MET / NOT MET | NOT MET | MET | MET | SAME* |
| F4 | 15:30 | latest 10:25 haveXob=0 (empty); next 15:50 differs | UNKNOWN | UNKNOWN | UNKNOWN | MET | DIFFERENT |

  SAME as MACH X: A3, A4, A5, B3, C3, B2, F1, F3 (8, *F3 with stale-carry flag). DIFFERENT: A1, A2, A6, A7, F2, F4 (6). Caveats beside (reported, not ruled): A2-17:25 next-print zone is 2549 (1.15975-1.16013, promoT 17:25, touched by 17:25) - a same-candle promotion edge under §3.5.1; A5-16:05 and F3-09:10 next-print conflicts noted above. R5 does not hinge on them (A1/A6/A7 carry fresh AT-candle prints).
- Buffers 22/23 written indicator-side FOUND (SRJ_FlowLogic.mq5:708 bind; :1206-1230 publish nearest valid+activated+promoted in-bias OB, EMPTY default; selector :1098-1100 skips !isValid/!isActivated). Post-invalidation publish: NOT FOUND (no row shows an invalidated id still published; A1-2149 held 06:40-15:30+ through touches - touch never consumes per XOBSUIT-1 §6 answer 1).
- R4 65 passes (43 EU + 22 UJ, MACH rows parsed from SLICE_B83 R4): 28 PX≠MACH (4 of them NO-ROW→MET on 8/26). Fires 13: PX MET 7 / NOT MET 6 (A1, A2, A6, A7, 5/27, F1). Refusals 5: MET 1 (9/4 09:40 FRESH_OB_DEAD) / NOT MET 3 / UNKNOWN 1 (6/10 10:25). Every differing pass named in the slice table.
- R5: PX DOES NOT SEPARATE - names A1 (28 Aug), A2 (1 Sep), A6 (8 Sep London), A7 (8 Sep NY): his valid takes read PX NOT MET. F1 NOT MET holds; F2 NOT MET / F3 MET-stale / F4 UNKNOWN beside, never deciding.
- R6: BUILDABLE-PX. Inputs FOUND with lines: pick zone :6911/:8800 (any shift) + counted candle .B82C :9392/:9413/:9602; promo :8790 + same candle; OHLC :2289+/:2490-2495 + same candle; verdict fn :7118 (shift-callable; B-87 proved it runs) + same candle. Caveats (measurements, not permission): verdict prints exist only at evaluated bars (145/107 vs 3168/4320 bars - R3/R4 UNKNOWNs are journal-coverage gaps); pick carry is print-invisible across unevaluated bars (A2-17:25 conflict measured); B-87 implemented the verdict gate and refused 4 valid takes.

## Part X - records

- X1 §4 grep `B-88-GATE-MATCHES-READING` = 0 -> appended (verified 1). §5 grep `relay B-88` = 0 -> appended (verified 1).
- X2 §3 grep `B-88` = 0 -> appended (verified 1).
- X3 Ledger item 1233, tag B88-PICKX-RECONCILE (absent verified; R1 SAME/DIFFERENT, R2 causes, R3 table result, R4 counts, R5/R6 verdicts, X1/X2).
- X4 Pointer 30 -> 16 lines (cap 35): stale B-86 block deleted exactly as listed (verified `1231 (B86` = 0, `NO .B84X cut` = 0); B-88 state (MEASURED, R5+R6, kept unchanged, next B-89).

## Part F - file, push, reply

- F1 this result. F2 slice BUILDER_SLICE_B88.md (R1 code, R1c/R2 tables, R3 cells, R4 65-pass table, greps; under 600 lines). F3 ledger 1233. F4 pointer per X4. F5 stages only result/slice/ledger/pointer/PLANNER_CONTEXT/PLANNER_HANDOFF. F6 commit + push builder/B-88 via backup + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA 137076D9 (695359 B, LF-only, untouched; still shows ` M` vs the stale GitHub blob = expected uncommitted lag, never staged) + `.preB87`/`.B87PICKXOB` kept uncommitted. EA.ex5 FA4C9249 (matching kept source). terminal.ini + 3 charts drifted by terminal re-save noise (ACCOUNTED, restored copies kept). No terminal64. No edit/compile/run (jB87 + prior journals read only).

No carried note (no STOP; nothing to ask him).
