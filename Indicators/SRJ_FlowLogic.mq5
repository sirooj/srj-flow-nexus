//+------------------------------------------------------------------+
//|                                                SRJ_FlowLogic.mq5 |
//|      SRJ Flow Logic Auto — Pine v6 -> MQL5 port (Main)          |
//+------------------------------------------------------------------+
#property copyright "SRJ Flow Logic Auto — Pine v6 port"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 48  // [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
#property indicator_plots   2

#property indicator_label1  "Fractal High"
#property indicator_type1   DRAW_ARROW
#property indicator_label2  "Fractal Low"
#property indicator_type2   DRAW_ARROW

#include <SRJ/SRJ_Types.mqh>
#include <SRJ/SRJ_State.mqh>
#include <SRJ/SRJ_Text.mqh>
#include <SRJ/SRJ_Fractals.mqh>
#include <SRJ/SRJ_Draw.mqh>
#include <SRJ/SRJ_Alerts.mqh>
#include <SRJ/SRJ_OrderblockMgr.mqh>
#include <SRJ/SRJ_ImbalanceMgr.mqh>
#include <SRJ/SRJ_BiasEngine.mqh>
#include <SRJ/SRJ_Sessions.mqh>
#include <SRJ/SRJ_HTFEngine.mqh>
#include <SRJ/SRJ_Panels.mqh>

// [NEW] Export buffer array declarations
double g_bufBias[];
double g_bufOBValid[];
double g_bufFVGValid[];
double g_bufOppFVG[];
double g_bufSwingHigh[];
double g_bufSwingLow[];
double g_bufPrevDayHigh[];
double g_bufPrevDayLow[];
double g_bufAsiaHigh[];
double g_bufAsiaLow[];
double g_bufLondonHigh[];
double g_bufLondonLow[];
double g_bufNyHigh[];
double g_bufNyLow[];
double g_bufPmHigh[];
double g_bufPmLow[];
// [TP-DATA-SOURCE-COMPLETE-001] previous-day session H/L exports (shadow-first:
// reads + prints only downstream). Values ride g_s.prev{Asia,London,Ny,Pm}{High,Low},
// cached at session rollover (SRJ_Sessions.mqh); day-rollover does not reset them.
double g_bufPdAsiaHigh[];
double g_bufPdAsiaLow[];
double g_bufPdLondonHigh[];
double g_bufPdLondonLow[];
double g_bufPdNyHigh[];
double g_bufPdNyLow[];
double g_bufPdPmHigh[];
double g_bufPdPmLow[];
double g_bufSweepTag[];
double g_bufHtfHi[];
double g_bufHtfMid[];
double g_bufHtfLo[];

// [Section 8] XOB "in play" (regardless of age) + FVG-to-XOB leg lineage.
double g_bufXobZoneHigh[];
double g_bufXobZoneLow[];
double g_bufFvgLegZoneHigh[];
double g_bufFvgLegZoneLow[];

// [Task 25] Stop-loss structural reference — see the export block in OnCalculate.
double g_bufObStructExtreme[];
double g_bufObSwingExtreme[];

// [Task 27] Structural-renewal boundary (Part A ruling 4: all five boundary
// events count). Exported as the SERVER-TIME datetime of the boundary bar cast
// to double, not as a raw bar index — a bar index is meaningless to any reader
// that does not share FlowLogic's rates_total frame, and a double holds a Unix
// timestamp exactly. 0.0 means no boundary set yet, or the index is out of range.
// EMPTY_VALUE is deliberately NOT the sentinel here: 2147483647 is a plausible
// datetime and would be indistinguishable from real data.
double g_bufRenewalBoundaryTime[];

// [Task 39 / EA-26 + EA-51] Packed swept-state + session-live mask for the EA's
// take-profit filter. Integer packed into a double (14 bits, held exactly).
//   bits 0..9  swept flags, in the EA's sessbufs[] order:
//     0 PD.H  1 PD.L  2 AS.H  3 AS.L  4 LD.H  5 LD.L  6 NY.H  7 NY.L  8 PM.H  9 PM.L
//   bits 10..13 session currently live: 10 Asia  11 London  12 NY  13 PM
//     (previous-day levels are never live, so PD has no live bit.)
// EMPTY_VALUE = not ready; a real mask of 0 (nothing swept, no live session) is
// a valid, distinct value, which is why 0.0 is NOT the sentinel here.
double g_bufSweptMask[];

// [Task 50 / EA-59b] Structural-leg boundary time. Exported so the EA can bound
// its Option-B backward touch scan to the current structural leg. Same encoding
// as buffer 28: the SERVER-TIME datetime of the boundary bar cast to double.
// 0.0 means unset or out of range. EMPTY_VALUE is deliberately NOT the sentinel
// here — 2147483647 is a plausible datetime.
// This carries structLegBoundary (the STRUCTURAL boundary), deliberately NOT
// obInvalidationBoundary (the CHECKLIST boundary that buffer 28 already carries).
// The two are different by operator ruling and must not be conflated.
double g_bufStructLegTime[];

// [Task 102] Structural identity of the two zones exported on buffers 22/23 and
// 24/25. Carries COrderblock.objId and CImbalance.objId (assigned in Task 98a)
// cast to double, so the EA can tell whether the zone it is bound to is still
// the SAME object or has been silently replaced by a different one at the same
// or a different price. Written from the same object pointer that writes the
// bounds, in the same branch, so the id and the bounds can never describe
// different objects.
// 0.0 = no object selected. SRJ_NextObjId() starts at 1, so 0 is never a real
// id. EMPTY_VALUE is deliberately NOT the sentinel: it is a plausible integer.
// Ids are unique for the life of a run but NOT stable across a full recalc
// (SRJ_StateInit destroys every object and restarts the counter) — see EA-109.
// Read-only query. Nothing in this indicator consumes either buffer.
double g_bufXobObjId[];
double g_bufFvgObjId[];

// [Task 113] Promotion time of the order block exported on buffers 22/23/31.
// Carries COrderblock.promotionBar (Task 110) converted to a SERVER-TIME
// datetime and cast to double, the same encoding buffers 28 and 30 use.
// 0.0 = unset, meaning either no object selected or that object has never been
// promoted. EMPTY_VALUE is deliberately NOT the sentinel: 2147483647 is a
// plausible datetime and would be indistinguishable from real data.
// Written from the SAME object pointer that writes the bounds on 22/23 and the
// id on 31, inside the SAME branch, so the promotion time can never describe a
// different object than the bounds or the id of the same slot.
// Under Part A section 1.2 an order block becomes relevant on promotion, so
// this is the lower bound of that object's in-play lifetime.
// Read-only query. Nothing in this indicator consumes this buffer.
double g_bufXobPromoTime[];
double g_bufOBValidProv[];    // [Task 155] Buffer 34. Provenance of the tickOBIsValid value exported at the flag export block. Initialised to EMPTY_VALUE, not 0.0: 0.0 is spoken for by this file's two objId buffers as "no object selected", and EMPTY_VALUE keeps this buffer uncomputed in exactly the bars where g_bufOBValid is uncomputed.
double g_bufFVGValidProv[];   // [Task 155] Buffer 35. Registered now, population deferred to Task 156. Same EMPTY_VALUE rationale as buffer 34.
double g_bufOppFVGProv[];     // [Task 155] Buffer 36. Registered now, population deferred to Task 163. Same EMPTY_VALUE rationale as buffer 34.

// [P-SWINGIMB] Creation-side imbalance code per confirmed swing, buffers 37/38.
// Paired with buffers 6/7 (swing high/low). Graded, never boolean (Ruling 1):
//   EMPTY_VALUE = no swing in this slot (mirrors the paired swing slot)
//   0 = swing present, no qualifying creation-side imbalance found
//   1 = qualifying imbalance, remainder alive AT THE APEX
//   2 = qualifying imbalance present at the apex, remainder already dead
//   3 = leg boundary unset, predicate not evaluable (never collapsed with 0)
// Semantics are "alive at apex", NEVER "alive now": this write-once export
// cannot track later mitigation. Consumers needing current mitigation state
// read it elsewhere; the OB-validity term lives in FL_BUF_LTF_OB_VALID.
// Multi-record: 1 if ANY matching record is alive at the apex, else 2.
// Read-only query. Nothing in this indicator consumes either buffer.
double g_bufSwingHighImb[];
double g_bufSwingLowImb[];
int    g_swingImb_writes = 0;   // full-pass slot writes (tally only)
int    g_swingImb_highs  = 0;
int    g_swingImb_lows   = 0;
int    g_swingImb_code0  = 0;
int    g_swingImb_code1  = 0;
int    g_swingImb_code2  = 0;
int    g_swingImb_code3  = 0;
int    g_swingImb_naAlive = 0;  // [P-SWINGIMB-2 E5] code-1s decided by NA remainder
bool   g_swingImb_countThisPass = false;  // true only during a full (prevCalc==0) pass

// [P-SWINGIMB-2 E5] OB swing-bar time, buffer 39. Same encoding as buffers
// 28/30/33: SERVER-TIME datetime of the bar cast to double. 0.0 = unset
// (no bias, no qualifying OB, or swing bar out of range). EMPTY_VALUE is
// forbidden here for the buffer-33 reason: it is a plausible integer.
// Written from the same object pointer that writes 26/27, in the same
// branch — the pointer exposes swingBar (used for buffer 27), so no halt.
// Read-only query. Nothing in this indicator consumes this buffer.
double g_bufObSwingTime[];

// [P-SWINGIMB] Returns 0/1/2/3 only. apexBar is the confirmed fractal bar
// (target=i-1 at the call site); bullish selects the HIGH (up-push) side.
int SrjSwingImbCode(const int apexBar, const bool bullish)
  {
   if(SrjIsNa(g_s.structLegBoundary))
      return 3;
   int legStart = g_s.structLegBoundary;
   bool anyMatch = false;
   bool anyAlive = false;
   int n = g_imbalances.Total();
   for(int k = 0; k < n; k++)
     {
      CImbalance *fvg = GetFVG(g_imbalances, k);
      if(fvg == NULL)                 continue;
      if(fvg.isBullish != bullish)    continue;
      if(fvg.startBar < legStart)     continue;
      if(fvg.startBar > apexBar)      continue;
      anyMatch = true;
      bool alive;
      if(SrjIsNa(fvg.remTop) || SrjIsNa(fvg.remBottom))
        {
         alive = true;   // unfilled as-of apex; the fill-pass backfill would set full range
         // [P-SWINGIMB-2 E5] size the fail-open: a 1 decided here is NA-decided.
         if(g_swingImb_countThisPass) g_swingImb_naAlive++;
        }
      else
         alive = (fvg.remTop > fvg.remBottom);
      if(alive) { anyAlive = true; break; }
     }
   if(!anyMatch) return 0;
   return (anyAlive ? 1 : 2);
  }

// [P-SWINGIMB] Full-pass tally helper. Call-gated by the writer.
void SrjSwingImbCount(const bool isHigh, const int code)
  {
   if(!g_swingImb_countThisPass) return;
   g_swingImb_writes++;
   if(isHigh) g_swingImb_highs++; else g_swingImb_lows++;
   if(code == 0) g_swingImb_code0++;
   else if(code == 1) g_swingImb_code1++;
   else if(code == 2) g_swingImb_code2++;
   else if(code == 3) g_swingImb_code3++;
  }

// [P-SWINGIMB-2 E5] Progress tally: the tree's own progress idiom
// (IDCHANGE_PROGRESS / BIASCENSUS_PROGRESS / CQDRECHECK_PROGRESS). Emitted
// from the write branch every 500 full-pass writes so the final line bounds
// the tally within 499 and lands before unload. Call-gated by the writer.
void SrjSwingImbProgress(void)
  {
   if(!g_swingImb_countThisPass) return;
   if(g_swingImb_writes % 500 != 0) return;
   PrintFormat("SWINGIMB_PROGRESS writes=%d highs=%d lows=%d code0=%d code1=%d code2=%d code3=%d naAlive=%d",
               g_swingImb_writes, g_swingImb_highs, g_swingImb_lows,
               g_swingImb_code0, g_swingImb_code1, g_swingImb_code2, g_swingImb_code3,
               g_swingImb_naAlive);
  }

SState g_sSnapshot;
bool g_snapValid = false;
enum ENUM_DAILYANCHOR { DAILY_BROKER_MIDNIGHT, DAILY_NEWYORK_MIDNIGHT, DAILY_CUSTOM_HOUR };
enum ENUM_ROBUSTNESS { ROBUST_LIGHT, ROBUST_MEDIUM, ROBUST_LARGE, ROBUST_CUSTOM };
enum ENUM_AUTOTF { AUTOTF_AGGRESSIVE, AUTOTF_BALANCED, AUTOTF_CONSERVATIVE };
enum ENUM_TBLPOS { TBLPOS_TL, TBLPOS_TR, TBLPOS_BL, TBLPOS_BR };
enum ENUM_TBLSIZE { TBLSIZE_TINY, TBLSIZE_SMALL, TBLSIZE_NORMAL, TBLSIZE_LARGE };
enum ENUM_CHARTTF { CTF_1MIN, CTF_5MIN };
enum ENUM_ERL_FROM { ERLF_NA, ERLF_ASH, ERLF_ASL, ERLF_LDH, ERLF_LDL, ERLF_NYH, ERLF_NYL, ERLF_PMH, ERLF_PML, ERLF_PDH, ERLF_PDL };
enum ENUM_ERL_TO { ERLT_NA, ERLT_XPOI, ERLT_ASH, ERLT_ASL, ERLT_LDH, ERLT_LDL, ERLT_NYH, ERLT_NYL, ERLT_PMH, ERLT_PML, ERLT_PDH, ERLT_PDL };
enum ENUM_XPOI { XPOI_NA, XPOI_XOB_UP, XPOI_XOB_DN, XPOI_XFVG_UP, XPOI_XFVG_DN };
enum ENUM_ALERTNUM { AN_1_0, AN_2_0, AN_3_0, AN_4_0, AN_4_5, AN_5_0 };

// [Pass 22] Moved to the FRONT of the input list, ahead of every cosmetic
// group. MQL5's iCustom() has a hard 63-parameter limit (confirmed against
// MQL5 Forum/docs), and this indicator has ~97 inputs total — the EA that
// drives this headlessly can only reach inputs near the front of the list.
// This group is the only one whose values change computed buffer output,
// not just chart drawing, so it has to be reachable. Moving it here changes
// where it appears in the indicator's Inputs dialog (first, instead of
// second-to-last) but changes no default value and no behavior otherwise.
input group "HTF Automation"
input ENUM_CHARTTF    inChartTradingTF   = CTF_5MIN;    
input int             inHtfLookbackBars  = 3000;        
input ENUM_TIMEFRAMES inHtf1_manual      = PERIOD_H4;   
input ENUM_TIMEFRAMES inHtf2_manual      = PERIOD_H1;   
input ENUM_TIMEFRAMES inHtf3_manual      = PERIOD_M15;  
input bool            inUseConfirmedHTFOnly = false;    
input int             inHtfMaxTrackedObjects = 60;      
input ENUM_XPOI       inHtfHighTarget    = XPOI_NA;     
input ENUM_XPOI       inHtfMidTarget     = XPOI_NA;     
input ENUM_XPOI       inHtfLowTarget     = XPOI_NA;     
input bool            inHtfDebugLog      = false;      
input string          inDebugFromTime    = "";  
input string          inDebugToTime      = "";  

input group "Bias Settings"
input bool  inShowBiasPane                    = true;            
input int   inBiasPaneOffsetBars              = 3;               
input bool  inShowBiasChangeLines             = true;            
input color inBiasChangeLineColorBullish      = C'50,50,255';    
input color inBiasChangeLineColorBearish      = C'255,50,50';    
input int   inBiasChangeLineWidth             = 2;               
input bool  inShowStructureRenewalLines       = true;            
input color inStructureRenewalLineColorBullish= C'100,100,255';  
input color inStructureRenewalLineColorBearish= C'255,100,100';  
input int   inStructureRenewalLineWidth       = 1;               
input int   inKeepBiasChangeLinesCount        = 5;               
input int   inKeepStructureRenewalLinesCount  = 5;               

input group "Order Block Settings"
input bool  inShowValidBullishOB       = true;   
input bool  inShowValidBearishOB       = true;   
input bool  inShowInvalidatedBullishOB = true;   
input bool  inShowInvalidatedBearishOB = true;   
input bool  inShowInactiveBullishOB    = true;   
input bool  inShowInactiveBearishOB    = true;   
input bool  inExtendValid              = false;  
input bool  inExtendInactive           = false;  
input bool  inExtendInvalidated        = false;  
input int   inLineExtension            = 3;      
input int   inLineThickness            = 1;      
input int   inExtremeOBExtraThickness  = 2;      
input int   inKeepInvalidatedCount     = 5;      
input color inBullishOBColor           = clrBlue;    
input color inBearishOBColor           = clrRed;     
input color inValidMidlineColor        = clrBlack;   
input color inInvalidatedBullishColor  = clrGray;    
input color inInvalidatedBearishColor  = clrGray;    
input color inInvalidatedMidlineColor  = clrOrange;  
input color inInactiveBullishColor     = C'102,102,255'; 
input color inInactiveBearishColor     = C'255,102,102'; 
input color inInactiveMidlineColor     = clrBlack;   

input group "FVG/Imbalance Settings"
input bool  inShowFVG                    = true;   
input bool  inShowMidline                = true;   
input int   inFvgExtension               = 4;      
input int   inFvgBorderWidth             = 1;      
input color inBullishFVGColor            = C'0,0,255';   
input color inBearishFVGColor            = C'255,0,0';   
input color inBullishFVGBorderColor      = C'50,50,255'; 
input color inBearishFVGBorderColor      = C'255,50,50'; 
input color inInvalidatedFVGFillColor    = clrGray;      
input color inInvalidatedFVGBorderColor  = clrGray;      
input int   inKeepInvalidatedFVGCount    = 5;      
input bool  inDeleteFVGAfterFill         = false;  

input group "Fractal Settings"
input bool  inShowFractals    = true;      
input color inFractalHighColor= clrBlack;  
input color inFractalLowColor = clrBlack;  
input int    inFractalAtrLength  = 14;     
input double inFractalOffsetMult = 0.1;    

input group "Session Settings"
input string inAsiaSession        = "2000-0000:1234567"; 
input string inLondonSession      = "0200-0500:1234567"; 
input string inNYSession          = "0700-1200:1234567"; 
input string inPMSession          = "1330-1600:1234567"; 
input string inSessionTimezone    = "America/New_York";  
input int    inBrokerToUTCOffset  = 3;   
input ENUM_DAILYANCHOR inDailyAnchorMode = DAILY_BROKER_MIDNIGHT;  
input int              inDailyAnchorHour = 0;                      
input bool   inShowSessionHiLoLines = true;   
input bool   inShowPDHiLoLines      = true;   
input int    inSessionHiLoLineWidth = 1;      
input int    inDailyHiLoLineWidth   = 2;      
input int    inSessionRetentionDays = 1;      

input group "Performance Settings"
input ENUM_ROBUSTNESS inRobustnessMode = ROBUST_MEDIUM;   
input int    inMaxLookbackBars   = 5000;      
input bool   inShowDataWarnings  = false;      
input ENUM_TBLPOS  inDataWarningPosition = TBLPOS_TL;  
input ENUM_TBLSIZE inDataWarningSize     = TBLSIZE_SMALL; 
input bool   inEnableAutoTimeframeLimit = true;   
input ENUM_AUTOTF  inAutoTFMode          = AUTOTF_BALANCED; 

input group "Alert Settings"
input bool inEnableBiasFlipAlerts           = false; 
input bool inEnableStructureRenewalAlerts   = false; 
input bool inEnableExtremeOBPromotionAlerts = false; 

input group "Multi-Timeframe Box"
input ENUM_TBLSIZE  inMtfBoxTextSize = TBLSIZE_TINY;  
input ENUM_ERL_FROM inErlSweepFrom   = ERLF_NA;        
input ENUM_ERL_TO   inErlTargetTo    = ERLT_NA;        
input ENUM_ALERTNUM inAlertNumber    = AN_3_0;         
input ENUM_ALERTNUM inErlAlertNumber = AN_3_0;         

input group "Liquidity Sweep Automation"
input bool   inAutoDetectERLSweep         = true;  
input double inLiquiditySweepBufferPoints = 1.0;   
input bool   inShowLiquiditySweepDebugLabel = false;
input bool   inShowLiquidityLevelsDebug   = false;  

input group "Port Options"
input bool   inUseAsciiFallback = false;  

string RobustToStr(ENUM_ROBUSTNESS r)
  {
   switch(r)
     {
      case ROBUST_LIGHT:   return "Light (2000 bars)";
      case ROBUST_MEDIUM:  return "Medium (5000 bars)";
      case ROBUST_LARGE:   return "Large (20000 bars)";
      default:             return "Custom";
     }
  }
string AutoTFToStr(ENUM_AUTOTF a)
  {
   switch(a)
     {
      case AUTOTF_AGGRESSIVE:   return "Aggressive";
      case AUTOTF_CONSERVATIVE: return "Conservative";
      default:                  return "Balanced";
     }
  }
string TblPosToStr(ENUM_TBLPOS p)
  {
   switch(p)
     {
      case TBLPOS_TL: return "Top Left";
      case TBLPOS_TR: return "Top Right";
      case TBLPOS_BL: return "Bottom Left";
      default:        return "Bottom Right";
     }
  }
string TblSizeToStr(ENUM_TBLSIZE s)
  {
   switch(s)
     {
      case TBLSIZE_TINY:   return "Tiny";
      case TBLSIZE_NORMAL: return "Normal";
      case TBLSIZE_LARGE:  return "Large";
      default:             return "Small";
     }
  }
string ChartTFToStr(ENUM_CHARTTF t){ return (t==CTF_1MIN) ? "1 Minute" : "5 Minute"; }
double AlertNumToVal(ENUM_ALERTNUM a)
  {
   switch(a)
     {
      case AN_1_0: return 1.0; case AN_2_0: return 2.0; case AN_3_0: return 3.0;
      case AN_4_0: return 4.0; case AN_4_5: return 4.5; default: return 5.0;
     }
  }
string ErlFromToStr(ENUM_ERL_FROM f)
  {
   switch(f)
     {
      case ERLF_ASH:return "AS.H"; case ERLF_ASL:return "AS.L";
      case ERLF_LDH:return "LD.H"; case ERLF_LDL:return "LD.L";
      case ERLF_NYH:return "NY.H"; case ERLF_NYL:return "NY.L";
      case ERLF_PMH:return "PM.H"; case ERLF_PML:return "PM.L";
      case ERLF_PDH:return "PD.H"; case ERLF_PDL:return "PD.L";
      default:      return "NA";
     }
  }
string ErlToToStr(ENUM_ERL_TO t)
  {
   switch(t)
     {
      case ERLT_XPOI:return "XPOI";
      case ERLT_ASH:return "AS.H"; case ERLT_ASL:return "AS.L";
      case ERLT_LDH:return "LD.H"; case ERLT_LDL:return "LD.L";
      case ERLT_NYH:return "NY.H"; case ERLT_NYL:return "NY.L";
      case ERLT_PMH:return "PM.H"; case ERLT_PML:return "PM.L";
      case ERLT_PDH:return "PD.H"; case ERLT_PDL:return "PD.L";
      default:      return "NA";
     }
  }
string XpoiToStr(ENUM_XPOI x)
  {
   switch(x)
     {
      case XPOI_XOB_UP: return "X.OB" + SRJ_UP();
      case XPOI_XOB_DN: return "X.OB" + SRJ_DN();
      case XPOI_XFVG_UP:return "XFVG" + SRJ_UP();
      case XPOI_XFVG_DN:return "XFVG" + SRJ_DN();
      default:          return "NA";
     }
  }

void SRJ_BindInputs()
  {
   g_showValidBullishOB          = inShowValidBullishOB;
   g_showValidBearishOB          = inShowValidBearishOB;
   g_showInvalidatedBullishOB    = inShowInvalidatedBullishOB;
   g_showInvalidatedBearishOB    = inShowInvalidatedBearishOB;
   g_showInactiveBullishOB       = inShowInactiveBullishOB;
   g_showInactiveBearishOB       = inShowInactiveBearishOB;
   g_extendValid                 = inExtendValid;
   g_extendInactive              = inExtendInactive;
   g_extendInvalidated           = inExtendInvalidated;
   g_lineExtension               = inLineExtension;
   g_lineThickness               = inLineThickness;
   g_extremeOBExtraThickness     = inExtremeOBExtraThickness;
   g_keepInvalidatedCount        = inKeepInvalidatedCount;
   g_bullishOBColor              = inBullishOBColor;
   g_bearishOBColor              = inBearishOBColor;
   g_validMidlineColor           = inValidMidlineColor;
   g_invalidatedBullishColor     = inInvalidatedBullishColor;
   g_invalidatedBearishColor     = inInvalidatedBearishColor;
   g_invalidatedMidlineColor     = inInvalidatedMidlineColor;
   g_inactiveBullishColor        = inInactiveBullishColor;
   g_inactiveBearishColor       = inInactiveBearishColor;
   g_inactiveMidlineColor        = inInactiveMidlineColor;
   g_enableExtremeOBPromotionAlerts = inEnableExtremeOBPromotionAlerts;
   g_showFVG                     = inShowFVG;
   g_showMidline                 = inShowMidline;
   g_fvgExtension                = inFvgExtension;
   g_fvgBorderWidth              = inFvgBorderWidth;
   g_bullishFVGColor             = inBullishFVGColor;
   g_bearishFVGColor             = inBearishFVGColor;
   g_bullishFVGBorderColor       = inBullishFVGBorderColor;
   g_bearishFVGBorderColor       = inBearishFVGBorderColor;
   g_invalidatedFVGFillColor     = inInvalidatedFVGFillColor;
   g_invalidatedFVGBorderColor   = inInvalidatedFVGBorderColor;
   g_keepInvalidatedFVGCount     = inKeepInvalidatedFVGCount;
   g_deleteFVGAfterFill          = inDeleteFVGAfterFill;
   g_asiaSession                 = inAsiaSession;
   g_londonSession               = inLondonSession;
   g_nySession                   = inNYSession;
   g_pmSession                   = inPMSession;
   g_sessionTimezone             = inSessionTimezone;
   g_showSessionHiLoLines        = inShowSessionHiLoLines;
   g_showPDHiLoLines             = inShowPDHiLoLines;
   g_sessionHiLoLineWidth        = inSessionHiLoLineWidth;
   g_dailyHiLoLineWidth          = inDailyHiLoLineWidth;
   g_sessionRetentionDays        = inSessionRetentionDays;
   g_liquiditySweepBufferPoints  = inLiquiditySweepBufferPoints;
   g_brokerToUTCOffsetHours      = inBrokerToUTCOffset;
   g_dailyAnchorMode = (int)inDailyAnchorMode;
   g_dailyAnchorHour = (int)MathMax(0, MathMin(23, inDailyAnchorHour));
   g_alertNumber                 = AlertNumToVal(inAlertNumber);
   g_erlAlertNumber              = AlertNumToVal(inErlAlertNumber);
   g_erlSweepFromStr             = ErlFromToStr(inErlSweepFrom);
   g_erlTargetToStr              = ErlToToStr(inErlTargetTo);
   g_htfHighTargetStr            = XpoiToStr(inHtfHighTarget);
   g_htfMidTargetStr             = XpoiToStr(inHtfMidTarget);
   g_htfLowTargetStr             = XpoiToStr(inHtfLowTarget);
   g_htfHighTF                   = inHtf1_manual;
   g_htfMidTF                    = inHtf2_manual;
   g_htfLowTF                    = inHtf3_manual;
   
   g_enableBiasFlipAlerts           = inEnableBiasFlipAlerts;
   g_enableStructureRenewalAlerts   = inEnableStructureRenewalAlerts;
   g_showBiasChangeLines            = inShowBiasChangeLines;
   g_biasChangeLineColorBullish     = inBiasChangeLineColorBullish;
   g_biasChangeLineColorBearish     = inBiasChangeLineColorBearish;
   g_biasChangeLineWidth            = inBiasChangeLineWidth;
   g_showStructureRenewalLines      = inShowStructureRenewalLines;
   g_structureRenewalLineColorBullish = inStructureRenewalLineColorBullish;
   g_structureRenewalLineColorBearish = inStructureRenewalLineColorBearish;
   g_structureRenewalLineWidth      = inStructureRenewalLineWidth;
   g_keepBiasChangeLinesCount       = inKeepBiasChangeLinesCount;
   g_keepStructureRenewalLinesCount = inKeepStructureRenewalLinesCount;
   g_fractalAtrLength               = inFractalAtrLength;
   g_fractalOffsetMult              = inFractalOffsetMult;
   g_htfDebugLog                    = inHtfDebugLog;
   
   g_showBiasPane                   = inShowBiasPane;
   g_biasPaneOffsetBars             = inBiasPaneOffsetBars;
   g_mtfBoxTextSize                 = TblSizeToStr(inMtfBoxTextSize);
   g_dataWarningPosition            = TblPosToStr(inDataWarningPosition);
   g_dataWarningSize                = TblSizeToStr(inDataWarningSize);
   g_showDataWarnings               = inShowDataWarnings;
   g_robustnessModeStr              = RobustToStr(inRobustnessMode);
   g_useAsciiFallback               = inUseAsciiFallback;
   g_autoDetectERLSweep             = inAutoDetectERLSweep;
   g_showLiquiditySweepDebugLabel   = inShowLiquiditySweepDebugLabel;
   g_showLiquidityLevelsDebug       = inShowLiquidityLevelsDebug;
  }

void SRJ_ComputeLookback(int rates_total)
  {
   int last_bar_index = rates_total - 1;

   string robStr = RobustToStr(inRobustnessMode);
   int effectiveLookback;
   if(robStr == "Light (2000 bars)")       effectiveLookback = 2000;
   else if(robStr == "Medium (5000 bars)") effectiveLookback = 5000;
   else if(robStr == "Large (20000 bars)") effectiveLookback = 20000;
   else                                    effectiveLookback = inMaxLookbackBars; 
   g_s.baseLookback        = effectiveLookback;
   g_s.robustnessLimitBars = effectiveLookback;

   if(inEnableAutoTimeframeLimit)
     {
      double tfMinutes = (double)PeriodSeconds(_Period) / 60.0;
      bool isSeconds = (_Period < PERIOD_M1);
      bool isDaily   = (_Period == PERIOD_D1);
      bool isWeekly  = (_Period == PERIOD_W1);
      bool isMonthly = (_Period == PERIOD_MN1);
      if(isDaily)   tfMinutes = 1440.0;
      if(isWeekly)  tfMinutes = 10080.0;
      if(isMonthly) tfMinutes = 43200.0;

      int autoLimit = effectiveLookback;
      string atf = AutoTFToStr(inAutoTFMode);
      if(atf == "Aggressive")
        {
         if(isSeconds)             autoLimit = 500;
         else if(tfMinutes <= 1)   autoLimit = 1000;
         else if(tfMinutes <= 5)   autoLimit = 1500;
         else if(tfMinutes <= 15)  autoLimit = 2000;
         else if(tfMinutes <= 30)  autoLimit = 3000;
         else if(tfMinutes <= 60)  autoLimit = 4000;
         else if(tfMinutes <= 240) autoLimit = 5000;
        }
      else if(atf == "Balanced")
        {
         if(isSeconds)             autoLimit = 1000;
         else if(tfMinutes <= 1)   autoLimit = 2000;
         else if(tfMinutes <= 5)   autoLimit = 3000;
         else if(tfMinutes <= 15)  autoLimit = 4000;
         else if(tfMinutes <= 30)  autoLimit = 5000;
         else if(tfMinutes <= 60)  autoLimit = 3000;
         else if(tfMinutes <= 240) autoLimit = 2000;
        }
      else if(atf == "Conservative")
        {
         if(isSeconds)             autoLimit = 2000;
         else if(tfMinutes <= 1)   autoLimit = 3000;
         else if(tfMinutes <= 5)   autoLimit = 5000;
         else if(tfMinutes <= 15)  autoLimit = 6000;
         else if(tfMinutes <= 30)  autoLimit = 7000;
         else if(tfMinutes <= 60)  autoLimit = 9000;
         else if(tfMinutes <= 240) autoLimit = 10000;
        }
      effectiveLookback = (int)MathMin(effectiveLookback, autoLimit);
     }

   g_s.effectiveLookback = effectiveLookback;

   int finalLookback = effectiveLookback;
   g_finalLookback   = finalLookback;

   g_s.usedBars = (int)MathMin(finalLookback, last_bar_index + 1);
   double covTfMinutes = (double)PeriodSeconds(_Period) / 60.0;
   if(_Period == PERIOD_D1)  covTfMinutes = 1440.0;
   if(_Period == PERIOD_W1)  covTfMinutes = 10080.0;
   if(_Period == PERIOD_MN1) covTfMinutes = 43200.0;
   g_s.coverageDays = (g_s.usedBars * covTfMinutes) / 1440.0;
   if(g_s.coverageDays >= 365.0)
     {
      double y = MathRound((g_s.coverageDays/365.0)*10.0)/10.0;
      g_s.coverageText = DoubleToString(y,1) + " years";
     }
   else if(g_s.coverageDays >= 30.0)
     {
      double m = MathRound((g_s.coverageDays/30.0)*10.0)/10.0;
      g_s.coverageText = DoubleToString(m,1) + " months";
     }
   else if(g_s.coverageDays >= 7.0)
     {
      double w = MathRound((g_s.coverageDays/7.0)*10.0)/10.0;
      g_s.coverageText = DoubleToString(w,1) + " weeks";
     }
   else
     {
      double d = MathRound(g_s.coverageDays*10.0)/10.0;
      g_s.coverageText = DoubleToString(d,1) + " days";
     }
  }

int      g_srjRatesTotal   = 0;
datetime g_srjDebugFrom    = 0;
datetime g_srjDebugTo      = 0;
datetime g_firstBarTime    = 0;   // oldest bar time seen; detects prepended history

datetime SRJ_BarTime(const int bar)
  {
   if(g_srjRatesTotal <= 0 || bar < 0 || bar >= g_srjRatesTotal)
      return(0);
   return(iTime(_Symbol, PERIOD_CURRENT, g_srjRatesTotal - 1 - bar));
  }

string SRJ_BarTimeStr(const int bar)
  {
   datetime t = SRJ_BarTime(bar);
   if(t == 0)
      return("n/a");
   return(TimeToString(t, TIME_DATE | TIME_MINUTES));
  }

bool SRJ_InDebugWindow(const int bar)
  {
   if(!g_htfDebugLog)
      return(false);
   if(g_srjDebugFrom == 0 && g_srjDebugTo == 0)
      return(true);
   datetime t = SRJ_BarTime(bar);
   if(t == 0)
      return(false);
   if(g_srjDebugFrom != 0 && t < g_srjDebugFrom)
      return(false);
   if(g_srjDebugTo != 0 && t > g_srjDebugTo)
      return(false);
   return(true);
  }

int OnInit()
  {
   Print("SRJ BUILD ", __DATETIME__, " refOk=invOnly diag=v9_perm");
   SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);
   SetIndexBuffer(1,g_bufFractalLow, INDICATOR_DATA);
   ArraySetAsSeries(g_bufFractalHigh,false);
   ArraySetAsSeries(g_bufFractalLow, false);

   // [NEW] Bind export buffers (Indices 2 to 21)
   SetIndexBuffer(2,  g_bufBias,         INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,  g_bufOBValid,      INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,  g_bufFVGValid,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,  g_bufOppFVG,       INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,  g_bufSwingHigh,    INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,  g_bufSwingLow,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,  g_bufPrevDayHigh,  INDICATOR_CALCULATIONS);
   SetIndexBuffer(9,  g_bufPrevDayLow,   INDICATOR_CALCULATIONS);
   SetIndexBuffer(10, g_bufAsiaHigh,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(11, g_bufAsiaLow,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(12, g_bufLondonHigh,   INDICATOR_CALCULATIONS);
   SetIndexBuffer(13, g_bufLondonLow,    INDICATOR_CALCULATIONS);
   SetIndexBuffer(14, g_bufNyHigh,       INDICATOR_CALCULATIONS);
   SetIndexBuffer(15, g_bufNyLow,        INDICATOR_CALCULATIONS);
   SetIndexBuffer(16, g_bufPmHigh,       INDICATOR_CALCULATIONS);
   SetIndexBuffer(17, g_bufPmLow,        INDICATOR_CALCULATIONS);
   SetIndexBuffer(40, g_bufPdAsiaHigh,  INDICATOR_CALCULATIONS);
   SetIndexBuffer(41, g_bufPdAsiaLow,   INDICATOR_CALCULATIONS);
   SetIndexBuffer(42, g_bufPdLondonHigh,INDICATOR_CALCULATIONS);
   SetIndexBuffer(43, g_bufPdLondonLow, INDICATOR_CALCULATIONS);
   SetIndexBuffer(44, g_bufPdNyHigh,    INDICATOR_CALCULATIONS);
   SetIndexBuffer(45, g_bufPdNyLow,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(46, g_bufPdPmHigh,    INDICATOR_CALCULATIONS);
   SetIndexBuffer(47, g_bufPdPmLow,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(18, g_bufSweepTag,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(19, g_bufHtfHi,        INDICATOR_CALCULATIONS);
   SetIndexBuffer(20, g_bufHtfMid,       INDICATOR_CALCULATIONS);
   SetIndexBuffer(21, g_bufHtfLo,        INDICATOR_CALCULATIONS);

   // [Section 8]
   SetIndexBuffer(22, g_bufXobZoneHigh,    INDICATOR_CALCULATIONS);
   SetIndexBuffer(23, g_bufXobZoneLow,     INDICATOR_CALCULATIONS);
   SetIndexBuffer(24, g_bufFvgLegZoneHigh, INDICATOR_CALCULATIONS);
   SetIndexBuffer(25, g_bufFvgLegZoneLow,  INDICATOR_CALCULATIONS);

   // [Task 25]
   SetIndexBuffer(26, g_bufObStructExtreme, INDICATOR_CALCULATIONS);
   SetIndexBuffer(27, g_bufObSwingExtreme,  INDICATOR_CALCULATIONS);

   // [Task 27]
   SetIndexBuffer(28, g_bufRenewalBoundaryTime, INDICATOR_CALCULATIONS);

   // [Task 39] P3a append-only. Index 29 = previous buffer count (was 29 buffers, 0..28).
   SetIndexBuffer(29, g_bufSweptMask, INDICATOR_CALCULATIONS);

   // [Task 50] P3a append-only. Index 30 = previous buffer count (was 30 buffers, 0..29).
   SetIndexBuffer(30, g_bufStructLegTime, INDICATOR_CALCULATIONS);

   // [Task 102] P3a append-only. Index 31 = previous buffer count (was 31 buffers, 0..30).
   SetIndexBuffer(31, g_bufXobObjId, INDICATOR_CALCULATIONS);
   SetIndexBuffer(32, g_bufFvgObjId, INDICATOR_CALCULATIONS);

   // [Task 113] P3a append-only. Index 33 = previous buffer count (was 33 buffers, 0..32).
   SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);
   SetIndexBuffer(34, g_bufOBValidProv,  INDICATOR_CALCULATIONS);
   SetIndexBuffer(35, g_bufFVGValidProv, INDICATOR_CALCULATIONS);
   SetIndexBuffer(36, g_bufOppFVGProv,   INDICATOR_CALCULATIONS);

   // [P-SWINGIMB] Append-only. Index 37 = previous buffer count (was 37 buffers, 0..36).
   SetIndexBuffer(37, g_bufSwingHighImb, INDICATOR_CALCULATIONS);
   SetIndexBuffer(38, g_bufSwingLowImb,  INDICATOR_CALCULATIONS);

   // [P-SWINGIMB-2 E5] Append-only. Index 39 = previous buffer count (was 39 buffers, 0..38).
   SetIndexBuffer(39, g_bufObSwingTime, INDICATOR_CALCULATIONS);

   ArraySetAsSeries(g_bufBias,         false);
   ArraySetAsSeries(g_bufOBValid,      false);
   ArraySetAsSeries(g_bufFVGValid,     false);
   ArraySetAsSeries(g_bufOppFVG,       false);
   ArraySetAsSeries(g_bufSwingHigh,    false);
   ArraySetAsSeries(g_bufSwingLow,     false);
   ArraySetAsSeries(g_bufPrevDayHigh,  false);
   ArraySetAsSeries(g_bufPrevDayLow,   false);
   ArraySetAsSeries(g_bufAsiaHigh,     false);
   ArraySetAsSeries(g_bufAsiaLow,     false);
   ArraySetAsSeries(g_bufLondonHigh,   false);
   ArraySetAsSeries(g_bufLondonLow,    false);
   ArraySetAsSeries(g_bufNyHigh,       false);
   ArraySetAsSeries(g_bufNyLow,        false);
   ArraySetAsSeries(g_bufPmHigh,       false);
   ArraySetAsSeries(g_bufPmLow,       false);
   ArraySetAsSeries(g_bufPdAsiaHigh,  false);
   ArraySetAsSeries(g_bufPdAsiaLow,   false);
   ArraySetAsSeries(g_bufPdLondonHigh,false);
   ArraySetAsSeries(g_bufPdLondonLow, false);
   ArraySetAsSeries(g_bufPdNyHigh,    false);
   ArraySetAsSeries(g_bufPdNyLow,     false);
   ArraySetAsSeries(g_bufPdPmHigh,    false);
   ArraySetAsSeries(g_bufPdPmLow,     false);
   ArraySetAsSeries(g_bufSweepTag,     false);
   ArraySetAsSeries(g_bufHtfHi,        false);
   ArraySetAsSeries(g_bufHtfMid,       false);
   ArraySetAsSeries(g_bufHtfLo,        false);

   // [Section 8]
   ArraySetAsSeries(g_bufXobZoneHigh,    false);
   ArraySetAsSeries(g_bufXobZoneLow,     false);
   ArraySetAsSeries(g_bufFvgLegZoneHigh, false);
   ArraySetAsSeries(g_bufFvgLegZoneLow,  false);

   // [Task 25]
   ArraySetAsSeries(g_bufObStructExtreme, false);
   ArraySetAsSeries(g_bufObSwingExtreme,  false);

   // [Task 27]
   ArraySetAsSeries(g_bufRenewalBoundaryTime, false);

   // [Task 39]
   ArraySetAsSeries(g_bufSweptMask, false);

   // [Task 50]
   ArraySetAsSeries(g_bufStructLegTime, false);

   // [Task 102]
   ArraySetAsSeries(g_bufXobObjId, false);
   ArraySetAsSeries(g_bufFvgObjId, false);

   // [Task 113]
   ArraySetAsSeries(g_bufXobPromoTime, false);
   ArraySetAsSeries(g_bufOBValidProv,  false);
   ArraySetAsSeries(g_bufFVGValidProv, false);
   ArraySetAsSeries(g_bufOppFVGProv,   false);

   // [P-SWINGIMB]
   ArraySetAsSeries(g_bufSwingHighImb, false);
   ArraySetAsSeries(g_bufSwingLowImb,  false);

   // [P-SWINGIMB-2 E5]
   ArraySetAsSeries(g_bufObSwingTime, false);

   SRJ_BindInputs(); 
   SRJ_Glyph_Init(); 
   SRJ_StateInit();

   g_mintick = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   if(g_mintick <= 0) g_mintick = _Point;

   SRJ_InitFractalBuffers(0,1,inFractalHighColor,inFractalLowColor,inShowFractals);

   SRJ_ParseSession(g_asiaSession,   g_defAsia);
   SRJ_ParseSession(g_londonSession, g_defLondon);
   SRJ_ParseSession(g_nySession,     g_defNY);
   SRJ_ParseSession(g_pmSession,     g_defPM);

   SRJ_HTF_Init();
   SRJ_Panels_Init(TblPosToStr(inDataWarningPosition),
                   TblSizeToStr(inDataWarningSize),
                   TblSizeToStr(inMtfBoxTextSize),
                   inUseAsciiFallback,
                   ChartTFToStr(inChartTradingTF));

   IndicatorSetString(INDICATOR_SHORTNAME,"SRJ Flow Logic Auto");

   g_srjDebugFrom = (StringLen(inDebugFromTime) > 0) ? StringToTime(inDebugFromTime) : 0;
   g_srjDebugTo   = (StringLen(inDebugToTime)   > 0) ? StringToTime(inDebugToTime)   : 0;
   Print("SRJ DEBUGWIN from=", (g_srjDebugFrom == 0 ? "none" : TimeToString(g_srjDebugFrom, TIME_DATE | TIME_MINUTES)),
         " to=",               (g_srjDebugTo   == 0 ? "none" : TimeToString(g_srjDebugTo,   TIME_DATE | TIME_MINUTES)));

   g_firstBarTime = 0;  // Reset on init

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   PrintFormat("SWINGIMB_CENSUS writes=%d highs=%d lows=%d code0=%d code1=%d code2=%d code3=%d naAlive=%d",
               g_swingImb_writes, g_swingImb_highs, g_swingImb_lows,
               g_swingImb_code0, g_swingImb_code1, g_swingImb_code2, g_swingImb_code3,
               g_swingImb_naAlive);
   SRJ_DeleteAllObjects();
   SRJ_Panels_Destroy();
  }

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   g_srjRatesTotal = rates_total;

   if(rates_total < 5) return(rates_total);

   ArraySetAsSeries(time,  false);
   ArraySetAsSeries(open,  false);
   ArraySetAsSeries(high,  false);
   ArraySetAsSeries(low,   false);
   ArraySetAsSeries(close, false);
   g_ratesTotal = rates_total;

   int lastIdx = rates_total - 1;
   g_newBar = (time[lastIdx] != g_lastBarTime);

   int prevCalc = prev_calculated;
   if(prevCalc > 0 && time[0] != g_firstBarTime)
     {
      if(g_htfDebugLog)
         Print("SRJ HISTSHIFT oldFirst=",
               (g_firstBarTime == 0 ? "none" : TimeToString(g_firstBarTime, TIME_DATE|TIME_MINUTES)),
               " newFirst=", TimeToString(time[0], TIME_DATE|TIME_MINUTES),
               " ratesTotal=", rates_total,
               " prevCalculated=", prev_calculated,
               " action=fullReset");
      prevCalc = 0;
     }

   SRJ_ComputeLookback(rates_total);

   int start;
   if(prevCalc == 0)
     {
      ArrayInitialize(g_bufFractalHigh,EMPTY_VALUE);
      ArrayInitialize(g_bufFractalLow, EMPTY_VALUE);
      
      // [NEW] Initialize export buffers on full reset
      ArrayInitialize(g_bufBias,         EMPTY_VALUE);
      ArrayInitialize(g_bufOBValid,      EMPTY_VALUE);
      ArrayInitialize(g_bufFVGValid,     EMPTY_VALUE);
      ArrayInitialize(g_bufOppFVG,       EMPTY_VALUE);
      ArrayInitialize(g_bufSwingHigh,    EMPTY_VALUE);
      ArrayInitialize(g_bufSwingLow,     EMPTY_VALUE);
      ArrayInitialize(g_bufPrevDayHigh,  EMPTY_VALUE);
      ArrayInitialize(g_bufPrevDayLow,   EMPTY_VALUE);
      ArrayInitialize(g_bufAsiaHigh,     EMPTY_VALUE);
      ArrayInitialize(g_bufAsiaLow,     EMPTY_VALUE);
      ArrayInitialize(g_bufLondonHigh,   EMPTY_VALUE);
      ArrayInitialize(g_bufLondonLow,    EMPTY_VALUE);
      ArrayInitialize(g_bufNyHigh,       EMPTY_VALUE);
      ArrayInitialize(g_bufNyLow,        EMPTY_VALUE);
       ArrayInitialize(g_bufPmHigh,       EMPTY_VALUE);
       ArrayInitialize(g_bufPmLow,        EMPTY_VALUE);
       ArrayInitialize(g_bufPdAsiaHigh,   EMPTY_VALUE);
       ArrayInitialize(g_bufPdAsiaLow,    EMPTY_VALUE);
       ArrayInitialize(g_bufPdLondonHigh, EMPTY_VALUE);
       ArrayInitialize(g_bufPdLondonLow,  EMPTY_VALUE);
       ArrayInitialize(g_bufPdNyHigh,     EMPTY_VALUE);
       ArrayInitialize(g_bufPdNyLow,      EMPTY_VALUE);
       ArrayInitialize(g_bufPdPmHigh,     EMPTY_VALUE);
       ArrayInitialize(g_bufPdPmLow,      EMPTY_VALUE);
      ArrayInitialize(g_bufSweepTag,     EMPTY_VALUE);
      ArrayInitialize(g_bufHtfHi,        EMPTY_VALUE);
      ArrayInitialize(g_bufHtfMid,       EMPTY_VALUE);
      ArrayInitialize(g_bufHtfLo,        EMPTY_VALUE);

      // [Section 8]
      ArrayInitialize(g_bufXobZoneHigh,    EMPTY_VALUE);
      ArrayInitialize(g_bufXobZoneLow,     EMPTY_VALUE);
      ArrayInitialize(g_bufFvgLegZoneHigh, EMPTY_VALUE);
      ArrayInitialize(g_bufFvgLegZoneLow,  EMPTY_VALUE);

      // [Task 25]
      ArrayInitialize(g_bufObStructExtreme, EMPTY_VALUE);
      ArrayInitialize(g_bufObSwingExtreme,  EMPTY_VALUE);

      // [Task 27] Initialised to 0.0, not EMPTY_VALUE — see the declaration comment.
      ArrayInitialize(g_bufRenewalBoundaryTime, 0.0);

      // [Task 39] EMPTY_VALUE, not 0.0 — a real mask of 0 is a valid state.
      ArrayInitialize(g_bufSweptMask, EMPTY_VALUE);

      // [Task 50] 0.0, not EMPTY_VALUE — see the declaration comment.
      ArrayInitialize(g_bufStructLegTime, 0.0);

      // [Task 102] 0.0, not EMPTY_VALUE — see the declaration comment.
      ArrayInitialize(g_bufXobObjId, 0.0);
      ArrayInitialize(g_bufFvgObjId, 0.0);

      // [Task 113] 0.0, not EMPTY_VALUE — see the declaration comment.
      ArrayInitialize(g_bufXobPromoTime, 0.0);
      // [Task 155] EMPTY_VALUE, not 0.0 - see the declaration comment.
      ArrayInitialize(g_bufOBValidProv,  EMPTY_VALUE);
      ArrayInitialize(g_bufFVGValidProv, EMPTY_VALUE);
      ArrayInitialize(g_bufOppFVGProv,   EMPTY_VALUE);

      // [P-SWINGIMB] EMPTY_VALUE, not 0.0 — 0 means "swing without imbalance".
      ArrayInitialize(g_bufSwingHighImb, EMPTY_VALUE);
      ArrayInitialize(g_bufSwingLowImb,  EMPTY_VALUE);
      // [P-SWINGIMB-2 E5] 0.0, not EMPTY_VALUE — buffer-33 encoding.
      ArrayInitialize(g_bufObSwingTime, 0.0);
      g_swingImb_writes = 0;
      g_swingImb_highs  = 0;
      g_swingImb_lows   = 0;
      g_swingImb_code0  = 0;
      g_swingImb_code1  = 0;
      g_swingImb_code2  = 0;
      g_swingImb_code3  = 0;
      g_swingImb_naAlive = 0;
      g_swingImb_countThisPass = true;

      SRJ_DeleteAllObjects();      
      SRJ_StateInit();             
      SRJ_BindInputs();            
      SRJ_HTF_Init();

      g_snapValid = false;
      g_intrabarObjects.Clear();

      start = 2;                   
     }
   else
     {
       start = prevCalc - 1;
       g_swingImb_countThisPass = false;
       if(start < 2) start = 2;
     }

   int last_bar_index = rates_total - 1;
   int finalLookback  = g_finalLookback;
   int safetyBuffer   = 200;
   
   for(int i = start; i < rates_total; i++)
     {
      bool isLastBar = (i == rates_total - 1);
      if(isLastBar)
        {
         if(g_newBar)
           {
            g_sSnapshot = g_s;
            g_snapValid = true;
            g_intrabarObjects.Clear();
           }
         else if(g_snapValid)
           {
            g_s = g_sSnapshot;
            for(int j=0; j<g_intrabarObjects.Total(); j++)
               ObjectDelete(0, g_intrabarObjects.At(j));
            g_intrabarObjects.Clear();
           }
         g_isTrackIntrabar = true;
        }
      else
        {
         g_isTrackIntrabar = false;
        }

      g_s.safeLimitBar = (int)MathMax(0, last_bar_index - finalLookback - safetyBuffer);
      g_s.withinLookbackWindow = (i >= 2) && (i >= last_bar_index - finalLookback);
      bool withinLookbackWindow = g_s.withinLookbackWindow;
      bool barClosed = BarClosed(i, rates_total);

      SRJ_OB_CreationPass(open,high,low,close,time,rates_total,i,
                          withinLookbackWindow,barClosed);

      SRJ_Sessions_Pass(high,low,time,rates_total,i,
                        withinLookbackWindow);

      SRJ_Bias_PerBarResetPass(barClosed);

      SRJ_OB_ActivationInvalidationPass(open,high,low,close,time,rates_total,i,
                                        withinLookbackWindow,barClosed);

      SRJ_OB_CounterAggregationPass(i,barClosed);

      SRJ_OB_InactiveLinePrunePass(withinLookbackWindow);

      SRJ_OB_OpposingCachePass(i,finalLookback,withinLookbackWindow);

      SRJ_Bias_WeakFlipLatchPass();

      SRJ_FVG_CreationRenewalPass(high,low,time,rates_total,i,
                                  withinLookbackWindow,barClosed);

      SRJ_FVG_FillDetectionPass(open,close,high,low,i,withinLookbackWindow,barClosed);

      SRJ_FVG_TickValidRecomputePass(withinLookbackWindow);

      SRJ_Bias_StructureDetectionPass(high,low,i,finalLookback,
                                      withinLookbackWindow,barClosed);

      SRJ_Bias_DecisionBlock(i,withinLookbackWindow,barClosed);

      SRJ_Alerts_DispatchBiasRenewal(i);
      SRJ_OB_DeferredPromotionPass(i,barClosed);
      SRJ_Draw_BiasAndRenewalLines(high,low,time,rates_total,i);
      SRJ_FVG_DrawRefreshPass(time,rates_total,i,withinLookbackWindow);
      SRJ_EmitFractals(high,low,close,i,last_bar_index,finalLookback,inShowFractals);
      SRJ_Panels_BiasPane(open,high,low,close,time,rates_total,i,
                          inShowBiasPane,inBiasPaneOffsetBars);

      SRJ_OB_PruningPass(withinLookbackWindow);
      SRJ_FVG_PruningPass(withinLookbackWindow);
      if(withinLookbackWindow)
        {
         SRJ_PruneBiasChangeLines(inKeepBiasChangeLinesCount);
         SRJ_PruneStructureRenewalLines(inKeepStructureRenewalLinesCount);
        }

      // [NEW EXPORT BLOCK] ------------------------------------------------------
      // Write out all state variables to the calculation buffers for EA consumption
      int target = i - 1;
      if(target >= 0)
        {
         g_bufBias[target] = (g_s.currentBias == "bullish") ? 1.0 : (g_s.currentBias == "bearish" ? -1.0 : 0.0);
         g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;
         g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;
         g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;
         {
         // [Task 155] BUFFER 34 CONTRACT.
         // This buffer names the PROVENANCE of the g_s.tickOBIsValid value
         // present at this export block on the exported bar, and nothing else.
         // The indicator reads that flag elsewhere in the same bar with other
         // values, so no claim about the weak-flip latch, the checklist, the
         // decision block or the bias pane colour may be built on this buffer.
         // CARRIED is derived by comparing the recorded setter bar against i,
         // the processing bar of the enclosing loop. It is NEVER compared
         // against target.
         // VALUES
         //   EMPTY_VALUE  outside the calculated window
         //   greater than 0.0  objId of the LAST qualifying orderblock
         //                invalidation on this bar, written this bar by site
         //                code 1, 2, 3 or 4
         //   -3.0         carried: the recorded setter bar is not i
         //   -11.0        site 5, bullish FVG creation or renewal reset. An
         //                object is in scope; the source names none
         //   -12.0        site 6, bearish FVG creation or renewal reset
         //   -21.0        site 7, decision block doRenewal. No object in scope
         //   -22.0        site 8, decision block flip. No object in scope
         //   -31.0        site 9, SRJ_StateInit default, no write since
         //   -9.0         invariant violated: setter bar greater than i, objId
         //                not positive at a named site, objId outside the exact
         //                long-to-double range 9007199254740992, or a site code
         //                outside this set
         // Buffers 35 and 36 are REGISTERED here and receive the single
         // explicit sentinel -99.0 meaning POPULATION DEFERRED: buffer 36 to
         // Task 163, buffer 35 to Task 156. No consumer may read -99.0 as a
         // provenance.
         long   t155ProvId   = g_s.tickOBSetterId;
         int    t155ProvCode = g_s.tickOBSetterCode;
         int    t155ProvBar  = g_s.tickOBSetterBar;
         double t155ProvOut  = -9.0;
         if(t155ProvBar > i)                           t155ProvOut = -9.0;
         else if(t155ProvCode == 9)                    t155ProvOut = -31.0;
         else if(t155ProvBar != i)                     t155ProvOut = -3.0;
         else if(t155ProvCode == 5)                    t155ProvOut = -11.0;
         else if(t155ProvCode == 6)                    t155ProvOut = -12.0;
         else if(t155ProvCode == 7)                    t155ProvOut = -21.0;
         else if(t155ProvCode == 8)                    t155ProvOut = -22.0;
         else if(t155ProvCode < 1 || t155ProvCode > 4) t155ProvOut = -9.0;
         else if(t155ProvId <= 0)                      t155ProvOut = -9.0;
         else if(t155ProvId > 9007199254740992)        t155ProvOut = -9.0;
         else                                          t155ProvOut = (double)t155ProvId;
         g_bufOBValidProv[target]  = t155ProvOut;
         g_bufFVGValidProv[target] = -99.0;
         g_bufOppFVGProv[target]   = -99.0;
         }
         
          g_bufSwingHigh[target] = EMPTY_VALUE;
          g_bufSwingLow[target]  = EMPTY_VALUE;
          g_bufSwingHighImb[target] = EMPTY_VALUE;
          g_bufSwingLowImb[target]  = EMPTY_VALUE;
          if(i >= 2)
            {
             if(SRJ_isStrictFractalHigh(high, i, 1))
               {
                g_bufSwingHigh[target] = high[target];
                // [P-SWINGIMB] Same branch, identical index: the flag describes
                // this swing only. g_imbalances + structLegBoundary are in scope
                // in this pass (halt condition checked, not relocated).
                int tsw_codeH = SrjSwingImbCode(target, true);
                g_bufSwingHighImb[target] = (double)tsw_codeH;
                SrjSwingImbCount(true, tsw_codeH);
                SrjSwingImbProgress();
                if(g_htfDebugLog)
                   Print("SWINGIMB t=", SRJ_BarTimeStr(target),
                         " side=HIGH code=", tsw_codeH);
               }
             if(SRJ_isStrictFractalLow(low, i, 1))
               {
                g_bufSwingLow[target]  = low[target];
                int tsw_codeL = SrjSwingImbCode(target, false);
                g_bufSwingLowImb[target] = (double)tsw_codeL;
                SrjSwingImbCount(false, tsw_codeL);
                SrjSwingImbProgress();
                if(g_htfDebugLog)
                   Print("SWINGIMB t=", SRJ_BarTimeStr(target),
                         " side=LOW code=", tsw_codeL);
               }
            }
         
         g_bufPrevDayHigh[target] = g_s.prevDayHigh;
         g_bufPrevDayLow[target]  = g_s.prevDayLow;
         g_bufAsiaHigh[target]    = g_s.asiaHigh;
         g_bufAsiaLow[target]     = g_s.asiaLow;
         g_bufLondonHigh[target]  = g_s.londonHigh;
         g_bufLondonLow[target]   = g_s.londonLow;
         g_bufNyHigh[target]      = g_s.nyHigh;
         g_bufNyLow[target]       = g_s.nyLow;
         g_bufPmHigh[target]      = g_s.pmHigh;
         g_bufPmLow[target]       = g_s.pmLow;
         g_bufPdAsiaHigh[target]  = g_s.prevAsiaHigh;
         g_bufPdAsiaLow[target]   = g_s.prevAsiaLow;
         g_bufPdLondonHigh[target]= g_s.prevLondonHigh;
         g_bufPdLondonLow[target] = g_s.prevLondonLow;
         g_bufPdNyHigh[target]    = g_s.prevNYHigh;
         g_bufPdNyLow[target]     = g_s.prevNYLow;
         g_bufPdPmHigh[target]    = g_s.prevPMHigh;
         g_bufPdPmLow[target]     = g_s.prevPMLow;
         
         int sweepVal = 0;
         if(!g_s.freshSweepExpired && !SrjIsNa(g_s.freshSweepTag))
           {
            if(g_s.freshSweepTag == "AS.H") sweepVal = 1;
            else if(g_s.freshSweepTag == "AS.L") sweepVal = 2;
            else if(g_s.freshSweepTag == "LD.H") sweepVal = 3;
            else if(g_s.freshSweepTag == "LD.L") sweepVal = 4;
            else if(g_s.freshSweepTag == "NY.H") sweepVal = 5;
            else if(g_s.freshSweepTag == "NY.L") sweepVal = 6;
            else if(g_s.freshSweepTag == "PM.H") sweepVal = 7;
            else if(g_s.freshSweepTag == "PM.L") sweepVal = 8;
           }
         g_bufSweepTag[target] = (double)sweepVal;
         
         string h1_b = inUseConfirmedHTFOnly ? g_htfHi.outCBias : g_htfHi.outBias;
         string h2_b = inUseConfirmedHTFOnly ? g_htfMid.outCBias : g_htfMid.outBias;
         string h3_b = inUseConfirmedHTFOnly ? g_htfLo.outCBias : g_htfLo.outBias;
         g_bufHtfHi[target]  = (h1_b == "Bull") ? 1.0 : (h1_b == "Bear" ? -1.0 : 0.0);
         g_bufHtfMid[target] = (h2_b == "Bull") ? 1.0 : (h2_b == "Bear" ? -1.0 : 0.0);
         g_bufHtfLo[target]  = (h3_b == "Bull") ? 1.0 : (h3_b == "Bear" ? -1.0 : 0.0);

         // [SECTION 8 EXPORT BLOCK] ---------------------------------------------
         // XOB "in play": nearest valid+activated+promoted in-bias OB, ANY age
         // (Part A resolved G-8: "regardless of age, whose zone the current/
         // freshest market structure is now retesting").
         g_bufXobZoneHigh[target] = EMPTY_VALUE;
         g_bufXobZoneLow[target]  = EMPTY_VALUE;
         g_bufXobObjId[target]    = 0.0;   // [Task 102] 0 = no object selected
         g_bufXobPromoTime[target] = 0.0;   // [Task 113] 0 = unset or never promoted
         if(!SrjIsNa(g_s.currentBias))
           {
            int xobIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);
            if(xobIdx >= 0)
              {
               COrderblock *xob = GetOB(g_orderblocks, xobIdx);
               if(xob != NULL)
                 {
                  g_bufXobZoneHigh[target] = xob.high;
                  g_bufXobZoneLow[target]  = xob.low;
                  g_bufXobObjId[target]    = (double)xob.objId;   // [Task 102]
                  // [Task 113] Same branch, same pointer as the bounds and the
                  // id above, so all four values describe one order block.
                  // promotionBar is long and SRJ_BarTime takes int, so the cast
                  // is explicit. SrjIsNa is tested on the cast value.
                  int t113_pb = (int)xob.promotionBar;
                  if(!SrjIsNa(t113_pb) && t113_pb >= 0 && t113_pb < rates_total)
                    {
                     datetime t113_pt = SRJ_BarTime(t113_pb);
                     if(t113_pt > 0)
                        g_bufXobPromoTime[target] = (double)t113_pt;
                    }
                 }
              }
           }

         // FVG-to-XOB expansion-leg membership: freshest in-bias, unfilled FVG
         // within the current still-open leg (startBar >= obInvalidationBoundary),
         // gated on the leg actually having a promoted XOB backing it
         // (g_s.currentLegHasXOB — see SRJ_State.mqh / SRJ_BiasEngine.mqh /
         // SRJ_OrderblockMgr.mqh). This is an engineering approximation of
         // "the XOB that started the current leg": it doesn't track the one
         // specific OB, just whether ANY promotion has resolved since the leg
         // began — see the Pass 21 handoff note for why, and for the residual
         // edge-case risk this leaves open.
         g_bufFvgLegZoneHigh[target] = EMPTY_VALUE;
         g_bufFvgLegZoneLow[target]  = EMPTY_VALUE;
         g_bufFvgObjId[target]       = 0.0;   // [Task 102] 0 = no object selected
         if(!SrjIsNa(g_s.currentBias) && g_s.currentLegHasXOB &&
            !SrjIsNa(g_s.structLegBoundary))
           {
            int freshFvgIdx = -1;
            int freshFvgBar = SRJ_NA_INT;
            double freshFvgDist = 0.0;   // [EA-30] selected FVG's nearest-to-price distance
            int nFvg = g_imbalances.Total();
            for(int fk = 0; fk < nFvg; fk++)
              {
               CImbalance *fvg = GetFVG(g_imbalances, fk);
               if(fvg == NULL)                                   continue;
               bool fvgMatches = (g_s.currentBias == "bullish" && fvg.isBullish) ||
                                 (g_s.currentBias == "bearish" && !fvg.isBullish);
               if(!fvgMatches)                                   continue;
               if(fvg.isFilled)                                  continue;
               //--- [P-FVGVALIDITY E2 / operator 2026-09-11] offer the untested
               //--- remainder, never the covered part. Covered (empty remainder)
               //--- offers nothing but is NOT dead (§0A). No minimum-size gate:
               //--- a one-point remainder still exports.
               double fvgExpTop = fvg.top;
               double fvgExpBot = fvg.bottom;
               if(!SrjIsNa(fvg.remTop) && !SrjIsNa(fvg.remBottom))
                 {
                  fvgExpTop = fvg.remTop;
                  fvgExpBot = fvg.remBottom;
                 }
               if(fvgExpTop <= fvgExpBot)                         continue;
               // [Task 61 / EA-62] Option A BAR-penetration pre-filter REMOVED. Was: if(!(high[i] >= fvg.bottom && low[i] <= fvg.top)) continue; — it exported an FVG only on a bar physically overlapping it, making buffers 24/25 a single-bar flag rather than a projected zone. In-play adjudication belongs to the EA's ZoneInPlay (Ruling 8), not upstream. Measured: 118/576 bars populated, none of them an S3 bar.
               double srj_pxRef  = close[i];   // [EA-30] nearest-to-price tie reference
               double srj_curDist = (srj_pxRef >= fvgExpBot && srj_pxRef <= fvgExpTop) ? 0.0
                                    : MathMin(MathAbs(srj_pxRef - fvgExpTop), MathAbs(srj_pxRef - fvgExpBot));
               if(fvg.startBar < g_s.structLegBoundary)      continue;  // [EA-30] current structural leg
               if(freshFvgIdx < 0 || srj_curDist < freshFvgDist || (srj_curDist == freshFvgDist && fvg.startBar > freshFvgBar))
                 {
                  freshFvgIdx = fk;
                  freshFvgBar = fvg.startBar;
                  freshFvgDist = srj_curDist;   // [EA-30]
                 }
              }
            if(freshFvgIdx >= 0)
              {
               CImbalance *freshFvg = GetFVG(g_imbalances, freshFvgIdx);
               if(freshFvg != NULL)
                 {
                  double expTop = freshFvg.top;
                  double expBot = freshFvg.bottom;
                  if(!SrjIsNa(freshFvg.remTop) && !SrjIsNa(freshFvg.remBottom) &&
                     freshFvg.remTop > freshFvg.remBottom)
                    {
                     expTop = freshFvg.remTop;
                     expBot = freshFvg.remBottom;
                    }
                  g_bufFvgLegZoneHigh[target] = expTop;
                  g_bufFvgLegZoneLow[target]  = expBot;
                  g_bufFvgObjId[target]       = (double)freshFvg.objId;   // [Task 102]
                 }
              }
           }

         // [Task 25] Stop-loss structural reference (closes EA-8b for the XOB case).
         // Protective extreme of the in-bias order block that backs the entry zone,
         // selected with the SAME selector the XOB zone export above uses, so the
         // stop reference and the XOB zone always describe one order block.
         //   buffer 26 = that order block's own protective extreme
         //   buffer 27 = the protective extreme of that order block's swing bar
         // These two differ: SRJ_OB_CreationPass picks the deeper of two candidate
         // candles for the OB, while swingBar is always the fractal bar.
         // Both EMPTY_VALUE when there is no bias or no qualifying promoted OB.
         // Read-only query. Nothing in this indicator consumes either buffer.
          g_bufObStructExtreme[target] = EMPTY_VALUE;
          g_bufObSwingExtreme[target]  = EMPTY_VALUE;
          g_bufObSwingTime[target]     = 0.0;
          if(!SrjIsNa(g_s.currentBias))
            {
             int slObIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);
             if(slObIdx >= 0)
               {
                COrderblock *slOb = GetOB(g_orderblocks, slObIdx);
                if(slOb != NULL)
                  {
                   bool slBiasIsBull = (g_s.currentBias == "bullish");
                   g_bufObStructExtreme[target] = slBiasIsBull ? slOb.low : slOb.high;
                   if(!SrjIsNa(slOb.swingBar) && slOb.swingBar >= 0 && slOb.swingBar <= i)
                      g_bufObSwingExtreme[target] = slBiasIsBull ? low[slOb.swingBar]
                                                                : high[slOb.swingBar];
                   // [P-SWINGIMB-2 E5] Same branch, same object pointer as 26
                   // and 27 above: the OB's swing-bar time. Buffer-33 encoding.
                   // The pointer exposes swingBar (used for 27), so no halt.
                   if(!SrjIsNa(slOb.swingBar) && slOb.swingBar >= 0 && slOb.swingBar <= i)
                     {
                      datetime tsw_obst = SRJ_BarTime(slOb.swingBar);
                      if(tsw_obst > 0)
                         g_bufObSwingTime[target] = (double)tsw_obst;
                     }
                  }
               }
            if(g_htfDebugLog && SRJ_InDebugWindow(i))
               Print("SRJ SLREF t=", SRJ_BarTimeStr(target),
                     " bias=", g_s.currentBias,
                     " obIdx=", slObIdx,
                     " obExtreme=", g_bufObStructExtreme[target],
                     " swingExtreme=", g_bufObSwingExtreme[target]);
           }

         // [Task 27] Structural-renewal boundary. Read-only query, nothing in
         // this indicator consumes this buffer. 0.0 when unset or out of range.
         g_bufRenewalBoundaryTime[target] = 0.0;
         if(!SrjIsNa(g_s.obInvalidationBoundary) &&
            g_s.obInvalidationBoundary >= 0 &&
            g_s.obInvalidationBoundary < rates_total)
           {
            datetime rbT = SRJ_BarTime(g_s.obInvalidationBoundary);
            if(rbT > 0)
               g_bufRenewalBoundaryTime[target] = (double)rbT;
           }
         if(g_htfDebugLog && SRJ_InDebugWindow(i))
            Print("SRJ RENEWBOUND t=", SRJ_BarTimeStr(target),
                  " boundaryBar=", g_s.obInvalidationBoundary,
                  " boundaryTime=", (g_bufRenewalBoundaryTime[target] > 0.0
                                     ? TimeToString((datetime)g_bufRenewalBoundaryTime[target],
                                                    TIME_DATE|TIME_MINUTES)
                                     : "none"));

         // [Task 39 / EA-26 + EA-51] Packed swept + session-live mask, buffer 29.
         // Read via ReadFlow in the EA; the settled-slot offset the rest of this
         // block relies on applies unchanged. g_s swept flags reflect bar i's
         // processing (SRJ_Sessions_Pass has already run this bar); SRJ_GetSessionId
         // is evaluated on the same bar time so swept and live states are aligned.
         int swMask = 0;
         if(g_s.pdHighSwept)     swMask |= (1 << 0);
         if(g_s.pdLowSwept)      swMask |= (1 << 1);
         if(g_s.asiaHighSwept)   swMask |= (1 << 2);
         if(g_s.asiaLowSwept)    swMask |= (1 << 3);
         if(g_s.londonHighSwept) swMask |= (1 << 4);
         if(g_s.londonLowSwept)  swMask |= (1 << 5);
         if(g_s.nyHighSwept)     swMask |= (1 << 6);
         if(g_s.nyLowSwept)      swMask |= (1 << 7);
         if(g_s.pmHighSwept)     swMask |= (1 << 8);
         if(g_s.pmLowSwept)      swMask |= (1 << 9);
         if(g_s.pdAsiaHighSwept)   swMask |= (1 << 14);
         if(g_s.pdAsiaLowSwept)    swMask |= (1 << 15);
         if(g_s.pdLondonHighSwept) swMask |= (1 << 16);
         if(g_s.pdLondonLowSwept)  swMask |= (1 << 17);
         if(g_s.pdNyHighSwept)     swMask |= (1 << 18);
         if(g_s.pdNyLowSwept)      swMask |= (1 << 19);
         if(g_s.pdPmHighSwept)     swMask |= (1 << 20);
         if(g_s.pdPmLowSwept)      swMask |= (1 << 21);
         int liveSid = SRJ_GetSessionId(time[i]);
         if(liveSid == 0)      swMask |= (1 << 10);
         else if(liveSid == 1) swMask |= (1 << 11);
         else if(liveSid == 2) swMask |= (1 << 12);
         else if(liveSid == 3) swMask |= (1 << 13);
         g_bufSweptMask[target] = (double)swMask;

         // [Task 50 / EA-59b] Structural-leg boundary time, buffer 30. Mirrors the
         // buffer-28 export pattern exactly, but reads structLegBoundary instead of
         // obInvalidationBoundary. Read-only query — nothing in this indicator
         // consumes this buffer.
         g_bufStructLegTime[target] = 0.0;
         if(!SrjIsNa(g_s.structLegBoundary) &&
            g_s.structLegBoundary >= 0 &&
            g_s.structLegBoundary < rates_total)
           {
            datetime slbT = SRJ_BarTime(g_s.structLegBoundary);
            if(slbT > 0)
               g_bufStructLegTime[target] = (double)slbT;
           }
         if(g_htfDebugLog && SRJ_InDebugWindow(i))
            Print("SRJ STRUCTLEG t=", SRJ_BarTimeStr(target),
                  " legBar=", g_s.structLegBoundary,
                  " legTime=", (g_bufStructLegTime[target] > 0.0
                                ? TimeToString((datetime)g_bufStructLegTime[target],
                                               TIME_DATE|TIME_MINUTES)
                                : "none"));
         if(g_htfDebugLog && SRJ_InDebugWindow(i))
            Print("SRJ SWEPTMASK t=", SRJ_BarTimeStr(target),
                  " mask=", swMask, " liveSid=", liveSid);
         // [END SECTION 8 EXPORT BLOCK] -------------------------------------------
         
         if(g_htfDebugLog && SRJ_InDebugWindow(i))
           {
            Print("SRJ EXPORT t=", SRJ_BarTimeStr(target),
                  " bias=", g_bufBias[target],
                  " obOK=", g_bufOBValid[target],
                  " fvgOK=", g_bufFVGValid[target],
                  " oppFVG=", g_bufOppFVG[target],
                  " sweep=", g_bufSweepTag[target],
                  " htf=", g_bufHtfHi[target], "/", g_bufHtfMid[target], "/", g_bufHtfLo[target]);
           }
        }
      // [END NEW EXPORT BLOCK] --------------------------------------------------

      if(SRJ_InDebugWindow(i))
         Print("SRJ BIASEND t=", SRJ_BarTimeStr(i),
               " bar=", i,
               " bias=", g_s.currentBias);
     }

   SRJ_HTF_RunAll(inHtfLookbackBars,inHtfMaxTrackedObjects,
                  inUseConfirmedHTFOnly,time[last_bar_index]);

   SRJ_Panels_DataWarning(inShowDataWarnings, rates_total - 1, rates_total);

   string h1_b, h1_2, h1_3, h1_o;
   string h2_b, h2_2, h2_3, h2_o;
   string h3_b, h3_2, h3_3, h3_o;
   SRJ_HTF_GetOutputs(g_htfHi, inUseConfirmedHTFOnly, h1_b, h1_2, h1_3, h1_o);
   SRJ_HTF_GetOutputs(g_htfMid, inUseConfirmedHTFOnly, h2_b, h2_2, h2_3, h2_o);
   SRJ_HTF_GetOutputs(g_htfLo, inUseConfirmedHTFOnly, h3_b, h3_2, h3_3, h3_o);

   SRJ_Panels_MTFBox(inAutoDetectERLSweep, g_erlSweepFromStr, g_erlTargetToStr,
                     g_htfHighTargetStr, g_htfMidTargetStr, g_htfLowTargetStr,
                     g_alertNumber, g_erlAlertNumber,
                     inShowLiquiditySweepDebugLabel, inShowLiquidityLevelsDebug,
                     rates_total - 1, rates_total,
                     h1_b, h1_2, h1_3, h1_o,
                     h2_b, h2_2, h2_3, h2_o,
                     h3_b, h3_2, h3_3, h3_o);

   g_lastBarTime  = time[lastIdx];
   g_firstBarTime = time[0];

   return(rates_total);
  }
//+------------------------------------------------------------------+