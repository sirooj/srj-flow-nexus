# CODE REVIEW REQUEST - v253 - 2026-09-23 (packet P-EVICT-1 v3, folds V252 round 1-YES/4-discrepancy; no build/run/clear on this page)

Council session: CONTINUE v252 (same packet line, amended; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v252-EVICT-2.md 13f93178c01552a48ad5daaf727892b56132288e803697076b6e7664b9a202d1/13824/195 superseded unbuilt; V252 verdicts Opus/SONNET/Luna/Kimi-discrepancy + GLM-YES-with-gaps folded below; carried proofs from v252 by labeled reference: GoAbort 6295-6329, ResetSequence 6266-6293, session marks 1802-1817, Q3 comment 7508-7520).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V252 fold (each demand mapped - agreed items folded, parked items named):
- Positive S4 test (all five seats): E2 aborts on explicit `g_confirmFromState == ST_S4_ARMED`; S3 keeps rollback; any other origin keeps today's behavior plus a census print (fail closed, counted). Stamp proof below (F4/F5): S4 promotions stamp S4 under the 8629 guard - no stamp edit needed.
- Identifier (blocking): E1 adds ONLY the DIV_FALLBACK line (F1:2 new; F1:1 context already at EA 319, S1 asserts exists-once, no redefine).
- Contract conditionals named (Luna-A4/Opus-A1/Astra-A3): LogAbort unconditional; A6REFUSED/STAND-DOWN gated - stated in E3 (F2).
- Emit position (Opus blocking-1): DIV_WAIT emit sits ABOVE the disposition (8800 over 8801; prose "below" corrected); before-state carried (F4) showing print + emit + old disposition whole.
- Denominator (Opus-A13): 0 of 4 distinct refusals, observed 6 times (08-27/08-31/09-01/09-04 bars); takes flow through S5-pass only.
- Cross-run pair labeled (Opus-A15/Astra-A6): FP/KL (58 hold+suppress) vs EL/QI/RM/PD (57 take) at the same 17:35:01 server second - near-paired counterfactual, two runs, timestamps disambiguate.
- Tag collisions (Opus-A16): EM x2, CO x2 - timestamps disambiguate; mapping stated in rows header.
- clears-list (GLM-A5): sessionAtEntry named as cleared working set, distinct from session-USE marks that persist.
- Freed-vs-reopened boundary (GLM-A6): eviction frees the slot; a session already marked used by an earlier SIGNAL stays used (marks persist) - boundary carried.
- Log-shape expectation (GLM-A7): post-build rows read `STATE S5_GATE_CHECK->ST_ABORT` with `predicate=DIV_FALLBACK`.
- Census-key clean (GLM-A15): S1 asserts DIV_FALLBACK absent in baseline logs; run gate asserts invariant presence, never 1:1 counts (GLM-B1 adopted in packet acceptance).
- prevDiv scoped to rollback branch (Sonnet-A4/Opus-A8/Kimi-A-c); single comment block (GLM-A13/Opus-A-9); one statement per line (Opus-A-10); evaluator signature asserted at S1 line 6628 (Opus-A7); E1 context labeled (GLM-A4); KL role: stuck challenger evaluation vs the squatter (rows header).
- Parked, separate packets (named, never bundled): walk robustness/A6, readiness guard + warmup note (grading runs on covered feed), divKind, collapse (intentional), A6 clock/dedupe, shadow/counter telemetry, enum-ization, A6 class rename, SrjSideNote, stray-; (pre-existing cosmetics).
- Name DIV_FALLBACK kept (S1-named, census-keyed); rename parked with reason (GoAbort shared surface).

Change (one plain sentence): a setup refused at the final check aborts on positive S4-origin test, pre-bind and unknown origins keep existing behavior with census, so the squatter dies and the session slot frees.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 defines + E2/E3 EvaluateClosedBar S5 block + stamp/guard/LogAbort windows, proposed and disk below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md 4e8826933a4dcad5f8d4087e6086c023fdcf606fb38f251e966ed6d507f3ee7c / 6819 B / 104 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v252-EVICT-2.md 13f93178c01552a48ad5daaf727892b56132288e803697076b6e7664b9a202d1 / 13824 B / 195 lines.

Proposed E1 after-block (add ONLY F1:2; F1:1 context already present):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2+E3 after-shape (packet v3 new lines):
```
       //--- [P-EVICT-1] divergence-miss disposition: refused S4-origin holders
       //--- ABORT (DIV_FALLBACK); S3 pre-bind rollback kept; other origins keep
       //--- today's behavior with census. LogAbort unconditional; A6REFUSED and
       //--- STAND-DOWN gated (debug/armed); DIV_WAIT emit above stays the marker.
       //--- Retry converted 0 of 4 distinct refusals across 57/58.
         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).
         ENUM_SRJ_STATE prevDiv = g_state;
         if(g_confirmFromState == ST_S4_ARMED)
           {
            GoAbort(ABORT_DIV_FALLBACK, g_state); return;
           }
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        StateName(g_confirmFromState));
         g_state = ST_S4_ARMED;
         LogState(prevDiv, g_state);
         return;
```

Before-state fallback sub-block, verbatim, no elisions (EA 8792-8809):
```
      if(!divOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] CONFIRM_DIV_WAIT bar=%s dir=%s verdict=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                         DirName(g_dir), divVal);
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "DIV_WAIT");
          ENUM_SRJ_STATE prevDiv = g_state;
         //--- [P-CONFIRM-ANYSTATE E3] the rollback returns to the promotion
         //--- origin: S3 for a pre-bind confirmation, S4 for the armed edge
         //--- (identical to the build-2 behavior for the armed path).
         g_state = (g_confirmFromState == ST_S3_ZONE_WAIT) ? ST_S3_ZONE_WAIT
                                                           : ST_S4_ARMED;
         LogState(prevDiv, g_state);
         return;
        }
```

S4 guard, verbatim, no elisions (EA 8629-8630; the 8741 stamp sits inside this guard - verified by continuous builder read 8636-8749, no intervening close):
```
   if(g_state == ST_S4_ARMED)
     {
```

S4 promotion stamp, verbatim, no elisions (EA 8741-8747):
```
         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
           {
            ENUM_SRJ_STATE prev = g_state;
            g_confirmFromState = prev;
            g_state = ST_S5_GATE_CHECK;
            LogState(prev, g_state);
           }
```

LogAbort body, verbatim, no elisions (EA 1723-1729):
```
void LogAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               reason, StateName(atState), AnchorStr(), DirName(g_dir));
  }
```

Run rows, raw (same 18 mechanical pulls: RECON58 segment 424A5A0C except EL/RM/PD/QI/CO/IH/CE/RJ from RECON57 6F242EAC; 17:35:01 FP/KL vs EL/QI/RM/PD is the cross-run pair - same server second, two runs; EM x2 and CO x2 tags disambiguated by timestamps; order rows simulated tester fills; KL is the stuck 17:30 challenger evaluation vs the squatter):
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

Q1 verdict: with the positive S4 test, the carried stamp proof, the named-conditional contract, and the fail-closed default, is the amended v3 disposition clear - refused S4-origin holders abort with the slot freed and session marks unconsumed, S3 kept, unknowns censused?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
