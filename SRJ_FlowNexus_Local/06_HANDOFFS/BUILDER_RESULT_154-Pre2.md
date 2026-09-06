# BUILDER RESULT — TASK 154-Pre2

**Task:** BUFFER-36 WRITE MULTIPLICITY, OBJID DOMAIN, AND RESET-ORDER CLARIFICATION
**Status:** READY FOR BUILDER (task file line 3)
**Form:** D (source-only technical clarification) — confirmed
**Production edit:** NO — confirmed
**Compile:** NO — confirmed
**Run:** NO — confirmed
**Build method:** read-only source inspection via shell commands only (PowerShell `Get-Content` / `Select-String` / `certutil -hashfile`); no MetaEditor access; no file modified except this result file.

---

```
TASK 154-Pre2 RESULT

Status: COMPLETED

Files read: [see "Files read and commands used" below]

Files written: NONE
  (exception: this result report is the deliverable, written as
   BUILDER_RESULT_154-Pre2.md in the workflow-control directory 06_HANDOFFS)

Commands failed: none

Additional files required: 5 canonical files, each named and justified below
  (1) SRJ_BiasEngine.mqh      - required by Block D3 (SRJ_Bias_PerBarResetPass
      definition is not in the initially allowed files; observed call site at
      SRJ_FlowLogic.mq5:855) and by Block C3/C4/E5 (SRJ_Bias_DecisionBlock
      assignments at lines 228/282 and the overwrite-semantics comment at
      lines 342-347 sit in this file).
  (2) SRJ_Fractals.mqh        - required to mechanically prove Block B3
      outer-branch mutual exclusion: observed symbols srjH/srjL used at
      SRJ_ImbalanceMgr.mqh:115/232 are defined here (lines 10-11).
  (3) SRJ_Sessions.mqh        - required to attribute observed write/expire
      sites of the Block D5 candidate fields freshSweepTag/freshSweepExpired
      (lines 456/471/282-309) to their enclosing function SRJ_Sessions_Pass.
  (4) SRJ_OrderblockMgr.mqh    - required to attribute observed write/read sites
      of the Block D5 candidate fields tickOBIsValid / *InvalidationsThisBar
      (lines 171-188, 535-551, 586-608) to SRJ_OB_ReplayActivationInvalidation,
      SRJ_OB_ActivationInvalidationPass and SRJ_OB_CounterAggregationPass, and
      objId reads (lines 876/922).
  (5) SRJ_Panels.mqh          - required to attribute read sites of
      hasPersistedOpposingFVG (lines 17/251) and of the D5 candidate fields
      (lines 15/43/204-205/252/322/352-355) to SRJ_computeBiasPaneColorARGB,
      SRJ_buildBiasPaneText, SRJ_RenderBiasPane, SRJ_RenderMTFBox.
  No archived copies, no workflow .txt dumps, no files outside the canonical
  tree were read.

Current source hashes (SHA256, certutil -hashfile):
  SRJ_FlowLogic.mq5  SHA256: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
  SRJ_ImbalanceMgr.mqh SHA256: 87886cd42e38ed6592dc798ca17a1ebb889b5f4521f389d5fd837fcaa2d482b6
  SRJ_State.mqh      SHA256: 85b2635627b0e217d233afcea191f9cab766f309eea464080248be13422d02d8
  SRJ_Types.mqh      SHA256: 773d99444b958b98ce3aecca87690f40b743a5f6a71e47ba9e644d751808e78dc
Current source hashes (SHA256, certutil -hashfile):
  SRJ_FlowLogic.mq5       SHA256: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
  SRJ_ImbalanceMgr.mqh    SHA256: 87886cd42e38ed6592dc798ca17a1ebb889b5f4521f389d5fd837fcaa2d482b6
  SRJ_State.mqh           SHA256: 85b2635627b0e217d233afcea191f9cab766f309eea464080248be13422d02d8
  SRJ_Types.mqh           SHA256: 773d99444b958b98ce3aecca87690f40b743a5f6a71e47ba9e644d751808e78dc
  SRJ_BiasEngine.mqh      SHA256: 384a25bad6f92cdadd62f6d297b71b7a0afc809c7a50bbd4fac532c85b7ad89e
  SRJ_Fractals.mqh        SHA256: e4b99da55ab278853c6d8fa9bc8fac599306d01e6e5b14ab64682e3f04473597
  SRJ_Sessions.mqh        SHA256: a0c8542a4f25dab78d2a7fbbc8cb4eddef87643164cb5038ffbbec27040b0886
  SRJ_OrderblockMgr.mqh   SHA256: 9dcd8d8db57089e525a5ed1ccfe4ba6b4c4b1d63e72d6868cd101e1b4da5f27d
  SRJ_Panels.mqh          SHA256: 199ad6b104cce28a30aa610a632c1fffa42f1d529280e24c33519b81c700c736
===============================================================================
BLOCK A — OBJID TYPE AND DOMAIN
===============================================================================

A1 — objId type-establishing declarations:

  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh
  Occurrences: 7
     30: // Write-only for now: nothing reads objId yet.                 — OTHER (comment)
     63: long     objId;              // [Task 98a] immutable identity, set at construction
                                                                       — FIELD DECLARATION (class COrderblock, lines 37-92)
     85: objId             = 0;           // [Task 98a] 0 = unassigned
                                                                       — OTHER (assignment inside COrderblock ctor, lines 65-88)
    114: long     objId;               // [Task 98a] immutable identity, set at construction
                                                                       — FIELD DECLARATION (class CImbalance, lines 97-137)
    132: objId        = 0;         // [Task 98a] 0 = unassigned
                                                                       — OTHER (assignment inside CImbalance ctor, lines 116-133)
    274: ob.objId             = SRJ_NextObjId();   // [Task 98a]      — OTHER (assignment in NewOrderblock, lines 248-276)
    302: fvg.objId        = SRJ_NextObjId();   // [Task 98a]          — OTHER (assignment in NewImbalance, lines 281-304)

  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5
  Occurrences: 4
      8: #property indicator_buffers 34  // [Task 113] ... [Task 102] Added 31 (selected XOB objId), 32 (selected FVG objId).   — OTHER (comment)
     91: // 24/25. Carries COrderblock.objId and CImbalance.objId (assigned in Task 98a)   — OTHER (comment)
    966: g_bufXobObjId[target]    = (double)xob.objId;   // [Task 102] — MEMBER ACCESS (read, cast to double; XOB buffer 31)
   1028: g_bufFvgObjId[target]       = (double)freshFvg.objId;   // [Task 102] — MEMBER ACCESS (read, cast to double; FVG buffer 32)

  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
  Occurrences: 0
  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh
  Occurrences: 0

  Tree-wide confirmations (additional files, read evidence only):
    SRJ_OrderblockMgr.mqh:876  " objId=", lockedOB.objId,        — MEMBER ACCESS (read, debug Print in SRJ_ApplyPromotion)
    SRJ_OrderblockMgr.mqh:922  " objId=", obCheck.objId,        — MEMBER ACCESS (read, debug Print in SRJ_ApplyPromotion)

  Declared type: `long` (64-bit signed integer in MQL5)
    from FIELD DECLARATION line 63 (COrderblock) and line 114 (CImbalance),
    plus the sequence counter `long g_srjObjIdSeq` (line 31) and
    `long SRJ_NextObjId(void)` return type (line 32).

A2 — SRJ_NextObjId definition:
  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh
  Classification: DEFINITION
  Return type: long
  Parameter list: (void) — none
  Brace-counted range: 32-32 (single-line body)
  Definition paste (line 32):
    long SRJ_NextObjId(void) { g_srjObjIdSeq++; return g_srjObjIdSeq; }
  Counter declaration (line 31):
    long g_srjObjIdSeq = 0;

A3 — objId domain establishment:
  Initial value assignments:
    Line 85: objId = 0;   // [Task 98a] 0 = unassigned
        — context: COrderblock(void) ctor (SRJ_Types.mqh lines 65-88, body 66-88)
    Line 132: objId = 0;  // [Task 98a] 0 = unassigned
        — context: CImbalance(void) ctor (SRJ_Types.mqh lines 116-133, body 117-133)
  Increment/assignment patterns:
    Line 31: long g_srjObjIdSeq = 0;
        — context: file scope (SRJ_Types.mqh)
    Line 32: long SRJ_NextObjId(void) { g_srjObjIdSeq++; return g_srjObjIdSeq; }
        — context: file scope; pre-increment ⇒ first call returns 1 (0+1)
    Line 274: ob.objId = SRJ_NextObjId();
        — context: NewOrderblock (SRJ_Types.mqh lines 248-276, body 254-276)
    Line 302: fvg.objId = SRJ_NextObjId();
        — context: NewImbalance (SRJ_Types.mqh lines 281-304, body 286-304)
  Reset/clear operations:
    Line 85 / 132: objId = 0  (constructor "unassigned" state, before any SRJ_NextObjId)
    Line 487: g_srjObjIdSeq = 0;   // [Task 98a] ids restart with the object arrays
        — context: SRJ_StateInit (SRJ_State.mqh lines 297-490, body 298-490);
          runs only on full recalc / OnInit
  Source documentation (SRJ_Types.mqh lines 22-30):
    "Assigned once at construction, never reassigned, never reused within a run."
    "Write-only for now: nothing reads objId yet."
    "Reset to 0 in SRJ_StateInit(), which runs only on a full recalc where
     every object is destroyed and rebuilt — so an id is unique for the life of a
     run but is NOT stable across a recalc."
  Source documentation (SRJ_FlowLogic.mq5 lines 90-101):
    "0.0 = no object selected. SRJ_NextObjId() starts at 1, so 0 is never a real
     id. ... Ids are unique for the life of a run but NOT stable across a full
     recalc (SRJ_StateInit destroys every object and restarts the counter)."

A4 — objId domain questions:
  NOTE ON TERMINOLOGY (correction applied): the single ambiguous question
  "Can objId = 0 be valid?" has been removed. "Valid" was undefined and
  conflated three different domains — (a) type representability,
  (b) default/unassigned state, (c) assigned live-object identity. Each domain
  is now answered separately and explicitly below. No control-flow, reset,
  buffer, ordering, hash, or source-paste finding is affected by this
  terminology correction.

  ZERO DOMAIN
  -----------
  Can objId = 0 be represented by the type: YES
    Evidence (ESTABLISHED CURRENT SOURCE FACT):
      - field type is `long` (SRJ_Types.mqh:63 COrderblock, :114 CImbalance),
        a 64-bit signed integer; 0 is inside its representable range
        (-9,223,372,036,854,775,808 .. 9,223,372,036,854,775,807).
      - The source contains no type-level or validation-level construct that
        would exclude 0 from the representable set.

  Is 0 used as an unassigned/default value: YES
    Evidence (ESTABLISHED CURRENT SOURCE FACT):
      - COrderblock(void) ctor assigns objId = 0 (SRJ_Types.mqh:85) with the
        source comment "[Task 98a] 0 = unassigned";
      - CImbalance(void) ctor assigns objId = 0 (SRJ_Types.mqh:132) with the
        same source comment "[Task 98a] 0 = unassigned";
      - the id counter itself starts at 0 (SRJ_Types.mqh:31,
        long g_srjObjIdSeq = 0;) and is reset to 0 in SRJ_StateInit
        (SRJ_State.mqh:487);
      - the export-side sentinel comment (SRJ_FlowLogic.mq5:97-98) states
        "0.0 = no object selected. SRJ_NextObjId() starts at 1, so 0 is never a
        real id."
      - Therefore 0 is the documented default/unassigned marker value, and it is
        NOT forbidden by the source.

  Can a constructed/live object have objId = 0 under the observed factory path: NO
    Evidence (ESTABLISHED CURRENT SOURCE FACT, scoped to the observed path):
      - the observed factory path for orderblocks is NewOrderblock
        (SRJ_Types.mqh lines 248-276), which assigns
        ob.objId = SRJ_NextObjId(); at line 274;
      - the observed factory path for imbalances is NewImbalance
        (SRJ_Types.mqh lines 281-304), which assigns
        fvg.objId = SRJ_NextObjId(); at line 302;
      - SRJ_NextObjId (SRJ_Types.mqh:32) increments before returning
        ( { g_srjObjIdSeq++; return g_srjObjIdSeq; } ) over a counter initialized
        to 0 (line 31), so its first returned value is 1 and its returned
        sequence is 1,2,3,... — mechanically >= 1;
      - consequently, a constructed/live object reached through the observed
        factory path has no source-observed objId of 0; 0 survives only in the
        pre-factory constructor/default state.
    Scope statement: this conclusion is scoped to the observed factory path
      (lines 274/302). It is a statement about the reachable assigned object
      identity, NOT a claim that the type or the default state excludes 0 —
      both of those are answered YES above.

  NEGATIVE DOMAIN
  ---------------
  Can the long type represent negative values: YES
    Evidence (ESTABLISHED CURRENT SOURCE FACT):
      - `long` is signed 64-bit in MQL5; its range includes
        -9,223,372,036,854,775,808 .. -1. Nothing in the source narrows the
        declared type of the objId fields (SRJ_Types.mqh:63 / :114).

  Does the observed object-construction path assign negative objIds: NO
    Evidence (ESTABLISHED CURRENT SOURCE FACT, scoped to the observed path):
      - the only objId assignments observed on the construction path are
        SRJ_Types.mqh:274 (ob.objId = SRJ_NextObjId();) and
        SRJ_Types.mqh:302 (fvg.objId = SRJ_NextObjId(););
      - SRJ_NextObjId returns the strictly increasing sequence 1,2,3,...
        (lines 31-32), which contains no negative value;
      - the counter is reset only to 0 (SRJ_State.mqh:487), never below 0;
      - the remaining observed objId sites are reads/casts, not writes
        (SRJ_FlowLogic.mq5:966, :1028; SRJ_OrderblockMgr.mqh:876, :922).

  Are negative objIds impossible under every possible source assignment path:
  UNKNOWN
    Reason (evidence-limited, no absolute impossibility claimed):
      - the census performed for this task enumerated objId sites in the files
        read for this task (SRJ_Types.mqh, SRJ_State.mqh, SRJ_FlowLogic.mq5,
        SRJ_ImbalanceMgr.mqh, SRJ_BiasEngine.mqh, SRJ_Fractals.mqh,
        SRJ_Sessions.mqh, SRJ_OrderblockMgr.mqh, SRJ_Panels.mqh);
      - that census does NOT itself prove that every possible assignment path in
        the complete source tree was covered (no whole-tree completeness proof is
        recorded in this report, and no additional source file was inspected for
        this correction);
      - therefore reachability of a negative objId is reported as UNKNOWN rather
        than as absolute impossibility. The earlier absolute "NO" answer to
        "Can negative objId values be valid?" overstated the evidence and is
        withdrawn in favour of the four scoped answers above.

  Maximum representable type range:
    Type: long (64-bit signed)
    Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

  Is conversion to double lossless?
    Answer: PARTIAL
    Explanation: double mantissa = 53 bits; long = 64 bits, so the FULL long range
      is not lossless in double. Conversion is exact for |v| <= 2^53
      (9,007,199,254,740,992). The source-assigned objId domain is the monotonic
      counter 0..N (N = objects created in a run, in practice far below 2^53), so
      every value that actually occurs converts exactly; the extremes of the raw
      long type would not. The existing export sites already cast
      `(double)xob.objId` / `(double)freshFvg.objId` (FlowLogic lines 966/1028),
      and the buffer comment (lines 97-98) relies on ids being safely castable to
      double with a 0.0 sentinel. Verdict: PARTIAL (lossless for the reachable
      domain, not for the full long-type range).

A5 — Valid-value restrictions (domain-separated):
  Restriction: ESTABLISHED BY CURRENT SOURCE for the observed paths; NOT
  established as a whole-tree impossibility proof.
  The source establishes the objId fact set as follows, by domain:
    - TYPE DOMAIN: `long` (64-bit signed) can represent 0 and negative values
      (SRJ_Types.mqh:63 / :114). No source construct narrows this.
    - DEFAULT/UNASSIGNED DOMAIN: 0 is the documented unassigned/default value
      (ctor lines 85/132 with comment "0 = unassigned"; counter init line 31;
      buffer sentinel 0.0, FlowLogic lines 97-98).
    - ASSIGNED-IDENTITY DOMAIN (observed factory path): assigned ids are the
      SRJ_NextObjId() sequence 1,2,3,... (lines 31-32, 274, 302), so a
      constructed/live object on that path has no source-observed objId of 0 and
      no source-observed negative objId.
    - COMPLETENESS: whether NO assignment path anywhere in the complete source
      tree can produce a negative (or a post-construction 0) is UNKNOWN — the
      census recorded here covers the files read for this task, not a proven
      exhaustive whole-tree enumeration.
    - ids are unique for a run, restarted to 0 only on full recalc (line 487).
  Required evidence if the council wants empirical confirmation, or wants the
  UNKNOWN above closed: (a) an exhaustive whole-tree write census of every
  `objId` assignment, and/or (b) instrumented logging of the assigned ids at the
  factory call sites. Neither is performed in this report.

===============================================================================
BLOCK B — QUALIFYING-WRITE CONTROL FLOW
===============================================================================

B1 — hasPersistedOpposingFVG assignments in SRJ_FVG_CreationRenewalPass:
  Function: SRJ_FVG_CreationRenewalPass
  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
  Definition header: lines 108-110
  Brace-counted range (body): 111-348 (verified by brace-balance scan)
  Assignments (re-established by census; 4 total):
    Line 199: g_s.hasPersistedOpposingFVG = false;
    Line 226: g_s.hasPersistedOpposingFVG = true;
    Line 316: g_s.hasPersistedOpposingFVG = false;
    Line 343: g_s.hasPersistedOpposingFVG = true;
  Count: 4

B2 — Per-assignment analysis:

  Assignment 1 (line 199):
    Exact current source line: 199
    Exact source text:    g_s.hasPersistedOpposingFVG = false;
    Exact RHS:            false
    Full open-brace stack (outermost -> innermost; open-brace line: closing line — header):
      111:348 — void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],
                const datetime &time[],int rates_total,int i,
                bool withinLookbackWindow,bool barClosed)     (function body)
      116:230 — if(low[i] > srjH(high,i,2))                   (bullish FVG gap condition)
      123:229 — if(fvgWithinStructure)
      126:222 — if(isInBiasFVG)      // isInBiasFVG = (g_s.currentBias == "bullish") at line 124
      175:221 — if(hasNewOB && !g_s.justChangedBias)
    Enclosing conditions: if(low[i] > srjH(high,i,2)); if(fvgWithinStructure);
                          if(isInBiasFVG); if(hasNewOB && !g_s.justChangedBias)
    Execution continues after assignment: YES (no return/break/goto after the
                          assignment; statements continue through line 220, then
                          block 175-221 closes)
    Control flow affecting other writes:
      - this branch is the *if(true)* arm of if(isInBiasFVG)/else (lines 125/223-228),
        mutually exclusive with line 226 (the else arm) — a path that reaches 199
        cannot reach 226 in the same call;
      - the outer block 116-230 is one arm of the two independent top-level
        conditions (line 115 vs line 232); reaching any line of block 116-230 and
        reaching any line of block 233-347 in one call is impossible (proof in B3);
      - no return/break/continue exists anywhere in the function body between the
        first statement and line 348.

  Assignment 2 (line 226):
    Exact current source line: 226
    Exact source text:    g_s.hasPersistedOpposingFVG = true;
    Exact RHS:            true
    Full open-brace stack (outermost -> innermost; open-brace line: closing line — header):
      111:348 — function body (header as above)
      116:230 — if(low[i] > srjH(high,i,2))
      123:229 — if(fvgWithinStructure)
      224:228 — else                                                    (else of if(isInBiasFVG))
    Enclosing conditions: if(low[i] > srjH(high,i,2)); if(fvgWithinStructure);
                          else-branch of if(isInBiasFVG)  [line 223 header "else"]
    Execution continues after assignment: YES (statement at line 227
                          SRJ_QueueOpposingPromotion(i,"bullish"); executes next;
                          then block 224-228 closes)
    Control flow affecting other writes:
      - reachable only when isInBiasFVG == false, i.e., currentBias != "bullish";
        the if(isInBiasFVG) TRUE arm (which contains line 199) is skipped;
      - outer block 116-230 excludes the second top-level block (233-347), same
        call impossible (proof in B3);
      - no return/break/continue relevant.

Assignment 3 (line 316):
    Exact current source line: 316
    Exact source text:    g_s.hasPersistedOpposingFVG = false;
    Exact RHS:            false
    Full open-brace stack (outermost -> innermost; open-brace line: closing line — header):
      111:348 — function body (header as above)
      233:347 — if(high[i] < srjL(low,i,2))                   (bearish FVG gap condition)
      240:346 — if(fvgWithinStructure)
      243:339 — if(isInBiasFVG)      // isInBiasFVG = (g_s.currentBias == "bearish") at line 241
      292:338 — if(hasNewOB && !g_s.justChangedBias)
    Enclosing conditions: if(high[i] < srjL(low,i,2)); if(fvgWithinStructure);
                          if(isInBiasFVG); if(hasNewOB && !g_s.justChangedBias)
    Execution continues after assignment: YES (no return/break/goto after the
                          assignment; statements continue through line 337, then
                          block 292-338 closes)
    Control flow affecting other writes:
      - this branch is the *if(true)* arm of if(isInBiasFVG)/else (lines 242/340-345),
        mutually exclusive with line 343 (the else arm) — a path that reaches 316
        cannot reach 343 in the same call;
      - outer block 233-347 excludes the first top-level block (116-230), same call
        impossible (proof in B3);
      - no return/break/continue relevant.

  Assignment 4 (line 343):
    Exact current source line: 343
    Exact source text:    g_s.hasPersistedOpposingFVG = true;
    Exact RHS:            true
    Full open-brace stack (outermost -> innermost; open-brace line: closing line — header):
      111:348 — function body (header as above)
      233:347 — if(high[i] < srjL(low,i,2))
      240:346 — if(fvgWithinStructure)
      341:345 — else                                                    (else of if(isInBiasFVG))
    Enclosing conditions: if(high[i] < srjL(low,i,2)); if(fvgWithinStructure);
                          else-branch of if(isInBiasFVG)  [line 340 header "else"]
    Execution continues after assignment: YES (statement at line 344
                          SRJ_QueueOpposingPromotion(i,"bearish"); executes next;
                          then block 341-345 closes)
    Control flow affecting other writes:
      - reachable only when isInBiasFVG == false, i.e., currentBias != "bearish";
        the if(isInBiasFVG) TRUE arm (which contains line 316) is skipped;
      - outer block 233-347 excludes the first top-level block (116-230), same call
        impossible (proof in B3);
      - no return/break/continue relevant.

B3 — Write multiplicity verdict:
  Verdict: EXACTLY ONE WRITE PER CALL PROVED
  Analysis:
    (a) Function-level guard: lines 112-113
        if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3)) return;
        — if the guard fails, the function returns before any qualifying write.
    (b) The only conditional paths that can reach a qualifying write are the two
        top-level blocks:
          block U = lines 116-230 (bullish gap), entered when  low[i] > srjH(high,i,2),
          block D = lines 233-347 (bearish gap), entered when high[i] < srjL(low,i,2).
        srjH/srjL definitions (SRJ_Fractals.mqh lines 10-11):
          double srjH(const double &high[], int i,int k) { return high[i-k];  }
          double srjL(const double &low[],  int i,int k) { return low[i-k];   }
        so srjH(high,i,2) = high[i-2], srjL(low,i,2) = low[i-2].
        For a single bar i, low[i] <= high[i] and high[i-2] >= low[i-2] always
        hold, therefore low[i] > high[i-2] and high[i] < low[i-2] cannot both be
        true for the same i. Block U and block D are mutually exclusive. (This is
        a mathematical property of OHLC data, not strategy interpretation.)
    (c) Inside each top-level block the qualifying writes sit in mutually
        exclusive if/else arms:
          - block U: line 199 (reached only when isInBiasFVG == true, i.e.,
            currentBias == "bullish", AND hasNewOB && !justChangedBias)
            vs line 226 (reached only when isInBiasFVG == false) — `if`/`else`
            at lines 125/223, braces 126-222 vs 224-228.
          - block D: line 316 (reached only when isInBiasFVG == true, i.e.,
            currentBias == "bearish", AND hasNewOB && !justChangedBias)
            vs line 343 (reached only when isInBiasFVG == false) — `if`/`else`
            at lines 242/340, braces 243-339 vs 341-345.
    Combined: at most one of the four writes can execute per call; zero writes
    are also possible (no gap, or guard fails).

B4 — Mutual exclusion evidence (B3 = EXACTLY ONE WRITE PER CALL PROVED):
  Exact control-flow evidence:

  SRJ_ImbalanceMgr.mqh:
   112:   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))
   113:      return;
   115:   if(low[i] > srjH(high,i,2))
   116:     {
   ...
   124:    bool isInBiasFVG = (g_s.currentBias == "bullish");
   125:    if(isInBiasFVG)
   126:      {
   ...
   199:          g_s.hasPersistedOpposingFVG = false;      // bull in-bias renewal
   ...
   222:      }
   223:    else
   224:      {
   ...
   226:       g_s.hasPersistedOpposingFVG = true;           // bull opposing FVG
   227:       SRJ_QueueOpposingPromotion(i,"bullish");
   228:      }
   229:     }
   230:    }
   ...
   232:   if(high[i] < srjL(low,i,2))
   233:     {
   ...
   241:    bool isInBiasFVG = (g_s.currentBias == "bearish");
   242:    if(isInBiasFVG)
   243:      {
   ...
   316:          g_s.hasPersistedOpposingFVG = false;      // bear in-bias renewal
   ...
   339:      }
   340:    else
   341:      {
   ...
   343:       g_s.hasPersistedOpposingFVG = true;           // bear opposing FVG
   344:       SRJ_QueueOpposingPromotion(i,"bearish");
   345:      }
   346:     }
   347:    }
   348:   }

  SRJ_Fractals.mqh (predicate definitions):
   10: double srjH(const double &high[], int i,int k)   { return high[i-k];  }
   11: double srjL(const double &low[],  int i,int k)   { return low[i-k];   }

  No execution path can reach two qualifying assignments because:
    - both conditions low[i] > high[i-2] and high[i] < low[i-2] cannot hold for
      the same bar (proof in B3b), so no call enters block U AND block D;
    - within a block, the if(isInBiasFVG)/else pair makes the two writes in that
      block mutually exclusive;
    - the early return at 112-113 prevents any write when the guard fails.

B5 — Multiple execution orderings (if B3 = MULTIPLE WRITES PER CALL POSSIBLE):
  N/A — Block B3 determines EXACTLY ONE WRITE PER CALL PROVED, so no
  multi-write ordering exists within one pass call. (Cross-function per-bar
  ordering across the pass and SRJ_Bias_DecisionBlock is reported under Block C.)

<!--B-CONT-4-->
===============================================================================
BLOCK C — SAME-BAR CALL AND OVERWRITE ORDER
===============================================================================

C1 — Per-bar loop containing SRJ_FVG_CreationRenewalPass:

  File: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5
  Loop header line: 819
  Loop brace-counted range: 820–1155 (closing brace of for-loop body)
  Loop variable name: i
  Header text: for(int i = start; i < rates_total; i++)

C2 — Ordered call sequence from start of per-bar processing through the
  hasPersistedOpposingFVG buffer export (only call statements and
  assignments affecting g_s.hasPersistedOpposingFVG shown):

  Pre-loop initialization (prevCalc == 0):
    755:          ArrayInitialize(g_bufOppFVG,       EMPTY_VALUE);

  Per-bar loop body:
    849:       SRJ_OB_CreationPass(open,high,low,close,time,rates_total,i,
    850:                           withinLookbackWindow,barClosed);
    852:       SRJ_Sessions_Pass(high,low,time,rates_total,i,
    853:                         withinLookbackWindow);
    855:       SRJ_Bias_PerBarResetPass(barClosed);
    857:       SRJ_OB_ActivationInvalidationPass(open,high,low,close,time,rates_total,i,
    858:                                         withinLookbackWindow,barClosed);
    860:       SRJ_OB_CounterAggregationPass(i,barClosed);
    862:       SRJ_OB_InactiveLinePrunePass(withinLookbackWindow);
    864:       SRJ_OB_OpposingCachePass(i,finalLookback,withinLookbackWindow);
    866:       SRJ_Bias_WeakFlipLatchPass();
    868:       SRJ_FVG_CreationRenewalPass(high,low,time,rates_total,i,
    869:                                   withinLookbackWindow,barClosed);
    871:       SRJ_FVG_FillDetectionPass(open,close,i,withinLookbackWindow,barClosed);
    873:       SRJ_FVG_TickValidRecomputePass(withinLookbackWindow);
    875:       SRJ_Bias_StructureDetectionPass(high,low,i,finalLookback,
    876:                                       withinLookbackWindow,barClosed);
    878:       SRJ_Bias_DecisionBlock(i,withinLookbackWindow,barClosed);
    880:       SRJ_Alerts_DispatchBiasRenewal(i);
    881:       SRJ_OB_DeferredPromotionPass(i,barClosed);
    896:       // [NEW EXPORT BLOCK]
    898:       int target = i - 1;
    899:       if(target >= 0)
    904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;

C3 — Every function called in the C2 interval that can assign to
  hasPersistedOpposingFVG (census by definition-header rule + brace counting):

  Function: SRJ_OB_CreationPass          File: SRJ_OrderblockMgr.mqh  assigns: NO
  Function: SRJ_Sessions_Pass            File: SRJ_Sessions.mqh      assigns: NO
  Function: SRJ_Bias_PerBarResetPass     File: SRJ_BiasEngine.mqh    assigns: NO
    (Resets structureConfirmedThisBar, wasBiasFlip, oldBias,
     initialBiasJustSet, drawBiasLineNow, newBiasDirection,
     suppressBiasPaneStatusThisBar, drawStructureRenewalLineNow,
     weakFlipPreconditionMet, renewalDirection, bullishBiasFlipAlert,
     bearishBiasFlipAlert, bullishStructureRenewalAlert,
     bearishStructureRenewalAlert, bullishOBCountedThisBar,
     bearishOBCountedThisBar, and conditionally justChangedBias,
     bullishOBInvalidationsThisBar, bearishOBInvalidationsThisBar.
     hasPersistedOpposingFVG is NOT mentioned.)
  Function: SRJ_OB_ActivationInvalidationPass File: SRJ_OrderblockMgr.mqh assigns: NO
    (Writes tickOBIsValid at lines 535/537 and *InvalidationsThisBar at 544/551.)
  Function: SRJ_OB_CounterAggregationPass File: SRJ_OrderblockMgr.mqh assigns: NO
  Function: SRJ_OB_InactiveLinePrunePass File: SRJ_OrderblockMgr.mqh assigns: NO
  Function: SRJ_OB_OpposingCachePass     File: SRJ_OrderblockMgr.mqh assigns: NO
  Function: SRJ_Bias_WeakFlipLatchPass   File: SRJ_BiasEngine.mqh    assigns: NO
    (Reads hasPersistedOpposingFVG at line 382 as condition:
     if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&
     g_s.hasPersistedOpposingFVG) g_s.weakFlipPreconditionMet = true;
     write target is weakFlipPreconditionMet, NOT hasPersistedOpposingFVG.)
  Function: SRJ_FVG_CreationRenewalPass  File: SRJ_ImbalanceMgr.mqh  assigns: YES
      Line 199: g_s.hasPersistedOpposingFVG = false;  (bull in-bias renewal)
      Line 226: g_s.hasPersistedOpposingFVG = true;   (bull opposing FVG)
      Line 316: g_s.hasPersistedOpposingFVG = false;  (bear in-bias renewal)
      Line 343: g_s.hasPersistedOpposingFVG = true;   (bear opposing FVG)
  Function: SRJ_FVG_FillDetectionPass    File: SRJ_ImbalanceMgr.mqh  assigns: NO
  Function: SRJ_FVG_TickValidRecomputePass File: SRJ_ImbalanceMgr.mqh assigns: NO
  Function: SRJ_Bias_StructureDetectionPass File: SRJ_BiasEngine.mqh assigns: NO
  Function: SRJ_Bias_DecisionBlock       File: SRJ_BiasEngine.mqh    assigns: YES
      Line 228: g_s.hasPersistedOpposingFVG = false;  (inside if(doRenewal))
      Line 282: g_s.hasPersistedOpposingFVG = false;  (inside
                                                           else if(doStrongFlip ||
                                                           doWeakSignalFlip))
  Function: SRJ_Alerts_DispatchBiasRenewal File: SRJ_FlowLogic.mq5  assigns: NO
  Function: SRJ_OB_DeferredPromotionPass File: SRJ_OrderblockMgr.mqh assigns: NO
  Function: SRJ_OB_DeferredPromotionPass File: SRJ_OrderblockMgr.mqh assigns: NO

C4 — Can a qualifying boolean write occur before the creation/renewal pass?

  BEFORE the creation/renewal pass (same per-bar loop iteration):
    NO. None of SRJ_OB_CreationPass, SRJ_Sessions_Pass,
    SRJ_Bias_PerBarResetPass, SRJ_OB_ActivationInvalidationPass,
    SRJ_OB_CounterAggregationPass, SRJ_OB_InactiveLinePrunePass,
    SRJ_OB_OpposingCachePass, or SRJ_Bias_WeakFlipLatchPass assign to
    hasPersistedOpposingFVG (C3 census). The field is NOT reset by
    SRJ_Bias_PerBarResetPass.

  AFTER the creation/renewal pass but BEFORE the export:
    YES. SRJ_Bias_DecisionBlock (line 878) executes after
    SRJ_FVG_CreationRenewalPass (line 868) and before the export
    (line 904). It can write g_s.hasPersistedOpposingFVG = false at
    line 228 (doRenewal path) or line 282 (doStrongFlip/doWeakSignalFlip
    path). Source comment at SRJ_BiasEngine.mqh:342–347:
      "SRJ_FVG_CreationRenewalPass runs earlier in the bar and can raise
       the flag against the pre-decision bias; if a flip then lands on the
       same bar, that flag now points the wrong way. Drop it rather than
       draw a renewal against the new bias, and withdraw the alert it
       would have fired."

C5 — Complete same-bar call sequence through the existing boolean export:

  Full ordered sequence for one bar i (loop start → export):

    SRJ_OB_CreationPass(...)                             [849]
    SRJ_Sessions_Pass(...)                               [852]
    SRJ_Bias_PerBarResetPass(barClosed)                  [855]
    SRJ_OB_ActivationInvalidationPass(...)                [857]
    SRJ_OB_CounterAggregationPass(i,barClosed)           [860]
    SRJ_OB_InactiveLinePrunePass(...)                    [862]
    SRJ_OB_OpposingCachePass(...)                        [864]
    SRJ_Bias_WeakFlipLatchPass()                         [866]
    SRJ_FVG_CreationRenewalPass(...)                     [868]  ← first write site
    SRJ_FVG_FillDetectionPass(...)                       [871]
    SRJ_FVG_TickValidRecomputePass(...)                  [873]
    SRJ_Bias_StructureDetectionPass(...)                 [875]
    SRJ_Bias_DecisionBlock(...)                          [878]  ← second write site
    SRJ_Alerts_DispatchBiasRenewal(i)                    [880]
    SRJ_OB_DeferredPromotionPass(i,barClosed)            [881]
    SRJ_Draw_BiasAndRenewalLines(...)                    [882]
    SRJ_FVG_DrawRefreshPass(...)                         [883]
    SRJ_EmitFractals(...)                                [884]
    SRJ_Panels_BiasPane(...)                             [885]
    SRJ_OB_PruningPass(...)                              [888]
    SRJ_FVG_PruningPass(...)                             [889]
    [if(withinLookbackWindow) prune bias/structure lines] [890]
    ---- EXPORT BLOCK ----
    g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0; [904]

  Execution order: SRJ_FVG_CreationRenewalPass (868) → SRJ_Bias_DecisionBlock (878).
  If both write in the same bar, the DecisionBlock write is LATER.

  Export timing: target = i - 1, so the value computed for bar i is written
  into buffer index target (one bar behind loop index).
  Export timing: target = i - 1, so the value computed for bar i is written
  into buffer index target (one bar behind loop index).

===============================================================================
BLOCK D — LIFECYCLE AND RESET CONVENTIONS
===============================================================================

D1 — State initialization conventions:

  Function: SRJ_StateInit (SRJ_State.mqh:297–466)
    Called from: OnInit (SRJ_FlowLogic.mq5:800) and on full reset
                 (SRJ_FlowLogic.mq5:800, inside prevCalc==0 branch)
    Call line: 800 (inside OnCalculate prevCalc==0 branch)
    Execution frequency: ONCE per OnInit; once per full reset of OnCalculate
    HasPersistedOpposingFVG initialization:
      SRJ_State.mqh:329  g_s.hasPersistedOpposingFVG = false;

  Note: SRJ_StateInit initializes ALL SState fields explicitly:
    - Strings to SRJ_NA_STR (e.g. currentBias, oldBias, renewalDirection)
    - Doubles to SRJ_NA_DBL (e.g. bestBullishOBHigh, dayHigh)
    - Integers to SRJ_NA_INT (e.g. currentStructureStartBar)
    - Booleans to false/true (tickOBIsValid=true, tickFVGIsValid=true,
      hasPersistedOpposingFVG=false, currentLegHasXOB=false)
    - Counters to 0 (inBiasOBInvalidationCount, bullishOBInvalidationCount)

D2 — State reset conventions:

  Function: SRJ_Bias_PerBarResetPass (SRJ_BiasEngine.mqh:16–44)
    Called from: OnCalculate per-bar loop (SRJ_FlowLogic.mq5:855)
    Call line: 855
    Execution frequency: ONCE PER BAR (every bar, every tick)
    Fields reset (complete census from source):
      structureConfirmedThisBar=false, wasBiasFlip=false, oldBias=SRJ_NA_STR,
      initialBiasJustSet=false, drawBiasLineNow=false,
      newBiasDirection=SRJ_NA_STR, suppressBiasPaneStatusThisBar=false,
      drawStructureRenewalLineNow=false, weakFlipPreconditionMet=false,
      renewalDirection=SRJ_NA_STR, bullishBiasFlipAlert=false,
      bearishBiasFlipAlert=false, bullishStructureRenewalAlert=false,
      bearishStructureRenewalAlert=false, bullishOBCountedThisBar=false,
      bearishOBCountedThisBar=false.
      Conditionally (if barClosed):
      justChangedBias=false, bullishOBInvalidationsThisBar=0,
      bearishOBInvalidationsThisBar=0.
    hasPersistedOpposingFVG: NOT reset by SRJ_Bias_PerBarResetPass.

  No other per-bar reset function exists in the canonical source.
  SRJ_StateInit is the only full-state reset (called on init and full reset).

D3 — Functions that reset per-bar fields:

  SRJ_Bias_PerBarResetPass:
    Called from: OnCalculate per-bar loop (SRJ_FlowLogic.mq5:855)
    Call line: 855
    Execution frequency: ONCE PER BAR

  SRJ_StateInit:
    Called from: OnInit / OnCalculate (full reset branch)
    Call line: 800
    Execution frequency: ONCE per init / ONCE per full reset

  No other function in the canonical source resets per-bar state fields.
  No other function in the canonical source resets per-bar state fields.

D4 — Function that initializes/resets hasPersistedOpposingFVG:

  SRJ_StateInit:
    Called from: OnInit / OnCalculate (full reset branch)
    Call line: 800
    Execution frequency: ONCE per init / ONCE per full reset

  Note: hasPersistedOpposingFVG has NO per-bar reset. It is initialized once
  to false in SRJ_StateInit and then only modified by SRJ_FVG_CreationRenewalPass
  and SRJ_Bias_DecisionBlock during per-bar processing. Its value PERSISTS
  across bars until one of those two functions writes to it.

D5 — Existing per-bar event transport fields:

  Field: tickOBIsValid
    Type: bool
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:327] (init → true)
      SRJ_OB_ReplayActivationInvalidation  [SRJ_OrderblockMgr.mqh:171/173]
      SRJ_OB_ActivationInvalidationPass     [SRJ_OrderblockMgr.mqh:535/537]
      SRJ_Bias_DecisionBlock               [SRJ_BiasEngine.mqh:226/280] (true)
      SRJ_FVG_CreationRenewalPass          [SRJ_ImbalanceMgr.mqh:209/326] (true)
    Read site(s):
      SRJ_Bias_DecisionBlock               [SRJ_BiasEngine.mqh:154,171]
      SRJ_Bias_WeakFlipLatchPass           [SRJ_BiasEngine.mqh:382]
      SRJ_computeBiasPaneColorARGB         [SRJ_Panels.mqh:15]
      SRJ_Panels_BiasPane                  [SRJ_Panels.mqh:252]
    Reset site: NONE FOUND (not reset per-bar; initialized to true in SRJ_StateInit)

  Field: tickFVGIsValid
    Type: bool
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:328] (init → true)
      SRJ_FVG_CreationRenewalPass          [SRJ_ImbalanceMgr.mqh:127,210/327] (true)
    Read site(s):
      SRJ_Bias_DecisionBlock               [SRJ_BiasEngine.mqh:154,171]
      SRJ_Bias_WeakFlipLatchPass           [SRJ_BiasEngine.mqh:382]
      SRJ_computeBiasPaneColorARGB         [SRJ_Panels.mqh:16]
      SRJ_Panels_BiasPane                  [SRJ_Panels.mqh:252]
    Reset site: NONE FOUND (not reset per-bar; initialized to true in SRJ_StateInit)

  Field: freshSweepTag
    Type: string
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:440] (init → SRJ_NA_STR)
      SRJ_Sessions_Pass                    [SRJ_Sessions.mqh:456] (= chosenSweep)
    Read site(s):
      SRJ_FlowLogic.mq5 (export block)      [SRJ_FlowLogic.mq5:928-938]
    Reset site: SRJ_StateInit only [SRJ_State.mqh:440]

  Field: freshSweepExpired
    Type: bool
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:443] (init → false)
      SRJ_Sessions_Pass                    [SRJ_Sessions.mqh:282,291,300,309]
                                            (true on session rising edge)
      SRJ_Sessions_Pass                    [SRJ_Sessions.mqh:471] (false on new sweep)
    Read site(s):
      SRJ_FlowLogic.mq5 (export block)      [SRJ_FlowLogic.mq5:928]
    Reset site: SRJ_StateInit only [SRJ_State.mqh:443]

  Field: bullishOBInvalidationsThisBar
    Type: int
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:338] (init → 0)
      SRJ_Bias_PerBarResetPass             [SRJ_BiasEngine.mqh:41] (if barClosed → 0)
      SRJ_OB_ReplayActivationInvalidation  [SRJ_OrderblockMgr.mqh:181] (+=1)
      SRJ_OB_ActivationInvalidationPass     [SRJ_OrderblockMgr.mqh:544] (+=1)
    Read site(s):
      SRJ_OB_CounterAggregationPass        [SRJ_OrderblockMgr.mqh:586-592]
    Reset site: SRJ_Bias_PerBarResetPass (if barClosed) [SRJ_BiasEngine.mqh:41]

  Field: bearishOBInvalidationsThisBar
    Type: int
    Write site(s):
      SRJ_StateInit                         [SRJ_State.mqh:339] (init → 0)
      SRJ_Bias_PerBarResetPass             [SRJ_BiasEngine.mqh:42] (if barClosed → 0)
      SRJ_OB_ReplayActivationInvalidation  [SRJ_OrderblockMgr.mqh:188] (+=1)
      SRJ_OB_ActivationInvalidationPass     [SRJ_OrderblockMgr.mqh:551] (+=1)
    Read site(s):
      SRJ_OB_CounterAggregationPass        [SRJ_OrderblockMgr.mqh:602-608]
    Reset site: SRJ_Bias_PerBarResetPass (if barClosed) [SRJ_BiasEngine.mqh:42]

  Count: 6 fields with comparable per-bar lifecycle
  Count: 6 fields with comparable per-bar lifecycle

===============================================================================
BLOCK E — ARCHITECTURE FEASIBILITY FACTS
===============================================================================

E1 — Deterministic reset point before pass:
  Answer: NO
  Evidence: SRJ_Bias_PerBarResetPass (SRJ_FlowLogic.mq5:855) runs before
  SRJ_FVG_CreationRenewalPass (line 868) but does NOT reset
  hasPersistedOpposingFVG (D2 census). SRJ_StateInit resets it but only on
  init/full-reset (line 800), not per-bar. Therefore there is NO deterministic
  per-bar reset point for hasPersistedOpposingFVG before the pass — the field
  persists across bars until written by SRJ_FVG_CreationRenewalPass or
  SRJ_Bias_DecisionBlock.

E2 — Deterministic export point after pass:
  Answer: YES
  Evidence: SRJ_FlowLogic.mq5:904
  g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;
  This is a single, deterministic export statement inside the per-bar loop's
  export block (lines 896–904), executing once per bar after all processing
  passes including SRJ_Bias_DecisionBlock.

E3 — Scalar can represent every event (if multiple writes possible):
  Answer: NO
  Analysis: Block B3 determined EXACTLY ONE WRITE PER CALL PROVED for
  SRJ_FVG_CreationRenewalPass. However, across the two writing functions
  (SRJ_FVG_CreationRenewalPass and SRJ_Bias_DecisionBlock), multiple writes
  CAN occur in one bar. A scalar bool loses information when multiple events
  occur: e.g., if SRJ_FVG_CreationRenewalPass sets hasPersistedOpposingFVG=true
  (opposing FVG event) and then SRJ_Bias_DecisionBlock overwrites it to false
  (renewal/flip event), the scalar only retains the final value (false) and
  the opposing-FVG event is lost. The scalar cannot represent both events
  simultaneously.

E4 — Scalar preserves only one event (if multiple writes):
  Answer: YES
  Analysis: When SRJ_FVG_CreationRenewalPass and SRJ_Bias_DecisionBlock both
  write in the same bar, the scalar preserves only the LAST write
  (SRJ_Bias_DecisionBlock, which runs later). The earlier write is overwritten
  and lost. This is inherent to scalar boolean storage: each assignment
  replaces the previous value completely.

E5 — First-write vs. last-write semantics:
  Answer: UNKNOWN
  Evidence: The source does not establish whether first-write or last-write
  semantics are intended. The comment at SRJ_BiasEngine.mqh:342–347 describes
  the overwrite scenario (flag raised by FVG pass, then dropped by decision
  block) but does not state whether this is the intended final behavior or a
  bug. The export at line 904 captures whatever value survives after all
  writes, which is effectively last-write-wins, but no source comment or
  design document explicitly establishes this as the intended semantic.
  Insufficient evidence to confirm first-write vs. last-write is established.
  Insufficient evidence to confirm first-write vs. last-write is established.

===============================================================================
TECHNICAL SUMMARY
===============================================================================

objId type: long
objId domain (domain-separated; the ambiguous label "Can be 0" is withdrawn):
  Can objId = 0 be represented by the type: YES
    (`long` is 64-bit signed, SRJ_Types.mqh:63 / :114; 0 is in range)
  Is 0 used as an unassigned/default value: YES
    (ctors assign objId = 0 at SRJ_Types.mqh:85 and :132, with the source
     comment "[Task 98a] 0 = unassigned"; counter init line 31; export sentinel
     0.0 = "no object selected", SRJ_FlowLogic.mq5:97-98)
  Can a constructed/live object have objId = 0 under the observed factory path: NO
    (NewOrderblock line 274 and NewImbalance line 302 assign SRJ_NextObjId(),
     whose first value is 1 — lines 31-32; so no source-observed objId of 0 on a
     constructed/live object)
  Can the long type represent negative values: YES
    (signed 64-bit; nothing in the source narrows the declared type)
  Does the observed object-construction path assign negative objIds: NO
    (only producer on that path is the monotonic counter 1,2,3,...; counter is
     reset only to 0, SRJ_State.mqh:487)
  Are negative objIds impossible under every possible source assignment path:
  UNKNOWN
    (the census in this report covers the files read for this task and does not
     prove exhaustive whole-tree coverage; absolute impossibility is therefore
     NOT claimed)
  Max range: long (LONG_MIN to LONG_MAX per MQL5 long type)
  Double conversion lossless: NO (long is 64-bit, double has 52-bit mantissa;
    values beyond ±2^53 lose precision when cast to double — observed at
    SRJ_FlowLogic.mq5:966: g_bufXobObjId[target] = (double)xob.objId;)

Write multiplicity: EXACTLY ONE (per SRJ_FVG_CreationRenewalPass call)
  Note: Across the full per-bar sequence, TWO functions can write
  (SRJ_FVG_CreationRenewalPass and SRJ_Bias_DecisionBlock), so multiple
  writes per bar are possible across function boundaries.
  DISTINCTION PRESERVED: "EXACTLY ONE WRITE PER CALL" does NOT mean
  "EXACTLY ONE WRITE PER BAR", because SRJ_Bias_DecisionBlock can write later
  in the same per-bar sequence. (Unchanged by the objId wording correction.)

Same-bar overwrite opportunities:
  Before pass: NO
  Inside pass: YES (confirmed — 4 assignment sites, mutually exclusive)
  After pass before export: YES (SRJ_Bias_DecisionBlock can overwrite to false)

Reset conventions:
  Initialization: SRJ_StateInit (once per init / full reset)
  Per-bar reset: NONE for hasPersistedOpposingFVG (SRJ_Bias_PerBarResetPass
    does NOT reset it)

Feasibility facts:
  Reset point before pass: NO
  Export point after pass: YES (deterministic, line 904)
  Scalar viable for multiple events: NO (loses earlier events on overwrite)
  Scalar overwrites on multiple writes: YES (last-write-wins in practice)
  First/last-write established: UNKNOWN

Technical uncertainties:
  - Whether first-write or last-write semantics are intended for the
    hasPersistedOpposingFVG flag when both SRJ_FVG_CreationRenewalPass and
    SRJ_Bias_DecisionBlock write in the same bar.
  - Whether the SRJ_Bias_DecisionBlock overwrite (lines 228/282) is the
    intended final behavior or a bug (comment at 342-347 describes but does
    not establish intent).
  - Whether negative objIds are impossible under EVERY possible source
    assignment path (the observed construction path assigns none, but the
    recorded census is not proven exhaustive whole-tree) — UNKNOWN.

===============================================================================
EVIDENCE CLASSIFICATION
===============================================================================

ESTABLISHED CURRENT SOURCE FACT (objId domain-separated; wording corrected):
  - objId is type long (SRJ_Types.mqh:63).
  - objId is initialized to 0 by the ctors (SRJ_Types.mqh:85 / :132), with the
    source comment "[Task 98a] 0 = unassigned".
  - objId CAN be represented by the type at value 0 (YES): `long` is 64-bit signed,
    0 is in range, and no type-level/validation-level construct excludes it.
  - objId uses 0 as the documented unassigned/default value (YES): see above ctors,
    counter init (line 31), and export sentinel 0.0 (SRJ_FlowLogic.mq5:97-98).
  - Can a constructed/live object have objId = 0 under the observed factory path
    (NO): NewOrderblock (line 274) and NewImbalance (line 302) assign
    SRJ_NextObjId(), whose first returned value is 1 (lines 31-32); so no
    constructed/live object has a source-observed objId of 0 on that path.
  - Can the long type represent negative values (YES): signed 64-bit; the source
    does not narrow the declared type.
  - Does the observed object-construction path assign negative objIds (NO): only
    producer on that path is the monotonic counter 1,2,3,...; the counter is reset
    only to 0 (SRJ_State.mqh:487).
  - objId double conversion is lossless only within ±2^53.
  - hasPersistedOpposingFVG is type bool (SRJ_State.mqh:128).
  - hasPersistedOpposingFVG initialized to false in SRJ_StateInit (SRJ_State.mqh:329).
  - SRJ_FVG_CreationRenewalPass has exactly 4 assignment sites (lines 199, 226, 316, 343).
  - These 4 sites are mutually exclusive (EXACTLY ONE WRITE PER CALL PROVED).
  - SRJ_Bias_DecisionBlock has 2 assignment sites (lines 228, 282), mutually exclusive.
  - SRJ_Bias_PerBarResetPass does NOT reset hasPersistedOpposingFVG.
  - No function before SRJ_FVG_CreationRenewalPass in the per-bar loop writes hasPersistedOpposingFVG.
  - SRJ_Bias_DecisionBlock runs after SRJ_FVG_CreationRenewalPass and before export.
  - Export is deterministic: g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0 (line 904).
  - Scalar bool loses information when multiple writes occur (last-write-wins).
  - 6 comparable per-bar lifecycle fields identified (D5).

CONTEXT FROM PREDECESSOR TASKS (not re-verified):
  - Task 98a established objId as "immutable identity, set at construction".
  - Task 102 established g_bufXobObjId export with 0 = no object selected.

UNKNOWN:
  - Whether negative objIds are impossible under EVERY possible source assignment
    path (the observed construction path assigns none, but the recorded census is
    not proven exhaustive whole-tree).
  - Whether first-write or last-write semantics are intended.
  - Whether the SRJ_Bias_DecisionBlock overwrite is intended behavior.

===============================================================================
FINAL STATUS
===============================================================================

Production files modified: NONE
Compile: NO
Run: NO
Task classification: COMPLETED

===============================================================================
REPORT CORRECTION RESULT
===============================================================================

Status: CORRECTED
Report path: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_154-Pre2.md
Source files inspected for correction: NONE
Production files modified: NONE
Compile: NO
Run: NO
Zero-domain wording corrected: YES
Negative-domain wording clarified: YES
Control-flow findings changed: NO
Reset findings changed: NO
Transport design added: NO

Correction scope summary:
  The report previously contained an internal inconsistency in the objId domain
  wording: one section said "Can objId = 0 be valid? NO" while the TECHNICAL
  SUMMARY said "Can be 0: YES", and the negative domain was stated as an absolute
  "NO" / "unreachable" without being scoped to the observed factory path.

  The correction replaces the ambiguous, conflated labels with the six explicit
  domain-separated labels requested:
    - Can objId = 0 be represented by the type: YES
    - Is 0 used as an unassigned/default value: YES
    - Can a constructed/live object have objId = 0 under the observed factory
      path: NO
    - Can the long type represent negative values: YES
    - Does the observed object-construction path assign negative objIds: NO
    - Are negative objIds impossible under every possible source assignment path:
      UNKNOWN (evidence-limited, census not proven exhaustive whole-tree)

  The correction is applied consistently across the objId findings that used the
  ambiguous labels: Block A4 (objId domain questions), Block A5 (Valid-value
  restrictions), the TECHNICAL SUMMARY (objId domain), the Technical
  uncertainties list, and the EVIDENCE CLASSIFICATION (ESTABLISHED / UNKNOWN).

  The following were preserved UNCHANGED, as required:
    - Block B write multiplicity (EXACTLY ONE WRITE PER CALL) — plus the explicit
      distinction that this does NOT mean EXACTLY ONE WRITE PER BAR because
      SRJ_Bias_DecisionBlock can write later in the same per-bar sequence.
    - Block C same-bar ordering.
    - Block D reset findings.
    - Block E feasibility findings.
    - all source hashes (SHA256).
    - all source pastes.
    - production-file status (NONE modified).
    - compile/run status (NO).
  No .mq5/.mqh file was inspected or modified. No transport mechanism was
  designed. No sentinel value was selected. No additional source file was read.

Operator answer required: NONE
Council review required: YES