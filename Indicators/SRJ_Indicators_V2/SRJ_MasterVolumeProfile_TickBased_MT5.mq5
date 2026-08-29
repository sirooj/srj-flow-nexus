//+------------------------------------------------------------------+
//|            SRJ_MasterVolumeProfile_TickBased_MT5.mq5             |
//|                                                                  |
//|   5 anchors x {Developing POC, VWAP} = 10 lines, plus 2 price    |
//|   swing-candle marker plots = 12. One tick stream feeds all 5    |
//|   slots in a single pass.                                        |
//|                                                                  |
//|   Visual identity: COLOR = anchor period, STYLE = metric.        |
//|   POC solid, VWAP dashed. No bands, no VAH/VAL/VA, no chart      |
//|   text objects.                                                  |
//|                                                                  |
//|   v2.0 - structural rewrite against SRJ_TickCore v2.0.           |
//|     * Single rebuild path. FullRebuildSingle and                 |
//|       FullRebuildContinuous were ~90 near-identical lines each   |
//|       and had already drifted apart; they are now one function   |
//|       with two gating rules.                                     |
//|     * All fetching via CTickCursor. Tick history that is not yet |
//|       synchronised is detected and retried instead of being      |
//|       written to the buffers as a permanent flat profile.        |
//|     * O(1) POC snapshot (see the header). This, not the fetch,   |
//|       was the cold-attach cost.                                  |
//|     * Per-anchor bin size, auto-tuned to each anchor's realized  |
//|       range. One shared 0.1-pip bin across Daily..Yearly was     |
//|       both meaningless at the long end and the reason the        |
//|       histogram grew to hundreds of thousands of bins.           |
//|     * The last closed bar no longer repaints: ticks are folded   |
//|       to each bar's own boundary before that bar is written.     |
//|     * Same-millisecond ticks are no longer dropped on resume.    |
//|     * Alert() removed. Warnings go to the log, deduplicated.     |
//|     * Line colours are inputs; no more clrBlack default that     |
//|       vanishes on a dark scheme.                                 |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "2.00"
#property description "SRJ Master Volume Profile - 5-anchor tick-based developing POC + VWAP"
#property indicator_chart_window
#property indicator_buffers 12
#property indicator_plots   12

#property indicator_label1  "D-POC"
#property indicator_type1   DRAW_LINE
#property indicator_width1  2
#property indicator_style1  STYLE_SOLID
#property indicator_label2  "D-VWAP"
#property indicator_type2   DRAW_LINE
#property indicator_width2  2
#property indicator_style2  STYLE_DASH

#property indicator_label3  "W-POC"
#property indicator_type3   DRAW_LINE
#property indicator_width3  2
#property indicator_style3  STYLE_SOLID
#property indicator_label4  "W-VWAP"
#property indicator_type4   DRAW_LINE
#property indicator_width4  2
#property indicator_style4  STYLE_DASH

#property indicator_label5  "M-POC"
#property indicator_type5   DRAW_LINE
#property indicator_width5  2
#property indicator_style5  STYLE_SOLID
#property indicator_label6  "M-VWAP"
#property indicator_type6   DRAW_LINE
#property indicator_width6  2
#property indicator_style6  STYLE_DASH

#property indicator_label7  "Q-POC"
#property indicator_type7   DRAW_LINE
#property indicator_width7  2
#property indicator_style7  STYLE_SOLID
#property indicator_label8  "Q-VWAP"
#property indicator_type8   DRAW_LINE
#property indicator_width8  2
#property indicator_style8  STYLE_DASH

#property indicator_label9  "Y-POC"
#property indicator_type9   DRAW_LINE
#property indicator_width9  2
#property indicator_style9  STYLE_SOLID
#property indicator_label10 "Y-VWAP"
#property indicator_type10  DRAW_LINE
#property indicator_width10 2
#property indicator_style10 STYLE_DASH

#property indicator_label11 "Swing High"
#property indicator_type11  DRAW_ARROW
#property indicator_width11 1
#property indicator_label12 "Swing Low"
#property indicator_type12  DRAW_ARROW
#property indicator_width12 1

#include "SRJ_TickCore.mqh"

//====================== Inputs ======================================
input group "Session / Anchor clock"
input bool         InpUseSessionHour = false;      // anchor periods to a session open
input int          InpSessionHour    = 17;         // session open hour
input int          InpSessionMinute  = 0;
input ENUM_TZ_ID   InpSessionZone    = TZ_NEWYORK; // zone the session hour is quoted in

input group "Broker clock (drives every timezone conversion)"
input ENUM_DST_RULE InpServerDstRule = DST_EU;     // how the broker's own clock shifts
input int           InpServerGmtBase = 0;          // server standard offset, SECONDS. 0 = auto-detect

input group "Binning / Source"
input double           InpBinPips       = 0.1;     // minimum bin size in pips (floor for auto-sizing)
input int              InpTargetBins    = 3000;    // 0 = use InpBinPips verbatim for every anchor
input ENUM_PRICE_SRC   InpPriceSrc      = SRC_BID; // BID = the series MT5 draws candles from
input ENUM_WEIGHT_MODE InpWeightMode    = WEIGHT_TICKCOUNT;
input bool             InpUseTickFlags  = true;    // ignore ticks that did not move the selected side
input int              InpMaxChunkTicks = 0;       // per-day chunk cap. 0 = unlimited

input group "History window"
input bool InpContinuousAnchors      = false;      // re-develop every historical period
input int  InpContinuousLookbackDays = 90;         // continuous mode display window. 0 = all bars
input int  InpMaxLookbackDays        = 30;         // single mode TICK fetch cap. 0 = full anchor width
input bool InpUseM1Tail              = true;       // splice M1 bars for the part older than the cap

input group "Diagnostics (log only - no popups, no chart text)"
input bool InpLogWarnings = true;
input bool InpLogTiming   = false;

input group "Line visibility"
input bool InpShow_Daily_POC     = true;   input bool InpShow_Daily_VWAP     = true;
input bool InpShow_Weekly_POC    = true;   input bool InpShow_Weekly_VWAP    = true;
input bool InpShow_Monthly_POC   = true;   input bool InpShow_Monthly_VWAP   = true;
input bool InpShow_Quarterly_POC = true;   input bool InpShow_Quarterly_VWAP = true;
input bool InpShow_Yearly_POC    = true;   input bool InpShow_Yearly_VWAP    = true;

input group "Line colours (COLOR = period, STYLE = metric)"
input color InpColDaily     = clrYellow;
input color InpColWeekly    = clrOrange;
input color InpColMonthly   = clrRed;
input color InpColQuarterly = clrGray;
input color InpColYearly    = clrDodgerBlue;   // was clrBlack - invisible on dark schemes

input group "Price Swing (Williams Fractal) Markers"
input bool   InpShowPriceFractals = true;
input int    InpFractalAtrLength  = 14;
input double InpFractalOffset     = 0.5;
input color  InpColSwing          = clrDimGray;

//====================== Slot model ==================================
#define NSLOTS 5

#define SLOT_DAILY     0
#define SLOT_WEEKLY    1
#define SLOT_MONTHLY   2
#define SLOT_QUARTERLY 3
#define SLOT_YEARLY    4      // widest live window - seeds the incremental fetch floor

struct AnchorSlot
  {
   ENUM_ANCHOR anchorType;
   datetime    periodStart;     // this slot's own current period start
   VwapAccum   vwap;
   PocAccum    poc;
   double      lastPOC;
   double      lastVWAP;
  };
AnchorSlot slots[NSLOTS];

//--- Output buffers, laid out [slot*2 + metric]. 0 = POC (solid), 1 = VWAP (dashed).
double Buf0[],Buf1[],Buf2[],Buf3[],Buf4[],Buf5[],Buf6[],Buf7[],Buf8[],Buf9[];
double SwingUpBuf[], SwingDownBuf[];

bool   g_show[10];

//--- Pass state.
TickResume g_resume;
int        g_lastBar      = -1;
datetime   g_firstBarTime = 0;      // left-edge invalidation guard
bool       g_needRebuild  = true;

//--- Display floors, single mode only (blank sweep on live rollover).
datetime g_dispFloor[NSLOTS];

//--- Warning state (log only, deduplicated).
bool   g_truncated = false;
bool   g_capHit    = false;
bool   g_binCapHit = false;
string g_lastWarn  = "";

//--- Fractal state.
double   g_PriceATR[];
int      g_LastFractalATRBar      = -1;
datetime g_LastScannedFractalTime = 0;

//+------------------------------------------------------------------+
void BindBuffers()
  {
   SetIndexBuffer(0,Buf0,INDICATOR_DATA); SetIndexBuffer(1,Buf1,INDICATOR_DATA);
   SetIndexBuffer(2,Buf2,INDICATOR_DATA); SetIndexBuffer(3,Buf3,INDICATOR_DATA);
   SetIndexBuffer(4,Buf4,INDICATOR_DATA); SetIndexBuffer(5,Buf5,INDICATOR_DATA);
   SetIndexBuffer(6,Buf6,INDICATOR_DATA); SetIndexBuffer(7,Buf7,INDICATOR_DATA);
   SetIndexBuffer(8,Buf8,INDICATOR_DATA); SetIndexBuffer(9,Buf9,INDICATOR_DATA);
   SetIndexBuffer(10,SwingUpBuf,  INDICATOR_DATA);
   SetIndexBuffer(11,SwingDownBuf,INDICATOR_DATA);
  }

void SetBuf(const int p,const int i,const double v)
  {
   switch(p)
     {
      case 0: Buf0[i]=v; break; case 1: Buf1[i]=v; break;
      case 2: Buf2[i]=v; break; case 3: Buf3[i]=v; break;
      case 4: Buf4[i]=v; break; case 5: Buf5[i]=v; break;
      case 6: Buf6[i]=v; break; case 7: Buf7[i]=v; break;
      case 8: Buf8[i]=v; break; case 9: Buf9[i]=v; break;
     }
  }

void BlankAllBuffers()
  {
   ArrayInitialize(Buf0,EMPTY_VALUE); ArrayInitialize(Buf1,EMPTY_VALUE);
   ArrayInitialize(Buf2,EMPTY_VALUE); ArrayInitialize(Buf3,EMPTY_VALUE);
   ArrayInitialize(Buf4,EMPTY_VALUE); ArrayInitialize(Buf5,EMPTY_VALUE);
   ArrayInitialize(Buf6,EMPTY_VALUE); ArrayInitialize(Buf7,EMPTY_VALUE);
   ArrayInitialize(Buf8,EMPTY_VALUE); ArrayInitialize(Buf9,EMPTY_VALUE);
   ArrayInitialize(SwingUpBuf,  EMPTY_VALUE);
   ArrayInitialize(SwingDownBuf,EMPTY_VALUE);
  }

//+------------------------------------------------------------------+
void LogWarn(const string msg)
  {
   if(!InpLogWarnings) return;
   if(msg == g_lastWarn) return;       // dedup: this runs on the recalc path
   g_lastWarn = msg;
   Print(msg);                         // Print only. Alert() from an indicator is hostile.
  }

void EmitWarnings()
  {
   if(!g_truncated && !g_capHit && !g_binCapHit) { g_lastWarn=""; return; }

   string msg = "[SRJ Master VP] ";
   if(g_truncated)
      msg += "History does not reach the longest anchor start - the earliest developing "
             "values are truncated (raise InpMaxLookbackDays, enable InpUseM1Tail, or "
             "pre-cache history from the Symbols window). ";
   if(g_capHit)
      msg += "InpMaxChunkTicks was hit on at least one day - that day is undercounted. ";
   if(g_binCapHit)
      msg += "POC bin cap reached - raise InpBinPips or lower InpTargetBins.";

   LogWarn(msg);
  }

//+------------------------------------------------------------------+
int OnInit()
  {
   //--- Input validation. Previously a zero bin size produced a silently
   //--- degenerate histogram instead of refusing to start.
   if(InpBinPips <= 0.0)                                  return(INIT_PARAMETERS_INCORRECT);
   if(InpTargetBins < 0)                                  return(INIT_PARAMETERS_INCORRECT);
   if(InpFractalAtrLength < 1)                            return(INIT_PARAMETERS_INCORRECT);
   if(InpContinuousLookbackDays < 0)                      return(INIT_PARAMETERS_INCORRECT);
   if(InpMaxLookbackDays < 0)                             return(INIT_PARAMETERS_INCORRECT);
   if(InpMaxChunkTicks < 0)                               return(INIT_PARAMETERS_INCORRECT);
   if(InpSessionHour < 0 || InpSessionHour > 23)          return(INIT_PARAMETERS_INCORRECT);
   if(InpSessionMinute < 0 || InpSessionMinute > 59)      return(INIT_PARAMETERS_INCORRECT);

   //--- Share config into the core.
   gtc_priceSrc       = InpPriceSrc;
   gtc_weightMode     = InpWeightMode;
   gtc_maxBackfill    = InpMaxChunkTicks;
   gtc_useTickFlags   = InpUseTickFlags;
   gtc_useSessionHour = InpUseSessionHour;
   gtc_sessionHour    = InpSessionHour;
   gtc_sessionMin     = InpSessionMinute;
   gtc_sessionZone    = InpSessionZone;
   gtc_serverDst      = InpServerDstRule;

   if(InpServerGmtBase != 0) gtc_serverGmtBase = InpServerGmtBase;
   else                      TC_DetectServerOffset();

   BindBuffers();

   for(int p=0;p<12;p++) PlotIndexSetDouble(p,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   color slotCol[NSLOTS] = { InpColDaily, InpColWeekly, InpColMonthly,
                             InpColQuarterly, InpColYearly };
   for(int s=0;s<NSLOTS;s++)
     {
      PlotIndexSetInteger(s*2,   PLOT_LINE_COLOR, slotCol[s]);
      PlotIndexSetInteger(s*2+1, PLOT_LINE_COLOR, slotCol[s]);
     }

   string lbl[10] = {"D-POC","D-VWAP","W-POC","W-VWAP","M-POC","M-VWAP",
                     "Q-POC","Q-VWAP","Y-POC","Y-VWAP"};
   for(int p=0;p<10;p++) PlotIndexSetString(p,PLOT_LABEL,lbl[p]);

   PlotIndexSetInteger(10,PLOT_ARROW,217);  PlotIndexSetInteger(10,PLOT_ARROW_SHIFT,0);
   PlotIndexSetInteger(11,PLOT_ARROW,218);  PlotIndexSetInteger(11,PLOT_ARROW_SHIFT,0);
   PlotIndexSetInteger(10,PLOT_LINE_COLOR,InpColSwing);
   PlotIndexSetInteger(11,PLOT_LINE_COLOR,InpColSwing);
   PlotIndexSetString(10,PLOT_LABEL,"Swing High");
   PlotIndexSetString(11,PLOT_LABEL,"Swing Low");

   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);

   slots[SLOT_DAILY].anchorType     = ANCHOR_DAILY;
   slots[SLOT_WEEKLY].anchorType    = ANCHOR_WEEKLY;
   slots[SLOT_MONTHLY].anchorType   = ANCHOR_MONTHLY;
   slots[SLOT_QUARTERLY].anchorType = ANCHOR_QUARTERLY;
   slots[SLOT_YEARLY].anchorType    = ANCHOR_YEARLY;

   double floorBin = ComputeBinSize(InpBinPips);
   for(int s=0;s<NSLOTS;s++)
     {
      slots[s].periodStart = 0;
      slots[s].lastPOC     = 0.0;
      slots[s].lastVWAP    = 0.0;
      ClearVwap(slots[s].vwap);
      PocInit(slots[s].poc,floorBin);
      g_dispFloor[s] = 0;
     }

   g_show[0]=InpShow_Daily_POC;      g_show[1]=InpShow_Daily_VWAP;
   g_show[2]=InpShow_Weekly_POC;     g_show[3]=InpShow_Weekly_VWAP;
   g_show[4]=InpShow_Monthly_POC;    g_show[5]=InpShow_Monthly_VWAP;
   g_show[6]=InpShow_Quarterly_POC;  g_show[7]=InpShow_Quarterly_VWAP;
   g_show[8]=InpShow_Yearly_POC;     g_show[9]=InpShow_Yearly_VWAP;

   ClearResume(g_resume);
   g_lastBar      = -1;
   g_firstBarTime = 0;
   g_needRebuild  = true;

   IndicatorSetString(INDICATOR_SHORTNAME,
      "SRJ Master VP (5-anchor" + (InpContinuousAnchors ? " - Continuous" : "") + ")");

   Print(StringFormat("SRJ Master VP init: src=%s weight=%s tickFlags=%s "
                      "serverBase=%+.2fh dst=%s session=%s",
                      EnumToString(gtc_priceSrc), EnumToString(gtc_weightMode),
                      gtc_useTickFlags ? "on" : "off",
                      (double)gtc_serverGmtBase/3600.0,
                      EnumToString(gtc_serverDst),
                      gtc_useSessionHour
                        ? StringFormat("%02d:%02d %s",gtc_sessionHour,gtc_sessionMin,
                                       EnumToString(gtc_sessionZone))
                        : "off (calendar midnight, server time)"));

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason) { }

//====================== Slot operations =============================
void ResetSlotAccum(const int s)
  {
   ClearVwap(slots[s].vwap);
   ClearPoc(slots[s].poc);            // preserves the slot's tuned bin size
   slots[s].lastPOC  = 0.0;
   slots[s].lastVWAP = 0.0;
  }

//------------------------------------------------------------------
//  Per-anchor bin sizing. A single shared 0.1-pip bin across Daily
//  through Yearly was both meaningless at the long end and the
//  reason the histogram reached hundreds of thousands of bins.
//------------------------------------------------------------------
void SizeSlotBins(const int s,const datetime from,const datetime to)
  {
   double floorBin = ComputeBinSize(InpBinPips);
   double bs = floorBin;
   if(InpTargetBins > 0)
      bs = TC_AutoBinSize(from,to,InpTargetBins,floorBin);
   PocInit(slots[s].poc,bs);
  }

void FoldTickAllSlots(const MqlTick &t)
  {
   for(int s=0;s<NSLOTS;s++)
     {
      datetime ps = AnchorStartFor(t.time,slots[s].anchorType);
      if(ps != slots[s].periodStart) { ResetSlotAccum(s); slots[s].periodStart = ps; }
      FoldTick(slots[s].vwap,slots[s].poc,t);
     }
  }

void FoldM1AllSlots(const MqlRates &r)
  {
   for(int s=0;s<NSLOTS;s++)
     {
      datetime ps = AnchorStartFor(r.time,slots[s].anchorType);
      if(ps != slots[s].periodStart) { ResetSlotAccum(s); slots[s].periodStart = ps; }
      FoldM1Bar(slots[s].vwap,slots[s].poc,r);
     }
  }

void SnapshotAllSlots()
  {
   double sd;
   for(int s=0;s<NSLOTS;s++)
     {
      slots[s].lastPOC  = SnapshotPoc(slots[s].poc);
      slots[s].lastVWAP = SnapshotVwap(slots[s].vwap,sd);
      if(slots[s].poc.capHit) g_binCapHit = true;
     }
  }

void WriteBar(const int i,const bool &inWin[])
  {
   for(int s=0;s<NSLOTS;s++)
     {
      int pPoc  = s*2;
      int pVwap = s*2 + 1;
      bool okP  = (inWin[s] && slots[s].lastPOC  > 0.0 && g_show[pPoc]);
      bool okV  = (inWin[s] && slots[s].lastVWAP > 0.0 && g_show[pVwap]);
      SetBuf(pPoc, i, okP ? slots[s].lastPOC  : EMPTY_VALUE);
      SetBuf(pVwap,i, okV ? slots[s].lastVWAP : EMPTY_VALUE);
     }
  }

//--- Display gating. Continuous mode follows each slot's own rolling
//--- period; single mode gates against the live period start.
void ResolveGating(const int i,const datetime now,const datetime bt,bool &inWin[])
  {
   for(int s=0;s<NSLOTS;s++)
      inWin[s] = InpContinuousAnchors ? (bt >= slots[s].periodStart)
                                      : (bt >= g_dispFloor[s]);
  }

datetime WidestAnchorStart(const datetime ref)
  {
   datetime widest = ref;
   for(int s=0;s<NSLOTS;s++)
     {
      datetime ps = AnchorStartFor(ref,slots[s].anchorType);
      if(ps < widest) widest = ps;
     }
   return widest;
  }

//====================== Price fractal engine ========================
bool IsPriceSwingHighBar(const double &h[],const int i)
  {
   return (h[i] >= h[i-1] && h[i] >= h[i+1] && (h[i] > h[i-1] || h[i] > h[i+1]));
  }

bool IsPriceSwingLowBar(const double &l[],const int i)
  {
   return (l[i] <= l[i-1] && l[i] <= l[i+1] && (l[i] < l[i-1] || l[i] < l[i+1]));
  }

void RecalculatePriceATR(const double &high[],const double &low[],
                         const double &close[],const int rates_total)
  {
   if(rates_total < 1) return;
   if(ArraySize(g_PriceATR) != rates_total) ArrayResize(g_PriceATR,rates_total);

   double alpha = 1.0 / (double)InpFractalAtrLength;
   int start = (g_LastFractalATRBar < 1) ? 0 : g_LastFractalATRBar;

   for(int i=start;i<rates_total;i++)
     {
      double prevClose = (i > 0) ? close[i-1] : close[i];
      double tr = MathMax(high[i]-low[i],
                          MathMax(MathAbs(high[i]-prevClose),MathAbs(low[i]-prevClose)));
      g_PriceATR[i] = (i == 0) ? tr : g_PriceATR[i-1]*(1.0-alpha) + tr*alpha;
     }
   g_LastFractalATRBar = rates_total - 1;
  }

//--- Non-repainting: the two rightmost bars can never carry a
//--- confirmed three-bar fractal.
void MarkPriceFractals(const datetime &time[],const double &high[],
                       const double &low[],const int rates_total)
  {
   int maxI = rates_total - 3;
   if(maxI < 1) return;

   int startI = 1;
   if(g_LastScannedFractalTime != 0)
     {
      int shift = iBarShift(_Symbol,Period(),g_LastScannedFractalTime,false);
      int idx   = (shift >= 0) ? (rates_total - 1 - shift) : -1;
      startI    = (idx >= 0) ? idx + 1 : 1;
     }
   if(startI < 1)    startI = 1;
   if(startI > maxI) return;

   for(int i=startI;i<=maxI;i++)
     {
      double gap = (i < ArraySize(g_PriceATR)) ? g_PriceATR[i]*InpFractalOffset : 0.0;
      SwingUpBuf[i]   = IsPriceSwingHighBar(high,i) ? high[i] + gap : EMPTY_VALUE;
      SwingDownBuf[i] = IsPriceSwingLowBar(low,i)   ? low[i]  - gap : EMPTY_VALUE;
     }
   g_LastScannedFractalTime = time[maxI];

   if(rates_total > 1)
     { SwingUpBuf[rates_total-1] = EMPTY_VALUE; SwingDownBuf[rates_total-1] = EMPTY_VALUE; }
   if(rates_total > 2)
     { SwingUpBuf[rates_total-2] = EMPTY_VALUE; SwingDownBuf[rates_total-2] = EMPTY_VALUE; }
  }

void UpdateFractals(const datetime &time[],const double &high[],
                    const double &low[],const double &close[],const int rates_total)
  {
   if(!InpShowPriceFractals) return;
   RecalculatePriceATR(high,low,close,rates_total);
   MarkPriceFractals(time,high,low,rates_total);
  }

//====================== Rebuild =====================================
//  ONE rebuild path for both modes. The old FullRebuildSingle and
//  FullRebuildContinuous were ~90 near-identical lines each and had
//  already drifted (only one of them clamped the partial anchor bar).
//
//  Returns false when tick history is not yet synchronised, so the
//  caller can return 0 and be re-entered. The old code folded a
//  CopyTicksRange failure as an empty day and wrote the resulting
//  flat profile to the buffers permanently.
//------------------------------------------------------------------
bool Rebuild(const datetime &time[],const int rates_total)
  {
   BlankAllBuffers();
   ClearResume(g_resume);
   g_lastBar   = -1;
   g_truncated = false;
   g_capHit    = false;
   g_binCapHit = false;

   g_LastFractalATRBar      = -1;
   g_LastScannedFractalTime = 0;
   ArrayFree(g_PriceATR);

   if(rates_total <= 0) return true;

   datetime now = TimeCurrent();
   ulong    t0  = GetMicrosecondCount();

   //--- Live display floors, hoisted out of the bar loop. AnchorStartFor
   //--- was previously called 5x per bar with a fixed 'now'.
   for(int s=0;s<NSLOTS;s++)
      g_dispFloor[s] = AnchorStartFor(now,slots[s].anchorType);

   //--- Left edge of the display window.
   int firstBar = 0;
   if(InpContinuousAnchors && InpContinuousLookbackDays > 0)
     {
      datetime floorT = (datetime)((long)now - (long)InpContinuousLookbackDays*86400);
      firstBar = rates_total;
      for(int i=0;i<rates_total;i++) if(time[i] >= floorT) { firstBar = i; break; }
      if(firstBar >= rates_total) firstBar = rates_total - 1;
     }

   //--- True accumulation start vs the capped TICK start.
   datetime trueFrom = InpContinuousAnchors ? WidestAnchorStart(time[firstBar])
                                            : WidestAnchorStart(now);
   datetime tickFrom = trueFrom;
   if(InpMaxLookbackDays > 0)
     {
      datetime cap = (datetime)((long)now - (long)InpMaxLookbackDays*86400);
      if(tickFrom < cap) tickFrom = cap;
     }

   TC_EnsureBarHistory(trueFrom);

   //--- Reset every slot and size its histogram against its own window.
   for(int s=0;s<NSLOTS;s++)
     {
      datetime sFrom = InpContinuousAnchors
                       ? AnchorStartFor(time[firstBar],slots[s].anchorType)
                       : g_dispFloor[s];
      if(sFrom < trueFrom) sFrom = trueFrom;
      SizeSlotBins(s,sFrom,now);
      ClearVwap(slots[s].vwap);
      slots[s].lastPOC     = 0.0;
      slots[s].lastVWAP    = 0.0;
      slots[s].periodStart = AnchorStartFor(trueFrom,slots[s].anchorType);
     }

   //--- M1 tail for the stretch older than the tick cap. MqlRates.tick_volume
   //--- IS a tick count, so this splices cleanly under WEIGHT_TICKCOUNT.
   if(trueFrom < tickFrom)
     {
      bool tailOk = false;
      if(InpUseM1Tail)
        {
         MqlRates m1[];
         int n = CopyRates(_Symbol,PERIOD_M1,trueFrom,(datetime)((long)tickFrom-1),m1);
         if(n > 0)
           {
            for(int k=0;k<n;k++) FoldM1AllSlots(m1[k]);
            tailOk = true;
           }
        }
      if(!tailOk) g_truncated = true;
     }

   //--- One cursor owns every fetch from here on.
   long endMs = (long)now*1000 + 1000;
   CTickCursor cur;
   cur.Init((long)tickFrom*1000,endMs);

   MqlTick t;

   //--- Off-chart pre-fold: ticks between the anchor and the first
   //--- displayed bar. Without this the visible bars would open an
   //--- accumulation that does not actually reach the anchor.
   if(firstBar > 0 || time[firstBar] > tickFrom)
     {
      long lim = (long)time[firstBar]*1000;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllSlots(t); }
     }

   if(cur.HadError())
     {
      LogWarn("[SRJ Master VP] Waiting on tick history sync (error " +
              IntegerToString(cur.LastError()) + ") - retrying, buffers left empty.");
      return false;
     }

   bool inWin[NSLOTS];

   //--- Bars before the window stay blank.
   for(int s=0;s<NSLOTS;s++) inWin[s] = false;
   for(int i=0;i<firstBar && i<rates_total;i++) WriteBar(i,inWin);

   //--- Bar walk. Ticks are folded to each bar's OWN boundary before that
   //--- bar is written, which is what stops a closed bar from repainting.
   for(int i=firstBar;i<rates_total;i++)
     {
      long lim = (i < rates_total-1) ? (long)time[i+1]*1000 : endMs;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllSlots(t); }

      SnapshotAllSlots();
      ResolveGating(i,now,time[i],inWin);
      WriteBar(i,inWin);
      g_lastBar = i;
     }

   if(cur.CapHit()) g_capHit = true;

   if(cur.HadError())
     {
      LogWarn("[SRJ Master VP] Tick fetch failed mid-rebuild (error " +
              IntegerToString(cur.LastError()) + ") - retrying.");
      return false;
     }

   if(InpLogTiming)
     {
      double ms = (double)(GetMicrosecondCount()-t0)/1000.0;
      Print(StringFormat("SRJ Master VP rebuild: %d bars, %I64d ticks, %d fetches, %.1f ms "
                         "| bins D/W/M/Q/Y = %.*f/%.*f/%.*f/%.*f/%.*f",
                         rates_total-firstBar,cur.Served(),cur.Fetches(),ms,
                         _Digits,slots[0].poc.binSize,_Digits,slots[1].poc.binSize,
                         _Digits,slots[2].poc.binSize,_Digits,slots[3].poc.binSize,
                         _Digits,slots[4].poc.binSize));
     }

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

   datetime now = TimeCurrent();

   bool needFull = (prev_calculated == 0) || g_needRebuild ||
                   (g_lastBar < 0) || (g_lastBar >= rates_total) ||
                   (g_firstBarTime != 0 && time[0] != g_firstBarTime);

   if(needFull)
     {
      if(!Rebuild(time,rates_total))
        {
         g_needRebuild = true;
         return(0);                  // re-enter; do NOT persist a wrong profile
        }
      g_needRebuild  = false;
      g_firstBarTime = time[0];
      UpdateFractals(time,high,low,close,rates_total);
      return(rates_total);
     }

   //--- Single mode: a live rollover invalidates the previous period's
   //--- printed values. Cheap buffer-only sweep, no re-fetch.
   if(!InpContinuousAnchors)
     {
      for(int s=0;s<NSLOTS;s++)
        {
         datetime newFloor = AnchorStartFor(now,slots[s].anchorType);
         if(g_dispFloor[s] != 0 && newFloor != g_dispFloor[s])
           {
            datetime oldFloor = g_dispFloor[s];
            for(int j=g_lastBar; j>=0 && time[j]>=oldFloor; j--)
              { SetBuf(s*2,j,EMPTY_VALUE); SetBuf(s*2+1,j,EMPTY_VALUE); }
           }
         g_dispFloor[s] = newFloor;
        }
     }

   int  last  = rates_total - 1;
   int  start = (g_lastBar >= 0) ? g_lastBar : last;
   long endMs = (long)now*1000 + 1000;

   long fromMs = (g_resume.lastMs > 0) ? g_resume.lastMs
                                       : (long)slots[SLOT_YEARLY].periodStart*1000;

   CTickCursor cur;
   cur.Init(fromMs,endMs,g_resume.lastMs,g_resume.countAtLastMs);

   MqlTick t;
   bool    inWin[NSLOTS];

   for(int i=start;i<=last;i++)
     {
      long lim = (i < last) ? (long)time[i+1]*1000 : endMs;
      while(cur.Next(lim,t)) { NoteResume(g_resume,t); FoldTickAllSlots(t); }

      SnapshotAllSlots();
      ResolveGating(i,now,time[i],inWin);
      WriteBar(i,inWin);
     }
   g_lastBar = last;

   if(cur.CapHit()) g_capHit = true;

   if(cur.HadError())
     {
      //--- A mid-stream failure means ticks may have been missed, which would
      //--- desync the accumulators. Flag for a clean rebuild next pass.
      g_needRebuild = true;
      LogWarn("[SRJ Master VP] Incremental tick fetch failed (error " +
              IntegerToString(cur.LastError()) + ") - full rebuild queued.");
     }

   UpdateFractals(time,high,low,close,rates_total);
   EmitWarnings();

   return(rates_total);
  }
//+------------------------------------------------------------------+