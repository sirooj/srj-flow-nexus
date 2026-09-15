# SNIPPET — v68 EVIDENCE COMPANION (one paste with the v68 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v68-LANDING-AUTHOR.md` (one trip, two pastes). Answers ride with the v68 verdicts: Q1 scope ruling + Q2 object ruling (prediction/threshold/evidence each), never clearance/token/word. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `E4F393592B5F03ECE64617B7A21596A497F52C0B12AB848E3A4BD94F14918992` (561702 B, 10597 lines). Every code line verbatim with EA numbers. Regions below 7503 are byte-identical to the RECON30 tree (no edit touched them); regions at/after 7503 are the built shadow (this file's digest governs).

**Decisions ahead:** Q1 — scope of the Track-1 landing (S1/void-class-only vs other, never blanket/silent). Q2 — governing HTF object for Track-2 (buffer vs panel semantics; seed vs site bar). His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Coverage map (every v68 evidentiary claim → numbered lines below)

- Q1 "09:15 seed gate-reject B_BODY" → R1:2111 + R3:7567 + journal extract (72/`9E334313…`).
- Q1 "R3/R4 seeds A_OPP-reject yet fired 2.56/1.76" → R1:2104–2105 + R3:7567 + R7:9394–9396 + journal fires.
- Q1 "watches identical / N1 restored / isolation" → R7:9396 + R3:7560–7573 + counts §8.
- Q2 "16:45 conflict, 12 SHORTs alive" → R3:7574–7583 + R3:7588–7591 + R4 + journal.
- Q2 "site h1=+1/h4=-1" → R5:3803–3811 + R5:3817–3821 + journal SEL61SIDE rows.
- Q2 "replacement point = pass-through" → R6:3839–3847 + R2:7531 seed write.
- Q2 "shift/object semantics" → R4:1868–1871 + R4:191–193 + R4:1816.

## Region 1 — gate, EA:2075–2116, whole (B_BODY at 2111; A_OPP at 2105; A2 at 2107)

2075: bool IsConfirmationCandle(const int barShift, const int anchorLine,
2076:                           const ENUM_SRJ_DIR dir, string &failTerm)
2077:   {
2078:    failTerm = "";
2079:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
2080:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
2081:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
2082:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
2083:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
2084:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
2085:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
2086:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
2087:       { failTerm = "NO_DATA"; return false; }
2088:    double L;
2089:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
2090:       { failTerm = "NO_LINE"; return false; }
2091:     if(L == EMPTY_VALUE || L <= 0.0)
2092:        { failTerm = "NO_LINE"; return false; }
2093:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
2094:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
2095:     //--- alike": exact equality passes. Family by line code.
2096:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
2097:     //--- paired at each terminal return below (no branch touched).
2098:     bool n1_vw = false, n1_poc = false;
2099:     if(c1 == L)
2100:       {
2101:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
2102:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
2103:       }
2104:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
2105:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2106:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
2107:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2108:     double body    = MathAbs(c0 - o0);
2109:     bool   isDoji  = (body < _Point * 0.0001);
2110:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
2111:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2112:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
2113:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2114:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
2115:     return true;
2116:   }

## Region 2 — seed path, EA:7505–7549, whole (write at 7531; state promotion at 7538)

7505:     if(g_state == ST_IDLE)
7506:       {
7507:        if(!inWindow) return;
7508:       if(SessionAlreadyUsed(sess, barTime))
7509:         {
7510:          static datetime s_limitDay  = 0;
7511:          static int      s_limitSess = -1;
7512:          datetime dayKey = TC_DayStart(barTime);
7513:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
7514:            {
7515:             s_limitDay  = dayKey;
7516:             s_limitSess = (int)sess;
7517:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
7518:                         "all further candidates suppressed until the next window",
7519:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7520:                         SessionName(sess));
7521:            }
7522:          return;
7523:         }
7524:        PoiRetestResult pr;
7525:        if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
7526:         g_anchorLine    = pr.topLine;
7527:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
7528:        //--- writer). Live rows carry no declared class -> ABSTAIN
7529:        //--- pass-through of the legacy value (D3 holds by construction);
7530:        //--- legacy output stays the compared label, fire-log identical.
7531:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
7532:         SrjSideNote("DetectPoiRetest", g_dir);
7533:       g_anchorBarTime = barTime;
7534:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
7535:       g_sessionAtEntry = sess;
7536:       g_divLatch = false;
7537:       ENUM_SRJ_STATE prev = g_state;
7538:       g_state = ST_S1_REGIME;
7539:       LogState(prev, g_state);
7540:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
7541:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
7542:       //--- holds by construction. Additive print only; assigns nothing.
7543:       if(InpDebugLog)
7544:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
7545:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7546:                                   TIME_DATE|TIME_MINUTES),
7547:                      AnchorStr(), g_authorityRank[g_anchorLine],
7548:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
7549:       }

## Region 3 — shadow block, EA:7503 + EA:7551–7593, whole (the code that printed the 56 votes)

7503:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
7551:    //--- [SIDE-1P-FIX-SPLIT Track-1/Track-2 AdoptOff shadow] print-only recorders.
7552:    //--- Reads assigned state only. The gate consult's 6 N1 counter writes are
7553:    //--- restored like-for-like (values identical after); every other call is pure.
7554:    //--- No live-state, resolver, latch, order, stop, fixture or eligibility write.
7555:    //--- Fires only on the exact seed bar (armed==IDLE at block entry, S1 after).
7556:     {
7557:      bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
7558:      if(s1f_seedThisBar)
7559:        {
7560:         int s1f_vwEq = g_n1_vwapEq;
7561:         int s1f_poEq = g_n1_pocEq;
7562:         int s1f_vwIv = g_n1_vwapInv;
7563:         int s1f_poIv = g_n1_pocInv;
7564:         int s1f_vwSv = g_n1_vwapSurv;
7565:         int s1f_poSv = g_n1_pocSurv;
7566:         string s1f_term = "";
7567:         bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1f_term);
7568:         g_n1_vwapEq = s1f_vwEq;
7569:         g_n1_pocEq = s1f_poEq;
7570:         g_n1_vwapInv = s1f_vwIv;
7571:         g_n1_pocInv = s1f_poIv;
7572:         g_n1_vwapSurv = s1f_vwSv;
7573:         g_n1_pocSurv = s1f_poSv;
7574:         double s1f_h4 = EMPTY_VALUE;
7575:         double s1f_h1 = EMPTY_VALUE;
7576:         ReadFlow(FL_BUF_HTF_HIGH, s1f_h4, barShift);
7577:         ReadFlow(FL_BUF_HTF_MID, s1f_h1, barShift);
7578:         int s1f_l4 = S2Leg(s1f_h4);
7579:         int s1f_l1 = S2Leg(s1f_h1);
7580:         string s1f_hier = "-";
7581:         int s1f_conf = 0;
7582:         if(s1f_l4 != 0 && s1f_l4 == s1f_l1) s1f_hier = (s1f_l4 > 0) ? "LONG" : "SHORT";
7583:         else if(s1f_l4 != 0 && s1f_l1 != 0) s1f_conf = 1;
7584:         if(InpDebugLog)
7585:            PrintFormat("[SRJ-EA] SIDE1F_VOTE bar=%s dir=%s t1term=%s t1reject=%d hier=%s conf=%d",
7586:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7587:                        DirName(g_dir), s1f_term, (s1f_ok ? 0 : 1), s1f_hier, s1f_conf);
7588:         if(s1f_hier == "SHORT" && InpDebugLog)
7589:            PrintFormat("[SRJ-EA] SIDE1F_SHORT bar=%s anchor=%s",
7590:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7591:                        AnchorStr());
7592:        }
7593:     }

## Region 4 — hierarchy primitives, whole (mapping + buffer reads + buffer IDs + shift rule)

1868: bool ReadFlow(int bufIdx, double &outVal, int evalShift)
1869:   {
1870:    return ReadBuf1(g_hFlow, bufIdx, outVal, evalShift + FLOW_SHIFT_OFFSET);
1871:   }
191: #define FL_BUF_HTF_HIGH      19
192: #define FL_BUF_HTF_MID       20
193: #define FL_BUF_HTF_LOW       21
1816: #define FLOW_SHIFT_OFFSET 1
3786: int S2Leg(const double v)
3787:   {
3788:    if(v == EMPTY_VALUE) return 0;
3789:    int r = (int)MathRound(v);
3790:    if(r >= 1) return 1;
3791:    if(r <= -1) return -1;
3792:    return 0;
3793:   }

## Region 5 — site-side resolver read, EA:3798–3838, whole (where h1=+1/h4=-1 was read at S2)

3798:    for(int e = 0; e < 7; e++)
3799:      {
3800:       double ePx = 0.0; string eBT = "-"; string exID = ""; datetime D = 0; ENUM_SRJ_DIR dir = DIR_LONG;
3801:       if(!SrjSelEntry(bars[e], ePx, eBT, exID, D, dir)) continue;
3802:       int sh = iBarShift(_Symbol, PERIOD_CURRENT, D);
3803:       double h4 = EMPTY_VALUE; double h1 = EMPTY_VALUE; double m15 = EMPTY_VALUE;
3804:       if(sh >= 0)
3805:         {
3806:          ReadFlow(FL_BUF_HTF_HIGH, h4, sh);
3807:          ReadFlow(FL_BUF_HTF_MID, h1, sh);
3808:          ReadFlow(FL_BUF_HTF_LOW, m15, sh);
3809:          g_s2_h4reads++;
3810:         }
3811:       int l1 = S2Leg(h1); int l5 = S2Leg(m15);
3812:       string cls = S2RowClass(exID);
3813:       string sw = S2RowSweep(exID);
3814:       int swSide = S2SweepSide(sw);
3815:       int decided = 0; string basis = "ABSTAIN_UNKNOWN_CLASS";
3816:       int decline = 0;
3817:       if(cls == "TF")
3818:         {
3819:          if(l1 != 0 && l1 == l5) { decided = l1; basis = "TF_UNANIMOUS_1H_15M"; }
3820:          else { decline = 1; basis = "TF_SPLIT_POLARITY_MISMATCH"; g_s2_nDecline++; }
3821:         }
3822:       else if(cls == "MR")
3823:         {
3824:          if(swSide != 0) { decided = swSide; basis = "MR_SWEEP_" + sw; }
3825:          else basis = "MR_SWEEP_UNMAPPED";
3826:         }
3827:       int pinned = (dir == DIR_LONG) ? 1 : -1;
3828:       if(decided != 0 && decided != pinned)
3829:         { decline = 1; basis = basis + "_VS_PINNED_MISMATCH"; g_s2_nDecline++; }
3830:       string decS = (decided > 0) ? "LONG" : ((decided < 0) ? "SHORT" : "-");
3831:       string h1s = (h1 == EMPTY_VALUE) ? "EMPTY" : DoubleToString(h1, 1);
3832:       string m15s = (m15 == EMPTY_VALUE) ? "EMPTY" : DoubleToString(m15, 1);
3833:       string h4s = (h4 == EMPTY_VALUE) ? "EMPTY" : DoubleToString(h4, 1);
3834:       string ln = StringFormat("[SRJ-EA] SEL61SIDE ex=%s pinned=%s decided=%s decline=%d basis=%s h1=%s m15=%s h4=%s sweep=%s",
3835:         exID, DirName(dir), decS, decline, basis, h1s, m15s, h4s, sw);
3836:       LwAudit("SEL61SIDE", ln); Print(ln);
3837:      }
3838:   }

## Region 6 — side resolver pass-through, EA:3839–3847, whole (what Track-2 replaces)

3839: //--- live side routing: single writer. Live rows carry no declared class
3840: //--- -> ABSTAIN pass-through of the legacy value (D3 holds by
3841: //--- construction; proof = SEL61LIVE summary + isolation join).
3842: ENUM_SRJ_DIR S2ResolveLive(const ENUM_SRJ_DIR legDir)
3843:   {
3844:    g_s2_nLiveCalls++;
3845:    g_s2_nLiveAgree++;
3846:    return legDir;
3847:   }

## Region 7 — fire site + watch, EA:9394–9396, whole (watches read legacy direction only)

9394:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
9395:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
9396:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)

## §8. Counts (whole-file, case-sensitive; carried, re-verified on this digest at build time)

- `IsConfirmationCandle` 5 = 1 comment (2029) + 1 def (2075) + 3 calls (7567 shadow + 8209 + 8346 live, shifted +46 by this build; live gate sites otherwise unchanged).
- `g_dir` writes 3 = 956 + 6160 + 7531 (seed write shifted +2; shadow writes none; N1 restore is not direction).
- `LogSignal(` 2 = 1700 + 9394 (single fire site). `A6Fired(` 2 = 4198 + 9395.
- `SIDE1F_` 3 = 7585 + 7589 + 9396 (VOTE/SHORT/WATCH prints only). `s1f_` locals: new, single definitions.

(End — v68 companion under the §Bind digest; review asks per v68 §2)
