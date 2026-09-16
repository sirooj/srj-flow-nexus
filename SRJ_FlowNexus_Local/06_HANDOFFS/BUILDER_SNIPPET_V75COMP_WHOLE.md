# SNIPPET â€” v75 C0 EVIDENCE COMPANION (one paste with the v75 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v75-C0-GRADE-AUTHOR.md` (one trip, two pastes). Answers ride with the v75 verdicts: C0-record accept + C1-precondition rulings + next-packet authorship (never clearance/token/word/run). Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` â€” SHA256 `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` (568323 B, 10698 lines). Every code line verbatim with EA numbers. All regions below are the C0 touch surface on this digest; the run `C0-PROBE` executed exactly this tree (both compile 0/0 fresh logs).

**Decisions ahead:** C1-landing (iff preconditions (a)-(c) read YES) vs D/E-first authorship. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

Supersedes for this relay: the v73 companion is NOT needed (tree moved `590BE614`â†’`D0DD07AA`; C0 regions are inline below).

## Coverage map (every v75 mechanism claim â†’ numbered lines below)

- "resolver pass-through, vote DELETED, counters kept" â†’ R-D (agree==calls by construction; SEL61LIVE grading).
- "suppression effect DELETED, consult + SUPP print kept" â†’ R-C:7654-7659 (would-suppress marker only; S1 gate always proceeds as in RECON32).
- "both-dirs block, each leg N1-neutral" â†’ R-C:7660-7692 (6-save / call / 6-restore per leg, same idiom as the live consult R-C:7640-7653).
- "CHAIN print is a pure counter read" â†’ R-C:7688-7691 (`g_side_n`, no write).
- "seed path + shift carriage kept" â†’ R-A (shift write now DEAD â€” resolver no longer reads it â€” behavior-neutral, pre-declared).
- "shadow/PIN/PROFILE/VOTE3/TALLY untouched" â†’ R-B (legDir-pin, N1-neutral, VOTE3 head).
- "gate direction-parameterized at every branch" â†’ R-E (oppCandle/closeSideOk/bodyDir all flip on `dir`).

## Region A â€” seed path, EA:7532â€“7559, whole (detector â†’ captures â†’ owned write â†’ promotion â†’ census print)

7532:         PoiRetestResult pr;
7533:         if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
7534:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
7535:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
7536:          g_anchorLine    = pr.topLine;
7537:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
7538:        //--- writer). Live rows carry no declared class -> ABSTAIN
7539:        //--- pass-through of the legacy value (D3 holds by construction);
7540:        //--- legacy output stays the compared label, fire-log identical.
7541:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
7542:         SrjSideNote("DetectPoiRetest", g_dir);
7543:       g_anchorBarTime = barTime;
7544:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
7545:       g_sessionAtEntry = sess;
7546:       g_divLatch = false;
7547:       ENUM_SRJ_STATE prev = g_state;
7548:       g_state = ST_S1_REGIME;
7549:       LogState(prev, g_state);
7550:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
7551:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
7552:       //--- holds by construction. Additive print only; assigns nothing.
7553:       if(InpDebugLog)
7554:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
7555:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7556:                                   TIME_DATE|TIME_MINUTES),
7557:                      AnchorStr(), g_authorityRank[g_anchorLine],
7558:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
7559:       }

## Region B â€” shadow + PROFILE + VOTE3, EA:7561â€“7638, whole (legDir-pinned consult, N1-neutral; mirror + vote head; untouched by C0)

7561:    //--- [SIDE-1P-FIX-SPLIT Track-1/Track-2 AdoptOff shadow] print-only recorders.
7562:    //--- Reads assigned state only. The gate consult's 6 N1 counter writes are
7563:    //--- restored like-for-like (values identical after); every other call is pure.
7564:    //--- No live-state, resolver, latch, order, stop, fixture or eligibility write.
7565:    //--- Fires only on the exact seed bar (armed==IDLE at block entry, S1 after).
7566:     {
7567:      bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
7568:      if(s1f_seedThisBar)
7569:        {
7570:         s1g_nSeed++;
7571:         int s1f_vwEq = g_n1_vwapEq;
7572:         int s1f_poEq = g_n1_pocEq;
7573:         int s1f_vwIv = g_n1_vwapInv;
7574:         int s1f_poIv = g_n1_pocInv;
7575:         int s1f_vwSv = g_n1_vwapSurv;
7576:         int s1f_poSv = g_n1_pocSurv;
7577:         string s1f_term = "";
7578:          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 parity; value-identical pre-Stage-C)
7579:         g_n1_vwapEq = s1f_vwEq;
7580:         g_n1_pocEq = s1f_poEq;
7581:         g_n1_vwapInv = s1f_vwIv;
7582:         g_n1_pocInv = s1f_poIv;
7583:         g_n1_vwapSurv = s1f_vwSv;
7584:         g_n1_pocSurv = s1f_poSv;
7585:         double s1f_h4 = EMPTY_VALUE;
7586:         double s1f_h1 = EMPTY_VALUE;
7587:         ReadFlow(FL_BUF_HTF_HIGH, s1f_h4, barShift);
7588:         ReadFlow(FL_BUF_HTF_MID, s1f_h1, barShift);
7589:         int s1f_l4 = S2Leg(s1f_h4);
7590:         int s1f_l1 = S2Leg(s1f_h1);
7591:         string s1f_hier = "-";
7592:         int s1f_conf = 0;
7593:         if(s1f_l4 != 0 && s1f_l4 == s1f_l1) s1f_hier = (s1f_l4 > 0) ? "LONG" : "SHORT";
7594:         else if(s1f_l4 != 0 && s1f_l1 != 0) s1f_conf = 1;
7595:         if(InpDebugLog)
7596:            PrintFormat("[SRJ-EA] SIDE1F_VOTE bar=%s dir=%s t1term=%s t1reject=%d hier=%s conf=%d",
7597:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7598:                        DirName(g_dir), s1f_term, (s1f_ok ? 0 : 1), s1f_hier, s1f_conf);
7599:         if(s1f_hier == "SHORT" && InpDebugLog)
7600:            PrintFormat("[SRJ-EA] SIDE1F_SHORT bar=%s anchor=%s",
7601:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7602:                        AnchorStr());
7603:         //--- [SIDE1G] R1 PROFILE mirror (independent term booleans + pre-terms; NO second gate call)
7604:         double s1g_o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
7605:         double s1g_c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
7606:         double s1g_h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
7607:         double s1g_l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
7608:         double s1g_o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
7609:         double s1g_c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
7610:         string s1g_pre = "PASS";
7611:         if(s1g_o1 <= 0.0 || s1g_c1 <= 0.0 || s1g_o0 <= 0.0 || s1g_c0 <= 0.0) s1g_pre = "NO_DATA";
7612:         double s1g_L = g_anchorPrice;
7613:         if(s1g_pre == "PASS" && (s1g_L == EMPTY_VALUE || s1g_L <= 0.0)) s1g_pre = "NO_LINE";
7614:         int s1g_opp = (((g_dir == DIR_LONG) ? (s1g_c1 < s1g_o1) : (s1g_c1 > s1g_o1))) ? 1 : 0;
7615:         int s1g_a2 = (((g_dir == DIR_LONG) ? (s1g_c1 >= s1g_L) : (s1g_c1 <= s1g_L))) ? 1 : 0;
7616:         int s1g_isDoji = ((MathAbs(s1g_c0 - s1g_o0) < _Point * 0.0001)) ? 1 : 0;
7617:         int s1g_bodyDir = (((g_dir == DIR_LONG) ? (s1g_c0 > s1g_o0) : (s1g_c0 < s1g_o0))) ? 1 : 0;
7618:         int s1g_body = ((s1g_isDoji == 0) && (s1g_bodyDir == 1)) ? 1 : 0;
7619:         int s1g_touch = (((s1g_h1 >= s1g_L - _Point) && (s1g_l1 <= s1g_L + _Point))) ? 1 : 0;
7620:         string s1g_derived = (s1g_pre != "PASS") ? s1g_pre : ((s1g_opp == 0) ? "A_OPP" : ((s1g_a2 == 0) ? "A2_CLOSE_BREAK" : ((s1g_body == 0) ? "B_BODY" : ((s1g_touch == 0) ? "C_TOUCH" : "PASS"))));
7621:         string s1g_t1 = (s1f_term == "") ? "PASS" : s1f_term;
7622:         int s1g_match = (s1g_derived == s1g_t1) ? 1 : 0;
7623:         s1g_nProf++;
7624:         if(InpDebugLog)
7625:            PrintFormat("[SRJ-EA] SIDE1G_PROFILE bar=%s opp=%d a2=%d body=%d touch=%d pre=%s term=%s t1term=%s match=%d",
7626:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7627:                        s1g_opp, s1g_a2, s1g_body, s1g_touch, s1g_pre, s1g_derived, s1g_t1, s1g_match);
7628:         //--- [SIDE1G] R2 VOTE3 (legDir capture vs buffer vote + 15m read-only leg)
7629:         double s1g_m15 = EMPTY_VALUE;
7630:         ReadFlow(FL_BUF_HTF_LOW, s1g_m15, barShift);
7631:         int s1g_lm = S2Leg(s1g_m15);
7632:         int s1g_agree = ((s1f_l4 != 0) && (s1f_l4 == s1f_l1) && (s1g_legDir == s1f_l4)) ? 1 : 0;
7633:         s1g_nV3++;
7634:         if(InpDebugLog)
7635:            PrintFormat("[SRJ-EA] SIDE1G_VOTE3 bar=%s h4=%s h1=%s m15=%s l4=%d l1=%d lm=%d legDir=%d gdir=%s agree=%d",
7636:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7637:                        DoubleToString(s1f_h4, 1), DoubleToString(s1f_h1, 1), DoubleToString(s1g_m15, 1),
7638:                        s1f_l4, s1f_l1, s1g_lm, s1g_legDir, DirName(g_dir), s1g_agree);

## Region C â€” live consult + suppression-print + both-dirs + chain, EA:7639â€“7692, whole (the C0 edit zone)

7639:          //--- [STAGE-C E-C01] Track-1 B_BODY-only live consult (owned g_dir; N1-neutral; Sonnet-v71 S1 live-gating semantics: non-B_BODY false = pass)
7640:          int s1c_vwEq = g_n1_vwapEq;
7641:          int s1c_poEq = g_n1_pocEq;
7642:          int s1c_vwIv = g_n1_vwapInv;
7643:          int s1c_poIv = g_n1_pocInv;
7644:          int s1c_vwSv = g_n1_vwapSurv;
7645:          int s1c_poSv = g_n1_pocSurv;
7646:          string s1c_term = "";
7647:          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
7648:          g_n1_vwapEq = s1c_vwEq;
7649:          g_n1_pocEq = s1c_poEq;
7650:          g_n1_vwapInv = s1c_vwIv;
7651:          g_n1_pocInv = s1c_poIv;
7652:          g_n1_vwapSurv = s1c_vwSv;
7653:          g_n1_pocSurv = s1c_poSv;
7654:          //--- [C0-PROBE] suppression effect DELETED: consult above kept, prints kept, NO g_state write
7655:          if(!s1c_ok && s1c_term == "B_BODY")
7656:            {
7657:             if(InpDebugLog)
7658:                PrintFormat("[SRJ-EA] SIDE1C_SUPP bar=%s dir=%s term=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), s1c_term);
7659:            }
7660:          //--- [C0-PROBE] both-dirs failTerm row per seed (each leg N1-neutral, same save/restore idiom)
7661:          {
7662:           int s1c_bVwEq = g_n1_vwapEq;
7663:           int s1c_bPoEq = g_n1_pocEq;
7664:           int s1c_bVwIv = g_n1_vwapInv;
7665:           int s1c_bPoIv = g_n1_pocInv;
7666:           int s1c_bVwSv = g_n1_vwapSurv;
7667:           int s1c_bPoSv = g_n1_pocSurv;
7668:           string s1c_termLong = "";
7669:           string s1c_termShort = "";
7670:           IsConfirmationCandle(barShift, g_anchorLine, DIR_LONG, s1c_termLong);
7671:           g_n1_vwapEq = s1c_bVwEq;
7672:           g_n1_pocEq = s1c_bPoEq;
7673:           g_n1_vwapInv = s1c_bVwIv;
7674:           g_n1_pocInv = s1c_bPoIv;
7675:           g_n1_vwapSurv = s1c_bVwSv;
7676:           g_n1_pocSurv = s1c_bPoSv;
7677:           IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1c_termShort);
7678:           g_n1_vwapEq = s1c_bVwEq;
7679:           g_n1_pocEq = s1c_bPoEq;
7680:           g_n1_vwapInv = s1c_bVwIv;
7681:           g_n1_pocInv = s1c_bPoIv;
7682:           g_n1_vwapSurv = s1c_bVwSv;
7683:           g_n1_pocSurv = s1c_bPoSv;
7684:           if(InpDebugLog)
7685:              PrintFormat("[SRJ-EA] SIDE1C_BOTHDIRS bar=%s live=%s liveTerm=%s longTerm=%s shortTerm=%s",
7686:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7687:                          DirName(g_dir), s1c_term, s1c_termLong, s1c_termShort);
7688:           if(InpDebugLog)
7689:              PrintFormat("[SRJ-EA] SIDE1C_CHAIN bar=%s chainN=%d",
7690:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7691:                          g_side_n);
7692:          }

## Region D â€” resolver, EA:3844â€“3854, whole (pass-through; vote deleted)

3844: //--- live side routing: single writer. Live rows carry no declared class
3845: //--- -> ABSTAIN pass-through of the legacy value (D3 holds by
3846: //--- construction; proof = SEL61LIVE summary + isolation join).
3847: ENUM_SRJ_DIR S2ResolveLive(const ENUM_SRJ_DIR legDir)
3848:   {
3849:    //--- [C0-PROBE] null-effect pass-through: live vote DELETED; counters kept
3850:    //--- (agree==calls by construction; SEL61LIVE agree==calls expected, print-only)
3851:    g_s2_nLiveCalls++;
3852:    g_s2_nLiveAgree++;
3853:    return legDir;
3854:   }

## Region E â€” confirmation gate, EA:2079â€“2121, whole (first-fail order; untouched by C0)

2079: //--- failTerm names the FIRST failed term ("" = all terms passed).
2080: bool IsConfirmationCandle(const int barShift, const int anchorLine,
2081:                           const ENUM_SRJ_DIR dir, string &failTerm)
2082:   {
2083:    failTerm = "";
2084:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
2085:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
2086:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
2087:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
2088:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
2089:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
2090:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
2091:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
2092:       { failTerm = "NO_DATA"; return false; }
2093:    double L;
2094:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
2095:       { failTerm = "NO_LINE"; return false; }
2096:     if(L == EMPTY_VALUE || L <= 0.0)
2097:        { failTerm = "NO_LINE"; return false; }
2098:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
2099:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
2100:     //--- alike": exact equality passes. Family by line code.
2101:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
2102:     //--- paired at each terminal return below (no branch touched).
2103:     bool n1_vw = false, n1_poc = false;
2104:     if(c1 == L)
2105:       {
2106:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
2107:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
2108:       }
2109:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
2110:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2111:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
2112:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2113:     double body    = MathAbs(c0 - o0);
2114:     bool   isDoji  = (body < _Point * 0.0001);
2115:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
2116:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2117:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
2118:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2119:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
2120:     return true;
2121:   }

(End â€” v75 companion under the Â§Bind digest; review asks per v75 Â§2)

