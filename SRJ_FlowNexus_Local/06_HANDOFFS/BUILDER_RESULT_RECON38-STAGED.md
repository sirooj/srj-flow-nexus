# RESULT RECON38-STAGED (V96 dual staged print-clear) — GRADED DELIVERED-WITH-LIMIT 2026-09-16

**Build:** EA `7BFC7FA3DFD8967B3F8F7D93B4BF8678434A5A6A7F69A5C007C6A87F3180AB34` (584698 B, both compile 0/0 fresh logs, FlowLogic `3606BFB4` unchanged). **Run:** RECON38-STAGED DONE=PASSED 2026-09-16 18:18:01 (Test passed 0:52:36.160; 3168 bars / 563338 ticks; same ini/range Model=4/debug/08-26→09-09). **Archive:** `06_HANDOFFS\RECON38-STAGED_JOURNAL.log` 37349 lines / 7231769 B / SHA `906E8D3F…` / bounds [189395..226743] past PRE=189394 exact-contiguous. **Purity:** farm off, single agent 127.0.0.1:3003, Core-04-only (37335/37349 Core-04; other-core 0; rest Tester/agent startup), Test-passed. MAXLEN=537. SELHALT 0/0. Signals 4/4 payload-identical. Own leftover 18232 closed graceful, declared. Run word SPENT.

## 1. Null-effect / isolation: PERFECT (56-family table `RECON38_TABULATE.txt`, 57 lines, SHA `E47F9B19…`, NONNEW_DIFFS=0)

All 54 legacy families delta-0 vs RECON37. Only deltas: SIDE1R_RGATE +14, SIDE1W_CQDWINDOW +14 (per-S5-eval, as designed). SIDE1E 14/14 payload-identical; N1EQUALS identical (`poiEqBody=28 poiEqWick=30 vwapEq=0 pocEq=3`); WS161 mismatch=0.

## 2. RGATE linkage: VALID 9/14, UNGROUNDED 5/14 (mechanical join, exact regex)

Rule: seedBiasAl grades as own-seed bias iff a same-bar same-dir SIDE1T row exists AND no SIDE1T sits strictly between seedBT and evalBar (between=[] held 14/14). VALID (seedRow=1): 08-26 14:35, 08-27 16:55, 08-28 09:55, 08-28 16:15, 09-04 09:15, 09-04 10:35, 09-07 09:00, 09-07 14:55, 09-08 16:30. UNGROUNDED (seedRow=0; capture belongs to an older seed — supersede moved the anchor; listed, never graded as seed bias): 08-27 18:45, 08-31 15:05, 09-04 15:45 (R3), 09-08 10:05 (S1), 09-08 16:50. Guard -1: 0 occurrences by two patterns. Instrument limit (disclosed, not a halt: all eval-bar inputs present; attribution only): D1 derivation amended — linkage grades where seedRow=1.

## 3. Seven-row predictions (Luna §2): 7/7 HOLD

R1/R3/R4/R5 fire unchanged (livePass=1 + signals byte-identical). S1 stop mapping unchanged (SIDE1E identical sel=1 r1=2.52; its al=0 ungrounded → excluded from timing reading, no timing dependency introduced). S2 EXACT: `evalBar=2026.09.08 16:40 seedBT=2026.09.08 16:30 dir=SHORT seedBiasAl=1 rLive=0.60 livePass=0 slRef=1.16379` (linkage VALID) — CONSIDER then R-gate reject at 0.60. R2 declined (livePass=0, no signal, uniform window ⇒ no fixture exclusion). Observation carried: R5 seedBiasAl=0 yet fires (live S2WAIT retains; alignment re-resolves later — fires-unchanged unaffected).

## 4. CQD window: input DEMONSTRABLY ABSENT at both bars of interest (outcome 2)

R2 row: `evalBar=2026.09.04 10:35 dir=SHORT w=U,-1,U,U,1,U,-2,-2,U,U,U,U,U` (k=0 → 10:35, k=1 → 10:30, k=2 → 10:25, 5-min steps, no session gap). k=0 (10:35) = U — reproduces SIDE1Q cqdDiv=UNREAD. k=2 (10:25) = U — the operator's 10:25 killer input is ABSENT with exact missing state recorded. Read path proven alive by live neighbors (k=1:-1, k=4:+1, k=6:-2, k=7:-2). 10:25 vs 10:35 distinct (k=2 vs k=0). No stop-imb substitution (CQD handle only, code-read). No fixture (uniform 14-row window). R2 governed by current ruling (declined, silent per A+).

## 5. Halt triggers: NONE fired

No behavior delta (§1) · no invented computation (stamp/idiom reuse, code-read) · no tolerance · no quiet remap (CQD handle only; imb-identity side-by-side) · no fixture exclusion (uniform windows; R2 untouched) · no absent-required-input (all eval stamps present; -1 guard 0/14). CQD absence at 10:25/10:35 is the pre-registered outcome (2), never a halt.

## 6. Files

Result (this file) + `06_HANDOFFS\RECON38_EXTRACT.txt` (28 rows: 14 SIDE1R + 14 SIDE1W, SHA `65B5FBE2…`, ACIRC-0) + `06_HANDOFFS\RECON38_TABULATE.txt` (57 lines, SHA `E47F9B19…`, ACIRC-0) + relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v97-RECON38-GRADE.md` (run-cost header per new rule; accept + CQD-absence routing + S2-closure authorship; full branches; relay ALONE, tree unchanged). Run word SPENT. RECON17 frozen; `7BFC7FA3` uncommitted. NO build/run/commit (fresh word + authorship owed for anything further).
