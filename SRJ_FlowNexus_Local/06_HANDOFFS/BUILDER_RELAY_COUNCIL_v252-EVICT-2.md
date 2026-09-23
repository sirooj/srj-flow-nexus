# CODE REVIEW REQUEST - v252 - 2026-09-23 (packet P-EVICT-1 v2, folds V251 round; no build/run/clear on this page)

Council session: CONTINUE v251 (same packet line, amended; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v251-EVICT-1.md 445C46FB/9576/125 superseded unbuilt; V251 verdicts Luna-YES/Sonnet-YES/GLM-YES/Kimi-YES with Q2-discrepancy folded below).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V251 fold (what changed and why - each V251 demand mapped):
- Identifier (all four seats, blocking): the v251 relay pasted current-state defines only, never the proposed new line - relay defect, packet v1 already contained it. V252 pastes the proposed E1 after-block below (F1); S1 gate asserts the symbol pre-compile.
- Contract (all four): GoAbort definition + hold-release proof now ride inline (F3/F4 below): LogAbort + A6REFUSED + STAND-DOWN + ST_ABORT + ResetSequence clears (state/dir/regime/anchor/zone/touch/latches/confirmFrom) while session-use marks persist (marks live outside ResetSequence - abort frees the slot WITHOUT consuming the session).
- S4-only scope (Sonnet-B/GLM-B1 adopted): E2 aborts S4-origin only; S3 pre-bind rollback kept (zero S3-origin fallback events on record). After-shape below (F2).
- Return pinned (A3): GoAbort returns void; the caller keeps its return (in F2).
- Tags dual (A9): DIV_WAIT emit stays (path marker, baseline comparable); GoAbort carries the decided outcome. E3 comment refreshed in the same edit (F2 header).
- Wording (A5): zero of the REFUSED HOLDERS converted (takes flow through S5-pass, never the fallback branch).
- Parked, separate packets: walk robustness/A6, S5 readiness guard, divKind, no-verdict-vs-opposite collapse (intentional), warmup edge.
- Q3 arrival-order (A8): the operator ruling rides inline (F6: EA 7508-7520 REMOVED-comment quoting his first-executes words verbatim); refused holders cannot execute first, so the abort cannot violate it.

Change (one plain sentence): a setup refused at the final check dies instead of re-arming, S4-origin only, so it can no longer squat the session slot and veto the valid setup.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 file-scope defines + E2 EvaluateClosedBar S5 block + GoAbort/ResetSequence/session-mark/Q3 windows, all whole below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md b66d0f57f0a513e1161b033cd527b86b9c41834a31ca53f77d2e7a2aba396222 / 6819 B / 91 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v251-EVICT-1.md 445c46fb3d74291ae102b594b6b250b5936b76553fce36e779fd463c0287dec6 / 9576 B / 125 lines.

Proposed E1 after-block (packet v2 E1 new lines; S1 asserts pre-compile):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2+E3 after-shape (packet v2 E2+E3 new lines):
```
       //--- [P-EVICT-1] divergence-miss disposition: the refused candidate ABORTS
       //--- (DIV_FALLBACK) - no re-arm. Retry converted 0 of 6 fallbacks across
       //--- 57/58; DIV_WAIT emit below stays as the path marker while GoAbort
       //--- carries the decided outcome (LogAbort + A6REFUSED + STAND-DOWN).
       //--- S4-origin only; S3 pre-bind rollback kept below.
         //--- [P-EVICT-1] refused armed holders abort (squatter GC): S4-origin only.
         ENUM_SRJ_STATE prevDiv = g_state;
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         GoAbort(ABORT_DIV_FALLBACK, g_state); return;
```

GoAbort contract, verbatim, no elisions (EA 6295-6329):
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

ResetSequence clears, verbatim, no elisions (EA 6266-6293):
```
void ResetSequence()
  {
   g_state          = ST_IDLE;
   g_dir            = DIR_NONE;
   SrjSideNote("ResetSequence", g_dir);
   g_regime         = REGIME_NONE;
   g_sessionAtEntry = SESSION_NONE;
   g_anchorLine     = -1;
   g_anchorPrice    = 0.0;
   g_anchorBarTime  = 0;
   g_divLatch       = false;
   g_touchSeen      = false;
   g_touchBarHi     = 0.0;
   g_touchBarLo     = 0.0;
   g_zoneHi         = 0.0;
   g_zoneLo         = 0.0;
   g_alertedArmed   = false;
   g_alertedSignal  = false;
   g_latchedEntry   = 0.0;
   g_latchedSl      = 0.0;
   g_latchedTp      = 0.0;
   g_latchedR       = 0.0;
   g_latchBarTime   = 0;
   g_confirmFromState = ST_IDLE;
   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
   //--- price, time, zone, touch, state, latch + confirmFrom only — all are
   //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
  }
```

Session marks persist outside ResetSequence, verbatim, no elisions (EA 1802-1817):
```
bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON)
      return (g_sessionUsed_London && g_sessionUsedDay_London == today);
   if(sess == SESSION_NYAM)
      return (g_sessionUsed_NYAM   && g_sessionUsedDay_NYAM   == today);
   return false;
  }

void MarkSessionUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON) { g_sessionUsed_London = true; g_sessionUsedDay_London = today; }
   if(sess == SESSION_NYAM)   { g_sessionUsed_NYAM   = true; g_sessionUsedDay_NYAM   = today; }
  }
```

Q3 arrival-order ruling on record, verbatim, no elisions (EA 7508-7520):
```
          if(t78_opp && t78_tier)
           {
            PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
                        "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        g_lineCode[t78_pr.topLine], DirName(t78_dir),
                        g_lineCode[g_anchorLine], DirName(g_dir),
                        StateName(g_state),
                        g_authorityRank[t78_pr.topLine] / 2,
                        g_authorityRank[g_anchorLine]   / 2);
            /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
            }
```

Run rows, raw (same 18 mechanical pulls as v251: RECON58 segment 424A5A0C except EL/RM/PD/QI/CO/IH/CE/RJ from RECON57 6F242EAC; fallback census 3 per run, zero of the refused holders converted):
```
EM	0	20:10:06.089	Core 04	2026.09.01 16:50:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.01 16:45 action=SEED poi=Yearly-POC rank=2 tier=1 dir=LONG
JM	0	20:10:06.089	Core 04	2026.09.01 16:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.01 16:45 anchor=Yearly-POC dir=LONG oppCandle=0 bodyDir=0 body=23pts doji=0 touchAttr=1 confirm=0 shadow=true
QF	0	20:10:06.089	Core 04	2026.09.01 16:50:00   [SRJ-EA] 2026.09.01 16:50:00 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Yearly-POC
EM	0	20:10:06.089	Core 04	2026.09.01 16:55:00   [SRJ-EA] 2026.09.01 16:55:00 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Yearly-POC
GL	0	20:10:06.089	Core 04	2026.09.01 16:55:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.09.01 16:50 newPoi=Weekly-VWAP newDir=SHORT heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED newTier=4 heldTier=1 wouldPreempt=0 wouldTierPassLegacy=0
FP	0	20:10:12.193	Core 04	2026.09.01 17:35:01   [SRJ-EA] SUPPRESSED bar=2026.09.01 17:30 poi=Monthly-VWAP dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=70 cum_opp=20 cum_hi=5 cum_both=4 action=HELD
KL	0	20:10:12.193	Core 04	2026.09.01 17:35:01   [SRJ-EA] A6TERM class=SELECTED bar=2026.09.01 17:30 shift=1 site=S2POLL dir=LONG mode=1SWING px=1.15975 ok=1 slot=9
EL	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] 2026.09.01 17:35:01 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Monthly-VWAP
QI	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] 2026.09.01 17:35:01 SIGNAL dir=LONG poi=Monthly-VWAP regime=TREND div=hidden sess=NYAM tp_target=1.16077 tp_R=1.17 sl_ref=1.15975 sl_mode=1-swing spreadPts=2 bid=1.16022 ask=1.16024
RM	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] PRE-SEND lots=2.04 entry=1.16024 slPts=49 tpPts=53 stopsLevel=0 freezeLevel=0 spreadPts=2
PD	0	16:17:18.931	Core 04	2026.09.01 17:35:01   order performed buy 2.04 at 1.16024 [#2 buy 2.04 EURUSD at 1.16024]
CO	0	16:17:12.827	Core 04	2026.09.01 17:00:00   [SRJ-EA] SEEDVOID bar=2026.09.01 16:55 dir=LONG buf=14 line=1.16017 evals=171 hi=1.16022 lo=1.15980
IH	0	16:17:12.827	Core 04	2026.09.01 17:05:00   [SRJ-EA] SEEDVOID bar=2026.09.01 17:00 dir=LONG buf=14 line=1.16022 evals=172 hi=1.16044 lo=1.15989
GQ	0	20:05:49.738	Core 04	2026.08.31 16:40:01   [SRJ-EA] 2026.08.31 16:40:01 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Yearly-POC
LF	0	20:21:35.779	Core 04	2026.09.04 09:45:02   [SRJ-EA] 2026.09.04 09:45:02 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Daily-POC
CE	0	16:02:52.230	Core 04	2026.08.27 10:15:00   [SRJ-EA] 2026.08.27 10:15:00 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Daily-POC
CO	0	16:12:44.273	Core 04	2026.08.31 16:40:01   [SRJ-EA] 2026.08.31 16:40:01 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Yearly-POC
RJ	0	16:17:12.827	Core 04	2026.09.01 16:55:00   [SRJ-EA] 2026.09.01 16:55:00 STATE S5_GATE_CHECK->S4_ARMED dir=LONG poi=Yearly-POC
```

Q1 verdict: with the V251 fold (S4-only scope, named identifier, pinned return, dual tags, carried contract), is the amended v2 disposition clear - refused S4-origin holders abort via GoAbort(ABORT_DIV_FALLBACK, g_state) with the session slot freed and session marks unconsumed?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
