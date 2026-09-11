# PACKET_P-SLREFSIDE.md — the SL stop swing by STRUCTURE TOP, not by recency
Status: EXECUTED AND VERIFIED (2026-09-11) — two iterations. Iteration 1 (E2A60E6C...) FAILED gate G3
(root cause measured, documented in BUILDER_RESULT_T162-SLREF.md §2); iteration 2 (the amendment: the
turn anchors the walk, the side test applies to the STOP candidate) ALL GATES PASS — see §6 there.
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLREFSIDE.md
Basis: BUILDER_FINDING_SLREF-1.md (Phase 1, all measured) + the operator's rulings
2026-09-11: (1) the original side ruling verbatim in BUILDER_FINDING_0828-SLREF.md;
(2) THIS session's answer to the swing-definition question: "A — one swing = one turn
of the bigger move" (the recommended option, reproduced verbatim by the ask_question
result).

## 1. THE RULED RULE (what E1 must implement)
- The stop swing is chosen by the PROTECTIVE SIDE of the entry, possibly from an

## 2. SCOPE (measured blast radius; RECON2-ANYSTATE window 8/26-9/09, 3,168 bars)
- EA 2-swing branch only. In the window there are EXACTLY 60 two-swing SL_REF lines:
  1 at S5 (the 2026.08.28 10:05:00 latch) + 59 at S2POLL/S3ARM (advisory/arming).
  ALL 60 move under E1 (values, not counts).
- The 1-swing branch (the order-block swing, buffer 27) is UNTOUCHED: the two 9/7
  signals and FOUR of the five TP_RR_FAIL kills ("not worth 1R") are 1-swing picks
  and must reproduce VERBATIM (measured: 8/26 14:40 sl=1.16580 R=0.41; 8/28 16:20
  sl=1.16508 R=0.85; 9/4 09:25 sl=1.16249 R=0.63; 9/4 10:35 sl=1.16379 R=0.36;
  9/8 16:40 sl=1.16379 R=0.60 — every one branch=1-swing obValid=1).
- NO FlowLogic change: the 6:30 high is a strict fractal, present in
  FL_BUF_SWING_HIGH ~42 bars back of the entry (inside the 500-slot bound).
- ONE canonical file: Experts\SRJ_FlowNexus_EA.mq5. The 1-swing Task-75 fallback
  rescue walk (L2144-2186) is UNTOUCHED in this packet.

## 3. THE EDIT SET (one hunk)
- E1: inside ComputeSlReference's else-branch (the 2-swing branch, EA L2219-2246),
  replace the "first swing + next distinct swing" recency walk with the STRUCTURE-TOP
  walk:
    bufIdx = protective-side buffer (SWING_HIGH for SHORT, SWING_LOW for LONG) — kept;
    walk s = barShift .. barShift+500 (the existing bound) reading the buffer;
    skip EMPTY/zero slots (as today);
    SIDE SKIP: a candidate on the wrong side of slCurPx (iClose(barShift), the
    reference the 1-swing branch already uses — declared) is skipped, the walk
    continues (spec §3.7 L204: "never aborts where a valid swing exists");
    the FIRST side-valid swing initializes the running structure extreme (runExt);
    a LATER swing that EXCEEDS runExt by MORE THAN 1 POINT (the codebase's existing
    _Point separation idiom, EA L2230/L2563 — a safety limit, not a tunable threshold)
    is the PREVIOUS structure top -> slRefOut = that swing, slModeOut = SL_MODE_2SWING;
    if the walk exhausts with no exceeding swing, the CURRENT structure extreme
    (runExt) is the stop — "one swing", never abort while a valid swing exists.
  For a SHORT the extreme direction is MAX (a new top = a swing HIGHER than every
  more-recent swing high); for a LONG it is MIN (a swing LOWER than every more-recent
  swing low).
- E2 (additive census, InpDebugLog-guarded): a new print at the 2-swing return —
  "[SRJ-EA] SL_STRUCT site=%s dir=%s entryRef=%s runExt=%s prevTop=%s atShift=%d
  distPts=%.0f exhausted=%d" — so every pick is measurable from one run.
- Comment truthing: the replaced block's comment rewritten to state the ruled rule
  and cite BUILDER_FINDING_SLREF-1 + the operator's Option-A ruling.

## 4. A-PRIORI EXPECTATIONS (stated BEFORE the run; the G3 gate consumes these)
- 8/28 10:05:00 SIGNAL SHORT Daily-VWAP LONDON: SL 1.16481 -> 1.16508; R 6.80 ->
  2.43; same bar, same entry 1.16466, same TP 1.16364. The 60 two-swing SL_REF lines
  move their values (e.g., the 8/28 10:05 S2POLL/S3ARM lines 1.16481 -> 1.16508);
  the LINE COUNT stays 60 unless the exhaustion/side-skip changes a site's outcome
  (a delta is reported, not silently accepted).
- UNCHANGED (protected identities): the 9/7 09:20 LONG Weekly-POC LONDON R=1.76 and
  9/7 16:45 LONG Weekly-POC NYAM R=1.25 verbatim; the five TP_RR_FAIL_LATCH kills
  verbatim (all 1-swing); the four fakes (8/31, 9/1, 9/2, 9/8) silent; 9/4 still
  silent (build 3 recovers it); CQD/FlowLogic censuses identical (no indicator
  change); WS161 loads=stores=3168 mismatch=0, field count unchanged (21).
- DECLARED MOVABLES (observable, not gate failures): WS161 changes count; S3ARM
  arming values (the gate's haveStop stays true); MTSNAP/MTEXIT values for the 8/28
  managed trade (its slRef feeds the exit model); the alert's SL/R digits.
## 5. STAGES S1-S7 (per the standing discipline)
- S1: pre-hash gate — SHA256 of Experts\SRJ_FlowNexus_EA.mq5 must equal
  2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0 (247,301 B,
  4,939 CRLFs, LONELF=0). A miss is DIAGNOSED, never assumed, never reverted.
- S2: apply E1+E2 (probe raw lines before every exact-match edit — the recorded
  leading-space discipline).
- S3: post-hash + byte/line accounting (expect a small +delta; record verbatim).
- S4: compile via C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe —
  the LOG LINE "Result: 0 errors, 0 warnings" is the instrument (exit code 1 is a
  known quirk); compile log T162_SLREF_COMPILE.log (gitignored).
- S5: headless run via the harness (00_CURRENT_WORKING\run_tester_v2.ps1), the
  RECON1_P1.ini shape, window 8/26->9/10 from config\terminal.ini [Tester];
  launch DETACHED, then STOP — no polling; the completion signal is the operator's.
- S6: gates G1-G5 from the archived journal segment:
  G1 3,168 bars, RESULT=PASSED; G2 WS161 fields=21 loads=stores=3168 mismatch=0,
  LOAD NOSTORE x1, zero FIELD rows; G3 the section-4 a-priori table (the protected
  identities verbatim + the 8/28 SL/R move to 1.16508/2.43); G4 post-run digests
  byte-identical (EA + the three untouched baselines); G5 BIASCENSUS/ZONECENSUS/
  XOB-PROMO/CQD-identities verbatim.
- S7: BUILDER_RESULT_T162-SLREF.md + the tabulation in 06_HANDOFFS; the packet
  marked EXECUTED AND VERIFIED.
- GATE-FAILURE PROTOCOL (invariant 8): report BLOCKED, name the gate + measured
  value, write nothing further, revert nothing.

## 6. AFTER THIS PACKET (the queue stands)
1. Build 3 (the line supersession, council design C1 — recovers the 9/4 Yearly-POC
   retest).
2. The FVG-validity packet (the operator's ruled rule; ImbalanceMgr; NOT
   identity-safe).
3. The RECON-PILOT Phase-2 reconciliation re-run on the fixed EA; the window gate
   re-evaluates (4/4 MUST-MATCH + 0 false).
4. Debris deletion word (EA_STATE_REG.md, recovery_compile.ps1); a git snapshot on
   an explicit token.

  OLDER structure — never by shift recency alone (operator verbatim in
  BUILDER_FINDING_0828-SLREF.md section 1).
- ONE swing = one TURN OF THE BIGGER MOVE (operator's Option-A ruling, this session):
  small same-side swings inside one directional leg are ONE swing; a NEW swing on the
  protective side only counts when it EXCEEDS every more-recent protective-side swing.
- MEASURED REPRODUCTION (BUILDER_FINDING_SLREF-1 sections 4-5): at the 8/28 10:00
  entry bar the strict-fractal swing highs run (newest first) 09:55=1.16491,
  09:45=1.16481, 09:35=1.16482, 09:25=1.16479, 08:30=1.16446, 08:15=1.16447,
  07:15=1.16463, 06:30=1.16508. Under this rule the first four are ONE structure top
  (their max 1.16491), and the first older swing EXCEEDING it is 06:30 = 1.16508 —
  the operator's stop, exactly.
- The measured R consequence: entry 1.16466, TP (the ruled closest line) 1.16364,
  stop 1.16508 -> slDist 42 pts, tpDist 102 pts, R = 2.43 — the trade SURVIVES the
  1R gate (the earlier "R = 1.00 exactly" figure was based on the unmeasured 1.16568
  and is VOID; BUILDER_FINDING_SLREF-1 section 4).

