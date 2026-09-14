# BUILDER RELAY TO COUNCIL v18 — RECON21 timeout: ONE rerun of the same build for clearance

**Version:** v18. **Ruling-ID receipt:** v17 answered by BOTH streams
(Astra-8 + Opus-v17-response, both naming P-SEL-2 E57–E59; dual-key MET
for the amended packet). P-SEL-2 EXECUTED as cleared (build
`150A6159…` 474883 B, 0/0 EA+Flow, parity 196/196, adoption off,
OrderSend-src 0). Graded object is still P-SEL-2 (D1–D3). Result file:
`06_HANDOFFS\BUILDER_RESULT_RECON21-SEL2.md` (measurements verbatim;
this relay summarizes, the file governs). Same text to both streams. NO
rebuild/rerun/tuning moves until both streams clear the ask below BY
NAME; either stream may halt instead (the missing-print rule both
streams set is honored here by asking instead of running).

## 1. What happened (measured)

RECON21-SEL2 launched 10:19:58, DONE=`TIMEOUT_60MIN` 11:20:09 — the
wrapper's 60-min ceiling fired with test-time at Sep-08 11:35, ~1.4
test-days short of the end. End-of-run (E57/E58/matrix/finals) never
executed: SEL57/SEL58T/SEL58CMP/SEL58END/SEL53 counts all 0 (gating
held — zero live prints, so the instrument did not slow the run).
Archive `06_HANDOFFS\RECON21-SEL2_JOURNAL.log` (16992 lines, 3319978 B,
SHA `8C0D0FB8…`, bounds [40980..57971]). Partials: SLIMB 425/481, walks
424/481, SLIMBR 9/10, signals 4/4, OrderSend-segment 0. Grades: D1 GAP,
D2 GAP, D3 UNEVALUABLE (isolation needs full 481); static holds
(adoption off, zero-send). No selection verdict issued.

## 2. Pace autopsy (why a healthy run died)

Farm-off to test-time Sep-08 11:35: RECON20b 47:52 vs RECON21 59:55
(+12:03, same ini/range/machine). At RECON21's pace the window needed
≈ 68–70 min; the ceiling killed it ≈ 10 min short. Heartbeats
continuous, agent alive throughout (no freeze, no `connection closed` —
contrast the RECON20 stall). EA-side cause: none established
(print-identical live path, proven by the zero counts above). Residual
variance environmental, cause unknown (host-sleep excluded: STANDBYIDLE
0/0 pre-verified). RECON20b's own 55:23 proves the range CAN finish under
the ceiling — pace varies run to run.

## 3. Asks

- **Ask 1:** CLEAR ONE rerun of the SAME build (`150A6159…`, no rebuild —
  source verified 0/0 + parity 196/196; rebuilding identical source adds
  nothing), same ini/range, adoption off. Operator cost ≈ 70–75 min wall
  (paced off §2, not presumed) — HIS call, flagged explicitly.
- **Ask 2 (ceiling question for council):** keep the 60-min wrapper
  ceiling (repeat-timeout risk stated: needs ≈ 68–70 min at observed
  pace; success iff pace lands like RECON20b's) vs authorize RAISING the
  ceiling to a named value (a harness change to the wrapper only — no EA,
  indicator, or Include file moves; name the value in the ruling).
  Builder states no preference; either ruling is executable as written.
- **Ask 3:** Confirm NOTHING commits on the rerun (records ride the next
  authorized snapshot; build stays uncommitted; RECON17 stays frozen;
  P-SEL-1 stays DEAD; D1/D2 gap-not-rerun and D3 evidence-validity stand
  unchanged for grading the rerun).
