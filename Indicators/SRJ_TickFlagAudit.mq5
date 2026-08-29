//+------------------------------------------------------------------+
//|                                            SRJ_TickFlagAudit.mq5 |
//|                                                                  |
//|  Decides ONE question: does the imported archive symbol and the   |
//|  live broker symbol classify the same physical event as a usable  |
//|  tick? If they do not, a seed built from the archive and a tail   |
//|  folded from the native feed carry different weight per unit of   |
//|  time, and the spliced POC/VWAP is a blend of two populations.    |
//|                                                                  |
//|  Two candidate predicates are measured side by side per symbol:   |
//|                                                                  |
//|    FLAGS    accept when flags == 0 or TICK_FLAG_BID is set.       |
//|             This is TC_TickUsable under SRC_BID, verbatim.        |
//|             Depends on how the feed populates a metadata field,   |
//|             which an importer does not have to reproduce.         |
//|                                                                  |
//|    BIDDIFF  accept when the bid differs from the previous bid.    |
//|             Frame- and importer-independent: it is a property of  |
//|             the price series, not of the record's metadata.       |
//|                                                                  |
//|  Reads only. Writes nothing anywhere.                            |
//|                                                                  |
//|  v1.01  Compile fix. Every branch in the verdict block is braced. |
//|         The v1.00 verdict had three unbraced multi-statement      |
//|         branches, so each else bound to nothing (errors at 164,   |
//|         185, 189). Behaviour of the measurement code unchanged.   |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "1.01"
#property description "Compares tick-flag population and usable-tick acceptance between an imported archive symbol and the live broker symbol."
#property script_show_inputs

input string InpArchiveSymbol   = "EURUSD_RAW";  // imported archive (custom) symbol
input string InpNativeSymbol    = "EURUSD";      // live broker symbol
input string InpFromServer      = "";            // "YYYY.MM.DD HH:MM" server frame. Empty = last InpHours.
input int    InpHours           = 24;            // window length, hours
input int    InpArchiveShiftMin = 0;             // archive frame minus server frame, minutes
input bool   InpVerbose         = false;         // log every day chunk

#define AUDIT_RETRIES   40
#define AUDIT_SLEEP_MS  250
#define AUDIT_ZERO_OK   8      // spaced confirmations before believing "empty"

//==================================================================
//  Per-symbol tally
//==================================================================
struct FlagStats
  {
   long   total;
   long   flagsZero;
   long   bidFlag;
   long   askFlag;
   long   lastFlag;
   long   volFlag;
   long   askOnly;            // ASK set, BID clear
   long   zeroBid;
   long   dupMs;
   long   backwards;
   long   accFlags;           // accepted by the FLAGS predicate
   long   accBidDiff;         // accepted by the BIDDIFF predicate
   long   flagSetBidSame;     // BID flag set, bid identical to previous
   long   flagClearBidMoved;  // BID flag clear, bid moved
   long   firstMs;
   long   lastMs;
   int    days;
   int    silentDays;
  };

void StatsClear(FlagStats &s)
  {
   s.total = 0; s.flagsZero = 0; s.bidFlag = 0; s.askFlag = 0;
   s.lastFlag = 0; s.volFlag = 0; s.askOnly = 0; s.zeroBid = 0;
   s.dupMs = 0; s.backwards = 0;
   s.accFlags = 0; s.accBidDiff = 0;
   s.flagSetBidSame = 0; s.flagClearBidMoved = 0;
   s.firstMs = 0; s.lastMs = 0;
   s.days = 0; s.silentDays = 0;
  }

double Pct(const long a, const long b)
  {
   if(b <= 0) return 0.0;
   return 100.0 * (double)a / (double)b;
  }

string TSms(const long msc)
  {
   if(msc <= 0) return "-";
   return TimeToString((datetime)(msc / 1000), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
  }

//------------------------------------------------------------------
//  Tri-state read. Returns -1 when the range could not be resolved,
//  which is NOT the same fact as an empty range - the distinction the
//  pumper post-mortem identified as the root cause of the original
//  data loss. An unresolved chunk aborts the audit instead of being
//  silently averaged in as zero ticks.
//------------------------------------------------------------------
int AuditRead(const string sym, MqlTick &buf[], const long fromMs, const long toMs)
  {
   int zeroStreak = 0;

   for(int a = 0; a <= AUDIT_RETRIES; a++)
     {
      ResetLastError();
      int n = CopyTicksRange(sym, buf, COPY_TICKS_ALL, (ulong)fromMs, (ulong)toMs);
      int e = GetLastError();

      if(n > 0)
         return n;

      if(n == 0 && e == 0)
        {
         zeroStreak++;
         if(zeroStreak >= AUDIT_ZERO_OK)
            return 0;
        }
      else
        {
         zeroStreak = 0;
        }

      Sleep(AUDIT_SLEEP_MS);
     }

   return -1;
  }

//------------------------------------------------------------------
//  Walk one symbol in day chunks. shiftMs is subtracted from every
//  timestamp so both symbols are tallied on one clock.
//------------------------------------------------------------------
bool AuditSymbol(const string sym, const long fromMs, const long toMs,
                 const long shiftMs, FlagStats &s, string &err)
  {
   StatsClear(s);
   err = "";

   double prevBid = 0.0;
   long   prevMs  = 0;
   long   dayMs   = 86400000;

   MqlTick buf[];

   for(long cur = fromMs; cur < toMs; )
     {
      long chunkEnd = cur + dayMs;
      if(chunkEnd > toMs)
         chunkEnd = toMs;

      int n = AuditRead(sym, buf, cur + shiftMs, chunkEnd + shiftMs - 1);

      if(n < 0)
        {
         err = StringFormat("unresolved read on %s across %s -> %s",
                            sym, TSms(cur), TSms(chunkEnd));
         return false;
        }

      s.days++;
      if(n == 0)
        {
         s.silentDays++;
        }

      if(InpVerbose)
        {
         PrintFormat("  %s  %s : %d tick(s)", sym, TSms(cur), n);
        }

      for(int i = 0; i < n; i++)
        {
         long   ms  = (long)buf[i].time_msc - shiftMs;
         double bid = buf[i].bid;
         uint   fl  = buf[i].flags;

         s.total++;
         if(s.firstMs == 0)
            s.firstMs = ms;
         s.lastMs = ms;

         if(ms == prevMs && prevMs != 0)
            s.dupMs++;
         if(prevMs != 0 && ms < prevMs)
            s.backwards++;
         prevMs = ms;

         if(fl == 0)
            s.flagsZero++;
         if((fl & TICK_FLAG_BID)  != 0)
            s.bidFlag++;
         if((fl & TICK_FLAG_ASK)  != 0)
            s.askFlag++;
         if((fl & TICK_FLAG_LAST) != 0)
            s.lastFlag++;
         if((fl & TICK_FLAG_VOLUME) != 0)
            s.volFlag++;
         if(((fl & TICK_FLAG_ASK) != 0) && ((fl & TICK_FLAG_BID) == 0))
            s.askOnly++;

         if(!(bid > 0.0))
           {
            s.zeroBid++;
            continue;                       // no usable bid: neither predicate can accept
           }

         //--- FLAGS predicate: TC_TickUsable under SRC_BID, verbatim
         bool okFlags = (fl == 0) || ((fl & TICK_FLAG_BID) != 0);
         if(okFlags)
            s.accFlags++;

         //--- BIDDIFF predicate: did the classification price actually move
         bool moved = (prevBid <= 0.0) || (bid != prevBid);
         if(moved)
            s.accBidDiff++;

         //--- where the two disagree, and in which direction
         bool flagBid = ((fl & TICK_FLAG_BID) != 0);
         if(flagBid && !moved)
            s.flagSetBidSame++;
         if(!flagBid && moved && fl != 0)
            s.flagClearBidMoved++;

         prevBid = bid;
        }

      cur = chunkEnd;
     }

   return true;
  }

//------------------------------------------------------------------
void Report(const string tag, const string sym, const FlagStats &s)
  {
   Print("------------------------------------------------------------");
   PrintFormat("%s  %s", tag, sym);
   PrintFormat("  window covered   %s  ->  %s   (%d day chunk(s), %d silent)",
               TSms(s.firstMs), TSms(s.lastMs), s.days, s.silentDays);
   PrintFormat("  ticks            %I64d", s.total);

   if(s.total <= 0)
     {
      Print("  NO TICKS. Either the range is genuinely empty for this symbol, or the");
      Print("  archive frame is shifted relative to the server frame - compare the");
      Print("  covered window above against the other symbol before drawing any");
      Print("  conclusion from the rest of this report.");
      return;
     }

   PrintFormat("  flags == 0       %I64d  (%.1f%%)  <- no metadata; FLAGS accepts all of these",
               s.flagsZero, Pct(s.flagsZero, s.total));
   PrintFormat("  BID flag set     %I64d  (%.1f%%)", s.bidFlag,  Pct(s.bidFlag,  s.total));
   PrintFormat("  ASK flag set     %I64d  (%.1f%%)", s.askFlag,  Pct(s.askFlag,  s.total));
   PrintFormat("  ask-only         %I64d  (%.1f%%)  <- FLAGS discards, BIDDIFF discards",
               s.askOnly, Pct(s.askOnly, s.total));
   PrintFormat("  LAST flag set    %I64d   VOLUME flag set %I64d", s.lastFlag, s.volFlag);
   PrintFormat("  bid <= 0         %I64d", s.zeroBid);
   PrintFormat("  same-ms repeats  %I64d  (%.1f%%)", s.dupMs, Pct(s.dupMs, s.total));
   PrintFormat("  out of order     %I64d", s.backwards);
   Print("");
   PrintFormat("  ACCEPTED by FLAGS    %I64d  (%.1f%% of ticks)",
               s.accFlags,   Pct(s.accFlags,   s.total));
   PrintFormat("  ACCEPTED by BIDDIFF  %I64d  (%.1f%% of ticks)",
               s.accBidDiff, Pct(s.accBidDiff, s.total));
   PrintFormat("  disagreement: BID flag set but bid unchanged  %I64d  (%.1f%%)",
               s.flagSetBidSame, Pct(s.flagSetBidSame, s.total));
   PrintFormat("  disagreement: BID flag clear but bid moved    %I64d  (%.1f%%)",
               s.flagClearBidMoved, Pct(s.flagClearBidMoved, s.total));

   if(s.backwards > 0)
     {
      Print("  WARNING: timestamps are not monotone in this range. Every accumulator in");
      Print("  the suite assumes ascending ticks. Audit the import for this symbol.");
     }
  }

//------------------------------------------------------------------
void Verdict(const FlagStats &arc, const FlagStats &nat)
  {
   Print("============================================================");
   Print("VERDICT");

   if(arc.total <= 0 || nat.total <= 0)
     {
      Print("  -> INCONCLUSIVE. One side returned no ticks, so nothing was compared.");
      Print("     Re-run over a window both symbols actually cover, and check");
      Print("     InpArchiveShiftMin against the two covered windows printed above.");
      Print("============================================================");
      return;
     }

   double arcAcc = Pct(arc.accFlags, arc.total);
   double natAcc = Pct(nat.accFlags, nat.total);

   PrintFormat("  FLAGS acceptance:   archive %.1f%%   native %.1f%%   gap %.1f pt",
               arcAcc, natAcc, MathAbs(arcAcc - natAcc));
   PrintFormat("  BIDDIFF acceptance: archive %.1f%%   native %.1f%%   gap %.1f pt",
               Pct(arc.accBidDiff, arc.total), Pct(nat.accBidDiff, nat.total),
               MathAbs(Pct(arc.accBidDiff, arc.total) - Pct(nat.accBidDiff, nat.total)));
   Print("");

   if(arc.flagsZero > arc.total / 2)
     {
      Print("  -> Archive flags are mostly ZERO. TC_TickUsable accepts everything there,");
      Print("     including ask-only revisions that native discards. SEED_FLAG_BIDDIFF is");
      Print("     REQUIRED or the seed over-weights relative to the live tail.");
     }
   else if(MathAbs(arcAcc - natAcc) > 5.0)
     {
      PrintFormat("  -> Archive and native accept materially different shares (%.1f pt gap).",
                  MathAbs(arcAcc - natAcc));
      Print("     Use SEED_FLAG_BIDDIFF so both sides count the same event.");
     }
   else
     {
      Print("  -> Archive and native acceptance rates agree. Either flag mode is defensible;");
      Print("     SEED_FLAG_BIDDIFF remains the safer default because it is frame-independent.");
     }

   Print("");
   Print("  Whichever mode you choose, the HOST must apply the same predicate to the");
   Print("  native tail. A seed built on BIDDIFF and a tail folded on FLAGS is a blend");
   Print("  of two populations, and no downstream check can detect it.");
   Print("============================================================");
  }

//------------------------------------------------------------------
void OnStart()
  {
   if(!SymbolSelect(InpArchiveSymbol, true))
     {
      PrintFormat("[FlagAudit] FATAL: cannot select '%s'.", InpArchiveSymbol);
      return;
     }
   if(!SymbolSelect(InpNativeSymbol, true))
     {
      PrintFormat("[FlagAudit] FATAL: cannot select '%s'.", InpNativeSymbol);
      return;
     }
   if(InpHours <= 0)
     {
      Print("[FlagAudit] FATAL: InpHours must be positive.");
      return;
     }

   string fs = InpFromServer;
   StringTrimLeft(fs);
   StringTrimRight(fs);

   datetime from;
   if(StringLen(fs) > 0)
     {
      from = StringToTime(fs);
      if(from <= 0)
        {
         Print("[FlagAudit] FATAL: InpFromServer is not parseable. Use \"YYYY.MM.DD HH:MM\".");
         return;
        }
     }
   else
     {
      from = (datetime)((long)TimeCurrent() - (long)InpHours * 3600);
     }

   datetime to     = (datetime)((long)from + (long)InpHours * 3600);
   long     fromMs = (long)from * 1000;
   long     toMs   = (long)to   * 1000;
   long     shift  = (long)InpArchiveShiftMin * 60000;

   Print("============================================================");
   PrintFormat("SRJ Tick Flag Audit v1.01   window %s -> %s (server frame)",
               TimeToString(from, TIME_DATE | TIME_MINUTES),
               TimeToString(to,   TIME_DATE | TIME_MINUTES));
   PrintFormat("archive shift applied: %+d min", InpArchiveShiftMin);

   FlagStats arc, nat;
   string    err = "";

   if(!AuditSymbol(InpArchiveSymbol, fromMs, toMs, shift, arc, err))
     {
      PrintFormat("[FlagAudit] ABORTED: %s", err);
      Print("  A read that cannot be resolved is not evidence of an empty range.");
      Print("  Open a chart on that symbol, let the tick base load, and re-run.");
      return;
     }

   if(!AuditSymbol(InpNativeSymbol, fromMs, toMs, 0, nat, err))
     {
      PrintFormat("[FlagAudit] ABORTED: %s", err);
      return;
     }

   Report("ARCHIVE", InpArchiveSymbol, arc);
   Report("NATIVE ", InpNativeSymbol,  nat);
   Verdict(arc, nat);
  }
//+------------------------------------------------------------------+