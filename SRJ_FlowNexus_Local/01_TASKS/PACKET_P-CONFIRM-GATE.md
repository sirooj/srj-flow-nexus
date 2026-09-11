# PACKET P-CONFIRM-GATE — build 2 of the council design (the confirmation gate + one-bar validity + the R latch)
Packet: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-CONFIRM-GATE.md
Date: 2026-09-10. Basis: COUNCIL_RESPONSE_POI-R.md (C4/C3, sequencing step 2) + the ruled
confirmation term (BUILDER_CALIBRATION_CONFIRM-GATE.md: the retracement candle must NOT
close through the anchor line — applies to VWAP and POC alike; the bar-counting convention
confirmed) + the measured divergence-timing finding (the EA's anchor-bounded divergence walk
missed the 8/28 pre-seed matched verdict; the ruled DIVCON standard "the latest is the
latest on the indicator" carries no seed bound). ONE canonical file:
Experts\SRJ_FlowNexus_EA.mq5 (baseline 12FB2EB0...FD7E, the shadow state). STATUS: DRAFT —
NOT ISSUED.

## 1. WHAT CHANGES (the design, operator-ruled elements marked)
- THE CONFIRMATION PREDICATE (new, the gate): IsConfirmationCandle(barShift, anchor, dir) =
  (A) the prior candle (barShift+1) closed AGAINST the direction (the retracement/opposing
  candle); (A2 — RULED) the prior candle's CLOSE stays on the SETUP SIDE of the anchor
  line (a wick through is the retracement; a close through is a line break — no
  confirmation after a break; LONG: close >= line; SHORT: close <= line); (B) the current
  candle closes IN the direction with any nonzero body (only a true doji rejected — spec
  §3.6); (C) the prior candle's range touched the anchor line (h >= L && l <= L).
- THE FIRING RULE (council C4): the EA fires ONLY on the open immediately following a TRUE
  test bar. One-bar validity: if any precondition is not satisfied at that close, the
  confirmation is consumed — no carry-forward, no fire-when-the-ladder-catches-up. A later
  bar can present a fresh confirmation while the candidate is alive and in-window.
- THE DIVERGENCE TERM (council C4 + THE OPERATOR'S ROBUSTNESS RULING 2026-09-10, verbatim:
  "please make the divergence detection more robust. i consider the latest CQD divergence,
  although that was from an older structure. WHICH EVER LAST. so do not detect only after
  the trade confirmation appear or the confirmation candle. if detect once the confirmation
  candle, then make it be able to look to the left to make the detection of whichever the
  last is robust."): the newest-first CQD verdict walk from the confirmation bar has NO
  BOUND — no seed-bar bound, no age limit. Walk left (shift 1, 2, 3, ...) to the FIRST
  nonzero verdict = THE LATEST on the indicator, however old ("although that was from an
  older structure"). Matched = the gate passes; opposing = the confirmation is consumed
  (the candidate returns to S4, named CONFIRM_DIV_WAIT, no abort); NO verdict at all in
  the walked history = the confirmation consumed (divergence absent). This replaces the
  anchor-bounded g_divLatch in the firing path entirely.
- THE R LATCH (council C2, surviving piece): at the confirmation close, latch ONCE —
  latchedEntry = the next open, latchedSl = the swing (the SL_REF machinery), latchedTp =
  the closest line (the selector UNCHANGED per the ruled "whichever is the closest"),
  latchedR = tpDist/slDist — test ONCE: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL with the
  latch values printed. NEVER recomputed; latch monotonicity (never re-latch on a later,
  more favourable bar).
- THE ASYNC WAIT DIES: the S5 waiting state (divLatch=0 tpOk=1) and the anchor-bounded
  divLatch wait are REMOVED from the firing path — the gate is single-shot at the
  confirmation close: predicate -> divergence -> latch R -> fire or named abort.
- WHAT STAYS: the seed (DetectPoiRetest L1552), the ladder S1-S4 as filters (regime/LTF/
  zone/leg — unchanged), the SL_REF machinery (L2000-2060), the TP selector
  (ComputeNearestTpTarget L1706 — the ruled closest-line), the alert format, the exit
  model (STEP 4 territory, untouched), the P-SCOPE34 kill scope (pre-confirmation 2-of-3
  — unchanged), the session limits, the shadow instruments (RETESTBOOK/CONFIRMPOLL/
  TP_ELECT remain as the calibration surface).

## 2. THE EDIT SET (EA only; anchors verified against 12FB2EB0...FD7E = the A0701893 state + the shadow)
- E1 (the shadow block, after DetectPoiRetest): ADD IsConfirmationCandle(barShift,
  anchorLine, dir) as a real function now (it replaces the poll-only role): terms
  A/A2/B/C per §1; CONFIRMPOLL prints stay (they become the live gate's trace — the same
  terms, now consumed by the state machine; keep shadow=true naming for continuity).
- E2 (the S4->S5 edge, L3981-3991 era): REPLACE the closesInDir && !isDoji edge with the
  full predicate: promotion to ST_S5_GATE_CHECK only when IsConfirmationCandle is TRUE on
  the just-closed bar. The touch fallback (L3974-3979 oppositeDir && touchesZone) STAYS
  (it sets g_touchSeen — the retracement detection; unchanged).
- E3 (the S5 gate, L3994-4045 era): REPLACE the async wait with the single-shot latch:
  (i) the divergence term — the newest-first CQD verdict walk (shift 1..anchorAge; the
  first nonzero verdict; matched = the direction; opposing/absent -> GoAbort(CONFIRM_FAIL)
  with the verdict values printed — ABORT stays alive, the candidate survives at S4 per
  the one-bar-validity rule — wait: an abort kills the candidate; the ruled model wants
  the candidate ALIVE for a fresh confirmation. RESOLUTION: a divergence miss at the
  confirmation close = the confirmation consumed = the candidate RETURNS TO S4_ARMED
  (state rollback, named CONFIRM_DIV_WAIT in the log), NOT an abort; (ii) the R latch —
  latch once, test once: >= 1.0 -> fire (the existing signal path); < 1.0 ->
  GoAbort(ABORT_TP_RR_FAIL) with latchedEntry/latchedSl/latchedTp/latchedR printed (a
  hard kill — the ruled 1R gate; no re-latch); (iii) the S5 waiting line RETIRES.
- E4 (the working set + ResetSequence): the latch fields (latchedEntry/Sl/Tp/R/latchBar)
  as working-set fields cleared by ResetSequence (the WS161 census gains fields — loads/
  stores counts will move; mismatch must stay 0 — declared observable).
- E5 (reason codes): CONFIRM_FAIL -> the candidate returns to S4 (a CONFIRM_DIV_WAIT /
  CONFIRM_STRUCT_FAIL line naming the failed term); TP_RR_FAIL keeps its name with the
  latch values added; the S2POLL_RR_SHORTFALL advisory unchanged; the S5_NO_TP_TARGET /
  S5_NO_SL_REF aborts unchanged.

## 3. STAGES (per invariant 5)
- S1 pre-hash gate: expect EXACTLY 12FB2EB02763D0D648447F6DE02DE4BF2C57D71249EDBCE9583C083
  331CEFD7E (235,201 B, 4,731 lines). Miss = BLOCKED + diagnose.
- S2 apply E1-E5 (probe raw lines first; the P-DIVCON-B whitespace discipline).
- S3 post-hash + structure verify (added lines CRLF; LONELF=0; functions byte-identical
  outside the hunks).
- S4 compile T162_GATE: "Result: 0 errors, 0 warnings".
- S5 headless run RECON2-GATE (RECON1_P1.ini unchanged; the window is the full
  8/26->09.09 — 3,168 bars): launch detached, STOP, the completion signal is the
  operator's.
- S6 GATES (the behavior change IS the deliverable — the identity gates are redefined):
  G1 "Test passed", 3,168 bars; G2 WS161 loads=stores=3168 mismatch=0 (changes WILL move —
  the latch fields; declared); G3 THE SIGNAL SET UNDER THE RULED MODEL:
    * 8/28 ~10:05:00 SHORT Daily-VWAP LONDON (the recovered trade; R latched ~1.13);
    * 9/7 09:20:00 LONG Weekly-POC LONDON (the operator's trade, unchanged timing);
    * 9/7 ~16:45:00 LONG Weekly-POC NYAM (the operator's entry = the 16:45 open);
    * 8/31, 9/1, 9/2, 9/8: SILENT (the four false alarms die; 9/2 by the ruled
      retracement-close term);
    * 8/18: SILENT with a named reason (the ruled 1R check or the predicate — asserted);
    * 9/4: silent (the Monthly candidate's fate under the latch is a declared observable;
      the Yearly recovery is BUILD 3's supersession, not this packet).
  G4 post-run digests byte-identical; G5 the CONFIRMPOLL trace now shows the live terms at
  every armed bar (the calibration surface continues).
- S7 BUILDER_RESULT_RECON2-GATE.md + the tabulation + standing state. No git token;
  nothing under 02_TASK_CHECKPOINTS.

## 4. RISKS DECLARED (the honest list)
- This is the FIRST behavior-changing build since P-NEXTOPEN: every signal timing/value
  can move. The gates above are the ruled model's own predictions — a gate failure is a
  finding, not a wrap: report BLOCKED with the gate + measured value, write nothing
  further, revert nothing (invariant 8).
- The divergence-term un-bounding (no seed bound) is the one element the council proposed
  and the data justified (the 8/28 pre-seed matched verdict); it is flagged here for the
  operator's eyes at issuance: the packet's G3 prediction for 8/28 DEPENDS on it.
- The S4->S5 edge replacement changes the meaning of S5_GATE_CHECK (from "armed, waiting"
  to "confirmed, latching") — the census consumers (FRESHCOUNT scope=post etc.) shift
  accordingly; declared observables, not identity gates.
