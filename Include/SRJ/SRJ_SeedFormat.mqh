//+------------------------------------------------------------------+
//|                          SRJ_SeedFormat.mqh                      |
//|                                                                  |
//| On-disk format for a pre-folded POC/VWAP accumulator seed.       |
//|                                                                  |
//| Written by SRJ_POI_Seeder.mq5 from a deep archive symbol, read   |
//| by SRJ_POI_Marker.mq5, which then continues folding NATIVE ticks |
//| from the seam forward. The point is a Yearly POC that is real    |
//| rather than truncated at whatever tick depth the broker holds.   |
//|                                                                  |
//| Everything that can make the two halves incomparable is stored   |
//| and verified on load: destination symbol, digits, point, bin     |
//| size, weight mode and the usable-tick predicate. A mismatch is   |
//| REFUSED, never adapted to. Silently splicing two incompatible    |
//| populations is the failure this file exists to prevent, and no   |
//| downstream check could detect it.                                |
//|                                                                  |
//| v2  CLOCK UNIFICATION. Two changes, and the second is the one    |
//|     that matters:                                                |
//|                                                                  |
//|     1. This header now owns every constant the two hosts         |
//|        hardcode, so they cannot drift. Previously CK_MAGIC and   |
//|        CK_VERSION were duplicated as #defines in BOTH .mq5       |
//|        files - two independent copies of a number that has to    |
//|        agree for a checkpoint file to load at all.               |
//|                                                                  |
//|     2. serverGmtBase and serverDst are now INFORMATIONAL and are |
//|        removed from every refusal path.                           |
//|                                                                  |
//|        They used to be compared. That comparison had to go,      |
//|        because the offset is derived from TimeGMT(), which MT5    |
//|        computes from the LOCAL PC CLOCK - so gating a seed on it  |
//|        refuses a valid file because of a workstation             |
//|        misconfiguration. It also legitimately differs between a  |
//|        seed built in winter and a host running in summer, now    |
//|        that the detected figure is instantaneous rather than a    |
//|        standard-time base.                                        |
//|                                                                  |
//|        The FIELDS STAY, and the struct layout is unchanged, so   |
//|        the FNV-1a mix order in SEED_Write / SEED_Read is         |
//|        untouched. The Marker displays both on its status panel,   |
//|        so a genuine cross-broker mismatch is still visible to a  |
//|        human - it just no longer refuses on a machine's clock.   |
//|                                                                  |
//|        serverGmtBase now carries the INSTANTANEOUS offset.       |
//|        serverDst is written as 0 and read but never interpreted;  |
//|        the rule enum it encoded no longer exists.                |
//|                                                                  |
//| Library only. Owns no chart objects and no event handlers.       |
//+------------------------------------------------------------------+
#ifndef __SRJ_SEEDFORMAT_MQH__
#define __SRJ_SEEDFORMAT_MQH__

#include <SRJ/SRJ_TickCore.mqh>

#define SEED_MAGIC     0x53524A53      // 'SRJS'
#define SEED_VERSION   2               // v2: clock fields informational
#define SEED_NSLOTS    6
#define SEED_STRLEN    32

//--- Checkpoint sidecar. Lives here at v2 because it was previously
//--- #defined identically in both .mq5 files - two copies of a number that
//--- must agree or no checkpoint file loads.
#define CK_MAGIC       0x53524A43      // 'SRJC'
#define CK_VERSION     2               // bumped in lockstep with SEED_VERSION

//--- On-disk encoding of the usable-tick predicate. Deliberately a separate
//--- namespace from ENUM_USABLE_MODE: one is a file field whose numbering must
//--- never change, the other is runtime state.
#define SEED_FLAG_FLAGS     0
#define SEED_FLAG_BIDDIFF   1

//==================================================================
//  VALUES BOTH HOSTS HARDCODE.
//
//  Each of these was an input on both sides, each had to match
//  exactly or the seed is refused, and each is documented in its own
//  former comment as having exactly one correct setting. Two inputs
//  that must agree are two chances to disagree, so they became one
//  constant in the one file both hosts already include.
//==================================================================

//--- The usable-tick predicate. BIDDIFF is not a preference.
//--- SRJ_TickFlagAudit measured a 6.6 POINT acceptance gap between
//--- EURUSD_RAW and EURUSD under FLAGS, against 0.1 under BIDDIFF, because
//--- the importer sets TICK_FLAG_BID on 7.4% of ticks whose bid did not move
//--- against the live feed's 0.8%. Under FLAGS the two sources cannot be
//--- spliced at all.
#define SEED_FIXED_FLAGMODE   SEED_FLAG_BIDDIFF

//--- Bin grid derivation. Non-zero derives the grid from realized range,
//--- which cannot be shown equal to the grid the other side used, so an
//--- off-grid seeded POC would be a wrong number rather than a coarse one.
#define SEED_FIXED_TARGETBINS 0

//--- Per-day chunk cap. ANY non-zero value silently discards all but the
//--- last N ticks of each day, and it breaks incremental resume: the trim
//--- removes the oldest ticks of a chunk, which can include the ticks the
//--- resume counter expects at its boundary millisecond.
#define SEED_FIXED_MAXCHUNK   0

//--- Price source. Hard-wired and deliberately never an input in either host:
//--- MT5 draws candles from bid, so under SRC_MID the Marker's wick-vs-line
//--- test would compare candles against a price path that is drawn nowhere.
#define SEED_FIXED_PRICESRC   SRC_BID

//--- Returns the ENUM_USABLE_MODE ORDINAL, not the enum member. The two
//--- numbering schemes are pinned to each other here, once, so this header
//--- does not depend on TickCore's enum being visible at this point in the
//--- translation unit. Both callers already cast the result.
int SEED_FlagToMode(const int onDisk)
  { return (onDisk == SEED_FLAG_BIDDIFF) ? 1 : 0; }   // 1 = USABLE_BIDDIFF, 0 = USABLE_FLAGS

string SEED_FlagName(const int onDisk)
  { return (onDisk == SEED_FLAG_BIDDIFF) ? "BIDDIFF" : "FLAGS"; }

//------------------------------------------------------------------
//  Canonical file names. Both hosts derive rather than expose them,
//  so a seed and its checkpoint sidecar cannot be pointed at
//  different symbols by a stale preset.
//------------------------------------------------------------------
string SEED_FileName(const string dstSymbol) { return "SRJ_SEED_" + dstSymbol + ".bin"; }
string SEED_CkptName(const string dstSymbol) { return "SRJ_CKPT_" + dstSymbol + ".bin"; }

//------------------------------------------------------------------
//  Refusal text for a pre-v2 file. Named here so both hosts print
//  the same remedy, and so the remedy is the ACTION rather than a
//  version number: a v1 file's clock fields were written by the
//  retired converter and its FOMC slot was anchored through it, so
//  the file is not merely old, it may be anchored to the wrong
//  instant. Re-seeding is the only fix.
//------------------------------------------------------------------
string SEED_VersionRefusal(const int fileVer)
  {
   return StringFormat(
      "file format v%d, this build reads v%d. This is the clock-unification "
      "release: every timestamp is now broker server time and the retired "
      "converter's output cannot be trusted. Re-run SRJ_POI_Seeder to "
      "regenerate the seed and its checkpoint sidecar. Delete the old "
      "SRJ_SEED_*.bin and SRJ_CKPT_*.bin first.", fileVer, SEED_VERSION);
  }

//==================================================================
//  Exact double <-> long reinterpretation, for the integrity hash.
//  Scaling would overflow: sumP2V on a 5-digit quote across a year
//  reaches ~1e11 before any fixed-point multiplier is applied.
//==================================================================
union SeedDblBits
  {
   double d;
   long   l;
  };

long SEED_Bits(const double v)
  {
   SeedDblBits u; u.d = v; return u.l;
  }

//==================================================================
//  FNV-1a over every value written, in write order. The reader mixes
//  the identical sequence and compares. A truncated or edited file is
//  refused instead of loading as a plausible profile.
//
//  v2 did NOT change the mix order. The two clock fields are still
//  written and still mixed - they only stopped being compared.
//==================================================================
struct SeedHash { ulong h; };

void SH_Init(SeedHash &s) { s.h = 14695981039346656037; }

void SH_MixL(SeedHash &s, const long v)
  {
   s.h ^= (ulong)v;
   s.h *= 1099511628211;
  }

void SH_MixD(SeedHash &s, const double v) { SH_MixL(s, SEED_Bits(v)); }

void SH_MixS(SeedHash &s, const string v)
  {
   int n = StringLen(v);
   SH_MixL(s, (long)n);
   for(int i = 0; i < n; i++) SH_MixL(s, (long)StringGetCharacter(v, i));
  }

//==================================================================
//  Header. No dynamic members, so it copies cleanly.
//==================================================================
struct SeedHeader
  {
   int      version;
   int      flagMode;           // SEED_FLAG_*
   int      weightMode;         // ENUM_WEIGHT_MODE ordinal
   string   dstSymbol;          // the symbol the HOST must be running
   string   srcSymbol;          // where the ticks came from, for the log
   int      digits;
   double   point;
   double   binSize;
   long     seamMsc;            // server frame. Host folds native from HERE, inclusive.
   long     lastArcMsc;         // newest archive tick actually folded
   double   lastBid;            // restores gtc_prevBid across the splice
   int      serverGmtBase;      // INFORMATIONAL at v2. Instantaneous offset. Never compared.
   int      serverDst;          // INFORMATIONAL at v2. Always written 0. Never interpreted.
   int      nSlots;
   long     ticksFolded;
   long     ticksRead;
   int      gapCount;
   int      gapWorstSec;
   long     builtAt;
  };

void SEED_HeaderClear(SeedHeader &h)
  {
   h.version = SEED_VERSION; h.flagMode = SEED_FIXED_FLAGMODE;
   h.weightMode = (int)WEIGHT_TICKCOUNT;
   h.dstSymbol = ""; h.srcSymbol = "";
   h.digits = 0; h.point = 0.0; h.binSize = 0.0;
   h.seamMsc = 0; h.lastArcMsc = 0; h.lastBid = 0.0;
   //--- Literal 0, not (int)DST_EU. The enum is gone, and the field is no
   //--- longer interpreted by anything.
   h.serverGmtBase = 0; h.serverDst = 0;
   h.nSlots = SEED_NSLOTS;
   h.ticksFolded = 0; h.ticksRead = 0;
   h.gapCount = 0; h.gapWorstSec = 0;
   h.builtAt = 0;
  }

//==================================================================
//  Bin sizing, parameterised by symbol.
//
//  Reproduces POI_BinSize() for an ARBITRARY symbol, because the
//  seeder may be running on a chart of the archive symbol while the
//  geometry that matters is the destination's. The host computes the
//  same number from its own _Symbol and refuses on any difference,
//  so this function is the single definition of the bin grid.
//==================================================================
double SEED_PipSize(const string sym)
  {
   int    d  = (int)SymbolInfoInteger(sym, SYMBOL_DIGITS);
   double pt = SymbolInfoDouble(sym, SYMBOL_POINT);
   return (d == 3 || d == 5) ? pt * 10.0 : pt;
  }

double SEED_BinSize(const string sym, const double binPips)
  {
   double pt = SymbolInfoDouble(sym, SYMBOL_POINT);
   if(pt <= 0.0) return 0.0;

   double bs = binPips * SEED_PipSize(sym);
   if(bs <= 0.0) bs = pt;

   double ts = SymbolInfoDouble(sym, SYMBOL_TRADE_TICK_SIZE);
   double fl = MathMax(pt, (ts > 0.0) ? ts : pt);
   return MathMax(bs, fl);
  }

//==================================================================
//  Argmax rebuild after a load.
//
//  Strict '>' from index 0, so equal weights resolve to the lowest
//  bin index and therefore the lowest price - identical to the tie
//  rule in FoldPocWeight. Recomputed rather than stored so a hand-
//  edited histogram cannot carry a lie about its own maximum.
//==================================================================
void SEED_RecomputePocMax(PocAccum &a)
  {
   a.maxVol = -1.0;
   a.maxIdx = -1;
   int n = ArraySize(a.vol);
   for(int i = 0; i < n; i++)
      if(a.vol[i] > a.maxVol) { a.maxVol = a.vol[i]; a.maxIdx = i; }
   if(!(a.maxVol > 0.0)) { a.maxVol = -1.0; a.maxIdx = -1; }
  }

//==================================================================
//  Fixed-width string helpers. FILE_ANSI keeps one byte per char, so
//  the layout is byte-stable across terminals.
//==================================================================
void SEED_PutStr(const int fh, SeedHash &sh, const string v)
  {
   string s = v;
   if(StringLen(s) > SEED_STRLEN) s = StringSubstr(s, 0, SEED_STRLEN);
   while(StringLen(s) < SEED_STRLEN) s += " ";
   FileWriteString(fh, s, SEED_STRLEN);
   SH_MixS(sh, s);
  }

string SEED_GetStr(const int fh, SeedHash &sh)
  {
   string s = FileReadString(fh, SEED_STRLEN);
   SH_MixS(sh, s);
   StringTrimLeft(s);
   StringTrimRight(s);
   return s;
  }

void SEED_PutL(const int fh, SeedHash &sh, const long v)
  { FileWriteLong(fh, v); SH_MixL(sh, v); }

long SEED_GetL(const int fh, SeedHash &sh)
  { long v = FileReadLong(fh); SH_MixL(sh, v); return v; }

void SEED_PutI(const int fh, SeedHash &sh, const int v)
  { FileWriteInteger(fh, v, INT_VALUE); SH_MixL(sh, (long)v); }

int SEED_GetI(const int fh, SeedHash &sh)
  { int v = (int)FileReadInteger(fh, INT_VALUE); SH_MixL(sh, (long)v); return v; }

void SEED_PutD(const int fh, SeedHash &sh, const double v)
  { FileWriteDouble(fh, v); SH_MixD(sh, v); }

double SEED_GetD(const int fh, SeedHash &sh)
  { double v = FileReadDouble(fh); SH_MixD(sh, v); return v; }

//==================================================================
//  WRITE
//
//  Slot order is the caller's array order and is assumed to be the
//  host's SLOT_* order. periodStart / absAnchor are stored so the
//  host can verify it is resuming the same period rather than
//  silently attaching a stale profile to a new one.
//==================================================================
bool SEED_Write(const string fname, SeedHeader &h,
                const long &periodStart[], const long &absAnchor[],
                const int  &isEvent[],     const int  &anchorType[],
                VwapAccum &v[], PocAccum &p[], string &err)
  {
   err = "";

   // UPDATED: Added FILE_COMMON to write to Terminal\Common\Files
   int fh = FileOpen(fname, FILE_WRITE | FILE_BIN | FILE_ANSI | FILE_COMMON);
   if(fh == INVALID_HANDLE)
     {
      err = StringFormat("FileOpen('%s') failed, err %d", fname, GetLastError());
      return false;
     }

   SeedHash sh; SH_Init(sh);

   FileWriteInteger(fh, (int)SEED_MAGIC, INT_VALUE);
   SH_MixL(sh, (long)SEED_MAGIC);

   SEED_PutI(fh, sh, h.version);
   SEED_PutI(fh, sh, h.flagMode);
   SEED_PutI(fh, sh, h.weightMode);
   SEED_PutStr(fh, sh, h.dstSymbol);
   SEED_PutStr(fh, sh, h.srcSymbol);
   SEED_PutI(fh, sh, h.digits);
   SEED_PutD(fh, sh, h.point);
   SEED_PutD(fh, sh, h.binSize);
   SEED_PutL(fh, sh, h.seamMsc);
   SEED_PutL(fh, sh, h.lastArcMsc);
   SEED_PutD(fh, sh, h.lastBid);
   SEED_PutI(fh, sh, h.serverGmtBase);   // informational
   SEED_PutI(fh, sh, h.serverDst);       // informational, always 0
   SEED_PutI(fh, sh, h.nSlots);
   SEED_PutL(fh, sh, h.ticksFolded);
   SEED_PutL(fh, sh, h.ticksRead);
   SEED_PutI(fh, sh, h.gapCount);
   SEED_PutI(fh, sh, h.gapWorstSec);
   SEED_PutL(fh, sh, h.builtAt);

   for(int s = 0; s < h.nSlots; s++)
     {
      SEED_PutI(fh, sh, anchorType[s]);
      SEED_PutL(fh, sh, periodStart[s]);
      SEED_PutL(fh, sh, absAnchor[s]);
      SEED_PutI(fh, sh, isEvent[s]);

      SEED_PutD(fh, sh, v[s].sumV);
      SEED_PutD(fh, sh, v[s].sumPV);
      SEED_PutD(fh, sh, v[s].sumP2V);

      SEED_PutD(fh, sh, p[s].binSize);
      SEED_PutD(fh, sh, p[s].anchorPrice);
      SEED_PutI(fh, sh, p[s].offset);
      SEED_PutI(fh, sh, p[s].anchored ? 1 : 0);
      SEED_PutI(fh, sh, p[s].capHit  ? 1 : 0);

      int n  = ArraySize(p[s].vol);
      int nz = 0;
      for(int i = 0; i < n; i++) if(p[s].vol[i] > 0.0) nz++;

      SEED_PutI(fh, sh, n);
      SEED_PutI(fh, sh, nz);

      //--- Sparse. A cold Gold yearly histogram is mostly zeros, and
      //--- writing 8 MB of them per slot serves no one.
      for(int i = 0; i < n; i++)
         if(p[s].vol[i] > 0.0)
           {
            SEED_PutI(fh, sh, i);
            SEED_PutD(fh, sh, p[s].vol[i]);
           }
     }

   FileWriteLong(fh, (long)sh.h);
   FileFlush(fh);
   FileClose(fh);
   return true;
  }

//==================================================================
//  READ
//
//  Returns false on ANY inconsistency, with err set. The caller must
//  treat that as "no seed available" and fall back to its own tick
//  depth, never as "load what you can".
//==================================================================
bool SEED_Read(const string fname, SeedHeader &h,
               long &periodStart[], long &absAnchor[],
               int  &isEvent[],     int  &anchorType[],
               VwapAccum &v[], PocAccum &p[], string &err)
  {
   err = "";

   // UPDATED: Added FILE_COMMON check & read flag
   if(!FileIsExist(fname, FILE_COMMON))
     { err = StringFormat("seed file '%s' not present", fname); return false; }

   int fh = FileOpen(fname, FILE_READ | FILE_BIN | FILE_ANSI | FILE_COMMON);
   if(fh == INVALID_HANDLE)
     { err = StringFormat("FileOpen('%s') failed, err %d", fname, GetLastError()); return false; }

   SeedHash sh; SH_Init(sh);

   uint magic = (uint)FileReadInteger(fh, INT_VALUE);
   SH_MixL(sh, (long)magic);
   if(magic != SEED_MAGIC)
     { FileClose(fh); err = "bad magic - not an SRJ seed file"; return false; }

   SEED_HeaderClear(h);
   h.version = SEED_GetI(fh, sh);
   if(h.version != SEED_VERSION)
     {
      FileClose(fh);
      err = SEED_VersionRefusal(h.version);
      return false;
     }

   h.flagMode      = SEED_GetI(fh, sh);
   h.weightMode    = SEED_GetI(fh, sh);
   h.dstSymbol     = SEED_GetStr(fh, sh);
   h.srcSymbol     = SEED_GetStr(fh, sh);
   h.digits        = SEED_GetI(fh, sh);
   h.point         = SEED_GetD(fh, sh);
   h.binSize       = SEED_GetD(fh, sh);
   h.seamMsc       = SEED_GetL(fh, sh);
   h.lastArcMsc    = SEED_GetL(fh, sh);
   h.lastBid       = SEED_GetD(fh, sh);
   h.serverGmtBase = SEED_GetI(fh, sh);   // read, displayed, NEVER compared
   h.serverDst     = SEED_GetI(fh, sh);   // read, displayed, never interpreted
   h.nSlots        = SEED_GetI(fh, sh);
   h.ticksFolded   = SEED_GetL(fh, sh);
   h.ticksRead     = SEED_GetL(fh, sh);
   h.gapCount      = SEED_GetI(fh, sh);
   h.gapWorstSec   = SEED_GetI(fh, sh);
   h.builtAt       = SEED_GetL(fh, sh);

   if(h.nSlots != SEED_NSLOTS)
     {
      FileClose(fh);
      err = StringFormat("seed holds %d slots, host expects %d", h.nSlots, SEED_NSLOTS);
      return false;
     }

   ArrayResize(periodStart, h.nSlots);
   ArrayResize(absAnchor,   h.nSlots);
   ArrayResize(isEvent,     h.nSlots);
   ArrayResize(anchorType,  h.nSlots);

   //--- v[] and p[] are deliberately NOT resized here. PocAccum carries a
   //--- dynamic member, and h.nSlots is already pinned to SEED_NSLOTS above,
   //--- so the caller can declare them fixed-size and this check is exact.
   //--- v3.10 omitted both the resize and the check, so the first ClearVwap(v[s])
   //--- indexed a zero-length array.
   if(ArraySize(v) < h.nSlots || ArraySize(p) < h.nSlots)
     {
      FileClose(fh);
      err = StringFormat("caller supplied %d VWAP and %d POC slots, seed needs %d. "
                         "Declare both as [SEED_NSLOTS].",
                         ArraySize(v), ArraySize(p), h.nSlots);
      return false;
     }

   for(int s = 0; s < h.nSlots; s++)
     {
      anchorType[s]  = SEED_GetI(fh, sh);
      periodStart[s] = SEED_GetL(fh, sh);
      absAnchor[s]   = SEED_GetL(fh, sh);
      isEvent[s]     = SEED_GetI(fh, sh);

      ClearVwap(v[s]);
      v[s].sumV   = SEED_GetD(fh, sh);
      v[s].sumPV  = SEED_GetD(fh, sh);
      v[s].sumP2V = SEED_GetD(fh, sh);

      double bs   = SEED_GetD(fh, sh);
      double ap   = SEED_GetD(fh, sh);
      int    off  = SEED_GetI(fh, sh);
      int    anch = SEED_GetI(fh, sh);
      int    cap  = SEED_GetI(fh, sh);
      int    n    = SEED_GetI(fh, sh);
      int    nz   = SEED_GetI(fh, sh);

      if(n < 0 || nz < 0 || nz > n || n > TC_POC_MAX_BINS)
        {
         FileClose(fh);
         err = StringFormat("slot %d histogram dimensions are impossible (%d bins, %d set)",
                            s, n, nz);
         return false;
        }

      PocInit(p[s], bs);
      p[s].anchorPrice = ap;
      p[s].offset      = off;
      p[s].anchored    = (anch != 0);
      p[s].capHit      = (cap  != 0);

      if(n > 0)
        {
         if(ArrayResize(p[s].vol, n, TC_POC_GROW_BLOCK) < 0)
           {
            FileClose(fh);
            err = StringFormat("could not allocate %d bins for slot %d", n, s);
            return false;
           }
         ArrayInitialize(p[s].vol, 0.0);
        }

      for(int k = 0; k < nz; k++)
        {
         int    idx = SEED_GetI(fh, sh);
         double vol = SEED_GetD(fh, sh);
         if(idx < 0 || idx >= n)
           {
            FileClose(fh);
            err = StringFormat("slot %d bin index %d out of range 0..%d", s, idx, n - 1);
            return false;
           }
         p[s].vol[idx] = vol;
        }

      SEED_RecomputePocMax(p[s]);
     }

   long stored = FileReadLong(fh);
   FileClose(fh);

   if(stored != (long)sh.h)
     { err = "integrity hash mismatch - the file is truncated or edited"; return false; }

   return true;
  }

//==================================================================
//  Compatibility gate. Called by the HOST after a successful read.
//
//  Every field here can silently produce a wrong number if it
//  differs, so every field here is fatal.
//
//  NOT the only gate, and it never was. The Marker runs its own
//  inline chain inside Rebuild which covers the same ground plus the
//  seam-versus-measured-depth test that is a property of the
//  terminal's rolling cache rather than of the file. Both are kept:
//  this one is what any FUTURE host gets for free, the inline one is
//  what produces a per-field operator-facing message.
//
//  v2: the two clock fields are deliberately absent from this
//  function, and were absent before it too. Do not add them. See the
//  header block - serverGmtBase is derived from the local PC clock,
//  so refusing on it rejects a valid file because of a workstation
//  misconfiguration, and it legitimately differs between a seed built
//  in winter and a host running in summer.
//==================================================================
bool SEED_Compatible(const SeedHeader &h, const string sym, const double hostBinSize,
                     const int hostWeightMode, string &err)
  {
   err = "";

   if(h.version != SEED_VERSION)
     {
      err = SEED_VersionRefusal(h.version);
      return false;
     }

   if(h.nSlots != SEED_NSLOTS)
     {
      err = StringFormat("seed holds %d slots, this build has %d", h.nSlots, SEED_NSLOTS);
      return false;
     }

   if(h.dstSymbol != sym)
     {
      err = StringFormat("seed was built for '%s', chart is '%s'", h.dstSymbol, sym);
      return false;
     }

   int    d  = (int)SymbolInfoInteger(sym, SYMBOL_DIGITS);
   double pt = SymbolInfoDouble(sym, SYMBOL_POINT);

   if(d != h.digits)
     {
      err = StringFormat("digits changed: seed %d, symbol %d", h.digits, d);
      return false;
     }
   if(MathAbs(pt - h.point) > pt * 1.0e-9)
     {
      err = StringFormat("point changed: seed %.10f, symbol %.10f", h.point, pt);
      return false;
     }
   if(MathAbs(hostBinSize - h.binSize) > h.point * 1.0e-6)
     {
      err = StringFormat("bin size differs: seed %.10f, host %.10f. "
                         "The two histograms are on different grids.",
                         h.binSize, hostBinSize);
      return false;
     }
   if(hostWeightMode != h.weightMode)
     {
      err = "weight mode differs between seed and host";
      return false;
     }

   //--- The usable-tick predicate is now a shared constant rather than an input
   //--- on each side, so a mismatch here can only mean a file built by a
   //--- different release. Checked anyway: this is the one field where the two
   //--- halves accept measurably different tick populations, and a silent splice
   //--- is undetectable downstream.
   if(h.flagMode != SEED_FIXED_FLAGMODE)
     {
      err = StringFormat("usable-tick predicate %s, this build folds %s - the two "
                         "sources accept different tick populations and cannot be spliced",
                         SEED_FlagName(h.flagMode), SEED_FlagName(SEED_FIXED_FLAGMODE));
      return false;
     }

   return true;
  }

//==================================================================
//  INFORMATIONAL CLOCK FIELDS - display helper.
//
//  The one legitimate consumer of serverGmtBase and serverDst. Both
//  hosts render this on the status panel and in the seed log line, so
//  a genuine cross-broker mismatch stays visible to a human without
//  any code path being able to refuse on it.
//
//  The host's live offset arrives as a PARAMETER rather than being
//  read from a TickCore global. This header describes a FILE; the
//  live clock is the host's fact, not the format's. It also means
//  this function compiles against any TickCore revision, which
//  matters because a stale duplicate copy of that header is exactly
//  the kind of half-applied change the suite keeps tripping over.
//
//  Phrased as a comparison rather than a verdict, deliberately. A
//  one-hour difference between a seed built in winter and a host
//  running in summer is EXPECTED, because the detected figure is the
//  instantaneous offset and not a standard-time base. Only a large
//  difference means two different brokers.
//==================================================================
string SEED_OffsetText(const int secs)
  {
   return StringFormat("%+.2fh", (double)secs / 3600.0);
  }

string SEED_ClockInfoText(const SeedHeader &h,
                          const int  hostOffsetNow,
                          const bool hostOffsetKnown)
  {
   string seedTxt = SEED_OffsetText(h.serverGmtBase);

   if(!hostOffsetKnown)
      return StringFormat("seed built at server %s, host offset unknown (advisory only)",
                          seedTxt);

   string hostTxt = SEED_OffsetText(hostOffsetNow);
   int    diff    = h.serverGmtBase - hostOffsetNow;

   if(diff == 0)
      return StringFormat("server offset %s, seed agrees (advisory only)", hostTxt);

   if(MathAbs(diff) <= 3600)
      return StringFormat("server offset: host %s, seed %s - a 1h difference is EXPECTED "
                          "across a DST season and is not a fault (advisory only)",
                          hostTxt, seedTxt);

   return StringFormat("server offset: host %s, seed %s - a difference this large usually "
                       "means the seed was built on a DIFFERENT BROKER. Not refused, because "
                       "this figure comes from the local PC clock. Check the symbol names "
                       "(advisory only)", hostTxt, seedTxt);
  }

#endif // __SRJ_SEEDFORMAT_MQH__