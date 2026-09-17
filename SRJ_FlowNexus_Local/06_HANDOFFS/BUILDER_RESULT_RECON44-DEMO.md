# RESULT RECON44-DEMO (V128 guard clearance) — GRADED DELIVERED 2026-09-17

**Build:** EA `FC6AC694…`/597252 (G1 trade-mode+login abort + G2 stops hard abort) + FlowLogic `BEC2CBBD…`/69852. EA 0/0 (second log; first-log enum error owned+fixed). ADD13 filed (gate SATISFIED). **Run:** RECON44-DEMO DONE=PASSED 12:53:21 (Test 0:48:19, healthy; 3168 bars / 563338 ticks; demo ini InpMode=1, same range 08-26→09-09). **Archive:** `06_HANDOFFS\RECON44-DEMO_JOURNAL.log` 39168 lines / 7614407 B / SHA `fcf3d867…` / bounds past PRE=116168 contiguous. **Purity:** farm off, cloud off, Core-04-only (39149/39168), Test-passed, array-out-of-range 0. MAXLEN-537-0. SELHALT-0x2. Token + word SPENT. Leftover closed by builder (graceful, declared — see ledger).

## 1. Signal-to-fill: DELIVERED (pre-registered predictions HOLD)

- FL 10:05 FIRES (same gate R 1.94 SL 1.16258 TP 1.16102) ✓. Zero DEMOGUARD_ABORT rows (tester IS demo 1500183638 — G1 evaluated-true, proven by execution occurring, not by absence alone) ✓. Zero BELOW_STOPS rows (stopsLevelPts=0 recorded) ✓.
- PRE-SEND lots=0.01 entry=1.16205 slPts=53 tpPts=103 spread 1 ✓. EXECUTED fill=1.16205 R_executed=1.94 R_logged=1.94 delta=0.00 (perfect fill; direction-profitable) ✓. A6FIRED 1 (FL). MTEXIT TP_TOUCH exit=1.16102 (same as alert proof). Balance 10000→10159.
- 13 TP_RR_FAIL rows identical (6 flips + 6 old + IE). Old FAILs unchanged.

## 2. Isolation: PERFECT beyond the mode flip (202-family table `RECON44_TABULATE.txt`)

Exactly 3 deltas, all mode-flip Konsequenzen: ALERT_ONLY 1→0, EXECUTED 0→1, PRE 0→1. 23 families payload-identical (SIDE1X/E/R/O/Q/W/Y 14, births 71, fails 13, A6/MTEXIT/TPCENSUS-430, N1/WS161/TALLY/SEL61, preempt/H/votes/profiles). Guards altered NOTHING except permitting the one fill (a corrupted-output scare mid-grade was re-derived twice — method note filed).

## 3. Disposition + files

GRADE: DELIVERED. Result (this file) + `06_HANDOFFS\RECON44_EXTRACT.txt` (17 rows: 14 SIDE1X + A6 + EXECUTED + PRE-SEND, SHA `e64a32d4…`) + `06_HANDOFFS\RECON44_TABULATE.txt` (202 lines, SHA `3cf293ac…`) + relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v129-DEMO-GRADE-LAND.md` (grade + LAND token ask; same-prompt both seats). RECON17 frozen; `FC6AC694`/`BEC2CBBD` uncommitted. NO build/run/commit (land token owed).
