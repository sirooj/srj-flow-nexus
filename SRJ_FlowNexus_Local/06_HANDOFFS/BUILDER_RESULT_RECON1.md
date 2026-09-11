# BUILDER RESULT — RECON1 (the RECON-PILOT Phase-1 baseline: the window defect found + fixed; RECON1B run-verified)
Report: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON1.md
Session: 2026-09-09/10. Basis: SRJ_FlowNexus_Local\01_TASKS\PLAN_RECON-PILOT.md (the operator's scale-out
directive) under GOAL_STATEMENT Amendment 4 (the deployment bar). ZERO canonical-source changes —
the four baselines are byte-identical before and after (digests below). Two launches: RECON1 (wrong
window — kept as evidence) and RECON1B (the corrected baseline run). Run name RECON1 stays the
pilot's reserved name; RECON1B is its corrected continuation. Nothing under 02_TASK_CHECKPOINTS.
No git token.

## 1. THE RUN ARC
- RECON1 launched 2026-09-09 23:14:29 (harness v2.3, RECON1_P1.ini = the T161R_P1.ini shape verbatim
  with FromDate=2026.08.26 / ToDate=2026.09.09; ini digest 6D25C60979FE092F9FF2140163CA72F82F2A48BA
  2148D903F74A5E31BD45372A, 263 B, CRLF=18 LONELF=0). RESULT=PASSED — BUT the window gate FAILED:
  the tester ran "from 2026.08.17 00:00 to 2026.08.22 00:00" (1,440 bars), NOT the staged window.
  Kept as evidence: RECON1_JOURNAL.log (6,755 lines), RECON1_STATUS/DONE.
- DIAGNOSIS (measured, not assumed): config\terminal.ini [Tester] carried DateFrom=1786924800 /
  DateTo=1787356800 = exactly 2026.08.17 00:00 -> 2026.08.22 00:00 — the tester's range comes from
  the SAVED tester-panel settings, and the ini's FromDate/ToDate keys are IGNORED by this build.
  This is the STEP-0 "date keys were not honored" finding, now root-caused: every T161* run matched
  its intended window only because the saved range happened to be 08.14->08.22 then; it changed to
  08.17->08.22 during the operator's terminal session 20:00-23:14. Secondary fact: the tester tick
  store ended 2026.08.21 ("history ticks synchronized from 2026.06.01 to 2026.08.21").
- THE FIX (mechanical, terminal closed, evidenced): config\terminal.ini [Tester] DateFrom ->
  1787702400 (2026.08.26 00:00), DateTo -> 1788998400 (2026.09.10 00:00 — the same exclusive-end
  semantics the 08.22 echo demonstrated). Guards: UTF-16LE BOM verified (FF FE), exactly-one-
  occurrence check passed, backup written (config\terminal.ini.pre-recon1b.bak), digests before
  664C56B80128F618951C398F5ABE973577C513C0BB148F0F18CE7577DEA9825D / after
  54FF770FB782DA846127B85A77A9398FAF309982D75E9B726B2D990C5DF6F11D (byte count unchanged 40,260).
- RECON1B launched 2026-09-10 00:01:29 (wrapper PID 28312, tester PID 15380, same RECON1_P1.ini).
  The operator signaled completion; DONE=RESULT=PASSED 00:47:49. The FIX IS PROVEN by the run's own
  echo: "testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00".

## 2. PHASE-1 GATES — ALL PASS (RECON1B)
- G1 "Test passed in 0:45:49.262" — 506,748 ticks, 2,880 bars generated.
- G2 WINDOW: the echo above; ticks synchronized 2026.06.01 -> 2026.09.08. DECLARED DEVIATION: the
  tested bars end 2026.08.08..09.08 23:59:59 (2,880 bars = 10 trading days) — 2026.09.09's ticks
  were not yet available to the tester at run time. 09.09 is a journal-EMPTY day (rows #289-#290
  carry no setup), so no reconciliation row is affected. The window covers every pilot row that
  carries content (#249-#288).
- G3 WS161_CENSUS fields=15 loads=2880 stores=2880 changes=173 mismatch=0 (N = the window's bars);
  WS161_LOAD NOSTORE present exactly once ("bar=2026.08.25 23:55 shift=1 loads=1"); WS161_FIELD=0;
  WS161_MISMATCH=0.
- Hygiene: the run's leftover terminal closed (graceful attempt -> forced) and verified gone; the
  lingering RECON1-era wrapper process declared (harmless; its archive had completed).

## 3. PHASE-2 RECONCILIATION (the window inventory, row-by-row; journal rows #249-#288)
THE OPERATOR'S JOURNAL (quote-aware parse, date carry-forward; 44 rows in the window #246-#290).

### 3.1 MUST-MATCH (the operator's taken trades) — 2 of 4 MATCH
- #281 9/7 LDN TF LONG W AVP cvd=3 (+2.03) vs EA SIGNAL 2026.09.07 09:20:00 LONG Weekly-POC
  LONDON R=1.76 SL 1.16098 TP 1.16200 (MTSNAP bar=09:15 entry=1.16135 regime=1; MTEXIT 10:05
  reason=TP_TOUCH exit=1.16133 — see §5 obs-3). DAY ✓ SESSION ✓ DIR ✓ POI FAMILY ✓ CVD ✓.
  VERDICT: MATCH. Entry-time delta NOT measurable (the journal carries no entry timestamps —
  batched Q5).
- #283 9/7 NY TF LONG W AVP cvd=3 (+1.06) vs EA SIGNAL 2026.09.07 16:40:15 LONG Weekly-POC NYAM
  R=2.12 SL 1.16218 TP 1.16315 (MTSNAP bar=16:35 entry=1.16249; MTEXIT 17:10 reason=TP_TOUCH
  exit=1.16315). DAY ✓ SESSION ✓ DIR ✓ POI FAMILY ✓ CVD ✓. VERDICT: MATCH.
- #257 8/28 LDN TF SHORT D VWAP cvd=2 (+0.10 "or 1.21R") — MISS (§3.3).
- #280 9/4 NY MR LONG Y AVP cvd=3 (+0.84) — MISS (§3.4).

### 3.2 REJECTED ROWS — EA silence audit (11 rows)
Row / silent? / note:
#249 8/26 ❌ — silent ✓. #250 8/26 cvd=1 invalid XOB — silent ✓. #251 8/26 cvd=4 <1R — silent ✓.
#259 8/28 NY TF D AVP cvd=2 "<1R, wicked out on news" — silent ✓ AND IN AGREEMENT: the EA
  evaluated Daily-POC SHORTs in NY that day and killed every one at the SAME standard the operator
  applied (<1R; TP_RR_FAIL at 16:25/17:00) — the EA's abort reproduces the operator's reject reason.
#262 8/31 LDN MR W VWAP invalid XOB — the W-VWAP row itself silent ✓; the EA signaled SHORT
  Monthly-VWAP LONDON 11:40 same day/session/dir but a DIFFERENT family (EA-only S1, §3.5).
#263 8/31 NY TF ❌ Y AVP — silent ✓. #264 8/31 NY MR M VWAP invalid XOB — silent on NY ✓ (the
  EA-only S1 is LONDON). #265 9/1 LDN TF M AVP ❌ <1R — the LDN row silent ✓ (EA-only S2 is NYAM
  LONG, opposite direction). #267 9/1 ❌ Y AVP "++" — silent ✓. #268 9/1 ❌ Y AVP — silent ✓.
#271 9/2 F AVP ❌ — the FOMC-POC row silent ✓ (EA-only S3 is SHORT Daily-VWAP, different family).

### 3.3 MISS #257 — ROOT CAUSE (measured from the run's own trail)
The EA SEEDED the operator's setup: 2026.08.28 10:00:00 STATE IDLE->S1_REGIME dir=SHORT
poi=Daily-VWAP (LDN session ✓ dir ✓ family ✓). It armed (S4 10:20 via LEGTOUCH at the 10:15 bar,
zone 1.16443-1.16478) and reached S5_GATE_CHECK 10:20. The FIRST S5 evaluation killed it:
- 10:30:00 ABORT reason=TP_RR_FAIL (ALERT STAND-DOWN SHORT | Daily-VWAP | LONDON).
- At the 10:25 CQDRECHECK the latest confirmed verdict was +1 (opposing for a SHORT) with
  divLatch=0 — a SECOND independent gate; the R gate fired first.
CAUSE CHAIN: the 1R admission gate (entry leg = the NEXT candle's open — P-NEXTOPEN; ruled
as-built at HTFSTACK-1 Q2) judged R<1.00 where the operator's own R was 1.21 ("or 1.21R") and
TOOK the trade. The same gate setting that correctly kills invalid setups (the 08.18 false
positive, ruled) now kills a TAKEN trade. This is a strategy-rule collision for the operator
(batched memo Q1) — NOT a code defect: the gate works as specified and as ruled.
Day context: every 8/28 NY SHORT candidate also died TP_RR_FAIL (16:25, 17:00, 17:15) — the R
reference was unfavorable to shorts all day.

### 3.4 MISS #280 — ROOT CAUSE (measured)
The operator's setup: 9/4 NY MR LONG from Y AVP (Yearly-POC) cvd=3, TAKEN +0.84. The EA NEVER
seeded a Yearly-POC LONG that day. Measured chain:
- 15:35:00 SEED LONG poi=Monthly-POC (a lower-rank line; rank 4 vs Yearly-POC rank 2).
- 15:50/15:55/16:00 SUPPRESSED bar=15:45/15:50/15:55 poi=Yearly-POC dir=LONG opp=0 HIGHER=1
  heldPoi=Monthly-POC heldState=S4_ARMED — the operator's exact setup retests were suppressed by
  the ALIVE LOWER-RANK candidate under the while-alive no-replacement rule (ruled at ANCHORTIER-1
  §10: "the rank order AND the while-alive suppression both stand").
- 16:00:00 the Monthly-POC candidate reached S5 and died ABORT reason=TP_RR_FAIL.
- After the singleton freed (16:00+) no further Yearly-POC LONG retest occurred; the EA seeded
  Monthly-VWAP SHORT 16:05 instead.
CAUSE CHAIN: the ruled while-alive suppression + the ruled 1R gate jointly killed the operator's
taken trade. Both mechanisms are RULED AS-BUILT; the collision with a TAKEN trade is the NEW
strategy-rule datum (batched memo Q2). Also note: a Yearly-POC SHORT was suppressed at 15:40
(opp=1 — opposing direction; the suppression is direction-blind by design).

### 3.5 EA-ONLY SIGNALS (4) — listed for adjudication (batched memo Q3)
- S1: 8/31 11:40:07 SHORT Monthly-VWAP LONDON R=2.24 (entry 1.15987 SL 1.16116 TP 1.15698;
  MTEXIT 14:55 POI_BODY_BREAK line=Daily-POC exit=1.15962). Day rows: #262 LDN MR W VWAP
  invalid XOB; #263 NY ❌; #264 NY MR M VWAP invalid XOB. Same session+direction as #262/#264's
  rejected setups but a DIFFERENT family.
- S2: 9/1 15:50:00 LONG Monthly-POC NYAM R=1.36 (entry 1.15921 SL 1.15854 TP 1.16012; MTEXIT
  16:15 POI_BODY_BREAK Weekly-POC exit=1.15923 — a scratch). Day rows: #265 LDN SHORT M AVP ❌;
  #266 LQ-only; #267/#268 NY ❌ Y AVP.
- S3: 9/2 15:55:00 SHORT Daily-VWAP NYAM R=1.05 (entry 1.15789 SL 1.15856 TP 1.15719; MTEXIT
  15:55 POI_BODY_BREAK Daily-VWAP exit=1.15782). 9/2 = a journal-EMPTY day (#269-#272 carry no
  POI except #271's F AVP ❌).
- S4: 9/8 15:55:07 LONG Yearly-POC NYAM R=1.12 (entry 1.16190 SL 1.16079 TP 1.16314; MTEXIT
  16:05 POI_BODY_BREAK Monthly-POC exit=1.16243). 9/8 rows #285-#288 are ENTIRELY BLANK (no bias,
  no POI, no CVD) — an empty day; the trail shows the candidate survived the 2-of-3 poll
  (P-SCOPE34 scope=post) and the Session limit then blocked further NYAM candidates.

### 3.6 UNCLASSIFIED ROWS (plan §1) — EA silence on all
#277 9/4 LDN TF D VWAP cvd=2 "0.92R" — silent ✓. #278 9/4 LDN MR D AVP cvd=3 — silent ✓.
#279 9/4 NY TF Y AVP cvd=3 "++" — silent ✓ (NOTE: same day/session/family/CVD as the taken
#280; the EA's suppressed Yearly-POC LONG retests at 15:50-16:00 were exactly this setup class).
#266/#272-276/#282/#284 LQ-only rows — the EA's S3 (9/2) and S4 (9/8) signals fall on days whose
rows carry no POI data (S4's day entirely blank). The valid-untaken classification question is
batched (memo Q4).

## 4. PHASE-3 LOOP CONDITION — NOT MET (semantic inputs required)
Per the plan: 4/4 MUST-MATCH + 0 signals on rejected + every EA-only explained/ruled. Measured:
2/4 MATCH; the 2 misses root-caused to RULED mechanisms (not code defects); 4 EA-only signals
await the operator's adjudication; the valid-untaken classification is an open ruling. ALL of it
is strategy-rule territory (Amendment 5: goes to THE OPERATOR) — batched in
BUILDER_DECISION_MEMO_RECON1-BATCH.md (ONE memo, Q1-Q5). No packet drafted: no mechanical gap is
established — every miss traces to a ruled behavior colliding with a taken trade, which is
exactly the semantic-gap branch of the plan.

## 5. DECLARED OBSERVATIONS (record-only)
- obs-1: XOB-PROMOCENSUS=436; BIASCENSUS_FINAL bars=2880 sh1 neg=1441 pos=1439, sh2 neg=1441
  pos=1439, fail=0; ZONECENSUS_FINAL bars=2880 xobOnly=2880 inWindow=960 xobInWin=960; the CQD
  verdict counts, the ABORT tally and FRESHSKIP/SUPPRESSED are in RECON1B_TABULATION.txt.
- obs-2: TP_RR_FAIL was the dominant kill across the window (the tabulation's tally) — the 1R
  gate under the next-open reference shapes the EA's signal set materially. Measured, ruled
  behavior; the operator may weigh it under memo Q1.
- obs-3: the #281 managed exit printed "MTEXIT bar=2026.09.07 10:05 reason=TP_TOUCH ... exit=
  1.16133" with entry=1.16135 and tp=1.16200 — a TP_TOUCH label with an exit price BELOW entry.
  Declared as a record observation for the exit-model layer (charter STEP 4 already unbuilt/
  pending); it does NOT affect the identity reconciliation (day/session/dir/family/CVD).
- obs-4: SESSION_LIMIT fired after every signal ("window already used today") — one signal per
  session window per day, as designed; 9/7 carried TWO signals (one per session window).
- obs-5: the ini date keys being ignored is now a MEASURED PERMANENT property of this terminal
  build; the harness's runbooks must target terminal.ini [Tester] DateFrom/DateTo (unix seconds)
  for any future window change. RECON1_P1.ini stays as the provenance record of intent.

## 6. ARTIFACTS + BASELINES
- 06_HANDOFFS: BUILDER_RESULT_RECON1.md (this file), RECON1B_TABULATION.txt (287 lines),
  RECON1B_JOURNAL.log (13,285-line segment; gitignored per R-220), RECON1_JOURNAL.log (6,755
  lines; the wrong-window evidence; gitignored).
- 00_CURRENT_WORKING: RECON1_P1.ini (digest 6D25C609...372A), tabulate_recon1b.ps1,
  RECON1_STATUS/DONE + RECON1B_STATUS/DONE markers.
- config: terminal.ini (the corrected saved range; digest 54FF770B...F11D) +
  terminal.ini.pre-recon1b.bak (the pre-edit backup; digest 664C56B8...9825D).
- NEW BASELINES (unchanged through everything): EA A0701893...3FD57E; CQD BE6FD84F...A421F;
  OrderblockMgr D286621C...20B7B; FlowLogic 1EA7858F...73B08. NO git token; nothing under
  02_TASK_CHECKPOINTS.


- G2 WINDOW: the echo above; ticks synchronized 2026.06.01 -> 2026.09.08. DECLARED DEVIATION: the
  tested bars end 2026.09.08 23:59:59 (2,880 bars = 10 trading days) — 2026.09.09's ticks
- G4 post-run digests BYTE-IDENTICAL (zero source change across both launches):
  EA A0701893299B82370BC62AA19CA280E7064A1C46D6830D82EB7C3E65DC3FD57E;
  CQD BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F;
  OrderblockMgr D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B;
  FlowLogic 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08.
- Hygiene: the run's leftover terminal closed (graceful attempt -> forced) and verified gone; the
  lingering RECON1-era wrapper process declared (harmless; its archive had completed).
