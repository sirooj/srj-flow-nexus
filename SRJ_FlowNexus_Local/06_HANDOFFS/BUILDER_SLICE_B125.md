# BUILDER SLICE B-125 - raw rows and raw code spots (flip-candle reading, MEASURED)

Scope: reads + one kept RECON62 run. No edit, no compile. Indicator/includes untouched.

## START GATE (raw)

- `git ls-remote backup builder/B-124` = `564efbee5f03c3c154e6b22b3c2df64b1cd4a6ac` (verified; same on github URL; cut builder/B-125 here).
- `git log -1` = `564efbe B-124 no late bias latch trial (relay B-124); verdict RESTORED`.
- `git status --short` count = 465 (pre-existing + untracked, preserved, none staged).
- Nine-path diff vs 564efbe EMPTY (seven relay files + both skills + spec). Ledger `^1269.`=1, B124-tag=1, `^1270.`=0, `B125-`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 / EX5 FA4C924978F6 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (all PASS).
- terminal64: NONE running at gate (verified empty).

## PART B (counts)

- Operator message = B-124 reply line only. `no new rule words`; appended nothing.
- Banked 5m words: B-61 flip paragraph 1 (line 170: "16:00 flipped bearish and 16:05 flipped back bullish."); flip-candle paragraph 1 (lines 171-172); JUN05NY-ENTRY-1615 1 (line 151); B-52 entry-POI ruling 1 (line 165). Nothing appended.

## T1 KEPT RECON62-B125 (raw proof)

- Content backups terminal.ini.preB125 (4082A94F) + Profiles.preB125 (131 files). [Tester] EURUSD M5 1787702400/1788998400 read back exact.
- Launch `launch_recon62_b125.ps1`; WMI_PID=20412 RC=0; RUNNING 08-27 verified; window `testing ... from 2026.08.26 00:00 to 2026.09.10 00:00`; wrapper killed (terminal 8412 survived); watcher 1004 3-arg PID-verified; genuine DONE `RUN=RECON62-B125 RESULT=PASSED DONE=2026-10-09 13:15:35`.
- Completion `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:02:44.515` (slot fix active).
- Deals (complete, only #2-#15): #2 S 08-28 10:05 1.16466 + #3 B 11:45:02 1.16440; #4 B 09-01 17:35:01 1.16024 + #5 S 17:51:04 1.15975; #6 B 09-04 16:00 1.16019 + #7 S 23:55 1.16129; #8 B 09-07 09:20 1.16138 + #9 S 10:53:07 1.16201; #10 B 09-07 16:45 1.16264 + #11 S 17:13:30 1.16315; #12 S 09-08 10:10 1.16205 + #13 B 10:42:46 1.16102; #14 S 09-08 17:00 1.16220 + #15 B 17:26:29 1.16275. All 7 register prices identical. Must-never: zero deals.
- T3: NO STOP. T4: terminal.ini 4082A94F + Profiles 131/131 restored; terminal 8412 stopped (0 running); EA/EX5 re-verified unchanged.

## R1 RAW LINES (strategy skill)

- B-61 ruling + scope note lines 169-173 (flip kills pre-flip setups; flip-candle retest not killed/stays potential/judged at confirmation; "does not order any change to the 5m flip machinery itself").
- PLANNER RULING B-61 line 174 (planner paraphrase, explicitly not his words; narrowing + "flip reading itself is unchanged").
- B-65 lines 176-179 (verbatim flip-candle paragraph; "does not touch retest validity") + line 187 RETEST-DIES-BY-BODY-CLOSE-ONLY.
- 5M-FLIP-KILL line 116; 5M-BIAS-AT-ENTRY line 139; 6/5-TIMING line 116 tail (2026-10-02; amended by 2026-10-07 words per canon section 0); SEED-CARRY line 81; FLIP-KILLED-NEVER-VETOES line 117; CONFIRM-ONCE line 85; SAME-CANDLE-PERMITTED line 107.
- B-61 scope-note reading: about the 5m READ itself (both notes say the machinery/reading is unchanged) — NOT about which candidate a flip kills (that narrowing is the planner paraphrase). Covering words for flip-candle retests: B-61 paraphrase + B-65 verbatim.
- Spec (temp copy 35807 B): 3.3 ("Live, never latched" + flip kills pre-confirmation); 6 dedup (live-key retest updates); GATE-AUTH line 115.

## R2 RAW ROWS (kept June block 04:53)

- Machine 5m (ltf): -1.0 through 15:25-bar; +1.0 from 15:30-bar; -1.0 at 16:00-bar; +1.0 from 16:05-bar through 16:15. His (bearish 16:00 open, bullish 16:05 open): SAME both candles.
- (b) `ANCHOR_ELECT bar=2026.06.05 15:20 action=SEED Monthly-POC rank=6 tier=3 LONG` (15:25 pass); `SIDE1T_SEEDBIAS ... biasAligned=0 verdict=REJECT-BIAS-TIMING`; `STATE IDLE->S1_REGIME` 15:25; S3 by 15:55 pass (FRESHSKIP/POLL rows). Holder alive at 16:00 (S3).
- (c) 16:00 retest: NO fresh SEED (not IDLE; SUPPRESSED/HELD row at 16:00). Killed candidate: seedBT 15:20/15:25 Monthly-POC LONG — `UJDEFERABORT bar=2026.06.05 16:00 ... state=S3_ZONE_WAIT - LTF opposed, abort deferred` → `16:05:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Monthly-POC` + `STATE S3_ZONE_WAIT->ABORT`. Code: deferred application EA:8751-8758 → GoAbort(ABORT_LTF_MISALIGN). (B-117 "S2SEEDBIAS_KILL/SEEDBIAS_REFUSED" = same 16:05 death, shorthand; rows read LTF_MISALIGN deferred path.)
- (d) Post-ABORT: IDLE (ResetSequence); ANCHOR_ELECT SEED count 16:05-16:40 = 0; RETESTBOOK hits=0 at 16:05/16:10/16:15/16:20/16:25/16:30/16:35/16:40.
- (e) 16:10 CONFIRMPOLL: NONE (no rows). 16:10 OHLC o=160.009 h=160.062 l=159.981 c=160.058; ltf at 16:10-bar = +1.0 (with-trade at 16:15 open). Prediction only: 16:10 would read touchAttr/confirm vs Monthly-POC with 5m with-trade.
- (f) Hunk C (B69/B82, never re-run): seed = 16:00 retest (B60C rt=16:00; C1 reseed past kept 16:05 kill); anchor his M-POC/M-VWAP (s166); via retest-candle touch + reseed (C2/C3 + C1 B60POT); target 160.723; exit 19:16 at 160.298; entry R UNKNOWN (never filled); machine 16:55 gone.
- (g) His line M-POC/M-VWAP at 16:00 (skill line 166) vs machine Monthly-POC at 16:00 (SAME family) and Daily-POC at 16:45 (DIFFERENT; B-76).

## R3 RAW PATHS (kept runs)

- A1: 10:00 pass IDLE→S1→S2→S3 + PREBIND_FAIL; 10:05 pass S3→S5 (CONFIRM_PREBIND 10:00) → SIGNAL. Same-pass seed + prebind.
- A2: `SIDE1C_PREEMPT bar=2026.09.01 17:30 from=Yearly-POC/SHORT to=Monthly-VWAP/LONG state=S2 (wouldPreempt=1)` → S2→S3→S4→S5. Preempt transfer; never S1 for LONG.
- A3: seeds 15:35 + 15:45 (Monthly-POC, same-pass S1→S2→S3→S4) + anchor update S4→S3 to Yearly-POC at 15:50 → S4→S5→SIGNAL 16:00. (15:40 S5→ABORT = TP_RR_FAIL, not flip.)
- A4: seed 09:05 IDLE→S1→S2 (Weekly-POC) + arm → S4→S5 09:20.
- A5: seed 16:20 S1→S2 + armed hold (S4 HOLD 16:35/16:40) → S4→S5 16:45. (16:10 SHORT seed + 16:15 WOULDPREEMPT-eval led nowhere.)
- A6: S1WAIT 09:55 → S1→S2→S3→S4 same 10:05 pass (zone 1.16362-1.16377) + supersede Weekly→Monthly-POC at 10:10 → fire. Retained-1-bar + anchor update.
- A7: seed 16:10 IDLE→S1→S2 (Weekly-POC SHORT) → arm → fire 17:00.
- 27 May: S4→S5 15:35 (seed rows not extracted). 3 Jun: seed 09:00 census TREND → arm → S4→S5. 4 Jun: retained seed (S1WAITs + latch 09:45) → S2→S3→S4→S5. 5 Jun 16:55: second seed 16:50 → S1→S2→S3 → PREBIND S3→S5. 11 Jun: seed 14:20 → S1→S2 14:25 → S3/S4 → S4→S5.

## R4 GRADES (FC-A: flip retest stays potential; FC-B: + stands after same-direction kill)

- A1-A7/B3/C3: unchanged (no flip kills on paths; A3 abort = TP_RR_FAIL).
- B2 5 Jun NY: NEWLY ALIVE both readings — to 16:10 bar, entry 16:15 open; silencer today: SUPPRESSED/HELD slot + 16:05 abort. FC-B = FC-A here.
- 4 Jun: unchanged (no flip; fired). 2 Jun: unchanged (no flip-candle retest; birth-reject + OB-death stand). 10 Jun: unchanged (body-close kill). 5 Jun LDN: unchanged (S2 refusals). 1S15:30: unchanged (flip-candle retests 15:35/15:50 hits=2 BUT all confirms 0 after → no live path). 4S10:40: UNKNOWN (no candidate rows; no kept fire). 27 Aug: UNKNOWN (seed+reseed rows, no flip mapping; no kept fire). 28A16:25: unchanged (livePass=0). 8S16:45: unchanged (livePass=0). 27 May: unchanged. 09-01 09:55: unchanged (S5 ABORT stands; entry INVALID per W5 anyway).
- Necessary test: A/B3/C3 unchanged ✓; 5 Jun NY gains 16:10 ✓; ruled-outs gain nothing ✓ (two UNKNOWNs named). FC-A: SEPARATES (no breaker). FC-B: identical (no row splits them).

## CENSUS RAW (every 5m kill, both kept runs)

- 2JUN 14:20 LONG M-POC: birth-refusal REJECT-BIAS-TIMING; 5m -1.0/-1.0 (before/at, against); FC n/a; next with-trade: none extracted; next hit: none; later firing: none. (+ 10:00/10:40 SHORT LTF aborts, 5m -1.0; retest mapping UNKNOWN; later firing: none.)
- 5LDN 09:25/09:35 SHORT: S2 SEEDBIAS kills 09:30/09:40 (+ABORTs); 5m +1.0/+1.0 (against, 09:20-09:40); FC n/a (refusal); next with-trade (-1.0): 09:50 bar (register C line 47); next hit: UNKNOWN; later firing: none.
- 10JUN 15:30 LONG D-POC: birth-refusal; 5m -1.0/-1.0; FC n/a; next with-trade: UNKNOWN; next hit: none extracted; later firing: none.
- 5NY 16:00 LONG M-POC: LTFFLIP 16:00 + deferred + ABORT LTF_MISALIGN 16:05 (S3); 5m +1.0 → -1.0 (flip candle ✓); FC-A YES + FC-B YES; next with-trade: 16:05-bar +1.0; next hit: 16:45 hits=2; later firing: 16:50 seed → #8 16:55 (an FC-preserved 16:00 potential to 16:15 would consume the slot first — observed mechanism, priority undecided).
- 0901 09:55 LONG W-VWAP: ABORT LTF_MISALIGN S5; 5m -1.0 → +1.0 at 09:55-bar (flip WITH-LONG at entry bar; W5 counts from close); FC n/a for entry (INVALID per 5M-BIAS-AT-ENTRY); later firing: none.
- 0901 15:15→15:55 SHORT M-POC cascade: LTFFLIP 15:15/15:35/15:50 + ABORTs 15:20/15:30/15:40/15:55; 5m -1.0 → +1.0 at 15:15 (against-SHORT), stays +1.0; FC-A keeps 15:35/15:50 retests; confirms: none → no live path; next with-trade (-1.0): none extracted; later firing: none.
- 0907 15:20 SHORT W-POC: LTFFLIP 15:20 + ABORT 15:25 (S4); 15:15 retest hits=2 (pre-flip, not flip-candle); FC n/a; later firing: none.
- 0827 cascade SHORTs: LTFFLIP 09:20/09:30/09:45/10:00/10:05/10:15/10:20 + ABORTs; 5m +1.0 (against) 09:15-09:25; retest mapping UNKNOWN; later firing: none (27 Aug silent kept).
- A2: no kill (preempt). All other A/B3/C3/27May paths: no kills.

## R5 RAW SITES (kept EA)

- CheckLtfAlign EA:2572-2578 (LTF buffer by shift, pure read, single site). S2SEEDBIAS_KILL EA:8708. Deferred application EA:8751-8758. S3-S5 invariant Task 79 EA:7618-7641 (S3-through-S5 load-bearing, never S2). S2 gate EA:8691-8694. Reseed gate s1f_seedArmed=(IDLE) EA:8355 + IDLE-gated comment EA:8490. Dedup census SUPPRESSED EA:8296-8331 (HELD/SUPERSEDED counted, never written; B3 supersession never writes EA:307).
- Narrowest site for a separating reading: seed gate (admit flip-candle retest to seed/update despite held same-direction candidate — EA:8355-8357 + SUPPRESSED block). Draft no hunk.

## RECORD LINES (exact)

- X1 §4: `- B125-PATH-PER-TAKE (planner lesson 2026-10-09): before any edit to a seed hold, release or kill, name the path each valid take fires through (same-pass, retained, update, preempt, yield, prebind) on both kept runs; B-124 released no-regime seeds and lost the 1 Sep long, whose kept fire rides a 17:30 preempt transfer off the held short candidate and never passes a regime check, and B-124 K2(b) predicted it held.`
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-125; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: `- B-125: measured which candidate the 5 June New York 16:05 abort killed and graded his flip-candle retest words on every register row and every kept 5m kill on both whole runs; one unchanged kept RECON62 run, no source edit.`
- X4 ledger `1270.` (tag `B125-FLIP-CANDLE-READING`; T + R0-R5 + provenance; no rule invention).
- X5 register: untouched (MEASURED).
- X6 pointer (cap 35): latest B-125; kept re-proof 7/7; R2(c) seedBT-15:20 kill; FC-A/FC-B SEPARATE; kept SHAs; 4JUN + 5JUN-1615 open; goal open.
- Pre-commit: X1/X2/X3 counts 1; X4 count 1; `^1269.` = 1; staged = 6 relay files (register untouched, unstaged); no source/EX5/journal/log/settings diff.

(End of slice)
