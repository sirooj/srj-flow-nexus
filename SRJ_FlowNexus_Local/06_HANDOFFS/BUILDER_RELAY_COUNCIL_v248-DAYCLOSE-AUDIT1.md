# RELAY v248-DAYCLOSE-AUDIT1 (2026-09-23 — code audit of the F3 day-close leg: marks, gate, priority, fill semantics, weekend behavior; NO code change proposed; session CONTINUE, RECON57 rows)

```
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

CODE REVIEW REQUEST — v248 — 2026-09-23

Change (one plain sentence): No change proposed - audit only: verify the day-close leg fires the first bar at/after the 16:55-ET mark with priority below SL/TP/BREAK/HTF and fills at next-open, and name every clock, fill, and weekend assumption the leg depends on.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, F3 day-close leg - marks 10388-10400, gate 11248-11255, close 11272-11279; converter Include\SRJ\SRJ_TickCore.mqh 228-260.
Source digest: 98F6BBACEE96A182D1C46D7605886E45886316FB636C3031C2CD7FD6083B736C / 622124 B / 11317 lines, measured after the last write (RECON57 build, no edit since). Include digest: 89730C6CADFA86F4DA7E09877D282BDB1741BD623678CCFB73E7A77D49FEA27C / 36057 B.

Complete code, verbatim, no elisions (marks, EA lines 10388-10400):
    //--- Day marks: 16:55 ET (= 17:00 daily close minus 5 min, the dayFlat
    //--- census definition, quoted in BLACKOUT_CENSUS) per calendar date in
    //--- range; Friday marks: 17:00 ET (the weekFlat census definition). Both
    //--- resolved through the same converter. Noon-dow is zone-safe: at
    //--- midday the ET and server dates always agree.
    g_news_dayN = 0;
    g_news_friN = 0;
    g_news_friET = "";
    datetime cur = TC_DayStart(SRJ_PILOT_FROM);
    while(cur < SRJ_PILOT_TO && g_news_dayN < 32)
      {
       MqlDateTime dd; TimeToStruct(cur, dd);
       g_news_dayMarks[g_news_dayN] = TC_ZoneToServer(TC_MakeTime(dd.year, dd.mon, dd.day, 16, 55), TZ_NEWYORK);

Complete code, verbatim, no elisions (gate plus close, EA lines 11248-11279):
//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.
if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)
  {
   for(int dc = 0; dc < g_news_dayN; dc++)
     {
      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }
     }
  }

    if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                   DirName(g_mtrade.dir),
                   DoubleToString(g_mtrade.entryPrice, _Digits),
                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                   (int)vSL, (int)vTP,
                   (vBREAK ? breakLineName : "none"),
                   (int)vHTF, (int)MT_EXIT_SCOPE,
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }

Complete code, verbatim, no elisions (converter, Include\SRJ\SRJ_TickCore.mqh lines 228-260):
void TC_ZoneRule(const ENUM_TZ_ID zone,int &baseSecs,ENUM_DST_RULE &rule)
  {
   switch(zone)
     {
      case TZ_UTC:     baseSecs = 0;        rule = DST_NONE; break;
      case TZ_NEWYORK: baseSecs = -5*3600;  rule = DST_US;   break;
      case TZ_LONDON:  baseSecs = 0;        rule = DST_EU;   break;
      default:         baseSecs = gtc_serverGmtBase; rule = gtc_serverDst; break;
     }
  }

//--- Wall clock in a named zone -> GMT.
datetime TC_ZoneToGmt(const datetime wall,const ENUM_TZ_ID zone)
  {
   int base; ENUM_DST_RULE rule;
   TC_ZoneRule(zone,base,rule);
   long off = (long)base + (TC_DstActive(wall,rule) ? 3600 : 0);
   return (datetime)((long)wall - off);
  }

//--- GMT -> broker server clock.
datetime TC_GmtToServer(const datetime gmt)
  {
   datetime probe = (datetime)((long)gmt + (long)gtc_serverGmtBase);
   long off = (long)gtc_serverGmtBase + (TC_DstActive(probe,gtc_serverDst) ? 3600 : 0);
   return (datetime)((long)gmt + off);
  }

datetime TC_ZoneToServer(const datetime wall,const ENUM_TZ_ID zone)
  {
   if(zone == TZ_SERVER) return wall;
   return TC_GmtToServer(TC_ZoneToGmt(wall,zone));
  }

Run rows, raw (RECON57 segment 6F242EAC; the disputed exit plus the converter's own measured mapping):
[SRJ-EA] 2026.09.04 16:00:00 ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.66 SL 1.15847 TP 1.16302 spr=1
[SRJ-EA] MTSNAP bar=2026.09.04 15:55 dir=LONG anchor=Yearly-POC entry=1.16018 sl=1.15847 tp=1.16302 regime=1
[SRJ-EA] MTEXIT bar=2026.09.04 23:55 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16093
[SRJ-EA] MTLIFE fields=11 openBar=2026.09.04 16:00 dir=LONG entry=1.16018 sl=1.15847 tp=1.16302 verdict=DAY_CLOSE closeBar=2026.09.04 23:55 closePx=1.16093 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
[SRJ-EA][CLOCK] session windows resolved to SERVER frame from ET date 2026.08.26: LONDON 02:00-05:00 ET = 2026.08.26 09:00 .. 2026.08.26 12:00 | NYAM 07:00-12:00 ET = 2026.08.26 14:00 .. 2026.08.26 19:00
[SRJ-EA] BLACKOUT_ROW kind=NFP eventTimeET=2026-09-04 08:30 newsBarOpen=2026.09.04 15:30 windowStart=2026.09.04 15:25 windowEnd=2026.09.04 15:40 offsetMinutes=420 inWindow=1 barsSpanned=3
Friday 9/4 context: 9/4 is a Friday; the exit bar 23:55 Friday fills at nextOpenPx = Monday 9/7 00:00 open 1.16093 (weekend gap); his settled rule (strategy skill: decisive exit always near day close, nothing held overnight by design) vs a Monday fill stands disputed by him ("still not working", "near day close still not applied" journaled) - strategy half NOT asked here, recorded for his call.

Prior, labeled (file + marker + digest, never anyone's words): no packet proposes a day-close code change (audit only, E-set empty by design); BUILDER_RESULT_RECON57-DEMOGUARD-V1.md (1E251DDA/6734; DAY_CLOSE 23:55 first live fire with position); his day-close words (strategy skill section 1: universal 5-minutes-before-close rule; finding FC8038F1 section 2: "near day close still not applied"); his dispute verbatim 2026-09-23 ("the end of day close is still not working"); Stakes on the page (this audit changes no code and rules no strategy; it verifies the leg as coded and names assumptions).

Question (one, specific): Does the F3 leg as coded fire the first bar at/after the 16:55-ET mark (23:55 server in September per the converter plus the measured +7h session mapping) with priority strictly below SL/TP/BREAK/HTF and fill at next-open, and name every clock assumption (converter base, DST handling, September offset), fill assumption (next-open across the weekend gap), and priority assumption the leg depends on?

Answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys — nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

(End of file)