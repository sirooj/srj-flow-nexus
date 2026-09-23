# CODE REVIEW REQUEST - v254 - 2026-09-23 (packet P-EVICT-1 v4, folds V253 round 1-YES/3-discrepancy; no build/run/clear on this page)

Council session: CONTINUE v253 (same packet line, amended; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v253-EVICT-3.md 6eb7e4c136a75f4def9472bebcf9bdbd2adc2f356d5a7d9aa9b4bd6700736ba2/12666/153 superseded unbuilt; V253 verdicts Opus/SONNET/Kimi-discrepancy + GLM-YES-contingent folded below; carried proofs from v252/v253 by labeled reference: ResetSequence 6266-6293, session-mark defs 1802-1817, Q3 comment 7508-7520, GoAbort-adjacent census).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V253 fold (each demand mapped - agreed items folded, parked items named):
- Replace-range (Opus D-1/B-1): packet states replace EA 8801-8807, 8792-8800 unchanged; S1 asserts at build.
- GoAbort re-carried (Opus D-2, Sonnet): F7 below whole (6295-6329) with signature and arity checkable.
- Log-shape from disk (GLM-D2/Kimi-A2): acceptance reads `ABORT reason=DIV_FALLBACK` (LogAbort F8, unconditional) plus `STATE S5_GATE_CHECK->ABORT` (LogState via GoAbort, StateName ABORT unprefixed at 1686, debug runs).
- Split/merged (GLM-D1/B1/B2/B4, Kimi-A1/A5/B4, Opus-A-8/A-9/A-10, Sonnet): GoAbort/return split; prevDiv inside S3 branch only; single comment block; one statement per line - all in F2 below.
- Census ungated (Sonnet-B, Kimi-A3/B2, Opus D-4): EVICT print unconditional in F2; pair-invariant S5-to-S4 rows only-with-EVICT in acceptance (no single-producer assumption).
- stale-origin (Opus D-5/Kimi-A9): S5 entries stamp immediately prior (8607 pre-bind + 8743 S4); ResetSequence clears to IDLE; census watches unknowns unconditionally now.
- S3-stamp window carried (Opus D-8): F4 below (8600-8610); S1-origin falls to default+census, observable.
- Enclosure closed (GLM-D3/Opus D-9): guard 8629 + hole 8634-8635 pulled (decl + comment, no close) + continuous reads; F5/F6 below.
- Marks ordering closed (Sonnet v253 Q1.2): call sites carried (F9/F10 below) - both ST_SIGNAL paths; abort path never marks.
- Freed-vs-usable boundary (Opus D-3/GLM-A6): eviction frees the slot; earlier-SIGNAL sessions stay marked; 9/1 scenario unmarked (no 9/1 takes before 17:35 in any run - takes audit).
- KL label fixed (Opus D-15): selected and slotted yet never signaled because held.
- Denominator/union/pair/tags (Opus D-12/D-13/D-14/D-16/D-17, GLM-A6/A7): 0 of 4 distinct refusals observed 6 times; union labeled (57 reaches 08-27, 58 reaches 09-04); pair labeled near-paired with retry-stat primary; EM/CO collisions timestamped; impact sized by retry-stat, sup-70 noted as upper bound with derivation owed post-run.
- clears/sessionAtEntry named; E1 context labeled (add ONLY F1:2); KL role stated; prevDiv asymmetry resolved by scoping.
- Parked, separate packets (named, never bundled): walk robustness/A6, readiness guard (+warmup note: grading runs on covered feed), divKind, collapse (intentional), A6 clock/dedupe, shadow/counter telemetry, enum-ization, A6 class rename (DIV_FALLBACK kept: S1-named, census-keyed, GoAbort surface shared), SrjSideNote, stray-; (pre-existing cosmetics). Kimi-B1 widening REJECTED with reason (scope; census watches).

Change (one plain sentence): a setup refused at the final check aborts on positive S4-origin test, pre-bind and unknown origins keep existing behavior with unconditional census, so the squatter dies and the session slot frees.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 defines + E2/E3 EvaluateClosedBar S5 block + stamp/guard/call-site/LogAbort/GoAbort windows, proposed and disk below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md 32d4768eec3834a5f10dbc5775c3f05d27da6ac84172b11ba06a8e0743b34143 / 11896 B / 107 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v253-EVICT-3.md 6eb7e4c136a75f4def9472bebcf9bdbd2adc2f356d5a7d9aa9b4bd6700736ba2 / 12666 B / 153 lines.

Proposed E1 after-block (add ONLY F1:2; F1:1 context already at EA 319):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2+E3 after-shape (packet v4 new lines; replaces EA 8801-8807, leaves 8792-8800 untouched):
```
       //--- [P-EVICT-1] divergence-miss disposition: refused S4-origin holders
       //--- ABORT (DIV_FALLBACK); S3 pre-bind rollback kept; other origins keep
       //--- today's behavior with unconditional census. LogAbort unconditional;
       //--- A6REFUSED and STAND-DOWN gated (debug/armed); DIV_WAIT emit above
       //--- stays the marker. Retry converted 0 of 4 distinct refusals (57/58).
         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).
         if(g_confirmFromState == ST_S4_ARMED)
           {
            GoAbort(ABORT_DIV_FALLBACK, g_state);
            return;
           }
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            ENUM_SRJ_STATE prevDiv = g_state;
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     StateName(g_confirmFromState));
         g_state = ST_S4_ARMED;
         LogState(ST_S5_GATE_CHECK, ST_S4_ARMED);
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

S3 pre-bind stamp window, verbatim, no elisions (EA 8600-8610):
```
         //--- at S3). DECLARED: the pre-confirmation freshness poll cannot run
         //--- pre-binding (it tests the BOUND zone), so a pre-bind firing
         //--- proceeds without it; S2 candidates are OUTSIDE the ruled scope.
         string cfTermPB = "";
         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))
           {
            ENUM_SRJ_STATE prevPB = g_state;
            g_confirmFromState = prevPB;
            g_state = ST_S5_GATE_CHECK;
            LogState(prevPB, g_state);
            if(InpDebugLog)
```

S4 guard, verbatim, no elisions (EA 8629-8630; the 8741 stamp sits inside this guard - hole 8634-8635 pulled: decl + comment, no close; continuous reads 8624-8633 + 8636-8749):
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

LogAbort body, verbatim, no elisions (EA 1723-1728):
```
void LogAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               reason, StateName(atState), AnchorStr(), DirName(g_dir));
  }
```

Mark sites, verbatim, no elisions (EA 10145-10150 alert-only SIGNAL path + EA 10240-10243 order SIGNAL path; the only two MarkSessionUsed call sites in the file):
```
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
```

```
      MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_SIGNAL;
      LogState(prev, g_state);
```

Run rows, raw (same 18 mechanical pulls: 9 RECON58 rows by wall 20:xx + 9 RECON57 rows by wall 16:xx; CO x2 both RECON57; 17:35:01 FP/KL vs EL/QI/RM/PD is the near-paired counterfactual - consistent with, not proof of, causation; retry-stat primary; EM x2 and CO x2 tags disambiguated by timestamps; order rows simulated tester fills; KL selected and slotted yet never signaled because held):
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

Q1 verdict: with the positive S4 test, the carried stamp/guard proofs, the inline GoAbort contract, the disk-derived log-shape, and the fail-as-before default with unconditional census, is the amended v4 disposition clear - refused S4-origin holders abort with the slot freed and session marks unconsumed, S3 kept, unknowns censused?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
