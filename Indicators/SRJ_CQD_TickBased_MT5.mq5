//+------------------------------------------------------------------+
//|                                        SRJ_CQD_TickBased_MT5.mq5 |
//|         Per-tick Cumulative QUOTE Delta (CQD) for MetaTrader 5   |
//|                                                                  |
//|  v2.05 -- HEADLESS iCustom() FIX + DIVVERDICT EXPORT BUFFER      |
//|                                                                  |
//|  [H1] HEADLESS WINDOW FIX. OnCalculate previously returned 0     |
//|       before any calculation ran if ChartWindowFind() never      |
//|       resolved (expected when loaded headlessly via iCustom).    |
//|       This affected ALL CQD buffers, not just divergence lines.  |
//|       Fix: separate calculation from drawing. FinalizePass()     |
//|       runs unconditionally; only ObjectCreate/SetInteger/Delete   |
//|       calls are skipped when g_canDraw is false.                 |
//|                                                                  |
//|  [B6] NEW BUFFER 6: CQD_DivVerdict (INDICATOR_CALCULATIONS).     |
//|       Per-bar divergence verdict: 0=none, +1=bull regular,       |
//|       +2=bull hidden, -1=bear regular, -2=bear hidden,           |
//|       EMPTY_VALUE=not yet scanned. Written only in TryDivergence |
//|       confirmed-pair branch, never by ScanUnconfirmedDivergence. |
//+------------------------------------------------------------------+
//|  (Full v2.00-v2.04 history preserved below -- unchanged)         |
//+------------------------------------------------------------------+
//|  v2.04 -- FRACTAL MARKER DE-DUPLICATION                          |
//|  v2.03 -- OBJECT LIFETIME + BOUNDED RETRY                        |
//|  v2.02 -- REGRESSION FIXES + PRICE-SOURCE DEFAULT REVERTED       |
//|  v2.01 -- COMPILE FIXES + DEFAULT CHANGES                        |
//|  v2.00 -- DEFECT FIXES (Section 8 of the Research Verdict)       |
//+------------------------------------------------------------------+
//|  DELIBERATELY NOT CHANGED -- do not "fix" these                  |
//|  * InpMaxAnchorsPerBar stays at 3, with NO best-anchor /         |
//|    highest-flagSum selection.                                    |
//|  * InpMaxDivergenceLines stays at 200.                           |
//|  * No lookback-age cap, no decay, no recency weighting.          |
//|  * No minimum delta separation, no ATR threshold, no detrending. |
//|  * InpUseZeroTickRule stays defaulted TRUE at full weight.       |
//|  * Unit +/-1 tick weight.                                        |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "2.05"
#property description "SRJ Cumulative Quote Delta (CQD) -- per-tick LP repricing velocity + 2-of-4 divergence"
#property indicator_separate_window
#property indicator_buffers 7
#property indicator_plots   3

#property indicator_label1  "CQD"
#property indicator_type1   DRAW_CANDLES
#property indicator_color1  clrLimeGreen, clrGray, clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "CQD Swing High"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrBlack
#property indicator_width2  1

#property indicator_label3  "CQD Swing Low"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrBlack
#property indicator_width3  1

//+------------------------------------------------------------------+
//| Tick price source used for direction classification.             |
//+------------------------------------------------------------------+
enum ENUM_CQD_PRICE_SOURCE
  {
   CQD_PRICE_MID  = 0,   // MID (bid+ask)/2  [A/B only - spread-sensitive]
   CQD_PRICE_BID  = 1,   // BID only  [default - validated + chart-aligned]
   CQD_PRICE_ASK  = 2,   // ASK only  [A/B only - not the charted series]
   CQD_PRICE_LAST = 3    // LAST traded (verified symbols only)
  };

//--- Input Parameters
input ENUM_TIMEFRAMES InpResetPeriod      = PERIOD_D1;  // CQD Reset Period
input bool            InpNoReset          = false;      // CQD No Reset
input bool            InpUseZeroTickRule  = true;       // Unchanged-price ticks inherit last direction
input int             InpMaxCarryBars     = 12;         // Max tickless bars carried before flagging a hole (0 = infinite)
input int             InpMaxBackfillDays  = 30;         // Max days of tick history to backfill (0 = unlimited)

input ENUM_CQD_PRICE_SOURCE InpPriceSource = CQD_PRICE_BID; // Tick price source for direction classification

input int             InpAtrLength        = 14;         // CQD-ATR Length for fractal triangle offset
input double          InpFractalOffset    = 0.5;        // Fractal Distance Multiplier (fraction of CQD-ATR)

input int             InpDivergenceLookback   = 100;    // Max bars back from x2 to search for x1 anchor
input int             InpMinAnchorGap         = 3;      // Minimum bars required between x1 and x2
input bool            InpShowRegularBearish   = true;   // Price HH / CQD LH
input bool            InpShowHiddenBearish    = true;   // Price LH / CQD HH
input bool            InpShowRegularBullish   = true;   // Price LL / CQD HL
input bool            InpShowHiddenBullish    = true;   // Price HL / CQD LL
input bool            InpDashHiddenDivergence = true;   // Dashed line for hidden divergences
input int             InpMaxDivergenceLines   = 200;    // Cap on drawn lines kept (oldest pruned)
input color           InpBullishColor         = clrDodgerBlue;
input color           InpBearishColor         = clrRed;
input bool            InpShowUnconfirmed      = true;   // Preview using the still-forming bar
input color           InpUnconfirmedColor     = clrBlack;
input int             InpUnconfirmedLineWidth = 1;
input int             InpMaxAnchorsPerBar     = 3;      // Max independent x1 anchors drawn per x2 per direction
input bool            InpDebugLog             = false;  // Log piercing/epoch rejections and draws

input int  InpRetrySeconds = 5;   // OnTimer retry while no full recalc has folded a tick. 0 = off
input int  InpMaxRetries   = 12;  // hard cap on those retries

//--- Indicator Buffers
double CQD_Open[];
double CQD_High[];
double CQD_Low[];
double CQD_Close[];
double CQD_FractalUp[];
double CQD_FractalDown[];
double CQD_DivVerdict[];     // [B6] buffer 6: per-bar divergence verdict

//--- Global state
double   g_CumulativeDelta      = 0.0;
long     g_LastTickMsc          = 0;
int      g_LastMscCount         = 0;
double   g_LastTickPrice        = 0.0;
int      g_LastTickDirection    = 0;
int      g_PrevBarIndex         = -1;
datetime g_LastResetPeriodStart = 0;
datetime g_LastHoleLogged       = 0;

long     g_BarEpoch[];
bool     g_EpochStart[];
int      g_CarriedCount[];
int      g_LastDiscontinuity[];

long     g_EpochRejects       = 0;
long     g_HoleRejects        = 0;
long     g_FillCount          = 0;
int      g_FillCursor         = -1;
bool     g_PeriodWarned       = false;
datetime g_EngineFrom         = 0;

ENUM_CQD_PRICE_SOURCE g_PriceSource = CQD_PRICE_BID;
bool     g_LastVerified         = false;
bool     g_LastProbeDone        = false;

datetime g_LastScannedX2Time      = 0;
datetime g_LastScannedFractalTime = 0;
double   g_CqdATR[];
int      g_LastATRBar             = -1;
int      g_DivWindow              = -1;
bool     g_canDraw                = false;   // [H1] true when chart window is available
long     g_DivPass                = 0;
bool     g_EverBuilt              = false;
string   g_DivObjNames[];
datetime g_DivObjTimes[];

//+------------------------------------------------------------------+
//| Forward declarations.                                            |
//+------------------------------------------------------------------+
bool CqdReady(const int i);
bool SameEpoch(const int a, const int b);
bool IsCqdSwingHigh(const int i);
bool IsCqdSwingLow(const int i);
bool IsCqdFractalHigh(const int i);
bool IsCqdFractalLow(const int i);

//+------------------------------------------------------------------+
void DeleteAllDivergenceLines()
  {
   if(g_DivWindow >= 0)
      ObjectsDeleteAll(0, "SRJ_DIV_", g_DivWindow, -1);

   ArrayResize(g_DivObjNames, 0);
   ArrayResize(g_DivObjTimes, 0);
  }

//+------------------------------------------------------------------+
void SweepStaleDivergenceLines()
  {
   if(g_DivWindow < 0)
      return;

   for(int idx = ObjectsTotal(0, g_DivWindow, OBJ_TREND) - 1; idx >= 0; idx--)
     {
      string nm = ObjectName(0, idx, g_DivWindow, OBJ_TREND);
      if(StringFind(nm, "SRJ_DIV_") != 0)          continue;
      if(nm == "SRJ_DIV_UNCONFIRMED")              continue;
      if(ObjectGetInteger(0, nm, OBJPROP_ZORDER) != g_DivPass)
         ObjectDelete(0, nm);
     }
  }

//+------------------------------------------------------------------+
void EnsureBarStateArrays(const int rates_total, const bool wipe)
  {
   int old = ArraySize(g_BarEpoch);

   if(old != rates_total)
     {
      ArrayResize(g_BarEpoch,   rates_total);
      ArrayResize(g_EpochStart, rates_total);
      ArrayResize(g_CarriedCount, rates_total);
      ArrayResize(g_LastDiscontinuity, rates_total);
     }

   int from = wipe ? 0 : old;
   if(from < 0)
      from = 0;

   for(int i = from; i < rates_total; i++)
     {
      g_BarEpoch[i]   = 0;
      g_EpochStart[i] = false;
      g_CarriedCount[i] = 0;
      g_LastDiscontinuity[i] = -1;
     }
  }

//+------------------------------------------------------------------+
bool SymbolPublishesRealLast()
  {
   double last = SymbolInfoDouble(_Symbol, SYMBOL_LAST);
   return (last > 0.0);
  }

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

   if(InpPriceSource == CQD_PRICE_LAST)
     {
      if(g_LastVerified)
        {
         g_PriceSource = CQD_PRICE_LAST;
         Print("SRJ CQD: LAST confirmed from tick flags - classifying on the traded price.");
        }
      else
        {
         g_PriceSource = CQD_PRICE_BID;
         Print("SRJ CQD WARNING: price source LAST requested but ", _Symbol,
               " publishes no traded price. Falling back to BID only.");
        }
     }
   else if(g_LastVerified)
     {
      Print("SRJ CQD: note - ", _Symbol, " does carry a real traded price; ",
            "CQD_PRICE_LAST is a valid option on this symbol. Currently using ",
            EnumToString(g_PriceSource), ".");
     }
  }

//+------------------------------------------------------------------+
double SafeLast(const MqlTick &t)
  {
   return (g_LastVerified && t.last > 0.0) ? t.last : 0.0;
  }

//+------------------------------------------------------------------+
double SelectTickPrice(const MqlTick &t)
  {
   double bid = t.bid;
   double ask = t.ask;

   switch(g_PriceSource)
     {
      case CQD_PRICE_BID:
         if(bid > 0.0) return bid;
         if(ask > 0.0) return ask;
         return SafeLast(t);

      case CQD_PRICE_ASK:
         if(ask > 0.0) return ask;
         if(bid > 0.0) return bid;
         return SafeLast(t);

      case CQD_PRICE_LAST:
         {
          double lst = SafeLast(t);
          if(lst > 0.0) return lst;
          if(bid > 0.0) return bid;
          if(ask > 0.0 && t.bid > 0.0) return (t.bid + ask) * 0.5;
          return ask;
         }

      case CQD_PRICE_MID:
      default:
         if(bid > 0.0 && ask > 0.0) return (bid + ask) * 0.5;
         if(bid > 0.0) return bid;
         if(ask > 0.0) return ask;
         return SafeLast(t);
     }
  }

//+------------------------------------------------------------------+
int ClassifyTickDirection(const double px, const double prev_px, const int prev_dir)
  {
   if(prev_px == 0.0)  return 0;
   if(px > prev_px)    return 1;
   if(px < prev_px)    return -1;
   return InpUseZeroTickRule ? prev_dir : 0;
  }

//+------------------------------------------------------------------+
int BarIndexAt(datetime t, const datetime &time[], int rates_total, int hint)
  {
   int b = (hint >= 0 && hint < rates_total) ? hint : 0;
   while(b > 0 && time[b] > t) b--;
   while(b + 1 < rates_total && time[b + 1] <= t) b++;
   if(b >= 0 && b < rates_total && time[b] <= t)
     {
      return b;
     }
   return -1;
  }

//+------------------------------------------------------------------+
datetime GetPeriodStart(datetime t, ENUM_TIMEFRAMES tf)
  {
   int secs = PeriodSeconds(tf);

   if(secs <= 0)
     {
      if(!g_PeriodWarned)
        {
         g_PeriodWarned = true;
         Print("SRJ CQD WARNING: could not resolve seconds for reset period ",
               EnumToString(tf),
               " - falling back to hourly boundaries.");
        }
      secs = 3600;
      tf   = PERIOD_H1;
     }

   MqlDateTime dt;
   TimeToStruct(t, dt);

   datetime dayStart = (datetime)((long)t - (long)(dt.hour * 3600 + dt.min * 60 + dt.sec));

   if(secs < 86400)
     {
      long into = (long)t - (long)dayStart;
      long k    = (into / (long)secs) * (long)secs;
      return (datetime)((long)dayStart + k);
     }

   if(secs == 86400)
      return dayStart;

   if(tf == PERIOD_W1)
      return (datetime)((long)dayStart - (long)dt.day_of_week * 86400);

   dt.day  = 1;
   dt.hour = 0;
   dt.min  = 0;
   dt.sec  = 0;
   return StructToTime(dt);
  }

//+------------------------------------------------------------------+
bool SameEpoch(const int a, const int b)
  {
   if(InpNoReset)
      return true;

   int n = ArraySize(g_BarEpoch);
   if(a < 0 || b < 0 || a >= n || b >= n)
      return false;

   return (g_BarEpoch[a] == g_BarEpoch[b]);
  }

//+------------------------------------------------------------------+
bool CqdReady(const int i)
  {
   if(i < 0 || i >= ArraySize(CQD_High))
      return false;
   return (CQD_High[i] != EMPTY_VALUE && CQD_Low[i] != EMPTY_VALUE);
  }

//+------------------------------------------------------------------+
void UpdateCqdCandle(const int bar_index, const double prev_cqd, const double current_cqd)
  {
   if(bar_index >= 0 && bar_index < ArraySize(g_CarriedCount))
      g_CarriedCount[bar_index] = 0;

   bool is_new_candle = (bar_index != g_PrevBarIndex);

   if(is_new_candle)
     {
      CQD_Open[bar_index] = prev_cqd;
      CQD_High[bar_index] = MathMax(prev_cqd, current_cqd);
      CQD_Low[bar_index]  = MathMin(prev_cqd, current_cqd);
      g_PrevBarIndex = bar_index;
     }
   else
     {
      CQD_High[bar_index] = MathMax(CQD_High[bar_index], current_cqd);
      CQD_Low[bar_index]  = MathMin(CQD_Low[bar_index],  current_cqd);
     }

   CQD_Close[bar_index] = current_cqd;
  }

//+------------------------------------------------------------------+
void ReopenBarAtReset(const int bar_index)
  {
   CQD_Open[bar_index]  = 0.0;
   CQD_High[bar_index]  = 0.0;
   CQD_Low[bar_index]   = 0.0;
   CQD_Close[bar_index] = 0.0;

   g_PrevBarIndex       = bar_index;
  }

//+------------------------------------------------------------------+
void FillTicklessBars(const int rates_total, const datetime &time[])
  {
   int start = g_FillCursor;

   if(start < 1)
     {
      int first = -1;
      for(int i = 0; i < rates_total; i++)
         if(CqdReady(i))
           {
            first = i;
            break;
           }
      if(first < 0)
         return;
      start = first + 1;
     }

   if(start < 1)
      start = 1;

   for(int i = start; i < rates_total; i++)
     {
      if(CqdReady(i))
        {
         g_LastDiscontinuity[i] = g_LastDiscontinuity[i-1];
         continue;
        }
        
      if(!CqdReady(i - 1))
        {
         g_LastDiscontinuity[i] = i; 
         continue;
        }

      int consecutive = g_CarriedCount[i - 1] + 1;
      
      if(InpMaxCarryBars > 0 && consecutive > InpMaxCarryBars)
        {
         g_LastDiscontinuity[i] = i;
         
         if (time[i] > g_LastHoleLogged + 86400)
           {
            Print("SRJ CQD: Tickless gap at ", TimeToString(time[i]), " exceeds InpMaxCarryBars (", InpMaxCarryBars, "). Leaving as EMPTY_VALUE.");
            g_LastHoleLogged = time[i];
           }
         continue;
        }

      g_CarriedCount[i] = consecutive;
      g_LastDiscontinuity[i] = g_LastDiscontinuity[i-1];

      long ownEpoch = InpNoReset ? 0 : (long)GetPeriodStart(time[i], InpResetPeriod);
      
      if(!InpNoReset && ownEpoch != g_BarEpoch[i-1])
        {
         CQD_Open[i]  = 0.0;
         CQD_High[i]  = 0.0;
         CQD_Low[i]   = 0.0;
         CQD_Close[i] = 0.0;
         g_BarEpoch[i] = ownEpoch;
         g_EpochStart[i] = true;
        }
      else
        {
         double c = CQD_Close[i - 1];
         CQD_Open[i]  = c;
         CQD_High[i]  = c;
         CQD_Low[i]   = c;
         CQD_Close[i] = c;

         if(i < ArraySize(g_BarEpoch))
           {
            g_BarEpoch[i]   = g_BarEpoch[i - 1];
            g_EpochStart[i] = false;
           }
        }

      g_FillCount++;
     }

   g_FillCursor = MathMax(1, rates_total - 3);
  }

//+------------------------------------------------------------------+
bool IsPriceSwingHigh(const double &h[], const int i)
  {
   if(i < 1 || i + 1 >= ArraySize(h))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides - the swing
   //--- candle must be THE most extreme of its immediate neighbors (no ties).
   return (h[i] > h[i-1] && h[i] > h[i+1]);
  }

bool IsPriceSwingLow(const double &l[], const int i)
  {
   if(i < 1 || i + 1 >= ArraySize(l))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides (mirrored).
   return (l[i] < l[i-1] && l[i] < l[i+1]);
  }

bool IsCqdSwingHigh(const int i)
  {
   if(!CqdReady(i-1) || !CqdReady(i) || !CqdReady(i+1))
      return false;
   if(!SameEpoch(i-1, i) || !SameEpoch(i, i+1))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides - unified
   //--- with the triangle predicate (IsCqdFractalHigh).
   return (CQD_High[i] > CQD_High[i-1] && CQD_High[i] > CQD_High[i+1]);
  }

bool IsCqdSwingLow(const int i)
  {
   if(!CqdReady(i-1) || !CqdReady(i) || !CqdReady(i+1))
      return false;
   if(!SameEpoch(i-1, i) || !SameEpoch(i, i+1))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides (mirrored).
   return (CQD_Low[i] < CQD_Low[i-1] && CQD_Low[i] < CQD_Low[i+1]);
  }

//+------------------------------------------------------------------+
bool IsCqdFractalHigh(const int i)
  {
   if(!CqdReady(i-1) || !CqdReady(i) || !CqdReady(i+1))
      return false;
   if(!SameEpoch(i-1, i) || !SameEpoch(i, i+1))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides - the marked
   //--- candle must be THE most extreme of its neighbors (fixes the tie marking).
   return (CQD_High[i] > CQD_High[i-1] && CQD_High[i] > CQD_High[i+1]);
  }

bool IsCqdFractalLow(const int i)
  {
   if(!CqdReady(i-1) || !CqdReady(i) || !CqdReady(i+1))
      return false;
   if(!SameEpoch(i-1, i) || !SameEpoch(i, i+1))
      return false;
   //--- [P-CQD-UNIFY / operator ruling 2026-09-09] strict both sides (mirrored).
   return (CQD_Low[i] < CQD_Low[i-1] && CQD_Low[i] < CQD_Low[i+1]);
  }

//+------------------------------------------------------------------+
bool PiercingClean(const int x1, const int x2, const bool isBearish,
                   const double &price_high[], const double &price_low[])
  {
   if(!CqdReady(x1) || !CqdReady(x2))
      return false;

   double p1 = isBearish ? price_high[x1] : price_low[x1];
   double p2 = isBearish ? price_high[x2] : price_low[x2];
   double c1 = isBearish ? CQD_High[x1]   : CQD_Low[x1];
   double c2 = isBearish ? CQD_High[x2]   : CQD_Low[x2];

   int span = x2 - x1;
   if(span <= 1)
      return true;

   for(int j = x1 + 1; j < x2; j++)
     {
      if(!CqdReady(j))
         return false;

      double t         = (double)(j - x1) / (double)span;
      double priceLine = p1 + (p2 - p1) * t;
      double cqdLine   = c1 + (c2 - c1) * t;

      if(isBearish)
        {
         if(price_high[j] > priceLine) return false;
         if(CQD_High[j]   > cqdLine)   return false;
        }
      else
        {
         if(price_low[j] < priceLine) return false;
         if(CQD_Low[j]   < cqdLine)   return false;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
void RegisterDivObject(const string name, const datetime t)
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
//| [H1] Skip all object operations when g_canDraw is false.         |
//| The divergence detection logic in TryDivergence runs regardless. |
//+------------------------------------------------------------------+
void DrawDivergenceLine(const int x1, const int x2, const bool isBearish,
                        const bool isRegular, const datetime &time[])
  {
   if(!g_canDraw) return;   // [H1] headless: no chart window to draw on

   double c1 = isBearish ? CQD_High[x1] : CQD_Low[x1];
   double c2 = isBearish ? CQD_High[x2] : CQD_Low[x2];

   string name = StringFormat("SRJ_DIV_%s_%s_%d_%d",
                              isBearish ? "BEAR" : "BULL",
                              isRegular ? "REG"  : "HID",
                              (int)time[x1], (int)time[x2]);

   if(ObjectFind(0, name) >= 0)
     {
      ObjectSetInteger(0, name, OBJPROP_ZORDER, g_DivPass);
      return;
     }

   if(!ObjectCreate(0, name, OBJ_TREND, g_DivWindow, time[x1], c1, time[x2], c2))
      return;

   color clr = isBearish ? InpBearishColor : InpBullishColor;
   ObjectSetInteger(0, name, OBJPROP_COLOR, clr);
   ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, name, OBJPROP_STYLE,
                    (InpDashHiddenDivergence && !isRegular) ? STYLE_DASH : STYLE_SOLID);
   ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, false);
   ObjectSetInteger(0, name, OBJPROP_RAY_LEFT,  false);
   ObjectSetInteger(0, name, OBJPROP_BACK, false);
   ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
   ObjectSetInteger(0, name, OBJPROP_ZORDER, g_DivPass);

   RegisterDivObject(name, time[x2]);
  }

//+------------------------------------------------------------------+
void TryDivergence(const int x2, const bool isBearish,
                   const datetime &time[], const double &price_high[], const double &price_low[])
  {
   if(!CqdReady(x2))
      return;

   if(x2 < 0 || x2 >= ArraySize(g_LastDiscontinuity))
      return;

   bool x2PriceFlag = isBearish ? IsPriceSwingHigh(price_high, x2) : IsPriceSwingLow(price_low, x2);
   bool x2CqdFlag   = isBearish ? IsCqdSwingHigh(x2)               : IsCqdSwingLow(x2);

   int minX1      = MathMax(1, x2 - InpDivergenceLookback);
   int maxX1      = x2 - InpMinAnchorGap;
   int drawnCount = 0;

   for(int x1 = maxX1; x1 >= minX1 && drawnCount < InpMaxAnchorsPerBar; x1--)
     {
      if(!CqdReady(x1))
         continue;

      if(g_EngineFrom > 0 && time[x1] < g_EngineFrom)
         break;
         
      if(g_LastDiscontinuity[x2] > x1)
        {
         g_HoleRejects++;
         if(InpDebugLog)
            Print("SRJ CQD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
                  " REJECTED -- straddles a hole");
         continue;
        }

      if(!SameEpoch(x1, x2))
        {
         g_EpochRejects++;
         if(InpDebugLog)
            Print("SRJ CQD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
                  " REJECTED -- cross-epoch");
         continue;
        }

      bool isRegular;
      if(isBearish)
        {
         if(price_high[x2] > price_high[x1] && CQD_High[x2] < CQD_High[x1])
            isRegular = true;
         else if(price_high[x2] < price_high[x1] && CQD_High[x2] > CQD_High[x1])
            isRegular = false;
         else
            continue;
        }
      else
        {
         if(price_low[x2] < price_low[x1] && CQD_Low[x2] > CQD_Low[x1])
            isRegular = true;
         else if(price_low[x2] > price_low[x1] && CQD_Low[x2] < CQD_Low[x1])
            isRegular = false;
         else
            continue;
        }

      if(isBearish  && isRegular  && !InpShowRegularBearish) continue;
      if(isBearish  && !isRegular && !InpShowHiddenBearish)  continue;
      if(!isBearish && isRegular  && !InpShowRegularBullish) continue;
      if(!isBearish && !isRegular && !InpShowHiddenBullish)  continue;

      bool x1PriceFlag = isBearish ? IsPriceSwingHigh(price_high, x1) : IsPriceSwingLow(price_low, x1);
      bool x1CqdFlag   = isBearish ? IsCqdSwingHigh(x1)               : IsCqdSwingLow(x1);

      int flagSum = (x1PriceFlag ? 1 : 0) + (x1CqdFlag ? 1 : 0)
                  + (x2PriceFlag ? 1 : 0) + (x2CqdFlag ? 1 : 0);
      if(flagSum < 2)
         continue;
      //--- [P-CQD-FLAGGATE / operator ruling 2026-09-09] The 2-of-4 gate must not
      //--- be satisfiable by same-side flags: both swing flags sitting on ONE
      //--- anchor (e.g. x1 price + x1 CQD with a non-swing x2) no longer
      //--- qualifies. At least one swing flag from EACH anchor.
      if((!x1PriceFlag && !x1CqdFlag) || (!x2PriceFlag && !x2CqdFlag))
         continue;

      if(!PiercingClean(x1, x2, isBearish, price_high, price_low))
        {
         if(InpDebugLog)
            Print("SRJ CQD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
                  " (", isBearish ? "bearish" : "bullish", ", ", isRegular ? "regular" : "hidden",
                  ", flagSum=", flagSum, ") REJECTED -- piercing");
         continue;
        }

      //--- [B6] Write the divergence verdict to buffer 6.
      //--- Written ONLY here (confirmed scan), never by ScanUnconfirmedDivergence.
      //--- Written at bar index x2 (the right/confirming anchor).
      //--- Last-write-wins if multiple pairs qualify at the same x2.
      int verdict = 0;
      if(!isBearish && isRegular)       verdict = 1;    // bullish regular
      else if(!isBearish && !isRegular) verdict = 2;    // bullish hidden
      else if(isBearish && isRegular)   verdict = -1;   // bearish regular
      else if(isBearish && !isRegular)  verdict = -2;   // bearish hidden
      CQD_DivVerdict[x2] = (double)verdict;

      if(InpDebugLog)
         Print("SRJ CQD Div: x1=", TimeToString(time[x1]), " x2=", TimeToString(time[x2]),
               " (", isBearish ? "bearish" : "bullish", ", ", isRegular ? "regular" : "hidden",
               ", flagSum=", flagSum, ") VERDICT=", verdict, " DRAWN");

      DrawDivergenceLine(x1, x2, isBearish, isRegular, time);
      drawnCount++;
     }
  }

//+------------------------------------------------------------------+
void RecalculateCqdATR(const int rates_total)
  {
   if(rates_total < 1)
      return;

   if(ArraySize(g_CqdATR) != rates_total)
      ArrayResize(g_CqdATR, rates_total);

   int atrLen = (InpAtrLength > 0) ? InpAtrLength : 14;
   double alpha = 1.0 / (double)atrLen;

   int startIdx = (g_LastATRBar < 1) ? 0 : g_LastATRBar;

   for(int i = startIdx; i < rates_total; i++)
     {
      if(!CqdReady(i))
        {
         g_CqdATR[i] = (i > 0) ? g_CqdATR[i - 1] : 0.0;
         continue;
        }

      double prevClose;
      if(i == 0 || g_EpochStart[i] || !CqdReady(i - 1) || !SameEpoch(i - 1, i))
         prevClose = CQD_Open[i];
      else
         prevClose = CQD_Close[i - 1];

      double tr1 = CQD_High[i] - CQD_Low[i];
      double tr2 = MathAbs(CQD_High[i] - prevClose);
      double tr3 = MathAbs(CQD_Low[i]  - prevClose);
      double tr  = MathMax(tr1, MathMax(tr2, tr3));

      if(i == 0)
         g_CqdATR[i] = tr;
      else
         g_CqdATR[i] = g_CqdATR[i - 1] * (1.0 - alpha) + tr * alpha;
     }

   g_LastATRBar = rates_total - 1;
  }

//+------------------------------------------------------------------+
void MarkFractals(const int rates_total, const datetime &time[])
  {
   int maxI = rates_total - 3;
   if(maxI < 1)
      return;

   int startI;
   if(g_LastScannedFractalTime == 0)
      startI = 1;
   else
     {
      int shift = iBarShift(_Symbol, Period(), g_LastScannedFractalTime, false);
      int idx   = (shift >= 0) ? (rates_total - 1 - shift) : -1;
      startI    = (idx >= 0) ? idx + 1 : 1;
     }

   if(startI < 1)
      startI = 1;
   if(startI > maxI)
      return;

   for(int i = startI; i <= maxI; i++)
     {
      double gap = (i < ArraySize(g_CqdATR)) ? g_CqdATR[i] * InpFractalOffset : 0.0;
      CQD_FractalUp[i]   = IsCqdFractalHigh(i) ? CQD_High[i] + gap : EMPTY_VALUE;
      CQD_FractalDown[i] = IsCqdFractalLow(i)  ? CQD_Low[i]  - gap : EMPTY_VALUE;
     }

   g_LastScannedFractalTime = time[maxI];

   if(rates_total > 1)
     {
      CQD_FractalUp[rates_total - 1]   = EMPTY_VALUE;
      CQD_FractalDown[rates_total - 1] = EMPTY_VALUE;
     }
   if(rates_total > 2)
     {
      CQD_FractalUp[rates_total - 2]   = EMPTY_VALUE;
      CQD_FractalDown[rates_total - 2] = EMPTY_VALUE;
     }
  }

//+------------------------------------------------------------------+
void ScanDivergences(const int rates_total, const datetime &time[],
                     const double &high[], const double &low[])
  {
   int maxX2 = rates_total - 3;
   if(maxX2 < InpMinAnchorGap + 2)
      return;

   int startX2;
   if(g_LastScannedX2Time == 0)
      startX2 = 2;
   else
     {
      int shift = iBarShift(_Symbol, Period(), g_LastScannedX2Time, false);
      int idx   = (shift >= 0) ? (rates_total - 1 - shift) : -1;
      startX2   = (idx >= 0) ? idx + 1 : 2;
     }

   if(startX2 < 2)
      startX2 = 2;
   if(startX2 > maxX2)
      return;

   for(int x2 = startX2; x2 <= maxX2; x2++)
     {
      if(InpShowRegularBearish || InpShowHiddenBearish)
         TryDivergence(x2, true,  time, high, low);

      if(InpShowRegularBullish || InpShowHiddenBullish)
         TryDivergence(x2, false, time, high, low);
     }

   g_LastScannedX2Time = time[maxX2];
  }

//+------------------------------------------------------------------+
//| [H1] Object operations gated by g_canDraw. The detection logic   |
//| (flag math, piercing test) still runs regardless, but since this  |
//| is the preview scan and buffer 6 is never written here, skipping  |
//| the object operations makes it effectively a no-op when headless. |
//+------------------------------------------------------------------+
void ScanUnconfirmedDivergence(const int rates_total, const datetime &time[],
                               const double &high[], const double &low[])
  {
   string name = "SRJ_DIV_UNCONFIRMED";

   if(!InpShowUnconfirmed || rates_total < InpMinAnchorGap + 3)
     {
      if(g_canDraw) ObjectDelete(0, name);   // [H1]
      return;
     }

   int x2      = rates_total - 2;
   int liveIdx = rates_total - 1;

   if(x2 - 1 < 1 || !CqdReady(x2) || !CqdReady(liveIdx) || !CqdReady(x2 - 1))
     {
      if(g_canDraw) ObjectDelete(0, name);   // [H1]
      return;
     }

   if(x2 < 0 || x2 >= ArraySize(g_LastDiscontinuity))
     {
      if(g_canDraw) ObjectDelete(0, name);   // [H1]
      return;
     }

   bool x2PriceFlagHigh = (high[x2] > high[x2-1] && high[x2] > high[liveIdx]);
   bool x2PriceFlagLow  = (low[x2]  < low[x2-1]  && low[x2]  < low[liveIdx]);

   bool cqdNeighboursOk = SameEpoch(x2 - 1, x2) && SameEpoch(x2, liveIdx);
   bool x2CqdFlagHigh   = cqdNeighboursOk
                        && (CQD_High[x2] > CQD_High[x2-1] && CQD_High[x2] > CQD_High[liveIdx]);
   bool x2CqdFlagLow    = cqdNeighboursOk
                        && (CQD_Low[x2]  < CQD_Low[x2-1]  && CQD_Low[x2]  < CQD_Low[liveIdx]);

   for(int pass = 0; pass < 2; pass++)
     {
      bool isBearish = (pass == 0);
      if(isBearish  && !(InpShowRegularBearish || InpShowHiddenBearish)) continue;
      if(!isBearish && !(InpShowRegularBullish || InpShowHiddenBullish)) continue;

      bool x2PriceFlag = isBearish ? x2PriceFlagHigh : x2PriceFlagLow;
      bool x2CqdFlag   = isBearish ? x2CqdFlagHigh   : x2CqdFlagLow;

      int  minX1 = MathMax(1, x2 - InpDivergenceLookback);
      int  maxX1 = x2 - InpMinAnchorGap;
      int  bestX1 = -1, bestFlagSum = -1;
      bool bestIsRegular = true;

      for(int x1 = maxX1; x1 >= minX1; x1--)
        {
         if(!CqdReady(x1))
            continue;
            
         if(g_EngineFrom > 0 && time[x1] < g_EngineFrom)
            break;
         if(g_LastDiscontinuity[x2] > x1)
            continue;

         if(!SameEpoch(x1, x2))
           {
            g_EpochRejects++;
            continue;
           }

         double p1 = isBearish ? high[x1] : low[x1];
         double p2 = isBearish ? high[x2] : low[x2];
         double c1 = isBearish ? CQD_High[x1] : CQD_Low[x1];
         double c2 = isBearish ? CQD_High[x2] : CQD_Low[x2];

         bool isRegular;
         if(isBearish)
           {
            if(p2 > p1 && c2 < c1)      isRegular = true;
            else if(p2 < p1 && c2 > c1) isRegular = false;
            else continue;
           }
         else
           {
            if(p2 < p1 && c2 > c1)      isRegular = true;
            else if(p2 > p1 && c2 < c1) isRegular = false;
            else continue;
           }

         if(isBearish  && isRegular  && !InpShowRegularBearish) continue;
         if(isBearish  && !isRegular && !InpShowHiddenBearish)  continue;
         if(!isBearish && isRegular  && !InpShowRegularBullish) continue;
         if(!isBearish && !isRegular && !InpShowHiddenBullish)  continue;

         bool x1PriceFlag = isBearish ? IsPriceSwingHigh(high, x1) : IsPriceSwingLow(low, x1);
         bool x1CqdFlag   = isBearish ? IsCqdSwingHigh(x1)         : IsCqdSwingLow(x1);
         int  flagSum = (x1PriceFlag?1:0) + (x1CqdFlag?1:0)
                      + (x2PriceFlag?1:0) + (x2CqdFlag?1:0);
         if(flagSum < 2)
            continue;
         //--- [P-CQD-FLAGGATE / operator ruling 2026-09-09] Per-anchor minimum:
         //--- at least one swing flag from EACH anchor (see TryDivergence).
         if((!x1PriceFlag && !x1CqdFlag) || (!x2PriceFlag && !x2CqdFlag))
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

      double c1v = isBearish ? CQD_High[bestX1] : CQD_Low[bestX1];
      double c2v = isBearish ? CQD_High[x2]     : CQD_Low[x2];

      // [H1] Only manipulate chart objects when we have a window
      if(g_canDraw)
        {
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
        }

      if(InpDebugLog)
         Print("SRJ CQD Div [preview]: x1=", TimeToString(time[bestX1]),
               " x2=", TimeToString(time[x2]),
               " (", isBearish ? "bearish" : "bullish",
               ", ", bestIsRegular ? "regular" : "hidden",
               ", flagSum=", bestFlagSum, ")");
      return;
     }

   if(g_canDraw) ObjectDelete(0, name);   // [H1]
  }

//+------------------------------------------------------------------+
void FinalizePass(const int rates_total, const datetime &time[],
                  const double &high[], const double &low[])
  {
   FillTicklessBars(rates_total, time);
   RecalculateCqdATR(rates_total);
   MarkFractals(rates_total, time);
   ScanDivergences(rates_total, time, high, low);
   ScanUnconfirmedDivergence(rates_total, time, high, low);
  }

//+------------------------------------------------------------------+
void OnTimer()
  {
   if(g_EverBuilt) { EventKillTimer(); return; }
   if(InpRetrySeconds <= 0 || InpMaxRetries <= 0) { EventKillTimer(); return; }

   string v = "SRJ_CQD_RETRY_" + _Symbol;
   int used = 0;
   if(GlobalVariableCheck(v) &&
      (long)TimeCurrent() - (long)GlobalVariableTime(v) <= 3600)
      used = (int)GlobalVariableGet(v);

   if(used >= InpMaxRetries)
     {
      EventKillTimer();
      Print("SRJ CQD: gave up after ", used, " automatic retries - no tick has been folded. ",
            "Tick history is probably still syncing. Refresh the chart, or pre-cache from ",
            "Symbols > ", _Symbol, " > Ticks.");
      return;
     }

   GlobalVariableSet(v, (double)(used + 1));
   Print("SRJ CQD: retry ", used + 1, "/", InpMaxRetries, " - forcing a recalculation.");
   ChartSetSymbolPeriod(0, _Symbol, (ENUM_TIMEFRAMES)_Period);
  }

//+------------------------------------------------------------------+
int OnInit()
  {
   if(InpRetrySeconds < 0 || InpMaxRetries < 0)
      return(INIT_PARAMETERS_INCORRECT);

   g_DivPass   = 0;
   g_EverBuilt = false;

   if(InpRetrySeconds > 0 && InpMaxRetries > 0)
      EventSetTimer(InpRetrySeconds);

   SetIndexBuffer(0, CQD_Open,  INDICATOR_DATA);
   SetIndexBuffer(1, CQD_High,  INDICATOR_DATA);
   SetIndexBuffer(2, CQD_Low,   INDICATOR_DATA);
   SetIndexBuffer(3, CQD_Close, INDICATOR_DATA);
   SetIndexBuffer(4, CQD_FractalUp,   INDICATOR_DATA);
   SetIndexBuffer(5, CQD_FractalDown, INDICATOR_DATA);
   SetIndexBuffer(6, CQD_DivVerdict,  INDICATOR_CALCULATIONS);   // [B6]

   ArraySetAsSeries(CQD_Open,  false);
   ArraySetAsSeries(CQD_High,  false);
   ArraySetAsSeries(CQD_Low,   false);
   ArraySetAsSeries(CQD_Close, false);
   ArraySetAsSeries(CQD_FractalUp,   false);
   ArraySetAsSeries(CQD_FractalDown, false);
   ArraySetAsSeries(CQD_DivVerdict,  false);   // [B6]

   ArraySetAsSeries(g_CqdATR, false);

   PlotIndexSetString(0, PLOT_LABEL, "CQD Open;CQD High;CQD Low;CQD Close");
   PlotIndexSetDouble(0, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   PlotIndexSetInteger(1, PLOT_ARROW, 217);
   PlotIndexSetInteger(1, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetDouble(1, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   PlotIndexSetInteger(2, PLOT_ARROW, 218);
   PlotIndexSetInteger(2, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetDouble(2, PLOT_EMPTY_VALUE, EMPTY_VALUE);

   string shortname = InpNoReset
                    ? "CQD Tick (No Reset)"
                    : "CQD Tick (" + EnumToString(InpResetPeriod) + " reset)";
   IndicatorSetString(INDICATOR_SHORTNAME, shortname);
   IndicatorSetInteger(INDICATOR_DIGITS, 0);

   g_PriceSource   = InpPriceSource;
   g_LastVerified  = SymbolPublishesRealLast();
   g_LastProbeDone = false;
   g_PeriodWarned  = false;

   if(InpPriceSource == CQD_PRICE_LAST)
     {
      if(g_LastVerified)
        {
         g_LastProbeDone = true;
         Print("SRJ CQD: price source LAST verified via SYMBOL_LAST on ", _Symbol, ".");
        }
      else
        {
         g_PriceSource = CQD_PRICE_BID;
         Print("SRJ CQD: SYMBOL_LAST is 0 on ", _Symbol,
               " - LAST unconfirmed, provisionally using BID pending tick-flag probe.");
        }
     }

   if(g_PriceSource != CQD_PRICE_BID)
      Print("SRJ CQD WARNING: classifying on ", EnumToString(g_PriceSource),
            ", not BID. This is an A/B configuration.");

   if(!InpNoReset)
     {
      datetime srv  = TimeCurrent();
      datetime gmt  = TimeGMT();
      double   off  = (double)((long)srv - (long)gmt) / 3600.0;

      string zone;
      if(MathAbs(off - 2.0) < 0.26)
         zone = "EET (GMT+2, winter)";
      else if(MathAbs(off - 3.0) < 0.26)
         zone = "EEST (GMT+3, summer)";
      else
         zone = "NON-STANDARD offset - verify the boundary manually";

      Print(StringFormat("SRJ CQD: reset boundaries use SERVER time. "
                         "Detected offset vs GMT = %+.1f h -> %s.", off, zone));
     }

   Print("SRJ Tick-Based CQD initialised - Reset: ",
         InpNoReset ? "None" : EnumToString(InpResetPeriod),
         ", Price source: ", EnumToString(g_PriceSource),
         " (requested ", EnumToString(InpPriceSource), ")",
         ", Zero-tick inherit: ", InpUseZeroTickRule ? "ON (full weight)" : "OFF");

   g_DivWindow = ChartWindowFind();
   g_canDraw   = (g_DivWindow >= 0);   // [H1]

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
   ArraySetAsSeries(open,  false);
   ArraySetAsSeries(high,  false);
   ArraySetAsSeries(low,   false);
   ArraySetAsSeries(close, false);

   if(rates_total <= 0)
      return(0);

   //--- [H1] HEADLESS FIX: do NOT return(0) when ChartWindowFind fails.
   //--- Set g_canDraw and let FinalizePass() run unconditionally.
   //--- Only object-drawing calls are skipped; the calculation proceeds.
   if(g_DivWindow < 0)
      g_DivWindow = ChartWindowFind();
   g_canDraw = (g_DivWindow >= 0);

   bool isFullRecalc = (prev_calculated == 0);

   EnsureBarStateArrays(rates_total, isFullRecalc);

   if(isFullRecalc)
     {
      g_DivPass++;
      ArrayResize(g_DivObjNames, 0);
      ArrayResize(g_DivObjTimes, 0);

      g_CumulativeDelta        = 0.0;
      g_LastTickMsc            = 0;
      g_LastMscCount           = 0;
      g_LastTickPrice          = 0.0;
      g_LastTickDirection      = 0;
      g_PrevBarIndex           = -1;
      g_LastResetPeriodStart   = 0;
      g_LastHoleLogged         = 0;
      g_LastScannedX2Time      = 0;
      g_LastScannedFractalTime = 0;
      g_LastATRBar             = -1;
      g_FillCursor             = -1;
      g_EpochRejects           = 0;
      g_HoleRejects            = 0;
      g_FillCount              = 0;
      g_EngineFrom             = 0;
      ArrayFree(g_CqdATR);

      ArrayInitialize(CQD_Open,  EMPTY_VALUE);
      ArrayInitialize(CQD_High,  EMPTY_VALUE);
      ArrayInitialize(CQD_Low,   EMPTY_VALUE);
      ArrayInitialize(CQD_Close, EMPTY_VALUE);
      ArrayInitialize(CQD_FractalUp,   EMPTY_VALUE);
      ArrayInitialize(CQD_FractalDown, EMPTY_VALUE);
      ArrayInitialize(CQD_DivVerdict,  EMPTY_VALUE);   // [B6]
     }
   else if(rates_total > prev_calculated)
     {
      int tailStart = prev_calculated;

      for(int i = tailStart; i < rates_total; i++)
        {
         CQD_Open[i]        = EMPTY_VALUE;
         CQD_High[i]        = EMPTY_VALUE;
         CQD_Low[i]         = EMPTY_VALUE;
         CQD_Close[i]       = EMPTY_VALUE;
         CQD_FractalUp[i]   = EMPTY_VALUE;
         CQD_FractalDown[i] = EMPTY_VALUE;
         CQD_DivVerdict[i]  = EMPTY_VALUE;   // [B6]
        }

      if(g_PrevBarIndex >= tailStart)
         g_PrevBarIndex = -1;

      if(g_LastATRBar >= tailStart)
         g_LastATRBar = tailStart - 1;

      if(g_FillCursor > tailStart)
         g_FillCursor = tailStart;
     }

   long from_msc;
   if(isFullRecalc)
     {
      from_msc = (long)time[0] * 1000;

      if(InpMaxBackfillDays > 0)
        {
         long cap_msc = ((long)TimeCurrent() - (long)InpMaxBackfillDays * 86400) * 1000;
         if(cap_msc > from_msc)
            from_msc = cap_msc;
        }
     }
   else
      from_msc = g_LastTickMsc;

   long to_msc = (long)TimeCurrent() * 1000 + 1000;

   if(from_msc >= to_msc)
     {
      FinalizePass(rates_total, time, high, low);
      return(rates_total);
     }

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
         Print("SRJ CQD: waiting on tick history sync (error ", err,
               ", CopyTicksRange returned in ",
               DoubleToString((double)(t_fetched - t_begin) / 1000.0, 1),
               " ms), will retry on next tick...");
         return(0);
        }
      FinalizePass(rates_total, time, high, low);
      return(rates_total);
     }

   ArraySetAsSeries(ticks, false);

   ProbeLastAvailability(ticks, copied);

   long resumeMsc    = g_LastTickMsc;
   int  resumeSkip   = g_LastMscCount;
   int  seenAtResume = 0;

   int barCursor = (g_PrevBarIndex > 0 && g_PrevBarIndex < rates_total) ? g_PrevBarIndex : 0;
   int processed = 0;
   int resets    = 0;

   for(int i = 0; i < copied; i++)
     {
      long tmsc = ticks[i].time_msc;

      if(tmsc < resumeMsc)
         continue;
      if(tmsc == resumeMsc && seenAtResume < resumeSkip)
        {
         seenAtResume++;
         continue;
        }

      if(tmsc == g_LastTickMsc)
         g_LastMscCount++;
      else
        {
         g_LastTickMsc  = tmsc;
         g_LastMscCount = 1;
        }

      double px = SelectTickPrice(ticks[i]);
      if(px <= 0.0)
         continue;

      datetime tt = ticks[i].time;
      while(barCursor > 0 && time[barCursor] > tt)
         barCursor--;
      while(barCursor + 1 < rates_total && time[barCursor + 1] <= tt)
         barCursor++;

      int barIndex = (time[barCursor] <= tt) ? barCursor : -1;

      if(!InpNoReset)
        {
         datetime periodStart = GetPeriodStart(tt, InpResetPeriod);

         if(g_LastResetPeriodStart != 0 && periodStart != g_LastResetPeriodStart)
           {
            g_CumulativeDelta = 0.0;
            g_LastTickDirection = 0;
            resets++;

            int bBoundary = BarIndexAt((datetime)periodStart, time, rates_total, barCursor);
            if(bBoundary >= 0)
              {
               g_EpochStart[bBoundary] = true;
               ReopenBarAtReset(bBoundary);
               g_BarEpoch[bBoundary]      = (long)periodStart;
               
               if(bBoundary < ArraySize(g_CarriedCount))
                  g_CarriedCount[bBoundary] = 1;
              }
           }

         g_LastResetPeriodStart = periodStart;
        }

      int    direction  = ClassifyTickDirection(px, g_LastTickPrice, g_LastTickDirection);
      double tickWeight = 1.0;
      double prevCQD    = g_CumulativeDelta;
      g_CumulativeDelta += direction * tickWeight;

      if(barIndex >= 0)
        {
         if(g_EngineFrom == 0)
           {
            g_EngineFrom = time[barIndex];
            g_EverBuilt  = true;
            EventKillTimer();
            if(GlobalVariableCheck("SRJ_CQD_RETRY_" + _Symbol))
               GlobalVariableDel("SRJ_CQD_RETRY_" + _Symbol);
           }
            
         UpdateCqdCandle(barIndex, prevCQD, g_CumulativeDelta);
         g_BarEpoch[barIndex] = InpNoReset ? 0 : (long)g_LastResetPeriodStart;
        }

      g_LastTickPrice = px;
      if(direction != 0)
         g_LastTickDirection = direction;
      processed++;
     }

   if(isFullRecalc)
     {
      ulong  t_end     = GetMicrosecondCount();
      double fetch_ms  = (double)(t_fetched - t_begin) / 1000.0;
      double loop_ms   = (double)(t_end - t_fetched)   / 1000.0;
      double total_ms  = fetch_ms + loop_ms;
      double span_days = (double)(to_msc - from_msc) / 86400000.0;
      double rate_kps  = (loop_ms > 0.0) ? ((double)processed / loop_ms) : 0.0;

      Print(StringFormat("SRJ CQD timing [full recalc] window=%.2f days, src=%s | "
                         "CopyTicksRange: %d ticks in %.1f ms | classify loop: %d ticks in %.1f ms "
                         "(%.1f k ticks/s) | total %.1f ms | resets=%d",
                         span_days, EnumToString(g_PriceSource),
                         copied, fetch_ms, processed, loop_ms, rate_kps, total_ms, resets));
                         
      Print("[SRJ CQD] tick depth: starts from ", TimeToString(g_EngineFrom), 
            " | Discontinuity hole rejections: ", g_HoleRejects);
     }

   //--- [H1] FinalizePass runs unconditionally, even when headless.
   //--- Inside, DrawDivergenceLine / ScanUnconfirmedDivergence skip
   //--- object operations via g_canDraw; the divergence detection
   //--- logic and buffer 6 writes proceed regardless.
   FinalizePass(rates_total, time, high, low);

   if(isFullRecalc)
      SweepStaleDivergenceLines();

   if(isFullRecalc)
      Print(StringFormat("SRJ CQD scan: epoch-guard rejections=%I64d, hole-guard rejections=%I64d, "
                         "tickless bars carried forward=%I64d.",
                         g_EpochRejects, g_HoleRejects, g_FillCount));

   return(rates_total);
  }

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
   if(reason == REASON_REMOVE || reason == REASON_CHARTCLOSE)
      if(GlobalVariableCheck("SRJ_CQD_RETRY_" + _Symbol))
         GlobalVariableDel("SRJ_CQD_RETRY_" + _Symbol);

   DeleteAllDivergenceLines();
   ObjectDelete(0, "SRJ_DIV_UNCONFIRMED");
   Print("SRJ Tick-Based CQD deinitialised (reason ", reason, ")");
  }
//+------------------------------------------------------------------+