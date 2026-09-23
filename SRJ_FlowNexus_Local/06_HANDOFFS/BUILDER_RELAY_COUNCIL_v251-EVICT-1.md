# CODE REVIEW REQUEST - v251 - 2026-09-23 (new packet P-EVICT-1 v1; answers the RECON58 G2-FAIL grade, no prior ruling)

Council session: NEW (new packet, full form: code + rows ride whole inline).

Run cost: one build (define + disposition, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence): a setup refused at the final check now dies instead of re-arming, so it can no longer squat the session slot and veto the valid setup.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - file-scope ABORT defines, EA lines 315-321 (E1: add one define) + EvaluateClosedBar S5 gate-check block, EA lines 8756-8809 (E2: fallback re-arm becomes abort).
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md d0749d363da299219d69c336c377f26b557c39b94aac2cb22dc4f441d295daef / 6819 B / 121 lines.

Complete code E1, verbatim, no elisions (EA 315-321):
```
#define ABORT_NO_SL_REF        "NO_SL_REF"
#define ABORT_NO_TP_TARGET     "NO_TP_TARGET"
//--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;
//--- no gate reads an abort reason.
#define ABORT_POI_REPLACED     "POI_REPLACED"

//====================== [Task 160] Migration data contracts ==========
```

Complete code E2, verbatim, no elisions (EA 8756-8809):
```
   if(g_state == ST_S5_GATE_CHECK)
     {
      //--- [P-CONFIRM-GATE E3 / operator robustness ruling 2026-09-10, verbatim:
      //--- "please make the divergence detection more robust. i consider the
      //--- latest CQD divergence, although that was from an older structure.
      //--- WHICH EVER LAST."] The divergence term is a newest-first CQD verdict
      //--- walk with NO BOUND - no seed-bar bound, no age limit. The FIRST
      //--- nonzero verdict walking left IS the latest on the indicator, however
      //--- old. This replaces the anchor-bounded g_divLatch in the firing path
      //--- entirely (the per-bar g_divLatch machinery above stays - it is
      //--- working-set state and a census field; the firing path no longer
      //--- reads it).
      bool   divOk    = false;
      int    divVal   = 0;
      string divKind  = "";
      {
       int maxWalk = Bars(_Symbol, PERIOD_CURRENT) - 1;
       for(int s = barShift; s <= maxWalk; s++)
         {
          double verdict;
          if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) continue;
          if(verdict == EMPTY_VALUE) continue;
          int v = (int)MathRound(verdict);
          if(v == 0) continue;
          divVal   = v;
          divKind  = (MathAbs(v) == 1) ? "regular" : "hidden";
          divOk    = (g_dir == DIR_LONG  && (v ==  1 || v ==  2)) ||
                     (g_dir == DIR_SHORT && (v == -1 || v == -2));
          break;
         }
      }
      //--- [P-CONFIRM-GATE E3] one-bar validity, the divergence miss: the
      //--- confirmation is CONSUMED and the candidate RETURNS TO S4_ARMED
      //--- (CONFIRM_DIV_WAIT, no abort) - a fresh confirmation may present on
      //--- a later bar. The old async wait ("S5 waiting: divLatch=0 tpOk=1")
      //--- RETIRES.
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

Run rows, raw (mechanical pulls, RECON58 segment 424A5A0C unless noted):
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
(Rows EL through PD from RECON57 segment 6F242EAC; rows CO/IH/CE/RJ likewise 57; all others RECON58. Fallback census: 3 per run, zero later took in either run. 57 took 9/1 17:35 off the same 17:30 seed that 58 holds at S2POLL.)

Q1 verdict: does the DIV_WAIT fallback re-arm (EA 8801-8808) create a permanent same-session veto when the refused holder is tier-1 and preemption-immune?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Q2 verdict: does replacing the re-arm with GoAbort(ABORT_DIV_FALLBACK, g_state) free the session slot without touching the E3 detection walk, Q3 arrival-order, session marks, or any take path?
Q2 answer form: plain yes / no / discrepancy, with line numbers. A NO on one never sinks the other.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
