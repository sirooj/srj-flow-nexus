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
//|  v1.04 CHANGES -- PARITY FIX vs. THE JFOREX SIBLING FILE         |
//|                                                                  |
//|  1) BID/ASK PARITY GAP FIXED.                                    |
//|     Previous builds classified tick direction from the           |
//|     single-sided series  ticks[i].last > 0 ? last : bid.  On     |
//|     spot FX/CFD feeds  last  is almost always 0, so this         |
//|     silently degraded to a pure BID series, while the JForex     |
//|     sibling (SrjCvdTickBased.java) has always defaulted to       |
//|     MID = (bid + ask) / 2.  The two indicators therefore         |
//|     produced different deltas from the same feed, most visibly   |
//|     around spread widening (a pure ask-side requote moves MID    |
//|     but leaves a bid-only series flat, and vice versa).          |
//|     This build adds InpPriceSource (MID / BID / ASK / LAST),     |
//|     defaulting to MID, so both implementations agree.            |
//|                                                                  |
//|  2) LAST IS NOW VERIFIED, NOT ASSUMED.                           |
//|     Some synthetic "CVD contract" symbols really do populate     |
//|     ticks[].last with a meaningful traded price, so LAST stays   |
//|     selectable -- but it is only honoured after the symbol is    |
//|     confirmed to publish it (SYMBOL_LAST, or a TICK_FLAG_LAST    |
//|     tick carrying last > 0).  If it does not, the indicator      |
//|     logs a warning and falls back to MID instead of quietly      |
//|     classifying against an empty field.                          |
//|                                                                  |
//|  3) TIMING DIAGNOSTIC ADDED.                                     |
//|     On a full recalculation the CopyTicksRange fetch and the     |
//|     classification loop are timed separately and printed to the  |
//|     Experts tab, so real-world latency for the whole             |
//|     InpMaxBackfillDays window can be measured on a live account  |
//|     rather than assumed.                                         |
//|                                                                  |
//|  Divergence detection (2-of-4 flag rule), the piercing check,    |
//|  fractal detection, the CVD-ATR arrow offset, object drawing and |
//|  the dual reset-aware / continuous CVD behaviour are UNCHANGED.  |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "1.04"
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

//+------------------------------------------------------------------+
//| Tick price source used for direction classification.             |
//| Mirrors the PriceSource enum in SrjCvdTickBased.java.            |
//+------------------------------------------------------------------+
enum ENUM_CVD_PRICE_SOURCE
  {
   CVD_PRICE_MID  = 0,   // MID (bid+ask)/2  [JForex default]
   CVD_PRICE_BID  = 1,   // BID only
   CVD_PRICE_ASK  = 2,   // ASK only
   CVD_PRICE_LAST = 3    // LAST traded (verified symbols only)
  };

//--- Input Parameters
input ENUM_TIMEFRAMES InpResetPeriod      = PERIOD_H1;  // CVD Reset Period
input bool            InpNoReset          = false;      // CVD No Reset
input bool            InpUseZeroTickRule  = true;        // Unchanged-price ticks inherit last direction
input int             InpMaxBackfillDays  = 30;          // Max days of tick history to backfill (0 = unlimited)

//--- Tick price source (parity with the JForex sibling indicator)
input ENUM_CVD_PRICE_SOURCE InpPriceSource = CVD_PRICE_MID; // Tick price source for direction classification

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

//--- Price-source resolution state
ENUM_CVD_PRICE_SOURCE g_PriceSource = CVD_PRICE_MID;  // effective source after verification
bool     g_LastVerified         = false;  // true once the symbol is proven to publish a real traded price
bool     g_LastProbeDone        = false;  // tick-flag probe already run

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
//| Does this symbol publish a genuine traded price?                 |
//|                                                                  |
//| Cheap, synchronous check only: SYMBOL_LAST is non-zero for       |
//| exchange-traded and for synthetic "CVD contract" symbols whose   |
//| feed actually fills the last field. Spot FX/CFD feeds report 0   |
//| here, which is precisely why the old  last-or-bid  fallback      |
//| collapsed into a bid-only series. If this returns false the      |
//| tick-flag probe below gets a second, evidence-based attempt      |
//| once real ticks arrive.                                          |
//+------------------------------------------------------------------+
bool SymbolPublishesRealLast()
  {
   double last = SymbolInfoDouble(_Symbol, SYMBOL_LAST);
   return (last > 0.0);
  }

//+------------------------------------------------------------------+
//| Second-chance verification from the first fetched tick batch.    |
//|                                                                  |
//| Runs at most once. A symbol counts as carrying a real tape only  |
//| if at least one tick is flagged TICK_FLAG_LAST *and* carries a   |
//| positive last price. Selecting LAST on a symbol that fails this  |
//| test downgrades to MID with a warning rather than silently       |
//| classifying against an always-zero field.                        |
//+------------------------------------------------------------------+
void ProbeLastAvailability(const MqlTick &ticks[], const int copied)
  {
   if(g_LastProbeDone)
      return;

   for(int i = 0; i < copied; i++)
     {
      if(((ticks[i].flags & TICK_FLAG_LAST) != 0) && ticks[i].last > 0.0)
        {
         g_LastVerified = true;
         break;
        }
     }

   g_LastProbeDone = true;

   if(InpPriceSource == CVD_PRICE_LAST)
     {
      if(g_LastVerified)
        {
         g_PriceSource = CVD_PRICE_LAST;
         Print("SRJ CVD: LAST confirmed from tick flags - classifying on the traded price.");
        }
      else
        {
         g_PriceSource = CVD_PRICE_MID;
         Print("SRJ CVD WARNING: price source LAST requested but ", _Symbol,
               " publishes no traded price (no TICK_FLAG_LAST tick with last>0). ",
               "Falling back to MID = (bid+ask)/2 for parity with the JForex build.");
        }
     }
   else if(g_LastVerified)
     {
      Print("SRJ CVD: note - ", _Symbol, " does carry a real traded price; ",
            "CVD_PRICE_LAST is a valid选 option on this symbol. Currently using ",
            EnumToString(g_PriceSource), ".");
     }
  }

//+------------------------------------------------------------------+
//| Reads  last  only when the symbol is proven to publish it.       |
//| Returns 0.0 otherwise so the caller can skip the tick instead of |
//| accumulating delta from an empty field.                          |
//+------------------------------------------------------------------+
double SafeLast(const MqlTick &t)
  {
   return (g_LastVerified && t.last > 0.0) ? t.last : 0.0;
  }

//+------------------------------------------------------------------+
//| Selects the classification price for one tick.                   |
//|                                                                  |
//| MID is the default and matches SrjCvdTickBased.java. Per-tick    |
//| degradation is explicit: a side is only substituted when the     |
//| requested side is missing from the feed (some historical MT5     |
//| tick records carry a zero ask). Returns 0.0 when nothing usable  |
//| is present, and the caller skips that tick.                      |
//+------------------------------------------------------------------+
double SelectTickPrice(const MqlTick &t)
  {
   double bid = t.bid;
   double ask = t.ask;

   switch(g_PriceSource)
     {
      case CVD_PRICE_BID:
         if(bid > 0.0) return bid;
         if(ask > 0.0) return ask;
         return SafeLast(t);

      case CVD_PRICE_ASK:
         if(ask > 0.0) return ask;
         if(bid > 0.0) return bid;
         return SafeLast(t);

      case CVD_PRICE_LAST:
        {
         double lst = SafeLast(t);
         if(lst > 0.0) return lst;
         if(bid > 0.0 && ask > 0.0) return (bid + ask) * 0.5;
         if(bid > 0.0) return bid;
         return ask;
        }

      case CVD_PRICE_MID:
      default:
         if(bid > 0.0 && ask > 0.0) return (bid + ask) * 0.5;
         if(bid > 0.0) return bid;
         if(ask > 0.0) return ask;
         return SafeLast(t);
     }
  }

//+------------------------------------------------------------------+
//| TICK-RULE DIRECTION PROXY -- READ THIS BEFORE TRUSTING THE NAME  |
//|                                                                  |
//| This function is the whole of the "volume" in Cumulative Volume  |
//| Delta, and it measures no volume at all. It applies the classic  |
//| tick rule (uptick = buy-side, downtick = sell-side, unchanged =  |
//| inherit the prior direction) to the selected price series, and   |
//| each classified tick is then weighted as one unit.               |
//|                                                                  |
//| Under tick-count weighting on a spot FX/CFD feed the resulting   |
//| series measures LP REPRICING VELOCITY -- the rate and direction  |
//| of quote updates, i.e. directional requotes -- not executed      |
//| size. No spot FX or CFD venue publishes a consolidated tape, so  |
//| there is no aggregated traded volume available to delta in the   |
//| first place. A rising CVD here means the quote was being lifted  |
//| more often than it was being marked down; it does not mean more  |
//| contracts were bought than sold.                                 |
//|                                                                  |
//| That makes this an order-flow *proxy*, and it is a good one for  |
//| divergence work, where the shape of the imbalance matters more   |
//| than its absolute magnitude. It is not a substitute for exchange |
//| footprint data. Same caveat, same wording, as the Javadoc on     |
//| SrjCvdTickBased.java -- kept in both files deliberately so the   |
//| limitation cannot be lost by reading only one of them.           |
//+------------------------------------------------------------------+
int ClassifyTickDirection(const double px, const double prev_px, const int prev_dir)
  {
   if(prev_px == 0.0)  return 0;
   if(px > prev_px)    return 1;
   if(px < prev_px)    return -1;
   return InpUseZeroTickRule ? prev_dir : 0;
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

   //--- Resolve the effective price source before any tick is classified.
   g_PriceSource   = InpPriceSource;
   g_LastVerified  = SymbolPublishesRealLast();
   g_LastProbeDone = false;

   if(InpPriceSource == CVD_PRICE_LAST)
     {
      if(g_LastVerified)
        {
         g_LastProbeDone = true;   // SYMBOL_LAST already settles it, skip the tick probe
         Print("SRJ CVD: price source LAST verified via SYMBOL_LAST on ", _Symbol, ".");
        }
      else
        {
         // Provisional downgrade. ProbeLastAvailability() gets one evidence-based
         // retry from the first tick batch, before any delta is accumulated.
         g_PriceSource = CVD_PRICE_MID;
         Print("SRJ CVD: SYMBOL_LAST is 0 on ", _Symbol,
               " - LAST unconfirmed, provisionally using MID pending tick-flag probe.");
        }
     }

   Print("SRJ Tick-Based CVD Initialized - Reset Mode: ", InpNoReset ? "No Reset" : EnumToString(InpResetPeriod),
         ", Price Source: ", EnumToString(g_PriceSource),
         " (requested ", EnumToString(InpPriceSource), ")");

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

   //--- Timing diagnostic: only instrumented on a full recalculation, so the
   //--- per-tick hot path stays clean. Measures the CopyTicksRange fetch and
   //--- the classification loop separately over the whole backfill window.
   ulong t_begin = 0, t_fetched = 0;
   if(isFullRecalc)
      t_begin = GetMicrosecondCount();

   MqlTick ticks[];
   int copied = CopyTicksRange(_Symbol, ticks, COPY_TICKS_ALL, from_msc, to_msc);

   if(isFullRecalc)
      t_fetched = GetMicrosecondCount();

   if(copied <= 0)
     {
      if(isFullRecalc)
        {
         int err = GetLastError();
         Print("SRJ CVD: waiting on tick history sync (error ", err, ", CopyTicksRange returned in ",
               DoubleToString((double)(t_fetched - t_begin) / 1000.0, 1), " ms), will retry on next tick...");
         return(0);
        }
      RecalculateCvdATR(rates_total);
      MarkFractals(rates_total, time);
      ScanDivergences(rates_total, time, high, low);
      ScanUnconfirmedDivergence(rates_total, time, high, low);
      return(rates_total);
     }

   ArraySetAsSeries(ticks, false);

   //--- One-shot evidence-based confirmation of the LAST field. Must run before
   //--- the first classification so the whole series uses one price source.
   ProbeLastAvailability(ticks, copied);

   int processed = 0;

   for(int i = 0; i < copied; i++)
     {
      double px = SelectTickPrice(ticks[i]);
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

      int direction = ClassifyTickDirection(px, g_LastTickPrice, g_LastTickDirection);

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
      processed++;
     }

   if(isFullRecalc)
     {
      ulong  t_end     = GetMicrosecondCount();
      double fetch_ms  = (double)(t_fetched - t_begin) / 1000.0;
      double loop_ms   = (double)(t_end - t_fetched)  / 1000.0;
      double total_ms  = fetch_ms + loop_ms;
      double span_days = (double)(to_msc - from_msc) / 86400000.0;
      double rate_kps  = (loop_ms > 0.0) ? ((double)processed / loop_ms) : 0.0;

      Print(StringFormat("SRJ CVD timing [full recalc] window=%.2f days (InpMaxBackfillDays=%d), src=%s | "
                          "CopyTicksRange: %d ticks in %.1f ms | classify loop: %d ticks in %.1f ms (%.1f k ticks/s) | total %.1f ms",
                          span_days, InpMaxBackfillDays, EnumToString(g_PriceSource),
                          copied, fetch_ms, processed, loop_ms, rate_kps, total_ms));
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