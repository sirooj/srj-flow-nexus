# BUILDER FINDING — EXIT-0817: the 08.17 trade correction (entry time, W-POC-jump exit) + the "break POI = bias" search answer
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_EXIT-0817.md
Date: 2026-09-09. Audit + record amendment — ZERO source changes (EA AB102C0A...3A24EAC and CQD
92F3A62B...7969F re-verified at session start, byte-identical to the T161I/T161J baselines).
Trigger: OPERATOR MESSAGE 2026-09-09, verbatim (screenshot attached: MT5 EURUSD M5, 17 Aug,
date box on 15:54; the solid POI step line jumps ~16:30-16:35 from ~1.15790 to ~1.15918; price
collapses after 16:35 toward ~1.1590 at the right edge):

  "My 8 17 trades NY long was an intricate trade. what i mean is, this is the intricate example
   of an early exit or if i held, it would hit SL. actually i don't know where do you get the
   data that says my entry was at the 16:20, my entry is at 15:50 confirmation candle close or
   15:55 opening candle. the entry was from the W VWAP but what trigger the early exit was the
   jump or gap of the W POC, hence the revised exit or TP target. I have attached the trade
   journaled trade, the exit was 17:10 candle open because it opened below the W POC or break
   the bias. seacrh if i have explained the break POI level bias because i have done so but i
   suspect it got lost in the handoff."

## 1. THE SEARCH ANSWER: NOT LOST. The rule is in Part A Spec v4.2, with 8/17 as its OWN example.
Source of record: SRJ_FlowNexus_Local\00_CURRENT_WORKING\SRJ Flow Nexus — Part A Specification v4.2
(36,202 bytes). Measured quotes, with the spec's own line numbers:
- §5.1 THE RULE (L234-241): "POI ahead of the trade — above price for a LONG, below for a SHORT
  → take-profit target. Exit on touch." / "POI behind the trade → it supports the trade. Exit
  only on a body close through it. A wick through does nothing." / "The body-close break is an
  unconditional immediate exit. Operator: 'i exit early or right there, disregarding if TP or
  SL.' Not weighed against a competing target."
- §5.2 SIDE IS DYNAMIC (L243-249): "The case that produced the rule: a POC below a LONG
  relocates upward to sit just beneath the current candle. It has NOT become a target — still
  below price, still behind, still supporting — so it remains under the body-close rule. Price
  retraces, a body closes below it, side flips, exit. THAT IS 8/17." Contrast (L249): a POC
  relocating to sit ABOVE a LONG is ahead from that bar forward = a touch-exit target.
- §5.3 (L253): no gap concept, no favour/adverse asymmetry — "the rule is blind to direction of
  movement. The tests are which side and body versus wick."
- §1.3 RETIRED CONCEPTS (L60): "'Gap' / 'jump.' Descriptive language for the nature of POC and
  VWAP movement, never a mechanism. There is no gap test, no relocation threshold... Targets
  follow the nearest valid POI as values move; that is all." (L62): "'Break' is not an event;
  it is a state — which side of the line price is on."
- §4 (L226) — the exact exit mechanics the operator describes: "The 8/17 exit was already this
  compound test — a body close through the POC, measured against the POI value as it stood at
  the NEXT open." The operator's "exit was 17:10 candle open" = the 17:05 body close through
  the W POC, executed at the 17:10 open. The operator's narrative and the spec AGREE exactly.
- §5.4 (L255-266): the same test pre-confirmation kills the candidate (POI behind body-broken).
Compressed form also in CHARTER.md §2 (L31-32). NOTHING was lost in the handoff.
- IMPLEMENTATION STATUS (the real gap): the exit model §5 is NOT BUILT. CHARTER.md §3 (L63)
  lists "the entire exit model §5 and concurrency/dedup §6" under wrong-or-missing; charter §4
  STEP 4 (L82) is its build slot. The EA today signals only; no §5 exit machinery exists.

## 2. THE "16:20" PROVENANCE — A BUILDER ERRATUM, NOW CORRECTED
- 2026.08.17 16:20:01 is the EA's OWN simulated SIGNAL timestamp of the frozen Tier-1 baseline:
  BUILDER_RESULT_155-REG.md STAGE 6 verbatim "2026.08.17 16:20:01 [SRJ-EA] ALERT SRJ SIGNAL
  LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870 TP 1.16141 spr=2"; corroborated by
  R-89 (four independent lines). GOAL_STATEMENT.md L53 attributes it to the EA — correct.
- NEW_SESSION_PROMPT.md (written ~05:30 last session) then wrote "EA 16:35 vs THEIR 16:20"
  — a builder conflation: the EA's old signal time was framed as the operator's entry. The
  operator's journal row #223 (OPERATOR_TRADE_JOURNAL.csv line 224) carries NO entry time:
  223,,NY,TF,Bull,Bear,Bull,🐂,,W VWAP,3,AVP,<3 TradingView shot links>,<2 Telegram links>,
  Gain 0.10, comment "or full L https://www.tradingview.com/x/F80Pxy27/
  https://www.tradingview.com/x/89T52oiL/ https://www.tradingview.com/x/lczYv2B2/".
  The "16:20" was never the operator's datum. The prompt line is marked as an erratum and fixed.

## 3. THE CORRECTED 08.17 TRADE RECORD (operator's facts, this message)
- ENTRY: 15:50 confirmation-candle close / 15:55 opening candle, from W VWAP (long).
- EXIT: the 17:10 candle OPEN — it opened below the W POC ("break the bias"), early exit.
- TRIGGER: the JUMP/GAP of the W POC (the relocation up, ~16:30-16:35 on the chart) — hence the
  revised exit/TP target. (Spec framing: §5.2 relocation + §1.3 "targets follow the POI as
  values move"; the jump itself is descriptive, never a mechanism.)
- OUTCOME: +0.10 (journal row #223, W=1). THE INTRICATE EXAMPLE: an early exit that SAVED the
  trade — "if i held, it would hit SL" (i.e., hold-to-original-TP would have lost).

## 4. MEASURED EA-SIDE FACTS AT THAT WINDOW (T161J_JOURNAL.log, 06_HANDOFFS)
- 15:50:03 STATE S1_REGIME->S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Weekly-VWAP — the EA's
  candidate SEEDS at exactly the operator's confirmation candle. S3INPLAY bar 15:45 inPlay=0
  via=none (zoneLo 1.15784 zoneHi 1.15796, XOB 1979 promoT 06:45); "S3 waiting: no qualifying
  zone"; 15:55 FRESHSKIP PRE_BINDING + SUPPRESSED (cum_opp=2); still S3 through 16:05.
- CQD confirmed verdicts around the entry: -1 (bar 15:05, read 15:15); -2 (bar 15:25, read
  15:35); -1 (bar 15:55, read 16:05). SIGNAL: 16:35:02 LONG R=1.46 SL 1.15870 TP 1.16141.
- CONSEQUENCE LAYERS for the pending 08.17 structural comparison (measured, no ruling proposed):
  (1) ENTRY TIMING — operator 15:55 vs EA 16:35:02 (~40 min): the EA's own seed time matches
      the operator's entry; the delay is the S3 zone/divergence gates downstream.
  (2) CVD CLASSIFICATION — the operator's row codes the setup CVD=3 (bullish hidden); the EA's
      confirmed stream at 15:15-16:05 reads -1/-2/-1. A classification disagreement datum at
      15:25-15:55, operator-reserved (same family as the settled 08.18 phantom-code-4 item).
  (3) EXIT — §5 is unbuilt (STEP 4); the 17:10 behavior does not exist in the EA yet.

## 5. RECORDS AMENDED THIS SESSION (no canonical file touched)
- .clinerules §7.1: session block appended (this finding + the erratum).
- NEW_SESSION_PROMPT.md: the "their 16:20" line corrected; pointer to this file added.

