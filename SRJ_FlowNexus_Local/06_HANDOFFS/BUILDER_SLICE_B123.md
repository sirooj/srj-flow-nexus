# BUILDER SLICE B-123 - raw rows, raw code, raw chart-file lines (staleness + panel flavor, MEASURED)

Scope: read-only. Runs: kept June 04:52-04:54 Core 04 EA 137076D9; RECON62 [TRIAL] 05:06-05:08 (probe prints only). Indicator 956BF3E3 both windows.

## START GATE (raw)

- `git ls-remote backup builder/B-122` = `b948399247ec427993fa26a5800bf37932afc7d7` (verified; cut builder/B-123 here).
- `git log -1` = `b948399 B-122 confirmed-read diagnostic STOP before edit, switch already live (relay B-122); verdict STOP`.
- `git status --short` count = 454 (pre-existing + untracked, preserved, none staged).
- Seven-path diff vs b948399 EMPTY. Ledger `^1267.`=1, `^1268.`=0, `B123-`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 / EX5 FA4C924978F6 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 (all PASS).
- terminal64: NONE running (verified empty).

## PART B (counts)

- Operator message: verification + paste instruction. `no new rule words`; appended nothing.

## R1 RAW DATING (V8 IE1 confirmed selection)

- `git log -S "inUseConfirmedHTFOnly" -- Experts/...EA.mq5` sole introducer: `8e061b1 2026-09-27 V8 built 14C7476C EA 0/0 + FlowLogic 0/0 (ledger 876)`. `git log -S "PERIOD_M15, false, 60"`: only 8e061b1 + initial-add 7b0491a → never reverted. Ancestor checks: 8e061b1 is ancestor of B-15 chain (cc7dca4) AND kept (f19435b) → both TRUE.
- (a) A-Q1 7-take builds (B-13 T1 7/7 exonerated, B-20 all-reproved KEPT, early Oct, post-V8): TRUE.
- (b) B-16 j3 (EA F04AF9C3 on disk 2026-10-04, post-V8 chain): TRUE.
- (c) HTFAUDIT-1 build (EA 82DDAB33, 2026-09-09): FALSE, explicit positional (finding lines 36-46, seven-arg call, no group slot). Corollary: B-16 D1 splits measured under confirmed=true (UJALIGN-guard print caveat stands).

## R2 RAW CHART FILES (read-only; never written)

- Profiles/Charts/Default/chart01.chr (USDJPY): `inHtf1_manual=16388||inHtf2_manual=16385||inHtf3_manual=15||inUseConfirmedHTFOnly=false||...` (explicit).
- chart02.chr (EURUSD): same `...||inUseConfirmedHTFOnly=false||...` (explicit).
- chart03.chr (USDJPY): same explicit false. chart04.chr (USDJPY): same explicit false.
- All LIVE symbols (no _RAW); chart TFs UNKNOWN from file bytes (no text marker; not inferred). Local MT5 Profiles/Charts/Default (his terminal).
- Stock Templates/*.tpl: no SRJ block. Profiles/Tester/SRJ_FlowLogic.set (saved 2026-08-14): `inUseConfirmedHTFOnly=false||false||0||true||N` (+ H4/H1/M15 manuals 16388/16385/15, lookback 3000). No file on disk sets true.
- MTFBox follows the switch (FlowLogic 1463-1465 passes h1_b/h1_2/h1_3/h1_o ×3 from ternary 1195-1197) → these panels show open-instant too.
- Where he reads structure: spec 9.1 ("operator reads structure on TradingView/OANDA; system runs Dukascopy demo feed"); HTFAUDIT-1 §1 (15m HTF chart attached; attachment unreadable, description is datum) + §6 (his chart's CONFIRMED 15m flip at 17:30 vs EA open-instant 16:45 — that build).
- Flavor: local MT5 panel = OPEN-INSTANT; TradingView/OANDA = CONFIRMED-style (HTFAUDIT §5-6); EA handle = CONFIRMED.

## R3 RAW ROWS (UJPROBE h4/h1/m15; (i) held + (ii) after containing close)

- 1S 15m: (i) 17:30/17:35 bars m15=-1.0 ([17:15,17:30) closed); (ii) 17:45 bar m15=+1.0; his bullish (W6 bar-named) → ONE-CANDLE-LAG.
- 4JUN 4H: (i) 09:10-09:55 h4=+1.0 ([08:00,12:00)); (ii) 12:00/12:05 bars h4=+1.0; his Bear (row 13) → PERSISTS.
- 4JUN 1H: (i) 09:10-09:55 h1=-1.0 ([09:00,10:00)); (ii) 10:00/10:05 bars h1=-1.0; his Bull → PERSISTS.
- 4JUN 15m: (i) 09:45-eval +1.0 ([09:30,09:45)); 09:50-eval -1.0 ([09:45,10:00)); (ii) 10:00/10:05 bars m15=-1.0; his Bull → PERSISTS.
- 11JUN 4H: (i) 14:20-14:40 h4=+1.0 ([12:00,16:00)); (ii) 16:00 bar h4=+1.0; his Bear (rows 33-36) → PERSISTS.
- 11JUN 1H: (i) +1.0 ([14:00,15:00)); (ii) 15:00/15:05 bars h1=+1.0; his Bear → PERSISTS.
- 11JUN 15m: (i) 14:35/14:40-eval -1.0 ([14:15,14:30)); (ii) 14:45 bar m15=-1.0; his Bull → PERSISTS.
- 3JUN 4H: (i) 09:00-09:10 h4=+1.0 ([08:00,12:00)); (ii) 12:00 bar h4=+1.0; his Bear (row 9) → PERSISTS.
- 3JUN 15m: (i) 09:00-09:10 m15=+1.0 ([08:45,09:00)); (ii) 09:15 bar m15=+1.0; his Bear → PERSISTS.
- SAME cells: 7S 09:15 +1.0 → 09:30 bar +1.0 (lag-agrees); 8S 10:05 -1.0 → 10:15 bar -1.0 (lag-agrees).
- Counts: LAG 1, PERSISTS 8. (ii) uses post-candle price: measurement, never rule.

## R4 RAW (open-instant readability)

- Every cell: NOT READABLE. No false-handle run covers these bars (HTFAUDIT false build = August bars; B-16 j3 already true per R1(b); P-HTFLOG per-leg prints never shipped; no invalidation-count prints on UJPROBE rows). No new run.

## R5 RAW PROJECTION (under (ii); open-instant column NOT READABLE throughout)

- 1S (-1/-1/+1): LONG votes=1 → NONE (unchanged; preempt path). 4JUN (+1/-1/-1): SHORT TREND (fire stands). 11JUN (+1/+1/-1): LONG TREND (B3 stands). 3JUN (+1/-1/+1): LONG TREND (C3 stands). NO row moves; no A/B3/C3 moves. (B-121 R5 equalize-to-chart threatened B3/C3; confirmed-lag frame moves nothing.)

## R6 RAW SITES (kept builds)

- HTFEngine: ProcessBar line 108; `e.outBias = retBias;` 507; closed-only `if(barClosed){...}` 512-516; RunOne gate 545-551 (once per HTF bar, first M5 bar, frozen after); RunAll 581-596 (flag ignored for compute); GetOutputs 598-605.
- FlowLogic: ternary 1195-1197 (one site ×3 legs) + GetOutputs 1454-1456; switch line 252 `= false`; EA passes true at EA:11491 (position 7, type-aligned 8-for-8).
- EA consumes FL_BUF_HTF_HIGH/MID/LOW at EA:2542-2544.
- Narrowest panel-equalizing shape: ONE argument at EA handle (position 7 true→false; engine-wide revert). Drafted nothing. Since R3 mostly PERSISTS: flavor is not the cause — detection content + 9.1 feed bound instead. Note: flipping to false contradicts his confirmed order; GATE-AUTHORIZATION blocks without a new pin — described, never proposed.

## RECORD LINES (exact)

- X1 §4: `- B122-LIVE-HANDLE-FIRST (planner lesson 2026-10-09): before drafting any indicator switch or input edit, read the EA's live iCustom call and the run rows' own flags (confirmedFeed); an indicator default is dead when the EA passes the value. B-121 R6 read the default as live and B-122 stopped before a no-op edit.`
- X2 §4: `- B123-HTF-STALENESS (planner lesson 2026-10-09): settle which flavor his chart panel shows before calling a machine HTF read inaccurate, and class each split as a one-candle lag or a persisting read on the rows; FIX-NOT-REPLACE defines accurate against his chart read at the bar.`
- X3 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-123; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X4 §3: `- B-122: STOP before edit; the confirmed HTF switch is already live at the EA handle, so the indicator default flip was a no-op; no edit or run.`
- X5 §3: `- B-123: measured which HTF read his chart panel shows and whether each machine-vs-chart split is a one-candle lag of the confirmed read; no source edit or run.`
- X6 ledger `1268.` (tag `B123-HTF-STALENESS`; R0-R6 + provenance; no rule invention).
- X7 pointer (cap 35): latest B-123 MEASURED; R1 dating; R2 flavor; R3 counts; kept EA/EX5/indicator; 4JUN + 5JUN-1615 open; goal open.
- Pre-commit: X1/X2/X3/X4/X5 counts 1; X6 count 1; `^1267.` = 1; staged = 6 relay files only; no source/EX5/journal/log/settings/charts/profiles diff.

(End of slice)
