# SNIPPET — v81 DETECTOR/RESET/WINDOW COMPANION (one paste with the v81 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v81-DE-COMPLETE.md` (one trip, two pastes). Answers ride with the v81 verdicts: open-cell completion (D predicate via detector sight or probe spec; E hold via window authorship; S2-vs-1R design; range) + clear-on-sight. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` (568323 B, 10698 lines). Every code line verbatim with EA numbers. Pairs with the v75 companion (seed/shadow/resolver/gate) + v80 companion (confirm/R-latch) — same digest, still binding, not re-pasted. The four regions below are the NEW detector/ranking/reset/window surfaces both v80 returns named as missing.

**Decisions ahead:** which of Luna's three D mechanisms (manufacture-opposite / change-eligibility / independent-source) + E hold authorship (live-window definition) + S2-vs-1R lineage design. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Coverage map (every v81 mechanism claim → numbered lines below)

- "both directions ARE checked per line; single candidate returned; LONG wins ties; loser discarded silently" → R-H:1919-1943 (bestLong/bestShort tracked per line; tie-break `<=` at 1940; loser leaves no trace).
- "eligibility ordering is the static rank table; Daily-POC rank 10" → R-I:91-105.
- "reset clears EVERYTHING (state/dir/anchor/latch) — the 16:45 rebirth path" → R-J:6165-6192.
- "the ONLY window-expiry code on disk is shadow-only (session-close); no live-candidate expiry exists" → R-K:6698-6710 + the F-comment reference (v80 companion R-F:8444, "alive and in-window" undefined there).

## Region H — detector, EA:1894–1948, whole (scan → rank → single return)

1894: bool DetectPoiRetest(int barShift, PoiRetestResult &r)
1895:   {
1896:    r.found = false; r.isLong = false; r.topLine = -1;
1897:    double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
1898:    double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
1899:    double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
1900:    double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
1901:    if(h <= 0.0 || l <= 0.0) return false;
1902:    //--- [P-NEXTOPEN 2026-09-09, operator directive] The retest's body-side
1903:    //--- test is evaluated at the NEXT candle's OPEN, not the retest candle's
1904:    //--- close (Part A spec section 4: evaluate at the next candle's open).
1905:    //--- Fail-soft: the retest candle's close is the fallback if the next
1906:    //--- bar's open cannot be read.
1907:    double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
1908:    if(cNext <= 0.0) cNext = c;
1909:    double bodyHi = MathMax(o, cNext);
1910:    double bodyLo = MathMin(o, cNext);
1911:    double P   = _Point;
1912:    double EPS = P * 0.001;
1913:    double lineVal[POI_NLINES];
1914:    for(int k = 0; k < POI_NLINES; k++)
1915:      {
1916:       if(!ReadBuf1(g_hPoi, k, lineVal[k], barShift))
1917:          lineVal[k] = EMPTY_VALUE;
1918:      }
1919:     int bestLongRank = INT_MAX, bestLongLine = -1;
1920:     int bestShortRank = INT_MAX, bestShortLine = -1;
1921:     //--- [P-SLDEF-1b E19] per-call equality instances for verdict pairing.
1922:     int n1e_nW = 0, n1e_nB = 0;
1923:     for(int k = 0; k < POI_NLINES; k++)
1924:       {
1925:        double L = lineVal[k];
1926:        if(L == EMPTY_VALUE || L <= 0.0) continue;
1927:        //--- [P-SLDEF-1 E14] N1 counters: exact-equality encounters, counted
1928:        //--- without branching (outcome untouched). Grounding: LONG survives
1929:        //--- iff the wick pierces (l <= L-P+EPS) AND the body holds
1930:        //--- (bodyLo >= L-EPS); equality on either term passes. SHORT mirror.
1931:         if(l == L || h == L) { g_n1_poiEqWick++; n1e_nW++; }
1932:         if(bodyLo == L || bodyHi == L) { g_n1_poiEqBody++; n1e_nB++; }
1933:        if(l <= L - P + EPS && bodyLo >= L - EPS)
1934:         { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
1935:       if(h >= L + P - EPS && bodyHi <= L + EPS)
1936:         { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
1937:      }
1938:     if(bestLongLine < 0 && bestShortLine < 0)
1939:       { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
1940:     if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
1941:       { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
1942:     else
1943:       { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
1944:     //--- [P-SLDEF-1b E19] the retest lived: every equality instance in this
1945:     //--- call survived (the setup proceeded despite it).
1946:     g_n1_entryWickSurv += n1e_nW; g_n1_entryBodySurv += n1e_nB;
1947:     return true;
1948:   }

## Region I — authority rank table, EA:91–105, whole

91: void InitAuthorityTable()
92:   {
93:    g_authorityRank[POI_BUF_F_POC]  = 0;   g_lineCode[POI_BUF_F_POC]  = "FOMC-POC";
94:    g_authorityRank[POI_BUF_F_VWAP] = 1;   g_lineCode[POI_BUF_F_VWAP] = "FOMC-VWAP";
95:    g_authorityRank[POI_BUF_Y_POC]  = 2;   g_lineCode[POI_BUF_Y_POC]  = "Yearly-POC";
96:    g_authorityRank[POI_BUF_Y_VWAP] = 3;   g_lineCode[POI_BUF_Y_VWAP] = "Yearly-VWAP";
97:    g_authorityRank[POI_BUF_Q_POC]  = 4;   g_lineCode[POI_BUF_Q_POC]  = "Quarterly-POC";
98:    g_authorityRank[POI_BUF_Q_VWAP] = 5;   g_lineCode[POI_BUF_Q_VWAP] = "Quarterly-VWAP";
99:    g_authorityRank[POI_BUF_M_POC]  = 6;   g_lineCode[POI_BUF_M_POC]  = "Monthly-POC";
100:    g_authorityRank[POI_BUF_M_VWAP] = 7;   g_lineCode[POI_BUF_M_VWAP] = "Monthly-VWAP";
101:    g_authorityRank[POI_BUF_W_POC]  = 8;   g_lineCode[POI_BUF_W_POC]  = "Weekly-POC";
102:    g_authorityRank[POI_BUF_W_VWAP] = 9;   g_lineCode[POI_BUF_W_VWAP] = "Weekly-VWAP";
103:    g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
104:    g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
105:   }

## Region J — reset, EA:6165–6192, whole

6165: void ResetSequence()
6166:   {
6167:    g_state          = ST_IDLE;
6168:    g_dir            = DIR_NONE;
6169:    SrjSideNote("ResetSequence", g_dir);
6170:    g_regime         = REGIME_NONE;
6171:    g_sessionAtEntry = SESSION_NONE;
6172:    g_anchorLine     = -1;
6173:    g_anchorPrice    = 0.0;
6174:    g_anchorBarTime  = 0;
6175:    g_divLatch       = false;
6176:    g_touchSeen      = false;
6177:    g_touchBarHi     = 0.0;
6178:    g_touchBarLo     = 0.0;
6179:    g_zoneHi         = 0.0;
6180:    g_zoneLo         = 0.0;
6181:    g_alertedArmed   = false;
6182:    g_alertedSignal  = false;
6183:    g_latchedEntry   = 0.0;
6184:    g_latchedSl      = 0.0;
6185:    g_latchedTp      = 0.0;
6186:    g_latchedR       = 0.0;
6187:    g_latchBarTime   = 0;
6188:    g_confirmFromState = ST_IDLE;
6189:    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
6190:    //--- price, time, zone, touch, state, latch + confirmFrom only — all are
6191:    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
6192:   }

## Region K — shadow expiry (only window-expiry on disk), EA:6698–6710, whole

6698:    //--- TASK 15: shadow re-evaluation. Read-only.
6699:    if(InpDebugLog && g_shadowActive)
6700:      {
6701:       if(sess != g_shadowSess)
6702:         {
6703:          PrintFormat("[SRJ-EA] SHADOW_EXPIRE fail=%s dir=%s poi=%s opened=%s "
6704:                      "barsAlive=%d - session window closed without conversion",
6705:                      g_shadowFail, DirName(g_shadowDir),
6706:                      (g_shadowLine >= 0) ? g_lineCode[g_shadowLine] : "-",
6707:                      TimeToString(g_shadowOpened, TIME_DATE|TIME_MINUTES),
6708:                      g_shadowBars);
6709:          g_shadowActive = false;
6710:         }

(End — v81 companion under the §Bind digest; review asks per v81 §2)
