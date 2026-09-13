//+------------------------------------------------------------------+
//|                                        SRJ_FlowNexus_EA.mq5      |
//|   SRJ Flow Nexus - Phase 1 signal-generator EA (Part A/B spec)   |
//+------------------------------------------------------------------+
#property copyright "SRJ Ventures"
#property version   "1.00"
#property description "SRJ Flow Nexus Phase 2 EA - Orchestrator and Trade Execution"
#property strict

#include <SRJ\SRJ_TickCore.mqh>
#include <Trade\Trade.mqh>

CTrade g_trade;

//--- TASK 14: Mode enum. Declared here (before the input section) so
//--- InpMode can reference it. Planner specified "after ENUM_SRJ_SLMODE"
//--- but that sits below the inputs and MQL5 requires the enum visible
//--- at the input declaration point. No existing code was moved.
enum ENUM_SRJ_MODE { MODE_ALERT_ONLY = 0, MODE_EXECUTE = 1 };

//====================== Inputs =======================================
input group "Upstream indicator paths"
input string InpPoiMarkerName   = "SRJ_POI_Marker";
input string InpCqdName         = "SRJ_CQD_TickBased_MT5";
input string InpFlowLogicName   = "SRJ_FlowLogic";

input group "Trade Settings"
input double InpRiskPercent     = 1.0;
input long   InpMagicBase       = 773000;

input group "Operating mode"
input ENUM_SRJ_MODE InpMode = MODE_ALERT_ONLY;   // ALERT_ONLY sends no orders

input group "Alerting"
input bool   InpAlertPopup     = true;    // terminal popup + sound
input bool   InpAlertPush      = true;    // push to MetaQuotes ID (see Terminal>Options>Notifications)
input bool   InpAlertHeadsUp   = true;    // alert on S4 entry (zone armed)
input bool   InpAlertStandDown = true;    // alert when an armed sequence aborts

input group "POI Marker parameters (match production instance)"
input bool   InpPoi_UseSeed      = true;
input double InpPoi_BinPips      = 0.1;
input int    InpPoi_WeightMode   = 0;

input group "CQD parameters (match production instance)"
input bool   InpCqd_NoReset      = false;
input int    InpCqd_MaxCarryBars = 12;
input int    InpCqd_MaxBackfillDays = 30;

input group "FlowLogic parameters (match production instance)"
input int    InpFL_HtfLookbackBars = 3000;

input group "Readiness"
input int    InpMinBarsRequired = 100;

input group "Gates"
input double InpMinRewardRisk   = 1.0;

input group "Diagnostics"
input bool   InpDebugLog        = false;

//====================== POI Marker buffer indices ===================
#define POI_BUF_D_POC    0
#define POI_BUF_D_VWAP   1
#define POI_BUF_W_POC    2
#define POI_BUF_W_VWAP   3
#define POI_BUF_M_POC    4
#define POI_BUF_M_VWAP   5
#define POI_BUF_Q_POC    6
#define POI_BUF_Q_VWAP   7
#define POI_BUF_Y_POC    8
#define POI_BUF_Y_VWAP   9
#define POI_BUF_F_POC    10
#define POI_BUF_F_VWAP   11
#define POI_NLINES       12

int    g_authorityRank[POI_NLINES];
string g_lineCode[POI_NLINES];

void InitAuthorityTable()
  {
   g_authorityRank[POI_BUF_F_POC]  = 0;   g_lineCode[POI_BUF_F_POC]  = "FOMC-POC";
   g_authorityRank[POI_BUF_F_VWAP] = 1;   g_lineCode[POI_BUF_F_VWAP] = "FOMC-VWAP";
   g_authorityRank[POI_BUF_Y_POC]  = 2;   g_lineCode[POI_BUF_Y_POC]  = "Yearly-POC";
   g_authorityRank[POI_BUF_Y_VWAP] = 3;   g_lineCode[POI_BUF_Y_VWAP] = "Yearly-VWAP";
   g_authorityRank[POI_BUF_Q_POC]  = 4;   g_lineCode[POI_BUF_Q_POC]  = "Quarterly-POC";
   g_authorityRank[POI_BUF_Q_VWAP] = 5;   g_lineCode[POI_BUF_Q_VWAP] = "Quarterly-VWAP";
   g_authorityRank[POI_BUF_M_POC]  = 6;   g_lineCode[POI_BUF_M_POC]  = "Monthly-POC";
   g_authorityRank[POI_BUF_M_VWAP] = 7;   g_lineCode[POI_BUF_M_VWAP] = "Monthly-VWAP";
   g_authorityRank[POI_BUF_W_POC]  = 8;   g_lineCode[POI_BUF_W_POC]  = "Weekly-POC";
   g_authorityRank[POI_BUF_W_VWAP] = 9;   g_lineCode[POI_BUF_W_VWAP] = "Weekly-VWAP";
   g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
   g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
  }

//====================== [P-BUILD3 E1 2026-09-11] the line supersession helpers ==
//--- DEFINED after DetectPoiRetest: they need g_hPoi, ReadBuf1, ENUM_SRJ_DIR
//--- and POI_NLINES (all declared below the rank table).

//====================== [P-EXITMODEL] the managed trade (spec section 5) =============
// The post-signal record: spec section 4 site 3 (the exit, evaluated at the NEXT
// candle's open) + sections 5.1-5.6. It SURVIVES ResetSequence (the R-201 pattern) -
// it is NOT a working-set field and ResetSequence does not clear it. ALERT-ONLY is
// preserved: every verdict is an EXITCENSUS line; an actual exit also emits the EXIT
// alert. No order is ever sent from this phase.
#define MT_SCOPE_ANCHOR      0
#define MT_SCOPE_FAMILY_POC  1
#define MT_SCOPE_ALL         2
//--- EXIT_SCOPE (a compile-time constant, the section 4 toggle precedent - NOT a user
//--- input): which lines carry the section 5.1 body-close early exit, classified
//--- through the ruled hierarchy (AVP-POC over VWAP inside each family; charter 9.1:
//--- a VWAP close does NOT exit a POC-anchored trade; the origin/anchor line's own
//--- break DOES exit). A line's own GAP/MOVE alone never exits (section 1.3); the
//--- exit is PRICE's BODY close through a BEHIND trigger line (body = open -> next
//--- open, the T161K convention; operator ruling: "it must be body"). Session levels
//--- behind the trade are TP-touch only, never body-close triggers (section 5.1).
#define MT_EXIT_SCOPE        MT_SCOPE_FAMILY_POC
//--- section 5.6 toggle (compile-time, NOT a user input): the HTF aggregate flip
//--- exits trend-following trades at the flipping HTF candle's confirmation close.
//--- Default ON per spec ("default, scoped to trend-following").
#define MT_HTF_EXIT          true

//--- [P-CONFIRM-SHADOW 2026-09-10] build 1 of the council design (COUNCIL_RESPONSE_POI-R.md
//--- sequencing step 1): LOG-ONLY instruments. Zero behavior change - every print below is
//--- additive and guarded by InpDebugLog && the shadow constant. Flip a constant to false
//--- for a byte-identical silence.
#define SHADOW_RETESTBOOK    true
#define SHADOW_CONFIRMPOLL   true
#define SHADOW_TP_ELECT      true
#define SHADOW_SLIMB         true
#define SHADOW_SLIMBWALK     true

enum ENUM_MT_STATE
  {
   MT_INACTIVE     = 0,
   MT_PENDING_FILL = 1,
   MT_MANAGING     = 2,
   MT_CLOSED       = 3
  };
enum ENUM_MT_EXIT
  {
   MT_EXIT_NONE          = 0,
   MT_EXIT_TP_TOUCH      = 1,
   MT_EXIT_POI_BODY_BREAK= 2,
   MT_EXIT_SL            = 3,
   MT_EXIT_HTF_FLIP      = 4,
   MT_EXIT_FILL_INVALID  = 5,
   MT_EXIT_CANCEL_BIAS   = 6,
   MT_EXIT_REPLACED      = 7
  };

// NOTE (P-EXITMODEL): the SManagedTrade struct, g_mtrade, MtExitName() and MtReset()
// are declared FURTHER DOWN, after the EA's own ENUM_SRJ_* enum block (they need
// ENUM_SRJ_DIR/ENUM_SRJ_REGIME, declared at ~L239-242 of this file).

//====================== CQD buffer index ==============================
#define CQD_BUF_DIVVERDICT  6

//====================== FlowLogic buffer indices =====================
#define FL_BUF_LTF_BIAS      2
#define FL_BUF_LTF_OB_VALID  3
#define FL_BUF_LTF_FVG_VALID 4
#define FL_BUF_LTF_OPP_FVG   5
#define FL_BUF_SWING_HIGH    6
#define FL_BUF_SWING_LOW     7
#define FL_BUF_SWING_HIGH_IMB 37
#define FL_BUF_SWING_LOW_IMB  38
#define FL_BUF_OB_SWING_TIME  39
#define FL_BUF_PDAY_HIGH     8
#define FL_BUF_PDAY_LOW     9
#define FL_BUF_ASIA_HIGH     10
#define FL_BUF_ASIA_LOW     11
#define FL_BUF_LONDON_HIGH   12
#define FL_BUF_LONDON_LOW    13
#define FL_BUF_NY_HIGH       14
#define FL_BUF_NY_LOW       15
#define FL_BUF_PM_HIGH       16
#define FL_BUF_PM_LOW       17
#define FL_BUF_SWEEP_TAG     18
#define FL_BUF_HTF_HIGH      19
#define FL_BUF_HTF_MID       20
#define FL_BUF_HTF_LOW       21

#define FL_BUF_XOB_ZONE_HIGH     22
#define FL_BUF_XOB_ZONE_LOW      23
#define FL_BUF_FVG_LEG_ZONE_HIGH 24
#define FL_BUF_FVG_LEG_ZONE_LOW 25

#define SWEEP_NONE        0
#define SWEEP_ASIA_HIGH   1
#define SWEEP_ASIA_LOW   2
#define SWEEP_LONDON_HIGH 3
#define SWEEP_LONDON_LOW  4
#define SWEEP_NY_HIGH     5
#define SWEEP_NY_LOW     6
#define SWEEP_PM_HIGH     7
#define SWEEP_PM_LOW     8

//====================== State machine types ==========================
enum ENUM_SRJ_STATE
  { ST_IDLE, ST_S1_REGIME, ST_S2_LTF_ALIGN, ST_S3_ZONE_WAIT,
    ST_S4_ARMED, ST_S5_GATE_CHECK, ST_SIGNAL, ST_ABORT };

enum ENUM_SRJ_DIR     { DIR_NONE=0, DIR_LONG=1, DIR_SHORT=-1 };
enum ENUM_SRJ_REGIME  { REGIME_NONE=0, REGIME_TREND=1, REGIME_MEANREV=2, REGIME_BOTH=3 };
enum ENUM_SRJ_SESSION { SESSION_NONE=0, SESSION_LONDON=1, SESSION_NYAM=2 };
enum ENUM_SRJ_SLMODE  { SL_MODE_NONE=0, SL_MODE_1SWING=1, SL_MODE_2SWING=2 };

//====================== [P-EXITMODEL] the managed trade (spec section 5) =============
// Declared HERE (after the EA's own ENUM_SRJ_* block) because SManagedTrade carries
// ENUM_SRJ_DIR and the regime int. The #defines/ENUM_MT_* live at the top of the file.
struct SManagedTrade
  {
   bool         active;
   int          state;             // ENUM_MT_STATE
   ENUM_SRJ_DIR dir;
   int          anchorLine;        // POI_BUF_*
   double       anchorPrice0;      // provenance only (tests use current values, 5.2)
   datetime     anchorBarTime;
   int          sessionAtEntry;    // ENUM_SRJ_SESSION as int
   double       entryPrice;        // the S5 next-open reference = the fill level
   double       slRef;             // the latched two-branch stop
   double       tpRef;             // the admission TP figure (provenance)
   int          regimeAtAdmission; // ENUM_SRJ_REGIME as int (drives the 5.6 scope)
   datetime     fillBarTime;       // the fill candle's OPEN time (the next candle)
   datetime     signalBarTime;     // the confirming candle's open time
   int          exitReason;        // ENUM_MT_EXIT
   datetime     exitBarTime;
   double       exitPrice;
  };
SManagedTrade g_mtrade;

string MtExitName(const int r)
  {
   switch(r)
     {
      case MT_EXIT_TP_TOUCH:        return "TP_TOUCH";
      case MT_EXIT_POI_BODY_BREAK:  return "POI_BODY_BREAK";
      case MT_EXIT_SL:              return "SL";
      case MT_EXIT_HTF_FLIP:        return "HTF_FLIP";
      case MT_EXIT_FILL_INVALID:    return "FILL_INVALID";
      case MT_EXIT_CANCEL_BIAS:     return "CANCEL_BIAS";
      case MT_EXIT_REPLACED:        return "REPLACED";
     }
   return "NONE";
  }

void MtReset()
  {
   g_mtrade.active            = false;
   g_mtrade.state             = MT_INACTIVE;
   g_mtrade.dir               = DIR_NONE;
   g_mtrade.anchorLine        = -1;
   g_mtrade.anchorPrice0      = 0.0;
   g_mtrade.anchorBarTime     = 0;
   g_mtrade.sessionAtEntry    = -1;
   g_mtrade.entryPrice        = 0.0;
   g_mtrade.slRef             = 0.0;
   g_mtrade.tpRef             = 0.0;
   g_mtrade.regimeAtAdmission = 0;
   g_mtrade.fillBarTime       = 0;
   g_mtrade.signalBarTime     = 0;
   g_mtrade.exitReason        = MT_EXIT_NONE;
   g_mtrade.exitBarTime       = 0;
   g_mtrade.exitPrice         = 0.0;
  }


//====================== Abort reason codes ============================
#define ABORT_FRESH_OB_DEAD    "FRESH_OB_DEAD"
#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"
#define ABORT_TP_RR_FAIL       "TP_RR_FAIL"
#define ABORT_NO_REGIME        "NO_REGIME"
#define ABORT_LTF_MISALIGN     "LTF_MISALIGN"
#define ABORT_UPSTREAM_UNREADY "UPSTREAM_UNREADY"
#define ABORT_SESSION_LIMIT    "SESSION_LIMIT"
#define ABORT_SESSION_CLOSED   "SESSION_CLOSED"
#define ABORT_LOT_TOO_SMALL    "LOT_TOO_SMALL"
#define ABORT_CONCURRENCY      "CONCURRENCY_LIMIT"
//--- TASK 21 (EA-21): S5_NO_SL_REF and S5_NO_TP_TARGET previously aborted
//--- with reason=TP_RR_FAIL, which misattributes the cause in the journal.
//--- These two codes are diagnostic only Ã¢â‚¬â€ no gate reads a reason string.
#define ABORT_NO_SL_REF        "NO_SL_REF"
#define ABORT_NO_TP_TARGET     "NO_TP_TARGET"
//--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;
//--- no gate reads an abort reason.
#define ABORT_POI_REPLACED     "POI_REPLACED"

//====================== [Task 160] Migration data contracts ==========
// Twelve data contracts as an INERT ARCHITECTURE SHELL. Types only.
// Nothing declares an instance and nothing reads a field, so this block
// emits no code and the Tier 1 regression is byte-identical by
// construction. Specification: COUNCIL_RULING_TASK159.md and
// REVISION_60 section 9.
//
// WHY THESE LIVE IN THE EA AND NOT IN SRJ_Types.mqh (R-103, R-111):
// the EA includes exactly two files, SRJ_TickCore.mqh and
// Trade\Trade.mqh, and SRJ_TickCore.mqh includes nothing. No transitive
// path reaches SRJ_Types.mqh or SRJ_State.mqh. A contract declared
// there would compile in Task 160 and FAIL IN TASK 161. Every consumer
// through Milestone 6 is in this file. The EA already carries a
// file-scope struct at PoiRetestResult, so this follows the tree's own
// precedent rather than introducing a pattern (P13).
//
// ABSENCE IS STRUCTURAL, NEVER A SENTINEL VALUE (R-112). SRJ_NA_INT,
// SRJ_NA_DBL and SRJ_NA_STR are SRJ_Types.mqh-local and unreachable
// here. Duplicating one would create a second definition whose
// agreement with the first is unestablished - EA-173's exact failure
// mode, on the value every UNKNOWN would rest on. So a three-valued
// fact carries a tri-state enum, an optional record carries a has_*
// boolean beside it, and an object resolution carries its own enum.
//
// EVERY ENUM BELOW CARRIES EXPLICIT VALUES AND GROWS BY APPEND ONLY
// (R-121). Value 0 is UNKNOWN or NONE in every one of them, so a zeroed
// struct reads UNKNOWN and never reads a false negative.
//
// NO POINTER AND NO ARRAY INDEX INTO g_orderblocks OR g_imbalances
// APPEARS ANYWHERE BELOW (P16). Every reference goes through SObjectRef,
// which is an objId plus a resolution outcome re-read by identity.

//--- Engineering safety limits, in the precedent of the 500-slot walk
//--- bound (EA-178). Each bounds memory and forbids unbounded growth.
//--- NONE IS A STRATEGY THRESHOLD and none may be read as one. Every
//--- bounded collection below carries a count AND an overflow flag, so
//--- reaching a limit is a RECORDED FACT and never a silent truncation.
#define SRJ_MAX_OPP_FVG_REFS       8
#define SRJ_MAX_HYP_PER_CANDIDATE  8
#define SRJ_MAX_EVENT_OBJREFS      4

//--- Object resolution. GONE is a FIRST-CLASS LIFECYCLE INPUT, not an
//--- error. Its cause is capacity-driven on every one of the four
//--- delete paths, so it may NEVER be attributed to a strategy rule.
enum ENUM_SRJ_RESOLUTION
  { SRJ_RES_UNKNOWN  = 0,
    SRJ_RES_RESOLVED = 1,
    SRJ_RES_GONE     = 2 };

//--- Only COrderblock and CImbalance carry objId. The four HTF types
//--- cannot be referenced at all (EA-155), which is why there is no
//--- HTF member here and adding one would be a false claim.
enum ENUM_SRJ_OBJKIND
  { SRJ_OBK_NONE       = 0,
    SRJ_OBK_ORDERBLOCK = 1,
    SRJ_OBK_IMBALANCE  = 2 };

//--- A boolean that can be genuinely unknown. UNKNOWN is 0 so an
//--- unwritten field is never read as false.
enum ENUM_SRJ_TRI
  { SRJ_TRI_UNKNOWN = 0,
    SRJ_TRI_FALSE   = 1,
    SRJ_TRI_TRUE    = 2 };

//--- Market bias. DELIBERATELY NOT ENUM_SRJ_DIR: bias is a market fact
//--- and direction is a candidate's commitment. Conflating them is on
//--- the must-not-conflate list. The wire form is FlowLogic buffer
//--- FL_BUF_LTF_BIAS and the mapping is made explicit at Task 161's
//--- boundary, never by an implicit cast.
enum ENUM_SRJ_BIAS
  { SRJ_BIAS_UNKNOWN = 0,
    SRJ_BIAS_NONE    = 1,
    SRJ_BIAS_BULLISH = 2,
    SRJ_BIAS_BEARISH = 3 };

//--- THE THIRD SESSION VOCABULARY, and it is not the other two.
//--- ENUM_SRJ_SESSION is the EA's three-member TRADING WINDOW.
//--- SRJ_GetSessionId's four-member LIVE SESSION is this enum.
//--- FlowLogic's sweep tags and the 14-bit mask are the third.
//--- NO TWO OF THE THREE MAY BE COMPARED. The values here deliberately
//--- do NOT equal SRJ_GetSessionId's wire values 0..3, so an accidental
//--- comparison produces a visibly wrong answer instead of a silently
//--- plausible one. Conversion is explicit at the boundary.
enum ENUM_SRJ_LIVESESSION
  { SRJ_LSESS_NA     = 0,
    SRJ_LSESS_ASIA   = 1,
    SRJ_LSESS_LONDON = 2,
    SRJ_LSESS_NY     = 3,
    SRJ_LSESS_PM     = 4 };

//--- Candidate lifecycle. EIGHT STATES, one per candidate edge in
//--- REVISION_60 section 10.2. C5 is a self-edge and mints no state.
//--- ST_IDLE IS NOT A MEMBER: retired to registry emptiness, test 4.
//--- ST_ABORT IS NOT A MEMBER: retired to a recorded rejection, test 4.
//--- CANDIDATE_REJECTED is reached ONLY by a candidate-level rule - the
//--- forgetting rule, POI invalidation, or expiry - and NEVER by the
//--- death of one hypothesis. CANDIDATE_EXPIRED has no evidence field,
//--- deliberately.
//--- CANDIDATE_COMMITTED IS WRITTEN BY PHASE B AND BY NOTHING ELSE.
//--- Edge C9 is the only candidate edge Phase B may drive, and a Phase A
//--- census finding a write to it IS A MILESTONE 5 FAILURE. The build
//--- corroborates: ST_SIGNAL is assigned at 2966 and 3052, both inside
//--- Phase B commit paths, and is COMPARED NOWHERE.
//--- ONE MEMBER IS KNOWN TO BE MISSING AND IS NOT INVENTED HERE.
//--- Section 6.13 rules ST_S3_ZONE_WAIT a candidate state - "offering
//--- observation per A-4 section 5.32" - but section 10.2 gives it no
//--- edge and names no member. IT IS APPENDED AT VALUE 9 BY TASK 161,
//--- which is the first task that drives a candidate edge and therefore
//--- the first that cannot proceed without it.
//--- NO ORDINAL COMPARISON IS PERMITTED ON THIS ENUM. Section 6.13:
//--- "each is a place where a mechanical port would compile and be
//--- wrong." Member order carries no meaning, so appending is safe.
enum ENUM_SRJ_CANDIDATE_STATE
  { CANDIDATE_STATE_UNKNOWN  = 0,
    CANDIDATE_NEW            = 1,
    CANDIDATE_REGIME_WAIT    = 2,
    CANDIDATE_ALIGNMENT_WAIT = 3,
    CANDIDATE_HAS_HYPOTHESES = 4,
    CANDIDATE_COMPLETED      = 5,
    CANDIDATE_COMMITTED      = 6,
    CANDIDATE_REJECTED       = 7,
    CANDIDATE_EXPIRED        = 8,
    CANDIDATE_ZONE_WAIT      = 9 };

//--- Hypothesis lifecycle. TWELVE STATES, one per hypothesis edge in
//--- REVISION_60 section 10.3, with section 10.4 supplying the prefixed
//--- form HYPOTHESIS_SETUP_COMPLETE that fixes the table's shortened
//--- names. This is what section 6.13's "HYPOTHESIS_BOUND onward" was
//--- pointing at.
//--- HYPOTHESIS_UNBOUND IS RETIRED UNIMPLEMENTED: a bundle holds
//--- bindingBar, so a hypothesis cannot exist before binding.
//--- The three WAITING members are ST_S5_GATE_CHECK's three limbs. The
//--- build's T5 is two terminators sharing one abort path -
//--- ABORT_NO_TP_TARGET and ABORT_TP_RR_FAIL, both above the divergence
//--- check - which is the split's justification from source rather than
//--- from drafting preference.
//--- HYPOTHESIS_SETUP_COMPLETE IS NOT GUARDED BY THE EXECUTION WINDOW.
//--- The window is Phase B's commit test at edge B4. A guard on H8 would
//--- make structural completion DEPEND ON execution admissibility, so a
//--- structurally perfect setup arriving outside the window would never
//--- appear as a completion at all, and Scenario H would be destroyed.
//--- HYPOTHESIS_BASIS_LOST is terminal, is distinguishable from every
//--- terminator and every rejection reason, and MAY NEVER BE ATTRIBUTED
//--- TO A STRATEGY RULE - every delete path is capacity-driven.
//--- ONLY H2 AND H5 ARE REVERSIBLE EDGES, AND BOTH WRITE state AND
//--- NOTHING ELSE. RETENTION IS NOT REVERSAL: an out-of-session
//--- hypothesis waits while NOTHING IS UNWRITTEN and a terminator simply
//--- does not fire. ANY IMPLEMENTATION THAT REVERTS A FIELD TO REPRESENT
//--- WAITING IS REINTRODUCING THE SINGLETON'S MUTABILITY UNDER A NEW
//--- NAME.
//--- NO ORDINAL COMPARISON IS PERMITTED ON THIS ENUM.
enum ENUM_SRJ_HYPOTHESIS_STATE
  { HYPOTHESIS_STATE_UNKNOWN           = 0,
    HYPOTHESIS_BOUND                   = 1,
    HYPOTHESIS_WAITING_TOUCH           = 2,
    HYPOTHESIS_TOUCHED                 = 3,
    HYPOTHESIS_CONFIRMATION_LATCHED    = 4,
    HYPOTHESIS_WAITING_DIVERGENCE      = 5,
    HYPOTHESIS_WAITING_TARGET_VALIDITY = 6,
    HYPOTHESIS_WAITING_RR              = 7,
    HYPOTHESIS_SETUP_COMPLETE          = 8,
    HYPOTHESIS_PENDING_ENTRY           = 9,
    HYPOTHESIS_REJECTED                = 10,
    HYPOTHESIS_CANCELLED               = 11,
    HYPOTHESIS_BASIS_LOST              = 12 };

//--- A re-expression of the thirteen ABORT_* string literals declared
//--- above at lines 147 through 164. NOT a new vocabulary. Their
//--- partition across candidate level and hypothesis level is TASK 164'S
//--- CENSUS and is not claimed here.
enum ENUM_SRJ_REJECTION
  { SRJ_REJ_NONE              = 0,
    SRJ_REJ_FRESH_OB_DEAD     = 1,
    SRJ_REJ_FRESH_OPP_FVG     = 2,
    SRJ_REJ_TP_RR_FAIL        = 3,
    SRJ_REJ_NO_REGIME         = 4,
    SRJ_REJ_LTF_MISALIGN      = 5,
    SRJ_REJ_UPSTREAM_UNREADY  = 6,
    SRJ_REJ_SESSION_LIMIT     = 7,
    SRJ_REJ_SESSION_CLOSED    = 8,
    SRJ_REJ_LOT_TOO_SMALL     = 9,
    SRJ_REJ_CONCURRENCY_LIMIT = 10,
    SRJ_REJ_NO_SL_REF         = 11,
    SRJ_REJ_NO_TP_TARGET      = 12,
    SRJ_REJ_POI_REPLACED      = 13 };

//--- Terminators as ruled. T1 and T2 span any bound state, H1 through
//--- P8 inclusive - rejection before setup completion, cancellation
//--- after. T3 attaches to the pending entry only and HAS NEVER EXISTED
//--- IN ANY BUILD. T5a and T5b are two terminators, not one.
//--- T4 IS NOT A TERMINATOR AND IS DELIBERATELY ABSENT HERE. It
//--- ADVANCES, on edge H6, and its literal
//--- SRJ_EVK_ADV_T4_DIVERGENCE_CONSUMED is a diagnostic event kind.
enum ENUM_SRJ_TERMINATOR
  { SRJ_TERM_NONE                     = 0,
    SRJ_TERM_T1_STRUCTURE_INVALIDATED = 1,
    SRJ_TERM_T2_BIAS_FLIP             = 2,
    SRJ_TERM_T3_REACHED_BEFORE_FILL   = 3,
    SRJ_TERM_T5A_TARGET_INVALID       = 4,
    SRJ_TERM_T5B_RR_FAIL              = 5 };

//--- Stop selection cause. RULED SIX MEMBERS WIDE. Three are measured
//--- at Tier 1 through the existing src= print and are declared here.
//--- The remaining three of ComputeSlReference's six false exits are
//--- APPENDED FROM VALUE 4 by Task 162's predecessor Form D.
//--- UNTIL THEY LAND, SRJ_SLC_UNKNOWN AND ABORT_NO_SL_REF MAY NOT BE
//--- READ AS "NO STRUCTURE EXISTED".
enum ENUM_SRJ_SL_CAUSE
  { SRJ_SLC_UNKNOWN        = 0,
    SRJ_SLC_OB_SWING       = 1,
    SRJ_SLC_FALLBACK_SIDE  = 2,
    SRJ_SLC_FALLBACK_EMPTY = 3 };

//--- Target selection cause. Five causes collapse into one false return
//--- in TpTargetUpdateBest today: swept mask, anchor tier, empty or
//--- non-positive, direction, zone containment. The existing
//--- SWEPTMASK/TPCENSUS pair already instruments the first two; the
//--- other three need one print, and until it lands ABORT_NO_TP_TARGET
//--- MAY NOT BE READ AS "NO STRUCTURE EXISTED".
enum ENUM_SRJ_TP_CAUSE
  { SRJ_TPC_UNKNOWN              = 0,
    SRJ_TPC_SWEPT_MASK           = 1,
    SRJ_TPC_ANCHOR_TIER          = 2,
    SRJ_TPC_EMPTY_OR_NONPOSITIVE = 3,
    SRJ_TPC_DIRECTION            = 4,
    SRJ_TPC_ZONE_CONTAINMENT     = 5 };

//--- Target level provenance. The tie rule is a strict less-than, so an
//--- exact distance tie goes to the group iterating first: session and
//--- previous-day buffers before POI lines. That is a Scenario G input.
enum ENUM_SRJ_TP_LEVELKIND
  { SRJ_TPK_UNKNOWN          = 0,
    SRJ_TPK_SESSION_EXTREME  = 1,
    SRJ_TPK_PREV_DAY_EXTREME = 2,
    SRJ_TPK_POI_LINE         = 3 };

//--- The no-chase pending entry fills on WICK RETURN ONLY. That is a
//--- different fill rule from a market fill, so it is STORED at
//--- creation and never recomputed.
enum ENUM_SRJ_FILLMODE
  { SRJ_FILL_UNKNOWN          = 0,
    SRJ_FILL_WICK_RETURN_ONLY = 1,
    SRJ_FILL_MARKET           = 2 };

//--- Pending-entry cancellation. INCOMPLETE AND KNOWN TO BE: the
//--- remaining members of A-3 section 5.11's set are APPENDED FROM
//--- VALUE 2 by Task 165.
enum ENUM_SRJ_CANCEL_CAUSE
  { SRJ_CANCEL_NONE                    = 0,
    SRJ_CANCEL_SUPERSEDED_BY_BETTER_R  = 1 };

//--- Phase A's verdict set, complete as specified.
enum ENUM_SRJ_VERDICT
  { SRJ_VER_UNKNOWN    = 0,
    SRJ_VER_NO_CHANGE  = 1,
    SRJ_VER_ADVANCED   = 2,
    SRJ_VER_COMPLETED  = 3,
    SRJ_VER_REJECTED   = 4,
    SRJ_VER_CANCELLED  = 5,
    SRJ_VER_BASIS_LOST = 6 };

//--- Binding event. The S3 to S4 arming transition IS the binding
//--- point. The second value is the zone-replacement path, which
//--- becomes a SIBLING WITH ITS OWN BUNDLE rather than a mutation, so
//--- HYPOTHESIS_SIBLING_CREATED fires at both binding sites.
enum ENUM_SRJ_BINDEVENT
  { SRJ_BIND_UNKNOWN                  = 0,
    SRJ_BIND_S3_TO_S4_ARMING          = 1,
    SRJ_BIND_ZONE_REPLACEMENT_SIBLING = 2 };

//--- Retest event kind. DECLARED WITH ONE MEMBER ON PURPOSE. The
//--- gap-tap recency ruling governs which taps qualify and its member
//--- set is not in council's session, so members are APPENDED FROM
//--- VALUE 1 by Task 162 rather than guessed now.
enum ENUM_SRJ_RETEST_EVENT
  { SRJ_RETEST_UNKNOWN = 0 };

//--- Diagnostic event kinds. EVERY KIND CARRIES ITS OWN DISTINGUISHING
//--- LITERAL - five terminators sharing one kind is the defect this
//--- enum exists to prevent. NO GATE MAY READ AN EVENT and no log line
//--- may ever be selected by a date literal.
//--- HEADS-UP and STAND-DOWN become event kinds here and LOSE THEIR
//--- EMISSION PATH; SIGNAL moves to Phase B. The indicator's five
//--- dispatch sites are out of scope by subject matter - they announce
//--- market-structure facts, not candidate commitments.
enum ENUM_SRJ_EVENTKIND
  { SRJ_EVK_UNKNOWN                    = 0,
    SRJ_EVK_FIELD_LOAD_STORE           = 1,
    SRJ_EVK_HYPOTHESIS_SIBLING_CREATED = 2,
    SRJ_EVK_OBJECT_RESOLUTION          = 3,
    SRJ_EVK_HYPOTHESIS_BASIS_LOST      = 4,
    SRJ_EVK_HYPOTHESIS_REJECTED        = 5,
    SRJ_EVK_CANDIDATE_REJECTED         = 6,
    SRJ_EVK_ADV_T4_DIVERGENCE_CONSUMED = 7,
    SRJ_EVK_ARBITRATION                = 8,
    SRJ_EVK_HEADS_UP                   = 9,
    SRJ_EVK_STAND_DOWN                 = 10,
    SRJ_EVK_POST_FILL_TARGET_REVISED   = 11 };

//--- Contract 1 of 12. THE CONTRACT EVERY OTHER CONTRACT GOES THROUGH.
//--- objId is NEVER MINTED HERE - it is a copy of an existing object's
//--- identity arriving over buffers 31, 32 and 33. It is NEVER a
//--- cross-run key; cross-run comparison uses promotionTime or the
//--- composite. lastFilledObserved exists because the FVG delete path
//--- can remove a record in the fill pass, which would otherwise make a
//--- fill event unrecoverable from a GONE.
struct SObjectRef
  {
   long                objId;
   ENUM_SRJ_OBJKIND    objKind;
   int                 startBar;
   datetime            promotionTime;
   ENUM_SRJ_RESOLUTION resolution;
   int                 resolvedBar;
   ENUM_SRJ_TRI        lastValidObserved;
   ENUM_SRJ_TRI        lastFilledObserved;
  };

//--- Contract 2 of 12. isActivated is monotonic false to true;
//--- isValid is monotonic true to false after invalidation and is
//--- observable through identity for at least one bar before capacity
//--- removal. anatomyQualified is NOT DECLARED - it is derived per
//--- evaluation. tickOBIsValid is EXCLUDED BY NAME: it describes the
//--- last invalidation event, and it is written inside a descending
//--- loop whose last writer is the earliest-inserted invalidating
//--- object.
struct SXobRecord
  {
   SObjectRef ref;
   bool       isBullish;
   double     high;
   double     low;
   double     invalidationLevel;
   int        activationBar;
   bool       isActivated;
   bool       isValid;
   int        invalidationBar;
   bool       hasInvalidationBar;
   bool       isPromoted;
   int        promotionBar;
   bool       hasDrivenRenewal;
  };

//--- Contract 3 of 12. tickFVGIsValid is EXCLUDED BY NAME: it is
//--- unconditionally true at region level and re-derived inside a
//--- nested block from a per-bar ascending re-selection, so copying it
//--- would carry that ambiguity into N records. isFilled is tri-state
//--- because it may never be observable as true when the delete-after-
//--- fill option is set. parentXobRef stays UNKNOWN until Task 163
//--- derives it from the leg; P15 forbids inferring it from proximity.
struct SFvgRecord
  {
   SObjectRef          ref;
   bool                isBullish;
   double              high;
   double              low;
   int                 startBar;
   ENUM_SRJ_TRI        isFilled;
   int                 fillBar;
   bool                hasFillBar;
   ENUM_SRJ_RESOLUTION validityForBundle;
   SObjectRef          parentXobRef;
   bool                hasParentXobRef;
  };

//--- Element type of SStructuralBundle.oppFvgRefs[]. NOT A THIRTEENTH
//--- CONTRACT. This is the opposing-FVG record the ruling specified as
//--- an SObjectRef plus detection time, direction and validation state,
//--- and it is what export buffer 36 was built to supply.
struct SOppFvgEntry
  {
   SObjectRef          ref;
   datetime            detectionTime;
   bool                isBullish;
   ENUM_SRJ_RESOLUTION validationState;
  };

//--- Contract 4 of 12. A BUNDLE NEVER EXISTS UNBOUND, because it holds
//--- bindingBar - which is why HYPOTHESIS_UNBOUND is retired.
//--- legToken is the cross-run form of legBoundaryBar and both are
//--- kept, because the bar index is run-scoped. legMembership is
//--- tri-state because it is evaluated against a value with different
//--- rollback semantics from the objects being compared.
//--- CROSS-RUN SCORING USES relevanceTime, NEVER THE BAR INDEX.
struct SStructuralBundle
  {
   long               bundleId;
   SXobRecord         xob;
   SFvgRecord         fvg;
   bool               hasFvg;
   int                legBoundaryBar;
   bool               hasLegBoundaryBar;
   datetime           legToken;
   bool               hasLegToken;
   ENUM_SRJ_TRI       legMembership;
   int                bindingBar;
   ENUM_SRJ_BINDEVENT bindingEvent;
   datetime           relevanceTime;
   SOppFvgEntry       oppFvgRefs[SRJ_MAX_OPP_FVG_REFS];
   int                oppFvgCount;
   bool               oppFvgOverflow;
  };

//--- Contract 5 of 12. One per evaluated bar, immutable once built.
//--- barClosed IS INVARIANT TRUE BY CONSTRUCTION ON THE EA PATH. The EA
//--- has no barClosed, no prev_calculated, no rates_total and no
//--- g_lastBarTime; the fact is a function-static tested once and
//--- discarded before evaluation is entered. THIS FIELD IS THE
//--- INVARIANT STATED IN SOURCE AND IS NOT AN AUDIT OF A FACT THE EA
//--- CAN READ.
//--- executionWindowAdmissible is NOT DECLARED - it is derived from
//--- tradingWindow inside Phase B's commit test.
//--- tradingWindow and sessionLiveId ARE DIFFERENT VOCABULARIES AND ARE
//--- NEVER COMPARED TO EACH OTHER.
struct SMarketSnapshot
  {
   int                  barIndex;
   datetime             barTime;
   bool                 barClosed;
   double               open;
   double               high;
   double               low;
   double               close;
   ENUM_SRJ_BIAS        bias;
   ENUM_SRJ_REGIME      regime;
   int                  sweptMask;
   bool                 hasSweptMask;
   ENUM_SRJ_SESSION     tradingWindow;
   ENUM_SRJ_LIVESESSION sessionLiveId;
  };

//--- Contract 6 of 12. ONE ORDERING CONSEQUENCE IS ENCODED HERE: the
//--- stop leg is an INPUT TO TOUCH ADMISSIBILITY, before setup
//--- completion, so the write point splits. legIdentity and
//--- legBoundaryBarAtLatch latch AT BINDING; refPrice, refBar and
//--- placementRule latch AT THE RULED PLACEMENT POINT. Both halves are
//--- write-once.
//--- zoneDependent must be RECORDED, because selection reads the zone
//--- globals in control flow - inert before arming, live after.
//--- unionExtremeAvailable is false until Task 131 exports the union
//--- extreme. Two components: the bound XOB and the in-bias FVG.
struct SStopReference
  {
   int               legIdentityBar;
   bool              hasLegIdentity;
   int               legBoundaryBarAtLatch;
   bool              hasLegBoundaryBarAtLatch;
   SObjectRef        sourceObjectRef;
   bool              hasSourceObjectRef;
   double            refPrice;
   bool              hasRefPrice;
   int               refBar;
   ENUM_SRJ_SLMODE   placementRule;
   ENUM_SRJ_SL_CAUSE selectionCause;
   bool              zoneDependent;
   double            unionExtremeHigh;
   double            unionExtremeLow;
   bool              unionExtremeAvailable;
   SObjectRef        unionExtremeComponents[2];
   int               unionExtremeComponentCount;
  };

//--- Contract 7 of 12, ADMISSION HALF ONLY. The post-fill revision is
//--- a SEPARATE RECORD owned by the position and exit manager with its
//--- own cause enumeration, because after fill the zone is spent.
//--- zoneDependent is IMMUTABLE IDENTITY AT LATCH.
//--- admissionR is NOT DECLARED - never stored as evidence, never
//--- quoted as an outcome.
//--- A session extreme is admissible at admission when it is CLOSED,
//--- UNSWEPT and NOT CLOSED OVER. A live session extreme is NOT
//--- admissible, ruled.
struct STargetReference
  {
   ENUM_SRJ_TP_LEVELKIND levelKind;
   ENUM_SRJ_LIVESESSION  levelSessionId;
   double                levelPrice;
   bool                  hasLevelPrice;
   int                   latchedBar;
   bool                  sessionClosedAtLatch;
   bool                  zoneDependent;
   ENUM_SRJ_TP_CAUSE     selectionCause;
   bool                  tieRuleStrictLess;
  };

//--- Contract 8 of 12. THE DIVERGENCE LATCH IS CANDIDATE-LEVEL, moved
//--- here from the hypothesis: the build resets it beside the anchor
//--- bar time and the entry session. CONSEQUENCE FOR TASK 162:
//--- SIBLINGS SHARE THE DIVERGENCE LATCH. "It inherits nothing" governs
//--- the hypothesis-level set - bundle, opposing candle, confirmation,
//--- the adverse triple - not this shared set.
//--- THREE THINGS ARE DELIBERATELY NOT CANDIDATE FIELDS: the session
//--- throttle stays file-global and is written by Phase B after a
//--- winner commits; the zone belongs to the hypothesis; and candidate
//--- expiry has no field because its trigger is unnamed.
//--- tradingWindowAtAdmission is IMMUTABLE IDENTITY, single live write,
//--- edge C1.
struct SCandidate
  {
   long                     candidateId;
   ENUM_SRJ_DIR             dir;
   int                      poiAnchorLine;
   double                   poiAnchorPrice;
   bool                     hasPoiAnchorPrice;
   datetime                 poiAnchorBarTime;
   int                      retestBar;
   bool                     hasRetestBar;
   ENUM_SRJ_RETEST_EVENT    retestEvent;
   ENUM_SRJ_REGIME          regimeAtAdmission;
   ENUM_SRJ_SESSION         tradingWindowAtAdmission;
   ENUM_SRJ_CANDIDATE_STATE state;
   long                     hypothesisIds[SRJ_MAX_HYP_PER_CANDIDATE];
   int                      hypothesisCount;
   bool                     hypothesisOverflow;
   int                      createdBar;
   ENUM_SRJ_REJECTION       rejectionReason;
   int                      rejectionBar;
   bool                     hasRejectionBar;
   ENUM_SRJ_TRI             divergenceVerdict;
   int                      divergenceConsumedBar;
   bool                     hasDivergenceConsumedBar;
  };

//--- Contract 9 of 12. bundle is MANDATORY, never optional.
//--- siblingRank is DIAGNOSTIC ONLY: a sibling inherits nothing at
//--- hypothesis level, so NO GATE MAY READ THE LINK.
//--- THE ZONE IS SUPPLIED EXPLICITLY, NOT READ FROM A GLOBAL. Before
//--- binding the caller passes an EXPLICIT ABSENCE - hasZone false -
//--- and not a zero. After binding it passes the bundle's zone. A
//--- mechanical retirement of the zone globals compiles and silently
//--- moves every target and every stop, so the retirement must
//--- reproduce the record's only stop exactly.
//--- touchAdmissible is NOT DECLARED. It is touchBar strictly greater
//--- than bundle.xob.promotionBar, derived, and the STRICTLY-AFTER rule
//--- applies to BOTH satisfiers - a swing on the promotion candle and
//--- the promotion candle's own range reaching the zone.
//--- confirmationBar, confirmationClose and confirmationTime are ABSENT
//--- FROM THE BUILD; latching them here is the repair. The same close
//--- is the operand of three stop-side tests.
//--- THE ADVERSE TRIPLE IS THE 2-OF-3, and each member carries its own
//--- SObjectRef - which is exactly what export buffers 34, 35 and 36
//--- were built to supply. adverseCount is NOT DECLARED: a count over
//--- three named latches is a derivation.
//--- THERE IS NO CONFLUENCE FIELD. The positive-confluence concept does
//--- not exist in any document council holds and is not invented here.
struct SHypothesis
  {
   long                      hypothesisId;
   long                      candidateId;
   SStructuralBundle         bundle;
   int                       siblingRank;
   ENUM_SRJ_HYPOTHESIS_STATE state;
   double                    zoneHi;
   double                    zoneLo;
   bool                      hasZone;
   bool                      touchLatched;
   int                       touchBar;
   bool                      hasTouchBar;
   double                    touchBarHigh;
   double                    touchBarLow;
   int                       confirmationBar;
   bool                      hasConfirmationBar;
   double                    confirmationClose;
   bool                      hasConfirmationClose;
   datetime                  confirmationTime;
   SStopReference            stopRef;
   STargetReference          targetRef;
   bool                      adverseInBiasObInvalidated;
   SObjectRef                adverseInBiasObRef;
   bool                      adverseInBiasFvgInvalidated;
   SObjectRef                adverseInBiasFvgRef;
   bool                      adverseOpposingFvgValidated;
   SObjectRef                adverseOpposingFvgRef;
   ENUM_SRJ_REJECTION        rejectionReason;
   int                       rejectionBar;
   bool                      hasRejectionBar;
   ENUM_SRJ_CANCEL_CAUSE     cancellationReason;
   ENUM_SRJ_TERMINATOR       terminator;
   bool                      alertedArmed;
   bool                      alertedSignal;
   int                       basisLostBar;
   bool                      hasBasisLostBar;
  };

//--- Contract 10 of 12. THE BETTER-R REFERENCE CREATES A REPLACEMENT
//--- RECORD, never a mutation - mutating entryPrice would reintroduce
//--- the recomputed-close defect inside its own repair.
//--- T3 IS WHY THIS IS NOT FOLDED INTO THE HYPOTHESIS: target or stop
//--- reached before fill terminates the PENDING ENTRY, not the setup.
//--- The no-chase test DOMINATES and is evaluated first.
//--- noChaseBound is NOT DECLARED - it is a transition rule recomputed
//--- from the latched confirmation, not a stored bound.
struct SPendingEntry
  {
   long                  pendingId;
   long                  hypothesisId;
   double                entryPrice;
   int                   entryPriceSourceBar;
   int                   createdBar;
   ENUM_SRJ_FILLMODE     fillMode;
   bool                  noChaseDominant;
   bool                  wickReturnSeen;
   ENUM_SRJ_CANCEL_CAUSE cancellationReason;
   ENUM_SRJ_TERMINATOR   terminator;
   int                   fillBar;
   bool                  hasFillBar;
   double                fillPrice;
  };

//--- Contract 11 of 12. PHASE A'S OUTPUT, AND ITS OMISSIONS ARE
//--- MILESTONE 5'S PROOF. There is deliberately NO signal flag, NO
//--- session-usage field, NO order reference, NO arbitration outcome
//--- and NO emission state. Task 164's census compares Phase A's region
//--- against the six-line commit surface, and a record that could hold
//--- any of those would make the census answer nothing.
//--- A PHASE A OUTPUT MAY NOT CARRY A PHASE B FIELD.
struct SDecision
  {
   long                      hypothesisId;
   int                       snapshotBarIndex;
   ENUM_SRJ_HYPOTHESIS_STATE stateBefore;
   ENUM_SRJ_HYPOTHESIS_STATE stateAfter;
   ENUM_SRJ_VERDICT          verdict;
   int                       completionBar;
   bool                      hasCompletionBar;
   int                       anchorTier;
   ENUM_SRJ_REJECTION        rejectionReason;
  };

//--- Contract 12 of 12. NO GATE MAY READ AN EVENT. objectRefs holds
//--- SObjectRef VALUES ONLY - never a pointer, never an array index.
//--- The payload is diagnostic only and no gate may read it.
struct SDiagnosticEvent
  {
   ENUM_SRJ_EVENTKIND eventKind;
   int                barIndex;
   datetime           barTime;
   long               candidateId;
   bool               hasCandidateId;
   long               hypothesisId;
   bool               hasHypothesisId;
   SObjectRef         objectRefs[SRJ_MAX_EVENT_OBJREFS];
   int                objectRefCount;
   bool               objectRefOverflow;
   double             payloadA;
   double             payloadB;
   int                payloadI;
  };

//====================== end [Task 160] contracts ===================
//====================== Singleton sequence state ====================
ENUM_SRJ_STATE   g_state          = ST_IDLE;
ENUM_SRJ_DIR     g_dir            = DIR_NONE;
ENUM_SRJ_REGIME  g_regime         = REGIME_NONE;
ENUM_SRJ_SESSION g_sessionAtEntry = SESSION_NONE;
int              g_anchorLine     = -1;
double           g_anchorPrice    = 0.0;
datetime         g_anchorBarTime  = 0;
bool             g_divLatch       = false;
bool             g_touchSeen      = false;
//--- [Task 35 / EA-36] The touch bar's own range, stored when the touch latch
//--- sets, so the latch can be revalidated if the zone subsequently moves.
//--- 0.0 means no touch recorded. Cleared in ResetSequence().
double           g_touchBarHi     = 0.0;
double           g_touchBarLo     = 0.0;
double           g_zoneHi         = 0.0;
double           g_zoneLo         = 0.0;
bool             g_sessionUsed_London    = false;
bool             g_sessionUsed_NYAM      = false;
datetime         g_sessionUsedDay_London = 0;
datetime         g_sessionUsedDay_NYAM   = 0;

//--- TASK 14b: per-sequence alert latches. Cleared in ResetSequence().
bool             g_alertedArmed   = false;
bool             g_alertedSignal  = false;

//--- [P-CONFIRM-GATE E4 2026-09-10] the R-latch fields, latched ONCE at the
//--- confirmation close (entry = the next open, SL = the swing, TP = the closest
//--- line - the selector unchanged) and tested ONCE. Cleared in ResetSequence()
//--- and therefore working-set members (the membership rule: a field added to
//--- ResetSequence joins the working set).
double           g_latchedEntry   = 0.0;
double           g_latchedSl      = 0.0;
double           g_latchedTp      = 0.0;
double           g_latchedR       = 0.0;
datetime         g_latchBarTime   = 0;
//--- [P-CONFIRM-ANYSTATE E4 2026-09-11] the promotion-origin state: set at every
//--- confirmation promotion (the S4 edge and the new pre-bind site), read by the
//--- CONFIRM_DIV_WAIT rollback. Cleared in ResetSequence() and therefore a
//--- working-set member (field 20, the membership rule).
ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;

//--- [P-SWINGIMB-3 E10] instrument-owned file-scope SLIMBR shadows: stamped by
//--- SlimbWalkEmit on every evaluated call (barTime + site + base + nuance +
//--- class) and read once per S5 invocation for the R-cost print. HARD
//--- BOUNDARY: never cleared in ResetSequence(), never working-set members,
//--- no gate reads them. WS161 fields stays 21 by construction.
datetime         g_slimbr_barTime = 0;
string           g_slimbr_site    = "";
double           g_slimbr_base    = 0.0;
double           g_slimbr_nuance  = 0.0;
string           g_slimbr_class   = "";
//--- [P-SLDEF-1 E11/E12] fractal-limb shadows + decision accumulator. Same
//--- hard boundary as above: never in ResetSequence, never working set.
double           g_slimbr_fracBase    = 0.0;
double           g_slimbr_fracNuance  = 0.0;
string           g_slimbr_fracClass   = "";
string           g_slimbr_decision    = "";
int              g_slimbr_decisionN   = 0;
//--- [P-SLDEF-1 E14] N1 equality counters (code-read grounding, no branching).
int              g_n1_poiEqBody = 0;
int              g_n1_poiEqWick = 0;
int              g_n1_vwapEq    = 0;
int              g_n1_pocEq     = 0;
//--- [P-SLDEF-1b E19] N1 verdict pairing: each equality family paired with the
//--- site's resulting verdict. No comparison changes; every increment below
//--- sits beside (never inside) a branch. Verdict definitions: entry site =
//--- DetectPoiRetest's return (true = setup lived despite equality); A2 site =
//--- function return (true = confirmation lived); exit site = the EXITCENSUS
//--- line verdict (ok = equality did not break, BREAK = coincided with break).
//--- surv+inv per family reproduces the unpaired counter exactly.
int              g_n1_entryWickSurv = 0;
int              g_n1_entryWickInv  = 0;
int              g_n1_entryBodySurv = 0;
int              g_n1_entryBodyInv  = 0;
int              g_n1_vwapSurv = 0;
int              g_n1_vwapInv  = 0;
int              g_n1_pocSurv  = 0;
int              g_n1_pocInv   = 0;
int              g_n1_exitBodySurv = 0;
int              g_n1_exitBodyInv  = 0;
//--- [P-SLDEF-1b E18] carve-out operand shadows: stamped by SlimbWalkEmit per
//--- limb whenever that limb's walk fires the carve-out (class CARVEOUT_FIRED),
//--- read once per S5 invocation for the SLIMBRCARVE companion print. Same hard
//--- boundary as the SLIMBR shadows above. retV = retained reference (anchor);
//--- skip = the newer walked-past swing (wick-only more-extreme); bodyS = its
//--- body extreme through ApexShift; bodyThru = core's body comparison (1/0).
double           g_slimbr_obRetV     = 0.0;
int              g_slimbr_obSkipS    = -1;
double           g_slimbr_obSkipV    = 0.0;
int              g_slimbr_obSkipF    = -1;
string           g_slimbr_obBodyS    = "-";
int              g_slimbr_obBodyThru = -1;
double           g_slimbr_frRetV     = 0.0;
int              g_slimbr_frSkipS    = -1;
double           g_slimbr_frSkipV    = 0.0;
int              g_slimbr_frSkipF    = -1;
string           g_slimbr_frBodyS    = "-";
int              g_slimbr_frBodyThru = -1;
int              g_slimbr_carveOB = 0;
int              g_slimbr_carveFR = 0;
//--- [P-SLDEF-5 E36] carve-fired booleans from the predicate itself, per
//--- limb (-1 = walk did not run). Same hard boundary as the SLIMBR shadows.
int              g_slimbr_obCarveF = -1;
int              g_slimbr_frCarveF = -1;
//--- [P-SLDEF-5 E35/E39] ext-1 shadow store: stamped at the S5 SLIMBR site
//--- (the only site with a live entry price), read at the RR_FAIL/PASS sites
//--- of the same invocation. Bar-time guarded; never a selection input.
datetime         g_slext_barT = 0;
int              g_slext_defined = 0;
double           g_slext_px = 0.0;
double           g_slext_r = 0.0;
double           g_slext_rewardPts = 0.0;
double           g_slext_riskPts = 0.0;
string           g_slext_todayXi = "-";
//--- [P-SLDEF-5 E39/gate 11] adoption-cost tallies (print-only).
int              g_slext_newN = 0;
int              g_slext_lostN = 0;
string           g_slext_newRows = "";
string           g_slext_lostRows = "";
int              g_slext_outP = 0, g_slext_outN = 0, g_slext_outZ = 0;
//--- [P-SLDEF-6 E41] 481-site origin handoff + shadow stash. The S5 caller
//--- stamps the strict next-open origin synchronously before its direct
//--- call; S2POLL/S3ARM read the eval-bar close inside the function (the
//--- shared memo-path convention both sites' live R already uses). The
//--- stash carries this invocation's shadow to the memo COMPUTE capture.
//--- Print-only; never a selection input.
double           g_sl41_oPx = 0.0;
datetime         g_sl41_oBT = 0;
string           g_sl41_oSite = "-";
datetime         g_sl41_oStamp = 0;
int              g_sl41_def = 0;
double           g_sl41_px = 0.0;
int              g_sl41_slot = -1;
datetime         g_sl41_bt = 0;
int              g_sl41_imb = -1;
int              g_sl41_deep = -1;
//--- [P-SLDEF-6 E43] S5 memo-probe tallies (print-only).
int              g_sl43_probed = 0;
int              g_sl43_hits = 0;
int              g_sl43_agree = 0;
//--- [P-SLDEF-6 E45.3] predicate carve totals at fresh S5 rows (print-only;
//--- the consequence companions stay g_slimbr_carveOB/FR; the proxy rides
//--- beside them, labelled).
int              g_sl45_predOB = 0;
int              g_sl45_predFR = 0;
//--- [P-SLDEF-2 E23] ladder-anchor shadows: stamped by SlimbWalkEmit beside
//--- the carve operands whenever the haveToday walk runs (raw + post-guard
//--- fractal anchor + guard flag), read once per S5 invocation for the
//--- SLADDER isFracAnchor mark. Same hard boundary as the SLIMBR shadows.
int              g_slimbr_fracRawS = -1;
int              g_slimbr_fracGuardS = -1;
int              g_slimbr_fracGuardApplied = 0;
//--- [P-SLDEF-3 E28] originating-slot shadows for the slot-identity
//--- correspondence: the walk's startShift (= the slot the S5 reference is
//--- defined against) plus the OB/fractal limb base+nuance slots from the
//--- core. Stamped beside the carve operands; -1 = no genuine slot.
int              g_slimbr_startShift = -1;
int              g_slimbr_obBaseS = -1;
int              g_slimbr_obNuanceS = -1;
int              g_slimbr_frBaseS = -1;
int              g_slimbr_frNuanceS = -1;
//--- [P-SLDEF-4 E31] walk-step shadows: stamped by SlimbWalkEmit beside the
//--- slot shadows whenever the haveToday walk runs (OB limb steps, fractal
//--- limb steps). Read once per S5 invocation for refWalkSteps beside
//--- refIsRung. Same hard boundary as the slot shadows; slimbr_fresh gates
//--- every read (stale values are never attributed).
int              g_slimbr_obSteps = -1;
int              g_slimbr_frSteps = -1;
//--- [P-SLDEF-4 E31] derived-window constants, stated once. The ladder reads
//--- from the entry bar to the deepest rung-obligated slot plus the margin
//--- (the beyond-rung search needs room past the deepest obligation), floored
//--- at the legacy 500 so non-extended rows enumerate byte-identical ladders.
//--- The absolute cap exceeds every pilot shift (3168 bars); hitting it (or
//--- the 512 rung store) sets ladLimitHit and the row goes
//--- UNCOVERED_READ_LIMIT, never silently short.
#define SRJ_LAD_MARGIN_SLOTS 50
#define SRJ_LAD_ABS_SLOT_CAP 4000
//--- [P-SLDEF-3 E28] correspondence accumulators: residual histogram over
//--- slot-matched pairs (buckets -50..+50, lo/hi overflow), run tallies,
//--- nonzero-pair details bounded at 32 with drop count. File scope so
//--- OnDeinit prints the run summary; per-row lines carry every pair.
int              g_corr_hist[101];
int              g_corr_lo = 0, g_corr_hi = 0, g_corr_pairs = 0, g_corr_zero = 0;
int              g_corr_fracOff = 0, g_corr_todayOff = 0, g_corr_rows = 0;
string           g_corr_nz = "";
int              g_corr_nzN = 0, g_corr_nzDrop = 0;
//--- [P-SLDEF-3 E30] signal<->S5 map stamps: firing-signal times and S5 eval
//--- bar times, paired in OnDeinit at signalTime - PeriodSeconds.
datetime         g_sigmap_sigT[8];
int              g_sigmap_sigN = 0;
datetime         g_sigmap_s5T[16];
int              g_sigmap_s5N = 0;
//--- [P-SLDEF-4 E33] intra-bar order census: one monotonic counter stamped at
//--- the pipeline's per-bar bias read (the live LTF-align invariant below is
//--- the only per-bar bias site in the entry pipeline; the value itself is
//--- never latched per the carried ruling) and at each S5 gate evaluation.
//--- Print-only; no branch reads these. g_order_seq is never reset (run
//--- monotonic); per-bar stamps are matched by barTime at the S5 site.
int              g_order_seq = 0;
int              g_order_seqBias = -1;
datetime         g_order_biasBarT = 0;
datetime         g_order_lastBarT = 0;
int              g_order_flipPassN = 0;
//--- [P-SLDEF-4 E32] decision-row store: per S5 row (cap 32; pilot 10) the
//--- slot-order rungs 0..2, the ext-order rungs 0..2, and the matched level.
//--- Labels only: every tabulation joins on slot+barTime, never on these
//--- indices. File scope so OnDeinit prints the SLADDER_DECISION block (the
//--- artifact the operator marks up). No branch reads these.
#define SRJ_DEC_MAXROWS 32
int              g_dec_n = 0;
datetime         g_dec_barT[SRJ_DEC_MAXROWS];
int              g_dec_dir[SRJ_DEC_MAXROWS];
int              g_dec_covers[SRJ_DEC_MAXROWS];
int              g_dec_rungs[SRJ_DEC_MAXROWS];
int              g_dec_fired[SRJ_DEC_MAXROWS];
string           g_dec_mStatus[SRJ_DEC_MAXROWS];
double           g_dec_mLevel[SRJ_DEC_MAXROWS];
int              g_dec_mRung[SRJ_DEC_MAXROWS];
int              g_dec_mSlot[SRJ_DEC_MAXROWS];
int              g_dec_mExt[SRJ_DEC_MAXROWS];
int              g_dec_mResid[SRJ_DEC_MAXROWS];
string           g_dec_mT[SRJ_DEC_MAXROWS];
double           g_dec_mPx[SRJ_DEC_MAXROWS];
double           g_dec_mR[SRJ_DEC_MAXROWS];
int              g_dec_sHave[SRJ_DEC_MAXROWS];
int              g_dec_sSlot[SRJ_DEC_MAXROWS][3];
int              g_dec_sExt[SRJ_DEC_MAXROWS][3];
datetime         g_dec_sBT[SRJ_DEC_MAXROWS][3];
double           g_dec_sPx[SRJ_DEC_MAXROWS][3];
double           g_dec_sWick[SRJ_DEC_MAXROWS][3];
double           g_dec_sBody[SRJ_DEC_MAXROWS][3];
int              g_dec_sImb[SRJ_DEC_MAXROWS][3];
int              g_dec_sDist[SRJ_DEC_MAXROWS][3];
double           g_dec_sR[SRJ_DEC_MAXROWS][3];
int              g_dec_eHave[SRJ_DEC_MAXROWS];
int              g_dec_eSlot[SRJ_DEC_MAXROWS][3];
int              g_dec_eExt[SRJ_DEC_MAXROWS][3];
datetime         g_dec_eBT[SRJ_DEC_MAXROWS][3];
double           g_dec_ePx[SRJ_DEC_MAXROWS][3];
double           g_dec_eWick[SRJ_DEC_MAXROWS][3];
double           g_dec_eBody[SRJ_DEC_MAXROWS][3];
int              g_dec_eImb[SRJ_DEC_MAXROWS][3];
int              g_dec_eDist[SRJ_DEC_MAXROWS][3];
double           g_dec_eR[SRJ_DEC_MAXROWS][3];
//--- [P-SLDEF-1b E15] LINEWIDTH audit: the Tester journal truncates past ~537
//--- chars, measured on RECON11. Every shadow-line emission below is measured
//--- pre-write; any emission longer than the cap increments truncated (gate 7
//--- halts on nonzero). DECISION is excluded: one multi-line emission whose
//--- physical lines are individually short (auditing the whole would false-halt).
#define LW_CAP 537
//--- [P-SLDEF-3 E30] widened 16->32: RECON13 registered 14 classes and the
//--- five new ones (SLADCORR/HIST/FINAL, SIGMAP, MTLIFE was 13c, MTFLIP)
//--- would overflow the table and print unsummarised. Print-only infra.
string           g_lw_class[32];
int              g_lw_max[32];
int              g_lw_trunc[32];
int              g_lw_n = 0;

//--- TASK 15: read-only shadow of a candidate that died at regime or LTF
//--- alignment. Measures how many of those 42 aborts would have converted
//--- under an order-independent (latched) model. Influences NOTHING - it
//--- gates nothing, mutates no sequence state, and never calls
//--- MarkSessionUsed. Gated on InpDebugLog.
bool             g_shadowActive  = false;
ENUM_SRJ_DIR     g_shadowDir     = DIR_NONE;
int              g_shadowLine    = -1;
datetime         g_shadowOpened  = 0;
ENUM_SRJ_SESSION g_shadowSess    = SESSION_NONE;
string           g_shadowFail    = "";
int              g_shadowBars    = 0;

//--- EA-16 census counters. Measurement only. File scope so OnDeinit can
//--- print the final tally; EvaluateClosedBar statics are not visible there.
int g_ea16_bars = 0;
int g_ea16_s1[6];   // 0=readfail 1=EMPTY 2=neg1 3=zero 4=pos1 5=other
int g_ea16_s2[6];
int g_ea16_hits = 0;

//--- TASK 19c: HTF buffer census. Measurement only. Counts what buffers
//--- 19/20/21 actually contain, because SRJ_HTF_RunAll populates the HTF
//--- engine AFTER FlowLogic's export loop, so those buffers may hold
//--- previous-cycle values or the "NA" encoding of 0.0. Gates nothing.
int g_ea19_bars           = 0;
int g_ea19_h1s1[6];   // buf19 shift1  0=readfail 1=EMPTY 2=neg1 3=zero 4=pos1 5=other
int g_ea19_h1s2[6];   // buf19 shift2
int g_ea19_h2s1[6];   // buf20 shift1
int g_ea19_h2s2[6];   // buf20 shift2
int g_ea19_h3s1[6];   // buf21 shift1
int g_ea19_h3s2[6];   // buf21 shift2
int g_ea19_inWindow       = 0;
int g_ea19_allZeroS1      = 0;
int g_ea19_allZeroS2      = 0;
int g_ea19_noRegimeAborts = 0;

//--- TASK 20: file-scope mirror of the swing-repaint detector's statics, so
//--- OnDeinit can print an unconditional tally. The detector's own
//--- SWINGREPAINT_2V3 line only prints when a retraction is found, so zero
//--- retractions would otherwise produce no output at all Ã¢â‚¬â€ indistinguishable
//--- from the detector never having run. Measurement only.
int g_swr_retractSH = 0;
int g_swr_retractSL = 0;
int g_swr_oppSH     = 0;
int g_swr_oppSL     = 0;
int g_swr_checks    = 0;

//--- [Task 58 / EA-62] Zone-export census. Measurement only, file scope so
//--- OnDeinit can print the tally. Across two full baselines every arming was
//--- src=XOB and buffers 24/25 (FVG-leg zone) were empty on all 17 bars where
//--- ZONEPICK fired. ZONEPICK only reaches S3 bars, so 559 bars are unmeasured.
//--- These counters supply the unconditional denominator: whether 24/25 ever
//--- populate on ANY bar. Nothing reads them.
int g_zc_bars     = 0;
int g_zc_both     = 0;
int g_zc_xobOnly  = 0;
int g_zc_fvgOnly  = 0;
int g_zc_neither  = 0;
int g_zc_inWin    = 0;
int g_zc_xobInWin = 0;
int g_zc_fvgInWin = 0;
int g_zc_samples  = 0;

//====================== Upstream handles =============================
int g_hPoi  = INVALID_HANDLE;
int g_hCqd  = INVALID_HANDLE;
int g_hFlow = INVALID_HANDLE;

//====================== TASK 161: working-set adapter =================
//--- MILESTONE 1 INSTRUMENT. NOTHING READS THIS RECORD.
//---
//--- MEMBERSHIP RULE: the twenty fields ResetSequence clears. A field
//--- added to ResetSequence joins the working set and belongs here too.
//--- Council does not decide membership; the build states it.
//---
//--- NO SHypothesis AND NO SCandidate IS INSTANTIATED. Contract 9
//--- declares bundle MANDATORY, and the twenty globals cannot construct
//--- one, so none is fabricated. A zero standing for absence is exactly
//--- what the contracts were declared to eliminate.
//---
//--- LoadWorkingSet COMPARES AND DOES NOT ASSIGN. At capacity 1 the
//--- globals are the medium and nothing clears them between bars, so an
//--- assignment would be a no-op when the values agree and would MASK the
//--- divergence this instrument exists to find when they do not.
//---
//--- THE GATE: store at the end of bar N, compare at the start of bar
//--- N+1. Zero mismatches over 1728 bars means the working set is CLOSED -
//--- nothing outside these twenty fields carries sequence state across
//--- bars. That is the closure proof, and it is not the isolation proof:
//--- at capacity 1 there is no OTHER hypothesis, so Milestone 1's pass
//--- condition needs capacity 2 and arrives with Task 162.
//---
//--- DOUBLES ARE COMPARED WITH EXACT INEQUALITY ON PURPOSE. The store
//--- copied the same bits, so any difference means something wrote the
//--- field. A tolerance here would hide the finding.
//---
//--- CONTRACT DESTINATIONS, so Task 162 migrates from a stated mapping:
//---   state          -> SCandidate.state AND SHypothesis.state. ONE
//---                     global carries both levels. THAT IS THE DEFECT.
//---   dir            -> SCandidate.dir
//---   regime         -> SCandidate.regimeAtAdmission
//---   sessionAtEntry -> SCandidate.tradingWindowAtAdmission
//---   anchorLine     -> SCandidate.poiAnchorLine
//---   anchorPrice    -> SCandidate.poiAnchorPrice + hasPoiAnchorPrice
//---   anchorBarTime  -> SCandidate.poiAnchorBarTime
//---   divLatch       -> SCandidate.divergenceVerdict. bool to TRI is a
//---                     WIDENING THE BUILD CANNOT FILL: false conflates
//---                     not-yet-evaluated with evaluated-and-negative,
//---                     so the reverse map is lossy by construction.
//---   touchSeen      -> SHypothesis.touchLatched
//---   touchBarHi     -> SHypothesis.touchBarHigh
//---   touchBarLo     -> SHypothesis.touchBarLow
//---   zoneHi         -> SHypothesis.zoneHi + hasZone
//---   zoneLo         -> SHypothesis.zoneLo
//---   alertedArmed   -> SHypothesis.alertedArmed
//---   alertedSignal  -> SHypothesis.alertedSignal
//---
//--- DELIBERATELY NOT CARRIED: the four session-used latches, which are
//--- session-level and cross-candidate; the seven shadow fields, which are
//--- a record that outlives its sequence by design; the run-lifetime
//--- accumulators and handles.
//---
//--- AFTER THIS INSERT NOTHING CALLS ANY OF IT. The wiring is Task 161-B.
//======================================================================

struct SSrjWorkingSet
  {
   ENUM_SRJ_STATE   state;
   ENUM_SRJ_DIR     dir;
   ENUM_SRJ_REGIME  regime;
   ENUM_SRJ_SESSION sessionAtEntry;
   int              anchorLine;
   double           anchorPrice;
   datetime         anchorBarTime;
   bool             divLatch;
   bool             touchSeen;
   double           touchBarHi;
   double           touchBarLo;
   double           zoneHi;
   double           zoneLo;
   bool             alertedArmed;
   bool             alertedSignal;
   double           latchedEntry;
   double           latchedSl;
   double           latchedTp;
   double           latchedR;
   datetime         latchBarTime;
   ENUM_SRJ_STATE   confirmFromState;
   bool             stored;
  };

SSrjWorkingSet g_ws161;
int  g_ws161_stores   = 0;
int  g_ws161_loads    = 0;
int  g_ws161_changes  = 0;
int  g_ws161_mismatch = 0;
int  g_ws161_fieldMiss[21];

//--- Field ordinal to name. The order below IS the field order used by
//--- SrjWsCompare and by g_ws161_fieldMiss, and the three must agree.
string SrjWsName(int i)
  {
   switch(i)
     {
      case  0: return "state";
      case  1: return "dir";
      case  2: return "regime";
      case  3: return "sessionAtEntry";
      case  4: return "anchorLine";
      case  5: return "anchorPrice";
      case  6: return "anchorBarTime";
      case  7: return "divLatch";
      case  8: return "touchSeen";
      case  9: return "touchBarHi";
      case 10: return "touchBarLo";
      case 11: return "zoneHi";
      case 12: return "zoneLo";
      case 13: return "alertedArmed";
      case 14: return "alertedSignal";
      case 15: return "latchedEntry";
      case 16: return "latchedSl";
      case 17: return "latchedTp";
      case 18: return "latchedR";
      case 19: return "latchBarTime";
      case 20: return "confirmFromState";
     }
   return "UNKNOWN_FIELD";
  }

//--- Per-field difference between the stored record and the live globals.
//--- Writes twenty-one booleans and touches nothing else.
void SrjWsCompare(bool &d[])
  {
   d[0]  = (g_ws161.state          != g_state);
   d[1]  = (g_ws161.dir            != g_dir);
   d[2]  = (g_ws161.regime         != g_regime);
   d[3]  = (g_ws161.sessionAtEntry != g_sessionAtEntry);
   d[4]  = (g_ws161.anchorLine     != g_anchorLine);
   d[5]  = (g_ws161.anchorPrice    != g_anchorPrice);
   d[6]  = (g_ws161.anchorBarTime  != g_anchorBarTime);
   d[7]  = (g_ws161.divLatch       != g_divLatch);
   d[8]  = (g_ws161.touchSeen      != g_touchSeen);
   d[9]  = (g_ws161.touchBarHi     != g_touchBarHi);
   d[10] = (g_ws161.touchBarLo     != g_touchBarLo);
   d[11] = (g_ws161.zoneHi         != g_zoneHi);
   d[12] = (g_ws161.zoneLo         != g_zoneLo);
   d[13] = (g_ws161.alertedArmed   != g_alertedArmed);
   d[14] = (g_ws161.alertedSignal  != g_alertedSignal);
   d[15] = (g_ws161.latchedEntry   != g_latchedEntry);
   d[16] = (g_ws161.latchedSl      != g_latchedSl);
   d[17] = (g_ws161.latchedTp      != g_latchedTp);
   d[18] = (g_ws161.latchedR       != g_latchedR);
   d[19] = (g_ws161.latchBarTime   != g_latchBarTime);
   d[20] = (g_ws161.confirmFromState != g_confirmFromState);
  }

//--- One line naming the live value of a field, for a mismatch report.
string SrjWsLiveValue(int i)
  {
   switch(i)
     {
      case  0: return IntegerToString((int)g_state);
      case  1: return IntegerToString((int)g_dir);
      case  2: return IntegerToString((int)g_regime);
      case  3: return IntegerToString((int)g_sessionAtEntry);
      case  4: return IntegerToString(g_anchorLine);
      case  5: return DoubleToString(g_anchorPrice, 8);
      case  6: return IntegerToString((long)g_anchorBarTime);
      case  7: return (g_divLatch      ? "1" : "0");
      case  8: return (g_touchSeen     ? "1" : "0");
      case  9: return DoubleToString(g_touchBarHi, 8);
      case 10: return DoubleToString(g_touchBarLo, 8);
      case 11: return DoubleToString(g_zoneHi, 8);
      case 12: return DoubleToString(g_zoneLo, 8);
      case 13: return (g_alertedArmed  ? "1" : "0");
      case 14: return (g_alertedSignal ? "1" : "0");
      case 15: return DoubleToString(g_latchedEntry, 8);
      case 16: return DoubleToString(g_latchedSl, 8);
      case 17: return DoubleToString(g_latchedTp, 8);
      case 18: return DoubleToString(g_latchedR, 8);
      case 19: return IntegerToString((long)g_latchBarTime);
      case 20: return IntegerToString((int)g_confirmFromState);
     }
   return "NA";
  }

//--- The same field's value as it was stored.
string SrjWsStoredValue(int i)
  {
   switch(i)
     {
      case  0: return IntegerToString((int)g_ws161.state);
      case  1: return IntegerToString((int)g_ws161.dir);
      case  2: return IntegerToString((int)g_ws161.regime);
      case  3: return IntegerToString((int)g_ws161.sessionAtEntry);
      case  4: return IntegerToString(g_ws161.anchorLine);
      case  5: return DoubleToString(g_ws161.anchorPrice, 8);
      case  6: return IntegerToString((long)g_ws161.anchorBarTime);
      case  7: return (g_ws161.divLatch      ? "1" : "0");
      case  8: return (g_ws161.touchSeen     ? "1" : "0");
      case  9: return DoubleToString(g_ws161.touchBarHi, 8);
      case 10: return DoubleToString(g_ws161.touchBarLo, 8);
      case 11: return DoubleToString(g_ws161.zoneHi, 8);
      case 12: return DoubleToString(g_ws161.zoneLo, 8);
      case 13: return (g_ws161.alertedArmed  ? "1" : "0");
      case 14: return (g_ws161.alertedSignal ? "1" : "0");
      case 15: return DoubleToString(g_ws161.latchedEntry, 8);
      case 16: return DoubleToString(g_ws161.latchedSl, 8);
      case 17: return DoubleToString(g_ws161.latchedTp, 8);
      case 18: return DoubleToString(g_ws161.latchedR, 8);
      case 19: return IntegerToString((long)g_ws161.latchBarTime);
      case 20: return IntegerToString((int)g_ws161.confirmFromState);
     }
   return "NA";
  }

//--- Called before EvaluateClosedBar. READS ONLY. Never assigns a global.
//--- A difference here means something outside the wrapper wrote a
//--- working-set field between the previous store and this bar.
void LoadWorkingSet(int barShift, datetime barTime)
  {
   g_ws161_loads++;

   if(!g_ws161.stored)
     {
      Print("[SRJ-EA] WS161_LOAD NOSTORE bar=", TimeToString(barTime, TIME_DATE|TIME_MINUTES),
            " shift=", barShift, " loads=", g_ws161_loads);
      return;
     }

   bool d[21];
   SrjWsCompare(d);

   int n = 0;
   for(int i = 0; i < 21; i++)
      if(d[i]) n++;

   if(n == 0)
      return;

   g_ws161_mismatch++;

   for(int i = 0; i < 21; i++)
     {
      if(!d[i])
         continue;
      g_ws161_fieldMiss[i] = g_ws161_fieldMiss[i] + 1;
      Print("[SRJ-EA] WS161_MISMATCH bar=", TimeToString(barTime, TIME_DATE|TIME_MINUTES),
            " shift=", barShift,
            " field=", SrjWsName(i),
            " stored=", SrjWsStoredValue(i),
            " live=", SrjWsLiveValue(i),
            " event=", g_ws161_mismatch);
     }
  }

//--- Called after EvaluateClosedBar. Copies the twenty-one globals into the
//--- record and counts a change when this bar's set differs from the last
//--- stored one. Writes NO global except this instrument's own counters.
void StoreWorkingSet(int barShift, datetime barTime)
  {
   g_ws161_stores++;

   if(g_ws161.stored)
     {
      bool d[21];
      SrjWsCompare(d);
      for(int i = 0; i < 21; i++)
        {
         if(d[i])
           {
            g_ws161_changes++;
            break;
           }
        }
     }

   g_ws161.state          = g_state;
   g_ws161.dir            = g_dir;
   g_ws161.regime         = g_regime;
   g_ws161.sessionAtEntry = g_sessionAtEntry;
   g_ws161.anchorLine     = g_anchorLine;
   g_ws161.anchorPrice    = g_anchorPrice;
   g_ws161.anchorBarTime  = g_anchorBarTime;
   g_ws161.divLatch       = g_divLatch;
   g_ws161.touchSeen      = g_touchSeen;
   g_ws161.touchBarHi     = g_touchBarHi;
   g_ws161.touchBarLo     = g_touchBarLo;
   g_ws161.zoneHi         = g_zoneHi;
   g_ws161.zoneLo         = g_zoneLo;
   g_ws161.alertedArmed   = g_alertedArmed;
   g_ws161.alertedSignal  = g_alertedSignal;
   g_ws161.latchedEntry   = g_latchedEntry;
   g_ws161.latchedSl      = g_latchedSl;
   g_ws161.latchedTp      = g_latchedTp;
   g_ws161.latchedR       = g_latchedR;
   g_ws161.latchBarTime   = g_latchBarTime;
   g_ws161.confirmFromState = g_confirmFromState;
   g_ws161.stored         = true;
  }

//--- End-of-run census. One summary line, then one row per field that
//--- recorded at least one mismatch. Zero rows is the pass shape.
void SrjWs161Census()
  {
   Print("[SRJ-EA] WS161_CENSUS fields=21",
         " loads=",     g_ws161_loads,
         " stores=",    g_ws161_stores,
         " changes=",   g_ws161_changes,
         " mismatch=",  g_ws161_mismatch);

   for(int i = 0; i < 21; i++)
     {
      if(g_ws161_fieldMiss[i] == 0)
         continue;
      Print("[SRJ-EA] WS161_FIELD name=", SrjWsName(i),
            " mismatches=", g_ws161_fieldMiss[i]);
     }
  }
//====================== end TASK 161 adapter ===========================
//====================== Trade Helper Functions =======================
ENUM_ORDER_TYPE_FILLING GetCorrectFillingMode(string sym)
  {
   int fill = (int)SymbolInfoInteger(sym, SYMBOL_FILLING_MODE);
   if((fill & SYMBOL_FILLING_FOK) != 0) return ORDER_FILLING_FOK;
   if((fill & SYMBOL_FILLING_IOC) != 0) return ORDER_FILLING_IOC;
   return ORDER_FILLING_RETURN;
  }

bool IsSessionPositionOpen(long magic)
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      ulong ticket = PositionGetTicket(i);
      if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == magic)
         return true;
     }
   return false;
  }

//====================== Logging helpers ==============================
string StateName(ENUM_SRJ_STATE s)
  {
   switch(s)
     {
      case ST_IDLE:          return "IDLE";
      case ST_S1_REGIME:     return "S1_REGIME";
      case ST_S2_LTF_ALIGN:  return "S2_LTF_ALIGN";
      case ST_S3_ZONE_WAIT:  return "S3_ZONE_WAIT";
      case ST_S4_ARMED:      return "S4_ARMED";
      case ST_S5_GATE_CHECK: return "S5_GATE_CHECK";
      case ST_SIGNAL:        return "SIGNAL";
      case ST_ABORT:         return "ABORT";
     }
   return "?";
  }

string DirName(ENUM_SRJ_DIR d)
  { return (d == DIR_LONG) ? "LONG" : (d == DIR_SHORT) ? "SHORT" : "NONE"; }

string RegimeName(ENUM_SRJ_REGIME r)
  {
   switch(r)
     {
      case REGIME_TREND:   return "TREND";
      case REGIME_MEANREV: return "MEANREV";
      case REGIME_BOTH:    return "BOTH";
     }
   return "NONE";
  }

string SessionName(ENUM_SRJ_SESSION s)
  {
   if(s == SESSION_LONDON) return "LONDON";
   if(s == SESSION_NYAM)   return "NYAM";
   return "NONE";
  }

string AnchorStr()
  { return (g_anchorLine >= 0) ? g_lineCode[g_anchorLine] : "-"; }

void LogState(ENUM_SRJ_STATE from, ENUM_SRJ_STATE to)
  {
   if(!InpDebugLog) return;
   PrintFormat("[SRJ-EA] %s STATE %s->%s dir=%s poi=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               StateName(from), StateName(to), DirName(g_dir), AnchorStr());
  }

void LogAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               reason, StateName(atState), AnchorStr(), DirName(g_dir));
  }

//--- TASK 4: LogSignal appends spreadPts, bid, ask.
void LogSignal(double tpTarget, double tpR, double slRef,
               ENUM_SRJ_SLMODE slMode, const string divKind)
   {
    //--- [P-SLDEF-3 E30] firing-signal stamp for SIGMAP. Single TimeCurrent
    //--- read shared by the print and the stamp (the printed line is
    //--- byte-identical to before).
    datetime sigT = TimeCurrent();
    if(g_sigmap_sigN < 8) { g_sigmap_sigT[g_sigmap_sigN] = sigT; g_sigmap_sigN++; }
    PrintFormat("[SRJ-EA] %s SIGNAL dir=%s poi=%s regime=%s div=%s sess=%s "
                "tp_target=%s tp_R=%.2f sl_ref=%s sl_mode=%s spreadPts=%d "
                "bid=%s ask=%s",
                TimeToString(sigT, TIME_DATE|TIME_SECONDS),
               DirName(g_dir), AnchorStr(), RegimeName(g_regime), divKind,
               SessionName(g_sessionAtEntry),
               DoubleToString(tpTarget, _Digits), tpR,
               DoubleToString(slRef, _Digits),
               (slMode == SL_MODE_1SWING ? "1-swing" : "2-swing"),
               (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD),
               DoubleToString(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits),
               DoubleToString(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits));
  }

//--- TASK 14c: alert emitter. Builds a short line for push/popup
//--- (SendNotification is capped at 255 chars) and always mirrors it
//--- to the journal. Carries no decision logic - every value it prints
//--- was computed by a gate that already ran.
//--- TASK 16: pushable parameter implements ruling 5. HEADS-UP and
//--- STAND-DOWN are journal-only (pushable=false). Only SIGNAL is
//--- eligible for popup/push (pushable=true), gated by InpAlertPopup
//--- and InpAlertPush respectively.
void EmitAlert(const string kind, const string detail, bool pushable)
  {
   string msg = StringFormat("SRJ %s %s %s %s | %s | %s | %s",
                             kind, DirName(g_dir), _Symbol,
                             StringSubstr(EnumToString((ENUM_TIMEFRAMES)_Period), 7),
                             AnchorStr(), SessionName(g_sessionAtEntry), detail);

   PrintFormat("[SRJ-EA] ALERT %s", msg);

   if(pushable && InpAlertPopup) Alert(msg);

   if(pushable && InpAlertPush && !SendNotification(msg))
      PrintFormat("[SRJ-EA] ALERT push FAILED err=%d - is the MetaQuotes ID set in "
                  "Terminal>Options>Notifications?", GetLastError());
  }

//====================== Session-window helpers =======================
ENUM_SRJ_SESSION CurrentTradingWindow(datetime barTimeServer)
  {
   for(int dayOffset = -1; dayOffset <= 1; dayOffset++)
     {
      datetime probeDay = (datetime)((long)TC_DayStart(barTimeServer)
                                     + (long)dayOffset * 86400);
      MqlDateTime d;
      TimeToStruct(probeDay, d);
      datetime lonFromET = TC_MakeTime(d.year, d.mon, d.day, 2, 0, 0);
      datetime lonToET   = TC_MakeTime(d.year, d.mon, d.day, 5, 0, 0);
      datetime nyFromET  = TC_MakeTime(d.year, d.mon, d.day, 7, 0, 0);
      datetime nyToET    = TC_MakeTime(d.year, d.mon, d.day, 12, 0, 0);
      datetime lonFromSrv = TC_ZoneToServer(lonFromET, TZ_NEWYORK);
      datetime lonToSrv   = TC_ZoneToServer(lonToET,   TZ_NEWYORK);
      datetime nyFromSrv  = TC_ZoneToServer(nyFromET,  TZ_NEWYORK);
      datetime nyToSrv    = TC_ZoneToServer(nyToET,    TZ_NEWYORK);
      if(barTimeServer >= lonFromSrv && barTimeServer < lonToSrv)
         return SESSION_LONDON;
      if(barTimeServer >= nyFromSrv  && barTimeServer < nyToSrv)
         return SESSION_NYAM;
     }
   return SESSION_NONE;
  }

bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON)
      return (g_sessionUsed_London && g_sessionUsedDay_London == today);
   if(sess == SESSION_NYAM)
      return (g_sessionUsed_NYAM   && g_sessionUsedDay_NYAM   == today);
   return false;
  }

void MarkSessionUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON) { g_sessionUsed_London = true; g_sessionUsedDay_London = today; }
   if(sess == SESSION_NYAM)   { g_sessionUsed_NYAM   = true; g_sessionUsedDay_NYAM   = today; }
  }

//====================== Upstream readiness ===========================
bool HandleReady(int handle)
  {
   if(handle == INVALID_HANDLE) return false;
   return (BarsCalculated(handle) >= InpMinBarsRequired);
  }

bool UpstreamReady()
  { return HandleReady(g_hPoi) && HandleReady(g_hCqd) && HandleReady(g_hFlow); }

//====================== Buffer read helper ===========================
bool ReadBuf1(int handle, int bufIdx, double &outVal, int shift = 1)
  {
   double tmp[1];
   if(CopyBuffer(handle, bufIdx, shift, 1, tmp) != 1) return false;
   outVal = tmp[0];
   return true;
  }

//--- TASK 20: every FlowLogic export slot is written twice Ã¢â‚¬â€ provisionally
//--- on each tick of the forming bar, then once with settled state when that
//--- bar closes. slot[X] therefore describes state after bar X+1. Reading
//--- shift 1 lands in the provisional slot (measured 52% retraction rate).
//--- Reading shift 2 lands in the settled slot, which describes the bar the
//--- EA is evaluating, and which is never rewritten afterwards.
//--- Every FlowLogic read on a logic path goes through this wrapper. The
//--- bar under evaluation does not move; only the FlowLogic slot does.
//--- POI Marker and CQD reads keep their own conventions and are unchanged.
#define FLOW_SHIFT_OFFSET 1

// [Task 26a] FlowLogic's Task-25 exports. Read via ReadFlow, never ReadBuf1,
// because these are FlowLogic buffers and are subject to the double write
// documented in Revision 22 section 3.1 Ã¢â‚¬â€ FLOW_SHIFT_OFFSET must apply.
//   26 = the in-bias order block's own protective extreme (diagnostic only)
//   27 = the protective extreme of that order block's swing bar (the reference)
// Both are selected by the same SRJ_NearestPromotedOBIndex call that produces
// the XOB zone export, so the stop and the zone describe one order block.
#define FL_BUF_OB_STRUCT_EXTREME 26
#define FL_BUF_OB_SWING_EXTREME  27

// [Task 39] FlowLogic's packed swept + session-live mask. Read via ReadFlow,
// never ReadBuf1 Ã¢â‚¬â€ it is a FlowLogic buffer and subject to the double write.
#define FL_BUF_SWEPT_MASK        29

// [Task 52 / EA-59b] FlowLogic's structural-leg boundary time (Task 50, buffer
// 30). Read via ReadFlow, never ReadBuf1 Ã¢â‚¬â€ it is a FlowLogic buffer and subject
// to the double write documented in Revision 22 section 3.1. Encoding matches
// buffer 28: the SERVER-TIME datetime of the boundary bar cast to double, with
// 0.0 meaning unset. Deliberately NOT buffer 28 itself, which carries the
// CHECKLIST boundary and must not redefine current-leg targets.
#define FL_BUF_STRUCT_LEG_TIME   30

// [Task 105] FlowLogic's Task-102 identity exports. Read via ReadFlow, never
// ReadBuf1 Ã¢â‚¬â€ they are FlowLogic buffers and subject to the double write
// documented in Revision 22 section 3.1, so FLOW_SHIFT_OFFSET must apply.
//   31 = COrderblock.objId of the order block behind the exported XOB zone
//   32 = CImbalance.objId  of the FVG behind the exported FVG-leg zone
// FlowLogic writes each id from the same object pointer that writes the
// corresponding bounds, inside the same branch, so an id can never describe a
// different object than the bounds on 22/23 or 24/25 of the same slot.
// 0.0 = no object selected upstream. Ids are unique and monotonic within a
// FlowLogic run but are NOT stable across a full recalc Ã¢â‚¬â€ see EA-109.
// DIAGNOSTIC ONLY. Nothing branches on either value.
#define FL_BUF_XOB_OBJ_ID        31
#define FL_BUF_FVG_OBJ_ID        32
// [Task 123] FlowLogic's Task-113 export: promotion time of the order block
// behind the XOB zone on buffers 22/23 and the objId on buffer 31. FlowLogic
// writes all four from the SAME object pointer inside the SAME branch, so the
// promotion time can never describe a different object than the bounds or the
// id of the same slot. Encoding matches buffers 28 and 30: the SERVER-TIME
// datetime of the promotion bar cast to double.
// 0.0 = unset â€” no object selected, never promoted, or bar index out of range
// upstream. EMPTY_VALUE is deliberately NOT the sentinel: 2147483647 is a
// plausible datetime and would be indistinguishable from real data.
// Read via ReadFlow, never ReadBuf1 â€” it is a FlowLogic buffer and subject to
// the double write documented in Revision 51 section 8.2, so FLOW_SHIFT_OFFSET
// must apply.
// DIAGNOSTIC ONLY in this task. Nothing branches on it.
#define FL_BUF_XOB_PROMO_TIME    33

bool ReadFlow(int bufIdx, double &outVal, int evalShift)
  {
   return ReadBuf1(g_hFlow, bufIdx, outVal, evalShift + FLOW_SHIFT_OFFSET);
  }

//--- TASK 19c: value categoriser shared by the HTF census.
//--- 0=readfail 1=EMPTY_VALUE 2=(-1) 3=zero 4=(+1) 5=other
int Ea19Cat(double v, bool ok)
  {
   if(!ok)                    return 0;
   if(v == EMPTY_VALUE)       return 1;
   if(MathAbs(v + 1.0) < 0.5) return 2;
   if(MathAbs(v)       < 0.5) return 3;
   if(MathAbs(v - 1.0) < 0.5) return 4;
   return 5;
  }

//====================== POI retest re-derivation =====================
struct PoiRetestResult
  { bool found; bool isLong; int topLine; };

bool DetectPoiRetest(int barShift, PoiRetestResult &r)
  {
   r.found = false; r.isLong = false; r.topLine = -1;
   double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
   double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
   double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
   if(h <= 0.0 || l <= 0.0) return false;
   //--- [P-NEXTOPEN 2026-09-09, operator directive] The retest's body-side
   //--- test is evaluated at the NEXT candle's OPEN, not the retest candle's
   //--- close (Part A spec section 4: evaluate at the next candle's open).
   //--- Fail-soft: the retest candle's close is the fallback if the next
   //--- bar's open cannot be read.
   double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
   if(cNext <= 0.0) cNext = c;
   double bodyHi = MathMax(o, cNext);
   double bodyLo = MathMin(o, cNext);
   double P   = _Point;
   double EPS = P * 0.001;
   double lineVal[POI_NLINES];
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(!ReadBuf1(g_hPoi, k, lineVal[k], barShift))
         lineVal[k] = EMPTY_VALUE;
     }
    int bestLongRank = INT_MAX, bestLongLine = -1;
    int bestShortRank = INT_MAX, bestShortLine = -1;
    //--- [P-SLDEF-1b E19] per-call equality instances for verdict pairing.
    int n1e_nW = 0, n1e_nB = 0;
    for(int k = 0; k < POI_NLINES; k++)
      {
       double L = lineVal[k];
       if(L == EMPTY_VALUE || L <= 0.0) continue;
       //--- [P-SLDEF-1 E14] N1 counters: exact-equality encounters, counted
       //--- without branching (outcome untouched). Grounding: LONG survives
       //--- iff the wick pierces (l <= L-P+EPS) AND the body holds
       //--- (bodyLo >= L-EPS); equality on either term passes. SHORT mirror.
        if(l == L || h == L) { g_n1_poiEqWick++; n1e_nW++; }
        if(bodyLo == L || bodyHi == L) { g_n1_poiEqBody++; n1e_nB++; }
       if(l <= L - P + EPS && bodyLo >= L - EPS)
        { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
      if(h >= L + P - EPS && bodyHi <= L + EPS)
        { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
     }
    if(bestLongLine < 0 && bestShortLine < 0)
      { g_n1_entryWickInv += n1e_nW; g_n1_entryBodyInv += n1e_nB; return false; }
    if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
      { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
    else
      { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
    //--- [P-SLDEF-1b E19] the retest lived: every equality instance in this
    //--- call survived (the setup proceeded despite it).
    g_n1_entryWickSurv += n1e_nW; g_n1_entryBodySurv += n1e_nB;
    return true;
  }

//====================== [P-BUILD3 E1 2026-09-11] the line supersession helpers ==
int B3_AnchorTier(int line) { return (g_authorityRank[line] / 2); }
int B3_ElectAnchor(int barShift, ENUM_SRJ_DIR dir)
  {
   double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
   double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
   double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
   if(h <= 0.0 || l <= 0.0) return -1;
   double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
   if(cNext <= 0.0) cNext = c;
   double bodyHi = MathMax(o, cNext);
   double bodyLo = MathMin(o, cNext);
   double P   = _Point;
   double EPS = P * 0.001;
   int bestLine = -1;
   int bestTier = INT_MAX;
   int bestRank = INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      double L;
      if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
      if(L == EMPTY_VALUE || L <= 0.0) continue;
      bool hit = false;
      if(dir == DIR_LONG)
         hit = (l <= L - P + EPS && bodyLo >= L - EPS);
      else if(dir == DIR_SHORT)
         hit = (h >= L + P - EPS && bodyHi <= L + EPS);
      else continue;
      if(!hit) continue;
      int rk = g_authorityRank[k];
      int tr = (rk / 2);
      if(tr < bestTier || (tr == bestTier && rk < bestRank))
        { bestTier = tr; bestRank = rk; bestLine = k; }
     }
   return bestLine;
  }

//====================== [P-CONFIRM-SHADOW] log-only instruments ======================
//--- Council build 1 (COUNCIL_RESPONSE_POI-R.md). These functions READ only and print
//--- only. They are never consulted by any state transition, abort, or signal path.
//--- RETESTBOOK: the per-line retest census - DetectPoiRetest returns only the
//--- top-ranked line; this replicates its per-line test (the identical inequalities)
//--- for ALL 12 lines so the supersession build's inputs become countable.
void ShadowRetestBook(const int barShift)
  {
   if(!InpDebugLog || !SHADOW_RETESTBOOK) return;
   double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
   double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
   double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
   if(h <= 0.0 || l <= 0.0) return;
   double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
   if(cNext <= 0.0) cNext = c;
   double bodyHi = MathMax(o, cNext);
   double bodyLo = MathMin(o, cNext);
   double P   = _Point;
   double EPS = P * 0.001;
   string hits = "";
   int    nHits = 0;
   for(int k = 0; k < POI_NLINES; k++)
     {
      double L;
      if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
      if(L == EMPTY_VALUE || L <= 0.0)      continue;
      bool longHit  = (l <= L - P + EPS && bodyLo >= L - EPS);
      bool shortHit = (h >= L + P - EPS && bodyHi <= L + EPS);
      if(!longHit && !shortHit) continue;
      if(nHits > 0) hits += " ";
      hits += g_lineCode[k] + ":r" + IntegerToString(g_authorityRank[k]) +
              ":d" + (longHit ? "L" : "S");
      nHits++;
     }
   PrintFormat("[SRJ-EA] RETESTBOOK bar=%s hits=%d %s",
               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                            TIME_DATE|TIME_MINUTES),
               nHits, hits);
  }
//--- CONFIRMPOLL: the spec section 3.6 confirmation-candle terms, per bar, as data.
//--- term A oppCandle: the PRIOR candle closed AGAINST the direction (the retracement/
//---   opposing candle). term B bodyDir: the CURRENT candle closes IN the direction with
//---   any nonzero body (only a true doji rejected - the section 3.6 rule). term C
//---   touchAttr: the PRIOR candle touched the anchor line (wick through the line value).
//--- confirm = A && B && C. This is the calibration surface for build 2's
//--- IsConfirmationCandle; nothing here gates anything.
void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_DIR dir)
  {
   if(!InpDebugLog || !SHADOW_CONFIRMPOLL) return;
   if(anchorLine < 0 || dir == DIR_NONE)   return;
   double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
   double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
   double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
   double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
   double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
   double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
   if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0) return;
   double L;
   if(!ReadBuf1(g_hPoi, anchorLine, L, barShift)) return;
   if(L == EMPTY_VALUE || L <= 0.0)               return;
   bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
   double body    = MathAbs(c0 - o0);
   bool   isDoji  = (body < _Point * 0.0001);
   bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
   bool   touch   = (h1 >= L - _Point && l1 <= L + _Point);
   bool   confirm = (oppCandle && bodyDir && !isDoji && touch);
   PrintFormat("[SRJ-EA] CONFIRMPOLL bar=%s anchor=%s dir=%s oppCandle=%d bodyDir=%d "
               "body=%dpts doji=%d touchAttr=%d confirm=%d shadow=true",
               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                            TIME_DATE|TIME_MINUTES),
               g_lineCode[anchorLine], DirName(dir),
               (int)oppCandle, (int)bodyDir, (int)MathRound(body / _Point),
               (int)isDoji, (int)touch, (int)confirm);
  }

//--- [P-CONFIRM-GATE E1 2026-09-10] build 2: the confirmation predicate is now a
//--- real function and the LIVE GATE (it replaces the poll-only role of
//--- ShadowConfirmPoll above, which keeps printing the same terms as the gate's
//--- trace - shadow=true naming for continuity). Terms (packet section 1; the
//--- operator's ruled retracement term A2 included):
//---   A  the prior candle (barShift+1) closed AGAINST dir (the retracement/
//---      opposing candle);
//---   A2 RULED: the prior candle's CLOSE stays on the SETUP SIDE of the anchor
//---      line (a wick through is the retracement; a CLOSE through is a line
//---      break - no confirmation after a break; LONG: close >= line;
//---      SHORT: close <= line; applies to VWAP and POC alike);
//---   B  the current candle (barShift) closes IN dir with any nonzero body
//---      (only a true doji rejected - spec section 3.6);
//---   C  the prior candle's range touched the anchor line (the CONFIRMPOLL
//---      touchAttr test with its +/- 1 point guard).
//--- failTerm names the FIRST failed term ("" = all terms passed).
bool IsConfirmationCandle(const int barShift, const int anchorLine,
                          const ENUM_SRJ_DIR dir, string &failTerm)
  {
   failTerm = "";
   if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
   double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
   double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
   double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
   double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
   double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
   double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
   if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
      { failTerm = "NO_DATA"; return false; }
   double L;
   if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
      { failTerm = "NO_LINE"; return false; }
    if(L == EMPTY_VALUE || L <= 0.0)
       { failTerm = "NO_LINE"; return false; }
    //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
    //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
    //--- alike": exact equality passes. Family by line code.
    //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
    //--- paired at each terminal return below (no branch touched).
    bool n1_vw = false, n1_poc = false;
    if(c1 == L)
      {
       if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
       if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
      }
    bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
    if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
    if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
    double body    = MathAbs(c0 - o0);
    bool   isDoji  = (body < _Point * 0.0001);
    bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
    if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
    bool touch = (h1 >= L - _Point && l1 <= L + _Point);
    if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
    if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
    return true;
  }

//====================== Step 1: Regime classification ================
bool ClassifyRegime(int barShift, ENUM_SRJ_DIR dir, ENUM_SRJ_REGIME &regimeOut)
  {
   double htfH, htfM, htfL;
   if(!ReadFlow(FL_BUF_HTF_HIGH, htfH, barShift)) return false;
   if(!ReadFlow(FL_BUF_HTF_MID,  htfM, barShift)) return false;
   if(!ReadFlow(FL_BUF_HTF_LOW,  htfL, barShift)) return false;
   int want = (dir == DIR_LONG) ? 1 : -1;
   int votes = 0;
   if((int)MathRound(htfH) == want) votes++;
   if((int)MathRound(htfM) == want) votes++;
   if((int)MathRound(htfL) == want) votes++;
   bool trendOk = (votes >= 2);
   double sweepTagD;
   if(!ReadFlow(FL_BUF_SWEEP_TAG, sweepTagD, barShift)) return false;
   int tag = (int)MathRound(sweepTagD);
   bool mrOk = false;
   if(tag != SWEEP_NONE)
     {
      bool sweptHigh = (tag == SWEEP_ASIA_HIGH || tag == SWEEP_LONDON_HIGH ||
                        tag == SWEEP_NY_HIGH   || tag == SWEEP_PM_HIGH);
      bool sweptLow  = (tag == SWEEP_ASIA_LOW  || tag == SWEEP_LONDON_LOW  ||
                        tag == SWEEP_NY_LOW    || tag == SWEEP_PM_LOW);
      if(dir == DIR_SHORT && sweptHigh) mrOk = true;
      if(dir == DIR_LONG  && sweptLow)  mrOk = true;
     }
   if(InpDebugLog) { static int s_rc91 = 0; static int s_rcMR91 = 0; s_rc91++; if(mrOk) s_rcMR91++; PrintFormat("[SRJ-EA] REGIMECENSUS #%d bar=%s dir=%s votes=%d trendOk=%d sweepTag=%d mrOk=%d cumMR=%d", s_rc91, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), votes, (int)trendOk, tag, (int)mrOk, s_rcMR91); } if(trendOk && mrOk) regimeOut = REGIME_BOTH;
   else if(trendOk)    regimeOut = REGIME_TREND;
   else if(mrOk)       regimeOut = REGIME_MEANREV;
   else                regimeOut = REGIME_NONE;
   return true;
  }

//====================== Step 2: LTF structure alignment ==============
bool CheckLtfAlign(int barShift, ENUM_SRJ_DIR dir, bool &alignedOut)
  {
   double ltfBias;
   if(!ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift)) return false;
   alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1));
   return true;
  }

//====================== Step 3: Continuous freshness poll ============
//--- [P-SCOPE34 2026-09-09, operator-issued packet] The 2-of-3 adverse kill is
//--- PRE-CONFIRMATION ONLY (the operator's Q4 ruling verbatim: "yes, that is only
//--- pre confirmation entry. even if after entry, the structure flip then i still
//--- hold the trade"; spec section 3.4 verbatim: "if later the structure is flipped
//--- after the confirmation entry, i still hold the trade"). twoOfThreeKills=true at
//--- the pre-confirmation states (S4_ARMED); false at the gate-check (S5) where the
//--- poll is diagnostic-only and the only cancellation is the live bias flip (the
//--- three-flag conjunction is the same event - sections 3.4/5.5). The FRESHCOUNT
//--- census carries scope=pre/post so the tabulation separates the populations.
string CheckFreshness(int barShift, bool twoOfThreeKills)
  {
   double obValid, oppFvg;
   if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift))
      return ABORT_UPSTREAM_UNREADY;
   if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg,  barShift))
      return ABORT_UPSTREAM_UNREADY;
   double t88_fvg = 0.0; if(!ReadFlow(FL_BUF_LTF_FVG_VALID, t88_fvg, barShift)) return ABORT_UPSTREAM_UNREADY; bool t88_a1 = ((int)MathRound(obValid) == 0); bool t88_a2 = ((int)MathRound(t88_fvg) == 0); bool t88_a3 = ((int)MathRound(oppFvg) == 1); int t88_n = (t88_a1 ? 1 : 0) + (t88_a2 ? 1 : 0) + (t88_a3 ? 1 : 0); static int s_t88_ev = 0; static int s_t88_c1 = 0; static int s_t88_c2 = 0; static int s_t88_c3 = 0; s_t88_ev++; if(t88_n == 1) s_t88_c1++; if(t88_n == 2) s_t88_c2++; if(t88_n == 3) s_t88_c3++; if(InpDebugLog && t88_n > 0) PrintFormat("[SRJ-EA] FRESHCOUNT #%d bar=%s state=%s obDead=%d fvgDead=%d oppFvg=%d adverse=%d verdict=%s scope=%s cum1=%d cum2=%d cum3=%d", s_t88_ev, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), StateName(g_state), (int)t88_a1, (int)t88_a2, (int)t88_a3, t88_n, (twoOfThreeKills && t88_n >= 2 ? "ABORT" : "HOLD"), (twoOfThreeKills ? "pre" : "post"), s_t88_c1, s_t88_c2, s_t88_c3);
   if(t88_n >= 2 && twoOfThreeKills) return (t88_a3 ? ABORT_FRESH_OPP_FVG : ABORT_FRESH_OB_DEAD);
   return "";
  }

//====================== Step 6: TP target computation =================
void TpTargetUpdateBest(double v, ENUM_SRJ_DIR dir, double currentPrice,
                         double &best, bool &haveBest)
  {
   if(v == EMPTY_VALUE || v <= 0.0) return;
   bool inDir = (dir == DIR_LONG) ? (v > currentPrice) : (v < currentPrice);
   if(!inDir) return;

   //--- [Task 31 / Ruling 7c] A target lying INSIDE the entry zone is not a
   //--- target. Measured instance: tp=1.15090 inside zone 1.15064-1.15096
   //--- inverted the geometry entirely (the "profit" side sat behind the
   //--- entry). Excluding it promoted the next candidate at 1.15144, giving
   //--- R 1.50 with both legs coherent. None of the operator's three logged
   //--- August targets was inside its zone, so no wider exclusion is warranted.
   //--- Threshold-free: the test is containment, not distance. Part A section 7
   //--- is not engaged.
   //--- g_zoneHi/g_zoneLo read 0.0 until the S3 transition sets them, so this
   //--- guard is inert before arming and pre-arm behaviour is unchanged.
   if(g_zoneHi > 0.0 && g_zoneLo > 0.0 && v >= g_zoneLo && v <= g_zoneHi) return;
   double dist = MathAbs(v - currentPrice);
   if(!haveBest || dist < MathAbs(best - currentPrice))
     { best = v; haveBest = true; }
  }

//--- TASK 39 (EA-26 + EA-51): decode FlowLogic buffer 29 for one session/PD TP
//--- candidate. sessIdx is the sessbufs[] index (0..9). Excluded when:
//---   EA-26  its swept bit (0..9, same order) is set Ã¢â‚¬â€ swept once = not fresh; or
//---   EA-51  its owning session is currently live (bits 10..13) Ã¢â‚¬â€ a still-forming
//---          session's own extreme is never a target. PD (idx 0,1) has no live bit.
//--- Applies ONLY to the ten session/PD levels; POI VWAP/POC lines are never
//--- filtered here. Fail-open on EMPTY_VALUE (warmup only Ã¢â‚¬â€ UpstreamReady gates
//--- evaluation, so a logic-path read is always populated).
bool TpSessionLevelFiltered(int sessIdx, double mask)
  {
   if(mask == EMPTY_VALUE) return false;
   int m = (int)MathRound(mask);
   if((m & (1 << sessIdx)) != 0) return true;              // EA-26: already swept
   int liveBit = -1;
   if(sessIdx == 2 || sessIdx == 3)      liveBit = 10;     // Asia
   else if(sessIdx == 4 || sessIdx == 5) liveBit = 11;     // London
   else if(sessIdx == 6 || sessIdx == 7) liveBit = 12;     // NY
   else if(sessIdx == 8 || sessIdx == 9) liveBit = 13;     // PM
   if(liveBit >= 0 && (m & (1 << liveBit)) != 0) return true; // EA-51: session live
   return false;
  }

bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                             double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   const int sessbufs[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
   //--- TASK 39: swept + session-live mask, read once for the session/PD group.
   //--- The POI-line loop below is deliberately not filtered by it.
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
    //--- [Task 144 / EA-141] print the swept+live mask so every session-level
    //--- exclusion is attributable to a branch. Print only; nothing reads this.
    if(InpDebugLog)
      {
       int t144_m = (s39_mask == EMPTY_VALUE) ? -1 : (int)MathRound(s39_mask);
       PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d "
                   "swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                TIME_DATE|TIME_MINUTES),
                   s39_mask, t144_m,
                   (t144_m < 0) ? 9 : ((t144_m >> 0) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 1) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 2) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 3) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 4) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 5) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 6) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 7) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 8) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 9) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 10) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 11) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 12) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 13) & 1));
      }

   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(k == g_anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2)) continue;
      double v;
      if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   //--- TASK 23 (EA-23a / EA-24): read-only census of the take-profit candidate
   //--- set. Re-walks both candidate groups and matches each against the value
   //--- `best` already holds, so it names the winner without touching it. It
   //--- assigns nothing this function reads and alters no control flow.
   //--- `best` was assigned directly from a candidate, so exact equality is a
   //--- valid identity test here and is not a tolerance comparison.
   if(InpDebugLog)
     {
      static int s_tpDumps = 0;
      if(s_tpDumps < 2000)
        {
         s_tpDumps++;
         const int cbuf[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                                FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                                FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                                FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                                FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
         const string cname[10] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
                                    "NYH", "NYL", "PMH", "PML" };
         string winner   = "NONE";
         string admitted = "";
         int    nEmpty   = 0;
         for(int i = 0; i < 10; i++)
           {
            double cv;
            if(!ReadFlow(cbuf[i], cv, barShift)) continue;
            if(cv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (cv > currentPrice) : (cv < currentPrice);
            if(!inDir) continue;
            admitted += cname[i] + ":" +
                        DoubleToString(MathAbs(cv - currentPrice) / _Point, 0) + " ";
            if(haveBest && cv == best) winner = cname[i];
           }
         for(int k2 = 0; k2 < POI_NLINES; k2++)
           {
            if(k2 == g_anchorLine || (g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
            double pv;
            if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
            if(pv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
            if(!inDir) continue;
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
           }
         PrintFormat("[SRJ-EA] TPCENSUS #%d bar=%s dir=%s close=%s winner=%s best=%s "
                     "distPts=%s empties=%d admitted= %s",
                     s_tpDumps,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(dir),
                     DoubleToString(currentPrice, _Digits),
                     winner,
                     haveBest ? DoubleToString(best, _Digits) : "-",
                     haveBest ? DoubleToString(MathAbs(best - currentPrice) / _Point, 0) : "-",
                     nEmpty, admitted);
        }
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

//--- TASK 21: bounded walk back to the most recent confirmed swing at or
//--- before evalShift. Reads through ReadFlow, so it inherits Task 20's
//--- settled-slot offset. Returns the value and the eval-frame shift it was
//--- found at. On failure sets outVal to 0.0 and foundShiftOut to -1.
//--- The 500-slot bound matches the 2-swing branch's existing bound. It is a
//--- safety limit, not a tunable threshold Ã¢â‚¬â€ Part A section 7 forbids
//--- optimizable parameters and this is not one.
bool FindNearestSwing(int bufIdx, int evalShift, double &outVal, int &foundShiftOut)
  {
   outVal        = 0.0;
   foundShiftOut = -1;
   for(int s = evalShift; s <= evalShift + 500; s++)
     {
      double v;
      if(!ReadFlow(bufIdx, v, s)) break;
      if(v == EMPTY_VALUE || v <= 0.0) continue;
      outVal        = v;
      foundShiftOut = s;
      return true;
     }
   return false;
  }

//====================== [P-SWINGIMB] SLIMB shadow census =================
//--- Print-only helpers. No working-set write, no selection branch. The
//--- nuanceClass token is derived here from the passed values (that IS the
//--- OB-validity hypothesis test the packet orders); slShift mirrors the
//--- chosen slot shift (-1 where the branch exposes no slot).
//--- FRAME NOTE (P-SWINGIMB-2 Finding 3a): every `shift` token printed by
//--- SLIMB is in ReadFlow frame (CopyBuffer position = eval shift +
//--- FLOW_SHIFT_OFFSET, the settled slot). A swing value found at eval shift
//--- s sits at price shift s+FLOW_SHIFT_OFFSET = ApexShift(s). Do NOT
//--- "correct" printed shifts by the offset; route price reads through
//--- ApexShift instead.
//--- [P-SWINGIMB-2 E6] one named helper; every price read of a swing's own
//--- bar goes through it.
int ApexShift(const int evalShift) { return evalShift + FLOW_SHIFT_OFFSET; }
//--- [P-SLDEF-1 E13] forward declaration: defined beside the walk core below.
string SlimbShiftT(const int s);

string SlimbTuple(const int s, const double v, const string flagS,
                  const ENUM_SRJ_DIR dir, const double refV)
  {
   double t_o = iOpen(_Symbol, PERIOD_CURRENT, ApexShift(s));
   double t_c = iClose(_Symbol, PERIOD_CURRENT, ApexShift(s));
   double t_b = (dir == DIR_LONG) ? MathMin(t_o, t_c) : MathMax(t_o, t_c);
   string m = ((dir == DIR_LONG) ? (t_b < refV - _Point) : (t_b > refV + _Point)) ? "B" : "W";
   return IntegerToString(s) + ":" + DoubleToString(v, _Digits) + ":" + flagS + ":" + m;
  }

void SlimbEmit(const int barShift, const string site, const ENUM_SRJ_DIR dir,
               const string branch, const int obValidI, const string slRefS,
               const int slShiftV, const int latFlagV, const int latShiftV,
               const int latAvailI, const int apexMatchI, const int chFlagV,
               const int chShiftV, const int chAvailI, const string candsS)
  {
   string nuanceCls = "UNEVAL";
   if(latAvailI == 1 && (obValidI == 0 || obValidI == 1) &&
      (latFlagV == 0 || latFlagV == 1 || latFlagV == 2))
      nuanceCls = ((obValidI == 1) ? "OB_VALID_" : "OB_DEAD_")
                  + ((latFlagV == 0) ? "LATEST_NOIMB" : "LATEST_IMB");
   string slimb_line = StringFormat("[SRJ-EA] SLIMB fields=19 bar=%s site=%s dir=%s branch=%s obValid=%d slRef=%s slShift=%d slShiftT=%s latestFlag=%d latestShift=%d latestShiftT=%s latestAvail=%d latestApexMatch=%d chosenFlag=%d chosenShift=%d chosenShiftT=%s chosenAvail=%d nuanceClass=%s cands=%s",
               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
               site, DirName(dir), branch, obValidI, slRefS, slShiftV, SlimbShiftT(slShiftV),
               latFlagV, latShiftV, SlimbShiftT(latShiftV), latAvailI, apexMatchI,
               chFlagV, chShiftV, SlimbShiftT(chShiftV), chAvailI, nuanceCls, candsS);
   LwAudit("SLIMB", slimb_line);
   Print(slimb_line);
  }

//====================== [P-SWINGIMB-3 E8/E9] SLIMBWALK shadow =================
//--- Print-only outward-walk shadow. 23 named tokens + fields=23. Frame note:
//--- `startShift` and all printed shifts are ReadFlow frame; price reads of a
//--- swing's own bar go through ApexShift. No working-set write, no selection
//--- branch, no memo contact. E8 walk repair (council Q1 YES): the running
//--- extreme is seeded from the CHOSEN reference and a candidate qualifies iff
//--- it reuses the SL_STRUCT exceeds idiom character-for-character (beyond the
//--- running extreme by more than _Point) AND carries code 1. Extremity is
//--- structural: a more-extreme swing updates the running extreme whether or
//--- not it carries code 1 (counted in extUpdatedByNonQual); code 0 and code 2
//--- are walked past (code-2s counted); code 3 TERMINATES the walk (reported
//--- as WALK_UNEVALUABLE, never read as "no imbalance"). Zero-step: anchor
//--- flag 1 means slBase = slToday with walkSteps = 0 (ruling (b) walks
//--- further back only when the swing lacks an imbalance). Exhaustion and
//--- code-3 termination both fall back to slToday (declared). slNuance =
//--- slBase unless the wick-only carve-out fires (newest walked-past swing
//--- more-extreme than the CHOSEN reference by wick only - predicate UNCHANGED
//--- from RECON9, operands still printed, body extreme still through
//--- ApexShift), then the chosen (inward) reference. Deltas are raw price
//--- differences in points with slToday as origin (sign as-is; protective
//--- direction depends on side). E9 class totality: the class is derived from
//--- a total mapping over todayEqBase/todayEqNuance/baseEqNuance, printed
//--- beside the class so any mislabel is recomputable without a rerun; every
//--- believed-unreachable cell is UNCLASSIFIED, never a neighbour's name.
//--- Council Q2 assertion (no per-candidate side test): sideViolations counts
//--- any of slToday/slBase/slNuance on the non-protective side of slCurPx
//--- (the eval-bar close, same value as ComputeSlReference's slCurPx).
//====================== [P-SLDEF-1 E11] parameterized walk core =================
//--- E11.1: ONE walk implementation taking the anchor as arguments. The OB limb
//--- calls it with (chosenShift, chosenV); the fractal limb with (latestShift,
//--- latestVal). todayV stays the deltas/class origin on both limbs so the two
//--- columns are comparable. Zero-step (anchor flag 1) returns the ANCHOR price
//--- (ruling b: a qualifying anchor is not walked past); on the OB limb
//--- anchorV==todayV, so RECON10 behavior is reproduced exactly.
struct SlimbWalkOut
  {
   double baseV;
   double nuanceV;
   int    steps;
   int    code2;
   int    exh;
   int    skipS;
   double skipV;
   int    skipF;
   string bodyS;
   int    extNQ;
   int    c3;
   int    anchorF;
   int    eqB;
   int    eqN;
   int    eqBN;
     string cls;
     bool   haveVals;
     //--- [P-SLDEF-3 E28] originating slots for the slot-identity
     //--- correspondence. baseS = shift whose value became baseV
     //--- (startShift when the anchor itself qualified); nuanceS mirrors
     //--- nuanceV (startShift under carve, else baseS). -1 = the path
     //--- exposes no genuine slot (exhausted/unevaluated echoes).
     int    baseS;
     int    nuanceS;
    //--- [P-SLDEF-1b E18] carve-out operands for the SLIMBRCARVE print. Walk
    //--- logic untouched: retV is the anchor the walk started from, carve and
    //--- bodyThru are the skip-block's own verdicts, exported, never re-decided.
    double retV;
    int    carve;
    int    bodyThru;
   };

//--- Total class mapping (E9, shared by both limbs per E11.7): all eight cells
//--- named; believed-unreachable cells are UNCLASSIFIED, never a neighbour.
//--- [P-SLDEF-1b E16] ONE protective-side expression for the whole file. This
//--- is the Task-75 side-guard expression verbatim (threshold-free: WHICH SIDE
//--- of the eval-bar close the reference lies on, never how far). Both the
//--- Task-75 selection site and the fractal-anchor shadow guard call it, so no
//--- second side test exists anywhere. E16.1 compliance route: extraction, not
//--- duplication; the Task-75 call site below passes identical operands, so
//--- its boolean is provably unchanged (and gate 4's OB join re-proves it).
bool SlimbProtectiveSideOk(const ENUM_SRJ_DIR dir, const double refV, const double curPx)
   {
    return ((dir == DIR_LONG) ? (refV < curPx) : (refV > curPx));
   }

//--- [P-SLDEF-1b E15] pre-write width audit. Returns the line unchanged; call
//--- pattern is: string s = StringFormat(...); LwAudit("CLASS", s); Print(s);
//--- which emits byte-identical journal text to the PrintFormat it replaces.
void LwAudit(const string cls, const string line)
   {
    int L = StringLen(line);
    int i = -1;
    for(int k = 0; k < g_lw_n; k++)
       if(g_lw_class[k] == cls) { i = k; break; }
     if(i < 0 && g_lw_n < 32)
      { i = g_lw_n; g_lw_n++; g_lw_class[i] = cls; g_lw_max[i] = 0; g_lw_trunc[i] = 0; }
    if(i >= 0)
      {
       if(L > g_lw_max[i]) g_lw_max[i] = L;
       if(L > LW_CAP) g_lw_trunc[i]++;
      }
   }

string SlimbWalkClass(const bool carve, const bool eqB, const bool eqN, const bool eqBN)
  {
   if(carve && !eqN) return "CARVEOUT_FIRED";
   if(eqB && eqN && eqBN) return "ALL3_EQ";
   if(eqB && !eqN && !eqBN) return "TODAY_EQ_BASE";
   if(!eqB && eqN && !eqBN) return "TODAY_EQ_NUANCE";
   if(!eqB && !eqN && eqBN) return "BASE_MOVED";
   return "UNCLASSIFIED";
  }

void SlimbWalkCore(const ENUM_SRJ_DIR dir, const int swingBuf, const int imbBuf,
                   const int barShift, const int startShift,
                   const double anchorV, const double todayV, SlimbWalkOut &o)
  {
    o.haveVals = false; o.cls = "UNRESOLVED";
    o.retV = anchorV; o.carve = 0; o.bodyThru = -1;
   o.baseV = todayV; o.nuanceV = todayV;
   o.steps = 0; o.code2 = 0; o.exh = -1;
   o.skipS = -1; o.skipV = 0.0; o.skipF = -1; o.bodyS = "-";
    o.extNQ = 0; o.c3 = 0; o.anchorF = -1;
    o.eqB = -1; o.eqN = -1; o.eqBN = -1;
    o.baseS = -1; o.nuanceS = -1;
   int anchorF = -1;
   double ar = 0.0;
   if(ReadFlow(imbBuf, ar, startShift) && ar != EMPTY_VALUE) anchorF = (int)ar;
   o.anchorF = anchorF;
    bool foundBase = false;
    bool terminated3 = false;
    double baseV = anchorV;
    int baseS = -1;
    double runExt = anchorV;
   bool skipSeen = false;
   int skipS = -1; double skipV = 0.0; int skipF = -1;
    if(anchorF == 1)
       { baseV = anchorV; foundBase = true; baseS = startShift; }
   else
     {
      for(int s = startShift + 1; s <= startShift + 500; s++)
        {
         double v = 0.0;
         if(!ReadFlow(swingBuf, v, s)) break;
         if(v == EMPTY_VALUE || v <= 0.0) continue;
         o.steps++;
         double f = 0.0;
         int fi = -1;
         if(ReadFlow(imbBuf, f, s) && f != EMPTY_VALUE) fi = (int)f;
         if(fi == 3) { o.c3 = 1; terminated3 = true; break; }
         bool exceeds = (dir == DIR_LONG) ? (v < runExt - _Point)
                                          : (v > runExt + _Point);
         if(exceeds)
           {
             runExt = v;
             if(fi != 1) o.extNQ++;
             else { baseV = v; foundBase = true; baseS = s; break; }
           }
         if(fi == 2) o.code2++;
         bool moreExtreme = (dir == DIR_LONG) ? (v < anchorV - _Point) : (v > anchorV + _Point);
         if(moreExtreme && !skipSeen)
           { skipSeen = true; skipS = s; skipV = v; skipF = fi; }
        }
     }
   if(terminated3)
     {
      o.exh = 0;
      o.eqB = 1; o.eqN = 1; o.eqBN = 1;
      o.haveVals = true;
      o.cls = "WALK_UNEVALUABLE";
      return;
     }
   if(!foundBase)
     {
      o.exh = 1;
      o.eqB = 1; o.eqN = 1; o.eqBN = 1;
      o.haveVals = true;
      o.cls = "WALK_EXHAUSTED";
      return;
     }
   o.exh = 0;
   bool carve = false;
   double nuanceV = baseV;
   if(skipSeen)
     {
      o.skipS = skipS;
      o.skipV = skipV;
      o.skipF = skipF;
      double so = iOpen(_Symbol, PERIOD_CURRENT, ApexShift(skipS));
      double sc = iClose(_Symbol, PERIOD_CURRENT, ApexShift(skipS));
      double sb = (dir == DIR_LONG) ? MathMin(so, sc) : MathMax(so, sc);
      o.bodyS = DoubleToString(sb, _Digits);
       bool bodyThrough = (dir == DIR_LONG) ? (sb < anchorV - _Point) : (sb > anchorV + _Point);
       o.bodyThru = bodyThrough ? 1 : 0;
       if(!bodyThrough) { carve = true; nuanceV = anchorV; }
      }
     o.carve = carve ? 1 : 0;
    o.baseV = baseV; o.nuanceV = nuanceV;
    o.baseS = baseS; o.nuanceS = carve ? startShift : baseS;
   bool eqB = (baseV == todayV);
   bool eqN = (nuanceV == todayV);
   bool eqBN = (baseV == nuanceV);
   o.eqB = eqB ? 1 : 0; o.eqN = eqN ? 1 : 0; o.eqBN = eqBN ? 1 : 0;
   o.haveVals = true;
   o.cls = SlimbWalkClass(carve, eqB, eqN, eqBN);
  }

//--- [P-SLDEF-1 E13] shift-to-barTime helper: the code's own price-bar belief
//--- for a ReadFlow-frame shift (prices are read via ApexShift). Shifts keep
//--- their names and frame; barTime rides beside them, never replacing them.
string SlimbShiftT(const int s)
   {
    if(s < 0) return "-";
    return TimeToString(iTime(_Symbol, PERIOD_CURRENT, ApexShift(s)), TIME_DATE|TIME_MINUTES);
   }

//--- [P-SLDEF-3 E28] slot-identity residual: the rung at the reference's own
//--- slot, price residual in points. found=false when the path exposes no
//--- slot (-1) or no rung sits at that slot. -999 = unevaluable (never a
//--- residual). rungSlot echoes the matched rung's slot (equal to refSlot on
//--- a match — the equality itself is the join proof). Callers count
//--- FRAC_OFF vs TODAY_OFF from found, never from price proximity.
int SlimbCorrResid(const int refSlot, const double refV, const int &shifts[], const double &pxs[], const int n, bool &found, int &rungSlot)
   {
    found = false; rungSlot = -1;
    if(refSlot < 0) return -999;
    for(int i = 0; i < n; i++)
       if(shifts[i] == refSlot)
         { found = true; rungSlot = shifts[i]; return (int)MathRound((pxs[i] - refV) / _Point); }
    return -999;
   }

//--- [P-SLDEF-5 E35] extremity-index lookup: rungExt of the ladder rung at
//--- the reference's own slot; -1 (printed NONE) when no rung sits at that
//--- slot. Slot identity, never price proximity (E28 doctrine).
int SrjExtIndexOf(const int refSlot, const int &shifts[], const int &exts[], const int n)
   {
    if(refSlot < 0) return -1;
    for(int i = 0; i < n; i++)
       if(shifts[i] == refSlot) return exts[i];
    return -1;
   }

//--- [P-SLDEF-5 E37] filed operator levels with provenance (RESCOPE Ruling
//--- 2 as amended: all four now HAND — Aug-28 promoted by his Q1 YES; the
//--- prov-token flip rides the adoption packet, so the code token stays
//--- INFERRED until then and the row still grades PROVISIONAL_MATCH).
//--- Keyed by S5 eval barTime — the only key unique across the two 09.07
//--- rows. No CODE row exists here: CODE is refused as an operator level
//--- by construction. [P-SLDEF-6 E45.4] filedT carried per filed level:
//--- Aug-28 now 06:30 (HAND-sourced); barDiff stops resting on inspection.
bool SrjFiledLevel(const string barT, double &px, string &prov, string &filedT)
   {
    if(barT == "2026.08.28 10:00") { px = 1.16508; prov = "INFERRED"; filedT = "2026.08.28 06:30"; return true; }
    if(barT == "2026.09.04 15:55") { px = 1.15847; prov = "HAND"; filedT = "-"; return true; }
    if(barT == "2026.09.07 09:15") { px = 1.16098; prov = "HAND"; filedT = "-"; return true; }
    if(barT == "2026.09.07 16:40") { px = 1.16239; prov = "HAND"; filedT = "2026.09.07 16:15"; return true; }
    return false;
   }

//--- [P-SLDEF-6 E44] Sep-8 targeted probe levels, hardcoded, provenance
//--- HAND (his words, BUILDER_FINDING_SLDEF5_FIVEEXAMPLES Addendum 2).
//--- Keyed by eval barTime; the 481-site shadow covers these bars when
//--- they are evaluated, and then this only labels the shadow row.
bool SrjSep8Filed(const string barT, double &px)
   {
    if(barT == "2026.09.08 10:10") { px = 1.16258; return true; }
    if(barT == "2026.09.08 17:00") { px = 1.16274; return true; }
    return false;
   }

//--- histogram feed for one slot-matched pair. No-op unless matched.
void SlimbCorrHist(const string barT, const string ref, const bool found, const int resid, const int rungSlot, const int refSlot)
   {
    if(!found) return;
    g_corr_pairs++;
    if(resid == 0) { g_corr_zero++; return; }
    if(resid >= -50 && resid <= 50) g_corr_hist[resid + 50]++;
    else if(resid < -50) g_corr_lo++; else g_corr_hi++;
     if(g_corr_nzN < 32)
       { g_corr_nz += barT + "|" + ref + "|" + IntegerToString(rungSlot) + ":" + IntegerToString(refSlot) + ":" + IntegerToString(resid) + ";"; g_corr_nzN++; }
     else g_corr_nzDrop++;
    }

//--- [P-SLDEF-4 E31] slot-occupancy witness: the reference's own slot holds
//--- a swing-buffer value (1), exposes no slot (-1: slotless echo, steps
//--- unattributable), else 0. Read-only; an unreadable slot reads
//--- unoccupied (fail-soft: the walk read these same slots moments earlier
//--- in this same evaluation, so a failure here is itself a finding).
int SrjRefIsRung(const int refSlot, const int swingBuf)
   {
    if(refSlot < 0) return -1;
    double rv = 0.0;
    if(!ReadFlow(swingBuf, rv, refSlot)) return 0;
    if(rv == EMPTY_VALUE || rv <= 0.0) return 0;
    return 1;
   }

//--- [P-SLDEF-5 E35] ext-1 shadow resolver. Walks the protective-side swing
//--- buffer outward from the entry bar with the ladder's own idiom (same
//--- buffer, same scan order, same 1-point extremity idiom, same protective
//--- test vs the row's live entry) and returns the rung at rungExt == 1 —
//--- anchor-free, no imbalance term, no carve-out. Print-only; selection,
//--- reference and verdict never read the outs. A standalone walk (not the
//--- ladder loop) because SLIMBR prints before the ladder enumerates;
//--- determinism of buffer reads makes the two agree rung-for-rung. The
//--- packet names ComputeSlReference as the site; the shadow sits here
//--- instead because that function is selection-frozen — gate 5's intent
//--- (resolved on every S5 invocation) is met at the S5 SLIMBR site.
void SrjResolveExt1(const int entryShift, const ENUM_SRJ_DIR dir, const double entryPx,
                    int &hasX1, double &px, int &slot, datetime &bt, int &imb, int &deepest)
   {
    hasX1 = 0; px = 0.0; slot = -1; bt = 0; imb = -1; deepest = -1;
    int swBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
    int imBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB;
    double best = 0.0; int extN = 0; int rungs = 0;
    for(int s = entryShift; s <= entryShift + SRJ_LAD_ABS_SLOT_CAP; s++)
      {
       double v = 0.0;
       if(!ReadFlow(swBuf, v, s)) break;
       if(v == EMPTY_VALUE || v <= 0.0) continue;
       if(!SlimbProtectiveSideOk(dir, v, entryPx)) continue;
       int ext = -1;
       if(rungs == 0) { ext = 0; best = v; extN = 1; }
       else
         {
          bool more = (dir == DIR_LONG) ? (v < best - _Point) : (v > best + _Point);
          if(more) { ext = extN; extN++; best = v; }
         }
       if(ext > deepest) deepest = ext;
       if(ext == 1 && hasX1 == 0)
         {
          hasX1 = 1; px = v; slot = s;
          bt = iTime(_Symbol, PERIOD_CURRENT, ApexShift(s));
          double f = 0.0; imb = -1;
          if(ReadFlow(imBuf, f, s) && f != EMPTY_VALUE) imb = (int)f;
         }
       rungs++;
       if(rungs >= 512) break;
      }
   }

//--- [P-SLDEF-4 E33] ORDER census: one line per bar on which the S5 gate is
//--- evaluated. seqBias = the bias-site stamp for this bar (-1 when the site
//--- did not run for it); seqS5 = this evaluation's stamp (bias textually
//--- precedes S5 in the same per-bar pass, so seqBias < seqS5 whenever both
//--- stamp). biasAtGate = HTF anti-leg count against the locked direction at
//--- the gate (-1 unreadable; same want convention as MtFlipEmit).
//--- flipDetectedThisBar = the flip is first detectable on this bar (anti>=2
//--- now, <2 on the previous bar). gateOutcome is passed in decided — every
//--- call site below passes its already-decided outcome; no branch reads
//--- anything here. The last-bar guard enforces one line per bar.
void SrjOrderEmit(const int barShift, const string outcome)
   {
    if(!InpDebugLog) return;
    datetime obt = iTime(_Symbol, PERIOD_CURRENT, barShift);
    if(obt == g_order_lastBarT) return;
    g_order_lastBarT = obt;
    g_order_seq++;
    int oSeqS5 = g_order_seq;
    int oSeqB = (g_order_biasBarT == obt) ? g_order_seqBias : -1;
    int oWant = (g_dir == DIR_LONG) ? 1 : -1;
    double oH = 0.0, oM = 0.0, oL = 0.0;
    int oAntiNow = -1, oAntiPrev = -1;
    if(ReadFlow(FL_BUF_HTF_HIGH, oH, barShift) && ReadFlow(FL_BUF_HTF_MID, oM, barShift) && ReadFlow(FL_BUF_HTF_LOW, oL, barShift))
      {
       oAntiNow = 0;
       if((int)MathRound(oH) == -oWant) oAntiNow++;
       if((int)MathRound(oM) == -oWant) oAntiNow++;
       if((int)MathRound(oL) == -oWant) oAntiNow++;
      }
    double oH1 = 0.0, oM1 = 0.0, oL1 = 0.0;
    if(ReadFlow(FL_BUF_HTF_HIGH, oH1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, oM1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, oL1, barShift + 1))
      {
       oAntiPrev = 0;
       if((int)MathRound(oH1) == -oWant) oAntiPrev++;
       if((int)MathRound(oM1) == -oWant) oAntiPrev++;
       if((int)MathRound(oL1) == -oWant) oAntiPrev++;
      }
    int oFlip = (oAntiNow >= 2 && oAntiPrev >= 0 && oAntiPrev < 2) ? 1 : 0;
    if(oFlip == 1 && outcome == "PASS") g_order_flipPassN++;
    //--- [P-SLDEF-5 E40] renames: flipNewThisBar (same newness predicate),
    //--- biasOpposedAtGate (state boolean beside the anti count; -1 unreadable
    //--- passes through). [P-SLDEF-5 E38] SEQ_UNSTAMPED naming: the bias site
    //--- did not run for this bar (S4→S5 cause); R1's 4 unstamped rows.
    int oOpp = (oAntiNow < 0) ? -1 : ((oAntiNow >= 2) ? 1 : 0);
    string oStamp = (oSeqB < 0) ? "SEQ_UNSTAMPED" : "STAMPED";
    string oCause = (oSeqB < 0) ? "S4S5_NOBIAS" : "-";
    string oLine = StringFormat("[SRJ-EA] ORDER fields=10 bar=%d barTime=%s seqBias=%d seqS5=%d biasAtGate=%d biasOpposedAtGate=%d flipNewThisBar=%d gateOutcome=%s seqStamp=%s seqCause=%s",
              barShift, TimeToString(obt, TIME_DATE|TIME_MINUTES),
              oSeqB, oSeqS5, oAntiNow, oOpp, oFlip, outcome, oStamp, oCause);
    LwAudit("ORDER", oLine);
    Print(oLine);
   }

//--- [P-SLDEF-4 E31] zero-step OB-extreme emission: REF_OB_DEEP with slot
//--- and distances (slots from the entry bar + price points from today's
//--- stop, SLIMBR sign convention). Fractal refs never take this token.
void SrjDeepEmit(const string barT, const ENUM_SRJ_DIR dir, const string ref,
                 const int slot, const int entryShift,
                 const double refPx, const double slRef)
   {
    string dLine = StringFormat("[SRJ-EA] REF_OB_DEEP fields=10 bar=%s site=S5 dir=%s ref=%s slot=%d slotT=%s slotDist=%d distPts=%d refPx=%s slRef=%s",
              barT, DirName(dir), ref, slot, SlimbShiftT(slot), slot - entryShift,
              (int)MathRound((refPx - slRef) / _Point),
              DoubleToString(refPx, _Digits), DoubleToString(slRef, _Digits));
    LwAudit("REF_OB_DEEP", dLine);
    Print(dLine);
   }

void SlimbWalkEmit(const int barShift, const string site, const ENUM_SRJ_DIR dir,
                   const string branch, const bool haveToday, const double todayV,
                   const int startShift, const double chosenV, const int fracShift = -1)
  {
   //--- [P-NEWS-1 E22] decision-surface intersection census (read-only tally:
   //--- SLIMB-walk invocations whose eval bar sits inside a blackout window).
   if(g_news_init && InpDebugLog)
     {
      string nwk; int npos, nrow;
      if(SrjInNewsBlackout(iTime(_Symbol, PERIOD_CURRENT, barShift), nwk, npos, nrow))
        { g_news_slimbInWin++; if(site == "S5") g_news_s5InWin++; }
     }
   string tToday = haveToday ? DoubleToString(todayV, _Digits) : "-";
   string tBase = "-", tNuance = "-", tDB = "-", tDN = "-";
   int tSteps = 0, tCode2 = 0, tExh = -1;
   int tSkipS = -1; string tSkipV = "-", tSkipF = "-", tBody = "-";
    int tExtNQ = 0, tC3 = 0, tSideV = 0;
    int tBodyThru = -1;
   int tEqB = -1, tEqN = -1, tEqBN = -1;
   string cls = "UNRESOLVED";
   double wBaseV = 0.0, wNuanceV = 0.0;
   bool wHaveVals = false;
   int tOutB = 0, tOutN = 0;
   string fBase = "-", fNuance = "-", fDB = "-", fDN = "-";
   int fSteps = 0, fCode2 = 0, fExh = -1, fAnchorF = -1, fC3 = 0, fExtNQ = 0;
   int fEqB = -1, fEqN = -1, fEqBN = -1;
   string fCls = "UNRESOLVED";
   double fBaseV = 0.0, fNuanceV = 0.0;
   bool fHaveVals = false;
    int fOutB = 0, fOutN = 0;
    int fRawS = fracShift, fGuardS = fracShift, fGuardApplied = 0, fSideV = 0;
    string fRawSide = "-";
    int fSkipS = -1;
    int fBaseS = -1, fNuanceS = -1;
    double fRetV = 0.0, fSkipVd = 0.0;
    int fSkipF = -1, fBodyThru = -1;
    string fBody = "-";
    int fCarveF = -1;
   if(haveToday && startShift >= 0)
     {
      int swingBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
      int imbBuf   = (dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB;
      double curPx = iClose(_Symbol, PERIOD_CURRENT, barShift);
      SlimbWalkOut ob;
      SlimbWalkCore(dir, swingBuf, imbBuf, barShift, startShift, chosenV, todayV, ob);
      tBase = DoubleToString(ob.baseV, _Digits);
      tNuance = DoubleToString(ob.nuanceV, _Digits);
      tDB = IntegerToString((int)MathRound((ob.baseV - todayV) / _Point));
      tDN = IntegerToString((int)MathRound((ob.nuanceV - todayV) / _Point));
      tSteps = ob.steps; tCode2 = ob.code2; tExh = ob.exh;
      if(ob.skipS >= 0)
        {
         tSkipS = ob.skipS; tSkipV = DoubleToString(ob.skipV, _Digits);
         tSkipF = (ob.skipF < 0) ? "x" : IntegerToString(ob.skipF);
         tBody = ob.bodyS;
        }
      tExtNQ = ob.extNQ; tC3 = ob.c3; tBodyThru = ob.bodyThru;
      tEqB = ob.eqB; tEqN = ob.eqN; tEqBN = ob.eqBN; cls = ob.cls;
      wBaseV = ob.baseV; wNuanceV = ob.nuanceV; wHaveVals = ob.haveVals;
      if(dir == DIR_LONG)
        {
         if(todayV > curPx) tSideV++;
         if(wBaseV > curPx) tSideV++;
         if(wNuanceV > curPx) tSideV++;
        }
      else
        {
         if(todayV < curPx) tSideV++;
         if(wBaseV < curPx) tSideV++;
         if(wNuanceV < curPx) tSideV++;
        }
      tOutB = (int)MathRound(((dir == DIR_LONG) ? -(wBaseV - todayV) : (wBaseV - todayV)) / _Point);
      tOutN = (int)MathRound(((dir == DIR_LONG) ? -(wNuanceV - todayV) : (wNuanceV - todayV)) / _Point);
      if(fracShift >= 0)
        {
         double fav = 0.0;
         if(ReadFlow(swingBuf, fav, fracShift) && fav != EMPTY_VALUE && fav > 0.0)
           {
            bool fRawOk = SlimbProtectiveSideOk(dir, fav, curPx);
            fRawSide = fRawOk ? "PROTECTIVE" : "WRONG";
            double gav = fav;
            if(!fRawOk)
              {
               for(int gs = fracShift + 1; gs <= fracShift + 500; gs++)
                 {
                  double gv = 0.0;
                  if(!ReadFlow(swingBuf, gv, gs)) break;
                  if(gv == EMPTY_VALUE || gv <= 0.0) continue;
                  if(!SlimbProtectiveSideOk(dir, gv, curPx)) continue;
                  fGuardS = gs; gav = gv; fGuardApplied = 1;
                  break;
                 }
              }
            SlimbWalkOut fr;
            SlimbWalkCore(dir, swingBuf, imbBuf, barShift, fGuardS, gav, todayV, fr);
            fBase = DoubleToString(fr.baseV, _Digits);
            fNuance = DoubleToString(fr.nuanceV, _Digits);
            fDB = IntegerToString((int)MathRound((fr.baseV - todayV) / _Point));
            fDN = IntegerToString((int)MathRound((fr.nuanceV - todayV) / _Point));
            fSteps = fr.steps; fCode2 = fr.code2; fExh = fr.exh;
            fAnchorF = fr.anchorF; fC3 = fr.c3; fExtNQ = fr.extNQ;
            fEqB = fr.eqB; fEqN = fr.eqN; fEqBN = fr.eqBN; fCls = fr.cls;
            fBaseV = fr.baseV; fNuanceV = fr.nuanceV; fHaveVals = fr.haveVals;
             fRetV = fr.retV; fSkipVd = fr.skipV; fSkipF = fr.skipF;
             fBody = fr.bodyS; fBodyThru = fr.bodyThru; fSkipS = fr.skipS;
             fCarveF = fr.carve;
             fBaseS = fr.baseS; fNuanceS = fr.nuanceS;
            fOutB = (int)MathRound(((dir == DIR_LONG) ? -(fr.baseV - todayV) : (fr.baseV - todayV)) / _Point);
            fOutN = (int)MathRound(((dir == DIR_LONG) ? -(fr.nuanceV - todayV) : (fr.nuanceV - todayV)) / _Point);
            if(dir == DIR_LONG)
              {
               if(fr.baseV > curPx) fSideV++;
               if(fr.nuanceV > curPx) fSideV++;
              }
            else
              {
               if(fr.baseV < curPx) fSideV++;
               if(fr.nuanceV < curPx) fSideV++;
              }
           }
        }
      g_slimbr_barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
      g_slimbr_site = site;
      g_slimbr_base = wHaveVals ? wBaseV : 0.0;
      g_slimbr_nuance = wHaveVals ? wNuanceV : 0.0;
      g_slimbr_class = cls;
      g_slimbr_fracBase = fHaveVals ? fBaseV : 0.0;
      g_slimbr_fracNuance = fHaveVals ? fNuanceV : 0.0;
      g_slimbr_fracClass = fHaveVals ? fCls : "UNRESOLVED";
      //--- [P-SLDEF-1b E18] carve-operand stamps, both limbs. Values only;
      //--- the SLIMBR site decides (by class) whether a companion prints.
      g_slimbr_obRetV = wHaveVals ? chosenV : 0.0;
      g_slimbr_obSkipS = tSkipS;
      g_slimbr_obSkipV = (tSkipS >= 0) ? ob.skipV : 0.0;
      g_slimbr_obSkipF = (tSkipS >= 0) ? ob.skipF : -1;
      g_slimbr_obBodyS = tBody;
      g_slimbr_obBodyThru = tBodyThru;
      g_slimbr_frRetV = fHaveVals ? fRetV : 0.0;
      g_slimbr_frSkipS = fSkipS;
      g_slimbr_frSkipV = (fSkipS >= 0) ? fSkipVd : 0.0;
      g_slimbr_frSkipF = (fSkipS >= 0) ? fSkipF : -1;
       g_slimbr_frBodyS = fBody;
       g_slimbr_frBodyThru = fBodyThru;
       //--- [P-SLDEF-2 E23] ladder-anchor stamps. Values only; the SLADDER
       //--- site decides freshness by the barTime/site stamp above.
       g_slimbr_fracRawS = fRawS;
       g_slimbr_fracGuardS = fGuardS;
       g_slimbr_fracGuardApplied = fGuardApplied;
       //--- [P-SLDEF-3 E28] originating-slot stamps for the correspondence.
       g_slimbr_startShift = startShift;
       g_slimbr_obBaseS = ob.baseS;
       g_slimbr_obNuanceS = ob.nuanceS;
       g_slimbr_frBaseS = fBaseS;
       g_slimbr_frNuanceS = fNuanceS;
       //--- [P-SLDEF-4 E31] walk-step shadows for refWalkSteps.
       g_slimbr_obSteps = tSteps;
       g_slimbr_frSteps = fSteps;
       //--- [P-SLDEF-5 E36] carve-fired booleans from the predicate itself.
       g_slimbr_obCarveF = ob.carve;
       g_slimbr_frCarveF = fCarveF;
      }
   //--- [P-SLDEF-1b E15] the split: SLIMBWALK carries the OB limb only
   //--- (class= retained as the join key; sideViolations OB-scoped by
   //--- construction), SLIMBWALKF the fractal limb (fracClass= + guard
   //--- tokens). Both assembled first, measured pre-write, then printed.
   string slw_ob = StringFormat("[SRJ-EA] SLIMBWALK fields=27 bar=%s site=%s dir=%s branch=%s slToday=%s slBase=%s slNuance=%s deltaBasePts=%s deltaNuancePts=%s walkSteps=%d code2Seen=%d exhausted=%d skipShift=%d skipVal=%s skipFlag=%s bodyExt=%s extUpdatedByNonQual=%d code3Seen=%d sideViolations=%d todayEqBase=%d todayEqNuance=%d baseEqNuance=%d class=%s outwardBasePts=%d outwardNuancePts=%d skipShiftT=%s startShiftT=%s",
               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
               site, DirName(dir), branch, tToday, tBase, tNuance, tDB, tDN,
               tSteps, tCode2, tExh, tSkipS, tSkipV, tSkipF, tBody,
               tExtNQ, tC3, tSideV, tEqB, tEqN, tEqBN, cls,
               tOutB, tOutN,
               SlimbShiftT(tSkipS), SlimbShiftT(startShift));
   LwAudit("SLIMBWALK", slw_ob);
   Print(slw_ob);
   string slw_fr = StringFormat("[SRJ-EA] SLIMBWALKF fields=25 bar=%s site=%s dir=%s branch=%s fracAnchorShift=%d fracAnchorFlag=%d slFractal=%s slFractalNuance=%s deltaFracPts=%s deltaFracNuancePts=%s fracSteps=%d fracCode2=%d fracExh=%d fracC3=%d fracExtNQ=%d fracClass=%s sideFracViolations=%d outwardFracPts=%d outwardFracNuancePts=%d fracAnchorRawShift=%d fracAnchorRawSide=%s fracAnchorGuardApplied=%d fracAnchorShiftT=%s fracSkip=%d fracSkipT=%s",
               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
               site, DirName(dir), branch,
               fGuardS, fAnchorF, fBase, fNuance, fDB, fDN,
               fSteps, fCode2, fExh, fC3, fExtNQ, fCls,
               fSideV, fOutB, fOutN,
               fRawS, fRawSide, fGuardApplied,
               SlimbShiftT(fGuardS), fSkipS, SlimbShiftT(fSkipS));
   LwAudit("SLIMBWALKF", slw_fr);
   Print(slw_fr);
  }

//====================== Step 6: 1R stop-loss reference ================
bool ComputeSlReference(int barShift, ENUM_SRJ_DIR dir,
                         double &slRefOut, ENUM_SRJ_SLMODE &slModeOut,
                           const string site)
   {
    static int s_swingDumps = 0;
    //--- [P-SLDEF-6 E41] ext-1 shadow at EVERY invocation, both reference
    //--- branches (entry placement executes regardless of branch or return
    //--- path). Strictly additive: one pure-function call + new-class lines;
    //--- no existing local, return path, or memo interaction touched.
    //--- Origin: S5 = the caller-stamped strict next-open (entry bar); a
    //--- stale stamp or non-positive price halts the ROW (never substitutes
    //--- the evaluated bar). S2POLL/S3ARM = the eval-bar close, the same
    //--- prospective-entry price both sites' live R already uses (shared
    //--- memo-path convention, disclosed in BUILDER_RESULT_RECON17-SLDEF6).
    if(InpDebugLog)
      {
       datetime sl41_evalT = iTime(_Symbol, PERIOD_CURRENT, barShift);
       string sl41_barT = TimeToString(sl41_evalT, TIME_DATE|TIME_MINUTES);
       double sl41_oPx = 0.0; datetime sl41_oBT = 0; string sl41_halt = "-";
       if(site == "S5")
         {
          if(g_sl41_oSite == "S5" && g_sl41_oStamp == sl41_evalT && g_sl41_oPx > 0.0)
            { sl41_oPx = g_sl41_oPx; sl41_oBT = g_sl41_oBT; }
          else sl41_halt = "NO_ORIGIN_S5";
         }
       else if(site == "S2POLL" || site == "S3ARM")
         {
          double sl41_close = iClose(_Symbol, PERIOD_CURRENT, barShift);
          if(sl41_close > 0.0) { sl41_oPx = sl41_close; sl41_oBT = sl41_evalT; }
          else sl41_halt = "NO_ORIGIN_CLOSE";
         }
       else sl41_halt = "UNKNOWN_SITE";
       int sl41_def = 0; double sl41_px = 0.0; int sl41_slot = -1;
       datetime sl41_bt = 0; int sl41_imb = -1; int sl41_deep = -1;
       if(sl41_halt == "-")
          SrjResolveExt1(barShift, dir, sl41_oPx, sl41_def, sl41_px, sl41_slot, sl41_bt, sl41_imb, sl41_deep);
       else
         {
          string sl41_haltLine = StringFormat("[SRJ-EA] SLEXT41HALT bar=%s site=%s dir=%s cause=%s",
                    sl41_barT, site, DirName(dir), sl41_halt);
          LwAudit("SLEXT41HALT", sl41_haltLine);
          Print(sl41_haltLine);
         }
       //--- [P-SLDEF-6 E44] the hardcoded Sep-8 filed pair labels the shadow
       //--- row when the shadow covers those bars (redundant-by-design: no
       //--- second emission). Uncovered bars surface off-log as NO_LADDER.
       double sl41_sep8Px = 0.0; string sl41_sep8Filed = "-"; int sl41_sep8Resid = -999;
       int sl41_sep8Diff = -999; string sl41_sep8Prov = "-"; int sl41_sep8Cov = 0;
       if(SrjSep8Filed(sl41_barT, sl41_sep8Px))
         {
          sl41_sep8Filed = DoubleToString(sl41_sep8Px, _Digits); sl41_sep8Prov = "HAND"; sl41_sep8Cov = 1;
          if(sl41_def == 1)
            {
             sl41_sep8Resid = (int)MathRound((sl41_px - sl41_sep8Px) / _Point);
             sl41_sep8Diff = (int)((sl41_bt - StringToTime(sl41_barT)) / 300);
            }
         }
       string sl41_line = StringFormat("[SRJ-EA] SLEXT481 fields=17 bar=%s site=%s dir=%s ladOriginPx=%s ladOriginBarTime=%s ladOriginSite=%s ext1Defined=%d slExt1=%s ext1Slot=%d ext1BarTime=%s ext1Imb=%d deepestExt=%d sep8FiledPx=%s sep8ResidPts=%d sep8BarDiffBars=%d sep8Prov=%s sep8Covered=%d",
                 sl41_barT, site, DirName(dir),
                 (sl41_halt == "-") ? DoubleToString(sl41_oPx, _Digits) : "-",
                 (sl41_halt == "-") ? TimeToString(sl41_oBT, TIME_DATE|TIME_MINUTES) : "-",
                 site,
                 sl41_def, (sl41_def == 1) ? DoubleToString(sl41_px, _Digits) : "-",
                 sl41_slot, (sl41_def == 1) ? TimeToString(sl41_bt, TIME_DATE|TIME_MINUTES) : "-",
                 sl41_imb, sl41_deep,
                 sl41_sep8Filed, sl41_sep8Resid, sl41_sep8Diff, sl41_sep8Prov, sl41_sep8Cov);
       LwAudit("SLEXT481", sl41_line);
       Print(sl41_line);
       g_sl41_def = sl41_def; g_sl41_px = sl41_px; g_sl41_slot = sl41_slot;
       g_sl41_bt = sl41_bt; g_sl41_imb = sl41_imb; g_sl41_deep = sl41_deep;
      }
    //--- [P-SWINGIMB] shadow-census locals. Plain locals, no working-set
    //--- write, no selection branch. Supporting reads are debug-gated so
    //--- debug-off cost is untouched; the two shift trackers are bare int
    //--- assignments.
    int    slimb_imbBuf  = (dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB;
    double slimb_latVal   = 0.0;
    int    slimb_latShift= -1;
    bool   slimb_haveLat = false;
    int    slimb_latFlag = -1;
    int    slimb_latAvail= 0;
    int    slimb_apexMatch = 0;
    string slimb_cands    = "-";
    int    slimb_ncands  = 0;
    int    slimb_t75shift = -1;
    int    slimb_runExtShift = -1;
    int    slimb_chFlag   = -1;
    int    slimb_chShift  = -1;
    int    slimb_chAvail  = 0;
   if(InpDebugLog && (s_swingDumps < 20 || site == "S5"))
     {
      s_swingDumps++;
      string sh = "", sl = "";
      for(int d = barShift; d <= barShift + 9; d++)
        {
         double vh, vl;
         sh += (ReadBuf1(g_hFlow, FL_BUF_SWING_HIGH, vh, d) && vh != EMPTY_VALUE && vh > 0.0)
               ? DoubleToString(vh, _Digits) + " " : "- ";
         sl += (ReadBuf1(g_hFlow, FL_BUF_SWING_LOW,  vl, d) && vl != EMPTY_VALUE && vl > 0.0)
               ? DoubleToString(vl, _Digits) + " " : "- ";
        }
      PrintFormat("[SRJ-EA] SWINGDUMP #%d site=%s dir=%s barShift=%d bar=%s "
                  "close=%s high=%s low=%s SH[%d..%d]= %s| SL[%d..%d]= %s",
                  s_swingDumps, site, DirName(dir), barShift,
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                  DoubleToString(iClose(_Symbol, PERIOD_CURRENT, barShift), _Digits),
                  DoubleToString(iHigh (_Symbol, PERIOD_CURRENT, barShift), _Digits),
                  DoubleToString(iLow  (_Symbol, PERIOD_CURRENT, barShift), _Digits),
                  barShift, barShift + 9, sh,
                  barShift, barShift + 9, sl);
     }

    double obValid;
    if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift))
      {
       if(InpDebugLog && SHADOW_SLIMB)
          SlimbEmit(barShift, site, dir, "PRE", -1, "-", -1, -1, -1, 0, 0, -1, -1, 0, "-");
       if(InpDebugLog && SHADOW_SLIMBWALK)
          SlimbWalkEmit(barShift, site, dir, "PRE", false, 0.0, -1, 0.0);
       return false;
      }

   //--- [P-TRIM-S2POLL E2] The direct point reads are DEAD. Task 21's
   //--- FindNearestSwing pair below overwrites haveHigh, haveLow, swingHigh and
   //--- swingLow on EVERY path, including its false path, which writes 0.0 and
   //--- -1. Nothing reads any of the four between the two assignments. The
   //--- retention comment credits SWINGDUMP, but SWINGDUMP performs its own reads
   //--- and runs earlier in the function.
   //--- SUPERSEDED, retained per P4:
   //---   bool haveHigh = ReadFlow(FL_BUF_SWING_HIGH, swingHigh, barShift)
   //---                   && swingHigh != EMPTY_VALUE && swingHigh > 0.0;
   //---   bool haveLow  = ReadFlow(FL_BUF_SWING_LOW,  swingLow,  barShift)
   //---                   && swingLow  != EMPTY_VALUE && swingLow  > 0.0;
   double swingHigh = 0.0, swingLow = 0.0;
   bool   haveHigh  = false, haveLow = false;

   //--- TASK 21: the 1-swing branch previously required a confirmed fractal to
   //--- sit in the exact slot being read, which is true on roughly 18% of
   //--- bars. Admission therefore depended on slot occupancy rather than on
   //--- structure, and that is why the sole 2026.08.04 signal died as
   //--- S5_NO_SL_REF once Task 20 moved the read to the settled slot. The
   //--- point reads above are retained so the SWINGDUMP diagnostic and the
   //--- surrounding code are untouched; these two lines override their result
   //--- with the nearest confirmed swing at or before the evaluation bar.
   //--- This is a deliberate admission change. See Task 21's R8 exemption.
   int shHigh = -1, shLow = -1;
   haveHigh = FindNearestSwing(FL_BUF_SWING_HIGH, barShift, swingHigh, shHigh);
   haveLow  = FindNearestSwing(FL_BUF_SWING_LOW,  barShift, swingLow,  shLow);
   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SWINGPICK site=%s dir=%s barShift=%d close=%s "
                  "haveHigh=%d SH=%s atShift=%d haveLow=%d SL=%s atShift=%d",
                  site, DirName(dir), barShift,
                  DoubleToString(iClose(_Symbol, PERIOD_CURRENT, barShift), _Digits),
                   (int)haveHigh, DoubleToString(swingHigh, _Digits), shHigh,
                   (int)haveLow,  DoubleToString(swingLow,  _Digits), shLow);

    //--- [P-SWINGIMB] shadow latest-swing snapshot (print-only, debug-gated).
    if(InpDebugLog && SHADOW_SLIMB)
      {
       slimb_haveLat = (dir == DIR_LONG) ? haveLow : haveHigh;
       slimb_latVal   = (dir == DIR_LONG) ? swingLow : swingHigh;
       slimb_latShift = (dir == DIR_LONG) ? shLow : shHigh;
       if(slimb_haveLat && slimb_latShift >= 0)
         {
          double slimb_lf = 0.0;
          if(ReadFlow(slimb_imbBuf, slimb_lf, slimb_latShift) && slimb_lf != EMPTY_VALUE)
            {
             slimb_latAvail = 1;
             slimb_latFlag  = (int)slimb_lf;
            }
          //--- Slot-to-bar audit: the value was read at eval shift s, i.e.
          //--- CopyBuffer position s+FLOW_SHIFT_OFFSET (Task-20 settled slot),
          //--- so the apex bar is series bar ApexShift(s), not s. Comparing
          //--- against iHigh/iLow(s) fails on every line (measured 481/481
          //--- on RECON7); the ApexShift form is the frame-correct audit.
          int slimb_apexShift = ApexShift(slimb_latShift);
          double slimb_ref = (dir == DIR_LONG)
             ? iLow (_Symbol, PERIOD_CURRENT, slimb_apexShift)
             : iHigh(_Symbol, PERIOD_CURRENT, slimb_apexShift);
          slimb_apexMatch = (slimb_ref == slimb_latVal) ? 1 : 0;
         }
      }

   // [Task 26a] EA-8b. Part A Step 6: "one swing away from that order block's
   // swing high/low" Ã¢â‚¬â€ buffer 27 is that swing bar's protective extreme, so the
   // stop reference now derives from the structure that defines the entry zone
   // instead of the nearest swing anywhere. Buffer 26 is read for comparison only.
   //
   // The side check below is a sanity guard, not a Part A rule: FlowLogic selects
   // the order block from g_s.currentBias, and the RR poll spans S2 through S5, so
   // bias can move under the candidate and hand back a swing high while dir is
   // LONG. It compares against iClose(barShift), which is EA-23b's known-wrong
   // reference Ã¢â‚¬â€ the least-bad option available until Ruling 7a lands, and it will
   // be revisited there. Failing the check falls back, it does not abort.
   double slCurPx     = iClose(_Symbol, PERIOD_CURRENT, barShift);
   double obStructRef = 0.0;
   double obSwingRef  = 0.0;
   bool haveObStruct = ReadFlow(FL_BUF_OB_STRUCT_EXTREME, obStructRef, barShift)
                       && obStructRef != EMPTY_VALUE && obStructRef > 0.0;
   bool haveObSwing  = ReadFlow(FL_BUF_OB_SWING_EXTREME, obSwingRef, barShift)
                       && obSwingRef != EMPTY_VALUE && obSwingRef > 0.0;
   bool obSwingSideOk = haveObSwing &&
                        ((dir == DIR_LONG) ? (obSwingRef < slCurPx)
                                           : (obSwingRef > slCurPx));
   if((int)MathRound(obValid) == 1)
     {
       if(dir == DIR_LONG)
         {
          if(obSwingSideOk) slRefOut = obSwingRef;
          else
            {
             if(!haveLow)
               {
                if(InpDebugLog && SHADOW_SLIMB)
                   SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
                if(InpDebugLog && SHADOW_SLIMBWALK)
                   SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
                return false;
               }
             slRefOut = swingLow;
            }
         }
       else
         {
          if(obSwingSideOk) slRefOut = obSwingRef;
          else
            {
             if(!haveHigh)
               {
                if(InpDebugLog && SHADOW_SLIMB)
                   SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
                if(InpDebugLog && SHADOW_SLIMBWALK)
                   SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
                return false;
               }
             slRefOut = swingHigh;
            }
         }
      slModeOut = SL_MODE_1SWING;
   // [Task 75 / EA-79 / Ruling 1 Option C] A fallback swing on the WRONG SIDE
   // of the entry reference is not a stop reference. Measured: 2026.08.13 16:40
   // emitted SIGNAL dir=LONG with slRef=1.15378 against close=1.15339 - the stop
   // sat 39 points ABOVE entry and the target 80 points above, both on the profit
   // side, and the RR gate passed at R=2.05 because slDist is a MathAbs. One of
   // six signals was not a tradeable setup.
   //
   // Mechanism: obSwingSideOk is the side test for buffer 27, and when it fails
   // the fallback takes the nearest confirmed swing with NO side test at all.
   // Price had closed below the last confirmed swing low without a new one
   // forming, so FindNearestSwing returned a low above the close. One instance
   // in 20 S5 evaluations; the other five fallbacks were side-correct.
   //
   // Threshold-free: the test is WHICH SIDE of slCurPx the reference lies on,
   // never how far. Part A section 7 is not engaged. The reference is slCurPx,
   // the same iClose(barShift) that obSwingSideOk already compares against - one
   // reference for both branches - and at S5 that close IS the entry (Ruling 7a).
   //
   // The walk requires BOTH the protective side AND, once a zone is adopted,
   // exclusion from it. Requiring both is what prevents interaction with the
   // Task 67 guard below: after this block slRefOut is outside the zone, so Task
   // 67's condition is false and it is inert. When this guard does not fire,
   // Task 67 behaves exactly as it does today.
   //
   // Scoped to the fallback path only (!obSwingSideOk), as Task 67 is. Aborts
   // only on exhaustion, per Ruling 1 Option C - a valid swing further back is
   // always preferred to abandoning the setup. The 500-slot bound and the
   // g_zoneHi/g_zoneLo inertness before arming both match Task 67 exactly.
   bool t75_sideOk = SlimbProtectiveSideOk(dir, slRefOut, slCurPx);
   if(!obSwingSideOk && !t75_sideOk)
     {
      int    t75_buf  = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
      int    t75_from = (dir == DIR_LONG) ? shLow : shHigh;
      double t75_was  = slRefOut;
      bool   t75_ok   = false;
       for(int t75_s = t75_from + 1; t75_s <= t75_from + 500; t75_s++)
         {
          double t75_v;
          if(!ReadFlow(t75_buf, t75_v, t75_s))     break;
          if(t75_v == EMPTY_VALUE || t75_v <= 0.0) continue;
          //--- [P-SWINGIMB] record examined swing (print-only; walk unchanged).
          if(InpDebugLog && SHADOW_SLIMB && slimb_ncands < 6)
            {
             double slimb_tvf = 0.0;
             string slimb_tvs = "x";
             if(ReadFlow(slimb_imbBuf, slimb_tvf, t75_s) && slimb_tvf != EMPTY_VALUE)
                slimb_tvs = IntegerToString((int)slimb_tvf);
             slimb_cands = ((slimb_ncands == 0) ? "" : slimb_cands + " ")
                           + SlimbTuple(t75_s, t75_v, slimb_tvs, dir, slCurPx);
             slimb_ncands++;
            }
          if((dir == DIR_LONG) ? (t75_v >= slCurPx) : (t75_v <= slCurPx)) continue;
          slRefOut = t75_v;
          slimb_t75shift = t75_s;
          t75_ok   = true;
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
                        "chosen=%s atShift=%d fromShift=%d close=%s "
                        "zoneLo=%s zoneHi=%s",
                        site, DirName(dir),
                        DoubleToString(t75_was, _Digits),
                        DoubleToString(slRefOut, _Digits),
                        t75_s, t75_from,
                        DoubleToString(slCurPx, _Digits),
                        DoubleToString(g_zoneLo, _Digits),
                        DoubleToString(g_zoneHi, _Digits));
         break;
        }
       if(!t75_ok)
         {
          if(InpDebugLog)
             PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
                         "chosen=NONE fromShift=%d close=%s zoneLo=%s zoneHi=%s "
                         "result=noProtectiveSideSwing",
                         site, DirName(dir),
                         DoubleToString(t75_was, _Digits),
                         t75_from,
                         DoubleToString(slCurPx, _Digits),
                         DoubleToString(g_zoneLo, _Digits),
                         DoubleToString(g_zoneHi, _Digits));
          if(InpDebugLog && SHADOW_SLIMB)
             SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
          if(InpDebugLog && SHADOW_SLIMBWALK)
             SlimbWalkEmit(barShift, site, dir, "1SWING", false, 0.0, -1, 0.0);
          return false;
         }
     }

   // [STEP 1 RETIRED] The Task 67 in-zone stop exclusion is removed per operator
   // ruling and spec 3.7: the stop may sit inside the entry zone (measured 1.15835
   // inside 1.15805-1.15843), and the correct test is the side relative to the
   // entry, never containment. Retired in the same edit as the Task 75 walk
   // zone-continue above, per council Part 2.1: the two guards were coupled -
   // retiring one alone changed nothing on bars where the other fired.
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] SLSRC site=%s dir=%s src=%s obStruct=%s obSwing=%s "
                     "nearest=%s chosen=%s deltaPts=%s",
                     site, DirName(dir),
                     obSwingSideOk ? "OB_SWING"
                                   : (haveObSwing ? "FALLBACK_SIDE" : "FALLBACK_EMPTY"),
                     haveObStruct ? DoubleToString(obStructRef, _Digits) : "-",
                     haveObSwing  ? DoubleToString(obSwingRef,  _Digits) : "-",
                     (dir == DIR_LONG)
                        ? (haveLow  ? DoubleToString(swingLow,  _Digits) : "-")
                        : (haveHigh ? DoubleToString(swingHigh, _Digits) : "-"),
                     DoubleToString(slRefOut, _Digits),
                     (haveObSwing && haveObStruct)
                        ? DoubleToString(MathAbs(obSwingRef - obStructRef) / _Point, 0)
                        : "-");
       if(InpDebugLog)
          PrintFormat("[SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=%s distPts=%.0f site=%s "
                      "zoneLo=%s zoneHi=%s",
                      DoubleToString(slRefOut, _Digits),
                      MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
                      site,
                      DoubleToString(g_zoneLo, _Digits),
                      DoubleToString(g_zoneHi, _Digits));
       //--- [P-SWINGIMB-2 E6] chosen = the traced swing slot. The OB-source
       //--- path resolves via buffer 39 (bar time -> eval shift); any residual
       //--- keeps -1 with its cause in cands, never absorbed.
       if(InpDebugLog && SHADOW_SLIMB)
         {
          if(obSwingSideOk)
            {
             double slimb_obt = 0.0;
             if(ReadFlow(FL_BUF_OB_SWING_TIME, slimb_obt, barShift) && slimb_obt > 0.0)
               {
                int slimb_ser = iBarShift(_Symbol, PERIOD_CURRENT, (datetime)slimb_obt, false);
                int slimb_ev = slimb_ser - FLOW_SHIFT_OFFSET;
                int slimb_swingBuf = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
                double slimb_sv = 0.0;
                if(slimb_ev >= 0 && ReadFlow(slimb_swingBuf, slimb_sv, slimb_ev) && slimb_sv == slRefOut)
                  {
                   double slimb_cfv = 0.0;
                   if(ReadFlow(slimb_imbBuf, slimb_cfv, slimb_ev) && slimb_cfv != EMPTY_VALUE)
                     { slimb_chAvail = 1; slimb_chFlag = (int)slimb_cfv; }
                   slimb_chShift = slimb_ev;
                  }
                else
                   slimb_cands = "NOOBSLOT:" + IntegerToString(slimb_ev);
               }
             else
                slimb_cands = "NOOBTIME";
            }
          else
            {
             int slimb_cs = (slimb_t75shift >= 0) ? slimb_t75shift : slimb_latShift;
             if(slimb_cs >= 0)
               {
                double slimb_cf = 0.0;
                if(ReadFlow(slimb_imbBuf, slimb_cf, slimb_cs) && slimb_cf != EMPTY_VALUE)
                  { slimb_chAvail = 1; slimb_chFlag = (int)slimb_cf; }
                slimb_chShift = slimb_cs;
               }
            }
           SlimbEmit(barShift, site, dir, "1SWING", (int)MathRound(obValid), DoubleToString(slRefOut, _Digits), slimb_chShift, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, slimb_chFlag, slimb_chShift, slimb_chAvail, slimb_cands);
           if(InpDebugLog && SHADOW_SLIMBWALK)
              SlimbWalkEmit(barShift, site, dir, "1SWING", true, slRefOut, slimb_chShift, slRefOut, slimb_latShift);
         }
       return true;
     }
   else
     {
      //--- [P-SLREFSIDE / operator ruling 2026-09-11] The 2-swing stop is the
      //--- PREVIOUS STRUCTURE TOP on the protective side, never a shift-recency
      //--- pick: "the stop swing is higher or lower from the entry price, not
      //--- the most recent swing high or low. it might be from an older
      //--- structure" (BUILDER_FINDING_0828-SLREF.md section 1) and "one swing
      //--- = one turn of the bigger move" (the operator's Option-A ruling,
      //--- BUILDER_FINDING_SLREF-1.md section 9). Walk the swing buffer from
      //--- the evaluation bar. ITERATION 2 (measured correction, same run
      //--- window): the CURRENT TURN anchors the walk - the first swing
      //--- initializes the running structure extreme REGARDLESS of side,
      //--- because the close can sit inside the current turn (measured
      //--- 2026.08.28 10:00: close 1.16482 sat on the 09:25-09:45 cluster;
      //--- side-skipping the cluster mis-anchored the walk at 06:30 and
      //--- overshot to the 06:00 top 1.16513, deepening the SL leg, arming
      //--- the candidate and killing the trade at the pre-confirmation
      //--- freshness poll). Same-turn swings are absorbed; a swing EXCEEDING
      //--- the extreme by more than the codebase's 1-point separation idiom
      //--- (a safety limit, not a tunable threshold - Part A section 7) is
      //--- the previous turn's top = THE STOP CANDIDATE, and the SIDE TEST
      //--- (spec 3.7: "the reference must lie on the protective side", the
      //--- entry-price reference per the operator's side ruling) applies to
      //--- the CANDIDATE, never to the anchor; a wrong-side candidate is
      //--- absorbed and the walk continues - never abort where a valid
      //--- swing exists. On exhaustion the running extreme itself is the
      //--- stop ("one swing") if it lies on the protective side; if it does
      //--- not, no valid stop swing exists in the window and the spec's
      //--- abort case applies. Measured reproduction: the 2026.08.28 10:00
      //--- entry bar's newest-first swing highs 1.16491/1.16481/1.16482/
      //--- 1.16479 form ONE structure top; the first older swing exceeding
      //--- it is 06:30 = 1.16508 - the operator's journaled stop exactly
      //--- (BUILDER_FINDING_SLREF-1 section 5).
      int bufIdx = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
      double firstVal = 0.0;
      double runExt   = 0.0;
      int    firstShift = -1;
      bool   haveFirst  = false;
      for(int s = barShift; s <= barShift + 500; s++)
        {
         double v;
         if(!ReadFlow(bufIdx, v, s)) break;
         if(v == EMPTY_VALUE || v <= 0.0) continue;
          if(!haveFirst)
            {
             firstVal = v; runExt = v; haveFirst = true; firstShift = s;
             slimb_runExtShift = s;
             continue;
            }
          //--- [P-SWINGIMB] record examined swing (print-only; walk unchanged).
          if(InpDebugLog && SHADOW_SLIMB && slimb_ncands < 6)
            {
             double slimb_svf = 0.0;
             string slimb_svs = "x";
             if(ReadFlow(slimb_imbBuf, slimb_svf, s) && slimb_svf != EMPTY_VALUE)
                slimb_svs = IntegerToString((int)slimb_svf);
             slimb_cands = ((slimb_ncands == 0) ? "" : slimb_cands + " ")
                           + SlimbTuple(s, v, slimb_svs, dir, runExt);
             slimb_ncands++;
            }
         //--- One swing = one turn of the bigger move: same-turn swings are
         //--- absorbed into the running extreme; an EXCEEDING swing is the
         //--- previous turn's top = the stop CANDIDATE. The side test (the
         //--- operator's entry-price rule + spec 3.7) applies to the
         //--- CANDIDATE, not to the turn anchor.
         bool exceeds = (dir == DIR_LONG) ? (v < runExt - _Point)
                                          : (v > runExt + _Point);
          if(exceeds)
            {
             runExt = v;
             slimb_runExtShift = s;
            bool stopSideOk = (dir == DIR_LONG) ? (v < slCurPx) : (v > slCurPx);
            if(!stopSideOk) continue;
            slRefOut = v; slModeOut = SL_MODE_2SWING;
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] SL_STRUCT site=%s dir=%s entryRef=%s runExt=%s "
                           "prevTop=%s atShift=%d distPts=%.0f exhausted=%d",
                           site, DirName(dir),
                           DoubleToString(slCurPx, _Digits),
                           DoubleToString(runExt, _Digits),
                           DoubleToString(v, _Digits),
                           s,
                           MathAbs(slCurPx - slRefOut) / _Point,
                           0);
             if(InpDebugLog)
                PrintFormat("[SRJ-EA] SL_REF branch=2-swing obValid=0 slRef=%s distPts=%.0f "
                            "firstSwing=%s foundAtShift=%d site=%s "
                            "zoneLo=%s zoneHi=%s",
                            DoubleToString(slRefOut, _Digits),
                            MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
                            DoubleToString(firstVal, _Digits), s, site,
                            DoubleToString(g_zoneLo, _Digits),
                            DoubleToString(g_zoneHi, _Digits));
             //--- [P-SWINGIMB] chosen = the adopted candidate slot s.
             if(InpDebugLog && SHADOW_SLIMB)
               {
                double slimb_cf9 = 0.0;
                int slimb_cfv9 = -1, slimb_cav9 = 0;
                if(ReadFlow(slimb_imbBuf, slimb_cf9, s) && slimb_cf9 != EMPTY_VALUE)
                  { slimb_cfv9 = (int)slimb_cf9; slimb_cav9 = 1; }
                 SlimbEmit(barShift, site, dir, "2SWING", (int)MathRound(obValid), DoubleToString(slRefOut, _Digits), s, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, slimb_cfv9, s, slimb_cav9, slimb_cands);
                 if(InpDebugLog && SHADOW_SLIMBWALK)
                    SlimbWalkEmit(barShift, site, dir, "2SWING", true, slRefOut, s, slRefOut, slimb_latShift);
               }
             return true;
           }
        }
       if(!haveFirst)
         {
          if(InpDebugLog && SHADOW_SLIMB)
             SlimbEmit(barShift, site, dir, "2SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
          if(InpDebugLog && SHADOW_SLIMBWALK)
             SlimbWalkEmit(barShift, site, dir, "2SWING", false, 0.0, -1, 0.0);
          return false;
         }
      //--- Exhaustion fallback: the running structure extreme IS the stop
      //--- ("one swing" of the bigger move) - never abort while a valid swing
      //--- exists (spec 3.7). The side test applies here too: the extreme is
      //--- the HIGHEST (SHORT) / LOWEST (LONG) swing in the window, so if it
      //--- is not on the protective side of slCurPx, no swing in the window
      //--- is, and the spec's abort-where-no-valid-swing-exists case applies.
       if((dir == DIR_LONG) ? (runExt >= slCurPx) : (runExt <= slCurPx))
         {
          if(InpDebugLog && SHADOW_SLIMB)
             SlimbEmit(barShift, site, dir, "2SWING", (int)MathRound(obValid), "-", -1, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, -1, -1, 0, slimb_cands);
          if(InpDebugLog && SHADOW_SLIMBWALK)
             SlimbWalkEmit(barShift, site, dir, "2SWING", false, 0.0, -1, 0.0);
          return false;
         }
      slRefOut  = runExt;
      slModeOut = SL_MODE_2SWING;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] SL_STRUCT site=%s dir=%s entryRef=%s runExt=%s "
                     "prevTop=%s atShift=%d distPts=%.0f exhausted=%d",
                     site, DirName(dir),
                     DoubleToString(slCurPx, _Digits),
                     DoubleToString(runExt, _Digits),
                     "-", firstShift,
                     MathAbs(slCurPx - slRefOut) / _Point,
                     1);
       if(InpDebugLog)
          PrintFormat("[SRJ-EA] SL_REF branch=2-swing obValid=0 slRef=%s distPts=%.0f "
                      "firstSwing=%s foundAtShift=%d site=%s "
                      "zoneLo=%s zoneHi=%s",
                      DoubleToString(slRefOut, _Digits),
                      MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
                      DoubleToString(firstVal, _Digits), firstShift, site,
                      DoubleToString(g_zoneLo, _Digits),
                      DoubleToString(g_zoneHi, _Digits));
       //--- [P-SWINGIMB] chosen = the running-extreme slot (tracked, print-only).
       if(InpDebugLog && SHADOW_SLIMB)
         {
          double slimb_cfx = 0.0;
          int slimb_cfvx = -1, slimb_cavx = 0;
          if(slimb_runExtShift >= 0 && ReadFlow(slimb_imbBuf, slimb_cfx, slimb_runExtShift) && slimb_cfx != EMPTY_VALUE)
            { slimb_cfvx = (int)slimb_cfx; slimb_cavx = 1; }
           SlimbEmit(barShift, site, dir, "2SWING", (int)MathRound(obValid), DoubleToString(slRefOut, _Digits), slimb_runExtShift, slimb_latFlag, slimb_latShift, slimb_latAvail, slimb_apexMatch, slimb_cfvx, slimb_runExtShift, slimb_cavx, slimb_cands);
           if(InpDebugLog && SHADOW_SLIMBWALK)
              SlimbWalkEmit(barShift, site, dir, "2SWING", true, slRefOut, slimb_runExtShift, slRefOut, slimb_latShift);
         }
       return true;
     }
   }

//====================== [P-TRIM-S2POLL E1] the per-bar stop memo =================
//--- ComputeSlReference is called twice on most S3 bars with identical inputs -
//--- once at site=S2POLL, again at site=S3ARM inside the Task 133 committed walk.
//--- Between them nothing moves: barShift is always 1 from OnTick, g_dir is
//--- assigned once per pass at the IDLE seed and never reassigned (the B3
//--- supersession re-binds the anchor line, not the direction), and every other
//--- input is a FlowLogic buffer or a price at barShift.
//---
//--- MEMOISATION, NOT SUBSTITUTION. A naive reuse of s1_stopRef/s1_haveStop would
//--- change behaviour on a SAME-BAR SEED CASCADE: on a bar entering at ST_IDLE or
//--- ST_S1_REGIME the S2POLL block is skipped (state below ST_S2_LTF_ALIGN), so
//--- the pair is absent when the cascade reaches S3 in the same pass. Under
//--- P-FIX-S2POLL E3 an absent stop now REFUSES TO ARM, so substitution would
//--- silently lose those armings. Computing on FIRST DEMAND cannot: S3ARM is the
//--- first demand on a cascade bar and gets exactly today's value.
//---
//--- SCOPE: site=S2POLL and site=S3ARM ONLY. site=S5 is DELIBERATELY EXCLUDED and
//--- keeps computing fresh - it is the firing path, its SL_REF / SWINGDUMP /
//--- SL_STRUCT lines are the four-signal set's evidence, and the S5 population is
//--- small enough that the saving is nil. The S5 call does not consult the memo
//--- and therefore cannot pollute it.
//---
//--- Failure is normalised to (0.0, SL_MODE_NONE), matching P-FIX-S2POLL E1's
//--- atomic-pair discipline. Nothing reads a caller local after a false return.
struct SSlMemo
  {
   datetime        barTime;
   ENUM_SRJ_DIR    dir;
   bool            valid;
   bool            ok;
   double          slRef;
   ENUM_SRJ_SLMODE slMode;
   //--- [P-SLDEF-6 E41/E43] memoised ext-1 shadow, stamped on COMPUTE from
   //--- the in-function stash. The HIT path is untouched.
   int             ex1def;
   double          ex1px;
   int             ex1slot;
   datetime        ex1bt;
   int             ex1imb;
   int             ex1deep;
   string          ex1site;
  };
//--- File-scope, so zero-initialised: barTime 0, dir DIR_NONE(0), valid false,
//--- ok false, slRef 0.0, slMode SL_MODE_NONE(0). No explicit initialiser and no
//--- OnInit reset, so the edit surface stays inside this block and OnInit is
//--- byte-untouched. A stale barTime cannot produce a false hit: server time is
//--- monotonic within a run.
SSlMemo g_slMemo;

int g_slMemo_computes = 0;
int g_slMemo_hits     = 0;

bool SlRefMemo(const int barShift, const datetime barTime, const ENUM_SRJ_DIR dir,
               double &slRefOut, ENUM_SRJ_SLMODE &slModeOut, const string site)
  {
   if(g_slMemo.valid && g_slMemo.barTime == barTime && g_slMemo.dir == dir)
     {
      g_slMemo_hits++;
      slRefOut  = g_slMemo.slRef;
      slModeOut = g_slMemo.slMode;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] SLMEMO bar=%s site=%s result=HIT ok=%d slRef=%s "
                     "mode=%d computes=%d hits=%d",
                     TimeToString(barTime, TIME_DATE|TIME_MINUTES), site,
                     (int)g_slMemo.ok,
                     DoubleToString(g_slMemo.slRef, _Digits),
                     (int)g_slMemo.slMode, g_slMemo_computes, g_slMemo_hits);
      return g_slMemo.ok;
     }

   double          memoV  = 0.0;
   ENUM_SRJ_SLMODE memoM  = SL_MODE_NONE;
   bool            memoOk = ComputeSlReference(barShift, dir, memoV, memoM, site);
   g_slMemo_computes++;

   g_slMemo.barTime = barTime;
   g_slMemo.dir     = dir;
   g_slMemo.valid   = true;
   g_slMemo.ok      = memoOk;
   g_slMemo.slRef   = memoOk ? memoV : 0.0;
   g_slMemo.slMode  = memoOk ? memoM : SL_MODE_NONE;
   //--- [P-SLDEF-6 E41] stamp the memoised shadow (synchronous: the stash
   //--- holds this COMPUTE's invocation; the HIT path is untouched).
   g_slMemo.ex1def = g_sl41_def; g_slMemo.ex1px = g_sl41_px;
   g_slMemo.ex1slot = g_sl41_slot; g_slMemo.ex1bt = g_sl41_bt;
   g_slMemo.ex1imb = g_sl41_imb; g_slMemo.ex1deep = g_sl41_deep;
   g_slMemo.ex1site = site;

   slRefOut  = g_slMemo.slRef;
   slModeOut = g_slMemo.slMode;

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SLMEMO bar=%s site=%s result=COMPUTE ok=%d slRef=%s "
                  "mode=%d computes=%d hits=%d",
                  TimeToString(barTime, TIME_DATE|TIME_MINUTES), site,
                  (int)memoOk, DoubleToString(g_slMemo.slRef, _Digits),
                  (int)g_slMemo.slMode, g_slMemo_computes, g_slMemo_hits);
   return memoOk;
  }

//--- [P-SLDEF-6 E43] read-only memo probe for the S5 comparison: HIT iff a
//--- memoised COMPUTE covers this barTime+dir. Touches no memo state and no
//--- memo counter; the S5 firing path keeps computing fresh.
bool SrjMemoProbe(const datetime barT, const ENUM_SRJ_DIR dir,
                  int &mDef, double &mPx, int &mSlot, datetime &mBt, int &mImb, int &mDeep, string &mSite)
   {
    mDef = 0; mPx = 0.0; mSlot = -1; mBt = 0; mImb = -1; mDeep = -1; mSite = "-";
    if(g_slMemo.valid && g_slMemo.barTime == barT && g_slMemo.dir == dir)
      {
       mDef = g_slMemo.ex1def; mPx = g_slMemo.ex1px; mSlot = g_slMemo.ex1slot;
       mBt = g_slMemo.ex1bt; mImb = g_slMemo.ex1imb; mDeep = g_slMemo.ex1deep;
       mSite = g_slMemo.ex1site;
       return true;
      }
    return false;
   }

//====================== Step 7: Divergence latch =====================
bool UpdateDivergenceLatch(int barShift, ENUM_SRJ_DIR dir, string &kindOut)
  {
   //--- [STEP 2 / operator ruling 2026-09-09] The divergence that governs is the
   //--- LATEST one present during the confirmation entry candle - an opposing
   //--- divergence after a matched one invalidates the requirement (this refines
   //--- spec 3.8's "counts permanently"). Walk from the evaluation bar back to
   //--- the candidate's anchor; the FIRST nonzero verdict encountered is the
   //--- latest; its direction-match decides the latch THIS BAR. The latch now
    //--- reflects the latest verdict per bar - it clears when the latest is
    //--- opposing, and re-arms when a matched one appears.
    //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
    //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
    const int udl_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);
    for(int s = barShift; s <= udl_limit; s++)
     {
      if(iTime(_Symbol, PERIOD_CURRENT, s) < g_anchorBarTime) break;
      double verdict;
      if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) continue;
      if(verdict == EMPTY_VALUE) continue;
      int v = (int)MathRound(verdict);
      if(v == 0) continue;
      bool matches = (dir == DIR_LONG  && (v ==  1 || v ==  2)) ||
                     (dir == DIR_SHORT && (v == -1 || v == -2));
      kindOut = (MathAbs(v) == 1) ? "regular" : "hidden";
      return matches;
     }
   return false;
  }

//====================== Sequence reset / abort ========================
void ResetSequence()
  {
   g_state          = ST_IDLE;
   g_dir            = DIR_NONE;
   g_regime         = REGIME_NONE;
   g_sessionAtEntry = SESSION_NONE;
   g_anchorLine     = -1;
   g_anchorPrice    = 0.0;
   g_anchorBarTime  = 0;
   g_divLatch       = false;
   g_touchSeen      = false;
   g_touchBarHi     = 0.0;
   g_touchBarLo     = 0.0;
   g_zoneHi         = 0.0;
   g_zoneLo         = 0.0;
   g_alertedArmed   = false;
   g_alertedSignal  = false;
   g_latchedEntry   = 0.0;
   g_latchedSl      = 0.0;
   g_latchedTp      = 0.0;
   g_latchedR       = 0.0;
   g_latchBarTime   = 0;
   g_confirmFromState = ST_IDLE;
   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
   //--- price, time, zone, touch, state, latch + confirmFrom only — all are
   //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
  }

void GoAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   LogAbort(reason, atState);
   //--- TASK 19c: count NO_REGIME aborts so the census can be read against
   //--- them directly. Measurement only.
   if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
   if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
      EmitAlert("STAND-DOWN", "reason=" + reason, false);

   //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
   //--- clears g_dir and g_anchorLine. Read-only measurement.
   if(InpDebugLog &&
      (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
     {
      g_shadowActive = true;
      g_shadowDir    = g_dir;
      g_shadowLine   = g_anchorLine;
      g_shadowOpened = g_anchorBarTime;
      g_shadowSess   = g_sessionAtEntry;
      g_shadowFail   = reason;
      g_shadowBars   = 0;
     }

   ENUM_SRJ_STATE prev = g_state;
   g_state = ST_ABORT;
   LogState(prev, g_state);
   ResetSequence();
  }

//====================== Main per-bar evaluation ======================

//====================== [Task 35 / EA-36] Live zone read ==============
//--- Operator ruling: the entry zone is re-read every bar while the candidate
//--- is alive, because a frozen zone is blind to the current state of structure.
//--- Measured cause: on 2026.08.20 the 09:15 LONDON candidate froze
//--- 1.16712-1.16745, while FlowLogic went on to export 1.16737-1.16778 at the
//--- 09:30 bar - the operator's own XOB. Closes at 1.16768 and 1.16770 sat
//--- above the frozen zone and inside the live one, so g_touchSeen never set
//--- and the setup could not reach S5.
//---
//--- FVG-over-XOB precedence and the EMPTY_VALUE handling are identical to the
//--- S3 block's existing read (EA-1, zero live instances across three ranges).
//--- The S3 block keeps its own copy of this read for now; consolidating the
//--- two is logged as EA-49 and belongs to the state-machine rewrite, not here.
//--- Returns false when no zone is exported on this bar. That is NOT an
//--- invalidation - FRESH_OB_DEAD is the mechanism that kills a dead order
//--- block - so the caller retains the last known zone.
bool ReadQualifyingZone(int barShift, double &zHiOut, double &zLoOut, bool &fromFvgOut,
                        double stopRef, bool haveStop)
  {
   double xobHi = 0.0, xobLo = 0.0, fvgHi = 0.0, fvgLo = 0.0;

   // [Task 105] Identity census at the S4 re-read site. Placed immediately
   // after the zone locals are declared and before any read or return, so it
   // cannot alter the function's result on any path. Prints ids only; the
   // bounds for this bar are already printed by ZONEMOVE and ZONEADOPT, so
   // cross-referencing by bar= is sufficient and no duplicated read is needed.
   // -1 means the buffer read failed. 0 means FlowLogic selected no object.
   double t105a_xobId = -1.0, t105a_fvgId = -1.0;
   if(!ReadFlow(FL_BUF_XOB_OBJ_ID, t105a_xobId, barShift)) t105a_xobId = -1.0;
   if(!ReadFlow(FL_BUF_FVG_OBJ_ID, t105a_fvgId, barShift)) t105a_fvgId = -1.0;
   if(InpDebugLog)
      PrintFormat("[SRJ-EA] ZONEID bar=%s site=S4RQZ xobId=%d fvgId=%d",
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                  (int)t105a_xobId, (int)t105a_fvgId);
                  
   bool haveXob = ReadFlow(FL_BUF_XOB_ZONE_HIGH, xobHi, barShift) && xobHi != EMPTY_VALUE &&
                  ReadFlow(FL_BUF_XOB_ZONE_LOW,  xobLo, barShift) && xobLo != EMPTY_VALUE;
   bool haveFvg = ReadFlow(FL_BUF_FVG_LEG_ZONE_HIGH, fvgHi, barShift) && fvgHi != EMPTY_VALUE &&
                  ReadFlow(FL_BUF_FVG_LEG_ZONE_LOW,  fvgLo, barShift) && fvgLo != EMPTY_VALUE;

   //--- [STEP 1 / council Part 2.2] This site previously returned the FVG
   //--- unconditionally, with no in-play test applied here. With the widened walk
   //--- live at S3, a not-in-play FVG could displace an in-play XOB on this
   //--- re-read, making the widened admission reversible one bar later. Fix:
   //--- when BOTH zones are exported, the FVG yields to an in-play XOB exactly
   //--- when the FVG itself is not in play. Strictly monotone: every bar that
   //--- returned the XOB before still does; a lone FVG still returns as before.
   if(haveFvg && haveXob)
     {
      bool fvgInPlay = ZoneInPlay(barShift, MathMax(fvgHi, fvgLo), MathMin(fvgHi, fvgLo), stopRef, haveStop);
      bool xobInPlay = ZoneInPlay(barShift, MathMax(xobHi, xobLo), MathMin(xobHi, xobLo), stopRef, haveStop);
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] RQZPICK bar=%s site=S4RQZ fvgInPlay=%d xobInPlay=%d downgraded=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     (int)fvgInPlay, (int)xobInPlay,
                     (int)((!fvgInPlay && xobInPlay) ? 1 : 0));
      if(!fvgInPlay && xobInPlay)
        { zHiOut = MathMax(xobHi, xobLo); zLoOut = MathMin(xobHi, xobLo); fromFvgOut = false; return true; }
     }
   if(haveFvg)
     { zHiOut = MathMax(fvgHi, fvgLo); zLoOut = MathMin(fvgHi, fvgLo); fromFvgOut = true;  return true; }
   if(haveXob)
     { zHiOut = MathMax(xobHi, xobLo); zLoOut = MathMin(xobHi, xobLo); fromFvgOut = false; return true; }
   return false;
  }

//====================== [Task 36 / EA-47] Zone adoption guard =========
//--- Measured cause: on 2026.08.20 three of six ZONEMOVEs adopted
//--- 1.16547-1.16595 with obSwing=1.16536 - byte-identical to 08.19's values.
//--- SRJ_NearestPromotedOBIndex selects the largest startBar among promoted,
//--- valid, activated in-bias order blocks; when nothing from the current day
//--- qualifies it returns the previous day's. One of those adoptions cleared a
//--- legitimate touch (TOUCHCLEAR 18:55). Part A Step 4 requires "the current,
//--- freshest structure", so a zone ~200 points from price with no structure
//--- touching it is not adoptable mid-sequence.
//---
//--- The test is Ruling 8's in-play test, unchanged and threshold-free: BAR,
//--- SWING1, or SWING2 penetration of the candidate zone. Verified against the
//--- Task 35 journal - the 09:20 adoption of the operator's own XOB passes on
//--- BAR (close 1.16775 inside 1.16737-1.16778) and all three stale adoptions
//--- fail on all three conditions.
//---
//--- This does NOT re-adjudicate the existing zone. The `same` short-circuit
//--- returns true when the zone has not moved, so Task 35's boundary - in-play
//--- gates arming and is not re-checked afterwards - is preserved. What is
//--- gated here is a REPLACEMENT, which would otherwise bypass Ruling 7b's
//--- arming gate entirely.
//---
//--- The logic duplicates the S3 block's inline in-play test rather than
//--- sharing it, because extracting that block is a restructure and belongs to
//--- the state-machine rewrite. Logged as EA-49.
bool ZoneAdoptable(int barShift, double zHi, double zLo,
                   double stopRef, bool haveStop)
  {
   if(!(zHi > 0.0 && zLo > 0.0)) return false;

   if(MathAbs(zHi - g_zoneHi) <= _Point * 0.5 &&
      MathAbs(zLo - g_zoneLo) <= _Point * 0.5)
      return true;

   bool   ok  = false;
   string via = "none";
   double bHi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
   double bLo = iLow (_Symbol, PERIOD_CURRENT, barShift);

   if(bHi >= zLo && bLo <= zHi) { ok = true; via = "BAR"; }

   int    buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
   double sw1 = 0.0, sw2 = 0.0;
   int    sh1 = -1,  sh2 = -1;

   if(FindNearestSwing(buf, barShift, sw1, sh1))
     {
       if(sw1 >= zLo && sw1 <= zHi)
         { ok = true; if(via == "none") via = "SWING1"; }

       //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
       //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
       const int za_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);
       if(!haveStop)
        {
         for(int s = sh1 + 1; s <= sh1 + 500; s++)
           {
            double v2;
            if(!ReadFlow(buf, v2, s))          break;
            if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
            if(MathAbs(v2 - sw1) <= _Point)    continue;
            sw2 = v2; sh2 = s;
            break;
           }

         if(sw2 > 0.0 && sw2 >= zLo && sw2 <= zHi)
           { ok = true; if(via == "none") via = "SWING2"; }
        }
      else
        {
         //--- [STEP 1] same SL-leg depth as ZoneInPlay: every confirmed
         //--- protective-side swing back to the stop reference, which ends the leg.
          double prev = sw1;
          for(int s = sh1 + 1; s <= za_limit; s++)
           {
            double v2;
            if(!ReadFlow(buf, v2, s))          break;
            if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
            if(MathAbs(v2 - prev) <= _Point)   continue;
            prev = v2;
            if(v2 >= zLo && v2 <= zHi)
              { ok = true; if(via == "none") via = "SWINGLEG"; }
            if((g_dir == DIR_LONG) ? (v2 <= stopRef) : (v2 >= stopRef)) break;
           }
        }
     }

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] ZONEADOPT bar=%s dir=%s adopt=%d via=%s newLo=%s newHi=%s "
                  "barLo=%s barHi=%s sw1=%s@%d sw2=%s@%d",
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                  DirName(g_dir), (int)ok, via,
                  DoubleToString(zLo, _Digits),
                  DoubleToString(zHi, _Digits),
                  DoubleToString(bLo, _Digits),
                  DoubleToString(bHi, _Digits),
                  (sw1 > 0.0 ? DoubleToString(sw1, _Digits) : "-"), sh1,
                  (sw2 > 0.0 ? DoubleToString(sw2, _Digits) : "-"), sh2);
   return ok;
  }

//====================== [Task 52 / EA-59b] Leg-scoped touch scan ======
//--- Operator ruling EA-59b (Option B, wide): the opposite-direction touch may be
//--- ANY older bar within the current structural leg, not only a bar evaluated
//--- after the candidate armed. Admission is judged on the confirming bar with
//--- every condition simultaneously true; the touch is a leg-scoped fact, not a
//--- recency test, and retracement depth is not an admission criterion.
//---
//--- Measured cause: on 2026.08.20 the 09:35 candidate armed while evaluating the
//--- operator's own 09:30 entry bar - arming timing was correct - but the
//--- retracement into the zone had already completed before arming. The old S4
//--- test only ever examined the single bar it was evaluating, so no touch was
//--- ever seen and the sequence died at state=S4_ARMED. The EA was structurally
//--- one full touch-and-confirm cycle behind the operator, every time.
//---
//--- Bound is the STRUCTURAL leg boundary (buffer 30), read through ReadFlow so it
//--- lands in the settled slot. When the export reads 0.0 - unset, which is
//--- warmup only since UpstreamReady gates evaluation - the 500-slot cap is the
//--- sole bound. That cap matches FindNearestSwing and the 2-swing stop branch
//--- exactly; it is a safety limit, not a tunable threshold, so Part A section 7
//--- is not engaged.
//---
//--- The opposite-direction and zone-penetration tests below are
//--- character-for-character the tests the existing single-bar S4 block already
//--- applies. Nothing new is admitted per bar. The only change is how many bars
//--- are examined.
bool FindLegTouch(int barShift, double zHi, double zLo,
                  int &foundShiftOut, double &legTimeOut, bool fromFvg)
  {
   foundShiftOut = -1;
   legTimeOut    = 0.0;
   if(!(zHi > 0.0 && zLo > 0.0)) return false;

   double legT;
   if(ReadFlow(FL_BUF_STRUCT_LEG_TIME, legT, barShift) &&
      legT > 0.0 && legT != EMPTY_VALUE)
      legTimeOut = legT;
   datetime legBoundary = (legTimeOut > 0.0) ? (datetime)legTimeOut : 0;

   for(int s = barShift; s <= barShift + 500; s++)
     {
      datetime bt = iTime(_Symbol, PERIOD_CURRENT, s);
      if(bt <= 0)                              break;
      if(legBoundary > 0 && bt < legBoundary)   break;

      double so = iOpen (_Symbol, PERIOD_CURRENT, s);
      double sh = iHigh (_Symbol, PERIOD_CURRENT, s);
      double sl = iLow  (_Symbol, PERIOD_CURRENT, s);
      double sc = iClose(_Symbol, PERIOD_CURRENT, s);

      bool oppositeDir = (g_dir == DIR_LONG) ? (sc < so) : (sc > so);
      bool touchesZone = (sh >= zLo && sl <= zHi);
      if(oppositeDir && (!fromFvg || touchesZone))
        { foundShiftOut = s; return true; }
     }
   return false;
  }

//====================== [Task 55 / EA-56 + EA-58] Zone in-play test ===
//--- Ruling 8's in-play test, extracted so it can be applied to MORE THAN ONE
//--- candidate zone on the same bar. Logic is character-equivalent to the test
//--- the S3 block already runs inline: BAR penetration of the zone by the
//--- evaluation bar's own range, else SWING1 containment (freshest confirmed
//--- swing on the protective side), else SWING2 containment (next DISTINCT
//--- confirmed swing on that same side).
//---
//--- No distance parameter, no bar-count parameter, no tolerance. The _Point
//--- separation test and the 500-slot bound match FindNearestSwing, the 2-swing
//--- stop branch and the S3 inline test exactly; they are safety limits, not
//--- tunable thresholds, so Part A section 7 is not engaged.
//---
//--- Silent by design. The caller reports the verdicts (see ZONEPICK), so this
//--- adds no per-bar journal output of its own.
//---
//--- The S3 block's inline copy and ZoneAdoptable's copy are NOT removed. That
//--- consolidation is EA-49 and belongs to the state-machine rewrite.
bool ZoneInPlay(int barShift, double zHi, double zLo,
                double stopRef, bool haveStop)
  {
   if(!(zHi > 0.0 && zLo > 0.0)) return false;

   double bHi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
   double bLo = iLow (_Symbol, PERIOD_CURRENT, barShift);
   if(bHi >= zLo && bLo <= zHi) return true;

   int    buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
   double sw1 = 0.0;
   int    sh1 = -1;
   if(!FindNearestSwing(buf, barShift, sw1, sh1)) return false;
   if(sw1 >= zLo && sw1 <= zHi) return true;

   //--- [STEP 1 / charter ruling 3] In-play depth is the SL LEG: every confirmed
   //--- protective-side swing from the evaluation bar back to the stop reference
   //--- chosen by ComputeSlReference. The stop swing itself is tested and then
   //--- terminates the walk - the one verified operator zone was put in play by
   //--- the second swing, the one the stop was placed at. Without a stop
   //--- reference this bar, the measured two-swing depth (SWING2) remains the
   //--- bound, per council Part 1.1. No distance parameter; the bounds are the
   //--- stop reference (structural), history exhaustion (bt<=0), and the _Point
    //--- distinctness test - safety limits and structure, never thresholds.
    //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
    //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
    const int zip_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);
    if(!haveStop)
     {
      for(int s = sh1 + 1; s <= sh1 + 500; s++)
        {
         double v2;
         if(!ReadFlow(buf, v2, s))          break;
         if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
         if(MathAbs(v2 - sw1) <= _Point)    continue;
         return (v2 >= zLo && v2 <= zHi);
        }
      return false;
     }
    double prev = sw1;
    for(int s = sh1 + 1; s <= zip_limit; s++)
     {
      double v2;
      if(!ReadFlow(buf, v2, s))          break;
      if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
      if(MathAbs(v2 - prev) <= _Point)   continue;
      prev = v2;
      if(v2 >= zLo && v2 <= zHi)         return true;
      if((g_dir == DIR_LONG) ? (v2 <= stopRef) : (v2 >= stopRef)) break;
     }
   return false;
  }

void EvaluateClosedBar(int barShift, datetime barTime)
  {
   ENUM_SRJ_SESSION sess = CurrentTradingWindow(barTime);
   bool inWindow = (sess != SESSION_NONE);

   if(InpDebugLog)
     {
      for(int ds = barShift; ds <= barShift + 1; ds++)
        {
         double censusVerdict;
         if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, censusVerdict, ds) &&
            censusVerdict != EMPTY_VALUE &&
            (int)MathRound(censusVerdict) != 0)
           {
            PrintFormat("[SRJ-EA] %s CQD DIV verdict=%+d shift=%d bar=%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        (int)MathRound(censusVerdict), ds,
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, ds), TIME_DATE|TIME_MINUTES));
           }
        }
     }

   static bool s_rawDumped = false;
   if(InpDebugLog && !s_rawDumped && HandleReady(g_hCqd))
     {
      s_rawDumped = true;
      double rawBuf[];
      ArraySetAsSeries(rawBuf, true);
      ResetLastError();
      int copied = CopyBuffer(g_hCqd, CQD_BUF_DIVVERDICT, 1, 50, rawBuf);
      int cbErr  = GetLastError();
      PrintFormat("[SRJ-EA] === BLOCKER-1 SECONDARY: CQD buf6 raw dump ===");
      PrintFormat("[SRJ-EA] CopyBuffer(hCqd=%d, buf=6, shift=1, count=50) -> copied=%d err=%d",
                  g_hCqd, copied, cbErr);
      int nEmpty = 0, nZero = 0, nNonZero = 0;
      for(int i = 0; i < MathMin(copied, 50); i++)
        {
         if(rawBuf[i] == EMPTY_VALUE)       nEmpty++;
         else if(MathAbs(rawBuf[i]) < 0.5)  nZero++;
         else                               nNonZero++;
        }
      PrintFormat("[SRJ-EA] Summary: EMPTY_VALUE=%d  ZERO=%d  NONZERO=%d  (of %d copied)",
                  nEmpty, nZero, nNonZero, copied);
      for(int i = 0; i < MathMin(copied, 10); i++)
        {
         string vs = (rawBuf[i] == EMPTY_VALUE) ? "EMPTY_VALUE" : DoubleToString(rawBuf[i], 1);
         PrintFormat("[SRJ-EA]   shift=%d  val=%s", i + 1, vs);
        }
      if(copied <= 0)
         PrintFormat("[SRJ-EA] BLOCKER-1 DIAGNOSIS: CopyBuffer returned %d -> handle may be invalid or buffer index wrong.", copied);
      else if(nEmpty == copied)
         PrintFormat("[SRJ-EA] BLOCKER-1 DIAGNOSIS: ALL %d values are EMPTY_VALUE -> buffer 6 is NOT being written.", copied);
      else if(nZero == copied && nNonZero == 0)
         PrintFormat("[SRJ-EA] BLOCKER-1 DIAGNOSIS: ALL %d values are 0 -> divergence scan IS running but finding nothing.", copied);
      else if(nNonZero > 0)
         PrintFormat("[SRJ-EA] BLOCKER-1 DIAGNOSIS: %d non-zero values found -> buffer 6 IS being written. "
                     "EMPTY_VALUE means 'no divergence found', not 'unscanned' (ZERO=%d).",
                     nNonZero, nZero);
      PrintFormat("[SRJ-EA] === END BLOCKER-1 SECONDARY ===");
     }

   if(!UpstreamReady())
     {
      if(g_state != ST_IDLE) GoAbort(ABORT_UPSTREAM_UNREADY, g_state);
      return;
     }

   //--- EA-16: FL_BUF_LTF_BIAS encoding census. Ruling 2 asserts the 5-minute
   //--- bias is never neutral; the buffer contract says 0 = NA is legal. This
   //--- counts which is true. Shift 1 and shift 2 are tallied separately
   //--- because EA-13 is still open and shift 1 is 52% provisional - a zero
   //--- that only exists at shift 1 is a formation artifact, not a legal value.
   if(InpDebugLog)
     {
      g_ea16_bars++;

      for(int sh = 1; sh <= 2; sh++)
        {
         double bv  = 0.0;
         bool   ok  = ReadBuf1(g_hFlow, FL_BUF_LTF_BIAS, bv, sh);
         int    cat;

         if(!ok)                          cat = 0;
         else if(bv == EMPTY_VALUE)        cat = 1;
         else if(MathAbs(bv + 1.0) < 0.5)  cat = 2;
         else if(MathAbs(bv)       < 0.5)  cat = 3;
         else if(MathAbs(bv - 1.0) < 0.5)  cat = 4;
         else                              cat = 5;

         if(sh == 1) g_ea16_s1[cat]++; else g_ea16_s2[cat]++;

         if((cat == 3 || cat == 5) && g_ea16_hits < 40)
           {
            g_ea16_hits++;
            PrintFormat("[SRJ-EA] BIASCENSUS_HIT #%d shift=%d bar=%s raw=%s cat=%s "
                        "state=%s inWindow=%d",
                        g_ea16_hits, sh,
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, sh), TIME_DATE|TIME_MINUTES),
                        DoubleToString(bv, 8),
                        (cat == 3 ? "ZERO" : "OTHER"),
                        StateName(g_state), (int)inWindow);
           }
        }

      if((g_ea16_bars % 250) == 0)
         PrintFormat("[SRJ-EA] BIASCENSUS_PROGRESS bars=%d sh1_zero=%d sh2_zero=%d",
                     g_ea16_bars, g_ea16_s1[3], g_ea16_s2[3]);
     }

   //--- TASK 19c: HTF buffer census. Measurement only. Placed after the
   //--- UpstreamReady gate so the handle is valid, and while inWindow is
   //--- still in scope.
   if(InpDebugLog)
     {
      g_ea19_bars++;

      double h1a, h2a, h3a, h1b, h2b, h3b;
      bool ok1a = ReadBuf1(g_hFlow, FL_BUF_HTF_HIGH, h1a, 1);
      bool ok2a = ReadBuf1(g_hFlow, FL_BUF_HTF_MID,  h2a, 1);
      bool ok3a = ReadBuf1(g_hFlow, FL_BUF_HTF_LOW,  h3a, 1);
      bool ok1b = ReadBuf1(g_hFlow, FL_BUF_HTF_HIGH, h1b, 2);
      bool ok2b = ReadBuf1(g_hFlow, FL_BUF_HTF_MID,  h2b, 2);
      bool ok3b = ReadBuf1(g_hFlow, FL_BUF_HTF_LOW,  h3b, 2);

      int c1a = Ea19Cat(h1a, ok1a);
      int c2a = Ea19Cat(h2a, ok2a);
      int c3a = Ea19Cat(h3a, ok3a);
      int c1b = Ea19Cat(h1b, ok1b);
      int c2b = Ea19Cat(h2b, ok2b);
      int c3b = Ea19Cat(h3b, ok3b);

      g_ea19_h1s1[c1a]++;
      g_ea19_h2s1[c2a]++;
      g_ea19_h3s1[c3a]++;
      g_ea19_h1s2[c1b]++;
      g_ea19_h2s2[c2b]++;
      g_ea19_h3s2[c3b]++;

      if(inWindow)
        {
         g_ea19_inWindow++;
         if(c1a == 3 && c2a == 3 && c3a == 3) g_ea19_allZeroS1++;
         if(c1b == 3 && c2b == 3 && c3b == 3) g_ea19_allZeroS2++;
        }
     }

   //--- TASK 15: shadow re-evaluation. Read-only.
   if(InpDebugLog && g_shadowActive)
     {
      if(sess != g_shadowSess)
        {
         PrintFormat("[SRJ-EA] SHADOW_EXPIRE fail=%s dir=%s poi=%s opened=%s "
                     "barsAlive=%d - session window closed without conversion",
                     g_shadowFail, DirName(g_shadowDir),
                     (g_shadowLine >= 0) ? g_lineCode[g_shadowLine] : "-",
                     TimeToString(g_shadowOpened, TIME_DATE|TIME_MINUTES),
                     g_shadowBars);
         g_shadowActive = false;
        }
      else
        {
         g_shadowBars++;
         bool converted = false;
         if(g_shadowFail == ABORT_NO_REGIME)
           {
            ENUM_SRJ_REGIME rg;
            if(ClassifyRegime(barShift, g_shadowDir, rg) && rg != REGIME_NONE)
               converted = true;
           }
         else
           {
            bool al;
            if(CheckLtfAlign(barShift, g_shadowDir, al) && al)
               converted = true;
           }
         if(converted)
           {
            PrintFormat("[SRJ-EA] SHADOW_CONVERT fail=%s dir=%s poi=%s opened=%s "
                        "barsToConvert=%d - would have been admitted under an "
                        "order-independent model",
                        g_shadowFail, DirName(g_shadowDir),
                        (g_shadowLine >= 0) ? g_lineCode[g_shadowLine] : "-",
                        TimeToString(g_shadowOpened, TIME_DATE|TIME_MINUTES),
                        g_shadowBars);
            g_shadowActive = false;
           }
        }
     }

   //--- TASK 9 (EA-5/EA-13 evidence): swing-buffer repaint detector.
   if(InpDebugLog && inWindow)
     {
      static double   s_prevSH    = 0.0;
      static double   s_prevSL    = 0.0;
      static datetime s_prevBar   = 0;
      static int      s_retractSH = 0;
      static int      s_retractSL = 0;
      static int      s_oppSH     = 0;
      static int      s_oppSL     = 0;
      static int      s_checks    = 0;

      double nowSH, nowSL;
      bool haveSH = ReadBuf1(g_hFlow, FL_BUF_SWING_HIGH, nowSH, barShift + 1)
                    && nowSH != EMPTY_VALUE && nowSH > 0.0;
      bool haveSL = ReadBuf1(g_hFlow, FL_BUF_SWING_LOW,  nowSL, barShift + 1)
                    && nowSL != EMPTY_VALUE && nowSL > 0.0;

      if(s_prevBar > 0 && s_prevBar == iTime(_Symbol, PERIOD_CURRENT, barShift + 2))
        {
         double reSH, reSL;
         bool okSH = ReadBuf1(g_hFlow, FL_BUF_SWING_HIGH, reSH, barShift + 2)
                     && reSH != EMPTY_VALUE && reSH > 0.0;
         bool okSL = ReadBuf1(g_hFlow, FL_BUF_SWING_LOW,  reSL, barShift + 2)
                     && reSL != EMPTY_VALUE && reSL > 0.0;
         s_checks++;
         if(s_prevSH > 0.0) s_oppSH++;
         if(s_prevSL > 0.0) s_oppSL++;
         bool badSH = (s_prevSH > 0.0) && (!okSH || MathAbs(reSH - s_prevSH) > _Point * 0.5);
         bool badSL = (s_prevSL > 0.0) && (!okSL || MathAbs(reSL - s_prevSL) > _Point * 0.5);
         if(badSH) s_retractSH++;
         if(badSL) s_retractSL++;
         //--- TASK 20: mirror into file scope for the OnDeinit tally.
         g_swr_retractSH = s_retractSH;
         g_swr_retractSL = s_retractSL;
         g_swr_oppSH     = s_oppSH;
         g_swr_oppSL     = s_oppSL;
         g_swr_checks    = s_checks;
         if(badSH || badSL)
            PrintFormat("[SRJ-EA] SWINGREPAINT_2V3 bar=%s SH_was=%s SH_now=%s SL_was=%s SL_now=%s "
                        "retractedSH=%d/%d retractedSL=%d/%d checks=%d",
                        TimeToString(s_prevBar, TIME_DATE|TIME_MINUTES),
                        (s_prevSH > 0.0) ? DoubleToString(s_prevSH, _Digits) : "-",
                        okSH ? DoubleToString(reSH, _Digits) : "-",
                        (s_prevSL > 0.0) ? DoubleToString(s_prevSL, _Digits) : "-",
                        okSL ? DoubleToString(reSL, _Digits) : "-",
                        s_retractSH, s_oppSH, s_retractSL, s_oppSL, s_checks);
        }

      s_prevSH  = haveSH ? nowSH : 0.0;
      s_prevSL  = haveSL ? nowSL : 0.0;
      s_prevBar = iTime(_Symbol, PERIOD_CURRENT, barShift + 1);
     }

   //--- [Task 58 / EA-62] Per-bar census of the two zone exports. Placed here
   //--- because this is after the UpstreamReady gate (so the handle is valid)
   //--- and before the first early return that follows it, so it runs on EVERY
   //--- closed bar regardless of session window or sequence state. OnTick calls
   //--- EvaluateClosedBar exactly once per closed bar, so g_zc_bars is a true
   //--- per-bar denominator.
   //---
   //--- Reads through ReadFlow, never ReadBuf1, so it inherits the settled-slot
   //--- offset and sees the same values the S3 block sees.
   //---
   //--- ZoneInPlay is deliberately NOT called here. It selects its swing buffer
   //--- from g_dir, which is DIR_NONE outside a sequence, so an in-play verdict
   //--- would be meaningless on most bars. The sample lines print the geometry
   //--- instead.
   //---
   //--- Diagnostic only. No gate, no abort, no branch, no assignment to any
   //--- sequence variable.
   if(InpDebugLog)
     {
      double c58_xh = 0.0, c58_xl = 0.0, c58_fh = 0.0, c58_fl = 0.0;
      bool c58_haveX = ReadFlow(FL_BUF_XOB_ZONE_HIGH, c58_xh, barShift) && c58_xh != EMPTY_VALUE &&
                       ReadFlow(FL_BUF_XOB_ZONE_LOW,  c58_xl, barShift) && c58_xl != EMPTY_VALUE;
      bool c58_haveF = ReadFlow(FL_BUF_FVG_LEG_ZONE_HIGH, c58_fh, barShift) && c58_fh != EMPTY_VALUE &&
                       ReadFlow(FL_BUF_FVG_LEG_ZONE_LOW,  c58_fl, barShift) && c58_fl != EMPTY_VALUE;

      g_zc_bars++;

      // [Task 106] Unconditional per-bar identity census. The Task 105 sites at
      // S3PICK and S4RQZ only fire while a candidate is alive, so they supply no
      // denominator and cannot see an id change on a bar with no candidate. This
      // block sits inside the Task 58 census, which already runs on EVERY closed
      // bar after the UpstreamReady gate, so g_zc_bars is a true per-bar count.
      //
      // The bounds are printed WITH the id deliberately. An id change whose
      // bounds are unchanged is one object silently replaced by another at the
      // same price, and no existing guard can see it: ZoneAdoptable compares
      // prices, and ZONEMOVE only fires on a bound moving more than half a point.
      // Pairing the two is the only way that case becomes visible.
      //
      // Sentinels: -1 = buffer read failed, 0 = FlowLogic selected no object,
      // -2 = no previous bar recorded yet (first bar only). Real ids start at 1.
      //
      // Reads through ReadFlow, never ReadBuf1, so it lands in the settled slot
      // and sees the same values the S3 and S4 sites see.
      //
      // Diagnostic only. Assigns nothing outside its own locals and statics,
      // reads inWindow and g_state for labelling only, and cannot alter control
      // flow.
      double c106_xid = -1.0, c106_fid = -1.0;
      if(!ReadFlow(FL_BUF_XOB_OBJ_ID, c106_xid, barShift)) c106_xid = -1.0;
      if(!ReadFlow(FL_BUF_FVG_OBJ_ID, c106_fid, barShift)) c106_fid = -1.0;
      int c106_xi = (int)c106_xid;
      int c106_fi = (int)c106_fid;

      static int s_c106_prevX  = -2;
      static int s_c106_prevF  = -2;
      static int s_c106_bars   = 0;
      static int s_c106_xchg   = 0;
      static int s_c106_fchg   = 0;
      static int s_c106_quiet  = 0;

      s_c106_bars++;
      bool c106_xMoved = (s_c106_prevX != -2 && c106_xi != s_c106_prevX);
      bool c106_fMoved = (s_c106_prevF != -2 && c106_fi != s_c106_prevF);
      if(c106_xMoved) s_c106_xchg++;
      if(c106_fMoved) s_c106_fchg++;

      if(c106_xMoved || c106_fMoved)
        {
         PrintFormat("[SRJ-EA] IDCHANGE bar=%s inWin=%d state=%s dir=%s "
                     "xobId=%d->%d fvgId=%d->%d xobLo=%s xobHi=%s "
                     "cumX=%d cumF=%d bars=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     (int)inWindow, StateName(g_state), DirName(g_dir),
                     s_c106_prevX, c106_xi,
                     s_c106_prevF, c106_fi,
                     c58_haveX ? DoubleToString(MathMin(c58_xh, c58_xl), _Digits) : "-",
                     c58_haveX ? DoubleToString(MathMax(c58_xh, c58_xl), _Digits) : "-",
                     s_c106_xchg, s_c106_fchg, s_c106_bars);
        }
      else
        {
         s_c106_quiet++;
        }

      if((s_c106_bars % 500) == 0)
         PrintFormat("[SRJ-EA] IDCHANGE_PROGRESS bars=%d xchg=%d fchg=%d quiet=%d "
                     "curXobId=%d curFvgId=%d",
                     s_c106_bars, s_c106_xchg, s_c106_fchg, s_c106_quiet,
                     c106_xi, c106_fi);

      s_c106_prevX = c106_xi;
      s_c106_prevF = c106_fi;

      if(c58_haveX && c58_haveF)   g_zc_both++;
      else if(c58_haveX)           g_zc_xobOnly++;
      else if(c58_haveF)           g_zc_fvgOnly++;
      else                         g_zc_neither++;

      if(inWindow)
        {
         g_zc_inWin++;
         if(c58_haveX) g_zc_xobInWin++;
         if(c58_haveF) g_zc_fvgInWin++;
        }

      if(c58_haveF && inWindow && g_zc_samples < 130)
        {
         g_zc_samples++;
         PrintFormat("[SRJ-EA] ZONECENSUS_FVG #%d bar=%s inWin=%d state=%s haveXob=%d "
                     "fvg=%s-%s xob=%s-%s",
                     g_zc_samples,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     (int)inWindow, StateName(g_state), (int)c58_haveX,
                     DoubleToString(MathMin(c58_fh, c58_fl), _Digits),
                     DoubleToString(MathMax(c58_fh, c58_fl), _Digits),
                     c58_haveX ? DoubleToString(MathMin(c58_xh, c58_xl), _Digits) : "-",
                     c58_haveX ? DoubleToString(MathMax(c58_xh, c58_xl), _Digits) : "-");
        }
     }

   if(g_state > ST_IDLE && g_state != ST_ABORT && !inWindow)
      {
       //--- [Task 144 / EA-112] SESSIONHOLD shadow. Records whether this
       //--- candidate WOULD have survived the window close under the ruled
       //--- S5.10 carve-out. Print only. The GoAbort below is UNCHANGED.
       if(InpDebugLog)
          PrintFormat("[SRJ-EA] SESSIONHOLD bar=%s state=%s dir=%s "
                      "divLatch=%d wouldHold=%d",
                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                   TIME_DATE|TIME_MINUTES),
                      StateName(g_state),
                      (g_dir == DIR_LONG) ? "LONG" : "SHORT",
                      (int)g_divLatch,
                      (int)(g_state == ST_S5_GATE_CHECK && !g_divLatch));
       GoAbort(ABORT_SESSION_CLOSED, g_state); return;
      }

   //====================== [Task 79 / Stage 3b] Live LTF-align invariant =====
   //--- Carried operator ruling: there is no neutral 5-minute bias, so LTF
   //--- alignment is a LIVE condition and must never be latched. Part A Step 2
   //--- gates on it once; nothing re-checked it afterwards. Stage 3a made that
   //--- gap material - a candidate now sits in S2WAIT for many bars and later
   //--- advances, measured at thirteen consecutive S2WAIT bars on 2026.08.20
   //--- LONDON and fifteen S1WAIT bars on 2026.08.11 NYAM - and once past S2 the
   //--- locked direction was never revisited again.
   //---
   //--- STRICTLY REMOVAL. This block can only kill a candidate; it can never
   //--- admit one. That is deliberate: Stage 3a was strictly retention, so the
   //--- two journals read against each other without the opposite-signed
   //--- ambiguity EA-83 warns about.
   //---
   //--- Ã¢Ëœâ€¦ THE STATE RANGE IS LOAD-BEARING: S3 THROUGH S5, NOT S2. Ã¢Ëœâ€¦ A candidate
   //--- sitting at ST_S2_LTF_ALIGN is retained by the S2 block's own wait
   //--- (Task 76), and applying the invariant there would convert that wait
   //--- straight back into an abort and undo Stage 3a entirely. On the bar a
   //--- candidate advances S2->S3 this block has already run and skipped,
   //--- because the cascade reaches it while g_state is still
   //--- ST_S2_LTF_ALIGN - and the S2 block itself verified alignment on that
   //--- same bar. So the first bar this invariant can fire on is the first bar
   //--- AFTER alignment was confirmed.
   //---
   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed
   //--- the only other site that emitted it, so the string is now unambiguous:
   //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the
   //--- same population as the pre-Task-76 count and must not be compared to it.
   //---
   //--- Fail-closed on an unreadable upstream value, matching Part A section 4
   //--- and the S2 block's own handling: a candidate that survived unchecked is
   //--- not known to be aligned.
   //---
   //--- Threshold-free: the test is a DIRECTION comparison, the identical one
   //--- CheckLtfAlign already performs at S2. No distance, no size, no bar
   //--- count, no tolerance. Part A section 7 is not engaged.
   //---
   //--- Placed AFTER the SESSION_CLOSED invariant so a candidate outside its
   //--- window is still attributed SESSION_CLOSED, and BEFORE the freshness
   //--- poll because Part A orders Step 2 ahead of Step 3. ACCEPTED
   //--- CONSEQUENCE: a candidate failing both on one bar is now attributed
   //--- LTF_MISALIGN rather than FRESH_OB_DEAD or FRESH_OPP_FVG, so those two
   //--- counts may fall. That is re-attribution, not a new death, and every
   //--- instance is individually visible on the LTFFLIP line below.
   if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SLDEF-4 E33] bias-site stamp: the pipeline's per-bar bias read
      //--- runs in this block (live LTF-align invariant). Print-only; every
      //--- branch below is untouched.
      g_order_seq++;
      g_order_seqBias = g_order_seq;
      g_order_biasBarT = iTime(_Symbol, PERIOD_CURRENT, barShift);
      bool t79_aligned = false;
      if(!CheckLtfAlign(barShift, g_dir, t79_aligned))
        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
      if(!t79_aligned)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] LTFFLIP bar=%s dir=%s poi=%s state=%s - LTF bias "
                        "turned against the locked direction",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), AnchorStr(), StateName(g_state));
         //--- [Task 81 / EA-88 Option D] DIAGNOSTIC ONLY. Both flip branches in
         //--- SRJ_Bias_DecisionBlock reset tickOBIsValid, tickFVGIsValid and
         //--- hasPersistedOpposingFVG on the flip bar itself, so the flip bar's
         //--- exports read clean and cannot distinguish a strong flip from a weak
         //--- one. The bar BEFORE the flip still carries the preconditions.
         //--- doWeakSignalFlip requires ALL THREE of obValid=0, fvgValid=0,
         //--- oppFvg=1. All three adverse at barShift+1 => weak flip. Not all
         //--- three => strong flip (in-bias invalidation count reached 2).
         //--- Assigns nothing, branches nothing, cannot alter control flow.
         if(InpDebugLog)
           {
            double t81_ob0 = 0.0, t81_fv0 = 0.0, t81_op0 = 0.0, t81_bi0 = 0.0;
            double t81_ob1 = 0.0, t81_fv1 = 0.0, t81_op1 = 0.0, t81_bi1 = 0.0;
            bool t81_k0 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob0, barShift)
                       && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv0, barShift)
                       && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op0, barShift)
                       && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi0, barShift);
            bool t81_k1 = ReadFlow(FL_BUF_LTF_OB_VALID,  t81_ob1, barShift + 1)
                       && ReadFlow(FL_BUF_LTF_FVG_VALID, t81_fv1, barShift + 1)
                       && ReadFlow(FL_BUF_LTF_OPP_FVG,   t81_op1, barShift + 1)
                       && ReadFlow(FL_BUF_LTF_BIAS,      t81_bi1, barShift + 1);
            bool t81_weak = t81_k1
                            && (int)MathRound(t81_ob1) == 0
                            && (int)MathRound(t81_fv1) == 0
                            && (int)MathRound(t81_op1) == 1;
            PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
                        "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
                        "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), StateName(g_state),
                        (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
                        (int)t81_k0, (int)MathRound(t81_bi0),
                        (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
                        (int)MathRound(t81_op0),
                        (int)t81_k1, (int)MathRound(t81_bi1),
                        (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
                        (int)MathRound(t81_op1));
           }
         GoAbort(ABORT_LTF_MISALIGN, g_state);
         return;
        }
     }

   //--- [Task 135 / A-3 section 5.1 / v4.2 section 3.4 errata] The
   //--- candidate-specific structural invalidation window OPENS AT BUNDLE
   //--- BINDING, not at candidate creation. Under today's architecture the
   //--- S3->S4 arming transition IS the binding point: g_zoneHi and g_zoneLo are
   //--- assigned there and nothing before it identifies a structure at all. A
   //--- candidate that has not yet adopted a zone has no candidate-specific
   //--- structure for these three flags to describe, so a 2-of-3 verdict against
   //--- it is not attributable to anything the candidate is built on.
   //---
   //--- R-Q2 keeps the flags legitimately GLOBAL - they are the panel's
   //--- current-structure flags and no per-candidate copy is wanted. Section 5.1
   //--- fixes only WHEN they may kill a candidate.
   //---
   //--- Measured, Tier 1, Task 134: of 25 aborts, 11 are freshness deaths and
   //--- SIX fired before the candidate had armed - FRESH_OPP_FVG at
   //--- S2_LTF_ALIGN 08.14 11:35, FRESH_OPP_FVG at S3_ZONE_WAIT 08.18 10:20 and
   //--- 08.18 11:50, FRESH_OB_DEAD at S2_LTF_ALIGN 08.18 16:25 and 08.18 18:05,
   //--- FRESH_OB_DEAD at S3_ZONE_WAIT 08.21 09:35. Corroborated at Tier 3 scale
   //--- by FRESHCOUNT #1050, which fires 08.03 09:25 with state=S2_LTF_ALIGN
   //--- adverse=2 verdict=ABORT against a candidate that had bound nothing.
   //---
   //--- STRICTLY RETENTION. This edit can only let a candidate live longer. It
   //--- can never kill one, and it can never admit a signal the freshness rule
   //--- would have blocked at S4 or S5, because the poll still runs there
   //--- unchanged. Same character as Stage 3a's S1WAIT / S2WAIT retention, and
   //--- deliberately the opposite character to Task 79's strictly-removal LTF
   //--- invariant, so the two journals read against each other cleanly.
   //---
   //--- SCENARIO B IS PRESERVED. The operator's 08/03 setup-1 rejection fires at
   //--- state=S5_GATE_CHECK, inside the retained range, on the same fvgDead plus
   //--- oppFvg pair. This edit does not touch it.
   //---
   //--- ACCEPTED CONSEQUENCE 1, and the reason Task 134 ran first: a candidate
   //--- freed here does not necessarily survive. It carries whatever other
   //--- pending deaths it already had, and removing the one that fires first
   //--- reveals the next (section 16.3). Expect the abort MIX to shift toward
   //--- SESSION_CLOSED, NO_TP_TARGET and LTF_MISALIGN rather than the abort
   //--- COUNT to fall.
   //---
   //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
   //--- under a SINGLETON architecture. A candidate that lives longer holds the
   //--- singleton longer and can suppress POI retests that previously seeded
   //--- their own candidates. So the candidate COUNT may FALL and SUPPRESSED may
   //--- RISE even though this edit cannot kill anything directly. Both are
   //--- censused. A net loss by that route is an argument for section 5.6's
   //--- concurrency work, not against this ruling.
   //---
   //--- ACCEPTED CONSEQUENCE 3, diagnostic: CheckFreshness is NOT called in the
   //--- newly exempt range, because its side effects - the FRESHCOUNT print and
   //--- its cum1/cum2/cum3 counters - are not on record as harmless and this
   //--- task does not read its body. So FRESHCOUNT lines DISAPPEAR for pre-arm
   //--- bars and the cum counters RENUMBER. Task 133's FRESHCOUNT numbering is
   //--- therefore NOT comparable to this run's. The FRESHSKIP line below records
   //--- every skipped bar and its state so attribution survives the loss.
   //---
   //--- Threshold-free: the change is a STATE comparison, ST_S2_LTF_ALIGN to
   //--- ST_S4_ARMED. No distance, no size, no bar count, no tolerance. Part A
   //--- section 7 is not engaged.
   //---
   //--- The upper bound ST_S5_GATE_CHECK is DELIBERATELY UNCHANGED. EA-104 stays
   //--- withdrawn: setup completion, not the confirming close, ends the window,
   //--- and divergence may still be pending at S5.
   //---
   //--- â˜… The IDENTICAL condition guards the TP/RR poll immediately below this
   //--- block. That one is NOT changed - it is Task 31's advisory poll and its
   //--- state range is unrelated to this ruling. â˜…
   //---
   //--- The FRESHSKIP print reports the anchor through AnchorStr(), which is the
   //--- same accessor LogState and LogAbort already use for their poi= field.
   //--- Revision A of this task: the first issue named a nonexistent identifier
   //--- and the builder correctly halted on the Block C-bis census rather than
   //--- substituting one. Planner defect nineteen, section 16.8.
   //---
   //--- Nothing is deleted. The superseded condition is retained verbatim on the
   //--- annotated comment line directly beneath this one:
   //---
   //--- SUPERSEDED BY TASK 135, retained per P4:
   //---   if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
   //---
   if(InpDebugLog && g_state >= ST_S2_LTF_ALIGN && g_state < ST_S4_ARMED)
      PrintFormat("[SRJ-EA] FRESHSKIP bar=%s dir=%s state=%s poi=%s reason=PRE_BINDING",
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                  DirName(g_dir),
                  StateName(g_state),
                  AnchorStr());

   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "") { GoAbort(fail, g_state); return; }
     }

   double s1_stopRef = 0.0; bool s1_haveStop = false;
   if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
     {
      double currentPrice = iClose(_Symbol, PERIOD_CURRENT, barShift);
      double tpTarget;
      if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
         GoAbort(ABORT_NO_TP_TARGET, g_state); return;
        }
      double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
      //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
      //--- both set on success, both absent on failure. The superseded form had the
      //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
      //--- scope block below read slRef on the failure path. #property strict does
      //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
      //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
      //--- already kills across S2..S5 from here, and this is its stop-side twin.
      //--- SUPERSEDED, retained per P4:
      //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
      //---      s1_stopRef = slRef; s1_haveStop = true;
      if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        StateName(g_state), DirName(g_dir));
         GoAbort(ABORT_NO_SL_REF, g_state);
         return;
        }
      s1_stopRef  = slRef;
      s1_haveStop = true;
        {
         double slDist = MathAbs(currentPrice - slRef);
         double tpDist = MathAbs(tpTarget - currentPrice);
         //--- TASK 23 (EA-23b / EA-23c / EA-20): shadow reward/risk measured from
         //--- the entry zone rather than from the closing price, printed for all
         //--- three candidate entry references so Ruling 7 can be answered from
         //--- data instead of from judgement. Nothing reads these values. No gate,
         //--- no abort, no branch, no assignment to any sequence variable.
         //--- Skipped before S4 because g_zoneHi/g_zoneLo are still 0.0 until the
         //--- S3 block sets them; that is expected, not a failure.
         if(InpDebugLog && g_zoneHi > 0.0 && g_zoneLo > 0.0)
           {
            double zNear = (g_dir == DIR_LONG) ? g_zoneHi : g_zoneLo;
            double zFar  = (g_dir == DIR_LONG) ? g_zoneLo : g_zoneHi;
            double zMid  = (g_zoneHi + g_zoneLo) * 0.5;
            string rs = "";
            for(int e = 0; e < 3; e++)
              {
               double ent = (e == 0) ? zNear : ((e == 1) ? zMid : zFar);
               double sd  = MathAbs(ent - slRef);
               double td  = MathAbs(tpTarget - ent);
               bool slSideOk = (g_dir == DIR_LONG) ? (slRef < ent) : (slRef > ent);
               bool tpSideOk = (g_dir == DIR_LONG) ? (tpTarget > ent) : (tpTarget < ent);
               rs += ((e == 0) ? "near" : ((e == 1) ? "mid" : "far"));
               rs += "=" + ((sd > 0.0) ? DoubleToString(td / sd, 2) : "inf");
               rs += "/sl" + IntegerToString((int)slSideOk);
               rs += "/tp" + IntegerToString((int)tpSideOk) + " ";
              }
            bool tpInGap = (g_dir == DIR_LONG)
                           ? (tpTarget > zNear && tpTarget < currentPrice)
                           : (tpTarget < zNear && tpTarget > currentPrice);
            PrintFormat("[SRJ-EA] ZONESHADOW bar=%s dir=%s close=%s zoneLo=%s zoneHi=%s "
                        "gapPts=%s slRef=%s tp=%s R_close=%s tpInGap=%d shadow= %s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir),
                        DoubleToString(currentPrice, _Digits),
                        DoubleToString(g_zoneLo, _Digits),
                        DoubleToString(g_zoneHi, _Digits),
                        DoubleToString(MathAbs(currentPrice - zNear) / _Point, 0),
                        DoubleToString(slRef, _Digits),
                        DoubleToString(tpTarget, _Digits),
                        (slDist > 0.0) ? DoubleToString(tpDist / slDist, 2) : "inf",
                        (int)tpInGap, rs);
           }
         if(slDist > 0.0 && (tpDist / slDist) < InpMinRewardRisk)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] %s S2POLL_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
                           TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                           tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
            /* [Task 31 / Ruling 7a] ADVISORY. Was GoAbort(ABORT_TP_RR_FAIL). iClose is not an entry price before S5: measured 0.17 to 213.27 on one 7-bar sequence as slDist collapses, and every zone-derived alternative overstates by up to 20x. The hard 1R gate now lives only at S5, where the entry IS the next candle's open (P-NEXTOPEN 2026-09-09). S2POLL_RR_SHORTFALL above still logs every failure. */ ;
           }
        }
     }

   if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
     {
      string kind;
      g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
     }

   //--- [Task 72 / EA-74] Post-latch CQD re-read. DIAGNOSTIC ONLY.
   //--- The CQD census at the top of this function is the FIRST CQD read of
   //--- the call. Across 4032 bars it reported ZERO shift=1 verdicts, while
   //--- UpdateDivergenceLatch - reading the SAME buffer at the SAME two
   //--- shifts, later in the same call - matched and latched (measured:
   //--- 2026.08.11 18:35 SIGNAL div=hidden, census silent for the whole
   //--- sequence). This block repeats the census read AFTER the latch block,
   //--- so two reads of one buffer can be compared within a single call.
   //---
   //--- Each shift is read TWICE in immediate succession. If pass A and pass
   //--- B disagree, the buffer is changing under one call, which is value
   //--- instability rather than read-ordering lag - the two candidate
   //--- mechanisms behind EA-74 are distinguishable only this way.
   //---
   //--- The live-value filter is character-identical to the census: skip a
   //--- read failure, skip EMPTY_VALUE, skip zero. Gated on InpDebugLog.
   //--- Assigns nothing, reads g_state / g_dir / g_divLatch for labelling
   //--- only, and cannot alter control flow. R8 is NOT engaged.
   if(InpDebugLog)
     {
      static int s_t72_bars     = 0;
      static int s_t72_hit1     = 0;
      static int s_t72_hit2     = 0;
      static int s_t72_mismatch = 0;
      s_t72_bars++;
      for(int t72_s = 1; t72_s <= 2; t72_s++)
        {
         double t72_a = 0.0, t72_b = 0.0;
         bool t72_okA = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_a, t72_s);
         bool t72_okB = ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, t72_b, t72_s);
         bool t72_diff = (t72_okA != t72_okB) ||
                         (t72_okA && t72_okB && t72_a != t72_b);
         bool t72_live = (t72_okA && t72_a != EMPTY_VALUE &&
                          (int)MathRound(t72_a) != 0);
         if(t72_diff) s_t72_mismatch++;
         if(t72_live && t72_s == 1) s_t72_hit1++;
         if(t72_live && t72_s == 2) s_t72_hit2++;
         if(t72_live || t72_diff)
            PrintFormat("[SRJ-EA] CQDRECHECK shift=%d passA=%s passB=%s diff=%d "
                        "bar=%s state=%s dir=%s divLatch=%d hit1=%d hit2=%d mism=%d",
                        t72_s,
                        t72_okA ? ((t72_a == EMPTY_VALUE) ? "EMPTY"
                                                          : DoubleToString(t72_a, 1))
                                : "readfail",
                        t72_okB ? ((t72_b == EMPTY_VALUE) ? "EMPTY"
                                                          : DoubleToString(t72_b, 1))
                                : "readfail",
                        (int)t72_diff,
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, t72_s),
                                     TIME_DATE|TIME_MINUTES),
                        StateName(g_state), DirName(g_dir), (int)g_divLatch,
                        s_t72_hit1, s_t72_hit2, s_t72_mismatch);
        }
      if((s_t72_bars % 500) == 0)
         PrintFormat("[SRJ-EA] CQDRECHECK_PROGRESS bars=%d hit1=%d hit2=%d mismatch=%d",
                     s_t72_bars, s_t72_hit1, s_t72_hit2, s_t72_mismatch);
     }

   //====================== [Task 78 / EA-80 tier reading] POI replacement ====
   //--- Part A Step 8, D-3, G-2 and the carried ruling in section 6a: an
   //--- OPPOSITE-DIRECTION retest of a HIGHER-HIERARCHY POI replaces the held
   //--- candidate. The EA has never implemented it - arrival order won instead
   //--- of authority - and Task 77 measured the cost. On 2026.08.11 a Daily-VWAP
   //--- LONG candidate held the global singleton for 15 bars, never advanced
   //--- past S1, died SESSION_CLOSED at 19:05, and suppressed the three
   //--- Weekly-POC SHORT retests at bars 18:10 / 18:20 / 18:30 that produced the
   //--- Task 75 signal. Those three are the ONLY tier-crossing instances among
   //--- 23 higher=1 suppressions; the other 20 are POC-over-VWAP inside a single
   //--- anchor tier.
   //---
   //--- "Higher hierarchy" is read as the ANCHOR TIER, not the 12-line rank, via
   //--- g_authorityRank[]/2 - the identical tier collapse ComputeNearestTpTarget
   //--- already applies to its POI candidates. No new constant and no new
   //--- concept. Under the tier reading this fires on 3 of 23; under the rank
   //--- reading it would fire on all 23, and widening later is the removal of
   //--- two /2 operators. Implementing the narrower subset is correct under the
   //--- tier ruling and merely incomplete under the rank ruling. EA-80 is NOT
   //--- pre-empted by this edit.
   //---
   //--- G-5's same-direction higher-tier ANCHOR UPGRADE is deliberately NOT
   //--- implemented here: all nine measured opp=0 higher=1 instances are
   //--- intra-tier, so it has zero live instances under this reading.
   //---
   //--- Threshold-free: the tests are DIRECTION and TIER ORDER. No distance, no
   //--- size, no bar count, no tolerance. Part A section 7 is not engaged.
   //---
   //--- Monotone within a sequence: the test requires a STRICTLY higher tier
   //--- than the held anchor, so once anchored at the most authoritative tier
   //--- present nothing can displace it and no oscillation is possible.
   //---
   //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the
   //--- 12 POI buffers and mutates no sequence state - and it already returns
   //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
   //--- sequence, the IDLE block below re-detects that same line and seeds it.
   //--- No seeding code is duplicated here.
   //---
   //--- Ã¢Ëœâ€¦ THIS SITE DELIBERATELY DOES NOT RETURN AFTER GoAbort. Ã¢Ëœâ€¦ Every other
   //--- GoAbort call site returns; this one must fall through so the IDLE block
   //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
   //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
   //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
   //--- what makes same-bar promotion possible.
   //---
   //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
   //--- counted as suppressed - it was promoted, not discarded. That census is
   //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
   //---
   //--- One-bar divergence-latch consequence, accepted: the latch block sits
   //--- ABOVE this one, so the replacement candidate's latch is first evaluated
   //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
   //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
   //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
   if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
     {
      PoiRetestResult t78_pr;
      if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
        {
         ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
         bool t78_opp  = (t78_dir != g_dir);
         bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
                          (g_authorityRank[g_anchorLine]   / 2));
         if(t78_opp && t78_tier)
           {
            PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
                        "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        g_lineCode[t78_pr.topLine], DirName(t78_dir),
                        g_lineCode[g_anchorLine], DirName(g_dir),
                        StateName(g_state),
                        g_authorityRank[t78_pr.topLine] / 2,
                        g_authorityRank[g_anchorLine]   / 2);
            /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
           }
        }
     }

   //--- [P-BUILD3 E3 2026-09-11] the live supersession poll (spec 3.4 L120:
   //--- a same-direction higher-tier POI touch mid-sequence upgrades the anchor
   //--- tier silently; spec 6: arrival order still governs across time, so this
   //--- re-binds WITHIN the alive candidate only). Pre-fire states S1-S4;
   //--- IDLE (seed owns it), S5+ (guard 4) never reach here. Regime/LTF kept
   //--- (line-agnostic progress); the anchor-relative legs re-derive (zone and
   //--- touch unbind; S3/S4 fall back to S3_ZONE_WAIT so arming re-runs).
   //--- Runs BEFORE the t73 census so a promoted line is not ALSO counted as
   //--- suppressed (the Task-78 placement discipline). Sets b3_superseded for E4.
   bool b3_superseded = false;
   if(inWindow &&
      (g_state == ST_S1_REGIME || g_state == ST_S2_LTF_ALIGN ||
       g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) &&
      g_anchorLine >= 0 && g_dir != DIR_NONE)
     {
      int b3_cand = B3_ElectAnchor(barShift, g_dir);
      if(b3_cand >= 0 &&
         B3_AnchorTier(b3_cand) < B3_AnchorTier(g_anchorLine) &&
         sess == g_sessionAtEntry)
        {
         int b3_from      = g_anchorLine;
         int b3_fromRank  = g_authorityRank[b3_from];
         int b3_fromTier  = B3_AnchorTier(b3_from);
         int b3_toRank    = g_authorityRank[b3_cand];
         int b3_toTier    = B3_AnchorTier(b3_cand);
         ENUM_SRJ_STATE b3_prevState = g_state;
         g_anchorLine    = b3_cand;
         ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
         g_anchorBarTime = barTime;
         g_zoneHi        = 0.0;
         g_zoneLo        = 0.0;
         g_touchSeen     = false;
         g_touchBarHi    = 0.0;
         g_touchBarLo    = 0.0;
         g_latchedEntry  = 0.0;
         g_latchedSl     = 0.0;
         g_latchedTp     = 0.0;
         g_latchedR      = 0.0;
         g_latchBarTime  = 0;
         g_confirmFromState = ST_IDLE;
         if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)
           {
            ENUM_SRJ_STATE b3_prev = g_state;
            g_state = ST_S3_ZONE_WAIT;
            LogState(b3_prev, g_state);
           }
         b3_superseded = true;
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] ANCHOR_SUPERSEDE bar=%s from=%s rank=%d tier=%d to=%s rank=%d tier=%d dir=%s state=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        g_lineCode[b3_from], b3_fromRank, b3_fromTier,
                        g_lineCode[b3_cand], b3_toRank, b3_toTier,
                        DirName(g_dir), StateName(b3_prevState));
        }
     }

   //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
   //--- Two unmeasured quantities, both needed before Stage 3 is sized:
   //---   1. The singleton discards every POI retest that arrives while a
   //---      sequence is alive. 103 candidates were ADMITTED across this
   //---      window; how many were silently dropped is unknown, and Stage 3
   //---      lengthens candidate lifetime, so it raises that number.
   //---   2. Part A carries a rule the EA does not implement - an
   //---      opposite-direction HIGHER-TIER retest replaces the candidate.
   //---      Its frequency has never been counted.
   //---
   //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
   //--- 12 POI buffers and mutates no sequence state. It is called here on the
   //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
   //--- IDLE block would have consumed had the singleton been free.
   //---
   //--- Tier comparison uses g_authorityRank (lower is more authoritative),
   //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
   //--- count, no tolerance - Part A section 7 is not engaged.
   //---
   //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
   //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
   //--- control flow. R8 is NOT engaged.
   if(InpDebugLog && inWindow &&
      g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
     {
      static int s_t73_n      = 0;
      static int s_t73_higher = 0;
      static int s_t73_opp    = 0;
      static int s_t73_both   = 0;
      static int s_t73_bars   = 0;
      s_t73_bars++;
      PoiRetestResult t73_pr;
      if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
        {
         s_t73_n++;
         ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
         bool         t73_isOpp  = (t73_dir != g_dir);
         bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
                                    g_authorityRank[g_anchorLine]);
         if(t73_isHigh)               s_t73_higher++;
         if(t73_isOpp)                s_t73_opp++;
         if(t73_isOpp && t73_isHigh)  s_t73_both++;
         PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
                     "heldPoi=%s heldDir=%s heldState=%s "
                     "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     g_lineCode[t73_pr.topLine], DirName(t73_dir),
                     (int)t73_isOpp, (int)t73_isHigh,
                     g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
                     s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
                     b3_superseded ? "SUPERSEDED" : "HELD");
        }
      if((s_t73_bars % 500) == 0)
         PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
                     "higher=%d both=%d",
                     s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
     }

   //--- [P-CONFIRM-SHADOW] per-bar retest book + confirmation-candle terms. LOG ONLY -
   //--- reads buffers and prints; assigns no state. With a candidate held, CONFIRMPOLL
   //--- runs against the held anchor; in IDLE it polls the top-ranked same-direction
   //--- retest of the bar (the seed's own input) so the calibration covers the pre-seed
   //--- bars too.
   if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)
     {
      ShadowRetestBook(barShift);
      if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
         ShadowConfirmPoll(barShift, g_anchorLine, g_dir);
      else if(g_state == ST_IDLE)
        {
         PoiRetestResult sh_pr;
         if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)
            ShadowConfirmPoll(barShift, sh_pr.topLine,
                              sh_pr.isLong ? DIR_LONG : DIR_SHORT);
        }
     }

   if(g_state == ST_IDLE)
     {
      if(!inWindow) return;
      if(SessionAlreadyUsed(sess, barTime))
        {
         static datetime s_limitDay  = 0;
         static int      s_limitSess = -1;
         datetime dayKey = TC_DayStart(barTime);
         if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
           {
            s_limitDay  = dayKey;
            s_limitSess = (int)sess;
            PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
                        "all further candidates suppressed until the next window",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        SessionName(sess));
           }
         return;
        }
      PoiRetestResult pr;
      if(!DetectPoiRetest(barShift, pr) || !pr.found) return;
      g_anchorLine    = pr.topLine;
      g_dir           = pr.isLong ? DIR_LONG : DIR_SHORT;
      g_anchorBarTime = barTime;
      ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
      g_sessionAtEntry = sess;
      g_divLatch = false;
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S1_REGIME;
      LogState(prev, g_state);
      //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
      //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
      //--- holds by construction. Additive print only; assigns nothing.
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     AnchorStr(), g_authorityRank[g_anchorLine],
                     B3_AnchorTier(g_anchorLine), DirName(g_dir));
     }

   if(g_state == ST_S1_REGIME)
     {
      ENUM_SRJ_REGIME regime;
      if(!ClassifyRegime(barShift, g_dir, regime))
        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
      if(regime == REGIME_NONE)
        { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
      g_regime = regime;
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S2_LTF_ALIGN;
      LogState(prev, g_state);
     }

   if(g_state == ST_S2_LTF_ALIGN)
     {
      bool aligned;
      if(!CheckLtfAlign(barShift, g_dir, aligned))
        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
      if(!aligned)
        { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S3_ZONE_WAIT;
      LogState(prev, g_state);
     }

   if(g_state == ST_S3_ZONE_WAIT)
     {
      double xobHi, xobLo, fvgHi, fvgLo;

      // [Task 105] Identity census at the S3 arming site. Same rationale as the
      // S4RQZ block: ids only, placed before any read, branches on nothing.
      // A distinct variable prefix is used because this is a different scope.
      // -1 means the buffer read failed. 0 means FlowLogic selected no object.
      double t105b_xobId = -1.0, t105b_fvgId = -1.0;
      if(!ReadFlow(FL_BUF_XOB_OBJ_ID, t105b_xobId, barShift)) t105b_xobId = -1.0;
      if(!ReadFlow(FL_BUF_FVG_OBJ_ID, t105b_fvgId, barShift)) t105b_fvgId = -1.0;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] ZONEID bar=%s site=S3PICK xobId=%d fvgId=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     (int)t105b_xobId, (int)t105b_fvgId);

      //--- [Task 123] Buffer 33 census at the S3 arming site, printed beside the
      //--- objId above so the two pair by bar=. DIAGNOSTIC ONLY: t123_promoT is
      //--- read, printed, and never used again. No gate, no branch, no abort, no
      //--- assignment to any sequence variable. This edit cannot change any
      //--- signal, any abort, or any state transition.
      //--- raw= prints the unconverted double so an EMPTY_VALUE (2147483647) is
      //--- distinguishable from a real datetime. -1 means the buffer read failed.
      double t123_promoT = 0.0;
      if(!ReadFlow(FL_BUF_XOB_PROMO_TIME, t123_promoT, barShift)) t123_promoT = -1.0;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] XOBPROMO bar=%s site=S3PICK xobId=%d raw=%s promoT=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     (int)t105b_xobId,
                     DoubleToString(t123_promoT, 1),
                     (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE)
                       ? TimeToString((datetime)t123_promoT, TIME_DATE|TIME_MINUTES)
                       : "unset");

      bool haveXob = ReadFlow(FL_BUF_XOB_ZONE_HIGH, xobHi, barShift) && xobHi != EMPTY_VALUE &&
                     ReadFlow(FL_BUF_XOB_ZONE_LOW,  xobLo, barShift) && xobLo != EMPTY_VALUE;
      bool haveFvg = ReadFlow(FL_BUF_FVG_LEG_ZONE_HIGH, fvgHi, barShift) && fvgHi != EMPTY_VALUE &&
                     ReadFlow(FL_BUF_FVG_LEG_ZONE_LOW,  fvgLo, barShift) && fvgLo != EMPTY_VALUE;

      //--- [Task 31 / Rulings 7b + 8] "In play" test. Part A Step 4 requires a
      //--- zone "being retested by the current, freshest structure"; until now
      //--- the EA armed on zone EXISTENCE alone, and measured candidates armed
      //--- 108, 315 and 362 points from zones price had never reached. Under
      //--- Ruling 7a that is no longer merely a wasted alert - such a candidate
      //--- holds the one-setup-per-session slot until the window closes and
      //--- suppresses every genuine setup behind it.
      //---
      //--- Ruling 8 defines "in play" as ANY of three penetrations of the
      //--- projected zone:
      //---   BAR    - the evaluation bar's own high/low range (the retracement
      //---            case; operator setups 1 and 3 satisfy this)
      //---   SWING1 - the freshest confirmed swing on the protective side
      //---   SWING2 - the next DISTINCT confirmed swing on that same side
      //--- Operator setup 2 entered 101 points above its XOB and was valid
      //--- because the projection was still touched by structure, specifically
      //--- by the second swing - the one the stop was placed at.
      //---
      //--- No distance parameter, no bar-count parameter, no tolerance. Every
      //--- input is a structure FlowLogic already exports. Two swings, not N,
      //--- because Part A Step 6's own two-swing stop branch already fixes two
      //--- as this system's structural depth. Part A section 7 not engaged.
      //---
      //--- FVG-over-XOB precedence mirrors the existing block below (EA-1,
      //--- zero live instances across two ranges). Reads only; assigns nothing
      //--- the existing block relies on.
      //--- [Task 55 / EA-56 + EA-58] An exported FVG must not veto an in-play XOB.
      //--- Operator ruling: there is NO precedence between a valid XOB and a valid
      //--- FVG - validity is the only gate. But the selection immediately below,
      //--- and ReadQualifyingZone's identical copy, return the FVG unconditionally
      //--- whenever one is exported, with no test applied to it. The XOB is
      //--- discarded before anything examines it.
      //---
      //--- Consequence at THIS site, which is the arming site: when the exported
      //--- FVG is not in play but the XOB is, s31_zHi/s31_zLo take the FVG, the
      //--- inline in-play test below returns false, and the candidate does not arm
      //--- at all - while a qualifying in-play XOB sits unused in xobHi/xobLo,
      //--- already read on this bar. The Task 33a depth guard cannot see this: it
      //--- compares the RETURNED zone against the adopted one, and the vetoed XOB
      //--- never reaches it.
      //---
      //--- Fix: test both zones, and downgrade haveFvg to false ONLY in that one
      //--- case. Downgrading haveFvg rather than rewriting the selection means the
      //--- selection below, the arming condition, the adoption block and the src=
      //--- label all follow correctly with no further edits and no restructure.
      //---
      //--- STRICTLY MONOTONE. haveFvg is downgraded only when
      //---   haveFvg && !fvgInPlay && haveXob && xobInPlay
      //--- which is precisely the set of bars that cannot arm today. Every other
      //--- bar is byte-identical, including the both-in-play case, where the FVG
      //--- still wins. That surviving preference is an ENGINEERING TIEBREAK forced
      //--- by the single g_zoneHi/g_zoneLo slot, exactly as the Task 33a depth
      //--- guard is - it is NOT a strategy rule and must not be documented as one.
      //--- It dissolves only when the EA can hold several zones concurrently.
      //---
      //--- The ZONEPICK line below is also a census: on the 2026.08.19-20 window
      //--- every arming bar reported haveFvg=0, so it is not yet known whether the
      //--- FVG-leg export ever populates in the tester. downgraded=1 never
      //--- appearing would mean this defect has no live instance on that window,
      //--- not that the guard is absent.
      bool s55_fvgInPlay = false, s55_xobInPlay = false, s55_downgraded = false;
      if(haveFvg)
         s55_fvgInPlay = ZoneInPlay(barShift, MathMax(fvgHi, fvgLo), MathMin(fvgHi, fvgLo), s1_stopRef, s1_haveStop);
      if(haveXob)
         s55_xobInPlay = ZoneInPlay(barShift, MathMax(xobHi, xobLo), MathMin(xobHi, xobLo), s1_stopRef, s1_haveStop);
      if(haveFvg && !s55_fvgInPlay && haveXob && s55_xobInPlay)
        { haveFvg = false; s55_downgraded = true; }
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] ZONEPICK bar=%s dir=%s haveFvg=%d fvgInPlay=%d "
                     "haveXob=%d xobInPlay=%d downgraded=%d fvg=%s-%s xob=%s-%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     (int)haveFvg, (int)s55_fvgInPlay,
                     (int)haveXob, (int)s55_xobInPlay,
                     (int)s55_downgraded,
                     (haveFvg || s55_downgraded) ? DoubleToString(MathMin(fvgHi, fvgLo), _Digits) : "-",
                     (haveFvg || s55_downgraded) ? DoubleToString(MathMax(fvgHi, fvgLo), _Digits) : "-",
                     haveXob ? DoubleToString(MathMin(xobHi, xobLo), _Digits) : "-",
                     haveXob ? DoubleToString(MathMax(xobHi, xobLo), _Digits) : "-");

      double s31_zHi = 0.0, s31_zLo = 0.0;
      if(haveFvg)      { s31_zHi = MathMax(fvgHi, fvgLo); s31_zLo = MathMin(fvgHi, fvgLo); }
      else if(haveXob) { s31_zHi = MathMax(xobHi, xobLo); s31_zLo = MathMin(xobHi, xobLo); }

      bool   s31_inPlay   = false;
      string s31_via      = "none";
      double s31_sw1      = 0.0,  s31_sw2      = 0.0;
      int    s31_sw1Shift = -1,   s31_sw2Shift = -1;
      double s31_barHi    = iHigh(_Symbol, PERIOD_CURRENT, barShift);
      double s31_barLo    = iLow (_Symbol, PERIOD_CURRENT, barShift);

      if(s31_zHi > 0.0 && s31_zLo > 0.0)
        {
         if(s31_barHi >= s31_zLo && s31_barLo <= s31_zHi)
           { s31_inPlay = true; s31_via = "BAR"; }

         int s31_buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;

         if(FindNearestSwing(s31_buf, barShift, s31_sw1, s31_sw1Shift))
           {
            if(s31_sw1 >= s31_zLo && s31_sw1 <= s31_zHi)
              {
               s31_inPlay = true;
               if(s31_via == "none") s31_via = "SWING1";
              }

            //--- [STEP 1 / charter ruling 3] In-play depth is the SL LEG (operator
            //--- ruling 2026-09-08): every confirmed protective-side swing back to
            //--- the stop reference chosen at S2POLL this bar. The stop swing is
            //--- tested and ends the walk. Without a stop reference this bar, the
            //--- measured two-swing depth remains the bound, per council Part 1.1.
            //--- No bar-count limit; bounds are structural. This reconciles the
             //--- arming gate with ZoneInPlay, ZoneAdoptable and the S4 re-read.
             //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
             //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
             const int s31_legLimit = barShift + Bars(_Symbol, PERIOD_CURRENT);
             if(!s1_haveStop)
              {
               for(int s = s31_sw1Shift + 1; s <= s31_sw1Shift + 500; s++)
                 {
                  double s31_v2;
                  if(!ReadFlow(s31_buf, s31_v2, s))                 break;
                  if(s31_v2 == EMPTY_VALUE || s31_v2 <= 0.0)        continue;
                  if(MathAbs(s31_v2 - s31_sw1) <= _Point)           continue;
                  s31_sw2 = s31_v2; s31_sw2Shift = s;
                  break;
                 }

               if(s31_sw2 > 0.0 && s31_sw2 >= s31_zLo && s31_sw2 <= s31_zHi)
                 {
                  s31_inPlay = true;
                  if(s31_via == "none") s31_via = "SWING2";
                 }
              }
            else
              {
                double s31_prev = s31_sw1;
                for(int s = s31_sw1Shift + 1; s <= s31_legLimit; s++)
                 {
                  double s31_v2;
                  if(!ReadFlow(s31_buf, s31_v2, s))                 break;
                  if(s31_v2 == EMPTY_VALUE || s31_v2 <= 0.0)        continue;
                  if(MathAbs(s31_v2 - s31_prev) <= _Point)          continue;
                  s31_prev = s31_v2;
                  if(s31_v2 >= s31_zLo && s31_v2 <= s31_zHi)
                    {
                     s31_inPlay = true;
                     if(s31_via == "none") s31_via = "SWINGLEG";
                    }
                  if((g_dir == DIR_LONG) ? (s31_v2 <= s1_stopRef) : (s31_v2 >= s1_stopRef)) break;
                 }
              }
           }
        }

      //--- Arming-bar high/low are printed for EA-42: the EA cannot reach S5
      //--- until a later bar closes in direction, so its entry price is
      //--- structurally later than the operator's. This line measures the gap
      //--- for free. Diagnostic only - nothing reads it.
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] S3INPLAY bar=%s dir=%s inPlay=%d via=%s "
                     "zoneLo=%s zoneHi=%s barLo=%s barHi=%s close=%s "
                     "sw1=%s@%d sw2=%s@%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir), (int)s31_inPlay, s31_via,
                     DoubleToString(s31_zLo, _Digits),
                     DoubleToString(s31_zHi, _Digits),
                     DoubleToString(s31_barLo, _Digits),
                     DoubleToString(s31_barHi, _Digits),
                     DoubleToString(iClose(_Symbol, PERIOD_CURRENT, barShift), _Digits),
                     (s31_sw1 > 0.0 ? DoubleToString(s31_sw1, _Digits) : "-"), s31_sw1Shift,
                     (s31_sw2 > 0.0 ? DoubleToString(s31_sw2, _Digits) : "-"), s31_sw2Shift);

      //--- [Task 126 / EA-49 / A-3 section 5.7] SHADOW in-play census.
      //--- DIAGNOSTIC ONLY. The live test above stops after TWO swings
      //--- (s31_sw1, s31_sw2), so a zone put in play by an older swing reads
      //--- inPlay=0 today. The operator's own 08/17 zone was in play via a swing
      //--- roughly eighty bars before entry, which two swings cannot reach.
      //--- Ruling 5.7 bounds the walk by the backing XOB's OWN LIFETIME instead:
      //--- every confirmed protective-side swing between its promotion time and
      //--- now. This block runs that walk and PRINTS its verdict beside the live
      //--- one. It assigns nothing the cascade reads, touches s31_inPlay not at
      //--- all, and cannot change any signal, abort or state transition.
      //---
      //--- Bound source is buffer 33, which FlowLogic writes from the SAME object
      //--- pointer as buffers 22/23/31 inside the SAME branch, so it describes
      //--- the XOB zone and only the XOB zone. zoneSrc is printed so an
      //--- FVG-sourced zone is separable: an FVG has no promotion time of its own
      //--- and must never be bounded by an unrelated object's lifetime. haveFvg
      //--- is false on every bar today (EA-120 limb 2), so that case has no live
      //--- instance yet.
      //---
      //--- capHit=1 means the walk stopped on the 500-slot safety bound rather
      //--- than on the promotion time. Measured, not accepted: if capHit is
      //--- common then the bound is de facto a bar count and section 5.7 needs a
      //--- different implementation. bounded=0 means buffer 33 read unset, in
      //--- which case the walk has no structural bound at all and the live
      //--- version must fail closed.
      //---
      //--- BAR penetration is carried into the widened verdict unchanged. Ruling
      //--- 5.7 alters the swing depth only.
      if(InpDebugLog)
        {
         bool     t124_bounded = (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE);
         datetime t124_bound   = t124_bounded ? (datetime)t123_promoT : 0;
         int      t124_buf     = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
         int      t124_scanned = 0;
         int      t124_swings  = 0;
         int      t124_hits    = 0;
         int      t124_first   = -1;
         double   t124_firstV  = 0.0;
         bool     t124_capHit  = false;
         bool     t124_wide    = false;
         int      t124_s       = barShift;

         if(s31_zHi > 0.0 && s31_zLo > 0.0)
           {
            for(t124_s = barShift; t124_s <= barShift + 500; t124_s++)
              {
               datetime t124_bt = iTime(_Symbol, PERIOD_CURRENT, t124_s);
               if(t124_bt <= 0)                                    break;
               if(t124_bounded && t124_bt < t124_bound)            break;
               t124_scanned++;
               double t124_v;
               if(!ReadFlow(t124_buf, t124_v, t124_s))             break;
               if(t124_v == EMPTY_VALUE || t124_v <= 0.0)          continue;
               t124_swings++;
               if(t124_v >= s31_zLo && t124_v <= s31_zHi)
                 {
                  t124_hits++;
                  if(t124_first < 0) { t124_first = t124_s; t124_firstV = t124_v; }
                 }
              }
            if(t124_s > barShift + 500) t124_capHit = true;
            t124_wide = (t124_hits > 0) ||
                        (s31_barHi >= s31_zLo && s31_barLo <= s31_zHi);
           }

         PrintFormat("[SRJ-EA] XOBINPLAY bar=%s dir=%s zoneSrc=%s zoneLo=%s zoneHi=%s "
                     "promoT=%s bounded=%d scanned=%d swings=%d hits=%d "
                     "firstShift=%d firstVal=%s capHit=%d legacy=%d legacyVia=%s "
                     "widened=%d flip=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     haveFvg ? "FVG" : (haveXob ? "XOB" : "none"),
                     DoubleToString(s31_zLo, _Digits),
                     DoubleToString(s31_zHi, _Digits),
                     t124_bounded ? TimeToString(t124_bound, TIME_DATE|TIME_MINUTES) : "unset",
                     (int)t124_bounded, t124_scanned, t124_swings, t124_hits,
                     t124_first,
                     (t124_first >= 0 ? DoubleToString(t124_firstV, _Digits) : "-"),
                     (int)t124_capHit, (int)s31_inPlay, s31_via,
                     (int)t124_wide, (int)(t124_wide && !s31_inPlay));

         //--- [Task 127 / EA-49 / A-3 section 5.7] SECOND shadow verdict, with the
         //--- 500-slot cap removed. DIAGNOSTIC ONLY. Task 126 measured capHit=1 on
         //--- 8 of 56 S3 bars â€” the Task 126 walk terminated on the 500-slot safety
         //--- bound rather than on the promotion time, so its hits=0 on those bars
         //--- is a TRUNCATED zero and not a measured one. A bound that resolves to
         //--- "500 bars" is a bar-count threshold, which the standing prohibition
         //--- forbids. This walk removes the cap without introducing a number: the
         //--- loop limit is Bars(), a structural quantity, and the ONLY substantive
         //--- terminator is the promotion-time comparison. reached2=1 means the walk
         //--- ended on that boundary and the ruled bound was honoured; reached2=0
         //--- means it ended on history exhaustion or a read failure and the result
         //--- is still truncated.
         //---
         //--- cls1 and cls2 are printed as SINGLE TOKENS so the legacy-versus-shadow
         //--- cross-tabulation needs no arithmetic downstream. Task 126 reported the
         //--- LEGACYONLY cell as zero when its own data showed otherwise; a token
         //--- makes that class of error impossible.
         //---   BOTH        legacy in play AND shadow in play
         //---   LEGACYONLY  legacy in play, shadow NOT â€” a witness predating the
         //---               XOB's own promotion, which section 5.7 excludes
         //---   WIDEONLY    shadow in play, legacy NOT â€” the admission gain
         //---   NEITHER     both out of play
         //---
         //--- Reuses t124_bound, t124_bounded and t124_buf, all in scope. Assigns
         //--- nothing the cascade reads, touches s31_inPlay not at all, and cannot
         //--- change any signal, abort or state transition.
         int      t127_scanned2 = 0;
         int      t127_swings2  = 0;
         int      t127_hits2    = 0;
         int      t127_first2   = -1;
         double   t127_firstV2  = 0.0;
         bool     t127_wide2    = false;
         bool     t127_reached2 = false;
         int      t127_limit2   = barShift + Bars(_Symbol, PERIOD_CURRENT);

         if(s31_zHi > 0.0 && s31_zLo > 0.0)
           {
            for(int t127_s = barShift; t127_s <= t127_limit2; t127_s++)
              {
               datetime t127_bt = iTime(_Symbol, PERIOD_CURRENT, t127_s);
               if(t127_bt <= 0)                                     break;
               if(t124_bounded && t127_bt < t124_bound)
                 { t127_reached2 = true; break; }
               t127_scanned2++;
               double t127_v;
               if(!ReadFlow(t124_buf, t127_v, t127_s))              break;
               if(t127_v == EMPTY_VALUE || t127_v <= 0.0)           continue;
               t127_swings2++;
               if(t127_v >= s31_zLo && t127_v <= s31_zHi)
                 {
                  t127_hits2++;
                  if(t127_first2 < 0) { t127_first2 = t127_s; t127_firstV2 = t127_v; }
                 }
              }
            t127_wide2 = (t127_hits2 > 0) ||
                         (s31_barHi >= s31_zLo && s31_barLo <= s31_zHi);
           }

         string t127_cls1 = s31_inPlay ? (t124_wide  ? "BOTH" : "LEGACYONLY")
                                       : (t124_wide  ? "WIDEONLY" : "NEITHER");
         string t127_cls2 = s31_inPlay ? (t127_wide2 ? "BOTH" : "LEGACYONLY")
                                       : (t127_wide2 ? "WIDEONLY" : "NEITHER");

         PrintFormat("[SRJ-EA] XOBINPLAY2 bar=%s dir=%s zoneSrc=%s zoneLo=%s zoneHi=%s "
                     "promoT=%s bounded=%d legacy=%d legacyVia=%s "
                     "capped_scanned=%d capped_swings=%d capped_hits=%d "
                     "capped_wide=%d capHit=%d "
                     "unc_scanned=%d unc_swings=%d unc_hits=%d unc_first=%d "
                     "unc_firstVal=%s unc_wide=%d reached2=%d cls1=%s cls2=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     haveFvg ? "FVG" : (haveXob ? "XOB" : "none"),
                     DoubleToString(s31_zLo, _Digits),
                     DoubleToString(s31_zHi, _Digits),
                     t124_bounded ? TimeToString(t124_bound, TIME_DATE|TIME_MINUTES) : "unset",
                     (int)t124_bounded, (int)s31_inPlay, s31_via,
                     t124_scanned, t124_swings, t124_hits,
                     (int)t124_wide, (int)t124_capHit,
                     t127_scanned2, t127_swings2, t127_hits2, t127_first2,
                     (t127_first2 >= 0 ? DoubleToString(t127_firstV2, _Digits) : "-"),
                     (int)t127_wide2, (int)t127_reached2, t127_cls1, t127_cls2);
        }

      //--- [Task 133 / A-3 section 5.7 / operator ruling] LIVE promotion-bounded
      //--- in-play test. ADMISSION-CHANGING, and the only admission-changing edit
      //--- in this task.
      //---
      //--- Operator ruling, verbatim: an order block that becomes a promoted XOB on
      //--- the same candle you would enter on is NOT tradeable, because "price has
      //--- not retraced to the XOB yet, it was only retracting to the ordinary OB
      //--- before it was promoted to XOB." A witness that predates promotion is
      //--- therefore not a witness. On the operator's own 08/17 setup the ordering
      //--- was promotion 05:30, witness swing 09:10, confirmation 15:50.
      //---
      //--- Measured at Tier 1 (Tasks 126, 127): 5 of the 11 live in-play verdicts
      //--- rest on a swing that predates the zone's own promotion, and every one is
      //--- a zone promoted 0-10 minutes before the evaluation bar with swings=0.
      //--- 21 further bars are in play under this bound and read out of play today.
      //---
      //--- Threshold-free. The loop limit is Bars(), a structural quantity, and the
      //--- only substantive terminator is the promotion-time comparison. Tasks 126
      //--- and 127 measured the 500-slot cap as non-binding at Tier 1 - capped and
      //--- uncapped verdicts agreed on all 56 bars - so no cap is carried here.
      //---
      //--- SCOPE. XOB-sourced zones only, per section 7.27: buffer 33 is written
      //--- from the same object pointer as buffers 22/23/31 and describes the XOB
      //--- zone alone. An FVG has no promotion time of its own. haveFvg is false on
      //--- every bar today (EA-120 limb 2), so the FVG branch has no live instance.
      //--- ZoneInPlay and ZoneAdoptable are deliberately NOT changed here: the
      //--- former is reachable only through the haveFvg downgrade and the latter
      //--- governs replacement at S4, not admission at S3. Logged as EA-132.
      //---
      //--- FAIL CLOSED on an unreadable promotion time. Without it, promotion
      //--- cannot be shown to precede the witness, which is what the ruling
      //--- requires. Zero Tier 1 instances with a populated zone, so this path is
      //--- inert today; the census counts it so the population becomes known.
      //---
      //--- ? PLACEMENT IS LOAD-BEARING. ? This block sits AFTER the S3INPLAY print
      //--- and AFTER the Task 126 and Task 127 shadow blocks have already read
      //--- s31_inPlay, and BEFORE the arming condition. Consequence, deliberate:
      //--- S3INPLAY, and the legacy= / legacyVia= fields of XOBINPLAY and
      //--- XOBINPLAY2, all keep reporting the UNCHANGED legacy ladder verdict. The
      //--- committed verdict is reported only on the new INPLAYCOMMIT line. That is
      //--- what makes unc_wide= on XOBINPLAY2 an INDEPENDENT oracle for committed=
      //--- here: two separate implementations of the same walk, in one log, on the
      //--- same bar. They must agree on every bar where applied=1 and bounded=1.
      //---
      //--- s31_via is deliberately NOT overwritten. Nothing downstream reads it,
      //--- and leaving it alone keeps the legacy ladder's verdict legible.
      bool     t133_applied = false;
      bool     t133_bounded = false;
      bool     t133_inPlay  = false;
      bool     t133_legacy  = s31_inPlay;
      int      t133_scanned = 0;
      int      t133_swings  = 0;
      int      t133_hits    = 0;
      int      t133_first   = -1;
      double   t133_firstV  = 0.0;
      string   t133_via     = "none";
      datetime t133_bound   = 0;
      double   t133_prev     = 0.0;
      bool     t133_havePrev = false;
      bool     t133_haveStop = false;   // hoisted mirror of s3_haveStop for the print

      if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)
        {
         t133_applied = true;
         t133_bounded = (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE);

         //--- [STEP 1 / charter ruling 3] The in-play walk's bound is the SL LEG
         //--- (operator ruling 2026-09-09): every confirmed protective-side swing
         //--- back to the stop-reference swing chosen by ComputeSlReference this
         //--- bar. The stop swing is tested and ends the walk. Without a stop
         //--- reference, the promotion-time bound remains as the fail-safe (the
         //--- measured Task 126 bound) per council Part 1.1.
         double s3_slRef = 0.0; ENUM_SRJ_SLMODE s3_slMode = SL_MODE_NONE;
         bool  s3_haveStop = SlRefMemo(barShift, barTime, g_dir, s3_slRef, s3_slMode, "S3ARM");
         t133_haveStop = s3_haveStop;

         //--- [P-FIX-S2POLL E3 / operator Q3 2026-09-11: "SL should be present at
         //--- all times"] The SL LEG IS THE BOUND. Superseded gate admitted the
         //--- (!bounded && !haveStop) cell, where the time terminator is disabled by
         //--- !s3_haveStop AND the stop terminator is disabled by s3_haveStop, so the
         //--- walk ran the full history and admitted on any swing anywhere - the
         //--- opposite of the fail-closed claim in the Task 133 comment.
         //--- SUPERSEDED, retained per P4:
         //---   if(t133_bounded || !s3_haveStop)
         if(s3_haveStop)

           {
            if(t133_bounded) t133_bound = (datetime)t123_promoT;

            if(s31_barHi >= s31_zLo && s31_barLo <= s31_zHi)
              { t133_inPlay = true; t133_via = "BAR"; }

            int t133_buf   = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
            int t133_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);

            for(int t133_s = barShift; t133_s <= t133_limit; t133_s++)
              {
               datetime t133_bt = iTime(_Symbol, PERIOD_CURRENT, t133_s);
               if(t133_bt <= 0)                            break;
               if(!s3_haveStop && t133_bt < t133_bound)    break;
               t133_scanned++;
               double t133_v;
               if(!ReadFlow(t133_buf, t133_v, t133_s))     break;
               if(t133_v == EMPTY_VALUE || t133_v <= 0.0)  continue;
               //--- [P-FIX-S2POLL E2] distinctness: one turn of the bigger move is
               //--- one swing. This is the ZoneInPlay / ZoneAdoptable / S3-ladder
               //--- idiom verbatim, so t133_swings becomes comparable to theirs.
               //--- The walk starts at barShift with no seed swing, so the first
               //--- swing is distinct by construction (havePrev false).
               if(t133_havePrev && MathAbs(t133_v - t133_prev) <= _Point) continue;
               t133_prev     = t133_v;
               t133_havePrev = true;
               t133_swings++;
               //--- [P-FIX-S2POLL E2 / operator Q2 2026-09-11: "count the SL leg not
               //--- the latest structure leg"] The STOP SWING ITSELF IS A WITNESS.
               //--- Order is test-containment-then-break, matching all three other
               //--- implementations. The superseded order broke first, so the walk
               //--- could not see the one witness class on record - the swing the
               //--- stop was placed at.
               //--- SUPERSEDED, retained per P4: the terminator stood HERE, above
               //--- t133_swings++ and above the containment test.
               if(t133_v >= s31_zLo && t133_v <= s31_zHi)
                 {
                  t133_hits++;
                  if(t133_first < 0) { t133_first = t133_s; t133_firstV = t133_v; }
                  if(t133_via == "none") t133_via = "SWING";
                 }
               if(s3_haveStop && ((g_dir == DIR_LONG) ? (t133_v <= s3_slRef) : (t133_v >= s3_slRef))) break;
              }

            if(t133_hits > 0) t133_inPlay = true;
           }

         s31_inPlay = t133_inPlay;
        }

      if(InpDebugLog)
         PrintFormat("[SRJ-EA] INPLAYCOMMIT bar=%s dir=%s zoneSrc=%s zoneLo=%s zoneHi=%s "
                     "promoT=%s applied=%d bounded=%d scanned=%d swings=%d hits=%d "
                     "firstShift=%d firstVal=%s commitVia=%s legacy=%d legacyVia=%s "
                     "committed=%d changed=%d haveStop=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     haveFvg ? "FVG" : (haveXob ? "XOB" : "none"),
                     DoubleToString(s31_zLo, _Digits),
                     DoubleToString(s31_zHi, _Digits),
                     (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE)
                        ? TimeToString((datetime)t123_promoT, TIME_DATE|TIME_MINUTES)
                        : "unset",
                     (int)t133_applied, (int)t133_bounded,
                     t133_scanned, t133_swings, t133_hits,
                     t133_first,
                     (t133_first >= 0 ? DoubleToString(t133_firstV, _Digits) : "-"),
                     t133_via,
                     (int)t133_legacy, s31_via,
                     (int)s31_inPlay,
                     (int)(s31_inPlay != t133_legacy),
                     (int)t133_haveStop);

      if((haveFvg || haveXob) && s31_inPlay)
        {
         if(haveFvg) { g_zoneHi = MathMax(fvgHi, fvgLo); g_zoneLo = MathMin(fvgHi, fvgLo); }
         else        { g_zoneHi = MathMax(xobHi, xobLo); g_zoneLo = MathMin(xobHi, xobLo); }
         g_touchSeen = false;
         ENUM_SRJ_STATE prev = g_state;
         g_state = ST_S4_ARMED;
         LogState(prev, g_state);
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S3 zone: src=%s haveFvg=%d haveXob=%d "
                        "zoneLo=%s zoneHi=%s%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        haveFvg ? "FVG" : "XOB",
                        (int)haveFvg, (int)haveXob,
                        DoubleToString(g_zoneLo, _Digits),
                        DoubleToString(g_zoneHi, _Digits),
                        (haveFvg && haveXob)
                          ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
                          : "");
         if(InpAlertHeadsUp && !g_alertedArmed)
           {
            g_alertedArmed = true;
            EmitAlert("HEADS-UP",
                      StringFormat("zone %s-%s awaiting confirm",
                                   DoubleToString(g_zoneLo, _Digits),
                                   DoubleToString(g_zoneHi, _Digits)),
                      false);
           }
        }
      else
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
         //--- [P-CONFIRM-ANYSTATE E1 2026-09-11, operator ruling verbatim: "if
         //--- all my conditions are met, the trade is ON. The EA must take the
         //--- confirmation candle whenever it appears (even while its own prep
         //--- is unfinished), keeping the one-bar rule."] A PRE-BINDING
         //--- candidate (S3_ZONE_WAIT: zone unbound or not in play) now ALSO
         //--- evaluates the confirmation predicate at this bar's close. PASS ->
         //--- promote DIRECTLY to ST_S5_GATE_CHECK (the S5 block below runs in
         //--- this same pass: divergence walk -> R latch -> fire); FAIL -> the
         //--- confirmation is consumed (no carry-forward; the candidate stays
         //--- at S3). DECLARED: the pre-confirmation freshness poll cannot run
         //--- pre-binding (it tests the BOUND zone), so a pre-bind firing
         //--- proceeds without it; S2 candidates are OUTSIDE the ruled scope.
         string cfTermPB = "";
         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))
           {
            ENUM_SRJ_STATE prevPB = g_state;
            g_confirmFromState = prevPB;
            g_state = ST_S5_GATE_CHECK;
            LogState(prevPB, g_state);
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                        TIME_DATE|TIME_MINUTES),
                           DirName(g_dir), AnchorStr());
            //--- no return: fall through to the ST_S5_GATE_CHECK block below
           }
         else
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_FAIL bar=%s dir=%s term=%s",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                        TIME_DATE|TIME_MINUTES),
                           DirName(g_dir), cfTermPB);
            return;
           }
        }
     }

   if(g_state == ST_S4_ARMED)
     {
      double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
      double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
      double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
      double c = iClose(_Symbol, PERIOD_CURRENT, barShift);

      //--- [Task 35 / EA-36] Live zone re-read. Runs before the touch and
      //--- confirm tests so both are evaluated against the current zone.
      //--- Fail-soft on an absent export: the last known zone is retained.
      //--- The in-play test is deliberately NOT re-run here. Ruling 8's in-play
      //--- gates the arming transition; a bar that closes in the trade direction
      //--- is by definition leaving the zone, so re-checking it after arming
      //--- would reject every valid Part A Step 5 confirmation.
      double s35_zHi = 0.0, s35_zLo = 0.0;
      bool   s35_fromFvg = false;
      if(ReadQualifyingZone(barShift, s35_zHi, s35_zLo, s35_fromFvg, s1_stopRef, s1_haveStop) && ZoneAdoptable(barShift, s35_zHi, s35_zLo, s1_stopRef, s1_haveStop) && ((g_dir == DIR_LONG) ? (s35_zLo <= g_zoneLo + _Point * 0.5) : (s35_zHi >= g_zoneHi - _Point * 0.5)))
        {
         if(MathAbs(s35_zHi - g_zoneHi) > _Point * 0.5 ||
            MathAbs(s35_zLo - g_zoneLo) > _Point * 0.5)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] ZONEMOVE bar=%s dir=%s oldLo=%s oldHi=%s "
                           "newLo=%s newHi=%s src=%s touchSeen=%d",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir),
                           DoubleToString(g_zoneLo, _Digits),
                           DoubleToString(g_zoneHi, _Digits),
                           DoubleToString(s35_zLo, _Digits),
                           DoubleToString(s35_zHi, _Digits),
                           (s35_fromFvg ? "FVG" : "XOB"),
                           (int)g_touchSeen);

            g_zoneHi = s35_zHi;
            g_zoneLo = s35_zLo;

            //--- Touch revalidation. Without it, a touch of one zone would
            //--- license a confirming close against a different zone.
            if(g_touchSeen && g_touchBarHi > 0.0 &&
               !(g_touchBarHi >= g_zoneLo && g_touchBarLo <= g_zoneHi))
              {
               g_touchSeen = false;
               if(InpDebugLog)
                  PrintFormat("[SRJ-EA] TOUCHCLEAR bar=%s touchBarLo=%s touchBarHi=%s "
                              "zoneLo=%s zoneHi=%s",
                              TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                              DoubleToString(g_touchBarLo, _Digits),
                              DoubleToString(g_touchBarHi, _Digits),
                              DoubleToString(g_zoneLo, _Digits),
                              DoubleToString(g_zoneHi, _Digits));
              }
           }
        }
      //--- [Task 52 / EA-59b] Leg-scoped touch scan. Placed AFTER the live-zone
      //--- re-read above, so it tests against the current zone, and BEFORE the
      //--- existing single-bar touch test below. Two effects:
      //---   1. A touch that completed before this candidate armed is now seen.
      //---   2. Because it sets g_touchSeen before the if/else below, the ELSE
      //---      (confirm) branch runs on the SAME pass the touch is discovered.
      //---      That is what admits a touch on the bar immediately left of the
      //---      confirming close, and a single bar that is simultaneously the POI
      //---      retest and the confirming candle. The if/else itself is not
      //---      restructured; only the value of g_touchSeen reaching it changes.
      //--- SET-ONLY by design: this never clears g_touchSeen. TOUCHCLEAR (Task 35)
      //--- remains the sole clearing mechanism, so the change is monotone in
      //--- admission - it can add candidates that reach S5, never remove one.
      //--- The single-bar test below is now redundant (s = barShift is this scan's
      //--- first iteration, with identical tests) and therefore harmless. It is
      //--- retained rather than deleted.
      int    s52_shift = -1;
      double s52_legT  = 0.0;
      bool   s52_found = FindLegTouch(barShift, g_zoneHi, g_zoneLo,
                                      s52_shift, s52_legT, s35_fromFvg);
      if(s52_found && !g_touchSeen)
        {
         g_touchSeen  = true;
         g_touchBarHi = iHigh(_Symbol, PERIOD_CURRENT, s52_shift);
         g_touchBarLo = iLow (_Symbol, PERIOD_CURRENT, s52_shift);
        }
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] LEGTOUCH bar=%s dir=%s found=%d atShift=%d atBar=%s "
                     "legBound=%s zoneLo=%s zoneHi=%s touchSeen=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(g_dir), (int)s52_found, s52_shift,
                     (s52_shift >= 0
                        ? TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES)
                        : "-"),
                     (s52_legT > 0.0
                        ? TimeToString((datetime)s52_legT, TIME_DATE|TIME_MINUTES)
                        : "none"),
                     DoubleToString(g_zoneLo, _Digits),
                     DoubleToString(g_zoneHi, _Digits),
                     (int)g_touchSeen);
      if(!g_touchSeen)
        {
         bool oppositeDir = (g_dir == DIR_LONG) ? (c < o) : (c > o);
         bool touchesZone = (h >= g_zoneLo && l <= g_zoneHi);
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
        }
      else
        {
         //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
         //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
         //--- candle's CLOSE stays on the setup side of the anchor line - a wick
         //--- through is the retracement, a CLOSE through is a line break).
         //--- One-bar validity: promotion happens ONLY on a true test bar; a
         //--- failed term consumes the confirmation (no carry-forward) and a
         //--- later bar can present a fresh confirmation while the candidate is
         //--- alive and in-window. The touch fallback above STAYS (it sets
         //--- g_touchSeen - the retracement detection; unchanged).
         string cfTerm = "";
         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
           {
            ENUM_SRJ_STATE prev = g_state;
            g_confirmFromState = prev;
            g_state = ST_S5_GATE_CHECK;
            LogState(prev, g_state);
           }
         else if(InpDebugLog)
            PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), cfTerm);
        }
     }

   if(g_state == ST_S5_GATE_CHECK)
     {
      //--- [P-CONFIRM-GATE E3 / operator robustness ruling 2026-09-10, verbatim:
      //--- "please make the divergence detection more robust. i consider the
      //--- latest CQD divergence, although that was from an older structure.
      //--- WHICH EVER LAST."] The divergence term is a newest-first CQD verdict
      //--- walk with NO BOUND - no seed-bar bound, no age limit. The FIRST
      //--- nonzero verdict walking left IS the latest on the indicator, however
      //--- old. This replaces the anchor-bounded g_divLatch in the firing path
      //--- entirely (the per-bar g_divLatch machinery above stays - it is
      //--- working-set state and a census field; the firing path no longer
      //--- reads it).
      bool   divOk    = false;
      int    divVal   = 0;
      string divKind  = "";
      {
       int maxWalk = Bars(_Symbol, PERIOD_CURRENT) - 1;
       for(int s = barShift; s <= maxWalk; s++)
         {
          double verdict;
          if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) continue;
          if(verdict == EMPTY_VALUE) continue;
          int v = (int)MathRound(verdict);
          if(v == 0) continue;
          divVal   = v;
          divKind  = (MathAbs(v) == 1) ? "regular" : "hidden";
          divOk    = (g_dir == DIR_LONG  && (v ==  1 || v ==  2)) ||
                     (g_dir == DIR_SHORT && (v == -1 || v == -2));
          break;
         }
      }
      //--- [P-CONFIRM-GATE E3] one-bar validity, the divergence miss: the
      //--- confirmation is CONSUMED and the candidate RETURNS TO S4_ARMED
      //--- (CONFIRM_DIV_WAIT, no abort) - a fresh confirmation may present on
      //--- a later bar. The old async wait ("S5 waiting: divLatch=0 tpOk=1")
      //--- RETIRES.
      if(!divOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] CONFIRM_DIV_WAIT bar=%s dir=%s verdict=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                         DirName(g_dir), divVal);
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "DIV_WAIT");
          ENUM_SRJ_STATE prevDiv = g_state;
         //--- [P-CONFIRM-ANYSTATE E3] the rollback returns to the promotion
         //--- origin: S3 for a pre-bind confirmation, S4 for the armed edge
         //--- (identical to the build-2 behavior for the armed path).
         g_state = (g_confirmFromState == ST_S3_ZONE_WAIT) ? ST_S3_ZONE_WAIT
                                                           : ST_S4_ARMED;
         LogState(prevDiv, g_state);
         return;
        }

      //--- [P-NEXTOPEN 2026-09-09, operator directive] The entry reference is
      //--- the NEXT candle's OPEN (the forming bar's open at this evaluation
      //--- instant), not the evaluated bar's close (Part A spec section 4).
      //--- Fail-soft: the evaluated bar's close is the fallback if the next
      //--- bar's open cannot be read.
      double nextOpenPx = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
      if(nextOpenPx <= 0.0) nextOpenPx = iClose(_Symbol, PERIOD_CURRENT, barShift);
      double currentPrice = nextOpenPx;
      double tpTarget = 0.0;
      if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
        {
         if(InpDebugLog)
             PrintFormat("[SRJ-EA] %s S5_NO_TP_TARGET",
                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "NO_TP");
          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
        }

      double slRef = 0.0;
      ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
      //--- [P-SLDEF-6 E41.2] strict next-open origin handoff for the S5
      //--- shadow: the RAW open (no close fallback — an unavailable origin
      //--- halts the row inside the function, never substitutes).
      if(InpDebugLog)
        {
         double sl41_rawOpen = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
         g_sl41_oPx = sl41_rawOpen;
         g_sl41_oBT = (barShift >= 1) ? iTime(_Symbol, PERIOD_CURRENT, barShift - 1) : 0;
         g_sl41_oSite = "S5";
         g_sl41_oStamp = iTime(_Symbol, PERIOD_CURRENT, barShift);
        }
      if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))
        {
         if(InpDebugLog)
             PrintFormat("[SRJ-EA] %s S5_NO_SL_REF",
                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "NO_SL");
          GoAbort(ABORT_NO_SL_REF, g_state); return;
        }

      //--- [P-SWINGIMB-3 E10] R-cost table: one SLIMBR line per S5 invocation
      //--- (print-only, before the RR gate so TP_RR_FAIL rows are included).
      //--- Reads the walk's file-scope shadow; a barTime/site mismatch refuses
      //--- the read (stale guard - never expected to fire: the stamp is written
      //--- synchronously inside this invocation's walk). R uses the latch's own
      //--- formula (tpDist over each stop's risk); deltaPts is the stop's
      //--- displacement from today's stop in points (today = 0 by definition).
      //--- [P-SLDEF-1 E12] four references + two nuance variants. Fractal limb
      //--- from its own shadows under the same stamp. Firing rows are ALSO
      //--- appended to the decision accumulator (bounded, S5 only) for the
      //--- end-of-run SLIMBR_DECISION block; the row whose closest surviving
      //--- R sits within 0.10 above the live threshold carries MARGIN_ROW.
      if(InpDebugLog && SHADOW_SLIMBWALK)
        {
         datetime slimbr_bt = iTime(_Symbol, PERIOD_CURRENT, barShift);
         bool slimbr_fresh = (g_slimbr_barTime == slimbr_bt && g_slimbr_site == "S5");
         double slimbr_b = slimbr_fresh ? g_slimbr_base : 0.0;
         double slimbr_n = slimbr_fresh ? g_slimbr_nuance : 0.0;
         string slimbr_c = slimbr_fresh ? g_slimbr_class : "STALE";
         double slimbr_fb = slimbr_fresh ? g_slimbr_fracBase : 0.0;
         double slimbr_fn = slimbr_fresh ? g_slimbr_fracNuance : 0.0;
         string slimbr_fc = slimbr_fresh ? g_slimbr_fracClass : "STALE";
         double slimbr_tpD = MathAbs(tpTarget - currentPrice);
         double slimbr_riskT = MathAbs(currentPrice - slRef);
         double slimbr_riskB = MathAbs(currentPrice - slimbr_b);
         double slimbr_riskN = MathAbs(currentPrice - slimbr_n);
         double slimbr_riskFB = MathAbs(currentPrice - slimbr_fb);
         double slimbr_riskFN = MathAbs(currentPrice - slimbr_fn);
         double slimbr_rT = (slimbr_riskT > 0.0 ? slimbr_tpD / slimbr_riskT : 0.0);
         double slimbr_rB = (slimbr_riskB > 0.0 ? slimbr_tpD / slimbr_riskB : 0.0);
         double slimbr_rN = (slimbr_riskN > 0.0 ? slimbr_tpD / slimbr_riskN : 0.0);
         double slimbr_rFB = (slimbr_riskFB > 0.0 ? slimbr_tpD / slimbr_riskFB : 0.0);
         double slimbr_rFN = (slimbr_riskFN > 0.0 ? slimbr_tpD / slimbr_riskFN : 0.0);
         //--- [P-SLDEF-5 E35/E37] ext-1 shadow + carve booleans for the
         //--- six-reference SLIMBR. Print-only; slRef/slMode untouched.
         int e35_def = 0; double e35_px = 0.0; int e35_slot = -1;
         datetime e35_bt = 0; int e35_imb = -1; int e35_deep = -1;
         SrjResolveExt1(barShift, g_dir, currentPrice, e35_def, e35_px, e35_slot, e35_bt, e35_imb, e35_deep);
         double e35_risk = (e35_def == 1) ? MathAbs(currentPrice - e35_px) : 0.0;
         double e35_r = (e35_risk > 0.0 ? slimbr_tpD / e35_risk : 0.0);
         int e35_surv = (e35_def == 1) ? ((e35_r >= InpMinRewardRisk) ? 1 : 0) : -1;
         int e35_obF = slimbr_fresh ? g_slimbr_obCarveF : -1;
         int e35_frF = slimbr_fresh ? g_slimbr_frCarveF : -1;
         //--- [P-SLDEF-6 E45.3] predicate carve totals at fresh S5 rows
         //--- (print-only; consequence companions stay g_slimbr_carveOB/FR).
         if(slimbr_fresh && e35_obF == 1) g_sl45_predOB++;
         if(slimbr_fresh && e35_frF == 1) g_sl45_predFR++;
         //--- [P-SLDEF-6 E43] memo-probe comparison at S5: memoised shadow
         //--- vs this row's fresh ext-1. UNGATED by design — disagreement
         //--- sizes adoption's blast radius; disagreers named with fields.
         int sl43_mDef = 0; double sl43_mPx = 0.0; int sl43_mSlot = -1;
         datetime sl43_mBt = 0; int sl43_mImb = -1; int sl43_mDeep = -1; string sl43_mSite = "-";
         int sl43_hit = SrjMemoProbe(slimbr_bt, g_dir, sl43_mDef, sl43_mPx, sl43_mSlot, sl43_mBt, sl43_mImb, sl43_mDeep, sl43_mSite) ? 1 : 0;
         g_sl43_probed++;
         if(sl43_hit == 1)
           {
            g_sl43_hits++;
            string sl43_mPxS = (sl43_mDef == 1) ? DoubleToString(sl43_mPx, _Digits) : "-";
            string sl43_ePxS = (e35_def == 1) ? DoubleToString(e35_px, _Digits) : "-";
            string sl43_mBtS = (sl43_mDef == 1) ? TimeToString(sl43_mBt, TIME_DATE|TIME_MINUTES) : "-";
            string sl43_eBtS = (e35_def == 1) ? TimeToString(e35_bt, TIME_DATE|TIME_MINUTES) : "-";
            int sl43_agree = -1; string sl43_diff = "-";
            if(sl43_mDef == e35_def && sl43_mPxS == sl43_ePxS && sl43_mSlot == e35_slot
               && sl43_mBtS == sl43_eBtS && sl43_mImb == e35_imb) { sl43_agree = 1; g_sl43_agree++; }
            else
              {
               sl43_agree = 0;
               sl43_diff = "";
               if(sl43_mDef != e35_def) sl43_diff += "def ";
               if(sl43_mPxS != sl43_ePxS) sl43_diff += "px ";
               if(sl43_mSlot != e35_slot) sl43_diff += "slot ";
               if(sl43_mBtS != sl43_eBtS) sl43_diff += "bt ";
               if(sl43_mImb != e35_imb) sl43_diff += "imb ";
              }
            string sl43_line = StringFormat("[SRJ-EA] SLEXT43 fields=10 bar=%s dir=%s memoHit=%d memoSite=%s memoExt1=%s freshExt1=%s memoSlot=%d freshSlot=%d agree=%d diffFields=%s",
                      TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                      sl43_hit, sl43_mSite, sl43_mPxS, sl43_ePxS, sl43_mSlot, e35_slot, sl43_agree, sl43_diff);
            LwAudit("SLEXT43", sl43_line);
            Print(sl43_line);
           }
         g_slext_barT = slimbr_bt; g_slext_defined = e35_def; g_slext_px = e35_px;
         g_slext_r = e35_r;
         g_slext_rewardPts = slimbr_tpD / _Point;
         g_slext_riskPts = e35_risk / _Point;
         int slimbr_dB = (slimbr_fresh ? (int)MathRound((slimbr_b - slRef) / _Point) : 0);
         int slimbr_dN = (slimbr_fresh ? (int)MathRound((slimbr_n - slRef) / _Point) : 0);
         int slimbr_dFB = (slimbr_fresh ? (int)MathRound((slimbr_fb - slRef) / _Point) : 0);
         int slimbr_dFN = (slimbr_fresh ? (int)MathRound((slimbr_fn - slRef) / _Point) : 0);
         string slimbr_line = StringFormat("[SRJ-EA] SLIMBR bar=%s dir=%s entry=%s tp=%s slToday=%s rToday=%.2f dTodayPts=0 slBase=%s rBase=%.2f dBasePts=%d slNuance=%s rNuance=%.2f dNuancePts=%d slFractal=%s rFractal=%.2f dFracPts=%d slFractalNuance=%s rFractalNuance=%.2f dFracNuancePts=%d class=%s fracClass=%s slExt1=%s rExt1=%.2f survExt1=%d obCarveFired=%d frCarveFired=%d",
                     TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     DoubleToString(currentPrice, _Digits),
                     DoubleToString(tpTarget, _Digits),
                     DoubleToString(slRef, _Digits),
                     slimbr_rT,
                     DoubleToString(slimbr_b, _Digits),
                     slimbr_rB,
                     slimbr_dB,
                     DoubleToString(slimbr_n, _Digits),
                     slimbr_rN,
                     slimbr_dN,
                     DoubleToString(slimbr_fb, _Digits),
                     slimbr_rFB,
                     slimbr_dFB,
                     DoubleToString(slimbr_fn, _Digits),
                     slimbr_rFN,
                     slimbr_dFN,
                     slimbr_c, slimbr_fc,
                     (e35_def == 1) ? DoubleToString(e35_px, _Digits) : "-",
                     e35_r, e35_surv, e35_obF, e35_frF);
          LwAudit("SLIMBR", slimbr_line);
          Print(slimbr_line);
          //--- [P-SLDEF-3 E30] S5 eval-bar stamp for the SIGMAP pairing.
          if(g_sigmap_s5N < 16) { g_sigmap_s5T[g_sigmap_s5N] = slimbr_bt; g_sigmap_s5N++; }
         //--- [P-SLDEF-1b E18] carve-out operand companions: one short line per
         //--- limb whose walk fired the carve-out (class CARVEOUT_FIRED). NOT
         //--- folded into SLIMBR: 14 operand tokens would breach the 537 cap
         //--- whenever both limbs fire, and gate 7 forbids silent truncation.
         //--- wickCmp is recomputed here from the stamped operands (the same
         //--- more-extreme comparison the core's skip block applies to anchorV
         //--- == retV); bodyCmp is the core's own body verdict, exported.
         if(slimbr_fresh && slimbr_c == "CARVEOUT_FIRED")
           {
            int carveWickOB = (g_dir == DIR_LONG)
                              ? ((g_slimbr_obSkipV < g_slimbr_obRetV - _Point) ? 1 : 0)
                              : ((g_slimbr_obSkipV > g_slimbr_obRetV + _Point) ? 1 : 0);
            string slbr_cv_ob = StringFormat("[SRJ-EA] SLIMBRCARVE bar=%s site=S5 limb=OB ret=%s newerShift=%d newerT=%s newerWick=%s newerFlag=%d newerBody=%s wickMoreExt=%d bodyThru=%d",
                      TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
                      DoubleToString(g_slimbr_obRetV, _Digits),
                      g_slimbr_obSkipS, SlimbShiftT(g_slimbr_obSkipS),
                      DoubleToString(g_slimbr_obSkipV, _Digits),
                      g_slimbr_obSkipF, g_slimbr_obBodyS,
                      carveWickOB, g_slimbr_obBodyThru);
            LwAudit("SLIMBRCARVE", slbr_cv_ob);
            Print(slbr_cv_ob);
            g_slimbr_carveOB++;
           }
         if(slimbr_fresh && slimbr_fc == "CARVEOUT_FIRED")
           {
            int carveWickFR = (g_dir == DIR_LONG)
                              ? ((g_slimbr_frSkipV < g_slimbr_frRetV - _Point) ? 1 : 0)
                              : ((g_slimbr_frSkipV > g_slimbr_frRetV + _Point) ? 1 : 0);
            string slbr_cv_fr = StringFormat("[SRJ-EA] SLIMBRCARVE bar=%s site=S5 limb=FR ret=%s newerShift=%d newerT=%s newerWick=%s newerFlag=%d newerBody=%s wickMoreExt=%d bodyThru=%d",
                      TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
                      DoubleToString(g_slimbr_frRetV, _Digits),
                      g_slimbr_frSkipS, SlimbShiftT(g_slimbr_frSkipS),
                      DoubleToString(g_slimbr_frSkipV, _Digits),
                      g_slimbr_frSkipF, g_slimbr_frBodyS,
                      carveWickFR, g_slimbr_frBodyThru);
            LwAudit("SLIMBRCARVE", slbr_cv_fr);
            Print(slbr_cv_fr);
            g_slimbr_carveFR++;
           }
         if(g_slimbr_decisionN < 64)
           {
            double slimbr_minSurv = 1e9;
            double slimbr_rs[5];
            slimbr_rs[0] = slimbr_rT; slimbr_rs[1] = slimbr_rB; slimbr_rs[2] = slimbr_rN;
            slimbr_rs[3] = slimbr_rFB; slimbr_rs[4] = slimbr_rFN;
            for(int slimbr_ri = 0; slimbr_ri < 5; slimbr_ri++)
               if(slimbr_rs[slimbr_ri] >= InpMinRewardRisk && slimbr_rs[slimbr_ri] < slimbr_minSurv)
                  slimbr_minSurv = slimbr_rs[slimbr_ri];
            string slimbr_margin = "";
            if(slimbr_minSurv <= InpMinRewardRisk + 0.10)
               slimbr_margin = " NOTE=MARGIN_ROW";
             g_slimbr_decision += StringFormat("bar=%s dir=%s entry=%s tp=%s today=%.2f base=%.2f nuance=%.2f fractal=%.2f fractalNuance=%.2f ext1=%.2f survExt1=%d class=%s fracClass=%s%s",
                      TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                      DoubleToString(currentPrice, _Digits), DoubleToString(tpTarget, _Digits),
                      slimbr_rT, slimbr_rB, slimbr_rN, slimbr_rFB, slimbr_rFN, e35_r, e35_surv,
                      slimbr_c, slimbr_fc, slimbr_margin) + "\n";
             g_slimbr_decisionN++;
            }
          //--- [P-SLDEF-2 E23] SLADDER: anchor-free rung census at S5 (print-
          //--- only; no selection, reference or verdict reads it). Enumerates
          //--- the protective-side swing buffer outward from the ENTRY bar
          //--- (this invocation's barShift), rungs 0..7. rungSlot = raw slot
          //--- distance from the entry bar (s - barShift, gaps included);
          //--- rungExt = index among rungs strictly more extreme (px) than
          //--- every rung inside (-1 otherwise; rung 0 is extreme by
          //--- definition, so rungExt is monotone by construction).
          //--- Protective-side test is against the row's live entry
          //--- (currentPrice), the same price rungR uses. imbCode 3 is
          //--- REPORTED, never applied: nothing is filtered, walked or
          //--- terminated here. rungR = |tp-entry|/|entry-px|, direction-
          //--- invariant magnitude; protective validity is NOT asserted.
          //--- distPts = (px - slRef) in points (SLIMBR sign convention).
          //--- isOBSwing: buffer-39 OB-swing-time read at the rung's own
          //--- eval shift equals the rung's price-bar time. isFracAnchor:
          //--- rung shift equals the post-guard fractal anchor; ladFresh=0
          //--- (stale walk shadows) forces 0. exceedsPrev vs the previous
          //--- RUNG: B = body strictly more extreme (body-through
          //--- equivalent), else W = wick strictly more extreme, else N;
          //--- rung 0 = N. Ties in nearest-rung search resolve inward.
          datetime ladBarT = iTime(_Symbol, PERIOD_CURRENT, barShift);
          int ladSwingBuf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
          int ladImbBuf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB;
          int ladFresh = slimbr_fresh ? 1 : 0;
          int ladGuardS = slimbr_fresh ? g_slimbr_fracGuardS : -1;
           double ladTpD = MathAbs(tpTarget - currentPrice);
           //--- [P-SLDEF-4 E31] rescope + derived window. refIsRung witnesses
           //--- the reference's own slot in the swing buffer (1 = occupied,
           //--- 0 = empty, -1 = slotless echo); refWalkSteps is the limb's
           //--- walked steps beside it (-1 = unattributable: stale or
           //--- slotless). Obligated = slot>=0 && isRung=1 && steps>0.
           //--- Zero-step OB extremes take REF_OB_DEEP below, never a
           //--- coverage failure; slotless echoes take nothing. A walk that
           //--- reached a non-swing (slot>=0 && isRung=0 && steps>0) halts
           //--- the ROW with operands (print-only refusal: the ladder, MATCH
           //--- and correspondence lines for that row are withheld; selection
           //--- and verdict are untouched).
           int wFHave = (slimbr_fresh && g_slimbr_fracClass != "UNRESOLVED") ? 1 : 0;
           int wTodaySlot = slimbr_fresh ? g_slimbr_startShift : -1;
           int wBaseSlot = slimbr_fresh ? g_slimbr_obBaseS : -1;
           int wNuanceSlot = slimbr_fresh ? g_slimbr_obNuanceS : -1;
           int wFracSlot = wFHave ? g_slimbr_frBaseS : -1;
           int wFracNuSlot = wFHave ? g_slimbr_frNuanceS : -1;
           int wAnchorSlot = wFHave ? g_slimbr_fracGuardS : -1;
           int wTodaySteps = (wTodaySlot >= 0) ? g_slimbr_obSteps : -1;
           int wBaseSteps = (wBaseSlot >= 0) ? g_slimbr_obSteps : -1;
           int wNuanceSteps = (wNuanceSlot >= 0) ? g_slimbr_obSteps : -1;
           int wFracSteps = (wFracSlot >= 0) ? g_slimbr_frSteps : -1;
           int wFracNuSteps = (wFracNuSlot >= 0) ? g_slimbr_frSteps : -1;
           int wAnchorSteps = (wAnchorSlot >= 0) ? g_slimbr_frSteps : -1;
           int wTodayIsRung = SrjRefIsRung(wTodaySlot, ladSwingBuf);
           int wBaseIsRung = SrjRefIsRung(wBaseSlot, ladSwingBuf);
           int wNuanceIsRung = SrjRefIsRung(wNuanceSlot, ladSwingBuf);
           int wFracIsRung = SrjRefIsRung(wFracSlot, ladSwingBuf);
           int wFracNuIsRung = SrjRefIsRung(wFracNuSlot, ladSwingBuf);
           int wAnchorIsRung = SrjRefIsRung(wAnchorSlot, ladSwingBuf);
           int wObT = (wTodaySlot >= 0 && wTodayIsRung == 1 && wTodaySteps > 0) ? 1 : 0;
           int wObB = (wBaseSlot >= 0 && wBaseIsRung == 1 && wBaseSteps > 0) ? 1 : 0;
           int wObN = (wNuanceSlot >= 0 && wNuanceIsRung == 1 && wNuanceSteps > 0) ? 1 : 0;
           int wObF = (wFracSlot >= 0 && wFracIsRung == 1 && wFracSteps > 0) ? 1 : 0;
           int wObFN = (wFracNuSlot >= 0 && wFracNuIsRung == 1 && wFracNuSteps > 0) ? 1 : 0;
           int wObA = (wAnchorSlot >= 0 && wAnchorIsRung == 1 && wAnchorSteps > 0) ? 1 : 0;
           int wRowOk = 1;
           string wRowStatus = "OK";
           string wHaltName = "-"; int wHaltSlot = -1;
           if(wTodaySlot >= 0 && wTodayIsRung == 0 && wTodaySteps > 0) { wHaltName = "today"; wHaltSlot = wTodaySlot; }
           else if(wBaseSlot >= 0 && wBaseIsRung == 0 && wBaseSteps > 0) { wHaltName = "base"; wHaltSlot = wBaseSlot; }
           else if(wNuanceSlot >= 0 && wNuanceIsRung == 0 && wNuanceSteps > 0) { wHaltName = "nuance"; wHaltSlot = wNuanceSlot; }
           else if(wFracSlot >= 0 && wFracIsRung == 0 && wFracSteps > 0) { wHaltName = "frac"; wHaltSlot = wFracSlot; }
           else if(wFracNuSlot >= 0 && wFracNuIsRung == 0 && wFracNuSteps > 0) { wHaltName = "fracNu"; wHaltSlot = wFracNuSlot; }
           else if(wAnchorSlot >= 0 && wAnchorIsRung == 0 && wAnchorSteps > 0) { wHaltName = "anchor"; wHaltSlot = wAnchorSlot; }
           if(wHaltName != "-") { wRowOk = 0; wRowStatus = "HALT_E31_1"; }
           //--- derived window (E31.3): origin at the entry bar, span to the
           //--- deepest obligated slot plus the stated margin, floored at the
           //--- legacy 500 so non-extended rows enumerate byte-identical
           //--- ladders. Rung arrays hold rungs (never slots), so a wider
           //--- window costs iterations only.
           int wDeepest = -1;
           if(wObT == 1 && wTodaySlot > wDeepest) wDeepest = wTodaySlot;
           if(wObB == 1 && wBaseSlot > wDeepest) wDeepest = wBaseSlot;
           if(wObN == 1 && wNuanceSlot > wDeepest) wDeepest = wNuanceSlot;
           if(wObF == 1 && wFracSlot > wDeepest) wDeepest = wFracSlot;
           if(wObFN == 1 && wFracNuSlot > wDeepest) wDeepest = wFracNuSlot;
           if(wObA == 1 && wAnchorSlot > wDeepest) wDeepest = wAnchorSlot;
           int wNeed = wDeepest + SRJ_LAD_MARGIN_SLOTS;
           int wLimit = wNeed;
           if(wLimit < 500) wLimit = 500;
           int wLimitHit = 0;
           if(wNeed > SRJ_LAD_ABS_SLOT_CAP) { wLimit = SRJ_LAD_ABS_SLOT_CAP; wLimitHit = 1; }
           int wWalkOB0 = slimbr_fresh ? g_slimbr_startShift : -1;
           int wWalkFR0 = wFHave ? g_slimbr_fracGuardS : -1;
           //--- E31.5: an obligated slot past the effective window halts the
           //--- row with both windows (reachable only when truncated: the
           //--- derived span covers every obligated slot by construction).
           //--- "The walk read" = the walk's produced reference slots, not
           //--- every scanned slot (the walk's 500-span legitimately exceeds
           //--- any ladder window on unobligated ground).
           if(wRowOk == 1)
             {
              int wStranded = -1;
              if(wObT == 1 && wTodaySlot > barShift + wLimit) wStranded = wTodaySlot;
              else if(wObB == 1 && wBaseSlot > barShift + wLimit) wStranded = wBaseSlot;
              else if(wObN == 1 && wNuanceSlot > barShift + wLimit) wStranded = wNuanceSlot;
              else if(wObF == 1 && wFracSlot > barShift + wLimit) wStranded = wFracSlot;
              else if(wObFN == 1 && wFracNuSlot > barShift + wLimit) wStranded = wFracNuSlot;
              else if(wObA == 1 && wAnchorSlot > barShift + wLimit) wStranded = wAnchorSlot;
              if(wStranded >= 0) { wRowOk = 0; wRowStatus = "HALT_E31_5"; wHaltSlot = wStranded; }
             }
           //--- [P-SLDEF-4 E32] decision-row claim for this S5 row (labels
           //--- only; the firing flag is set at the PASS site below).
           int ladDecIdx = -1;
           int ladETaken[3]; ladETaken[0] = 0; ladETaken[1] = 0; ladETaken[2] = 0;
           if(wRowOk == 1 && g_dec_n < SRJ_DEC_MAXROWS)
             {
              ladDecIdx = g_dec_n; g_dec_n++;
              g_dec_barT[ladDecIdx] = ladBarT;
              g_dec_dir[ladDecIdx] = (g_dir == DIR_LONG) ? 1 : -1;
              g_dec_covers[ladDecIdx] = 0;
              g_dec_rungs[ladDecIdx] = 0;
              g_dec_fired[ladDecIdx] = 0;
              g_dec_sHave[ladDecIdx] = 0; g_dec_eHave[ladDecIdx] = 0;
              g_dec_mStatus[ladDecIdx] = "NOLEVEL_FILED";
              g_dec_mLevel[ladDecIdx] = 0.0; g_dec_mRung[ladDecIdx] = -1;
              g_dec_mSlot[ladDecIdx] = -1; g_dec_mExt[ladDecIdx] = -1;
              g_dec_mResid[ladDecIdx] = 0; g_dec_mT[ladDecIdx] = "-";
              g_dec_mPx[ladDecIdx] = 0.0; g_dec_mR[ladDecIdx] = 0.0;
             }
           //--- [P-SLDEF-3 E27] coverage bound replaces the rung count: the
          //--- ladder runs until its deepest rung sits strictly beyond every
          //--- genuine reference printed for the row (values, protective
          //--- side), or the hard slot bound stops it. Rung count is an
          //--- output. Arrays sized past the slot bound (500 slots max).
           int ladFHave = (slimbr_fresh && g_slimbr_fracClass != "UNRESOLVED") ? 1 : 0;
           //--- [P-SLDEF-4 E31] cover target over the rung-obligated subset
           //--- only (rescope): the most protective obligated value. An empty
           //--- obligated set (zero-step rows such as 9/08) covers vacuously
           //--- (ladCovered seeds 1 with no target below).
           double wCoverV[6]; int wCoverN = 0;
           if(wObT == 1) { wCoverV[wCoverN] = slRef; wCoverN++; }
           if(wObB == 1) { wCoverV[wCoverN] = g_slimbr_base; wCoverN++; }
           if(wObN == 1) { wCoverV[wCoverN] = g_slimbr_nuance; wCoverN++; }
           if(wObF == 1) { wCoverV[wCoverN] = g_slimbr_fracBase; wCoverN++; }
           if(wObFN == 1) { wCoverV[wCoverN] = g_slimbr_fracNuance; wCoverN++; }
           if(wObA == 1) { wCoverV[wCoverN] = g_slimbr_frRetV; wCoverN++; }
           //--- [P-SLDEF-5 E35/gate 9] ext1 joins the cover target (obligated
           //--- by construction when defined); ladObligN counts the six walk
           //--- refs (rider sense), so an empty six-set still names VACUOUS.
           int wCoverX1 = (e35_def == 1) ? 1 : 0;
           int wCoverTot = wCoverN + wCoverX1;
           double ladCoverT = 0.0;
           if(wCoverTot > 0)
             {
              ladCoverT = (wCoverX1 == 1) ? e35_px : wCoverV[0];
              for(int wci = 0; wci < wCoverN; wci++)
                 {
                  if(g_dir == DIR_LONG) { if(wCoverV[wci] < ladCoverT) ladCoverT = wCoverV[wci]; }
                  else { if(wCoverV[wci] > ladCoverT) ladCoverT = wCoverV[wci]; }
                 }
             }
          double ladRungPx[512]; int ladRungSlot[512]; int ladRungExt[512]; datetime ladRungBT[512]; int ladRungShift[512];
          int ladRungN = 0;
           int ladCovered = (wCoverTot == 0) ? 1 : 0, ladCapHit = 0;
          int ladS = barShift;
          double ladBest = 0.0; int ladExtN = 0;
          double ladPrevWick = 0.0, ladPrevBody = 0.0;
           for(; ladS <= barShift + wLimit && ladRungN < 512 && wRowOk == 1; ladS++)
            {
             double ladV = 0.0;
             if(!ReadFlow(ladSwingBuf, ladV, ladS)) break;
             if(ladV == EMPTY_VALUE || ladV <= 0.0) continue;
             if(!SlimbProtectiveSideOk(g_dir, ladV, currentPrice)) continue;
             int ladAp = ApexShift(ladS);
             double ladO = iOpen(_Symbol, PERIOD_CURRENT, ladAp);
             double ladC = iClose(_Symbol, PERIOD_CURRENT, ladAp);
             double ladWick = (g_dir == DIR_LONG) ? iLow(_Symbol, PERIOD_CURRENT, ladAp)
                                                  : iHigh(_Symbol, PERIOD_CURRENT, ladAp);
             double ladBody = (g_dir == DIR_LONG) ? MathMin(ladO, ladC) : MathMax(ladO, ladC);
             double ladF = 0.0; int ladImb = -1;
             if(ReadFlow(ladImbBuf, ladF, ladS) && ladF != EMPTY_VALUE) ladImb = (int)ladF;
             string ladExc = "N";
             if(ladRungN > 0)
               {
                bool ladBodyExt = (g_dir == DIR_LONG) ? (ladBody < ladPrevBody - _Point)
                                                      : (ladBody > ladPrevBody + _Point);
                bool ladWickExt = (g_dir == DIR_LONG) ? (ladWick < ladPrevWick - _Point)
                                                      : (ladWick > ladPrevWick + _Point);
                ladExc = ladBodyExt ? "B" : (ladWickExt ? "W" : "N");
               }
             int ladExt = -1;
             if(ladRungN == 0) { ladExt = 0; ladBest = ladV; ladExtN = 1; }
             else
               {
                bool ladMoreExt = (g_dir == DIR_LONG) ? (ladV < ladBest - _Point)
                                                      : (ladV > ladBest + _Point);
                if(ladMoreExt) { ladExt = ladExtN; ladExtN++; ladBest = ladV; }
               }
             int ladDist = (int)MathRound((ladV - slRef) / _Point);
             double ladRisk = MathAbs(currentPrice - ladV);
             double ladR = (ladRisk > 0.0 ? ladTpD / ladRisk : 0.0);
             datetime ladBt = iTime(_Symbol, PERIOD_CURRENT, ladAp);
             double ladObt = 0.0; int ladIsOB = 0;
             if(ReadFlow(FL_BUF_OB_SWING_TIME, ladObt, ladS) && ladObt > 0.0 && (datetime)ladObt == ladBt) ladIsOB = 1;
             int ladIsAnchor = (ladFresh == 1 && ladS == ladGuardS) ? 1 : 0;
             int ladIsToday = (ladV == slRef) ? 1 : 0;
             string ladLine = StringFormat("[SRJ-EA] SLADDER fields=19 bar=%s site=S5 dir=%s rung=%d rungSlot=%d rungExt=%d shift=%d shiftT=%s barTime=%s px=%s wick=%s body=%s imbCode=%d exceedsPrev=%s distPts=%d rungR=%.2f isOBSwing=%d isFracAnchor=%d isTodayRef=%d ladFresh=%d",
                       TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                       ladRungN, ladS - barShift, ladExt, ladS, SlimbShiftT(ladS),
                       TimeToString(ladBt, TIME_DATE|TIME_MINUTES),
                       DoubleToString(ladV, _Digits), DoubleToString(ladWick, _Digits),
                       DoubleToString(ladBody, _Digits),
                       ladImb, ladExc, ladDist, ladR, ladIsOB, ladIsAnchor, ladIsToday, ladFresh);
              LwAudit("SLADDER", ladLine);
              Print(ladLine);
              //--- [P-SLDEF-5 E38] mark-up table as its own audited class:
              //--- every ladder rung in mark-up columns (evidence, not an ask).
              string ladMark = StringFormat("[SRJ-EA] SLADMARK fields=11 bar=%s site=S5 dir=%s rung=%d slot=%d rungExt=%d barTime=%s px=%s imbCode=%d distPts=%d rungR=%.2f",
                       TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                       ladRungN, ladS - barShift, ladExt,
                       TimeToString(ladBt, TIME_DATE|TIME_MINUTES),
                       DoubleToString(ladV, _Digits), ladImb, ladDist, ladR);
              LwAudit("SLADMARK", ladMark);
              Print(ladMark);
              //--- [P-SLDEF-4 E32] decision capture (labels only): slot-order
              //--- rungs 0..2 plus the first rung at each ext 0..2.
              if(ladDecIdx >= 0)
                {
                 if(ladRungN < 3)
                   {
                    g_dec_sSlot[ladDecIdx][ladRungN] = ladS - barShift;
                    g_dec_sExt[ladDecIdx][ladRungN] = ladExt;
                    g_dec_sBT[ladDecIdx][ladRungN] = ladBt;
                    g_dec_sPx[ladDecIdx][ladRungN] = ladV;
                    g_dec_sWick[ladDecIdx][ladRungN] = ladWick;
                    g_dec_sBody[ladDecIdx][ladRungN] = ladBody;
                    g_dec_sImb[ladDecIdx][ladRungN] = ladImb;
                    g_dec_sDist[ladDecIdx][ladRungN] = ladDist;
                    g_dec_sR[ladDecIdx][ladRungN] = ladR;
                   }
                 if(ladExt >= 0 && ladExt < 3 && ladETaken[ladExt] == 0)
                   {
                    ladETaken[ladExt] = 1;
                    g_dec_eSlot[ladDecIdx][ladExt] = ladS - barShift;
                    g_dec_eExt[ladDecIdx][ladExt] = ladExt;
                    g_dec_eBT[ladDecIdx][ladExt] = ladBt;
                    g_dec_ePx[ladDecIdx][ladExt] = ladV;
                    g_dec_eWick[ladDecIdx][ladExt] = ladWick;
                    g_dec_eBody[ladDecIdx][ladExt] = ladBody;
                    g_dec_eImb[ladDecIdx][ladExt] = ladImb;
                    g_dec_eDist[ladDecIdx][ladExt] = ladDist;
                    g_dec_eR[ladDecIdx][ladExt] = ladR;
                   }
                }
              ladRungPx[ladRungN] = ladV; ladRungSlot[ladRungN] = ladS - barShift;
             ladRungExt[ladRungN] = ladExt; ladRungBT[ladRungN] = ladBt;
             ladRungShift[ladRungN] = ladS;
             ladRungN++;
             ladPrevWick = ladWick; ladPrevBody = ladBody;
              //--- coverage: stop at the first rung strictly beyond every
              //--- OBLIGATED reference (1-point separation idiom, walk
              //--- convention). Empty obligated sets enumerate the whole
              //--- window (no target, no break). Stale shadows cannot prove
              //--- coverage. [P-SLDEF-4 E31 defect fix 2026-09-13: the guard
              //--- overlooked RECON15-9/08 broke on ladCoverT=0.0.]
              if(slimbr_fresh && wCoverTot > 0 && wRowOk == 1)
               {
                bool ladBeyond = (g_dir == DIR_LONG) ? (ladV < ladCoverT - _Point)
                                                     : (ladV > ladCoverT + _Point);
                if(ladBeyond) { ladCovered = 1; break; }
               }
            }
           if(ladS > barShift + wLimit || ladRungN >= 512) ladCapHit = 1;
           if(ladRungN >= 512) wLimitHit = 1;
           //--- halted rows print covers 0 (the withheld row proves nothing).
           int ladCovers = (slimbr_fresh && ladCovered == 1 && wRowOk == 1) ? 1 : 0;
           int ladDeepest = (ladRungN > 0) ? ladRungSlot[ladRungN - 1] : -1;
           if(wLimitHit == 1 && wRowStatus == "OK") wRowStatus = "UNCOVERED_READ_LIMIT";
           //--- [P-SLDEF-5 E38/gate 9] empty six-set names VACUOUS_COVER (the
           //--- row still covers against ext1; the name scopes the claim).
           if(slimbr_fresh && wCoverN == 0 && wRowStatus == "OK") wRowStatus = "VACUOUS_COVER";
           //--- [P-SLDEF-4 E32] decision-row levels known post-loop.
           if(ladDecIdx >= 0)
             {
              g_dec_covers[ladDecIdx] = ladCovers;
              g_dec_rungs[ladDecIdx] = ladRungN;
              g_dec_sHave[ladDecIdx] = (ladRungN < 3) ? ladRungN : 3;
              g_dec_eHave[ladDecIdx] = ladETaken[0] + ladETaken[1] + ladETaken[2];
             }
          //--- [P-SLDEF-2 E24] SLADDER_MATCH: operator levels resolved to
          //--- rungs, one line per S5 row. Filed before the run: 2026.09.07
          //--- -> 1.16240, 2026.09.04 -> 1.15907. MATCH = residual exactly 0
          //--- points; else NOMATCH naming the nearest rung. Levels are NEVER
          //--- adjusted: NOMATCH is a finding, not a failure. todayRung names
          //--- the rung holding today's stop (nearest on ties), or
          //--- TODAY_OFF_LADDER with slRef's residual to the nearest rung.
          string ladDate = StringSubstr(TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), 0, 10);
          double ladLevel = 0.0; bool ladHaveLevel = false;
          if(ladDate == "2026.09.07") { ladLevel = 1.16240; ladHaveLevel = true; }
          else if(ladDate == "2026.09.04") { ladLevel = 1.15907; ladHaveLevel = true; }
          int ladTodayRung = -1; int ladTodayResid = 0;
          if(ladRungN > 0)
            {
             ladTodayRung = 0;
             ladTodayResid = (int)MathRound((slRef - ladRungPx[0]) / _Point);
             for(int ladK = 1; ladK < ladRungN; ladK++)
               {
                int ladRk = (int)MathRound((slRef - ladRungPx[ladK]) / _Point);
                if(MathAbs(ladRk) < MathAbs(ladTodayResid)) { ladTodayResid = ladRk; ladTodayRung = ladK; }
               }
            }
          string ladTodayTok = (ladRungN <= 0) ? "NO_RUNGS"
                             : ((ladTodayResid == 0) ? "ON_LADDER" : "TODAY_OFF_LADDER");
          string ladStatus = "NOLEVEL_FILED"; string ladLvlTok = "-";
          int ladMRung = -1, ladMSlot = 0, ladMExt = -1, ladMResid = 0; string ladMT = "-";
           if(wRowOk == 1 && ladHaveLevel)
             {
              ladLvlTok = DoubleToString(ladLevel, _Digits);
             if(ladRungN <= 0) ladStatus = "NOMATCH_NO_RUNGS";
             else
               {
                ladMRung = 0;
                ladMResid = (int)MathRound((ladLevel - ladRungPx[0]) / _Point);
                for(int ladK = 1; ladK < ladRungN; ladK++)
                  {
                   int ladRk = (int)MathRound((ladLevel - ladRungPx[ladK]) / _Point);
                   if(MathAbs(ladRk) < MathAbs(ladMResid)) { ladMResid = ladRk; ladMRung = ladK; }
                  }
                ladMSlot = ladRungSlot[ladMRung]; ladMExt = ladRungExt[ladMRung];
                ladMT = TimeToString(ladRungBT[ladMRung], TIME_DATE|TIME_MINUTES);
                ladStatus = (ladMResid == 0) ? "MATCH" : "NOMATCH";
               }
            }
           //--- [P-SLDEF-4 E32] matched-rung price + R for the decision row.
           if(ladDecIdx >= 0 && ladHaveLevel)
             {
              g_dec_mStatus[ladDecIdx] = ladStatus;
              g_dec_mLevel[ladDecIdx] = ladLevel;
              g_dec_mRung[ladDecIdx] = ladMRung;
              g_dec_mSlot[ladDecIdx] = ladMSlot;
              g_dec_mExt[ladDecIdx] = ladMExt;
              g_dec_mResid[ladDecIdx] = ladMResid;
              g_dec_mT[ladDecIdx] = ladMT;
              if(ladMRung >= 0)
                {
                 double decMPx = ladRungPx[ladMRung];
                 g_dec_mPx[ladDecIdx] = decMPx;
                 double decMRisk = MathAbs(currentPrice - decMPx);
                 g_dec_mR[ladDecIdx] = (decMRisk > 0.0 ? ladTpD / decMRisk : 0.0);
                }
             }
           if(wRowOk == 1)
             {
              string ladMatch = StringFormat("[SRJ-EA] SLADDER_MATCH fields=14 bar=%s site=S5 dir=%s rungs=%d todayRung=%d todayRef=%s todayResidPts=%d level=%s status=%s rung=%d rungSlot=%d rungExt=%d rungT=%s residPts=%d",
                     TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                     ladRungN, ladTodayRung, ladTodayTok, ladTodayResid,
                     ladLvlTok, ladStatus, ladMRung, ladMSlot, ladMExt, ladMT, ladMResid);
              LwAudit("SLADDER_MATCH", ladMatch);
              Print(ladMatch);
             }
           //--- [P-SLDEF-5 E35/E37/E39/E40] ext-1 shadow line: six-reference
           //--- extremity indices, filed level + provenance, residual AND bar
           //--- difference, four-token verdict, full-precision operands, and
           //--- the NONE-row OB-extreme witness. Print-only grading surface.
           if(wRowOk == 1)
             {
              int xiT = SrjExtIndexOf(wTodaySlot, ladRungShift, ladRungExt, ladRungN);
              int xiB = SrjExtIndexOf(wBaseSlot, ladRungShift, ladRungExt, ladRungN);
              int xiN = SrjExtIndexOf(wNuanceSlot, ladRungShift, ladRungExt, ladRungN);
              int xiF = SrjExtIndexOf(wFracSlot, ladRungShift, ladRungExt, ladRungN);
              int xiFN = SrjExtIndexOf(wFracNuSlot, ladRungShift, ladRungExt, ladRungN);
              int xiA = SrjExtIndexOf(wAnchorSlot, ladRungShift, ladRungExt, ladRungN);
              string xT = (xiT < 0) ? "NONE" : IntegerToString(xiT);
              string xB = (xiB < 0) ? "NONE" : IntegerToString(xiB);
              string xN = (xiN < 0) ? "NONE" : IntegerToString(xiN);
              string xF = (xiF < 0) ? "NONE" : IntegerToString(xiF);
              string xFN = (xiFN < 0) ? "NONE" : IntegerToString(xiFN);
              string xA = (xiA < 0) ? "NONE" : IntegerToString(xiA);
              g_slext_todayXi = xT;
              double fPx = 0.0; string fProv = "-"; string fT = "-";
              bool fHave = SrjFiledLevel(TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), fPx, fProv, fT);
              int eResid = 0; int eBarDiff = -999; string eVerd = "NOLEVEL";
              if(e35_def == 0) eVerd = "UNDEFINED";
              else if(fHave)
                {
                 eResid = (int)MathRound((e35_px - fPx) / _Point);
                 if(fT != "-") eBarDiff = (int)((e35_bt - StringToTime(fT)) / 300);
                 if(fProv == "INFERRED") eVerd = (MathAbs(eResid) <= 1) ? "PROVISIONAL_MATCH" : "MISS";
                 else eVerd = (eResid == 0) ? "MATCH" : ((MathAbs(eResid) <= 1) ? "ABSORBED" : "MISS");
                }
              int eNoneSlot = -1; string eNoneT = "-"; int eNoneAge = -1;
              //--- positive-aging: slots older than the entry bar are larger
              //--- (REF_OB_DEEP slotDist convention).
              if(xT == "NONE" && wTodaySlot >= 0)
                { eNoneSlot = wTodaySlot; eNoneT = SlimbShiftT(wTodaySlot); eNoneAge = wTodaySlot - barShift; }
              double eTodayRisk = MathAbs(currentPrice - slRef);
              double eRewardPts = slimbr_tpD / _Point;
              double eRiskPts = eTodayRisk / _Point;
              int eOut = (int)MathRound(((g_dir == DIR_LONG) ? -(e35_px - slRef) : (e35_px - slRef)) / _Point);
              if(e35_def == 1)
                { if(eOut > 0) g_slext_outP++; else if(eOut < 0) g_slext_outN++; else g_slext_outZ++; }
              string eLine = StringFormat("[SRJ-EA] SLEXT1 fields=29 bar=%s site=S5 dir=%s ext1Defined=%d slExt1=%s ext1Slot=%d ext1BarTime=%s ext1Imb=%d deltaExt1Pts=%d outwardExt1Pts=%d deepestExt=%d todayXi=%s baseXi=%s nuanceXi=%s fracXi=%s fracNuXi=%s anchorXi=%s filedPx=%s filedProv=%s filedT=%s residPts=%d barDiffBars=%d verdict=%s noneSlot=%d noneT=%s noneAgeBars=%d rewardPts=%.5f riskPts=%.5f ext1RewardPts=%.5f ext1RiskPts=%.5f",
                       TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                       e35_def, (e35_def == 1) ? DoubleToString(e35_px, _Digits) : "-",
                       e35_slot, (e35_def == 1) ? TimeToString(e35_bt, TIME_DATE|TIME_MINUTES) : "-",
                       e35_imb, (e35_def == 1) ? (int)MathRound((e35_px - slRef) / _Point) : 0,
                       (e35_def == 1) ? eOut : 0, e35_deep,
                       xT, xB, xN, xF, xFN, xA,
                       fHave ? DoubleToString(fPx, _Digits) : "-", fHave ? fProv : "-", fHave ? fT : "-",
                       eResid, eBarDiff, eVerd,
                       eNoneSlot, eNoneT, eNoneAge,
                       eRewardPts, eRiskPts, g_slext_rewardPts, g_slext_riskPts);
              LwAudit("SLEXT1", eLine);
              Print(eLine);
              if(eVerd == "MISS")
                {
                 string eHalt = StringFormat("[SRJ-EA] SLEXT6HALT bar=%s dir=%s filedPx=%s filedProv=%s slExt1=%s residPts=%d",
                           TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                           DoubleToString(fPx, _Digits), fProv, DoubleToString(e35_px, _Digits), eResid);
                 LwAudit("SLEXT6HALT", eHalt);
                 Print(eHalt);
                }
               //--- [P-SLDEF-6 E45.1/E45.2] token-split status row: OFF_LADDER
               //--- vs EXT_NONE distinct; noneAge only on OFF_LADDER with slot
               //--- and barTime; VACUOUS_COVER + EXT1_UNCOVERED name the 9/08
               //--- shape. Print-only; SLEXT1 verdict tokens untouched.
               string sl45_extS = (e35_def == 1) ? "EXT_DEFINED" : "EXT_NONE";
               string sl45_todayS = "ON_LADDER";
               if(ladRungN <= 0) sl45_todayS = "NO_RUNGS";
               else if(xT == "NONE") sl45_todayS = "OFF_LADDER";
               int sl45_noneSlot = -1; string sl45_noneT = "-"; int sl45_noneAge = -1;
               if(sl45_todayS == "OFF_LADDER" && wTodaySlot >= 0)
                 { sl45_noneSlot = wTodaySlot; sl45_noneT = SlimbShiftT(wTodaySlot); sl45_noneAge = wTodaySlot - barShift; }
               else if(e35_def == 0 && wTodaySlot >= 0)
                 { sl45_noneSlot = wTodaySlot; sl45_noneT = SlimbShiftT(wTodaySlot); }
               string sl45_vacS = (wRowStatus == "VACUOUS_COVER") ? "VACUOUS_COVER" : "-";
               string sl45_covS = (ladCovers == 1) ? "COVERED" : "EXT1_UNCOVERED";
               string sl45_line = StringFormat("[SRJ-EA] SLEXT45 fields=10 bar=%s site=S5 dir=%s extStatus=%s todayStatus=%s noneSlot=%d noneT=%s noneAgeBars=%d vacStatus=%s coverStatus=%s ladObligN=%d",
                         TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                         sl45_extS, sl45_todayS, sl45_noneSlot, sl45_noneT, sl45_noneAge,
                         sl45_vacS, sl45_covS, wCoverN);
               LwAudit("SLEXT45", sl45_line);
               Print(sl45_line);
             }
          //--- [P-SLDEF-3 E28] slot-identity correspondence, one line per S5
          //--- row. Correspondence is by SLOT, never by price proximity: a
          //--- rung at the reference's own originating slot, price residual
          //--- as cross-check (0 required, gate 7). -1 slot = the path
          //--- exposes no genuine slot (OB todayRef known case; exhausted /
          //--- unevaluated fractal echoes). -999 residual = unevaluable.
          //--- FRAC_OFF counts fractal refs (frac/fracNuance/anchor) with a
          //--- slot but no same-slot rung (frame defect, gate 6 halts);
          //--- TODAY_OFF stays the authorised OB finding, consistent with
          //--- SLADDER_MATCH todayRef above (MATCH logic untouched).
          string corrBarT = TimeToString(ladBarT, TIME_DATE|TIME_MINUTES);
          int cTodaySlot = slimbr_fresh ? g_slimbr_startShift : -1;
          int cBaseSlot = slimbr_fresh ? g_slimbr_obBaseS : -1;
          int cNuanceSlot = slimbr_fresh ? g_slimbr_obNuanceS : -1;
          int cFracSlot = ladFHave ? g_slimbr_frBaseS : -1;
          int cFracNuSlot = ladFHave ? g_slimbr_frNuanceS : -1;
          int cAnchorSlot = ladFHave ? g_slimbr_fracGuardS : -1;
          double cBaseV = slimbr_fresh ? g_slimbr_base : 0.0;
          double cNuanceV = slimbr_fresh ? g_slimbr_nuance : 0.0;
          double cFracV = ladFHave ? g_slimbr_fracBase : 0.0;
          double cFracNuV = ladFHave ? g_slimbr_fracNuance : 0.0;
          double cAnchorV = ladFHave ? g_slimbr_frRetV : 0.0;
          bool cF = false; int cRS = -1;
          int cTodayRS = SlimbCorrResid(cTodaySlot, slRef, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cTodayFound = cF; int cTodayRungS = cRS;
          int cBaseRS = SlimbCorrResid(cBaseSlot, cBaseV, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cBaseFound = cF; int cBaseRungS = cRS;
          int cNuanceRS = SlimbCorrResid(cNuanceSlot, cNuanceV, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cNuanceFound = cF; int cNuanceRungS = cRS;
          int cFracRS = SlimbCorrResid(cFracSlot, cFracV, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cFracFound = cF; int cFracRungS = cRS;
          int cFracNuRS = SlimbCorrResid(cFracNuSlot, cFracNuV, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cFracNuFound = cF; int cFracNuRungS = cRS;
          int cAnchorRS = SlimbCorrResid(cAnchorSlot, cAnchorV, ladRungShift, ladRungPx, ladRungN, cF, cRS);
          bool cAnchorFound = cF; int cAnchorRungS = cRS;
          int cFracOff = 0;
          if(cFracSlot >= 0 && !cFracFound) cFracOff++;
          if(cFracNuSlot >= 0 && !cFracNuFound) cFracOff++;
          if(cAnchorSlot >= 0 && !cAnchorFound) cFracOff++;
          int cTodayOff = (ladTodayTok == "ON_LADDER") ? 0 : 1;
           //--- halted rows withhold their pairs AND their tallies (E31.1/5).
           if(wRowOk == 1)
             {
              SlimbCorrHist(corrBarT, "today", cTodayFound, cTodayRS, cTodayRungS, cTodaySlot);
              SlimbCorrHist(corrBarT, "base", cBaseFound, cBaseRS, cBaseRungS, cBaseSlot);
              SlimbCorrHist(corrBarT, "nuance", cNuanceFound, cNuanceRS, cNuanceRungS, cNuanceSlot);
              SlimbCorrHist(corrBarT, "frac", cFracFound, cFracRS, cFracRungS, cFracSlot);
              SlimbCorrHist(corrBarT, "fracNu", cFracNuFound, cFracNuRS, cFracNuRungS, cFracNuSlot);
              SlimbCorrHist(corrBarT, "anchor", cAnchorFound, cAnchorRS, cAnchorRungS, cAnchorSlot);
              g_corr_rows++; g_corr_fracOff += cFracOff; g_corr_todayOff += cTodayOff;
             }
          string corrLine = StringFormat("[SRJ-EA] SLADCORR fields=23 bar=%s site=S5 dir=%s ladRungs=%d ladDeepestSlot=%d ladCap=%d ladCapHit=%d ladCovers=%d todayRefSlot=%d baseRefSlot=%d nuanceRefSlot=%d fracRefSlot=%d fracNuanceRefSlot=%d fracAnchorSlot=%d fracAnchorPx=%s todayRS=%d baseRS=%d nuanceRS=%d fracRS=%d fracNuanceRS=%d anchorRS=%d fracOffN=%d todayOffN=%d",
                    corrBarT, DirName(g_dir),
                     ladRungN, ladDeepest, wLimit, ladCapHit, ladCovers,
                    cTodaySlot, cBaseSlot, cNuanceSlot, cFracSlot, cFracNuSlot, cAnchorSlot,
                    ladFHave ? DoubleToString(cAnchorV, _Digits) : "-",
                    cTodayRS, cBaseRS, cNuanceRS, cFracRS, cFracNuRS, cAnchorRS,
                    cFracOff, cTodayOff);
           if(wRowOk == 1)
             {
              LwAudit("SLADCORR", corrLine);
              Print(corrLine);
             }
           //--- [P-SLDEF-4 E31] window + rescope census, one line per S5 row
           //--- (the row's guaranteed line: HALT rows print only this, with
           //--- the offending witness values + haltRef/haltSlot naming the
           //--- halt). Measured pre-write like every shadow line.
           string winLine = StringFormat("[SRJ-EA] SLADWIN fields=28 bar=%s site=S5 dir=%s status=%s todayIsRung=%d baseIsRung=%d nuanceIsRung=%d fracIsRung=%d fracNuIsRung=%d anchorIsRung=%d todaySteps=%d baseSteps=%d nuanceSteps=%d fracSteps=%d fracNuSteps=%d anchorSteps=%d ladWindowStart=%d ladWindowSpan=%d ladReadLimit=%d ladLimitHit=%d ladCovers=%d ladObligN=%d ladRungs=%d ladDeepestSlot=%d walkWinOB=%d+%d walkWinFR=%d+%d haltRef=%s haltSlot=%d",
                     corrBarT, DirName(g_dir), wRowStatus,
                     wTodayIsRung, wBaseIsRung, wNuanceIsRung, wFracIsRung, wFracNuIsRung, wAnchorIsRung,
                     wTodaySteps, wBaseSteps, wNuanceSteps, wFracSteps, wFracNuSteps, wAnchorSteps,
                     barShift, wNeed, wLimit, wLimitHit, ladCovers, wCoverN, ladRungN, ladDeepest,
                     wWalkOB0, 500, wWalkFR0, 500, wHaltName, wHaltSlot);
           LwAudit("SLADWIN", winLine);
           Print(winLine);
           //--- [P-SLDEF-4 E31] zero-step OB extremes take REF_OB_DEEP, never
           //--- a coverage failure. Fractal refs never take this token
           //--- (slotless echoes take nothing; matched frac refs are
           //--- witnessed by the correspondence).
           if(wRowOk == 1 && slimbr_fresh)
             {
              if(wTodaySlot >= 0 && wTodaySteps == 0)
                 SrjDeepEmit(corrBarT, g_dir, "today", wTodaySlot, barShift, slRef, slRef);
              if(wBaseSlot >= 0 && wBaseSteps == 0)
                 SrjDeepEmit(corrBarT, g_dir, "base", wBaseSlot, barShift, g_slimbr_base, slRef);
              if(wNuanceSlot >= 0 && wNuanceSteps == 0)
                 SrjDeepEmit(corrBarT, g_dir, "nuance", wNuanceSlot, barShift, g_slimbr_nuance, slRef);
             }
          }

      double slDist = MathAbs(currentPrice - slRef);
      double tpDist = MathAbs(tpTarget - currentPrice);
      bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);

      //--- [P-CONFIRM-GATE E3/E4] the R latch: measured ONCE at the confirmation
      //--- close (entry = the next open, SL = the swing, TP = the closest line -
      //--- the selector unchanged per the operator's ruling, "whichever is the
      //--- closest"). Tested ONCE below: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL
      //--- with the latch values. NEVER recomputed - single-shot, so latch
      //--- monotonicity holds by construction.
      g_latchedEntry = currentPrice;
      g_latchedSl    = slRef;
      g_latchedTp    = tpTarget;
      g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
      g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);

      //--- [P-CONFIRM-SHADOW] TP_ELECT: what WOULD be latched under the ruled rule
      //--- (entry = the next open, SL = the swing, TP = the closest line - the selector
      //--- unchanged per the operator's ruling, "whichever is the closest"). LOG ONLY -
      //--- the latch itself is build 2+; this prints the would-be values each time the
      //--- gate evaluates, so the calibration shows R at every bar the gate saw.
      if(InpDebugLog && SHADOW_TP_ELECT)
         PrintFormat("[SRJ-EA] TP_ELECT shadow=true entry=%s sl=%s tp=%s R=%.2f "
                     "bar=%s latchBar=%s",
                     DoubleToString(currentPrice, _Digits),
                     DoubleToString(slRef, _Digits),
                     DoubleToString(tpTarget, _Digits),
                     (slDist > 0.0 ? tpDist / slDist : 0.0),
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT,
                                   (barShift >= 1 ? barShift - 1 : 0)),
                                  TIME_DATE|TIME_MINUTES));

      if(!tpOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S5_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
         //--- [P-CONFIRM-GATE E5] TP_RR_FAIL keeps its name; the latch values
         //--- are printed with it (the ruled 1R gate is a hard kill here - the
         //--- latch is never recomputed on a later, more favourable bar).
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] TP_RR_FAIL_LATCH bar=%s dir=%s entry=%s sl=%s tp=%s R=%.2f",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        DirName(g_dir),
                        DoubleToString(g_latchedEntry, _Digits),
                        DoubleToString(g_latchedSl, _Digits),
                        DoubleToString(g_latchedTp, _Digits),
                         g_latchedR);
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "RR_FAIL");
          //--- [P-SLDEF-5 E39] non-firing cost: today's R, today's ext
          //--- index, ext-1 R, full-precision operands, would-fire verdict.
          //--- Print-only; the abort below is untouched.
          if(g_slext_barT == iTime(_Symbol, PERIOD_CURRENT, barShift) && g_slext_defined == 1)
            {
             int nfWould = (g_slext_r >= InpMinRewardRisk) ? 1 : 0;
             if(nfWould == 1)
               { g_slext_newN++; g_slext_newRows += TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES) + ";"; }
             string nfLine = StringFormat("[SRJ-EA] SLNONFIRE fields=11 bar=%s dir=%s outcome=RR_FAIL todayR=%.2f todayXi=%s ext1R=%.2f rewardPts=%.5f riskPts=%.5f ext1RewardPts=%.5f ext1RiskPts=%.5f wouldFire=%d",
                       TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                       DirName(g_dir), (slDist > 0.0 ? tpDist / slDist : 0.0), g_slext_todayXi,
                       g_slext_r, tpDist / _Point, slDist / _Point,
                       g_slext_rewardPts, g_slext_riskPts, nfWould);
             LwAudit("SLNONFIRE", nfLine);
             Print(nfLine);
            }
          GoAbort(ABORT_TP_RR_FAIL, g_state);
          return;
        }

      //--- [P-CONFIRM-GATE E3] the async wait RETIRES (one-bar validity): the
      //--- divergence verdict was decided above at the confirmation close.
      //--- divKind is the LATEST verdict's kind from the unbounded walk - if we
      //--- are here, it is matched by construction (an opposing/absent verdict
      //--- already rolled the candidate back to S4).
      double tpR = (slDist > 0.0) ? (tpDist / slDist) : 0.0;

       //--- [P-SLDEF-4 E33+E32] PASS census, then the firing-row flag: the
       //--- decision row whose barTime matches this passing evaluation fired.
       //--- Print-only; the latch and LogSignal below are untouched.
       SrjOrderEmit(barShift, "PASS");
       datetime ordFireT = iTime(_Symbol, PERIOD_CURRENT, barShift);
       for(int ordF = 0; ordF < g_dec_n; ordF++)
          if(g_dec_barT[ordF] == ordFireT) g_dec_fired[ordF] = 1;
       //--- [P-SLDEF-5 E39/gate 11] lost-signal check: a firing row whose
       //--- ext-1 R misses the threshold would be lost under the candidate.
       //--- Expected zero lines; any line is reported, not absorbed.
       if(g_slext_barT == ordFireT && g_slext_defined == 1)
         {
          double psRisk = MathAbs(currentPrice - g_slext_px);
          double psR = (psRisk > 0.0 ? MathAbs(tpTarget - currentPrice) / psRisk : 0.0);
          if(psR < InpMinRewardRisk)
            {
             g_slext_lostN++;
             g_slext_lostRows += TimeToString(ordFireT, TIME_DATE|TIME_MINUTES) + ";";
             string psLine = StringFormat("[SRJ-EA] SLEXTLOST fields=6 bar=%s dir=%s ext1R=%.2f ext1RewardPts=%.5f ext1RiskPts=%.5f threshold=%.2f",
                       TimeToString(ordFireT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
                       psR, g_slext_rewardPts, g_slext_riskPts, InpMinRewardRisk);
             LwAudit("SLEXTLOST", psLine);
             Print(psLine);
            }
         }
       LogSignal(tpTarget, tpR, slRef, slMode, divKind);

      if(!g_alertedSignal)
        {
         g_alertedSignal = true;
         EmitAlert("SIGNAL",
                   StringFormat("R=%.2f SL %s TP %s spr=%d",
                                tpR,
                                DoubleToString(slRef,    _Digits),
                                DoubleToString(tpTarget, _Digits),
                                (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
                   true);
        }

      //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
      //--- now exists: snapshot the trade into the managed record BEFORE
      //--- ResetSequence (the R-201 ordering discipline). The entry reference IS the
      //--- next candle's open (currentPrice above), so the fill is immediate at that
      //--- open (section 5.5's limit "fills on a wick" - the forming bar's own open
      //--- is the fill tick); the fill candle's own close is then tested like every
      //--- bar ("exit immediately rather than waiting for a subsequent close").
      //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
      //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
      //--- record (spec section 6's blessed London+NY exception would need a
      //--- registry - a separate packet item if it ever fires).
      if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] MTCOLLISION old bar=%s reason=REPLACED by bar=%s",
                        TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES),
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES));
         g_mtrade.state      = MT_CLOSED;
         g_mtrade.exitReason = MT_EXIT_REPLACED;
         g_mtrade.exitBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
        }
      MtReset();
      g_mtrade.active            = true;
      g_mtrade.state             = MT_MANAGING;
      g_mtrade.dir               = g_dir;
      g_mtrade.anchorLine        = g_anchorLine;
      g_mtrade.anchorPrice0      = g_anchorPrice;
      g_mtrade.anchorBarTime     = g_anchorBarTime;
      g_mtrade.sessionAtEntry    = (int)g_sessionAtEntry;
      g_mtrade.entryPrice        = currentPrice;
      g_mtrade.slRef             = slRef;
      g_mtrade.tpRef             = tpTarget;
      g_mtrade.regimeAtAdmission = (int)g_regime;
      g_mtrade.fillBarTime       = iTime(_Symbol, PERIOD_CURRENT, 0);
      g_mtrade.signalBarTime     = iTime(_Symbol, PERIOD_CURRENT, barShift);
      g_mtrade.exitReason        = MT_EXIT_NONE;
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] MTSNAP bar=%s dir=%s anchor=%s entry=%s sl=%s tp=%s regime=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     DirName(g_dir),
                     (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"),
                     DoubleToString(currentPrice, _Digits),
                     DoubleToString(slRef, _Digits),
                     DoubleToString(tpTarget, _Digits),
                     (int)g_regime);

      if(InpMode == MODE_ALERT_ONLY)
        {
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
         ResetSequence();
         return;
        }

      // ------ Phase 2 Execution Logic ------
      long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;

      if(IsSessionPositionOpen(magic))
        { GoAbort(ABORT_CONCURRENCY, g_state); return; }

      double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
      double slDistanceReal = MathAbs(entryPrice - slRef);
      double tickValue  = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
      double tickSize   = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);

      if(slDistanceReal > 0 && tickSize > 0)
        {
         double lossPerLot = (slDistanceReal / tickSize) * tickValue;
         double lots       = riskMoney / lossPerLot;
         double volStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
         double volMin  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
         double volMax  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
         lots = MathFloor(lots / volStep) * volStep;
         if(lots < volMin)
           { GoAbort(ABORT_LOT_TOO_SMALL, g_state); return; }
         if(lots > volMax)
           { lots = volMax; PrintFormat("[SRJ-EA] Lot size capped at volMax: %f", lots); }

         long stopsLevelPts  = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
         long freezeLevelPts = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL);
         double slPts = MathAbs(entryPrice - slRef)    / _Point;
         double tpPts = MathAbs(tpTarget   - entryPrice) / _Point;
         PrintFormat("[SRJ-EA] PRE-SEND lots=%.2f entry=%s slPts=%.0f tpPts=%.0f "
                     "stopsLevel=%d freezeLevel=%d spreadPts=%d%s",
                     lots,
                     DoubleToString(entryPrice, _Digits),
                     slPts, tpPts,
                     (int)stopsLevelPts, (int)freezeLevelPts,
                     (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD),
                     (slPts < (double)stopsLevelPts || tpPts < (double)stopsLevelPts)
                       ? "  <- BELOW STOPS LEVEL, broker will likely reject" : "");

         g_trade.SetExpertMagicNumber(magic);
         g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
         string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";

         bool tradeResult = false;
         if(g_dir == DIR_LONG)
            tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
         else
            tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);

         if(!tradeResult)
           {
            PrintFormat("[SRJ-EA] Trade execution failed! Error: %d", g_trade.ResultRetcode());
           }
         else
           {
            double fill = g_trade.ResultPrice();
            if(fill > 0.0)
              {
               double slDistFill = MathAbs(fill - slRef);
               double tpDistFill = MathAbs(tpTarget - fill);
               double rFill = (slDistFill > 0.0) ? (tpDistFill / slDistFill) : 0.0;
               PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "
                           "R_logged_at_signal=%.2f delta=%.2f",
                           DoubleToString(fill, _Digits),
                           slDistFill / _Point, tpDistFill / _Point,
                           rFill, tpR, rFill - tpR);
              }
           }
        }
      else
        {
         PrintFormat("[SRJ-EA] NO TRADE PLACED after SIGNAL: slDistanceReal=%.10f "
                     "tickSize=%.10f entryPrice=%s slRef=%s",
                     slDistanceReal, tickSize,
                     DoubleToString(entryPrice, _Digits),
                     DoubleToString(slRef, _Digits));
        }

      MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_SIGNAL;
      LogState(prev, g_state);
      ResetSequence();
     }
  }

//====================== [P-NEWS-1 E20/E21/E22] news-blackout census =================
//--- Print-only. No verdict moves, no selection changes, MTEXIT untouched.
//--- E20 pinned table: 11 {eventTimeET, kind} rows transcribed from
//--- DRAFT_NEWS-EVENTS-2026.csv @ SHA256 5FFF5C76...EF1F134. No broker-time
//--- field, no stored offset: ET wall -> server at read time through
//--- TC_ZoneToServer(..., TZ_NEWYORK), the same converter the session
//--- windows use (US + server DST rules inside TickCore, evaluated on the
//--- naive wall timestamp; event hours 08:30/14:00 ET never touch the
//--- 02:00 transition hours, so the documented boundary-hour bound cannot
//--- engage these rows). Accessors are switch-based: no init order, no
//--- global-constructor dependence.
//--- E21: SrjInNewsBlackout is THE predicate body. The census calls it now;
//--- the exit side and the entry side will call the same body later. There
//--- is no second implementation (E21 halt-1 satisfied by construction).
//--- Window [newsBarOpen - 1*PS, newsBarOpen + 2*PS); newsBar containment
//--- [barOpen, barOpen + PS). No literal minutes: the shape is PS multiples;
//--- the /60 in offsetMinutes is a seconds-to-minutes unit, not a window term.
#define SRJ_NEWS_ROWS 11
#define SHADOW_NEWS true
//--- Pilot range (server frame) for inWindow membership. From RECON1_P1 per
//--- the packet's "full window" term — NOT derived from Bars()/iTime: those
//--- return the full broker history depth (years), and iTime(0) at lazy-init
//--- is the first bar, so data-derived bounds exclude every later window
//--- (RECON12 measured rowsInWindow=0 on exactly this defect). If the packet
//--- ever moves window, these two lines move with it.
#define SRJ_PILOT_FROM D'2026.08.26 00:00'
#define SRJ_PILOT_TO   D'2026.09.10 00:00'
string SrjNewsET(const int i)
   {
    switch(i)
      {
       case  0: return "2026-09-04 08:30";
       case  1: return "2026-09-11 08:30";
       case  2: return "2026-09-16 14:00";
       case  3: return "2026-10-02 08:30";
       case  4: return "2026-10-14 08:30";
       case  5: return "2026-10-28 14:00";
       case  6: return "2026-11-06 08:30";
       case  7: return "2026-11-10 08:30";
       case  8: return "2026-12-04 08:30";
       case  9: return "2026-12-09 14:00";
       case 10: return "2026-12-10 08:30";
      }
    return "";
   }
string SrjNewsKind(const int i)
   {
    switch(i)
      {
       case  0: return "NFP";
       case  1: return "CPI";
       case  2: return "FOMC";
       case  3: return "NFP";
       case  4: return "CPI";
       case  5: return "FOMC";
       case  6: return "NFP";
       case  7: return "CPI";
       case  8: return "NFP";
       case  9: return "FOMC";
       case 10: return "CPI";
      }
    return "";
   }
//--- "YYYY-MM-DD HH:MM" -> naive wall datetime. StringToTime is server-frame
//--- so the pinned format is parsed manually; the result is NEVER passed to
//--- iTime/CopyBuffer without TC_ZoneToServer first.
datetime SrjNewsEtWall(const int i)
   {
    string s = SrjNewsET(i);
    int y  = (int)StringSubstr(s, 0, 4);
    int mo = (int)StringSubstr(s, 5, 2);
    int d  = (int)StringSubstr(s, 8, 2);
    int h  = (int)StringSubstr(s, 11, 2);
    int mi = (int)StringSubstr(s, 14, 2);
    return TC_MakeTime(y, mo, d, h, mi);
   }
datetime g_news_newsBar[SRJ_NEWS_ROWS];
datetime g_news_winS[SRJ_NEWS_ROWS];
datetime g_news_winE[SRJ_NEWS_ROWS];
int      g_news_offMin[SRJ_NEWS_ROWS];
int      g_news_inWin[SRJ_NEWS_ROWS];
int      g_news_halted[SRJ_NEWS_ROWS];
int      g_news_rowSnap[SRJ_NEWS_ROWS];
int      g_news_nWin = 0;
int      g_news_overlaps = 0;
string   g_news_overlapList = "";
bool     g_news_init = false;
int      g_news_memberBars = 0;
int      g_news_slimbInWin = 0;
int      g_news_s5InWin = 0;
int      g_news_flatNews = 0;
int      g_news_flatDay = 0;
int      g_news_flatWeek = 0;
datetime g_news_dayMarks[32];
int      g_news_dayDone[32];
int      g_news_dayN = 0;
string   g_news_friET = "";
datetime g_news_friMarks[8];
int      g_news_friDone[8];
int      g_news_friN = 0;
bool SrjInNewsBlackout(const datetime barOpen, string &kindOut, int &posOut, int &rowOut)
   {
    kindOut = "-"; posOut = -1; rowOut = -1;
    if(!g_news_init) return false;
    long ps = (long)PeriodSeconds(PERIOD_CURRENT);
    for(int i = 0; i < SRJ_NEWS_ROWS; i++)
      {
       if(g_news_inWin[i] == 0 || g_news_halted[i] == 1) continue;
       if(barOpen < g_news_winS[i] || barOpen >= g_news_winE[i]) continue;
       kindOut = SrjNewsKind(i); rowOut = i;
       if(barOpen < g_news_newsBar[i]) posOut = 0;
       else if(barOpen < g_news_newsBar[i] + ps) posOut = 1;
       else posOut = 2;
       return true;
      }
    return false;
   }
//--- Lazy init on the first closed bar. Conversions need no history; the E21
//--- gap check does NOT run here (tester series only extend to the current
//--- bar — September bars don't exist yet on the first August bar, and a
//--- check now would false-halt; RECON12b measured exactly that). Pilot
//--- range is SRJ_PILOT_FROM/TO.
void SrjNewsInit()
   {
    if(g_news_init) return;
    g_news_init = true;
    long ps = (long)PeriodSeconds(PERIOD_CURRENT);
    for(int i = 0; i < SRJ_NEWS_ROWS; i++)
      {
       datetime wall = SrjNewsEtWall(i);
       datetime srv  = TC_ZoneToServer(wall, TZ_NEWYORK);
       g_news_offMin[i] = (int)(((long)srv - (long)wall) / 60);
       datetime nb = (datetime)(((long)srv / ps) * ps);
       g_news_newsBar[i] = nb;
       g_news_winS[i] = (datetime)((long)nb - ps);
       g_news_winE[i] = (datetime)((long)nb + 2 * ps);
       g_news_inWin[i] = (g_news_winE[i] > SRJ_PILOT_FROM && g_news_winS[i] < SRJ_PILOT_TO) ? 1 : 0;
       g_news_halted[i] = 0;
       g_news_rowSnap[i] = 0;
      }
    //--- Day marks: 16:55 ET (= 17:00 daily close minus 5 min, the dayFlat
    //--- census definition, quoted in BLACKOUT_CENSUS) per calendar date in
    //--- range; Friday marks: 17:00 ET (the weekFlat census definition). Both
    //--- resolved through the same converter. Noon-dow is zone-safe: at
    //--- midday the ET and server dates always agree.
    g_news_dayN = 0;
    g_news_friN = 0;
    g_news_friET = "";
    datetime cur = TC_DayStart(SRJ_PILOT_FROM);
    while(cur < SRJ_PILOT_TO && g_news_dayN < 32)
      {
       MqlDateTime dd; TimeToStruct(cur, dd);
       g_news_dayMarks[g_news_dayN] = TC_ZoneToServer(TC_MakeTime(dd.year, dd.mon, dd.day, 16, 55), TZ_NEWYORK);
       g_news_dayDone[g_news_dayN] = 0;
       g_news_dayN++;
       MqlDateTime noon; TimeToStruct(TC_MakeTime(dd.year, dd.mon, dd.day, 12, 0), noon);
       if(noon.day_of_week == 5 && g_news_friN < 8)
         {
          g_news_friMarks[g_news_friN] = TC_ZoneToServer(TC_MakeTime(dd.year, dd.mon, dd.day, 17, 0), TZ_NEWYORK);
          g_news_friDone[g_news_friN] = 0;
          g_news_friN++;
          string one = StringFormat("%04d-%02d-%02d 17:00", dd.year, dd.mon, dd.day);
          g_news_friET += ((g_news_friET == "") ? "" : "|") + one;
         }
       cur = TC_ShiftDayStart(cur, 1);
      }
   }
//--- "Open" for the flat census. g_mtrade.active is STICKY: it is set at
//--- fill and cleared only by the next fill's MtReset, so a closed trade
//--- still reads active. state goes MT_CLOSED at close (normal path). Both
//--- conditions together are the true open interval (RECON12b overcounted
//--- dayFlat 12 and weekFlat 2 on the sticky flag alone).
bool SrjNewsIsOpen()
   {
    return (g_mtrade.active && g_mtrade.state != MT_CLOSED);
   }
//--- End-of-run row finalization. Full history exists now, so the E21 gap
//--- check is sound: the event instant must sit inside a real bar (exact
//--- containment, never snapped). Halted rows print HALT plus their ROW
//--- with inWindow=0 and are excluded from every expectation.
void SrjNewsFinalize()
   {
    long ps = (long)PeriodSeconds(PERIOD_CURRENT);
    g_news_nWin = 0;
    for(int i = 0; i < SRJ_NEWS_ROWS; i++)
      {
       if(g_news_inWin[i] == 1)
         {
          datetime srv = TC_ZoneToServer(SrjNewsEtWall(i), TZ_NEWYORK);
          if(iBarShift(_Symbol, PERIOD_CURRENT, srv, true) < 0)
            {
             g_news_halted[i] = 1; g_news_inWin[i] = 0;
             string haltLine = StringFormat("[SRJ-EA] BLACKOUT_HALT_ROW kind=%s eventTimeET=%s reason=GAP_NO_BAR",
                                            SrjNewsKind(i), SrjNewsET(i));
             LwAudit("BLACKOUT_HALT", haltLine);
             Print(haltLine);
            }
          else
             g_news_nWin++;
         }
       int spanned = (int)(((long)g_news_winE[i] - (long)g_news_winS[i]) / ps);
       string rl = StringFormat("[SRJ-EA] BLACKOUT_ROW kind=%s eventTimeET=%s newsBarOpen=%s windowStart=%s windowEnd=%s offsetMinutes=%d inWindow=%d barsSpanned=%d",
                                SrjNewsKind(i), SrjNewsET(i),
                                TimeToString(g_news_newsBar[i], TIME_DATE|TIME_MINUTES),
                                TimeToString(g_news_winS[i], TIME_DATE|TIME_MINUTES),
                                TimeToString(g_news_winE[i], TIME_DATE|TIME_MINUTES),
                                g_news_offMin[i], g_news_inWin[i], spanned);
       LwAudit("BLACKOUT_ROW", rl);
       Print(rl);
      }
    for(int a = 0; a < SRJ_NEWS_ROWS; a++)
        for(int b = a + 1; b < SRJ_NEWS_ROWS; b++)
           if(g_news_inWin[a] == 1 && g_news_inWin[b] == 1 &&
              g_news_winS[a] < g_news_winE[b] && g_news_winS[b] < g_news_winE[a])
             { g_news_overlaps++; g_news_overlapList += ((g_news_overlaps > 1) ? "|" : "") + SrjNewsKind(a) + "@" + SrjNewsET(a) + "x" + SrjNewsKind(b) + "@" + SrjNewsET(b); }
   }
//--- Per-closed-bar census hook. Read-only: counts and prints only. Called at
//--- the END of OnTick so g_mtrade reflects the settled post-eval state.
void SrjNewsOnBar(const datetime barTime)
   {
    string k; int pos, row;
    if(SrjInNewsBlackout(barTime, k, pos, row))
      {
       g_news_memberBars++;
       string bl = StringFormat("[SRJ-EA] BLACKOUT_BAR barTime=%s kind=%s pos=%s",
                                TimeToString(barTime, TIME_DATE|TIME_MINUTES), k,
                                (pos == 0) ? "PRE" : ((pos == 1) ? "NEWS" : "POST"));
       LwAudit("BLACKOUT_BAR", bl);
       Print(bl);
      }
    //--- Flat populations, edge-triggered, once each. "Open" = SrjNewsIsOpen().
    for(int i = 0; i < SRJ_NEWS_ROWS; i++)
      {
       if(g_news_inWin[i] == 0 || g_news_rowSnap[i] == 1) continue;
       if(barTime >= g_news_winS[i])
         { g_news_rowSnap[i] = 1; if(SrjNewsIsOpen()) g_news_flatNews++; }
      }
    for(int d = 0; d < g_news_dayN; d++)
      {
       if(g_news_dayDone[d] == 1) continue;
       if(barTime >= g_news_dayMarks[d])
         { g_news_dayDone[d] = 1; if(SrjNewsIsOpen()) g_news_flatDay++; }
      }
    for(int f = 0; f < g_news_friN; f++)
      {
       if(g_news_friDone[f] == 1) continue;
       if(barTime >= g_news_friMarks[f])
         { g_news_friDone[f] = 1; if(SrjNewsIsOpen()) g_news_flatWeek++; }
      }
   }

//====================== OnInit =========================================
int OnInit()
  {
   InitAuthorityTable();

   if(!(bool)MQLInfoInteger(MQL_TESTER)) TC_DetectServerOffset();
   TC_DetectServerOffsetNow();

   {
    datetime srvNow   = TimeCurrent();
    datetime gmtNow   = TimeGMT();
    bool     inTester = (bool)MQLInfoInteger(MQL_TESTER);

    MqlDateTime d;
    TimeToStruct(TC_DayStart(srvNow), d);

    datetime lonFromSrv = TC_ZoneToServer(TC_MakeTime(d.year, d.mon, d.day,  2, 0, 0), TZ_NEWYORK);
    datetime lonToSrv   = TC_ZoneToServer(TC_MakeTime(d.year, d.mon, d.day,  5, 0, 0), TZ_NEWYORK);
    datetime nyFromSrv  = TC_ZoneToServer(TC_MakeTime(d.year, d.mon, d.day,  7, 0, 0), TZ_NEWYORK);
    datetime nyToSrv    = TC_ZoneToServer(TC_MakeTime(d.year, d.mon, d.day, 12, 0, 0), TZ_NEWYORK);

    PrintFormat("[SRJ-EA][CLOCK] TimeCurrent=%s TimeGMT=%s srvMinusGmt=%+ds "
                "gtc_serverGmtBase=%+ds offsetNow=%s tester=%s",
                TimeToString(srvNow, TIME_DATE|TIME_SECONDS),
                TimeToString(gmtNow, TIME_DATE|TIME_SECONDS),
                (int)((long)srvNow - (long)gmtNow),
                gtc_serverGmtBase,
                TC_ServerOffsetText(),
                (inTester ? "YES" : "NO"));

    PrintFormat("[SRJ-EA][CLOCK] session windows resolved to SERVER frame from ET date "
                "%04d.%02d.%02d:  LONDON 02:00-05:00 ET = %s .. %s   |   "
                "NYAM 07:00-12:00 ET = %s .. %s",
                d.year, d.mon, d.day,
                TimeToString(lonFromSrv, TIME_DATE|TIME_MINUTES),
                TimeToString(lonToSrv,   TIME_DATE|TIME_MINUTES),
                TimeToString(nyFromSrv,  TIME_DATE|TIME_MINUTES),
                TimeToString(nyToSrv,    TIME_DATE|TIME_MINUTES));

    if(srvNow <= 0 || gmtNow <= 0)
       Print("[SRJ-EA][CLOCK] WARNING: TimeCurrent() or TimeGMT() returned <= 0...");

    if(inTester && srvNow == gmtNow)
       Print("[SRJ-EA][CLOCK] WARNING: TESTER RUN with TimeGMT()==TimeCurrent()...");
   }

   ResetLastError();
   g_hPoi = iCustom(_Symbol, PERIOD_CURRENT, InpPoiMarkerName,
                    InpPoi_UseSeed, InpPoi_BinPips, InpPoi_WeightMode);
   PrintFormat("[SRJ-EA] POI handle=%d err=%d", g_hPoi, GetLastError());
   ResetLastError();
   g_hCqd = iCustom(_Symbol, PERIOD_CURRENT, InpCqdName,
                    PERIOD_D1, InpCqd_NoReset, true,
                    InpCqd_MaxCarryBars, InpCqd_MaxBackfillDays);
   PrintFormat("[SRJ-EA] CQD handle=%d err=%d", g_hCqd, GetLastError());
   ResetLastError();
   g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,
                     1, InpFL_HtfLookbackBars,
                     PERIOD_H4, PERIOD_H1, PERIOD_M15, false, 60);
   PrintFormat("[SRJ-EA] Flow handle=%d err=%d", g_hFlow, GetLastError());
   if(g_hPoi == INVALID_HANDLE || g_hCqd == INVALID_HANDLE || g_hFlow == INVALID_HANDLE)
     { Print("[SRJ-EA] OnInit FAILED: one or more iCustom handles are invalid."); return INIT_FAILED; }
   ResetSequence();
    //--- [P-SLDEF-1 E13 + amendment, P-SLDEF-4 E34] FRAME_NOTE, once per run:
    //--- the six conventions a later session could silently invert. (1) Slot
    //--- frame: every printed shift is ReadFlow frame, CopyBuffer position =
   //--- every printed shift is ReadFlow frame, CopyBuffer position =
   //--- eval shift + FLOW_SHIFT_OFFSET (the settled slot). (2) Apex frame: a
   //--- swing value at eval shift s is priced at ApexShift(s) = s + offset;
   //--- barTime(s) prints iTime at that price shift - the code's own belief.
   //--- (3) Protective sign: raw deltaPts is (ref - today) in points, so
   //--- LONG-protective prints negative and SHORT-protective positive;
   //--- outwardPts = LONG ? -delta : +delta normalizes to outward-positive.
   //--- (4) Population identity [P-NEWS-1 verdict rule]: every gate count
   //--- names its population in the same sentence - input-side (guard
   //--- applications, raw encounters) vs result-side (post-walk values).
    //--- Labels (bar=, barTime) are server time via iTime/TimeToString.
    //--- (6) Read windows per reader [P-SLDEF-4 E31]: the ladder reads from
    //--- the entry bar to the deepest rung-obligated slot plus margin
    //--- (SLADWIN ladWindowStart/ladWindowSpan/ladReadLimit); the OB walk
    //--- reads walkStart..walkStart+500, the fractal walk guardStart..
    //--- guardStart+500 (SLADWIN walkWinOB/walkWinFR). A ladder window and a
    //--- walk window are DIFFERENT windows: coverage is by slot reach, and
    //--- ladLimitHit rows are UNCOVERED_READ_LIMIT, never silent.
    //--- THRESHOLD: the live minimum-R is an artifact of the run. Source is
   //--- "ini" when the value differs from the compiled default (an ini-set
   //--- 1.0 is indistinguishable - recorded as compiled_default).
     string frame_note = StringFormat("[SRJ-EA] FRAME_NOTE offset=%d apex=s+%d labels=server-time "
                 "protectiveSign=LONG-lower/SHORT-higher outward=LONG(-d)/SHORT(+d) "
                 "populations=inputVsResultNamed ladObligN=6refs ladCovers=oblig+ext1 "
                 "sigmap=signalTime-s5BarTime-PeriodSeconds "
                 "readwin=ladder:entryBar+span|walkOB:walkStart+500|walkFR:guardStart+500 "
                 "THRESHOLD minRewardRisk=%.2f source=%s",
               FLOW_SHIFT_OFFSET, FLOW_SHIFT_OFFSET, InpMinRewardRisk,
               ((InpMinRewardRisk == 1.0) ? "compiled_default" : "ini"));
   LwAudit("FRAME_NOTE", frame_note);
   Print(frame_note);
   //--- [P-NEWS-1 E20] pinned-table note, once per run. Digest is a source
   //--- string constant (the human check); the BLACKOUT_ROW emissions at the
   //--- first bar are the audit artifact. No history needed here.
   string table_note = StringFormat("[SRJ-EA] TABLE_NOTE rows=%d digest=%s anchor=%s",
                                    SRJ_NEWS_ROWS,
                                    "5FFF5C762DABCAB7811C598D8B16942BBCBD5F9D94C91D0BB54CF8C36EF1F134",
                                    "21:00_broker");
   LwAudit("TABLE_NOTE", table_note);
   Print(table_note);
   Print("[SRJ-EA] Initialised.");
   return INIT_SUCCEEDED;
  }

//====================== OnDeinit =======================================
void OnDeinit(const int reason)
  {
   if(InpDebugLog)
      PrintFormat("[SRJ-EA] BIASCENSUS_FINAL bars=%d | "
                  "sh1 neg=%d zero=%d pos=%d empty=%d other=%d fail=%d | "
                  "sh2 neg=%d zero=%d pos=%d empty=%d other=%d fail=%d",
                  g_ea16_bars,
                  g_ea16_s1[2], g_ea16_s1[3], g_ea16_s1[4],
                  g_ea16_s1[1], g_ea16_s1[5], g_ea16_s1[0],
                  g_ea16_s2[2], g_ea16_s2[3], g_ea16_s2[4],
                  g_ea16_s2[1], g_ea16_s2[5], g_ea16_s2[0]);

   if(InpDebugLog)
     {
      PrintFormat("[SRJ-EA] HTFCENSUS_19 bars=%d | "
                  "s1 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d | "
                  "s2 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d",
                  g_ea19_bars,
                  g_ea19_h1s1[0], g_ea19_h1s1[1], g_ea19_h1s1[2],
                  g_ea19_h1s1[3], g_ea19_h1s1[4], g_ea19_h1s1[5],
                  g_ea19_h1s2[0], g_ea19_h1s2[1], g_ea19_h1s2[2],
                  g_ea19_h1s2[3], g_ea19_h1s2[4], g_ea19_h1s2[5]);

      PrintFormat("[SRJ-EA] HTFCENSUS_20 bars=%d | "
                  "s1 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d | "
                  "s2 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d",
                  g_ea19_bars,
                  g_ea19_h2s1[0], g_ea19_h2s1[1], g_ea19_h2s1[2],
                  g_ea19_h2s1[3], g_ea19_h2s1[4], g_ea19_h2s1[5],
                  g_ea19_h2s2[0], g_ea19_h2s2[1], g_ea19_h2s2[2],
                  g_ea19_h2s2[3], g_ea19_h2s2[4], g_ea19_h2s2[5]);

      PrintFormat("[SRJ-EA] HTFCENSUS_21 bars=%d | "
                  "s1 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d | "
                  "s2 fail=%d empty=%d neg=%d zero=%d pos=%d other=%d",
                  g_ea19_bars,
                  g_ea19_h3s1[0], g_ea19_h3s1[1], g_ea19_h3s1[2],
                  g_ea19_h3s1[3], g_ea19_h3s1[4], g_ea19_h3s1[5],
                  g_ea19_h3s2[0], g_ea19_h3s2[1], g_ea19_h3s2[2],
                  g_ea19_h3s2[3], g_ea19_h3s2[4], g_ea19_h3s2[5]);

      PrintFormat("[SRJ-EA] HTFCENSUS_SUMMARY inWindowBars=%d allZeroS1=%d "
                  "allZeroS2=%d noRegimeAborts=%d",
                  g_ea19_inWindow, g_ea19_allZeroS1,
                  g_ea19_allZeroS2, g_ea19_noRegimeAborts);
     }

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SWINGREPAINT_2V3_FINAL retractedSH=%d/%d "
                  "retractedSL=%d/%d checks=%d",
                  g_swr_retractSH, g_swr_oppSH,
                  g_swr_retractSL, g_swr_oppSL,
                  g_swr_checks);

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] ZONECENSUS_FINAL bars=%d both=%d xobOnly=%d fvgOnly=%d "
                  "neither=%d | inWindow=%d xobInWin=%d fvgInWin=%d | samples=%d",
                  g_zc_bars, g_zc_both, g_zc_xobOnly, g_zc_fvgOnly,
                  g_zc_neither, g_zc_inWin, g_zc_xobInWin, g_zc_fvgInWin,
                   g_zc_samples);

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] SLMEMO_CENSUS computes=%d hits=%d demands=%d",
                  g_slMemo_computes, g_slMemo_hits,
                  g_slMemo_computes + g_slMemo_hits);

     SrjWs161Census();

   if(InpDebugLog)
     {
      //--- [P-SLDEF-1 E14] N1 equality tally. Counters only; no branch reads
      //--- them. Operators grounding "equality survives": retest wick/body in
      //--- DetectPoiRetest (`l <= L-P+EPS && bodyLo >= L-EPS`, SHORT mirror),
      //--- POI body-break in the exit census (`bodyLo < L-EPS` /
      //--- `bodyHi > L+EPS`), confirmation A2 (`c1 >= L` / `c1 <= L`, VWAP and
      //--- POC alike). All strict: exact equality never breaks. VWAP is a
      //--- computed double, so vwapEq is expected 0 (unexercised, not verified).
      PrintFormat("[SRJ-EA] N1EQUALS poiEqBody=%d poiEqWick=%d vwapEq=%d pocEq=%d",
                  g_n1_poiEqBody, g_n1_poiEqWick, g_n1_vwapEq, g_n1_pocEq);
      //--- [P-SLDEF-1b E19] verdict pairing. surv+inv per family reproduces
      //--- the unpaired counter exactly (gated off-log).
      string n1pair = StringFormat("[SRJ-EA] N1PAIR entryWickSurv=%d entryWickInv=%d entryBodySurv=%d entryBodyInv=%d vwapSurv=%d vwapInv=%d pocSurv=%d pocInv=%d exitBodySurv=%d exitBodyInv=%d",
                  g_n1_entryWickSurv, g_n1_entryWickInv,
                  g_n1_entryBodySurv, g_n1_entryBodyInv,
                  g_n1_vwapSurv, g_n1_vwapInv, g_n1_pocSurv, g_n1_pocInv,
                  g_n1_exitBodySurv, g_n1_exitBodyInv);
      LwAudit("N1PAIR", n1pair);
      Print(n1pair);
       //--- [P-SLDEF-1b E15] width audit, once per run per class. truncated
       //--- nonzero halts (gate 7). DECISION excluded by design (one multi-line
       //--- emission of individually short physical lines).
       //--- [P-NEWS-1 verdict rule] the class value is QUOTED: a bare
       //--- class=SLIMB token self-matches the data pattern `SLIMB ` that the
       //--- audit exists to check (RECON11b BADFMT=1x3 artifact). Tabulation
       //--- scopes data patterns to the `[SRJ-EA] <CLASS>` line head instead.
       //--- [P-SLDEF-2 E26] the summary loop moved below the census print:
       //--- every class (ROW/CENSUS included) is measured pre-write AND
       //--- summarized. See the relocated loop.
       //--- [P-SLDEF-1b E18] S5 carve-out counts per limb (gate 11).
      PrintFormat("[SRJ-EA] SLIMBCARVE_FINAL ob=%d fr=%d",
                  g_slimbr_carveOB, g_slimbr_carveFR);
      //--- [P-NEWS-1 E22] blackout census, end of run. Flat definitions:
      //--- news = managed record open at a windowStart; day = open at
      //--- 16:55 ET (17:00 daily close minus 5 min); week = open at the
      //--- quoted Friday 17:00 ET. "Open" = SrjNewsIsOpen().
      SrjNewsFinalize();
      int news_expected = 3 * g_news_nWin;
      string bcen = StringFormat("[SRJ-EA] BLACKOUT_CENSUS rows=%d rowsInWindow=%d memberBars=%d expected=%d mismatch=%d overlaps=%d slimbInWindow=%d s5InWindow=%d newsFlatCandidates=%d dayFlatCandidates=%d weekFlatCandidates=%d dailyCloseET=%s fridayET=%s",
                  SRJ_NEWS_ROWS, g_news_nWin, g_news_memberBars, news_expected,
                  g_news_memberBars - news_expected, g_news_overlaps,
                  g_news_slimbInWin, g_news_s5InWin,
                  g_news_flatNews, g_news_flatDay, g_news_flatWeek,
                  "17:00", g_news_friET);
       LwAudit("BLACKOUT_CENSUS", bcen);
       Print(bcen);
       //--- [P-SLDEF-3 E28] correspondence run summary: residual histogram
       //--- over slot-matched pairs (nonzero buckets only) + run tallies.
       //--- nz carries the first nonzero pairs (row|ref|rungSlot:refSlot:
       //--- resid); every pair is also on its row's SLADCORR line.
       string corrHistTok = "";
       for(int corrR = -50; corrR <= 50; corrR++)
          if(g_corr_hist[corrR + 50] > 0)
             corrHistTok += ((corrHistTok == "") ? "" : ",") + IntegerToString(corrR) + ":" + IntegerToString(g_corr_hist[corrR + 50]);
       if(corrHistTok == "") corrHistTok = "-";
       string corrH = StringFormat("[SRJ-EA] SLADCORR_HIST fields=6 rows=%d pairs=%d zero=%d lo=%d hi=%d hist=%s",
                   g_corr_rows, g_corr_pairs, g_corr_zero, g_corr_lo, g_corr_hi, corrHistTok);
       LwAudit("SLADCORR_HIST", corrH);
       Print(corrH);
       string corrNz = (g_corr_nz == "") ? "-" : g_corr_nz;
       if(g_corr_nzDrop > 0) corrNz += "DROP=" + IntegerToString(g_corr_nzDrop);
       string corrF = StringFormat("[SRJ-EA] SLADCORR_FINAL fields=4 rows=%d fracOff=%d todayOff=%d nz=%s",
                   g_corr_rows, g_corr_fracOff, g_corr_todayOff, corrNz);
       LwAudit("SLADCORR_FINAL", corrF);
       Print(corrF);
       //--- [P-SLDEF-3 E30] SIGMAP: each firing signal to its S5 eval row at
       //--- signalTime - PeriodSeconds. Unmapped signals print UNMAPPED and
       //--- fail gate 11 on disk.
       int sigMapped = 0;
       string sigMapTok = "";
       long sigPs = (long)PeriodSeconds(PERIOD_CURRENT);
       for(int sigI = 0; sigI < g_sigmap_sigN; sigI++)
         {
          datetime sigExpS5 = (datetime)((long)g_sigmap_sigT[sigI] - sigPs);
          string sigHit = "UNMAPPED";
          for(int sigJ = 0; sigJ < g_sigmap_s5N; sigJ++)
             if(g_sigmap_s5T[sigJ] == sigExpS5)
               { sigHit = TimeToString(sigExpS5, TIME_DATE|TIME_MINUTES); sigMapped++; break; }
          sigMapTok += ((sigMapTok == "") ? "" : "|") + TimeToString(g_sigmap_sigT[sigI], TIME_DATE|TIME_MINUTES) + "->" + sigHit;
         }
       string sigMap = StringFormat("[SRJ-EA] SIGMAP fields=3 signals=%d mapped=%d map=%s",
                   g_sigmap_sigN, sigMapped, (sigMapTok == "") ? "-" : sigMapTok);
       LwAudit("SIGMAP", sigMap);
       Print(sigMap);
       //--- [P-SLDEF-2 E26] audit-ordering fix, relocated summary loop. The
       //--- packet's one-line move (finalize before the loop) restores ROW's
       //--- line but leaves CENSUS un summarized (its audit executes after
       //--- any earlier loop position); gate 10 names BOTH classes, so the
       //--- loop itself runs here, after every emission: ROW (audited inside
       //--- finalize), CENSUS, and all in-run classes are measured pre-write
       //--- and all appear below. Same goal as the packet, mechanism moved
       //--- by necessity; graded on disk by gate 10.
       for(int lw_i = 0; lw_i < g_lw_n; lw_i++)
          PrintFormat("[SRJ-EA] LINEWIDTH class=\"%s\" max=%d cap=%d truncated=%d",
                      g_lw_class[lw_i], g_lw_max[lw_i], LW_CAP, g_lw_trunc[lw_i]);
      //--- [P-SLDEF-1 E12] the decision artifact: same S5 numbers, formatted
      //--- for a decision (today | base | nuance | fractal | fractalNuance).
       PrintFormat("[SRJ-EA] SLIMBR_DECISION rows=%d\n%s",
                   g_slimbr_decisionN, g_slimbr_decision);
       //--- [P-SLDEF-4 E32] the operator mark-up artifact: one ROW line per
       //--- S5 row (10 on pilot) + RUNG companions on the firing rows only.
       //--- Rungs by slot-order (0/1/2) and ext-order (0/1/2); every
       //--- companion carries slot+barTime+price, so no rung index is
       //--- load-bearing. THRESHOLD quoted from the live input (same source
       //--- rule as FRAME_NOTE); the flip-and-pass count rides along.
       //--- Excluded from LwAudit by the DECISION design (physical lines are
       //--- individually short; the gate-13 width census covers only the
       //--- audited classes).
       int decFiredN = 0;
       for(int decC = 0; decC < g_dec_n; decC++)
          if(g_dec_fired[decC] == 1) decFiredN++;
       //--- [P-SLDEF-5 E38] orderFlipPass scope-annotated at the emitter:
       //--- the count is S5-gate narrow (R2 code-read; relocation not owed).
       //--- [P-SLDEF-5 E38] the three DECISION classes registered in LwAudit
       //--- (byte-identical strings; gate 10 covers them).
       string decH = StringFormat("[SRJ-EA] SLADDER_DECISION rows=%d fired=%d threshold=%.2f thresholdSource=%s orderFlipPass=%d orderFlipScope=NARROW",
                   g_dec_n, decFiredN, InpMinRewardRisk,
                   ((InpMinRewardRisk == 1.0) ? "compiled_default" : "ini"),
                   g_order_flipPassN);
       LwAudit("SLADDER_DECISION", decH);
       Print(decH);
       for(int decR = 0; decR < g_dec_n; decR++)
         {
          string decRow = StringFormat("[SRJ-EA] SLADDER_DECISION_ROW fields=14 bar=%s site=S5 dir=%s fired=%d ladCovers=%d ladRungs=%d level=%s levelStatus=%s levelRung=%d levelSlot=%d levelT=%s levelResidPts=%d levelPx=%s levelR=%.2f",
                      TimeToString(g_dec_barT[decR], TIME_DATE|TIME_MINUTES),
                      (g_dec_dir[decR] == 1) ? "LONG" : "SHORT",
                      g_dec_fired[decR], g_dec_covers[decR], g_dec_rungs[decR],
                      (g_dec_mStatus[decR] == "NOLEVEL_FILED") ? "-" : DoubleToString(g_dec_mLevel[decR], _Digits),
                      g_dec_mStatus[decR], g_dec_mRung[decR], g_dec_mSlot[decR], g_dec_mT[decR],
                      g_dec_mResid[decR],
                      (g_dec_mRung[decR] >= 0) ? DoubleToString(g_dec_mPx[decR], _Digits) : "-",
                      g_dec_mR[decR]);
          LwAudit("SLADDER_DECISION_ROW", decRow);
          Print(decRow);
          if(g_dec_fired[decR] == 1)
            {
             for(int decK = 0; decK < g_dec_sHave[decR]; decK++)
               {
                string decRS = StringFormat("[SRJ-EA] SLADDER_DECISION_RUNG fields=13 bar=%s site=S5 kind=SLOT rung=%d slot=%d rungExt=%d barTime=%s px=%s wick=%s body=%s imbCode=%d distPts=%d rungR=%.2f",
                            TimeToString(g_dec_barT[decR], TIME_DATE|TIME_MINUTES),
                            decK, g_dec_sSlot[decR][decK], g_dec_sExt[decR][decK],
                            TimeToString(g_dec_sBT[decR][decK], TIME_DATE|TIME_MINUTES),
                            DoubleToString(g_dec_sPx[decR][decK], _Digits),
                            DoubleToString(g_dec_sWick[decR][decK], _Digits),
                            DoubleToString(g_dec_sBody[decR][decK], _Digits),
                            g_dec_sImb[decR][decK], g_dec_sDist[decR][decK], g_dec_sR[decR][decK]);
                LwAudit("SLADDER_DECISION_RUNG", decRS);
                Print(decRS);
               }
             for(int decK = 0; decK < g_dec_eHave[decR]; decK++)
               {
                string decRE = StringFormat("[SRJ-EA] SLADDER_DECISION_RUNG fields=13 bar=%s site=S5 kind=EXT rung=%d slot=%d rungExt=%d barTime=%s px=%s wick=%s body=%s imbCode=%d distPts=%d rungR=%.2f",
                            TimeToString(g_dec_barT[decR], TIME_DATE|TIME_MINUTES),
                            decK, g_dec_eSlot[decR][decK], g_dec_eExt[decR][decK],
                            TimeToString(g_dec_eBT[decR][decK], TIME_DATE|TIME_MINUTES),
                            DoubleToString(g_dec_ePx[decR][decK], _Digits),
                            DoubleToString(g_dec_eWick[decR][decK], _Digits),
                            DoubleToString(g_dec_eBody[decR][decK], _Digits),
                            g_dec_eImb[decR][decK], g_dec_eDist[decR][decK], g_dec_eR[decR][decK]);
                LwAudit("SLADDER_DECISION_RUNG", decRE);
                Print(decRE);
               }
            }
          }
          //--- [P-SLDEF-6 E43] memo-probe FINAL (ungated): S5 evaluations,
          //--- probe hits, agreements. The end-of-run SLMEMO_CENSUS carries
          //--- the memo-wide computes/hits the packet's 118 names.
          string sl43_fin = StringFormat("[SRJ-EA] SLEXT43_FINAL probed=%d hits=%d agree=%d",
                      g_sl43_probed, g_sl43_hits, g_sl43_agree);
          LwAudit("SLEXT43_FINAL", sl43_fin);
          Print(sl43_fin);
          //--- [P-SLDEF-6 E45.3] predicate-vs-consequence carve FINAL: the
          //--- predicate totals beside the consequence companions, the latter
          //--- labelled PROXY (firing-vs-effect, 6th taxonomy entry).
          string sl45_carve = StringFormat("[SRJ-EA] SLIMBCARVE_PROXY obPred=%d obConsProxy=%d frPred=%d frConsProxy=%d",
                      g_sl45_predOB, g_slimbr_carveOB, g_sl45_predFR, g_slimbr_carveFR);
          LwAudit("SLIMBCARVE_PROXY", sl45_carve);
          Print(sl45_carve);
          //--- [P-SLDEF-5 E39/gate 11] adoption-cost FINAL: rows named, ungated.
          string eFin = StringFormat("[SRJ-EA] SLEXT_FINAL newSignalCount=%d lostSignalCount=%d newRows=%s lostRows=%s outPos=%d outNeg=%d outZero=%d",
                      g_slext_newN, g_slext_lostN,
                      (g_slext_newRows == "") ? "-" : g_slext_newRows,
                      (g_slext_lostRows == "") ? "-" : g_slext_lostRows,
                      g_slext_outP, g_slext_outN, g_slext_outZ);
          LwAudit("SLEXT_FINAL", eFin);
          Print(eFin);
       }

   if(g_hPoi  != INVALID_HANDLE) IndicatorRelease(g_hPoi);
   if(g_hCqd  != INVALID_HANDLE) IndicatorRelease(g_hCqd);
   if(g_hFlow != INVALID_HANDLE) IndicatorRelease(g_hFlow);
   g_hPoi = g_hCqd = g_hFlow = INVALID_HANDLE;
  }

//====================== [P-EXITMODEL] exit-phase helpers =============================
//--- The section 5.1 body-close trigger set, from the compile-time MT_EXIT_SCOPE,
//--- classified through the ruled hierarchy (charter 9.1: AVP-POC over VWAP inside
//--- each family; the origin/anchor line's own break always exits - 9.1(2)).
bool MtIsBreakTrigger(const int k)
  {
   if(k == g_mtrade.anchorLine) return true;   // 9.1(2): the origin entry POI
   if(MT_EXIT_SCOPE == MT_SCOPE_ALL) return true;
   if(MT_EXIT_SCOPE == MT_SCOPE_ANCHOR) return false;
   return ((k % 2) == 0);   // FAMILY_POC: the POC buffers are the even indices
  }

//--- The TP scan replicates ComputeNearestTpTarget's admission EXACTLY but takes the
//--- anchor tier from the TRADE's record: the shared function reads the working-set
//--- g_anchorLine, which ResetSequence wipes at the signal, and the exit phase runs
//--- post-reset. DECLARED DUPLICATION: the entry pipeline is byte-untouched (spec
//--- section 7). TpTargetUpdateBest's zone guard (Task 31/Ruling 7c) reads the
//--- working-set zone globals, which are 0.0 post-reset, so the guard is inert here -
//--- consistent with section 2.2 ("a touch, no geometry") and section 5.3 (no
//--- distance/size/width in the exit rules). Q6 ruling honored: re-computed per bar,
//--- the nearest valid target, even if less than 1R post-entry.
bool MtNearestTpTarget(const int barShift, const ENUM_SRJ_DIR dir,
                       const double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   const int sessbufs[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   int anchorRank = (g_mtrade.anchorLine >= 0)
                    ? g_authorityRank[g_mtrade.anchorLine] : INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(k == g_mtrade.anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2))
         continue;
      double v;
      if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

//--- [P-SLDEF-2 E25] MTLIFE: one line per managed record at close (rows ==
//--- MTEXIT rows exactly; print-only, MTEXIT untouched). openBar = fill
//--- candle open ("-" if never filled); verdict/exit from the record.
//--- Boundary booleans are lifetime-overlap tests over [fill, exit): news =
//--- open when an in-window windowStart falls inside; day/week = open at the
//--- census's own 16:55-ET / Friday-17:00-ET marks (the same g_news arrays
//--- the edge-triggered census uses). Halt caveat: SrjNewsFinalize runs at
//--- end of run, so halt-exclusion is exact iff no in-window row halts
//--- (BLACKOUT_HALT count gates it; 0 on every baseline to date).
//--- Unevaluable (unfilled/uninit) prints -1.
void MtLifeEmit()
   {
    string mtlOpen = (g_mtrade.fillBarTime > 0) ? TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES) : "-";
    string mtlClose = (g_mtrade.exitBarTime > 0) ? TimeToString(g_mtrade.exitBarTime, TIME_DATE|TIME_MINUTES) : "-";
    int mtlNews = -1, mtlDay = -1, mtlWeek = -1;
    if(g_news_init && g_mtrade.fillBarTime > 0 && g_mtrade.exitBarTime > 0)
      {
       mtlNews = 0; mtlDay = 0; mtlWeek = 0;
       for(int mtlI = 0; mtlI < SRJ_NEWS_ROWS; mtlI++)
          if(g_news_inWin[mtlI] == 1 && g_mtrade.fillBarTime <= g_news_winS[mtlI] && g_news_winS[mtlI] < g_mtrade.exitBarTime) { mtlNews = 1; break; }
       for(int mtlD = 0; mtlD < g_news_dayN; mtlD++)
          if(g_mtrade.fillBarTime <= g_news_dayMarks[mtlD] && g_news_dayMarks[mtlD] < g_mtrade.exitBarTime) { mtlDay = 1; break; }
       for(int mtlF = 0; mtlF < g_news_friN; mtlF++)
          if(g_mtrade.fillBarTime <= g_news_friMarks[mtlF] && g_news_friMarks[mtlF] < g_mtrade.exitBarTime) { mtlWeek = 1; break; }
      }
    string mtlLine = StringFormat("[SRJ-EA] MTLIFE fields=11 openBar=%s dir=%s entry=%s sl=%s tp=%s verdict=%s closeBar=%s closePx=%s openAtNewsStart=%d openAtDayClose=%d openAtWeekClose=%d",
              mtlOpen, DirName(g_mtrade.dir),
              DoubleToString(g_mtrade.entryPrice, _Digits),
              DoubleToString(g_mtrade.slRef, _Digits),
              DoubleToString(g_mtrade.tpRef, _Digits),
              MtExitName(g_mtrade.exitReason),
              mtlClose, DoubleToString(g_mtrade.exitPrice, _Digits),
              mtlNews, mtlDay, mtlWeek);
    LwAudit("MTLIFE", mtlLine);
    Print(mtlLine);
   }

//--- [P-SLDEF-3 E29] MTFLIP: one line per HTF_FLIP verdict evaluation
//--- (print-only; the exit below is untouched). openBar = fill-bar shift
//--- (-1 unevaluable); biasBefore = anti-leg count on the previous bar
//--- (-1 unreadable); flipSourceBar = the eval bar when the flip is new,
//--- else the previous bar (first KNOWN flipped bar — a lower bound on the
//--- flip's age, disclosed). barsHeld from the two shifts (0 = the flip was
//--- evaluable against the record's own opening bar).
void MtFlipEmit(const int barShift, const datetime barTime, const int antiNow, const int want)
   {
    double fH = 0.0, fM = 0.0, fL = 0.0;
    int antiPrev = -1;
    if(ReadFlow(FL_BUF_HTF_HIGH, fH, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, fM, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, fL, barShift + 1))
      {
       antiPrev = 0;
       if((int)MathRound(fH) == -want) antiPrev++;
       if((int)MathRound(fM) == -want) antiPrev++;
       if((int)MathRound(fL) == -want) antiPrev++;
      }
    int fillShift = (g_mtrade.fillBarTime > 0) ? iBarShift(_Symbol, PERIOD_CURRENT, g_mtrade.fillBarTime, false) : -1;
    int barsHeld = (fillShift >= 0) ? (fillShift - barShift) : -1;
    int sameBar = (barsHeld == 0) ? 1 : ((barsHeld < 0) ? -1 : 0);
    datetime prevT = iTime(_Symbol, PERIOD_CURRENT, barShift + 1);
    datetime flipSrc = (antiPrev >= 0 && antiPrev < 2) ? barTime : prevT;
    string mfl = StringFormat("[SRJ-EA] MTFLIP fields=10 openBar=%d openBarTime=%s entry=%s evalBar=%d evalBarTime=%s biasBefore=%d biasAfter=%d flipSourceBar=%s barsHeld=%d sameBarFlip=%d",
              fillShift,
              (g_mtrade.fillBarTime > 0) ? TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES) : "-",
              DoubleToString(g_mtrade.entryPrice, _Digits),
              barShift, TimeToString(barTime, TIME_DATE|TIME_MINUTES),
              antiPrev, antiNow,
              TimeToString(flipSrc, TIME_DATE|TIME_MINUTES),
              barsHeld, sameBar);
    LwAudit("MTFLIP", mfl);
    Print(mfl);
   }

//====================== [P-EXITMODEL] EvaluateManagedTrade ===========================
// Spec section 4 site 3: the exit, evaluated at the NEXT candle's open. Called once
// per closed bar from OnTick AFTER the entry pipeline (section 7's separation: this
// function never touches the entry pipeline or any working-set field). Every verdict
// is logged (instrumentation-first, section 4's mitigation); an actual exit also
// emits the EXIT alert (ALERT-ONLY preserved - never an order). Same-bar priority
// when several tests fire together: SL, then TP_TOUCH, then POI_BODY_BREAK, then
// HTF_FLIP (the conservative stop-first standard; the census logs ALL verdicts so
// the operator can re-judge any instance).
void EvaluateManagedTrade(const int barShift)
  {
   if(!g_mtrade.active) return;
   if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;

   datetime barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
   if(barTime < g_mtrade.fillBarTime) return;   // bars predating the fill are not ours

   double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);
   double h = iHigh(_Symbol, PERIOD_CURRENT, barShift);
   double l = iLow(_Symbol, PERIOD_CURRENT, barShift);
   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
   //--- the NEXT candle's open = the evaluation instant's price (section 4);
   //--- fail-soft to the evaluated bar's close if the next open cannot be read.
   double nextOpenPx = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
   if(nextOpenPx <= 0.0) nextOpenPx = c;
   double bodyLo = MathMin(o, nextOpenPx);
   double bodyHi = MathMax(o, nextOpenPx);
   double EPS = 0.001 * _Point;   // the T161K float guard, threshold-free semantics

   //--- PENDING_FILL (section 5.5): fill on the first touch of the entry level.
   //--- Under the next-open entry the fill bar's own open IS the entry, so this
   //--- fills at the first evaluation; the branch keeps the lifecycle complete.
   if(g_mtrade.state == MT_PENDING_FILL)
     {
      bool touched = (g_mtrade.dir == DIR_LONG) ? (l <= g_mtrade.entryPrice + EPS)
                                                : (h >= g_mtrade.entryPrice - EPS);
      if(!touched)
        {
         //--- not filled yet: cancel on a bias flip (the three-flag conjunction is
         //--- the same event per sections 3.4/5.5)
         double ltfBias;
         if(ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift))
           {
            int want = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
            if((int)MathRound(ltfBias) != want)
              {
               g_mtrade.state      = MT_CLOSED;
               g_mtrade.exitReason = MT_EXIT_CANCEL_BIAS;
               g_mtrade.exitBarTime = barTime;
               g_mtrade.exitPrice   = nextOpenPx;
                if(InpDebugLog)
                  {
                   PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=CANCEL_BIAS (pending, unfilled)",
                               TimeToString(barTime, TIME_DATE|TIME_MINUTES));
                   MtLifeEmit();
                  }
              }
         }
         return;
        }
      g_mtrade.state = MT_MANAGING;   // filled (the fill bar's open = the entry)
     }

   //--- ALL verdicts computed first (instrumentation-first)
   bool   vSL = false, vTP = false, vBREAK = false, vHTF = false;
   double curTp = 0.0;
   bool   haveTp = MtNearestTpTarget(barShift, g_mtrade.dir, nextOpenPx, curTp);
   double breakLineVal = 0.0;
   string breakLineName = "";

   //--- (d) SL: price trades through the latched stop (wick or body; the standard
   //--- stop semantics; the EXITMODEL-1 Q5 recommendation, unobjected)
   if(g_mtrade.dir == DIR_LONG  && l <= g_mtrade.slRef) vSL = true;
   if(g_mtrade.dir == DIR_SHORT && h >= g_mtrade.slRef) vSL = true;

   //--- (b) TP: the CURRENT nearest valid target (Q6), exit on TOUCH (5.1/2.2)
   if(haveTp)
     {
      if(g_mtrade.dir == DIR_LONG  && h >= curTp) vTP = true;
      if(g_mtrade.dir == DIR_SHORT && l <= curTp) vTP = true;
     }

   //--- (c) the body-close exit: PRICE's BODY close through a BEHIND trigger line
   //--- (body = open -> next open, the T161K convention; "it must be body" - Q5).
   //--- A line's own gap/move alone never exits (Q3; section 1.3). Side is per bar
   //--- (section 5.2): a trigger line whose CURRENT value sits ahead of the trade
   //--- is a touch-target, not a body-close trigger. The census logs ALL twelve
   //--- lines per bar so every MT_EXIT_SCOPE variant is measurable from one run.
   for(int k = 0; k < POI_NLINES; k++)
     {
       double L;
       if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
       if(L == EMPTY_VALUE || L <= 0.0) continue;
       //--- [P-SLDEF-1 E14] same N1 body counter at the exit site. Grounding:
       //--- break needs bodyLo < L-EPS (LONG) / bodyHi > L+EPS (SHORT), both
       //--- strict: exact equality never breaks.
       if(bodyLo == L || bodyHi == L) g_n1_poiEqBody++;
       bool behind = (g_mtrade.dir == DIR_LONG)  ? (L < nextOpenPx)
                                                 : (L > nextOpenPx);
      bool through = false;
      if(behind)
        {
         if(g_mtrade.dir == DIR_LONG)  through = (bodyLo < L - EPS);
         else                          through = (bodyHi > L + EPS);
        }
       bool isTrigger = MtIsBreakTrigger(k);
       //--- [P-SLDEF-1b E19] exit-site pairing: the line verdict is known here.
       //--- Strictness says equality never sets `through`, so every paired
       //--- instance is expected ok (survived); a BREAK coincidence reports inv.
       if(bodyLo == L || bodyHi == L)
         { if(isTrigger && behind && through) g_n1_exitBodyInv++; else g_n1_exitBodySurv++; }
       if(InpDebugLog)
         PrintFormat("[SRJ-EA] EXITCENSUS bar=%s dir=%s line=%s val=%s side=%s "
                     "trigger=%d bodyLo=%s bodyHi=%s verdict=%s",
                     TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                     DirName(g_mtrade.dir),
                     g_lineCode[k], DoubleToString(L, _Digits),
                     (behind ? "behind" : "ahead"),
                     (int)isTrigger,
                     DoubleToString(bodyLo, _Digits),
                     DoubleToString(bodyHi, _Digits),
                     (isTrigger && behind && through) ? "BREAK" : "ok");
      if(isTrigger && behind && through && !vBREAK)
        {
         vBREAK = true;
         breakLineVal  = L;
         breakLineName = g_lineCode[k];
        }
     }

   //--- (e) section 5.6: the HTF aggregate flip exits TREND-following trades
   double mtlH = 0.0, mtlM = 0.0, mtlL = 0.0; // [P-HTFLOG] the HTF leg values (diagnostic)
   int    mtlWant = 0, mtlAnti = -1;          // [P-HTFLOG] anti=-1 => the leg block did not run
   if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
     {
      if(g_mtrade.regimeAtAdmission == REGIME_TREND ||
         g_mtrade.regimeAtAdmission == REGIME_BOTH)
        {
         if(ReadFlow(FL_BUF_HTF_HIGH, mtlH, barShift) &&
            ReadFlow(FL_BUF_HTF_MID,  mtlM, barShift) &&
            ReadFlow(FL_BUF_HTF_LOW,  mtlL, barShift))
           {
            mtlWant = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
            int anti = 0;
            if((int)MathRound(mtlH) == -mtlWant) anti++;
            if((int)MathRound(mtlM) == -mtlWant) anti++;
            if((int)MathRound(mtlL) == -mtlWant) anti++;
             mtlAnti = anti;
             vHTF = (anti >= 2);   // the majority flipped AGAINST the trade
             if(vHTF && InpDebugLog) MtFlipEmit(barShift, barTime, mtlAnti, mtlWant);
           }
        }
     }

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                  "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                  "htfH=%g htfM=%g htfL=%g want=%d anti=%d",
                  TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                  DirName(g_mtrade.dir),
                  DoubleToString(g_mtrade.entryPrice, _Digits),
                  (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                  (int)vSL, (int)vTP,
                  (vBREAK ? breakLineName : "none"),
                  (int)vHTF, (int)MT_EXIT_SCOPE,
                  mtlH, mtlM, mtlL, mtlWant, mtlAnti);

   if(!(vSL || vTP || vBREAK || vHTF)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
   else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = curTp; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else            { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }

    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
                TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                MtExitName(g_mtrade.exitReason),
                (vBREAK ? breakLineName : "-"),
                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
                DoubleToString(g_mtrade.entryPrice, _Digits),
                DoubleToString(g_mtrade.exitPrice, _Digits));
    if(InpDebugLog) MtLifeEmit();
   EmitAlert("EXIT",
             StringFormat("%s%s at %s (entry %s)",
                          MtExitName(g_mtrade.exitReason),
                          (vBREAK ? " [" + breakLineName + "]" : ""),
                          DoubleToString(g_mtrade.exitPrice, _Digits),
                          DoubleToString(g_mtrade.entryPrice, _Digits)),
             true);
  }

//====================== OnTick =========================================
void OnTick()
  {
   static datetime s_lastBarTime = 0;
   datetime currentBarTime = iTime(_Symbol, PERIOD_CURRENT, 1);
   if(currentBarTime == s_lastBarTime) return;
   s_lastBarTime = currentBarTime;
   LoadWorkingSet(1, currentBarTime);
   EvaluateClosedBar(1, currentBarTime);
   StoreWorkingSet(1, currentBarTime);
   //--- [P-EXITMODEL] the section 4 site-3 exit phase: runs AFTER the entry pipeline
   //--- and AFTER the working-set store (it touches NO working-set field - section 7
   //--- separation). Evaluates the managed trade at the NEXT candle's open.
   EvaluateManagedTrade(1);
   //--- [P-NEWS-1 E22] blackout census hook, last: observes the settled state.
   SrjNewsInit();
   if(InpDebugLog && SHADOW_NEWS)
      SrjNewsOnBar(currentBarTime);
  }
//+------------------------------------------------------------------+
