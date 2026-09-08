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

//====================== CQD buffer index ==============================
#define CQD_BUF_DIVVERDICT  6

//====================== FlowLogic buffer indices =====================
#define FL_BUF_LTF_BIAS      2
#define FL_BUF_LTF_OB_VALID  3
#define FL_BUF_LTF_FVG_VALID 4
#define FL_BUF_LTF_OPP_FVG   5
#define FL_BUF_SWING_HIGH    6
#define FL_BUF_SWING_LOW     7
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
//--- MEMBERSHIP RULE: the fifteen fields ResetSequence clears. A field
//--- added to ResetSequence joins the working set and belongs here too.
//--- Council does not decide membership; the build states it.
//---
//--- NO SHypothesis AND NO SCandidate IS INSTANTIATED. Contract 9
//--- declares bundle MANDATORY, and the fifteen globals cannot construct
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
//--- nothing outside these fifteen fields carries sequence state across
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
   bool             stored;
  };

SSrjWorkingSet g_ws161;
int  g_ws161_stores   = 0;
int  g_ws161_loads    = 0;
int  g_ws161_changes  = 0;
int  g_ws161_mismatch = 0;
int  g_ws161_fieldMiss[15];

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
     }
   return "UNKNOWN_FIELD";
  }

//--- Per-field difference between the stored record and the live globals.
//--- Writes fifteen booleans and touches nothing else.
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

   bool d[15];
   SrjWsCompare(d);

   int n = 0;
   for(int i = 0; i < 15; i++)
      if(d[i]) n++;

   if(n == 0)
      return;

   g_ws161_mismatch++;

   for(int i = 0; i < 15; i++)
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

//--- Called after EvaluateClosedBar. Copies the fifteen globals into the
//--- record and counts a change when this bar's set differs from the last
//--- stored one. Writes NO global except this instrument's own counters.
void StoreWorkingSet(int barShift, datetime barTime)
  {
   g_ws161_stores++;

   if(g_ws161.stored)
     {
      bool d[15];
      SrjWsCompare(d);
      for(int i = 0; i < 15; i++)
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
   g_ws161.stored         = true;
  }

//--- End-of-run census. One summary line, then one row per field that
//--- recorded at least one mismatch. Zero rows is the pass shape.
void SrjWs161Census()
  {
   Print("[SRJ-EA] WS161_CENSUS fields=15",
         " loads=",     g_ws161_loads,
         " stores=",    g_ws161_stores,
         " changes=",   g_ws161_changes,
         " mismatch=",  g_ws161_mismatch);

   for(int i = 0; i < 15; i++)
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
   PrintFormat("[SRJ-EA] %s SIGNAL dir=%s poi=%s regime=%s div=%s sess=%s "
               "tp_target=%s tp_R=%.2f sl_ref=%s sl_mode=%s spreadPts=%d "
               "bid=%s ask=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
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
   double bodyHi = MathMax(o, c);
   double bodyLo = MathMin(o, c);
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
   for(int k = 0; k < POI_NLINES; k++)
     {
      double L = lineVal[k];
      if(L == EMPTY_VALUE || L <= 0.0) continue;
      if(l <= L - P + EPS && bodyLo >= L - EPS)
        { int rk = g_authorityRank[k]; if(rk < bestLongRank) { bestLongRank = rk; bestLongLine = k; } }
      if(h >= L + P - EPS && bodyHi <= L + EPS)
        { int rk = g_authorityRank[k]; if(rk < bestShortRank) { bestShortRank = rk; bestShortLine = k; } }
     }
   if(bestLongLine < 0 && bestShortLine < 0) return false;
   if(bestLongLine >= 0 && (bestShortLine < 0 || bestLongRank <= bestShortRank))
     { r.found = true; r.isLong = true;  r.topLine = bestLongLine; }
   else
     { r.found = true; r.isLong = false; r.topLine = bestShortLine; }
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
string CheckFreshness(int barShift)
  {
   double obValid, oppFvg;
   if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift))
      return ABORT_UPSTREAM_UNREADY;
   if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg,  barShift))
      return ABORT_UPSTREAM_UNREADY;
   double t88_fvg = 0.0; if(!ReadFlow(FL_BUF_LTF_FVG_VALID, t88_fvg, barShift)) return ABORT_UPSTREAM_UNREADY; bool t88_a1 = ((int)MathRound(obValid) == 0); bool t88_a2 = ((int)MathRound(t88_fvg) == 0); bool t88_a3 = ((int)MathRound(oppFvg) == 1); int t88_n = (t88_a1 ? 1 : 0) + (t88_a2 ? 1 : 0) + (t88_a3 ? 1 : 0); static int s_t88_ev = 0; static int s_t88_c1 = 0; static int s_t88_c2 = 0; static int s_t88_c3 = 0; s_t88_ev++; if(t88_n == 1) s_t88_c1++; if(t88_n == 2) s_t88_c2++; if(t88_n == 3) s_t88_c3++; if(InpDebugLog && t88_n > 0) PrintFormat("[SRJ-EA] FRESHCOUNT #%d bar=%s state=%s obDead=%d fvgDead=%d oppFvg=%d adverse=%d verdict=%s cum1=%d cum2=%d cum3=%d", s_t88_ev, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), StateName(g_state), (int)t88_a1, (int)t88_a2, (int)t88_a3, t88_n, (t88_n >= 2 ? "ABORT" : "HOLD"), s_t88_c1, s_t88_c2, s_t88_c3);
   if(t88_n >= 2) return (t88_a3 ? ABORT_FRESH_OPP_FVG : ABORT_FRESH_OB_DEAD);
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

//====================== Step 6: 1R stop-loss reference ================
bool ComputeSlReference(int barShift, ENUM_SRJ_DIR dir,
                         double &slRefOut, ENUM_SRJ_SLMODE &slModeOut,
                         const string site)
  {
   static int s_swingDumps = 0;
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
   if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift)) return false;

   double swingHigh, swingLow;
   bool haveHigh = ReadFlow(FL_BUF_SWING_HIGH, swingHigh, barShift)
                   && swingHigh != EMPTY_VALUE && swingHigh > 0.0;
   bool haveLow  = ReadFlow(FL_BUF_SWING_LOW,  swingLow,  barShift)
                   && swingLow  != EMPTY_VALUE && swingLow  > 0.0;

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
        { if(obSwingSideOk) slRefOut = obSwingRef; else { if(!haveLow) return false; slRefOut = swingLow; } }
      else
        { if(obSwingSideOk) slRefOut = obSwingRef; else { if(!haveHigh) return false; slRefOut = swingHigh; } }
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
   bool t75_sideOk = (dir == DIR_LONG) ? (slRefOut < slCurPx) : (slRefOut > slCurPx);
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
         if((dir == DIR_LONG) ? (t75_v >= slCurPx) : (t75_v <= slCurPx)) continue;
         slRefOut = t75_v;
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
      return true;
     }
   else
     {
      int bufIdx = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
      double firstVal = 0.0;
      bool   haveFirst = false;
      for(int s = barShift; s <= barShift + 500; s++)
        {
         double v;
         if(!ReadFlow(bufIdx, v, s)) break;
         if(v == EMPTY_VALUE || v <= 0.0) continue;
         if(!haveFirst) { firstVal = v; haveFirst = true; continue; }
         if(MathAbs(v - firstVal) > _Point)
           {
            slRefOut = v; slModeOut = SL_MODE_2SWING;
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] SL_REF branch=2-swing obValid=0 slRef=%s distPts=%.0f "
                           "firstSwing=%s foundAtShift=%d site=%s "
                           "zoneLo=%s zoneHi=%s",
                           DoubleToString(slRefOut, _Digits),
                           MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
                           DoubleToString(firstVal, _Digits), s, site,
                           DoubleToString(g_zoneLo, _Digits),
                           DoubleToString(g_zoneHi, _Digits));
            return true;
           }
        }
      return false;
     }
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
   for(int s = barShift; s <= barShift + Bars(_Symbol, PERIOD_CURRENT); s++)
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
         for(int s = sh1 + 1; s <= barShift + Bars(_Symbol, PERIOD_CURRENT); s++)
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
   for(int s = sh1 + 1; s <= barShift + Bars(_Symbol, PERIOD_CURRENT); s++)
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
      string fail = CheckFreshness(barShift);
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
      double slRef; ENUM_SRJ_SLMODE slMode;
      if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
         s1_stopRef = slRef; s1_haveStop = true;
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
            /* [Task 31 / Ruling 7a] ADVISORY. Was GoAbort(ABORT_TP_RR_FAIL). iClose is not an entry price before S5: measured 0.17 to 213.27 on one 7-bar sequence as slDist collapses, and every zone-derived alternative overstates by up to 20x. The hard 1R gate now lives only at S5, where the close IS the entry. S2POLL_RR_SHORTFALL above still logs every failure. */ ;
           }
        }
     }

   if(!g_divLatch && g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
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
                     "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     g_lineCode[t73_pr.topLine], DirName(t73_dir),
                     (int)t73_isOpp, (int)t73_isHigh,
                     g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
                     s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
        }
      if((s_t73_bars % 500) == 0)
         PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
                     "higher=%d both=%d",
                     s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
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
               for(int s = s31_sw1Shift + 1; s <= barShift + Bars(_Symbol, PERIOD_CURRENT); s++)
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
         bool  s3_haveStop = ComputeSlReference(barShift, g_dir, s3_slRef, s3_slMode, "S3ARM");

         if(t133_bounded || !s3_haveStop)
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
               //--- [STEP 1] the SL-leg terminator: the walk ends at the stop swing
               if(s3_haveStop && ((g_dir == DIR_LONG) ? (t133_v <= s3_slRef) : (t133_v >= s3_slRef))) break;
               t133_swings++;
               if(t133_v >= s31_zLo && t133_v <= s31_zHi)
                 {
                  t133_hits++;
                  if(t133_first < 0) { t133_first = t133_s; t133_firstV = t133_v; }
                  if(t133_via == "none") t133_via = "SWING";
                 }
              }

            if(t133_hits > 0) t133_inPlay = true;
           }

         s31_inPlay = t133_inPlay;
        }

      if(InpDebugLog)
         PrintFormat("[SRJ-EA] INPLAYCOMMIT bar=%s dir=%s zoneSrc=%s zoneLo=%s zoneHi=%s "
                     "promoT=%s applied=%d bounded=%d scanned=%d swings=%d hits=%d "
                     "firstShift=%d firstVal=%s commitVia=%s legacy=%d legacyVia=%s "
                     "committed=%d changed=%d",
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
                     (int)(s31_inPlay != t133_legacy));

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
         return;
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
         bool isDoji      = (MathAbs(c - o) < _Point * 0.0001);
         bool closesInDir = (g_dir == DIR_LONG) ? (c > o) : (c < o);
         if(!isDoji && closesInDir)
           {
            ENUM_SRJ_STATE prev = g_state;
            g_state = ST_S5_GATE_CHECK;
            LogState(prev, g_state);
           }
        }
     }

   if(g_state == ST_S5_GATE_CHECK)
     {
      bool divOk = g_divLatch;

      double currentPrice = iClose(_Symbol, PERIOD_CURRENT, barShift);
      double tpTarget = 0.0;
      if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S5_NO_TP_TARGET",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
         GoAbort(ABORT_NO_TP_TARGET, g_state); return;
        }

      double slRef = 0.0;
      ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
      if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S5_NO_SL_REF",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
         GoAbort(ABORT_NO_SL_REF, g_state); return;
        }

      double slDist = MathAbs(currentPrice - slRef);
      double tpDist = MathAbs(tpTarget - currentPrice);
      bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);

      if(!tpOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S5_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
         GoAbort(ABORT_TP_RR_FAIL, g_state);
         return;
        }

      if(!divOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S5 waiting: divLatch=0 tpOk=1",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
         return;
        }

      double tpR = (slDist > 0.0) ? (tpDist / slDist) : 0.0;

      string divKind = "regular";
      {
       double verdict;
       for(int s = 1; s <= 50; s++)
         {
          if(iTime(_Symbol, PERIOD_CURRENT, s) < g_anchorBarTime) continue;
          if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) continue;
          if(verdict == EMPTY_VALUE) continue;
          int v = (int)MathRound(verdict);
          bool match = (g_dir == DIR_LONG  && (v == 1 || v == 2)) ||
                       (g_dir == DIR_SHORT && (v == -1 || v == -2));
          if(match) { divKind = (MathAbs(v) == 2) ? "hidden" : "regular"; break; }
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

   SrjWs161Census();

   if(g_hPoi  != INVALID_HANDLE) IndicatorRelease(g_hPoi);
   if(g_hCqd  != INVALID_HANDLE) IndicatorRelease(g_hCqd);
   if(g_hFlow != INVALID_HANDLE) IndicatorRelease(g_hFlow);
   g_hPoi = g_hCqd = g_hFlow = INVALID_HANDLE;
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
  }
//+------------------------------------------------------------------+
