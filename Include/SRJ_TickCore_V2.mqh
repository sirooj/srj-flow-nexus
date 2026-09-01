//+------------------------------------------------------------------+
//|                          SRJ_TickCore.mqh                        |
//|   Shared tick-based volume-profile core (VWAP + Developing POC)  |
//|                                                                  |
//|   v2.0 rewrite. Same maths, restructured:                        |
//|     * SnapshotPoc is now O(1). The old full-histogram scan ran   |
//|       once per bar per slot and once per slot per live tick; on   |
//|       Gold at 0.1 "pips" that is ~200k array reads each time,    |
//|       which was the real cost of a cold attach, not the fetch.   |
//|       Bin volume only ever increases, so the argmax can be       |
//|       maintained incrementally. Tie behaviour is preserved       |
//|       (lowest bin index, i.e. lowest price, wins).               |
//|     * CTickCursor owns ALL CopyTicksRange calls: day-chunked,    |
//|       error-aware, same-millisecond dedup, no overflow re-fetch  |
//|       hack. The three drifted copies of that loop are gone.      |
//|     * CopyTicksRange returning -1 is now a distinct outcome the  |
//|       host can retry on, instead of being silently folded as an  |
//|       empty day and written to the buffers as a permanent zero.  |
//|     * Bin size lives in PocAccum, so each anchor can size its    |
//|       own histogram. A hard bin cap prevents unbounded growth.   |
//|     * Anchor calendar math is DST-safe and honours an optional   |
//|       session open expressed in a named time zone.               |
//|     * Weighting is explicit. No silent "volume if present, else  |
//|       1.0" mixing of quoted size with tick counts.               |
//|                                                                  |
//|   Owns ZERO chart objects. Library only - MetaEditor will report |
//|   "event handling function not found" if compiled directly.      |
//+------------------------------------------------------------------+
#ifndef __SRJ_TICKCORE_MQH__
#define __SRJ_TICKCORE_MQH__

//==================================================================
//  Enums. Ordinals are preserved where a v1 .set file could carry
//  them, so existing presets still load.
//==================================================================
enum ENUM_ANCHOR
  {
   ANCHOR_DAILY     = 0,
   ANCHOR_WEEKLY    = 1,
   ANCHOR_MONTHLY   = 2,
   ANCHOR_QUARTERLY = 3,
   ANCHOR_YEARLY    = 4,
   ANCHOR_MANUAL    = 5
  };

enum ENUM_PRICE_SRC
  {
   SRC_AUTO = 0,   // last if the symbol publishes one, else mid
   SRC_BID  = 1,   // bid only - the series MT5 draws candles from
   SRC_MID  = 2    // (bid+ask)/2
  };

enum ENUM_WEIGHT_MODE
  {
   WEIGHT_TICKCOUNT = 0,   // one unit per usable tick (correct default on spot FX/CFD)
   WEIGHT_VOLUME    = 1    // quoted / real size per tick
  };

enum ENUM_TZ_ID
  {
   TZ_SERVER  = 0,
   TZ_UTC     = 1,
   TZ_NEWYORK = 2,
   TZ_LONDON  = 3
  };

enum ENUM_DST_RULE
  {
   DST_NONE = 0,
   DST_US   = 1,
   DST_EU   = 2
  };

//==================================================================
//  Shared configuration. The host writes these once in OnInit.
//  File-scope so the fold helpers stay allocation-free.
//
//  NOTE: these are per-indicator-instance, NOT shared between
//  separately compiled indicators. Including this header does not
//  deduplicate work across the suite.
//==================================================================
ENUM_PRICE_SRC    gtc_priceSrc      = SRC_BID;
ENUM_WEIGHT_MODE  gtc_weightMode    = WEIGHT_TICKCOUNT;
int               gtc_maxBackfill   = 0;        // per-chunk tick cap. 0 = unlimited
bool              gtc_useTickFlags  = true;     // skip ticks that did not move the selected side

bool              gtc_useSessionHour = false;   // anchor periods to a session open
int               gtc_sessionHour    = 17;
int               gtc_sessionMin     = 0;
ENUM_TZ_ID        gtc_sessionZone    = TZ_NEWYORK;

ENUM_DST_RULE     gtc_serverDst      = DST_EU;  // how the broker clock shifts
int               gtc_serverGmtBase  = 7200;    // server standard-time offset, seconds

//--- Histogram limits. 2^20 bins at 8 bytes is 8 MB worst case per slot.
#define TC_POC_MAX_BINS     1048576
#define TC_POC_SEED_BINS    8192
#define TC_POC_GROW_BLOCK   4096
#define TC_POC_MAX_SLICES   4096

//==================================================================
//  Calendar helpers
//==================================================================
int TC_DaysInMonth(const int year,const int mon)
  {
   switch(mon)
     {
      case 1: case 3: case 5: case 7: case 8: case 10: case 12: return 31;
      case 4: case 6: case 9: case 11:                          return 30;
      case 2:
        {
         bool leap = ((year%4==0 && year%100!=0) || (year%400==0));
         return leap ? 29 : 28;
        }
     }
   return 30;
  }

datetime TC_MakeTime(const int year,const int mon,const int day,
                     const int hour=0,const int min=0,const int sec=0)
  {
   MqlDateTime d;
   d.year = year; d.mon = mon; d.day = day;
   d.hour = hour; d.min = min; d.sec = sec;
   d.day_of_week = 0; d.day_of_year = 0;
   return StructToTime(d);
  }

datetime TC_DayStart(const datetime t)
  {
   MqlDateTime d; TimeToStruct(t,d);
   return TC_MakeTime(d.year,d.mon,d.day,0,0,0);
  }

int TC_Dow(const datetime t)
  {
   MqlDateTime d; TimeToStruct(t,d);
   return d.day_of_week;                 // 0 = Sunday
  }

//------------------------------------------------------------------
//  Calendar-safe day shift on a midnight boundary.
//
//  Plain arithmetic (t - dow*86400) lands on 23:00 or 01:00 on a
//  server clock that observes DST, which silently moved the weekly
//  anchor by an hour twice a year. Adding 12h before re-flooring
//  keeps a +/-1h skew from ever crossing a day boundary.
//------------------------------------------------------------------
datetime TC_ShiftDayStart(const datetime dayStart,const int days)
  {
   datetime approx = (datetime)((long)dayStart + (long)days*86400 + 43200);
   return TC_DayStart(approx);
  }

datetime TC_NthSunday(const int year,const int mon,const int nth,const int hour)
  {
   datetime first = TC_MakeTime(year,mon,1,hour);
   int dow  = TC_Dow(first);
   int day  = 1 + ((7 - dow) % 7) + (nth-1)*7;
   int dim  = TC_DaysInMonth(year,mon);
   if(day > dim) day -= 7;
   return TC_MakeTime(year,mon,day,hour);
  }

datetime TC_LastSunday(const int year,const int mon,const int hour)
  {
   int dim = TC_DaysInMonth(year,mon);
   datetime last = TC_MakeTime(year,mon,dim,hour);
   int dow = TC_Dow(last);
   return TC_MakeTime(year,mon,dim-dow,hour);
  }

//------------------------------------------------------------------
//  Is DST in force at this wall-clock instant under the given rule?
//
//  Evaluated on the naive local timestamp. The EU rule is defined
//  in UTC, so the boundary can be read one hour early or late for
//  the couple of hours around the switch. Bounded and documented
//  rather than pretended away.
//------------------------------------------------------------------
bool TC_DstActive(const datetime naive,const ENUM_DST_RULE rule)
  {
   if(rule == DST_NONE) return false;

   MqlDateTime d; TimeToStruct(naive,d);

   if(rule == DST_US)
     {
      datetime s = TC_NthSunday(d.year,3,2,2);    // 2nd Sun Mar 02:00
      datetime e = TC_NthSunday(d.year,11,1,2);   // 1st Sun Nov 02:00
      return (naive >= s && naive < e);
     }

   datetime s = TC_LastSunday(d.year,3,1);        // last Sun Mar 01:00
   datetime e = TC_LastSunday(d.year,10,1);       // last Sun Oct 01:00
   return (naive >= s && naive < e);
  }

void TC_ZoneRule(const ENUM_TZ_ID zone,int &baseSecs,ENUM_DST_RULE &rule)
  {
   switch(zone)
     {
      case TZ_UTC:     baseSecs = 0;        rule = DST_NONE; break;
      case TZ_NEWYORK: baseSecs = -5*3600;  rule = DST_US;   break;
      case TZ_LONDON:  baseSecs = 0;        rule = DST_EU;   break;
      default:         baseSecs = gtc_serverGmtBase; rule = gtc_serverDst; break;
     }
  }

//--- Wall clock in a named zone -> GMT.
datetime TC_ZoneToGmt(const datetime wall,const ENUM_TZ_ID zone)
  {
   int base; ENUM_DST_RULE rule;
   TC_ZoneRule(zone,base,rule);
   long off = (long)base + (TC_DstActive(wall,rule) ? 3600 : 0);
   return (datetime)((long)wall - off);
  }

//--- GMT -> broker server clock.
datetime TC_GmtToServer(const datetime gmt)
  {
   datetime probe = (datetime)((long)gmt + (long)gtc_serverGmtBase);
   long off = (long)gtc_serverGmtBase + (TC_DstActive(probe,gtc_serverDst) ? 3600 : 0);
   return (datetime)((long)gmt + off);
  }

datetime TC_ZoneToServer(const datetime wall,const ENUM_TZ_ID zone)
  {
   if(zone == TZ_SERVER) return wall;
   return TC_GmtToServer(TC_ZoneToGmt(wall,zone));
  }

//------------------------------------------------------------------
//  Best-effort detection of the broker's standard-time offset.
//  Current DST is backed out, then the result is snapped to the
//  nearest quarter hour. The host may override it with an input.
//------------------------------------------------------------------
void TC_DetectServerOffset()
  {
   datetime srv = TimeCurrent();
   datetime gmt = TimeGMT();
   if(srv <= 0 || gmt <= 0) return;

   long cur = (long)srv - (long)gmt;
   if(TC_DstActive(srv,gtc_serverDst)) cur -= 3600;
   gtc_serverGmtBase = (int)(MathRound((double)cur / 900.0) * 900.0);
  }

//------------------------------------------------------------------
//  Seconds-of-day the session opens at, in SERVER time, valid for
//  the calendar day containing t. Recomputed per call because the
//  server hour of a fixed New York open moves with DST.
//------------------------------------------------------------------
int TC_SessionShiftAt(const datetime t)
  {
   if(!gtc_useSessionHour) return 0;

   int hhmm = gtc_sessionHour*3600 + gtc_sessionMin*60;
   if(gtc_sessionZone == TZ_SERVER) return hhmm;

   datetime wall = (datetime)((long)TC_DayStart(t) + (long)hhmm);
   datetime srv  = TC_ZoneToServer(wall,gtc_sessionZone);
   MqlDateTime s; TimeToStruct(srv,s);
   return s.hour*3600 + s.min*60 + s.sec;
  }

string TC_AnchorName(const ENUM_ANCHOR type)
  {
   switch(type)
     {
      case ANCHOR_DAILY:     return "Daily";
      case ANCHOR_WEEKLY:    return "Weekly";
      case ANCHOR_MONTHLY:   return "Monthly";
      case ANCHOR_QUARTERLY: return "Quarterly";
      case ANCHOR_YEARLY:    return "Yearly";
      case ANCHOR_MANUAL:    return "Manual/Event";
     }
   return "Dev";
  }

//------------------------------------------------------------------
//  Start of the anchor period containing t, in server time.
//
//  The session offset is subtracted BEFORE the calendar math and
//  added back after, so one code path covers all five periods: a
//  timestamp at 16:00 with a 17:00 open belongs to the previous
//  trading day, week, month and year alike.
//------------------------------------------------------------------
datetime AnchorStartFor(const datetime t,const ENUM_ANCHOR type)
  {
   if(type == ANCHOR_MANUAL) return t;      // host resolves event anchors

   int shift = TC_SessionShiftAt(t);
   datetime eff = (datetime)((long)t - (long)shift);

   MqlDateTime d; TimeToStruct(eff,d);
   datetime base = eff;

   switch(type)
     {
      case ANCHOR_DAILY:
         base = TC_DayStart(eff);
         break;

      case ANCHOR_WEEKLY:
        {
         datetime ds = TC_DayStart(eff);
         int dow = TC_Dow(ds);                       // 0 = Sunday = FX week open
         base = (dow > 0) ? TC_ShiftDayStart(ds,-dow) : ds;
         break;
        }

      case ANCHOR_MONTHLY:
         base = TC_MakeTime(d.year,d.mon,1);
         break;

      case ANCHOR_QUARTERLY:
         base = TC_MakeTime(d.year,((d.mon-1)/3)*3+1,1);
         break;

      case ANCHOR_YEARLY:
         base = TC_MakeTime(d.year,1,1);
         break;
     }

   return (datetime)((long)base + (long)shift);
  }

//==================================================================
//  Bar-history backfill nudge
//==================================================================
bool TC_EnsureBarHistory(const datetime from_time)
  {
   datetime firstAvail = (datetime)SeriesInfoInteger(_Symbol,_Period,SERIES_TERMINAL_FIRSTDATE);
   if(firstAvail <= 0 || firstAvail > from_time)
     {
      MqlRates tmp[];
      CopyRates(_Symbol,_Period,from_time,TimeCurrent(),tmp);   // triggers backfill
      return false;
     }
   return true;
  }

//==================================================================
//  Tick price / weight selection
//==================================================================
double TC_TickPrice(const MqlTick &t)
  {
   switch(gtc_priceSrc)
     {
      case SRC_BID:
         return (t.bid > 0.0) ? t.bid : 0.0;

      case SRC_MID:
         if(t.bid > 0.0 && t.ask > 0.0) return (t.bid + t.ask) * 0.5;
         return (t.bid > 0.0) ? t.bid : 0.0;

      default:
         if(t.last > 0.0) return t.last;
         if(t.bid > 0.0 && t.ask > 0.0) return (t.bid + t.ask) * 0.5;
         return (t.bid > 0.0) ? t.bid : 0.0;
     }
  }

//------------------------------------------------------------------
//  Did this tick actually move the side we classify on?
//
//  Under SRC_BID an ask-only revision re-folds an unchanged bid and
//  its size a second time. flags == 0 means the record predates
//  flag population, so it is accepted rather than discarded.
//------------------------------------------------------------------
bool TC_TickUsable(const MqlTick &t)
  {
   if(!gtc_useTickFlags) return true;
   if(t.flags == 0)      return true;

   switch(gtc_priceSrc)
     {
      case SRC_BID: return ((t.flags & TICK_FLAG_BID) != 0);
      case SRC_MID: return ((t.flags & (TICK_FLAG_BID|TICK_FLAG_ASK)) != 0);
      default:      return ((t.flags & (TICK_FLAG_LAST|TICK_FLAG_BID|TICK_FLAG_ASK)) != 0);
     }
  }

//------------------------------------------------------------------
//  Explicit weighting. Under WEIGHT_VOLUME a size-less tick
//  contributes nothing and is skipped, instead of silently entering
//  the same accumulator as a unit tick count.
//------------------------------------------------------------------
double TC_TickWeight(const MqlTick &t)
  {
   if(gtc_weightMode == WEIGHT_TICKCOUNT) return 1.0;
   if(t.volume_real > 0.0) return t.volume_real;
   if(t.volume > 0)        return (double)t.volume;
   return 0.0;
  }

//==================================================================
//  VWAP accumulator
//==================================================================
struct VwapAccum
  {
   double sumV;
   double sumPV;
   double sumP2V;
  };

void ClearVwap(VwapAccum &a)
  {
   a.sumV = 0.0; a.sumPV = 0.0; a.sumP2V = 0.0;
  }

void FoldVwapWeight(VwapAccum &a,const double price,const double w)
  {
   if(!(price > 0.0) || !(w > 0.0)) return;
   a.sumV   += w;
   a.sumPV  += price * w;
   a.sumP2V += price * price * w;
  }

double SnapshotVwap(const VwapAccum &a,double &stdevOut)
  {
   stdevOut = 0.0;
   if(a.sumV <= 0.0) return 0.0;
   double vwap = a.sumPV / a.sumV;
   double var  = a.sumP2V / a.sumV - vwap*vwap;
   if(var < 0.0) var = 0.0;
   stdevOut = MathSqrt(var);
   return vwap;
  }

//==================================================================
//  Developing-POC histogram, O(1) argmax
//==================================================================
struct PocAccum
  {
   double vol[];
   double binSize;
   int    offset;
   double anchorPrice;
   bool   anchored;
   double maxVol;
   int    maxIdx;
   bool   capHit;
  };

void PocInit(PocAccum &a,const double binSize)
  {
   ArrayFree(a.vol);
   a.binSize     = (binSize > 0.0) ? binSize : _Point;
   a.offset      = 0;
   a.anchorPrice = 0.0;
   a.anchored    = false;
   a.maxVol      = -1.0;
   a.maxIdx      = -1;
   a.capHit      = false;
  }

void ClearPoc(PocAccum &a)
  {
   PocInit(a,a.binSize);
  }

//------------------------------------------------------------------
//  Price -> bin index. Never throws, never allocates past the cap.
//  The array is seeded centred so a trend in either direction grows
//  in blocks instead of triggering a full O(n) element shift per
//  new low.
//------------------------------------------------------------------
int PocPriceToBin(PocAccum &a,const double price)
  {
   if(a.binSize <= 0.0) { a.capHit = true; return -1; }

   if(!a.anchored)
     {
      a.anchorPrice = MathFloor(price / a.binSize) * a.binSize;
      a.anchored    = true;
      if(ArrayResize(a.vol,TC_POC_SEED_BINS,TC_POC_GROW_BLOCK) < 0)
        { a.capHit = true; return -1; }
      ArrayInitialize(a.vol,0.0);
      a.offset = TC_POC_SEED_BINS / 2;
      a.maxVol = -1.0;
      a.maxIdx = -1;
     }

   double rawD = (price - a.anchorPrice) / a.binSize;
   if(!(rawD > -1.0e9) || !(rawD < 1.0e9)) { a.capHit = true; return -1; }

   int raw  = (int)MathRound(rawD);
   int idx  = raw + a.offset;
   int size = ArraySize(a.vol);

   if(idx < 0)
     {
      long grow = (long)(-idx) + TC_POC_GROW_BLOCK;
      if((long)size + grow > TC_POC_MAX_BINS) { a.capHit = true; return -1; }
      int ns = size + (int)grow;
      if(ArrayResize(a.vol,ns,TC_POC_GROW_BLOCK) < 0) { a.capHit = true; return -1; }
      for(int i=size-1;i>=0;i--) a.vol[i+(int)grow] = a.vol[i];
      for(int i=0;i<(int)grow;i++) a.vol[i] = 0.0;
      a.offset += (int)grow;
      if(a.maxIdx >= 0) a.maxIdx += (int)grow;   // the tracked argmax moves with it
      idx = raw + a.offset;
     }
   else if(idx >= size)
     {
      long want = (long)idx + 1 + TC_POC_GROW_BLOCK;
      if(want > TC_POC_MAX_BINS) want = TC_POC_MAX_BINS;
      if((long)idx >= want) { a.capHit = true; return -1; }
      int ns = (int)want;
      if(ArrayResize(a.vol,ns,TC_POC_GROW_BLOCK) < 0) { a.capHit = true; return -1; }
      for(int i=size;i<ns;i++) a.vol[i] = 0.0;
     }

   if(idx < 0 || idx >= ArraySize(a.vol)) { a.capHit = true; return -1; }
   return idx;
  }

double PocBinToPrice(const PocAccum &a,const int idx)
  {
   return a.anchorPrice + (idx - a.offset) * a.binSize;
  }

//------------------------------------------------------------------
//  Fold and maintain the argmax in one step.
//
//  Bin weight is monotonically increasing, so after adding to bin b
//  the maximum is either the previous maximum or bin b. The tie
//  branch reproduces the old scan's behaviour exactly: that scan
//  started at index 0 with a strict '>', so equal weights resolved
//  to the lowest bin, i.e. the lowest price.
//------------------------------------------------------------------
void FoldPocWeight(PocAccum &a,const double price,const double w)
  {
   if(!(price > 0.0) || !(w > 0.0)) return;
   int b = PocPriceToBin(a,price);
   if(b < 0) return;

   a.vol[b] += w;
   double v = a.vol[b];

   if(v > a.maxVol)                          { a.maxVol = v; a.maxIdx = b; }
   else if(v == a.maxVol && b < a.maxIdx)    { a.maxIdx = b; }
  }

//--- Distribute one bar's weight evenly across its high-low range.
void FoldPocRange(PocAccum &a,const double low,const double high,const double w)
  {
   if(!(low > 0.0) || !(high > 0.0) || !(w > 0.0)) return;
   if(high <= low) { FoldPocWeight(a,low,w); return; }

   double span   = high - low;
   int    slices = (int)MathFloor(span / a.binSize) + 1;
   if(slices < 1) slices = 1;
   if(slices > TC_POC_MAX_SLICES) slices = TC_POC_MAX_SLICES;

   double each = w / (double)slices;
   for(int k=0;k<slices;k++)
      FoldPocWeight(a, low + span * (((double)k + 0.5) / (double)slices), each);
  }

double SnapshotPoc(const PocAccum &a)
  {
   if(a.maxIdx < 0 || a.maxVol <= 0.0) return 0.0;
   return PocBinToPrice(a,a.maxIdx);
  }

//==================================================================
//  Combined per-tick fold
//==================================================================
bool FoldTick(VwapAccum &v,PocAccum &p,const MqlTick &t)
  {
   if(!TC_TickUsable(t)) return false;
   double price = TC_TickPrice(t);
   if(!(price > 0.0))    return false;
   double w = TC_TickWeight(t);
   if(!(w > 0.0))        return false;

   FoldVwapWeight(v,price,w);
   FoldPocWeight(p,price,w);
   return true;
  }

//--- M1 bar fold, used only to reach anchors older than tick history.
//    MqlRates.tick_volume IS the tick count, so WEIGHT_TICKCOUNT
//    splices cleanly here - unlike JForex, where a bar carries no
//    tick count and the tail had to be refused outright.
bool FoldM1Bar(VwapAccum &v,PocAccum &p,const MqlRates &r)
  {
   double w;
   if(gtc_weightMode == WEIGHT_TICKCOUNT)
      w = (double)r.tick_volume;
   else
      w = (r.real_volume > 0) ? (double)r.real_volume : (double)r.tick_volume;

   if(!(w > 0.0) || !(r.high > 0.0) || !(r.low > 0.0) || r.high < r.low)
      return false;

   double typical = (r.high + r.low + r.close) / 3.0;
   FoldVwapWeight(v,typical,w);
   FoldPocRange(p,r.low,r.high,w);
   return true;
  }

//==================================================================
//  Bin sizing
//==================================================================
double TC_PipSize()
  {
   int digits = (int)SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);
   return (digits == 3 || digits == 5) ? _Point * 10.0 : _Point;
  }

double ComputeBinSize(const double binPips)
  {
   double bs = binPips * TC_PipSize();
   if(bs <= 0.0) bs = _Point;
   return bs;
  }

//------------------------------------------------------------------
//  Self-tuning bin size: aim for targetBins across the anchor's
//  realized D1 range, floored at the operator's minimum.
//
//  This is what stops a Yearly Gold profile from asking for 200k+
//  bins at 0.1-pip resolution, which is both meaningless at that
//  horizon and the source of the allocation blow-up.
//------------------------------------------------------------------
double TC_AutoBinSize(const datetime from,const datetime to,
                      const int targetBins,const double floorSize)
  {
   if(targetBins <= 0) return floorSize;

   MqlRates r[];
   int n = CopyRates(_Symbol,PERIOD_D1,from,to,r);
   if(n <= 0) return floorSize;

   double hi = -DBL_MAX, lo = DBL_MAX;
   for(int i=0;i<n;i++)
     {
      if(r[i].high > hi) hi = r[i].high;
      if(r[i].low  < lo) lo = r[i].low;
     }
   if(hi <= lo) return floorSize;

   double bs = (hi - lo) / (double)targetBins;
   return (bs > floorSize) ? bs : floorSize;
  }

//==================================================================
//  CTickCursor - the single owner of CopyTicksRange
//
//  Streams [fromMs, endMs) in day-aligned chunks. The host asks for
//  ticks up to a bar boundary and folds them; the cursor handles
//  chunk refills, the per-chunk cap, same-millisecond resume dedup
//  and error detection.
//
//  This replaces three copy-pasted fetch loops, and it removes the
//  overflow re-fetch block those loops needed: a bar boundary can
//  no longer fall inside a chunk the host has already consumed,
//  because the host never sees chunk boundaries at all.
//==================================================================
class CTickCursor
  {
private:
   MqlTick m_buf[];
   int     m_n;
   int     m_i;
   long    m_cursorMs;      // start of the next chunk, inclusive
   long    m_endMs;         // end of the whole range, exclusive
   bool    m_done;
   bool    m_error;
   int     m_err;

   long    m_resumeMs;      // ms of the last tick folded on a previous pass
   int     m_resumeSkip;    // how many ticks at that ms were already folded
   int     m_resumeSeen;

   long    m_served;
   int     m_fetches;
   int     m_capHits;

   bool Fetch()
     {
      while(!m_done)
        {
         if(m_cursorMs >= m_endMs) { m_done = true; return false; }

         datetime cs      = (datetime)(m_cursorMs / 1000);
         datetime nextDay = TC_ShiftDayStart(TC_DayStart(cs),1);
         long     ce      = (long)nextDay * 1000;
         if(ce <= m_cursorMs) ce = m_cursorMs + 86400000;
         if(ce >  m_endMs)    ce = m_endMs;

         ResetLastError();
         m_n = CopyTicksRange(_Symbol,m_buf,(uint)COPY_TICKS_ALL,
                              (ulong)m_cursorMs,(ulong)(ce - 1));
         m_fetches++;

         if(m_n < 0)
           {
            //--- Distinguishing this from "an empty day" is the whole point.
            //--- The old code let n == -1 fall through as zero ticks and wrote
            //--- the resulting flat profile to the buffers permanently.
            m_err   = GetLastError();
            m_error = true;
            m_done  = true;
            m_n = 0; m_i = 0;
            return false;
           }

         m_i        = 0;
         m_cursorMs = ce;

         if(gtc_maxBackfill > 0 && m_n > gtc_maxBackfill)
           { m_i = m_n - gtc_maxBackfill; m_capHits++; }

         if(m_i < m_n) return true;
        }
      return false;
     }

public:
   void Init(const long fromMs,const long endMs,
             const long resumeMs=0,const int resumeSkip=0)
     {
      ArrayFree(m_buf);
      m_n = 0; m_i = 0;
      m_cursorMs   = fromMs;
      m_endMs      = endMs;
      m_done       = (endMs <= fromMs);
      m_error      = false;
      m_err        = 0;
      m_resumeMs   = resumeMs;
      m_resumeSkip = resumeSkip;
      m_resumeSeen = 0;
      m_served     = 0;
      m_fetches    = 0;
      m_capHits    = 0;
     }

   //--- Next tick strictly before limitMs. False = none available yet.
   bool Next(const long limitMs,MqlTick &out)
     {
      while(true)
        {
         while(m_i < m_n)
           {
            long tm = (long)m_buf[m_i].time_msc;
            if(tm >= limitMs) return false;
            int here = m_i;
            m_i++;

            if(tm < m_resumeMs) continue;
            if(tm == m_resumeMs && m_resumeSeen < m_resumeSkip)
              { m_resumeSeen++; continue; }

            out = m_buf[here];
            m_served++;
            return true;
           }
         if(!Fetch()) return false;
        }
     }

   bool  HadError()  const { return m_error;   }
   int   LastError() const { return m_err;     }
   bool  CapHit()    const { return m_capHits > 0; }
   int   CapHits()   const { return m_capHits; }
   long  Served()    const { return m_served;  }
   int   Fetches()   const { return m_fetches; }
  };

//==================================================================
//  Same-millisecond resume bookkeeping, shared by every host.
//==================================================================
struct TickResume
  {
   long lastMs;
   int  countAtLastMs;
  };

void ClearResume(TickResume &r)
  {
   r.lastMs = 0; r.countAtLastMs = 0;
  }

//--- Call for every tick actually handed to the fold, in order.
void NoteResume(TickResume &r,const MqlTick &t)
  {
   long tm = (long)t.time_msc;
   if(tm == r.lastMs) r.countAtLastMs++;
   else { r.lastMs = tm; r.countAtLastMs = 1; }
  }

#endif // __SRJ_TICKCORE_MQH__