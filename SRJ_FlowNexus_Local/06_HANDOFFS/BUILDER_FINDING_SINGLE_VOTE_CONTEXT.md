# FINDING ADDENDUM — SINGLE-VOTING-CALL CONTEXT LINES (on-disk, read-only)

**Question (Sonnet v64 check, open item (c)):** lines 7346/7457/7497 also call `DetectPoiRetest` — shown here with what follows each. Claim: none writes `g_dir`/`g_state` or feeds the seed write; single voting call = 7523.

## 7346 — t78 POIREPLACE census (EA:7345–7366)

Local `t78_pr` + local `t78_dir`; compares vs held (`t78_opp`, `t78_tier`); prints `POIREPLACE` counterfactual line. The abort this branch once triggered is REMOVED (EA:7363: operator ruling Q3 quoted in full, `;` no-op — arrival order governs). No `g_dir` write. No `g_state` write. Branch falls through to close braces.

## 7457 — t73 SUPPRESSED census (EA:7456–7481)

Local `t73_pr` + local `t73_dir`; static tally counters (`s_t73_n/higher/opp/both/bars`); prints `SUPPRESSED` + periodic `SUPPRESSED_PROGRESS`. No `g_dir` write. No `g_state` write.

## 7497 — shadow confirm poll (EA:7496–7500)

Local `sh_pr` passed to `ShadowConfirmPoll` (header EA:7484: "LOG ONLY — reads buffers and prints; assigns no state"). No `g_dir` write. No `g_state` write.

## Conclusion (measurement, EA `E68E0AE3…`)

Three non-voting calls, all read-local-struct + print/count, zero direction/state writes — shown, not asserted. The seed vote at EA:7523 (→ write EA:7529) stands as the single voting call. Sonnet's (c) is now answerable from these lines; its key policy is unchanged and respected (check only, never a key).

(End — measured 2026-09-15; rides the next relay)
