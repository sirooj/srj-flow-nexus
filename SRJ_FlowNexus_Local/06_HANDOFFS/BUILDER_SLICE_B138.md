# BUILDER SLICE B-138 - R1 raw, R2 raw, R3 with pack lines (MEASURED)

Scope: reads + greps + pack/day-log row extraction only. No edit/compile/run/launch. 4JUN/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-137` = `3ffc2f622ac4dc67104d9f80b6855be4b3b7bc8e` (cut builder/B-138 here; no remote B-138 before push).
- `git log -1` = `3ffc2f6 B-137 own-body break KEPT: sizer accounts volume drift, both owed exits hit, June identical; verdict KEPT`.
- `git status --short` count = 552 (kept, none staged).
- Protected diff vs 3ffc2f6 EMPTY by `git diff --quiet` (pointer, RESULT_B137/SLICE_B137, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, 99_WORKFLOW/).
- Ledger `1282.` = 1, `B137-BRK-OWNBODY-KEEP` = 1, `1283.` = 0. CONTEXT `B137-VOLUME-IS-NOT-A-TAKE` = 1, `B138-` = 0. HANDOFF `B-137:` = 1, `B-138:` = 0. Register `B-137 KEPT` = 4. Pointer `Lane: none open (A2-EXIT closed KEPT at B-137, 4 relays)` = 1.
- Disk SHAs: EA 585093BF (LF-norm = raw) / EX5 AB159DE7 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (one RecompiledAll stamp line reverted from .preB137; Charts likewise, 0 diffs). No terminal64 (0).

## PART B (append nothing)

- EXACT-PRICE-NO-LENIENCY L34; R-AT-OPEN L31 (`entry open.`); CONFIRMATION-BAR L53 (16:55 retest, 17:00 open entry); ENTRY-BAR READ-BACK L95 (14:35 retest, 14:40 open entry, ref 160.524); s28 23:55 pin L28 (DAY_CLOSE at the 23:55 opening price); section-3 Alert-only L68; NO-OVERFIT L60.

## R1 SPOTS (kept EA 585093BF, real line numbers)

- (a) EA:7914-7915 `entry reference = forming-bar open (would-be fill)` / `double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);`. UJADMIT entry= prints it (A1 1.16466 J1081490; A2 1.16022 J1095952; A3 1.16018 J1110797; A4 1.16135 J1113881; A5 1.16261 J1116723; A6 1.16205 J1118710; A7 1.16220 J1121159; C-05-27 159.340 J1144554; C-06-03 159.929 J1167800; C-06-04 159.868 J1173530; B2 160.059 J1177863; B3 160.524 J1197592).
- (b) EA:11201 `double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);`; Buy/Sell EA:11246/11248; EXECUTED fill = ResultPrice EA:11256-11266; ENTRY_TICKET EA:11278 (bar/ticket/deal/pid/magic, no price).
- (c) EA:12544-12548: SL→slRef, TP_TOUCH→tpRef, BREAK/HTF_FLIP/DAY_CLOSE→nextOpenPx. Close: MtCloseBrokerPosition → PositionClose EA:12258 (market opposite side).

## R2 SETTINGS (raw; spread NOT FOUND as stored)

- RECON50_DEMO_USD.ini / USDJPY_DEMO_JUNE.ini: Expert/Symbol/Period M5/Optimization 0/Model 4/Deposit 10000/Currency USD/Leverage 100/InpDebugLog true/InpMode 1 — no Spread/FixedSpread keys in either file.
- config/terminal.ini [Tester]: Expert/Symbol/Period 5/TicksMode 4/Deposit 10000.00 — no Spread keys. Chart price basis bid NOT FOUND as a stored setting (same three files searched).

## R3 ROWS (EXITS-B137 pack lines + day-log ORDER (bid/ask) rows; pts as in result)

- Entries (signal = UJADMIT open; fill vs signal): A1 #2 1.16466=1.16466=1.16466 (1.16466/1.16470) EXACT. A2 #4 open 1.16022, his 1.16024, fill 1.16024 (1.16022/1.16024) SPREAD. A3 #6 open 1.16018, his 1.16019, fill 1.16019 (1.16018/1.16019) SPREAD. A4 #8 open 1.16135, his 1.16138, fill 1.16138 (1.16135/1.16138) SPREAD. A5 #10 open 1.16261, his 1.16264, fill 1.16264 (1.16261/1.16264) SPREAD. A6 #12 1.16205=1.16205=1.16205 (1.16205/1.16206) EXACT. A7 #14 open 1.16220, his NONE (reg machine-cell), fill 1.16220 (1.16220/1.16223) EXACT vs open. B2 #8 open 160.059 = his (reg B-129 + 16:15-open rule), fill ask 160.065 (160.059/160.065) SPREAD. B3 #10 open 160.524 = his (s95), fill ask 160.530 (160.524/160.530) SPREAD. C-06-03 #4 open 159.929 = his (reg C), fill ask 159.932 (159.929/159.932) SPREAD.
- Exits: A1 #3 MTEXIT 1.16464 = his, fill ask 1.16467 (1.16464/1.16467) SPREAD. A2 #5 MTEXIT 1.15987 = his-open = fill (1.15987/1.15989) EXACT. A3 #7 MTEXIT 1.16129 = 23:55 open (code path) = his-rule = fill (1.16129/1.16136) EXACT. A4 #9 booked 1.16200 (UJADMIT tp + TP_ELECT shadow 09:20 + ORDER tp J1113885 + MTEXIT pack391), fill 1.16201 (pack369, 10:53:07) LAG. A5 #11 1.16315 = booked = his = fill EXACT. A6 #13 1.16102 = booked = fill EXACT. A7 #15 SL 1.16274 (ORDER sl) vs fill 1.16275 (broker 17:26:29, EA print 17:35) LAG, his NONE. B2 #9 revised 160.298 = fill EXACT (entry-booked 160.723 revised by his retarget). B3 #11 booked 160.587 (ORDER tp) vs fill 160.588 (15:23:06) LAG. C-06-03 #5 159.983 = booked = his = fill EXACT.
- Known rows settled: B2 160.065-vs-160.059 = ask of the bid open (pair J1177867) SPREAD. B3 160.530-vs-160.524 likewise (J1197596) SPREAD. C-06-03 159.932-vs-159.929 likewise (J1167804) SPREAD. A1 1.16467-vs-1.16464 = ask (J1081878) SPREAD. B3 160.588-vs-160.587 = +1 after move LAG. A4 1.16201-vs-booked-1.16200 = +1 after touch LAG (booked value from TP_ELECT/ORDER/MTEXIT; line name not printed on those rows).
- R4: 9/8/3/0/0 on 20 graded rows (lists in result). No SIGNAL-DIFFERENT. R5: C-05-27 #2 SPREAD (open 159.340, fill ask 159.344) / #3 EXACT (159.535); C-06-04 #6 EXACT (159.868) / #7 EXACT (SL 159.920). R6 not triggered.

## RECORD LINES (exact)

- X1 §4: `- B138-SIGNAL-BEFORE-FILL (planner lesson 2026-10-09): ...` (relay text verbatim).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-138 (kit PK-2); ...` (planner-stated).
- X3 §3: `- B-138: price fidelity census on the B-137 kept build: ...; no source edit or run.`
- X4 ledger `1283.` tag `B138-PRICE-CENSUS` (R1/R2/R3/R4/R5).
- X5 pointer: MEASURED; SHAs unchanged; `Lane: PRICE-FIDELITY (first B-138, 1 of 6)`; R4 line; goal open. Register untouched.
- Pre-commit: X1/X2/X3 counts 1; `1283.`-class 1, `1282.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
