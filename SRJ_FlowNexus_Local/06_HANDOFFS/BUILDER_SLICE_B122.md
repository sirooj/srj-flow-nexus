# BUILDER SLICE B-122 - raw spots, no diff (STOP before edit; switch already live)

Scope: K-spot check only. No edit, no backup, no compile, no runs. Nothing to restore.

## START GATE (raw)

- `git ls-remote backup builder/B-121` = `0a3ab89739261319104b630f678d567fc04b299f` (verified; cut builder/B-122 here).
- `git log -1` = `0a3ab89 B-121 HTF read fidelity at named candles (relay B-121); verdict MEASURED`.
- `git status --short` count = 454 (pre-existing transition-work + untracked artifacts, preserved, none staged).
- Seven-path diff vs 0a3ab89 (six relay files + register) EMPTY. Ledger `^1266.`=1, `^1267.`=0, `B122-`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 / EX5 FA4C924978F6 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA (all PASS). HTFEngine D5FD5B06 (record only; same prefix as B-16 era).
- terminal64: NONE running at gate (PID 7668 closed before paste) — 0.5 STOP did not fire.
- Working-tree M flags are pre-existing (kept EA over older blob + transition texts); indicator/EX5/HTFEngine clean vs HEAD.

## K1 AUTHORITY (raw quotes)

- Strategy line 93 (FIX-NOT-REPLACE, his order 2026-09-26, verbatim): "I said the HTF engine of the SRJ Flow Logic is sometimes not accurate that means i want you to fix it to be more accurate and robust, NOT replacing it." + accurate = confirmed read equals his chart read at the bar + robust = no open-instant repaint, firing flip signal.
- Strategy line 92 (ENGINE-REFINE-KEEPS-VALID-TAKES, his words 2026-09-26, verbatim): "the reinforment of the HTF engine of the SRJ Flow Logic won't change the 7 valid trades on EU IF DONE RIGHT. the rule of the trend following setups is the same."
- HTFAUDIT-1 lines 107-118: P-HTFLOG + P-HTFCONF NOT ISSUED; P-HTFCONF = "flip the binding word false->true ... the legs then export the CONFIRMED (closed-bar) bias" + "NOT identity-safe: ClassifyRegime reads the SAME buffers — admission votes change".
- No contradiction found. (Moot: the shape is already live — K2.)

## K2 RAW SPOTS (the STOP finding)

- Indicator inputs, in order (SRJ_FlowLogic.mq5 lines 246-253): group-string(246), inChartTradingTF(247), inHtfLookbackBars(248), inHtf1/2/3_manual(249-251), inUseConfirmedHTFOnly(252) `= false`, inHtfMaxTrackedObjects(253).
- Line 252 raw: `input bool            inUseConfirmedHTFOnly = false;`
- EA live handle (EA:11486-11491): `g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName, "", 1, InpFL_HtfLookbackBars, PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);` + B-29 group-slot comment + V8 IE1 "confirmed selection (F252 inUseConfirmedHTFOnly...)" comment. Eight args map 1:1 onto the eight inputs with exact type alignment (string→group; 1→CTF enum; int→lookback; 3×timeframe→manuals; `true`→inUseConfirmedHTFOnly; 60→maxObjects=default 60). Single FlowLogic handle (only iCustom for it: EA:11486; POI/CQD/fractal handles separate). InpFL_HtfLookbackBars=3000 (EA:51; slot fix live).
- Ternary site (FlowLogic 1195-1197): `h1_b = inUseConfirmedHTFOnly ? g_htfHi.outCBias : g_htfHi.outBias;` (×3 legs). GetOutputs (HTFEngine 598-605): confirmed branch selects outCBias/outC2OB/outCLine3/outCOpp.
- RunAll (HTFEngine 581-596, called FlowLogic 1446-1447 WITH the flag): flag NOT passed to RunOne calls (584-586) — computation identical either way; outputs only.
- Buffer scope: g_bufHtfHi/Mid/Lo write ONLY from h1_b/h2_b/h3_b (FlowLogic 1198-1200); h1_2/h1_3/h1_o reach panels only (MTFBox 1463-1465). No 5m LTF/OB/FVG/sweep/CQD/other buffer on this path. Switch is buffer-clean AND dead for this handle.
- Engine sites (HTFEngine): ProcessBar line 108; `e.outBias = retBias;` line 507; closed-bar-only `if(barClosed) { ... e.outCBias ... }` lines 512-516; RunOne gate lines 545-551 (once per HTF bar at first M5 bar, frozen after).
- Row corroboration: every UJPROBE row in both cited windows prints `confirmedFeed=1`.
- Conclusion: K4 default-flip changes no handle/buffer/run → STOP, no edit. j47/j48 not launched (would reproduce kept rows; filing them as a diagnostic would misrepresent a no-op).
- B-121 correction: B-121 R1/R6 read the indicator DEFAULT as live behavior. Live handle passes true → engine exports outCBias on current rows. UJPROBE splits stand as rows; open-instant attribution (2026-09-09 build) does not transfer. Replacement hypothesis (measured, not concluded): outCBias freezes the whole HTF bar (last closed bar), so 1 Sep 17:30 holds the closed [17:15,17:30) read vs his forming-[17:30,17:45) chart read — one-bar staleness. V8 IE1 comment suggests the flip predates kept; exact dating = ledger-grep task, not asserted.

## K3/K4/K5 (not executed)

- No .preB122 (nothing to back up for), no .B122CONF (no edited bytes), no compile. No diff exists — none pasted. EA EX5 still FA4C924978F6 (untouched).

## T (not run) + T5 verify-unchanged

- j47/j48 NOT LAUNCHED. No new rows; T3/T4 ungraded. T4 verdict lines ungraded; overall verdict STOP (nothing to restore).
- Post-decision re-verify: indicator src 956BF3E3ADB7 + ex5 27B5F272DCFA; EA + EX5 gate SHAs; terminal.ini + charts untouched (no launch); no terminal64 started (none at close); no .preB122 copies (no launch scope).

## RECORD LINES (exact)

- X1 §4: NOT appended (exact text describes unrun diagnostic; reason in result + ledger 1267).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-122; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: NOT appended (exact text claims unrun RECON62+June rows; reason in result + ledger 1267).
- X4 ledger `1267.` (tag `B122-HTF-CONFIRMED-DIAG`; K STOP + SHAs + no-run + B-121 correction + X1/X3 reasons; no rule invention).
- X5 register §A row-2 block: `- NOTE 2026-10-09 (B-121 B2, planner): the "++" in row 2 has no verbatim source; his 2026-09-23 words put "++" on 9/4 only (strategy line 79) and leave the 9/1 setup class for him (line 77). Cell left as written; nothing inferred.`
- X6 pointer (cap 35): latest B-122 STOP; evidence; indicator never touched; no edited copy; 4JUN + 5JUN-1615 open; goal open.
- Pre-commit: X2/X4/X5 counts 1; X1/X3 counts 0 (documented); `^1266.` = 1; staged = result+slice+ledger+pointer+context+register (handoff unchanged, unstaged); no source/EX5/journal/log/settings diff.

(End of slice)
