# SNIPPET — v82 RESET/SLTP COMPANION (one paste with the v82 relay; zero condensation)

**Paste whole to EACH reviewer TOGETHER with `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v82-PROBEIMPL-CLEAR.md` (one trip, two pastes). Answers ride with the v82 verdicts: probe-implementation adoption (loser-exposure vs full-paired) + no-SHORT route naming + E-hold/S2-design authorship + clear-on-sight. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` (568323 B, 10698 lines). Every code line verbatim with EA numbers. Pairs with v75 (seed/shadow/resolver/gate) + v80 (confirm/R-latch) + v81 (detector/rank/reset/window) companions — same digest, still binding, not re-pasted. The three surfaces below are the NEW reset-funnel + fire-reset + SL/TP-sourcing answers to Sonnet's v81 E questions.

**Decisions ahead:** probe implementation (R)/(F) + no-SHORT route + E hold + S2-vs-1R design. His reasons: London bearish-close kills confirmation; NY AM 4H+1H-short governs over 15m-long.

## Coverage map (every v82 mechanism claim → numbered lines below)

- "EVERY abort funnels through GoAbort → ST_ABORT → full ResetSequence; NO independent live expiry exists" → R-L:6194-6228 (whole GoAbort: log + refused-row + stand-down + state + reset).
- "both fire paths reset after ST_SIGNAL + session-used" → R-M excerpts (fire-1 9561-9568, fire-2 9649-9654, bracketed).
- "run INIT resets once" → EA:9980, cited (init hygiene, not candidate logic).
- "gate-path SL/TP/entry sourcing: close price + nearest-TP computer + memo'd atomic SL pair, both fail-closed" → R-N:7144-7177 (currentPrice 7147, ComputeNearestTpTarget 7149, SlRefMemo atomic 7167-7177, NO_TP_TARGET / NO_SL_REF aborts).

## Region L — abort funnel (whole GoAbort), EA:6194–6228, whole

6194: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
6195:   {
6196:    LogAbort(reason, atState);
6197:    if(InpDebugLog && g_dir != DIR_NONE)
6198:      {
6199:       string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
6200:       string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
6201:                                   a6rBT, StateName(atState), DirName(g_dir), reason);
6202:       A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
6203:      }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
6204:    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
6205:    //--- them directly. Measurement only.
6206:    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
6207:    if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
6208:       EmitAlert("STAND-DOWN", "reason=" + reason, false);
6209: 
6210:    //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
6211:    //--- clears g_dir and g_anchorLine. Read-only measurement.
6212:    if(InpDebugLog &&
6213:       (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
6214:      {
6215:       g_shadowActive = true;
6216:       g_shadowDir    = g_dir;
6217:       g_shadowLine   = g_anchorLine;
6218:       g_shadowOpened = g_anchorBarTime;
6219:       g_shadowSess   = g_sessionAtEntry;
6220:       g_shadowFail   = reason;
6221:       g_shadowBars   = 0;
6222:      }
6223: 
6224:    ENUM_SRJ_STATE prev = g_state;
6225:    g_state = ST_ABORT;
6226:    LogState(prev, g_state);
6227:    ResetSequence();
6228:   }

## Region M — fire resets (bracketed excerpts; full functions not needed for the claim)

[fire-1 excerpt]
9561:          PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
9562:                      SessionName(g_sessionAtEntry));
9563:          MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
9564:          ENUM_SRJ_STATE prevA = g_state;
9565:          g_state = ST_SIGNAL;
9566:          LogState(prevA, g_state);
9567:          ResetSequence();
9568:          return;
[fire-2 excerpt]
9649:       MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
9650:       ENUM_SRJ_STATE prev = g_state;
9651:       g_state = ST_SIGNAL;
9652:       LogState(prev, g_state);
9653:       ResetSequence();
9654:      }

## Region N — SL/TP/entry sourcing, EA:7144–7177, whole

7144:     double s1_stopRef = 0.0; bool s1_haveStop = false;
7145:    if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK)
7146:      {
7147:       double currentPrice = iClose(_Symbol, PERIOD_CURRENT, barShift);
7148:       double tpTarget;
7149:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
7150:         {
7151:          if(InpDebugLog)
7152:             PrintFormat("[SRJ-EA] %s S2POLL_NO_TP_TARGET",
7153:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
7154:          GoAbort(ABORT_NO_TP_TARGET, g_state); return;
7155:         }
7156:       double slRef = 0.0; ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
7157:       //--- [P-FIX-S2POLL E1 / operator Q1+Q3 2026-09-11] The stop pair is ATOMIC:
7158:       //--- both set on success, both absent on failure. The superseded form had the
7159:       //--- if governing ONE statement, so s1_haveStop=true was unconditional and the
7160:       //--- scope block below read slRef on the failure path. #property strict does
7161:       //--- not diagnose that shape. Fail-closed per Q3 ("SL should be present at all
7162:       //--- times"), following the sibling gate in this same block: ABORT_NO_TP_TARGET
7163:       //--- already kills across S2..S5 from here, and this is its stop-side twin.
7164:       //--- SUPERSEDED, retained per P4:
7165:       //---   if(ComputeSlReference(barShift, g_dir, slRef, slMode, "S2POLL"))
7166:       //---      s1_stopRef = slRef; s1_haveStop = true;
7167:       if(!SlRefMemo(barShift, barTime, g_dir, slRef, slMode, "S2POLL"))
7168:         {
7169:          if(InpDebugLog)
7170:             PrintFormat("[SRJ-EA] %s S2POLL_NO_SL_REF state=%s dir=%s",
7171:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
7172:                         StateName(g_state), DirName(g_dir));
7173:          GoAbort(ABORT_NO_SL_REF, g_state);
7174:          return;
7175:         }
7176:       s1_stopRef  = slRef;
7177:       s1_haveStop = true;

(End — v82 companion under the §Bind digest; review asks per v82 §2)
