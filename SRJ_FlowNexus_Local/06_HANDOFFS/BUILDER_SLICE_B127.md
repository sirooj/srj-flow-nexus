# BUILDER SLICE B-127 - raw spots, raw rows, R3 table (confirmation-candle reading, MEASURED)

Scope: reads + text records only. No edit, no compile, no run. Indicator/includes/HTFEngine untouched.

## START GATE (raw)

- `git ls-remote backup builder/B-126` = `b07f52315cc6ae07d051641746d21abc3a3f6db5` (verified; cut builder/B-127 here).
- `git log -1` = `b07f523 B-126 flip-candle retest survives holder kill trial (relay B-126); verdict RESTORED`.
- `git status --short` count = 481 (pre-existing + untracked, preserved, none staged).
- Ten-path diff vs b07f523 EMPTY (pointer, RESULT_B126, SLICE_B126, ledger, PLANNER_CONTEXT, PLANNER_HANDOFF, register, both skills, spec, journal CSV).
- Ledger `^1271.`=1, B126-tag=1, `^1272.`=0, `B127-`=0 everywhere. PLANNER_CONTEXT `B126-NAME-THE-DEAD-CANDIDATE`=1, `relay B-126`=1, `B126-FLIP-RETEST-SURVIVES`=0 (ACCOUNTED), `B127-WHOLE-PATH-BEFORE-HUNK`=0, `relay B-127`=0. PLANNER_HANDOFF `B-126:`=1, `B-127:`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 (695359 B LF-only CR=0) / EX5 FA4C924978F6 / .B126FLIPRT 9C1F8D33 / .B82C 55D91C7E / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA (236533 B loaded both runs) / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (all PASS).

## PART B (counts)

- Operator message = B-126 reply line only. `no new rule words`; appended nothing.
- Banked words: CONFIRMATION-CANONICAL 1 (s112); TOUCH-OR-BREAK 2 (s105 + s112 ref); SAME-CANDLE-PERMITTED 1 (s107); CONFIRM-ONCE 1 (s85); VENUE-CORRECTION 2 (s88 + s95 ref); BAR-MAPPING-CANONICAL 1 (s114); JUN05NY-ENTRY-1615 1 (s151); B-52 ruling 1 (s165); 2026-10-07 ruling 1 (s169). Nothing appended.

## R0 PROVENANCE (raw)

- Trial rows: `JUNE0525-B126` trial EX5 `C52C12FBF046236AA89F8EFD0774E390B3950FDB7A812F31FA329211F8D50E1` DONE `2026-10-09 13:43:01` (STATUS PRE_JOURNAL_LINES=485642; tester 13:41:36 rows below).
- OHLC/POI values: `JUNE0525-B117` kept EA 137076D9 (STATUS 04:50:39-04:54:49 PRE_JOURNAL_LINES=9; UJBARMAP identical both blocks).
- EU rows: `RECON62-B125` kept EA 137076D9 DONE 13:15:35.
- Indicator: `InpFlowLogicName=SRJ_FlowLogic` + `program file added: IndicatorsSRJ_FlowLogic.ex5. 236533 bytes loaded` in both June headers (04:51:23 + 13:39:22); disk ex5 27B5F272DCFA untouched.

## R1 RAW LINES (strategy skill)

- s105 TOUCH-OR-BREAK (verbatim his confirmation rule; either valid retest TOUCH or BREAK with BODY CLOSE; zero margin; Daily-POC 160.523 Q2 answer).
- s107 SAME-CANDLE-PERMITTED (verbatim his clarification; same-bar PERMITTED iff closes into setup-bias direction, never REQUIRED; general form 09:35 + 09:40 + 09:45 open).
- s85 CONFIRM-ONCE (verbatim his 9:35/9:40/9:45 words; one bar suffices; later bars never re-litigate).
- s88 VENUE-CORRECTION + NEXT-OPEN-ONLY (verbatim his two venue sentences; retest bar + next OPEN only; 14:45 never consulted).
- s112 CONFIRMATION-CANONICAL (verbatim his TOUCH-OR-BREAK rule; either/or; zero margin; same-bar permitted form; general separate-bars form; retest-bar poll NEVER cited BAR-ROLE).
- s114 BAR-MAPPING-CANONICAL (confirmation bar at next pass; 09:40 at 09:45 pass; retest polls never substitute).
- s151 JUN05NY-ENTRY-1615 (verbatim his 16:15 open answer; 16:55 fill 160.120 machine's trade never his).
- s165-166 B-52 ruling (verbatim his 16:29 UTC: entry POI M POC + M VWAP, highest Monthly but also W, at 16:00).
- s169-174 2026-10-07 ruling (verbatim his 16:00 bearish / 16:05 bullish flips + formed-setup vs retest distinction; paraphrase: 16:00 retest, 16:05 bullish flip, 16:10 confirmation, 16:15 open 160.059).
- Spec s2r1 (anchor retest wick>=1pt body correct side entry-only; TP touch; exit body close); s3.5 (XOB/FVG in play, quoted never gated); s3.6 whole + table (retrace against + confirm in direction nonzero body; XOB touch permitted never disqualifying; FVG touch required on that candle; same bar may be both; entry need not be inside); s10 (required/permitted/prohibited). Register B row 2 (5 Jun NY owed 16:15 LONG old high 160.723 [HIS]) + corrections.

## R2 RAW SPOTS (kept EA 137076D9)

- `CONFIRMPOLL` 7 hits; `touchAttr` 3 hits.
- EA:2429-2435 poll header (spec 3.6 terms as data; confirm=A&&B&&C; gates nothing).
- EA:2436-2463 ShadowConfirmPoll (o1/c1/h1/l1 prior barShift+1 EA:2440-2443; o0/c0 current EA:2444-2445; L via ReadBuf1 EA:2448; opp EA:2450; body/doji/bodyDir EA:2451-2453; touch EA:2454 `(h1 >= L - _Point && l1 <= L + _Point)`; confirm EA:2455; print EA:2456-2462 bar/anchor/dir/opp/bodyDir/body/doji/touchAttr/confirm/shadow).
- EA:2465-2480 gate header (live gate replaces poll-only; terms A/A2/B/C; C = prior range touched anchor +/-1pt).
- EA:2481-2536 IsConfirmationCandle (signature EA:2481-2482 anchor/dir/failTerm/allowReclaim; NO_ANCHOR EA:2485; NO_DATA EA:2492-2493; NO_LINE EA:2495-2498; opp EA:2510 else A_OPP EA:2511; closeSide EA:2516-2518 B38 reclaim EA:2521-2526 else A2_CLOSE_BREAK EA:2527; body/doji/bodyDir EA:2528-2530 else B_BODY EA:2531; touch EA:2532 else C_TOUCH EA:2533; surv EA:2534; true EA:2535).
- Call sites: EA:9340 carry (+m15 +S54); EA:9360 prebind cfPassZ (+m15 report/bypass + PREBIND comments EA:9378-9389); EA:9548 S4 (+S54, CONFIRM_STRUCT_FAIL EA:9561).
- (d) single anchor: seed `:8437 g_anchorLine = pr.topLine` (B82 K3); poll/gate take `g_anchorLine` at all three sites; whole six never carried (ROWKEY text only).
- (e) hunk C C2/C3 raw (SLICE_B82 45-56): `retestShift` param; `uj60_hR/uj60_lR` default h1/l1 then `iHigh/iLow(retestShift)` when valid; `uj60_tR=(hR>=L&&lR<=L)` retest exact; `uj60_tP=(h1>=L&&l1<=L)` prior exact; `touch=(tR||tP)`; `cSrc=BOTH/RETEST/PRIOR`; B60C print rt/rSh/rBar/cSrc. Counted candles: retest (stamped time->shift) OR prior (barShift+1).

## R3 TABLE (5 June NY; OHLC + 6 POI values; side LONG = price above; touch = range contains; through = body close crossed)

- Bars (UJBARMAP JUNE0525-B117): 16:00 o=160.216 h=160.262 l=159.726 c=160.034 mpoc=159.885 mvwap=159.796 wpoc=159.885 wvwap=159.796 dpoc=159.945 dvwap=159.963 ltf=-1.0 | 16:05 o=160.032 h=160.086 l=159.992 c=160.008 mpoc=159.885 mvwap=159.798 wpoc=159.885 wvwap=159.798 dpoc=159.945 dvwap=159.966 ltf=+1.0 | 16:10 o=160.009 h=160.062 l=159.981 c=160.058 mpoc=159.885 mvwap=159.799 wpoc=159.885 wvwap=159.799 dpoc=159.945 dvwap=159.968 ltf=+1.0 | 16:15 o=160.059 h=160.082 l=160.022 c=160.073 mpoc=159.885 mvwap=159.800 wpoc=159.885 wvwap=159.800 dpoc=159.945 dvwap=159.971 ltf=+1.0.
- RETESTBOOK: 16:00 hits=6 D-POC:r10:dL D-VWAP:r11:dL W-POC:r8:dL W-VWAP:r9:dL M-POC:r6:dL M-VWAP:r7:dL (no dS); 16:05/16:10/16:15/16:20 hits=0.
- Per line: 16:00 range touches ALL six YES; body-through NONE (body above all). 16:05 touches NONE (low 159.992 above highest 159.966); through NONE. 16:10 touches NONE (low 159.981 above highest 159.968); body LONG 49pts; through NONE. 16:15 open above all; bar touches NONE.
- Entry lines: M-POC r6:dL + M-VWAP r7:dL (B-52) + W-POC r8:dL + W-VWAP r9:dL (16:00 row; Monthly also W per his parenthetical); D-POC/D-VWAP dL context.
- Trial raws (JUNE0525-B126 13:41:36): B126RESEED 16:00 M-POC; STATE S3->ABORT + IDLE->S1 at 16:05:00; STATE S1->S2 + S2->S3 at 16:10:00; CONFIRMPOLL 16:05 opp1 body0 24pts touch1 confirm0; 16:10 opp1 body1 49pts touch0 confirm0; 16:15 opp0 body1 14pts touch0 confirm0; 16:20 opp0 body1 90pts touch0 confirm0; FRESHSKIP 16:10/16:15/16:20 PRE_BINDING S3.
- (i) 16:10 touched NONE. (ii) body-closed through NONE. (iii) closed LONG YES 49pts nonzero. (iv) machine tested ONLY single anchor Monthly-POC prior-touch (16:05 range vs 159.885 +/-1pt).

## R4 GRADES (CF-A anchor; CF-B his lines; CF-C retest carries; at machine's own confirmation bar)

- A1 28 Aug 10:00 SHORT: PASS/PASS/PASS (same-bar 10:00 confirm=1). A2 1 Sep 17:30 LONG: PASS/PASS/PASS (preempt fire #4/#5). A3 4 Sep 16:00 LONG: PASS/PASS/PASS. A4 7 Sep 09:20 LONG: PASS/PASS/PASS. A5 7 Sep 16:45 LONG: PASS/PASS/PASS. A6 8 Sep 10:10 SHORT: PASS/PASS/PASS. A7 8 Sep 17:00 SHORT: PASS/PASS/PASS. B3 11 Jun 14:35 LONG: PASS/PASS/PASS (14:35 same-bar confirm=1, entry 14:40 open 160.524). C3 3 Jun 09:10 LONG: PASS/PASS/PASS. 27 May 15:35 LONG: PASS/PASS/PASS (S4->S5 fire). B2 5 Jun 16:10 LONG: FAIL/FAIL/PASS (R3). Sec C: 2 Jun 15:35 LONG (seed 14:20 M-POC, rt 14:20, conf 15:30 o=159.754 c=159.767 LONG): PASS/PASS/PASS (breaker all; XOB silencer other-gate). 27 Aug 17:00 SHORT: UNKNOWN/UNKNOWN/WOULD-PASS (confirmation join absent; CF-C 16:25->17:00 closes SHORT; target <1R silencer after confirmation so counted breaker for CF-C). 10 Jun 16:10: other gate (15:45 body-through kills pre-confirmation). 4 Jun 09:50 SHORT (CONFIRMPOLL confirm=1 + fired): PASS/PASS/PASS (breaker all; CQD/XOB/bias silencers noted but machine has no XOB check + cqd UNREAD so counted). 5 Jun LDN: other gate (S2 refusals; NOT VALID). 1 Sep 15:30: FAIL/FAIL/FAIL (all confirms 0, no live path). 4 Sep 10:40: UNKNOWN (no rows, no fire). 28 Aug 16:25: other gate (livePass=0). 8 Sep 16:45: other gate (livePass=0).
- Necessary: valid pass all YES; 5 Jun passes CF-C only; ruled-out reaching confirmation (2 Jun, 4 Jun) pass all; 27 Aug would-pass CF-C; 1 Sep fails all. CF-A DOES NOT SEPARATE (breaker B2 FAIL). CF-B DOES NOT SEPARATE (breaker B2 FAIL). CF-C DOES NOT SEPARATE (breakers 2 Jun PASS + 4 Jun PASS + 27 Aug WOULD-PASS). No confirmation-only separator; ruled-out fires held by non-confirmation gates (XOB 2 Jun; CQD/XOB/bias 4 Jun; target 27 Aug; body-close 10 Jun; bias 5 Jun LDN; R-gate 28 Aug/8 Sep).

## CENSUS (kept confirm=0 bodyDir=1 doji=0)

- 341 rows (192 JUNE0525-B117 + 149 RECON62-B125). Filed whole as `06_HANDOFFS/BUILDER_CENSUS_B127.md` (343 lines incl header). Per-row run/bar/anchor/dir/opp/touch/body/seed_line/seed_time/CF/pred. CF-A/B UNKNOWN per-row (need confirmation-range + whole-set joins); CF-C WOULD-TURN where opp=1 touch=0 else NONE; pred UNKNOWN. 5 Jun trial rows NOT in kept census (kept no 16:10 candidate). No row graded.

## R5 SITES (kept EA)

- CF-A inputs readable (OHLC any shift iOHLC; POI any shift ReadBuf1 EA:2448/2495; anchor known). CF-B readable plus whole-set via ReadBuf1 loop as DetectPoiRetest EA:2106-2129, side-join print-only SUPPRESSED EA:8296-8331. CF-C readable (retest OHLC any shift + POI any shift + DetectPoiRetest(barShift) pure call per B-84 pieces). No separator, no site named. Draft no hunk.

## RECORD LINES (exact)

- X1 s4: `- B127-WHOLE-PATH-BEFORE-HUNK (planner lesson 2026-10-09): when an earlier hunk reached a missed take through more than one change, measure every step of that path on the rows before trialing one part; B-126 built hunk C's reseed half alone, and the reseeded 5 June 16:00 long died at the 16:10 confirmation on touchAttr=0, the step hunk C's retest-candle touch carried (B-125 R2 f).`
- X2 s5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-127; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 s3: `- B-127: measured the 5 June 16:10 confirmation candle line by line against his entry lines and the 16:00 retest-candle touch, graded on every register row and every kept confirmation refusal; no source edit or run.`
- X4 ledger `1272.` (tag `B127-CONFIRM-CANDLE-READING`; banking + R0-R5 + SHAs + runs; no rule invention).
- X5 register: untouched. X6 pointer (cap 35).
- Pre-commit: X1/X2/X3 counts 1; X4 counts 1; `^1271.`=1; staged = 7 relay files (result, slice, census, ledger, pointer, context, handoff); no source/EX5/journal/log/settings diff.

(End of slice)
