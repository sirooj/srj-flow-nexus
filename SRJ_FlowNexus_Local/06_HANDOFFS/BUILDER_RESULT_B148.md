# BUILDER RESULT B-148 - XOB lane parked; 2xOB state is panel-only, stops ungradeable

Trader summary: the 4 June XOB rule is filed and that lane is parked - your valid takes all have a zone that price came back to after promotion, the 4 June short has none, but the EA can't see the full zone list live so nothing can be built from it yet. Back on the stops: the two-branch check needs the 2xOB state from your bias panel, and that state lives nowhere the EA can read - it is drawn on screen only. So no stop can be graded on the real rule this turn either; the one missing piece is a single new readout carrying that state. Your 28 August stop's candle is found, though: only the 06:30 candle ever touched 1.16508, a clean three-candle high. Nothing was changed, nothing was run, and nothing is asked.

## Relay order (B-148: park XOB-0604 at 6 of 6; STOP-BASIS 2 of 6; read-only)

- Part 0 on builder/B-147 at 727411ea463eb0688b2086cc2b23e0e650f4413d (backup ls-remote verified exact; builder/B-148 cut here). Skills loaded whole (relay; strategy - .agents copy never opened). Reads: pointer; RESULT_B147 + SLICE_B147; RESULT_B141 (R1/R2/R3-R6) + SLICE_B141; RESULT_B142 R4; spec v4.2 (3.4/3.5.1/3.7/8/10); register whole; INDEX_B137 + DEALS packs (14 + 10 deals); CONTEXT B141/B145/B147 lines.
- Start gate: log-1 = 727411e; status 581 lines (dirty tree preserved); committed-file diff vs 727411e measured 0 lines; EA 585093BF.../EX5 AB159DE7.../FlowLogic 956BF3E3/27B5F272 match; result-against-commit: CONTEXT B147 = 1, relay B-147 = 1, HANDOFF B-147 = 1, ledger 1292 = 1; pre-greps B148-SEPARATES-NOT-BUILDABLE/B148-STOP-BRANCH-INPUT/^1293./B148SLBR all 0. No STOP.
- Scope: Parts B/P/R read-only; K-D/T gated on R2 (not run - see R2). No indicator/Include/HTFEngine edit; no control-flow change; no tolerance/count/distance; no question to him.

## Part B - banking

- No new rule words. Nothing appended.

## Part P - park XOB-0604 (6 of 6)

- P1 filing facts (RESULT_B147): R3 PROMO-RETURN (spec 3.5.1 relevance, then retracement, then confirmation; RETRACE-IS-IN-PLAY L203) SEPARATES on MACH and OLD-LEVEL (RESULT_B147:48: "every A/B2/B3/C-06-03 MET; C-06-04 NOT MET"); C-06-04 row (RESULT_B147:43) NOT MET/NOT MET with "pick 3052 absent"; OTHER-GATE rows as listed. R4 NOT BUILDABLE (RESULT_B147:52: full live XOB list, per-XOB promotion candle and alive state NOT FOUND in EA-readable buffers FlowLogic.mq5:63-64/113/128, :708-709/:727/:731, selected pick only; RESULT_B147:56 verdict).
- P2 provenance (B-52): XOBDIAG rows per B-142 R4 stamps (EU build 2026.10.08 20:34:34, June 2026.10.08 21:25:54, payload 2026.10.08 22:20:47, INCREMENTAL runPass 2). Diagnostic sources on disk (Indicators/SRJ_FlowLogic.mq5.B96XOBEXPORT/.B97PROV/.B100RECALCID/.B101FULLWINDOW/.B102RECON62/.B106JUNE/.B110PAYLOAD + .preB copies) all #include the same shared Include/SRJ/SRJ_OrderblockMgr.mqh; B102/B106 vs kept differ by 106 lines each, all export-block additions (B100-DIAG header quoted in slice); zero lifecycle-call differences (same include line). OrderblockMgr working tree == Rev064 d96fd5f on lifecycle lines (create 37-40, kill 498-515, promote 814-822). Verdict: SAME - no XOB create, promote, invalidate or alive line differs; never re-ran anything.
- P3 reopen key (filed, not built): full live XOB list + per-XOB promotion candle + per-XOB alive state EA-readable at runtime (B-109 contract, B-113 boundary), then the R3 table re-proven on kept-build rows before any Part S or trial. 4 June 09:55 stays a known open fire (kept EA 585093BF, JUNE0525-B137 deal #6 sell 09:55 159.868).

## Part R - STOP-BASIS 2 of 6

- Spec 3.7 raw (spec file lines 195-200, 210; spec 8 line 319): 195 "**Stop-loss reference distance, two branches:**"; 199 one-swing = "a valid order block **with** an imbalance marks the structural extreme" -> "one swing from that order block's swing high/low"; 200 two-swing = "**strong-signal scenario with no imbalance** - the opposite-side order block invalidated, no FVG present" -> "two swings, plain candle swings, no order block required"; 210 "**Branch selection is the two-OB state plus imbalance presence** - the operator-facing `2xOB` on his bias panel - **not** the order-block validity flag."; 319 "| §3.7 two-branch stop selector | **wrong selector, named instance** | yes, one flag |".

### R1 2xOB located (paired greps; ZERO-COUNT RELAPSE: every zero re-proved with a second pattern)

- (a) Count to strong flip at 2 (skill section 2 line 57 quotes it; buffers 3/4/5 = OBValid/FVGValid/OppFVG, the 2-of-3 state): LTF BiasEngine.mqh:157-165 (currentInBiasCount; doStrongFlip = >= 2); HTF HTFEngine.mqh:390-393 (inBiasCount; doStrong = >= 2). Second patterns confirm (doStrongFlip/doStrong/doRenewal).
- (b) "2xOB" on his panel: glyph SRJ_Text.mqh:23 ("2xOB"); drawn Panels.mqh:42 (LTF row, is2OB flag) and HTFEngine.mqh:499 (per-timeframe row, htfIsDoubleOB). States: LTF g_s.isDoubleOB (set BiasEngine.mqh:221 renewal / :276 strong flip; cleared :281); HTF e.htfIsDoubleOB (HTFEngine.mqh:398 renewal / :406 = doStrong).
- (c) SetIndexBuffer carrying the count or state: NOT FOUND (full 0-47 census: FlowLogic.mq5:672-741; buffers 3/4/5 carry validity flags, 19/20/21 HTF direction, 22/23/31/33 selected pick - no count, no 2xOB flag anywhere). Re-proved via buffer-name census (no doubleOB/count buffer declared).
- (d) EA read of such an index: NOT FOUND (EA FL_BUF map EA:172-208/2025-2038 defines no 2xOB index; reads go only through defined indices). Located by text throughout, never by line number alone.

### R2 classification: NOT FOUND

- No exported buffer carries the 2xOB state (in-bias count, opposite-side count, or flag) on any timeframe; the EA copies none. Code meaning beside (not a buffer): LTF flag g_s.isDoubleOB (strong-flip-or-renewal) + per-counts g_s.bullish/bearishOBInvalidationCount; HTF flag htfIsDoubleOB + e.htfBull/BearOBInvCount per Hi/Mid/Lo engine.
- K-D NOT RUN: 2xOB NOT FOUND. No rule conflict to check (no edit made). No .preB148 backups needed (nothing launched, nothing edited).

### R3 A1 stop swing FOUND (Tester/logs/20261009.log UJBARMAP, 28 Aug 00:00-10:00, 121 bars)

- Exactly one candle with high 1.16508: 06:30 (o=1.16506 h=1.16508 l=1.16491 c=1.16494). Strict triple: 06:25 h=1.16507 < 1.16508 > 06:35 h=1.16494. Nearest (and only) 1.16508 swing to the left of the 10:05 entry on the protective side (above 1.16466). Beside: nearest strict high overall = 09:55 1.16491 (machine firstSwing, B-141 R2).
- SWINGDUMP J1081428 (10:05 pass, bar 10:00, site=S5): SH[1..10] = 1.16491 at shift 2 then 1.16481/1.16482/1.16479 deeper; SL[1..10] = 1.16462, 1.16443. Printed window = shifts 1-10 (bars 09:55 down to 09:10); the 06:30 swing sits outside it (window cut-off visible). B-141's missing-print finding stands, now with the bar named.

### R4 imbalance halves (copied from B-141 R2, no new work)

- A1 SIDE1Q 10:00 obValid=0.0 fvgValid=0.0; A2 17:30 1.0/1.0; A3 15:55 1.0/0.0; A4 09:15 1.0/0.0; A5 16:40 1.0/0.0; A6 10:05 1.0/0.0 + SLEXT481 ext1Imb=0 (ext1BarTime 09:40); A7 16:55 1.0/0.0; C-06-03 09:05 1.0/0.0; B2 16:10 1.0/0.0; B3 14:35 1.0/1.0.

### R5 grade table (run RECON62-B137 / JUNE0525-B137, EA 585093BF; pack lines per B-141/B-143)

| row | conf candle | 2xOB (K-D not run) | imbalance | spec branch | machine branch | stop + swing | verdict |
|---|---|---|---|---|---|---|---|
| A1 | 28 Aug 10:00 | UNKNOWN | 0.0/0.0 | UNKNOWN | 2-swing (obValid=0) | 1.16508, 06:30 high (R3) | UNKNOWN |
| A2 | 1 Sep 17:30 | UNKNOWN | 1.0/1.0 | UNKNOWN | 1-swing (obValid=1) | 1.15975, 16:45 low | UNKNOWN |
| A3 | 4 Sep 15:55 | UNKNOWN | 1.0/0.0 | UNKNOWN | 1-swing family | 1.15847, 15:30 low (his) | UNKNOWN |
| A4 | 7 Sep 09:15 | UNKNOWN | 1.0/0.0 | UNKNOWN | 1-swing (obValid=1) | 1.16098, 08:40 low | UNKNOWN |
| A5 | 7 Sep 16:40 | UNKNOWN | 1.0/0.0 | UNKNOWN | 1-swing family | 1.16238, 16:05 low | UNKNOWN |
| A6 | 8 Sep 10:05 | UNKNOWN | 1.0/0.0 + ext1Imb 0 | UNKNOWN | ext-1 final (09:40) | 1.16258, 09:40 high (his 2nd) | UNKNOWN |
| A7 | 8 Sep 16:55 | UNKNOWN | 1.0/0.0 | UNKNOWN | superseded print | 1.16274, 16:20 high | UNKNOWN |
| B2 | 5 Jun 16:10 | UNKNOWN | 1.0/0.0 | UNKNOWN | superseded print | 159.598, 07:30 6/4 low | UNKNOWN |
| B3 | 11 Jun 14:35 | UNKNOWN | 1.0/1.0 | UNKNOWN | 1-swing (obValid=1) | 160.501, 10:30 low | UNKNOWN |
| C-06-03 | 3 Jun 09:05 | UNKNOWN | 1.0/0.0 | UNKNOWN | superseded print | 159.889, 08:35 low | UNKNOWN |
| C-06-04 | beside | UNKNOWN | - | - | - | sl 159.920 (stop swing 09:20 per B-142) | never graded |

- Rule applied: UNKNOWN when either half (2xOB, imbalance) is UNKNOWN - ordered, no inference (A2/A4/B3 machine-agreeing 1-swings noted beside, ungraded). No DIFFERENT row exists, so no R recompute, no admission flips, no R-AT-OPEN call (skill L31 applies only on DIFFERENT rows).
- Every row carries run + EA SHA + journal/pack line via B-141 R2 + R3/R4 above.

### R6 counts + reopen key

- 0 SAME / 0 DIFFERENT / 10 UNKNOWN; admission flips apart: none. STOP-BASIS does not close (needs all SAME).
- R2 = NOT FOUND -> reopen key (indicator-side, nothing drafted): the smallest upstream export that would carry the state is ONE buffer with the 2xOB state (spec 8: "yes, one flag") - LTF isDoubleOB and/or per-timeframe htfIsDoubleOB at the confirmation bar; then B148SLBR-style print beside every kept stop and the R5 table re-graded.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4: B148-SEPARATES-NOT-BUILDABLE + B148-STOP-BRANCH-INPUT appended after B147-HIS-RULES-MEANS-RECORD (verbatim; pre-grep 0). Counts 1/1.
- X2 CONTEXT section 5: B-148 session line appended. Count 1.
- X3 HANDOFF section 3: B-148 line appended (verdict MEASURED). Count 1.
- X4 ledger 1293, tag B148-PARK-XOB0604-STOPBASIS2 (Part P + P2, R1-R6, K-D NOT RUN). "^1293." = 1.
- X5 register section C after B-143 NOTE (pre-grep "B-148" 0): lane-parked NOTE appended. Count 1.
- X6 pointer (25 lines): latest B-148 MEASURED; SHAs unchanged after no-launch (no restore needed); lane lines per relay; R2 NOT FOUND + R6 0/0/10; 4 June known open fire; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw R1 lines, R3 candle + SWINGDUMP rows; no B148SLBR rows or filed-trade tables - K-D/T not run; under 600 lines). F3 ledger 1293. F4 pointer.
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md, register. Never EA, .B148D copy (never created), indicator, includes, ex5, journals, logs, inis, profiles, charts, backups or TEMP scripts.
- F6 commit + push via backup + ls-remote check. Reply MEASURED, no carried note (none expected; none written).

## Final disk state (MEASURED turn; B-137 kept build on disk, verified, never launched)

- EA 585093BF.../EX5 AB159DE7...; FlowLogic 956BF3E3/27B5F272; includes/diagnostic variants untouched; no terminal64; no .preB148 files (nothing to back up - no launch, no edit). CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1293); pointer rewritten (25 lines); register +1 NOTE. Skill/journal untouched (Part B). No source/ex5 committed.

(No carried note)
