# PACKET P-EXITMODEL — the §5 exit phase (charter STEP 4)
Packet: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL.md
STATUS: ANSWERS RECEIVED (2026-09-09 — the six rulings of record in
BUILDER_FINDING_EXITMODEL-1.md §6). READY — AWAITING THE OPERATOR'S EXPLICIT ISSUANCE.
Canonical file:
EXACTLY ONE — Experts\SRJ_FlowNexus_EA.mq5 (baseline E5B0E2E4830BEFD24F18EC712A7806C1730
5F8BDDF30EEC8AF291412F5AFEECA, 207,854 B, 4,204 CRLFs). NOTHING under 02_TASK_CHECKPOINTS.

## AUTHORITY
Spec Part A v4.2 §4 (site 3 = the exit), §5.1-5.6, §2 rows 1-2, §1.3, §7 (separation);
charter §9.1 (the POC/VWAP rule) + its three pending confirmations; the operator's
P-NEXTOPEN directive (the next-open default; "the exit site arrives with the unbuilt
section 5"); BUILDER_FINDING_EXIT-0817.md (the 8/17 exit shape), EXIT-POCVWAP.md,
EXITMODEL-1.md (this packet's basis).

## SCOPE
The exit phase ONLY. The entry pipeline is UNTOUCHED (spec §7 separation): no state
transition, no gate, no census line of the entry side may change. All new behavior is
AFTER the signal bar. ALERT-ONLY is preserved — exits are ALERTS + EXITCENSUS lines,
never orders. THE Q4-RULED §3.4 PRE-CONFIRMATION-ONLY SCOPING FIX IS *NOT* BUNDLED —
it is an entry-pipeline change and sits in its own draft packet
(01_TASKS\PACKET_P-SCOPE34.md, NOT ISSUED).

## DESIGN (summary; detail in EXITMODEL-1 §3)
- SManagedTrade record (module-scope struct): active, dir, anchorLine, anchorPrice0,
  anchorBarTime, sessionAtEntry, entryPrice, slRef, tpRef (admission figure, provenance),
  regimeAtAdmission, signalBarTime, state (PENDING_FILL / MANAGING / CLOSED), exitReason,
  exitBarTime, exitPrice.
- Written at the S5 commit (the same instant the SIGNAL line prints, BEFORE
  ResetSequence — the R-201 ordering discipline).
- EvaluateManagedTrade(barShift): called from OnTick's closed-bar evaluation AFTER the
  entry pipeline returns, ONE call per closed bar, evaluated at the NEXT open (§4 site 3;
  body = open -> next-open, the T161K convention; fail-soft to the bar close).

## EDIT SET (FINAL — the Q1/Q3/Q5-resolved semantics; EXITMODEL-1 §6)
E1  The SManagedTrade struct + g_mtrade global + the snapshot write at the S5 commit
    (EA ~L3944-3968; insert BEFORE MarkSessionUsed/ResetSequence).
E2  EvaluateManagedTrade(): the per-bar engine —
    (a) PENDING_FILL: cancel on the live bias flip / the three-flag conjunction (§5.5);
        fill on the first wick-touch of entryPrice; the filling bar's own close
        invalidating -> immediate exit (§5.5).
    (b) TP touch: re-run the TP admission per bar (ComputeNearestTpTarget with the
        managed trade's dir and the CURRENT price; Q6 — re-computed per bar, nearest
        valid target, EVEN IF less than 1R post-entry) -> a touch of the current
        target = EXIT reason=TP_TOUCH (§5.1, §2.2 includes session liquidity).
    (c) body-close exit (Q1/Q3/Q5-resolved): the trigger-line set = compile-time
        constant EXIT_SCOPE —
          EXIT_SCOPE_ANCHOR      = the anchor line only;
          EXIT_SCOPE_FAMILY_POC  = the six family POC lines + the anchor line
                                   (DEFAULT — the ruled hierarchy: AVP-POC over VWAP
                                   inside each family; 9.1(1): a VWAP close does not
                                   exit; 9.1(2): the origin/anchor line's own break
                                   exits);
          EXIT_SCOPE_ALL         = all twelve lines;
        side per bar (§5.2: a trigger line whose CURRENT value is ahead = touch-target,
        not a body-close trigger); a line's own GAP/MOVE alone NEVER exits (Q3; §1.3);
        PRICE's BODY close through a behind trigger line = EXIT reason=POI_BODY_BREAK,
        unconditional (§5.1; body = open -> NEXT open, the T161K convention; Q5: "it
        must be body"). Session levels behind: TP-touch only, never body-close
        triggers (§5.1 says "POI").
    (d) SL: price trades through slRef -> EXIT reason=SL (the recommended convention,
        unobjected).
    (e) §5.6: regimeAtAdmission==trend AND the HTF aggregate flips -> EXIT
        reason=HTF_FLIP at the flipping HTF candle's confirmation close; compile-time
        constant InpConst_HtfExit default TRUE (the §4 note: NOT a user input).
E3  EXIT_SCOPE constant (above; DEFAULT EXIT_SCOPE_FAMILY_POC) — a one-line flip to
    another scope is a recompile, never a redesign; the census measures ALL scopes'
    inputs every bar regardless (instrumentation-first, §4's mitigation).
E4  EXITCENSUS: one line per evaluation per relevant test (bar, state, site, line,
    value, side, bodyLo/Hi, verdict) — ALL twelve POI lines logged per bar so every
    EXIT_SCOPE variant is measurable from one run; the EXIT alert (EmitAlert "EXIT",
    reason + price) fires with the census line.
E5  The census/aggregation bookkeeping: EXITCOUNT in the tabulation script
    (tabulate_161o.ps1); NO existing census line changes.
E6  The L-comment truthing at the S5 commit site (the exit phase now exists).

## STAGES (on issuance; the T161N discipline)
S1  Pre-hash gate: re-hash the EA; must equal E5B0E2E4...AFEECA (207,854 B, 4,204
    CRLFs, LONELF=0). A miss = DIAGNOSE, never assume, never revert (invariant 10).
S2  Apply E1-E6 (EXIT_SCOPE = EXIT_SCOPE_FAMILY_POC per the recorded resolution).
    Record every diff.
S3  Post-hash: record the new digest + size + CRLF/LONELF counts AFTER the write.
S4  Compile (target the EA): expect 0 errors 0 warnings (T161O_COMPILE.log, gitignored).
S5  Headless run T161O via run_tester_v2.ps1 (T161O_P1.ini = the T161N shape; poll per
    the poll law; the DONE marker instrument).
S6  Gates: (G1) compile 0/0; (G2) ALL entry-side identity gates reproduce T161N
    verbatim — WS161 loads=stores=1728 changes=79 mismatch=0; WS161_LOAD NOSTORE
    present; BIASCENSUS sh1 701/1027 sh2 702/1026; XOB-PROMOCENSUS 369; ZONECENSUS
    exact; CQD stream 254 (43/84/88/39); the SIGNAL pair verbatim (08.17 16:35:02 LONG
    R=1.42; 08.20 09:35:04 LONG R=1.60); (G3) the exit phase produces EXITCENSUS lines
    ONLY on/after the two signal bars (zero before); (G4) the pre-stated 08.17/08.20
    exit verdicts recorded for the operator to judge against their journal;
    (G5) re-hashes byte-identical after the run.
S7  BUILDER_RESULT_161-O.md + T161O_TABULATION.txt; standing-state update.
