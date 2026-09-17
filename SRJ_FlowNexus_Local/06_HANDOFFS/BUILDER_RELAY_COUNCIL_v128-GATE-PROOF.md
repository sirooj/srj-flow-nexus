# RELAY v128 - GATE PROOF + GUARD RULE (fresh-safe, SAME-PROMPT both seats)

**Version:** v128 (closes the V127 pre-build gates with whole-tree proof + ruled guard shapes. Follows Luna `LUNA-V127-DEMO-PACKET-SCOPE-001` + review-seat check: ISSUED but BLOCKED pending login-lock + stops-decision; risk value + other-path open. Sonnet v127: stops warn-only + no account check + whole-tree ask, quoted below.) **Fresh-profile-safe:** base + proofs + guard spec ALL INLINE. Tree unchanged (`9D123133`/596222 + `BEC2CBBD`/69852 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only + ONE fact (demo login, asked in report, never invented).

## 0. Base (complete)
- Standing: packet ISSUED (dual-key); build BLOCKED on two gates; promotion proven-but-unlanded; LANDING untouched (no commit/tag/push asked). All words SPENT.
- Sonnet demands (complete quote): stops-level is warn-only inside PrintFormat (fix before safeguards complete); no ACCOUNT_TRADE_MODE/demo check anywhere (operator discipline only); whole-tree read for second paths (only full-repo access answers).

## 1. SOURCE T - whole-tree order-path proof (asserted counts verified at relay build)
- EA order calls: g_trade.Buy x1 (EA:10025) + g_trade.Sell x1 (EA:10027) ONLY; OrderSend/OrderSendAsync/MqlTradeRequest ZERO file-wide. Enclosing fn EvaluateClosedBar, single callsite (EA:11102, OnTick bar-close path). Chain: OnTick -> EvaluateClosedBar -> S5 fire -> InpMode gate (EA:9968, early return) -> Phase-2. No second path exists in the EA.
- Includes: ZERO matches for OrderSend/CTrade/PositionOpen/g_trade across all Include/SRJ/*.mqh. FlowLogic is an indicator (cannot trade by platform rule).
- Config values (code decls, ini has NO overrides - verified): InpRiskPercent = 1.0; InpMagicBase = 773000 (London +1 / NYAM +2); InpMode default ALERT_ONLY. Tester ini: EURUSD/M5/Deposit 10000, debug on, 08-26 to 09-09.

## 2. Guard spec (proposed, UNBUILT - council rules shape here)
- G1 TRADE-MODE: first line inside Phase-2 (before magic/concurrency): if InpMode==MODE_EXECUTE and AccountInfoInteger(ACCOUNT_TRADE_MODE)!=TRADE_MODE_DEMO -> print + abort, never reach sizing/send. Named-login lock additionally recorded from operator (asked in report, one fact).
- G2 STOPS-HARD: replace warn print with print + abort when slPts/tpPts below stopsLevelPts (reject, not broker-bounce). Freeze level stays observe/log (unchanged).
- G3 VOLMAX: keep cap-and-log as coded (Sonnet-noted nuance carried, not altered without ruling).
- Session throttle + concurrency + magic split: keep as coded (both seats confirmed present).

## 3. Asks (IDENTICAL both seats)
- **Ask-1 GATE-EVIDENCE?** Single order path (chain above) + risk 1.0 + magic 773000 + mode-default + ini-clean + includes-clean (correct-or-correct per line)?
- **Ask-2 GUARD-RULE?** G1 trade-mode-demo-abort + G2 stops-reject + G3 volmax-cap-kept + named-login-recorded-by-him: RULE the shapes BY NAME (amend or re-author)? Build stays blocked until ruled + login recorded.
- Threshold: filed-authoritative, R>=1.0, A+ strict, DEMO-ONLY (no real money anywhere). Locks: RECON17 frozen; builds uncommitted; nothing builds/runs/commits here.

## 4. Branches
- Guards-ruled (+ login recorded) -> token + word -> STAGE-1 verify -> build -> 0/0 -> demo-run (signal-to-fill grade pre-registered per V127) -> relay. Amend -> one closed-set re-ask. Decline -> QUIESCENT (alert-only stands). Split -> ONE closed-set re-ask.

(End - v128 awaits verdicts + Ruling-IDs; nothing builds/runs/commits/spends here.)
