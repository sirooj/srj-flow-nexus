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
#property indicator_buffers 12
#property indicator_plots   12
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
#property indicator_label7  "TH1"
#property indicator_type7   DRAW_LINE
#property indicator_color7  clrOrange
#property indicator_width7  1
#property indicator_label8  "TH2"
#property indicator_type8   DRAW_LINE
#property indicator_color8  clrOrange
#property indicator_width8  1
#property indicator_label9  "TH3"
#property indicator_type9   DRAW_LINE
#property indicator_color9  clrOrange
#property indicator_width9  1
#property indicator_label10  "TL1"
#property indicator_type10   DRAW_LINE
#property indicator_color10  clrOrange
#property indicator_width10  1
#property indicator_label11  "TL2"
#property indicator_type11   DRAW_LINE
#property indicator_color11  clrOrange
#property indicator_width11  1
#property indicator_label12  "TL3"
#property indicator_type12   DRAW_LINE
#property indicator_color12  clrOrange
#property indicator_width12  1

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
double BufTH1[];
double BufTH2[];
double BufTH3[];
double BufTL1[];
double BufTL2[];
double BufTL3[];

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
   SetIndexBuffer(6, BufTH1, INDICATOR_DATA);
   SetIndexBuffer(7, BufTH2, INDICATOR_DATA);
   SetIndexBuffer(8, BufTH3, INDICATOR_DATA);
   SetIndexBuffer(9, BufTL1, INDICATOR_DATA);
   SetIndexBuffer(10, BufTL2, INDICATOR_DATA);
   SetIndexBuffer(11, BufTL3, INDICATOR_DATA);
   ArraySetAsSeries(BufORH, true);
   ArraySetAsSeries(BufORL, true);
   ArraySetAsSeries(BufORT, true);
   ArraySetAsSeries(BufSigB, true);
   ArraySetAsSeries(BufSigS, true);
   ArraySetAsSeries(BufDone, true);
   ArraySetAsSeries(BufTH1, true);
   ArraySetAsSeries(BufTH2, true);
   ArraySetAsSeries(BufTH3, true);
   ArraySetAsSeries(BufTL1, true);
   ArraySetAsSeries(BufTL2, true);
   ArraySetAsSeries(BufTL3, true);
   PlotIndexSetInteger(3, PLOT_ARROW, 233);
   PlotIndexSetInteger(4, PLOT_ARROW, 234);
   PlotIndexSetInteger(5, PLOT_ARROW, 159);
   PlotIndexSetInteger(3, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetInteger(4, PLOT_ARROW_SHIFT, 0);
   PlotIndexSetInteger(5, PLOT_ARROW_SHIFT, 0);
   for(int p = 6; p < 12; p++)
      PlotIndexSetInteger(p, PLOT_LINE_STYLE, STYLE_DOT);
   for(int p = 0; p < 12; p++)
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
void HORC_Seg(const string name, datetime t1, double p1, datetime t2, double p2,
              color c, int width, int style)
  {
   if(ObjectFind(0, name) < 0)
     {
      ObjectCreate(0, name, OBJ_TREND, 0, t1, p1, t2, p2);
      ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, false);
      ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, name, OBJPROP_BACK, true);
     }
   else
     {
      ObjectMove(0, name, 0, t1, p1);
      ObjectMove(0, name, 1, t2, p2);
     }
   ObjectSetInteger(0, name, OBJPROP_COLOR, c);
   ObjectSetInteger(0, name, OBJPROP_WIDTH, width);
   ObjectSetInteger(0, name, OBJPROP_STYLE, style);
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
   HORC_TrimPrefix(HORC_PREFIX + "E");
   HORC_TrimPrefix(HORC_PREFIX + "G");
  }
//+------------------------------------------------------------------+
void HORC_OneTF(ENUM_TIMEFRAMES tf, bool yearly, const string tag)
  {
   double orh = 0.0, orl = 0.0;
   datetime pOpen = 0;
   if(yearly)
     {
      MqlDateTime nowS;
      TimeToStruct(iTime(_Symbol, PERIOD_CURRENT, 0), nowS);
      MqlDateTime yS;
      yS.year = nowS.year;
      yS.mon = 1;
      yS.day = 1;
      yS.hour = 0;
      yS.min = 0;
      yS.sec = 0;
      pOpen = StructToTime(yS);
      int mb = iBars(_Symbol, PERIOD_MN1);
      for(int s = 1; s < mb; s++)
        {
         MqlDateTime ms;
         TimeToStruct(iTime(_Symbol, PERIOD_MN1, s), ms);
         if(ms.year != nowS.year - 1)
            continue;
         double h = iHigh(_Symbol, PERIOD_MN1, s);
         double l = iLow(_Symbol, PERIOD_MN1, s);
         if(h > orh)
            orh = h;
         if(orl <= 0.0 || l < orl)
            orl = l;
        }
     }
   else
     {
      if(iBars(_Symbol, tf) < 2)
         return;
      orh = iHigh(_Symbol, tf, 1);
      orl = iLow(_Symbol, tf, 1);
      pOpen = iTime(_Symbol, tf, 0);
     }
   if(orh <= 0.0 || orl <= 0.0 || pOpen <= 0)
      return;
   int iBeg = iBarShift(_Symbol, PERIOD_CURRENT, pOpen, false);
   if(iBeg < 1)
      return;
   datetime tEnd = iTime(_Symbol, PERIOD_CURRENT, 0) + PeriodSeconds();
   string ot = IntegerToString((long)pOpen);
   HORC_Seg(HORC_PREFIX + tag + "H" + ot, pOpen, orh, tEnd, orh, clrDodgerBlue, 1, STYLE_SOLID);
   HORC_Seg(HORC_PREFIX + tag + "L" + ot, pOpen, orl, tEnd, orl, clrTomato, 1, STYLE_SOLID);
   double raid = InpRaidPoints * _Point;
   double off = 20 * _Point;
   int sig = 0, sigBar = -1;
   for(int i = iBeg; i >= 1; i--)
     {
      bool up = (iHigh(_Symbol, PERIOD_CURRENT, i) >= orh);
      bool dn = (iLow(_Symbol, PERIOD_CURRENT, i) <= orl);
      if(up && dn)
         continue;
      string nm = HORC_PREFIX + "T" + tag + ot;
      if(up)
        {
         HORC_Text(nm, iTime(_Symbol, PERIOD_CURRENT, i),
                   iLow(_Symbol, PERIOD_CURRENT, i) - 40 * _Point, tag + "+", clrLime);
         sig = 1;
         sigBar = i;
         break;
        }
      if(dn)
        {
         HORC_Text(nm, iTime(_Symbol, PERIOD_CURRENT, i),
                   iHigh(_Symbol, PERIOD_CURRENT, i) + 40 * _Point, tag + "-", clrRed);
         sig = -1;
         sigBar = i;
         break;
        }
     }
   if(sig == 0)
      return;
   double thi[3]; int thb[3]; int cnth = 0;
   double tlo[3]; int tlb[3]; int cntl = 0;
   for(int i = iBeg; i >= 1; i--)
     {
      double h = iHigh(_Symbol, PERIOD_CURRENT, i);
      double l = iLow(_Symbol, PERIOD_CURRENT, i);
      if(h >= orh + raid && cnth < 3 && (cnth == 0 || h >= thi[cnth - 1] + raid))
        {
         thi[cnth] = h;
         thb[cnth] = i;
         cnth++;
        }
      if(l <= orl - raid && cntl < 3 && (cntl == 0 || l <= tlo[cntl - 1] - raid))
        {
         tlo[cntl] = l;
         tlb[cntl] = i;
         cntl++;
        }
     }
   for(int t2 = 0; t2 < cnth; t2++)
      HORC_Seg(HORC_PREFIX + tag + "T" + IntegerToString(t2 + 1) + ot,
               iTime(_Symbol, PERIOD_CURRENT, thb[t2]), thi[t2], tEnd, thi[t2],
               clrOrange, 1, STYLE_DOT);
   for(int t2 = 0; t2 < cntl; t2++)
      HORC_Seg(HORC_PREFIX + tag + "S" + IntegerToString(t2 + 1) + ot,
               iTime(_Symbol, PERIOD_CURRENT, tlb[t2]), tlo[t2], tEnd, tlo[t2],
               clrOrange, 1, STYLE_DOT);
   string zname = HORC_PREFIX + tag + "Z" + ot;
   string ename = HORC_PREFIX + "E" + tag + ot;
   string gname = HORC_PREFIX + "G" + tag;
   double px = iClose(_Symbol, PERIOD_CURRENT, 1);
   if(sig == 1)
     {
      int leg1 = -1;
      for(int i = sigBar; i >= 1; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= orh + raid)
           {
            leg1 = i;
            break;
           }
      if(leg1 < 0)
         return;
      double ort = iHigh(_Symbol, PERIOD_CURRENT, leg1);
      HORC_Seg(HORC_PREFIX + tag + "O" + ot,
               iTime(_Symbol, PERIOD_CURRENT, leg1), ort, tEnd, ort, clrGold, 2, STYLE_SOLID);
      datetime t1 = iTime(_Symbol, PERIOD_CURRENT, leg1);
      bool used = false;
      for(int i = leg1; i >= 1; i--)
         if(iClose(_Symbol, PERIOD_CURRENT, i) > ort)
           {
            used = true;
            break;
           }
      string zt = "HORC passive demand [" + tag + "]";
      color zc = clrSteelBlue;
      if(used)
        {
         zt = "HORC passive demand [" + tag + "] | used";
         zc = clrDimGray;
        }
      HORC_Zone(zname, t1, orh, tEnd, ort, zc, zt);
      HORC_Text(ename, t1, orh, "ENTRY [" + tag + "]", clrAqua);
      double tgt = 0.0;
      for(int t2 = 0; t2 < cnth; t2++)
         if(thi[t2] > px && (tgt <= 0.0 || thi[t2] < tgt))
            tgt = thi[t2];
      if(tgt > 0.0)
         HORC_Text(gname, iTime(_Symbol, PERIOD_CURRENT, 1), tgt, "TARGET [" + tag + "]", clrOrange);
      else if(ObjectFind(0, gname) >= 0)
         ObjectDelete(0, gname);
      int leg2 = -1;
      for(int i = leg1; i >= 1; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= orl)
           {
            leg2 = i;
            break;
           }
      if(leg2 < 0)
         return;
      for(int i = leg2; i >= 1; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= ort)
           {
            HORC_Text(HORC_PREFIX + "C" + tag + ot, iTime(_Symbol, PERIOD_CURRENT, i),
                      iLow(_Symbol, PERIOD_CURRENT, i) - off, "ORT [" + tag + "]", clrWhite);
            break;
           }
     }
   else
     {
      int leg1 = -1;
      for(int i = sigBar; i >= 1; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= orl - raid)
           {
            leg1 = i;
            break;
           }
      if(leg1 < 0)
         return;
      double ort = iLow(_Symbol, PERIOD_CURRENT, leg1);
      HORC_Seg(HORC_PREFIX + tag + "O" + ot,
               iTime(_Symbol, PERIOD_CURRENT, leg1), ort, tEnd, ort, clrGold, 2, STYLE_SOLID);
      datetime t1 = iTime(_Symbol, PERIOD_CURRENT, leg1);
      bool used = false;
      for(int i = leg1; i >= 1; i--)
         if(iClose(_Symbol, PERIOD_CURRENT, i) < ort)
           {
            used = true;
            break;
           }
      string zt = "HORC passive supply [" + tag + "]";
      color zc = clrMaroon;
      if(used)
        {
         zt = "HORC passive supply [" + tag + "] | used";
         zc = clrDimGray;
        }
      HORC_Zone(zname, t1, ort, tEnd, orl, zc, zt);
      HORC_Text(ename, t1, orl, "ENTRY [" + tag + "]", clrAqua);
      double tgt = 0.0;
      for(int t2 = 0; t2 < cntl; t2++)
         if(tlo[t2] < px && (tgt <= 0.0 || tlo[t2] > tgt))
            tgt = tlo[t2];
      if(tgt > 0.0)
         HORC_Text(gname, iTime(_Symbol, PERIOD_CURRENT, 1), tgt, "TARGET [" + tag + "]", clrOrange);
      else if(ObjectFind(0, gname) >= 0)
         ObjectDelete(0, gname);
      int leg2 = -1;
      for(int i = leg1; i >= 1; i--)
         if(iHigh(_Symbol, PERIOD_CURRENT, i) >= orh)
           {
            leg2 = i;
            break;
           }
      if(leg2 < 0)
         return;
      for(int i = leg2; i >= 1; i--)
         if(iLow(_Symbol, PERIOD_CURRENT, i) <= ort)
           {
            HORC_Text(HORC_PREFIX + "C" + tag + ot, iTime(_Symbol, PERIOD_CURRENT, i),
                      iHigh(_Symbol, PERIOD_CURRENT, i) + off, "ORT [" + tag + "]", clrWhite);
            break;
           }
     }
  }
//+------------------------------------------------------------------+
void HORC_AllTF()
  {
   HORC_OneTF(PERIOD_MN1, true, "Y");
   HORC_OneTF(PERIOD_MN1, false, "M");
   HORC_OneTF(PERIOD_W1, false, "W");
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
   double thi[3]; int thb[3]; int cnth = 0;
   double tlo[3]; int tlb[3]; int cntl = 0;
   for(int i = iBeg; i >= lo; i--)
     {
      double h = iHigh(_Symbol, PERIOD_CURRENT, i);
      double l = iLow(_Symbol, PERIOD_CURRENT, i);
      if(h >= orh + raid && cnth < 3 && (cnth == 0 || h >= thi[cnth - 1] + raid))
        {
         thi[cnth] = h;
         thb[cnth] = i;
         cnth++;
        }
      if(l <= orl - raid && cntl < 3 && (cntl == 0 || l <= tlo[cntl - 1] - raid))
        {
         tlo[cntl] = l;
         tlb[cntl] = i;
         cntl++;
        }
     }
   if(cnth > 0)
      HORC_Fill(BufTH1, thb[0], iEnd, thi[0]);
   if(cnth > 1)
      HORC_Fill(BufTH2, thb[1], iEnd, thi[1]);
   if(cnth > 2)
      HORC_Fill(BufTH3, thb[2], iEnd, thi[2]);
   if(cntl > 0)
      HORC_Fill(BufTL1, tlb[0], iEnd, tlo[0]);
   if(cntl > 1)
      HORC_Fill(BufTL2, tlb[1], iEnd, tlo[1]);
   if(cntl > 2)
      HORC_Fill(BufTL3, tlb[2], iEnd, tlo[2]);
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
      HORC_Text(HORC_PREFIX + "E" + IntegerToString((long)pOpen), t1, orh, "ENTRY", clrAqua);
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
      if(sig == 1 && cnth > 0)
        {
         double tgt = 0.0;
         double px = iClose(_Symbol, PERIOD_CURRENT, (iEnd > 1 ? iEnd : 1));
         for(int t2 = 0; t2 < cnth; t2++)
            if(thi[t2] > px && (tgt <= 0.0 || thi[t2] < tgt))
               tgt = thi[t2];
         string gname = HORC_PREFIX + "G" + IntegerToString((long)pOpen);
         if(tgt > 0.0)
            HORC_Text(gname, iTime(_Symbol, PERIOD_CURRENT, (iEnd > 1 ? iEnd : 1)), tgt, "TARGET", clrOrange);
         else if(ObjectFind(0, gname) >= 0)
            ObjectDelete(0, gname);
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
      HORC_Text(HORC_PREFIX + "E" + IntegerToString((long)pOpen), t1, orl, "ENTRY", clrAqua);
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
      if(sig == -1 && cntl > 0)
        {
         double tgt = 0.0;
         double px = iClose(_Symbol, PERIOD_CURRENT, (iEnd > 1 ? iEnd : 1));
         for(int t2 = 0; t2 < cntl; t2++)
            if(tlo[t2] < px && (tgt <= 0.0 || tlo[t2] > tgt))
               tgt = tlo[t2];
         string gname = HORC_PREFIX + "G" + IntegerToString((long)pOpen);
         if(tgt > 0.0)
            HORC_Text(gname, iTime(_Symbol, PERIOD_CURRENT, (iEnd > 1 ? iEnd : 1)), tgt, "TARGET", clrOrange);
         else if(ObjectFind(0, gname) >= 0)
            ObjectDelete(0, gname);
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
   ArrayInitialize(BufTH1, 0.0);
   ArrayInitialize(BufTH2, 0.0);
   ArrayInitialize(BufTH3, 0.0);
   ArrayInitialize(BufTL1, 0.0);
   ArrayInitialize(BufTL2, 0.0);
   ArrayInitialize(BufTL3, 0.0);
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
      HORC_AllTF();
     }
   else
     {
      HORC_ProcessPeriod(0);
      HORC_TrimZones();
      HORC_AllTF();
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
