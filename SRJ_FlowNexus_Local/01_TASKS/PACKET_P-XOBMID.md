# PACKET P-XOBMID — the XOB midline body-close invalidation (FlowLogic-side, Direction A)
Packet: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-XOBMID.md
STATUS: ISSUED 2026-09-09 — EXECUTED (T161M, all five gates PASS; BUILDER_RESULT_161-M.md).
AMENDMENT 2 appended below (the operator's direction clarification: the ORIGINAL kill
directions were correct; Direction A caused the zero-signal regression) — ISSUED
("P-XOBMID AMENDMENT 2 issued — execute now (A-Stages 1-7)") and EXECUTED (T161N, all
gates PASS; BUILDER_RESULT_161-N.md). FINAL STATE: the file = the Task-160 original
EXCEPT the pure-midline level hunk (digest D286621C...20B7B).
Basis: BUILDER_DECISION_MEMO_XOB-VALIDITY.md (§§1-9); the operator's in-session rulings of
2026-09-09, verbatim:
  (1) FIX SHAPE: "Shape 1 — FlowLogic adopts the midline body-close rule, activation-
      independent (recommended)".
  (2) DIRECTION: "A — Break-direction kill: bearish OB dies on body close BELOW the pure
      midline, bullish ABOVE; same-bar guards relaxed (recommended — fixes XOB 2159 as
      measured)".

## THE RULE BEING IMPLEMENTED
Operator's words (CHARTER §9): "What qualifies an XOB is the invalidation of it. When there
is a candle body closure that closes beyond the XOB midline level." Direction A: the
killing close is on the FAR side of the midline from the OB's origin side — a BEARISH OB
dies on a body close BELOW the pure midline, a BULLISH OB on a body close ABOVE it; the
traversal bar's own body close counts (same-bar act+inv relaxed).

## SCOPE
Canonical file: exactly ONE — C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh
(compiled into Indicators\SRJ_FlowLogic.mq5). The EA, the CQD, SRJ_FlowLogic.mq5 and the
other thirteen includes are UNTOUCHED. Out of scope (ruled): the HTF path (SRJ_HTFEngine.mqh
keeps its own invLvl L133/L152 and its own test L184-185, measured verbatim:
`bool invalid = ob.isBullish ? (rc[j] < ob.invalidationLevel) : (rc[j] > ob.invalidationLevel);`).
Measured consumer map: test sites L125/127 (replay) + L503/505 (live); seven draw sites
consume the stored member (L56, 287, 311, 392, 413, 474, 485 — they move to the pure mid
automatically via E1: a VISIBLE chart change, declared); the replay pass is called only
inside the mgr (L268, L373, after SRJ_createOrderblock L255/L360); the live pass is called
once (FlowLogic L870); the EA has ZERO lifecycle calls (its single pattern hit = its own
local field declaration, EA L498 verbatim `double     invalidationLevel;`).

## MEASURED FLOOR (session-opening stage, all MATCH)
SRJ_OrderblockMgr.mqh 524D5D40AC1F0C2F6909F01742DFE13FC9A4954118A55B3008FE1CD80D18E60F
(= the Task-160 reference); SRJ_FlowLogic.mq5 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32
A6A4E69DD8099F73B08; EA E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA;
CQD 92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F.
T161K journal facts: objId=2159 = BEARISH, mode=all, isActivated=1 (obVal=121381), promoted
05:05 with isValid=1 + obInval=INT_MIN; the T161K state must NOT reproduce (gate G4).

## STAGE 1 — PRE-EDIT HASH GATE
Re-hash Include\SRJ\SRJ_OrderblockMgr.mqh. MUST equal
524D5D40AC1F0C2F6909F01742DFE13FC9A4954118A55B3008FE1CD80D18E60F. A miss is DIAGNOSED
(possibly the metadata-touch cause, R-236), never assumed to be drift, never reverted.

## STAGE 2 — EDIT SET E1-E5 (anchors from the measured source; on any editor exact-match
miss: probe the raw line, re-issue, declare — the P-DIVCON-B discipline)
E1 — L38-39, the level becomes the pure midline:
  OLD:
     // Original design intentionally kept: MathMin for bullish, MathMax for bearish
     double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);
  NEW:
     // Operator rule (charter 9, Direction A): the invalidation level IS the pure
     // midline; the kill is a body close on its far side (packet P-XOBMID).
     double invLevel = mid;
E2 — L119-121, the replay same-bar guard relaxed:
  OLD:
     // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.
     // If activation happened THIS bar (didActivate == true), skip invalidation entirely.
     if(ob.isActivated && ob.isValid && !didActivate)
  NEW:
     // Operator rule (Direction A): same-bar act+inv COUNTS — the traversal bar's own
     // body close is the typical kill. isValid implies activated (born false).
     if(ob.isValid)
E3 — L124-127, the replay directions flipped (byte-neutral, four 1-char flips with E4):
  OLD:
       if(ob.isBullish)
          closedBeyondInvalidation = (barClose < ob.invalidationLevel);
       else
          closedBeyondInvalidation = (barClose > ob.invalidationLevel);
  NEW:
       if(ob.isBullish)
          closedBeyondInvalidation = (barClose > ob.invalidationLevel);
       else
          closedBeyondInvalidation = (barClose < ob.invalidationLevel);
E4 — L502-505, the live directions flipped (same flip as E3, liveClose):
  OLD:
             if(ob.isBullish)
                closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
             else
                closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
  NEW:
             if(ob.isBullish)
                closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
             else
                closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
E5 — L507-511, the live same-bar guard relaxed (wouldBeSameBarValInv removed; the
creation/confirmation-bar guard KEPT per the ruled A consequences):
  OLD:
             // CRITICAL FIX: Check temporal rules BEFORE changing any state
             bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);
             bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW

             if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard
  NEW:
             // Operator rule (Direction A): same-bar act+inv counts; the creation/
             // confirmation bar still never self-kills (kept guard).
             bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW

             if(closedBeyondInvalidation && !isCreationBar)

## DECLARED BOUNDARIES (no invention beyond the ruled A consequences)
- The creation/confirmation bar never self-kills (the kept isCreationBar guard): a body
  close beyond mid ON the confirmation bar kills from the NEXT bar. Declared residual.
- The kill-block internals are UNTOUCHED: history appends, the OBPROV provenance prints,
  the g_s first/last invalidation bars and per-bar counters, the refOk/sameBarValInv
  counting rule (a same-bar act+inv kill stamps ob.invalidationBar but is excluded from
  the opposing-invalidation history by the pre-existing refOk rule), the invalidated-line
  recolors, and the activation blocks (replay L102-117, live L447-494).
- The nearest-branch promotion's lack of an isValid gate (the Task-110 documented
  dead-promotion case) is UNCHANGED — separate item if it ever matters.
- The chart's dotted OBmid lines move to the TRUE midline everywhere (E1 via the stored
  member) — visible, declared, consistent with the operator's rule.

## STAGE 3 — POST-EDIT HASH
Measured AFTER the write; figures never pre-asserted beyond the arithmetic: E3+E4 are
byte-neutral (four 1-char flips); E1/E2/E5 shrink the file (the removed tokens are
countable from the hunks) — the exact byte/CRLF/LONELF figures are recorded at write time
from the measured hunks, never invented.

## STAGE 4 — COMPILE T161M
The compile target is Indicators\SRJ_FlowLogic.mq5 (the include compiles into it;
metaeditor64 per R-52). GATE: "Result: 0 errors, 0 warnings". Log:
06_HANDOFFS\T161M_FLOWCOMPILE.log (gitignored per R-220). Post-compile re-hash of
SRJ_OrderblockMgr.mqh unchanged from Stage 3.

## STAGE 5 — RUN T161M (harness v2 protocol — NEVER v1, never long sleep loops)
- Pre-flight: if any terminal64 is live, the wrapper exits TERMINAL_BUSY=true — a live
  terminal is closed ONLY with the operator's explicit in-session authorization; the
  builder's OWN leftover instance may be closed as documented stage hygiene.
- Delete any stale T161M_STATUS.txt; launch detached:
  Start-Process powershell -WindowStyle Hidden -ArgumentList '-NoProfile',
  '-ExecutionPolicy','Bypass','-File',
  'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester_v2.ps1',
  '-RunName','T161M','-IniPath',
  'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING\T161M_P1.ini'
- T161M_P1.ini = the T161K shape: EURUSD M5, Model 4, JPY 10,000, InpDebugLog=true as
  tester input, 2026.08.14-2026.08.22 (the Tier-1 superset).
- Poll Test-Path T161M_STATUS.txt with cheap sub-second commands (sleeps <=60s per tool
  call), STOP at first hit; read RESULT + the GATE lines from STATUS.

## STAGE 6 — GATES (must hold) vs TABULATED OBSERVABLES (designed deltas, reported)
GATES:
  G1 compile 0 errors / 0 warnings.
  G2 WS161_CENSUS fields=15 loads=1728 stores=1728 mismatch=0; WS161_LOAD_COUNT=1;
     WS161_MISMATCH_COUNT=0 (no buffer count changes — the arithmetic must hold).
  G3 the CQD verdict stream IDENTICAL to T161K (254 reads; +1=43 +2=84 -1=88 -2=39) —
     the CQD is untouched.
  G4 THE XOB-2159 LIFECYCLE CHECK: the T161K state (2159 promoted 05:05 with isValid=1 +
     obInval=INT_MIN, backing the 14:10 zone landscape) must NOT reproduce. PASS FORMS
     (whichever mechanically occurs, reported): (a) no XOB-PROMOCENSUS line for objId=2159
     (killed before/inside promotion — mode=all requires isValid); (b) a 2159 line with
     isValid=0 and/or obInval != INT_MIN; (c) EA-side obDead/IDCHANGE/FRESHCOUNT evidence
     for the 1.15794-1.15813 zone within [05:05, 14:15] on 08.18.
  G5 hygiene: nothing written under 02_TASK_CHECKPOINTS; post-run re-hashes —
     SRJ_OrderblockMgr.mqh = the Stage 3 value; EA/CQD/FlowLogic.mq5 = the baseline
     values, byte-identical.
TABULATED OBSERVABLES (NOT gates — the rule change is DESIGNED to move them):
  XOB-PROMOCENSUS count (372 in H/I/J/K) and its isValid/obInval/oppInvalCount columns;
  ZONECENSUS_FINAL; the candidate-gated censuses (XOBINPLAY/S3INPLAY/XOBPROMO/S5_WAIT);
  FRESHCOUNT/SUPPRESSED; BIASCENSUS_FINAL (EXPECTED shard-identical — the bias engine is
  untouched; a shard delta triggers investigation and a DECLARED FINDING before any
  verdict, never a silent pass); the Tier-1 signal set vs T161K (08.17 16:35:02 LONG
  R=1.42 Weekly-VWAP NYAM; 08.20 09:35:04 LONG R=1.60 Daily-VWAP LONDON) — the operator
  judges the agreement picture.

## STAGE 7 — DELIVERABLES AND HYGIENE
BUILDER_RESULT_161-M.md + T161M_TABULATION.txt + the archived journal segment in
06_HANDOFFS (compile log + journal gitignored per R-220); the tabulation script + ini in
00_CURRENT_WORKING. NOTHING under 02_TASK_CHECKPOINTS. NO git add/commit/push (a separate
explicit token). NO canonical file beyond the ONE named. On ANY gate failure: report
BLOCKED, name the gate and its measured value, write nothing further, revert nothing.

# AMENDMENT 2 — THE DIRECTION CORRECTION (REVERSION R0-R4) — DRAFT, AWAITING ISSUANCE
The operator's clarification, verbatim: "please clarify your understanding of OB. bullish
OB is a bearish closing candlestick so it dies if body close below the mid level, and vice
versa." Plus: "the zero signal outcome is a major regression." and "the bias counter or
engine is perfect as currently is". THEREFORE: the ORIGINAL kill directions were correct
(bullish OB dies on close BELOW the pure mid; bearish OB on close ABOVE it); Direction A's
flip caused the zero-signal regression; the activation gate is structurally required
(before its traversal price sits on the origin-candle side of the mid — an
activation-independent test would kill every OB at creation, so Shape-1's
"activation-independent" element is superseded by this clarification). E1 (the pure
midline level) STANDS. XOB 2159's survival through 14:10 was CORRECT; MIDLINE-1 (b)'s
conclusion is VOID (memo §10); the "no valid XOB" suitability question returns to
operator-reserved status. THE BIAS ENGINE IS PERFECT AS IS (no engine change).

## A-STAGE 1 — PRE-EDIT HASH GATE
SRJ_OrderblockMgr.mqh MUST equal
16AA5A0AC7DF00AB99C9EAFD66F0CB398CB537977AC6544639007A3537FF31BE (47,934 B, CRLF=1139).
A miss is DIAGNOSED, never assumed, never reverted.

## A-STAGE 2 — REVERSION EDIT SET R0-R4 (E1 KEPT)
R0 — truth the E1 comment (L38-40):
  OLD:
     // Operator rule (charter 9, Direction A): the invalidation level IS the pure
     // midline; the kill is a body close on its far side (packet P-XOBMID).
     double invLevel = mid;
  NEW:
     // Operator rule (charter 9): the invalidation level IS the pure midline; the kill
     // is a body close beyond it (bullish OB: close below; bearish OB: close above).
     double invLevel = mid;
R1 — revert E2, the replay gate (restore the original):
  OLD:
     // Operator rule (Direction A): same-bar act+inv COUNTS — the traversal bar's own
     // body close is the typical kill. isValid implies activated (born false).
     if(ob.isValid)
  NEW:
     // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.
     // If activation happened THIS bar (didActivate == true), skip invalidation entirely.
     if(ob.isActivated && ob.isValid && !didActivate)
R2 — revert E3, the replay directions:
  OLD:
      if(ob.isBullish)
         closedBeyondInvalidation = (barClose > ob.invalidationLevel);
      else
         closedBeyondInvalidation = (barClose < ob.invalidationLevel);
  NEW:
      if(ob.isBullish)
         closedBeyondInvalidation = (barClose < ob.invalidationLevel);
      else
         closedBeyondInvalidation = (barClose > ob.invalidationLevel);
R3 — revert E4, the live directions:
  OLD:
            if(ob.isBullish)
               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
            else
               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
  NEW:
            if(ob.isBullish)
               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
            else
               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
R4 — revert E5, the live guard block:
  OLD:
            // Operator rule (Direction A): same-bar act+inv counts; the creation/
            // confirmation bar still never self-kills (kept guard).
            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW

            if(closedBeyondInvalidation && !isCreationBar)
  NEW:
            // CRITICAL FIX: Check temporal rules BEFORE changing any state
            bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);
            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW

            if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard
NET RESULT: the file returns to the Task-160 original EXCEPT the L38-40 level hunk (the
pure midline). Expected line count 1,139 CRLFs (original 1,138 + E1's +1); exact bytes
measured after the write, never pre-asserted.

## A-STAGE 3 — POST-EDIT HASH (measured after the write)
Expected shape: the Task-160 original (524D5D40...) EXCEPT the L38-40 hunk — 1,139 CRLFs;
the exact digest/bytes recorded, never pre-asserted.

## A-STAGE 4 — COMPILE T161N (target Indicators\SRJ_FlowLogic.mq5, metaeditor64 per R-52)
GATE: "Result: 0 errors, 0 warnings". Log: 06_HANDOFFS\T161N_FLOWCOMPILE.log (gitignored).
Post-compile re-hash of OrderblockMgr unchanged from A-Stage 3.

## A-STAGE 5 — RUN T161N (harness v2.3 — its FIRST validation)
- Poll law: ONE sub-second command per tool call — Test-Path T161N_DONE.txt — ZERO sleeps;
  if absent, issue another single Test-Path later. STATUS carries the launch facts, the
  heartbeats and the GATE block (now segment-only). This run VALIDATES v2.3 itself.
- T161N_P1.ini = the T161K/T161M shape (copy T161M_P1.ini); no terminal open at launch
  (close only the builder's own leftover, documented hygiene; never the operator's).

## A-STAGE 6 — GATES (must hold) vs TABULATED OBSERVABLES
G1 compile 0/0.
G2 WS161: LOAD NOSTORE present (loads=1); census fields=15 loads=1728 stores=1728
   mismatch=0; zero FIELD rows.
G3 CQD verdict stream IDENTICAL (254 reads; +1=43 +2=84 -1=88 -2=39).
G4-INVERTED: the T161K XOB-2159 lifecycle MUST REPRODUCE — the PROMOCENSUS line at
   08.18 05:05 (mode=all, isValid=1, isActivated=1, obInval=INT_MIN) and no kill of
   id=2159 anywhere; the 08.18 14:10-15:00 zone landscape matches T161K's
   (1.15794-1.15813 backing the SHORT candidate).
G5 SIGNALS: the T161K pair EXPECTED back (08.17 16:35:02 LONG R=1.42 Weekly-VWAP NYAM
   SL 1.15870 TP 1.16141; 08.20 09:35:04 LONG R=1.60 Daily-VWAP LONDON) — tabulated;
   any delta is traced bar-by-bar (a selective kill where obOpen sat far-side of mid is
   the designed effect of the kept E1 level fix).
G6 BIASCENSUS shards: EXPECT the return toward 699/1029 + 700/1028; any residual delta
   = the level fix's selective consequence, tabulated (the engine itself is perfect as
   is — NO engine change).
G7 hygiene: re-hashes byte-identical (OrderblockMgr = the A-Stage 3 value; EA/CQD/
   FlowLogic.mq5 = the baselines); nothing under 02_TASK_CHECKPOINTS.
TABULATED OBSERVABLES (NOT gates): XOB-PROMOCENSUS count (expect ~372 with deltas only
   where the old deeper level had survived closes the pure mid now kills); the
   OBPROV/obInval delta set vs T161K (the level fix's true effect, enumerated);
   FRESHSKIP/SUPPRESSED/S5_WAIT/ABORT; WS161 changes count.

## A-STAGE 7 — DELIVERABLES AND HYGIENE
BUILDER_RESULT_161-N.md + T161N_TABULATION.txt + the archived journal segment in
06_HANDOFFS (compile log + journal gitignored per R-220); T161N_P1.ini + tabulate_161n.ps1
(ini/tabulation script in 00_CURRENT_WORKING). On ANY gate failure: report BLOCKED, name
the gate and its measured value, write nothing further, revert nothing. NO git token.
