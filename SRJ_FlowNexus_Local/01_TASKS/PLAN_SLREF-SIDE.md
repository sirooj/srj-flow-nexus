# PLAN_SLREF-SIDE.md — the SL-swing selection by protective SIDE, not by recency (the next task)
Plan: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PLAN_SLREF-SIDE.md
Date: 2026-09-11 (operator-ordered: "i want this to be drafted as the next task"). STATUS:
DRAFT — the next session's FIRST work item. Basis: the operator's ruling verbatim in
BUILDER_FINDING_0828-SLREF.md section 1 + the measured 8/28 latch behavior (section 2).

## 1. THE RULED RULE (what the implementation must satisfy)
- The stop swing for a SHORT is a swing HIGH above the entry; for a LONG, a swing LOW
  below it — the PROTECTIVE SIDE decides, never the most recent swing.
- "One swing away" / "two swings away" are counted over the SWING STRUCTURE, and the
  chosen swing may come from an OLDER structure (the 8/28 "6:30 high" ~1.16568 vs the
  EA's nearest-by-shift pick 1.16481).
- The 1R admission gate (TP_RR_FAIL = "not worth 1R") consumes the SAME reference
  (latched once at the confirmation close per the ruled model — only the latch INPUTS
  change under this task).

## 2. PHASE 1 — THE MEASUREMENT (read-only; before any packet)
1. READ THE SPEC OF RECORD FIRST (the XOBSUIT-1 discipline): Part A v4.2's SL section
   ("one swing from that order block's swing high/low"; "two swings, plain candle
   swings") — determine what it already answers about the side/recency criterion;
   ask the operator NOTHING it already answers.
2. ComputeSlReference (EA ~L2020-2160): map its two branches (the OB-swing buffer
   path with the side guard; the FindNearestSwing fallback) and their exact selection
   tests; identify every site the side rule touches (S2POLL, S3ARM, S5).
3. The FlowLogic swing buffers at the 8/28 bars: where the 6:30-high swing sits
   (which buffer carries it, what shift) — whether the CURRENT inputs can even
   express the operator's pick, or the export needs a change (a FlowLogic-side packet
   would touch the indicator: bigger blast radius, full gates).
4. Re-derive the 8/28 example + the 9/7 pair + the four TP_RR_FAIL_LATCH kills under
   the ruled rule by hand (from the OHLC dump T162DUMP + the swing buffers) — the
   a-priori predictions the verification run will be gated against.
5. If a genuine ambiguity remains (e.g., how swings are counted "away" — from the
   structure or from the entry bar), put ONE batched plain-language question to the
   operator; otherwise proceed to Phase 2.

## 3. PHASE 2 — THE PACKET (drafted AFTER Phase 1)
- ONE canonical file (EA) expected — if Phase 1 shows the export lacks the needed
  swing data, FlowLogic joins (two files, declared).
- Edit set: the SL selection inside ComputeSlReference replaced by the side/structure
  walk (the OB-branch keeps its priority per the spec's one-swing/two-swing table);
  the S2POLL advisory and the S3ARM arming gate consume the same function (NO
  separate logic); the latch fields unchanged.
- Stages S1-S7 (pre-hash gate -> edits -> compile 0/0 -> headless run via the harness
  -> gates -> result). The run window unchanged (8/26->9/10, terminal.ini [Tester]).
- GATES: G1 3,168 bars; G2 WS161 mismatch=0 (fields unchanged unless the design adds
  one — declared); G3 the PROTECTED identities: the two 9/7 trades VERBATIM (bars,
  entry times) and the 8/28 10:05 signal PRESENT at the same bar with the SAME entry
  1.16466 (the SL/R values are EXPECTED to move — that is the deliverable; the a-priori
  expected 8/28 SL ~1.16568 -> R~0.84 per the operator's own figures — but the exact
  value depends on Phase 1's swing-walk derivation and is stated in the packet BEFORE
  the run); the four fakes stay silent; G4 post-run digests byte-identical; G5 the
  FlowLogic-side censuses verbatim unless FlowLogic itself is edited (then full gates).
- BLOCKED-on-gate protocol: report BLOCKED, name the gate + measured value, write
  nothing further, revert nothing (invariant 8).

## 4. OPEN QUESTIONS FOR THE OPERATOR (batched; only if the spec does not answer)
- Q1 (only if needed): does "one swing away" count swings from the ENTRY bar leftward,
  or from the anchor structure's extreme? (The 8/28 example suggests the structure
  anchor: the 6:30 high is several swings back from the 10:00 entry.)
- The 1R-gate consequence is informational (the same ruling applies to every trade:
  if the ruled stop makes R < 1.0, the trade dies). THE KEY JUDGMENT ITEM: the
  operator TOOK the 8/28 trade. MEASURED ARITHMETIC (entry 1.16466, TP = the
  Daily-VWAP line 1.16364 — the EA's own closest-line pick = the operator's ruled D
  AVP): with the operator's SL ~1.16568, slDist = 102 pts = tpDist = 102 pts ->
  R = 1.00 EXACTLY (the gate passes). With the EA's current 1.16481 -> R = 6.80.
  So the side rule moves the 8/28 R from 6.80 to ~1.00 — right AT the gate. NOTE:
  the operator's journal SL field read "1.65068 6:30 high" (an apparent typo);
  Phase 1 must derive the true level from the 6:30 candle's HIGH on the OHLC dump
  (T162DUMP_JOURNAL.log) before stating the a-priori expectation. If the true 6:30
  high differs, R moves accordingly; if it lands BELOW 1.0, the 8/28 trade dies at
  the ruled gate — surface THAT to the operator BEFORE implementing, with the
  measured number, and let them rule (accept the death / the gate uses a different
  reference / the TP selector moves).
