# BUILDER_RESULT_RECON3-BUILD3.md - P-BUILD3 EXECUTED AND VERIFIED
Date: 2026-09-11. Run RECON3-BUILD3 (RECON1_P1.ini unchanged; 8/26->9/10, 3168 bars).
Packet: 01_TASKS\PACKET_P-BUILD3.md - STATUS NOW: EXECUTED AND VERIFIED.
ONE canonical file: Experts\SRJ_FlowNexus_EA.mq5. CQD/OBMGR/FlowLogic untouched.
Baseline: RECON2-SLREF2 (EA 693B3729; 3 signals).

## 1. STAGES (all measured)
- S1 pre-hash PASS: EA 693B3729...946E (session prompt record).
- S2 E1-E5 applied (session prompt record).
- S3 post-hash EA 7BB1E9B6...C3CB3C (certutil verbatim, twice: open + post-run).
- S4 T162_BUILD3 compile: Result 0 errors 0 warnings 1996 ms elapsed (log line 93).
  First attempt failed 2 errors on forward declaration (MQL5 rejects it); fixed by
  defining B3 helpers after DetectPoiRetest (session prompt record).
- S5 RECON3-BUILD3: launched 13:18:07 PID 12160; Test passed in 1:03:47.543;
  563338 ticks, 3168 bars, RESULT=PASSED, DONE 2026-09-11 14:24:32 (STATUS+DONE read
  verbatim). Journal segment: RECON3-BUILD3_JOURNAL.log, 16162 lines.

## 2. GATES
- G1 PASS: Test passed, 3168 bars, RESULT=PASSED.
- G2 PASS WITH DECLARED MOVE: WS161 fields=21 loads=3168 stores=3168 changes=208
  mismatch=0 (verbatim); LOAD NOSTORE x1 (2026.08.26 00:00:00 loads=1); zero MISMATCH
  rows, zero FIELD rows. changes 206->208 = declared (extra stored transitions from
  the superseded candidate path; fields/loads/stores/mismatch unchanged).
- G3: A-PRIORI CORE VERBATIM + RULED DELIVERABLE DELIVERED.
  - 8/28 10:05:00 SIGNAL SHORT Daily-VWAP LONDON R=2.43 SL 1.16508 TP 1.16364 - VERBATIM.
    MTSNAP anchor=Daily-VWAP entry=1.16466. Zero ANCHOR_SUPERSEDE on its lifetime.
  - 9/7 09:20 LONG Weekly-POC LONDON R=1.76 - VERBATIM.
  - 9/7 16:45 LONG Weekly-POC NYAM R=1.25 - VERBATIM.
  - Four fakes (8/31, 9/1, 9/2, 9/8): SILENT (zero SIGNAL lines - measured).
  - 9/4: ANCHOR_SUPERSEDE bar=2026.09.04 15:45 from Monthly-POC rank6 tier3 to
    Yearly-POC rank2 tier1 dir LONG state S4_ARMED - THE A-PRIORI EXACT LINE, VERBATIM.
    DELIVERABLE: 2026.09.04 16:00:00 SIGNAL LONG Yearly-POC NYAM R=2.56 SL 1.15907
    TP 1.16302 spr=1. Chain: 15:35 seed Monthly-POC; 15:40 CONFIRMPOLL confirm=1
    (Monthly) + HEADS-UP; 15:50 ANCHOR_SUPERSEDE to Yearly (S4, regime untouched);
    16:00 CONFIRMPOLL confirm=1 on 15:55 Yearly bar (opp=1 bodyDir=1 body=20pts
    touchAttr=1) -> S4->S5 -> 1-swing latch slRef=1.15907 (OB_SWING deltaPts=0) ->
    TP_ELECT R=2.56 -> SIGNAL. MTSNAP anchor=Yearly-POC entry=1.16018 regime=3.
    MTEXIT 16:05:01 HTF_FLIP exit=1.15990 (parked 5.6 exit, MT_HTF_EXIT=true).
    SIGNAL_COUNT = 4 (3 ruled + Yearly deliverable).
  - SUPPRESSED opp=0 higher=1: 18 -> 2 (measured; the 18 same-direction higher-tier
    suppressions are the declared blast radius, now re-binds). opp=1: 85 -> 83
    (opposite-direction suppression untouched by design; 2-count lifetime drift).
    SUPPRESSED TOTAL 157 -> 156.
- G4 PASS: post-run digests byte-identical (certutil verbatim):
  EA 7BB1E9B6...C3CB3C; CQD BE6FD84F...A421F; OBMGR D286621C...20B7B;
  FlowLogic 1EA7858F...73B08.
- G5: FlowLogic identities VERBATIM; EA counts with declared moves:
  BIASCENSUS 1554/1614 x2 fail=0 VERBATIM; ZONECENSUS 3168/1056 VERBATIM;
  XOB-PROMO 469 VERBATIM. OBPROV code3/code4 NOT re-gated (tabulation code3=951 /
  code4=1205 include T155 replay+live double-print sites; not comparable to SLREF2
  tabulation 769/887 scope - declared; identity censuses above all verbatim).
  CQD stream IDENTICAL: total 906 (+1=170 +2=308 -1=263 -2=165, both builds).
  EA moves (mechanism-named): ABORT 54->51 (LTF_MISALIGN 25->24, SESSION_CLOSED
  10->9, FRESH_OB_DEAD 8->7, rest 5/5/1 identical); FRESHSKIP 292->293;
  CONFIRMPOLL 611->590 (superseded candidates skip re-poll under new anchor);
  PREBIND passes 4->4; DIV_WAIT 5->6; STRUCTFAIL 191->176 (re-attribution);
  TP_RR_FAIL_LATCH 5->5 IDENTICAL values (0.41/0.85/0.63/0.36/0.60);
  SL_REF 2-swing 60->60, SL_STRUCT 60->60; FRESHCOUNT 92->85 (all scope=pre).
  ANCHOR_SUPERSEDE total = 8 (verbatim in tabulation). MTSNAP/MTEXIT 3->4.
## 3. WHAT THIS PROVES
- Spec 3.4 (same-direction higher-tier touch upgrades the anchor) now executes: 9/4
  seeded Monthly-POC, upgraded to Yearly-POC on the 15:45 bar, signaled Yearly 16:00.
- Singleton arrival-order across time untouched (opp=1 suppression intact; POIREPLACE
  counterfactual untouched). 8/28 + 9/7 pair unmoved. No fake returned.

## 4. FOR YOUR JUDGMENT (plain language)
- New signal Sept 4, afternoon New York, LONG from the Yearly line: entry 1.16018,
  stop 1.15907, target 1.16302, worth 2.56R. Exited next bar 1.15990 on the HTF flip
  rule (parked experiment, still on). Your call whether it matches your journal.
- Aug 31, Sept 1, Sept 2, Sept 8 stayed silent. Aug 28 short + both Sept 7 longs exact.

## 5. ARTIFACTS
- RECON3-BUILD3_JOURNAL.log (16162 lines; gitignored) + RECON3-BUILD3_TABULATION.txt
  (181 lines) + T162_BUILD3_COMPILE.log (gitignored) in 06_HANDOFFS.
- RECON3-BUILD3_STATUS.txt + DONE in 00_CURRENT_WORKING. tabulate/probe scripts kept.
- No git token. Nothing under 02_TASK_CHECKPOINTS. Post-run digests identical (G4).
- T162_BUILD3 EA state (7BB1E9B6...C3CB3C) is the run-verified baseline; 693B3729
  SUPERSEDED. QUEUE: FVG packet; imbalance criterion (reserved); Phase-2 re-run;
  debris word; snapshot on token.


