//+------------------------------------------------------------------+
//|                        SRJ_POI_Marker.mq5                        |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "4.12"
#property description "SRJ POI Marker - 6-anchor tick-based POC/VWAP + stateless wick-retest engine. All times are BROKER SERVER TIME."
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
input group "Seed  (run SRJ_POI_Seeder FIRST - see the on-chart panel)"
input bool InpUseSeed = true;              

input group "Binning  (must match SRJ_POI_Seeder)"
input double           InpBinPips    = 0.1;   
input ENUM_WEIGHT_MODE InpWeightMode = WEIGHT_TICKCOUNT;

input group "FOMC anchor (slot 5) - times are SERVER TIME, pre-converted"
input string InpFomcTimesServer  = "";     
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
input bool InpShow_Daily_POC     = true;   input bool InpShow_Daily_VWAP     = true;
input bool InpShow_Weekly_POC    = true;   input bool InpShow_Weekly_VWAP    = true;
input bool InpShow_Monthly_POC   = true;   input bool InpShow_Monthly_VWAP   = true;
input bool InpShow_Quarterly_POC = true;   input bool InpShow_Quarterly_VWAP = true;
input bool InpShow_Yearly_POC    = true;   input bool InpShow_Yearly_VWAP    = true;
input bool InpShow_FOMC_POC      = true;   input bool InpShow_FOMC_VWAP      = true;

//====================== ADVANCED INPUTS =============================
input group "Advanced - status panel"
input bool  InpShowPanel     = false;    
input bool  InpPrereqAlerts  = false;    
input int   InpPanelX        = 12;
input int   InpPanelY        = 20;
input int   InpPanelFontSize = 8;
input color InpPanelTextCol  = clrSilver;

input group "Advanced - native tick depth"
input int  InpDepthProbeDays = 150;   
input bool InpRefuseSeamHole = true;  

input group "Advanced - seed presentation"
input bool InpSeedBackProject     = false;  
input int  InpSeedExpiryWarnDays  = 10;     

input group "Advanced - history window"
input bool InpContinuousAnchors      = false;  
input int  InpContinuousLookbackDays = 90;     

input group "Advanced - retest marker"
input int    InpMarkerAtrLength      = 14;
input double InpMarkerOffset         = 0.1;
input int    InpKeepMarkers          = 300;   
input bool   InpMarkerWidthMulti     = true;
input bool   InpVerboseTooltip       = true;
input int    InpMarkerLookbackDays   = 90;     // Historical marker lookback (days, 0 = unlimited)

input group "Advanced - retest marker colour = anchor authority (darker = higher)"
input color InpColMkFOMC      = clrNavy;
input color InpColMkYearly    = clrMediumBlue;
input color InpColMkQuarterly = clrRoyalBlue;
input color InpColMkMonthly   = clrDeepSkyBlue;
input color InpColMkWeekly    = clrLightSkyBlue;
input color InpColMkDaily     = clrPaleTurquoise;

input group "Advanced - alert channels"
input int    InpAlertCooldownBars = 0;      
input bool   InpAlertSessionsOnly = false;  
input bool   InpAlertPopup        = true;   
input bool   InpAlertPush         = true;   
input bool   InpAlertEmail        = false;  
input bool   InpAlertCsv          = true;
input string InpCsvFile           = "";     
input bool   InpCsvHistory        = false;  

input group "Advanced - diagnostics"
input bool InpJournalHistory = false;
input bool InpLogWarnings    = true;
input bool InpLogTiming      = false;
input int  InpDumpBars       = 0;

//====================== HARDCODED FORMER INPUTS =====================
#define POI_FLAGMODE          SEED_FIXED_FLAGMODE     
#define POI_TARGETBINS        SEED_FIXED_TARGETBINS   
#define POI_MAXCHUNKTICKS     SEED_FIXED_MAXCHUNK     
#define POI_PRICESRC          SEED_FIXED_PRICESRC     
#define POI_MAXLOOKBACKDAYS   0
#define POI_RETRYSECONDS      5
#define POI_MAXRETRIES        12
#define POI_MARKERGLYPH       108

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

string g_fomcLabel = "";     
datetime g_fomcSorted[];
int g_fomcCount = 0;

double Buf0[],Buf1[],Buf2[],Buf3[],Buf4[],Buf5[];
double Buf6[],Buf7[],Buf8[],Buf9[],Buf10[],Buf11[];

bool   g_show[NLINES];
int    g_rankBase[NSLOTS] = { 11, 9, 7, 5, 3, 1 };
string g_slotCode[NSLOTS] = { "D","W","M","Q","Y","F" };
string g_slotName[NSLOTS] = { "Daily","Weekly","Monthly","Quarterly","Yearly","FOMC" };
string g_dowName[7] = { "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" };

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

string POI_RetryKey() { return "SRJ_POI_RETRY_" + _Symbol + "_" + IntegerToString((int)_Period); }
int POI_RetryCount() { string k = POI_RetryKey(); if(!GlobalVariableCheck(k)) return 0; return (int)GlobalVariableGet(k); }
void POI_RetrySet(const int n) { GlobalVariableSet(POI_RetryKey(), (double)n); }
void POI_RetryClear() { GlobalVariableDel(POI_RetryKey()); }

//====================== Measured native tick depth ==================
#define POI_PROBE_HOUR      10     
#define POI_PROBE_MINUTES   15

datetime g_measuredDepth   = 0;    
int      g_depthUnresolved = 0;    
datetime g_depthMeasuredOn = 0;

datetime POI_MeasureTickDepth(const string sym,const int maxDaysBack,int &unresolved)
  {
   unresolved = 0;
   if(maxDaysBack <= 0) return 0;
   datetime now = TimeCurrent();
   if(now <= 0) return 0;
   MqlTick buf[];
   for(int d = maxDaysBack; d >= 0; d--)
     {
      datetime day = TC_DayStart((datetime)((long)now - (long)d*86400));
      int dow = TC_Dow(day);
      if(dow == 0 || dow == 6) continue;             
      long from = (long)day + (long)POI_PROBE_HOUR*3600;
      long to   = from + (long)POI_PROBE_MINUTES*60;
      if(from >= (long)now) break;                   
      if(to   >  (long)now) to = (long)now;
      if(to <= from)        break;
      ResetLastError();
      int n = CopyTicksRange(sym, buf, COPY_TICKS_ALL, (ulong)(from*1000), (ulong)(to*1000 - 1));
      if(n > 0) return (datetime)from;
      if(n < 0) unresolved++;
     }
   return 0;
  }

//====================== Real-depth engine gate ======================
datetime g_engineFloor = 0;      
bool     g_engineOpen  = false;  
long     g_passId      = 0;      

void EngineFloorReset() { g_engineFloor = 0; g_engineOpen  = false; }
void EngineFloorNote(const long tickMs) { if(g_engineOpen) return; g_engineFloor = (datetime)(tickMs / 1000); g_engineOpen  = true; }

//====================== Line/buffer plumbing ========================
void BlankBufAt(const int line,const int i) 
  { 
   switch(line)
     {
      case 0:  Buf0[i]  = EMPTY_VALUE; break;   case 1:  Buf1[i]  = EMPTY_VALUE; break;
      case 2:  Buf2[i]  = EMPTY_VALUE; break;   case 3:  Buf3[i]  = EMPTY_VALUE; break;
      case 4:  Buf4[i]  = EMPTY_VALUE; break;   case 5:  Buf5[i]  = EMPTY_VALUE; break;
      case 6:  Buf6[i]  = EMPTY_VALUE; break;   case 7:  Buf7[i]  = EMPTY_VALUE; break;
      case 8:  Buf8[i]  = EMPTY_VALUE; break;   case 9:  Buf9[i]  = EMPTY_VALUE; break;
      case 10: Buf10[i] = EMPTY_VALUE; break;   case 11: Buf11[i] = EMPTY_VALUE; break;
     }
  }

void POI_LogWarn(const string msg) { if(!InpLogWarnings) return; if(msg == g_lastWarn) return; g_lastWarn = msg; Print("WARN  ", msg); }

//====================== Alert session windows =======================
#define POI_LONDON_FROM_H   9
#define POI_LONDON_TO_H    12
#define POI_NYAM_FROM_H    14
#define POI_NYAM_TO_H      19

bool POI_InTradingWindow(const datetime barTime)
  {
   MqlDateTime st;
   if(!TimeToStruct(barTime, st)) return false;
   if(st.hour >= POI_LONDON_FROM_H && st.hour < POI_LONDON_TO_H) return true;
   if(st.hour >= POI_NYAM_FROM_H   && st.hour < POI_NYAM_TO_H)   return true;
   return false;
  }

//====================== FOMC anchor resolution ======================
datetime ParseFomcAnchor(const string spec,string &label,const bool logIt)
  {
   label = "";
   datetime best  = 0;
   string   bestS = "";
   string parts[];
   int n = 0;
   string s = spec;
   StringReplace(s, "\r", ";"); StringReplace(s, "\n", ";"); StringReplace(s, ",",  ";");
   if(StringLen(s) > 0) n = StringSplit(s, ';', parts);
   datetime now = TimeCurrent();
   
   g_fomcCount = 0;
   ArrayResize(g_fomcSorted, n);

   for(int i = 0; i < n; i++)
     {
      string raw = parts[i];
      StringTrimLeft(raw); StringTrimRight(raw);
      if(StringLen(raw) == 0) continue;
      datetime srv = StringToTime(raw);
      if(srv <= 0)   continue;
      
      g_fomcSorted[g_fomcCount++] = srv;
      if(srv >  now) continue;          
      if(srv > best) { best = srv; bestS = raw; }
     }
   label = bestS;
   return best;
  }

datetime FomcActiveNow()
  {
   datetime now = TimeCurrent(), best = 0;
   for(int i = 0; i < g_fomcCount; i++)
      if(g_fomcSorted[i] <= now && g_fomcSorted[i] > best) best = g_fomcSorted[i];
   return best;
  }

//====================== Anchor verification marker ==================
#define ANCHOR_PREFIX "SRJ_ANCH_"
void DeleteAnchorMarker() { ObjectsDeleteAll(0, ANCHOR_PREFIX, 0); }
void DrawAnchorMarker()
  {
   DeleteAnchorMarker();
   if(!InpShowAnchorMarker) return;
   if(slots[SLOT_FOMC].absAnchor <= 0) return;
   datetime a    = slots[SLOT_FOMC].absAnchor;
   string   name = ANCHOR_PREFIX + "FOMC";
   if(!ObjectCreate(0, name, OBJ_VLINE, 0, a, 0)) return;
   ObjectSetInteger(0, name, OBJPROP_COLOR,     InpColFOMC);
   ObjectSetInteger(0, name, OBJPROP_STYLE,     STYLE_DOT);
   ObjectSetInteger(0, name, OBJPROP_WIDTH,     1);
   ObjectSetInteger(0, name, OBJPROP_BACK,      true);
   ObjectSetInteger(0, name, OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0, name, OBJPROP_SELECTED,  false);
   ObjectSetInteger(0, name, OBJPROP_HIDDEN,    true);
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
int      g_seedGmtInfo  = 0;
int      g_seedDstInfo  = 0;
bool     g_seedGmtKnown = false;
int      g_ckGmtInfo    = 0;
int      g_ckDstInfo    = 0;
bool     g_ckGmtKnown   = false;

void PanelReset() { g_panelRowCount = 0; g_panelBanner   = ""; }
void PanelRow(const string txt) { if(!InpShowPanel) return; if(g_panelRowCount >= PANEL_MAXROWS) return; g_panelRows[g_panelRowCount++] = txt; }
void PanelRaise(const int id,const string banner,const string alertTxt)
  {
   if(StringLen(g_panelBanner) == 0) g_panelBanner = banner;
   if(id < 0 || id >= PC_COUNT) return;
   if(g_pcFired[id]) return;
   g_pcFired[id] = true;
   Print("PREREQUISITE  ", alertTxt);
   if(InpPrereqAlerts) Alert(_Symbol, " SRJ POI: ", alertTxt);
  }
void DeletePanel() { ObjectsDeleteAll(0, PANEL_PREFIX, 0); }
void DrawPanel()
  {
   DeletePanel();
   if(!InpShowPanel) { ChartRedraw(); return; }
   int row = 0; int lh  = InpPanelFontSize + 5;
   if(StringLen(g_panelBanner) > 0)
     {
      string nm = PANEL_PREFIX + "banner";
      ObjectCreate(0, nm, OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, nm, OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, nm, OBJPROP_XDISTANCE, InpPanelX);
      ObjectSetInteger(0, nm, OBJPROP_YDISTANCE, InpPanelY);
      ObjectSetInteger(0, nm, OBJPROP_COLOR, clrOrangeRed);
      ObjectSetInteger(0, nm, OBJPROP_FONTSIZE, InpPanelFontSize + 2);
      ObjectSetString (0, nm, OBJPROP_TEXT, g_panelBanner);
      row += 2;
     }
   for(int i = 0; i < g_panelRowCount; i++)
     {
      string nm = PANEL_PREFIX + "r" + IntegerToString(i);
      ObjectCreate(0, nm, OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, nm, OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, nm, OBJPROP_XDISTANCE, InpPanelX);
      ObjectSetInteger(0, nm, OBJPROP_YDISTANCE, InpPanelY + row*lh);
      ObjectSetInteger(0, nm, OBJPROP_COLOR, InpPanelTextCol);
      ObjectSetInteger(0, nm, OBJPROP_FONTSIZE, InpPanelFontSize);
      ObjectSetString (0, nm, OBJPROP_TEXT, g_panelRows[i]);
      row++;
     }
   ChartRedraw();
  }

string PanelOffsetText()
  {
   if(!gtc_serverOffsetKnown) return "unknown (TimeGMT unavailable)";
   int hh = (int)(gtc_serverOffsetNow / 3600);
   int mm = (int)MathAbs((gtc_serverOffsetNow % 3600) / 60);
   return StringFormat("GMT%+d:%02d  (advisory, from local PC clock)", hh, mm);
  }

//====================== Seed adoption bookkeeping ===================
bool   g_slotAdopted[NSLOTS];
string g_slotReason[NSLOTS];
bool   g_ckActive[NSLOTS];
datetime g_seamTime    = 0;
datetime g_seedNewest  = 0;
bool     g_seedLoaded  = false;
string   g_seedRefusal = "";

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
      g_ckActive[s]         = false;
     }
   g_ckGmtKnown = false;
  }

bool CkRead(const string fname,const long seamMs,const double binSize,const int dig,const double pt,string &err)
  {
   err = ""; CkClear();
   int f = FileOpen(fname, FILE_READ|FILE_BIN|FILE_SHARE_READ);
   if(f == INVALID_HANDLE) return false;
   int magic = (int)FileReadInteger(f, INT_VALUE);
   int ver   = (int)FileReadInteger(f, INT_VALUE);
   if(magic != CK_MAGIC) { err = "not an SRJ checkpoint file"; FileClose(f); return false; }
   if(ver != CK_VERSION) { err = SEED_VersionRefusal(ver); FileClose(f); return false; }
   int    nsym  = (int)FileReadInteger(f, INT_VALUE);
   if(nsym <= 0 || nsym > 64) { err = "implausible symbol length in checkpoint header"; FileClose(f); return false; }
   string fsym  = FileReadString(f, nsym);
   int    fDig  = (int)FileReadInteger(f, INT_VALUE);
   double fPt   = FileReadDouble(f);
   double fBs   = FileReadDouble(f);
   int    fFlag = (int)FileReadInteger(f, INT_VALUE);
   int    fWgt  = (int)FileReadInteger(f, INT_VALUE);
   g_ckGmtInfo  = (int)FileReadInteger(f, INT_VALUE);   
   g_ckDstInfo  = (int)FileReadInteger(f, INT_VALUE);   
   g_ckGmtKnown = true;
   long   fSeam  = FileReadLong(f);
   int    fIntv  = (int)FileReadInteger(f, INT_VALUE);
   int    fSlots = (int)FileReadInteger(f, INT_VALUE);

   if(fsym != _Symbol || fDig != dig || MathAbs(fPt - pt) > pt*1.0e-9 || MathAbs(fBs - binSize) > binSize*1.0e-9 || fFlag != SEED_FIXED_FLAGMODE || fWgt != (int)InpWeightMode || fSeam != seamMs || fSlots != NSLOTS)
     { err = "Format mismatch in checkpoint file"; FileClose(f); return false; }

   int  cnt[NSLOTS];
   bool want[NSLOTS];

   for(int s = 0; s < NSLOTS; s++)
     {
      int  act    = (int)FileReadInteger(f, INT_VALUE);
      int  aType  = (int)FileReadInteger(f, INT_VALUE);
      long ps     = FileReadLong(f);
      cnt[s]      = (int)FileReadInteger(f, INT_VALUE);
      g_ckpt[s].periodStart = ps; g_ckpt[s].count = 0; g_ckpt[s].cursor = 0; g_ckpt[s].active = false;
      want[s] = (act != 0 && cnt[s] > 0 && aType == (int)slots[s].anchorType && ps == (long)slots[s].periodStart);
     }

   for(int s = 0; s < NSLOTS; s++)
     {
      if(cnt[s] <= 0) continue;
      if(!want[s]) { FileSeek(f, (long)cnt[s] * 24, SEEK_CUR); continue; }
      if(ArrayResize(g_ckpt[s].t, cnt[s]) != cnt[s] || ArrayResize(g_ckpt[s].poc, cnt[s]) != cnt[s] || ArrayResize(g_ckpt[s].vwap, cnt[s]) != cnt[s])
        { FileSeek(f, (long)cnt[s] * 24, SEEK_CUR); continue; }
      for(int i = 0; i < cnt[s]; i++)
        {
         g_ckpt[s].t[i]    = FileReadLong(f);
         g_ckpt[s].poc[i]  = FileReadDouble(f);
         g_ckpt[s].vwap[i] = FileReadDouble(f);
        }
      g_ckpt[s].count  = cnt[s]; g_ckpt[s].active = true; g_ckActive[s]    = true;
     }
   FileClose(f);
   return true;
  }

bool CkValueAt(const int s,const datetime barTime,double &poc,double &vwap)
  {
   poc = 0.0; vwap = 0.0;
   if(!g_ckpt[s].active || g_ckpt[s].count <= 0) return false;
   long bt = (long)barTime;
   if(bt < g_ckpt[s].t[0]) return false;          
   int lo = 0, hi = g_ckpt[s].count - 1, hit = -1;
   while(lo <= hi)
     {
      int mid = (lo + hi) / 2;
      if(g_ckpt[s].t[mid] <= bt) { hit = mid; lo = mid + 1; }
      else                       { hi = mid - 1; }
     }
   if(hit < 0) return false;
   poc  = g_ckpt[s].poc[hit]; vwap = g_ckpt[s].vwap[hit];
   return true;
  }

void ResetEngine()
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      ClearVwap(slots[s].vwap); ClearPoc(slots[s].poc);
      slots[s].lastPOC = 0.0; slots[s].lastVWAP = 0.0;
      slots[s].periodStart = 0; slots[s].foldFromMs = 0;
      g_dispFloor[s] = 0; g_hostPeriod[s] = 0;
     }
   EngineFloorReset();
  }

void FoldOneTick(const MqlTick &t)
  {
   if(!TC_TickUsable(t)) return;
   long ms = (long)t.time_msc;
   EngineFloorNote(ms);
   for(int s = 0; s < NSLOTS; s++)
     {
      if(slots[s].isEvent)
        {
         if(slots[s].absAnchor <= 0) continue;
         if((long)t.time < (long)slots[s].absAnchor) continue;
        }
      else
        {
         datetime ps = AnchorStartFor(t.time, slots[s].anchorType);
         if(ps != slots[s].periodStart)
           {
            ClearVwap(slots[s].vwap); ClearPoc(slots[s].poc);
            slots[s].periodStart = ps; slots[s].foldFromMs  = 0;
           }
        }
      if(slots[s].foldFromMs > 0 && ms < slots[s].foldFromMs) continue;
      FoldTickPreChecked(slots[s].vwap, slots[s].poc, t);
     }
  }

bool FoldRange(const long fromMs,const long toMs,TickResume &resume)
  {
   if(toMs <= fromMs) return true;
   CTickCursor cur;
   cur.Init(fromMs, toMs, resume.lastMs, resume.countAtLastMs);
   MqlTick t;
   while(cur.Next(toMs, t))
     { FoldOneTick(t); NoteResume(resume, t); }
   if(cur.HadError()) return false;
   return true;
  }

//====================== Retest marker engine ========================
#define MK_PREFIX "SRJ_MK_"
datetime g_alertWatermark[NLINES];   
datetime g_lastAlertTime[NLINES];    
bool     g_alertArmed = false;
datetime g_csvWatermarkU = 0;
datetime g_csvWatermarkD = 0;

void DeleteAllMarkers() { ObjectsDeleteAll(0, MK_PREFIX, 0); }
void SweepUnstampedMarkers(const long passId)
  {
   int total = ObjectsTotal(0, 0, OBJ_ARROW);
   for(int i = total - 1; i >= 0; i--)
     {
      string nm = ObjectName(0, i, 0, OBJ_ARROW);
      if(StringFind(nm, MK_PREFIX) != 0) continue;
      if(ObjectGetInteger(0, nm, OBJPROP_ZORDER) == passId) continue;
      ObjectDelete(0, nm);
     }
  }

void POI_RecalcPriceATR(const double &high[],const double &low[],const double &close[],const int rates_total)
  {
   ArrayResize(g_PriceATR, rates_total);
   if(rates_total <= 0) return;
   int len = InpMarkerAtrLength;
   if(len < 1) len = 1;
   double trPrev = high[0] - low[0];
   g_PriceATR[0] = trPrev;
   double atr = trPrev;
   for(int i = 1; i < rates_total; i++)
     {
      double tr = MathMax(high[i] - low[i], MathMax(MathAbs(high[i] - close[i-1]), MathAbs(low[i]  - close[i-1])));
      if(i < len) atr = ((atr * i) + tr) / (i + 1);        
      else        atr = (atr * (len - 1) + tr) / len;       
      g_PriceATR[i] = atr;
     }
  }

void POI_UpdateLastATR(const double &high[],const double &low[],const double &close[],const int rates_total)
  {
   int n = ArraySize(g_PriceATR);
   if(n != rates_total) { POI_RecalcPriceATR(high,low,close,rates_total); return; }
   int i = rates_total - 1;
   if(i < 1) return;
   int len = MathMax(1, InpMarkerAtrLength);
   double tr = MathMax(high[i]-low[i], MathMax(MathAbs(high[i]-close[i-1]), MathAbs(low[i]-close[i-1])));
   g_PriceATR[i] = (g_PriceATR[i-1]*(len-1) + tr) / len;
  }

double MarkerSpacing(const int barIndex)
  {
   if(InpMarkerOffset <= 0.0) return 0.0;
   int n = ArraySize(g_PriceATR);
   if(n <= 0) return 0.0;
   int idx = (barIndex < n ? barIndex : n - 1);
   double atr = g_PriceATR[idx];
   if(atr <= 0.0) return 0.0;
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
   int rank = g_rankBase[line/2] + (line%2);
   if(rank > InpMinAlertRank) return false;
   if(bt <= g_alertWatermark[line]) return false;      
   if(InpAlertSessionsOnly && !POI_InTradingWindow(bt)) return false;
   if(InpAlertCooldownBars > 0 && g_lastAlertTime[line] > 0)
     {
      int cdSec = InpAlertCooldownBars * PeriodSeconds((ENUM_TIMEFRAMES)_Period);
      if((long)bt - (long)g_lastAlertTime[line] < cdSec) return false;
     }
   return true;
  }

//--- live-only gate: suppress alerts during historical replay in Rebuild()
bool AlertsFireable(const int i,const int rates_total,const bool isIncremental)
  {
   if(!InpEnableAlerts)      return false;
   if(!g_alertArmed)         return false;   // initial history walk
   if(!isIncremental)        return false;   // full rebuild replay
   if(i < rates_total - 2)   return false;   // only the freshly closed bar
   return true;
  }

int    RankOf(const int k)    { return g_rankBase[k/2] + (k%2); }
string LineCode(const int k)  { return g_slotCode[k/2] + (((k%2)==0) ? "-POC" : "-VWAP"); }
string LineName(const int k)  { return g_slotName[k/2] + (((k%2)==0) ? " AVP-POC" : " VWAP"); }

double g_L[][NLINES];
int    g_evalBar = -1;

void ClearLineStore(const int from,const int to)
  {
   for(int i = from; i < to; i++)
      for(int k = 0; k < NLINES; k++) g_L[i][k] = EMPTY_VALUE;
  }

bool EnsureLineStore(const int rates_total)
  {
   int old = ArrayRange(g_L, 0);
   if(old == rates_total) return true;
   if(ArrayResize(g_L, rates_total, 512) < 0) return false;
   if(rates_total > old) ClearLineStore((old < 0) ? old : 0, rates_total);
   return true;
  }

void BlankAllBuffers()
  {
   ArrayInitialize(Buf0, EMPTY_VALUE); ArrayInitialize(Buf1, EMPTY_VALUE);
   ArrayInitialize(Buf2, EMPTY_VALUE); ArrayInitialize(Buf3, EMPTY_VALUE);
   ArrayInitialize(Buf4, EMPTY_VALUE); ArrayInitialize(Buf5, EMPTY_VALUE);
   ArrayInitialize(Buf6, EMPTY_VALUE); ArrayInitialize(Buf7, EMPTY_VALUE);
   ArrayInitialize(Buf8, EMPTY_VALUE); ArrayInitialize(Buf9, EMPTY_VALUE);
   ArrayInitialize(Buf10,EMPTY_VALUE); ArrayInitialize(Buf11,EMPTY_VALUE);
  }

string g_mkU[]; int g_mkUHead = 0; int g_mkUCount = 0;
string g_mkD[]; int g_mkDHead = 0; int g_mkDCount = 0;

void ResetRings()
  {
   ArrayFree(g_mkU); g_mkUHead = 0; g_mkUCount = 0;
   ArrayFree(g_mkD); g_mkDHead = 0; g_mkDCount = 0;
  }

void PushRing(string &ring[],int &head,int &count,const int cap,const string nm)
  {
   if(cap <= 0) return;                      
   if(ArraySize(ring) != cap)
     {
      ArrayResize(ring, cap);
      for(int j = 0; j < cap; j++) ring[j] = "";
      head = 0; count = 0;
     }
   if(count < cap) { ring[(head + count) % cap] = nm; count++; }
   else
     {
      if(ring[head] != "") ObjectDelete(0, ring[head]);
      ring[head] = nm;
      head = (head + 1) % cap;
     }
  }

void EmitMarker(const int i,const bool isLong,int &hits[],double &pierce[],const int n,
                const datetime &time[],const double &high[],const double &low[],
                const double blo,const double bhi, const bool isIncremental,const int rates_total)
  {
   for(int a = 1; a < n; a++)
     {
      int    vK = hits[a];
      double vP = pierce[a];
      int    b  = a - 1;
      while(b >= 0 && RankOf(hits[b]) > RankOf(vK))
        { hits[b+1] = hits[b]; pierce[b+1] = pierce[b]; b--; }
      hits[b+1] = vK; pierce[b+1] = vP;
     }

   string   dirStr  = isLong ? "LONG" : "SHORT";
   datetime bt      = time[i];
   string   btTxt   = TimeToString(bt, TIME_DATE|TIME_MINUTES);
   int      topLine = hits[0];
   int      topSlot = topLine / 2;
   double gap   = MarkerSpacing(i);
   double price = isLong ? (low[i] - gap) : (high[i] + gap);
   string nm    = MK_PREFIX + IntegerToString((long)bt) + (isLong ? "_U" : "_D");
   bool existed   = (ObjectFind(0, nm) >= 0);
   long prevStamp = existed ? ObjectGetInteger(0, nm, OBJPROP_ZORDER) : -1;

   if(existed || ObjectCreate(0, nm, OBJ_ARROW, 0, bt, price))
     {
      string tip = "POI RETEST - " + dirStr + "\n";
      for(int a = 0; a < n; a++)
        {
         if(InpVerboseTooltip)
            tip += StringFormat("%-18s %s   wick %.1f pt through\n", LineName(hits[a]), DoubleToString(g_L[i][hits[a]], _Digits), pierce[a]);
         else
            tip += StringFormat("%-8s %s   %.1f pt\n", LineCode(hits[a]), DoubleToString(g_L[i][hits[a]], _Digits), pierce[a]);
        }
      tip += btTxt + "  (server time)";
      ObjectSetDouble (0,nm,OBJPROP_PRICE,     0, price);
      ObjectSetInteger(0,nm,OBJPROP_ARROWCODE, POI_MARKERGLYPH);
      ObjectSetInteger(0,nm,OBJPROP_ANCHOR,    isLong ? ANCHOR_TOP : ANCHOR_BOTTOM);
      ObjectSetInteger(0,nm,OBJPROP_COLOR,     MarkerColorFor(topSlot));
      ObjectSetInteger(0,nm,OBJPROP_WIDTH,     (InpMarkerWidthMulti && n > 1) ? 2 : 1);
      ObjectSetInteger(0,nm,OBJPROP_BACK,      false);
      ObjectSetInteger(0,nm,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(0,nm,OBJPROP_SELECTED,  false);
      ObjectSetInteger(0,nm,OBJPROP_HIDDEN,    true);
      ObjectSetInteger(0,nm,OBJPROP_ZORDER,    g_passId);
      ObjectSetString (0,nm,OBJPROP_TOOLTIP,   tip);

      if(prevStamp != g_passId)
        {
         if(isLong) PushRing(g_mkU, g_mkUHead, g_mkUCount, InpKeepMarkers, nm);
         else       PushRing(g_mkD, g_mkDHead, g_mkDCount, InpKeepMarkers, nm);

         if(AlertsFireable(i, rates_total, isIncremental) && AlertEligible(topLine, bt))
           {
            string tfTxt = StringSubstr(EnumToString((ENUM_TIMEFRAMES)_Period), 7);
            string msg   = StringFormat("%s %s - POI RETEST %s at %s  [%s%s]",
                                        _Symbol, tfTxt, dirStr,
                                        DoubleToString(g_L[i][topLine], _Digits),
                                        LineCode(topLine),
                                        (n > 1) ? StringFormat(" +%d", n - 1) : "");

            if(InpAlertPopup) Alert(msg);
            if(InpAlertPush && !SendNotification(msg))
               POI_LogWarn("SendNotification failed (err " + IntegerToString(GetLastError()) + ") - check MetaQuotes ID in Terminal options");

            g_lastAlertTime[topLine]  = bt;
            g_alertWatermark[topLine] = bt;
           }
        }
     }
  }

void EvalBar(const int i,const datetime &time[],const double &open[],const double &high[],const double &low[],const double &close[],const int rates_total,const bool isIncremental)
  {
   const double P   = _Point;
   const double EPS = _Point * 0.001;
   double bodyHi = MathMax(open[i], close[i]);
   double bodyLo = MathMin(open[i], close[i]);
   double hi = high[i], lo = low[i];
   int    longHits[];    ArrayResize(longHits,    NLINES);
   double longPierce[];  ArrayResize(longPierce,  NLINES);
   int    shortHits[];   ArrayResize(shortHits,   NLINES);
   double shortPierce[]; ArrayResize(shortPierce, NLINES);
   int nL = 0, nS = 0;

   for(int k = 0; k < NLINES; k++)
     {
      double L = g_L[i][k];
      if(L == EMPTY_VALUE || L <= 0.0) continue;
      if(lo <= L - P + EPS && bodyLo >= L - EPS)
        { longHits[nL]  = k; longPierce[nL]  = (L - lo) / P; nL++; }
      if(hi >= L + P - EPS && bodyHi <= L + EPS)
        { shortHits[nS] = k; shortPierce[nS] = (hi - L) / P; nS++; }
     }

   if(nL > 0) EmitMarker(i, true,  longHits,  longPierce,  nL, time, high, low, bodyLo, bodyHi, isIncremental, rates_total);
   if(nS > 0) EmitMarker(i, false, shortHits, shortPierce, nS, time, high, low, bodyLo, bodyHi, isIncremental, rates_total);
   ArrayFree(longHits);   ArrayFree(longPierce);
   ArrayFree(shortHits);  ArrayFree(shortPierce);
  }

void SnapshotAllSlots()
  {
   double sd;
   for(int s = 0; s < NSLOTS; s++)
     {
      slots[s].lastPOC  = SnapshotPoc(slots[s].poc);
      slots[s].lastVWAP = SnapshotVwap(slots[s].vwap, sd);
      if(slots[s].poc.capHit) g_binCapHit = true;
     }
  }

datetime WidestAnchorStart(const datetime ref)
  {
   datetime widest = ref;
   for(int s = 0; s < NSLOTS; s++)
     {
      if(slots[s].isEvent)
        {
         if(slots[s].absAnchor > 0 && slots[s].absAnchor < widest) widest = slots[s].absAnchor;
         continue;
        }
      datetime ps = AnchorStartFor(ref, slots[s].anchorType);
      if(ps < widest) widest = ps;
     }
   return widest;
  }

void ApplyCheckpoints(const long limitMs)
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      if(!g_ckpt[s].active) continue;
      
      // Fix: Used >= instead of > so the exact bar that contains the seam uses the live 
      // accumulator (which has correctly folded the ticks for that bar's duration).
      if(slots[s].foldFromMs > 0 && limitMs >= slots[s].foldFromMs) continue;
      
      double poc, vwap;
      if(CkValueAt(s, (datetime)(limitMs / 1000), poc, vwap))
        { slots[s].lastPOC = poc; slots[s].lastVWAP = vwap; }
      else
        { slots[s].lastPOC = 0.0; slots[s].lastVWAP = 0.0; }
     }
  }

void ResolveGating(const datetime bt,bool &inWin[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      if(slots[s].isEvent) { inWin[s] = (slots[s].absAnchor > 0 && bt >= slots[s].absAnchor); continue; }
      if(slots[s].periodStart <= 0) { inWin[s] = false; continue; }
      inWin[s] = (bt >= slots[s].periodStart);
     }
  }

void ResolveValidity(const int i,const datetime bt,const long btMs,const bool &inWin[],bool &valid[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      valid[s] = false;
      if(!inWin[s]) continue;
      if(!g_engineOpen || bt < g_engineFloor)
        {
         if(!(g_ckpt[s].active && slots[s].foldFromMs > 0 && btMs < slots[s].foldFromMs)) continue;
        }
      bool preSeam = (slots[s].foldFromMs > 0 && btMs < slots[s].foldFromMs);
      if(preSeam)
        {
         if(slots[s].lastPOC <= 0.0 && slots[s].lastVWAP <= 0.0) continue;
         if(!g_ckpt[s].active && !InpSeedBackProject) continue;
        }
      if(g_dispFloor[s] > 0 && bt < g_dispFloor[s]) continue;
      if(slots[s].lastPOC <= 0.0 && slots[s].lastVWAP <= 0.0) continue;
      valid[s] = true;
     }
  }

void WriteBar(const int i,const datetime bt,const long btMs,const bool &valid[])
  {
   for(int s = 0; s < NSLOTS; s++)
     {
      int kPOC  = s * 2;
      int kVWAP = s * 2 + 1;

      if(!valid[s])
        {
         BlankBufAt(kPOC, i);
         BlankBufAt(kVWAP, i);
         g_L[i][kPOC]  = EMPTY_VALUE;
         g_L[i][kVWAP] = EMPTY_VALUE;
         continue;
        }
        
      double poc  = slots[s].lastPOC;
      double vwap = slots[s].lastVWAP;
      
      switch(s)
        {
         case 0:
            Buf0[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf1[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
         case 1:
            Buf2[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf3[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
         case 2:
            Buf4[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf5[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
         case 3:
            Buf6[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf7[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
         case 4:
            Buf8[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf9[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
         case 5:
            Buf10[i] = (g_show[kPOC] && poc > 0.0) ? poc : EMPTY_VALUE;
            Buf11[i] = (g_show[kVWAP] && vwap > 0.0) ? vwap : EMPTY_VALUE;
            break;
        }

      g_L[i][kPOC]  = (poc > 0.0)  ? poc  : EMPTY_VALUE;
      g_L[i][kVWAP] = (vwap > 0.0) ? vwap : EMPTY_VALUE;
     }
  }

bool Rebuild(const datetime &time[],const double &open[],const double &high[],const double &low[],const double &close[],const int rates_total,const bool isIncremental)
  {
   // [POI] checkpoint A: entering OnCalculate
   Print("[POI] checkpoint A: entering OnCalculate");

   ResetEngine();
   g_truncated = false; g_capHit = false; g_binCapHit = false;
   g_depthShort = false; g_depthShortWho = ""; g_lastWarn = "";
   g_passId++; ResetRings(); PanelReset();
   gtc_priceSrc     = POI_PRICESRC; gtc_weightMode   = InpWeightMode;
   gtc_maxBackfill  = POI_MAXCHUNKTICKS; gtc_usableMode   = (ENUM_USABLE_MODE)SEED_FlagToMode(POI_FLAGMODE);
   gtc_prevBid      = 0.0;
   TC_DetectServerOffsetNow();
   uint rebuildStart = GetTickCount();

   double binSize = SEED_BinSize(_Symbol, InpBinPips);
   if(!(binSize > 0.0)) { BlankAllBuffers(); return false; }

   for(int s = 0; s < NSLOTS; s++)
     {
      PocInit(slots[s].poc, binSize); ClearVwap(slots[s].vwap);
      slots[s].lastPOC = 0.0; slots[s].lastVWAP = 0.0;
      slots[s].foldFromMs = 0; slots[s].periodStart = 0; slots[s].absAnchor = 0;
      g_slotAdopted[s] = false; g_slotReason[s] = ""; g_ckActive[s] = false;
     }

   slots[SLOT_FOMC].anchorType      = ANCHOR_MANUAL; slots[SLOT_FOMC].isEvent         = true;
   slots[SLOT_DAILY].anchorType     = ANCHOR_DAILY;
   slots[SLOT_WEEKLY].anchorType    = ANCHOR_WEEKLY;
   slots[SLOT_MONTHLY].anchorType   = ANCHOR_MONTHLY;
   slots[SLOT_QUARTERLY].anchorType = ANCHOR_QUARTERLY;
   slots[SLOT_YEARLY].anchorType    = ANCHOR_YEARLY;

   g_show[0]  = InpShow_Daily_POC;     g_show[1]  = InpShow_Daily_VWAP;
   g_show[2]  = InpShow_Weekly_POC;    g_show[3]  = InpShow_Weekly_VWAP;
   g_show[4]  = InpShow_Monthly_POC;   g_show[5]  = InpShow_Monthly_VWAP;
   g_show[6]  = InpShow_Quarterly_POC; g_show[7]  = InpShow_Quarterly_VWAP;
   g_show[8]  = InpShow_Yearly_POC;    g_show[9]  = InpShow_Yearly_VWAP;
   g_show[10] = InpShow_FOMC_POC;      g_show[11] = InpShow_FOMC_VWAP;

   slots[SLOT_FOMC].absAnchor = ParseFomcAnchor(InpFomcTimesServer, g_fomcLabel, true);

   // [POI] checkpoint B: FOMC anchor parsed
   PrintFormat("[POI] checkpoint B: FOMC anchor parsed, absAnchor=%s", TimeToString(slots[SLOT_FOMC].absAnchor));

   datetime today = TC_DayStart(TimeCurrent());
   if(InpDepthProbeDays > 0)
     {
      if(g_measuredDepth <= 0 || g_depthMeasuredOn != today)
        {
         g_measuredDepth = POI_MeasureTickDepth(_Symbol, InpDepthProbeDays, g_depthUnresolved);
         g_depthMeasuredOn = today;
        }
     }
   else
     {
      g_measuredDepth = 0;
      g_depthUnresolved = 0;
     }

   g_seedLoaded   = false; g_seamTime     = 0; g_seedNewest   = 0;
   g_seedRefusal  = ""; g_seedGmtKnown = false; g_seedDstInfo  = 0;

   SeedHeader h; SEED_HeaderClear(h);
   long seedPS[NSLOTS]; long seedFM[NSLOTS]; int seedAT[NSLOTS]; int seedIE[NSLOTS];
   VwapAccum seedVwap[NSLOTS]; PocAccum seedPoc[NSLOTS]; string seedErr = "";
   long adoptSeamMs = 0; bool anyAdopted = false;

   if(InpUseSeed)
     {
      string sf = SEED_FileName(_Symbol);
      if(!SEED_Read(sf, h, seedPS, seedFM, seedAT, seedIE, seedVwap, seedPoc, seedErr))
        {
         g_seedRefusal = seedErr;
         PanelRaise(PC_NOSEED_FILE, "RUN SRJ_POI_Seeder FIRST", "Seed file not loaded: " + seedErr + ". Run SRJ_POI_Seeder FIRST.");
        }
      else
        {
         g_seedLoaded   = true; adoptSeamMs = h.seamMsc;
         g_seamTime     = (datetime)(adoptSeamMs / 1000);
         g_seedGmtInfo  = h.serverGmtBase; g_seedDstInfo  = h.serverDst; g_seedGmtKnown = true;
         if(!SEED_Compatible(h, _Symbol, binSize, (int)InpWeightMode, seedErr))
           { g_seedRefusal = seedErr; g_seedLoaded = false; }
         if(g_seedLoaded && g_measuredDepth > 0)
           {
            long depthMs = (long)g_measuredDepth * 1000;
            if(adoptSeamMs < depthMs)
              {
               string why = StringFormat("seam %s precedes measured depth %s", TimeToString(g_seamTime, TIME_DATE|TIME_MINUTES), TimeToString(g_measuredDepth, TIME_DATE|TIME_MINUTES));
               if(InpRefuseSeamHole) { g_seedRefusal = why; g_seedLoaded = false; }
              }
           }
        }
     }
   else
     {
      PanelRaise(PC_SEED_OFF, "Seed disabled - Q/Y truncated", "InpUseSeed is FALSE. Quarterly and Yearly truncated.");
     }

   if(g_seedLoaded)
     {
      datetime now = TimeCurrent();
      for(int s = 0; s < NSLOTS; s++)
        {
         if(s == SLOT_FOMC)
           {
            datetime seedFomc = (datetime)seedPS[SLOT_FOMC];
            if(slots[SLOT_FOMC].absAnchor > 0 && seedFomc == slots[SLOT_FOMC].absAnchor)
              {
               slots[s].vwap = seedVwap[s]; slots[s].poc = seedPoc[s]; slots[s].foldFromMs = adoptSeamMs;
               double sd; slots[s].lastPOC = SnapshotPoc(slots[s].poc); slots[s].lastVWAP = SnapshotVwap(slots[s].vwap, sd);
               g_slotAdopted[s] = true; anyAdopted = true;
              }
            else
               g_slotReason[s] = "FOMC anchor mismatch";
            continue;
           }
         datetime seedPeriod = (datetime)seedPS[s];
         datetime hostPeriod = AnchorStartFor(now, slots[s].anchorType);
         datetime seamPeriod = AnchorStartFor(g_seamTime, slots[s].anchorType);
         if(seedPeriod == hostPeriod && seedPeriod == seamPeriod)
           {
            slots[s].vwap = seedVwap[s]; slots[s].poc = seedPoc[s];
            slots[s].foldFromMs = adoptSeamMs; slots[s].periodStart = seedPeriod;
            double sd; slots[s].lastPOC = SnapshotPoc(slots[s].poc); slots[s].lastVWAP = SnapshotVwap(slots[s].vwap, sd);
            g_slotAdopted[s] = true; anyAdopted = true;
           }
        }

      if(g_seedLoaded && anyAdopted && h.lastBid > 0.0)
         gtc_prevBid = h.lastBid;

      if(!anyAdopted)
         PanelRaise(PC_NO_ADOPT, "No slot adopted the seed", "Seed loaded but no slot adopted.");

      string cf = SEED_CkptName(_Symbol); string ckErr = "";
      int dig = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS); double pt = SymbolInfoDouble(_Symbol, SYMBOL_POINT);
      CkRead(cf, adoptSeamMs, binSize, dig, pt, ckErr);
     }

   // [POI] checkpoint C: seed block done
   Print("[POI] checkpoint C: seed block done");

   for(int s = 0; s < NSLOTS - 1; s++)
     {
      if(g_slotAdopted[s]) continue;
      datetime ps = AnchorStartFor(TimeCurrent(), slots[s].anchorType);
      if(g_measuredDepth > 0 && ps < g_measuredDepth) { g_depthShort = true; g_depthShortWho += " " + g_slotCode[s]; }
     }
   if(g_depthShort) PanelRaise(PC_DEPTH_SHORT, g_depthShortWho + " truncated", g_depthShortWho + " anchor starts before measured depth.");

   if(!InpContinuousAnchors)
      for(int s = 0; s < NSLOTS; s++)
         g_dispFloor[s] = slots[s].isEvent ? slots[s].absAnchor : AnchorStartFor(TimeCurrent(), slots[s].anchorType);

   for(int s = 0; s < NSLOTS; s++) g_hostPeriod[s] = slots[s].isEvent ? slots[s].absAnchor : AnchorStartFor(TimeCurrent(), slots[s].anchorType);

   if(!EnsureLineStore(rates_total)) { BlankAllBuffers(); return false; }
   POI_RecalcPriceATR(high, low, close, rates_total);

   datetime widestRef = (InpContinuousAnchors && InpContinuousLookbackDays > 0) ? TimeCurrent() - InpContinuousLookbackDays * 86400 : TimeCurrent();
   datetime widestStart = WidestAnchorStart(widestRef);
   g_firstBarTime = (rates_total > 0) ? time[0] : TimeCurrent();

   long neededFromMs = LONG_MAX;
   for(int s = 0; s < NSLOTS; s++)
     {
      long slotFrom;
      if(slots[s].foldFromMs > 0) slotFrom = slots[s].foldFromMs;
      else if(slots[s].isEvent) slotFrom = (slots[s].absAnchor > 0) ? (long)slots[s].absAnchor * 1000 : LONG_MAX;
      else slotFrom = (long)AnchorStartFor(widestRef, slots[s].anchorType) * 1000;
      if(slotFrom < neededFromMs) neededFromMs = slotFrom;
     }

   if(g_measuredDepth > 0)
     {
      long depthMs = (long)g_measuredDepth * 1000;
      if(neededFromMs < depthMs) neededFromMs = depthMs;
     }

   long preFoldFrom = neededFromMs;
   long preFoldTo   = (long)g_firstBarTime * 1000;

   TickResume preResume; ClearResume(preResume);
   if(preFoldTo > preFoldFrom)
      if(!FoldRange(preFoldFrom, preFoldTo, preResume)) return false;

   SnapshotAllSlots();

   int walkEnd = (rates_total >= 2) ? rates_total - 1 : 0;
   int walkFrom = 0;
   datetime oldestNeeded = WidestAnchorStart(widestRef);
   
   while(walkFrom < walkEnd && time[walkFrom] < oldestNeeded)
     {
      for(int k = 0; k < NLINES; k++) { BlankBufAt(k, walkFrom); g_L[walkFrom][k] = EMPTY_VALUE; }
      walkFrom++;
     }

   // Calculate marker lookback floor
   datetime markerFloor = 0;
   if(InpMarkerLookbackDays > 0)
     {
      datetime now = TimeCurrent();
      markerFloor = (datetime)((long)now - (long)InpMarkerLookbackDays * 86400);
     }

   CTickCursor walkCur;
   walkCur.Init((long)time[walkFrom]*1000, (long)TimeCurrent()*1000 + 1000, 0, 0);
   MqlTick t;

   // [POI] checkpoint D: entering bar-walk loop
   Print("[POI] checkpoint D: entering bar-walk loop");

   for(int i = walkFrom; i < walkEnd; i++)
     {
      datetime bt     = time[i];
      long     btMs   = (long)bt * 1000;
      datetime nextBt = (i + 1 < rates_total) ? time[i + 1] : bt;
      long     nextMs = (long)nextBt * 1000;

      if(InpContinuousAnchors)
        {
         for(int s = 0; s < NSLOTS - 1; s++)
           {
            datetime ps = AnchorStartFor(bt, slots[s].anchorType);
            if(ps != slots[s].periodStart)
              { ClearVwap(slots[s].vwap); ClearPoc(slots[s].poc); slots[s].periodStart = ps; slots[s].foldFromMs = 0; }
           }
        }

      if(nextMs > btMs)
        {
         while(walkCur.Next(nextMs, t))
            FoldOneTick(t);
        }

      SnapshotAllSlots(); 
      ApplyCheckpoints(btMs); 

      bool inWin[NSLOTS], valid[NSLOTS];
      ResolveGating(bt, inWin);
      ResolveValidity(i, bt, btMs, inWin, valid);
      WriteBar(i, bt, btMs, valid);

      // Only draw markers within the lookback window to save chart loading/rendering performance
      if(i <= walkEnd - 1)
        {
         bool withinMarkerWindow = true;
         if(InpMarkerLookbackDays > 0 && markerFloor > 0)
            withinMarkerWindow = (bt >= markerFloor);
            
         if(withinMarkerWindow)
            EvalBar(i, time, open, high, low, close, rates_total, isIncremental);
        }
     }

   // [POI] checkpoint E: bar-walk loop complete
   Print("[POI] checkpoint E: bar-walk loop complete");
   
   // Fix: Force a clean retry if the cursor dies to a temporary terminal timeout (-1).
   // Without this, the single walk cursor fails silently and leaves the remainder of 
   // the historical loop completely empty of ticks until live tracking spins up a fresh cursor.
   if(walkCur.HadError()) 
     { 
      POI_LogWarn("unresolved tick fetch during bar walk - retrying on next tick");
      BlankAllBuffers();
      DrawPanel();
      DrawAnchorMarker();
      return false; 
     }

   g_evalBar = (walkEnd >= 1) ? walkEnd - 1 : -1;

   PanelRow("SRJ POI v4.12  " + _Symbol + " " + EnumToString((ENUM_TIMEFRAMES)_Period));
   PanelRow("Server offset: " + PanelOffsetText());
   DrawPanel();
   DrawAnchorMarker();
   SweepUnstampedMarkers(g_passId);

   if(!g_alertArmed) g_alertArmed = true;
   POI_RetryClear();
   g_lastBar = rates_total - 1;
   return true;
  }

int OnInit()
  {
   Print("[POI] checkpoint 0: entering OnInit");
   ArraySetAsSeries(Buf0,  false); ArraySetAsSeries(Buf1,  false);
   ArraySetAsSeries(Buf2,  false); ArraySetAsSeries(Buf3,  false);
   ArraySetAsSeries(Buf4,  false); ArraySetAsSeries(Buf5,  false);
   ArraySetAsSeries(Buf6,  false); ArraySetAsSeries(Buf7,  false);
   ArraySetAsSeries(Buf8,  false); ArraySetAsSeries(Buf9,  false);
   ArraySetAsSeries(Buf10, false); ArraySetAsSeries(Buf11, false);

   SetIndexBuffer(0,  Buf0,  INDICATOR_DATA); SetIndexBuffer(1,  Buf1,  INDICATOR_DATA);
   SetIndexBuffer(2,  Buf2,  INDICATOR_DATA); SetIndexBuffer(3,  Buf3,  INDICATOR_DATA);
   SetIndexBuffer(4,  Buf4,  INDICATOR_DATA); SetIndexBuffer(5,  Buf5,  INDICATOR_DATA);
   SetIndexBuffer(6,  Buf6,  INDICATOR_DATA); SetIndexBuffer(7,  Buf7,  INDICATOR_DATA);
   SetIndexBuffer(8,  Buf8,  INDICATOR_DATA); SetIndexBuffer(9,  Buf9,  INDICATOR_DATA);
   SetIndexBuffer(10, Buf10, INDICATOR_DATA); SetIndexBuffer(11, Buf11, INDICATOR_DATA);

   color plotCol[NLINES];
   plotCol[0]  = InpColDaily;     plotCol[1]  = InpColDaily;
   plotCol[2]  = InpColWeekly;    plotCol[3]  = InpColWeekly;
   plotCol[4]  = InpColMonthly;   plotCol[5]  = InpColMonthly;
   plotCol[6]  = InpColQuarterly; plotCol[7]  = InpColQuarterly;
   plotCol[8]  = InpColYearly;    plotCol[9]  = InpColYearly;
   plotCol[10] = InpColFOMC;      plotCol[11] = InpColFOMC;

   for(int p = 0; p < NLINES; p++)
     {
      PlotIndexSetInteger(p, PLOT_LINE_COLOR, plotCol[p]);
      PlotIndexSetDouble (p, PLOT_EMPTY_VALUE, EMPTY_VALUE);
      PlotIndexSetString (p, PLOT_LABEL, LineCode(p));
     }

   IndicatorSetInteger(INDICATOR_DIGITS, _Digits);
   IndicatorSetString (INDICATOR_SHORTNAME, "SRJ POI Marker v4.12 " + _Symbol);

   BlankAllBuffers();
   for(int k = 0; k < NLINES; k++) { g_alertWatermark[k] = 0; g_lastAlertTime[k]  = 0; }
   g_alertArmed    = false; g_csvWatermarkU = 0; g_csvWatermarkD = 0;
   for(int i = 0; i < PC_COUNT; i++) g_pcFired[i] = false;
   g_lastBar     = -1; g_needRebuild = true; g_passId      = 0;

   ResetRings(); DeleteAllMarkers(); DeleteAnchorMarker(); DeletePanel();
   EventSetTimer(POI_RETRYSECONDS);
   return INIT_SUCCEEDED;
  }

void OnDeinit(const int reason)
  {
   EventKillTimer();
   DeleteAllMarkers(); DeleteAnchorMarker(); DeletePanel();
   ArrayFree(g_PriceATR);
  }

void OnTimer()
  {
   if(!g_needRebuild) return;
   if(POI_RetryCount() >= POI_MAXRETRIES) return;
   POI_RetrySet(POI_RetryCount() + 1);

   MqlTick probe[];
   CopyTicks(_Symbol, probe, COPY_TICKS_ALL, 0, 1);
   ChartRedraw(); 
  }

int OnCalculate(const int rates_total, const int prev_calculated, const datetime &time[], const double &open[], const double &high[], const double &low[], const double &close[], const long &tick_volume[], const long &volume[], const int &spread[])
  {
   if(rates_total < 2) return rates_total;
   bool needRebuild = g_needRebuild;

   if(!needRebuild && g_lastBar >= 0 && g_lastBar < rates_total)
     {
      datetime now = TimeCurrent();
      for(int s = 0; s < NSLOTS - 1; s++)
         if(AnchorStartFor(now, slots[s].anchorType) != g_hostPeriod[s]) { needRebuild = true; break; }
      if(!needRebuild)
        {
         datetime fa = FomcActiveNow();
         if(fa != slots[SLOT_FOMC].absAnchor) needRebuild = true;
        }
     }

   bool isNewBar = (prev_calculated > 0 && prev_calculated < rates_total);

   if(needRebuild)
     {
      g_needRebuild = true;
      if(!Rebuild(time, open, high, low, close, rates_total, isNewBar)) return 0;                
      g_needRebuild = false;
      return rates_total;
     }

   if(!EnsureLineStore(rates_total)) return rates_total;

   if(isNewBar)
     {
      int ci = rates_total - 2;
      if(ci >= 0)
        {
         datetime bt     = time[ci];
         long     btMs   = (long)bt * 1000;
         datetime nextBt = time[ci + 1];
         long     nextMs = (long)nextBt * 1000;

         if(nextMs > btMs)
           {
            TickResume closeResume; ClearResume(closeResume);
            FoldRange(btMs, nextMs, closeResume);
           }

         SnapshotAllSlots();
         ApplyCheckpoints(btMs);
         
         bool inWin[NSLOTS], valid[NSLOTS];
         ResolveGating(bt, inWin); ResolveValidity(ci, bt, btMs, inWin, valid); WriteBar(ci, bt, btMs, valid);
         POI_UpdateLastATR(high, low, close, rates_total);
         EvalBar(ci, time, open, high, low, close, rates_total, true);
         g_evalBar = ci;
        }
      ClearResume(g_resume);
      g_lastBar = rates_total - 1;
     }

   int fi = rates_total - 1;
   if(fi < 0) return rates_total;

   datetime fbt   = time[fi];
   long     fbtMs = (long)fbt * 1000;
   long     nowMs = (long)TimeCurrent() * 1000 + 999;   

   if(nowMs > fbtMs) FoldRange(fbtMs, nowMs, g_resume);

   SnapshotAllSlots();
   ApplyCheckpoints(fbtMs);
   
   bool inWinF[NSLOTS], validF[NSLOTS];
   ResolveGating(fbt, inWinF); ResolveValidity(fi, fbt, fbtMs, inWinF, validF); WriteBar(fi, fbt, fbtMs, validF);
   POI_UpdateLastATR(high, low, close, rates_total);

   g_lastBar = rates_total - 1;
   return rates_total;
  }
//+------------------------------------------------------------------+