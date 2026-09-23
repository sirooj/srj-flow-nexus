#ifndef __SRJ_IMBALANCEMGR_MQH__
#define __SRJ_IMBALANCEMGR_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Fractals.mqh"
#include "SRJ_Draw.mqh"

// --- Forward declarations for main script debug helpers ---
string SRJ_BarTimeStr(const int bar);
bool SRJ_InDebugWindow(const int bar);
void SRJ_QueueNearestPromotion(const int i,const string bias,
                               const int boundary,const int slot);
int SRJ_StrictNearestOBIndex(const string bias,const int boundary);
void SRJ_DumpNearestOBCandidates(const int i,const string bias,const int boundary);
// ----------------------------------------------------------

CImbalance *SRJ_createImbalance(const datetime &time[],int rates_total,int i,
                                bool isBull,int fvgBar,double fvgTop,
                                double fvgBottom,int detectedAt)
  {
   double mid = (fvgTop + fvgBottom) / 2.0;
   int extBars = (g_fvgExtension > 0) ? g_fvgExtension - 1 : 0;
   int endBar = fvgBar + extBars;
   int safeFvgBar = (int)MathMax(fvgBar, i - 4500);
   int safeEndBar = (int)MathMax(endBar, safeFvgBar + 1);
   color fillCol   = isBull ? g_bullishFVGColor : g_bearishFVGColor;
   color borderCol = isBull ? g_bullishFVGBorderColor : g_bearishFVGBorderColor;

   string boxName = "";
   string midName = "";
   if(g_showFVG)
     {
      boxName = SRJ_DrawBox("FVG",time,rates_total,
                            safeFvgBar,fvgTop,safeEndBar,fvgBottom,
                            SRJ_Opacity(fillCol,5.0),borderCol,g_fvgBorderWidth);
      if(g_showMidline)
         midName = SRJ_DrawTrend("FVGmid",time,rates_total,
                                 safeFvgBar,mid,safeEndBar,mid,
                                 borderCol,1,SRJ_STYLE_DASHED,false);
     }

   CImbalance *fvg = NewImbalance(
                        fvgBar,        
                        endBar,        
                        detectedAt,    
                        fvgTop,        
                        fvgBottom,     
                        mid,           
                        isBull,        
                        false,         
                        SRJ_NA_INT,    
                        boxName,       
                        midName,       
                        false,         
                        SRJ_NA_INT,    
                        true);         
   return fvg;
  }

bool SRJ_inBiasFVGExists(string bias,int boundary,bool useDetectionBar=false)
  {
   bool exists = false;
   if(g_imbalances.Total() > 0 && !SrjIsNa(boundary))
     {
      int n = g_imbalances.Total();
      for(int k=0; k<n; k++)
        {
         CImbalance *fvg = GetFVG(g_imbalances,k);
         if(fvg==NULL) continue;
         int compareBar = useDetectionBar ? fvg.detectionBar : fvg.startBar;
         bool matchesBias = (bias=="bullish" && fvg.isBullish) ||
                            (bias=="bearish" && !fvg.isBullish);
         if(matchesBias && compareBar >= boundary && compareBar >= g_s.strictLimitBar)
           {
            exists = true;
            break;
           }
        }
     }
   return exists;
  }

//+------------------------------------------------------------------+
//| An FVG that opposes the current bias is not a structural event.  |
//| It raises no renewal, resets no counters, and moves no boundary. |
//| It does qualify the nearest opposing OB for XOB promotion.       |
//| Boundary is NA on purpose: obInvalidationBoundary tracks the     |
//| in-bias structure and would filter every opposing OB out.        |
//| Slot 1 is the renewal slot; fall back to slot 2 if an in-bias    |
//| renewal already claimed it on this same bar.  Both queue helpers |
//| are first-writer-wins per bar, so this cannot clobber a pending  |
//| promotion from earlier in the bar.                               |
//+------------------------------------------------------------------+
void SRJ_QueueOpposingPromotion(const int i,const string oppBias)
  {
   int slot = (!SrjIsNa(g_s.pendingPromoteBar) && g_s.pendingPromoteBar == i) ? 2 : 1;
   SRJ_QueueNearestPromotion(i,oppBias,SRJ_NA_INT,slot);

   if(SRJ_InDebugWindow(i))
      Print("SRJ OPPFVG-XOB t=", SRJ_BarTimeStr(i), " bar=", i,
            " oppBias=", oppBias,
            " bias=", g_s.currentBias,
            " slot=", slot,
            " renewalSuppressed=1");
  }

void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],
                                 const datetime &time[],int rates_total,int i,
                                 bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))
      return;

   if(low[i] > srjH(high,i,2))
     {
      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,
                                 true,i - 2,low[i],srjH(high,i,2),i);
      g_imbalances.Add(newBullFVG);

      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
      if(fvgWithinStructure)
        {
         bool isInBiasFVG = (g_s.currentBias == "bullish");
         if(isInBiasFVG)
           {
            g_s.tickFVGIsValid = true;

            // Strict-nearest selection, identical to the promotion path, so the OB
            // that triggers the renewal is the same OB the promotion will target.
            int  latestOBValidationBar = SRJ_NA_INT;
            bool hasNewOB     = false;
            int  scanStartBar = SRJ_NA_INT;
            int  scanValBar   = SRJ_NA_INT;
            bool scanIsNew    = false;
            COrderblock *renewalOB = NULL;

            int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);
            if(nearestIdx > -1)
              {
               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
                 {
                  scanStartBar = nearestOB.startBar;
                  scanValBar   = nearestOB.validationBar;
                  scanIsNew    = !nearestOB.hasDrivenRenewal;
                  if(scanIsNew)
                    {
                     latestOBValidationBar = nearestOB.validationBar;
                     hasNewOB              = true;
                     renewalOB             = nearestOB;
                    }
                 }
              }

            if(SRJ_InDebugWindow(i))
               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
                     " dir=bullish",
                     " nearestIdx=", nearestIdx,
                     " obStart=", scanStartBar,
                     " obStartT=", SRJ_BarTimeStr(scanStartBar),
                     " obVal=", scanValBar,
                     " obValT=", SRJ_BarTimeStr(scanValBar),
                     " boundary=", g_s.obInvalidationBoundary,
                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
                     " lastRenewalOB=", g_s.lastRenewalOBBar,
                     " isNew=", (scanIsNew ? 1 : 0),
                     " hasNewOB=", (hasNewOB ? 1 : 0),
                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));

            if(nearestIdx < 0)
               SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);

            if(hasNewOB && !g_s.justChangedBias)
              {
               // --- PRE-RESET STATE RECORDER ---
               if(g_htfDebugLog &&
                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
                        " dir=", g_s.currentBias,
                        " bull=", g_s.bullishOBInvalidationCount,
                        " bear=", g_s.bearishOBInvalidationCount,
                        " tickOB=", g_s.tickOBIsValid,
                        " tickFVG=", g_s.tickFVGIsValid,
                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,
                        " checklistAct=", g_s.checklistActivated,
                        " structStart=", g_s.currentStructureStartBar,
                        " obInvBoundBefore=", g_s.obInvalidationBoundary,
                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
                        " resetOn=true");
               // ------------------------------

               g_s.isDoubleOB = false;
               g_s.lastRelevantStructureBar = i;
               g_s.structureConfirmedThisBar = true;
               g_s.drawStructureRenewalLineNow = true;
               g_s.renewalDirection = "bullish";
               g_s.hasPersistedOpposingFVG = false;
               
               g_s.bullishStructureRenewalAlert = true;
               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
               g_s.obInvalidationBoundary = i;
               g_s.fvgDetectionBoundary = i;

               g_s.tickOBIsValid                 = true;
               // [Task 155] Buffer 34 provenance capture. Site code 5. An
               // orderblock object is in scope in this pass, but the source names
               // none at this write, so no identity is recorded and the export
               // emits the site sentinel -11.0.
               Print("[SRJ][T155][OBPROV] code=5 id=0 bar=", i, " flag=true");
               g_s.tickOBSetterId   = 0;
               g_s.tickOBSetterCode = 5;
               g_s.tickOBSetterBar  = i;
               g_s.tickFVGIsValid                = true;
               // Selective reset: bullish bias renewal zeros bearish (opposing) counter only
               g_s.bearishOBInvalidationCount    = 0;
               g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
               g_s.checklistActivated            = false;
                 
               if(g_htfDebugLog)
                  Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
                        " kind=fvgRenewal",
                        " bias=", g_s.currentBias,
                        " resetOn=true");
              }
           }
         else
           {
            // Opposing FVG under a bearish bias.
            g_s.hasPersistedOpposingFVG = true;
            SRJ_QueueOpposingPromotion(i,"bullish");
           }
        }
     }

   if(high[i] < srjL(low,i,2))
     {
      CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,
                                 false,i - 2,srjL(low,i,2),high[i],i);
      g_imbalances.Add(newBearFVG);

      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
      if(fvgWithinStructure)
        {
         bool isInBiasFVG = (g_s.currentBias == "bearish");
         if(isInBiasFVG)
           {
            g_s.tickFVGIsValid = true;

            // Strict-nearest selection, identical to the promotion path, so the OB
            // that triggers the renewal is the same OB the promotion will target.
            int  latestOBValidationBar = SRJ_NA_INT;
            bool hasNewOB     = false;
            int  scanStartBar = SRJ_NA_INT;
            int  scanValBar   = SRJ_NA_INT;
            bool scanIsNew    = false;
            COrderblock *renewalOB = NULL;

            int nearestIdx = SRJ_StrictNearestOBIndex("bearish",g_s.obInvalidationBoundary);
            if(nearestIdx > -1)
              {
               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
                 {
                  scanStartBar = nearestOB.startBar;
                  scanValBar   = nearestOB.validationBar;
                  scanIsNew    = !nearestOB.hasDrivenRenewal;
                  if(scanIsNew)
                    {
                     latestOBValidationBar = nearestOB.validationBar;
                     hasNewOB              = true;
                     renewalOB             = nearestOB;
                    }
                 }
              }

            if(SRJ_InDebugWindow(i))
               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
                     " dir=bearish",
                     " nearestIdx=", nearestIdx,
                     " obStart=", scanStartBar,
                     " obStartT=", SRJ_BarTimeStr(scanStartBar),
                     " obVal=", scanValBar,
                     " obValT=", SRJ_BarTimeStr(scanValBar),
                     " boundary=", g_s.obInvalidationBoundary,
                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
                     " lastRenewalOB=", g_s.lastRenewalOBBar,
                     " isNew=", (scanIsNew ? 1 : 0),
                     " hasNewOB=", (hasNewOB ? 1 : 0),
                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));

            if(nearestIdx < 0)
               SRJ_DumpNearestOBCandidates(i,"bearish",g_s.obInvalidationBoundary);

            if(hasNewOB && !g_s.justChangedBias)
              {
               // --- PRE-RESET STATE RECORDER ---
               if(g_htfDebugLog &&
                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
                        " dir=", g_s.currentBias,
                        " bull=", g_s.bullishOBInvalidationCount,
                        " bear=", g_s.bearishOBInvalidationCount,
                        " tickOB=", g_s.tickOBIsValid,
                        " tickFVG=", g_s.tickFVGIsValid,
                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,
                        " checklistAct=", g_s.checklistActivated,
                        " structStart=", g_s.currentStructureStartBar,
                        " obInvBoundBefore=", g_s.obInvalidationBoundary,
                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
                        " resetOn=true");
               // ------------------------------

               g_s.isDoubleOB = false;
               g_s.lastRelevantStructureBar = i;
               g_s.structureConfirmedThisBar = true;
               g_s.drawStructureRenewalLineNow = true;
               g_s.renewalDirection = "bearish";
               g_s.hasPersistedOpposingFVG = false;
               
               g_s.bearishStructureRenewalAlert = true;
               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
               SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);
               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
               g_s.obInvalidationBoundary = i;
               g_s.fvgDetectionBoundary = i;

               g_s.tickOBIsValid                 = true;
               // [Task 155] Buffer 34 provenance capture. Site code 6. No identity
               // is recorded; the export emits the site sentinel -12.0.
               Print("[SRJ][T155][OBPROV] code=6 id=0 bar=", i, " flag=true");
               g_s.tickOBSetterId   = 0;
               g_s.tickOBSetterCode = 6;
               g_s.tickOBSetterBar  = i;
               g_s.tickFVGIsValid                = true;
               // Selective reset: bearish bias renewal zeros bullish (opposing) counter only
               g_s.bullishOBInvalidationCount    = 0;
               g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
               g_s.checklistActivated            = false;
                 
               if(g_htfDebugLog)
                  Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
                        " kind=fvgRenewal",
                        " bias=", g_s.currentBias,
                        " resetOn=true");
              }
           }
         else
           {
            // Opposing FVG under a bullish bias — the 16:05 EURUSD M5 case.
            g_s.hasPersistedOpposingFVG = true;
            SRJ_QueueOpposingPromotion(i,"bearish");
           }
        }
     }
  }

void SRJ_FVG_FillDetectionPass(const double &open[],const double &close[],
                               const double &high[],const double &low[],
                               int i,bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && barClosed && g_imbalances.Total() > 0))
      return;

   double liveClose = close[i];
   double liveOpen  = open[i];

   int n = g_imbalances.Total();
   for(int k=0; k<n; k++)
     {
      CImbalance *fvg = GetFVG(g_imbalances,k);
      if(fvg==NULL) continue;
      //--- [P-FVGVALIDITY E1 / operator 2026-09-11] remainder backfill: live
      //--- instances predating this build carry SRJ_NA_DBL remainders.
      if(SrjIsNa(fvg.remTop) || SrjIsNa(fvg.remBottom))
        {
         fvg.remTop    = fvg.top;
         fvg.remBottom = fvg.bottom;
        }
      //--- Wick coverage shrinks the offered remainder but NEVER kills the FVG
      //--- (§0A: death is body-close-over-midline only). Edge-anchored: only
      //--- coverage connected to an edge eats in; middle-only wicks leave the
      //--- remainder whole (declared limitation, auditable via FVGSHRINK).
      if(i > fvg.detectionBar && fvg.remTop > fvg.remBottom)
        {
         double rTop = fvg.remTop;
         double rBot = fvg.remBottom;
         bool shrinking = false;
         if(low[i] <= rBot && high[i] > rBot)
           {
            rBot = MathMin(rTop, high[i]);
            shrinking = true;
           }
         if(high[i] >= rTop && low[i] < rTop)
           {
            rTop = MathMax(rBot, low[i]);
            shrinking = true;
           }
         if(shrinking)
           {
            fvg.remTop    = rTop;
            fvg.remBottom = rBot;
            if(SRJ_InDebugWindow(i))
               Print("SRJ FVGSHRINK t=", SRJ_BarTimeStr(i), " bar=", i,
                     " objId=", fvg.objId,
                     " remTop=", DoubleToString(rTop, 5),
                     " remBot=", DoubleToString(rBot, 5));
            if(fvg.remTop <= fvg.remBottom && !fvg.isWickFilled)
              {
               fvg.isWickFilled = true;
               fvg.wickFillBar  = i;
               if(SRJ_InDebugWindow(i))
                  Print("SRJ FVGWICKCOVER t=", SRJ_BarTimeStr(i), " bar=", i,
                        " objId=", fvg.objId);
              }
           }
        }
      if(!fvg.isFilled)
        {
         bool bodyFilledMidpoint = false;
         if(fvg.isBullish)
            bodyFilledMidpoint = (liveClose < fvg.midpoint && liveClose < liveOpen);
         else
            bodyFilledMidpoint = (liveClose > fvg.midpoint && liveClose > liveOpen);
         if(bodyFilledMidpoint)
           {
            fvg.isFilled = true;
            fvg.fillBar = i;
            if(SRJ_InDebugWindow(i))
               Print("SRJ FVGBODYKILL t=", SRJ_BarTimeStr(i), " bar=", i,
                     " objId=", fvg.objId,
                     " dir=", (fvg.isBullish ? "bull" : "bear"));
           }
        }
     }
  }

void SRJ_FVG_TickValidRecomputePass(bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))
      return;

   int fvgSearchBoundary = (g_s.currentBias=="bullish") ? g_s.cachedSwingBarBearish
                                                        : g_s.cachedSwingBarBullish;
   if(SrjIsNa(fvgSearchBoundary))
      fvgSearchBoundary = g_s.currentStructureStartBar;

   g_s.tickFVGIsValid = true;

   if(!SrjIsNa(fvgSearchBoundary) && g_imbalances.Total() > 0)
     {
      int  latestBiasFVGBar = SRJ_NA_INT;
      bool latestBiasFVGIsFilled = false;
      int n = g_imbalances.Total();
      for(int k=0; k<n; k++)
        {
         CImbalance *fvg = GetFVG(g_imbalances,k);
         if(fvg==NULL) continue;
         bool isInBias = (g_s.currentBias=="bullish" && fvg.isBullish) ||
                         (g_s.currentBias=="bearish" && !fvg.isBullish);
         bool isWithinBoundary = (fvg.startBar >= fvgSearchBoundary) &&
                                 (fvg.startBar >= g_s.strictLimitBar);
         if(isInBias && isWithinBoundary)
           {
            if(SrjIsNa(latestBiasFVGBar) || fvg.startBar > latestBiasFVGBar)
              {
               latestBiasFVGBar = fvg.startBar;
               latestBiasFVGIsFilled = fvg.isFilled;
              }
           }
        }
      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): anchor-gated search empty is not evidence; search the live structure before defaulting valid.
      if(SrjIsNa(latestBiasFVGBar) && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)
        {
         int m2 = g_imbalances.Total();
         for(int j2=0; j2<m2; j2++)
           {
            CImbalance *fvg3 = GetFVG(g_imbalances,j2);
            if(fvg3==NULL) continue;
            bool b2 = (g_s.currentBias=="bullish" && fvg3.isBullish) || (g_s.currentBias=="bearish" && !fvg3.isBullish);
            if((b2 && fvg3.startBar >= g_s.currentStructureStartBar && fvg3.startBar >= g_s.strictLimitBar) && (SrjIsNa(latestBiasFVGBar) || fvg3.startBar > latestBiasFVGBar))
              {
               latestBiasFVGBar = fvg3.startBar;
               latestBiasFVGIsFilled = fvg3.isFilled;
              }
           }
        }
      if(!SrjIsNa(latestBiasFVGBar))
         g_s.tickFVGIsValid = !latestBiasFVGIsFilled;
     }
  }

void SRJ_FVG_DrawRefreshPass(const datetime &time[],int rates_total,int i,
                             bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_showFVG && g_imbalances.Total() > 0))
      return;

   int n = g_imbalances.Total();
   for(int k=0; k<n; k++)
     {
      CImbalance *fvg = GetFVG(g_imbalances,k);
      if(fvg==NULL) continue;

      bool fvgWithinWindow = (fvg.startBar >= g_s.strictLimitBar);
      if(!fvgWithinWindow)
        {
         if(fvg.HasBox())     { SRJ_DeleteObj(fvg.boxName);     fvg.boxName     = ""; }
         if(fvg.HasMidLine()) { SRJ_DeleteObj(fvg.midLineName); fvg.midLineName = ""; }
        }
      else
        {
         color fillColor;
         color borderColor;

         int maxDrawLimit = (int)MathMax(0, i - 4500);
         int minSafeStart = (int)MathMax(MathMax(0, g_s.strictLimitBar), maxDrawLimit);
         int safeStartBar = (int)MathMax(fvg.startBar, minSafeStart);
         int baseEnd = (int)MathMax(safeStartBar + (fvg.endBar - fvg.startBar),
                                    safeStartBar + 1);

         if(fvg.isFilled)
           {
            fillColor   = SRJ_Opacity(g_invalidatedFVGFillColor,5.0);
            borderColor = g_invalidatedFVGBorderColor;
           }
         else
           {
            fillColor   = SRJ_Opacity(fvg.isBullish ? g_bullishFVGColor : g_bearishFVGColor,5.0);
            borderColor = fvg.isBullish ? g_bullishFVGBorderColor : g_bearishFVGBorderColor;
           }

         if(!fvg.HasBox())
           {
            fvg.boxName = SRJ_DrawBox("FVG",time,rates_total,
                             safeStartBar,fvg.top,baseEnd,fvg.bottom,
                             fillColor,borderColor,g_fvgBorderWidth);
           }
         else
           {
            SRJ_SetBoxBg(fvg.boxName,fillColor);
            SRJ_SetBoxBorderColor(fvg.boxName,borderColor);
            SRJ_SetBoxBorderWidth(fvg.boxName,g_fvgBorderWidth);
           }

         if(g_showMidline)
           {
            if(!fvg.HasMidLine())
              {
               fvg.midLineName = SRJ_DrawTrend("FVGmid",time,rates_total,
                                    safeStartBar,fvg.midpoint,baseEnd,fvg.midpoint,
                                    borderColor,g_fvgBorderWidth,SRJ_STYLE_DASHED,false);
              }
            else
              {
               SRJ_SetTrendX1(fvg.midLineName,time,rates_total,safeStartBar);
               SRJ_SetTrendY1(fvg.midLineName,fvg.midpoint);
               SRJ_SetTrendX2(fvg.midLineName,time,rates_total,baseEnd);
               SRJ_SetTrendY2(fvg.midLineName,fvg.midpoint);
               SRJ_SetTrendColor(fvg.midLineName,borderColor);
               SRJ_SetTrendWidth(fvg.midLineName,g_fvgBorderWidth);
               SRJ_SetTrendStyle(fvg.midLineName,SRJ_STYLE_DASHED);
              }
           }
        }
     }
  }

void SRJ_FVG_PruningPass(bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_imbalances.Total() > 0))
      return;

   for(int k = g_imbalances.Total() - 1; k >= 0; k--)
     {
      CImbalance *fvg = GetFVG(g_imbalances,k);
      if(fvg==NULL) continue;

      if(fvg.startBar < g_s.strictLimitBar)
        {
         if(fvg.HasBox())     { SRJ_DeleteObj(fvg.boxName);     fvg.boxName     = ""; }
         if(fvg.HasMidLine()) { SRJ_DeleteObj(fvg.midLineName); fvg.midLineName = ""; }
         g_imbalances.Delete(k);   
        }
      else
        {
         bool shouldDelete = false;
         if(fvg.isFilled && !SrjIsNa(fvg.fillBar))
           {
            if(g_deleteFVGAfterFill)
               shouldDelete = true;
            else
               shouldDelete = SRJ_FVGOverCap(g_imbalances,k,g_keepInvalidatedFVGCount);
           }

         if(shouldDelete)
           {
            if(fvg.HasBox())     { SRJ_DeleteObj(fvg.boxName);     fvg.boxName     = ""; }
            if(fvg.HasMidLine()) { SRJ_DeleteObj(fvg.midLineName); fvg.midLineName = ""; }
            g_imbalances.Delete(k);
           }
        }
     }
  }

#endif // __SRJ_IMBALANCEMGR_MQH__