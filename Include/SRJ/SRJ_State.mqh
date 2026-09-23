#ifndef __SRJ_STATE_MQH__
#define __SRJ_STATE_MQH__

#include "SRJ_Types.mqh"
#include <Arrays\ArrayString.mqh>

// ===== INPUT MIRRORS =====
bool  g_showValidBullishOB;
bool  g_showValidBearishOB;
bool  g_showInvalidatedBullishOB;
bool  g_showInvalidatedBearishOB;
bool  g_showInactiveBullishOB;
bool  g_showInactiveBearishOB;
bool  g_extendValid;
bool  g_extendInactive;
bool  g_extendInvalidated;
int   g_lineExtension;
int   g_lineThickness;
int   g_extremeOBExtraThickness;
int   g_keepInvalidatedCount;
color g_bullishOBColor;
color g_bearishOBColor;
color g_validMidlineColor;
color g_invalidatedBullishColor;
color g_invalidatedBearishColor;
color g_invalidatedMidlineColor;
color g_inactiveBullishColor;
color g_inactiveBearishColor;
color g_inactiveMidlineColor;
bool  g_showFVG;
bool  g_showMidline;
int   g_fvgExtension;
int   g_fvgBorderWidth;
color g_bullishFVGColor;
color g_bearishFVGColor;
color g_bullishFVGBorderColor;
color g_bearishFVGBorderColor;
color g_invalidatedFVGFillColor;
color g_invalidatedFVGBorderColor;
int   g_keepInvalidatedFVGCount;
bool  g_deleteFVGAfterFill;
string g_asiaSession;
string g_londonSession;
string g_nySession;
string g_pmSession;
string g_sessionTimezone;
bool  g_showSessionHiLoLines;
bool  g_showPDHiLoLines;
int   g_sessionHiLoLineWidth;
int   g_dailyHiLoLineWidth;
int   g_sessionRetentionDays;
double g_liquiditySweepBufferPoints;
int   g_brokerToUTCOffsetHours;
int   g_dailyAnchorMode;   // 0 = broker/chart midnight, 1 = New York midnight, 2 = custom broker hour
int   g_dailyAnchorHour;   // broker-time hour the daily window rolls over (mode 2 only)
bool  g_autoDetectERLSweep;
bool  g_showLiquiditySweepDebugLabel;
bool  g_showLiquidityLevelsDebug;
bool  g_showBiasPane;
int   g_biasPaneOffsetBars;
string g_mtfBoxTextSize;
string g_dataWarningPosition;
string g_dataWarningSize;
bool  g_showDataWarnings;
string g_robustnessModeStr;
bool  g_useAsciiFallback;
string g_erlSweepFromStr;
string g_erlTargetToStr;
double g_alertNumber;
double g_erlAlertNumber;
string g_htfHighTargetStr;
string g_htfMidTargetStr;
string g_htfLowTargetStr;
bool  g_enableBiasFlipAlerts;
bool  g_enableStructureRenewalAlerts;
bool  g_enableExtremeOBPromotionAlerts;
bool  g_alertSendPush;
bool  g_alertSendEmail;
bool  g_showBiasChangeLines;
color g_biasChangeLineColorBullish;
color g_biasChangeLineColorBearish;
int   g_biasChangeLineWidth;
bool  g_showStructureRenewalLines;
color g_structureRenewalLineColorBullish;
color g_structureRenewalLineColorBearish;
int   g_structureRenewalLineWidth;
int   g_keepBiasChangeLinesCount;
int   g_keepStructureRenewalLinesCount;
int    g_fractalAtrLength;
double g_fractalOffsetMult;
bool   g_htfDebugLog;

//+------------------------------------------------------------------+
//| SState — every Pine `var` scalar, grouped by Pine section.       |
//+------------------------------------------------------------------+
struct SState
  {
   double   priceATRValue;
   int      effectiveLookback;
   int      baseLookback;
   int      robustnessLimitBars;
   int      usedBars;
   double   coverageDays;
   string   coverageText;

   string   currentBias;
   int      currentStructureStartBar;
   int      lastRelevantStructureBar;
   int      lastBullishOBInvalidationBar;
   int      lastBearishOBInvalidationBar;
   int      newAnchorBar;
   int      bestBullishOBBar;
   double   bestBullishOBHigh;
   double   bestBullishOBLow;
   double   bestBullishOBOpen;
   int      bestBearishOBBar;
   double   bestBearishOBHigh;
   double   bestBearishOBLow;
   double   bestBearishOBOpen;
   int      cachedSwingBarBullish;
   int      cachedSwingBarBearish;
   int      obInvalidationBoundary;
   int      fvgDetectionBoundary;
   bool     currentLegHasXOB;      // [Section 8] true once any promotion resolves within the current leg
   int      structLegBoundary;     // [EA-30] structural-leg boundary; advances only on initial bias, flip, fvgRenewal
   bool     tickOBIsValid;
   bool     tickFVGIsValid;
   bool     hasPersistedOpposingFVG;
   int      inBiasOBInvalidationCount;
   int      opposingOBInvalidationCount;
   int      bullishOBInvalidationCount;
   int      bearishOBInvalidationCount;
   int      firstBullishOBInvalidationBar;
   int      firstBearishOBInvalidationBar;
   bool     bullishOBCountedThisBar;
   bool     bearishOBCountedThisBar;
   int      bullishOBInvalidationsThisBar;
   int      bearishOBInvalidationsThisBar;
   bool     isDoubleOB;
   bool     isInitialFlipBar;
   bool     checklistActivated;
   bool     weakFlipPreconditionMet;
   bool     suppressBiasPaneStatusThisBar;
   bool     structureConfirmedThisBar;
   bool     wasBiasFlip;
   string   oldBias;
   bool     justChangedBias;
   bool     initialBiasJustSet;
   bool     drawBiasLineNow;
   string   newBiasDirection;
   bool     drawStructureRenewalLineNow;
   string   renewalDirection;
   bool     bullishBiasFlipAlert;
   bool     bearishBiasFlipAlert;
   bool     bullishStructureRenewalAlert;
   bool     bearishStructureRenewalAlert;
   string   biasLabelName;
   int      lastRenewalOBBar;
   int      pendingPromoteBar;
   string   pendingPromoteBias;
   string   pendingPromoteMode;
   int      pendingPromoteBoundary;
   int      pendingPromoteTargetBar;
   int      pendingPromoteBar2;
   string   pendingPromoteBias2;
   string   pendingPromoteMode2;
   int      pendingPromoteBoundary2;
   int      pendingPromoteTargetBar2;
   int      safeLimitBar;
   int      strictLimitBar;
   bool     withinLookbackWindow;

   int      sessDay;
   int      sessLastProcessedBar;   // NEW: exactly-once commit watermark
   double   dayHigh;
   double   dayLow;
   double   prevDayHigh;
   double   prevDayLow;
   double   asiaHigh;
   double   asiaLow;
   double   londonHigh;
   double   londonLow;
   double   nyHigh;
   double   nyLow;
   double   pmHigh;
   double   pmLow;

   // FIX: Previous session highs/lows — cached before reset so inter-session
   //      gap sweeps can still reference the just-ended session's levels.
   double   prevAsiaHigh;
   double   prevAsiaLow;
   double   prevLondonHigh;
   double   prevLondonLow;
   double   prevNYHigh;
   double   prevNYLow;
   double   prevPMHigh;
   double   prevPMLow;

   bool     asiaHighSwept;
   bool     asiaLowSwept;
   bool     londonHighSwept;
   bool     londonLowSwept;
   bool     nyHighSwept;
   bool     nyLowSwept;
   bool     pmHighSwept;
   bool     pmLowSwept;
   bool     pdHighSwept;
   bool     pdLowSwept;
   bool     pdAsiaHighSwept;
   bool     pdAsiaLowSwept;
   bool     pdLondonHighSwept;
   bool     pdLondonLowSwept;
   bool     pdNyHighSwept;
   bool     pdNyLowSwept;
   bool     pdPmHighSwept;
   bool     pdPmLowSwept;
   int      dayStartBar;
   int      prevDayStartBar;
   int      prevDayEndBar;
   bool     pdLinesDeletedToday;
   bool     pdLinesCreatedForDay;
   bool     wasInAsia;
   bool     wasInLondon;
   bool     wasInNY;
   bool     wasInPM;
   int      asiaStartBar;
   int      londonStartBar;
   int      nyStartBar;
   int      pmStartBar;
   int      asiaSessionDay;
   int      londonSessionDay;
   int      nySessionDay;
   int      pmSessionDay;
   string   asiaHighLineName;
   string   asiaLowLineName;
   string   londonHighLineName;
   string   londonLowLineName;
   string   nyHighLineName;
   string   nyLowLineName;
   string   pmHighLineName;
   string   pmLowLineName;
   string   lastSweepTag;
   int      lastSweepBar;
   string   erlBias;

   string   currentSessionSlot;
   int      currentSlotStartBar;
   string   freshSweepTag;
   int      freshSweepBar;
   string   freshSweepExpirySession;
   bool     freshSweepExpired;

   string   mtfBoxName;
   string   dataWarningName;
   // [Task 155] Buffer 34 transport. These three fields carry the
   // provenance of the tickOBIsValid value to the export block. long is
   // required here, not matched: COrderblock declares objId as long in
   // SRJ_Types.mqh, and truncating it would make the exported identity
   // unverifiable. Exact long-to-double conversion holds only inside the
   // safe integer range 9007199254740992. The value contract for the
   // exported buffer is stated beside the export write, not here.
   long     tickOBSetterId;
   int      tickOBSetterCode;
   int      tickOBSetterBar;
  };

SState g_s;

CArrayObj g_orderblocks;
CArrayObj g_imbalances;
CArrayObj g_biasChangeLines;
CArrayObj g_structureRenewalLines;

CArrayInt g_bullishInvalidationBarsHistory;
CArrayInt g_bearishInvalidationBarsHistory;

CArrayObj g_pdHighLines;
CArrayObj g_pdLowLines;
CArrayObj g_asiaHighLines;
CArrayObj g_asiaLowLines;
CArrayObj g_londonHighLines;
CArrayObj g_londonLowLines;
CArrayObj g_nyHighLines;
CArrayObj g_nyLowLines;
CArrayObj g_pmHighLines;
CArrayObj g_pmLowLines;

class SLineRef : public CObject
  {
public:
   string   name;
            SLineRef(string n=""){ name=n; }
  };
SLineRef *NewLineRef(string n){ return new SLineRef(n); }
SLineRef *GetLineRef(CArrayObj &a,int idx){ return (SLineRef*)a.At(idx); }

int  g_alertBar_bullFlip     = SRJ_NA_INT;
int  g_alertBar_bearFlip     = SRJ_NA_INT;
int  g_alertBar_bullRenewal  = SRJ_NA_INT;
int  g_alertBar_bearRenewal  = SRJ_NA_INT;
int  g_alertBar_extPromote   = SRJ_NA_INT;

long              g_objSeq       = 0;
double            g_mintick      = 0.0;
bool              g_newBar       = false;
datetime          g_lastBarTime  = 0;
int               g_finalLookback= 5000;
ENUM_TIMEFRAMES   g_htfHighTF    = PERIOD_H4;
ENUM_TIMEFRAMES   g_htfMidTF     = PERIOD_H1;
ENUM_TIMEFRAMES   g_htfLowTF     = PERIOD_M15;

CArrayString      g_intrabarObjects;
bool              g_isTrackIntrabar = false;

void SRJ_StateInit()
  {
   g_s.priceATRValue       = SRJ_NA_DBL;
   g_s.effectiveLookback   = 5000;
   g_s.baseLookback        = 5000;
   g_s.robustnessLimitBars = 5000;
   g_s.usedBars            = 0;
   g_s.coverageDays        = 0.0;
   g_s.coverageText        = "";

   g_s.currentBias                    = SRJ_NA_STR;
   g_s.currentStructureStartBar       = SRJ_NA_INT;
   g_s.lastRelevantStructureBar       = SRJ_NA_INT;
   g_s.lastBullishOBInvalidationBar   = SRJ_NA_INT;
   g_s.lastBearishOBInvalidationBar   = SRJ_NA_INT;
   g_s.newAnchorBar                   = SRJ_NA_INT;
   g_s.bestBullishOBBar               = SRJ_NA_INT;
   g_s.bestBullishOBHigh              = SRJ_NA_DBL;
   g_s.bestBullishOBLow               = SRJ_NA_DBL;
   g_s.bestBullishOBOpen              = SRJ_NA_DBL;
   g_s.bestBearishOBBar               = SRJ_NA_INT;
   g_s.bestBearishOBHigh              = SRJ_NA_DBL;
   g_s.bestBearishOBLow               = SRJ_NA_DBL;
   g_s.bestBearishOBOpen              = SRJ_NA_DBL;
   g_s.cachedSwingBarBullish          = SRJ_NA_INT;
   g_s.cachedSwingBarBearish          = SRJ_NA_INT;
   g_s.obInvalidationBoundary         = SRJ_NA_INT;
   g_s.fvgDetectionBoundary           = SRJ_NA_INT;
   g_s.currentLegHasXOB                = false;   // [Section 8]
   g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]
   g_s.tickOBIsValid                  = true;
   // [Task 155] Site code 9 means SRJ_StateInit default, no write since.
   // Bar -1 means no bar context exists in this function.
   g_s.tickOBSetterId                 = 0;
   g_s.tickOBSetterCode               = 9;
   g_s.tickOBSetterBar                = -1;
   g_s.tickFVGIsValid                 = true;
   g_s.hasPersistedOpposingFVG        = false;
   g_s.inBiasOBInvalidationCount      = 0;
   g_s.opposingOBInvalidationCount    = 0;
   g_s.bullishOBInvalidationCount     = 0;
   g_s.bearishOBInvalidationCount     = 0;
   g_s.firstBullishOBInvalidationBar  = SRJ_NA_INT;
   g_s.firstBearishOBInvalidationBar  = SRJ_NA_INT;
   g_s.bullishOBCountedThisBar        = false;
   g_s.bearishOBCountedThisBar        = false;
   g_s.bullishOBInvalidationsThisBar  = 0;
   g_s.bearishOBInvalidationsThisBar  = 0;
   g_s.isDoubleOB                     = false;
   g_s.isInitialFlipBar               = false;
   g_s.checklistActivated             = false;
   g_s.weakFlipPreconditionMet        = false;
   g_s.suppressBiasPaneStatusThisBar  = false;
   g_s.structureConfirmedThisBar      = false;
   g_s.wasBiasFlip                    = false;
   g_s.oldBias                        = SRJ_NA_STR;
   g_s.justChangedBias                = false;
   g_s.initialBiasJustSet             = false;
   g_s.drawBiasLineNow                = false;
   g_s.newBiasDirection               = SRJ_NA_STR;
   g_s.drawStructureRenewalLineNow    = false;
   g_s.renewalDirection               = SRJ_NA_STR;
   g_s.bullishBiasFlipAlert           = false;
   g_s.bearishBiasFlipAlert           = false;
   g_s.bullishStructureRenewalAlert   = false;
   g_s.bearishStructureRenewalAlert   = false;
   g_s.biasLabelName                  = "";
   g_s.lastRenewalOBBar               = SRJ_NA_INT;
   g_s.pendingPromoteBar              = SRJ_NA_INT;
   g_s.pendingPromoteBias             = SRJ_NA_STR;
   g_s.pendingPromoteMode             = SRJ_NA_STR;
   g_s.pendingPromoteBoundary         = SRJ_NA_INT;
   g_s.pendingPromoteTargetBar        = SRJ_NA_INT;
   g_s.pendingPromoteBar2             = SRJ_NA_INT;
   g_s.pendingPromoteBias2            = SRJ_NA_STR;
   g_s.pendingPromoteMode2            = SRJ_NA_STR;
   g_s.pendingPromoteBoundary2        = SRJ_NA_INT;
   g_s.pendingPromoteTargetBar2       = SRJ_NA_INT;
   g_s.safeLimitBar                   = 0;
   g_s.strictLimitBar                 = 0;
   g_s.withinLookbackWindow           = false;

   g_s.sessDay                = SRJ_NA_INT;
   g_s.sessLastProcessedBar   = SRJ_NA_INT;   // NEW
   g_s.dayHigh                = SRJ_NA_DBL;
   g_s.dayLow                 = SRJ_NA_DBL;
   g_s.prevDayHigh            = SRJ_NA_DBL;
   g_s.prevDayLow             = SRJ_NA_DBL;
   g_s.asiaHigh               = SRJ_NA_DBL;
   g_s.asiaLow                = SRJ_NA_DBL;
   g_s.londonHigh             = SRJ_NA_DBL;
   g_s.londonLow              = SRJ_NA_DBL;
   g_s.nyHigh                 = SRJ_NA_DBL;
   g_s.nyLow                  = SRJ_NA_DBL;
   g_s.pmHigh                 = SRJ_NA_DBL;
   g_s.pmLow                  = SRJ_NA_DBL;

   // FIX: Initialize previous session high/low cache to NA
   g_s.prevAsiaHigh       = SRJ_NA_DBL;
   g_s.prevAsiaLow        = SRJ_NA_DBL;
   g_s.prevLondonHigh     = SRJ_NA_DBL;
   g_s.prevLondonLow      = SRJ_NA_DBL;
   g_s.prevNYHigh         = SRJ_NA_DBL;
   g_s.prevNYLow          = SRJ_NA_DBL;
   g_s.prevPMHigh         = SRJ_NA_DBL;
   g_s.prevPMLow          = SRJ_NA_DBL;

   g_s.asiaHighSwept      = false;
   g_s.asiaLowSwept       = false;
   g_s.londonHighSwept    = false;
   g_s.londonLowSwept     = false;
   g_s.nyHighSwept        = false;
   g_s.nyLowSwept         = false;
   g_s.pmHighSwept        = false;
   g_s.pmLowSwept         = false;
   g_s.pdHighSwept        = false;
   g_s.pdLowSwept         = false;
   g_s.dayStartBar        = SRJ_NA_INT;
   g_s.prevDayStartBar    = SRJ_NA_INT;
   g_s.prevDayEndBar      = SRJ_NA_INT;
   g_s.pdLinesDeletedToday= false;
   g_s.pdLinesCreatedForDay=false;
   g_s.wasInAsia          = false;
   g_s.wasInLondon        = false;
   g_s.wasInNY            = false;
   g_s.wasInPM            = false;
   g_s.asiaStartBar       = SRJ_NA_INT;
   g_s.londonStartBar     = SRJ_NA_INT;
   g_s.nyStartBar         = SRJ_NA_INT;
   g_s.pmStartBar         = SRJ_NA_INT;
   g_s.asiaSessionDay     = SRJ_NA_INT;
   g_s.londonSessionDay   = SRJ_NA_INT;
   g_s.nySessionDay       = SRJ_NA_INT;
   g_s.pmSessionDay       = SRJ_NA_INT;
   g_s.asiaHighLineName   = "";
   g_s.asiaLowLineName    = "";
   g_s.londonHighLineName = "";
   g_s.londonLowLineName  = "";
   g_s.nyHighLineName     = "";
   g_s.nyLowLineName      = "";
   g_s.pmHighLineName     = "";
   g_s.pmLowLineName      = "";
   g_s.lastSweepTag       = SRJ_NA_STR;
   g_s.lastSweepBar       = SRJ_NA_INT;
   g_s.erlBias            = SRJ_NA_STR;

   g_s.currentSessionSlot     = SRJ_NA_STR;
   g_s.currentSlotStartBar    = SRJ_NA_INT;
   g_s.freshSweepTag          = SRJ_NA_STR;
   g_s.freshSweepBar          = SRJ_NA_INT;
   g_s.freshSweepExpirySession= SRJ_NA_STR;
   g_s.freshSweepExpired      = false;

   g_s.mtfBoxName      = "";
   g_s.dataWarningName = "";

   g_orderblocks.FreeMode(true);
   g_imbalances.FreeMode(true);
   g_biasChangeLines.FreeMode(true);
   g_structureRenewalLines.FreeMode(true);
   g_pdHighLines.FreeMode(true);
   g_pdLowLines.FreeMode(true);
   g_asiaHighLines.FreeMode(true);
   g_asiaLowLines.FreeMode(true);
   g_londonHighLines.FreeMode(true);
   g_londonLowLines.FreeMode(true);
   g_nyHighLines.FreeMode(true);
   g_nyLowLines.FreeMode(true);
   g_pmHighLines.FreeMode(true);
   g_pmLowLines.FreeMode(true);

   g_orderblocks.Clear();
   g_imbalances.Clear();
   g_biasChangeLines.Clear();
   g_structureRenewalLines.Clear();
   g_bullishInvalidationBarsHistory.Clear();
   g_bearishInvalidationBarsHistory.Clear();
   g_pdHighLines.Clear();
   g_pdLowLines.Clear();
   g_asiaHighLines.Clear();
   g_asiaLowLines.Clear();
   g_londonHighLines.Clear();
   g_londonLowLines.Clear();
   g_nyHighLines.Clear();
   g_nyLowLines.Clear();
   g_pmHighLines.Clear();
   g_pmLowLines.Clear();

   g_alertBar_bullFlip    = SRJ_NA_INT;
   g_alertBar_bearFlip    = SRJ_NA_INT;
   g_alertBar_bullRenewal = SRJ_NA_INT;
   g_alertBar_bearRenewal = SRJ_NA_INT;
   g_alertBar_extPromote  = SRJ_NA_INT;

   g_objSeq      = 0;
   g_srjObjIdSeq = 0;   // [Task 98a] ids restart with the object arrays
   g_newBar      = false;
   g_lastBarTime = 0;
  }

string SRJ_NextName(const string category)
  {
   g_objSeq++;
   string name = "SRJ_" + category + "_" + IntegerToString(g_objSeq);
   if(g_isTrackIntrabar)
      g_intrabarObjects.Add(name);
   return name;
  }

#endif // __SRJ_STATE_MQH__