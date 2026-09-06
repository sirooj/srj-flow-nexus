#ifndef __SRJ_BIASENGINE_MQH__
#define __SRJ_BIASENGINE_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Fractals.mqh"

// --- Forward declarations ---
string SRJ_BarTimeStr(const int bar);
bool SRJ_InDebugWindow(const int bar);
void SRJ_QueueNearestPromotion(const int i,const string bias,
                               const int boundary,const int slot);
void SRJ_promotionReconcile(int i,string mode,string bias,int boundary,int lockedTargetBar);
// ----------------------------

void SRJ_Bias_PerBarResetPass(bool barClosed)
  {
   g_s.structureConfirmedThisBar     = false;
   g_s.wasBiasFlip                   = false;
   g_s.oldBias                       = SRJ_NA_STR;
   g_s.initialBiasJustSet            = false;
   g_s.drawBiasLineNow               = false;
   g_s.newBiasDirection              = SRJ_NA_STR;
   g_s.suppressBiasPaneStatusThisBar = false;
   
   g_s.drawStructureRenewalLineNow = false;
   
   g_s.weakFlipPreconditionMet       = false;  // NEW: reset per-bar
      
   g_s.renewalDirection              = SRJ_NA_STR;
   g_s.bullishBiasFlipAlert          = false;
   g_s.bearishBiasFlipAlert          = false;
   g_s.bullishStructureRenewalAlert  = false;
   g_s.bearishStructureRenewalAlert  = false;
   g_s.bullishOBCountedThisBar       = false;
   g_s.bearishOBCountedThisBar       = false;

   if(barClosed)
     {
      g_s.justChangedBias               = false;
      g_s.bullishOBInvalidationsThisBar = 0;
      g_s.bearishOBInvalidationsThisBar = 0;
     }
  }

void SRJ_Bias_StructureDetectionPass(const double &high[],const double &low[],
                                     int i,int finalLookback,
                                     bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && barClosed && i >= 2))
      return;

   bool bullishStructureNow = false;
   bool bearishStructureNow = false;
   int maxAnchorOffset = finalLookback;
   int maxSafeOffset = (int)MathMin(MathMin(maxAnchorOffset - 1, i - 1), 500);

   if(SRJ_isStrictFractalLow(low,i,1))
     {
      if(!SrjIsNa(g_s.cachedSwingBarBullish))
        {
         bool swingInWindow = (g_s.cachedSwingBarBullish > g_s.strictLimitBar);
         if(swingInWindow)
           {
            int offsetBull = i - g_s.cachedSwingBarBullish;
            if(offsetBull >= 0 && offsetBull <= maxSafeOffset)
              {
               double recentLow = srjL(low,i,1);
               double anchorLow = srjL(low,i,offsetBull);
               if(recentLow > anchorLow)
                  bullishStructureNow = true;
              }
            else
              {
               bullishStructureNow = true;
              }
           }
         else
           {
            bullishStructureNow = true;
           }
        }
      else
        {
         bullishStructureNow = true;
        }
     }

   if(SRJ_isStrictFractalHigh(high,i,1))
     {
      if(!SrjIsNa(g_s.cachedSwingBarBearish))
        {
         bool swingInWindow = (g_s.cachedSwingBarBearish > g_s.strictLimitBar);
         if(swingInWindow)
           {
            int offsetBear = i - g_s.cachedSwingBarBearish;
            if(offsetBear >= 0 && offsetBear <= maxSafeOffset)
              {
               double recentHigh = srjH(high,i,1);
               double anchorHigh = srjH(high,i,offsetBear);
               if(recentHigh < anchorHigh)
                  bearishStructureNow = true;
              }
            else
              {
               bearishStructureNow = true;
              }
           }
         else
           {
            bearishStructureNow = true;
           }
        }
      else
        {
         bearishStructureNow = true;
        }
     }

   if(bullishStructureNow || bearishStructureNow)
     {
      g_s.oldBias = g_s.currentBias;
      string detectedBias = bullishStructureNow ? "bullish" : "bearish";
      if(SrjIsNa(g_s.currentBias))
        {
         g_s.currentBias = detectedBias;
         g_s.currentStructureStartBar = i;
         g_s.lastRelevantStructureBar = i;
         g_s.structureConfirmedThisBar = true;
         g_s.drawBiasLineNow = true;
         g_s.newBiasDirection = detectedBias;
         g_s.obInvalidationBoundary = i;
         g_s.fvgDetectionBoundary = i;
         g_s.currentLegHasXOB = false;   // [Section 8] new leg, no promoted XOB yet
         g_s.structLegBoundary = i;   // [EA-30] initial bias opens the first structural leg
         g_s.initialBiasJustSet = true;
        }
      else if(detectedBias != g_s.currentBias)
        {
         g_s.wasBiasFlip = g_s.wasBiasFlip;   
        }
      else
        {
         g_s.wasBiasFlip = g_s.wasBiasFlip;   
        }
     }
  }

void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)
  {
   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))
      return;

   g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||
                            g_s.hasPersistedOpposingFVG;

   int currentOpposingCount = (g_s.currentBias=="bullish")
                              ? g_s.bearishOBInvalidationCount
                              : g_s.bullishOBInvalidationCount;
   bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;

   int currentInBiasCount = (g_s.currentBias=="bullish")
                            ? g_s.bullishOBInvalidationCount
                            : g_s.bearishOBInvalidationCount;
   bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;

   // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.
   // The latch captures the state before FVG renewal resets; the live check captures
   // any weak signal that becomes true during this bar's FVG or fill passes.
   bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||
                           ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&
                            g_s.hasPersistedOpposingFVG);

   int countReferenceBar = g_s.currentStructureStartBar;

   if(SRJ_InDebugWindow(i))
     {
      Print("SRJ DEC t=", SRJ_BarTimeStr(i),
            " bar=", i,
            " biasBefore=", g_s.currentBias,
            " inBias=", currentInBiasCount,
            " opp=", currentOpposingCount,
            " bull=", g_s.bullishOBInvalidationCount,
            " bear=", g_s.bearishOBInvalidationCount,
            " structStart=", g_s.currentStructureStartBar,
            " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),
            " countRef=", countReferenceBar,
            " countRefT=", SRJ_BarTimeStr(countReferenceBar),
            " lastRelStruct=", g_s.lastRelevantStructureBar,
            " obInvBound=", g_s.obInvalidationBoundary,
            " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
            " lastRenewalOB=", g_s.lastRenewalOBBar,
            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
            " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),
            " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
            " strong=", (doStrongFlip ? 1 : 0),
            " renew=", (doRenewal ? 1 : 0),
            " weak=", (doWeakSignalFlip ? 1 : 0));

      Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),
            " bar=", i,
            " oppCount=", currentOpposingCount,
            " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),
            " renewResult=", (doRenewal ? 1 : 0),
            " inBiasCount=", currentInBiasCount,
            " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),
            " strongResult=", (doStrongFlip ? 1 : 0),
            " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),
            " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),
            " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
            " weakResult=", (doWeakSignalFlip ? 1 : 0));
     }

   if(doRenewal)
     {
      g_s.lastRelevantStructureBar = i;
      g_s.structureConfirmedThisBar = true;
      g_s.wasBiasFlip = false;
      g_s.drawStructureRenewalLineNow = true;
      g_s.renewalDirection = g_s.currentBias;
      g_s.isDoubleOB = true;
      g_s.suppressBiasPaneStatusThisBar = true;
      g_s.obInvalidationBoundary = i;
      g_s.fvgDetectionBoundary = i;
      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)
      g_s.tickOBIsValid = true;
      g_s.tickFVGIsValid = true;
      g_s.hasPersistedOpposingFVG = false;
      
      // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
      // In-bias invalidations continue to accumulate toward the next strong flip.
      if(g_s.currentBias == "bullish")
        {
         // Bullish renewal: reset bearish (opposing) counter only
         g_s.bearishOBInvalidationCount = 0;
         g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
        }
      else
        {
         // Bearish renewal: reset bullish (opposing) counter only
         g_s.bullishOBInvalidationCount = 0;
         g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
        }

      g_s.checklistActivated = false;
      if(g_s.currentBias == "bullish")
         g_s.bullishStructureRenewalAlert = true;
      else
         g_s.bearishStructureRenewalAlert = true;

      if(g_htfDebugLog)
         Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
               " kind=doRenewal",
               " bias=", g_s.currentBias,
               " resetOn=true");
     }
   else if(doStrongFlip || doWeakSignalFlip)
     {
      string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
      g_s.currentBias = nextBias;
      g_s.currentStructureStartBar = i;
      g_s.lastRelevantStructureBar = i;
      g_s.structureConfirmedThisBar = true;
      g_s.wasBiasFlip = true;
      g_s.drawBiasLineNow = true;
      g_s.newBiasDirection = nextBias;
      if(doStrongFlip)
        {
         g_s.isDoubleOB = true;
         g_s.suppressBiasPaneStatusThisBar = true;
        }
      else
        {
         g_s.isDoubleOB = false;
        }
      g_s.obInvalidationBoundary = i;
      g_s.fvgDetectionBoundary = i;
      g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg
      g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg
      g_s.tickOBIsValid = true;
      g_s.tickFVGIsValid = true;
      g_s.hasPersistedOpposingFVG = false;
      g_s.bullishOBInvalidationCount = 0;
      g_s.bearishOBInvalidationCount = 0;
      g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
      g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
      g_s.checklistActivated = false;
      if(nextBias == "bullish")
         g_s.bullishBiasFlipAlert = true;
      else
         g_s.bearishBiasFlipAlert = true;

      string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
      if(g_htfDebugLog)
         Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
               " kind=", flipKind,
               " bias=", g_s.currentBias,
               " resetOn=true");
     }

   if(doRenewal)
     {
      // Renewals always take all-mode path, even if a weak signal also fired this bar.
      // Resolve any pending slot-2 promotion from an earlier bar first.
      // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
      // created on an earlier bar is not in g_intrabarObjects, so an intrabar
      // width change would survive the snapshot rollback while isPromoted reverts.
      if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
         SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
                                g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);

      g_s.pendingPromoteBar2       = i;
      g_s.pendingPromoteBias2      = g_s.currentBias;
      g_s.pendingPromoteMode2      = "all";
      g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
      g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
     }
   else if(doStrongFlip)
     {
      // Strong flips also use all-mode.
      // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
      // created on an earlier bar is not in g_intrabarObjects, so an intrabar
      // width change would survive the snapshot rollback while isPromoted reverts.
      if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
         SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
                                g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);

      g_s.pendingPromoteBar2       = i;
      g_s.pendingPromoteBias2      = g_s.currentBias;
      g_s.pendingPromoteMode2      = "all";
      g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
      g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
     }
   else if(doWeakSignalFlip || g_s.initialBiasJustSet)
     {
      // Weak signals promote NEW-bias OBs (the side that survived and now defines the bias).
      // At this point g_s.currentBias has already been flipped to the new bias.
      // Initial bias also promotes the current (new) bias.
      SRJ_QueueNearestPromotion(i,g_s.currentBias,SRJ_NA_INT,2);
     }

   // Invariant: a structural renewal only ever runs in the direction of the bias
   // that is live at the end of this bar.  SRJ_FVG_CreationRenewalPass runs earlier
   // in the bar and can raise the flag against the pre-decision bias; if a flip
   // then lands on the same bar, that flag now points the wrong way.  Drop it
   // rather than draw a renewal against the new bias, and withdraw the alert it
   // would have fired.
   if(g_s.drawStructureRenewalLineNow &&
      !SrjIsNa(g_s.renewalDirection) &&
      g_s.renewalDirection != g_s.currentBias)
     {
      if(SRJ_InDebugWindow(i))
         Print("SRJ RENEWAL-DROP t=", SRJ_BarTimeStr(i), " bar=", i,
               " renewalDir=", g_s.renewalDirection,
               " bias=", g_s.currentBias,
               " reason=directionMismatch");

      g_s.drawStructureRenewalLineNow  = false;
      g_s.renewalDirection             = SRJ_NA_STR;
      g_s.bullishStructureRenewalAlert = false;
      g_s.bearishStructureRenewalAlert = false;
     }

   if(SRJ_InDebugWindow(i))
      Print("SRJ DEC2 t=", SRJ_BarTimeStr(i),
            " bar=", i,
            " biasAfterDecision=", g_s.currentBias,
            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
            " obInvBound=", g_s.obInvalidationBoundary,
            " lastRenewalOB=", g_s.lastRenewalOBBar);
  }

//+------------------------------------------------------------------+
//| Latch weak-flip precondition before renewal resets clear flags. |
//+------------------------------------------------------------------+
void SRJ_Bias_WeakFlipLatchPass()
  {
   if(SrjIsNa(g_s.currentBias))
      return;
   
   // Latch the weak-flip condition if all three preconditions are met
   if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG)
      g_s.weakFlipPreconditionMet = true;
  }

#endif // __SRJ_BIASENGINE_MQH__