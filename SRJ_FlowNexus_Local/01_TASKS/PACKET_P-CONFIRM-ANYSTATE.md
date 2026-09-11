# PACKET P-CONFIRM-ANYSTATE — build 2.5: the confirmation evaluated at ANY waiting-or-armed ladder state
Packet: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-CONFIRM-ANYSTATE.md
Date: 2026-09-11. ONE canonical file: Experts\SRJ_FlowNexus_EA.mq5. Pre-hash baseline
(expect EXACTLY): CA79B064ABE645D2F52B7F45F9FE1260AAD5B83A07D0A3988C4707A481AF59C9
(244,174 B, 4,888 CRLFs, LONELF=0 — the T162_GATE state, re-verified at this session's
open). STATUS: ISSUED — EXECUTING (operator issuance 2026-09-11 05:4x: "Issue it —
execute all stages now"). EXECUTED SO FAR: S1 PASS (pre-hash CA79B064...F59C9 measured
verbatim); S2 applied E1-E4 (19 edit sites; three editor exact-match misses on the
recorded leading-space class — raw probes taken, all re-issued clean); S3 post-edit EA =
2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0, 247,301 B, 4,939
CRLFs, LONELF=0, 4,939 lines (+51 lines, every added line CRLF); zero leftover "20"
sites; all 13 new-symbol sites verified. S4 PASS: T162_ANYSTATE compile "Result: 0
errors, 0 warnings, 2040 ms elapsed" (T162_ANYSTATE_COMPILE.log; exit code 1 = the
recorded quirk); post-compile source digest byte-identical. S5 LAUNCHED 05:50:16
(wrapper PID 28792, terminal PID 26352; no terminal was open — nothing closed;
RECON1_P1.ini unchanged; terminal.ini [Tester] DateFrom/DateTo verified = 1787702400/
1788998400 — the second DateFrom/DateTo pair belongs to [TickLoad], not the tester).
The completion signal is the operator's; S6/S7 follow it. COMPLETED 2026-09-11
06:37:56 — ALL GATES PASS — see BUILDER_RESULT_RECON2-ANYSTATE.md + the tabulation.
STATUS: EXECUTED AND VERIFIED. The 8/28 trade RETURNED with the operator's EXACT entry
(1.16466); the two 9/7 trades verbatim; NO new signals; all four post-run digests
byte-identical. NEW EA BASELINE: 2B11CB12...95DC0.

## 0. THE RULING THIS PACKET IMPLEMENTS (operator, 2026-09-11, verbatim)
"Yes — if all my conditions are met, the trade is ON. The EA must take the confirmation
candle whenever it appears (even while its own prep is unfinished), keeping the one-bar
rule. Draft the packet."
Context: BUILDER_RESULT_RECON2-GATE.md section 5 Q1 — the 8/28 ~10:05 London SHORT on the
Daily-VWAP line was missed because the ruled confirmation candle presented (CONFIRMPOLL
bar=10:00 confirm=1, all three terms passed, MEASURED) while the candidate sat at
S3_ZONE_WAIT (PRE_BINDING); the one-bar rule consumed it; the later-armed candidate died
to the pre-confirmation freshness poll (LTF_MISALIGN 10:35). The operator also corrected
the record: the 8/28 trade was TAKEN (entry 1.16466 = the next open after the
confirmation candle; early exit at the 11:35 open because the Daily-POC line gap-jumped
and price body-closed through it — the ruled EXIT-POCVWAP standard, STEP 4 layer).
Also recorded this session: Q2 RESOLVED — the packet P-CONFIRM-GATE's "8/18" G3 item is
DROPPED (unreachable: the window starts 8/26; the 8/18 no-signal was already ruled
behavior at T161R; a packet-authoring note, builder-decided).

## 1. WHAT CHANGES (the design)
- TODAY (build 2): the confirmation predicate is evaluated ONLY at the S4->S5 edge
  (EA L4189, gated on g_touchSeen) and the S3 block's no-promotion path RETURNS
  unconditionally (EA L4068-4074, the sole exit besides the S4 promotion at L4045).
  A pre-binding confirmation is consumed by the ladder, not by the predicate.
- THE CHANGE: a candidate at S3_ZONE_WAIT whose zone is unbound or not in play (the
  S3 else branch) NOW ALSO evaluates IsConfirmationCandle at that bar's close:
  - PASS -> the candidate promotes DIRECTLY to ST_S5_GATE_CHECK in the same evaluation
    pass; the existing S5 block then runs unchanged (unbounded divergence walk -> the
    R latch -> fire / CONFIRM_DIV_WAIT rollback / TP_RR_FAIL). The trade is ON when the
    operator's conditions are met. One-bar validity kept: evaluated at that close,
    fires on the next open, no carry-forward.
  - FAIL -> the confirmation is consumed (named CONFIRM_PREBIND_FAIL, the failed term
    printed); the candidate STAYS at S3; a later bar can present a fresh confirmation.
- THE ROLLBACK TARGET: CONFIRM_DIV_WAIT currently hardcodes ST_S4_ARMED (L4247). A new
  global g_confirmFromState records the state at promotion (S3 or S4); the rollback
  returns THERE. For the armed path this is byte-identical behavior (S4->S4).
- WHAT STAYS (declared boundaries):
  1. The S2 exclusion: the ruled scope is S3_ZONE_WAIT..S5 (the ruled Q1(b) text). The
     16 measured S2 confirm=1 instants in the T162_GATE run stay unconsumed. (Measured
     8/27 09:35/09:50/10:10/18:20/18:40; 8/28 11:10/17:50; 8/31 14:55/15:05/15:15;
     9/2 10:30/16:35; 9/4 10:50/15:40; 9/8 09:40/17:20.)
  2. The S4 touch gate stands: an ARMED candidate with g_touchSeen=false still does not
     evaluate the predicate (the empty-tag confirm=1 instants, measured 12, unchanged);
     build-2 semantics preserved for every armed path.
  3. The freshness poll cannot run pre-binding (it tests the BOUND zone — the
     FRESHSKIP PRE_BINDING mechanics), so a pre-bind firing proceeds without it.
     DECLARED consequence of the ruling ("prep unfinished" must not block).
  4. The divergence walk, the R latch, the selector (closest line), the SL machinery:
     ALL unchanged. ComputeSlReference verified buffer-only (no g_zone dependency,
     L2020-2110) — a pre-binding candidate CAN latch.

## 2. THE EDIT SET (EA only; raw-line probes before each edit)
- E1 (the S3 else, L4068-4074): keep the "S3 waiting: no qualifying zone" line; then the
  pre-bind confirmation block: predicate true -> g_confirmFromState = g_state;
  g_state = ST_S5_GATE_CHECK; LogState; CONFIRM_PREBIND line (bar/dir/poi); NO return
  (fall through — the S5 block runs in this same pass). Predicate false ->
  CONFIRM_PREBIND_FAIL bar/dir/term line; return (unchanged behavior).
- E2 (the S4-edge promotion, L4191-4193): add g_confirmFromState = prev; before
  g_state = ST_S5_GATE_CHECK. Behavior identical; the rollback target explicit.
- E3 (the rollback, L4246-4248): g_state = (g_confirmFromState == ST_S3_ZONE_WAIT)
  ? ST_S3_ZONE_WAIT : ST_S4_ARMED; LogState unchanged. Armed path identical (S4->S4).
- E4 (the field machinery): ENUM_SRJ_STATE g_confirmFromState = ST_IDLE; declared after
  the latch globals (L965 area); reset in ResetSequence (L2288 area). Per the stated
  membership rule ("a field added to ResetSequence joins the working set", L955-958)
  it JOINS the working set as field 21: the ws struct member (L1108 area), the case-21
  name (L1144 area), the compare d[20] (L1172 area), both formatters (L1199/L1228
  areas), the snapshot copy (L1313 area). WS161 census fields 20->21 — DECLARED
  observable; mismatch must stay 0.
- Anchors verified this session: the S3 block's single exit = the L4073 return; the
  promotion L4045; the S4 edge L4189-4199; the rollback L4239-4250; ResetSequence
  L2266-2289; the enum L191-193.

## 3. STAGES
- S1 pre-hash gate: expect EXACTLY CA79B064...F59C9 (244,174 B, 4,888 lines). Miss =
  BLOCKED + diagnose (never assumed drift; never reverted on assumption).
- S2 apply E1-E4 (probe raw lines first; the P-DIVCON-B whitespace discipline).
- S3 post-hash + structure verify (CRLF on every added line; LONELF=0; byte-identical
  outside the hunks).
- S4 compile T162_ANYSTATE (the Dukascopy metaeditor64): "Result: 0 errors, 0 warnings".
- S5 headless run RECON2-ANYSTATE (RECON1_P1.ini unchanged; the window 8/26->9/10
  exclusive-end, 3,168 bars): launch detached via run_tester_v2.ps1, STOP; the
  completion signal is the operator's; manual completion protocol if the wrapper died.
- S6 the gates (section 4). S7 BUILDER_RESULT_RECON2-ANYSTATE.md + the tabulation +
  standing state. No git token; nothing under 02_TASK_CHECKPOINTS.

## 4. GATES
- G1 "Test passed", 3,168 bars.
- G2 WS161 fields=21 loads=stores=3168 mismatch=0; zero mismatch/FIELD rows (changes
  WILL move — declared).
- G3 THE SIGNAL SET:
  a. 8/28 ~10:05:00 SHORT Daily-VWAP LONDON RETURNS (the operator's trade): entry =
     the 10:05 open (measured expectation ~1.16466, the operator's actual entry), R
     latched at the 10:00 close (the shadow's TP_ELECT measured R~1.13 at the 10:05
     entry), SL/TP per the unchanged closest-line selector.
  b. 9/7 09:20:00 LONG Weekly-POC LONDON verbatim (measured: its candidate armed at the
     09:05 evaluation; the confirmation presented ONLY while armed — the new rule
     cannot move it).
  c. 9/7 16:45:00 LONG Weekly-POC NYAM verbatim (same measured basis).
  d. The four build-2 fakes' KNOWN death mechanisms stay in force for ARMED candidates
     (8/31 16:20 STRUCTFAIL; 9/1 two DIVWAITs; 9/2 15:55 STRUCTFAIL; 9/8 kills
     unchanged). NEW signals from the pre-bind set are NOT gate failures — they are the
     ruled model's declared observables for operator adjudication (the Q3/Q4 pattern).
- G4 post-run digests byte-identical (EA/CQD/OBMGR/FlowLogic).
- G5 the FlowLogic-side censuses = T162_GATE verbatim (BIASCENSUS 1554/1614 x2;
  ZONECENSUS; XOB-PROMO 469; the CQD stream) — the indicator side untouched; the
  EA-side counts (FRESHSKIP/SUPPRESSED/aborts/CONFIRM_*) declared to move.

## 5. THE MEASURED PRE-BIND SET (from the T162_GATE journal; classifier run verbatim)
- 8/27 17:15:02 Weekly-VWAP SHORT (pre-bind) — may fire at 17:20 if div+R pass.
- 8/28 10:05:00 Daily-VWAP SHORT (pre-bind) — THE TARGET.
- 8/28 14:25/14:35/14:45 Daily-VWAP LONG (pre-bind) — a post-10:05-cascade candidate;
  only instants surviving the consumed-candidate cascade reach evaluation.
- 9/1 16:55/17:25 Yearly-POC LONG; 9/2 18:40/18:50 Monthly-POC LONG; 9/3 18:25
  Daily-POC SHORT; 9/4 09:30:01 Daily-POC LONG — same declared-observable status.
- CASCADE declared: every pre-bind firing consumes its candidate and frees the
  singleton earlier, so downstream seeds/candidates can differ from build 2 anywhere in
  the window. The two 9/7 trades are the protected identities (measured safe: no
  pre-arming confirmation existed for either).

## 6. RISKS DECLARED
- First behavior-changing build since P-CONFIRM-GATE: signal timings/values can move.
  A gate failure is a finding: report BLOCKED, name the gate + measured value, write
  nothing further, revert nothing (invariant 8).
- New-signal risk: the pre-bind set can create EA-only signals (operator adjudication
  items, not silent failures).
- The S2 exclusion and the S4 touch gate are builder-scoped interpretations of the
  ruling, both declared here for the operator's eyes at issuance.

## 7. QUEUE NOTES (record-only)
- The FVG-VALIDITY packet (the operator's ruled rule: dead on full wick-range testing OR
  a body close through the FVG; partial fill leaves the remaining untested range as the
  POI — BUILDER_FINDING_0828-FVG.md section 5) is QUEUED AFTER BUILD 3; NOT
  identity-safe (ImbalanceMgr; zone edges and bias-FVG validity move).
- Build 3 (the line supersession, council C1) remains next after this packet.
