//+------------------------------------------------------------------+
//|                                     SRJ_CVD_TickBased_MT5.mq5    |
//|              True per-tick Cumulative Volume Delta for MT5       |
//|                                                                  |
//|  Unlike bar/timeframe-based CVD approximations (which infer      |
//|  delta from candle direction x bar tick_volume), this indicator  |
//|  classifies every REAL tick individually via CopyTicksRange()    |
//|  and accumulates a true per-tick cumulative delta. Designed for  |
//|  synthetic "CVD contract" symbols where no real traded-size      |
//|  field exists -- so each tick counts as one unit of directional  |
//|  activity rather than being weighted by a volume figure.         |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "1.03"
#property indicator_separate_window
#property indicator_buffers 6
#property indicator_plots   3

#property indicator_label1  "CVD"
#property indicator_type1   DRAW_CANDLES
#property indicator_color1  clrLimeGreen, clrGray, clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "CVD Swing High"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrWhite
#property indicator_width2  1

#property indicator_label3  "CVD Swing Low"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrYellow
#property indicator_width3  1

//--- Input Parameters
input ENUM_TIMEFRAMES InpResetPeriod      = PERIOD_H1;  // CVD Reset Period
input bool            InpNoReset          = false;      // CVD No Reset
input bool            InpUseZeroTickRule  = true;        // Unchanged-price ticks inherit last direction
input int             InpMaxBackfillDays  = 30;          // Max days of tick history to backfill (0 = unlimited)

//--- Fractal Triangle Offset (CVD-ATR based, matching the native Fractals look)
input int             InpAtrLength        = 14;            // CVD-ATR Length for fractal triangle offset
input double          InpFractalOffset    = 0.5;           // Fractal Distance Multiplier (fraction of CVD-ATR)

//--- Divergence Detection Parameters (mirrors the SRJ CVD Divergence Pine logic)
input int             InpDivergenceLookback   = 100;     // Max bars back from x2 to search for x1 anchor
input int             InpMinAnchorGap         = 3;       // Minimum bars required between x1 and x2
input bool            InpShowRegularBearish   = true;    // Price HH / CVD LH
input bool            InpShowHiddenBearish    = true;    // Price LH / CVD HH
input bool            InpShowRegularBullish   = true;    // Price LL / CVD HL
input bool            InpShowHiddenBullish    = true;    // Price HL / CVD LL
input bool            InpDashHiddenDivergence = true;     // Dashed line for hidden divergences (no text labels)
input int             InpMaxDivergenceLines   = 200;      // Cap on drawn lines kept (oldest pruned)
input color           InpBullishColor         = clrDodgerBlue;
input color           InpBearishColor         = clrRed;
input bool            InpShowUnconfirmed      = true;       // Preview using the still-forming bar as a tentative right anchor
input color           InpUnconfirmedColor     = clrSilver;
input int             InpUnconfirmedLineWidth = 1;
input int             InpMaxAnchorsPerBar     = 3;         // Max independent x1 anchors drawn per x2 per direction
input bool            InpDebugLog             = false;     // Log piercing-check rejections/draws to the Experts tab

//--- Indicator Buffers
double CVD_Open[];
double CVD_High[];
double CVD_Low[];
double CVD_Close[];
double CVD_FractalUp[];     // triangle marker for a confirmed CVD swing high
double CVD_FractalDown[];   // triangle marker for a confirmed CVD swing low

//--- Global state
double   g_CumulativeDelta      = 0.0;
long     g_LastTickMsc          = 0;      // last processed tick, in ms since epoch
double   g_LastTickPrice        = 0.0;
int      g_LastTickDirection    = 0;      // +1 up, -1 down, 0 = none yet
int      g_PrevBarIndex         = -1;
datetime g_LastResetPeriodStart = 0;

//--- Divergence engine state
datetime g_LastScannedX2Time    = 0;      // time of the last bar already scanned as an x2 candidate
datetime g_LastScannedFractalTime = 0;    // time of the last bar already checked for a swing fractal
double   g_CvdATR[];                       // Wilder-smoothed true range of the CVD series
int      g_LastATRBar             = -1;
int      g_DivWindow            = -1;     // CVD subwindow index, resolved in OnInit
string   g_DivObjNames[];                 // parallel arrays tracking drawn lines for pruning
datetime g_DivObjTimes[];

//+------------------------------------------------------------------+
//| Helper to cleanly wipe all indicator lines on reset/deinit       |
//+------------------------------------------------------------------+
void DeleteAllDivergenceLines()
  {
   if(g_DivWindow >= 0)
     {
      // Wipes out EVERY object starting with "SRJ_DIV_" instantly
      ObjectsDeleteAll(0, "SRJ_DIV_", g_DivWindow, -1);
     }

   ArrayResize(g_DivObjNames, 0);
   ArrayResize(g_DivObjTimes, 0);
  }

//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0, CVD_Open,  INDICATOR_DATA);
   SetIndexBuffer(1, CVD_High,  INDICATOR_DATA);
   SetIndexBuffer(2, CVD_Low,   INDICATOR_DATA);
   SetIndexBuffer(3, CVD_Close, INDICATOR_DATA);
   SetIndexBuffer(4, CVD_FractalUp,   INDICATOR_DATA);
   SetIndexBuffer(5, CVD_FractalDown, INDICATOR_DATA);

   ArraySetAsSeries(CVD_Open,  false);
   ArraySetAsSeries(CVD_High,  false);
   ArraySetAsSeries(CVD_Low,   false);
   ArraySetAsSeries(CVD_Close, false);
   ArraySetAsSeries(CVD_FractalUp,   false);
   ArraySetAsSeries(CVD_FractalDown, false);

   PlotIndexSetString(0, PLOT_LABEL, "CVD Open;CVD High;CVD Low;CVD Close");
   PlotIndexSetDouble(0, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   PlotIndexSetInteger(1, PLOT_ARROW, 217);
   PlotIndexSetInteger(1, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetDouble(1, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   PlotIndexSetInteger(2, PLOT_ARROW, 218);
   PlotIndexSetInteger(2, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetDouble(2, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   string shortname = InpNoReset ? "CVD Tick (No Reset)" : "CVD Tick (" + EnumToString(InpResetPeriod) + ")";
   IndicatorSetString(INDICATOR_SHORTNAME, shortname);
   IndicatorSetInteger(INDICATOR_DIGITS, 0);

   Print("SRJ Tick-Based CVD Initialized - Reset Mode: ", InpNoReset ? "No Reset" : EnumToString(InpResetPeriod));

   g_DivWindow = ChartWindowFind();

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
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
   ArraySetAsSeries(time, false);

   // Root-cause fix: force all price arrays to match 'time' indexing so the
   // divergence loops always read the correct bar between anchors. Without this,
   // high[]/low[] could be read in the opposite direction to time[], feeding
   // mismatched bars into PiercingClean() and letting pierced setups slip through.
   ArraySetAsSeries(open,  false);
   ArraySetAsSeries(high,  false);
   ArraySetAsSeries(low,   false);
   ArraySetAsSeries(close, false);

   if(rates_total <= 0)
      return(0);

   if(prev_calculated == 0)
     {
      DeleteAllDivergenceLines(); // Fix: Clean up ghosts on full recalc

      g_CumulativeDelta      = 0.0;
      g_LastTickMsc          = 0;
      g_LastTickPrice        = 0.0;
      g_LastTickDirection    = 0;
      g_PrevBarIndex         = -1;
      g_LastResetPeriodStart = 0;
      g_LastScannedX2Time    = 0;
      g_LastScannedFractalTime = 0;
      g_LastATRBar           = -1;
      ArrayFree(g_CvdATR);

      ArrayInitialize(CVD_Open,  EMPTY_VALUE);
      ArrayInitialize(CVD_High,  EMPTY_VALUE);
      ArrayInitialize(CVD_Low,   EMPTY_VALUE);
      ArrayInitialize(CVD_Close, EMPTY_VALUE);
      ArrayInitialize(CVD_FractalUp,   EMPTY_VALUE);
      ArrayInitialize(CVD_FractalDown, EMPTY_VALUE);
     }
   else if(rates_total > prev_calculated)
     {
      // Fix: Ensure new bars are empty so the chart doesn't compress to 0.0
      for(int i = prev_calculated - 1; i < rates_total; i++)
        {
         if(i >= 0)
           {
            CVD_FractalUp[i]   = EMPTY_VALUE;
            CVD_FractalDown[i] = EMPTY_VALUE;
           }
        }
     }

   long from_msc;
   if(prev_calculated == 0)
     {
      from_msc = (long)time[0] * 1000;

      if(InpMaxBackfillDays > 0)
        {
         long cap_msc = ((long)TimeCurrent() - (long)InpMaxBackfillDays * 86400) * 1000;
         from_msc = MathMax(from_msc, cap_msc);
        }
     }
   else
      from_msc = g_LastTickMsc + 1;

   long to_msc = (long)TimeCurrent() * 1000 + 1000;

   if(from_msc >= to_msc)
     {
      RecalculateCvdATR(rates_total);
      MarkFractals(rates_total, time);
      ScanDivergences(rates_total, time, high, low);
      ScanUnconfirmedDivergence(rates_total, time, high, low);
      return(rates_total);
     }

   bool isFullRecalc = (prev_calculated == 0);
   MqlTick ticks[];
   int copied = CopyTicksRange(_Symbol, ticks, COPY_TICKS_ALL, from_msc, to_msc);

   if(copied <= 0)
     {
      if(isFullRecalc)
        {
         int err = GetLastError();
         Print("SRJ CVD: waiting on tick history sync (error ", err, "), will retry on next tick...");
         return(0);
        }
      RecalculateCvdATR(rates_total);
      MarkFractals(rates_total, time);
      ScanDivergences(rates_total, time, high, low);
      ScanUnconfirmedDivergence(rates_total, time, high, low);
      return(rates_total);
     }

   ArraySetAsSeries(ticks, false);

   for(int i = 0; i < copied; i++)
     {
      double px = (ticks[i].last > 0.0) ? ticks[i].last : ticks[i].bid;
      if(px <= 0.0)
         continue;

      if(ticks[i].time_msc <= g_LastTickMsc)
         continue;

      if(!InpNoReset)
        {
         datetime periodStart = GetPeriodStart(ticks[i].time, InpResetPeriod);
         if(g_LastResetPeriodStart != 0 && periodStart != g_LastResetPeriodStart)
            g_CumulativeDelta = 0.0;
         g_LastResetPeriodStart = periodStart;
        }

      int direction;
      if(g_LastTickPrice == 0.0) direction = 0;
      else if(px > g_LastTickPrice) direction = 1;
      else if(px < g_LastTickPrice) direction = -1;
      else direction = InpUseZeroTickRule ? g_LastTickDirection : 0;

      double tickWeight = 1.0;
      double prevCVD = g_CumulativeDelta;
      g_CumulativeDelta += direction * tickWeight;

      int shift = iBarShift(_Symbol, Period(), ticks[i].time, false);
      if(shift >= 0 && shift < rates_total)
        {
         int barIndex = rates_total - 1 - shift;
         UpdateCVDCandle(barIndex, prevCVD, g_CumulativeDelta);
        }

      g_LastTickPrice = px;
      if(direction != 0)
         g_LastTickDirection = direction;
      g_LastTickMsc = ticks[i].time_msc;
     }

   RecalculateCvdATR(rates_total);
   MarkFractals(rates_total, time);
   ScanDivergences(rates_total, time, high, low);
   ScanUnconfirmedDivergence(rates_total, time, high, low);

   return(rates_total);
  }

//+------------------------------------------------------------------+
void UpdateCVDCandle(int bar_index, double prev_cvd, double current_cvd)
  {
   bool is_new_candle = (bar_index != g_PrevBarIndex);

   if(is_new_candle)
     {
      CVD_Open[bar_index] = prev_cvd;
      CVD_High[bar_index] = MathMax(prev_cvd, current_cvd);
      CVD_Low[bar_index]  = MathMin(prev_cvd, current_cvd);
      g_PrevBarIndex = bar_index;
     }
   else
     {
      CVD_High[bar_index] = MathMax(CVD_High[bar_index], current_cvd);
      CVD_Low[bar_index]  = MathMin(CVD_Low[bar_index],  current_cvd);
     }

   CVD_Close[bar_index] = current_cvd;
  }

//+------------------------------------------------------------------+
datetime GetPeriodStart(datetime t, ENUM_TIMEFRAMES tf)
  {
   MqlDateTime dt;
   TimeToStruct(t, dt);

   switch(tf)
     {
      case PERIOD_M1:  dt.sec = 0; break;
      case PERIOD_M5:  dt.min = (dt.min / 5) * 5;  dt.sec = 0; break;
      case PERIOD_M15: dt.min = (dt.min / 15) * 15; dt.sec = 0; break;
      case PERIOD_M30: dt.min = (dt.min / 30) * 30; dt.sec = 0; break;
      case PERIOD_H1:  dt.min = 0; dt.sec = 0; break;
      case PERIOD_H4:  dt.hour = (dt.hour / 4) * 4; dt.min = 0; dt.sec = 0; break;
      case PERIOD_D1:  dt.hour = 0; dt.min = 0; dt.sec = 0; break;
      case PERIOD_W1:  dt.day_of_week = 1; dt.hour = 0; dt.min = 0; dt.sec = 0; break;
      case PERIOD_MN1: dt.day = 1; dt.hour = 0; dt.min = 0; dt.sec = 0; break;
      default: break;
     }

   return StructToTime(dt);
  }

//+------------------------------------------------------------------+
bool CvdReady(int i)
  {
   return (CVD_High[i] != EMPTY_VALUE && CVD_Low[i] != EMPTY_VALUE);
  }

bool IsPriceSwingHigh(const double &h[], int i)
  {
   return (h[i] >= h[i-1] && h[i] >= h[i+1] && (h[i] > h[i-1] || h[i] > h[i+1]));
  }

bool IsPriceSwingLow(const double &l[], int i)
  {
   return (l[i] <= l[i-1] && l[i] <= l[i+1] && (l[i] < l[i-1] || l[i] < l[i+1]));
  }

bool IsCvdSwingHigh(int i)
  {
   if(!CvdReady(i-1) || !CvdReady(i) || !CvdReady(i+1))
      return false;
   return (CVD_High[i] >= CVD_High[i-1] && CVD_High[i] >= CVD_High[i+1] &&
           (CVD_High[i] > CVD_High[i-1] || CVD_High[i] > CVD_High[i+1]));
  }

bool IsCvdSwingLow(int i)
  {
   if(!CvdReady(i-1) || !CvdReady(i) || !CvdReady(i+1))
      return false;
   return (CVD_Low[i] <= CVD_Low[i-1] && CVD_Low[i] <= CVD_Low[i+1] &&
           (CVD_Low[i] < CVD_Low[i-1] || CVD_Low[i] < CVD_Low[i+1]));
  }

//+------------------------------------------------------------------+
bool PiercingClean(int x1, int x2, bool isBearish,
                    const double &price_high[], const double &price_low[])
  {
   double p1 = isBearish ? price_high[x1] : price_low[x1];
   double p2 = isBearish ? price_high[x2] : price_low[x2];

   if(!CvdReady(x1) || !CvdReady(x2))
      return false;

   double c1 = isBearish ? CVD_High[x1] : CVD_Low[x1];
   double c2 = isBearish ? CVD_High[x2] : CVD_Low[x2];

   int span = x2 - x1;
   for(int j = x1 + 1; j < x2; j++)
     {
      if(!CvdReady(j))
         return false;

      double t = (double)(j - x1) / (double)span;
      double priceLine = p1 + (p2 - p1) * t;
      double cvdLine   = c1 + (c2 - c1) * t;

      if(isBearish)
        {
         if(price_high[j] > priceLine) return false;
         if(CVD_High[j]   > cvdLine)   return false;
        }
      else
        {
         if(price_low[j] < priceLine) return false;
         if(CVD_Low[j]   < cvdLine)   return false;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
void RegisterDivObject(string name, datetime t)
  {
   int n = ArraySize(g_DivObjNames);
   ArrayResize(g_DivObjNames, n + 1);
   ArrayResize(g_DivObjTimes, n + 1);
   g_DivObjNames[n] = name;
   g_DivObjTimes[n] = t;

   if(n + 1 > InpMaxDivergenceLines)
     {
      ObjectDelete(0, g_DivObjNames[0]);
      for(int i = 0; i < n; i++)
        {
         g_DivObjNames[i] = g_DivObjNames[i + 1];
         g_DivObjTimes[i] = g_DivObjTimes[i + 1];
        }
      ArrayResize(g_DivObjNames, n);
      ArrayResize(g_DivObjTimes, n);
     }
  }

//+------------------------------------------------------------------+
void DrawDivergenceLine(int x1, int x2, bool isBearish, bool isRegular, const datetime &time[])
  {
   double c1 = isBearish ? CVD_High[x1] : CVD_Low[x1];
   double c2 = isBearish ? CVD_High[x2] : CVD_Low[x2];

   string name = StringFormat("SRJ_DIV_%s_%s_%d_%d",
                    isBearish ? "BEAR" : "BULL",
                    isRegular ? "REG"  : "HID",
                    (int)time[x1], (int)time[x2]);

   if(ObjectFind(0, name) >= 0)
      return;

   if(!ObjectCreate(0, name, OBJ_TREND, g_DivWindow, time[x1], c1, time[x2], c2))
      return;

   color clr = isBearish ? InpBearishColor : InpBullishColor;
   ObjectSetInteger(0, name, OBJPROP_COLOR, clr);
   ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, name, OBJPROP_STYLE, (InpDashHiddenDivergence && !isRegular) ? STYLE_DASH : STYLE_SOLID);
   ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, false);
   ObjectSetInteger(0, name, OBJPROP_RAY_LEFT,  false);
   ObjectSetInteger(0, name, OBJPROP_BACK, false);
   ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);

   RegisterDivObject(name, time[x2]);
  }

//+------------------------------------------------------------------+
void TryDivergence(int x2, bool isBearish, int rates_total,
                    const datetime &time[], const double &price_high[], const double &price_low[])
  {
   if(!CvdReady(x2))
      return;

   bool x2PriceFlag = isBearish ? IsPriceSwingHigh(price_high, x2) : IsPriceSwingLow(price_low, x2);
   bool x2CvdFlag   = isBearish ? IsCvdSwingHigh(x2)               : IsCvdSwingLow(x2);

   int minX1 = MathMax(1, x2 - InpDivergenceLookback);
   int maxX1 = x2 - InpMinAnchorGap;
   int drawnCount = 0;

   for(int x1 = maxX1; x1 >= minX1 && drawnCount < InpMaxAnchorsPerBar; x1--)
     {
      if(!CvdReady(x1))
         continue;

      bool isRegular;
      if(isBearish)
        {
         if(price_high[x2] > price_high[x1] && CVD_High[x2] < CVD_High[x1])
            isRegular = true;
         else if(price_high[x2] < price_high[x1] && CVD_High[x2] > CVD_High[x1])
            isRegular = false;
         else
            continue;
        }
      else
        {
         if(price_low[x2] < price_low[x1] && CVD_Low[x2] > CVD_Low[x1])
            isRegular = true;
         else if(price_low[x2] > price_low[x1] && CVD_Low[x2] < CVD_Low[x1])
            isRegular = false;
         else
            continue;
        }

      if(isBearish  && isRegular  && !InpShowRegularBearish) continue;
      if(isBearish  && !isRegular && !InpShowHiddenBearish)  continue;
      if(!isBearish && isRegular  && !InpShowRegularBullish) continue;
      if(!isBearish && !isRegular && !InpShowHiddenBullish)  continue;

      bool x1PriceFlag = isBearish ? IsPriceSwingHigh(price_high, x1) : IsPriceSwingLow(price_low, x1);
      bool x1CvdFlag   = isBearish ? IsCvdSwingHigh(x1)               : IsCvdSwingLow(x1);

      int flagSum = (x1PriceFlag ? 1 : 0) + (x1CvdFlag ? 1 : 0) + (x2PriceFlag ? 1 : 0) + (x2CvdFlag ? 1 : 0);
      if(flagSum < 2)
         continue;

      if(!PiercingClean(x1, x2, isBearish, price_high, price_low))
        {
         if(InpDebugLog)
            Print("SRJ CVD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
                  " (", isBearish ? "bearish" : "bullish", ", ", isRegular ? "regular" : "hidden",
                  ", flagSum=", flagSum, ") REJECTED -- piercing");
         continue;
        }

      if(InpDebugLog)
         Print("SRJ CVD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
               " (", isBearish ? "bearish" : "bullish", ", ", isRegular ? "regular" : "hidden",
               ", flagSum=", flagSum, ") DRAWN");

      DrawDivergenceLine(x1, x2, isBearish, isRegular, time);
      drawnCount++;
     }
  }

//+------------------------------------------------------------------+
void RecalculateCvdATR(int rates_total)
  {
   if(rates_total < 1)
      return;

   ArrayResize(g_CvdATR, rates_total);

   double alpha    = 1.0 / (double)InpAtrLength;
   int    startIdx = (g_LastATRBar < 1) ? 0 : g_LastATRBar;

   for(int i = startIdx; i < rates_total; i++)
     {
      if(!CvdReady(i))
        {
         g_CvdATR[i] = (i > 0) ? g_CvdATR[i - 1] : 0.0;
         continue;
        }

      double prevClose = (i > 0 && CvdReady(i - 1)) ? CVD_Close[i - 1] : CVD_Close[i];
      double tr1 = CVD_High[i] - CVD_Low[i];
      double tr2 = MathAbs(CVD_High[i] - prevClose);
      double tr3 = MathAbs(CVD_Low[i]  - prevClose);
      double tr  = MathMax(tr1, MathMax(tr2, tr3));

      if(i == 0)
         g_CvdATR[i] = tr;
      else
         g_CvdATR[i] = g_CvdATR[i - 1] * (1.0 - alpha) + tr * alpha;
     }

   g_LastATRBar = rates_total - 1;
  }

//+------------------------------------------------------------------+
void MarkFractals(int rates_total, const datetime &time[])
  {
   int maxI = rates_total - 3;
   if(maxI < 1)
      return;

   int startI;
   if(g_LastScannedFractalTime == 0)
     {
      startI = 1;
     }
   else
     {
      int shift = iBarShift(_Symbol, Period(), g_LastScannedFractalTime, false);
      int idx   = (shift >= 0) ? (rates_total - 1 - shift) : -1;
      startI    = (idx >= 0) ? idx + 1 : 1;
     }

   if(startI > maxI)
      return;

   for(int i = startI; i <= maxI; i++)
     {
      double gap = (i < ArraySize(g_CvdATR)) ? g_CvdATR[i] * InpFractalOffset : 0.0;
      CVD_FractalUp[i]   = IsCvdSwingHigh(i) ? CVD_High[i] + gap : EMPTY_VALUE;
      CVD_FractalDown[i] = IsCvdSwingLow(i)  ? CVD_Low[i]  - gap : EMPTY_VALUE;
     }

   g_LastScannedFractalTime = time[maxI];

   // Bulletproof fix to force the unconfirmed live edge to EMPTY_VALUE
   if(rates_total > 1)
     {
      CVD_FractalUp[rates_total - 1]   = EMPTY_VALUE;
      CVD_FractalDown[rates_total - 1] = EMPTY_VALUE;
     }
   if(rates_total > 2)
     {
      CVD_FractalUp[rates_total - 2]   = EMPTY_VALUE;
      CVD_FractalDown[rates_total - 2] = EMPTY_VALUE;
     }
  }

//+------------------------------------------------------------------+
void ScanDivergences(int rates_total, const datetime &time[], const double &high[], const double &low[])
  {
   int maxX2 = rates_total - 3;
   if(maxX2 < InpMinAnchorGap + 2)
      return;

   int startX2;
   if(g_LastScannedX2Time == 0)
     {
      startX2 = 2;
     }
   else
     {
      int shift = iBarShift(_Symbol, Period(), g_LastScannedX2Time, false);
      int idx   = (shift >= 0) ? (rates_total - 1 - shift) : -1;
      startX2   = (idx >= 0) ? idx + 1 : 2;
     }

   if(startX2 > maxX2)
      return;

   for(int x2 = startX2; x2 <= maxX2; x2++)
     {
      if(InpShowRegularBearish || InpShowHiddenBearish)
         TryDivergence(x2, true, rates_total, time, high, low);

      if(InpShowRegularBullish || InpShowHiddenBullish)
         TryDivergence(x2, false, rates_total, time, high, low);
     }

   g_LastScannedX2Time = time[maxX2];
  }

//+------------------------------------------------------------------+
void ScanUnconfirmedDivergence(int rates_total, const datetime &time[], const double &high[], const double &low[])
  {
   string name = "SRJ_DIV_UNCONFIRMED";

   if(!InpShowUnconfirmed || rates_total < InpMinAnchorGap + 3)
     {
      ObjectDelete(0, name);
      return;
     }

   int x2      = rates_total - 2;
   int liveIdx = rates_total - 1;

   if(!CvdReady(x2) || !CvdReady(liveIdx) || !CvdReady(x2 - 1))
     {
      ObjectDelete(0, name);
      return;
     }

   bool x2PriceFlagHigh = (high[x2] > high[x2-1] && high[x2] > high[liveIdx]);
   bool x2PriceFlagLow  = (low[x2]  < low[x2-1]  && low[x2]  < low[liveIdx]);
   bool x2CvdFlagHigh   = (CVD_High[x2] > CVD_High[x2-1] && CVD_High[x2] > CVD_High[liveIdx]);
   bool x2CvdFlagLow     = (CVD_Low[x2]  < CVD_Low[x2-1]  && CVD_Low[x2]  < CVD_Low[liveIdx]);

   for(int pass = 0; pass < 2; pass++)
     {
      bool isBearish = (pass == 0);
      if(isBearish  && !(InpShowRegularBearish || InpShowHiddenBearish)) continue;
      if(!isBearish && !(InpShowRegularBullish || InpShowHiddenBullish)) continue;

      bool x2PriceFlag = isBearish ? x2PriceFlagHigh : x2PriceFlagLow;
      bool x2CvdFlag    = isBearish ? x2CvdFlagHigh   : x2CvdFlagLow;

      int minX1 = MathMax(1, x2 - InpDivergenceLookback);
      int maxX1 = x2 - InpMinAnchorGap;
      int  bestX1 = -1, bestFlagSum = -1;
      bool bestIsRegular = true;

      for(int x1 = maxX1; x1 >= minX1; x1--)
        {
         if(!CvdReady(x1))
            continue;

         double p1 = isBearish ? high[x1] : low[x1];
         double p2 = isBearish ? high[x2] : low[x2];
         double c1 = isBearish ? CVD_High[x1] : CVD_Low[x1];
         double c2 = isBearish ? CVD_High[x2] : CVD_Low[x2];

         bool isRegular;
         if(isBearish)
           {
            if(p2 > p1 && c2 < c1) isRegular = true;
            else if(p2 < p1 && c2 > c1) isRegular = false;
            else continue;
           }
         else
           {
            if(p2 < p1 && c2 > c1) isRegular = true;
            else if(p2 > p1 && c2 < c1) isRegular = false;
            else continue;
           }

         if(isBearish  && isRegular  && !InpShowRegularBearish) continue;
         if(isBearish  && !isRegular && !InpShowHiddenBearish)  continue;
         if(!isBearish && isRegular  && !InpShowRegularBullish) continue;
         if(!isBearish && !isRegular && !InpShowHiddenBullish)  continue;

         bool x1PriceFlag = isBearish ? IsPriceSwingHigh(high, x1) : IsPriceSwingLow(low, x1);
         bool x1CvdFlag    = isBearish ? IsCvdSwingHigh(x1)         : IsCvdSwingLow(x1);
         int  flagSum = (x1PriceFlag?1:0) + (x1CvdFlag?1:0) + (x2PriceFlag?1:0) + (x2CvdFlag?1:0);
         if(flagSum < 2)
            continue;

         if(flagSum > bestFlagSum)
           {
            bestFlagSum   = flagSum;
            bestX1        = x1;
            bestIsRegular = isRegular;
           }
        }

      if(bestX1 < 0)
         continue;

      if(!PiercingClean(bestX1, x2, isBearish, high, low))
         continue;

      double c1v = isBearish ? CVD_High[bestX1] : CVD_Low[bestX1];
      double c2v = isBearish ? CVD_High[x2]     : CVD_Low[x2];

      if(ObjectFind(0, name) < 0)
         ObjectCreate(0, name, OBJ_TREND, g_DivWindow, time[bestX1], c1v, time[x2], c2v);
      else
        {
         ObjectMove(0, name, 0, time[bestX1], c1v);
         ObjectMove(0, name, 1, time[x2], c2v);
        }

      ObjectSetInteger(0, name, OBJPROP_COLOR, InpUnconfirmedColor);
      ObjectSetInteger(0, name, OBJPROP_WIDTH, InpUnconfirmedLineWidth);
      ObjectSetInteger(0, name, OBJPROP_STYLE, STYLE_DOT);
      ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, false);
      ObjectSetInteger(0, name, OBJPROP_RAY_LEFT,  false);
      ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
      return;
     }

   ObjectDelete(0, name);
  }

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Fix: Call cleanup function when indicator shuts down
   DeleteAllDivergenceLines();
   Print("SRJ Tick-Based CVD Deinitialized");
  }
//+------------------------------------------------------------------+