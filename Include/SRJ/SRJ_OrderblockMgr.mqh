#ifndef __SRJ_ORDERBLOCKMGR_MQH__
#define __SRJ_ORDERBLOCKMGR_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Fractals.mqh"
#include "SRJ_Draw.mqh"
#include "SRJ_Alerts.mqh"

// --- Forward declarations for main script debug helpers ---
string SRJ_BarTimeStr(const int bar);
bool SRJ_InDebugWindow(const int bar);
// ----------------------------------------------------------

void SRJ_pruneInvalidationHistory(CArrayInt &arr,int floorBar)
  {
   while(arr.Total() > 0 && arr.At(0) < floorBar)
      arr.Delete(0);
  }

int SRJ_countOpposingInvalidationsSinceActivation(bool obIsBullish,int sinceBar)
  {
   CArrayInt *oppArr = obIsBullish ? GetPointer(g_bearishInvalidationBarsHistory)
                                   : GetPointer(g_bullishInvalidationBarsHistory);
   int cnt = 0;
   int n = oppArr.Total();
   for(int j=0; j<n; j++)
      if(oppArr.At(j) > sinceBar)
         cnt++;
   return cnt;
  }

COrderblock *SRJ_createOrderblock(const datetime &time[],int rates_total,int i,
                                  bool isBull,int obBar,double obHigh,double obLow,
                                  double obOpen,int swing,bool isExt)
  {
   double mid = (obHigh + obLow) / 2.0;
   // Operator rule (charter 9): the invalidation level IS the pure midline; the kill
   // is a body close beyond it (bullish OB: close below; bearish OB: close above).
   double invLevel = mid;
   int endBar = obBar + g_lineExtension;
   int safeObBar  = (int)MathMax(obBar, i - 4500);
   int safeEndBar = (int)MathMax(endBar, safeObBar + 1);
   color lineColor = isBull ? g_inactiveBullishColor : g_inactiveBearishColor;
   double obLevel = isBull ? obHigh : obLow;
   bool showInactive = isBull ? g_showInactiveBullishOB : g_showInactiveBearishOB;

   string obLineName  = "";
   string midLineName = "";
   if(showInactive)
     {
      obLineName = SRJ_DrawTrend("OB",time,rates_total,
                                 safeObBar,obLevel,safeEndBar,obLevel,
                                 SRJ_Opacity(lineColor,40.0),g_lineThickness,SRJ_STYLE_SOLID,
                                 g_extendInactive);
      midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                  safeObBar,invLevel,safeEndBar,invLevel,
                                  SRJ_Opacity(g_inactiveMidlineColor,40.0),g_lineThickness,
                                  SRJ_STYLE_DOTTED,g_extendInactive);
     }

   COrderblock *ob = NewOrderblock(
                        obBar,
                        endBar,
                        swing,
                        obHigh,
                        obLow,
                        obOpen,
                        mid,
                        invLevel,
                        isBull,
                        false,
                        false,
                        SRJ_NA_INT,
                        SRJ_NA_INT,
                        obLineName,
                        midLineName,
                        isExt,
                        false,
                        i);  // NEW: creationBar = i (bar where fractal confirmed)
   return ob;
  }

//+------------------------------------------------------------------+
//| Replay activation and invalidation for a single OB against a     |
//| single historical bar (used to catch same-bar act+inv during     |
//| the fractal confirmation lag window).                            |
//| Returns true if the OB was both activated and invalidated.       |
//+------------------------------------------------------------------+
bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,
                                         const double barHigh,
                                         const double barLow,
                                         const double barClose,
                                         const int replayBar,
                                         const int discoveryBar)
  {
   if(ob==NULL) return false;

   bool didActivate = false;
   bool didInvalidate = false;

   // Activation test (same as SRJ_OB_ActivationInvalidationPass)
   if(!ob.isActivated)
     {
      bool shouldActivate = false;
      if(ob.isBullish)
         shouldActivate = (barHigh > ob.high);
      else
         shouldActivate = (barLow < ob.low);

      if(shouldActivate)
        {
         ob.isActivated   = true;
         ob.isValid       = true;
         ob.validationBar = replayBar;
         didActivate      = true;
        }
     }

   // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.
   // If activation happened THIS bar (didActivate == true), skip invalidation entirely.
   if(ob.isActivated && ob.isValid && !didActivate)
     {
      bool closedBeyondInvalidation = false;
      if(ob.isBullish)
         closedBeyondInvalidation = (barClose < ob.invalidationLevel);
      else
         closedBeyondInvalidation = (barClose > ob.invalidationLevel);

      if(closedBeyondInvalidation)
        {
         ob.isValid         = false;
         ob.invalidationBar = replayBar;
         didInvalidate      = true;

         int countReferenceBar = g_s.currentStructureStartBar;
         bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
         bool refOk = !SrjIsNa(countReferenceBar) &&
                      (ob.invalidationBar >= countReferenceBar) &&
                      !SrjIsNa(ob.validationBar) &&
                      !sameBarValInv;

         if(SRJ_InDebugWindow(discoveryBar))
            Print("SRJ INV t=", SRJ_BarTimeStr(discoveryBar),
                  " bar=", discoveryBar,
                  " source=replay",
                  " evtBar=", replayBar,
                  " evtBarT=", SRJ_BarTimeStr(replayBar),
                  " obStart=", ob.startBar,
                  " obStartT=", SRJ_BarTimeStr(ob.startBar),
                  " obVal=", ob.validationBar,
                  " obInv=", ob.invalidationBar,
                  " obCreation=", ob.creationBar,  // NEW
                  " isBull=", (ob.isBullish ? 1 : 0),
                  " bias=", g_s.currentBias,
                  " ref=", countReferenceBar,
                  " refT=", SRJ_BarTimeStr(countReferenceBar),
                  " refOk=", (refOk ? 1 : 0),
                  " sameBarValInv=", (sameBarValInv ? 1 : 0));

         if(refOk)
           {
            // Append to history arrays (unified with Fix 1.3)
            if(ob.isBullish)
               g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar
            else
               g_bearishInvalidationBarsHistory.Add(discoveryBar);

            bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
                            (g_s.currentBias=="bearish" && !ob.isBullish);
            if(isInBias)
            {
               g_s.tickOBIsValid = false;
               // [Task 155] Buffer 34 provenance capture. Site code 1. The bar
               // recorded is discoveryBar, the PROCESSING bar of this call, and not
               // replayBar, which is the event bar.
               Print("[SRJ][T155][OBPROV] code=1 id=", ob.objId, " bar=", discoveryBar, " flag=false");
               g_s.tickOBSetterId   = ob.objId;
               g_s.tickOBSetterCode = 1;
               g_s.tickOBSetterBar  = discoveryBar;
            }
            else
            {
               g_s.tickOBIsValid = true;
               // [Task 155] Buffer 34 provenance capture. Site code 2. The bar
               // recorded is discoveryBar, the processing bar of this call.
               Print("[SRJ][T155][OBPROV] code=2 id=", ob.objId, " bar=", discoveryBar, " flag=true");
               g_s.tickOBSetterId   = ob.objId;
               g_s.tickOBSetterCode = 2;
               g_s.tickOBSetterBar  = discoveryBar;
            }

            // Counter updates attributed to discovery bar for SRJ_OB_CounterAggregationPass to see
            if(ob.isBullish)
              {
               if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
                  g_s.firstBullishOBInvalidationBar = discoveryBar;
               g_s.lastBullishOBInvalidationBar = discoveryBar;
               g_s.bullishOBInvalidationsThisBar += 1;
              }
            else
              {
               if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
                  g_s.firstBearishOBInvalidationBar = discoveryBar;
               g_s.lastBearishOBInvalidationBar = discoveryBar;
               g_s.bearishOBInvalidationsThisBar += 1;
              }
           }
        }
     }

   return (didActivate && didInvalidate);  // Should now always return false with the fix
  }

void SRJ_OB_CreationPass(const double &open[],const double &high[],
                         const double &low[],const double &close[],
                         const datetime &time[],int rates_total,int i,
                         bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && barClosed))
      return;

   if(SRJ_isStrictFractalHigh(high,i,1))
     {
      g_s.bestBearishOBBar  = SRJ_NA_INT;
      g_s.bestBearishOBHigh = SRJ_NA_DBL;
      g_s.bestBearishOBLow  = SRJ_NA_DBL;
      g_s.bestBearishOBOpen = SRJ_NA_DBL;

      if(SRJ_isBullishCandle(open,close,i,1))
        {
         g_s.bestBearishOBBar  = i - 1;
         g_s.bestBearishOBHigh = srjH(high,i,1);
         g_s.bestBearishOBLow  = srjL(low,i,1);
         g_s.bestBearishOBOpen = srjO(open,i,1);
        }
      if(i >= 3 && SRJ_isBullishCandle(open,close,i,2))
        {
         if(SrjIsNa(g_s.bestBearishOBBar) || srjH(high,i,2) > g_s.bestBearishOBHigh)
           {
            g_s.bestBearishOBBar  = i - 2;
            g_s.bestBearishOBHigh = srjH(high,i,2);
            g_s.bestBearishOBLow  = srjL(low,i,2);
            g_s.bestBearishOBOpen = srjO(open,i,2);
           }
        }
      if(!SrjIsNa(g_s.bestBearishOBBar))
        {
         bool isExtBear = false;
         int leftOffsetBear = i - (g_s.bestBearishOBBar - 1);
         if(leftOffsetBear >= 0 && leftOffsetBear <= 500)
           {
            if(srjC(close,i,leftOffsetBear) < srjO(open,i,leftOffsetBear))
               isExtBear = true;
           }
         COrderblock *ob = SRJ_createOrderblock(time,rates_total,i,
                               false,g_s.bestBearishOBBar,g_s.bestBearishOBHigh,
                               g_s.bestBearishOBLow,g_s.bestBearishOBOpen,
                               i - 1,isExtBear);
         g_orderblocks.Add(ob);

         // Replay activation/invalidation for bars startBar+1 .. i-1 to catch same-bar act+inv
         // during fractal confirmation lag (workstream 3 fix).
         for(int replayBar = ob.startBar + 1; replayBar < i; replayBar++)
           {
            double replayH = srjH(high,i,i-replayBar);
            double replayL = srjL(low,i,i-replayBar);
            double replayC = srjC(close,i,i-replayBar);
            SRJ_OB_ReplayActivationInvalidation(ob,replayH,replayL,replayC,replayBar,i);
           }

         // If the replay invalidated the OB, redraw it as invalidated (it was created inactive)
         if(!ob.isValid && !SrjIsNa(ob.invalidationBar))
           {
            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }

            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);

            if(g_showInvalidatedBearishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.low,safeX2,ob.low,
                                    g_invalidatedBearishColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendInvalidated);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_invalidatedMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendInvalidated);
              }
           }
         // The replay activated it and it is still valid.  SRJ_OB_ActivationInvalidationPass
         // gates on !ob.isActivated, so it will skip this OB entirely and the inactive
         // pink/black lines drawn by SRJ_createOrderblock would persist — including
         // through a later XOB promotion.  Restate them in valid colours here.
         else if(ob.isActivated && ob.isValid)
           {
            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }

            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);

            if(g_showValidBearishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.low,safeX2,ob.low,
                                    g_bearishOBColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendValid);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_validMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendValid);
              }

            if(SRJ_InDebugWindow(i))
               Print("SRJ OBREDRAW t=", SRJ_BarTimeStr(i), " bar=", i,
                     " source=replayActivated dir=bearish",
                     " obStart=", ob.startBar,
                     " obStartT=", SRJ_BarTimeStr(ob.startBar),
                     " obVal=", ob.validationBar,
                     " obValT=", SRJ_BarTimeStr(ob.validationBar));
           }
        }
     }

   if(SRJ_isStrictFractalLow(low,i,1))
     {
      g_s.bestBullishOBBar  = SRJ_NA_INT;
      g_s.bestBullishOBHigh = SRJ_NA_DBL;
      g_s.bestBullishOBLow  = SRJ_NA_DBL;
      g_s.bestBullishOBOpen = SRJ_NA_DBL;

      if(SRJ_isBearishCandle(open,close,i,1))
        {
         g_s.bestBullishOBBar  = i - 1;
         g_s.bestBullishOBHigh = srjH(high,i,1);
         g_s.bestBullishOBLow  = srjL(low,i,1);
         g_s.bestBullishOBOpen = srjO(open,i,1);
        }
      if(i >= 3 && SRJ_isBearishCandle(open,close,i,2))
        {
         if(SrjIsNa(g_s.bestBullishOBBar) || srjL(low,i,2) < g_s.bestBullishOBLow)
           {
            g_s.bestBullishOBBar  = i - 2;
            g_s.bestBullishOBHigh = srjH(high,i,2);
            g_s.bestBullishOBLow  = srjL(low,i,2);
            g_s.bestBullishOBOpen = srjO(open,i,2);
           }
        }
      if(!SrjIsNa(g_s.bestBullishOBBar))
        {
         bool isExtBull = false;
         int leftOffsetBull = i - (g_s.bestBullishOBBar - 1);
         if(leftOffsetBull >= 0 && leftOffsetBull <= 500)
           {
            if(srjC(close,i,leftOffsetBull) > srjO(open,i,leftOffsetBull))
               isExtBull = true;
           }
         COrderblock *ob = SRJ_createOrderblock(time,rates_total,i,
                               true,g_s.bestBullishOBBar,g_s.bestBullishOBHigh,
                               g_s.bestBullishOBLow,g_s.bestBullishOBOpen,
                               i - 1,isExtBull);
         g_orderblocks.Add(ob);

         // Replay activation/invalidation for bars startBar+1 .. i-1 to catch same-bar act+inv
         // during fractal confirmation lag (workstream 3 fix).
         for(int replayBar = ob.startBar + 1; replayBar < i; replayBar++)
           {
            double replayH = srjH(high,i,i-replayBar);
            double replayL = srjL(low,i,i-replayBar);
            double replayC = srjC(close,i,i-replayBar);
            SRJ_OB_ReplayActivationInvalidation(ob,replayH,replayL,replayC,replayBar,i);
           }

         // If the replay invalidated the OB, redraw it as invalidated (it was created inactive)
         if(!ob.isValid && !SrjIsNa(ob.invalidationBar))
           {
            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }

            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);

            if(g_showInvalidatedBullishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.high,safeX2,ob.high,
                                    g_invalidatedBullishColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendInvalidated);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_invalidatedMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendInvalidated);
              }
           }
         // Replay-activated and still valid — see the bearish branch above.
         else if(ob.isActivated && ob.isValid)
           {
            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }

            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);

            if(g_showValidBullishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.high,safeX2,ob.high,
                                    g_bullishOBColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendValid);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_validMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendValid);
              }

            if(SRJ_InDebugWindow(i))
               Print("SRJ OBREDRAW t=", SRJ_BarTimeStr(i), " bar=", i,
                     " source=replayActivated dir=bullish",
                     " obStart=", ob.startBar,
                     " obStartT=", SRJ_BarTimeStr(ob.startBar),
                     " obVal=", ob.validationBar,
                     " obValT=", SRJ_BarTimeStr(ob.validationBar));
           }
        }
     }
  }

void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],
                                       const double &low[],const double &close[],
                                       const datetime &time[],int rates_total,int i,
                                       bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
      return;

   double liveHigh  = high[i];
   double liveLow   = low[i];
   double liveClose = close[i];

   for(int k = g_orderblocks.Total() - 1; k >= 0; k--)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;

      if(!ob.isActivated)
        {
         bool shouldActivate = false;
         if(ob.isBullish)
            shouldActivate = (liveHigh > ob.high);
         else
            shouldActivate = (liveLow < ob.low);

         if(shouldActivate)
           {
            ob.isActivated   = true;
            ob.isValid       = true;
            ob.validationBar = i;

            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }

            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);

            if(ob.isBullish && g_showValidBullishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.high,safeX2,ob.high,
                                    g_bullishOBColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendValid);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_validMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendValid);
              }
            else if(!ob.isBullish && g_showValidBearishOB)
              {
               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
                                    safeX1,ob.low,safeX2,ob.low,
                                    g_bearishOBColor,g_lineThickness,
                                    SRJ_STYLE_SOLID,g_extendValid);
               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
                                    g_validMidlineColor,g_lineThickness,
                                    SRJ_STYLE_DOTTED,g_extendValid);
              }
            else
              {
               ob.obLineName  = "";
               ob.midLineName = "";
              }
           }
        }

      if(barClosed)
        {
         if(ob.isActivated && ob.isValid)
           {
            bool closedBeyondInvalidation = false;
            if(ob.isBullish)
               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
            else
               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);

            // CRITICAL FIX: Check temporal rules BEFORE changing any state
            bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);
            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW

            if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard
              {
               ob.isValid         = false;
               ob.invalidationBar = i;

               int countReferenceBar = g_s.currentStructureStartBar;
               
               // This check is now redundant (will never be true) but kept for safety
               bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
               
               bool refOk = !SrjIsNa(countReferenceBar) &&
                            (ob.invalidationBar >= countReferenceBar) &&
                            !SrjIsNa(ob.validationBar) &&
                            !sameBarValInv;
               
               if(SRJ_InDebugWindow(i))
                  Print("SRJ INV t=", SRJ_BarTimeStr(i),
                        " bar=", i,
                        " obStart=", ob.startBar,
                        " obStartT=", SRJ_BarTimeStr(ob.startBar),
                        " obVal=", ob.validationBar,
                        " obInv=", ob.invalidationBar,
                        " obCreation=", ob.creationBar,  // NEW debug output
                        " isBull=", (ob.isBullish ? 1 : 0),
                        " bias=", g_s.currentBias,
                        " ref=", countReferenceBar,
                        " refT=", SRJ_BarTimeStr(countReferenceBar),
                        " refOk=", (refOk ? 1 : 0),
                        " sameBarValInv=", (sameBarValInv ? 1 : 0));
               
               if(refOk)
                 {
                  // Append to history arrays when refOk passes
                  if(ob.isBullish)
                     g_bullishInvalidationBarsHistory.Add(i);
                  else
                     g_bearishInvalidationBarsHistory.Add(i);

                  bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
                                  (g_s.currentBias=="bearish" && !ob.isBullish);
                  if(isInBias)
                  {
                     g_s.tickOBIsValid = false;
                     // [Task 155] Buffer 34 provenance capture. Site code 3. This pass
                     // invalidates orderblocks inside a descending loop, so several may
                     // write the flag in one bar. The LAST write survives to the export;
                     // the unconditional Print below carries every event.
                     Print("[SRJ][T155][OBPROV] code=3 id=", ob.objId, " bar=", i, " flag=false");
                     g_s.tickOBSetterId   = ob.objId;
                     g_s.tickOBSetterCode = 3;
                     g_s.tickOBSetterBar  = i;
                  }
                  else
                  {
                     g_s.tickOBIsValid = true;
                     // [Task 155] Buffer 34 provenance capture. Site code 4. The LAST
                     // write in this descending loop survives to the export.
                     Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true");
                     g_s.tickOBSetterId   = ob.objId;
                     g_s.tickOBSetterCode = 4;
                     g_s.tickOBSetterBar  = i;
                  }

                  if(ob.isBullish)
                    {
                     if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
                        g_s.firstBullishOBInvalidationBar = i;
                     g_s.lastBullishOBInvalidationBar = i;
                     g_s.bullishOBInvalidationsThisBar += 1;
                    }
                  else
                    {
                     if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
                        g_s.firstBearishOBInvalidationBar = i;
                     g_s.lastBearishOBInvalidationBar = i;
                     g_s.bearishOBInvalidationsThisBar += 1;
                    }
                 }

               if(ob.HasObLine())
                 {
                  color invalidColor = ob.isBullish ? g_invalidatedBullishColor
                                                    : g_invalidatedBearishColor;
                  SRJ_SetTrendColor(ob.obLineName, invalidColor);
                  SRJ_SetTrendExtend(ob.obLineName, g_extendInvalidated);
                 }
               if(ob.HasMidLine())
                 {
                  SRJ_SetTrendColor(ob.midLineName, g_invalidatedMidlineColor);
                  SRJ_SetTrendExtend(ob.midLineName, g_extendInvalidated);
                 }
              }
           }
        }
     }
  }

void SRJ_OB_CounterAggregationPass(int i,bool barClosed)
  {
   if(!barClosed) return;

   SRJ_pruneInvalidationHistory(g_bullishInvalidationBarsHistory,g_s.strictLimitBar);
   SRJ_pruneInvalidationHistory(g_bearishInvalidationBarsHistory,g_s.strictLimitBar);

   if(!SrjIsNa(g_s.lastBullishOBInvalidationBar) &&
      g_s.lastBullishOBInvalidationBar == i)
     {
      bool isInBias = (g_s.currentBias == "bullish");
      if(isInBias)
        {
         g_s.inBiasOBInvalidationCount += g_s.bullishOBInvalidationsThisBar;
         g_s.bullishOBInvalidationCount += g_s.bullishOBInvalidationsThisBar;
        }
      else
        {
         g_s.opposingOBInvalidationCount += g_s.bullishOBInvalidationsThisBar;
         g_s.bullishOBInvalidationCount += g_s.bullishOBInvalidationsThisBar;
        }
     }

   if(!SrjIsNa(g_s.lastBearishOBInvalidationBar) &&
      g_s.lastBearishOBInvalidationBar == i)
     {
      bool isInBias = (g_s.currentBias == "bearish");
      if(isInBias)
        {
         g_s.inBiasOBInvalidationCount += g_s.bearishOBInvalidationsThisBar;
         g_s.bearishOBInvalidationCount += g_s.bearishOBInvalidationsThisBar;
        }
      else
        {
         g_s.opposingOBInvalidationCount += g_s.bearishOBInvalidationsThisBar;
         g_s.bearishOBInvalidationCount += g_s.bearishOBInvalidationsThisBar;
        }
     }
  }

void SRJ_OB_InactiveLinePrunePass(bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
      return;

   int n = g_orderblocks.Total();
   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;
      if(ob.isActivated) continue;
      if(ob.startBar < g_s.strictLimitBar)
        {
         if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
         if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
         continue;
        }
     }
  }

void SRJ_OB_OpposingCachePass(int i,int finalLookback,bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
      return;

   int n = g_orderblocks.Total();
   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;
      if(ob.isActivated && !SrjIsNa(ob.validationBar) && ob.validationBar == i)
        {
         bool isOpposing = (g_s.currentBias=="bullish" && !ob.isBullish) ||
                           (g_s.currentBias=="bearish" &&  ob.isBullish);
         if(isOpposing)
           {
            bool opposingFVGExists = false;
            int m = g_imbalances.Total();
            for(int j=0; j<m; j++)
              {
               CImbalance *fvg = GetFVG(g_imbalances,j);
               if(fvg==NULL) continue;
               bool fvgIsOpposing = (g_s.currentBias=="bullish" && !fvg.isBullish) ||
                                    (g_s.currentBias=="bearish" &&  fvg.isBullish);
               if(fvgIsOpposing && fvg.startBar > ob.swingBar)
                 {
                  opposingFVGExists = true;
                  break;
                 }
              }
            if(opposingFVGExists)
              {
               int swingOffset = i - ob.swingBar;
               if(swingOffset > 0 && swingOffset <= finalLookback)
                 {
                  if(g_s.currentBias == "bullish")
                     g_s.cachedSwingBarBearish = ob.swingBar;
                  else
                     g_s.cachedSwingBarBullish = ob.swingBar;
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| XOB anatomy gate.                                                |
//+------------------------------------------------------------------+
bool SRJ_OB_AnatomyQualifies(COrderblock *ob)
  {
   if(ob==NULL) return false;
   return ob.isExtreme;
  }

//+------------------------------------------------------------------+
//| Absolute nearest active + valid in-bias OB.                      |
//+------------------------------------------------------------------+
int SRJ_StrictNearestOBIndex(const string bias,const int boundary)
  {
   int bestIdx   = -1;
   int bestStart = SRJ_NA_INT;
   int bestVal   = SRJ_NA_INT;

   int n = g_orderblocks.Total();
   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;

      bool matches = (bias=="bullish" && ob.isBullish) ||
                     (bias=="bearish" && !ob.isBullish);
      if(!matches)                             continue;
      if(!ob.isValid || !ob.isActivated)       continue;
      if(ob.startBar < g_s.strictLimitBar)     continue;
      if(!SrjIsNa(boundary) &&
         (SrjIsNa(ob.validationBar) || ob.validationBar < boundary))
         continue;

      bool better = false;
      if(bestIdx < 0)
         better = true;
      else if(ob.startBar > bestStart)
         better = true;
      else if(ob.startBar == bestStart && !SrjIsNa(ob.validationBar) &&
              (SrjIsNa(bestVal) || ob.validationBar > bestVal))
         better = true;

      if(better)
        {
         bestIdx   = k;
         bestStart = ob.startBar;
         bestVal   = ob.validationBar;
        }
     }
   return bestIdx;
  }

//+------------------------------------------------------------------+
//| Diagnostic: enumerate every same-side OB and the exact filter    |
//+------------------------------------------------------------------+
void SRJ_DumpNearestOBCandidates(const int i,const string bias,const int boundary)
  {
   if(!SRJ_InDebugWindow(i)) return;

   int n = g_orderblocks.Total();
   Print("SRJ OBDUMP t=", SRJ_BarTimeStr(i), " bar=", i,
         " bias=", bias,
         " boundary=", boundary,
         " boundaryT=", SRJ_BarTimeStr(boundary),
         " total=", n,
         " strictLimit=", g_s.strictLimitBar);

   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;

      bool matches = (bias=="bullish" && ob.isBullish) ||
                     (bias=="bearish" && !ob.isBullish);
      if(!matches) continue;

      string reason = "pass";
      if(!ob.isActivated)                        reason = "notActivated";
      else if(!ob.isValid)                       reason = "invalidated";
      else if(ob.startBar < g_s.strictLimitBar)  reason = "belowStrictLimit";
      else if(!SrjIsNa(boundary) &&
              (SrjIsNa(ob.validationBar) || ob.validationBar < boundary))
                                                 reason = "beforeBoundary";

      Print("SRJ OBCAND t=", SRJ_BarTimeStr(i), " bar=", i,
            " idx=", k,
            " obStart=", ob.startBar,
            " obStartT=", SRJ_BarTimeStr(ob.startBar),
            " obVal=", ob.validationBar,
            " obValT=", SRJ_BarTimeStr(ob.validationBar),
            " obInv=", ob.invalidationBar,
            " act=", (ob.isActivated ? 1 : 0),
            " valid=", (ob.isValid ? 1 : 0),
            " isExtreme=", (ob.isExtreme ? 1 : 0),
            " promoted=", (ob.isPromoted ? 1 : 0),
            " reject=", reason);
     }
  }

void SRJ_ApplyPromotion(COrderblock *ob)
  {
   if(ob==NULL) return;
   ob.isPromoted = true;
   if(ob.HasObLine())
      SRJ_SetTrendWidth(ob.obLineName, g_lineThickness + g_extremeOBExtraThickness);
   if(ob.HasMidLine())
      SRJ_SetTrendWidth(ob.midLineName,g_lineThickness + g_extremeOBExtraThickness);
  }

void SRJ_promotionReconcile(int i,string mode,string bias,int boundary,
                            int lockedTargetBar)
  {
   if(mode == "nearest")
     {
      if(SrjIsNa(lockedTargetBar))
        {
         if(SRJ_InDebugWindow(i))
            Print("SRJ XOB t=", SRJ_BarTimeStr(i), " bar=", i,
                  " mode=nearest bias=", bias,
                  " result=reject reason=noLockAtTrigger",
                  " boundary=", boundary);
         return;
        }

      COrderblock *lockedOB = NULL;
      int n = g_orderblocks.Total();
      for(int k=0; k<n; k++)
        {
         COrderblock *cand = GetOB(g_orderblocks,k);
         if(cand==NULL) continue;
         bool matches = (bias=="bullish" && cand.isBullish) ||
                        (bias=="bearish" && !cand.isBullish);
         if(matches && cand.isActivated && cand.startBar == lockedTargetBar)
           {
            lockedOB = cand;
            break;
           }
        }

      if(lockedOB==NULL)
        {
         if(SRJ_InDebugWindow(i))
            Print("SRJ XOB t=", SRJ_BarTimeStr(i), " bar=", i,
                  " mode=nearest bias=", bias,
                  " result=reject reason=targetGone",
                  " locked=", lockedTargetBar,
                  " lockedT=", SRJ_BarTimeStr(lockedTargetBar));
         return;
        }

      if(!SRJ_OB_AnatomyQualifies(lockedOB))
        {
         if(SRJ_InDebugWindow(i))
            Print("SRJ XOB t=", SRJ_BarTimeStr(i), " bar=", i,
                  " mode=nearest bias=", bias,
                  " result=reject reason=anatomy",
                  " obStart=", lockedOB.startBar,
                  " obStartT=", SRJ_BarTimeStr(lockedOB.startBar),
                  " obVal=", lockedOB.validationBar,
                  " isExtreme=0");
         return;
        }

      if(lockedOB.isPromoted)
        {
         if(SRJ_InDebugWindow(i))
            Print("SRJ XOB t=", SRJ_BarTimeStr(i), " bar=", i,
                  " mode=nearest bias=", bias,
                  " result=skip reason=alreadyPromoted",
                  " obStart=", lockedOB.startBar);
         return;
        }

      SRJ_ApplyPromotion(lockedOB);

      // [Task 110] Promotion-bar stamp. SRJ_ApplyPromotion takes no bar
      // parameter, so the stamp lives at the call site where i is in scope.
      // This is the APPLY bar, not the queue bar. Under Part A section 1.2
      // relevance begins at promotion, so apply is the correct reference.
      lockedOB.promotionBar = i;

      // [Task 110] EA-113 census. DIAGNOSTIC ONLY — nothing is gated on any
      // value printed here, and this runs AFTER the promotion has already been
      // applied. SRJ_ApplyPromotion sets isPromoted and two line widths and
      // touches nothing else, so isValid below is the value that was true at
      // promotion time.
      //
      // The mode=="all" branch requires isValid, a boundary test, and at least
      // two opposing invalidations. This branch requires none of the three.
      // isValid=0 here is an invalidated order block being promoted, which
      // returns a dead object to the selector. The other two columns size
      // EA-118, where the omission may be an intentionally different trigger.
      //
      // Deliberately NOT wrapped in SRJ_InDebugWindow — the whole population
      // is needed, and promotions are rare enough that this is not noisy.
      Print("SRJ XOB-PROMOCENSUS t=", SRJ_BarTimeStr(i), " bar=", i,
            " mode=nearest bias=", bias,
            " objId=", lockedOB.objId,
            " isValid=", (lockedOB.isValid ? 1 : 0),
            " isActivated=", (lockedOB.isActivated ? 1 : 0),
            " obStart=", lockedOB.startBar,
            " obStartT=", SRJ_BarTimeStr(lockedOB.startBar),
            " obVal=", lockedOB.validationBar,
            " obInval=", lockedOB.invalidationBar,
            " boundary=", boundary,
            " boundaryOk=", ((SrjIsNa(boundary) || (lockedOB.startBar >= boundary)) ? 1 : 0),
            " oppInvalCount=",
            SRJ_countOpposingInvalidationsSinceActivation(lockedOB.isBullish,
                                                          lockedOB.validationBar),
            " promoBar=", lockedOB.promotionBar,
            " promoT=", SRJ_BarTimeStr((int)lockedOB.promotionBar));
      return;
     }

   if(mode == "all")
     {
      bool didPromoteStrong = false;
      int n = g_orderblocks.Total();
      for(int k=0; k<n; k++)
        {
         COrderblock *obCheck = GetOB(g_orderblocks,k);
         if(obCheck==NULL) continue;
         bool matches = (bias=="bullish" && obCheck.isBullish) ||
                        (bias=="bearish" && !obCheck.isBullish);
         bool boundaryOk = SrjIsNa(boundary) || (obCheck.startBar >= boundary);
         if(matches && obCheck.isValid && obCheck.isActivated && boundaryOk &&
            SRJ_OB_AnatomyQualifies(obCheck) && !obCheck.isPromoted &&
            SRJ_countOpposingInvalidationsSinceActivation(obCheck.isBullish,obCheck.validationBar) >= 2)
           {
            SRJ_ApplyPromotion(obCheck);

            // [Task 110] Promotion-bar stamp, second and final call site.
            // Same rationale as the nearest branch. Deeper indentation because
            // this sits inside the all-branch loop over g_orderblocks.
            obCheck.promotionBar = i;

            // [Task 110] EA-113 census, all-branch control arm. Printed so the
            // two branches are directly comparable in one journal. This branch
            // already gates on isValid, so isValid=0 must never appear here.
            // If it does, the guard set read in Task 109 Block B1 is not the
            // guard set actually executing.
            Print("SRJ XOB-PROMOCENSUS t=", SRJ_BarTimeStr(i), " bar=", i,
                  " mode=all bias=", bias,
                  " objId=", obCheck.objId,
                  " isValid=", (obCheck.isValid ? 1 : 0),
                  " isActivated=", (obCheck.isActivated ? 1 : 0),
                  " obStart=", obCheck.startBar,
                  " obStartT=", SRJ_BarTimeStr(obCheck.startBar),
                  " obVal=", obCheck.validationBar,
                  " obInval=", obCheck.invalidationBar,
                  " boundary=", boundary,
                  " promoBar=", obCheck.promotionBar,
                  " promoT=", SRJ_BarTimeStr((int)obCheck.promotionBar));
           }
        }
      if(didPromoteStrong)
        {
         SRJ_FireExtremePromote(i, bias);
         g_s.currentLegHasXOB = true;   // [Section 8]
        }
     }
  }

//+------------------------------------------------------------------+
//| Queue a deferred strict-nearest promotion.                       |
//+------------------------------------------------------------------+
void SRJ_QueueNearestPromotion(const int i,const string bias,
                               const int boundary,const int slot)
  {
   int lockBar  = SRJ_NA_INT;
   int lockIdx  = SRJ_StrictNearestOBIndex(bias,boundary);
   if(lockIdx > -1)
     {
      COrderblock *lockOB = GetOB(g_orderblocks,lockIdx);
      if(lockOB!=NULL) lockBar = lockOB.startBar;
     }

   if(slot == 1)
     {
      if(!SrjIsNa(g_s.pendingPromoteBar) && g_s.pendingPromoteBar == i)
         return;
      if(!SrjIsNa(g_s.pendingPromoteBar) && g_s.pendingPromoteBar < i)
         SRJ_promotionReconcile(i,g_s.pendingPromoteMode,g_s.pendingPromoteBias,
                                g_s.pendingPromoteBoundary,g_s.pendingPromoteTargetBar);

      g_s.pendingPromoteBar       = i;
      g_s.pendingPromoteBias      = bias;
      g_s.pendingPromoteMode      = "nearest";
      g_s.pendingPromoteBoundary  = boundary;
      g_s.pendingPromoteTargetBar = lockBar;
     }
   else
     {
      if(!SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 == i)
         return;
      if(!SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
         SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
                                g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);

      g_s.pendingPromoteBar2       = i;
      g_s.pendingPromoteBias2      = bias;
      g_s.pendingPromoteMode2      = "nearest";
      g_s.pendingPromoteBoundary2  = boundary;
      g_s.pendingPromoteTargetBar2 = lockBar;
     }

   if(SRJ_InDebugWindow(i))
      Print("SRJ XOB-QUEUE t=", SRJ_BarTimeStr(i), " bar=", i,
            " slot=", slot, " bias=", bias,
            " boundary=", boundary,
            " lockedTarget=", lockBar,
            " lockedTargetT=", SRJ_BarTimeStr(lockBar));
  }

void SRJ_OB_DeferredPromotionPass(int i,bool barClosed)
  {
   if(barClosed && !SrjIsNa(g_s.pendingPromoteBar) && i > g_s.pendingPromoteBar)
     {
      SRJ_promotionReconcile(i,g_s.pendingPromoteMode,g_s.pendingPromoteBias,
                             g_s.pendingPromoteBoundary,g_s.pendingPromoteTargetBar);
      g_s.pendingPromoteBar       = SRJ_NA_INT;
      g_s.pendingPromoteBias      = SRJ_NA_STR;
      g_s.pendingPromoteMode      = SRJ_NA_STR;
      g_s.pendingPromoteBoundary  = SRJ_NA_INT;
      g_s.pendingPromoteTargetBar = SRJ_NA_INT;
     }

   if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && i > g_s.pendingPromoteBar2)
     {
      SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
                             g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);
      g_s.pendingPromoteBar2       = SRJ_NA_INT;
      g_s.pendingPromoteBias2      = SRJ_NA_STR;
      g_s.pendingPromoteMode2      = SRJ_NA_STR;
      g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
      g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
     }
  }

bool SRJ_inBiasOBExists(string bias,int boundary)
  {
   bool exists = false;
   int n = g_orderblocks.Total();
   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;
      bool matchesBias = (bias=="bullish" && ob.isBullish) ||
                         (bias=="bearish" && !ob.isBullish);
      if(matchesBias && ob.isValid && ob.isActivated && ob.startBar >= g_s.strictLimitBar)
        {
         exists = true;
         break;
        }
     }
   return exists;
  }

//+------------------------------------------------------------------+
//| [Section 8] Nearest currently valid + activated + PROMOTED (XOB) |
//| in-bias order block, with NO age/leg boundary — matches Part A's |
//| resolved G-8 answer: "a valid XOB, regardless of age, whose zone |
//| the current/freshest market structure is now retesting." Ageing  |
//| out of the lookback window is already enforced upstream by       |
//| SRJ_OB_PruningPass deleting the OB from g_orderblocks entirely,  |
//| so no separate strictLimitBar check is needed here.              |
//| Read-only query — does not affect promotion targeting logic      |
//| (SRJ_StrictNearestOBIndex, used for that, is untouched).         |
//+------------------------------------------------------------------+
int SRJ_NearestPromotedOBIndex(const string bias)
  {
   int bestIdx   = -1;
   int bestStart = SRJ_NA_INT;

   int n = g_orderblocks.Total();
   for(int k=0; k<n; k++)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;

      bool matches = (bias=="bullish" && ob.isBullish) ||
                     (bias=="bearish" && !ob.isBullish);
      if(!matches)         continue;
      if(!ob.isPromoted)   continue;   // must be an XOB
      if(!ob.isValid)      continue;   // still valid
      if(!ob.isActivated)  continue;   // still activated

      bool better = (bestIdx < 0) || (ob.startBar > bestStart);
      if(better) { bestIdx = k; bestStart = ob.startBar; }
     }
   return bestIdx;
  }

void SRJ_OB_PruningPass(bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
      return;

   for(int k = g_orderblocks.Total() - 1; k >= 0; k--)
     {
      COrderblock *ob = GetOB(g_orderblocks,k);
      if(ob==NULL) continue;

      if(ob.startBar < g_s.strictLimitBar)
        {
         if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
         if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
         g_orderblocks.Delete(k);
        }
      else
        {
         bool shouldDelete = false;
         if(!ob.isValid && !SrjIsNa(ob.invalidationBar))
            shouldDelete = SRJ_OBOverCap(g_orderblocks,k,g_keepInvalidatedCount);

         if(shouldDelete)
           {
            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
            g_orderblocks.Delete(k);
           }
        }
     }
  }

#endif // __SRJ_ORDERBLOCKMGR_MQH__