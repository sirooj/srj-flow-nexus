# BUILDER_RESULT_RECON4-FIXS2POLL.md — P-FIX-S2POLL S6/S7, 2026-09-11
All figures below are verbatim tool measurements (Select-String counts / certutil / journal lines).

## 1. Run facts (S5 completion, measured)
- Day-log tail (Tester\logs\20260911.log, -Tail 5): "EURUSD,M5: 563338 ticks, 3168 bars generated. ... Test passed in 0:48:57.099 ... log file ... written ... connection closed" at 17:03:44.077. RESULT=PASSED.
- STATUS file: PID 29080, LAUNCHED 16:14:31, PRE_JOURNAL_LINES=64592. DONE marker was NOT written by the wrapper (STAGE=RUNNING) — the wrapper died; archive completed MANUALLY per the recorded protocol (declared).
- Archive: TOTAL=79911, SEG=15319 lines -> 06_HANDOFFS\RECON4-FIXS2POLL_JOURNAL.log (2,431,591 B). DONE marker written by builder with the measured facts. Tabulation: 06_HANDOFFS\RECON4-FIXS2POLL_TABULATION.txt (tabulate_fixrun.ps1).

## 2. Gates
- G1 window: 3,168 bars, 563,338 ticks — PASS.
- G2 working set: WS161_CENSUS fields=21 loads=3168 stores=3168 changes=205 mismatch=0; WS161_LOAD NOSTORE x1 (16:14:59.358 bar=2026.08.25 23:55); WS161_MISMATCH_ROWS=0; WS161_FIELD_ROWS=0 — PASS. changes 208->205 (BUILD3 208): declared observable, working-set values shifted with candidate lifetimes (E2/E3); mismatch=0 identity held.
- G3 signals: SIGNAL_COUNT=4, the RECON3-BUILD3 four-signal set VERBATIM:
  1. 2026.08.28 10:05:00 SIGNAL SHORT Daily-VWAP LONDON tp_R=2.43 sl_ref=1.16508 sl_mode=2-swing tp_target=1.16364 bid=1.16466 (the operator's journal entry EXACT)
  2. 2026.09.04 16:00:00 SIGNAL LONG Yearly-POC NYAM R=2.56 sl 1.15907 (1-swing)
  3. 2026.09.07 09:20:00 SIGNAL LONG Weekly-POC LONDON R=1.76 sl 1.16098 (1-swing)
  4. 2026.09.07 16:45:00 SIGNAL LONG Weekly-POC NYAM R=1.25 sl 1.16218 (1-swing)
  The four EA-only fakes silent; the 9/4 Yearly-POC signal preserved (ANCHOR_SUPERSEDE 15:45 line verbatim, 8 lines identical to BUILD3). PASS.
- G4 indicator-side identities (CQD/OBMGR/FlowLogic untouched, digests BE6FD84F.../D286621C.../1EA7858F... measured byte-identical at session open post-run):
  BIASCENSUS_FINAL bars=3168 sh1 neg=1554 pos=1614 fail=0 | sh2 identical — VERBATIM.
  ZONECENSUS_FINAL bars=3168 xobOnly=3168 inWindow=1056 xobInWin=1056 — VERBATIM.
  XOB-PROMOCENSUS=469 — VERBATIM (469=469).
  EA-side CQD verdict READS: +1=170 +2=308 -1=266 -2=166 (BUILD3: 170/308/263/165) — read-count shift with candidate lifetimes (declared mechanism; the indicator itself untouched, identity gates above).
  Post-run EA digest re-measured: 1478ADCF...BA74 byte-identical. PASS.
- G5 fix proof:
  E1 inert in-window: S2POLL_NO_SL_REF=0, ABORT_NO_SL_REF=0 (the DIFF=0 prediction held).
  E3 field: haveStop=1 on ALL 157 INPLAYCOMMIT applied=1 lines (field present=157) — the stop pair is live at every arming evaluation.
  E2+E3 admission: INPLAYCOMMIT applied=1 213->157 lines, committed=1 42->46 (+4). t133_swings now turn-count (e.g. 08.27 17:05 bar: scanned=8 swings=3 vs BUILD3 swings=2 same scan) — the distinctness filter live.
  SL_REF 2-swing lines 60->51 (candidate-gated advisory counts moved with lifetimes; declared). SL_STRUCT=50 (same mechanism). The one S5 2-swing latch = the 8/28 signal, SL 1.16508 preserved.
  Defect closed: no zero-stop path (E1) + no unbounded walk cell (E3, haveStop governs). PASS.

## 3. Deltas vs RECON3-BUILD3 (all candidate-gated, mechanism named)
- Aborts 51->52: LTF_MISALIGN 24->21, FRESH_OB_DEAD 7->9, FRESH_OPP_FVG 5->6, TP_RR_FAIL 5->6, SESSION_CLOSED 9=9, NO_TP_TARGET 1=1.
- TP_RR_FAIL_LATCH 5->6: BUILD3's five values VERBATIM (0.41/0.85/0.63/0.36/0.60); ONE NEW at 08.27 17:00 SHORT entry=1.16524 sl=1.16652 tp=1.16498 R=0.20 — a Daily-POC SHORT that in BUILD3 never existed at this point (the alive singleton then was the Weekly-VWAP LONG, aborted LTF_MISALIGN 17:05); under E2/E3 the Daily-POC SHORT arms/advances, reaches S5, R=0.20 < 1 -> abort (not worth 1R). NO signal. The declared E2/E3 admission widening, working as ruled.
- CONFIRMPOLL 590->555; CONFIRM_PREBIND pass lines 4->3 (8/27 17:00 Daily-POC NEW pass; the 9/1 16:55 and 9/4 09:30 passes gone — candidate lineages moved upstream of the fix; no signal impact). CONFIRM_STRUCT_FAIL=198. CONFIRM_DIV_WAIT=6 (BUILD3 6). FRESHSKIP 293->237. SUPPRESSED 156=156 (opp=0 higher=1 =2 identical).
- MTSNAP=4, MTEXIT=4 VERBATIM (08.28 TP_TOUCH exit=1.16451; 09.04 HTF_FLIP exit=1.15990; 09.07 10:05 TP_TOUCH 1.16133; 09.07 17:10 TP_TOUCH 1.16315).
- ANCHOR_SUPERSEDE=8, all 8 lines identical to BUILD3.

## 4. Post-run digests (measured after the run)
- EA 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (re-measured post-run, byte-identical)
- CQD BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F
- OBMGR D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B
- FlowLogic 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08

## 5. Operator-facing verdict (plain words)
The stop bug is fixed and nothing the operator ruled as a valid signal moved. All four signals are the same four trades, same bars, same entry/stop/target prices. The 8/28 short still enters at 1.16466 with the 6:30-high stop 1.16508 and R=2.43. Side effects: four more zone-commit arming events; one new candidate armed on 8/27 evening and died at the 1R gate (R=0.20, not worth 1R — no signal); small advisory-count shifts. No new take-worthy signal appeared; none disappeared.

## 6. Artifacts
- 06_HANDOFFS\RECON4-FIXS2POLL_JOURNAL.log (15,319 lines; gitignored per R-220)
- 06_HANDOFFS\RECON4-FIXS2POLL_TABULATION.txt
- 00_CURRENT_WORKING\RECON4-FIXS2POLL_DONE.txt (builder-written, manual completion)
- 00_CURRENT_WORKING\RECON4-FIXS2POLL_STATUS.txt (wrapper's, STAGE=RUNNING — superseded by this file)
- 01_TASKS\PACKET_P-FIX-S2POLL.md STATUS -> EXECUTED AND VERIFIED

## 7. State
NEW EA BASELINE: 1478ADCF...BA74 (261,040 B) T162_FIXS2POLL run-verified; 7BB1E9B6 SUPERSEDED.
Uncommitted (working tree only copy — fragile): the T162_FIXS2POLL EA state + all records since 8371669. A git snapshot awaits an explicit token. Nothing under 02_TASK_CHECKPOINTS.
QUEUE: 1 FVG-validity packet (ruled rule in BUILDER_FINDING_0828-FVG.md); 2 SL imbalance criterion (P-SL-IMBALANCE, operator-reserved); 3 P-TRIM-S2POLL (council-sequenced, after this baseline); 4 RECON Phase-2 re-run on the fixed build; 5 debris delete word; 6 snapshot on token.
