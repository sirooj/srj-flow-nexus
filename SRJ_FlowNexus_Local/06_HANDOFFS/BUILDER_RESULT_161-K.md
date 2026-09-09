# BUILDER RESULT — 161-K (P-NEXTOPEN: the next-candle-open evaluation at the retest + entry sites)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-K.md
Session: 2026-09-09 (~06:00-06:45). Authorization: the operator's directive (verbatim in
01_TASKS\PACKET_P-NEXTOPEN.md) ending "Proceed." Canonical file modified: exactly ONE —
Experts\SRJ_FlowNexus_EA.mq5, three edit sites (E1 the retest predicate, E2 the S5 entry
reference, E3 a comment). CQD, FlowLogic and the fourteen includes UNTOUCHED.
Artifacts: T161K_P1.ini + tabulate_161k.ps1 (00_CURRENT_WORKING); T161K_COMPILE.log +
T161K_JOURNAL.log + T161K_TABULATION.txt (06_HANDOFFS; logs gitignored per R-220).
Nothing under 02_TASK_CHECKPOINTS. No git add/commit/push.

## STAGES
1. Pre-edit re-hash AB102C0A2966B1BF9C62A8B79276A19563E936E9675980C95A0B8453E3A24EAC
   (206,837 B) = the packet's expected value — PASS.
2. E1/E2/E3 applied (editor; diffs in the tool record). E2 needed three attempts — the first
   two failed on whitespace (my 4- and 7-space anchors vs the measured 6-space indent);
   re-issued against the measured raw line (the R-180 / P-DIVCON-B discipline), declared.
3. Post-edit (measured after the write): SHA256
   E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA, 207,854 B (+1,017),
   CRLF=4204 LONELF=0 (+14 lines = E1 +7, E2 +7).
4. Compile T161K: "Result: 0 errors, 0 warnings, 1487 ms elapsed" (T161K_COMPILE.log; exit
   code never the gate). .ex5 126,386 B @ 06:01:35 (record-only, inadmissible as identity).
5. Run T161K: headless /config T161K_P1.ini (the T161J harness shape: EURUSD M5, Model 4,
   JPY 10,000, InpDebugLog=true as tester input, 2026.08.14-08.22 — the Tier-1 superset).
   The operator's live terminal (PID 16500, started 05:30) was closed FIRST WITH THE
   OPERATOR'S EXPLICIT IN-SESSION AUTHORIZATION (graceful CloseMainWindow; nothing reopened).
   T161K instance PID 29020 launched 06:03:36; "Test passed in 0:27:42.944"; 321,404 ticks,
   1,728 bars; final balance 10,000 JPY (alert-only, no orders).
   DECLARED INCIDENT (R-180 class): the first journal-archive attempt failed verbatim —
   "The process cannot access the file ... because it is being used by another process"
   (the live T161K instance held the log; my 100-second exit wait was too short). Nothing
   was patched by re-reading; the instance was then closed (this session's own leftover,
   the T161I->T161J hygiene) and the segment re-archived clean: tester-log lines
   12913-19172 = 6,260 lines, beginning "Local network farm switched off" 06:03:38.
6. Post-run re-hash: EA E5B0E2E4... byte-identical to Stage 3.

## GATES (all PASSED, measured)
1. WS161_CENSUS fields=15 loads=1728 stores=1728 changes=79 mismatch=0 (changes 85->79: the
   next-open evaluations shifted latch values, as designed).
2. WS161_LOAD_COUNT=1; WS161_MISMATCH_COUNT=0; no WS161_FIELD rows.
3. BIASCENSUS_FINAL bars=1728 fail=0; sh1 neg=699 pos=1029 / sh2 neg=700 pos=1028 —
   shard-identical to T161H/I/J.
4. XOB-PROMOCENSUS 372=372=372=372 (H/I/J/K); ZONECENSUS_FINAL line-identical (bars=1728
   both=0 xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548 fvgInWin=0).
5. CQD verdict stream IDENTICAL to T161J (254 census reads; +1=43 +2=84 -1=88 -2=39; the
   08.18 list = 42 lines) — the CQD is untouched.
6. Candidate-gated EA censuses shifted, DECLARED mechanism (candidate lifetimes changed by
   the new seed predicate): XOBINPLAY capped 51->55, XOBINPLAY2 55 (CLS2 BOTH 9->11,
   LEGACYONLY 27, NEITHER 10, REACHED2_1=55), S3INPLAY 55 (inPlay_1=38), XOBPROMO 55,
   S5_WAIT 14->12. No gate rests on these counts.

## SIGNALS (T161J control -> T161K)
- 08.17 16:35:02 LONG Weekly-VWAP NYAM — SAME bar, SAME SL 1.15870 TP 1.16141. R 1.46 -> 1.42.
  MECHANISM (E2): the entry reference is now the 16:35 OPEN instead of the 16:30 close; the
  open sat ~1.4 points below the close at the boundary. Derived entries (arithmetic from the
  measured R values with slRef/tp fixed — derived figures, R-235-compliant, not measured
  prints): T161J ~1.15996, T161K ~1.15982.
- 08.20 09:35:04 LONG Daily-VWAP LONDON R=1.60 SL 1.16733 TP 1.16837 — NEW (H/I/J had NO
  08.20 signal). FULL TRACE (T161K journal): seed 09:15:00 (bar 09:10 LONG Daily-VWAP retest —
  under E1 its body-side test is judged at the 09:15 OPEN, which is on-side, where the
  09:10 CLOSE was not); S1->S2->S3 at 09:20:02 (XOB 2526 1.16712-1.16745, inPlay=1
  via=SWING1); S4_ARMED 09:20:02; the 2-of-3 poll holds (adverse=1, verdict=HOLD); +2 (bullish
  hidden, direction-matched) latched 09:35:04 (bar 09:25, first confirmable then); S5
  R=1.60 >= 1 -> SIGNAL.
  THE CONTROL'S COUNTERPART (T161J journal, same window): at 09:10:02 the OLD predicate
  seeded the OPPOSITE candidate (SHORT Daily-VWAP on bar 09:05, whose 09:05 close passed the
  old body test); that SHORT sat at S2_LTF_ALIGN 09:15-09:55 (FRESHSKIP PRE_BINDING every
  bar); the bar-09:10 LONG retest was never judged on its own merits — "SUPPRESSED bar=09:10
  dir=LONG opp=1 heldPoi=Daily-VWAP heldDir=SHORT" (dedup while alive). The new signal is
  E1's DIRECT mechanical product: the retest decision moved from the retest close to the
  next open, flipping BOTH seeds (the SHORT no longer qualifies; the LONG now does; with the
  stale SHORT gone, the LONG runs the full ladder).
  SEMANTIC JUDGMENT RESERVED TO THE OPERATOR: the operator's journal has NO 08.20 LDN row
  (empty = no setup taken/considered), and GOAL_STATEMENT's tally recorded "EA: no signal on
  08.20. AGREEMENT (absence matches)." T161K now signals there BECAUSE of the operator's own
  directive. Reported, not judged.

## VERDICT (mechanical)
P-NEXTOPEN EXECUTED AND VERIFIED per its packet gates. New EA baseline:
E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA (207,854 B, 4,204 CRLFs) —
T161K-verified. Divergence consumption, CQD detection and the FlowLogic exports are unchanged
(the identity gates held). The exit site of spec §4 (next-open) remains unbuilt with the §5
exit model (charter STEP 4). Recertification (a T161K-CERT pass) available on request.

