//+------------------------------------------------------------------+
//| HORC_OpeningRange.mq5                                            |
//| Hendray Opening Range Concept - alert-only drawing indicator      |
//| Status UNRULED 2026-09-30 (books uncorrected; not his strategy). |
//| Draws per reference period: ORH/ORL, touch-first signal, 3-move   |
//| cycle legs, ORT = leg-1 raid extreme (vault finding 07), passive  |
//| zones + used marks. Session opens + opposition logics deferred    |
//| to v2 (need DST tables + indicator legs). NO trading calls.      |
//+------------------------------------------------------------------+
#property copyright "HORC lane, alert-only"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   6
#property indicator_label1  "ORH"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrDodgerBlue
#property indicator_width1  1
#property indicator_label2  "ORL"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrTomato
#property indicator_width2  1
#property indicator_label3  "ORT"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrGold
#property indicator_width3  2
#property indicator_label4  "SigBuy"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrLime
#property indicator_width4  2
#property indicator_label5  "SigSell"
#property indicator_type5   DRAW_ARROW
#property indicator_color5  clrRed
#property indicator_width5  2
#property indicator_label6  "Done"
#property indicator_type6   DRAW_ARROW
#property indicator_color6  clrWhite
#property indicator_width6  2

enum HORC_RefPeriod
  {
   HORC_DAY   = 0,
   HORC_WEEK  = 1,
   HORC_MONTH = 2
  };

input HORC_RefPeriod InpRef        = HORC_DAY;   // Reference period
input int            InpRaidPoints = 10;          // Raid exceedance, points
input int            InpMaxZones   = 5;           // Max zone boxes kept
input bool           InpAlerts     = true;        // Alerts on signal/done/used
input bool           InpShowZones  = true;        // Draw passive zones

double BufORH[];
double BufORL[];
double BufORT[];
double BufSigB[];
double BufSigS[];
double BufDone[];

string HORC_PREFIX = "HORC_";
datetime HORC_NewClosed = 0;
bool HORC_Live = false;
//+------------------------------------------------------------------+
ENUM_TIMEFRAMES HORC_RefTF()
  {
   if(InpRef == HORC_WEEK)
      return(PERIOD_W1);
   if(InpRef == HORC_MONTH)
      return(PERIOD_MN1);
   return(PERIOD_D1);
  }
//+------------------------------------------------------------------+
int OnInit()
  {
   ENUM_TIMEFRAMES tf = HORC_RefTF();
   if(PeriodSeconds() >= PeriodSeconds(tf))
     {
      Comment("HORC: attach to a lower timeframe than the reference period.");
      return(INIT_FAILED);
     }
   SetIndexBuffer(0, BufORH, INDICATOR_DATA);
   SetIndexBuffer(1, BufORL, INDICATOR_DATA);
   SetIndexBuffer(2, BufORT, INDICATOR_DATA);
   SetIndexBuffer(3, BufSigB, INDICATOR_DATA);
   SetIndexBuffer(4, BufSigS, INDICATOR_DATA);
   SetIndexBuffer(5, BufDone, INDICATOR_DATA);
   ArraySetAsSeries(BufORH, true);
   ArraySetAsSeries(BufORL, true);
   ArraySetAsSeries(BufORT, true);
   ArraySetAsSeries(BufSigB, true);
   ArraySetAsSeries(BufSigS, true);
   ArraySetAsSeries(BufDone, true);
   PlotIndexSetInteger(3, PLOT_ARROW, 233);
   PlotIndexSetInteger(4, PLOT_ARROW, 234);
   PlotIndexSetInteger(5, PLOT_ARROW, 159);
   PlotIndexSetInteger(3, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetInteger(4, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetInteger(5, PLOT_ARROW_SHIFT, 0);
   for(int p = 0; p < 6; p++)
      PlotIndexSetDouble(p, PLOT_EMPTY_VALUE, 0.0);
   IndicatorSetString(INDICATOR_SHORTNAME, "HORC Opening Range");
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0, HORC_PREFIX);
   Comment("");
  }
//+------------------------------------------------------------------+
void HORC_Fill(double &b[], int iBeg, int iEnd, double v)
  {
   for(int i = iBeg; i >= iEnd; i--)
      b[i] = v;
  }
//+------------------------------------------------------------------+
void HORC_Fire(const string text, int bar)
  {
   if(!InpAlerts || !HORC_Live)
      return;
   if(bar < 0)
      return;
   if(iTime(_Symbol, PERIOD_CURRENT, bar) != HORC_NewClosed)
      return;
   Alert("HORC ", _Symbol, " ", EnumToString(Period()), " ",
         TimeToString(HORC_NewClosed, TIME_DATE | TIME_MINUTES), " ", text);
  }
//+------------------------------------------------------------------+
void HORC_Zone(const string name, datetime t1, double p1, datetime t2, double p2,
               color c, const string text)
  {
   if(!InpShowZones)
      return;
   if(ObjectFind(0, name) < 0)
     {
      ObjectCreate(0, name, OBJ_RECTANGLE, 0, t1, p1, t2, p2);
      ObjectSetInteger(0, name, OBJPROP_FILL, true);
      ObjectSetInteger(0, name, OBJPROP_BACK, true);
      ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
     }
   else
      ObjectMove(0, name, 1, t2, p2);
   ObjectSetInteger(0, name, OBJPROP_COLOR, c);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetString(0, name, OBJPROP_TOOLTIP, text);
  }
//+------------------------------------------------------------------+
void HORC_Text(const string name, datetime t, double p, const string text, color c)
  {
   if(ObjectFind(0, name) < 0)
     {
      ObjectCreate(0, name, OBJ_TEXT, 0, t, p);
      ObjectSetInteger(0, name, OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, name, OBJPROP_BACK, false);
     }
   ObjectSetInteger(0, name, OBJPROP_COLOR, c);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetString(0, name, OBJPROP_TOOLTIP, text);
  }
//+------------------------------------------------------------------+
void HORC_TrimPrefix(string prefix)
  {
   string names[];
   int n = 0;
   int total = ObjectsTotal(0);
   for(int i = 0; i < total; i++)
     {
      string nm = ObjectName(0, i);
      if(StringFind(nm, prefix, 0) == 0)
        {
         ArrayResize(names, n + 1);
         names[n] = nm;
         n++;
        }
     }
   while(n > InpMaxZones)
     {
      int oldest = 0;
      for(int i = 1; i < n; i++)
         if(StringCompare(names[i], names[oldest]) < 0)
            oldest = i;
      ObjectDelete(0, names[oldest]);
      names[oldest] = names[n - 1];
      n--;
     }
  }
//+------------------------------------------------------------------+
void HORC_TrimZones()
  {
   HORC_TrimPrefix(HORC_PREFIX + "Z");
   HORC_TrimPrefix(HORC_PREFIX + "R");
  }
//+------------------------------------------------------------------+
void HORC_ProcessPeriod(int k)
  {
   ENUM_TIMEFRAMES tf = HORC_RefTF();
   int refBars = iBars(_Symbol, tf);
   if(k + 1 >= refBars)
      return;
   double orh = iHigh(_Symbol, tf, k + 1);
   double orl = iLow(_Symbol, tf, k + 1);
   if(orh <= 0.0 || orl <= 0.0)
      return;
   datetime pOpen = iTime(_Symbol, tf, k);
   int iBeg = iBarShift(_Symbol, PERIOD_CURRENT, pOpen, false);
   if(iBeg < 0)
      return;
   int iEnd = 0;
   datetime tEnd = iTime(_Symbol, PERIOD_CURRENT, 0) + 2 * PeriodSeconds();
   if(k > 0)
     {
      datetime pNext = iTime(_Symbol, tf, k - 1);
      int j = iBarShift(_Symbol, PERIOD_CURRENT, pNext, false);
      if(j < 0)
         return;
      iEnd = j + 1;
      tEnd = pNext;
     }
   if(iBeg < iEnd)
      return;
   HORC_Fill(BufORH, iBeg, iEnd, orh);
   HORC_Fill(BufORL, iBeg, iEnd, orl);
   string rname = HORC_PREFIX + "R" + IntegerToString((long)pOpen);
   if(ObjectFind(0, rname) < 0)
     {
      ObjectCreate(0, rname, OBJ_RECTANGLE, 0, pOpen, orl, tEnd, orh);
      ObjectSetInteger(0, rname, OBJPROP_FILL, true);
      ObjectSetInteger(0, rname, OBJPROP_BACK, true);
      ObjectSetInteger(0, rname, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, rname, OBJPROP_COLOR, clrSlateGray);
      ObjectSetString(0, rname, OBJPROP_TEXT, "HORC day range");
      ObjectSetString(0, rname, OBJPROP_TOOLTIP, "HORC day range");
     }
   else
      ObjectMove(0, rname, 1, tEnd, orh);
   int lo = (iEnd > 1 ? iEnd : 1);
   double raid = InpRaidPoints * _Point;
   double off = 20 * _Point;
   int sig = 0, sigBar = -1;
   for(int i = iBeg; i >= lo; i--)
     {
      bool up = (iHigh(_Symbol, PERIOD_CURRENT, i) >= orh);
      bool dn = (iLow(_Symbol, PERIOD_CURRENT, i) <= orl);
      if(up && dn)
         continue;
      if(up)
        {
         sig = 1;
         sigBar = i;
         break;
        }
      if(dn)
        {
         sig = -1;
         sigBar = i;
         break;
        }
     }
   if(sig == 0)
      return;
   string zname = HORC_PREFIX + "Z" + IntegerToString((long)pOpen);
   if(sig == 1)
     {
      BufSigB[sigBar] = iLow(_Symbol, PERIOD_CURRENT, sigBar) - off;
      HORC_Fire("buyer signal", sigBar);
      HORC_Text(HORC_PREFIX + "D" + IntegerToString((long)pOpen),
                iTime(_Symbol, PERIOD_CURRENT, sigBar),
                iLow(_Symbol, PERIOD_CURRENT, sigBar) - 2 * off, "D+", clrLime);
      int leg1 = -1;
      for(int i = sigBar; i >= lo; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= orh + raid)
           {
            leg1 = i;
            break;
           }
      if(leg1 < 0)
         return;
      double ort = iHigh(_Symbol, PERIOD_CURRENT, leg1);
      HORC_Fill(BufORT, leg1, iEnd, ort);
      datetime t1 = iTime(_Symbol, PERIOD_CURRENT, leg1);
      bool used = false;
      for(int i = leg1; i >= lo; i--)
         if(iClose(_Symbol, PERIOD_CURRENT, i) > ort)
           {
            used = true;
            break;
           }
      string zt = "HORC passive demand";
      color zc = clrSteelBlue;
      if(used)
        {
         zt = "HORC passive demand | used";
         zc = clrDimGray;
         HORC_Fire("demand zone used", leg1);
        }
      HORC_Zone(zname, t1, orh, tEnd, ort, zc, zt);
      int leg2 = -1;
      for(int i = leg1; i >= lo; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= orl)
           {
            leg2 = i;
            break;
           }
      if(leg2 < 0)
         return;
      for(int i = leg2; i >= lo; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= ort)
           {
            BufDone[i] = iLow(_Symbol, PERIOD_CURRENT, i) - off;
            HORC_Fire("cycle complete at ORT", i);
            break;
           }
     }
   else
     {
      BufSigS[sigBar] = iHigh(_Symbol, PERIOD_CURRENT, sigBar) + off;
      HORC_Fire("seller signal", sigBar);
      HORC_Text(HORC_PREFIX + "D" + IntegerToString((long)pOpen),
                iTime(_Symbol, PERIOD_CURRENT, sigBar),
                iHigh(_Symbol, PERIOD_CURRENT, sigBar) + 2 * off, "D-", clrRed);
      int leg1 = -1;
      for(int i = sigBar; i >= lo; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= orl - raid)
           {
            leg1 = i;
            break;
           }
      if(leg1 < 0)
         return;
      double ort = iLow(_Symbol, PERIOD_CURRENT, leg1);
      HORC_Fill(BufORT, leg1, iEnd, ort);
      datetime t1 = iTime(_Symbol, PERIOD_CURRENT, leg1);
      bool used = false;
      for(int i = leg1; i >= lo; i--)
         if(iClose(_Symbol, PERIOD_CURRENT, i) < ort)
           {
            used = true;
            break;
           }
      string zt = "HORC passive supply";
      color zc = clrMaroon;
      if(used)
        {
         zt = "HORC passive supply | used";
         zc = clrDimGray;
         HORC_Fire("supply zone used", leg1);
        }
      HORC_Zone(zname, t1, ort, tEnd, orl, zc, zt);
      int leg2 = -1;
      for(int i = leg1; i >= lo; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= orh)
           {
            leg2 = i;
            break;
           }
      if(leg2 < 0)
         return;
      for(int i = leg2; i >= lo; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= ort)
           {
            BufDone[i] = iHigh(_Symbol, PERIOD_CURRENT, i) + off;
            HORC_Fire("cycle complete at ORT", i);
            break;
           }
     }
  }
//+------------------------------------------------------------------+
void HORC_FullRebuild()
  {
   ArrayInitialize(BufORH, 0.0);
   ArrayInitialize(BufORL, 0.0);
   ArrayInitialize(BufORT, 0.0);
   ArrayInitialize(BufSigB, 0.0);
   ArrayInitialize(BufSigS, 0.0);
   ArrayInitialize(BufDone, 0.0);
   ObjectsDeleteAll(0, HORC_PREFIX);
   ENUM_TIMEFRAMES tf = HORC_RefTF();
   int refBars = iBars(_Symbol, tf);
   for(int k = refBars - 2; k >= 0; k--)
      HORC_ProcessPeriod(k);
   HORC_TrimZones();
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
   static datetime sBuilt = 0;
   ENUM_TIMEFRAMES tf = HORC_RefTF();
   datetime cur = iTime(_Symbol, tf, 0);
   HORC_NewClosed = iTime(_Symbol, PERIOD_CURRENT, 1);
   HORC_Live = (prev_calculated > 0);
   if(prev_calculated == 0 || cur != sBuilt)
     {
      HORC_FullRebuild();
      sBuilt = cur;
      HORC_TrimZones();
     }
   else
     {
      HORC_ProcessPeriod(0);
      HORC_TrimZones();
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
