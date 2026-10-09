# BUILDER RESULT B-138 - Price fidelity census: no SIGNAL-DIFFERENT row (9 EXACT, 8 SPREAD, 3 LAG)

Trader summary: every price the machine names is either your price or the candle open, and every fill is either exact or off by the visible spread. Counted on your 20 graded deals: 9 come out exact, 8 sit on the spread side (buys fill at the ask, 2 to 6 points over the bid open), and 3 exits fill one point past the target after the price moved inside the bar. The machine never names a wrong level. The three flagged entries (5 June at 160.065, 11 June at 160.530, 3 June at 159.932) are all ask-side fills of your bid opens, with the bid and ask printed on the same order row. Nothing was changed and nothing was run.

## Relay order (B-138, read-only price census, lane PRICE-FIDELITY 1 of 6)

- Part 0 fresh start on builder/B-137 at 3ffc2f622ac4dc67104d9f80b6855be4b3b7bc8e (backup remote verified exact; builder/B-138 cut here; no remote B-138 before push). Relay skill loaded whole (83 lines); strategy skill verified byte-identical to the B-135 whole read (diff EMPTY) with pins re-grepped; .agents stub never opened.
- Part B banking: EXACT-PRICE-NO-LENIENCY L34, R-AT-OPEN L31, CONFIRMATION-BAR L53, ENTRY-BAR READ-BACK L95, s28 23:55 execution pin (L28), section-3 Alert-only L68, NO-OVERFIT L60. Append nothing.
- Part R: R1 price sources with real lines (entry ref EA:7915 forming-bar open; order price EA:11201 ask/bid; EXECUTED fill EA:11256-11266; ENTRY_TICKET EA:11278 bar/ticket/deal; exits EA:12544-12548; close via PositionClose EA:12258). R2 settings (no spread key in either run ini or terminal.ini [Tester]: NOT FOUND as stored; tick model Model=4/TicksMode=4; chart-price-basis bid NOT FOUND as stored). R3 24-row census below (pack lines from EXITS-B137 + day-log ORDER bid/ask rows). R4: 9 EXACT / 8 SPREAD / 3 LAG / 0 SIGNAL-DIFFERENT / 0 UNKNOWN on the 20 graded rows; R5 4 reported-only rows separate. R6 not triggered.
- Part X: CONTEXT X1 + X2, HANDOFF X3, ledger 1283 (tag B138-PRICE-CENSUS), pointer (MEASURED, PRICE-FIDELITY 1 of 6). Register untouched.
- Part F: this result + slice + ledger + pointer + CONTEXT + HANDOFF staged by explicit path; commit + push via backup + ls-remote check. Reply MEASURED, no carried note (no price left unsettled).

## Part B - banking (append nothing)

- EXACT-PRICE-NO-LENIENCY L34: `entry fills at the opening price and exits at the exact booked/revised target; spread drift and evaluation-lag deviations are diagnosed as defects, never granted as tolerance` (short form; full text at skill L34).
- R-AT-OPEN L31: `the 1R admission floor is measured from the entry open price` (full: `R-AT-OPEN (his words 2026-09-26, verbatim: "entry open."): ...`).
- CONFIRMATION-BAR L53: `the confirmation candle and the candle that did the latest POI retest was 16:55, so the entry is the next 17:00 candle open price`.
- ENTRY-BAR READ-BACK L95: `the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40` (B3: ref 160.524 = 14:40 open).
- s28 23:55 pin (L28): `the DAY_CLOSE leg executes at the 23:55 opening price on the verdict day (Friday included), never at the next-day open`.
- Section-3 Alert-only L68: `Alert-only stands regardless.`
- NO-OVERFIT L60: `rules apply as-is win or lose` (full verbatim at skill L60).

## Part R - reading

- R1: (a) entry reference at signal = forming-bar open (EA:7914-7915 `entry reference = forming-bar open (would-be fill)`, `double currentPrice = iOpen(_Symbol, PERIOD_CURRENT, 0);`); UJADMIT entry= prints it (e.g. B2 160.059 = 16:15 open, J1177863). (b) order price at fire EA:11201 `double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);` (LONG ask, SHORT bid); Buy/Sell EA:11246/11248; EXECUTED fill = broker ResultPrice EA:11256-11266; ENTRY_TICKET EA:11278 carries bar/ticket/deal/pid/magic, no price. (c) MTEXIT exit prices EA:12544-12548: SL→slRef, TP_TOUCH→tpRef, BREAK/HTF_FLIP/DAY_CLOSE→nextOpenPx; closes go through MtCloseBrokerPosition → g_trade.PositionClose EA:12258 (market, opposite side; DEAL rows show the sides).
- R2: spread setting NOT FOUND — no Spread/FixedSpread key in RECON50_DEMO_USD.ini, USDJPY_DEMO_JUNE.ini, or config/terminal.ini [Tester] (all read raw). Tick model present: Model=4 (both run inis), TicksMode=4 (terminal.ini). Chart price basis bid NOT FOUND as a stored setting (looked in the same three files; MT5 tester convention, not filed as a setting — never inferred as one).
- R3 census (register row | deal | side | his price + source | candle open (bar row) | machine signal (pack line) | fill (DEAL pack line) | bid/ask printed at fill | signal-vs-his | fill-vs-signal | class). pts = points (EURUSD 1pt = 0.00001; USDJPY 1pt = 0.001). UJADMIT entry= is the admission signal; EXECUTED fill = order fill; ORDER `(bid / ask)` rows from the day log prove spread side:
- A1 #2 sell: his 1.16466 [reg row 1 HIS report] | open 10:05 1.16466 (A1 pack7) | UJADMIT 1.16466 / EXECUTED 1.16466 (packs 2-3 pattern) | fill 1.16466 (pack1) | (1.16466/1.16470 J1081494) | 0 | 0 | EXACT.
- A1 #3 buy (exit): his 1.16464 [verbatim 2026-09-11 correction] | — (exit) | MTEXIT 1.16464 (pack368) | fill 1.16467 (pack369) | (1.16464/1.16467 J1081878) | 0 | +3 ask-side | SPREAD.
- A2 #4 buy: his 1.16024 [reg row 2 HIS report] | open 17:35 1.16022 (A2 pack8) | UJADMIT 1.16022 (J1095952) / EXECUTED 1.16024 (pack2) | fill 1.16024 (pack1) | (1.16022/1.16024 J1095956) | −2 (= spread) | +2 | SPREAD (signal names the open correctly; his quotes the ask).
- A2 #5 sell (exit): his 1.15987 [17:50 open per B-135 R2; s78 feed close 1.15984 noted] | — | MTEXIT 1.15987 (pack74) | fill 1.15987 (pack75) | (1.15987/1.15989 J1096037) | 0 | 0 | EXACT.
- A3 #6 buy: his 1.16019 [reg row 3 HIS report] | open 16:00 1.16018 (A3 pack7) | UJADMIT 1.16018 (J1110797) / EXECUTED 1.16019 (pack2) | fill 1.16019 (pack1) | (1.16018/1.16019 J1110801) | −1 | +1 | SPREAD.
- A3 #7 sell (exit): his = 23:55 opening price [s28 pin, rule form, no numeric cell] | 23:55 open = 1.16129 by code path (DAY_CLOSE exitPrice = nextOpenPx at the 23:55 pass) | MTEXIT 1.16129 (pack1734) | fill 1.16129 (pack1735) | (1.16129/1.16136 J1112591) | 0 | 0 | EXACT.
- A4 #8 buy: his 1.16138 [reg row 4 HIS report] | open 09:20 1.16135 (A4 UJBARMAP bar=09:20) | UJADMIT 1.16135 (J1113881) / EXECUTED 1.16138 (pack2) | fill 1.16138 (pack1) | (1.16135/1.16138 J1113885) | −3 | +3 | SPREAD.
- A4 #9 sell (exit): booked 1.16200 [UJADMIT tp + TP_ELECT shadow 09:20 + ORDER tp J1113885 + MTEXIT; line name not printed on these rows]; reg cell TP 1.16201 [R60 G4, run-sourced] | — | MTEXIT 1.16200 (pack391) | fill 1.16201 (pack369) | UNKNOWN (no close pair printed; TP/SL closes print no ORDER row) | — | +1 | LAG (fill 10:53:07 in-bar after the touch level; moved).
- A5 #10 buy: his 1.16264 [reg row 5 HIS report] | open 16:45 1.16261 (A5 UJBARMAP bar=16:45) | UJADMIT 1.16261 (J1116723) / EXECUTED 1.16264 (pack2) | fill 1.16264 (pack1) | (1.16261/1.16264 J1116727) | −3 | +3 | SPREAD.
- A5 #11 sell (exit): his TP 1.16315 [reg row 5 HIS report] | — | MTEXIT 1.16315 = booked (pack128; UJADMIT tp 1.16315) | fill 1.16315 (pack105) | UNKNOWN (no pair) | 0 | 0 | EXACT.
- A6 #12 sell: his 1.16205 [reg row 6 HIS report] | open 10:10 1.16205 (A6 pack8) | UJADMIT 1.16205 / EXECUTED 1.16205 (pack2) | fill 1.16205 (pack1) | (1.16205/1.16206 J1118714) | 0 | 0 | EXACT.
- A6 #13 buy (exit): booked 1.16102 [= MTEXIT; ORDER tp J1118714] | — | MTEXIT 1.16102 (pack156) | fill 1.16102 (pack135) | UNKNOWN (no pair) | 0 | 0 | EXACT.
- A7 #14 sell: his NONE (reg cell 1.16220 [51 build; R53], machine-sourced) | open 17:00 1.16220 (A7 pack8) | UJADMIT 1.16220 / EXECUTED 1.16220 | fill 1.16220 (pack1) | (1.16220/1.16223 J1121163) | 0 vs open | 0 | EXACT.
- A7 #15 buy (exit SL): his NONE (no his exit-price cell) | — | MTEXIT SL 1.16274 = slRef (ORDER sl J1121163; pack170) | fill 1.16275 (pack124, server 17:26:29 — broker SL, EA printed MTEXIT later at the 17:35 pass) | UNKNOWN (no pair) | — | +1 | LAG (fill after move; EA print lags the broker fill).
- B2 #8 buy: his 160.059 [reg B-129 correction + his 16:15-open timing rule; open 16:15 160.059 (B2 pack7)] | open 160.059 | UJADMIT 160.059 (J1177863) / EXECUTED 160.065 (pack2) | fill 160.065 (pack1) | (160.059/160.065 J1177867, spread 6) | −6 (= spread) | +6 | SPREAD (the relay's 160.065-vs-160.059 settled: ask-side execution of his bid open).
- B2 #9 sell (exit TP): revised target 160.298 [= MTEXIT; booked-at-entry 160.723 per ORDER tp J1177867, revised by his RETARGET rule] | — | MTEXIT 160.298 (pack506) | fill 160.298 (pack495) | UNKNOWN (no pair) | 0 vs revised | 0 | EXACT.
- B3 #10 buy: his 160.524 [s95 TPCENSUS ref = 14:40 open; open 14:40 160.524 (B3 pack8)] | open 160.524 | UJADMIT 160.524 (J1197592) / EXECUTED 160.530 (pack2) | fill 160.530 (pack1) | (160.524/160.530 J1197596, spread 6) | −6 (= spread) | +6 | SPREAD (160.530-vs-160.524 settled likewise).
- B3 #11 sell (exit): booked 160.587 [= MTEXIT; ORDER tp J1197596] | — | MTEXIT 160.587 (pack136) | fill 160.588 (pack120, server 15:23:06) | UNKNOWN (no pair) | 0 | +1 | LAG (fill after move; 15:20 bar o=160.543).
- C-06-03 #4 buy: his 159.929 [reg section C: entry 09:10 open 159.929; open 09:10 159.929 (C-06-03 pack8)] | open 159.929 | UJADMIT 159.929 (J1167800) / EXECUTED 159.932 (pack2) | fill 159.932 (pack1) | (159.929/159.932 J1167804, spread 3) | −3 (= spread) | +3 | SPREAD (159.932-vs-159.929 settled likewise).
- C-06-03 #5 sell (exit): his 159.983 [reg section C VALID-taken cell] = booked [= MTEXIT; ORDER tp J1167804] | — | MTEXIT 159.983 (pack145) | fill 159.983 (pack130) | UNKNOWN (no pair) | 0 | 0 | EXACT.
- R4: 20 graded rows: 9 EXACT (A1e, A6e, A7e, A2x, A3x, A5x, A6x, B2x, C-06-03x) / 8 SPREAD (A2e, A3e, A4e, A5e, B2e, B3e, C-06-03e, A1x) / 3 LAG (A4x, A7x, B3x) / 0 SIGNAL-DIFFERENT / 0 UNKNOWN. No SIGNAL-DIFFERENT row exists. SPREAD and LAG are his EXACT-PRICE-NO-LENIENCY defect classes (L34): the fills behind them are diagnosed, never tolerated, and nothing is fixed here.
- R5 (report only, never counted): C-05-27 #2 buy: open 15:35 159.340; UJADMIT 159.340 (J1144554); fill ask 159.344 (+4, pair J1144558); no his-cell → SPREAD. C-05-27 #3 sell: MTEXIT TP 159.535 (pack521) = fill (pack512) → EXACT. C-06-04 #6 sell: open 09:55 159.868 = UJADMIT (J1173530) = fill (not his) → EXACT. C-06-04 #7 buy SL: MTEXIT 159.920 = slRef = fill (pack147) → EXACT.
- R6 not triggered (no SIGNAL-DIFFERENT row; no code spot to name, nothing drafted).

## Part X - records (grep first, append once, verify count 1)

- X1 CONTEXT §4: appended the B138 lesson line (relay text verbatim). Verified count 1.
- X2 §5: appended the planner-stated B-138 line. Verified count 1.
- X3 HANDOFF §3: appended with verdict MEASURED. Verified count 1.
- X4 Ledger 1283, tag B138-PRICE-CENSUS (R1 spots, R2 settings, R3 table, R4 verdict, R5 rows). Verified `1283.`-class 1, `1282.` = 1.
- X5 Pointer (35-line cap): MEASURED; EA/EX5 SHAs unchanged (64-char); `Lane: PRICE-FIDELITY (first B-138, 1 of 6)`; R4 line; goal open. Register untouched.

## Part F - file, push, reply

- F1 this result. F2 slice (R1 raw, R2 raw, R3 with pack lines; under 600 lines). F3 ledger 1283. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF (never EA/ex5/indicator/includes/logs/journals/inis/profiles/backups/scripts).
- F6 commit + push via backup + ls-remote check. Reply MEASURED, no carried note (no price left unsettled: every gap classed from rows).

## Final disk state (MEASURED turn; B-137 kept build on disk, verified)

- EA `585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6` + EX5 `AB159DE742F8EE9CF3FD2C1A4AE7A08A6CEE744728206B5325004FFCCBFB6FE9` (matching kept pair). Indicator src/ex5 + HTFEngine at gate SHAs, untouched. terminal.ini 4082A94F + Charts restored (one RecompiledAll stamp line reverted; no launches; no terminal64). Strategy skill, journal CSV, register, spec, FINDING, kit files untouched (read-only; Part B/R greps + reads only). Helper scripts unstaged. No Ex5/source committed.

(End of file)
