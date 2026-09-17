# RELAY v131 — NARROW EVIDENCE PACKET ISSUANCE (positive guard-pass row) + LAND GATE (fresh-session-safe, SAME-PROMPT both seats)

**Version:** v131 (follows v130 verdicts: Luna `LUNA-V130-DEMO-RECORD-LAND-002` record-ACCEPT + LAND HOLD for one positive row, with its EXACT NEXT GATE quoted below; review-seat `LUNA-V130-REVIEW-DEMO-LAND-002` concurs; Sonnet: D1 deduction closes its gap, no further blocking objection, never grants tokens by standing rule). **Fresh-session-safe:** project + tree + run + verdict history + code ALL INLINE — no prior-session memory needed. Tree unchanged (EA `FC6AC694`/597252 + FlowLogic `BEC2CBBD`/69852 uncommitted; RECON17 frozen; HEAD 976a579). **Paste set:** this relay ALONE (both seats IDENTICAL asks; review seat answers check-form yes/no/discrepancy, never keys). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only. RUN-COST HEADER: one demo run ~50 min tester + grade; nothing else runs here.

## 0. Base context (complete — new-session readable)

- Project: EURUSD M5 strategy rebuild, ALERT-ONLY demo proving (tester fills only; zero order-send paths outside the one filed call site; no live money anywhere). Goal: EA takes his trades exact.
- Proven run RECON44-DEMO DONE=PASSED 2026-09-17 12:53:21 (0:48:19 healthy; 3168 bars/563338 ticks; archive 39168 lines/7614407 B/`fcf3d867…`; demo ini InpMode=1=MODE_EXECUTE; range 08-26→09-09; purity: farm/cloud off, Core-04, Test-passed, array-out-of-range 0). Grade ACCEPTED everywhere: FL fires 10:05 R 1.94 SL 1.16258 TP 1.16102; fill 1.16205 R 1.94/1.94 delta 0.00 lots 0.01; A6 + MTEXIT TP_TOUCH exit 1.16102; balance 10000→10159; 13 FAIL rows identical; isolation 202 rows / exactly 3 deltas (ALERT_ONLY 1->0, EXECUTED 0->1, PRE 0->1) / 199 identical.
- Settled record (v130, accepted by both seats): D1 guard evaluated-but-passes-silent, "never evaluates" excluded by program order + downstream fill, values-gap stands; D2 stops guard = hard abort, unexercised (stopsLevel=0); D3 R recomputed 1.9434→1.94; D4 isolation table carried whole.
- Current gate: LAND HELD on ONE gap only — no journal row prints the actual `ACCOUNT_TRADE_MODE` + login values. Luna tokens recorded-but-UNSPENT (dual-key). Pre-run off-log evidence stands (common.ini Login=1500183638 + live window title same digits on Dukascopy-demo-mt5-1, two sources). Stop-fix track independent. Forward-test separate.

## 1. Luna EXACT NEXT GATE — quoted COMPLETE (the issuance template)

"one canonical edit → rebuild → one demo proving run → one positive guard-pass row containing the actual trade mode and login values. No other behavior change is needed for that packet."

## 2. Code snippet ATTACHED (verbatim, `Experts\SRJ_FlowNexus_EA.mq5`, digest `FC6AC694`)

- L19: `enum ENUM_SRJ_MODE { MODE_ALERT_ONLY = 0, MODE_EXECUTE = 1 };`
- L307-308: `#define ABORT_DEMO_GUARD "DEMO_GUARD"` / `#define ABORT_BELOW_STOPS "BELOW_STOPS"`
- Enclosing function L6571: `void EvaluateClosedBar(int barShift, datetime barTime)` (per-bar evaluation; guard region below sits inside it).
- L9971-9981 ALERT_ONLY early return: `if(InpMode == MODE_ALERT_ONLY) { PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.", SessionName(g_sessionAtEntry)); MarkSessionUsed(...); ...; return; }`
- L9983-9989 Phase-2 + G1: `// ------ Phase 2 Execution Logic ------` + `//--- [S1-DEMO-GUARD-001] G1 demo gate FIRST ... Recorded demo login 1500183638 (measured).` + `if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638)) { GoAbort(ABORT_DEMO_GUARD, g_state); return; }` (pass = silent fall-through; fail prints via LogAbort).
- L1711-1716 LogAbort: `void LogAbort(const string reason, ENUM_SRJ_STATE atState) { PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s", TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS), reason, StateName(atState), AnchorStr(), DirName(g_dir)); }`
- L10026-10030 G2: `bool s1d_belowStops = (slPts < (double)stopsLevelPts || tpPts < (double)stopsLevelPts); if(s1d_belowStops) { GoAbort(ABORT_BELOW_STOPS, g_state); return; }`
- L10036-10040 single call site: `if(g_dir == DIR_LONG) tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment); else tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);` (whole-tree scan: Buy x1 + Sell x1, includes zero — V128 companion scan; current-tree lines 10038/10040 in this snippet).

## 3. Proposed closed-set edit (for council ISSUANCE — NOT applied; canonical needs packet/token)

- Insert after the L9987-9988 guard, before sizing: `if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));`
- Logging-only, zero behavior change, fires once per Phase-2 entry in execute mode. Expected on demo: mode value equal to `ACCOUNT_TRADE_MODE_DEMO`, login 1500183638 (integers asserted only as equality to the named constant + recorded login — no bare numeric constant claimed).
- Packet: this ONE insert → rebuild EA (expect 0 errors/0 warnings) → ONE demo run, same ini/range/settings as RECON44 → grade register: (a) ≥1 DEMO_PASS row with mode==DEMO + login==1500183638; (b) zero DEMO_GUARD aborts (two-pattern); (c) same gate+fill (FL R 1.94, fill delta 0.00); (d) compile 0/0. Novel evidence vs all priors: the positive mode+login row no run ever produced.
- Locks: RECON17 frozen; run word for the new run owed separately (token+word); at snapshot, operator re-glances demo title (30-second transport-side; already performed pre-run).

## 4. Asks (IDENTICAL both seats)

- **Ask-1:** ISSUE the narrow evidence packet exactly as §3 (one insert + rebuild + one demo run + grade register)?
- **Ask-2:** CONFIRM the §3 grade register as the land gate (row fields + zero aborts + same fill + 0/0)?
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only demo.

## 5. Branches

- Issue → build+run on his token+word → grade → land re-ask. Amend → ONE closed-set re-ask (e.g. reworded print, debug-gated variant). Halt → QUIESCENT (hold stands, proven-but-unlanded). Split → ONE closed-set re-ask.

(End — v131 asks issuance + register confirm; nothing builds/runs/commits/spends here.)
