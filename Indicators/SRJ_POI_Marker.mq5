//+------------------------------------------------------------------+
//|                                                SRJ_POI_Marker.mq5 |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "4.23"
#property description "SRJ POI Marker v4.23 - 6-anchor tick-based POC/VWAP + stateless wick-retest engine. All times are BROKER SERVER TIME."
#property indicator_chart_window
#property indicator_buffers 12
#property indicator_plots   12

#property indicator_label1   "D-POC"
#property indicator_type1    DRAW_LINE
#property indicator_width1   2
#property indicator_style1   STYLE_SOLID
#property indicator_label2   "D-VWAP"
#property indicator_type2    DRAW_LINE
#property indicator_width2   2
#property indicator_style2   STYLE_DASH

#property indicator_label3   "W-POC"
#property indicator_type3    DRAW_LINE
#property indicator_width3   2
#property indicator_style3   STYLE_SOLID
#property indicator_label4   "W-VWAP"
#property indicator_type4    DRAW_LINE
#property indicator_width4   2
#property indicator_style4   STYLE_DASH

#property indicator_label5   "M-POC"
#property indicator_type5    DRAW_LINE
#property indicator_width5   2
#property indicator_style5   STYLE_SOLID
#property indicator_label6   "M-VWAP"
#property indicator_type6    DRAW_LINE
#property indicator_width6   2
#property indicator_style6   STYLE_DASH

#property indicator_label7   "Q-POC"
#property indicator_type7    DRAW_LINE
#property indicator_width7   2
#property indicator_style7   STYLE_SOLID
#property indicator_label8   "Q-VWAP"
#property indicator_type8    DRAW_LINE
#property indicator_width8   2
#property indicator_style8   STYLE_DASH

#property indicator_label9   "Y-POC"
#property indicator_type9    DRAW_LINE
#property indicator_width9   2
#property indicator_style9   STYLE_SOLID
#property indicator_label10  "Y-VWAP"
#property indicator_type10   DRAW_LINE
#property indicator_width10  2
#property indicator_style10  STYLE_DASH

#property indicator_label11  "F-POC"
#property indicator_type11   DRAW_LINE
#property indicator_width11  2
#property indicator_style11  STYLE_SOLID
#property indicator_label12  "F-VWAP"
#property indicator_type12   DRAW_LINE
#property indicator_width12  2
#property indicator_style12  STYLE_DASH

#include <SRJ/SRJ_TickCore.mqh>
#include <SRJ/SRJ_SeedFormat.mqh>

//====================== PRIMARY INPUTS ==============================
//--- THESE THREE MUST STAY FIRST AND NO input group MAY PRECEDE THEM.
//--- SRJ_FlowNexus_EA passes exactly three positional parameters through
//--- iCustom: InpUseSeed, InpBinPips, InpWeightMode. An `input group` occupies
//--- a positional slot in that list, so the two groups that used to sit at and
//--- before position 1 shifted every passed value by one. Measured on a
//--- 2026.07.27 -> 08.18 run with the EA passing false / 0.7 / 1, the indicator
//--- reported useSeed=YES binPips=0.1 weightMode=0: the EA's 0.7 landed in
//--- InpUseSeed and read as TRUE, the EA's 1 was swallowed by the Binning
//--- group, and the last two reverted to the defaults below. Nothing reported
//--- it, because those defaults happened to match what the EA was sending.
//--- Groups are cosmetic. Correctness is not. Do not put a group above these.
input bool             InpUseSeed    = true;              // iCustom position 1
input double           InpBinPips    = 0.1;                // iCustom position 2
input ENUM_WEIGHT_MODE InpWeightMode = WEIGHT_TICKCOUNT;  // iCustom position 3

input group "FOMC anchor (slot 5) - times are SERVER TIME, pre-converted"
input string InpFomcTimesServer   = "2026.07.29 21:00";
input bool   InpShowAnchorMarker = true;

input group "Alerts"
input bool InpEnableAlerts = true;
input int  InpMinAlertRank = 12;

input group "Line colours (COLOR = period, STYLE = metric)"
input color InpColDaily     = clrYellow;
input color InpColWeekly    = clrOrange;
input color InpColMonthly   = clrRed;
input color InpColQuarterly = clrGray;
input color InpColYearly    = clrBlack;
input color InpColFOMC      = clrMediumPurple;

input group "Line visibility"
input bool InpShow_Daily_POC       = true;
input bool InpShow_Daily_VWAP      = true;
input bool InpShow_Weekly_POC      = true;
input bool InpShow_Weekly_VWAP     = true;
input bool InpShow_Monthly_POC     = true;
input bool InpShow_Monthly_VWAP    = true;
input bool InpShow_Quarterly_POC   = true;
input bool InpShow_Quarterly_VWAP  = true;
input bool InpShow_Yearly_POC      = true;
input bool InpShow_Yearly_VWAP     = true;
input bool InpShow_FOMC_POC        = true;
input bool InpShow_FOMC_VWAP       = true;

//====================== ADVANCED INPUTS =============================
input group "Advanced - status panel"
input bool  InpShowPanel     = true;
input bool  InpPrereqAlerts  = false;
input int   InpPanelX        = 12;
input int   InpPanelY        = 20;
input int   InpPanelFontSize = 8;
input color InpPanelTextCol  = clrDodgerBlue;

input group "Advanced - native tick depth"
input int  InpDepthProbeDays = 150;
input bool InpRefuseSeamHole = true;

input group "Advanced - seed presentation"
input bool InpSeedBackProject    = false;
input int  InpSeedExpiryWarnDays = 10;

input group "Advanced - history window"
input bool InpContinuousAnchors      = true;
input int  InpContinuousLookbackDays = 90;

input group "Advanced - retest marker"
input int    InpMarkerAtrLength    = 14;
input double InpMarkerOffset       = 0.1;
input int    InpKeepMarkers        = 300;
input bool   InpMarkerWidthMulti  = true;
input bool   InpVerboseTooltip     = true;
input int    InpMarkerLookbackDays = 90;

input group "Advanced - retest marker colour = anchor authority (darker = higher)"
input color InpColMkFOMC      = clrNavy;
input color InpColMkYearly    = clrMediumBlue;
input color InpColMkQuarterly = clrRoyalBlue;
input color InpColMkMonthly   = clrDeepSkyBlue;
input color InpColMkWeekly    = clrLightSkyBlue;
input color InpColMkDaily     = clrPaleTurquoise;

input group "Advanced - alert channels"
input int    InpAlertCooldownBars = 0;
input bool   InpAlertSessionsOnly = true;
input bool   InpAlertPopup        = true;
input bool   InpAlertPush         = true;
input bool   InpAlertEmail        = false;
input bool   InpAlertCsv          = true;
input string InpCsvFile           = "";
input bool   InpCsvHistory        = false;

input group "Advanced - diagnostics"
input bool   InpJournalHistory = false;
input bool   InpLogWarnings    = true;
input bool   InpLogTiming      = false;
input int    InpDumpBars       = 0;
input string InpDumpBarTime    = "2026.08.19 10:00";
input int    InpMaxCursorFails = 3;
input bool   InpTracePrints    = false;

//====================== HARDCODED FORMER INPUTS =====================
#define POI_FLAGMODE        SEED_FIXED_FLAGMODE
#define POI_TARGETBINS      SEED_FIXED_TARGETBINS
#define POI_MAXCHUNKTICKS   SEED_FIXED_MAXCHUNK
#define POI_PRICESRC        SEED_FIXED_PRICESRC
#define POI_MAXLOOKBACKDAYS 0
#define POI_RETRYSECONDS    5
#define POI_MAXRETRIES      12
#define POI_MARKERGLYPH    108

//====================== Constants & Structures ======================
#define NSLOTS 6
#define NLINES 12

#define SLOT_DAILY     0
#define SLOT_WEEKLY    1
#define SLOT_MONTHLY   2
#define SLOT_QUARTERLY 3
#define SLOT_YEARLY    4
#define SLOT_FOMC      5

struct AnchorSlot
  {
   ENUM_ANCHOR anchorType;
   datetime    periodStart;
   datetime    absAnchor;
   bool        isEvent;
   VwapAccum   vwap;
   PocAccum    poc;
   double      lastPOC;
   double      lastVWAP;
   long        foldFromMs;
  };
AnchorSlot slots[NSLOTS];

struct CkSeries
  {
   bool   active;
   long   periodStart;
   int    count;
   long   t[];
   double poc[];
   double vwap[];
   int    cursor;
  };
CkSeries g_ckpt[NSLOTS];

string   g_fomcLabel = "";
datetime g_fomcSorted[];
int      g_fomcCount = 0;

double Buf0[],Buf1[],Buf2[],Buf3[],Buf4[],Buf5[];
double Buf6[],Buf7[],Buf8[],Buf9[],Buf10[],Buf11[];

bool   g_show[NLINES];
int    g_rankBase[NSLOTS] = { 11, 9, 7, 5, 3, 1 };
string g_slotCode[NSLOTS] = { "D","W","M","Q","Y","F" };
string g_slotName[NSLOTS] = { "Daily","Weekly","Monthly","Quarterly","Yearly","FOMC" };
string g_dowName[7]       = { "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" };

TickResume g_resume;
int        g_lastBar      = -1;
datetime   g_firstBarTime = 0;
bool       g_needRebuild  = true;

datetime g_hostPeriod[NSLOTS];
datetime g_dispFloor[NSLOTS];

bool   g_truncated     = false;
bool   g_capHit        = false;
bool   g_binCapHit     = false;
bool   g_depthShort    = false;
string g_depthShortWho = "";
string g_lastWarn      = "";

double g_PriceATR[];

string POI_RetryKey()
  {
   return "SRJ_POI_RETRY_" + _Symbol + "_" + IntegerToString((int)_Period);
  }

int POI_RetryCount()
  {
   string k = POI_RetryKey();
   if(!GlobalVariableCheck(k))
      return 0;
   return (int)GlobalVariableGet(k);
  }

void POI_RetrySet(const int n)
  {
   GlobalVariableSet(POI_RetryKey(), (double)n);
  }

void POI_RetryClear()
  {
   GlobalVariableDel(POI_RetryKey());
  }

//====================== Diagnostic Helpers ==========================
string g_slotReason[NSLOTS];
string g_seedRefusal = "";

datetime g_dumpBarTime  = 0;
string   g_dumpLast     = "";
long     g_dumpLastPass = -1;

string POI_TimeSec(const datetime t)
  {
   if(t <= 0)
      return "0";
   return TimeToString(t, TIME_DATE | TIME_SECONDS);
  }

string POI_TimeMsAsSec(const long ms)
  {
   if(ms <= 0)
      return "0";
   return TimeToString((datetime)(ms / 1000), TIME_DATE | TIME_SECONDS);
  }

string POI_YesNo(const bool v)
  {
   return v ? "YES" : "NO";
  }

//====================== Measured native tick depth ==================
#define POI_PROBE_HOUR      10
#define POI_PROBE_MINUTES   15

datetime g_measuredDepth   = 0;
int      g_depthUnresolved = 0;
datetime g_depthMeasuredOn = 0;

datetime POI_MeasureTickDepth(const string sym,
                              const int maxDaysBack,
                              int &unresolved)
  {
   unresolved = 0;

   if(maxDaysBack <= 0)
      return 0;

   datetime now = TimeCurrent();
   if(now <= 0)
      return 0;

   MqlTick buf[];

   for(int d = maxDaysBack; d >= 0; d--)
     {
      datetime day = TC_DayStart((datetime)((long)now - (long)d * 86400));
      int dow = TC_Dow(day);

      if(dow == 0 || dow == 6)
         continue;

      long from = (long)day + (long)POI_PROBE_HOUR * 3600;
      long to   = from + (long)POI_PROBE_MINUTES * 60;

      if(from >= (long)now)
         break;

      if(to > (long)now)
         to = (long)now;

      if(to <= from)
         break;

      ResetLastError();

      int n = CopyTicksRange(sym,
                             buf,
                             COPY_TICKS_ALL,
                             (ulong)(from * 1000),
                             (ulong)(to * 1000 - 1));

      if(n > 0)
         return (datetime)from;

      if(n < 0)
         unresolved++;
     }

   return 0;
  }

//====================== Seam reachability probe ======================
int POI_SeamReachable(const string sym,
                      const long seamMs,
                      const int maxTradingDays = 3)
  {
   if(seamMs <= 0)
      return -1;

   MqlTick buf[];

   long seamSec        = seamMs / 1000;
   int  daysChecked    = 0;
   int  unresolvedSeen = 0;

   for(int d = 0; d < 60 && daysChecked < maxTradingDays; d++)
     {
      long probeFrom = seamSec + (long)d * 86400;

      int dow = TC_Dow((datetime)probeFrom);
      if(dow == 0 || dow == 6)
         continue;

      long probeTo = probeFrom + (long)POI_PROBE_MINUTES * 60;

      ResetLastError();

      int n = CopyTicksRange(sym,
                             buf,
                             COPY_TICKS_ALL,
                             (ulong)(probeFrom * 1000),
                             (ulong)(probeTo * 1000 - 1));

      if(n > 0)
         return 1;

      if(n < 0)
         unresolvedSeen++;

      daysChecked++;
     }

   if(unresolvedSeen > 0)
      return -1;

   return 0;
  }

//====================== Real-depth engine gate ======================
datetime g_engineFloor = 0;
bool     g_engineOpen  = false;
long     g_passId      = 0;

void EngineFloorReset()
  {
   g_engineFloor = 0;
   g_engineOpen  = false;
  }

void EngineFloorNote(const long tickMs)
  {
   if(g_engineOpen)
      return;

   g_engineFloor = (datetime)(tickMs / 1000);
   g_engineOpen  = true;
  }

//====================== Bounded rebuild retry =======================
int  g_cursorFailures = 0;
bool g_tickBaseDead   = false;

void POI_Trace(const string msg)
  {
   if(!InpTracePrints)
      return;

   Print("[POI][TRACE] ",msg);
  }

//====================== Line/buffer plumbing ========================
void BlankBufAt(const int line,const int i)
  {
   switch(line)
     {
      case 0:  Buf0[i]  = EMPTY_VALUE; break;
      case 1:  Buf1[i]  = EMPTY_VALUE; break;
      case 2:  Buf2[i]  = EMPTY_VALUE; break;
      case 3:  Buf3[i]  = EMPTY_VALUE; break;
      case 4:  Buf4[i]  = EMPTY_VALUE; break;
      case 5:  Buf5[i]  = EMPTY_VALUE; break;
      case 6:  Buf6[i]  = EMPTY_VALUE; break;
      case 7:  Buf7[i]  = EMPTY_VALUE; break;
      case 8:  Buf8[i]  = EMPTY_VALUE; break;
      case 9:  Buf9[i]  = EMPTY_VALUE; break;
      case 10: Buf10[i] = EMPTY_VALUE; break;
      case 11: Buf11[i] = EMPTY_VALUE; break;
     }
  }

void POI_LogWarn(const string msg)
  {
   if(!InpLogWarnings)
      return;

   if(msg == g_lastWarn)
      return;

   g_lastWarn = msg;
   Print("WARN  ",msg);
  }

//====================== Alert session windows =======================
#define POI_LONDON_FROM_H    9
#define POI_LONDON_TO_H     12
#define POI_NYAM_FROM_H     14
#define POI_NYAM_TO_H       19

bool POI_InTradingWindow(const datetime barTime)
  {
   MqlDateTime st;

   if(!TimeToStruct(barTime,st))
      return false;

   if(st.hour >= POI_LONDON_FROM_H && st.hour < POI_LONDON_TO_H)
      return true;

   if(st.hour >= POI_NYAM_FROM_H && st.hour < POI_NYAM_TO_H)
      return true;

   return false;
  }

//====================== FOMC anchor resolution ======================
datetime ParseFomcAnchor(const string spec,string &label,const bool logIt)
  {
   label = "";

   datetime best  = 0;
   string   bestS = "";
   string   parts[];
   int      n = 0;
   string   s = spec;

   StringReplace(s,"\r",";");
   StringReplace(s,"\n",";");
   StringReplace(s,",",";");

   if(StringLen(s) > 0)
      n = StringSplit(s,';',parts);

   datetime now = TimeCurrent();

   g_fomcCount = 0;
   ArrayResize(g_fomcSorted,n);

   for(int i = 0; i < n; i++)
     {
      string raw = parts[i];
      StringTrimLeft(raw);
      StringTrimRight(raw);

      if(StringLen(raw) == 0)
         continue;

      datetime srv = StringToTime(raw);
      if(srv <= 0)
         continue;

      g_fomcSorted[g_fomcCount++] = srv;

      if(srv > now)
         continue;

      if(srv > best)
        {
         best  = srv;
         bestS = raw;
        }
     }

   label = bestS;
   return best;
  }

datetime FomcActiveNow()
  {
   datetime now  = TimeCurrent();
   datetime best = 0;

   for(int i = 0; i < g_fomcCount; i++)
     {
      if(g_fomcSorted[i] <= now && g_fomcSorted[i] > best)
         best = g_fomcSorted[i];
     }

   return best;
  }

//====================== Anchor verification marker ==================
#define ANCHOR_PREFIX "SRJ_ANCH_"

void DeleteAnchorMarker()
  {
   ObjectsDeleteAll(0,ANCHOR_PREFIX,0);
  }

void DrawAnchorMarker()
  {
   DeleteAnchorMarker();

   if(!InpShowAnchorMarker)
      return;

   if(slots[SLOT_FOMC].absAnchor <= 0)
      return;

   datetime a    = slots[SLOT_FOMC].absAnchor;
   string   name = ANCHOR_PREFIX + "FOMC";

   if(!ObjectCreate(0,name,OBJ_VLINE,0,a,0))
      return;

   ObjectSetInteger(0,name,OBJPROP_COLOR,InpColFOMC);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_DOT);
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1);
   ObjectSetInteger(0,name,OBJPROP_BACK,true);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
  }

//====================== Status panel ================================
#define PANEL_PREFIX "SRJ_PNL_"
#define PANEL_MAXROWS 40
#define PC_COUNT        5
#define PC_NOSEED_FILE  0
#define PC_NO_ADOPT     1
#define PC_DEPTH_SHORT  2
#define PC_EXPIRY       3
#define PC_SEED_OFF     4

bool   g_pcFired[PC_COUNT];
string g_panelRows[PANEL_MAXROWS];
int    g_panelRowCount = 0;
string g_panelBanner   = "";

int  g_seedGmtInfo  = 0;
int  g_seedDstInfo  = 0;
bool g_seedGmtKnown = false;
int  g_ckGmtInfo    = 0;
int  g_ckDstInfo    = 0;
bool g_ckGmtKnown   = false;

void PanelReset()
  {
   g_panelRowCount = 0;
   g_panelBanner   = "";
  }

void PanelRow(const string txt)
  {
   if(!InpShowPanel)
      return;

   if(g_panelRowCount >= PANEL_MAXROWS)
      return;

   g_panelRows[g_panelRowCount++] = txt;
  }

void PanelRaise(const int id,
                const string banner,
                const string alertTxt)
  {
   if(StringLen(g_panelBanner) == 0)
      g_panelBanner = banner;

   if(id < 0 || id >= PC_COUNT)
      return;

   if(g_pcFired[id])
      return;

   g_pcFired[id] = true;
   Print("PREREQUISITE  ",alertTxt);

   if(InpPrereqAlerts)
      Alert(_Symbol," SRJ POI: ",alertTxt);
  }

void DeletePanel()
  {
   ObjectsDeleteAll(0,PANEL_PREFIX,0);
  }

void DrawPanel()
  {
   DeletePanel();

   if(!InpShowPanel)
     {
      ChartRedraw();
      return;
     }

   int row = 0;
   int lh  = InpPanelFontSize + 5;

   if(StringLen(g_panelBanner) > 0)
     {
      string nm = PANEL_PREFIX + "banner";

      ObjectCreate(0,nm,OBJ_LABEL,0,0,0);
      ObjectSetInteger(0,nm,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(0,nm,OBJPROP_XDISTANCE,InpPanelX);
      ObjectSetInteger(0,nm,OBJPROP_YDISTANCE,InpPanelY);
      ObjectSetInteger(0,nm,OBJPROP_COLOR,clrOrangeRed);
      ObjectSetInteger(0,nm,OBJPROP_FONTSIZE,InpPanelFontSize + 2);
      ObjectSetString(0,nm,OBJPROP_TEXT,g_panelBanner);

      row += 2;
     }

   for(int i = 0; i < g_panelRowCount; i++)
     {
      string nm = PANEL_PREFIX + "r" + IntegerToString(i);

      ObjectCreate(0,nm,OBJ_LABEL,0,0,0);
      ObjectSetInteger(0,nm,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(0,nm,OBJPROP_XDISTANCE,InpPanelX);
      ObjectSetInteger(0,nm,OBJPROP_YDISTANCE,InpPanelY + row * lh);
      ObjectSetInteger(0,nm,OBJPROP_COLOR,InpPanelTextCol);
      ObjectSetInteger(0,nm,OBJPROP_FONTSIZE,InpPanelFontSize);
      ObjectSetString(0,nm,OBJPROP_TEXT,g_panelRows[i]);

      row++;
     }

   ChartRedraw();
  }

string PanelOffsetText()
  {
   if(!gtc_serverOffsetKnown)
      return "unknown (TimeGMT unavailable)";

   int hh = (int)(gtc_serverOffsetNow / 3600);
   int mm = (int)MathAbs((gtc_serverOffsetNow % 3600) / 60);

   return StringFormat("GMT%+d:%02d  (advisory, from local PC clock)",hh,mm);
  }

//====================== Seed adoption bookkeeping ===================
bool     g_slotAdopted[NSLOTS];
bool     g_ckActive[NSLOTS];
datetime g_seamTime    = 0;
datetime g_seedNewest  = 0;
bool     g_seedLoaded  = false;

void CkClear()
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      g_ckpt[s].active      = false;
      g_ckpt[s].periodStart = 0;
      g_ckpt[s].count       = 0;
      g_ckpt[s].cursor      = 0;

      ArrayFree(g_ckpt[s].t);
      ArrayFree(g_ckpt[s].poc);
      ArrayFree(g_ckpt[s].vwap);

      g_ckActive[s] = false;
     }

   g_ckGmtKnown = false;
  }

bool CkRead(const string fname,
            const long seamMs,
            const double binSize,
            const int dig,
            const double pt,
            string &err)
  {
   err = "";
   CkClear();

   int f = FileOpen(fname, FILE_READ|FILE_BIN|FILE_SHARE_READ|FILE_COMMON);
   if(f == INVALID_HANDLE)
      return false;

   int magic = (int)FileReadInteger(f,INT_VALUE);
   int ver   = (int)FileReadInteger(f,INT_VALUE);

   if(magic != CK_MAGIC)
     {
      err = "not an SRJ checkpoint file";
      FileClose(f);
      return false;
     }

   if(ver != CK_VERSION)
     {
      err = SEED_VersionRefusal(ver);
      FileClose(f);
      return false;
     }

   int nsym = (int)FileReadInteger(f,INT_VALUE);

   if(nsym <= 0 || nsym > 64)
     {
      err = "implausible symbol length in checkpoint header";
      FileClose(f);
      return false;
     }

   string fsym  = FileReadString(f,nsym);
   int    fDig  = (int)FileReadInteger(f,INT_VALUE);
   double fPt   = FileReadDouble(f);
   double fBs   = FileReadDouble(f);
   int    fFlag = (int)FileReadInteger(f,INT_VALUE);
   int    fWgt  = (int)FileReadInteger(f,INT_VALUE);

   g_ckGmtInfo  = (int)FileReadInteger(f,INT_VALUE);
   g_ckDstInfo  = (int)FileReadInteger(f,INT_VALUE);
   g_ckGmtKnown = true;

   long fSeam  = FileReadLong(f);
   int  fIntv  = (int)FileReadInteger(f,INT_VALUE);
   int  fSlots = (int)FileReadInteger(f,INT_VALUE);

   if(fsym != _Symbol ||
      fDig != dig ||
      MathAbs(fPt - pt) > pt * 1.0e-9 ||
      MathAbs(fBs - binSize) > binSize * 1.0e-9 ||
      fFlag != SEED_FIXED_FLAGMODE ||
      fWgt != (int)InpWeightMode ||
      fSeam != seamMs ||
      fSlots != NSLOTS)
     {
      err = "Format mismatch in checkpoint file";
      FileClose(f);
      return false;
     }

   int  cnt[NSLOTS];
   bool want[NSLOTS];

   int    fileAct[NSLOTS];
   int    fileAnchorType[NSLOTS];
   long   filePeriod[NSLOTS];
   string ckReason[NSLOTS];

   for(int s = 0; s < NSLOTS; s++)
     {
      int  act   = (int)FileReadInteger(f,INT_VALUE);
      int  aType = (int)FileReadInteger(f,INT_VALUE);
      long ps    = FileReadLong(f);

      cnt[s] = (int)FileReadInteger(f,INT_VALUE);

      g_ckpt[s].periodStart = ps;
      g_ckpt[s].count       = 0;
      g_ckpt[s].cursor      = 0;
      g_ckpt[s].active      = false;

      fileAct[s]        = act;
      fileAnchorType[s] = aType;
      filePeriod[s]     = ps;

      want[s] =
         (g_slotAdopted[s] &&
          act != 0 &&
          cnt[s] > 0 &&
          aType == (int)slots[s].anchorType &&
          ps == (long)slots[s].periodStart);

      if(!g_slotAdopted[s])
         ckReason[s] = "SEED_SLOT_NOT_ADOPTED";
      else if(act == 0)
         ckReason[s] = "FILE_SLOT_INACTIVE";
      else if(cnt[s] <= 0)
         ckReason[s] = "NO_RECORDS";
      else if(aType != (int)slots[s].anchorType)
         ckReason[s] = "ANCHOR_TYPE_MISMATCH";
      else if(ps != (long)slots[s].periodStart)
         ckReason[s] = "PERIOD_START_MISMATCH";
      else
         ckReason[s] = "ELIGIBLE";

      datetime hostPeriod = 0;
      datetime seamPeriod = 0;

      if(!slots[s].isEvent)
        {
         hostPeriod = AnchorStartFor(TimeCurrent(), slots[s].anchorType);
         seamPeriod = AnchorStartFor((datetime)(seamMs / 1000), slots[s].anchorType);
        }

      PrintFormat(
         "[POI][CKPT_SLOT_META] pass=%I64d slot=%s fileActive=%d fileAnchorType=%d hostAnchorType=%d filePeriodStart=%s slotPeriodStart=%s hostPeriod=%s seamPeriod=%s adopted=%s records=%d want=%s reason=\"%s\"",
         g_passId, g_slotCode[s], act, aType, (int)slots[s].anchorType, POI_TimeSec((datetime)ps), POI_TimeSec(slots[s].periodStart), POI_TimeSec(hostPeriod), POI_TimeSec(seamPeriod), POI_YesNo(g_slotAdopted[s]), cnt[s], POI_YesNo(want[s]), ckReason[s]
      );
     }

   for(int s = 0; s < NSLOTS; s++)
     {
      if(cnt[s] <= 0)
         continue;

      if(!want[s])
        {
         PrintFormat("[POI][CKPT_SLOT_RESULT] pass=%I64d slot=%s active=NO records=%d reason=\"%s\"", g_passId, g_slotCode[s], cnt[s], ckReason[s]);
         FileSeek(f,(long)cnt[s] * 24,SEEK_CUR);
         continue;
        }

      if(ArrayResize(g_ckpt[s].t,cnt[s]) != cnt[s] ||
         ArrayResize(g_ckpt[s].poc,cnt[s]) != cnt[s] ||
         ArrayResize(g_ckpt[s].vwap,cnt[s]) != cnt[s])
        {
         ckReason[s] = "ARRAY_ALLOCATION_FAILED";
         PrintFormat("[POI][CKPT_SLOT_RESULT] pass=%I64d slot=%s active=NO records=%d reason=\"%s\"", g_passId, g_slotCode[s], cnt[s], ckReason[s]);
         FileSeek(f,(long)cnt[s] * 24,SEEK_CUR);
         continue;
        }

      for(int i = 0; i < cnt[s]; i++)
        {
         g_ckpt[s].t[i]    = FileReadLong(f);
         g_ckpt[s].poc[i]  = FileReadDouble(f);
         g_ckpt[s].vwap[i] = FileReadDouble(f);
        }

      g_ckpt[s].count  = cnt[s];
      g_ckpt[s].active = true;
      g_ckActive[s]    = true;

      ckReason[s] = "ACTIVE";
      PrintFormat(
         "[POI][CKPT_SLOT_RESULT] pass=%I64d slot=%s active=YES records=%d first=%s last=%s periodStart=%s reason=\"%s\"",
         g_passId, g_slotCode[s], cnt[s], POI_TimeSec((datetime)g_ckpt[s].t[0]), POI_TimeSec((datetime)g_ckpt[s].t[cnt[s] - 1]), POI_TimeSec((datetime)g_ckpt[s].periodStart), ckReason[s]
      );
     }

   FileClose(f);

   int activeCount = 0;
   string activeSlots = "";
   for(int s = 0; s < NSLOTS; s++)
     {
      if(!g_ckpt[s].active)
         continue;
      activeCount++;
      if(activeSlots != "")
         activeSlots += " ";
      activeSlots += g_slotCode[s];
     }

   PrintFormat("[POI][CKPT] pass=%I64d stage=PARSED file=%s activeCount=%d activeSlots=[%s]", g_passId, fname, activeCount, activeSlots);

   return true;
  }

bool CkValueAt(const int s,
               const datetime barTime,
               double &poc,
               double &vwap)
  {
   poc  = 0.0;
   vwap = 0.0;

   if(!g_ckpt[s].active || g_ckpt[s].count <= 0)
      return false;

   long bt = (long)barTime;

   if(bt < g_ckpt[s].t[0])
      return false;

   int lo  = 0;
   int hi  = g_ckpt[s].count - 1;
   int hit = -1;

   while(lo <= hi)
     {
      int mid = (lo + hi) / 2;

      if(g_ckpt[s].t[mid] <= bt)
        {
         hit = mid;
         lo  = mid + 1;
        }
      else
        {
         hi  = mid - 1;
        }
     }

   if(hit < 0)
      return false;

   poc  = g_ckpt[s].poc[hit];
   vwap = g_ckpt[s].vwap[hit];

   return true;
  }

void ResetEngine()
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      ClearVwap(slots[s].vwap);
      ClearPoc(slots[s].poc);

      slots[s].lastPOC     = 0.0;
      slots[s].lastVWAP    = 0.0;
      slots[s].periodStart = 0;
      slots[s].foldFromMs  = 0;

      g_dispFloor[s]  = 0;
      g_hostPeriod[s] = 0;
     }

   ClearResume(g_resume);
   EngineFloorReset();
  }

void FoldOneTick(const MqlTick &t)
  {
   if(!TC_TickUsable(t))
      return;

   long ms = (long)t.time_msc;
   EngineFloorNote(ms);

   for(int s = 0; s < NSLOTS; s++)
     {
      //--- PRE-SEAM SKIP MOVED ABOVE THE ROLLOVER TEST. An adopted slot must not
      //--- inspect a tick it was never entitled to fold. Below the rollover test,
      //--- a tick OLDER than the adopted period clears the accumulator and returns
      //--- foldFromMs to 0 before the skip can protect it - the same defect the
      //--- v4.21 g_slotAdopted guard removed from the bar-walk, in the other copy
      //--- of the logic. The tester cannot reach it: no tick exists before test
      //--- start, so nothing older than an adopted period ever arrives. On a LIVE
      //--- chart the attach walk starts at oldestNeeded (Jan 1 under a 90-day
      //--- continuous lookback) and the first served tick lands at now-depth, so
      //--- an adopted Monthly slot is cleared by a March tick on every attach.
      //--- Consequences, both silent: without a checkpoint the slot re-folds
      //--- natively and looks correct while the seed does nothing; WITH a
      //--- checkpoint its periodStart still matches, so the CKPT_RETIRED guard
      //--- passes it through, foldFromMs is 0 so the skip below cannot fire, and
      //--- CkValueAt returns the series' last row for every bar right of the seam.
      //--- The line freezes at its seam value.
      //--- Non-adopted slots carry foldFromMs == 0, so this skip never fires for
      //--- them and their behaviour is unchanged. A genuine FORWARD rollover is
      //--- still handled below, and the retired-series guard still catches it.
      if(slots[s].foldFromMs > 0 &&
         ms < slots[s].foldFromMs)
        {
         continue;
        }

      if(slots[s].isEvent)
        {
         if(slots[s].absAnchor <= 0)
            continue;

         if((long)t.time < (long)slots[s].absAnchor)
            continue;
        }
      else
        {
         datetime ps =
            AnchorStartFor(t.time, slots[s].anchorType);

         if(ps != slots[s].periodStart)
           {
            ClearVwap(slots[s].vwap);
            ClearPoc(slots[s].poc);

            slots[s].periodStart = ps;
            slots[s].foldFromMs  = 0;
           }
        }

      FoldTickPreChecked(slots[s].vwap,
                         slots[s].poc,
                         t);
     }
  }

bool FoldRange(const long fromMs,
               const long toMs,
               TickResume &resume)
  {
   if(toMs <= fromMs)
      return true;

   CTickCursor cur;
   cur.Init(fromMs,toMs,resume.lastMs,resume.countAtLastMs);

   MqlTick t;

   while(cur.Next(toMs,t))
     {
      FoldOneTick(t);
      NoteResume(resume,t);
     }

   if(cur.HadError())
      return false;

   return true;
  }

//====================== Retest marker engine ========================
#define MK_PREFIX "SRJ_MK_"

datetime g_alertWatermark[NLINES];
datetime g_lastAlertTime[NLINES];
bool     g_alertArmed = false;
datetime g_csvWatermarkU = 0;
datetime g_csvWatermarkD = 0;

void DeleteAllMarkers()
  {
   ObjectsDeleteAll(0,MK_PREFIX,0);
  }

void SweepUnstampedMarkers(const long passId)
  {
   int total = ObjectsTotal(0,0,OBJ_ARROW);

   for(int i = total - 1; i >= 0; i--)
     {
      string nm = ObjectName(0,i,0,OBJ_ARROW);

      if(StringFind(nm,MK_PREFIX) != 0)
         continue;

      if(ObjectGetInteger(0,nm,OBJPROP_ZORDER) == passId)
         continue;

      ObjectDelete(0,nm);
     }
  }

void POI_RecalcPriceATR(const double &high[],
                        const double &low[],
                        const double &close[],
                        const int rates_total)
  {
   ArrayResize(g_PriceATR,rates_total);

   if(rates_total <= 0)
      return;

   int len = InpMarkerAtrLength;
   if(len < 1)
      len = 1;

   double trPrev = high[0] - low[0];
   g_PriceATR[0] = trPrev;

   double atr = trPrev;

   for(int i = 1; i < rates_total; i++)
     {
      double tr = MathMax(high[i] - low[i],
                          MathMax(MathAbs(high[i] - close[i-1]),
                                  MathAbs(low[i] - close[i-1])));

      if(i < len)
         atr = ((atr * i) + tr) / (i + 1);
      else
         atr = (atr * (len - 1) + tr) / len;

      g_PriceATR[i] = atr;
     }
  }

void POI_UpdateLastATR(const double &high[],
                        const double &low[],
                        const double &close[],
                        const int rates_total)
  {
   int n = ArraySize(g_PriceATR);

   if(n != rates_total)
     {
      POI_RecalcPriceATR(high,low,close,rates_total);
      return;
     }

   int i = rates_total - 1;
   if(i < 1)
      return;

   int len = MathMax(1,InpMarkerAtrLength);

   double tr = MathMax(high[i] - low[i],
                       MathMax(MathAbs(high[i] - close[i-1]),
                               MathAbs(low[i] - close[i-1])));

   g_PriceATR[i] = (g_PriceATR[i-1] * (len - 1) + tr) / len;
  }

double MarkerSpacing(const int barIndex)
  {
   if(InpMarkerOffset <= 0.0)
      return 0.0;

   int n = ArraySize(g_PriceATR);
   if(n <= 0)
      return 0.0;

   int idx = (barIndex < n ? barIndex : n - 1);
   double atr = g_PriceATR[idx];

   if(atr <= 0.0)
      return 0.0;

   return atr * InpMarkerOffset;
  }

int MarkerColorFor(const int slot)
  {
   switch(slot)
     {
      case SLOT_FOMC:      return (int)InpColMkFOMC;
      case SLOT_YEARLY:    return (int)InpColMkYearly;
      case SLOT_QUARTERLY: return (int)InpColMkQuarterly;
      case SLOT_MONTHLY:   return (int)InpColMkMonthly;
      case SLOT_WEEKLY:    return (int)InpColMkWeekly;
     }

   return (int)InpColMkDaily;
  }

//====================== Alert eligibility ===========================
bool AlertEligible(const int line,const datetime bt)
  {
   int rank = g_rankBase[line / 2] + (line % 2);

   if(rank > InpMinAlertRank)
      return false;

   if(bt <= g_alertWatermark[line])
      return false;

   if(InpAlertSessionsOnly && !POI_InTradingWindow(bt))
      return false;

   if(InpAlertCooldownBars > 0 && g_lastAlertTime[line] > 0)
     {
      int cdSec = InpAlertCooldownBars *
                  PeriodSeconds((ENUM_TIMEFRAMES)_Period);

      if((long)bt - (long)g_lastAlertTime[line] < cdSec)
         return false;
     }

   return true;
  }

bool AlertsFireable(const int i,
                    const int rates_total,
                    const bool isIncremental)
  {
   if(!InpEnableAlerts)
      return true;

   if(!g_alertArmed)
      return false;

   if(!isIncremental)
      return false;

   if(i < rates_total - 2)
      return false;

   return true;
  }

int RankOf(const int k)
  {
   return g_rankBase[k / 2] + (k % 2);
  }

string LineCode(const int k)
  {
   return g_slotCode[k / 2] + (((k % 2) == 0) ? "-POC" : "-VWAP");
  }

string LineName(const int k)
  {
   return g_slotName[k / 2] +
          (((k % 2) == 0) ? " AVP-POC" : " VWAP");
  }

double g_L[][NLINES];
int    g_evalBar = -1;

void ClearLineStore(const int from,const int to)
  {
   for(int i = from; i < to; i++)
     {
      for(int k = 0; k < NLINES; k++)
         g_L[i][k] = EMPTY_VALUE;
     }
  }

bool EnsureLineStore(const int rates_total)
  {
   int old = ArrayRange(g_L,0);

   if(old == rates_total)
      return true;

   if(ArrayResize(g_L,rates_total,512) < 0)
      return false;

   if(rates_total > old)
      ClearLineStore((old < 0) ? old : 0,rates_total);

   return true;
  }

void BlankAllBuffers()
  {
   ArrayInitialize(Buf0,EMPTY_VALUE);
   ArrayInitialize(Buf1,EMPTY_VALUE);
   ArrayInitialize(Buf2,EMPTY_VALUE);
   ArrayInitialize(Buf3,EMPTY_VALUE);
   ArrayInitialize(Buf4,EMPTY_VALUE);
   ArrayInitialize(Buf5,EMPTY_VALUE);
   ArrayInitialize(Buf6,EMPTY_VALUE);
   ArrayInitialize(Buf7,EMPTY_VALUE);
   ArrayInitialize(Buf8,EMPTY_VALUE);
   ArrayInitialize(Buf9,EMPTY_VALUE);
   ArrayInitialize(Buf10,EMPTY_VALUE);
   ArrayInitialize(Buf11,EMPTY_VALUE);
  }

string g_mkU[];
int    g_mkUHead  = 0;
int    g_mkUCount = 0;

string g_mkD[];
int    g_mkDHead  = 0;
int    g_mkDCount = 0;

void ResetRings()
  {
   ArrayFree(g_mkU);
   g_mkUHead  = 0;
   g_mkUCount = 0;

   ArrayFree(g_mkD);
   g_mkDHead  = 0;
   g_mkDCount = 0;
  }

void PushRing(string &ring[],
              int &head,
              int &count,
              const int cap,
              const string nm)
  {
   if(cap <= 0)
      return;

   if(ArraySize(ring) != cap)
     {
      ArrayResize(ring,cap);

      for(int j = 0; j < cap; j++)
         ring[j] = "";

      head  = 0;
      count = 0;
     }

   if(count < cap)
     {
      ring[(head + count) % cap] = nm;
      count++;
     }
   else
     {
      if(ring[head] != "")
         ObjectDelete(0,ring[head]);

      ring[head] = nm;
      head = (head + 1) % cap;
     }
  }

void EmitMarker(const int i,
                const bool isLong,
                int &hits[],
                double &pierce[],
                const int n,
                const datetime &time[],
                const double &high[],
                const double &low[],
                const double blo,
                const double bhi,
                const bool isIncremental,
                const int rates_total)
  {
   for(int a = 1; a < n; a++)
     {
      int    vK = hits[a];
      double vP = pierce[a];
      int    b  = a - 1;

      while(b >= 0 && RankOf(hits[b]) > RankOf(vK))
        {
         hits[b+1]   = hits[b];
         pierce[b+1] = pierce[b];
         b--;
        }

      hits[b+1]   = vK;
      pierce[b+1] = vP;
     }

   string   dirStr  = isLong ? "LONG" : "SHORT";
   datetime bt      = time[i];
   string   btTxt   = TimeToString(bt,TIME_DATE|TIME_MINUTES);
   int      topLine = hits[0];
   int      topSlot = topLine / 2;
   double   gap     = MarkerSpacing(i);
   double   price   = isLong ? (low[i] - gap) : (high[i] + gap);
   string   nm      = MK_PREFIX +
                      IntegerToString((long)bt) +
                      (isLong ? "_U" : "_D");

   bool existed   = (ObjectFind(0,nm) >= 0);
   long prevStamp = existed
                    ? ObjectGetInteger(0,nm,OBJPROP_ZORDER)
                    : -1;

   if(existed || ObjectCreate(0,nm,OBJ_ARROW,0,bt,price))
     {
      string tip = "POI RETEST - " + dirStr + "\n";

      for(int a = 0; a < n; a++)
        {
         if(InpVerboseTooltip)
           {
            tip += StringFormat(
               "%-18s %s    wick %.1f pt through\n",
               LineName(hits[a]),
               DoubleToString(g_L[i][hits[a]],_Digits),
               pierce[a]
            );
           }
         else
           {
            tip += StringFormat(
               "%-8s %s    %.1f pt\n",
               LineCode(hits[a]),
               DoubleToString(g_L[i][hits[a]],_Digits),
               pierce[a]
            );
           }
        }

      tip += btTxt + "  (server time)";

      ObjectSetDouble(0,nm,OBJPROP_PRICE,0,price);
      ObjectSetInteger(0,nm,OBJPROP_ARROWCODE,POI_MARKERGLYPH);
      ObjectSetInteger(0,nm,OBJPROP_ANCHOR,
                       isLong ? ANCHOR_TOP : ANCHOR_BOTTOM);
      ObjectSetInteger(0,nm,OBJPROP_COLOR,MarkerColorFor(topSlot));
      ObjectSetInteger(0,nm,OBJPROP_WIDTH,
                       (InpMarkerWidthMulti && n > 1) ? 2 : 1);
      ObjectSetInteger(0,nm,OBJPROP_BACK,false);
      ObjectSetInteger(0,nm,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(0,nm,OBJPROP_SELECTED,false);
      ObjectSetInteger(0,nm,OBJPROP_HIDDEN,true);
      ObjectSetInteger(0,nm,OBJPROP_ZORDER,g_passId);
      ObjectSetString(0,nm,OBJPROP_TOOLTIP,tip);

      if(prevStamp != g_passId)
        {
         if(isLong)
            PushRing(g_mkU,g_mkUHead,g_mkUCount,InpKeepMarkers,nm);
         else
            PushRing(g_mkD,g_mkDHead,g_mkDCount,InpKeepMarkers,nm);

         if(AlertsFireable(i,rates_total,isIncremental) &&
            AlertEligible(topLine,bt))
           {
            string tfTxt =
               StringSubstr(EnumToString((ENUM_TIMEFRAMES)_Period),7);

            string msg = StringFormat(
               "%s %s - POI RETEST %s at %s  [%s%s]",
               _Symbol,
               tfTxt,
               dirStr,
               DoubleToString(g_L[i][topLine],_Digits),
               LineCode(topLine),
               (n > 1) ? StringFormat(" +%d",n - 1) : ""
            );

            if(InpAlertPopup)
               Alert(msg);

            if(InpAlertPush && !SendNotification(msg))
              {
               POI_LogWarn(
                  "SendNotification failed (err " +
                  IntegerToString(GetLastError()) +
                  ") - check MetaQuotes ID in Terminal options"
               );
              }

            g_lastAlertTime[topLine]  = bt;
            g_alertWatermark[topLine] = bt;
           }
        }
     }
  }

void EvalBar(const int i,
             const datetime &time[],
             const double &open[],
             const double &high[],
             const double &low[],
             const double &close[],
             const int rates_total,
             const bool isIncremental)
  {
   const double P   = _Point;
   const double EPS = _Point * 0.001;

   double bodyHi = MathMax(open[i],close[i]);
   double bodyLo = MathMin(open[i],close[i]);
   double hi     = high[i];
   double lo     = low[i];

   int longHits[];
   ArrayResize(longHits,NLINES);

   double longPierce[];
   ArrayResize(longPierce,NLINES);

   int shortHits[];
   ArrayResize(shortHits,NLINES);

   double shortPierce[];
   ArrayResize(shortPierce,NLINES);

   int nL = 0;
   int nS = 0;

   for(int k = 0; k < NLINES; k++)
     {
      double L = g_L[i][k];

      if(L == EMPTY_VALUE || L <= 0.0)
         continue;

      if(lo <= L - P + EPS && bodyLo >= L - EPS)
        {
         longHits[nL]    = k;
         longPierce[nL] = (L - lo) / P;
         nL++;
        }

      if(hi >= L + P - EPS && bodyHi <= L + EPS)
        {
         shortHits[nS]    = k;
         shortPierce[nS] = (hi - L) / P;
         nS++;
        }
     }

   if(nL > 0)
     {
      EmitMarker(i,true,longHits,longPierce,nL,
                 time,high,low,bodyLo,bodyHi,
                 isIncremental,rates_total);
     }

   if(nS > 0)
     {
      EmitMarker(i,false,shortHits,shortPierce,nS,
                 time,high,low,bodyLo,bodyHi,
                 isIncremental,rates_total);
     }

   ArrayFree(longHits);
   ArrayFree(longPierce);
   ArrayFree(shortHits);
   ArrayFree(shortPierce);
  }

void SnapshotAllSlots()
  {
   double sd;

   for(int s = 0; s < NSLOTS; s++)
     {
      slots[s].lastPOC  = SnapshotPoc(slots[s].poc);
      slots[s].lastVWAP = SnapshotVwap(slots[s].vwap,sd);

      if(slots[s].poc.capHit)
         g_binCapHit = true;
     }
  }

datetime WidestAnchorStart(const datetime ref)
  {
   datetime widest = ref;

   for(int s = 0; s < NSLOTS; s++)
     {
      if(slots[s].isEvent)
        {
         if(slots[s].absAnchor > 0 &&
            slots[s].absAnchor < widest)
           {
            widest = slots[s].absAnchor;
           }

         continue;
        }

      datetime ps = AnchorStartFor(ref,slots[s].anchorType);

      if(ps < widest)
         widest = ps;
     }

   return widest;
  }

void ApplyCheckpoints(const long limitMs)
  {
   static bool ckRetiredLogged[NSLOTS];

   for(int s = 0; s < NSLOTS; s++)
     {
      if(!g_ckpt[s].active)
         continue;

      //--- A checkpoint series describes exactly ONE period. When the slot rolls
      //--- forward, FoldOneTick clears the accumulator in-stream and returns
      //--- foldFromMs to 0 - which disables the skip test below, and CkValueAt then
      //--- returns the LAST row of a retired series for every later bar. The line
      //--- freezes at its seam value for the rest of the session and nothing
      //--- downstream can detect it, because a frozen POC is a plausible POC.
      //--- E3 could not expose this: Y was the only ck-active slot and a yearly
      //--- period does not roll inside a 15-day run.
      if(g_ckpt[s].periodStart != (long)slots[s].periodStart)
        {
         if(!ckRetiredLogged[s])
           {
            ckRetiredLogged[s] = true;
            PrintFormat("[POI][CKPT_RETIRED] pass=%I64d slot=%s seriesPeriod=%s livePeriod=%s "
                        "- series no longer describes the live period, live fold takes over",
                        g_passId,
                        g_slotCode[s],
                        POI_TimeSec((datetime)g_ckpt[s].periodStart),
                        POI_TimeSec(slots[s].periodStart));
           }
         continue;
        }

      if(slots[s].foldFromMs > 0 &&
         limitMs >= slots[s].foldFromMs)
        {
         continue;
        }

      double poc;
      double vwap;

      if(CkValueAt(s,(datetime)(limitMs / 1000),poc,vwap))
        {
         slots[s].lastPOC  = poc;
         slots[s].lastVWAP = vwap;
        }
      else
        {
         slots[s].lastPOC  = 0.0;
         slots[s].lastVWAP = 0.0;
        }
     }
  }

void ResolveGating(const datetime bt,bool &inWin[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      if(slots[s].isEvent)
        {
         inWin[s] =
             (slots[s].absAnchor > 0 &&
              bt >= slots[s].absAnchor);

         continue;
        }

      if(slots[s].periodStart <= 0)
        {
         inWin[s] = false;
         continue;
        }

      inWin[s] = (bt >= slots[s].periodStart);
     }
  }

bool SlotHasCompleteHistory(const int s,
                            const datetime bt,
                            const long btMs)
  {
   if(s < 0 || s >= NSLOTS)
      return false;

   datetime trueStart = 0;

   if(slots[s].isEvent)
      trueStart = slots[s].absAnchor;
   else
      trueStart = AnchorStartFor(bt, slots[s].anchorType);

   if(trueStart <= 0)
      return false;

   if(g_engineOpen && trueStart >= g_engineFloor)
      return true;

   bool haveSeam = (slots[s].foldFromMs > 0);
   bool preSeam  = (haveSeam && btMs < slots[s].foldFromMs);
   bool postSeam = (haveSeam && btMs >= slots[s].foldFromMs);

   if(preSeam && g_ckpt[s].active)
      return true;

   if(postSeam && g_slotAdopted[s])
      return true;

   return false;
  }

void ResolveValidity(const int i,
                     const datetime bt,
                     const long btMs,
                     const bool &inWin[],
                     bool &valid[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      valid[s] = false;

      if(!inWin[s])
         continue;

      if(!SlotHasCompleteHistory(s, bt, btMs))
         continue;

      if(!g_engineOpen || bt < g_engineFloor)
        {
         bool checkpointCovered =
             (g_ckpt[s].active &&
              slots[s].foldFromMs > 0 &&
              btMs < slots[s].foldFromMs);

         if(!checkpointCovered)
             continue;
        }

      bool preSeam =
         (slots[s].foldFromMs > 0 &&
          btMs < slots[s].foldFromMs);

      if(preSeam)
        {
         if(slots[s].lastPOC <= 0.0 &&
            slots[s].lastVWAP <= 0.0)
           {
            continue;
           }

         if(!g_ckpt[s].active &&
            !InpSeedBackProject)
           {
            continue;
           }
        }

      if(g_dispFloor[s] > 0 &&
         bt < g_dispFloor[s])
        {
         continue;
        }

      if(slots[s].lastPOC <= 0.0 &&
         slots[s].lastVWAP <= 0.0)
        {
         continue;
        }

      valid[s] = true;
     }
  }

void WriteBar(const int i,
              const datetime bt,
              const long btMs,
              const bool &valid[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      int kPOC  = s * 2;
      int kVWAP = s * 2 + 1;

      if(!valid[s])
        {
         BlankBufAt(kPOC,  i);
         BlankBufAt(kVWAP, i);

         g_L[i][kPOC]  = EMPTY_VALUE;
         g_L[i][kVWAP] = EMPTY_VALUE;
         continue;
        }

      double poc  = slots[s].lastPOC;
      double vwap = slots[s].lastVWAP;

      switch(s)
        {
         case SLOT_DAILY:
            Buf0[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf1[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;

         case SLOT_WEEKLY:
            Buf2[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf3[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;

         case SLOT_MONTHLY:
            Buf4[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf5[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;

         case SLOT_QUARTERLY:
            Buf6[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf7[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;

         case SLOT_YEARLY:
            Buf8[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf9[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;

         case SLOT_FOMC:
            Buf10[i] =
               (g_show[kPOC] && poc > 0.0)
               ? poc : EMPTY_VALUE;

            Buf11[i] =
               (g_show[kVWAP] && vwap > 0.0)
               ? vwap : EMPTY_VALUE;
            break;
        }

      g_L[i][kPOC] =
         (poc > 0.0) ? poc : EMPTY_VALUE;

      g_L[i][kVWAP] =
         (vwap > 0.0) ? vwap : EMPTY_VALUE;
     }

   //--- Closed bars only. The forming bar legitimately changes as ticks arrive,
   //--- which made this probe report a determinism failure that was not one.
   //--- g_L is always sized to rates_total, so its range is a safe proxy for the
   //--- last index without changing WriteBar's signature.
   if(g_dumpBarTime > 0 && bt == g_dumpBarTime &&
      i < ArrayRange(g_L,0) - 1)
     {
      string dump = "";

      for(int k = 0; k < NLINES; k++)
        {
         if(k > 0)
            dump += " ";

         dump += LineCode(k) + "=";

         dump += (g_L[i][k] == EMPTY_VALUE)
                 ? "EMPTY"
                 : DoubleToString(g_L[i][k],_Digits);
        }

      if(g_passId != g_dumpLastPass || dump != g_dumpLast)
        {
         PrintFormat("[POI][BARDUMP] pass=%I64d bar=%s idx=%d %s",
                     g_passId,
                     POI_TimeSec(bt),
                     i,
                     dump);

         g_dumpLast     = dump;
         g_dumpLastPass = g_passId;
        }
     }
  }

bool Rebuild(const datetime &time[],
             const double &open[],
             const double &high[],
             const double &low[],
             const double &close[],
             const int rates_total,
             const bool isIncremental)
  {
   POI_Trace("A: Rebuild entered");

   ResetEngine();

   g_truncated     = false;
   g_capHit        = false;
   g_binCapHit     = false;
   g_depthShort    = false;
   g_depthShortWho = "";

   g_passId++;
   ResetRings();
   PanelReset();

   gtc_priceSrc    = POI_PRICESRC;
   gtc_weightMode  = InpWeightMode;
   gtc_maxBackfill = POI_MAXCHUNKTICKS;
   gtc_usableMode  =
      (ENUM_USABLE_MODE)SEED_FlagToMode(POI_FLAGMODE);
   gtc_prevBid = 0.0;

   TC_DetectServerOffsetNow();

   uint rebuildStart = GetTickCount();

   double binSize = SEED_BinSize(_Symbol,InpBinPips);

   if(!(binSize > 0.0))
     {
      BlankAllBuffers();
      return false;
     }

   for(int s = 0; s < NSLOTS; s++)
     {
      PocInit(slots[s].poc,binSize);
      ClearVwap(slots[s].vwap);

      slots[s].lastPOC     = 0.0;
      slots[s].lastVWAP    = 0.0;
      slots[s].foldFromMs  = 0;
      slots[s].periodStart = 0;
      slots[s].absAnchor   = 0;

      g_slotAdopted[s] = false;
      g_slotReason[s]  = "";
      g_ckActive[s]    = false;
     }

   slots[SLOT_FOMC].anchorType = ANCHOR_MANUAL;
   slots[SLOT_FOMC].isEvent    = true;

   slots[SLOT_DAILY].anchorType    = ANCHOR_DAILY;
   slots[SLOT_WEEKLY].anchorType   = ANCHOR_WEEKLY;
   slots[SLOT_MONTHLY].anchorType  = ANCHOR_MONTHLY;
   slots[SLOT_QUARTERLY].anchorType= ANCHOR_QUARTERLY;
   slots[SLOT_YEARLY].anchorType   = ANCHOR_YEARLY;

   g_show[0]  = InpShow_Daily_POC;
   g_show[1]  = InpShow_Daily_VWAP;
   g_show[2]  = InpShow_Weekly_POC;
   g_show[3]  = InpShow_Weekly_VWAP;
   g_show[4]  = InpShow_Monthly_POC;
   g_show[5]  = InpShow_Monthly_VWAP;
   g_show[6]  = InpShow_Quarterly_POC;
   g_show[7]  = InpShow_Quarterly_VWAP;
   g_show[8]  = InpShow_Yearly_POC;
   g_show[9]  = InpShow_Yearly_VWAP;
   g_show[10] = InpShow_FOMC_POC;
   g_show[11] = InpShow_FOMC_VWAP;

   slots[SLOT_FOMC].absAnchor =
      ParseFomcAnchor(InpFomcTimesServer,g_fomcLabel,true);

   PrintFormat("[POI][FOMC] pass=%I64d absAnchor=%s label=\"%s\" entries=%d",
               g_passId,
               POI_TimeSec(slots[SLOT_FOMC].absAnchor),
               g_fomcLabel,
               g_fomcCount);

   datetime today = TC_DayStart(TimeCurrent());

   if(InpDepthProbeDays > 0)
     {
      if(g_measuredDepth <= 0 || g_depthMeasuredOn != today)
        {
         g_measuredDepth =
            POI_MeasureTickDepth(_Symbol,
                                 InpDepthProbeDays,
                                 g_depthUnresolved);

         g_depthMeasuredOn = today;
        }
     }
   else
     {
      g_measuredDepth   = 0;
      g_depthUnresolved = 0;
     }

   PrintFormat(
      "[POI][DEPTH] pass=%I64d measured=%s measuredOn=%s unresolved=%d probeDays=%d",
      g_passId,
      POI_TimeSec(g_measuredDepth),
      POI_TimeSec(g_depthMeasuredOn),
      g_depthUnresolved,
      InpDepthProbeDays
   );

   g_seedLoaded   = false;
   g_seamTime     = 0;
   g_seedNewest   = 0;
   g_seedRefusal  = "";
   g_seedGmtKnown = false;
   g_seedDstInfo  = 0;

   SeedHeader h;
   SEED_HeaderClear(h);

   long seedPS[NSLOTS];
   long seedFM[NSLOTS];
   int  seedAT[NSLOTS];
   int  seedIE[NSLOTS];

   VwapAccum seedVwap[NSLOTS];
   PocAccum  seedPoc[NSLOTS];

   string seedErr    = "";
   long   adoptSeamMs = 0;
   bool   anyAdopted  = false;

   if(InpUseSeed)
     {
      string sf  = SEED_FileName(_Symbol);
      string cf0 = SEED_CkptName(_Symbol);

      PrintFormat("[POI][SEEDFILE] pass=%I64d seed=%s common=%s local=%s  ckpt=%s common=%s local=%s",
                  g_passId,
                  sf,
                  POI_YesNo(FileIsExist(sf,FILE_COMMON)),
                  POI_YesNo(FileIsExist(sf)),
                  cf0,
                  POI_YesNo(FileIsExist(cf0,FILE_COMMON)),
                  POI_YesNo(FileIsExist(cf0)));

      if(!SEED_Read(sf,
                    h,
                    seedPS,
                    seedFM,
                    seedAT,
                    seedIE,
                    seedVwap,
                    seedPoc,
                    seedErr))
        {
         g_seedRefusal = seedErr;

         PanelRaise(
            PC_NOSEED_FILE,
            "RUN SRJ_POI_Seeder FIRST",
            "Seed file not loaded: " +
            seedErr +
            ". Run SRJ_POI_Seeder FIRST."
         );
        }
      else
        {
         PrintFormat(
            "[POI][SEED] pass=%I64d stage=PARSED file=%s seam=%s lastArchive=%s builtAt=%s",
            g_passId,
            sf,
            POI_TimeMsAsSec(h.seamMsc),
            POI_TimeMsAsSec(h.lastArcMsc),
            POI_TimeSec((datetime)h.builtAt)
         );

         g_seedLoaded  = true;
         adoptSeamMs   = h.seamMsc;
         g_seamTime    = (datetime)(adoptSeamMs / 1000);
         g_seedGmtInfo = h.serverGmtBase;
         g_seedDstInfo = h.serverDst;
         g_seedGmtKnown = true;

         if(!SEED_Compatible(h,
                              _Symbol,
                              binSize,
                              (int)InpWeightMode,
                              seedErr))
            {
             g_seedRefusal = seedErr;
             g_seedLoaded  = false;

             PrintFormat(
                "[POI][SEED] pass=%I64d stage=REFUSED reason=COMPATIBILITY detail=\"%s\"",
                g_passId,
                seedErr
             );

             PanelRaise(
                PC_NO_ADOPT,
                "Seed Incompatible",
                "Seed refused: " + seedErr
             );
            }
         else
            {
             PrintFormat("[POI][SEED] pass=%I64d stage=COMPATIBLE result=YES", g_passId);

             if(g_measuredDepth > 0)
               {
                long depthMs = (long)g_measuredDepth * 1000;

                if(adoptSeamMs < depthMs)
                  {
                   string why = StringFormat(
                      "seam %s precedes measured depth %s",
                      TimeToString(g_seamTime, TIME_DATE|TIME_MINUTES),
                      TimeToString(g_measuredDepth, TIME_DATE|TIME_MINUTES)
                   );

                   if(InpRefuseSeamHole)
                     {
                      g_seedRefusal = why;
                      g_seedLoaded  = false;

                      PrintFormat(
                         "[POI][SEED] pass=%I64d stage=REFUSED reason=SEAM_HOLE seam=%s measuredDepth=%s gapDays=%.3f detail=\"%s\"",
                         g_passId,
                         POI_TimeMsAsSec(adoptSeamMs),
                         POI_TimeSec(g_measuredDepth),
                         (double)(depthMs - adoptSeamMs) / 86400000.0,
                         why
                      );
                     }
                   else
                     {
                      PrintFormat(
                         "[POI][SEED] pass=%I64d stage=SEAM_HOLE_IGNORED seam=%s measuredDepth=%s gapDays=%.3f InpRefuseSeamHole=FALSE",
                         g_passId,
                         POI_TimeMsAsSec(adoptSeamMs),
                         POI_TimeSec(g_measuredDepth),
                         (double)(depthMs - adoptSeamMs) / 86400000.0
                      );
                     }
                  }
               }
            }
        }
     }
   else
     {
      PanelRaise(
         PC_SEED_OFF,
         "Seed disabled - Q/Y truncated",
         "InpUseSeed is FALSE. Quarterly and Yearly truncated."
      );
     }

   if(g_seedLoaded && adoptSeamMs > 0)
     {
      int reach = POI_SeamReachable(_Symbol, adoptSeamMs, 3);

      if(reach == 1)
        {
         PrintFormat(
            "[POI][SEED] pass=%I64d stage=SEAM_REACHABLE seam=%s",
            g_passId,
            POI_TimeMsAsSec(adoptSeamMs)
         );
        }
      else if(reach == 0)
        {
         string whyR = StringFormat(
            "no ticks served at seam %s across 3 trading day(s)",
            POI_TimeMsAsSec(adoptSeamMs)
         );

         if(InpRefuseSeamHole)
           {
            g_seedRefusal = whyR;
            g_seedLoaded  = false;

            PrintFormat(
               "[POI][SEED] pass=%I64d stage=REFUSED reason=SEAM_UNREACHABLE "
               "seam=%s tradingDaysProbed=3 detail=\"%s\"",
               g_passId,
               POI_TimeMsAsSec(adoptSeamMs),
               whyR
            );
           }
         else
           {
            PrintFormat(
               "[POI][SEED] pass=%I64d stage=SEAM_UNREACHABLE_IGNORED "
               "seam=%s InpRefuseSeamHole=FALSE",
               g_passId,
               POI_TimeMsAsSec(adoptSeamMs)
            );
           }
        }
      else
        {
         string whyU = StringFormat(
            "seam %s reachability could not be verified (unresolved tick request)",
            POI_TimeMsAsSec(adoptSeamMs)
         );

         g_seedRefusal = whyU;
         g_seedLoaded  = false;

         PrintFormat(
            "[POI][SEED] pass=%I64d stage=REFUSED reason=SEAM_UNVERIFIABLE "
            "seam=%s detail=\"%s\"",
            g_passId,
            POI_TimeMsAsSec(adoptSeamMs),
            whyU
         );
        }
     }

   PrintFormat(
      "[POI][SEED] pass=%I64d stage=FINAL accepted=%s seam=%s measuredDepth=%s refusal=\"%s\"",
      g_passId,
      POI_YesNo(g_seedLoaded),
      POI_TimeMsAsSec(adoptSeamMs),
      POI_TimeSec(g_measuredDepth),
      g_seedRefusal
   );

   if(g_seedLoaded)
     {
      datetime now = TimeCurrent();

      for(int s = 0; s < NSLOTS; s++)
        {
         if(s == SLOT_FOMC)
            {
             datetime seedFomc = (datetime)seedFM[SLOT_FOMC];

             bool haveHostAnchor =
                (slots[SLOT_FOMC].absAnchor > 0);

             bool anchorMatches =
                (haveHostAnchor &&
                 seedFomc == slots[SLOT_FOMC].absAnchor);

             bool anchorPrecedesSeam =
                (anchorMatches &&
                 (long)seedFomc * 1000 < adoptSeamMs);

             bool hasState =
                (anchorPrecedesSeam &&
                 seedVwap[SLOT_FOMC].sumV > 0.0);

             if(hasState)
               {
                slots[s].vwap        = seedVwap[s];
                slots[s].poc         = seedPoc[s];
                slots[s].foldFromMs = adoptSeamMs;

                double sd;

                slots[s].lastPOC =
                   SnapshotPoc(slots[s].poc);

                slots[s].lastVWAP =
                   SnapshotVwap(slots[s].vwap,sd);

                g_slotAdopted[s] = true;
                anyAdopted       = true;

                g_slotReason[SLOT_FOMC] = "ADOPTED";
               }
             else if(!haveHostAnchor)
                g_slotReason[SLOT_FOMC] = "FOMC_NO_HOST_ANCHOR";
             else if(!anchorMatches)
                g_slotReason[SLOT_FOMC] = "FOMC_ANCHOR_MISMATCH";
             else if(!anchorPrecedesSeam)
                g_slotReason[SLOT_FOMC] = "FOMC_ANCHOR_AFTER_SEAM";
             else
                g_slotReason[SLOT_FOMC] = "FOMC_SEED_STATE_EMPTY";

             continue;
            }

         datetime seedPeriod =
            (datetime)seedPS[s];

         datetime hostPeriod =
            AnchorStartFor(now,slots[s].anchorType);

         datetime seamPeriod =
            AnchorStartFor(g_seamTime,slots[s].anchorType);

         if(seedPeriod == hostPeriod &&
            seedPeriod == seamPeriod)
            {
             slots[s].vwap        = seedVwap[s];
             slots[s].poc         = seedPoc[s];
             slots[s].foldFromMs   = adoptSeamMs;
             slots[s].periodStart  = seedPeriod;

             double sd;

             slots[s].lastPOC =
                SnapshotPoc(slots[s].poc);

             slots[s].lastVWAP =
                SnapshotVwap(slots[s].vwap,sd);

             g_slotAdopted[s] = true;
             anyAdopted       = true;

             g_slotReason[s] = "ADOPTED";
            }
         else if(seedPeriod != hostPeriod && seedPeriod != seamPeriod)
            {
             g_slotReason[s] = "FILE_PERIOD_DIFFERS_FROM_HOST_AND_SEAM";
            }
         else if(seedPeriod != hostPeriod)
            {
             g_slotReason[s] = "FILE_PERIOD_DIFFERS_FROM_HOST";
            }
         else
            {
             g_slotReason[s] = "FILE_PERIOD_DIFFERS_FROM_SEAM";
            }
        }

      for(int s = 0; s < NSLOTS; s++)
        {
         if(slots[s].isEvent)
            {
             PrintFormat(
                "[POI][SEED_SLOT] pass=%I64d slot=%s kind=EVENT filePeriodStart=%s fileAbsAnchor=%s fileIsEvent=%d fileAnchorType=%d hostAbsAnchor=%s codeComparedField=filePeriodStart adopted=%s foldFrom=%s reason=\"%s\"",
                g_passId,
                g_slotCode[s],
                POI_TimeSec((datetime)seedPS[s]),
                POI_TimeSec((datetime)seedFM[s]),
                seedAT[s],
                seedIE[s],
                POI_TimeSec(slots[s].absAnchor),
                POI_YesNo(g_slotAdopted[s]),
                POI_TimeMsAsSec(slots[s].foldFromMs),
                g_slotReason[s]
             );

             continue;
            }

         datetime hostPeriod =
            AnchorStartFor(TimeCurrent(), slots[s].anchorType);

         datetime seamPeriod =
            (g_seamTime > 0)
            ? AnchorStartFor(g_seamTime, slots[s].anchorType)
            : 0;

         PrintFormat(
            "[POI][SEED_SLOT] pass=%I64d slot=%s kind=CALENDAR filePeriodStart=%s fileAbsAnchor=%s fileIsEvent=%d fileAnchorType=%d hostAnchorType=%d hostPeriod=%s seamPeriod=%s slotPeriodAfterDecision=%s adopted=%s foldFrom=%s reason=\"%s\"",
            g_passId,
            g_slotCode[s],
            POI_TimeSec((datetime)seedPS[s]),
            POI_TimeSec((datetime)seedFM[s]),
            seedAT[s],
            seedIE[s],
            (int)slots[s].anchorType,
            POI_TimeSec(hostPeriod),
            POI_TimeSec(seamPeriod),
            POI_TimeSec(slots[s].periodStart),
            POI_YesNo(g_slotAdopted[s]),
            POI_TimeMsAsSec(slots[s].foldFromMs),
            g_slotReason[s]
         );
        }

      string adopted = "";
      for(int s = 0; s < NSLOTS; s++)
        {
         if(g_slotAdopted[s])
            {
             if(adopted != "")
                adopted += " ";

             adopted += g_slotCode[s];
            }
        }

      PrintFormat(
         "[POI] SEED ADOPTION any=%s slots=[%s]",
         anyAdopted ? "YES" : "NO",
         adopted
      );

      if(g_seedLoaded && anyAdopted && h.lastBid > 0.0)
         gtc_prevBid = h.lastBid;

      if(!anyAdopted)
        {
         PanelRaise(
            PC_NO_ADOPT,
            "No slot adopted the seed",
            "Seed loaded but no slot adopted."
         );
        }

      string cf    = SEED_CkptName(_Symbol);
      string ckErr = "";

      int dig = (int)SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);
      double pt = SymbolInfoDouble(_Symbol,SYMBOL_POINT);

      bool ckLoaded =
         CkRead(cf,adoptSeamMs,binSize,dig,pt,ckErr);

      PrintFormat(
         "[POI][CKPT] pass=%I64d fileParse=%s file=%s%s",
         g_passId,
         ckLoaded ? "SUCCESS" : "FAILED",
         cf,
         ckLoaded ? "" : " reason=\"" + ckErr + "\""
      );
     }
   else
     {
      PrintFormat(
         "[POI][CKPT] pass=%I64d stage=SKIPPED reason=SEED_NOT_ACCEPTED seedRefusal=\"%s\"",
         g_passId,
         g_seedRefusal
      );
     }

   POI_Trace("C: seed block done");

   for(int s = 0; s < NSLOTS - 1; s++)
     {
      if(g_slotAdopted[s])
         continue;

      datetime ps =
         AnchorStartFor(TimeCurrent(),slots[s].anchorType);

      if(g_measuredDepth > 0 && ps < g_measuredDepth)
        {
         g_depthShort = true;
         g_depthShortWho += " " + g_slotCode[s];
        }
     }

   if(g_depthShort)
     {
      PanelRaise(
         PC_DEPTH_SHORT,
         g_depthShortWho + " truncated",
         g_depthShortWho +
         " anchor starts before measured depth."
      );
     }

   if(!InpContinuousAnchors)
     {
      for(int s = 0; s < NSLOTS; s++)
        {
         g_dispFloor[s] =
            slots[s].isEvent
            ? slots[s].absAnchor
            : AnchorStartFor(TimeCurrent(),
                             slots[s].anchorType);
        }
     }

   for(int s = 0; s < NSLOTS; s++)
     {
      g_hostPeriod[s] =
         slots[s].isEvent
         ? slots[s].absAnchor
         : AnchorStartFor(TimeCurrent(),
                          slots[s].anchorType);
     }

   if(!EnsureLineStore(rates_total))
     {
      BlankAllBuffers();
      return false;
     }

   POI_RecalcPriceATR(high,low,close,rates_total);

   datetime widestRef =
      (InpContinuousAnchors &&
       InpContinuousLookbackDays > 0)
      ? TimeCurrent() - 
        InpContinuousLookbackDays * 86400
      : TimeCurrent();

   datetime widestStart = WidestAnchorStart(widestRef);

   g_firstBarTime =
      (rates_total > 0) ? time[0] : TimeCurrent();

   long neededFromMs = LONG_MAX;

   for(int s = 0; s < NSLOTS; s++)
     {
      long slotFrom;

      if(slots[s].foldFromMs > 0)
        {
         slotFrom = slots[s].foldFromMs;
        }
      else if(slots[s].isEvent)
        {
         slotFrom =
            (slots[s].absAnchor > 0)
            ? (long)slots[s].absAnchor * 1000
            : LONG_MAX;
        }
      else
        {
         slotFrom =
            (long)AnchorStartFor(widestRef,
                                 slots[s].anchorType) * 1000;
        }

      if(slotFrom < neededFromMs)
         neededFromMs = slotFrom;
     }

   if(g_measuredDepth > 0)
     {
      long depthMs = (long)g_measuredDepth * 1000;

      if(neededFromMs < depthMs)
         neededFromMs = depthMs;
     }

   long preFoldFrom = neededFromMs;
   long preFoldTo   = (long)g_firstBarTime * 1000;

   TickResume preResume;
   ClearResume(preResume);

   if(preFoldTo > preFoldFrom)
     {
      if(!FoldRange(preFoldFrom,preFoldTo,preResume))
         return false;
     }

   SnapshotAllSlots();

   int walkEnd   = (rates_total >= 2) ? rates_total - 1 : 0;
   int walkFrom = 0;

   datetime oldestNeeded = WidestAnchorStart(widestRef);

   while(walkFrom < walkEnd &&
         time[walkFrom] < oldestNeeded)
     {
      for(int k = 0; k < NLINES; k++)
        {
         BlankBufAt(k,walkFrom);
         g_L[walkFrom][k] = EMPTY_VALUE;
        }

      walkFrom++;
     }

   datetime markerFloor = 0;

   if(InpMarkerLookbackDays > 0)
     {
      datetime now = TimeCurrent();

      markerFloor =
         (datetime)((long)now -
                    (long)InpMarkerLookbackDays * 86400);
     }

   POI_Trace("D: entering bar-walk loop");

   CTickCursor walkCur;
   walkCur.Init((long)time[walkFrom]*1000, (long)TimeCurrent()*1000 + 1000, 0, 0);
   MqlTick t;

   for(int i = walkFrom; i < walkEnd; i++)
     {
      datetime bt      = time[i];
      long     btMs    = (long)bt * 1000;
      datetime nextBt  = (i + 1 < rates_total)
                         ? time[i + 1]
                         : bt;
      long nextMs = (long)nextBt * 1000;

      if(InpContinuousAnchors)
        {
         for(int s = 0; s < NSLOTS - 1; s++)
           {
            //--- An ADOPTED slot must not be rolled by bar time. Adoption already
            //--- proved seedPeriod == AnchorStartFor(TimeCurrent()), so every bar in
            //--- this walk whose period differs is OLDER than the adopted period, and
            //--- clearing on it throws the seed away for nothing. Measured on the
            //--- 2026.08.03 -> 08.18 run with a 2026.08.01 seam: Q adopted with
            //--- foldFrom=2026.08.01, the walk cleared it at Jan 1 / Apr 1 / Jul 1,
            //--- and it ended the walk with foldFrom=0. That empties the postSeam
            //--- route in SlotHasCompleteHistory, so Q printed EMPTY on every bar
            //--- while its 44,640-row checkpoint series sat loaded and unused. Y
            //--- survived only because its yearly period happens to equal every walk
            //--- bar's. A genuine forward rollover is still handled: FoldOneTick
            //--- clears the accumulator in-stream on the first tick of a new period,
            //--- and the [POI][ROLL] block in OnCalculate advances g_hostPeriod.
            if(g_slotAdopted[s])
               continue;

            datetime ps =
               AnchorStartFor(bt,slots[s].anchorType);

            if(ps != slots[s].periodStart)
              {
               ClearVwap(slots[s].vwap);
               ClearPoc(slots[s].poc);

               slots[s].periodStart = ps;
               slots[s].foldFromMs  = 0;
              }
           }
        }

      if(nextMs > btMs)
        {
         while(walkCur.Next(nextMs, t))
           {
            FoldOneTick(t);
           }
        }

      SnapshotAllSlots();
      ApplyCheckpoints(btMs);

      bool inWin[NSLOTS];
      bool valid[NSLOTS];

      ResolveGating(bt,inWin);
      ResolveValidity(i,bt,btMs,inWin,valid);
      WriteBar(i,bt,btMs,valid);

      if(i <= walkEnd - 1)
        {
         bool withinMarkerWindow = true;

         if(InpMarkerLookbackDays > 0 &&
            markerFloor > 0)
           {
            withinMarkerWindow = (bt >= markerFloor);
           }

         if(withinMarkerWindow)
           {
            EvalBar(i,
                    time,
                    open,
                    high,
                    low,
                    close,
                    rates_total,
                    isIncremental);
           }
        }
     }

   if(walkCur.HadError())
     {
      g_cursorFailures++;

      int cursorErr = walkCur.LastError();
      int failCap   = (InpMaxCursorFails > 0) ? InpMaxCursorFails : 1;

      PrintFormat("[POI][CURSOR] pass=%I64d failure=%d/%d err=%d walkFrom=%d "
                  "walkStart=%s - historical tick walk unresolved",
                  g_passId,
                  g_cursorFailures,
                  failCap,
                  cursorErr,
                  walkFrom,
                  POI_TimeSec(time[walkFrom]));

      BlankAllBuffers();
      DrawPanel();
      DrawAnchorMarker();

      if(g_cursorFailures >= failCap)
        {
         g_tickBaseDead = true;

         PrintFormat("[POI][CURSOR] pass=%I64d ENGINE STOPPED after %d consecutive "
                     "unresolved tick walks (err %d). Every line stays EMPTY for the "
                     "rest of this run. In the Strategy Tester this means the run is "
                     "NOT using \"Every tick\" modelling - CopyTicksRange is not "
                     "served under the OHLC models and this is a tick-based "
                     "indicator. On a live chart, let the tick base finish loading "
                     "and re-attach.",
                     g_passId,
                     g_cursorFailures,
                     cursorErr);

         g_lastBar = rates_total - 1;
         return true;
        }

      g_needRebuild = true;
      return false;
     }

   POI_Trace("E: bar-walk loop complete");

   PrintFormat("[POI][FLOOR] pass=%I64d engineOpen=%s engineFloor=%s preFold=%s..%s "
               "walkFrom=%d walkEnd=%d oldestNeeded=%s measuredDepth=%s",
               g_passId,
               POI_YesNo(g_engineOpen),
               POI_TimeSec(g_engineFloor),
               POI_TimeMsAsSec(preFoldFrom),
               POI_TimeMsAsSec(preFoldTo),
               walkFrom,
               walkEnd,
               POI_TimeSec(oldestNeeded),
               POI_TimeSec(g_measuredDepth));

   if(walkEnd >= 1)
     {
      datetime lastBt = time[walkEnd - 1];

      for(int s = 0; s < NSLOTS; s++)
        {
         datetime trueStart =
            slots[s].isEvent
            ? slots[s].absAnchor
            : AnchorStartFor(lastBt, slots[s].anchorType);

         PrintFormat("[POI][FLOOR_SLOT] pass=%I64d slot=%s trueStart=%s "
                     "reachesFloor=%s ckActive=%s adopted=%s foldFrom=%s",
                     g_passId,
                     g_slotCode[s],
                     POI_TimeSec(trueStart),
                     POI_YesNo(g_engineOpen && trueStart >= g_engineFloor),
                     POI_YesNo(g_ckpt[s].active),
                     POI_YesNo(g_slotAdopted[s]),
                     POI_TimeMsAsSec(slots[s].foldFromMs));
        }
     }

   g_evalBar = (walkEnd >= 1) ? walkEnd - 1 : -1;

   PanelRow(
      "SRJ POI v4.23  " +
      _Symbol +
      " " +
      EnumToString((ENUM_TIMEFRAMES)_Period)
   );

   PanelRow("Server offset: " + PanelOffsetText());

   DrawPanel();
   DrawAnchorMarker();
   SweepUnstampedMarkers(g_passId);

   if(!g_alertArmed)
      g_alertArmed = true;

   POI_RetryClear();

   g_lastBar = rates_total - 1;
   return true;
  }

int OnInit()
  {
   Print("[POI] checkpoint 0: entering OnInit");

   //--- The EA passes three positional parameters through iCustom:
   //--- InpUseSeed, InpBinPips, InpWeightMode, in that order. Everything else
   //--- comes from this file's compiled defaults. Because bare inputs now sit
   //--- before all 'input group' headers, parameter alignment is preserved.
   PrintFormat("[POI][INPUTS] useSeed=%s binPips=%.10f weightMode=%d depthProbeDays=%d "
               "refuseSeamHole=%s continuousAnchors=%s maxCursorFails=%d tracePrints=%s "
               "tester=%s",
               POI_YesNo(InpUseSeed),
               InpBinPips,
               (int)InpWeightMode,
               InpDepthProbeDays,
               POI_YesNo(InpRefuseSeamHole),
               POI_YesNo(InpContinuousAnchors),
               InpMaxCursorFails,
               POI_YesNo(InpTracePrints),
               POI_YesNo((bool)MQLInfoInteger(MQL_TESTER)));

   ArraySetAsSeries(Buf0,false);
   ArraySetAsSeries(Buf1,false);
   ArraySetAsSeries(Buf2,false);
   ArraySetAsSeries(Buf3,false);
   ArraySetAsSeries(Buf4,false);
   ArraySetAsSeries(Buf5,false);
   ArraySetAsSeries(Buf6,false);
   ArraySetAsSeries(Buf7,false);
   ArraySetAsSeries(Buf8,false);
   ArraySetAsSeries(Buf9,false);
   ArraySetAsSeries(Buf10,false);
   ArraySetAsSeries(Buf11,false);

   SetIndexBuffer(0,Buf0,INDICATOR_DATA);
   SetIndexBuffer(1,Buf1,INDICATOR_DATA);
   SetIndexBuffer(2,Buf2,INDICATOR_DATA);
   SetIndexBuffer(3,Buf3,INDICATOR_DATA);
   SetIndexBuffer(4,Buf4,INDICATOR_DATA);
   SetIndexBuffer(5,Buf5,INDICATOR_DATA);
   SetIndexBuffer(6,Buf6,INDICATOR_DATA);
   SetIndexBuffer(7,Buf7,INDICATOR_DATA);
   SetIndexBuffer(8,Buf8,INDICATOR_DATA);
   SetIndexBuffer(9,Buf9,INDICATOR_DATA);
   SetIndexBuffer(10,Buf10,INDICATOR_DATA);
   SetIndexBuffer(11,Buf11,INDICATOR_DATA);

   color plotCol[NLINES];

   plotCol[0]  = InpColDaily;
   plotCol[1]  = InpColDaily;
   plotCol[2]  = InpColWeekly;
   plotCol[3]  = InpColWeekly;
   plotCol[4]  = InpColMonthly;
   plotCol[5]  = InpColMonthly;
   plotCol[6]  = InpColQuarterly;
   plotCol[7]  = InpColQuarterly;
   plotCol[8]  = InpColYearly;
   plotCol[9]  = InpColYearly;
   plotCol[10] = InpColFOMC;
   plotCol[11] = InpColFOMC;

   for(int p = 0; p < NLINES; p++)
     {
      PlotIndexSetInteger(p,PLOT_LINE_COLOR,plotCol[p]);
      PlotIndexSetDouble(p,PLOT_EMPTY_VALUE,EMPTY_VALUE);
      PlotIndexSetString(p,PLOT_LABEL,LineCode(p));
     }

   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);

   IndicatorSetString(INDICATOR_SHORTNAME,
                      "SRJ POI Marker v4.23 " + _Symbol);

   BlankAllBuffers();

   for(int k = 0; k < NLINES; k++)
     {
      g_alertWatermark[k] = 0;
      g_lastAlertTime[k]  = 0;
     }

   g_alertArmed    = false;
   g_csvWatermarkU = 0;
   g_csvWatermarkD = 0;

   for(int i = 0; i < PC_COUNT; i++)
      g_pcFired[i] = false;

   g_lastBar     = -1;
   g_needRebuild = true;
   g_passId      = 0;

   g_cursorFailures = 0;
   g_tickBaseDead   = false;
   g_lastWarn       = "";

   g_dumpBarTime  = 0;
   g_dumpLast     = "";
   g_dumpLastPass = -1;

   if(StringLen(InpDumpBarTime) > 0)
     {
      g_dumpBarTime = StringToTime(InpDumpBarTime);

      if(g_dumpBarTime <= 0)
         PrintFormat("[POI][BARDUMP] InpDumpBarTime=\"%s\" did not parse - dump is OFF. "
                     "Use \"YYYY.MM.DD HH:MM\", server time.",
                     InpDumpBarTime);
      else
         PrintFormat("[POI][BARDUMP] armed for bar %s (server time)",
                     POI_TimeSec(g_dumpBarTime));
     }

   ResetRings();
   DeleteAllMarkers();
   DeleteAnchorMarker();
   DeletePanel();

   EventSetTimer(POI_RETRYSECONDS);

   return INIT_SUCCEEDED;
  }

void OnDeinit(const int reason)
  {
   EventKillTimer();

   DeleteAllMarkers();
   DeleteAnchorMarker();
   DeletePanel();

   ArrayFree(g_PriceATR);
  }

void OnTimer()
  {
   if(g_tickBaseDead)
      {
       if(POI_RetryCount() >= POI_MAXRETRIES)
          return;

       POI_RetrySet(POI_RetryCount() + 1);

       MqlTick rearmProbe[];

       if(CopyTicks(_Symbol,rearmProbe,COPY_TICKS_ALL,0,1) > 0)
         {
          Print("[POI][CURSOR] ticks are being served again - re-arming the engine");

          g_tickBaseDead   = false;
          g_cursorFailures = 0;
          g_needRebuild    = true;

          ChartRedraw();
         }

       return;
      }

   if(!g_needRebuild)
      return;

   if(POI_RetryCount() >= POI_MAXRETRIES)
      return;

   POI_RetrySet(POI_RetryCount() + 1);

   MqlTick probe[];
   CopyTicks(_Symbol,probe,COPY_TICKS_ALL,0,1);

   ChartRedraw();
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
   if(rates_total < 2)
      return rates_total;

   if(g_tickBaseDead)
      return rates_total;

   bool needRebuild = g_needRebuild;

   if(!needRebuild &&
      g_lastBar >= 0 &&
      g_lastBar < rates_total)
     {
      datetime now = TimeCurrent();

      for(int s = 0; s < NSLOTS - 1; s++)
        {
         datetime nowPeriod = AnchorStartFor(now,slots[s].anchorType);

         if(nowPeriod == g_hostPeriod[s])
            continue;

         //--- A calendar rollover used to force a full rebuild. It does not have
         //--- to. FoldOneTick already clears a slot's accumulator in-stream the
         //--- first time it sees a tick in a new period, and both incremental
         //--- paths route every tick through it, so the rebuild was redundant.
         //---
         //--- Only the display floor needs the host period, and only when
         //--- InpContinuousAnchors is FALSE. In that mode keep the old rebuild,
         //--- because g_dispFloor is computed in Rebuild() and nowhere else.
         if(!InpContinuousAnchors)
            {
             PrintFormat("[POI][ROLL] slot=%s wasPeriod=%s nowPeriod=%s - full rebuild "
                         "(InpContinuousAnchors=FALSE)",
                         g_slotCode[s],
                         POI_TimeSec(g_hostPeriod[s]),
                         POI_TimeSec(nowPeriod));

             needRebuild = true;
             break;
            }

         PrintFormat("[POI][ROLL] slot=%s wasPeriod=%s nowPeriod=%s - in-place, no rebuild",
                     g_slotCode[s],
                     POI_TimeSec(g_hostPeriod[s]),
                     POI_TimeSec(nowPeriod));

         g_hostPeriod[s] = nowPeriod;
        }

      if(!needRebuild)
        {
         datetime fa = FomcActiveNow();

         if(fa != slots[SLOT_FOMC].absAnchor)
            {
             //--- Was a full rebuild, and it was the LAST remaining rebuild trigger.
             //--- It carries the same defect Edit 3 of v4.18 removed from the calendar
             //--- path: Rebuild() re-derives g_engineFloor from the oldest tick the
             //--- terminal serves AT THAT INSTANT. On the 2026.07.27 -> 08.18 range
             //--- that landed harmlessly on test start. On a Yearly range it discards
             //--- the deep walk and pins the floor about six days back, which empties
             //--- W, M, Q and Y for every bar left of that boundary.
             //---
             //--- In-place is sufficient. FoldOneTick gates an event slot on
             //--- t.time >= absAnchor, so once the anchor is set every later tick folds
             //--- and every earlier one does not. Clearing the accumulator covers the
             //--- older-anchor -> newer-anchor case; on the 0 -> first-anchor case it is
             //--- already empty. Any seed adoption for slot 5 is void once the anchor
             //--- moves, so the checkpoint series is deactivated with it - otherwise
             //--- ApplyCheckpoints would overwrite the live fold with a stale trajectory,
             //--- because foldFromMs is back to 0 and its skip test no longer fires.
             PrintFormat("[POI][ROLL] slot=F wasAnchor=%s nowAnchor=%s - in-place, no rebuild",
                         POI_TimeSec(slots[SLOT_FOMC].absAnchor),
                         POI_TimeSec(fa));

             ClearVwap(slots[SLOT_FOMC].vwap);
             ClearPoc(slots[SLOT_FOMC].poc);

             slots[SLOT_FOMC].absAnchor  = fa;
             slots[SLOT_FOMC].foldFromMs = 0;
             slots[SLOT_FOMC].lastPOC    = 0.0;
             slots[SLOT_FOMC].lastVWAP   = 0.0;

             g_ckpt[SLOT_FOMC].active = false;
             g_ckActive[SLOT_FOMC]    = false;
             g_slotAdopted[SLOT_FOMC] = false;

             g_hostPeriod[SLOT_FOMC] = fa;

             if(!InpContinuousAnchors)
                g_dispFloor[SLOT_FOMC] = fa;
            }
        }
     }

   bool isNewBar =
      (prev_calculated > 0 &&
       prev_calculated < rates_total);

   if(needRebuild)
     {
      g_needRebuild = true;

      if(!Rebuild(time,
                  open,
                  high,
                  low,
                  close,
                  rates_total,
                  isNewBar))
        {
         return 0;
        }

      g_needRebuild = false;
      return rates_total;
     }

   if(!EnsureLineStore(rates_total))
      return rates_total;

   if(isNewBar)
     {
      int ci = rates_total - 2;

      if(ci >= 0)
        {
         datetime bt      = time[ci];
         long     btMs    = (long)bt * 1000;
         datetime nextBt  = time[ci + 1];
         long     nextMs  = (long)nextBt * 1000;

         if(nextMs > btMs)
            {
             if(!FoldRange(btMs, nextMs, g_resume))
               {
                POI_LogWarn(
                   "unresolved tick fetch while closing bar " +
                   TimeToString(bt, TIME_DATE|TIME_MINUTES) +
                   " - forcing a full rebuild"
                );

                g_needRebuild = true;
                return 0;
               }
            }

         SnapshotAllSlots();
         ApplyCheckpoints(btMs);

         bool inWin[NSLOTS];
         bool valid[NSLOTS];

         ResolveGating(bt, inWin);
         ResolveValidity(ci, bt, btMs, inWin, valid);
         WriteBar(ci, bt, btMs, valid);

         POI_UpdateLastATR(high,
                           low,
                           close,
                           rates_total);

         EvalBar(ci,
                 time,
                 open,
                 high,
                 low,
                 close,
                 rates_total,
                 true);

         g_evalBar = ci;
        }

      ClearResume(g_resume);
      g_lastBar = rates_total - 1;
     }

   int fi = rates_total - 1;

   if(fi < 0)
      return rates_total;

   datetime fbt   = time[fi];
   long     fbtMs = (long)fbt * 1000;
   long     nowMs = (long)TimeCurrent() * 1000 + 999;

   if(nowMs > fbtMs)
     {
      if(!FoldRange(fbtMs, nowMs, g_resume))
        {
         POI_LogWarn(
            "unresolved tick fetch while updating forming bar " +
            TimeToString(fbt, TIME_DATE|TIME_MINUTES) +
            " - forcing a full rebuild"
         );

         g_needRebuild = true;
         return 0;
        }
     }

   SnapshotAllSlots();
   ApplyCheckpoints(fbtMs);

   bool inWinF[NSLOTS];
   bool validF[NSLOTS];

   ResolveGating(fbt, inWinF);
   ResolveValidity(fi, fbt, fbtMs, inWinF, validF);
   WriteBar(fi, fbt, fbtMs, validF);

   POI_UpdateLastATR(high,
                     low,
                     close,
                     rates_total);

   g_lastBar = rates_total - 1;
   return rates_total;
  }
//+------------------------------------------------------------------+