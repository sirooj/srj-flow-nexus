# BUILDER SLICE B-139 - raw rows behind R1-R5 (MEASURED)

Scope: reads + greps + row extraction only. No edit/compile/run/launch. 4JUN/SILENT6/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-138` = `af53b6b1aafecff757e1529430a25f8457463427` (cut builder/B-139 here; no remote B-139 before push).
- `git log -1` = `af53b6b B-138 price fidelity census: no SIGNAL-DIFFERENT row; verdict MEASURED`.
- `git status --short` count = 555 (kept, none staged).
- Protected diff vs af53b6b EMPTY by `git diff --quiet` (pointer, RESULT_B138/SLICE_B138, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, 99_WORKFLOW/).
- Ledger `1283.` = 1, `B138-PRICE-CENSUS` = 1, `1284.` = 0. CONTEXT `B138-SIGNAL-BEFORE-FILL` = 1, `relay B-138 (kit PK-2)` = 1, `B139-` = 0. HANDOFF `- B-138:` = 1, `- B-139:` = 0. Register `B-137 KEPT` = 4. Pointer lane 1-of-6 = 1.
- Disk SHAs: EA 585093BF / EX5 AB159DE7 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (restored from .preB137 after a one-line RecompiledAll stamp drift; Charts likewise 0 diffs). No terminal64 (0).

## PART B (append nothing)

- EXACT-PRICE-NO-LENIENCY L34; R-AT-OPEN L31; CONFIRMATION-BAR L53; ENTRY-BAR READ-BACK L95; s28 23:55 pin L28; section-3 Alert-only L68; NO-OVERFIT L60.

## R1 TYPES (row: source → type)

- A1e reg L12 HIS report → HIS-FILL. A1x 0828-FVG L8-13 verbatim → HIS-FILL. A2e reg L15 HIS report → HIS-FILL. A2x s78 (rule + his Y-POC 1.15987; 17:50 open per B-135 R2) → HIS-RULE. A3e reg L18 HIS report → HIS-FILL. A3x s28 rule form → HIS-RULE. A4e reg L19 HIS report → HIS-FILL. A4x reg TP [R60 G4] → MACHINE. A5e reg L21 HIS report → HIS-FILL. A5x reg L21 HIS report → HIS-FILL. A6e reg L23 HIS report → HIS-FILL. A6x reg TP [R60 G4] → MACHINE. A7e UNKNOWN (no his-price line). A7x UNKNOWN. B2e reg B-129 + skill JUN05NY L151 (his 16:15-open words) → HIS-CHART. B2x UNKNOWN. B3e skill L95 (his verbatim 160.524) → HIS-CHART. B3x UNKNOWN. C-06-03e/x reg section C L53 (machine numbers; trade HIS-validated) → MACHINE.

## R2/R4 NUMBERS (fills + pairs + pass times)

- ORDER (bid/ask) rows: A1e (1.16466/1.16470) J1081494 10:05:00; A1x (1.16464/1.16467) J1081878 11:35:00; A2e (1.16022/1.16024) J1095956 17:35:01; A2x (1.15987/1.15989) J1096037 17:50:00; A3e (1.16018/1.16019) J1110801 16:00:00; A3x (1.16129/1.16136) J1112591 23:55:00; A4e (1.16135/1.16138) J1113885 09:20:00; A5e (1.16261/1.16264) J1116727 16:45:00; A6e (1.16205/1.16206) J1118714 10:10:00; A7e (1.16220/1.16223) J1121163 17:00:00; C-05-27e (159.340/159.344) J1144558 15:35:00; C-06-03e (159.929/159.932) J1167804 09:10:00; C-06-04e (159.868/159.873) J1173534 09:55:00; B2e (160.059/160.065) J1177867 16:15:00; B3e (160.524/160.530) J1197596 14:40:22.
- First-pass check (bar's earliest row = ORDER second): A1e J1081219/J1081494 :00/:00; A2e J1095648/J1095956 :01/:01; A3e J1110370/J1110801; A4e J1113469/J1113885; A5e J1116334/J1116727; A6e J1118321/J1118714; A7e J1120776/J1121163; C-05-27e J1144247/J1144558; C-06-03e J1167448/J1167804; C-06-04e J1173134/J1173534; B2e J1177294/J1177867 (all :00 same-second); B3e J1197068/J1197596 :22/:22 (first 14:40 pass at :22).
- R4 classes: 11 AT-OPEN (bid = open); B3e LATE-SAME-PRICE (bid 160.524 = open despite :22 pass).

## R3 HITS (paired patterns; his-own vs prose)

- HIS: L34 (entry matched at open; exact target; "you mean like the spread drift?"); L88 ("the next candle is only matter on the candle open"); L95 (160.520/160.524); journal L1056 row 304 (close = open); journal L1058 row 306 (16:15 open + his words); skill L151 (same 16:15 words).
- Prose (never his): ledger L445/L2591/L6360 (item 671 A5 +3 spread not latency)/L6425/L6797; "ask/bid"-as-side 0 in skill/journal/register/FINDING/spec (paired); "slippage" 0 everywhere paired; spec spread/ask/bid/drift 0/0 paired.
- His record names no bid/ask fill side. His buy numbers (A2e/A3e/A4e/A5e) show ask fills.

## R5 EXITS (who filled | booked | fill | server | favor | tick evidence)

- A1x EA close (PositionClose EA:12258; J1081878): break→1.16464: ask 1.16467 11:35:00: against −3: FOUND pair same tick.
- A4x broker TP (tp 1.16200 J1113885): 1.16200: 1.16201 10:53:07: favor +1: NOT FOUND (no pair; no TickAudit/tick logs: 00_CURRENT_WORKING, MQL5/Files, Tester tree searched).
- A7x broker SL (sl 1.16274 J1121163): 1.16274: 1.16275 17:26:29: against +1: NOT FOUND (same search).
- B3x broker TP (tp 160.587 J1197596): 160.587: 160.588 15:23:06: favor +1: NOT FOUND (same search).

## R6/R7

- 20 graded + 4 R5 rows: all ACCOUNTED (grounds in result); 0 DEFECT-NAMED; 0 NO-RULING; no chart call; no carried note.
- R7: PRICE-FIDELITY: no machine defect on price; lane closes at 2 of 6. Open: 4 June parked known open fire; SILENT6 parked.

## RECORD LINES (exact)

- X1 §4: `- B139-HIS-FILL-FIRST (planner lesson 2026-10-09): ...` (relay text verbatim).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-139 (kit PK-2); ...` (planner-stated).
- X3 §3: `- B-139: graded every kept deal's fill against his own fill basis, ...; no source edit or run.`
- X4 ledger `1284.` tag `B139-PRICE-BASIS` (R1/R2/R3/R4/R5/R6/R7).
- X5 pointer: MEASURED; SHAs unchanged; `Lane: PRICE-FIDELITY (first B-138, 2 of 6)`; R6 counts; goal open. Register untouched.
- Pre-commit: X1/X2/X3 counts 1; `1284.`-class 1, `1283.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
