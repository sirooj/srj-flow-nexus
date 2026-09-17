# RESULT RECON43-PROMO (V122 register) — 13/13 EXACT + ONE EXTRA ROW → REPORT+HALT 2026-09-17

**Build:** EA `9D123133…`/596222 (promotion per authored design) + FlowLogic `BEC2CBBD…`/69852. Both 0/0. ADD12 satisfied. **Run:** RECON43-PROMO DONE=PASSED 08:10:15 (Test 0:46:39, healthy; 3168 bars / 563338 ticks; same ini/range 08-26→09-09 fidelity window). **Archive:** `06_HANDOFFS\RECON43-PROMO_JOURNAL.log` 39122 lines / 7610388 B / SHA `a725d5d6…` / bounds past PRE=77046 contiguous. **Purity:** farm off, cloud off, Core-04-only (39105/39122), Test-passed, array-out-of-range 0. MAXLEN-537-0. SELHALT-0x2. Token + word SPENT. Leftover closed by builder (graceful, declared — see ledger).

## 1. Predicted 13 rows: ALL EXACT (correct-or-correct per row)

FL 10:05 FIRES R 1.94 (SL 1.16258, TP 1.16102 — HIS three levels live in the take path; A6FIRED tp=1.16102 r=1.94; MTEXIT TP_TOUCH exit=1.16102 — his TP realized). Six flips FAIL at exact predicted Rs/TPs (PR 0.17/DH 0.54/GQ 0.99/KO 0.62/JJ 0.39/OD 0.05 — TP_RR_FAIL rows confirm each). Six old FAIL rows unchanged. Signals 7→1. A6FIRED 7→1. TPCENSUS Y-names live (374 rows).

## 2. Extra row: IE 16:55 FAIL (beyond register → HALT; diagnosed, never smoothed)

`evalBar=16:55 seedBT=16:50 ... liveTp=1.16210 liveR=0.19 livePass=0` — S5 evals 13→14, births 59→71. Cause (ruled mechanism, V114/V117): OD-fail freed the session (no fire → no consume) → 16:45 birth returned → 16:55 eval R-killed (0.19) under promoted TP. Entailed, not errant — but UNPREDICTED, and the RECON41 precedent (missing row → halt) applies symmetrically: extra row → HALT. No grade of PASS.

## 3. Disposition + files

GATE FAILED: v122 register (13 rows + rest-identical); measured 14th eval row. Mismatch → REPORT+HALT, no PASS grade. REVERT NOTHING. Result (this file) + `06_HANDOFFS\RECON43_EXTRACT.txt` (15 rows: 14 SIDE1X + 1 A6, SHA `935d5b09…`) + `06_HANDOFFS\RECON43_TABULATE.txt` (201 lines, SHA `57461d86…`) + relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v123-AMENDED-LAND.md` (amended record + land-clearance ask; same-prompt both seats). RECON17 frozen; `9D123133`/`BEC2CBBD` uncommitted. NO build/run/commit (land token owed).
