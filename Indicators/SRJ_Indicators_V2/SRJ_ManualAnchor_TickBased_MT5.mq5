//+------------------------------------------------------------------+
//|             SRJ_ManualAnchor_TickBased_MT5.mq5                  |
//|                                                                  |
//|   Up to 4 event-driven anchors (FOMC / NFP / CPI / custom),      |
//|   each drawing Developing POC (solid) + VWAP (dashed) = 8 plots. |
//|                                                                  |
//|   v2.0 - structural rewrite against SRJ_TickCore v2.0.           |
//|     * Drag-and-drop is GONE, and with it the OBJ_VLINE +         |
//|       GlobalVariable + OnTimer + OnChartEvent + REASON_REMOVE    |
//|       machinery: ~80 lines of state synchronisation protecting   |
//|       a value that belongs in an input. ForceRecalc() also used  |
//|       to write indicator buffers from OnTimer using its own      |
//|       CopyTime length, which silently misaligned indices when it |
//|       disagreed with rates_total.                                |
//|     * Anchors are a semicolon-separated list, entered in a NAMED |
//|       TIME ZONE. Releases are scheduled in New York; an MT5      |
//|       datetime input is in server time. That conversion, not the |
//|       input itself, was the real gap.                            |
//|     * Anchors older than available tick history are reached with |
//|       an M1 bar tail, so a months-old FOMC anchor still works.   |
//|       Previously the profile silently re-anchored at the leftmost |
//|       loaded bar and its printed values changed as you scrolled. |
//|     * Read-only marker lines confirm where each input landed -   |
//|       cheap, and it catches a timezone mistake immediately.      |
//|     * O(1) POC, explicit weighting, tick-flag filtering, retry   |
//|       on unsynchronised tick history, Print instead of Alert.    |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "2.00"
#property description "SRJ Manual/Event Volume Profile - tick-based developing POC + VWAP"
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_plots   8

#property indicator_label1  "E1-POC"
#property indicator_type1   DRAW_LINE
#property indicator_width1  2
#property indicator_style1  STYLE_SOLID
#property indicator_label2  "E1-VWAP"
#property indicator_type2   DRAW_LINE
#property indicator_width2  2
#property indicator_style2  STYLE_DASH

#property indicator_label3  "E2-POC"
#property indicator_type3   DRAW_LINE
#property indicator_width3  2
#property indicator_style3  STYLE_SOLID
#property indicator_label4  "E2-VWAP"
#property indicator_type4   DRAW_LINE
#property indicator_width4  2
#property indicator_style4  STYLE_DASH

#property indicator_label5  "E3-POC"
#property indicator_type5   DRAW_LINE
#property indicator_width5  2
#property indicator_style5  STYLE_SOLID
#property indicator_label6  "E3-VWAP"
#property indicator_type6   DRAW_LINE
#property indicator_width6  2
#property indicator_style6  STYLE_DASH

#property indicator_label7  "E4-POC"
#property indicator_type7   DRAW_LINE
#property indicator_width7  2
#property indicator_style7  STYLE_SOLID
#property indicator_label8  "E4-VWAP"
#property indicator_type8   DRAW_LINE
#property indicator_width8  2
#property indicator_style8  STYLE_DASH

#include "SRJ_TickCore.mqh"

//====================== Inputs ======================================
input group "Event anchors"
input string     InpEventTimes = "";           // "2026.01.28 14:00; 2026.03.18 14:00" (max 4)
input ENUM_TZ_ID InpEventTZ    = TZ_NEWYORK;   // zone the times above are quoted in

input group "Broker clock (drives the timezone conversion)"
input ENUM_DST_RULE InpServerDstRule = DST_EU; // how the broker's own clock shifts
input int           InpServerGmtBase = 0;      // server standard offset, SECONDS. 0 = auto-detect

input group "Binning / Source"
input double           InpBinPips       = 0.1;
input int              InpTargetBins    = 3000;   // 0 = use InpBinPips verbatim
input ENUM_PRICE_SRC   InpPriceSrc      = SRC_BID;
input ENUM_WEIGHT_MODE InpWeightMode    = WEIGHT_TICKCOUNT;
input bool             InpUseTickFlags  = true;
input int              InpMaxChunkTicks = 0;      // per-day chunk cap. 0 = unlimited

input group "History"
input int  InpMaxTickDays = 30;    // TICK fetch cap in days. 0 = back to the anchor
input bool InpUseM1Tail   = true;  // splice M1 bars for anything older than the cap

input group "Colours"
input color InpColEvent1 = clrMediumPurple;
input color InpColEvent2 = clrDodgerBlue;
input color InpColEvent3 = clrGoldenrod;
input color InpColEvent4 = clrMediumSeaGreen;

input group "Anchor markers (read-only, not draggable)"
input bool InpShowMarkers = true;

input group "Diagnostics (log only)"
input bool InpLogWarnings = true;
input bool InpLogTiming   = false;

//====================== Model =======================================
#define MAX_EVENTS 4

struct EventSlot
  {
   bool      active;
   datetime  anchor;        // resolved SERVER time
   string    label;         // as typed, for the marker tooltip
   VwapAccum vwap;
   PocAccum  poc;
   double    lastPOC;
   double    lastVWAP;
  };
EventSlot ev[MAX_EVENTS];
int       g_nEvents = 0;

double Buf0[],Buf1[],Buf2[],Buf3[],Buf4[],Buf5[],Buf6[],Buf7[];

TickResume g_resume;
int        g_lastBar      = -1;
datetime   g_firstBarTime = 0;
bool       g_needRebuild  = true;

bool   g_truncated = false;
bool   g_capHit    = false;
bool   g_binCapHit = false;
string g_lastWarn  = "";

string g_markerPrefix = "SRJ_EVT_";

//+------------------------------------------------------------------+
void SetBuf(const int p,const int i,const double v)
  {
   switch(p)
     {
      case 0: Buf0[i]=v; break; case 1: Buf1[i]=v; break;
      case 2: Buf2[i]=v; break; case 3: Buf3[i]=v; break;
      case 4: Buf4[i]=v; break; case 5: Buf5[i]=v; break;
      case 6: Buf6[i]=v; break; case 7: Buf7[i]=v; break;
     }
  }

void BlankAllBuffers()
  {
   ArrayInitialize(Buf0,EMPTY_VALUE); ArrayInitialize(Buf1,EMPTY_VALUE);
   ArrayInitialize(Buf2,EMPTY_VALUE); ArrayInitialize(Buf3,EMPTY_VALUE);
   ArrayInitialize(Buf4,EMPTY_VALUE); ArrayInitialize(Buf5,EMPTY_VALUE);
   ArrayInitialize(Buf6,EMPTY_VALUE); ArrayInitialize(Buf7,EMPTY_VALUE);
  }

void LogWarn(const string msg)
  {
   if(!InpLogWarnings) return;
   if(msg == g_lastWarn) return;
   g_lastWarn = msg;
   Print(msg);
  }

void EmitWarnings()
  {
   if(!g_truncated && !g_capHit && !g_binCapHit) { g_lastWarn=""; return; }
   string msg = "[SRJ Event VP] ";
   if(g_truncated)
      msg += "History does not reach the earliest anchor - that profile's start is "
             "truncated (enable InpUseM1Tail, raise InpMaxTickDays, or pre-cache history). ";
   if(g_capHit)
      msg += "InpMaxChunkTicks was hit on at least one day - that day is undercounted. ";
   if(g_binCapHit)
      msg += "POC bin cap reached - raise InpBinPips or lower InpTargetBins.";
   LogWarn(msg);
  }

//------------------------------------------------------------------
//  Parses the event list. Times are read in InpEventTZ and converted
//  to server time using the DST rule in force AT THE EVENT DATE, not
//  at TimeCurrent(). Residual error is bounded to one hour and only
//  for brokers whose actual schedule differs from the selected rule.
//------------------------------------------------------------------
int ParseEvents()
  {
   for(int s=0;s<MAX_EVENTS;s++)
     {
      ev[s].active   = false;
      ev[s].anchor   = 0;
      ev[s].label    = "";
      ev[s].lastPOC  = 0.0;
      ev[s].lastVWAP = 0.0;
     }

   int n = 0;
   string parts[];
   int k = StringSplit(InpEventTimes,';',parts);

   for(int i=0;i<k && n<MAX_EVENTS;i++)
     {
      string s = parts[i];
      StringTrimLeft(s);
      StringTrimRight(s);
      if(StringLen(s) == 0) continue;

      datetime wall = StringToTime(s);
      if(wall <= 0)
        {
         Print("SRJ Event VP: could not parse \"",s,"\" - expected yyyy.mm.dd hh:mi. Skipped.");
         continue;
        }

      ev[n].active = true;
      ev[n].label  = s;
      ev[n].anchor = TC_ZoneToServer(wall,InpEventTZ);
      n++;
     }
   return n;
  }

void DeleteMarkers()
  {
   ObjectsDeleteAll(0,g_markerPrefix,0,OBJ_VLINE);
  }

//--- Read-only confirmation of where each input actually landed.
void DrawMarkers()
  {
   DeleteMarkers();
   if(!InpShowMarkers) return;

   color col[MAX_EVENTS] = { InpColEvent1, InpColEvent2, InpColEvent3, InpColEvent4 };

   for(int s=0;s<g_nEvents;s++)
     {
      if(!ev[s].active) continue;
      string name = g_markerPrefix + IntegerToString(s);
      if(!ObjectCreate(0,name,OBJ_VLINE,0,ev[s].anchor,0)) continue;

      ObjectSetInteger(0,name,OBJPROP_COLOR,col[s]);
      ObjectSetInteger(0,name,OBJPROP_WIDTH,1);
      ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_DOT);
      ObjectSetInteger(0,name,OBJPROP_BACK,true);
      ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);   // read-only by design
      ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
      ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
      ObjectSetString(0,name,OBJPROP_TOOLTIP,
         "Event " + IntegerToString(s+1) + ": " + ev[s].label + " " +
         EnumToString(InpEventTZ) + "  ->  server " +
         TimeToString(ev[s].anchor,TIME_DATE|TIME_MINUTES));
     }
  }

//+------------------------------------------------------------------+
int OnInit()
  {
   if(InpBinPips <= 0.0)     return(INIT_PARAMETERS_INCORRECT);
   if(InpTargetBins < 0)     return(INIT_PARAMETERS_INCORRECT);
   if(InpMaxTickDays < 0)    return(INIT_PARAMETERS_INCORRECT);
   if(InpMaxChunkTicks < 0)  return(INIT_PARAMETERS_INCORRECT);

   gtc_priceSrc       = InpPriceSrc;
   gtc_weightMode     = InpWeightMode;
   gtc_maxBackfill    = InpMaxChunkTicks;
   gtc_useTickFlags   = InpUseTickFlags;
   gtc_useSessionHour = false;                 // event anchors are absolute instants
   gtc_serverDst      = InpServerDstRule;

   if(InpServerGmtBase != 0) gtc_serverGmtBase = InpServerGmtBase;
   else                      TC_DetectServerOffset();

   SetIndexBuffer(0,Buf0,INDICATOR_DATA); SetIndexBuffer(1,Buf1,INDICATOR_DATA);
   SetIndexBuffer(2,Buf2,INDICATOR_DATA); SetIndexBuffer(3,Buf3,INDICATOR_DATA);
   SetIndexBuffer(4,Buf4,INDICATOR_DATA); SetIndexBuffer(5,Buf5,INDICATOR_DATA);
   SetIndexBuffer(6,Buf6,INDICATOR_DATA); SetIndexBuffer(7,Buf7,INDICATOR_DATA);

   for(int p=0;p<8;p++) PlotIndexSetDouble(p,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   color col[MAX_EVENTS] = { InpColEvent1, InpColEvent2, InpColEvent3, InpColEvent4 };
   for(int s=0;s<MAX_EVENTS;s++)
     {
      PlotIndexSetInteger(s*2,   PLOT_LINE_COLOR, col[s]);
      PlotIndexSetInteger(s*2+1, PLOT_LINE_COLOR, col[s]);
      PlotIndexSetString(s*2,   PLOT_LABEL,"E"+IntegerToString(s+1)+"-POC");
      PlotIndexSetString(s*2+1, PLOT_LABEL,"E"+IntegerToString(s+1)+"-VWAP");
     }

   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);

   double floorBin = ComputeBinSize(InpBinPips);
   for(int s=0;s<MAX_EVENTS;s++)
     {
      ClearVwap(ev[s].vwap);
      PocInit(ev[s].poc,floorBin);
     }

   g_nEvents = ParseEvents();
   DrawMarkers();

   ClearResume(g_resume);
   g_lastBar      = -1;
   g_firstBarTime = 0;
   g_needRebuild  = true;

   IndicatorSetString(INDICATOR_SHORTNAME,
      "SRJ Event VP (" + IntegerToString(g_nEvents) + " anchor" +
      (g_nEvents == 1 ? "" : "s") + ")");

   if(g_nEvents == 0)
      Print("SRJ Event VP: no valid anchors in InpEventTimes. "
            "Format: \"2026.01.28 14:00; 2026.03.18 14:00\" in ",
            EnumToString(InpEventTZ),".");
   else
      for(int s=0;s<g_nEvents;s++)
         Print(StringFormat("SRJ Event VP anchor %d: %s %s -> server %s "
                            "(server base %+.2fh, dst rule %s)",
                            s+1, ev[s].label, EnumToString(InpEventTZ),
                            TimeToString(ev[s].anchor,TIME_DATE|TIME_MINUTES),
                            (double)gtc_serverGmtBase/3600.0,
                            EnumToString(gtc_serverDst)));

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   DeleteMarkers();
  }

//====================== Slot operations =============================
datetime EarliestAnchor()
  {
   datetime e = 0;
   for(int s=0;s<g_nEvents;s++)
      if(ev[s].active && (e == 0 || ev[s].anchor < e)) e = ev[s].anchor;
   return e;
  }

//--- Each slot only sees ticks at or after its own anchor, so one
//--- stream serves all four without any per-slot fetch.
void FoldTickAllEvents(const MqlTick &t)
  {
   for(int s=0;s<g_nEvents;s++)
      if(ev[s].active && t.time >= ev[s].anchor)
         FoldTick(ev[s].vwap,ev[s].poc,t);
  }

void FoldM1AllEvents(const MqlRates &r)
  {
   for(int s=0;s<g_nEvents;s++)
      if(ev[s].active && r.time >= ev[s].anchor)
         FoldM1Bar(ev[s].vwap,ev[s].poc,r);
  }

void SnapshotAllEvents()
  {
   double sd;
   for(int s=0;s<g_nEvents;s++)
     {
      if(!ev[s].active) continue;
      ev[s].lastPOC  = SnapshotPoc(ev[s].poc);
      ev[s].lastVWAP = SnapshotVwap(ev[s].vwap,sd);
      if(ev[s].poc.capHit) g_binCapHit = true;
     }
  }

void WriteBar(const int i,const datetime bt)
  {
   for(int s=0;s<MAX_EVENTS;s++)
     {
      bool inWin = (s < g_nEvents && ev[s].active && bt >= ev[s].anchor);
      bool okP   = (inWin && ev[s].lastPOC  > 0.0);
      bool okV   = (inWin && ev[s].lastVWAP > 0.0);
      SetBuf(s*2,   i, okP ? ev[s].lastPOC  : EMPTY_VALUE);
      SetBuf(s*2+1, i, okV ? ev[s].lastVWAP : EMPTY_VALUE);
     }
  }

//====================== Rebuild =====================================
bool Rebuild(const datetime &time[],const int rates_total)
  {
   BlankAllBuffers();
   ClearResume(g_resume);
   g_lastBar   = -1;
   g_truncated = false;
   g_capHit    = false;
   g_binCapHit = false;

   if(rates_total <= 0 || g_nEvents == 0) return true;

   datetime now      = TimeCurrent();
   datetime trueFrom = EarliestAnchor();
   if(trueFrom <= 0 || trueFrom >= now) return true;

   ulong t0 = GetMicrosecondCount();

   datetime tickFrom = trueFrom;
   if(InpMaxTickDays > 0)
     {
      datetime cap = (datetime)((long)now - (long)InpMaxTickDays*86400);
      if(tickFrom < cap) tickFrom = cap;
     }

   TC_EnsureBarHistory(trueFrom);

   //--- Reset and size each histogram against its own anchor window.
   double floorBin = ComputeBinSize(InpBinPips);
   for(int s=0;s<g_nEvents;s++)
     {
      if(!ev[s].active) continue;
      double bs = floorBin;
      if(InpTargetBins > 0)
         bs = TC_AutoBinSize(ev[s].anchor,now,InpTargetBins,floorBin);
      PocInit(ev[s].poc,bs);
      ClearVwap(ev[s].vwap);
      ev[s].lastPOC  = 0.0;
      ev[s].lastVWAP = 0.0;
     }

   //--- M1 tail for anything older than the tick cap. This is what lets a
   //--- months-old FOMC anchor work at all; the old build silently
   //--- re-anchored at the leftmost loaded bar instead.
   if(trueFrom < tickFrom)
     {
      bool tailOk = false;
      if(InpUseM1Tail)
        {
         MqlRates m1[];
         int n = CopyRates(_Symbol,PERIOD_M1,trueFrom,(datetime)((long)tickFrom-1),m1);
         if(n > 0)
           {
            for(int k=0;k<n;k++) FoldM1AllEvents(m1[k]);
            tailOk = true;
           }
        }
      if(!tailOk) g_truncated = true;
     }

   long endMs = (long)now*1000 + 1000;
   CTickCursor cur;
   cur.Init((long)tickFrom*1000,endMs);

   MqlTick t;

   //--- First displayed bar. Anything before it is blank, but its ticks are
   //--- still folded so the visible series genuinely reaches the anchor.
   int firstBar = rates_total;
   for(int i=0;i<rates_total;i++) if(time[i] >= trueFrom) { firstBar = i; break; }
   if(firstBar >= rates_total) firstBar = rates_total - 1;
   if(firstBar < 0)            firstBar = 0;

   if(time[firstBar] > tickFrom)
     {
      long lim = (long)time[firstBar]*1000;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllEvents(t); }
     }

   if(cur.HadError())
     {
      LogWarn("[SRJ Event VP] Waiting on tick history sync (error " +
              IntegerToString(cur.LastError()) + ") - retrying, buffers left empty.");
      return false;
     }

   for(int i=0;i<firstBar && i<rates_total;i++) WriteBar(i,time[i]);

   for(int i=firstBar;i<rates_total;i++)
     {
      long lim = (i < rates_total-1) ? (long)time[i+1]*1000 : endMs;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllEvents(t); }

      SnapshotAllEvents();
      WriteBar(i,time[i]);
      g_lastBar = i;
     }

   if(cur.CapHit()) g_capHit = true;

   if(cur.HadError())
     {
      LogWarn("[SRJ Event VP] Tick fetch failed mid-rebuild (error " +
              IntegerToString(cur.LastError()) + ") - retrying.");
      return false;
     }

   if(InpLogTiming)
      Print(StringFormat("SRJ Event VP rebuild: %d anchors, %I64d ticks, %d fetches, %.1f ms",
                         g_nEvents,cur.Served(),cur.Fetches(),
                         (double)(GetMicrosecondCount()-t0)/1000.0));

   EmitWarnings();
   return true;
  }

//====================== OnCalculate =================================
int OnCalculate(const int rates_total,const int prev_calculated,
                const datetime &time[],const double &open[],const double &high[],
                const double &low[],const double &close[],const long &tick_volume[],
                const long &volume[],const int &spread[])
  {
   if(rates_total <= 0) return(0);

   if(g_nEvents == 0)
     {
      BlankAllBuffers();
      return(rates_total);
     }

   bool needFull = (prev_calculated == 0) || g_needRebuild ||
                   (g_lastBar < 0) || (g_lastBar >= rates_total) ||
                   (g_firstBarTime != 0 && time[0] != g_firstBarTime);

   if(needFull)
     {
      if(!Rebuild(time,rates_total))
        {
         g_needRebuild = true;
         return(0);
        }
      g_needRebuild  = false;
      g_firstBarTime = time[0];
      return(rates_total);
     }

   datetime now   = TimeCurrent();
   int      last  = rates_total - 1;
   int      start = (g_lastBar >= 0) ? g_lastBar : last;
   long     endMs = (long)now*1000 + 1000;

   long fromMs = (g_resume.lastMs > 0) ? g_resume.lastMs
                                       : (long)EarliestAnchor()*1000;

   CTickCursor cur;
   cur.Init(fromMs,endMs,g_resume.lastMs,g_resume.countAtLastMs);

   MqlTick t;
   for(int i=start;i<=last;i++)
     {
      long lim = (i < last) ? (long)time[i+1]*1000 : endMs;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllEvents(t); }

      SnapshotAllEvents();
      WriteBar(i,time[i]);
     }
   g_lastBar = last;

   if(cur.CapHit()) g_capHit = true;

   if(cur.HadError())
     {
      g_needRebuild = true;
      LogWarn("[SRJ Event VP] Incremental tick fetch failed (error " +
              IntegerToString(cur.LastError()) + ") - full rebuild queued.");
     }

   EmitWarnings();
   return(rates_total);
  }
//+------------------------------------------------------------------+