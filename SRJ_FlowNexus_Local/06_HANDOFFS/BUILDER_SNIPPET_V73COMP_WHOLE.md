# SNIPPET — v73 EVIDENCE COMPANION (one paste with the v73 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v73-STAGEC-REAUTHOR.md` (one trip, two pastes). Answers ride with the v73 verdicts: session-memory void rule + R1-compatible scope or close-gating finding (prediction/threshold/evidence each), never clearance/token/word. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `590BE6140D6FF616BCDF2465B00B86DBBE19A8FCACB277C81041291ABB94E095` (567138 B, 10679 lines). Every code line verbatim with EA numbers. All regions below are the Stage-C touch surface on this digest; nothing else on this tree decides Stage-C behavior.

**Decisions ahead:** (a) voided seed consumes the session budget or detector may re-fire; (b) validity rule separating S1's 09:15 seed from R1's 09:55 seed, or no-separation finding closing seed-gating. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

Supersedes for this relay: the v68 companion is NOT needed (gate now inline as Region G below; E-table key lines restated in the relay §0B).

## Coverage map (every v73 evidentiary claim → numbered lines below)

- Q-a "suppression returns IDLE post-shadow; S1 block skipped as consequence" → R-E:7670 + R-E:7677.
- Q-a "SUPP print; 16 observed" → R-E:7672 + journal extract (17/`87CBA2AB…`).
- Q-a "session budget untouched by the diff" → §8 (SessionAlreadyUsed 2 sites; all 6 edit anchors outside session lines) + R-B (session write at 7559 runs BEFORE any suppression point).
- Q-b "09:15 and 09:55 both B_BODY-class under the live gate" → R-E:7661 (owned-dir consult) + gate ordering per v68 companion (A_OPP→A2→B_BODY→C_TOUCH, body branch terminal).
- Q-b ordering + first-fail + B_BODY-terminal branch → R-G:2079-2080/2109-2118.
- Q-b "resolver agree→vote else legacy" → R-C:3861-3867.
- Q-b "shift carriage seed→resolver" → R-A:1039 + R-B:7549.
- Q-b "shadow legDir-pin preserves legacy diagnostics" → R-D:7592 + §8 (shared-54 payloads: 43 identical).
- Q-b "live consult N1-neutral; single seed-path g_dir writer" → R-E:7654-7667 + R-B:7555 + §8 (gdir writes 3 total = 1 seed-path + 2 pre-existing non-seed sites; isconf 6 = 5 carried + 1 declared live).

## Region A — file-scope carriage, EA:1035–1039, whole

1035: int              s1g_nSeed      = 0;   //--- [SIDE1G] recon counters (print-only tally)
1036: int              s1g_nProf      = 0;
1037: int              s1g_nV3        = 0;
1038: int              s1g_legDir     = 0;   //--- seed-block capture (assigned at seed, read in shadow)
1039: int              g_s2_seedShift = -1;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote (seed block writes, resolver reads)

## Region B — seed path, EA:7545–7573, whole (detector → captures → owned write → promotion → census print)

7545:         }
7546:         PoiRetestResult pr;
7547:         if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
7548:         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
7549:         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
7550:          g_anchorLine    = pr.topLine;
7551:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
7552:        //--- writer). Live rows carry no declared class -> ABSTAIN
7553:        //--- pass-through of the legacy value (D3 holds by construction);
7554:        //--- legacy output stays the compared label, fire-log identical.
7555:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
7556:         SrjSideNote("DetectPoiRetest", g_dir);
7557:       g_anchorBarTime = barTime;
7558:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
7559:       g_sessionAtEntry = sess;
7560:       g_divLatch = false;
7561:       ENUM_SRJ_STATE prev = g_state;
7562:       g_state = ST_S1_REGIME;
7563:       LogState(prev, g_state);
7564:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
7565:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
7566:       //--- holds by construction. Additive print only; assigns nothing.
7567:       if(InpDebugLog)
7568:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
7569:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7570:                                   TIME_DATE|TIME_MINUTES),
7571:                      AnchorStr(), g_authorityRank[g_anchorLine],
7572:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
7573:       }

## Region C — resolver, EA:3847–3868, whole (the live ownership function; pre-Stage-C it returned legDir)

3847: ENUM_SRJ_DIR S2ResolveLive(const ENUM_SRJ_DIR legDir)
3848:   {
3849:    //--- [STAGE-C E-C05] Track-2 live ownership: 4H/1H vote at the exact seed bar; abstain = legacy legDir
3850:    g_s2_nLiveCalls++;
3851:    double s1c_h4 = EMPTY_VALUE;
3852:    double s1c_h1 = EMPTY_VALUE;
3853:    int s1c_sh = g_s2_seedShift;
3854:    if(s1c_sh >= 0)
3855:      {
3856:       ReadFlow(FL_BUF_HTF_HIGH, s1c_h4, s1c_sh);
3857:       ReadFlow(FL_BUF_HTF_MID, s1c_h1, s1c_sh);
3858:      }
3859:    int s1c_l4 = S2Leg(s1c_h4);
3860:    int s1c_l1 = S2Leg(s1c_h1);
3861:    ENUM_SRJ_DIR s1c_out = legDir;
3862:    if(s1c_l4 != 0 && s1c_l4 == s1c_l1)
3863:      {
3864:       if(s1c_l4 > 0) s1c_out = DIR_LONG; else s1c_out = DIR_SHORT;
3865:      }
3866:    if(s1c_out == legDir) g_s2_nLiveAgree++;
3867:    return s1c_out;
3868:   }

## Region D — shadow consult core, EA:7586–7598, whole (saves + legDir-pinned call + restores)

7586:         int s1f_poEq = g_n1_pocEq;
7587:         int s1f_vwIv = g_n1_vwapInv;
7588:         int s1f_poIv = g_n1_pocInv;
7589:         int s1f_vwSv = g_n1_vwapSurv;
7590:         int s1f_poSv = g_n1_pocSurv;
7591:         string s1f_term = "";
7592:          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 parity; value-identical pre-Stage-C)
7593:         g_n1_vwapEq = s1f_vwEq;
7594:         g_n1_pocEq = s1f_poEq;
7595:         g_n1_vwapInv = s1f_vwIv;
7596:         g_n1_pocInv = s1f_poIv;
7597:         g_n1_vwapSurv = s1f_vwSv;
7598:         g_n1_pocSurv = s1f_poSv;

## Region E — live consult + suppression + S1 gate, EA:7648–7685, whole (VOTE3 tail, then the deciding lines, then the skipped gate)

7648:         if(InpDebugLog)
7649:            PrintFormat("[SRJ-EA] SIDE1G_VOTE3 bar=%s h4=%s h1=%s m15=%s l4=%d l1=%d lm=%d legDir=%d gdir=%s agree=%d",
7650:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
7651:                        DoubleToString(s1f_h4, 1), DoubleToString(s1f_h1, 1), DoubleToString(s1g_m15, 1),
7652:                        s1f_l4, s1f_l1, s1g_lm, s1g_legDir, DirName(g_dir), s1g_agree);
7653:          //--- [STAGE-C E-C01] Track-1 B_BODY-only live consult (owned g_dir; N1-neutral; Sonnet-v71 S1 live-gating semantics: non-B_BODY false = pass)
7654:          int s1c_vwEq = g_n1_vwapEq;
7655:          int s1c_poEq = g_n1_pocEq;
7656:          int s1c_vwIv = g_n1_vwapInv;
7657:          int s1c_poIv = g_n1_pocInv;
7658:          int s1c_vwSv = g_n1_vwapSurv;
7659:          int s1c_poSv = g_n1_pocSurv;
7660:          string s1c_term = "";
7661:          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
7662:          g_n1_vwapEq = s1c_vwEq;
7663:          g_n1_pocEq = s1c_poEq;
7664:          g_n1_vwapInv = s1c_vwIv;
7665:          g_n1_pocInv = s1c_poIv;
7666:          g_n1_vwapSurv = s1c_vwSv;
7667:          g_n1_pocSurv = s1c_poSv;
7668:          if(!s1c_ok && s1c_term == "B_BODY")
7669:            {
7670:             g_state = ST_IDLE;   //--- suppress: seed voided live (all shadow rows already printed above)
7671:             if(InpDebugLog)
7672:                PrintFormat("[SRJ-EA] SIDE1C_SUPP bar=%s dir=%s term=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), s1c_term);
7673:            }
7674:         }
7675:     }
7676: 
7677:      if(g_state == ST_S1_REGIME)
7678:      {
7679:       ENUM_SRJ_REGIME regime;
7680:       if(!ClassifyRegime(barShift, g_dir, regime))
7681:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
7682:       if(regime == REGIME_NONE)
7683:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
7684:       g_regime = regime;
7685:       ENUM_SRJ_STATE prev = g_state;

[BRACKETED — not quoted, carried by reference, no mechanism claim rests on hidden text]
- Gate body: now INLINE as Region G below (no external file needed for this relay).
- PROFILE mirror + VOTE3 head + SIDE1F_VOTE/SHORT prints: unchanged by this build; texts per v68 companion + RECON32 record.
- N1 counter declarations: six counters saved/restored like-for-like at R-D and R-E (values identical after each consult).

## §8. Counts (whole-file, case-sensitive, measured post-build on this digest)

- `g_dir` writes 3 = 1 seed-path owned writer (R-B:7555) + 2 pre-existing non-seed sites (init/reset, untouched). No second seed-path writer.
- `IsConfirmationCandle` 6 = 1 def + 1 shadow call (R-D:7592, legDir-pinned) + 1 live call (R-E:7661, owned-dir) + 3 pre-existing (comment + 2 live sites, untouched).
- `OrderSend(` 0. `SIDE1C_` 1 print site (R-E:7672). `SIDE1F_`/`SIDE1G_` print sites unchanged.
- `SessionAlreadyUsed` 2 sites, `g_sessionAtEntry` writes 5 sites — none inside the 6 Stage-C edit anchors (decl/seed-write/resolver/pin/live-block/typo-fix), so the session budget logic is textually untouched by this build; the cascade is behavior through unchanged session code, which is exactly Q-a.
- Arithmetic: 10640 + 39 added = 10679 on disk (decl +1, shift-write +1, resolver +15 net, live block +22). A mid-turn line-count probe printed a transient short count; re-measured cleanly twice with content-anchored reads (authoritative value stands).

## Region G — confirmation gate, EA:2079–2121, whole (first-fail order; B_BODY terminal at its stage; untouched by this build)

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

(End — v73 companion under the §Bind digest; review asks per v73 §1)
