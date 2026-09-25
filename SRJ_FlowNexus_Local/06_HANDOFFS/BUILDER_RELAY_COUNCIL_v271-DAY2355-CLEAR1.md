CODE REVIEW REQUEST - v271 - 2026-09-25 (PACKET_P-DAY2355-1 v2: exact 23:55-open day-close fill; nothing builds or spends on this verdict alone)
Seats: identical text to Luna + GLM (his free-low-tier-only word for this small fix; frontier Opus + Astra excluded on his word, waiver-class precedent v270 ledger 723/733). Keys come only from the key seat; this relay demands none.
Session: NEW council session (full form - packet twin + code + rows whole inline; no digest-only attested content).
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.
Change (one plain sentence): clear PACKET_P-DAY2355-1 v2 by name for exactly one build (E1 4-line day-mark lookahead as pasted, STAGE-1 exact-diff gated) plus one scoped run (Friday 9/4 00:00 to Monday 9/8 00:00, acceptance A1-A3 as stated).
File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 / EvaluateManagedTrade / EA 11424-11472 (trigger block + price + executor, contiguous 49 lines, zero elisions)
Source digest: D74FE972 / 633552 B / 11502 lines (measured after last write; tree unmodified since the RECON60 build)
Priors (labeled, never unattributed): RECON60 result 48BF89EA/12490/78 + tabulation A2AE6285/12101/173 (7 takes, Monday-fill defect in rows below); packet v1 F4739FA2/6030/57 superseded untransported; v225 weekend semantic retired for DAY_CLOSE by his 2026-09-25 word.
Delta vs prior verdicts (folded-or-why-not, all four verdict files grepped this turn): GLM one-bar-later + next-session-open weekend-fill flags - FOLDED (this packet moves DAY_CLOSE execution to Friday 23:55:00; packet Rule/A2); Luna weekend-mark semantic questions - FOLDED (retired for DAY_CLOSE by his 2026-09-25 word; packet Authority); Opus print-label point (bar= vs bar-time) - FOLDED (prints unchanged by design; acceptance joins fill-time + ref, stated in packet Scope); Opus/Astra grade-bars-first - KEPT (A2/A3 grade bars/refs first, timing second).
Packet v2 twin (P-prefixed 57 lines, prefix-stripped bodies diff 0 vs F26EEEFD/7174/57, asserted above):
P001: # PACKET_P-DAY2355-1 v2 DRAFT - day-close exact 23:55-open fill on his precision word (nothing builds/runs/commits on this file)
P002: 
P003: Status: v2 DRAFT (v1 superseded, never transported; code block unchanged). His precision word: fill EXACTLY the 23:55 opening price - at/after the 23:50-close candle, no "about", no tolerance. His run scope: test window Friday 9/4 00:00 to Monday 9/8 00:00 ONLY. His relay scope: free low-tier seats only (Luna + GLM; frontier Opus + Astra excluded on his word, waiver-class precedent v270). Relay + battery owed before any transport. Whitespace below S1-asserted at build; relay carries the byte-verified region.)
P004: 
P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 +4 additive provisional, old 0; label/price-pin forms are council questions at relay; S3 recount governs). No new indicator buffers. No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
P006: 
P007: ## Authority (his words + disk, no invention)
P008: 
P009: - His 2026-09-25 precision ruling (verbatim core): no "at about" - precisely at 23:55 opening price or after the 23:50 closing 5m candle. Run scope: test run for Friday 9/4 to Monday 9/7 only. Relay scope: free low-tier seats only, small fix. Base ruling kept (v1 L9: best-version approval, sole-critic day-close, swap+spread purpose, chart O 1.16093 spread 18).
P010: - Disk defect (RECON60 segment, quoted): MTEXIT bar=2026.09.04 23:55 + MTCLOSE bar=2026.09.04 23:55 leg=DAY_CLOSE ref=1.16093 both printed 2026.09.07 00:00:07; deal #7 sell 0.57 at 1.16093 timestamped 2026.09.07 00:00:07. Verdict Friday, evaluated + filled Monday (the 23:55 bar only closes on the next trading bar). Friday 23:55:00 ticks PROVED (16 evaluation rows at sim 2026.09.04 23:55:00) - early execution feasible in-tester.
P011: - Supersession (canon order): v225-era weekend semantic (first-trading-bar evaluation acts, price = weekend-gap nextOpenPx) retired for DAY_CLOSE by his later word; nearest-booking/BREAK/next-open + all RECON60 grades otherwise stand.
P012: 
P013: ## Rule (one behavior, one build)
P014: 
P015: - DAY_CLOSE leg: when the day mark falls inside the NEXT bar at a closed-bar evaluation (Friday 23:55:00 for the 23:55 mark bar, i.e. at/after the 23:50-close candle), set vDAY then and execute synchronously on that tick - the first tick of the 23:55 bar, whose bid IS the bar open, so the market fill prints exactly the 23:55 open (no tolerance - his precisely). WITHDRAWN v1 phrase: "approx 23:55 open". Monday fallback preserved: if no Friday evaluation exists in-segment, the old line still catches the mark Monday (acceptance A1 then halts with cause no-Friday-ticks, never passes silently).
P016: - Untouched: vBREAK/vHTF/vSL/vTP legs, priority order, HTF experiment, CANCEL_BIAS, MTCOLLISION path, buffers, inputs, session marks, booking, votes, R floor, live alerts-only (E5 tester gate untouched).
P017: 
P018: ## Scope (day-close timing only)
P019: 
P020: - REQUIRED: zero DAY_CLOSE fills timestamped on/after the day boundary; MTCLOSE DAY_CLOSE printed on the verdict day; MTCLOSE ref == the 23:55 bar open of that day (byte join); deal fill == the same open exactly, no tolerance (his precisely; WITHDRAWN v1 phrase: "within bar-granularity spread tolerance"); BREAK-leg rows identical to RECON60; takes identical bars/entries (lots re-derived second); 9/4-invalid still refused; MTCOLLISION 0.
P021: - Stated-unmeasurable: swap rows do not exist in-segment (record RECON59); swap-avoidance established by fill-timing (A1), never by swap rows.
P022: 
P023: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated)
P024: 
P025: - E1 day-mark lookahead (old EA 11424-11431 8 lines, new +4 insert after the mark-hit line, old 0):
P026:   old:
P027: `//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.`
P028: `if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)`
P029: `  {`
P030: `   for(int dc = 0; dc < g_news_dayN; dc++)`
P031: `     {`
P032: `      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }`
P033: `     }`
P034: `  }`
P035:   new (insert after the mark-hit line, 4 lines, indentation matched to sibling, S1 char-code asserts):
P036: `      //--- [P-DAY2355-1] his 23:55-open rule 2026-09-25: the mark bar (23:55) only`
P037: `      //--- closes after the boundary (weekend: Monday), so qualify one bar early -`
P038: `      //--- at this evaluation (Friday 23:55:00) the mark sits inside the next bar.`
P039: `      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime + PeriodSeconds()) { vDAY = true; break; }`
P040: - E2/E3 folded into Q1: price exactness graded by the A2 join (no separate price leg - nextOpenPx at the early firing IS the next-bar open); print-bar label follows the evaluated bar while fill-time joins Friday (stated, no separate label leg). No EA lines beyond E1 in this draft.
P041: 
P042: ## Stages (T161N discipline; RECON60 precedent)
P043: 
P044: - S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (F3 comment + mark loop) plus buffers 48/48 + names (PeriodSeconds builtin, g_news_dayMarks, g_mtrade.fillBarTime) collision-free plus char-code assert every OLD anchor.
P045: 
P046: ## Acceptance (grade segment-vs-RECON60; time-first price-second)
P047: 
P048: - A1 timing: zero DAY_CLOSE fills on/after day boundary (fill-date == verdict-date on every DAY_CLOSE deal; a Monday DAY_CLOSE fill halts with cause unless no-Friday-ticks proved).
P049: - A2 price: every MTCLOSE DAY_CLOSE ref == iOpen(verdict-day 23:55 bar); deal fill == ref == that open, all exact, no tolerance (WITHDRAWN v1 phrase: "within spread tolerance").
P050: - A3 identical: BREAK-leg rows 0-delta vs RECON60; takes identical bars/entries; 9/4-invalid refused; MTCOLLISION 0; no other election delta.
P051: - L-final: A1/A2/A3 above.
P052: 
P053: ## Run cost and novel evidence
P054: 
P055: One build (4-line additive trigger, STAGE-1 gated) plus one SCOPED tester run, ceiling 90 minutes (4-day window runs in minutes): Friday 9/4 00:00 to Monday 9/8 00:00 ONLY, his word (terminal.ini [Tester] DateFrom/DateTo change at run word, BOM-guarded, backup + digest pair; Monday included for the absence proof + fallback audit). Scoped acceptance vs RECON60 same-span: 3 in-window takes (9/4 16:00 + 9/7 09:20 + 9/7 16:45) identical bars/entries, lots recorded-not-graded (window starts 9/4, balance path differs by construction); 9/4-invalid (in-window) still refused; 9/4 suppression rows (EVICTSUPPRESS ARM + DIV triplet) identical; 9/7 exits identical prices; zero Monday fills. In-period alternative is live trading paying daily swap + roll spread - his stated purpose; uncosted multi-hour plans stay out of order. Novel evidence vs RECON60: (a) first Friday-timed DAY_CLOSE fill (fill-date == verdict-date); (b) ref==23:55-open join; (c) takes intact with earlier closes (lots re-derived second). Swap-avoidance by timing proxy (no swap rows exist).
P056: 
P057: (End of file)
Complete code, verbatim, no elisions (C-prefixed with true disk line numbers; anchor + alignment controls asserted above; proposed insert rides in the packet twin above, not as disk code):
C11424: //--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.
C11425: if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)
C11426:   {
C11427:    for(int dc = 0; dc < g_news_dayN; dc++)
C11428:      {
C11429:       if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }
C11430:      }
C11431:   }
C11432: 
C11433:     if(InpDebugLog)
C11434:       PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
C11435:                    "vTP=%d vBREAK=%s vHTF=%d vDAY=%d scope=%d "
C11436:                    "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
C11437:                    TimeToString(barTime, TIME_DATE|TIME_MINUTES),
C11438:                    DirName(g_mtrade.dir),
C11439:                    DoubleToString(g_mtrade.entryPrice, _Digits),
C11440:                    (haveTp ? DoubleToString(curTp, _Digits) : "none"),
C11441:                    (int)vSL, (int)vTP,
C11442:                    (vBREAK ? breakLineName : "none"),
C11443:                    (int)vHTF, (int)vDAY, (int)MT_EXIT_SCOPE,
C11444:                    mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);
C11445: 
C11446: if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;
C11447: 
C11448:    //--- close the trade (the priority order stated in the header)
C11449:    g_mtrade.state       = MT_CLOSED;
C11450:    g_mtrade.exitBarTime = barTime;
C11451:    if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
C11452:     else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
C11453:    else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
C11454:    else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
C11455:    else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }
C11456: 
C11457:     PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
C11458:                 TimeToString(barTime, TIME_DATE|TIME_MINUTES),
C11459:                 MtExitName(g_mtrade.exitReason),
C11460:                 (vBREAK ? breakLineName : "-"),
C11461:                 (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
C11462:                 DoubleToString(g_mtrade.entryPrice, _Digits),
C11463:                 DoubleToString(g_mtrade.exitPrice, _Digits));
C11464:     //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,
C11465:     //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.
C11466:     //--- Price reference = g_mtrade.exitPrice (= nextOpenPx on the gated legs per EA 11290/11292); paper MTEXIT/MTLIFE/EXIT rows print regardless.
C11467:     if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)
C11468:       {
C11469:        int mtexecRc = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), g_mtrade.exitPrice, barTime);
C11470:        if(mtexecRc == 0)
C11471:           PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s entryTicket=%I64u entryPid=%I64d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket, g_mtrade.entryPid);
C11472:       }
Run rows, raw (mechanical pulls from 4824FE61/6465733/34269 with hit counts beside each row):
MTCLOSE-DAY_CLOSE hits=1: Core 04	2026.09.07 00:00:07   [SRJ-EA] MTCLOSE bar=2026.09.04 23:55 leg=DAY_CLOSE ticket=6 magic=773002 action=1 retcode=10009 deal=7 closepid=6 closeentry=1 entryPid=6 flat=1 ref=1.16093
MTEXIT-DAY_CLOSE hits=1: Core 04	2026.09.07 00:00:07   [SRJ-EA] MTEXIT bar=2026.09.04 23:55 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16093
DEAL-7 hits=1: Core 04	2026.09.07 00:00:07   deal performed [#7 sell 0.57 EURUSD at 1.16093]
FRIDAY-2355-EVAL hits=16 (all 16 whole inline, mechanical pull):
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] 2026.09.04 23:55:00 CQD DIV verdict=+1 shift=2 bar=2026.09.04 23:45
  row: Core 04	2026.09.04 23:55:00   [SRJ][T155][OBPROV] code=3 id=3077 bar=125352 flag=false
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] CQDRECHECK shift=2 passA=1.0 passB=1.0 diff=0 bar=2026.09.04 23:45 state=IDLE dir=NONE divLatch=0 hit1=0 hit2=630 mism=0
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Daily-POC val=1.16284 side=ahead trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Daily-VWAP val=1.16161 side=ahead trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Weekly-POC val=1.15935 side=behind trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Weekly-VWAP val=1.16031 side=behind trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Monthly-POC val=1.15935 side=behind trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Monthly-VWAP val=1.16038 side=behind trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Quarterly-POC val=1.14334 side=behind trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Quarterly-VWAP val=1.15028 side=behind trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Yearly-POC val=1.15987 side=behind trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=Yearly-VWAP val=1.16315 side=ahead trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=FOMC-POC val=1.15368 side=behind trigger=1 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITCENSUS bar=2026.09.04 23:50 dir=LONG line=FOMC-VWAP val=1.15761 side=behind trigger=0 bodyLo=1.16121 bodyHi=1.16129 verdict=ok
  row: Core 04	2026.09.04 23:55:00   [SRJ-EA] EXITVERDICT bar=2026.09.04 23:50 dir=LONG entry=1.16018 curTp=1.16158 vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16302 h=1.16131 l=1.16118 sup=4
Question Q1 (one, specific): does the pasted E1 insert fire the DAY_CLOSE verdict at the Friday 23:55:00 evaluation and execute exactly the 23:55 open, with Monday fallback preserved and every other leg untouched?
Verdict Q1: ___ (plain yes / no / discrepancy, with line numbers)
Analytic ask A (standing): name every defect, gap, or imprecision seen in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing): state any better mechanism seen for the stated goal, with the code lines it would touch.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
