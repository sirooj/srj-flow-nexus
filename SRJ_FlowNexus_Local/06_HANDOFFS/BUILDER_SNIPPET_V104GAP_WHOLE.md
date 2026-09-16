# SNIPPET V104GAP - predicate-term regions whole (EA 7BFC7FA3 / Flow 3606BFB4)
# Claim-map: G1 IsConfirmationCandle (fail ladder + N1 sites) | G2 ClassifyRegime (HTF 2-of-3 + sweep tag+dir) | G3 sweep-tag buffer fill (most-recent-unexpired carry)
# Zero condensation in code regions. Paste for the line-by-line read the review seat asked for.
## Region G1 EA:2096-2137
2096: bool IsConfirmationCandle(const int barShift, const int anchorLine,
2097:                           const ENUM_SRJ_DIR dir, string &failTerm)
2098:   {
2099:    failTerm = "";
2100:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
2101:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
2102:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
2103:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
2104:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
2105:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
2106:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
2107:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
2108:       { failTerm = "NO_DATA"; return false; }
2109:    double L;
2110:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
2111:       { failTerm = "NO_LINE"; return false; }
2112:     if(L == EMPTY_VALUE || L <= 0.0)
2113:        { failTerm = "NO_LINE"; return false; }
2114:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
2115:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
2116:     //--- alike": exact equality passes. Family by line code.
2117:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
2118:     //--- paired at each terminal return below (no branch touched).
2119:     bool n1_vw = false, n1_poc = false;
2120:     if(c1 == L)
2121:       {
2122:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
2123:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
2124:       }
2125:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
2126:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2127:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
2128:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2129:     double body    = MathAbs(c0 - o0);
2130:     bool   isDoji  = (body < _Point * 0.0001);
2131:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
2132:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2133:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
2134:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2135:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
2136:     return true;
2137:   }
## Region G2 EA:2139-2170
2139: //====================== Step 1: Regime classification ================
2140: bool ClassifyRegime(int barShift, ENUM_SRJ_DIR dir, ENUM_SRJ_REGIME &regimeOut)
2141:   {
2142:    double htfH, htfM, htfL;
2143:    if(!ReadFlow(FL_BUF_HTF_HIGH, htfH, barShift)) return false;
2144:    if(!ReadFlow(FL_BUF_HTF_MID,  htfM, barShift)) return false;
2145:    if(!ReadFlow(FL_BUF_HTF_LOW,  htfL, barShift)) return false;
2146:    int want = (dir == DIR_LONG) ? 1 : -1;
2147:    int votes = 0;
2148:    if((int)MathRound(htfH) == want) votes++;
2149:    if((int)MathRound(htfM) == want) votes++;
2150:    if((int)MathRound(htfL) == want) votes++;
2151:    bool trendOk = (votes >= 2);
2152:    double sweepTagD;
2153:    if(!ReadFlow(FL_BUF_SWEEP_TAG, sweepTagD, barShift)) return false;
2154:    int tag = (int)MathRound(sweepTagD);
2155:    bool mrOk = false;
2156:    if(tag != SWEEP_NONE)
2157:      {
2158:       bool sweptHigh = (tag == SWEEP_ASIA_HIGH || tag == SWEEP_LONDON_HIGH ||
2159:                         tag == SWEEP_NY_HIGH   || tag == SWEEP_PM_HIGH);
2160:       bool sweptLow  = (tag == SWEEP_ASIA_LOW  || tag == SWEEP_LONDON_LOW  ||
2161:                         tag == SWEEP_NY_LOW    || tag == SWEEP_PM_LOW);
2162:       if(dir == DIR_SHORT && sweptHigh) mrOk = true;
2163:       if(dir == DIR_LONG  && sweptLow)  mrOk = true;
2164:      }
2165:    if(InpDebugLog) { static int s_rc91 = 0; static int s_rcMR91 = 0; s_rc91++; if(mrOk) s_rcMR91++; PrintFormat("[SRJ-EA] REGIMECENSUS #%d bar=%s dir=%s votes=%d trendOk=%d sweepTag=%d mrOk=%d cumMR=%d", s_rc91, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), votes, (int)trendOk, tag, (int)mrOk, s_rcMR91); } if(trendOk && mrOk) regimeOut = REGIME_BOTH;
2166:    else if(trendOk)    regimeOut = REGIME_TREND;
2167:    else if(mrOk)       regimeOut = REGIME_MEANREV;
2168:    else                regimeOut = REGIME_NONE;
2169:    return true;
2170:   }
## Region G3 FlowLogic:1138-1150
F1138:          int sweepVal = 0;
F1139:          if(!g_s.freshSweepExpired && !SrjIsNa(g_s.freshSweepTag))
F1140:            {
F1141:             if(g_s.freshSweepTag == "AS.H") sweepVal = 1;
F1142:             else if(g_s.freshSweepTag == "AS.L") sweepVal = 2;
F1143:             else if(g_s.freshSweepTag == "LD.H") sweepVal = 3;
F1144:             else if(g_s.freshSweepTag == "LD.L") sweepVal = 4;
F1145:             else if(g_s.freshSweepTag == "NY.H") sweepVal = 5;
F1146:             else if(g_s.freshSweepTag == "NY.L") sweepVal = 6;
F1147:             else if(g_s.freshSweepTag == "PM.H") sweepVal = 7;
F1148:             else if(g_s.freshSweepTag == "PM.L") sweepVal = 8;
F1149:            }
F1150:          g_bufSweepTag[target] = (double)sweepVal;
