# RESULT RECON45-DEMO-PASS (V132 evidence packet) — GRADED PASS 2026-09-17

**Build:** EA `E5B97B36`/597425 (ONE DEMO_PASS insert L9989, exact issued text) + FlowLogic `BEC2CBBD`/69852. Compile 0/0 (`06_HANDOFFS\T166_DEMOPASS_EACOMPILE.log`). **Run:** RECON45-DEMO-PASS DONE=PASSED 14:39:20 (Test 0:49:09 healthy; 3168 bars / 563338 ticks; same ini InpMode=1, same range 08-26→09-09). **Archive:** `06_HANDOFFS\RECON45-DEMO-PASS_JOURNAL.log` 39153 lines / 7613244 B / SHA `70CE840F`. **Purity:** farm off, cloud off, Core-04 EA rows 39138/39153 with zero off-core EA rows, Test-passed 1, array-out-of-range 0, SELHALT 0, MAXLEN-537. Token + word SPENT. Leftover: wrapper-owned terminal quiet after DONE (no builder close needed; declare at next session if still alive).

## 1. Register (all four PASS)

- (a) DEMO_PASS row EXACTLY 1: `[SRJ-EA] DEMO_PASS mode=0 login=1500183638` — mode equals the DEMO constant BY CONSTRUCTION (guard `!= ACCOUNT_TRADE_MODE_DEMO` evaluated false on this value, no abort fired); login matches recorded 1500183638 exactly. The held gap is closed by a positive row.
- (b) Zero DEMO_GUARD aborts: `DEMO_GUARD` 0 + `DEMOGUARD` 0 (two-pattern). Zero BELOW_STOPS: `BELOW_STOPS` 0 + `BELOW STOPS` 0 (stopsLevel=0, G2 still unexercised — carried limit, unchanged).
- (c) Same gate+fill, byte-identical rows: A6FIRED 10:05 SHORT R 1.94 SL 1.16258 TP 1.16102; PRE-SEND lots 0.01 entry 1.16205 slPts 53 tpPts 103 stopsLevel 0; EXECUTED fill 1.16205 R 1.94/1.94 delta 0.00; MTEXIT TP_TOUCH exit 1.16102; TP_RR_FAIL_LATCH 13; balance 10000→10159. Extract set-diff vs RECON44 = 0 (17 shared rows identical + DEMO_PASS).
- (d) Compile 0/0 (proven pre-run, two-pattern).

## 2. Isolation (token-family table `RECON45_TABULATE.txt`, 240 lines, SHA `7950DB28`)

Exactly 2 deltas: DEMO_PASS 0->1 (the issued insert firing once) + OTHER 984->968 (-16, every line tester/environment chatter — memory/sync/timing/history-download rows, zero strategy rows; ex5-bytes line 382706->383240 consistent with +173 B source). 238 families identical. Net -15 reconciles exactly. No smoothing, no extras.

## 3. Disposition + files

GRADE: PASS. Result (this file) + `06_HANDOFFS\RECON45_EXTRACT.txt` (18 rows, SHA `DF1F077B`) + `06_HANDOFFS\RECON45_TABULATE.txt` (240 lines, SHA `7950DB28`) + land re-ask `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v134-GRADE-LAND.md` (new plain template, same text all models). RECON17 frozen; `E5B97B36`/`BEC2CBBD` uncommitted. NO commit (land token + his commit word owed).
