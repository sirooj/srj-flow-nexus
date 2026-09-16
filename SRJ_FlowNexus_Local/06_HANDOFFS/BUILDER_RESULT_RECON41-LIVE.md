# RESULT RECON41-LIVE (V112 re-clear) - MISMATCH / HALT, NOT GRADED PASS (2026-09-17)

**Build:** EA `BFAE4F4B...`/591933 (live rewire EA:9528-9577, sel rule; both 0/0 fresh logs; Flow `3606BFB4` unchanged). **Run:** RECON41-LIVE DONE=PASSED 01:05:49 (Test 0:49:31; 3168 bars / 563338 ticks; same ini/range). **Archive:** `06_HANDOFFS\\RECON41-LIVE_JOURNAL.log` 36472 lines / 7024997 B / SHA `7919f173...` / day-log rolled (PRE=0, new log). **Purity:** farm off, cloud off, Core-04-only (36457/36472), Test-passed. MAXLEN-537-0. SELHALT-0x2. Slot free at launch; terminal held by wrapper post-run, untouched. Token + word SPENT.

## 1. REALIZED delta (close-the-loop vocabulary)

- **Improved:** FL 10:05 FIRES with his stop 1.16258 (signal 10:10 R 2.52 SL 1.16258 TP 1.16072 - liveTp, not his TP; his-TP R 1.94 noted, TP-selector unaudited). His London short realized as alert-only signal.
- **Confirmed:** GQ R 1.66 / JJ R 2.34 (predicted 1.66/2.35, rounding-immaterial) pass; originals 08-28 + 09-07-09:15 unchanged; DH FIRES (outcome holds).
- **Voided:** IE 16:55 FIRES (absent - never evals) + OD 16:40 stays down (FIRES instead) + upstream isolation (births 63->59, evals 14->13) + SIDE1X-equals-live assumption for imb-nonzero rows.

## 2. Prediction-vs-actual (amended register v112)

| row | predicted | actual | verdict |
|---|---|---|---|
| FL 10:05 | FIRE (R 1.94 his-TP / 2.51 live-TP) | FIRES R 2.52 SL 1.16258 (liveTp) | PASS (TP split recorded) |
| DH 10:35 | FIRE R 1.21 SL 1.16299 (s1) | FIRES R 1.71 SL 1.16289 (s0) | OUTCOME PASS, NUMBER MISMATCH (sel split pre-registered diagnostic) |
| GQ 15:55 | 1.66 pass | 1.66 pass | PASS |
| JJ 16:40 | 2.35 pass | 2.34 pass | PASS (rounding) |
| OD 16:40 | stays down (s1 R 0.68) | FIRES R 1.62 SL 1.16274 (s0) | MISMATCH |
| IE 16:55 | FIRES R 1.96 | ABSENT (no eval; seedBT-16:50 0+0; birth-16:45 0+0, double-proved) | MISMATCH |
| births/evals | 63 / 14 identical | 59 / 13 (10:40, 16:45, 17:05, 17:25 gone) | MISMATCH |

Signals 4->7 count holds but composition differs (OD in, IE out). A6FIRED 4->7 with exact payloads on disk.

## 3. Cause (grade, not design)

- **DH/OD numbers:** live implements sel (s0 iff s0-imb nonzero, else s1 - the SIDE1E rule); predictions used SIDE1X (always s1/ext1). Agree when s0-imb=0 (FL/GQ/JJ); diverge when nonzero (DH s0-imb=2: s0 1.16289/1.71 vs s1 1.16299/1.21; OD s0-imb=1: s0 1.16274/1.62 vs s1 1.16359/0.68). Live follows the cleared sel direction; the register listed s1 numbers.
- **IE absence:** OD firing at 16:40 is followed by missing birth 16:45 (same pattern: DH firing followed by missing 10:40; plus 17:05/17:25 later) - firing suppresses later births by unconfirmed mechanism; IE seed never born, never evals. Row-independence assumed in desk math fails live.
- Downstream deltas (MTEXIT/LIFE 4->7, EXITCENSUS 420->972, WS161 changes 218->205, SEL52 etc.) are consequences of changed firing set + fewer evals - diagnosed, never smoothed.

## 4. Disposition: BLOCKED / HALT

GATE FAILED: amended-register grade contract - predicted IE-16:55-FIRES + OD-16:40-DOWN + 63/14-upstream-identical; measured OD-16:40-FIRES + IE-absent + 59/13. Mismatch -> REPORT+HALT, no grade. REVERT NOTHING. RECON17 frozen; `BFAE4F4B` uncommitted. NO build/run/commit (fresh token + word owed for any rerun; dual re-clear spent).

## 5. Files

This file + `06_HANDOFFS\\RECON41_EXTRACT.txt` (49 rows, SHA `03b932a2...`) + `06_HANDOFFS\\RECON41_TABULATE.txt` (199 lines, SHA `e95bc9b2...`) + relay `06_HANDOFFS\\BUILDER_RELAY_COUNCIL_v113-LIVEMISMATCH.md` (mismatch + re-direction ask; same-prompt both seats). Run word SPENT.
