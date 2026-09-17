# RELAY v127 - DEMO-EXECUTION PACKET REQUEST (fresh-safe, SAME-PROMPT both seats)

**Version:** v127 (first packet request under staged gates: demo-execution. Follows Luna `LUNA-V126-ROLES-STAGES-HOLD-REPLACE-001` + review-seat check: VACATE + shadow -> demo-execute -> forward-test, mismatch->HALT. Sonnet format honored: WHOLE function below (find the load-bearing part yourself), ONE claim focus, raw values, quoted-not-attributed; the review seat is asked CHECK-form only - yes/no/discrepancy, never rule/clear/grant.) **Fresh-profile-safe:** base + full source ALL INLINE. Tree unchanged (EA `9D123133`/596222 + FlowLogic `BEC2CBBD`/69852 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID (Luna seat); review seat may answer plain check-form. His part: transport only.

## 0. Base (complete)
- Standing: hold VACATED (dual-key); staged gates govern; promotion proven-but-unlanded; LANDING untouched by this relay (no commit/tag/push asked). All words SPENT.
- Demo context (his words): development/demo-only, no real money. Tester ini: Symbol=EURUSD, Deposit=10000, no InpMode override -> default ALERT_ONLY. Journal final balance 10000 confirms no fills ever.
- Claim focus (one): the dormant Phase-2 path below is complete; the packet should enable it on a NAMED demo account with safeguards + a staged demo proving run. Check the code yourself - the read lines below are the whole region, uncut.

## 1. SOURCE Q - InpMode decl + mode gate + FULL Phase-2 (byte-exact pulls, EA current tree)
  EA:19: enum ENUM_SRJ_MODE { MODE_ALERT_ONLY = 0, MODE_EXECUTE = 1 };
  EA:32: input ENUM_SRJ_MODE InpMode = MODE_ALERT_ONLY;   // ALERT_ONLY sends no orders
  EA:9968:       if(InpMode == MODE_ALERT_ONLY)
  EA:9969:         {
  EA:9970:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
  EA:9971:                      SessionName(g_sessionAtEntry));
  EA:9972:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
  EA:9973:          ENUM_SRJ_STATE prevA = g_state;
  EA:9974:          g_state = ST_SIGNAL;
  EA:9975:          LogState(prevA, g_state);
  EA:9976:          ResetSequence();
  EA:9977:          return;
  EA:9978:         }
  EA:9979: 
  EA:9980:       // ------ Phase 2 Execution Logic ------
  EA:9981:       long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
  EA:9982: 
  EA:9983:       if(IsSessionPositionOpen(magic))
  EA:9984:         { GoAbort(ABORT_CONCURRENCY, g_state); return; }
  EA:9985: 
  EA:9986:       double entryPrice = (g_dir == DIR_LONG) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
  EA:9987:       double riskMoney  = AccountInfoDouble(ACCOUNT_EQUITY) * InpRiskPercent / 100.0;
  EA:9988:       double slDistanceReal = MathAbs(entryPrice - slRef);
  EA:9989:       double tickValue  = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
  EA:9990:       double tickSize   = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
  EA:9991: 
  EA:9992:       if(slDistanceReal > 0 && tickSize > 0)
  EA:9993:         {
  EA:9994:          double lossPerLot = (slDistanceReal / tickSize) * tickValue;
  EA:9995:          double lots       = riskMoney / lossPerLot;
  EA:9996:          double volStep = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
  EA:9997:          double volMin  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
  EA:9998:          double volMax  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
  EA:9999:          lots = MathFloor(lots / volStep) * volStep;
  EA:10000:          if(lots < volMin)
  EA:10001:            { GoAbort(ABORT_LOT_TOO_SMALL, g_state); return; }
  EA:10002:          if(lots > volMax)
  EA:10003:            { lots = volMax; PrintFormat("[SRJ-EA] Lot size capped at volMax: %f", lots); }
  EA:10004: 
  EA:10005:          long stopsLevelPts  = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
  EA:10006:          long freezeLevelPts = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL);
  EA:10007:          double slPts = MathAbs(entryPrice - slRef)    / _Point;
  EA:10008:          double tpPts = MathAbs(tpTarget   - entryPrice) / _Point;
  EA:10009:          PrintFormat("[SRJ-EA] PRE-SEND lots=%.2f entry=%s slPts=%.0f tpPts=%.0f "
  EA:10010:                      "stopsLevel=%d freezeLevel=%d spreadPts=%d%s",
  EA:10011:                      lots,
  EA:10012:                      DoubleToString(entryPrice, _Digits),
  EA:10013:                      slPts, tpPts,
  EA:10014:                      (int)stopsLevelPts, (int)freezeLevelPts,
  EA:10015:                      (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD),
  EA:10016:                      (slPts < (double)stopsLevelPts || tpPts < (double)stopsLevelPts)
  EA:10017:                        ? "  <- BELOW STOPS LEVEL, broker will likely reject" : "");
  EA:10018: 
  EA:10019:          g_trade.SetExpertMagicNumber(magic);
  EA:10020:          g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
  EA:10021:          string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";
  EA:10022: 
  EA:10023:          bool tradeResult = false;
  EA:10024:          if(g_dir == DIR_LONG)
  EA:10025:             tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
  EA:10026:          else
  EA:10027:             tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
  EA:10028: 
  EA:10029:          if(!tradeResult)
  EA:10030:            {
  EA:10031:             PrintFormat("[SRJ-EA] Trade execution failed! Error: %d", g_trade.ResultRetcode());
  EA:10032:            }
  EA:10033:          else
  EA:10034:            {
  EA:10035:             double fill = g_trade.ResultPrice();
  EA:10036:             if(fill > 0.0)
  EA:10037:               {
  EA:10038:                double slDistFill = MathAbs(fill - slRef);
  EA:10039:                double tpDistFill = MathAbs(tpTarget - fill);
  EA:10040:                double rFill = (slDistFill > 0.0) ? (tpDistFill / slDistFill) : 0.0;
  EA:10041:                PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "
  EA:10042:                            "R_logged_at_signal=%.2f delta=%.2f",
  EA:10043:                            DoubleToString(fill, _Digits),
  EA:10044:                            slDistFill / _Point, tpDistFill / _Point,
  EA:10045:                            rFill, tpR, rFill - tpR);
  EA:10046:               }
  EA:10047:            }
  EA:10048:         }
  EA:10049:       else
  EA:10050:         {
  EA:10051:          PrintFormat("[SRJ-EA] NO TRADE PLACED after SIGNAL: slDistanceReal=%.10f "
  EA:10052:                      "tickSize=%.10f entryPrice=%s slRef=%s",
  EA:10053:                      slDistanceReal, tickSize,
  EA:10054:                      DoubleToString(entryPrice, _Digits),
  EA:10055:                      DoubleToString(slRef, _Digits));
  EA:10056:         }
  EA:10057: 
  EA:10058:       MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
  EA:10059:       ENUM_SRJ_STATE prev = g_state;
  EA:10060:       g_state = ST_SIGNAL;
  EA:10061:       LogState(prev, g_state);
  EA:10062:       ResetSequence();
  EA:10063:      }
### Open questions for the checker (not assertions): does the mode gate fully isolate Phase-2 (any other OrderSend path)? Are magic-per-session + concurrency guard + stops-level warn-vs-reject + risk math sufficient demo safeguards, or what is missing? Raw values for recompute: risk = equity*InpRiskPercent/loss-per-lot; fill prints R_executed vs R_logged delta.

## 2. Sonnet alternatives on record (people/money/tooling = HIS domain, not asked here)
> Claude Code on real repo / paid freelance MQL review / sit proven-but-unlanded (no clock). Surfaced, undecided, his call only.

## 3. Asks (IDENTICAL both seats; review seat: check-form welcome, verdict-optional)
- **Ask-1:** ISSUE demo-execution packet BY NAME (enable Phase-2 on the NAMED demo account only + safeguards named line-by-line from SOURCE Q; staged demo proving run with pre-registered signals-vs-fills grade; mismatch -> REPORT+HALT)?
- **Ask-2 SCOPE/SAFEGUARDS:** account lock (which demo login)? magic-per-session kept? risk percent value? stops-level hard gate (reject vs warn)? session throttle kept? Name each (check against SOURCE Q, do not invent unseen guards).
- Threshold: filed-authoritative, R>=1.0, A+ strict, DEMO-ONLY (no real money anywhere). Locks: RECON17 frozen; builds uncommitted; nothing builds/runs/commits here.

## 4. Branches
- Issue -> token + word -> STAGE-1 verify -> build -> 0/0 -> demo-run -> grade -> relay. Amend -> one closed-set re-ask. Decline -> QUIESCENT (alert-only stands). Split -> ONE closed-set re-ask.

(End - v127 awaits packet-or-denial + Ruling-IDs; nothing builds/runs/commits/spends here.)
