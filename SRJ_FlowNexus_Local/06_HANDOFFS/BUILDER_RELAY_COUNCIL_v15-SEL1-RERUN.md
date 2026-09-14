# BUILDER RELAY TO COUNCIL v15 — RECON20 incomplete: build-2 + one rerun for clearance

**Version:** v15. **Answers:** n/a (new facts, no verdict owed). Same text to both streams.
**Status:** RECON20-SEL1 did NOT complete. DONE=UNDETERMINED is the wrapper giving up, not success.
Result file: `06_HANDOFFS\BUILDER_RESULT_RECON20-SEL1.md` (BLOCKED, measurements verbatim).

## 1. What happened (measured)

- No `Test passed` in either day log. Journal froze 62 min at test-time ≈ Sep-07 18:30,
  then agent `connection closed` 01:26:00. Terminal stayed alive; the tester agent died.
- EA hang excluded by construction (all live P-SEL-1 hooks are loop-free straight-line
  prints; the only loops run at tester end, which never executed). Agent-death cause unknown.
- Manual archive: `06_HANDOFFS\RECON20-SEL1_JOURNAL_PARTIAL.log` (16363 lines, SHA
  `163499F6…`, midnight-split bounds recorded) + two tabulations.

## 2. What landed (on-disk, graded)

- E55 COMPLETE 5/5: code side/entry/target exact vs HAND on R1–R4; R5 entry+side exact,
  TP +3 (known drift). CQD-state EMPTY at all five S5 rows → the R2 divergence (frozen
  CQD no-divergence vs his chart-CQD invalid) is now DATA.
- Partial: CTX 497 rows, SLIMB-family 398/398/398 + SLIMBR 9/10, handles M5=13/H1=14,
  zero truncation. Frozen identities intact (R5 SLIMBR: conservative 1.16112 R 0.36,
  his level in fracNuance 1.16240 R 2.56).
- UNEVALUABLE: G1/G2/G4 (no matrix — end-of-run never executed), G5 (Sep-8 unreached),
  isolation join (partial only). No gate failed; none was gradeable.

## 3. Builder defect owned (print-only, fix specified, NOT applied)

`SEL52CTX` lines: 9 format specifiers, 8 args — `site` was not passed; fields right of
bar shift one left (slMode/mode/halt corrupted; site/slMode/halt lost from print, other
values recoverable by unshift; in-memory arrays were correct). FIX: pass `site` as the
third arg to that one StringFormat. One line, zero logic impact. No EA edit moves
without clearance (standing invariant).

## 4. Asks

- **Ask 1:** CLEAR build-2: bit-identical to cleared build-1 (`44D0923B…`) EXCEPT the
  one-line CTX fix above, verified by diff before compile. No logic, gate, or scope change.
- **Ask 2:** CLEAR ONE rerun of build-2, same ini/range. Operator cost ≈ 1 hour — HIS call;
  builder does not presume it.
- If the rerun stalls the same way (freeze + agent death with no Test passed), builder returns
  with an infrastructure relay instead of a third run request. This relay asks for exactly one.
