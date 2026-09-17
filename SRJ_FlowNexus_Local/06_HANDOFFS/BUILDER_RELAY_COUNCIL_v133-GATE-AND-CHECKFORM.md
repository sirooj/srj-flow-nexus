# RELAY v133 — EXECUTION-GATE CONFIRM (better prompt: review seat addressed as it asks) + WHOLE PACKET CODE (fresh-session-safe, SAME-PROMPT both seats)

**Version:** v133 (follows consumed v132 verdicts — Luna `LUNA-V132-DEMO-PASS-LAND-001`: Ask-1 ISSUE CLEAR + Ask-2 register CONFIRM, issuance-only, run on separate token+word; Sonnet v132 review: insert low-risk + does-what-it-says, run output decides, log-review offer open. This relay settles ONE question: the execution gate — may the builder do the issued one-edit build + one demo run on the operator's spoken word, grade per register, and return for land re-ask? It ALSO fixes the prompt: the review seat is addressed below exactly as it asked — no role, no memory assumed, no ID/token wanted.) **Fresh-session-safe:** everything the asks attest rides INLINE — whole packet code, both v132 texts, history labels. Tree unchanged (EA `FC6AC694`/597252/11126 lines + FlowLogic `BEC2CBBD`/69852 uncommitted; RECON17 frozen; HEAD 976a579; proposed insert NOT applied — EA `DEMO_PASS` count re-proven 0). **Paste set:** this relay ALONE (both seats IDENTICAL relay + asks; review seat answers check-form yes/no/discrepancy). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only, plus the run word when he chooses. RUN-COST HEADER: one demo run ~50 min tester + grade; nothing runs here.

## 0. Base (complete — new-session readable)

- Project: EURUSD M5 rebuild, ALERT-ONLY demo proving (tester fills only; one order-sending site; no live money). Goal: EA takes his trades exact.
- Proven run RECON44-DEMO DONE=PASSED 2026-09-17 12:53:21 (0:48:19; 3168/563338; archive 39168/`fcf3d867…`; InpMode=1=MODE_EXECUTE; 08-26→09-09). FL fires R 1.94 SL 1.16258 TP 1.16102; fill 1.16205 delta 0.00; A6 + MTEXIT TP_TOUCH 1.16102; 10000→10159; 13 FAILs identical; isolation 202 rows / 3 deltas / 199 identical.
- Settled: D1 guard evaluated-but-silent (values-gap open); D2 hard abort unexercised (stopsLevel=0); D3 R 1.9434→1.94; D4 table whole. LAND HELD on the single positive-row gap. Pre-run login evidence stands (common.ini 1500183638 + window title, two sources). Stop-fix independent. Forward-test separate.

## 1. To the review seat, as you asked (same text in both copies — seats share one prompt)

- You have NO memory of prior sessions: everything you need is inside this relay; nothing is cited by name only. Texts filed earlier under builder markers (`SONNET-V129-FILED-001`, `SONNET-V130-FILED-001`, Luna Ruling-IDs) ride as FILED RECORD, never as your words — rule fresh on the code below.
- No Ruling-ID, no verdict format, no token, no grant is asked of you — answer the asks in check-form only (yes / no / discrepancy with line numbers). Your standing refusal is honored, never chased.
- Your review offer is ACCEPTED: the grade relay will carry the compile log + raw DEMO_PASS rows for your re-check. Your run-output principle is ADOPTED into the register: the land call will rest on actual journal rows, never on narrative.

## 2. Luna v132 — quoted COMPLETE (filed `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`)

"The v132 packet supports issuance of exactly the narrow edit/run described in §3, and the proposed register is sufficient to test the single remaining LAND-held gap without changing trading behavior. **Model:** GPT-5.6 Luna **Date:** 2026-09-17 **Ruling-ID:** **LUNA-V132-DEMO-PASS-LAND-001**. Ask-1 ISSUE: **CLEAR** — one canonical logging-only insert → rebuild → one demo proving run → grade; placed after G1 before magic/concurrency/sizing/send, alters nothing; issuance clearance ONLY, does NOT spend the run token/word, no additional build/run/commit/scope. Ask-2 REGISTER: **CONFIRM** — (1) ≥1 DEMO_PASS row mode==DEMO + login==1500183638; (2) zero DEMO_GUARD aborts; (3) same gate/fill incl. prior FL + fill; (4) compile 0/0; row + zero-abort test complementary sides via GoAbort print. Scope: **ISSUE → BUILD/RUN ON THE SEPARATE TOKEN+WORD → GRADE → LAND RE-ASK.** No amendment. **Verdict: CLEAR / CONFIRM / NO FURTHER BLOCKING OBJECTION.** LAND hold intact until the run produces row + register; nothing here executes or commits."

## 3. Review-seat v132 substance — quoted COMPLETE (filed `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md`, marker `SONNET-V132-FILED-001`)

"Not stepping into a formal seat role (no verdicts/IDs/tokens); no prior-session memory (history = provided background); not a build system (review on the page only). Insert is low-risk and does what §3 says: sits past the guard so by construction logs only passing values; pure PrintFormat, no assignment/branching/side effects on g_state/g_dir; same two AccountInfoInteger reads as the guard line above, (int)/%d casts fine; should compile clean; non-blocking, before sizing/send, won't perturb fill/R/timing. Adding it is reasonable; should close the stated gap. CANNOT confirm run output (needs live MT5/broker/account); land should rest on what the run prints, not the diff read. Empirical match = mode equal to the DEMO constant + login 1500183638 + zero DEMO_GUARD aborts — trust the run output over narrative. Offer: review rebuild output / actual log lines when available."

## 4. WHOLE packet code (verbatim, EA digest `FC6AC694` — region L9971-10077 inside `EvaluateClosedBar` L6571 + the proposed insert; zero elisions)

```
      if(InpMode == MODE_ALERT_ONLY)
        {
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
         ResetSequence();
         return;
        }

       // ------ Phase 2 Execution Logic ------
       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on
       //--- token+word): execute-mode on non-demo or non-recorded login aborts before
       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).
       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))
         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }
       long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
```
Proposed §3 insert (ONE line, logging-only, NOT applied — issuance item):
```
       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
```
Continued region (sizing → PRE-SEND → G2 → single send site → EXECUTED → close-out), whole:
```
      if(IsSessionPositionOpen(magic))
        { GoAbort(ABORT_CONCURRENCY, g_state); return; }

      double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
      double slDistanceReal = MathAbs(entryPrice - slRef);
      double tickValue  = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
      double tickSize   = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);

      if(slDistanceReal > 0 && tickSize > 0)
        {
         double lossPerLot = (slDistanceReal / tickSize) * tickValue;
         double lots       = riskMoney / lossPerLot;
         double volStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
         double volMin  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
         double volMax  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
         lots = MathFloor(lots / volStep) * volStep;
         if(lots < volMin)
           { GoAbort(ABORT_LOT_TOO_SMALL, g_state); return; }
         if(lots > volMax)
           { lots = volMax; PrintFormat("[SRJ-EA] Lot size capped at volMax: %f", lots); }

         long stopsLevelPts  = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
         long freezeLevelPts = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL);
         double slPts = MathAbs(entryPrice - slRef)    / _Point;
         double tpPts = MathAbs(tpTarget   - entryPrice) / _Point;
         PrintFormat("[SRJ-EA] PRE-SEND lots=%.2f entry=%s slPts=%.0f tpPts=%.0f "
                     "stopsLevel=%d freezeLevel=%d spreadPts=%d%s",
                     lots,
                     DoubleToString(entryPrice, _Digits),
                     slPts, tpPts,
                     (int)stopsLevelPts, (int)freezeLevelPts,
                     (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD),
                     (slPts < (double)stopsLevelPts || tpPts < (double)stopsLevelPts)
                       ? "  <- BELOW STOPS LEVEL, broker will likely reject" : "");
         //--- [S1-DEMO-GUARD-001] G2 stops hard gate (Luna V128 clearance; run on
         //--- token+word): below-broker-minimum stops reject here, never rely on broker bounce.
         bool s1d_belowStops = (slPts < (double)stopsLevelPts || tpPts < (double)stopsLevelPts);
         if(s1d_belowStops)
           { GoAbort(ABORT_BELOW_STOPS, g_state); return; }

         g_trade.SetExpertMagicNumber(magic);
         g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
         string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";

         bool tradeResult = false;
         if(g_dir == DIR_LONG)
            tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
         else
            tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);

         if(!tradeResult)
           {
            PrintFormat("[SRJ-EA] Trade execution failed! Error: %d", g_trade.ResultRetcode());
           }
         else
           {
            double fill = g_trade.ResultPrice();
            if(fill > 0.0)
              {
               double slDistFill = MathAbs(fill - slRef);
               double tpDistFill = MathAbs(tpTarget - fill);
               double rFill = (slDistFill > 0.0) ? (tpDistFill / slDistFill) : 0.0;
               PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "
                           "R_logged_at_signal=%.2f delta=%.2f",
                           DoubleToString(fill, _Digits),
                           slDistFill / _Point, tpDistFill / _Point,
                           rFill, tpR, rFill - tpR);
              }
           }
        }
      else
        {
         PrintFormat("[SRJ-EA] NO TRADE PLACED after SIGNAL: slDistanceReal=%.10f "
                     "tickSize=%.10f entryPrice=%s slRef=%s",
                     slDistanceReal, tickSize,
                     DoubleToString(entryPrice, _Digits),
                     DoubleToString(slRef, _Digits));
        }

      MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_SIGNAL;
      LogState(prev, g_state);
      ResetSequence();
     }
  }
```
(Symbolic-equality rule adopted from the review: the register tests mode EQUAL to the DEMO named constant + login 1500183638 — the builder claims no bare integer for the constant; the run's own row decides. Abort path prints `ABORT reason=DEMO_GUARD` via LogAbort/GoAbort, whole functions carried in v132 `9B8A2D55` and unchanged.)

## 5. Asks (IDENTICAL both seats)

- **Ask-1 (gate):** CONFIRM the execution reading — the issued one-edit build + one demo run proceed on the operator's spoken token+word, grade per the confirmed register, then return with compile log + raw rows for land re-ask; nothing else moves?
- **Ask-2 (merits, check-form):** does the §4 insert do ONLY what §3 claims — logging-only, no behavior change (yes / no / discrepancy with line refs)?
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only demo. Locks: RECON17 frozen; run word owed (his); title re-glance at snapshot.

## 6. Branches

- Confirm → builder waits his word → build+run → grade → land re-ask with logs. Amend → ONE closed-set re-ask. Halt → QUIESCENT (hold stands). Split → ONE closed-set re-ask.

(End — v133 settles the gate + merits check-form; nothing builds/runs/commits/spends here.)
