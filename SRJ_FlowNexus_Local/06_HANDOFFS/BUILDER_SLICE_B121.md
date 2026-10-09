# BUILDER SLICE B-121 - raw rows, raw code (HTF read fidelity, MEASURED)

Scope: read-only. Runs: kept June 04:52-04:54 Core 04 EA 137076D9; RECON62 [TRIAL] 05:06-05:08 (S1/S2/probe prints only). Indicator 956BF3E3 both windows. B-16 D1 = UJALIGN-guard reads, j3-era build.

## PART B (counts + ++ search)

- B1 correction in RESULT_B120 Part B: grep count 1 = ALREADY_BANKED f19435b. Nothing appended.
- B2 (a) register A row 2 cell raw: `journal row 301 "++" VALID-taken-not-taken-by-him [HIS 2026-09-23 ruling]`.
- (b) strategy line 77 raw: `9/1 VALID (his words 2026-09-23, verbatim: "that is a valid trade that i did not take")` + `(setup class + links + gain left for him, never invented)`.
- (c) journal row 301 whole (600-char head + match check): cells Setup/4H/1H empty, 15m Bull; comment carries W6 15m-bullish words; full-line `++` match: NONE.
- (d) 2026-09-23 + ++/301/9/1: ledger 617 (9/1 VALID row 301) + 618 (`++ both-true banked ... Index 9/4 pointer carries ++`); findings ZERO near 9/1/301; verbatim "++"/both-true on 9/4 only (skill line 79: "trend following and mean reversal can both be true at once, journal ++"); 9/1 pin (line 77) has no "++". Verbatim "++" on 1 Sep: NOT FOUND. Register cell listed for planner banking review. Nothing appended.

## R1 RAW HISTORY (grep-only, file:line)

- Ledger 849: FIX-NOT-REPLACE ordered 2026-09-26 (verbatim filed; handles WITHDRAWN; v304 stood down; v305 reframe opens; NO build/run/keys).
- Ledger 850: v7 B5CAF2DF indicator-only engagement + v305 battery-green twin-57/57-diff-0; DRAFT turn, NO build/run/keys.
- Ledger 1164: B-17 BANK 15M-READS (W6 verbatim; rows 281/285/301 annotated).
- HTFAUDIT-1 (2026-09-09, FlowLogic 1EA7858F): his datum ("HTF auto detection ... sometimes ... not correct and not robust, although majority of the time it is correct"); mechanism: legs recompute ONCE per HTF bar at first M5 bar (frozen whole bar), full replay incl. forming bar, structure judgment repaints at open (L115-118); outBias = LIVE (provisional), outCBias = CONFIRMED (chart-equivalent), unconsumed. Options P-HTFLOG + P-HTFCONF NOT ISSUED. Answers: 08.17 exit = M15 open-instant at 16:45 (chart flipped 17:30); 08.20 exit = M15+H1 open-instant at 14:00 boundary.
- Packets P-UJIMPL-1 / P-UJIMPL-IMPL-1 carry FIX-NOT-REPLACE text (lines 5/17, 9/44). Findings SEEDFIX-1/ANCHORTIER-1/HIS-THREE-ORDERS + EXITMODEL + S1-CADENCE-HALT cite it. AGENTS/.clinerules: ZERO hits.
- Shipped indicator change under the order: NONE. Kept 956BF3E3 line 252 `input bool inUseConfirmedHTFOnly = false;` → EA consumes outBias at FlowLogic 1195-1197. No SHA carries the fix. EU battery on kept indicator: B-118 RECON62 7/7 identical; B-117 June as filed.

## R2 RAW READS (his)

- Setup rows: 13: TF Bear/Bull/Bull. 9: 6/3 LDN TF Bear/Bear/Bear. 257: 8/28 LDN TF Bear/Bear/Bear. 277: 9/4 LDN TF Bull/Bear/Bear. 279: 9/4 NY TF Bull/Bear/Bull. 281: 9/7 LDN TF Bull/Bull/Bull. 285: 9/8 LDN TF 15m Bear. 301: 15m Bull (+W6 words). 33: 6/11 LDN TF Bear/Bull/Bull. 34: LDN MR Bear/Bull/Bull. 35: NY TF Bear/Bear/Bull. 36: NY MR Bear/Bear/Bull. 314: points at row 13.
- Bar-named: W6 (skill 135/141): 1 Sep 17:35 LONG bullish; 7 Sep 09:20 LONG bullish; 8 Sep 10:10 SHORT bearish. CHART-READS-6/5 (skill 106-107): 5 Jun 09:45 1H bear + 15m bear (4H bull context). HTF-READBACK (skill 84 tail): 11 Jun 15m Bull rows 33-36.
- Absent (his side): 28 Aug NY-confirm, 7 Sep NY, 8 Sep NY-confirm, 1 Sep 15:30, 28 Aug 16:25, 8 Sep 16:45, 5 Jun 16:00/16:10/16:15, 4 Sep 10:40-confirm → UNKNOWN.

## R3 RAW READS (machine UJPROBE h4/h1/m15, confirmedFeed=1)

- 4 Jun kept: 09:10 +1/-1/+1; 09:40-bar +1/-1/+1; 09:45-bar +1/-1/-1; 09:50-bar +1/-1/-1 ltf=-1 ALIGNED-hidden; 09:55-bar +1/-1/-1.
- 1 Sep [TRIAL]: 17:00-17:10 LONG -1/-1/+1; 17:30: -1/-1/+1 ltf=-1; 17:35: -1/-1/+1 ltf=+1 hidden.
- 7 Sep [TRIAL]: 09:00 +1/+1/+1; 09:15 +1/+1/+1; 09:20 +1/+1/+1; 16:15 +1/+1/+1; 16:40 +1/+1/+1; 16:45 +1/+1/+1.
- 8 Sep [TRIAL]: 10:05 +1/-1/-1 ALIGNED-hidden; 10:10 +1/-1/-1; 16:50 -1/-1/+1; 16:55 -1/-1/+1; 17:00 -1/-1/+1.
- 5 Jun kept: 09:25/09:35/09:40 +1/-1/-1; 16:00 +1/+1/+1 ltf=-1; 16:10 +1/+1/+1; 16:15 +1/+1/+1; 16:50 +1/+1/+1 ALIGNED-regular; 16:55 +1/+1/+1.
- 11 Jun kept: 14:20 +1/+1/-1; 14:40 +1/+1/-1 ltf=+1.
- 3 Jun kept: 09:00 +1/-1/+1; 09:05 +1/-1/+1 ALIGNED-hidden; 09:10 +1/-1/+1.
- 28 Aug [TRIAL]: 09:55 -1/-1/-1; 10:00 -1/-1/-1; 10:05 -1/-1/-1.
- C cases [TRIAL]: 1S 15:25/15:30 -1/-1/-1; 4S 10:35/10:40 +1/-1/+1 ALIGNED-regular; 28A 16:20/16:25 -1/-1/+1; 8S 16:40/16:45 -1/-1/+1.
- 2 Jun kept 14:20 +1/+1/-1; 10 Jun kept 15:30 +1/+1/-1 ltf=-1; A3 [TRIAL] 15:40 +1/-1/+1; A4? (09:00 above).
- B-16 D1 (j3 UJALIGN): 9/1 bull 16:45/17:00/17:05/17:10, bear 16:50/16:55; 9/7 bull 09:00, bear 09:05/09:10/09:15; 9/8 bear 10:00, bull 10:05. Vs today: 9/1 split STILL THERE (17:30 bear); 9/7 + 9/8 splits GONE (bull/bear agree). Print+build caveat stands.
- j43 RECON62-B81 STATUS: RUN line + EURUSD 08-26→09-10 window only; no h4/h1/m15 prints → not usable, stated.

## R4 RAW CLASSES

- Engine (HTFAUDIT-1 §4-5 + kept code): legs recompute once per HTF bar at first M5 bar, frozen whole bar; forming bar included via first ticks; structure judgment at open instant repaints (L115-118); outBias = provisional, outCBias = confirmed (unconsumed).
- Cell A (1S 17:30 15m): M15 [17:30,17:45) re-ran 17:30 open; evaluated 17:40:01 frozen → forming. Event NOT READABLE (no per-leg prints; P-HTFLOG unshipped). Feed UNKNOWN (no 09-01 audit; RAW note covers 7-10 Sep only). Replay UNKNOWN (no invalidation-count prints). → closed-vs-forming + UNKNOWN.
- Cells B/C/D (4JUN 4H/1H/15m): H4 [08:00,12:00) since 08:00; H1 [09:00,10:00) since 09:00; M15 [09:45,10:00) since 09:45 → forming-frozen. Event NOT READABLE. Feed UNKNOWN + 9.1 bound (OANDA-vs-demo). Replay UNKNOWN. → closed-vs-forming + feed-bounded + UNKNOWN.
- Cell E (11JUN all): H4 since 12:00; H1 re-ran 14:00; M15 quarter-hourly → forming-frozen. NOT READABLE / UNKNOWN / UNKNOWN. (His MR row 36 takes without HTF agreement — spec 3.2.)
- Cell F (3JUN 4H/15m): H4 since 08:00; M15 [09:00,09:15) at 09:00 → forming-frozen. NOT READABLE / UNKNOWN / UNKNOWN. (His TF row 9 all-bear quoted as-is; BIAS-WORDS.)
- Tick-audit disk: SRJ_TickAudit_20260803/04 + 20260907 (EU August/September) — nothing for 06-03/06-04/06-11/09-01 → all feed cells UNKNOWN.
- Dominant class: closed-vs-forming, 6/6 classifiable cells.

## R5 RAW PROJECTION (spec 3.2 trend branch; prediction only)

- 1S 15m→bull: votes stay 1 → NONE; preempt path → NO move. 4JUN 4H→bear: seed votes=2 TREND (backfire); 1H→bull: seed unanimous-bullish, fire bars unchanged → NOT removed. 11JUN all→his: votes=1 → NONE → B3 #10 WOULD MOVE. 3JUN all→his: votes=0 → NONE → C3 #4 WOULD MOVE. 7S/8S/5JUN-0945: SAME → none. 4S10:40 15m→bear: SHORT TREND (classification-only, no fire). → naive equalization removes NOTHING, threatens C3+B3; no A take moves.

## R6 RAW SITES (indicator side, kept 956BF3E3)

- Include/SRJ/SRJ_HTFEngine.mqh: SRJ_HTF_ProcessBar line 108; `e.outBias = retBias;` line 507; `if(barClosed) { ... e.outCBias = ...; }` lines 512-516; SRJ_HTF_RunOne line 519, per-leg gate lines 545-551 (once per HTF bar at first M5 bar).
- FlowLogic: consumption ternary lines 1195-1197 (one site × g_htfHi/Mid/Lo) + GetOutputs 1454-1456; switch line 252 `inUseConfirmedHTFOnly = false`.
- EA consumption: ClassifyRegime EA:2542-2544 (FL_BUF_HTF_HIGH/MID/LOW).
- Narrowest shape (described only): flip binding false→true (P-HTFCONF shape, unshipped; needs his pin + council packet).

## RECORD LINES (exact)

- X1 §4: `- B121-FIX-NOT-REPLACE-READS (planner lesson 2026-10-09): a machine-vs-chart HTF read split at a bar is a read error under FIX-NOT-REPLACE (strategy line 93) and 15M-READS (line 141), never a breaker or a strategy fact; measure it per timeframe at the candle his words name, rule out feed divergence (spec 9.1) first, and refine inside the indicator only, proven by the unchanged 7 EU takes (line 92). B-119 R1 called the 1 Sep long a breaker on a known read split.`
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-121; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: `- B-121: measured the machine's 4H/1H/15m reads against his chart reads at the named candles on the full register, and the history of his FIX-NOT-REPLACE order; no source edit or run.`
- X4 ledger `1266.` (tag `B121-HTF-READ-FIDELITY`; R0-R6 + B2 search; no rule invention).
- X5 pointer (cap 35): latest B-121 MEASURED; R4 classes; R1 outcome; kept EA/EX5/indicator; 4JUN + 5JUN-1615 open; goal open.
- Pre-commit: X1/X2/X3/X4 counts 1; `^1265.` = 1; staged = 6 relay files only; no source/EX5/journal/log/settings diff.

(End of slice)
