# SNIPPET — WHOLE FIX SURFACE (one paste; zero condensation in code regions)

**Paste whole to EACH reviewer (one paste, not dozens). Answers ride with the v66 verdicts (same two asks: reasoning-approve/reject + defects by line number). Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `E68E0AE38CB0C968132368C6BDD45E155C55B956A7FE4A06260AE43E55700057` (559189 B, 10550 lines). Every line below is verbatim with its EA line number. Code regions carry ZERO condensation (no `[…]` anywhere below). Only the count table (§7) is carried from the filed record.

**The decision ahead (one line per track):** Track 1 London — consult the Region-1 gate inside the Region-3 seed path (shadow only; live seed untouched). Track 2 NY AM — resolve the Region-3 seed by agreeing-4H/1H hierarchy with conflict printed, never silently resolved (shadow only; Region-5 pass-through untouched). His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Region 1 — gate, EA:2075–2116, whole (his London rule lives at 2111)

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

## Region 2 — producer, EA:1889–1943, whole (vote construction + tie-break)

1889: bool DetectPoiRetest(int barShift, PoiRetestResult &r)
1890:   {
1891:    r.found = false; r.isLong = false; r.topLine = -1;
1892:    double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
1893:    double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
1894:    double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
1895:    double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
1896:    if(h <= 0.0 || l <= 0.0) return false;
1897:    //--- [P-NEXTOPEN 2026-09-09, operator directive] The retest's body-side
1898:    //--- test is evaluated at the NEXT candle's OPEN, not the retest candle's
1899:    //--- close (Part A spec section 4: evaluate at the next candle's open).
1900:    //--- Fail-soft: the retest candle's close is the fallback if the next
1901:    //--- bar's open cannot be read.
1902:    double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
1903:    if(cNext <= 0.0) cNext = c;
1904:    double bodyHi = MathMax(o, cNext);
1905:    double bodyLo = MathMin(o, cNext);
1906:    double P   = _Point;
1907:    double EPS = P * 0.001;
1908:    double lineVal[POI_NLINES];
1909:    for(int k = 0; k < POI_NLINES; k++)
1910:      {
1911:       if(!ReadBuf1(g_hPoi, k, lineVal[k], barShift))
1912:          lineVal[k] = EMPTY_VALUE;
1913:      }
1914:     int bestLongRank = INT_MAX, bestLongLine = -1;
1915:     int bestShortRank = INT_MAX, bestShortLine = -1;
1916:     //--- [P-SLDEF-1b E19] per-call equality instances for verdict pairing.
1917:     int n1e_nW = 0, n1e_nB = 0;
1918:     for(int k = 0; k < POI_NLINES; k++)
1919:       {
1920:        double L = lineVal[k];
1921:        if(L == EMPTY_VALUE || L <= 0.0) continue;
1922:        //--- [P-SLDEF-1 E14] N1 counters: exact-equality encounters, counted
1923:        //--- without branching (outcome untouched). Grounding: LONG survives
1924:        //--- iff the wick pierces (l <= L-P+EPS) AND the body holds
1925:        //--- (bodyLo >= L-EPS); equality on either term passes. SHORT mirror.
1926:         if(l == L || h == L) { g_n1_poiEqWick++; n1e_nW++; }
1927:         if(bodyLo == L || bodyHi == L) { g_n1_poiEqBody++; n1e_nB++; }
1928:        if(l <= L - P + EPS && bodyLo >= L - EPS)
1929:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
1930:       if(h >= L + P - EPS && bodyHi <= L + EPS)
1931:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
1932:      }
1933:     if(bestLongLine < 0 && bestShortLine < 0)
1934:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
1935:     if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
1936:       { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
1937:     else
1938:       { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
1939:     //--- [P-SLDEF-1b E19] the retest lived: every equality instance in this
1940:     //--- call survived (the setup proceeded despite it).
1941:     g_n1_entryWickSurv += n1e_nW; g_n1_entryBodySurv += n1e_nB;
1942:     return true;
1943:   }

## Region 3 — seed path, EA:7503–7547, whole (Track-1 wiring point + the only direction-setting write at 7529)

7503:    if(g_state == ST_IDLE)
7504:      {
7505:       if(!inWindow) return;
7506:       if(SessionAlreadyUsed(sess, barTime))
7507:         {
7508:          static datetime s_limitDay  = 0;
7509:          static int      s_limitSess = -1;
7510:          datetime dayKey = TC_DayStart(barTime);
7511:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
7512:            {
7513:             s_limitDay  = dayKey;
7514:             s_limitSess = (int)sess;
7515:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
7516:                         "all further candidates suppressed until the next window",
7517:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7518:                         SessionName(sess));
7519:            }
7520:          return;
7521:         }
7522:        PoiRetestResult pr;
7523:        if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
7524:         g_anchorLine    = pr.topLine;
7525:        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
7526:        //--- writer). Live rows carry no declared class -> ABSTAIN
7527:        //--- pass-through of the legacy value (D3 holds by construction);
7528:        //--- legacy output stays the compared label, fire-log identical.
7529:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
7530:         SrjSideNote("DetectPoiRetest", g_dir);
7531:       g_anchorBarTime = barTime;
7532:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
7533:       g_sessionAtEntry = sess;
7534:       g_divLatch = false;
7535:       ENUM_SRJ_STATE prev = g_state;
7536:       g_state = ST_S1_REGIME;
7537:       LogState(prev, g_state);
7538:       //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
7539:       //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
7540:       //--- holds by construction. Additive print only; assigns nothing.
7541:       if(InpDebugLog)
7542:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
7543:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7544:                                   TIME_DATE|TIME_MINUTES),
7545:                      AnchorStr(), g_authorityRank[g_anchorLine],
7546:                      B3_AnchorTier(g_anchorLine), DirName(g_dir));
7547:      }

## Region 4a — gate call 1, EA:8150–8183, whole (with its ruling comment)

8150:          //--- [P-CONFIRM-ANYSTATE E1 2026-09-11, operator ruling verbatim: "if
8151:          //--- all my conditions are met, the trade is ON. The EA must take the
8152:          //--- confirmation candle whenever it appears (even while its own prep
8153:          //--- is unfinished), keeping the one-bar rule."] A PRE-BINDING
8154:          //--- candidate (S3_ZONE_WAIT: zone unbound or not in play) now ALSO
8155:          //--- evaluates the confirmation predicate at this bar's close. PASS ->
8156:          //--- promote DIRECTLY to ST_S5_GATE_CHECK (the S5 block below runs in
8157:          //--- this same pass: divergence walk -> R latch -> fire); FAIL -> the
8158:          //--- confirmation is consumed (no carry-forward; the candidate stays
8159:          //--- at S3). DECLARED: the pre-confirmation freshness poll cannot run
8160:          //--- pre-binding (it tests the BOUND zone), so a pre-bind firing
8161:          //--- proceeds without it; S2 candidates are OUTSIDE the ruled scope.
8162:          string cfTermPB = "";
8163:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))
8164:            {
8165:             ENUM_SRJ_STATE prevPB = g_state;
8166:             g_confirmFromState = prevPB;
8167:             g_state = ST_S5_GATE_CHECK;
8168:             LogState(prevPB, g_state);
8169:             if(InpDebugLog)
8170:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
8171:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8172:                                         TIME_DATE|TIME_MINUTES),
8173:                            DirName(g_dir), AnchorStr());
8174:             //--- no return: fall through to the ST_S5_GATE_CHECK block below
8175:            }
8176:          else
8177:            {
8178:             if(InpDebugLog)
8179:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_FAIL bar=%s dir=%s term=%s",
8180:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8181:                                         TIME_DATE|TIME_MINUTES),
8182:                            DirName(g_dir), cfTermPB);
8183:             return;

## Region 4b — gate call 2, EA:8290–8311, whole (S4→S5 edge; the 16:35 NY AM kill site)

8290:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
8291:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
8292:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
8293:          //--- through is the retracement, a CLOSE through is a line break).
8294:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
8295:          //--- failed term consumes the confirmation (no carry-forward) and a
8296:          //--- later bar can present a fresh confirmation while the candidate is
8297:          //--- alive and in-window. The touch fallback above STAYS (it sets
8298:          //--- g_touchSeen - the retracement detection; unchanged).
8299:          string cfTerm = "";
8300:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
8301:            {
8302:             ENUM_SRJ_STATE prev = g_state;
8303:             g_confirmFromState = prev;
8304:             g_state = ST_S5_GATE_CHECK;
8305:             LogState(prev, g_state);
8306:            }
8307:          else if(InpDebugLog)
8308:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
8309:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8310:                                      TIME_DATE|TIME_MINUTES),
8311:                         DirName(g_dir), cfTerm);

## Region 5 — side resolver, EA:3839–3847, whole (the pass-through Track-2 replaces)

3839: //--- live side routing: single writer. Live rows carry no declared class
3840: //--- -> ABSTAIN pass-through of the legacy value (D3 holds by
3841: //--- construction; proof = SEL61LIVE summary + isolation join).
3842: ENUM_SRJ_DIR S2ResolveLive(const ENUM_SRJ_DIR legDir)
3843:   {
3844:    g_s2_nLiveCalls++;
3845:    g_s2_nLiveAgree++;
3846:    return legDir;
3847:   }

## Region 6 — the other two direction writes (single-owner proof; nothing else in 10550 lines assigns direction)

955: ENUM_SRJ_STATE   g_state          = ST_IDLE;
956: ENUM_SRJ_DIR     g_dir            = DIR_NONE;
957: ENUM_SRJ_REGIME  g_regime         = REGIME_NONE;
6159:    g_state          = ST_IDLE;
6160:    g_dir            = DIR_NONE;
6161:    SrjSideNote("ResetSequence", g_dir);

## §7. Count table (carried; any hidden site breaks these numbers)

- `IsConfirmationCandle`: 4 = 1 comment (2029) + 1 def (2075) + 2 calls (8163, 8300). NOTHING else in 10550 lines names it.
- `DetectPoiRetest`: 12 = 4 comments + 1 def (1889) + 3 census/shadow reads (7346/7457/7497, locals-only, zero direction/state writes) + 1 seed vote (7523) + 1 side-note tag (7530) + 1 distant comment + 1 header comment (108). Single voting call: 7523.
- `g_dir` writes: 3 = decl-init (956) + reset (6160) + seed (7529). Regions 3+6 show all three.

(End — whole-region snippet under the §Bind digest; review asks per v66 §2; locks per v66 §0)
