# COMPANION V107V - SIDE1V BIRTH-PROBE BLOCK, WHOLE REGIONS (fresh profile: paste with v107)

Tree: EA `FEC50B24`/587901 (SHA fec50b244be3328534048fe028861b36c2d8a4769ac1955f66c954dcccc51c27). Regions below are numbered disk lines, byte-identical, sequence exact, zero condensation in code regions. Encoding note: 3 em-dashes are source bytes (build comments 7662/7666/7668), verified identical — no other non-ASCII.

Claim map: (1) Region V is the ENTIRE P-probe addition (header 7660-7672 + gate 7673 + body 7674-7698) - TF-verdict (HTF bufs 19/20/21 2-of-3, locals only) + MR-verdict (sweep-tag HIGH match) + confirm-for-SHORT with N1 save/restore (6 counters) + single print; (2) gate line 7673 is textually the SIDE1T gate (V101T-E3 line 7645, same file, pre-insertion, unshifted) - same-gate claim checkable word-for-word; (3) Region U gives the buffer IDs (sweep-tag 18, HTF 19/20/21) + sweep HIGH constants (1/3/5/7) used at 7687-7688; (4) writes in V: locals + one PrintFormat only - N1 globals restored at 7692 before the print; (5) confirm fn + its 6 N1 counters live at 2096-2137 (V104GAP-G1, pre-insertion, binds this digest); sweep-tag production is FlowLogic (untouched file).

Carried (all pre-insertion, bind this digest unchanged): V101T E1 2171-2178 + E2 7360-7450 + E3 7608-7659; V104GAP G1 2096-2137 + G2 2139-2170 + FlowLogic 1138-1150; V86TRANSFER S 93-104; V89STOP U 2730-2761 + V 5568-5604. NOT carried: V103W (its 7BFC7FA3 line numbers shifted past the 7660 insert; content untouched but numbers stale - re-cut on request).

--- Region U: EA 183-208 (buffer IDs + sweep constants) ---
183: #define FL_BUF_ASIA_LOW     11
184: #define FL_BUF_LONDON_HIGH   12
185: #define FL_BUF_LONDON_LOW    13
186: #define FL_BUF_NY_HIGH       14
187: #define FL_BUF_NY_LOW       15
188: #define FL_BUF_PM_HIGH       16
189: #define FL_BUF_PM_LOW       17
190: #define FL_BUF_SWEEP_TAG     18
191: #define FL_BUF_HTF_HIGH      19
192: #define FL_BUF_HTF_MID       20
193: #define FL_BUF_HTF_LOW       21
194: 
195: #define FL_BUF_XOB_ZONE_HIGH     22
196: #define FL_BUF_XOB_ZONE_LOW      23
197: #define FL_BUF_FVG_LEG_ZONE_HIGH 24
198: #define FL_BUF_FVG_LEG_ZONE_LOW 25
199: 
200: #define SWEEP_NONE        0
201: #define SWEEP_ASIA_HIGH   1
202: #define SWEEP_ASIA_LOW   2
203: #define SWEEP_LONDON_HIGH 3
204: #define SWEEP_LONDON_LOW  4
205: #define SWEEP_NY_HIGH     5
206: #define SWEEP_NY_LOW     6
207: #define SWEEP_PM_HIGH     7
208: #define SWEEP_PM_LOW     8
--- Region V: EA 7660-7698 (SIDE1V whole: header + gate + body) ---
7660:           //--- [P-BIRTH-PROBE-001] dual-reading birth probe (Luna V105-DUAL-READ-CLEAR-001, cleared BY NAME
7661:           //--- print-only). At EVERY seed (same gate as SIDE1T): TF-verdict for SHORT (HTF bufs 19/20/21
7662:           //--- 2-of-3, INLINE-DUPLICATE of the ClassifyRegime trend part — its function-statics are
7663:           //--- unrestorable, pure reads only, zero new semantics) AND MR-verdict for SHORT (sweep-tag
7664:           //--- dir-match: SHORT needs a swept HIGH) printed SEPARATELY (row-type to council grade) +
7665:           //--- confirm-for-SHORT via IsConfirmationCandle(DIR_SHORT) with N1 save/restore (6 counters:
7666:           //--- vwapEq/pocEq/vwapInv/pocInv/vwapSurv/pocSurv — the file-wide 14 conflated in an "8"
7667:           //--- miscount, owned; exactly these 6 written in 2096-2137). Seed-identity: everything here is
7668:           //--- seed-current at the seed tick (barShift/g_anchorLine/s1g_legDir), so D5 holds trivially —
7669:           //--- no staleness possible, no live-global re-read. No-race enforced AT GRADE (D6:
7670:           //--- transfer-claimed lineages labeled via the PREEMPT join). FORBIDDEN/ABSENT: any state/dir/
7671:           //--- latch/order/stop/N1 write (N1 restored), OrderSend, AdoptOff touch, fresh Detect calls,
7672:           //--- price literals. tf=-1 guards HTF-read failure (grade asserts 0 occurrences).
7673:           if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
7674:             {
7675:              double s1v_hH = 0.0, s1v_hM = 0.0, s1v_hL = 0.0;
7676:              int s1v_hOk = 0, s1v_votes = 0;
7677:              if(ReadFlow(FL_BUF_HTF_HIGH, s1v_hH, barShift) && ReadFlow(FL_BUF_HTF_MID, s1v_hM, barShift) && ReadFlow(FL_BUF_HTF_LOW, s1v_hL, barShift))
7678:                {
7679:                 s1v_hOk = 1;
7680:                 if((int)MathRound(s1v_hH) == -1) s1v_votes++;
7681:                 if((int)MathRound(s1v_hM) == -1) s1v_votes++;
7682:                 if((int)MathRound(s1v_hL) == -1) s1v_votes++;
7683:                }
7684:              int s1v_tf = ((s1v_hOk == 0) ? -1 : ((s1v_votes >= 2) ? 1 : 0));
7685:              double s1v_swD = 0.0;
7686:              int s1v_tag = 0;
7687:              if(ReadFlow(FL_BUF_SWEEP_TAG, s1v_swD, barShift)) s1v_tag = (int)MathRound(s1v_swD);
7688:              int s1v_mr = (((s1v_tag == SWEEP_ASIA_HIGH) || (s1v_tag == SWEEP_LONDON_HIGH) || (s1v_tag == SWEEP_NY_HIGH) || (s1v_tag == SWEEP_PM_HIGH)) ? 1 : 0);
7689:              int s1v_wEq = g_n1_vwapEq, s1v_poEq = g_n1_pocEq, s1v_wIv = g_n1_vwapInv, s1v_poIv = g_n1_pocInv, s1v_wSv = g_n1_vwapSurv, s1v_poSv = g_n1_pocSurv;
7690:              string s1v_term = "";
7691:              IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1v_term);
7692:              g_n1_vwapEq = s1v_wEq; g_n1_pocEq = s1v_poEq; g_n1_vwapInv = s1v_wIv; g_n1_pocInv = s1v_poIv; g_n1_vwapSurv = s1v_wSv; g_n1_pocSurv = s1v_poSv;
7693:              if(s1v_term == "") s1v_term = "PASS";
7694:              PrintFormat("[SRJ-EA] SIDE1V_BIRTH bar=%s dir=SHORT tf=%d mr=%d confShort=%s",
7695:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7696:                                       TIME_DATE|TIME_MINUTES),
7697:                          s1v_tf, s1v_mr, s1v_term);
7698:             }
