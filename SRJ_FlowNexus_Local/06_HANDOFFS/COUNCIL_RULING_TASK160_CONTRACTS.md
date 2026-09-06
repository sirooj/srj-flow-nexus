# COUNCIL RULING — TASK 160 CONTRACT DECLARATIONS
# Authored by council, Revision 62 Amendment A, 2026-09-06.
# Specification sources, all in council session when this was written:
#   COUNCIL_RULING_TASK159.md            the twelve contracts as amended, twenty items,
#                                        terminator table, ordinal re-expressions
#   REVISION_60 section 9                every field, every classification
#   REVISION_60 sections 6.12 - 6.15     the lifecycle model as it survives
#   BUILDER_RESULT_160-PreK.md           collision surface, SState surface, enum census
#   BUILDER_RESULT_160-PreL.md           include graph, whole-tree type surface, anchors
# Rulings applied: R-96, R-103, R-105, R-111 through R-116, R-120 through R-126.
#
# TARGET FILE      DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
# INSERT AFTER     line 165, which is blank
# INSERT BEFORE    line 166, //====================== Singleton sequence state ====================
# ANCHOR ABOVE     line 164, #define ABORT_POI_REPLACED     "POI_REPLACED"
# EA LINE 159 IS INSIDE THIS REGION AND IS NOT AN ANCHOR (R-116).
# THE BLOCK IS PURE ASCII. The EA is UTF-8 WITH BOM and the BOM is preserved.
#
# TYPES ONLY. No instance, no registry, no array of records, no initialiser, no
# function, no #property change, no include change. Unreferenced type declarations
# emit no code, so Tier 1 byte-identity holds BY CONSTRUCTION and not by measurement.
#
# THE CODE REGION BELOW IS THE INSERT BLOCK, VERBATIM. Its line count and byte size are
# DERIVED BY THE BUILDER at extraction time and are deliberately NOT ASSERTED HERE.
# It begins at the line reading //====================== [Task 160] and ends at the
# line reading //====================== end [Task 160] contracts ===================

```mql5
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
    CANDIDATE_EXPIRED        = 8 };

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
```

# COLLISION CENSUS SET, 121 identifiers, for Task 160's STAGE 0 gate.
# Enum members are GLOBALLY SCOPED in MQL5 and are censused. STRUCT MEMBER
# NAMES ARE SCOPED AND ARE NOT CENSUSED (R-122).
#
# 3 defines, 18 enum type names, 13 struct type names, 87 enum member names.
# Expected result: ZERO HITS in all sixteen canonical files. Any hit is
# BLOCKED-FOR-COUNCIL and is never a name the builder changes.