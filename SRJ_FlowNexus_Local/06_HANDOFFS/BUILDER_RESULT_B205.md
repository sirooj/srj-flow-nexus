# BUILDER RESULT B-205 - RESTORED: FOMC multi-anchor trial broke A5 exit, tick-base drift underneath

Trader summary: the multi-anchor build works as ordered - each Fed decision takes over its own fresh lines, proven by the new prints on every run - but it cannot be kept. On the short euro check your 7 September long exits 4 points away from its booked target, a new 2 September short fires, and the pound run adds a 1 July long, while the yen run matches yours exactly. Underneath, the terminal served deeper tick history than the last build saw, so all tick-based lines moved slightly even where the anchor never changed. The kept build is back on disk byte-verified, the trial is preserved for the next attempt, and the long euro run was never started. Nothing is asked.

## Relay order (B-205 FOMC-MULTI 1 -> RESTORED)
- Part 0 on builder/B-204 at 457befc (ls-remote backup exact; builder/B-205 cut here; rev-parse HEAD = 457befc + branch builder/B-205). Push via backup, never origin. Python first (3.13.16 embed).
- Skills whole in order (relay skill 130 lines incl. Run economy/Row pack/Setup report + B-204 Review sheet paragraph/B-201 trial-save gate; strategy skill lines 328-349 his B-203 review words incl. FOMC-MULTI-ANCHOR line 348 and 0618-EU-FOMC-EXIT line 346, plus break-exit sections: anchor-rank rule line 36 makes a higher-line body break exit a lower-anchored trade). .agents copy never opened.
- Reads on builder/B-204: pointer (30); RESULT_B204 whole (carried note: B-205 trial next, then D3/D1/D2/D5/D4; F2/O3 pending; GU 28 Aug 22pt gap); SLICE_B204 whole; DEFECTS D6 whole (single 29 July anchor, per-bar newest-decision design, 6 decision days); register whole (112: A1-A7, B1-B3, C incl. 3 new INVALID rows, F1-F4). Grep-only ledger/journal/AGENTS/.clinerules (B-205 banking count 0; AGENTS/.clinerules FOMC count 0).
- Names: kit PK-2. New lane FOMC-MULTI 1 of 6; J2D-DEFECTS stays 1 of 6 (queue D3/D1/D2/D5/D4); year-start HELD. Tag B205. Ledger 1350 -> 1351 (B205-FOMC-MULTI). Edit target POI marker (input :85, init absAnchor :1983, uncalled FomcActiveNow :543 - all re-located by text). Backups .preB205 (POI src 79859edc, POI ex5 f0890c0b, EA ex5 B2EF6E4C). Trial keep .B205K (src 5AF5E035, ex5 E5CBE1A2, verified before runs). Marker [B205FOMC] once (verified 1). Print B205FOMC (lean: anchor + first VWAP/POC). Bar-map print: UJBARMAP carries no FOMC values (B-204 R0) - NOT PRINTED, no new per-candle list.
- Decision days: 2026.01.28, 2026.03.18, 2026.04.29, 2026.06.17, 2026.07.29, 2026.09.16 at 21:00 server (input list format the parser already splits). 18 March server offset UNVERIFIED (matters only to the held year-start run).
- Runs: RECON62-B205 (1787702400/1788998400), JUNE0525-B205 (1779667200/1781308800), GBP0629-B205 (1782691200/1784332800), EU0525TD-B205 (1779667200/1791849600, NOT RUN). Reference: DEALS_RECON62-B202 (14), DEALS_JUNE0525-B202 (8), DEALS_GBP0629-B202 (2), DEALS_EU0525TD-B202 (46).
- Start gate: log-1 = 457befc; diff 457befc EMPTY on all 11 gate files; disk EA 7c392767/ex5 B2EF6E4C/IND a8201128/c82f175e/SESS 16573a5b SAME; terminal.ini c725e437 chart-touch class ACCOUNTED (blessed a5834591 in preB197-202; restored before first launch, verified; restored to .preB205 content after last run, verified c725e437). Journal row 338 bytes 166074 ACCOUNTED. Ledger ^1350.=1 ^1351.=0 pre. No terminal64 at launches (PID 20200 stopped by PID per relay; leftover PIDs stopped per run). D: 97.5 GB free before, 92.3 after.
- Scope kept: one indicator edit set (input list + per-bar anchor + print), one compile of that indicator (flow ex5 does not include it - EA references it by iCustom name only; EA untouched, EA ex5 never rebuilt). No gate/tolerance/buffer/count/number touched. Four runs ordered, three run, one terminal session, two cuts (cut-1 T1 grade before T3 per T2 order; full packs only on KEPT - not run). No question to him; no other rule change; nothing deleted; staged result/slice/ledger/pointer/CONTEXT/HANDOFF only.
- Timing table: gate + reads + branch ~30m; K design + spots + rule check ~40m; edits + brace/marker verify ~20m; compile 0/0 2028ms + K4 SHAs + .B205K ~10m; terminal scope + inis + windows ~15m; RECON62 run 05:54:05 WMI 22576 / terminal 21868 / first replay 05:54:32 / pass DONE 05:57:33 (~3.5m); JUNE run 05:58:33 WMI 23024 / terminal 18836 / first replay 05:58:55 / pass DONE 06:02:45 (~4m); GBP run 06:03:11 WMI 3008 / terminal 18376 / first replay 06:03:48 / pass DONE 06:08:09 (~5m); cut-1 one pass + T1/T2 grade + drift forensics ~60m; restore + records + result/slice/push follow.

## Part B - banking
- No new rule words. ALREADY_BANKED 457befc: FOMC-MULTI-ANCHOR skill line 348 count 1; 0618-EU-FOMC-EXIT line 346 count 1. Nothing appended.

## Part S - not a separator trial
- Line-map fix by his order (skill 348), no Part S table. Grade = deal identity on his register rows + his named 18 June exit (NOT RUN - EU long never launched).

## Part K - indicator edit (spots pasted raw with real line numbers before editing; rule-conflict check: his order 348 commands exactly this; no banked word contradicts it)
- K0 .preB205 content copies: POI src 79859edc039ee465..., POI ex5 f0890c0bdee766..., EA ex5 B2EF6E4C (all verified).
- K1 input default before -> after: "2026.07.29 21:00" -> "2026.01.28 21:00;2026.03.18 21:00;2026.04.29 21:00;2026.06.17 21:00;2026.07.29 21:00;2026.09.16 21:00" (semicolon list, the parser's native split).
- K2 per-bar anchor: the bulk bar-walk (Rebuild) folds ticks through FoldOneTick with the init-fixed anchor, so intermediate decisions never restart there; the existing TimeCurrent rollover (OnCalculate :3021 block) only fires incrementally. Added FomcAnchorForBar (newest listed decision at or before the bar time) + per-tick takeover in FoldOneTick's event gate (restart = clear + foldFromMs 0 + last 0 + checkpoint deactivate, exactly the current single-anchor start) + arming in the 3021 block so both paths print once. Bars before 28 Jan print no FOMC line (as today before 29 July).
- K3 B205FOMC print on the first folded tick under each new anchor (one lean line per anchor).
- K4: brace balance 157/157 pre -> 159/159 (+4/+4 added lines, 0 removed); marker `// [B205FOMC]` exactly 1; print tag 1; compile 0 errors 0 warnings 2028ms binary fresh; post-compile SHAs = pre-launch SHAs (src 5AF5E035, ex5 E5CBE1A2); .B205K copies verified equal BEFORE any launch. EA ex5 B2EF6E4C untouched throughout (checked after every run).
- Full diff vs .preB205 raw:
```
diff --git a/Indicators/SRJ_POI_Marker.mq5 b/Indicators/SRJ_POI_Marker.mq5
index a4803c7..56edb0f 100644
--- a/Indicators/SRJ_POI_Marker.mq5
+++ b/Indicators/SRJ_POI_Marker.mq5
@@ -82,7 +82,7 @@ input double           InpBinPips    = 0.1;                // iCustom position 2
 input ENUM_WEIGHT_MODE InpWeightMode = WEIGHT_TICKCOUNT;  // iCustom position 3
 
 input group "FOMC anchor (slot 5) - times are SERVER TIME, pre-converted"
-input string InpFomcTimesServer   = "2026.07.29 21:00";
+input string InpFomcTimesServer   = "2026.01.28 21:00;2026.03.18 21:00;2026.04.29 21:00;2026.06.17 21:00;2026.07.29 21:00;2026.09.16 21:00";
 input bool   InpShowAnchorMarker = true;
 
 input group "Alerts"
@@ -554,6 +554,22 @@ datetime FomcActiveNow()
    return best;
   }
 
+datetime FomcAnchorForBar(const datetime bt)
+  {
+   datetime best = 0;
+
+   for(int i = 0; i < g_fomcCount; i++)
+     {
+      if(g_fomcSorted[i] <= bt && g_fomcSorted[i] > best)
+         best = g_fomcSorted[i];
+     }
+
+   return best;
+  }
+
+bool     g_fomcPrintArmed  = false;
+datetime g_fomcPrintAnchor = 0;
+
 //====================== Anchor verification marker ==================
 #define ANCHOR_PREFIX "SRJ_ANCH_"
 
@@ -1023,6 +1039,37 @@ void FoldOneTick(const MqlTick &t)
 
       if(slots[s].isEvent)
         {
+         // [B205FOMC] per-bar FOMC anchor: newest listed decision at or before
+         // this tick; on change the FOMC accumulators restart exactly like a
+         // fresh anchor (bars before the first listed decision print no line).
+         datetime wantAnchor = slots[s].absAnchor;
+
+         if(s == SLOT_FOMC)
+            wantAnchor = FomcAnchorForBar(t.time);
+
+         if(wantAnchor != slots[s].absAnchor)
+           {
+            ClearVwap(slots[s].vwap);
+            ClearPoc(slots[s].poc);
+
+            slots[s].absAnchor  = wantAnchor;
+            slots[s].foldFromMs = 0;
+            slots[s].lastPOC    = 0.0;
+            slots[s].lastVWAP   = 0.0;
+
+            g_ckpt[SLOT_FOMC].active = false;
+            g_ckActive[SLOT_FOMC]    = false;
+            g_slotAdopted[SLOT_FOMC] = false;
+
+            g_hostPeriod[SLOT_FOMC] = wantAnchor;
+
+            if(!InpContinuousAnchors)
+               g_dispFloor[SLOT_FOMC] = wantAnchor;
+
+            g_fomcPrintArmed  = (wantAnchor > 0);
+            g_fomcPrintAnchor = wantAnchor;
+           }
+
          if(slots[s].absAnchor <= 0)
             continue;
 
@@ -1047,6 +1094,18 @@ void FoldOneTick(const MqlTick &t)
       FoldTickPreChecked(slots[s].vwap,
                          slots[s].poc,
                          t);
+
+      if(s == SLOT_FOMC && g_fomcPrintArmed)
+        {
+         double fsd = 0.0;
+
+         PrintFormat("[SRJ-IND] B205FOMC anchor=%s fomc_vwap=%s fomc_poc=%s",
+                     POI_TimeSec(g_fomcPrintAnchor),
+                     DoubleToString(SnapshotVwap(slots[s].vwap, fsd), _Digits),
+                     DoubleToString(SnapshotPoc(slots[s].poc), _Digits));
+
+         g_fomcPrintArmed = false;
+        }
      }
   }
```
(tail hunk: +3 arming lines in the OnCalculate 3021 rollover block after lastVWAP=0.0: g_fomcPrintArmed=(fa>0); g_fomcPrintAnchor=fa - in diff_b205_poi.txt, unstaged.)

## Part T - runs (one terminal session; wrapper killed after each window verify, light watcher + short DONE polls; ex5 SHAs checked before every launch and after every run, unchanged throughout)
- T1 filed-trade tables vs B-202 DEALS (side/date/time/price; volume never graded):
  - RECON62-B205 (16 deals vs 14): A1 10:05/11:35 same, A2 17:35/17:50 same, A3 16:00/23:55 same, A4 09:20/10:53 same, A6 10:10/10:42 same, A7 17:00/17:26 same; A5 entry 16:45 1.16264 same but exit 17:13:45 1.16319 vs 17:13 1.16315 CHANGED (first differing row: TP_ELECT 16:40 booked tp=1.16318 R=2.57 winner=Yearly-VWAP, trial JL 1009683, vs B-202 tp=1.16315 R=2.45); NEW 9-2 SHORT 14:45 1.15747 out 15:20 1.15822 (first differing row: TP_ELECT 14:45 booked tp=1.15662 R=1.13 trial JL 965289, vs B-202 tp=1.15718 R=0.38 refused; trial FOMC-VWAP 1.15791 behind entry vs B-202 1.15718 ahead).
  - JUNE0525-B205 (8/8 SAME): 27 May 15:35/20:08, C-06-03 3 Jun 09:10/09:59, B2 5 Jun 16:15/19:16, B3 11 Jun 14:40/15:23, all side/date/time/price identical; B1 silent; no must-never fires.
  - GBP0629-B205 (4 vs 2): F2 14:45/17:03 same; NEW 1-Jul LONG 09:50 1.32412 out 10:15 1.32319 SL (FIRE anc=FOMC-POC trial JL 2838471, el=FOMC-POC 1.32358 trial JL 2838483, FOMC-POC 1.32358 at decision trial JL 2838545; 17-Jun-anchor era). No 2-Jul fire; F1/F3/F4 absent as before.
- T2 STOP right after T1: register take A5 changed in exit (1.16315 to 1.16319) = STOP. C must-nevers silent on all three runs (no 4-Sep-10:40 / 2-Jul / B-204-new-row fires; 9-2 EU and 1-Jul GU are not register rows). Tag lines present (B205FOMC on RECON62 x3 + GBP x2; JUNE none-by-design with POIFOMC init absAnchor=29Apr entries=6 proving the build). ex5 unchanged. Non-STOP changes listed above with FOMC values. .B205K was saved+verified at K4 before any restore; restored from .preB205, SHAs verified (POI src 79859edc, POI ex5 f0890c0b, EA ex5 B2EF6E4C); EU0525TD-B205 NOT RUN.
- T3 EU0525TD-B205: NOT RUN (T2 STOP).

## Part P - proof (cut-1 one pass over 20261014.log; segments RECON [1,1051271], JUNE [1051272,2033079], GBP [2033080,end])
- P1 anchors: RECON62 B205FOMC 29Apr (1.16388) / 17Jun (1.15950) / 29Jul (1.13951) + POIFOMC init absAnchor=29Jul entries=6 (active anchor 29 July, unchanged from today). JUNE POIFOMC init absAnchor=29Apr entries=6 (no takeover in window - next decision 17 Jun past window end; zero B205FOMC correct). GBP B205FOMC 29Apr (1.34511) / 17Jun (1.34013) + POIFOMC init absAnchor=17Jun entries=6. All at 21:00 server. Long-run prints: NOT RUN.
- P2 RECON62 identity: FAILED. FROM 96 vs 80, TO 96 vs 80, DEC 75 vs 76 rows; only-one-side 49/33, 43/27, 27/28. Differences spread across bars (e.g. 8-26/8-27 ABORT rows differ), not one row.
- P3 18 June exit: NOT RUN (EU long never launched). His words skill 346 stand.
- P4 completeness: moot on STOP (FROM+TO kept 1:1 per ORDER/END on trial rows; not filed as proof).
- Confound measured underneath (row-based, for the planner): POI walk start ([POI][DEPTH]) trial 2026.05.25 vs B-202-era 2026.06.01 on the same 26-Aug window runs; FLOW session distances identical (TPCENSUS admitted PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 both builds); POI tick-derived lines moved (Yearly-VWAP 1.16315 to 1.16318, FOMC-VWAP 1.15718 to 1.15791 on 9-2). Tick base served deeper history on 10-14 than 10-13. Identity was unachievable on this terminal state regardless of the edit; the STOP stands on rows either way.
- Verdict: RESTORED (first failed check: T2 A5 exit changed).

## Part F2b on KEPT
- None (RESTORED). No ROWPACK/INDEX/ JOURNAL/REVIEW/DEALS/FOMC_CHANGES files staged.

## Part X - records (grep-first, counts before/after)
- X1 CONTEXT section 4 +1 B205-LINEMAP-IDENTITY-FIRST (0->1); section 5 +1 Brain B-205 (0->1, 2026-10-14).
- X2 HANDOFF section 3 +1 B-205 arc line (0->1, RESTORED).
- X3 ledger 1351 B205-FOMC-MULTI (^1350.=1 kept, ^1351. 0->1).
- X4 pointer rewritten (32 lines, cap 35; lane FOMC-MULTI 1 of 6 RESTORED; J2D-DEFECTS queue D3 next then D1/D2/D5/D4; carries: D4 re-grade at his candle - A2 retest 17:30; Yearly census long-runs vs RECON62 1-Sep break; HELD/F2/O3/UNRECONCILED/B-202 queue).

## Part F - file, push, reply
- F1 this result (trader summary first). F2 slice (raw rows; under 600 lines).
- F3 ledger 1351. F4 pointer (32 lines).
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT, PLANNER_HANDOFF. Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs/job outs/launchers/STATUS/DONE/diffs.
- F6 rev-parse checks, commit, push backup; ls-remote must return commit.
- Final disk state: RESTORED - POI marker src 79859edc + ex5 f0890c0b (= .preB205, verified); trial kept as .B205K src 5AF5E035 + ex5 E5CBE1A2 (verified); EA 7c392767 / ex5 B2EF6E4C untouched; flow indicator a8201128/c82f175e untouched; Sessions 16573a5b; terminal.ini c725e437 (restored .preB205 content, verified); no terminal64 running; journal row 338 unstaged 166074; ledger +1; pointer rewritten.

## Carried note
- Next = J2D-DEFECTS D3 (zone on the far side of the stop, 11 of 38, no register row hit), then D1, D2, D5, D4 last. FOMC-MULTI retrial only after the tick-drift confound is settled (same-window POI walk start moved 06-01 to 05-25 between 10-13 and 10-14 with FLOW sessions identical; a kept verdict needs a drift-free identity baseline first). D4 re-grade at his candle before any chart call (A2's own retest 17:30, register row 2). Yearly census: B-204 D6 "zero prints" was long-run cuts only - RECON62 packs carry Yearly + FOMC UJDTTERMS rows (412/302 on 26 Aug), and the 1 September Yearly-POC break stands on RECON62 rows. Year-start HELD until he reviews. His F2 grade pending. O3 pending. GU 28 Aug 22pt gap still UNRECONCILED. B-202 file-defect queue unchanged. 18 March server offset still UNVERIFIED (held year-start run only).
