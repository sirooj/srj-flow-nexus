# BUILDER SLICE B-137 - R1 raw, R2 table, K2 diff, T tables (KEPT)

Scope: reads/greps/R2 math on run rows, byte-for-byte .B136BRK re-apply, ONE compile, ONE fresh RECON62 run (T1b) + ONE June run, row packs, text records. 4JUN/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-136` = `e9ac3ad88d7a523cc52c606baa758e29a409fdfc` (cut builder/B-137 here; no remote B-137 before push).
- `git log -1` = `e9ac3ad B-136 own-body break trial RESTORED on R-a volume drift; verdict RESTORED`.
- `git status --short` count = 538 (kept, none staged).
- Protected diff vs e9ac3ad EMPTY by `git diff --quiet` (pointer, RESULT_B136/SLICE_B136, RESULT_B135, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, FINDING EXIT-BREAK-RETEST, 99_WORKFLOW/).
- Ledger `1281.` = 1, `B136-BRK-OWNBODY` = 1, `1282.` = 0. CONTEXT `B136-OWNBODY-ON-HIS-EXITS` = 1, `B137-` = 0. HANDOFF `B-136:` = 1, `B-137:` = 0. Pointer `Lane: A2-EXIT (first B-133, 3 of 6)` = 1. Register section E must-keep L65 = 1.
- Disk SHAs: EA 90240F23-64char / EX5 6CFD3A46 / .B136BRK 585093BF / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F. No terminal64 (0).

## PART B (append nothing)

- s23 L23, s36 L36, s78 L78, s28-tail L28 (`BREAK-leg next-open untouched`), EXACT-PRICE-NO-LENIENCY L34, NO-OVERFIT L60, NO-CASCADE L205. Register L65: `Must-keep: all section-A takes reproduce (entry/bar); any take lost = BLOCKED packet (Rule-vs-takes gate).`

## R1 SIZER (kept EA:11201-11219 raw)

- EA:11201 `double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);`
- EA:11202 `double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;` (InpRiskPercent = 1.0, EA:28).
- EA:11203 `double slDistanceReal = MathAbs(entryPrice - slRef);` EA:11204-11205 tickValue/tickSize reads.
- EA:11209 `double lossPerLot = (slDistanceReal / tickSize) * tickValue;` EA:11210 `double lots = riskMoney / lossPerLot;`
- EA:11211-11213 volStep/volMin/volMax reads; EA:11214 `lots = MathFloor(lots / volStep) * volStep;` EA:11215 LOTDIAG print (rawLots/flooredLots/slPts); EA:11216-11219 min/max clamp.
- Solved: lossPerLot = slPts × $1.00/pt/lot (deal-2 calibration: equity exactly 10000.00 → $42.00/42pts). Deposit 10000 (run ini + terminal.ini).

## R2 TABLE (deal | kept acct → formula → deal | trial acct → formula → trial deal | verdict; tol = 0.0001 × slPts × 100)

- 2: 10000.00 → 2.38 → 2.38 | 10000.00 → 2.38 → 2.38 | ACCOUNTED (+0.20/+0.20, tol $0.42).
- 4: 10061.88 → 2.05 → 2.05 | 9997.62 → 2.04 → 2.04 | ACCOUNTED (−0.22/−0.15, tol $0.49). slPts 49=49, entry 1.16024.
- 6: 9961.43 → 0.57 → 0.57 | 9922.14 → 0.57 → 0.57 | ACCOUNTED (+0.81/+0.54, tol $1.72). slPts 172, entry 1.16019.
- 8: 10024.13 → 2.50 → 2.50 | 9984.84 → 2.49 → 2.49 | ACCOUNTED (−0.13/−0.04, tol $0.40). slPts 40, entry 1.16138.
- 10: 10181.63 → 3.91 → 3.91 | 10141.71 → 3.90 → 3.90 | ACCOUNTED (−0.03/+0.11, tol $0.26). slPts 26, entry 1.16264.
- 12: 10381.04 → 1.95 → 1.95 | 10340.61 → 1.95 → 1.95 | ACCOUNTED (+0.07/+0.22, tol $0.53). slPts 53, entry 1.16205.
- 14: 10581.89 → 1.95 → 1.95 | 10541.46 → 1.95 → 1.95 | ACCOUNTED (−0.05/−0.12, tol $0.54). slPts 54, entry 1.16220.
- Trial LOTDIAG rawLots (j-row): 2.3810/2.0403/0.5769/2.4962/3.9007/1.9511/1.9521 — each equals floor-formula raw from the rebuilt trial account (2.04033/0.57687/2.49621/3.90065/1.95106/1.95212). No NOT ACCOUNTED → proceed.
- R4: trial A1 −$2.38 vs kept +$61.88 → deal-4 9997.62 vs 10061.88. B-136 "leaves more money" reversed/withdrawn.

## K2 DIFF (56 changed lines, textually identical to B-136 K DIFF, DIFF-EQUAL=True)

- As B-136 slice K DIFF: src flags (EA:12341), own-body block (ownBehind/ownThrough/ownRankPass/ownBrk), census verdict+ownO/ownC/ownBrk, kept gate + brkKeptSrc, own gate + brkOwnSrc, MTEXIT src=. Kept logic lines byte-identical.
- K3: 0 errors, 0 warnings. EX5 AB159DE7 ≠ 2F5199D1 → T1(b).

## T TABLES

- T1(b) RECON62-B137 (j1065739-1137751, PASSED 19:50:10): 14 deals #2-15. #3 buy 11:35 1.16467 (MTEXIT bar=11:30 D-POC 1.16451 exit=1.16464 src=OWNBODY J1081877; +3pt lag class). #5 sell 17:50 1.15987 (MTEXIT bar=17:45 Y-POC 1.15987 exit=1.15987 src=OWNBODY J1096036; exact). #4/#8/#10 volumes 2.04/2.49/3.9 ACCOUNTED; rest identical. R-a/R-b/R-c pass (ownBrk=1 exactly J1081864 + J1096031; 7/7 ENTRY_TICKET+EXECUTED identical but ACCOUNTED volumes).
- T2 JUNE0525-B137 (j1137752-EOF, PASSED 19:55:37): 10 deals #2-11 every column identical (27May 15:35/20:08; 3Jun 09:10/09:59 TP; 4Jun 09:55/10:40 SL fire unchanged; 5Jun 16:15/19:16 TP; 11Jun 14:40/15:23 TP). ownBrk=1 count in segment: 0.
- T3: terminal killed by PID; terminal.ini + Charts from .preB137 (4082A94F, 20 files). Trial pair stays on disk.

## F2b PACKS

- Tag lists raw: window = A6FIRED/A6REFUSED/ABORT/ANCHOR_ELECT/B60C/B60POT/CONFIRM_DIV_WAIT/CONFIRMPOLL/CQDRECHECK/D130LATCH/DEAL/ENTRY_TICKET/EXITCENSUS/FRESHSKIP/INPLAYCOMMIT/MTEXIT/S54KILL/STATE/TP_ELECT/XOBPROMO/ZONEPICK (+EXITCENSUS new vs B-131; MTEXIT already listed). Day files add S2SEEDBIAS_KILL/SIDE1T_SEEDBIAS/ZONEID (as B-131 day files). Parser fix: timestamp-first `[SRJ-EA] <time> <TAG>` rows (STATE etc.) parsed after the timestamp like B-131 (first build mis-tagged them `2026`, caught on INDEX mapping, rebuilt).
- ROWPACK_RECON62-B137_W1 (840 rows) / _W2 (1210) / _W3 (768) — whole 1,106,263 B split by week (pack_line restarts at 1 per file). ROWPACK_JUNE0525-B137.csv (2853 rows, 841,824 B, whole). DEALS csvs (14 + 10 rows). Per-day folders (11 + 15 files). EXITS-B137/ 12 files (A1 369 rows vs B-133 411: minus the skipped 11:35-11:45 passes; A2 75 vs 94 likewise; rest row-count-identical to B-133: 1735/391/128/156/170/521/145/164/506/136; expected content diffs only: EXITCENSUS ownO/ownC/ownBrk fields, MTEXIT src=, deal raw volumes 2.49/3.9). INDEX_B137.md (INDEX_B131 mapped by datetime+tag+occurrence). P3 spot-checks byte-identical True ×3 (EXITS A2 MTEXIT J1096036; W2 row J1087654; June row J1151871).
- EA SHA in packs: full 64-char 585093BF (B-131 packs carry the 63-char truncation; not re-copied).

## RECORD LINES (exact)

- X1 §4: `- B137-VOLUME-IS-NOT-A-TAKE (planner lesson 2026-10-09): ...` (relay text verbatim).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-137 (kit PK-2); ...` (planner-stated).
- X3 §3: `- B-137: accounted the B-136 lot-size drift ..., graded RECON62 (B-136 rows or a fresh run) and June fully identical; verdict <KEPT|RESTORED|STOP>.` → verdict KEPT (T1b fresh run + T2; scope words kept as relayed).
- X4 ledger `1282.` tag `B137-BRK-OWNBODY-KEEP` (R1-R4, K2, T1/T2, KEPT + R4 correction).
- X5 pointer: KEPT; SHAs 64-char; `Lane: none open (A2-EXIT closed KEPT at B-137, 4 relays)`; Next fixed; goal open. Register A1/A2/A4/A5 NOTEs (EA 585093BF).
- Pre-commit: X1/X2/X3 counts 1; `1282.`-class 1, `1281.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF, register, ROWPACK files; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
