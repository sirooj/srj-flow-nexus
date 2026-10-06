# BUILDER SLICE B-50 - raw rows behind P1, P2, P3 and W1 (payloads only; read-only, no run)

## 0.4 gate SHAs (raw / normalized; raw compared for source+ex5 per relay)
- pointer 5D9FB6A6 / 5d9fb6a6 MATCH (1727 B).
- RESULT_B49 AB471627 / ab471627 MATCH (9528 B).
- SLICE_B49 3DDB1AC9 / 3ddb1ac9 MATCH (15075 B).
- register C1E4AEDE / c1e4aede MATCH (7329 B).
- strategy 7762E905 / 7762e905 MATCH (60699 B).
- context pre-W1 AADEEC80 / aadeec80 MATCH (7952 B); post-W1 raw e06bb7b4 (8837 B).
- relay skill disk bb467c55 raw MATCH (accounted per relay; replaces old 90AD274E entry).
- EA 63B18C1F raw MATCH; EA.ex5 B0D4AA9E raw MATCH; FlowLogic 956BF3E3 raw MATCH; FlowLogic.ex5 27B5F272 raw MATCH; BiasEngine 3B1D9D3D / OrderblockMgr 5D14FCE2 / Draw FD2B3716 / HTFEngine D5FD5B06 raw MATCH; TickAudit 7AD6ABEF / 7C8946D8 MATCH.
- journal raw 15e568d4 (148956 B) / normalized 261ebd8f (147897 B, 1060 lines) MATCH, UNCHANGED.
- ledger: relay-expected raw 5d7c1337 / normalized b0479bca vs disk raw 7a50a839 (1127658 B, 13 CRLF) / normalized 22bec911. PROOF the expectation is stale (pre-1191): git status/diff vs HEAD 3012c8b EMPTY for the file; tail row is 1191 (single `^1191.` hit); 1127658 - 1126756 = 902 B = exactly the appended 1191 line + CRLF. Disk == pinned commit; recorded, proceeding read-only; corrected SHAs raw 7a50a839 / normalized 22bec911 for the next gate table.
- terminal.ini 450ACB4A raw MATCH (20447 B, report-only).

## P1 PASS_MAP rows, j32 (Tester/logs/20261006.log UTF-16; JUNE-B44-S5 PRE 986649)
PASS_1600 (16:00:00 pass, judges 15:55 bar):
1037613 GN 0 16:46:35.849 Core 04 2026.06.05 16:00:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 15:55 hits=0
1037614 PQ 0 16:46:35.849 Core 04 2026.06.05 16:00:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 15:55 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
1037615 JS 0 16:46:35.849 Core 04 2026.06.05 16:00:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 15:55 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:166.3pts
(No STATE/SEED/ABORT rows on the 16:00 pass anywhere in the window: machine idle, stayed IDLE.)
PASS_1605 (16:05:00 pass, judges 16:00 bar):
1037629 NN 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:00 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
1037630 DL 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:00 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above
1037631 MS 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:00 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=-:-pts
1037632 PH 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.05 16:00 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
1037633 MI 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.05 16:00 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=182pts doji=0 touchAttr=0 confirm=0 shadow=true
1037635 LI 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 STATE IDLE->S1_REGIME dir=LONG poi=Daily-POC
1037636 LI 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] ANCHOR_ELECT bar=2026.06.05 16:00 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
1037647 LO 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
1037648 FK 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
(After the kill the site returns same-bar (B-48 P1.3: GoAbort + return, no fall-through): DetectPoiRetest never ran for the 16:05 candle on this pass. The 16:05 candle was judged exactly once - on the 16:10 pass.)
PASS_1610 (16:10:00 pass, judges 16:05 bar):
1037667 HJ 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:05 hits=0
1037668 GN 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:05 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
1037669 JE 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:05 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:25.8pts
(No SEED/STATE rows: IDLE, no seed.)
PASS_1615 (16:15:00 pass, judges 16:10 bar):
1037676 IF 0 16:46:35.849 Core 04 2026.06.05 16:15:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:10 hits=0
1037677 JJ 0 16:46:35.849 Core 04 2026.06.05 16:15:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:10 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
1037678 GH 0 16:46:35.849 Core 04 2026.06.05 16:15:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:10 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:13.1pts
(No SEED/STATE rows: IDLE, no seed.)
PASS_1620 (16:20:00 pass, judges 16:15 bar):
1037684 NI 0 16:46:35.849 Core 04 2026.06.05 16:20:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:15 hits=0
1037685 EN 0 16:46:35.849 Core 04 2026.06.05 16:20:00   [SRJ-EA] UJDTTERMS bar=2026.06.05 16:15 Daily-POC=Lno-penetration/Sbody-above Daily-VWAP=Lno-penetration/Sbody-above
1037686 QE 0 16:46:35.849 Core 04 2026.06.05 16:20:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 16:15 inside=- nearAbove=-:-pts nearBelow=Daily-VWAP:51.4pts
(No SEED/STATE rows: IDLE, no seed.)
(j18 corroboration per B-35 P1: RETESTBOOK hits=2 at 16:00 bar (j18:21134), 0 at 16:10/16:15/16:20; ANCHOR_ELECT SEED 16:00 (21141); kill + ABORT + A6REFUSED at 16:05 (21152-21154); TPCENSUS 16:00-16:20 none printed.)

## P2 retest test (Experts/SRJ_FlowNexus_EA.mq5:2076-2125, DetectPoiRetest, located by text)
2076: bool DetectPoiRetest(int barShift, PoiRetestResult &r)
2078:    r.found = false; r.isLong = false; r.topLine = -1;
2079:    double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
2080:    double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
2081:    double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
2084:    //--- [P-NEXTOPEN 2026-09-09, operator directive] The retest's body-side
2085:    //--- test is evaluated at the NEXT candle's OPEN, not the retest candle's
2089:    double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
2091:    double bodyHi = MathMax(o, cNext);
2092:    double bodyLo = MathMin(o, cNext);
2093:    double P   = _Point;
2094:    double EPS = P * 0.001;
2095:    double lineVal[POI_NLINES];
2109:        //--- [P-SLDEF-1 E14] N1 counters: exact-equality encounters, counted
2110:        //--- without branching (outcome untouched). Grounding: LONG survives
2111:        //--- iff the wick pierces (l <= L-P+EPS) AND the body holds
2112:        //--- (bodyLo >= L-EPS); equality on either term passes. SHORT mirror.
2115:        if(l <= L - P + EPS && bodyLo >= L - EPS)
2116:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
2117:       if(h >= L + P - EPS && bodyHi <= L + EPS)
2118:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
2120:     if(bestLongLine < 0 && bestShortLine < 0)
2121:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
(LONG retest = low wick pierces the line (l <= L-P+EPS) AND body holds above (bodyLo >= L-EPS), body read at next candle open. Lines skipped when EMPTY_VALUE/<=0. Best rank wins; SIDE1D_BOTHDIRS prints bl/br/sl/sr + sel.)
P2 line/candle prices: NOT_FOUND for absolutes. No row on PASS_1610/PASS_1615 carries POI line prices (ANCHOR_ELECT carries names+ranks only; RETESTBOOK carries hits only; RETESTDIAG carries distances in pts; UJDTTERMS carries penetration states) and no row carries the 16:05/16:10 candle H/L/C absolutes (only CONFIRMPOLL body=182pts for the 16:00 bar). TPCENSUS (the target census that prints levels) printed nothing 16:00-16:20 (B-35 P1). TPCENSUS is the existing print that would show levels; no print added.

## P3 entry-line record
- Register B row 2 raw (BUILDER_REGISTER_VALID_TRADES.md:26): `| 2 | 5 June New York USDJPY, entry owed 16:15 | LONG | Old high 160.723 (April-30th day high) [HIS] | 16:10 NO_TP_TARGET, 5 levels invalid [R63 QO] | Pool blind past 10 days; retarget rule commissioned [HIS: "i want your solution"] |` (Line = old high 160.723 [HIS]).
- Journal row 306 raw: `306,6/5/26,NY,,,,,,,,,,,,,,,"VALID LONG off the old high 160.723 (30 April day high); entry 16:15 candle open; his words 2026-10-06 (B-34 carried question): ""5 June New York long entry is the 16:15 candle open.""; skill section 13 JUN05NY-ENTRY-1615",,,,0.00 x9` (entry 16:15 off the old high; no retest-bar mechanics).
- Findings grep `5 June New York|6/5.*NY.*retest|NY.*16:15.*retest|old high.*retest|retest.*old high` over BUILDER_FINDING*.md: 0 hits (no retest-bar mechanics on record; verdict: line FOUND, retest-bar detail not banked).
- Strategy 16:50 hits: skill:116 6/5-TIMING ("his words 2026-10-02: the 5m confirmed flipped bullish at the 16:50 candle open" + seedBiasAl=0-at-16:00 gate-correctness; never how 16:15 stands with 16:50); skill:151 JUN05NY-ENTRY-1615 (entry only; "How this sits with 6/5-TIMING and 5M-BIAS-AT-ENTRY is checked by relay B-35 Part P1"). Journal 16:50: 0 rows. Register 16:50: 0 rows.
- B-35 question raw (relay B-35 Part P1, still the wording): "5 June New York long: your book says entry 16:15 open, and the 5-minute bias flipped bullish at the 16:50 open - how does the 16:15 entry stand with the flip at 16:50?" B-35 P1_RECONCILE = OPEN; 6/5-TIMING_RAW = NOT_FOUND (only ledger-1101 paraphrase record, zero verbatim hits findings-wide). Status: STILL_OPEN (not re-asked per relay). Note: the 16:50 time is builder paraphrase only; B-49 j32 rows show the machine's 5-minute read already up (+1.0) from the 16:05 candle (16:10/16:15/16:20 bars).

## W1 context append
- Grep `## 4. Wiki rebuild record` count 0 -> appended the relay block verbatim at end of PROMPTQL_PLANNER_CONTEXT.md. New SHA raw e06bb7b4 (8837 B; was AADEEC80 / 7952 B).

(End of slice)
