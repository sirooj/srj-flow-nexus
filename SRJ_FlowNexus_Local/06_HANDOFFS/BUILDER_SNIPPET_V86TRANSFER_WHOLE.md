# SNIPPET — v86 TRANSFER/RANK/PREBIND COMPANION (one paste with the v86 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v86-PREEMPT-EVIDENCE-CLEAR.md` in ONE trip, TWO pastes. Answers ride with the v86 verdicts: t78 transfer consequence + rank-table verdict + R-row safety + prebind identity + PREBIND-row confirmation. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `3B5CA00BE690EA46E140D99DA442BAFA79FFA102E5418D3E7A1C1BD201522EB2` (569412 B, 10713 lines; the RECON33 probe build — logic identical to the graded tree, plus the 15-line SIDE1D print at 1944-1958). Every code line verbatim with EA numbers. Pairs with the v84 companion (Regions O/P/Q) + v75 companion (seed body, gate, resolver) + v81 companion (detector, rank 91-105, reset) + v82 companion (funnel, fires, SL/TP). The three surfaces below are NEW: the t78 branch body, the rank table, and the prebind call site.

## Coverage map (every v86 mechanism claim → numbered lines below)

- "t78 guard passing prints POIREPLACE census and does NOTHING else — the replacement call was removed per operator Q3" → R-R:7366-7389 (guard + print + removal comment + close).
- "Monthly-POC rank 6 / tier 3; Weekly-POC rank 8 / tier 4 — Weekly-vs-Monthly can never be higher" → R-S:93-104 (rank table).
- "prebind calls the SAME IsConfirmationCandle and carries its failTerm" → R-T:8324-8344 (pre-binding call + CONFIRM_PREBIND_FAIL print).

## Region R — t78 branch body, EA:7366–7389, whole (guard + print + removal + close)

7366:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7367:      {
7368:       PoiRetestResult t78_pr;
7369:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7370:         {
7371:          ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7372:          bool t78_opp  = (t78_dir != g_dir);
7373:          bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7374:                           (g_authorityRank[g_anchorLine]   / 2));
7375:          if(t78_opp && t78_tier)
7376:            {
7377:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7378:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7379:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7380:                                      TIME_DATE|TIME_MINUTES),
7381:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7382:                         g_lineCode[g_anchorLine], DirName(g_dir),
7383:                         StateName(g_state),
7384:                         g_authorityRank[t78_pr.topLine] / 2,
7385:                         g_authorityRank[g_anchorLine]   / 2);
7386:             /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
7387:            }
7388:         }
7389:      }

## Region S — authority-rank table, EA:93–104, whole

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

## Region T — prebind call site, EA:8324–8344, whole (call + promote + fail print)

8324:          string cfTermPB = "";
8325:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))
8326:            {
8327:             ENUM_SRJ_STATE prevPB = g_state;
8328:             g_confirmFromState = prevPB;
8329:             g_state = ST_S5_GATE_CHECK;
8330:             LogState(prevPB, g_state);
8331:             if(InpDebugLog)
8332:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
8333:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8334:                                         TIME_DATE|TIME_MINUTES),
8335:                            DirName(g_dir), AnchorStr());
8336:             //--- no return: fall through to the ST_S5_GATE_CHECK block below
8337:            }
8338:          else
8339:            {
8340:             if(InpDebugLog)
8341:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_FAIL bar=%s dir=%s term=%s",
8342:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8343:                                         TIME_DATE|TIME_MINUTES),
8344:                            DirName(g_dir), cfTermPB);

(End — v86 companion under the §Bind digest; review asks per v86 §2)
