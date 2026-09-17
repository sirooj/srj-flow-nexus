# RELAY v132 — NARROW EVIDENCE PACKET ISSUANCE (WHOLE CODE INLINE) + LAND GATE (fresh-session-safe, SAME-PROMPT both seats)

**Version:** v132 (SUPERSEDES v131 UNPASTED — v131 never left the disk; its compressed one-line snippets repeated the excerpt defect, so this version carries the WHOLE verbatim code with zero elisions. Follows v130 verdicts: Luna `LUNA-V130-DEMO-RECORD-LAND-002` record-ACCEPT + LAND HOLD for one positive row with EXACT NEXT GATE quoted below; review-seat `LUNA-V130-REVIEW-DEMO-LAND-002` concurs; Sonnet: D1 deduction closes its gap, no further blocking objection, never grants tokens by standing rule). **Fresh-session-safe:** project + tree + run + verdict history + WHOLE code ALL INLINE — no prior-session memory needed. Tree unchanged (EA `FC6AC694`/597252/11126 lines + FlowLogic `BEC2CBBD`/69852 uncommitted; RECON17 frozen; HEAD 976a579). **Paste set:** this relay ALONE (both seats IDENTICAL asks; review seat answers check-form yes/no/discrepancy, never keys). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only. RUN-COST HEADER: one demo run ~50 min tester + grade; nothing else runs here.

## 0. Base context (complete — new-session readable)

- Project: EURUSD M5 strategy rebuild, ALERT-ONLY demo proving (tester fills only; one order-sending call site filed; no live money anywhere). Goal: EA takes his trades exact.
- Proven run RECON44-DEMO DONE=PASSED 2026-09-17 12:53:21 (0:48:19 healthy; 3168 bars/563338 ticks; archive 39168 lines/7614407 B/`fcf3d867…`; demo ini InpMode=1=MODE_EXECUTE; range 08-26→09-09; purity: farm/cloud off, Core-04, Test-passed, array-out-of-range 0). Grade ACCEPTED everywhere: FL fires 10:05 R 1.94 SL 1.16258 TP 1.16102; fill 1.16205 R 1.94/1.94 delta 0.00 lots 0.01; A6 + MTEXIT TP_TOUCH exit 1.16102; balance 10000→10159; 13 FAIL rows identical; isolation 202 rows / exactly 3 deltas (ALERT_ONLY 1->0, EXECUTED 0->1, PRE 0->1) / 199 identical.
- Settled record (v130, accepted by both seats): D1 guard evaluated-but-passes-silent, "never evaluates" excluded by program order + downstream fill, values-gap stands; D2 stops guard = hard abort, unexercised (stopsLevel=0); D3 R recomputed 1.9434→1.94; D4 isolation table carried whole.
- Current gate: LAND HELD on ONE gap only — no journal row prints the actual `ACCOUNT_TRADE_MODE` + login values. Luna tokens recorded-but-UNSPENT (dual-key). Pre-run off-log evidence stands (common.ini Login=1500183638 + live window title same digits on Dukascopy-demo-mt5-1, two sources). Stop-fix track independent. Forward-test separate.

## 1. Luna EXACT NEXT GATE — quoted COMPLETE (the issuance template)

"one canonical edit → rebuild → one demo proving run → one positive guard-pass row containing the actual trade mode and login values. No other behavior change is needed for that packet."

## 2. WHOLE CODE attached (verbatim, `Experts\SRJ_FlowNexus_EA.mq5`, digest `FC6AC694` — no elisions, no "...")

Block A — mode enum (L15-19):
```
//--- TASK 14: Mode enum. Declared here (before the input section) so
//--- InpMode can reference it. Planner specified "after ENUM_SRJ_SLMODE"
//--- but that sits below the inputs and MQL5 requires the enum visible
//--- at the input declaration point. No existing code was moved.
enum ENUM_SRJ_MODE { MODE_ALERT_ONLY = 0, MODE_EXECUTE = 1 };
```

Block B — abort-reason defines (L306-308):
```
//--- [S1-DEMO-GUARD-001] demo-guard abort reasons (Luna V128 clearance; run on token+word).
#define ABORT_DEMO_GUARD       "DEMO_GUARD"
#define ABORT_BELOW_STOPS      "BELOW_STOPS"
```

Block C — LogAbort, whole function (L1711-1716; every abort prints through here):
```
void LogAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               reason, StateName(atState), AnchorStr(), DirName(g_dir));
  }
```

Block D — GoAbort, whole function (L6238-6272; the only abort path):
```
void GoAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   LogAbort(reason, atState);
   if(InpDebugLog && g_dir != DIR_NONE)
     {
      string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
      string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
                                  a6rBT, StateName(atState), DirName(g_dir), reason);
      A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
     }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
   //--- TASK 19c: count NO_REGIME aborts so the census can be read against
   //--- them directly. Measurement only.
   if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
   if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
      EmitAlert("STAND-DOWN", "reason=" + reason, false);

   //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
   //--- clears g_dir and g_anchorLine. Read-only measurement.
   if(InpDebugLog &&
      (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
     {
      g_shadowActive = true;
      g_shadowDir    = g_dir;
      g_shadowLine   = g_anchorLine;
      g_shadowOpened = g_anchorBarTime;
      g_shadowSess   = g_sessionAtEntry;
      g_shadowFail   = reason;
      g_shadowBars   = 0;
     }

   ENUM_SRJ_STATE prev = g_state;
   g_state = ST_ABORT;
   LogState(prev, g_state);
   ResetSequence();
  }
```

Block E — the complete operative region, whole and contiguous (L9971-10077; sits inside `void EvaluateClosedBar(int barShift, datetime barTime)` at L6571; alert-only exit → G1 → sizing → PRE-SEND → G2 → single send site → EXECUTED → session close-out):
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
(Reading guide: pass through G1 prints NOTHING — the gap; fail prints `ABORT reason=DEMO_GUARD` via Blocks C+D. The send site above is the only one in the tree — whole-tree scan Buy x1 + Sell x1, includes zero, V128 companion.)

## 3. Proposed closed-set edit (for council ISSUANCE — NOT applied; canonical needs packet/token)

- Insert after the guard line, before `long magic`: `if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));`
- Logging-only, zero behavior change, fires once per Phase-2 entry in execute mode. Expected on demo: mode value equal to `ACCOUNT_TRADE_MODE_DEMO`, login 1500183638 (equality to the named constant + recorded login — no bare numeric constant claimed).
- Packet: this ONE insert → rebuild EA (expect 0 errors/0 warnings) → ONE demo run, same ini/range/settings as RECON44 → grade register: (a) ≥1 DEMO_PASS row with mode==DEMO + login==1500183638; (b) zero DEMO_GUARD aborts (two-pattern); (c) same gate+fill (FL R 1.94, fill delta 0.00); (d) compile 0/0. Novel evidence vs all priors: the positive mode+login row no run ever produced.
- Locks: RECON17 frozen; run word for the new run owed separately (token+word); at snapshot, operator re-glances demo title (30-second transport-side; already performed pre-run).

## 4. Asks (IDENTICAL both seats)

- **Ask-1:** ISSUE the narrow evidence packet exactly as §3 (one insert + rebuild + one demo run + grade register)?
- **Ask-2:** CONFIRM the §3 grade register as the land gate (row fields + zero aborts + same fill + 0/0)?
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only demo.

## 5. Branches

- Issue → build+run on his token+word → grade → land re-ask. Amend → ONE closed-set re-ask (e.g. reworded print, debug-gated variant). Halt → QUIESCENT (hold stands, proven-but-unlanded). Split → ONE closed-set re-ask.

(End — v132 asks issuance + register confirm on whole code; nothing builds/runs/commits/spends here.)
