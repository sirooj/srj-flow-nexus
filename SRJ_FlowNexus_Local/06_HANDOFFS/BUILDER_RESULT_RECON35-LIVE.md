# RESULT — RECON35-LIVE (`S2-CROSS-DIR-PREEMPT` live transfer)

**Build:** EA `FAF8442BC1201CE5B82D2CD0F2725C9DFEB445ED45367CB9AADBE88285389617` (573129 B, +2280 transfer-only). FlowLogic `3606BFB4` unchanged. Both compile 0/0 fresh logs (EA 12:10:11, Flow direct).
**Run:** RECON35-LIVE, DONE=PASSED 2026-09-16 13:00:04. Test passed 0:48:44.009; 3168 bars / 563338 ticks; same ini/range (Model=4, InpDebugLog=true, 08-26→09-09).
**Archive:** `06_HANDOFFS\RECON35-LIVE_JOURNAL.log` — 37220 lines / 7211245 B / SHA `8703C596DDA64C32A6E3479E6FBFD936FEF46DF03A7F2B920508F10E8FEFED16` / bounds [77612..114831] contiguous past RECON34 (PRE=77611). Purity: farm-off + cloud-off + Core-04 + Test-passed. MAXLEN=537 (cap, zero exceedance). SELHALT=0. Signals 4/4 byte-identical (R1 2.43 / R3 2.56 / R4 1.76 / R5 1.25). Leftover 5292 closed graceful, declared.

## Grade vs Luna §7 (all rows measured, builder reconciles nothing)

| Row | Prediction | Measured | Status |
|---|---|---|---|
| S1 Sep-8 09:15 LONG | first S2 opposite SHORT preempts; LONG not primary through close | 09:30 PREEMPT Monthly-LONG→Weekly-SHORT; 09:35 S2→S3→S4; 09:45 FRESH_OB_DEAD abort → 09:45 re-SEED Monthly-LONG → 09:50 PREEMPT again → 09:55 S2→S3→S4 → 10:05 + 10:10 S5 → TP_RR_FAIL aborts; day ends 18:35 LTF_MISALIGN abort, LONG never primary through close | PASS |
| S2 Sep-8 16:30 SHORT | birth + R-gate unchanged | 16:30 SEED Monthly-SHORT + 16:35 A_OPP + 16:45:01 TP_RR_FAIL abort, byte-for-byte the legacy chain; 16:45 LONG born-wrong also as legacy | PASS (16:50 preempts the born-wrong LONG, not the 16:30 row) |
| R1/R3/R4/R5 | unchanged | 4/4 signals byte-identical (SL/TP/R/spr all equal) | PASS on fires (note below on R-day paths) |
| R2 MUST-DECLINE | declined, no manufacture | no Sep-4 10:xx fire; signals = 4 only | PASS |
| 10:10 | no manufacture | SIDE1C_PREEMPT 0 (two patterns: 10:05/10:10 rows absent); nothing detected, nothing made | PASS |
| Integrity §9 | STATUS/DONE/purity/MAXLEN/SELHALT | complete/complete/pass/537-0/0; WS161 mismatch=0 (changes 218 vs 205, +13 = preempt count) | PASS |

## The S1 bottom line (novel evidence as cleared §10 demands)

Ownership moves: S2-LONG held → observed SHORT → live preemption → SHORT primary (twice: 09:30 + 09:50), with the old LONG released each time. The transfer then walks the SHORT to S5 at 10:05/10:10 — direction SHORT (his direction), entry 1.16205 — where the CONSERVATIVE stop leg kills it: live stop 1.16379 (stale Sep-3 extreme, walkSteps=0) → R 0.77 → TP_RR_FAIL → STAND-DOWN. Beside it on the same row: ext1 = 1.16258 @09:40 (his second swing, bar-exact) with ext1R = 2.52 ≥ 1.0. Stage C is therefore PROVEN end-to-end (birth+side delivered his-direction candidate to S5); the binding constraint is now the STOP leg — Stage D, exactly as staged. No tuning, no rescue: the run is graded as-run.

## Honest notes (council rules, builder does not)

N1: transfer fires corpus-wide by design (13 PREEMPTs: 08-26/27/28/31, 09-01/04/08). R-day trajectories move: Sep-4 15:35 LONG→SHORT + 15:40 SHORT→LONG reconverge to the byte-identical 16:00 LONG fire; Aug-28 evening preemptions post-date the 10:05 fire. Fires are invariant; paths are not — "unchanged" is ruled on fires unless council says otherwise.
N2: 09:40/10:05 show no PREEMPT because post-transfer state is already SHORT (opp=0) — the shadow's 4-of-4 becomes live 2-of-2-effective plus 16:50; state-machine consequence, pre-declared in kind.
N3: new-Dukascopy-span proving stays owed (this run = same-range consequence run per the build record; Luna §9).

## Disposition

DELIVERED: transfer consequence proven, R fires invariant, R2 declined, 10:10 clean, integrity all-pass. No REPORT+HALT trigger fired. Live build `FAF8442B` uncommitted; RECON17 frozen; run word SPENT. Next: stop-leg authorship (Stage D) — v88 relay. NO build/run/commit.
