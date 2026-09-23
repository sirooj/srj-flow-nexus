#ifndef __SRJ_SESSIONS_MQH__
#define __SRJ_SESSIONS_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Draw.mqh"

#define SRJ_RANGE_LINE_COLOR  C'149,152,161'

//==================================================================
//  SECTION 1 — TIMEZONE ENGINE
//------------------------------------------------------------------
datetime SRJ_NthDowOfMonth(int year,int month,int targetDow,int nth)
  {
   MqlDateTime m;
   m.year = year;  m.mon = month; m.day = 1;
   m.hour = 0;     m.min = 0;     m.sec = 0;
   m.day_of_week = 0; m.day_of_year = 0;
   datetime first = StructToTime(m);

   MqlDateTime f;
   TimeToStruct(first,f);
   int delta = (targetDow - f.day_of_week + 7) % 7;
   return (datetime)(first + (long)(delta + (nth-1)*7) * 86400);
  }

bool SRJ_IsUSEasternDST(datetime utc)
  {
   MqlDateTime u;
   TimeToStruct(utc,u);
   int y = u.year;

   datetime dstStart = SRJ_NthDowOfMonth(y,3,0,2)  + (datetime)(7*3600);
   datetime dstEnd   = SRJ_NthDowOfMonth(y,11,0,1) + (datetime)(6*3600);

   return (utc >= dstStart && utc < dstEnd);
  }

datetime SRJ_BrokerToUTC(datetime brokerTime)
  {
   return (datetime)(brokerTime - (long)g_brokerToUTCOffsetHours * 3600);
  }

datetime SRJ_BrokerToNY(datetime brokerTime)
  {
   datetime utc = SRJ_BrokerToUTC(brokerTime);
   int offHours = SRJ_IsUSEasternDST(utc) ? -4 : -5;
   return (datetime)(utc + (long)offHours * 3600);
  }

int SRJ_NYDayId(datetime brokerTime)
  {
   MqlDateTime n;
   TimeToStruct(SRJ_BrokerToNY(brokerTime),n);
   return n.year*10000 + n.mon*100 + n.day;
  }

int SRJ_ShiftedDayId(datetime brokerTime,int rollHour)
  {
   datetime shifted = (datetime)(brokerTime - (long)rollHour * 3600);
   MqlDateTime b;
   TimeToStruct(shifted,b);
   return b.year*10000 + b.mon*100 + b.day;
  }

int SRJ_DailyWindowId(datetime brokerTime)
  {
   if(g_dailyAnchorMode == 1)
      return SRJ_NYDayId(brokerTime);
   int rollHour = (g_dailyAnchorMode == 2) ? g_dailyAnchorHour : 0;
   return SRJ_ShiftedDayId(brokerTime,rollHour);
  }

//==================================================================
//  SECTION 2 — SESSION STRING PARSING
//------------------------------------------------------------------
struct SSessionDef
  {
   int  startMin;
   int  endMin;
   bool wraps;
   bool days[7];
   bool valid;
  };

SSessionDef g_defAsia;
SSessionDef g_defLondon;
SSessionDef g_defNY;
SSessionDef g_defPM;

void SRJ_ParseSession(const string sess,SSessionDef &d)
  {
   d.startMin = 0;
   d.endMin   = 1440;
   d.wraps    = false;
   d.valid    = false;
   for(int k=0; k<7; k++)
      d.days[k] = true;

   string s = sess;
   StringTrimLeft(s);
   StringTrimRight(s);
   if(StringLen(s) < 9)
      return;

   int dashPos  = StringFind(s,"-");
   int colonPos = StringFind(s,":");
   if(dashPos < 0)
      return;

   string startTok = StringSubstr(s,0,dashPos);
   string endTok;
   string dayTok = "";
   if(colonPos > dashPos)
     {
      endTok = StringSubstr(s,dashPos+1,colonPos-dashPos-1);
      dayTok = StringSubstr(s,colonPos+1);
     }
   else
     {
      endTok = StringSubstr(s,dashPos+1);
     }

   if(StringLen(startTok) < 4 || StringLen(endTok) < 4)
      return;

   int sH = (int)StringToInteger(StringSubstr(startTok,0,2));
   int sM = (int)StringToInteger(StringSubstr(startTok,2,2));
   int eH = (int)StringToInteger(StringSubstr(endTok,0,2));
   int eM = (int)StringToInteger(StringSubstr(endTok,2,2));

   d.startMin = sH * 60 + sM;
   d.endMin   = (eH == 0 && eM == 0) ? 1440 : (eH * 60 + eM);
   d.wraps    = (d.endMin <= d.startMin);

   if(StringLen(dayTok) > 0)
     {
      for(int k=0; k<7; k++)
         d.days[k] = false;
      int len = StringLen(dayTok);
      for(int k=0; k<len; k++)
        {
         ushort ch = StringGetCharacter(dayTok,k);
         int digit = (int)(ch - '0');
         if(digit >= 1 && digit <= 7)
           {
            int mqlDow = digit - 1;
            d.days[mqlDow] = true;
           }
        }
     }
   d.valid = true;
  }

bool SRJ_InSession(datetime nyTime,const SSessionDef &d)
  {
   if(!d.valid) return false;

   MqlDateTime t;
   TimeToStruct(nyTime,t);
   if(!d.days[t.day_of_week])
      return false;

   int curMin = t.hour * 60 + t.min;
   if(!d.wraps)
     {
      return (curMin >= d.startMin && curMin < d.endMin);
     }
   else
     {
      return (curMin >= d.startMin || curMin < d.endMin);
     }
  }

int SRJ_GetSessionId(datetime brokerTime)
  {
   datetime ny = SRJ_BrokerToNY(brokerTime);
   if(SRJ_InSession(ny, g_defAsia))   return 0;
   if(SRJ_InSession(ny, g_defLondon)) return 1;
   if(SRJ_InSession(ny, g_defNY))     return 2;
   if(SRJ_InSession(ny, g_defPM))     return 3;
   return SRJ_NA_INT;
  }

//==================================================================
//  SECTION 3 — SESSIONS PASS LOOP
//------------------------------------------------------------------
void SRJ_Sessions_Pass(const double &high[],const double &low[],
                       const datetime &time[],int rates_total,int i,
                       bool withinLookbackWindow)
  {
   if(!withinLookbackWindow) return;

   // Exactly-once commit guard.
   // OnCalculate restarts the loop at prev_calculated-1, so on the new-bar tick the
   // previously-live bar is re-entered.  The snapshot rollback only runs for the last
   // bar, so that replay lands on top of the state the first pass already wrote.
   // Session rising/falling edges are not idempotent: on the replay wasIn* already
   // matches inNow*, so the session open/close that bar carried is swallowed along
   // with the *Swept latches and freshSweep* fields that depend on it.
   // The watermark lives in SState, so the snapshot restores it and the live bar
   // still re-evaluates on every tick.
   // [Task 38 / EA-50] The comment above stands, and the guard it describes was
   // one comparison too strict. Measured: FlowLogic exported AS.H 1.16809 on
   // 2026.08.20 against a 05:00 bar high of 1.16837 that its own drawn line
   // agrees with, and LOH 1.16793 against a bar high of 1.16802 six bars inside
   // the London window. Both exports below the truth, never above.
   //
   // Cause. Bar N is first visited as the FORMING bar, when high[N] holds only
   // what has printed so far, and the watermark is set to N. When bar N+1 opens,
   // start = prevCalc - 1 returns i = N to the loop as a SETTLED bar with high[N]
   // complete - and the old test rejected it, because i equalled the watermark.
   // isLastBar is false at i = N, so the snapshot rollback that keeps the forming
   // bar re-evaluating does not reach here. The bar's true extreme was discarded
   // and no later pass could recover it, so every session and previous-day level
   // was accumulated from bar-open prices.
   //
   // This is invisible on a chart attach, where prev_calculated is 0 and the loop
   // walks each bar once with complete data - which is why the drawn lines are
   // right and the buffers are wrong. Logged as EA-53.
   //
   // Admitting equality lets the settled visit run exactly once. Traced across a
   // full recalc, a single-bar advance, and two OnCalculate calls at the same
   // rates_total: never twice. Every side effect below is idempotent under a
   // second visit - the accumulations are MathMax/MathMin, the *Swept latches are
   // one-shot, the rising and falling edges are gated on wasIn* which the forming
   // visit already advanced, the day rollover is gated on sessDay, the PD lines on
   // pdLinesCreatedForDay, and SRJ_PruneLineRefArray prunes to a count. The
   // replay-swallowing the comment above warns about is still prevented, because
   // a bar strictly behind the watermark is still rejected.
   if(!SrjIsNa(g_s.sessLastProcessedBar) && i < g_s.sessLastProcessedBar)   // [Task 38 / EA-50] was <= ; the settled visit must be admitted, see above
      return;
   g_s.sessLastProcessedBar = i;

   datetime barTime = time[i];
   int today = SRJ_DailyWindowId(barTime);

   if(i == 0 || SrjIsNa(g_s.sessDay))
     {
      g_s.sessDay = today;
      g_s.dayHigh = high[i];
      g_s.dayLow  = low[i];
      g_s.prevDayHigh = SRJ_NA_DBL;
      g_s.prevDayLow  = SRJ_NA_DBL;
     }
   else if(today != g_s.sessDay)
     {
      g_s.prevDayStartBar = g_s.dayStartBar;
      g_s.prevDayEndBar   = i - 1;
      g_s.prevDayHigh     = g_s.dayHigh;
      g_s.prevDayLow      = g_s.dayLow;
      g_s.sessDay         = today;
      g_s.dayHigh         = high[i];
      g_s.dayLow          = low[i];
      g_s.dayStartBar     = i;
      g_s.pdLinesDeletedToday  = false;
      g_s.pdLinesCreatedForDay = false;
      g_s.pdHighSwept     = false;
      g_s.pdLowSwept      = false;
     }

   datetime ny = SRJ_BrokerToNY(barTime);
   bool inAsiaNow   = SRJ_InSession(ny, g_defAsia);
   bool inLondonNow = SRJ_InSession(ny, g_defLondon);
   bool inNYNow     = SRJ_InSession(ny, g_defNY);
   bool inPMNow     = SRJ_InSession(ny, g_defPM);

   bool risingAsia   = inAsiaNow   && !g_s.wasInAsia;
   bool risingLondon = inLondonNow && !g_s.wasInLondon;
   bool risingNY     = inNYNow     && !g_s.wasInNY;
   bool risingPM     = inPMNow     && !g_s.wasInPM;

   // FIX: Cache previous session highs/lows BEFORE resetting, so inter-session
   //      gap sweeps can still reference the just-ended session's levels.
   if(risingAsia)
     {
      // Asia follows PM in the daily cycle — cache PM before resetting Asia
      g_s.prevPMHigh = g_s.pmHigh;
      g_s.prevPMLow  = g_s.pmLow;
      g_s.asiaHigh = SRJ_NA_DBL; g_s.asiaLow = SRJ_NA_DBL;
      g_s.asiaHighSwept = false; g_s.asiaLowSwept = false;      g_s.pdPmHighSwept = false; g_s.pdPmLowSwept = false;
      if(g_s.freshSweepExpirySession == "Asia") g_s.freshSweepExpired = true;
     }
   if(risingLondon)
     {
      // London follows Asia — cache Asia before resetting London
      g_s.prevAsiaHigh = g_s.asiaHigh;
      g_s.prevAsiaLow  = g_s.asiaLow;
      g_s.londonHigh = SRJ_NA_DBL; g_s.londonLow = SRJ_NA_DBL;
      g_s.londonHighSwept = false; g_s.londonLowSwept = false;      g_s.pdAsiaHighSwept = false; g_s.pdAsiaLowSwept = false;
      if(g_s.freshSweepExpirySession == "London") g_s.freshSweepExpired = true;
     }
   if(risingNY)
     {
      // NY follows London — cache London before resetting NY
      g_s.prevLondonHigh = g_s.londonHigh;
      g_s.prevLondonLow  = g_s.londonLow;
      g_s.nyHigh = SRJ_NA_DBL; g_s.nyLow = SRJ_NA_DBL;
      g_s.nyHighSwept = false; g_s.nyLowSwept = false;      g_s.pdLondonHighSwept = false; g_s.pdLondonLowSwept = false;
      if(g_s.freshSweepExpirySession == "NY") g_s.freshSweepExpired = true;
     }
   if(risingPM)
     {
      // PM follows NY — cache NY before resetting PM
      g_s.prevNYHigh = g_s.nyHigh;
      g_s.prevNYLow  = g_s.nyLow;
      g_s.pmHigh = SRJ_NA_DBL; g_s.pmLow = SRJ_NA_DBL;
      g_s.pmHighSwept = false; g_s.pmLowSwept = false;      g_s.pdNyHighSwept = false; g_s.pdNyLowSwept = false;
      if(g_s.freshSweepExpirySession == "PM") g_s.freshSweepExpired = true;
     }

   g_s.dayHigh = SrjIsNa(g_s.dayHigh) ? high[i] : MathMax(g_s.dayHigh, high[i]);
   g_s.dayLow  = SrjIsNa(g_s.dayLow)  ? low[i]  : MathMin(g_s.dayLow,  low[i]);

   int sid = SRJ_GetSessionId(barTime);
   if(!SrjIsNa(sid))
     {
      if(sid == 0)
        {
         g_s.asiaHigh = SrjIsNa(g_s.asiaHigh) ? high[i] : MathMax(g_s.asiaHigh, high[i]);
         g_s.asiaLow  = SrjIsNa(g_s.asiaLow)  ? low[i]  : MathMin(g_s.asiaLow,  low[i]);
        }
      else if(sid == 1)
        {
         g_s.londonHigh = SrjIsNa(g_s.londonHigh) ? high[i] : MathMax(g_s.londonHigh, high[i]);
         g_s.londonLow  = SrjIsNa(g_s.londonLow)  ? low[i]  : MathMin(g_s.londonLow,  low[i]);
        }
      else if(sid == 2)
        {
         g_s.nyHigh = SrjIsNa(g_s.nyHigh) ? high[i] : MathMax(g_s.nyHigh, high[i]);
         g_s.nyLow  = SrjIsNa(g_s.nyLow)  ? low[i]  : MathMin(g_s.nyLow,  low[i]);
        }
      else if(sid == 3)
        {
         g_s.pmHigh = SrjIsNa(g_s.pmHigh) ? high[i] : MathMax(g_s.pmHigh, high[i]);
         g_s.pmLow  = SrjIsNa(g_s.pmLow)  ? low[i]  : MathMin(g_s.pmLow,  low[i]);
        }
     }

   double liquiditySweepBuffer = g_liquiditySweepBufferPoints * g_mintick;

   string thisBarSweeps[];
   double thisBarOvershoots[];

   // --- Previous Day High/Low sweep (unchanged — already uses prevDay vars) ---
   if(!SrjIsNa(g_s.prevDayHigh) && !g_s.pdHighSwept && high[i] > g_s.prevDayHigh + liquiditySweepBuffer)
     {
      g_s.pdHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "PD.H"; thisBarOvershoots[sz] = high[i] - g_s.prevDayHigh;
     }
   if(!SrjIsNa(g_s.prevDayLow) && !g_s.pdLowSwept && low[i] < g_s.prevDayLow - liquiditySweepBuffer)
     {
      g_s.pdLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "PD.L"; thisBarOvershoots[sz] = g_s.prevDayLow - low[i];
     }

   // FIX: Session sweep detection now uses "effective" levels — the current
   // session value if available, otherwise the cached previous-session value.
   // This ensures sweeps in inter-session gaps are always detected.

   // --- PD Asia High (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevAsiaHigh) && !g_s.pdAsiaHighSwept && high[i] > g_s.prevAsiaHigh + liquiditySweepBuffer)
     {
      g_s.pdAsiaHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pAS.H"; thisBarOvershoots[sz] = high[i] - g_s.prevAsiaHigh;
     }
   // --- PD Asia Low (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevAsiaLow) && !g_s.pdAsiaLowSwept && low[i] < g_s.prevAsiaLow - liquiditySweepBuffer)
     {
      g_s.pdAsiaLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pAS.L"; thisBarOvershoots[sz] = g_s.prevAsiaLow - low[i];
     }
   // --- PD London High (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevLondonHigh) && !g_s.pdLondonHighSwept && high[i] > g_s.prevLondonHigh + liquiditySweepBuffer)
     {
      g_s.pdLondonHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pLD.H"; thisBarOvershoots[sz] = high[i] - g_s.prevLondonHigh;
     }
   // --- PD London Low (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevLondonLow) && !g_s.pdLondonLowSwept && low[i] < g_s.prevLondonLow - liquiditySweepBuffer)
     {
      g_s.pdLondonLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pLD.L"; thisBarOvershoots[sz] = g_s.prevLondonLow - low[i];
     }
   // --- PD NY High (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevNYHigh) && !g_s.pdNyHighSwept && high[i] > g_s.prevNYHigh + liquiditySweepBuffer)
     {
      g_s.pdNyHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pNY.H"; thisBarOvershoots[sz] = high[i] - g_s.prevNYHigh;
     }
   // --- PD NY Low (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevNYLow) && !g_s.pdNyLowSwept && low[i] < g_s.prevNYLow - liquiditySweepBuffer)
     {
      g_s.pdNyLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pNY.L"; thisBarOvershoots[sz] = g_s.prevNYLow - low[i];
     }
   // --- PD PM High (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevPMHigh) && !g_s.pdPmHighSwept && high[i] > g_s.prevPMHigh + liquiditySweepBuffer)
     {
      g_s.pdPmHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pPM.H"; thisBarOvershoots[sz] = high[i] - g_s.prevPMHigh;
     }
   // --- PD PM Low (P-VALIDITY-1: prev-session cache sweep) ---
   if(!SrjIsNa(g_s.prevPMLow) && !g_s.pdPmLowSwept && low[i] < g_s.prevPMLow - liquiditySweepBuffer)
     {
      g_s.pdPmLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "pPM.L"; thisBarOvershoots[sz] = g_s.prevPMLow - low[i];
     }
   // --- Asia High ---
   double effAsiaHigh = !SrjIsNa(g_s.asiaHigh) ? g_s.asiaHigh : g_s.prevAsiaHigh;
   if(!SrjIsNa(effAsiaHigh) && !g_s.asiaHighSwept && high[i] > effAsiaHigh + liquiditySweepBuffer)
     {
      g_s.asiaHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "AS.H"; thisBarOvershoots[sz] = high[i] - effAsiaHigh;
     }
   // --- Asia Low ---
   double effAsiaLow = !SrjIsNa(g_s.asiaLow) ? g_s.asiaLow : g_s.prevAsiaLow;
   if(!SrjIsNa(effAsiaLow) && !g_s.asiaLowSwept && low[i] < effAsiaLow - liquiditySweepBuffer)
     {
      g_s.asiaLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "AS.L"; thisBarOvershoots[sz] = effAsiaLow - low[i];
     }

   // --- London High ---
   double effLondonHigh = !SrjIsNa(g_s.londonHigh) ? g_s.londonHigh : g_s.prevLondonHigh;
   if(!SrjIsNa(effLondonHigh) && !g_s.londonHighSwept && high[i] > effLondonHigh + liquiditySweepBuffer)
     {
      g_s.londonHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "LD.H"; thisBarOvershoots[sz] = high[i] - effLondonHigh;
     }
   // --- London Low ---
   double effLondonLow = !SrjIsNa(g_s.londonLow) ? g_s.londonLow : g_s.prevLondonLow;
   if(!SrjIsNa(effLondonLow) && !g_s.londonLowSwept && low[i] < effLondonLow - liquiditySweepBuffer)
     {
      g_s.londonLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "LD.L"; thisBarOvershoots[sz] = effLondonLow - low[i];
     }

   // --- NY High ---
   double effNYHigh = !SrjIsNa(g_s.nyHigh) ? g_s.nyHigh : g_s.prevNYHigh;
   if(!SrjIsNa(effNYHigh) && !g_s.nyHighSwept && high[i] > effNYHigh + liquiditySweepBuffer)
     {
      g_s.nyHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "NY.H"; thisBarOvershoots[sz] = high[i] - effNYHigh;
     }
   // --- NY Low ---
   double effNYLow = !SrjIsNa(g_s.nyLow) ? g_s.nyLow : g_s.prevNYLow;
   if(!SrjIsNa(effNYLow) && !g_s.nyLowSwept && low[i] < effNYLow - liquiditySweepBuffer)
     {
      g_s.nyLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "NY.L"; thisBarOvershoots[sz] = effNYLow - low[i];
     }

   // --- PM High ---
   double effPMHigh = !SrjIsNa(g_s.pmHigh) ? g_s.pmHigh : g_s.prevPMHigh;
   if(!SrjIsNa(effPMHigh) && !g_s.pmHighSwept && high[i] > effPMHigh + liquiditySweepBuffer)
     {
      g_s.pmHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "PM.H"; thisBarOvershoots[sz] = high[i] - effPMHigh;
     }
   // --- PM Low ---
   double effPMLow = !SrjIsNa(g_s.pmLow) ? g_s.pmLow : g_s.prevPMLow;
   if(!SrjIsNa(effPMLow) && !g_s.pmLowSwept && low[i] < effPMLow - liquiditySweepBuffer)
     {
      g_s.pmLowSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "PM.L"; thisBarOvershoots[sz] = effPMLow - low[i];
     }

   int sweepSz = ArraySize(thisBarSweeps);
   if(sweepSz > 0)
     {
      string chosenSweep = thisBarSweeps[0];
      double bestOvershoot = thisBarOvershoots[0];
      for(int k=1; k<sweepSz; k++)
        {
         if(thisBarOvershoots[k] > bestOvershoot)
           {
            bestOvershoot = thisBarOvershoots[k];
            chosenSweep = thisBarSweeps[k];
           }
        }
      g_s.lastSweepTag = chosenSweep;
      g_s.lastSweepBar = i;
      g_s.freshSweepTag = chosenSweep;
      g_s.freshSweepBar = i;

      // Tie expiry to the specific liquidity pool swept rather than the current time slot.
      if(chosenSweep == "AS.H" || chosenSweep == "AS.L")
         g_s.freshSweepExpirySession = "NY";
      else if(chosenSweep == "LD.H" || chosenSweep == "LD.L")
         g_s.freshSweepExpirySession = "PM";
      else if(chosenSweep == "NY.H" || chosenSweep == "NY.L")
         g_s.freshSweepExpirySession = "Asia";
      else if(chosenSweep == "PM.H" || chosenSweep == "PM.L")
         g_s.freshSweepExpirySession = "London";
      else
         g_s.freshSweepExpirySession = SRJ_NA_STR;

      g_s.freshSweepExpired = false;
     }

   if(g_showPDHiLoLines && !g_s.pdLinesCreatedForDay &&
      !SrjIsNa(g_s.prevDayHigh) && !SrjIsNa(g_s.prevDayLow) &&
      !SrjIsNa(g_s.prevDayStartBar) && !SrjIsNa(g_s.prevDayEndBar))
     {
      string nPDH = SRJ_DrawTrend("PDH", time, rates_total, g_s.prevDayStartBar, g_s.prevDayHigh, g_s.prevDayEndBar, g_s.prevDayHigh, SRJ_RANGE_LINE_COLOR, g_dailyHiLoLineWidth, SRJ_STYLE_SOLID, false);
      string nPDL = SRJ_DrawTrend("PDL", time, rates_total, g_s.prevDayStartBar, g_s.prevDayLow, g_s.prevDayEndBar, g_s.prevDayLow, SRJ_RANGE_LINE_COLOR, g_dailyHiLoLineWidth, SRJ_STYLE_SOLID, false);
      g_pdHighLines.Add(NewLineRef(nPDH));
      g_pdLowLines.Add(NewLineRef(nPDL));
      g_s.pdLinesCreatedForDay = true;
     }

   SRJ_PruneLineRefArray(g_pdHighLines, g_sessionRetentionDays);
   SRJ_PruneLineRefArray(g_pdLowLines, g_sessionRetentionDays);

   if(g_s.wasInAsia && !inAsiaNow && !SrjIsNa(g_s.asiaHigh) && !SrjIsNa(g_s.asiaLow) && !SrjIsNa(g_s.asiaStartBar))
     {
      int asiaEndBar = i - 1;
      if(g_showSessionHiLoLines)
        {
         string nAH = SRJ_DrawTrend("AS_H", time, rates_total, g_s.asiaStartBar, g_s.asiaHigh, asiaEndBar, g_s.asiaHigh, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         string nAL = SRJ_DrawTrend("AS_L", time, rates_total, g_s.asiaStartBar, g_s.asiaLow, asiaEndBar, g_s.asiaLow, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         g_asiaHighLines.Add(NewLineRef(nAH));
         g_asiaLowLines.Add(NewLineRef(nAL));
        }
      g_s.currentSessionSlot = "London";
      g_s.currentSlotStartBar = i;
     }

   if(g_s.wasInLondon && !inLondonNow && !SrjIsNa(g_s.londonHigh) && !SrjIsNa(g_s.londonLow) && !SrjIsNa(g_s.londonStartBar))
     {
      int londonEndBar = i - 1;
      if(g_showSessionHiLoLines)
        {
         string nLH = SRJ_DrawTrend("LD_H", time, rates_total, g_s.londonStartBar, g_s.londonHigh, londonEndBar, g_s.londonHigh, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         string nLL = SRJ_DrawTrend("LD_L", time, rates_total, g_s.londonStartBar, g_s.londonLow, londonEndBar, g_s.londonLow, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         g_londonHighLines.Add(NewLineRef(nLH));
         g_londonLowLines.Add(NewLineRef(nLL));
        }
      g_s.currentSessionSlot = "NY";
      g_s.currentSlotStartBar = i;
     }

   if(g_s.wasInNY && !inNYNow && !SrjIsNa(g_s.nyHigh) && !SrjIsNa(g_s.nyLow) && !SrjIsNa(g_s.nyStartBar))
     {
      int nyEndBar = i - 1;
      if(g_showSessionHiLoLines)
        {
         string nNYH = SRJ_DrawTrend("NY_H", time, rates_total, g_s.nyStartBar, g_s.nyHigh, nyEndBar, g_s.nyHigh, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         string nNYL = SRJ_DrawTrend("NY_L", time, rates_total, g_s.nyStartBar, g_s.nyLow, nyEndBar, g_s.nyLow, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         g_nyHighLines.Add(NewLineRef(nNYH));
         g_nyLowLines.Add(NewLineRef(nNYL));
        }
      g_s.currentSessionSlot = "PM";
      g_s.currentSlotStartBar = i;
     }

   if(g_s.wasInPM && !inPMNow && !SrjIsNa(g_s.pmHigh) && !SrjIsNa(g_s.pmLow) && !SrjIsNa(g_s.pmStartBar))
     {
      int pmEndBar = i - 1;
      if(g_showSessionHiLoLines)
        {
         string nPMH = SRJ_DrawTrend("PM_H", time, rates_total, g_s.pmStartBar, g_s.pmHigh, pmEndBar, g_s.pmHigh, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         string nPML = SRJ_DrawTrend("PM_L", time, rates_total, g_s.pmStartBar, g_s.pmLow, pmEndBar, g_s.pmLow, SRJ_RANGE_LINE_COLOR, g_sessionHiLoLineWidth, SRJ_STYLE_SOLID, false);
         g_pmHighLines.Add(NewLineRef(nPMH));
         g_pmLowLines.Add(NewLineRef(nPML));
        }
      g_s.currentSessionSlot = "Asia";
      g_s.currentSlotStartBar = i;
     }

   if(inAsiaNow && !g_s.wasInAsia)
     {
      SRJ_PruneLineRefArray(g_asiaHighLines, g_sessionRetentionDays);
      SRJ_PruneLineRefArray(g_asiaLowLines, g_sessionRetentionDays);
      g_s.asiaSessionDay = today;
      g_s.asiaStartBar = i;
     }
   if(inLondonNow && !g_s.wasInLondon)
     {
      SRJ_PruneLineRefArray(g_londonHighLines, g_sessionRetentionDays);
      SRJ_PruneLineRefArray(g_londonLowLines, g_sessionRetentionDays);
      g_s.londonSessionDay = today;
      g_s.londonStartBar = i;
     }
   if(inNYNow && !g_s.wasInNY)
     {
      SRJ_PruneLineRefArray(g_nyHighLines, g_sessionRetentionDays);
      SRJ_PruneLineRefArray(g_nyLowLines, g_sessionRetentionDays);
      g_s.nySessionDay = today;
      g_s.nyStartBar = i;
     }
   if(inPMNow && !g_s.wasInPM)
     {
      SRJ_PruneLineRefArray(g_pmHighLines, g_sessionRetentionDays);
      SRJ_PruneLineRefArray(g_pmLowLines, g_sessionRetentionDays);
      g_s.pmSessionDay = today;
      g_s.pmStartBar = i;
     }

   if(SrjIsNa(g_s.dayStartBar))
      g_s.dayStartBar = i;

   g_s.wasInAsia   = inAsiaNow;
   g_s.wasInLondon = inLondonNow;
   g_s.wasInNY     = inNYNow;
   g_s.wasInPM     = inPMNow;
  }

#endif // __SRJ_SESSIONS_MQH__