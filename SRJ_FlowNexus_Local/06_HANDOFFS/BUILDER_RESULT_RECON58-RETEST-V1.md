# BUILDER_RESULT_RECON58-RETEST-V1 (2026-09-23, G1-G4 graded: G1 PASS, G2 FAIL, G3/G4 itemized)

## Authority (all present before the first gate pull)

- Packet 01_TASKS\PACKET_P-RETEST-2.md v2 053D85FD/7062/51 (E1 L7782, +0/-0/+1).
- Council 4/4 clear (V250 Sonnet/GLM/Kimi YES + V251 Luna YES, all filed whole 1x).
- Luna key RETEST-2 CLEARED one-build-one-run (PASS 5/5, SPENT HERE on this build+run).
- His words banked: build + run (this session) + completion word (this session).
  Commit rule revised this session per his order (builder-called, commit after
  every build): build commit 66da45c landed pre-run; this result rides the result commit.
- Stop-and-report mismatch condition checked green before any grade.

## Execution record (S1-S5 on DONE)

- DONE=PASSED 2026-09-23 20:37:33 on his completion word. Runtime 0:52:00 wall
  (19:45:33 launch to 20:37:33 DONE; 90 ceiling respected; no REFUSED pre-flight).
- Segment: 06_HANDOFFS\RECON58-RETEST-V1_JOURNAL.log
  424A5A0C8945AA032A6D46A97bcd1ae6b27587b6df17d1d12ec5b32eb1303271 /
  6624800 B / 35016 lines (wrapper-archived; STATUS terminal state PASSED).
- Baselines: RECON57 6F242EAC/4274727/24144 (5 takes) + RECON51 segment on disk
  (8/28 + 9/7-1645 reference lifecycles, pulled raw, never typed).
- Feed identical to RECON57 (563338 ticks, 3168 bars; BIASCENSUS_FINAL,
  ZONECENSUS_FINAL, PROMOCENSUS 469, N1 body/wick/vwap 28/30/0 all identical;
  WS161 loads/stores 3168/3168 mismatch 0 - changes 215 vs 218, itemized below).
- Final balance 10506.13 (delta +196.45 vs 10309.68: 8/28 SL loss + 9/7-1645 TP win
  + lot-shrink on shared wins, from fills).
- Tabulation: machine pulls on the segment (literal patterns; zeros re-proved
  with second patterns; 57-control re-derived for CHAIN); full matrix in
  06_HANDOFFS\RECON58-RETEST-V1_TABULATION.txt.

## Realized delta (packet L-novel-evidence vocabulary)

- DELIVERED (a) both sweep-then-retest takes on the R2 tree: 8/28 10:05 SHORT
  entry 1.16466 lots 2.38 (MTSNAP/SIGNAL/OrderSend chain; entry/bar/lots/fills
  51-identical incl SL fill 17:00:17 at 1.16510) + 9/7 16:45 LONG (SIGNAL R2.34
  SL 1.16238 TP 1.16315 identical to 51; fill 1.16264 identical to 51; TP fill
  17:13:30 at 1.16315 identical to 51; lots 3.92 vs 3.99 balance-path).
- DELIVERED (b) SEEDVOID silence on both seed paths (0 SEEDVOID rows run-wide;
  57 fired ~70 under the unscoped rule - the design effect, no MEANREV seed
  ever touched).
- DELIVERED (c) 9/4-invalid refusal preserved (10:35 S4 ABORT FRESH_OPP_FVG +
  10:40 S5 FRESH_VETO + A6REFUSED + STAND-DOWN, defense in depth intact).
- NOT delivered: 9/1 take missing (signal absent; regression vs 57 which took
  9/1 17:35 2.04). Mechanism diagnosed same block (below) - unpredicted
  election delta, G2 fails closed on it.
- CHANGED vs promise: R figures (8/28 realized R2.43, packet said 3.43) +
  9/7 realized entry 1.16264 (packet said 1.16261) + 8/28 realized exit is the
  17:00 SL (packet said 11:40) - all three corrected below with 51-segment proof.

## Acceptance grades

- G1 PASS: compile logs 06_HANDOFFS\RETEST-V1_EACOMPILE.log +
  RETEST-V1_FLOWCOMPILE.log: Result 0 errors 0 warnings both targets
  (EA 6863ms, FlowLogic 6301ms; colon-diagnostic zeros re-proved). Post:
  EA B01CBA64/622155/11317 (budget 11317 +0/-0/+1 modified from literals;
  +31 B = +30 line chars + 1 EOL-normalization candidate, bounded, no
  second-line evidence; EOL census on record). Build commit 66da45c.
- G2 FAIL: hard-gate take 1 PASS-WITH-CORRECTION (8/28 10:05 1.16466, chain +
  fills 51-identical; R realized 2.43 not 3.43 - 51 booked farther TP 1.16322
  pre-nearest-wins, current tree books nearest 1.16364 per his settled rule;
  packet figure withdrawn). Hard-gate take 2 PASS-WITH-CORRECTION (9/7 16:45
  R2.34 chain + fills 51-identical; realized entry 1.16264 both runs, packet
  1.16261 corrected to realized). SEEDVOID-absence PASS (0 rows). 9/4-invalid
  refusal PASS. MTCOLLISION 0 PASS. Other-4 takes identical bars/entries PASS
  (9/4, 9/7-0920, 9/8 x2; lots 2.48/1.96 vs 2.49/1.92 balance-path, noted).
  9/1 take MISSING - FAIL. Any-unpredicted-delta HALTS: halted here.
- G3 MIXED: identical - feed/census/RENEW/MTCOLLISION/TP_ELECT/alert-kinds/
  shared-take booking. Deltas itemized: MTSNAP net +1; MTLIFE 6 lifecycles;
  EXITV +22, PREEMPT/FRESHCOUNT/A6REFUSED/HU/SD/LTFFLIP/FRESH_VETO churn from
  the kept-seed pool; CHAIN 59 vs 66 (set-diff 24 only-58 / 31 only-57);
  WS161 changes 215 vs 218 (-3, loads/stores/bars identical, exact write
  mechanism open); N1 pocEq +2 (the two restored takes stops, downstream);
  9/4 TP silent both runs; 8/28 SL verdict row absent (print-only, fill identical).
- G4 CORRECTED: 8/28 verdict 11:40 BREAK exit 1.16439 + SL fill 17:00 1.16508,
  both =51 (packet 11:40-fill corrected to verdict-only - 51 never filled it
  either); 9/4 TP 9/7 11:12:27 =57; 9/7-0920 TP =57; 9/7-1645 TP 17:13:30 =51;
  9/8 TP/SL =57; DAY_CLOSE 3 rows =57, verdict-only in BOTH runs (57-result
  fill claim withdrawn below). Rank gate preserved (no higher-break instance
  besides the 8/28 verdict, anchor-vs-breaker ranks unchanged).
- L-final: G1 PASS / G2 FAIL / G3 MIXED / G4 CORRECTED. Selection NOT cleared.

## 9/1 miss mechanism (diagnosed read-only on the segment, same block)

- 57 voided the 16:55 + 17:00 9/1 LONG seeds at the wall (CO/IH SEEDVOID rows,
  buf 14). 58 keeps them (E1: unclassified seeds default-keep).
- The kept Yearly-POC LONG arms S4 16:50, falls back S5-to-S4 16:55 (EM row),
  then squats in S4_ARMED and vetoes every challenger (GL/DD/FP/NG rows:
  heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED action=HELD), incl the
  17:30 Monthly-VWAP LONG (same seed that wins in 57: px 1.15975 both runs,
  stuck at S2POLL slot 9 in 58, S1-to-SIGNAL in 57).
- 57 comparison at the same sim-second: holder is the seed itself
  (heldPoi=Monthly-VWAP heldState=S1_REGIME, cum_n=45) - healthy competition,
  winner proceeds. 58: foreign squatter (cum_n=70) - veto cascade, 72
  SUPPRESSED/PREEMPT rows on 9/1 alone.
- Root: the old void doubled as garbage collection for S5-rejected unclassified
  seeds; E1 removed GC for them with no eviction path, so rejects squat armed
  slots and starve later seeds. Fix direction (next packet via council): arm-slot
  expiry or S5-reject eviction for unclassified seeds (keep the MEANREV scoping,
  add the missing GC). Nothing rebuilt on assumption.
- Alternatives tested: balance/lots (sizing-only, signals unaffected - rejected);
  session marks (day-keyed, 8/28 cannot mark 9/1 - rejected); R2 touch on 9/1
  path (57 kept it under the stricter rule, so no touch - rejected, E1 cannot
  kill what the unscoped void kept); ticket collision (later entries worked -
  rejected). Sibling fields pulled (REGIMECENSUS, A6TERM slots, SUPPRESSED
  holder identity, STATE transitions).

## Record corrections owned (withdrawn errors, surviving conclusions kept)

- C1 packet/relay R3.43 (8/28): withdrawn as realized figure. 51 booked TP
  1.16322 (144/42 = 3.43) before his nearest-wins ruling; current tree books
  nearest TP 1.16364 (102/42 = 2.43) per that ruling. Take stands (entry/bar).
- C2 packet entry 1.16261 (9/7): corrected to realized 1.16264 (51 and 58 agree
  to the digit; 1.16261 is the signal reference). Exit TP 1.16315 stands.
- C3 packet G4 8/28 exit 11:40: corrected to verdict-only. 51 filled the 17:00
  SL (fill #4, same second+price as 58 #3), never the break. Verdict row stands.
- C4 RECON57 result 9/4 DAY_CLOSE 23:55 fill: withdrawn. 57 closed 9/4 via TP
  9/7 11:12:27 at 1.16302 (fill #7, same second+price+ticket as 58) - verdict
  printed, fill never happened, both runs. 57 surviving conclusions intact
  (fills, exits, counts, deployment-shut).

## Evidence rows (all machine-pulled from the segment)

- Takes: 8/28 10:05 sell 2.38 done 1.16466, out 17:00 SL 1.16508; 9/4 16:00 buy
  0.57 done 1.16019, out 9/7 11:12 TP 1.16302; 9/7 09:20 buy 2.48 done 1.16138,
  out 10:53 TP 1.16200; 9/7 16:45 buy 3.92 done 1.16264, out 17:13 TP 1.16315;
  9/8 10:10 sell 1.96 done 1.16205, out 10:42 TP 1.16102; 9/8 17:00 sell 1.96
  done 1.16220, out 17:26 SL 1.16274.
- Audit: EXECUTE_ACCT 6 rows (all takes); DEMO_GUARD 0 (two patterns);
  PRE-SEND 6 (one per entry); MTCOLLISION 0.
- Miss: 9/1 17:30 seed (px 1.15975 slot 9) SUPPRESSED-by-HELD (Yearly-POC
  S4_ARMED squatter, armed 16:50, S5-fallback 16:55); no SIGNAL, no fill.

## Goal join (window 08-26 to 09-09; scoreboard re-joined)

- HIT - 8/28 London SHORT (entry/bar 51-identical; tester SL 17:00, his 11:35
  body-break exit - exit-model gap unchanged since 51).
- HIT - 9/4 NY LONG R1.66 (identical to 57; tester TP 9/7, his day-close rule
  unbuilt - gap unchanged).
- HIT - 9/7 London LONG R1.76 (identical bars/entries).
- HIT - 9/7 NY LONG R2.34 (restored; entry/fills 51-identical).
- HIT - 9/8 London SHORT R1.94 (identical).
- HIT - 9/8 17:00 SHORT R1.96 (identical).
- MISS - 9/1 NY LONG (his VALID-not-taken; tester silent - REGRESSION vs 57,
  squatter-veto mechanism above, next packet named).
- REFUSED - 9/4 10:40 INVALID SHORT (preserved, S5 FRESH_VETO).
- Rejects silent (no off-signal takes; 12 fills == 6 signals + 6 broker exits).
  Deployment bar SHUT (no live money ever; full-journal open; exit-executor
  market-close gap + squatter GC open).

## Cost and next

- Cost: one build (one-line condition, STAGE-1 gated) + one run 0:52:00 wall
  (90 ceiling respected) + Luna key RETEST-2 SPENT. Novel evidence delivered:
  first sweep-then-retest takes on the R2 tree (a,b) + invalid-refusal
  preserved (c) + squatter-veto mechanism (the run's new finding).
- Next: squatter-eviction packet via council route (S5-reject GC / arm-slot
  expiry for unclassified seeds; MEANREV scoping kept). No relay until drafted
  + battery-green. No transport owed (relay discipline: draft turns carry no
  transport ask). Result commit follows this file (builder-called).

(End of file)
