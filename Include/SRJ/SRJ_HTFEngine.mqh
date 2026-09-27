#ifndef __SRJ_HTFENGINE_MQH__
#define __SRJ_HTFENGINE_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Text.mqh"
#include "SRJ_Fractals.mqh"

//--- [P-UJIMPL-IMPL-1 v8 IE10B] print-only latch debug (removable; within
//--- ruled verification surface). Per-TF three-slot H4/H1/M15 record.
datetime uj_dbgStamp[3];
int      uj_dbgProcIdx[3];
string   uj_dbgPrevCur[3];
int      uj_dbgReady[3];

class CHTFEngineState : public CObject
  {
public:
   string htfBias;
   int    htfStructStartBar;
   int    htfLastRelStructBar;
   int    htfLastBullOBInv;
   int    htfLastBearOBInv;
   int    htfCachedBull;
   int    htfCachedBear;
   int    htfOBInvBound;
   int    htfFVGDetBound;
   bool   htfTickOBValid;
   bool   htfTickFVGValid;
   bool   htfHasOppFVG;
   int    htfBullOBInvCount;
   int    htfBearOBInvCount;
   bool   htfIsDoubleOB;
   int    htfLastRenewalOBBar;
   bool   htfStructConfirmedThisBar;

   string cBias;
   string c2OB;
   string cLine3;
   string cOpp;

   CArrayObj htf_obs;
   CArrayObj htf_fvgs;

   datetime lastProcessedHTFTime;  
   string   outBias;               
   string   out2OB;
   string   outLine3;
   string   outOpp;
   string   outCBias;              
   string   outC2OB;
   string   outCLine3;
   string   outCOpp;
   bool     initialized;

   CHTFEngineState();
  };

void SRJ_HTF_StateInit(CHTFEngineState &e)
  {
   e.htfBias              = SRJ_NA_STR;
   e.htfStructStartBar    = SRJ_NA_INT;
   e.htfLastRelStructBar  = SRJ_NA_INT;
   e.htfLastBullOBInv     = SRJ_NA_INT;
   e.htfLastBearOBInv     = SRJ_NA_INT;
   e.htfCachedBull        = SRJ_NA_INT;
   e.htfCachedBear        = SRJ_NA_INT;
   e.htfOBInvBound        = SRJ_NA_INT;
   e.htfFVGDetBound       = SRJ_NA_INT;
   e.htfTickOBValid       = true;
   e.htfTickFVGValid      = true;
   e.htfHasOppFVG         = false;
   e.htfBullOBInvCount    = 0;
   e.htfBearOBInvCount    = 0;
   e.htfIsDoubleOB        = false;
   e.htfLastRenewalOBBar  = SRJ_NA_INT;
   e.htfStructConfirmedThisBar = false;

   e.cBias  = "NA";
   e.c2OB   = "NA";
   e.cLine3 = "";
   e.cOpp   = "NA";

   e.htf_obs.FreeMode(true);
   e.htf_fvgs.FreeMode(true);
   e.htf_obs.Clear();
   e.htf_fvgs.Clear();

   e.lastProcessedHTFTime = 0;
   e.outBias = "NA"; e.out2OB = "NA"; e.outLine3 = ""; e.outOpp = "NA";
   e.outCBias = "NA"; e.outC2OB = "NA"; e.outCLine3 = ""; e.outCOpp = "NA";
   e.initialized = true;
  }

CHTFEngineState::CHTFEngineState() { SRJ_HTF_StateInit(this); }

CHTFEngineState g_htfHi;
CHTFEngineState g_htfMid;
CHTFEngineState g_htfLo;

void SRJ_HTF_Init()
  {
   SRJ_HTF_StateInit(g_htfHi);
   SRJ_HTF_StateInit(g_htfMid);
   SRJ_HTF_StateInit(g_htfLo);
  }

void SRJ_HTF_ProcessBar(CHTFEngineState &e,
                        const double &ro[],const double &rh[],
                        const double &rl[],const double &rc[],
                        int j,int htfTotal,int htfLookbackBars,
                        int htfMaxTrackedObjects)
  {
   bool barClosed = (j < htfTotal - 1);

   if(barClosed)
      e.htfStructConfirmedThisBar = false;

   int htfStrictLimitBar = (int)MathMax(0, (htfTotal-1) - htfLookbackBars);
   int htfMaxSafeOffset  = (int)MathMin(MathMin(htfLookbackBars-1, j-1), 500);

   if(barClosed && j >= 2)
     {
      bool isHigh = rh[j-1] > rh[j] && rh[j-1] > rh[j-2];
      bool isLow  = rl[j-1] < rl[j] && rl[j-1] < rl[j-2];

      if(isHigh)
        {
         int    obBar=SRJ_NA_INT; double obHigh=SRJ_NA_DBL,obLow=SRJ_NA_DBL,obOpen=SRJ_NA_DBL;
         if(rc[j-1] > ro[j-1])
           { obBar=j-1; obHigh=rh[j-1]; obLow=rl[j-1]; obOpen=ro[j-1]; }
         if(j >= 3 && rc[j-2] > ro[j-2])
           {
            if(SrjIsNa(obBar) || rh[j-2] > obHigh)
              { obBar=j-2; obHigh=rh[j-2]; obLow=rl[j-2]; obOpen=ro[j-2]; }
           }
         if(!SrjIsNa(obBar))
           {
            double mid = (obHigh+obLow)/2.0;
            double invLvl = MathMax(mid,obOpen);
            e.htf_obs.Add(NewHTFOrderblock(obBar,j-1,obHigh,obLow,obOpen,invLvl,
                                           false,false,false,SRJ_NA_INT,SRJ_NA_INT));
           }
        }

      if(isLow)
        {
         int    obBar=SRJ_NA_INT; double obHigh=SRJ_NA_DBL,obLow=SRJ_NA_DBL,obOpen=SRJ_NA_DBL;
         if(rc[j-1] < ro[j-1])
           { obBar=j-1; obHigh=rh[j-1]; obLow=rl[j-1]; obOpen=ro[j-1]; }
         if(j >= 3 && rc[j-2] < ro[j-2])
           {
            if(SrjIsNa(obBar) || rl[j-2] < obLow)
              { obBar=j-2; obHigh=rh[j-2]; obLow=rl[j-2]; obOpen=ro[j-2]; }
           }
         if(!SrjIsNa(obBar))
           {
            double mid = (obHigh+obLow)/2.0;
            double invLvl = MathMin(mid,obOpen);
            e.htf_obs.Add(NewHTFOrderblock(obBar,j-1,obHigh,obLow,obOpen,invLvl,
                                           true,false,false,SRJ_NA_INT,SRJ_NA_INT));
           }
        }
     }

   int bullInvThisBar = 0;
   int bearInvThisBar = 0;

   if(e.htf_obs.Total() > 0)
     {
      for(int k = e.htf_obs.Total()-1; k >= 0; k--)
        {
         CHTF_Orderblock *ob = GetHTFOB(e.htf_obs,k);
         if(ob==NULL) continue;

         if(!ob.isActivated)
           {
            bool activate = ob.isBullish ? (rh[j] > ob.high) : (rl[j] < ob.low);
            if(activate)
              {
               ob.isActivated = true;
               ob.isValid = true;
               ob.validationBar = j;
              }
           }

         if(barClosed)
           {
            if(ob.isActivated && ob.isValid)
              {
               bool invalid = ob.isBullish ? (rc[j] < ob.invalidationLevel)
                                            : (rc[j] > ob.invalidationLevel);
               if(invalid)
                 {
                  ob.isValid = false;
                  ob.invalidationBar = j;
                  bool refOk = !SrjIsNa(e.htfStructStartBar) &&
                               (ob.invalidationBar >= e.htfStructStartBar);
                  if(refOk)
                    {
                     if((e.htfBias=="bullish" && ob.isBullish) ||
                        (e.htfBias=="bearish" && !ob.isBullish))
                        e.htfTickOBValid = false;
                     else
                        e.htfTickOBValid = true;
                     if(ob.isBullish)
                       { e.htfLastBullOBInv = j; bullInvThisBar += 1; }
                     else
                       { e.htfLastBearOBInv = j; bearInvThisBar += 1; }
                    }
                 }
              }
           }
        }

      if(!SrjIsNa(e.htfLastBullOBInv) && e.htfLastBullOBInv == j)
         e.htfBullOBInvCount += bullInvThisBar;
      if(!SrjIsNa(e.htfLastBearOBInv) && e.htfLastBearOBInv == j)
         e.htfBearOBInvCount += bearInvThisBar;
     }

   if(e.htf_obs.Total() > 0)
     {
      for(int k=0; k<e.htf_obs.Total(); k++)
        {
         CHTF_Orderblock *ob = GetHTFOB(e.htf_obs,k);
         if(ob==NULL) continue;
         if(ob.isActivated && !SrjIsNa(ob.validationBar) && ob.validationBar == j)
           {
            bool isOpp = (e.htfBias=="bullish" && !ob.isBullish) ||
                         (e.htfBias=="bearish" &&  ob.isBullish);
            if(isOpp)
              {
               bool oppFVGExists = false;
               for(int q=0; q<e.htf_fvgs.Total(); q++)
                 {
                  CHTF_Imbalance *fvg = GetHTFFVG(e.htf_fvgs,q);
                  if(fvg==NULL) continue;
                  bool fvgOpp = (e.htfBias=="bullish" && !fvg.isBullish) ||
                                (e.htfBias=="bearish" &&  fvg.isBullish);
                  if(fvgOpp && fvg.startBar > ob.swingBar)
                    { oppFVGExists = true; break; }
                 }
               if(oppFVGExists)
                 {
                  if(e.htfBias=="bullish") e.htfCachedBear = ob.swingBar;
                  else                     e.htfCachedBull = ob.swingBar;
                 }
              }
           }
        }
     }

   if(barClosed && j >= 3)
     {
      if(rl[j] > rh[j-2])
        {
         e.htf_fvgs.Add(NewHTFImbalance(j-2,j,rl[j],rh[j-2],(rl[j]+rh[j-2])/2.0,true,false,SRJ_NA_INT));
         if(e.htfBias=="bullish")
           {
            e.htfTickFVGValid = true;
            int nearestOBStart=-1, nearestValBar=SRJ_NA_INT; bool hasNewOB=false;
            for(int k=0; k<e.htf_obs.Total(); k++)
              {
               CHTF_Orderblock *obc = GetHTFOB(e.htf_obs,k);
               if(obc==NULL) continue;
               bool inB = !SrjIsNa(e.htfOBInvBound) && (obc.startBar >= e.htfOBInvBound);
               if(obc.isBullish && obc.isValid && obc.isActivated && inB)
                 {
                  bool isNew = SrjIsNa(e.htfLastRenewalOBBar) || (obc.validationBar > e.htfLastRenewalOBBar);
                  if(isNew && obc.startBar > nearestOBStart)
                    { nearestOBStart=obc.startBar; nearestValBar=obc.validationBar; hasNewOB=true; }
                 }
              }
            if(hasNewOB)
              {
               e.htfIsDoubleOB=false; e.htfLastRelStructBar=j; e.htfHasOppFVG=false;
               e.htfLastRenewalOBBar=nearestValBar; e.htfOBInvBound=j; e.htfFVGDetBound=j;
               e.htfStructConfirmedThisBar=true;
              }
           }
         else if(!SrjIsNa(e.htfBias))
            e.htfHasOppFVG = true;
        }

      if(rh[j] < rl[j-2])
        {
         e.htf_fvgs.Add(NewHTFImbalance(j-2,j,rl[j-2],rh[j],(rl[j-2]+rh[j])/2.0,false,false,SRJ_NA_INT));
         if(e.htfBias=="bearish")
           {
            e.htfTickFVGValid = true;
            int nearestOBStart=-1, nearestValBar=SRJ_NA_INT; bool hasNewOB=false;
            for(int k=0; k<e.htf_obs.Total(); k++)
              {
               CHTF_Orderblock *obc = GetHTFOB(e.htf_obs,k);
               if(obc==NULL) continue;
               bool inB = !SrjIsNa(e.htfOBInvBound) && (obc.startBar >= e.htfOBInvBound);
               if(!obc.isBullish && obc.isValid && obc.isActivated && inB)
                 {
                  bool isNew = SrjIsNa(e.htfLastRenewalOBBar) || (obc.validationBar > e.htfLastRenewalOBBar);
                  if(isNew && obc.startBar > nearestOBStart)
                    { nearestOBStart=obc.startBar; nearestValBar=obc.validationBar; hasNewOB=true; }
                 }
              }
            if(hasNewOB)
              {
               e.htfIsDoubleOB=false; e.htfLastRelStructBar=j; e.htfHasOppFVG=false;
               e.htfLastRenewalOBBar=nearestValBar; e.htfOBInvBound=j; e.htfFVGDetBound=j;
               e.htfStructConfirmedThisBar=true;
              }
           }
         else if(!SrjIsNa(e.htfBias))
            e.htfHasOppFVG = true;
        }
     }

   bool htfHasBias = !SrjIsNa(e.htfBias);
   int searchBound = (e.htfBias=="bullish") ? e.htfCachedBear : e.htfCachedBull;
   if(SrjIsNa(searchBound)) searchBound = e.htfStructStartBar;
   if(htfHasBias) e.htfTickFVGValid = true;

   int  latestFVGBar = SRJ_NA_INT;
   bool latestFVGIsFilled = false;
   if((barClosed || htfHasBias) && e.htf_fvgs.Total() > 0)
     {
      for(int k=0; k<e.htf_fvgs.Total(); k++)
        {
         CHTF_Imbalance *fvg = GetHTFFVG(e.htf_fvgs,k);
         if(fvg==NULL) continue;
         if(barClosed && !fvg.isFilled)
           {
            bool filled = fvg.isBullish ? (rc[j] < fvg.midpoint && rc[j] < ro[j])
                                        : (rc[j] > fvg.midpoint && rc[j] > ro[j]);
            if(filled) { fvg.isFilled=true; fvg.fillBar=j; }
           }
         if(htfHasBias && !SrjIsNa(searchBound))
           {
            bool inB = (e.htfBias=="bullish" && fvg.isBullish) ||
                       (e.htfBias=="bearish" && !fvg.isBullish);
            if(inB && fvg.startBar >= searchBound && fvg.startBar >= htfStrictLimitBar)
              {
               if(SrjIsNa(latestFVGBar) || fvg.startBar > latestFVGBar)
                 { latestFVGBar = fvg.startBar; latestFVGIsFilled = fvg.isFilled; }
              }
           }
        }
     }
   if(htfHasBias && !SrjIsNa(latestFVGBar))
      e.htfTickFVGValid = !latestFVGIsFilled;

   if(barClosed && j >= 2)
     {
      bool bullStr=false, bearStr=false;
      if(rh[j-1] > rh[j] && rh[j-1] > rh[j-2])
        {
         if(!SrjIsNa(e.htfCachedBear))
           {
            int offset = j - e.htfCachedBear;
            if(offset >= 0 && offset <= htfMaxSafeOffset)
              { if(rh[j-1] < rh[j-offset]) bearStr = true; }
            else bearStr = true;
           }
         else bearStr = true;
        }
      if(rl[j-1] < rl[j] && rl[j-1] < rl[j-2])
        {
         if(!SrjIsNa(e.htfCachedBull))
           {
            int offset = j - e.htfCachedBull;
            if(offset >= 0 && offset <= htfMaxSafeOffset)
              { if(rl[j-1] > rl[j-offset]) bullStr = true; }
            else bullStr = true;
           }
         else bullStr = true;
        }

      if(bullStr || bearStr)
        {
         string newB = bullStr ? "bullish" : "bearish";
         if(SrjIsNa(e.htfBias))
           {
            e.htfBias=newB; e.htfStructStartBar=j; e.htfLastRelStructBar=j;
            e.htfOBInvBound=j; e.htfFVGDetBound=j; e.htfStructConfirmedThisBar=true;
           }
        }
     }

   if(!SrjIsNa(e.htfBias))
     {
      int oppCount = (e.htfBias=="bullish") ? e.htfBearOBInvCount : e.htfBullOBInvCount;
      int inBiasCount = (e.htfBias=="bullish") ? e.htfBullOBInvCount : e.htfBearOBInvCount;
      bool doRenew  = (oppCount >= 2);
      bool doStrong = (inBiasCount >= 2);
      bool doWeak   = (!e.htfTickOBValid) && (!e.htfTickFVGValid) && e.htfHasOppFVG;

      if(doRenew)
        {
         e.htfLastRelStructBar=j; e.htfIsDoubleOB=true; e.htfOBInvBound=j; e.htfFVGDetBound=j;
         e.htfTickOBValid=true; e.htfTickFVGValid=true; e.htfHasOppFVG=false;
         e.htfBullOBInvCount=0; e.htfBearOBInvCount=0; e.htfLastRenewalOBBar=SRJ_NA_INT;
         e.htfStructConfirmedThisBar=true;
        }
      else if(doStrong || doWeak)
        {
         e.htfBias = (e.htfBias=="bullish") ? "bearish" : "bullish";
         e.htfStructStartBar=j; e.htfLastRelStructBar=j; e.htfIsDoubleOB=doStrong;
         e.htfOBInvBound=j; e.htfFVGDetBound=j;
         e.htfTickOBValid=true; e.htfTickFVGValid=true; e.htfHasOppFVG=false;
         e.htfBullOBInvCount=0; e.htfBearOBInvCount=0; e.htfLastRenewalOBBar=SRJ_NA_INT;
         e.htfStructConfirmedThisBar=true;
        }
     }

   if(e.htf_obs.Total() > 0)
     {
      for(int k = e.htf_obs.Total()-1; k >= 0; k--)
        {
         CHTF_Orderblock *obP = GetHTFOB(e.htf_obs,k);
         if(obP==NULL) continue;
         if(obP.startBar < htfStrictLimitBar && !(obP.isValid && obP.isActivated))
            e.htf_obs.Delete(k);
        }
     }
   while(e.htf_obs.Total() > htfMaxTrackedObjects * 10)
      e.htf_obs.Delete(0);

   if(e.htf_fvgs.Total() > 0)
     {
      for(int k = e.htf_fvgs.Total()-1; k >= 0; k--)
        {
         CHTF_Imbalance *fvgP = GetHTFFVG(e.htf_fvgs,k);
         if(fvgP==NULL) continue;
         if(fvgP.startBar < htfStrictLimitBar && fvgP.isFilled)
            e.htf_fvgs.Delete(k);
        }
     }
   while(e.htf_fvgs.Total() > htfMaxTrackedObjects * 10)
      e.htf_fvgs.Delete(0);

   bool obExists = false;
   for(int k=0; k<e.htf_obs.Total(); k++)
     {
      CHTF_Orderblock *ob = GetHTFOB(e.htf_obs,k);
      if(ob==NULL) continue;
      bool matchesBias = (e.htfBias=="bullish" && ob.isBullish) ||
                         (e.htfBias=="bearish" && !ob.isBullish);
      if(matchesBias && ob.isValid && ob.isActivated &&
         !SrjIsNa(e.htfOBInvBound) && ob.startBar >= e.htfOBInvBound)
        { obExists = true; break; }
     }

   int fBound = (e.htfBias=="bullish") ? e.htfCachedBear : e.htfCachedBull;
   if(SrjIsNa(fBound)) fBound = e.htfStructStartBar;

   bool fvgExists = false;
   bool fvgExistsForDisplay = false;
   if(e.htf_fvgs.Total() > 0)
     {
      if(e.htfIsDoubleOB)
        {
         if(!SrjIsNa(fBound))
           {
            for(int k=0; k<e.htf_fvgs.Total(); k++)
              {
               CHTF_Imbalance *fvg = GetHTFFVG(e.htf_fvgs,k);
               if(fvg==NULL) continue;
               bool matchesBias = (e.htfBias=="bullish" && fvg.isBullish) ||
                                  (e.htfBias=="bearish" && !fvg.isBullish);
               if(matchesBias && fvg.detectionBar >= fBound && fvg.detectionBar >= htfStrictLimitBar)
                 {
                  if(!fvgExistsForDisplay) fvgExistsForDisplay = true;
                  if(!fvg.isFilled && !fvgExists) fvgExists = true;
                  if(fvgExists && fvgExistsForDisplay) break;
                 }
              }
           }
        }
      else
        {
         for(int k=0; k<e.htf_fvgs.Total(); k++)
           {
            CHTF_Imbalance *fvg = GetHTFFVG(e.htf_fvgs,k);
            if(fvg==NULL) continue;
            bool matchesBias = (e.htfBias=="bullish" && fvg.isBullish) ||
                               (e.htfBias=="bearish" && !fvg.isBullish);
            if(matchesBias && !SrjIsNa(fBound) &&
               fvg.startBar >= fBound && fvg.startBar >= htfStrictLimitBar)
              { fvgExists = true; break; }
           }
         fvgExistsForDisplay = fvgExists;
        }
     }

   bool htfIsInit = ((j == e.htfStructStartBar) ||
                     (j == e.htfLastRelStructBar && e.htfStructConfirmedThisBar));
   bool htfChecklistActive = (!e.htfTickOBValid) || (!e.htfTickFVGValid) || e.htfHasOppFVG;

   string retBias = SrjIsNa(e.htfBias) ? "NA" : (e.htfBias=="bullish" ? "Bull" : "Bear");
   string ret2OB  = e.htfIsDoubleOB ? SRJ_2OB() : "NA";
   string retOpp  = e.htfHasOppFVG  ? SRJ_REV() : "NA";
   bool fvgForText = e.htfIsDoubleOB ? fvgExistsForDisplay : fvgExists;
   string retLine3 = SrjIsNa(e.htfBias) ? "" :
                     SRJ_buildStatusLine3(obExists,fvgForText,e.htfTickOBValid,
                                          e.htfTickFVGValid,e.htfIsDoubleOB,
                                          htfChecklistActive,htfIsInit);

   e.outBias  = retBias;
   e.out2OB   = ret2OB;
   e.outLine3 = retLine3;
   e.outOpp   = retOpp;

   if(barClosed)
     {
      e.cBias = retBias; e.c2OB = ret2OB; e.cLine3 = retLine3; e.cOpp = retOpp;
      e.outCBias = e.cBias; e.outC2OB = e.c2OB; e.outCLine3 = e.cLine3; e.outCOpp = e.cOpp;
     }
  }

void SRJ_HTF_RunOne(CHTFEngineState &e,ENUM_TIMEFRAMES tf,
                    int htfLookbackBars,int htfMaxTrackedObjects,
                    datetime chartTime)
  {
   int availableBars = Bars(_Symbol, tf);
   int barsToFetch = (int)MathMin(htfLookbackBars, availableBars);
   if(barsToFetch <= 3)
     {
      if(g_htfDebugLog)
         Print("SRJ HTF [",EnumToString(tf),"]: SKIPPED — availableBars=",availableBars," barsToFetch=",barsToFetch," (need >3)");
      return;
     }

   MqlRates rr[];
   ArraySetAsSeries(rr,false);
   int copied = CopyRates(_Symbol, tf, 0, barsToFetch, rr);
   if(copied <= 3)
     {
      if(g_htfDebugLog)
         Print("SRJ HTF [",EnumToString(tf),"]: SKIPPED — CopyRates returned ",copied," bars, error=",GetLastError());
      return;
     }

   datetime newestHTFTime = rr[copied-1].time;
   bool everSucceeded = (e.lastProcessedHTFTime != 0);

   if(everSucceeded)
     {
      if(newestHTFTime == e.lastProcessedHTFTime)
         return;
      if(g_ratesTotal > 0 && !g_newBar)
         return;
     }

   double ro[]; double rh[]; double rl[]; double rc[];
   ArrayResize(ro,copied); ArrayResize(rh,copied);
   ArrayResize(rl,copied); ArrayResize(rc,copied);
   for(int k=0; k<copied; k++)
     { ro[k]=rr[k].open; rh[k]=rr[k].high; rl[k]=rr[k].low; rc[k]=rr[k].close; }

    SRJ_HTF_StateInit(e);
    for(int j=2; j<copied; j++)
       SRJ_HTF_ProcessBar(e,ro,rh,rl,rc,j,copied,htfLookbackBars,htfMaxTrackedObjects);

    //--- [P-UJIMPL-IMPL-1 v8 IE10B] stamp the per-TF latch record in RunOne
    //--- (prev/cur pair captured before the lastProcessed update below).
      {
       int uj_slot = ((tf == PERIOD_H4) ? 0 : ((tf == PERIOD_H1) ? 1 : 2));
       uj_dbgStamp[uj_slot] = chartTime;
       uj_dbgProcIdx[uj_slot] = copied;
       uj_dbgPrevCur[uj_slot] = StringFormat("%s/%s",
          TimeToString(e.lastProcessedHTFTime, TIME_DATE|TIME_MINUTES),
          TimeToString(newestHTFTime, TIME_DATE|TIME_MINUTES));
       uj_dbgReady[uj_slot] = (everSucceeded ? 1 : 0);
      }

    e.lastProcessedHTFTime = newestHTFTime;

   if(g_htfDebugLog)
      Print("SRJ HTF [",EnumToString(tf),"]: processed ",copied," bars (of ",availableBars," available) — resulting htfBias=",e.htfBias," outBias=",e.outBias);
  }

void SRJ_HTF_RunAll(int htfLookbackBars,int htfMaxTrackedObjects,
                    bool useConfirmedHTFOnly,datetime chartTime)
  {
    SRJ_HTF_RunOne(g_htfHi, g_htfHighTF, htfLookbackBars,htfMaxTrackedObjects,chartTime);
    SRJ_HTF_RunOne(g_htfMid,g_htfMidTF,  htfLookbackBars,htfMaxTrackedObjects,chartTime);
    SRJ_HTF_RunOne(g_htfLo, g_htfLowTF,  htfLookbackBars,htfMaxTrackedObjects,chartTime);
    //--- [P-UJIMPL-IMPL-1 v8 IE10B] RunAll-tail latch print (print-only;
    //--- join mapping: chartTime here vs EA bar-time with the one-bar slot lag
    //--- F1072-1075 target=i-1, carried in the EA tuple; no 5-minute subtraction).
    if(g_htfDebugLog)
       PrintFormat("SRJ-HTF-UJDBG chart=%s h4stamp=%s h4idx=%d h4prevcur=%s h4ready=%d h4out=%s/%s h1stamp=%s h1idx=%d h1prevcur=%s h1ready=%d h1out=%s/%s m15stamp=%s m15idx=%d m15prevcur=%s m15ready=%d m15out=%s/%s",
                   TimeToString(chartTime, TIME_DATE|TIME_MINUTES),
                   TimeToString(uj_dbgStamp[0], TIME_DATE|TIME_MINUTES), uj_dbgProcIdx[0], uj_dbgPrevCur[0], uj_dbgReady[0], g_htfHi.outBias, g_htfHi.outCBias,
                   TimeToString(uj_dbgStamp[1], TIME_DATE|TIME_MINUTES), uj_dbgProcIdx[1], uj_dbgPrevCur[1], uj_dbgReady[1], g_htfMid.outBias, g_htfMid.outCBias,
                   TimeToString(uj_dbgStamp[2], TIME_DATE|TIME_MINUTES), uj_dbgProcIdx[2], uj_dbgPrevCur[2], uj_dbgReady[2], g_htfLo.outBias, g_htfLo.outCBias);
   }

void SRJ_HTF_GetOutputs(CHTFEngineState &e,bool useConfirmed,
                        string &bias,string &twoOB,string &line3,string &opp)
  {
   if(useConfirmed)
     { bias=e.outCBias; twoOB=e.outC2OB; line3=e.outCLine3; opp=e.outCOpp; }
   else
     { bias=e.outBias;  twoOB=e.out2OB;  line3=e.outLine3;  opp=e.outOpp; }
  }

#endif // __SRJ_HTFENGINE_MQH__