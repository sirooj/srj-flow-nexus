# BUILDER_RESULT_B251 — relay B-251 (F4a diagnostic 3, "I" next-open-on-divergence)
2026-10-17. Branch `builder/B-251` (cut from c738ab1). Verdict: **RESTORED** (I per T4 — the
one-hunk build lives only as `.B251IK` 9-file keep; all live sources + terminal.ini +
charts restored SHA-verified to the 2026-10-17 pre-B-251 state after the last run).

## What the diagnostic asked and what was measured
Planner relay (0.4 + his stacking orders): "I" = enter at the next open on the pass the
divergence completes, gated on the pass that first reads a valid trade-side divergence
verdict; allowed results FOUND / NOT FOUND / ABSENT / UNKNOWN / ACCOUNTED / STOP.

Measured — NOT FOUND at the trigger level:
1. The one hunk (`[B251I]` else-if at the confirm-fail chain end, .B248DK base + 3 edits:
   helper `udl_b251i_check`, per-candidate reset, chain trigger) compiled clean
   (0 errors 0 warnings, 12,297 ms) and ran in both T1/T2 (binary 6ebb8fd4 verified
   unchanged mid-run each time).
2. ZERO `[B251I]` print rows in the whole RECON62 window and the whole EU0525TD window
   (three independent scans: T1 cut Select-String; T2 day-log segment UTF-16LE; T2 cut
   text). The pass "div readable while the confirm gate fails" NEVER existed under the
   original CQD (be6fd84f/90d3ef87) in 19 weeks of real feed.
3. Control: EU0525TD-B251ICT = the SAME source WITHOUT the hunk, compiled fresh in the
   same include state, SAME window → deals CSV byte-identical to the hunked run
   (11/15-10/15, NEVER 2, MACHINE 6, trades 19 both). Same-binary replay determinism
   also proven (RECON62-B251ICT re-run of the T1 binary → byte-identical deals,
   7/7-6/7-0 as T1).

## Gate facts (all measured)
- T1 RECON62-B251I (RECON window 26 Aug - 10 Sep, ex5 6ebb8fd4): 7/7 entries, 6/7 exits,
  0 NEVER, trades 7, A1-A7 entry times unchanged → T1 GATE PASS (same shape as the
  B-242K baseline). The 6/7 = A1 exit +3pt (note-carried B-137 line).
- T2 EU0525TD-B251I (EU window 25 May - 13 Oct): 11/15-10/15, NEVER 2 (N26MAY,
  N15JUL1035), MACHINE 6, trades 19. K19JUN still MISSING (machine still fills
  19 Jun 15:50 1.14654 one candle late = M8 row; the owed 15:45 1.14644 never fired).
- Baselines re-graded same truth, this turn: EU0525TD-B248D = 13/15-12/15, NEVER 3
  (N26MAY, N4JUN1005, N15JUL1035), MACHINE 1, trades 17; EU0525TD-B241D = 13/15-12/15,
  NEVER 4, MACHINE 0, trades 17.
- Planner's predicted clean-hunk shape (14/15-13/15, NEVER 3, M0, K19JUN 15:45 1.14644)
  did NOT appear — and the control shows it was never reachable by this rule in this
  feed/build chain.

## B-251-3 (builder defect class, owned, decisive) — compile-chain non-identity
Same source + same .B248DK-species 5+Flow includes compile to DIFFERENT ex5 species
across compiles: y-day 6086e07c/519,380 B; today a0ba83bd/520,508 → fd29da44/520,920
→ 4a018027/520,600; preB251-species mix fe3049f1/521,186; hunked 6ebb8fd4/521,028.
Per-binary replay = byte-identical deals (deterministic). Cross-compile = different
take behavior at EU (tonight pure-base 11/15-10/15-2-6-19 vs y-day same-source
13/15-12/15-3-1-17). Therefore: (a) the take deltas tonight are NOT the hunk's and NOT
his-rows movements — they are the compile-chain; (b) cross-compile EU grades are not
same-source-attributable until a same-binary baseline discipline exists. Escalated as
a builder methodology finding — his rows and rulings are untouched by either build.

## Review batch (machine-only, record-first)
`06_HANDOFFS\REPORT\REVIEW_BATCH_B251.md` from EU0525TD-B251I only: rows 2-6 = exact
repeats of the B-250 batch (REVIEW_BATCH_B250.md, filed with B-250); row 1 (4 June
09:55 form) = his review item 3 record + B-250 batch row 1 shape. No new unreviewed
class. The two vanished valid-loss takes (K28MAY, K10JUN) named as the compile-chain
shape of tonight's tree, both present exact in the B-248D baseline.

## Defects owned this block (ledger 1402-1407 + this file)
- B-250 D1/D2/D3/W lines filed (1402-1405) + srj-relay rules/01a D4 line appended
  verbatim (build: base named for the gate outcome used as written; failed RECON gate
  never runs EU0525TD).
- B-251-1 charts-backup -Recurse miss (caught by post-count, repaired same turn; T4
  restore re-verified 37/37 with the day's 78-file state kept beside as
  Charts.postB251day).
- B-251-2 error 183 first placement (fixed same turn by chain move; one corrected
  re-compile per relay terms).
- B-251-3 compile-chain non-identity (this file + slice BUILDER_SLICE_B251.md carry the
  six-species measurement and the control proof).

## Records in this block
Slice: `06_HANDOFFS\BUILDER_SLICE_B251.md`; batch: `06_HANDOFFS\REPORT\REVIEW_BATCH_B251.md`;
cuts: `00_CURRENT_WORKING\CUT_RECON62-B251I.log`, `CUT_EU0525TD-B251I.log`,
`CUT_RECON62-B251ICT.log`, `CUT_EU0525TD-B251ICT.log`; deals in ROWPACK (B251I,
B251ICT). Run inis/STATUS/DONE in 00_CURRENT_WORKING (B251I + B251ICT names).
K0a/K0b evidence + the six raw-sha compile species: slice. `.B251IK` = the one-hunk
keep (unstaged) on all 9 pairs; `.preB251` = the restored pre-block state (kept on disk).
