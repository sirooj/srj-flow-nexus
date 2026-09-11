# PACKET P-CONFIRM-SHADOW — build 1 of the council design (logging only, ZERO behavior change)
Packet: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-CONFIRM-SHADOW.md
Date: 2026-09-10. Basis: COUNCIL_RESPONSE_POI-R.md (Opus 5's design, sequencing step 1 —
"Shadow packet, zero behaviour change: RetestBook + CONFIRMPOLL + TP_ELECT shadow logs") with
the builder's anchor verification addendum. All four council questions ANSWERED by the operator
(COUNCIL_RESPONSE_POI-R.md §OPERATOR ANSWERS; the confirmation candle = spec §3.6; TP stays
closest-line; the R latch is C4's consequence). ZERO canonical-file edits beyond
Experts\SRJ_FlowNexus_EA.mq5. STATUS: DRAFT — NOT ISSUED — execution awaits the operator's
explicit issuance (invariant 1).

## 1. WHAT THIS PACKET DOES (and does not)
IT DOES: add three LOG-ONLY instruments to the EA —
- RETESTBOOK: per bar, the new additive poll prints which of the 12 lines produced a valid
  retest entry (line/rank/direction/retest-bar), zero lines otherwise.
- CONFIRMPOLL: per bar, the IsConfirmationCandle sub-terms as measured by the spec §3.6
  reading — term A the opposing candle exists (the prior candle closed against the candidate
  direction), term B the current candle closes in the trade direction with any nonzero body
  (only a true doji rejected), term C the anchor touch attribution — printed with the anchor
  only when a candidate is held; when IDLE, printed for the highest-authority line with a
  valid same-direction retest that bar.
- TP_ELECT: at every S5 gate evaluation, the shadow print of what WOULD be latched under the
  ruled rule — entry = the next open (the already-computed nextOpenPx L4005), SL = the swing
  (SL_REF L2000-2060 machinery), TP = the closest line (ComputeNearestTpTarget L1706
  UNCHANGED — the ruled selector), R = tp/sl distances — printed as
  TP_ELECT entry/sl/tp/R bar=<just-closed>, shadow=true.
IT DOES NOT: change any state transition, any abort, any signal, any latch, any TP/SL/entry
value, any threshold. Every existing line byte-identical; only additive PrintFormat blocks
guarded by InpDebugLog and shadow flags (compile-time constants default true for the
calibration run). Expected observables: ALL existing censuses and signals REPRODUCE the
RECON1B identity; the new lines are additive (census counts for the new tags only).

## 2. THE EDIT SET (EA only; every anchor verified against A0701893...3FD57E)
- E1 (after L94, InitAuthorityTable): the table UNTOUCHED; ADD the read-only helpers the
  council named — AnchorAuthority(line) = g_authorityRank[line]; IsAvpClass(line) = the
  odd-rank members (the VWAP family); FamilyTier(line) = rank/2 (FOMC=0 ... Daily=5).
  Used by the shadow prints only.
- E2 (the poll block L3195-3300): DetectPoiRetest (L1552) UNTOUCHED (already read-only);
  ADDITIVE: a new poll loop that calls DetectPoiRetest for EACH of the 12 lines per bar
  (the existing single-line calls REMAIN the behavior) and prints
  RETESTBOOK bar=... hits=<n> [poi=<code> rank=<r> dir=<d> bar=<retestBar>]... for lines
  with found=true.
- E3 (the poll block, after the existing t73/t78 calls): CONFIRMPOLL as specified in §1 —
  the three terms computed from the existing OHLC series (iOpen/iClose/iHigh/iLow at
  barShift and barShift+1), no new state. Print: CONFIRMPOLL bar=... anchor=<poi|top-retest>
  dir=<dir|poll> oppCandle=<0|1> bodyDir=<0|1> body=<pts> doji=<0|1> touchAttr=<0|1|NA>
  confirm=<0|1> shadow=true.
- E4 (L4005-4045, the S5 gate block): after the existing nextOpenPx computation and BEFORE
  the existing TP call (no reordering), PRINT TP_ELECT shadow=true entry=<nextOpenPx>
  sl=<slRef> tp=<the existing ComputeNearestTpTarget output, shadow call at the same args>
  R=<computed> bar=<just-closed> latchBar=<bar+1> — a SECOND, shadow call to
  ComputeNearestTpTarget at identical args is byte-safe (read-only); the existing call's
  output and behavior UNCHANGED.
- E5 (new compile-time constants near the other MT_* constants): SHADOW_RETESTBOOK=true,
  SHADOW_CONFIRMPOLL=true, SHADOW_TP_ELECT=true — all prints guarded by InpDebugLog &&
  the constant, so the calibration run works with the existing RECON-shaped ini
  (InpDebugLog=true) and any future identity run can silence them with a one-word flip.

## 3. STAGES (per invariant 5; executed on issuance)
- S1 pre-hash gate: re-hash the EA, expect EXACTLY A0701893299B82370BC62AA19CA280E7064A1C46
  D6830D82EB7C3E65DC3FD57E (228,604 B, CRLF=4610 LONELF=0). A miss = BLOCKED + diagnose.
- S2 apply E1-E5 additively (no existing line modified; probe raw lines first — the
  P-DIVCON-B whitespace discipline).
- S3 post-hash + structure verify: CRLF count unchanged EXCEPT the added lines (every added
  line CRLF-terminated); LONELF=0; the modified functions re-read byte-identical outside
  the additions.
- S4 compile: "Result: 0 errors, 0 warnings" via metaeditor64.exe
  (C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe), log T162_SHADOW_COMPILE.log.
- S5 headless run: RECON1_P1.ini UNCHANGED (the same 08.26->09.09 window; terminal.ini
  [Tester] range already at 08.26/09.10), run name RECON2-SHADOW, via run_tester_v2.ps1
  detached; launch + STOP; the completion signal is the operator's.
- S6 GATES (all on the NEW segment): G1 "Test passed", ~506,748 ticks, 2,880 bars; G2 WS161
  loads=stores=2880 changes=173 mismatch=0 EXACT, LOAD NOSTORE x1, FIELD=0; G3 THE SIGNAL
  IDENTITY: the six RECON1B signals reproduce VERBATIM (8/31 11:40:07 SHORT Monthly-VWAP
  R=2.24; 9/1 15:50:00 LONG Monthly-POC R=1.36; 9/2 15:55:00 SHORT Daily-VWAP R=1.05; 9/7
  09:20:00 LONG Weekly-POC R=1.76; 9/7 16:40:15 LONG Weekly-POC R=2.12; 9/8 15:55:07 LONG
  Yearly-POC R=1.12) and the ABORT/FRESHSKIP/SUPPRESSED counts reproduce EXACT (zero
  behavior change PROVEN); G4 the four-digest post-run re-hash byte-identical; G5 THE
  CALIBRATION SURFACE (the deliverable): RETESTBOOK/CONFIRMPOLL/TP_ELECT lines present at —
  the 9/7 confirmation candles (09:15, 16:40: confirm=1 expected), the four EA-only candles
  (confirm=0 expected), the 8/28 seed window (the TP_ELECT R trail 1.13->0.95 reproduced in
  shadow at the later bars, plus whatever the 10:00-10:10 shadow shows), the 9/4 supersession
  window (the Yearly retest entries present in RETESTBOOK at 15:45/15:50/15:55 while the
  Monthly candidate held). Delivered as BUILDER_RESULT_RECON2-SHADOW.md +
  RECON2SHADOW_TABULATION.txt.
- S7 standing-state update + the tabulation script on disk. NO git token; nothing under
  02_TASK_CHECKPOINTS.

## 4. WHAT THE CALIBRATION RUN DECIDES (before build 2)
- Whether the spec §3.6 reading as terms A/B/C discriminates: confirm=1 on the 9/7 candles,
  confirm=0 on the four bad candles. If it fails to discriminate, the sub-term print is the
  calibration surface to tighten (touch attribution is the likely knob), and any tightening
  comes back to the operator WITH DATA before it is applied.
- Whether the 8/28 shadow shows an earlier takeable bar (the council's 10:05-10:10
  prediction).
- Whether the 9/4 RETESTBOOK shows the Yearly entries the supersession (build 3) will
  promote.

