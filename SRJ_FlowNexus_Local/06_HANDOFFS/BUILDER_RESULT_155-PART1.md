# TASK 155 PART 1 — BUILDER RESULT (AUTHORIZED RUN)

TASK 155 PART 1: COMPLETED
Form version: v4 PART 1 REVISION 1
Invocation: AUTHORIZED RUN

Relay check: token PRESENT | definitions 6, pre-flight 3, stage0 5, stage1 13, stage2 1 | COUNT LINE CONSISTENT with both figures (6+3+5+13+1 = 28, matching the declared total 28; the final line of the received text is END-OF-TASK-155-V4P1-R1)

Pre-flight (pass 2, this session, on this revision; pass 1 was performed in council session on the same revision and also returned three NOs; both passes on record):
Q1 NO — every operative instruction is a fixed, deterministic decision procedure (D1–D6: whole-token boundary, stripping, column, parameter-list splitting, header window, append-site form), each resting on verbatim line text with defined columns, counts and PASS/FAIL outcomes. No aesthetic, judgment, preference or taste-based instruction appears; the points where selection could arise (items 1.5, 1.6, 1.11) are expressly restricted to report-without-select.
Q2 NO — CANONICAL SCOPE forbids any creation, modification, renaming or deletion in the canonical tree (MQ\Experts\, MQ\Indicators\, MQ\Include\) and confines every write to under MQ\SRJ_FlowNexus_Local\: the applicable report destination, CP\BEFORE\ and its seven copies, and CP\MANIFEST.txt. No compile, no .ex5.
Q3 NO — every term this part requires the builder to apply is defined in this document's DEFINITIONS BLOCK (D1–D6). The labels R-20, R-22, "self-contained-term rule" and "consumed-figure rule" are mentioned but never applied by this part (consumed by PART 2's authorship and gates, or applied by the author at authorship); no figure is anchored from any earlier session.

Authorization in session:
> COUNCIL AUTHORIZATION 155-A2. Council + Planner/Master (Opus 5), Revision 60.3.
>
> PRE-FLIGHT PASS 2 ON TASK_155-v4-PART1-R1.md IS ACCEPTED. Three NOs. Relay complete,
> count line consistent. Pass 1 was performed in council session on the same revision
> and also returned three NOs. Both passes are on record.
>
> PART 1 IS AUTHORIZED. STAGE 0 IS RELEASED. Proceed from item 0.1 through STAGE 2 of
> TASK_155-v4-PART1-R1.md exactly as written, subject to the clauses below.
>
> CLAUSE 1 - SCOPE. This authorization covers PART 1 ONLY: the STAGE 0 baseline, the
> thirteen STAGE 1 reads, and the STAGE 2 report. It authorizes NO EDIT to any file in
> the canonical tree, NO COMPILE, and NO .ex5. Every restriction in the form's
> CANONICAL SCOPE and RESTRICTIONS CHECKLIST stands unchanged and unwaived.
>
> CLAUSE 2 - REPORT DESTINATION FOR THIS RUN. Write to
>   MQ\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-PART1.md
> with the line "Invocation: AUTHORIZED RUN". Do NOT overwrite, modify or delete
> BUILDER_RESULT_155-PART1-PREFLIGHT.md, which stands as the pass-2 record. Do NOT
> write BUILDER_RESULT_155.md, which is reserved for PART 2.
>
> CLAUSE 3 - READ-STAGE COMPLETION IS BINDING. Perform all thirteen STAGE 1 reads. A
> FAIL, a DEVIATION, a CONFLICT, an UNDETERMINED or a PRECONDITION FAILED in any read
> does NOT stop the stage: report it in place, prefixed DEVIATION where the form directs,
> and continue to the next read. Only item 0.2 SNAPSHOT DIVERGENT or item 0.3 STASIS
> BROKEN stops this part early, and either one is reported to the destination in
> CLAUSE 2 before the session ends.
>
> CLAUSE 4 - YOU RESOLVE NOTHING. Do not select which parameter is a bar index. Do not
> mark any parameter as an event bar or a processing bar. Do not conclude which sites
> should be braced. Do not add a brace, a statement, a comment or a character to any
> canonical file. Do not state that PART 2 may proceed. Report the full parameter lists,
> the full windows, all eight D6 outcomes and both gate results, and stop there. Every
> selection is made by the council in PART 2.
>
> CLAUSE 5 - EVERY STATUS IS WRITTEN. COMPLETED, BLOCKED, PARTIAL, RELAY INCOMPLETE and
> NOT AUTHORIZED all go to the CLAUSE 2 destination, once, complete, carrying every step
> performed and every figure derived. A BLOCKED report is not a stub and is not optional.
>
> STILL NOT AUTHORIZED, and not granted by a clean PART 1:
>   no edit to SRJ_State.mqh, SRJ_OrderblockMgr.mqh, SRJ_ImbalanceMgr.mqh,
>   SRJ_BiasEngine.mqh, SRJ_FlowLogic.mq5 or any other file in the canonical tree;
>   no compile of anything; no .ex5; no test run, no backtest, no strategy tester, no
>   chart attach, no live trading; and no part of PART 2, which does not yet exist.
>
> Quote this authorization in full on the "Authorization in session:" line of your
> report.
>
> Reminder, not a new instruction: report what you read and what you measured. Do not
> state that this task is verified, complete, conformant or correct.
>
> BEGIN AT ITEM 0.1.
>
> END-OF-AUTHORIZATION-155-A2

Reference documents loaded: none as a standing instruction. The task document TASK_155-v4-PART1-R1.md was supplied in session and is the only procedure applied; the council authorization quoted above was supplied in session. No prior revision, no prior builder result, no earlier version of this task, and no project document other than this task document was loaded. No figure from any earlier session was used as an anchor.

Report destination: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-PART1.md

Steps completed: STAGE 0 items 0.1 through 0.5; STAGE 1 items 1.1 through 1.13 (all thirteen reads performed; none suppressed); STAGE 2 report (this document). Highest item reached: STAGE 2. Item at which stopped: none — no early stop occurred; item 0.2 returned no SNAPSHOT DIVERGENT and item 0.3 returned no STASIS BROKEN, so the part ran through all five STAGE 0 steps, all thirteen STAGE 1 reads, and the STAGE 2 report.

Files read: All reads performed by shell command; no canonical file was opened in MetaEditor.
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5 — certutil -hashfile "<path>" SHA256 (item 0.2); PowerShell (Get-Content -LiteralPath <path>).Count (item 0.4)
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5 — certutil -hashfile "<path>" SHA256 (0.2); (Get-Content).Count (0.4); Get-Content line reads for items 1.1 and 1.13(a)
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh — certutil (0.2); (Get-Content).Count (0.4); Get-Content line reads for item 1.2
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh — certutil (0.2); (Get-Content).Count (0.4); Get-Content line reads for items 1.3, 1.4, 1.5, 1.6, 1.12, 1.13(b)
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh — certutil (0.2); (Get-Content).Count (0.4); Get-Content line reads for items 1.7, 1.8, 1.12
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh — certutil (0.2); (Get-Content).Count (0.4); Get-Content line reads for items 1.9, 1.10, 1.12
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh — certutil (0.2); (Get-Content).Count (0.4)
- CP\BEFORE\ seven copies (...\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\) — certutil -hashfile "<path>" SHA256 (item 0.2)
- CP\MANIFEST.txt (...\Rev060_Task155_ExportStage_Buffer34\MANIFEST.txt) — cmd /c type (read before appending, item 0.2)
- Directory listings (item 0.1 branch determination; pre-flight Q2): cmd /c dir on ...\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34 and its \BEFORE, ...\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT, and the canonical directories MQ\Experts\, MQ\Indicators\, MQ\Include\SRJ\

Files written:
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-PART1.md (this report — written once, complete)
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\MANIFEST.txt (item 0.2: appended a new dated section "SECTION: AUTHORIZED RUN 155-A2 (Revision 60.3)" carrying the fourteen hashes, the two supplied digests and the three supplied line counts; the pre-existing content was preserved, nothing overwritten)
- CP\BEFORE\: nothing copied and nothing written (BRANCH EXISTING)
- BUILDER_RESULT_155-PART1-PREFLIGHT.md: NOT touched — stands as the pass-2 record
- BUILDER_RESULT_155.md: NOT written — that filename is reserved for PART 2
NO CANONICAL FILE MODIFIED. NO COMPILE PERFORMED. No .ex5 produced or expected. No test run, no backtest, no strategy tester, no chart attach, no live trading.

Snapshot branch: BRANCH EXISTING — CP\BEFORE\ already existed and contained all seven files (verified by cmd /c dir listing before any hashing); nothing was copied from SNAP or from the canonical tree; item 0.2 then re-verified all seven in place.

Baseline hashes: raw certutil -hashfile <path> SHA256 output, all fourteen (item 0.2).

CP\BEFORE\ copies:
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowNexus_EA.mq5:
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowLogic.mq5:
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_State.mqh:
85b2635627b0e217d233afcea191f9cab766f309eea464080248be13422d02d8
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_OrderblockMgr.mqh:
9dcd8d8db57089e525a5ed1ccfe4ba6b4c4b1d63e72d6868cd101e1b4da5f27d
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_ImbalanceMgr.mqh:
87886cd42e38ed6592dc798ca17a1ebb889b5f4521f389d5fd837fcaa2d482b6
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_BiasEngine.mqh:
384a25bad6f92cdadd62f6d297b71b7a0afc809c7a50bbd4fac532c85b7ad89e
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_Types.mqh:
773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc
CertUtil: -hashfile command completed successfully.

Canonical tree:
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5:
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5:
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh:
85b2635627b0e217d233afcea191f9cab766f309eea464080248be13422d02d8
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh:
9dcd8d8db57089e525a5ed1ccfe4ba6b4c4b1d63e72d6868cd101e1b4da5f27d
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh:
87886cd42e38ed6592dc798ca17a1ebb889b5f4521f389d5fd837fcaa2d482b6
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh:
384a25bad6f92cdadd62f6d297b71b7a0afc809c7a50bbd4fac532c85b7ad89e
CertUtil: -hashfile command completed successfully.
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh:
773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc
CertUtil: -hashfile command completed successfully.

BEFORE-vs-canonical comparison (item 0.2): all seven BEFORE digests equal their canonical counterparts — SRJ_FlowNexus_EA.mq5 EQUAL, SRJ_FlowLogic.mq5 EQUAL, SRJ_State.mqh EQUAL, SRJ_OrderblockMgr.mqh EQUAL, SRJ_ImbalanceMgr.mqh EQUAL, SRJ_BiasEngine.mqh EQUAL, SRJ_Types.mqh EQUAL. No SNAPSHOT DIVERGENT; no stop.

Two supplied comparisons (item 0.3):
- Canonical EA digest 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 vs supplied 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 — MATCH.
- Canonical FlowLogic digest d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5 vs supplied d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5 — MATCH.
No STASIS BROKEN; no stop. Both digests were also recorded in CP\MANIFEST.txt together with the three supplied line counts.

Line counts (item 0.4, PowerShell (Get-Content -LiteralPath <path>).Count):
- C:\...\MQL5\Experts\SRJ_FlowNexus_EA.mq5 | COUNT=3202 — supplied 3202 → MATCH
- C:\...\MQL5\Indicators\SRJ_FlowLogic.mq5 | COUNT=1180 — supplied 1180 → MATCH
- C:\...\MQL5\Include\SRJ\SRJ_State.mqh | COUNT=501 — supplied 501 → MATCH
- C:\...\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh | COUNT=1104 — no supplied value
- C:\...\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh | COUNT=532 — no supplied value
- C:\...\MQL5\Include\SRJ\SRJ_BiasEngine.mqh | COUNT=386 — no supplied value
- C:\...\MQL5\Include\SRJ\SRJ_Types.mqh | COUNT=355 — no supplied value
All three supplied comparisons return MATCH; a MISMATCH here would have been a DEVIATION, not a stop; none occurred. Recorded in CP\MANIFEST.txt.

Brace census (item 0.5; whole-file byte-level count of 0x7B and 0x7D via [System.IO.File]::ReadAllBytes, encoding-independent):
- C:\...\MQL5\Include\SRJ\SRJ_State.mqh | OPEN=7 | CLOSE=7
- C:\...\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh | OPEN=121 | CLOSE=121
- C:\...\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh | OPEN=56 | CLOSE=56
- C:\...\MQL5\Include\SRJ\SRJ_BiasEngine.mqh | OPEN=34 | CLOSE=34
- C:\...\MQL5\Indicators\SRJ_FlowLogic.mq5 | OPEN=70 | CLOSE=70

CAPTURE CONVENTION: every pasted source line below is reproduced exactly as emitted by the shell command that read it, in the form <line number> | COL <column> | <<line text>>. The angle brackets are capture delimiters of the command output, not source characters; the text between them is the line verbatim (leading and trailing spaces preserved inside them). COLUMN is per D3 (1-based index of the first character that is neither a space nor a tab; NONE for an empty line or a line of only spaces and tabs). The six D5 window pastes were emitted by shell command directly into this report from the canonical file reads (no line retyped).

Item 1.1: SRJ_FlowLogic.mq5 — 29 lines verbatim with columns:
8 | COL 1 | <#property indicator_buffers 34  // [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId).>
9 | COL 1 | <#property indicator_plots   2>
117 | COL 1 | <double g_bufXobPromoTime[];>
118 | COL NONE | <>
617 | COL 4 | <   SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);>
618 | COL NONE | <>
664 | COL 4 | <   ArraySetAsSeries(g_bufXobPromoTime, false);>
665 | COL NONE | <>
746 | COL 4 | <   if(prevCalc == 0)>
747 | COL 6 | <     {>
753 | COL 7 | <      ArrayInitialize(g_bufOBValid,      EMPTY_VALUE);>
793 | COL 7 | <      ArrayInitialize(g_bufXobObjId, 0.0);>
797 | COL 7 | <      ArrayInitialize(g_bufXobPromoTime, 0.0);>
798 | COL NONE | <>
799 | COL 7 | <      SRJ_DeleteAllObjects();      >
800 | COL 7 | <      SRJ_StateInit();             >
819 | COL 4 | <   for(int i = start; i < rates_total; i++)>
866 | COL 7 | <      SRJ_Bias_WeakFlipLatchPass();>
888 | COL 7 | <      SRJ_OB_PruningPass(withinLookbackWindow);>
889 | COL 7 | <      SRJ_FVG_PruningPass(withinLookbackWindow);>
898 | COL 7 | <      int target = i - 1;>
899 | COL 7 | <      if(target >= 0)>
900 | COL 9 | <        {>
902 | COL 10 | <         g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;>
903 | COL 10 | <         g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;>
904 | COL 10 | <         g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;>
905 | COL NONE | <         >
954 | COL 10 | <         g_bufXobObjId[target]    = 0.0;   // [Task 102] 0 = no object selected>
966 | COL 19 | <                  g_bufXobObjId[target]    = (double)xob.objId;   // [Task 102]>
Checks:
(a) 117 STRIPPED <double g_bufXobPromoTime[];> ends in a semicolon — PASS. 617 STRIPPED <SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);> ends in a semicolon — PASS. 664 STRIPPED <ArraySetAsSeries(g_bufXobPromoTime, false);> ends in a semicolon — PASS. 797 STRIPPED <ArrayInitialize(g_bufXobPromoTime, 0.0);> ends in a semicolon — PASS.
(b) 746 contains the whole token if (column 4) and the whole token prevCalc (column 7) — PASS.
(c) 800 contains the whole token SRJ_StateInit (column 7) — PASS.
(d) 819 contains the whole token for (column 4) — PASS.
(e) 900 STRIPPED <{> is a single open-brace character and nothing else — PASS.

Item 1.2: SRJ_State.mqh — 14 lines verbatim with columns:
96 | COL 1 | <struct SState>
97 | COL 3 | <  {>
126 | COL 4 | <   bool     tickOBIsValid;>
127 | COL 4 | <   bool     tickFVGIsValid;>
128 | COL 4 | <   bool     hasPersistedOpposingFVG;>
245 | COL 4 | <   string   mtfBoxName;>
246 | COL 4 | <   string   dataWarningName;>
247 | COL 3 | <  };>
249 | COL 1 | <SState g_s;>
326 | COL 4 | <   g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]>
327 | COL 4 | <   g_s.tickOBIsValid                  = true;>
328 | COL 4 | <   g_s.tickFVGIsValid                 = true;>
329 | COL 4 | <   g_s.hasPersistedOpposingFVG        = false;>
330 | COL 4 | <   g_s.inBiasOBInvalidationCount      = 0;>
Checks:
(a) 246 STRIPPED <string   dataWarningName;> ends in a semicolon — PASS.
(b) 247 STRIPPED <};> is a close-brace character followed by a semicolon — PASS.
(c) 327 contains the whole token tickOBIsValid (column 8) — PASS.

Item 1.3: SRJ_OrderblockMgr.mqh — line 89 and every line 156 through 180 inclusive, verbatim with columns:
89 | COL 1 | <bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,>
156 | COL 19 | <                  " refT=", SRJ_BarTimeStr(countReferenceBar),>
157 | COL 19 | <                  " refOk=", (refOk ? 1 : 0),>
158 | COL 19 | <                  " sameBarValInv=", (sameBarValInv ? 1 : 0));>
159 | COL NONE | <>
160 | COL 10 | <         if(refOk)>
161 | COL 12 | <           {>
162 | COL 13 | <            // Append to history arrays (unified with Fix 1.3)>
163 | COL 13 | <            if(ob.isBullish)>
164 | COL 16 | <               g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar>
165 | COL 13 | <            else>
166 | COL 16 | <               g_bearishInvalidationBarsHistory.Add(discoveryBar);>
167 | COL NONE | <>
168 | COL 13 | <            bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
169 | COL 29 | <                            (g_s.currentBias=="bearish" && !ob.isBullish);>
170 | COL 13 | <            if(isInBias)>
171 | COL 16 | <               g_s.tickOBIsValid = false;>
172 | COL 13 | <            else>
173 | COL 16 | <               g_s.tickOBIsValid = true;>
174 | COL NONE | <>
175 | COL 13 | <            // Counter updates attributed to discovery bar for SRJ_OB_CounterAggregationPass to see>
176 | COL 13 | <            if(ob.isBullish)>
177 | COL 15 | <              {>
178 | COL 19 | <                  if(SrjIsNa(g_s.firstBullishOBInvalidationBar))>
179 | COL 19 | <                  g_s.firstBullishOBInvalidationBar = discoveryBar;>
180 | COL 16 | <               g_s.lastBullishOBInvalidationBar = discoveryBar;>

Item 1.4: SRJ_OrderblockMgr.mqh — every line 520 through 545 inclusive, then the eight named lines, verbatim with columns:
520 | COL 25 | <                        " refT=", SRJ_BarTimeStr(countReferenceBar),>
521 | COL 25 | <                        " refOk=", (refOk ? 1 : 0),>
522 | COL 25 | <                        " sameBarValInv=", (sameBarValInv ? 1 : 0));>
523 | COL NONE | <               >
524 | COL 16 | <               if(refOk)>
525 | COL 18 | <                 {>
526 | COL 19 | <                  // Append to history arrays when refOk passes>
527 | COL 19 | <                  if(ob.isBullish)>
528 | COL 22 | <                     g_bullishInvalidationBarsHistory.Add(i);>
529 | COL 19 | <                  else>
530 | COL 22 | <                     g_bearishInvalidationBarsHistory.Add(i);>
531 | COL NONE | <>
532 | COL 19 | <                  bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
533 | COL 35 | <                                  (g_s.currentBias=="bearish" && !ob.isBullish);>
534 | COL 19 | <                  if(isInBias)>
535 | COL 22 | <                     g_s.tickOBIsValid = false;>
536 | COL 19 | <                  else>
537 | COL 22 | <                     g_s.tickOBIsValid = true;>
538 | COL NONE | <>
539 | COL 19 | <                  if(ob.isBullish)>
540 | COL 21 | <                    {>
541 | COL 22 | <                     if(SrjIsNa(g_s.firstBullishOBInvalidationBar))>
542 | COL 25 | <                        g_s.firstBullishOBInvalidationBar = i;>
543 | COL 22 | <                     g_s.lastBullishOBInvalidationBar = i;>
544 | COL 22 | <                     g_s.bullishOBInvalidationsThisBar += 1;>
545 | COL 21 | <                    }>
Named lines:
413 | COL 1 | <void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],>
425 | COL 4 | <   for(int k = g_orderblocks.Total() - 1; k >= 0; k--)>
480 | COL 7 | <      if(barClosed)>
482 | COL 10 | <         if(ob.isActivated && ob.isValid)>
494 | COL 13 | <            if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard>
524 | COL 16 | <               if(refOk)>
570 | COL 6 | <     }>
571 | COL 3 | <  }>

Item 1.5: D5 applied with target line 171 in SRJ_OrderblockMgr.mqh.
Candidate header line number: 89
CANDIDATE IS 89
Candidate header line, verbatim with its COLUMN:
89 | COL 1 | <bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,>
Full D5 window — every line from the candidate (89) through 170 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read):
89 | COL 1 | <bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,>
90 | COL 42 | <                                         const double barHigh,>
91 | COL 42 | <                                         const double barLow,>
92 | COL 42 | <                                         const double barClose,>
93 | COL 42 | <                                         const int replayBar,>
94 | COL 42 | <                                         const int discoveryBar)>
95 | COL 3 | <  {>
96 | COL 4 | <   if(ob==NULL) return false;>
97 | COL NONE | <>
98 | COL 4 | <   bool didActivate = false;>
99 | COL 4 | <   bool didInvalidate = false;>
100 | COL NONE | <>
101 | COL 4 | <   // Activation test (same as SRJ_OB_ActivationInvalidationPass)>
102 | COL 4 | <   if(!ob.isActivated)>
103 | COL 6 | <     {>
104 | COL 7 | <      bool shouldActivate = false;>
105 | COL 7 | <      if(ob.isBullish)>
106 | COL 10 | <         shouldActivate = (barHigh > ob.high);>
107 | COL 7 | <      else>
108 | COL 10 | <         shouldActivate = (barLow < ob.low);>
109 | COL NONE | <>
110 | COL 7 | <      if(shouldActivate)>
111 | COL 9 | <        {>
112 | COL 10 | <         ob.isActivated   = true;>
113 | COL 10 | <         ob.isValid       = true;>
114 | COL 10 | <         ob.validationBar = replayBar;>
115 | COL 10 | <         didActivate      = true;>
116 | COL 9 | <        }>
117 | COL 6 | <     }>
118 | COL NONE | <>
119 | COL 4 | <   // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.>
120 | COL 4 | <   // If activation happened THIS bar (didActivate == true), skip invalidation entirely.>
121 | COL 4 | <   if(ob.isActivated && ob.isValid && !didActivate)>
122 | COL 6 | <     {>
123 | COL 7 | <      bool closedBeyondInvalidation = false;>
124 | COL 7 | <      if(ob.isBullish)>
125 | COL 10 | <         closedBeyondInvalidation = (barClose < ob.invalidationLevel);>
126 | COL 7 | <      else>
127 | COL 10 | <         closedBeyondInvalidation = (barClose > ob.invalidationLevel);>
128 | COL NONE | <>
129 | COL 7 | <      if(closedBeyondInvalidation)>
130 | COL 9 | <        {>
131 | COL 10 | <         ob.isValid         = false;>
132 | COL 10 | <         ob.invalidationBar = replayBar;>
133 | COL 10 | <         didInvalidate      = true;>
134 | COL NONE | <>
135 | COL 10 | <         int countReferenceBar = g_s.currentStructureStartBar;>
136 | COL 10 | <         bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);>
137 | COL 10 | <         bool refOk = !SrjIsNa(countReferenceBar) &&>
138 | COL 23 | <                      (ob.invalidationBar >= countReferenceBar) &&>
139 | COL 23 | <                      !SrjIsNa(ob.validationBar) &&>
140 | COL 23 | <                      !sameBarValInv;>
141 | COL NONE | <>
142 | COL 10 | <         if(SRJ_InDebugWindow(discoveryBar))>
143 | COL 13 | <            Print("SRJ INV t=", SRJ_BarTimeStr(discoveryBar),>
144 | COL 19 | <                  " bar=", discoveryBar,>
145 | COL 19 | <                  " source=replay",>
146 | COL 19 | <                  " evtBar=", replayBar,>
147 | COL 19 | <                  " evtBarT=", SRJ_BarTimeStr(replayBar),>
148 | COL 19 | <                  " obStart=", ob.startBar,>
149 | COL 19 | <                  " obStartT=", SRJ_BarTimeStr(ob.startBar),>
150 | COL 19 | <                  " obVal=", ob.validationBar,>
151 | COL 19 | <                  " obInv=", ob.invalidationBar,>
152 | COL 19 | <                  " obCreation=", ob.creationBar,  // NEW>
153 | COL 19 | <                  " isBull=", (ob.isBullish ? 1 : 0),>
154 | COL 19 | <                  " bias=", g_s.currentBias,>
155 | COL 19 | <                  " ref=", countReferenceBar,>
156 | COL 19 | <                  " refT=", SRJ_BarTimeStr(countReferenceBar),>
157 | COL 19 | <                  " refOk=", (refOk ? 1 : 0),>
158 | COL 19 | <                  " sameBarValInv=", (sameBarValInv ? 1 : 0));>
159 | COL NONE | <>
160 | COL 10 | <         if(refOk)>
161 | COL 12 | <           {>
162 | COL 13 | <            // Append to history arrays (unified with Fix 1.3)>
163 | COL 13 | <            if(ob.isBullish)>
164 | COL 16 | <               g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar>
165 | COL 13 | <            else>
166 | COL 16 | <               g_bearishInvalidationBarsHistory.Add(discoveryBar);>
167 | COL NONE | <>
168 | COL 13 | <            bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
169 | COL 29 | <                            (g_s.currentBias=="bearish" && !ob.isBullish);>
170 | COL 13 | <            if(isInBias)>

D4 applied to the candidate header (line 89), full parameter list in D4's report format:
PARAM LIST OPENS: line 89 col 41
PARAM LIST CLOSES: line 94 col 64
PARAMETER LIST TEXT: <COrderblock *ob,                                          const double barHigh,                                          const double barLow,                                          const double barClose,                                          const int replayBar,                                          const int discoveryBar>
1 | COrderblock *ob | ob
2 |                                           const double barHigh | barHigh
3 |                                           const double barLow | barLow
4 |                                           const double barClose | barClose
5 |                                           const int replayBar | replayBar
6 |                                           const int discoveryBar | discoveryBar
ARG COUNT 6
No additional parameter list arises: the candidate IS 89, so the form's "ALSO apply D4 to line 89" branch does not apply (the list above is line 89's list).
89 | COL 1 | <bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,>
90 | COL 42 | <                                         const double barHigh,>
91 | COL 42 | <                                         const double barLow,>
92 | COL 42 | <                                         const double barClose,>
93 | COL 42 | <                                         const int replayBar,>
94 | COL 42 | <                                         const int discoveryBar)>
95 | COL 3 | <  {>
96 | COL 4 | <   if(ob==NULL) return false;>
97 | COL NONE | <>
98 | COL 4 | <   bool didActivate = false;>
99 | COL 4 | <   bool didInvalidate = false;>
100 | COL NONE | <>
101 | COL 4 | <   // Activation test (same as SRJ_OB_ActivationInvalidationPass)>
102 | COL 4 | <   if(!ob.isActivated)>
103 | COL 6 | <     {>
104 | COL 7 | <      bool shouldActivate = false;>
105 | COL 7 | <      if(ob.isBullish)>
106 | COL 10 | <         shouldActivate = (barHigh > ob.high);>
107 | COL 7 | <      else>
108 | COL 10 | <         shouldActivate = (barLow < ob.low);>
109 | COL NONE | <>
110 | COL 7 | <      if(shouldActivate)>
111 | COL 9 | <        {>
112 | COL 10 | <         ob.isActivated   = true;>
113 | COL 10 | <         ob.isValid       = true;>
114 | COL 10 | <         ob.validationBar = replayBar;>
115 | COL 10 | <         didActivate      = true;>
116 | COL 9 | <        }>
117 | COL 6 | <     }>
118 | COL NONE | <>
119 | COL 4 | <   // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.>
120 | COL 4 | <   // If activation happened THIS bar (didActivate == true), skip invalidation entirely.>
121 | COL 4 | <   if(ob.isActivated && ob.isValid && !didActivate)>
122 | COL 6 | <     {>
123 | COL 7 | <      bool closedBeyondInvalidation = false;>
124 | COL 7 | <      if(ob.isBullish)>
125 | COL 10 | <         closedBeyondInvalidation = (barClose < ob.invalidationLevel);>
126 | COL 7 | <      else>
127 | COL 10 | <         closedBeyondInvalidation = (barClose > ob.invalidationLevel);>
128 | COL NONE | <>
129 | COL 7 | <      if(closedBeyondInvalidation)>
130 | COL 9 | <        {>
131 | COL 10 | <         ob.isValid         = false;>
132 | COL 10 | <         ob.invalidationBar = replayBar;>
133 | COL 10 | <         didInvalidate      = true;>
134 | COL NONE | <>
135 | COL 10 | <         int countReferenceBar = g_s.currentStructureStartBar;>
136 | COL 10 | <         bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);>
137 | COL 10 | <         bool refOk = !SrjIsNa(countReferenceBar) &&>
138 | COL 23 | <                      (ob.invalidationBar >= countReferenceBar) &&>
139 | COL 23 | <                      !SrjIsNa(ob.validationBar) &&>
140 | COL 23 | <                      !sameBarValInv;>
141 | COL NONE | <>
142 | COL 10 | <         if(SRJ_InDebugWindow(discoveryBar))>
143 | COL 13 | <            Print("SRJ INV t=", SRJ_BarTimeStr(discoveryBar),>
144 | COL 19 | <                  " bar=", discoveryBar,>
145 | COL 19 | <                  " source=replay",>
146 | COL 19 | <                  " evtBar=", replayBar,>
147 | COL 19 | <                  " evtBarT=", SRJ_BarTimeStr(replayBar),>
148 | COL 19 | <                  " obStart=", ob.startBar,>
149 | COL 19 | <                  " obStartT=", SRJ_BarTimeStr(ob.startBar),>
150 | COL 19 | <                  " obVal=", ob.validationBar,>
151 | COL 19 | <                  " obInv=", ob.invalidationBar,>
152 | COL 19 | <                  " obCreation=", ob.creationBar,  // NEW>
153 | COL 19 | <                  " isBull=", (ob.isBullish ? 1 : 0),>
154 | COL 19 | <                  " bias=", g_s.currentBias,>
155 | COL 19 | <                  " ref=", countReferenceBar,>
156 | COL 19 | <                  " refT=", SRJ_BarTimeStr(countReferenceBar),>
157 | COL 19 | <                  " refOk=", (refOk ? 1 : 0),>
158 | COL 19 | <                  " sameBarValInv=", (sameBarValInv ? 1 : 0));>
159 | COL NONE | <>
160 | COL 10 | <         if(refOk)>
161 | COL 12 | <           {>
162 | COL 13 | <            // Append to history arrays (unified with Fix 1.3)>
163 | COL 13 | <            if(ob.isBullish)>
164 | COL 16 | <               g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar>
165 | COL 13 | <            else>
166 | COL 16 | <               g_bearishInvalidationBarsHistory.Add(discoveryBar);>
167 | COL NONE | <>
168 | COL 13 | <            bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
169 | COL 29 | <                            (g_s.currentBias=="bearish" && !ob.isBullish);>
170 | COL 13 | <            if(isInBias)>


Item 1.6: D5 applied with target line 535 in SRJ_OrderblockMgr.mqh.
Candidate header line number: 413
CANDIDATE IS 413
Candidate header line, verbatim with its COLUMN:
413 | COL 1 | <void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],>
Full D5 window — every line from the candidate (413) through 534 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read):
413 | COL 1 | <void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],>
414 | COL 40 | <                                       const double &low[],const double &close[],>
415 | COL 40 | <                                       const datetime &time[],int rates_total,int i,>
416 | COL 40 | <                                       bool withinLookbackWindow,bool barClosed)>
417 | COL 3 | <  {>
418 | COL 4 | <   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))>
419 | COL 7 | <      return;>
420 | COL NONE | <>
421 | COL 4 | <   double liveHigh  = high[i];>
422 | COL 4 | <   double liveLow   = low[i];>
423 | COL 4 | <   double liveClose = close[i];>
424 | COL NONE | <>
425 | COL 4 | <   for(int k = g_orderblocks.Total() - 1; k >= 0; k--)>
426 | COL 6 | <     {>
427 | COL 7 | <      COrderblock *ob = GetOB(g_orderblocks,k);>
428 | COL 7 | <      if(ob==NULL) continue;>
429 | COL NONE | <>
430 | COL 7 | <      if(!ob.isActivated)>
431 | COL 9 | <        {>
432 | COL 10 | <         bool shouldActivate = false;>
433 | COL 10 | <         if(ob.isBullish)>
434 | COL 13 | <            shouldActivate = (liveHigh > ob.high);>
435 | COL 10 | <         else>
436 | COL 13 | <            shouldActivate = (liveLow < ob.low);>
437 | COL NONE | <>
438 | COL 10 | <         if(shouldActivate)>
439 | COL 12 | <           {>
440 | COL 13 | <            ob.isActivated   = true;>
441 | COL 13 | <            ob.isValid       = true;>
442 | COL 13 | <            ob.validationBar = i;>
443 | COL NONE | <>
444 | COL 13 | <            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }>
445 | COL 13 | <            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }>
446 | COL NONE | <>
447 | COL 13 | <            int safeX1 = (int)MathMax(ob.startBar, i - 4500);>
448 | COL 13 | <            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);>
449 | COL NONE | <>
450 | COL 13 | <            if(ob.isBullish && g_showValidBullishOB)>
451 | COL 15 | <              {>
452 | COL 16 | <               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,>
453 | COL 37 | <                                    safeX1,ob.high,safeX2,ob.high,>
454 | COL 37 | <                                    g_bullishOBColor,g_lineThickness,>
455 | COL 37 | <                                    SRJ_STYLE_SOLID,g_extendValid);>
456 | COL 16 | <               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,>
457 | COL 37 | <                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,>
458 | COL 37 | <                                    g_validMidlineColor,g_lineThickness,>
459 | COL 37 | <                                    SRJ_STYLE_DOTTED,g_extendValid);>
460 | COL 15 | <              }>
461 | COL 13 | <            else if(!ob.isBullish && g_showValidBearishOB)>
462 | COL 15 | <              {>
463 | COL 16 | <               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,>
464 | COL 37 | <                                    safeX1,ob.low,safeX2,ob.low,>
465 | COL 37 | <                                    g_bearishOBColor,g_lineThickness,>
466 | COL 37 | <                                    SRJ_STYLE_SOLID,g_extendValid);>
467 | COL 16 | <               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,>
468 | COL 37 | <                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,>
469 | COL 37 | <                                    g_validMidlineColor,g_lineThickness,>
470 | COL 37 | <                                    SRJ_STYLE_DOTTED,g_extendValid);>
471 | COL 15 | <              }>
472 | COL 13 | <            else>
473 | COL 15 | <              {>
474 | COL 16 | <               ob.obLineName  = "";>
475 | COL 16 | <               ob.midLineName = "";>
476 | COL 15 | <              }>
477 | COL 12 | <           }>
478 | COL 9 | <        }>
479 | COL NONE | <>
480 | COL 7 | <      if(barClosed)>
481 | COL 9 | <        {>
482 | COL 10 | <         if(ob.isActivated && ob.isValid)>
483 | COL 12 | <           {>
484 | COL 13 | <            bool closedBeyondInvalidation = false;>
485 | COL 13 | <            if(ob.isBullish)>
486 | COL 16 | <               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);>
487 | COL 13 | <            else>
488 | COL 16 | <               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);>
489 | COL NONE | <>
490 | COL 13 | <            // CRITICAL FIX: Check temporal rules BEFORE changing any state>
491 | COL 13 | <            bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);>
492 | COL 13 | <            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW>
493 | COL NONE | <>
494 | COL 13 | <            if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard>
495 | COL 15 | <              {>
496 | COL 16 | <               ob.isValid         = false;>
497 | COL 16 | <               ob.invalidationBar = i;>
498 | COL NONE | <>
499 | COL 16 | <               int countReferenceBar = g_s.currentStructureStartBar;>
500 | COL NONE | <               >
501 | COL 16 | <               // This check is now redundant (will never be true) but kept for safety>
502 | COL 16 | <               bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);>
503 | COL NONE | <               >
504 | COL 16 | <               bool refOk = !SrjIsNa(countReferenceBar) &&>
505 | COL 29 | <                            (ob.invalidationBar >= countReferenceBar) &&>
506 | COL 29 | <                            !SrjIsNa(ob.validationBar) &&>
507 | COL 29 | <                            !sameBarValInv;>
508 | COL NONE | <               >
509 | COL 16 | <               if(SRJ_InDebugWindow(i))>
510 | COL 19 | <                  Print("SRJ INV t=", SRJ_BarTimeStr(i),>
511 | COL 25 | <                        " bar=", i,>
512 | COL 25 | <                        " obStart=", ob.startBar,>
513 | COL 25 | <                        " obStartT=", SRJ_BarTimeStr(ob.startBar),>
514 | COL 25 | <                        " obVal=", ob.validationBar,>
515 | COL 25 | <                        " obInv=", ob.invalidationBar,>
516 | COL 25 | <                        " obCreation=", ob.creationBar,  // NEW debug output>
517 | COL 25 | <                        " isBull=", (ob.isBullish ? 1 : 0),>
518 | COL 25 | <                        " bias=", g_s.currentBias,>
519 | COL 25 | <                        " ref=", countReferenceBar,>
520 | COL 25 | <                        " refT=", SRJ_BarTimeStr(countReferenceBar),>
521 | COL 25 | <                        " refOk=", (refOk ? 1 : 0),>
522 | COL 25 | <                        " sameBarValInv=", (sameBarValInv ? 1 : 0));>
523 | COL NONE | <               >
524 | COL 16 | <               if(refOk)>
525 | COL 18 | <                 {>
526 | COL 19 | <                  // Append to history arrays when refOk passes>
527 | COL 19 | <                  if(ob.isBullish)>
528 | COL 22 | <                     g_bullishInvalidationBarsHistory.Add(i);>
529 | COL 19 | <                  else>
530 | COL 22 | <                     g_bearishInvalidationBarsHistory.Add(i);>
531 | COL NONE | <>
532 | COL 19 | <                  bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
533 | COL 35 | <                                  (g_s.currentBias=="bearish" && !ob.isBullish);>
534 | COL 19 | <                  if(isInBias)>

D4 applied to the candidate header (line 413), full parameter list in D4's report format:
PARAM LIST OPENS: line 413 col 39
PARAM LIST CLOSES: line 416 col 80
PARAMETER LIST TEXT: <const double &open[],const double &high[],                                        const double &low[],const double &close[],                                        const datetime &time[],int rates_total,int i,                                        bool withinLookbackWindow,bool barClosed>
1 | const double &open[] | open
2 | const double &high[] | high
3 |                                         const double &low[] | low
4 | const double &close[] | close
5 |                                         const datetime &time[] | time
6 | int rates_total | rates_total
7 | int i | i
8 |                                         bool withinLookbackWindow | withinLookbackWindow
9 | bool barClosed | barClosed
ARG COUNT 9
No additional parameter list arises: the candidate IS 413, so the form's "ALSO apply D4 to line 413" branch does not apply (the list above is line 413's list).
413 | COL 1 | <void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],>
414 | COL 40 | <                                       const double &low[],const double &close[],>
415 | COL 40 | <                                       const datetime &time[],int rates_total,int i,>
416 | COL 40 | <                                       bool withinLookbackWindow,bool barClosed)>
417 | COL 3 | <  {>
418 | COL 4 | <   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))>
419 | COL 7 | <      return;>
420 | COL NONE | <>
421 | COL 4 | <   double liveHigh  = high[i];>
422 | COL 4 | <   double liveLow   = low[i];>
423 | COL 4 | <   double liveClose = close[i];>
424 | COL NONE | <>
425 | COL 4 | <   for(int k = g_orderblocks.Total() - 1; k >= 0; k--)>
426 | COL 6 | <     {>
427 | COL 7 | <      COrderblock *ob = GetOB(g_orderblocks,k);>
428 | COL 7 | <      if(ob==NULL) continue;>
429 | COL NONE | <>
430 | COL 7 | <      if(!ob.isActivated)>
431 | COL 9 | <        {>
432 | COL 10 | <         bool shouldActivate = false;>
433 | COL 10 | <         if(ob.isBullish)>
434 | COL 13 | <            shouldActivate = (liveHigh > ob.high);>
435 | COL 10 | <         else>
436 | COL 13 | <            shouldActivate = (liveLow < ob.low);>
437 | COL NONE | <>
438 | COL 10 | <         if(shouldActivate)>
439 | COL 12 | <           {>
440 | COL 13 | <            ob.isActivated   = true;>
441 | COL 13 | <            ob.isValid       = true;>
442 | COL 13 | <            ob.validationBar = i;>
443 | COL NONE | <>
444 | COL 13 | <            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }>
445 | COL 13 | <            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }>
446 | COL NONE | <>
447 | COL 13 | <            int safeX1 = (int)MathMax(ob.startBar, i - 4500);>
448 | COL 13 | <            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);>
449 | COL NONE | <>
450 | COL 13 | <            if(ob.isBullish && g_showValidBullishOB)>
451 | COL 15 | <              {>
452 | COL 16 | <               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,>
453 | COL 37 | <                                    safeX1,ob.high,safeX2,ob.high,>
454 | COL 37 | <                                    g_bullishOBColor,g_lineThickness,>
455 | COL 37 | <                                    SRJ_STYLE_SOLID,g_extendValid);>
456 | COL 16 | <               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,>
457 | COL 37 | <                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,>
458 | COL 37 | <                                    g_validMidlineColor,g_lineThickness,>
459 | COL 37 | <                                    SRJ_STYLE_DOTTED,g_extendValid);>
460 | COL 15 | <              }>
461 | COL 13 | <            else if(!ob.isBullish && g_showValidBearishOB)>
462 | COL 15 | <              {>
463 | COL 16 | <               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,>
464 | COL 37 | <                                    safeX1,ob.low,safeX2,ob.low,>
465 | COL 37 | <                                    g_bearishOBColor,g_lineThickness,>
466 | COL 37 | <                                    SRJ_STYLE_SOLID,g_extendValid);>
467 | COL 16 | <               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,>
468 | COL 37 | <                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,>
469 | COL 37 | <                                    g_validMidlineColor,g_lineThickness,>
470 | COL 37 | <                                    SRJ_STYLE_DOTTED,g_extendValid);>
471 | COL 15 | <              }>
472 | COL 13 | <            else>
473 | COL 15 | <              {>
474 | COL 16 | <               ob.obLineName  = "";>
475 | COL 16 | <               ob.midLineName = "";>
476 | COL 15 | <              }>
477 | COL 12 | <           }>
478 | COL 9 | <        }>
479 | COL NONE | <>
480 | COL 7 | <      if(barClosed)>
481 | COL 9 | <        {>
482 | COL 10 | <         if(ob.isActivated && ob.isValid)>
483 | COL 12 | <           {>
484 | COL 13 | <            bool closedBeyondInvalidation = false;>
485 | COL 13 | <            if(ob.isBullish)>
486 | COL 16 | <               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);>
487 | COL 13 | <            else>
488 | COL 16 | <               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);>
489 | COL NONE | <>
490 | COL 13 | <            // CRITICAL FIX: Check temporal rules BEFORE changing any state>
491 | COL 13 | <            bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);>
492 | COL 13 | <            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW>
493 | COL NONE | <>
494 | COL 13 | <            if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard>
495 | COL 15 | <              {>
496 | COL 16 | <               ob.isValid         = false;>
497 | COL 16 | <               ob.invalidationBar = i;>
498 | COL NONE | <>
499 | COL 16 | <               int countReferenceBar = g_s.currentStructureStartBar;>
500 | COL NONE | <               >
501 | COL 16 | <               // This check is now redundant (will never be true) but kept for safety>
502 | COL 16 | <               bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);>
503 | COL NONE | <               >
504 | COL 16 | <               bool refOk = !SrjIsNa(countReferenceBar) &&>
505 | COL 29 | <                            (ob.invalidationBar >= countReferenceBar) &&>
506 | COL 29 | <                            !SrjIsNa(ob.validationBar) &&>
507 | COL 29 | <                            !sameBarValInv;>
508 | COL NONE | <               >
509 | COL 16 | <               if(SRJ_InDebugWindow(i))>
510 | COL 19 | <                  Print("SRJ INV t=", SRJ_BarTimeStr(i),>
511 | COL 25 | <                        " bar=", i,>
512 | COL 25 | <                        " obStart=", ob.startBar,>
513 | COL 25 | <                        " obStartT=", SRJ_BarTimeStr(ob.startBar),>
514 | COL 25 | <                        " obVal=", ob.validationBar,>
515 | COL 25 | <                        " obInv=", ob.invalidationBar,>
516 | COL 25 | <                        " obCreation=", ob.creationBar,  // NEW debug output>
517 | COL 25 | <                        " isBull=", (ob.isBullish ? 1 : 0),>
518 | COL 25 | <                        " bias=", g_s.currentBias,>
519 | COL 25 | <                        " ref=", countReferenceBar,>
520 | COL 25 | <                        " refT=", SRJ_BarTimeStr(countReferenceBar),>
521 | COL 25 | <                        " refOk=", (refOk ? 1 : 0),>
522 | COL 25 | <                        " sameBarValInv=", (sameBarValInv ? 1 : 0));>
523 | COL NONE | <               >
524 | COL 16 | <               if(refOk)>
525 | COL 18 | <                 {>
526 | COL 19 | <                  // Append to history arrays when refOk passes>
527 | COL 19 | <                  if(ob.isBullish)>
528 | COL 22 | <                     g_bullishInvalidationBarsHistory.Add(i);>
529 | COL 19 | <                  else>
530 | COL 22 | <                     g_bearishInvalidationBarsHistory.Add(i);>
531 | COL NONE | <>
532 | COL 19 | <                  bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||>
533 | COL 35 | <                                  (g_s.currentBias=="bearish" && !ob.isBullish);>
534 | COL 19 | <                  if(isInBias)>


Item 1.7: SRJ_ImbalanceMgr.mqh — every line 205 through 213 inclusive, then every line 322 through 330 inclusive, verbatim with columns:
Span 205–213:
205 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
206 | COL 16 | <               g_s.obInvalidationBoundary = i;>
207 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
208 | COL NONE | <>
209 | COL 16 | <               g_s.tickOBIsValid                 = true;>
210 | COL 16 | <               g_s.tickFVGIsValid                = true;>
211 | COL 16 | <               // Selective reset: bullish bias renewal zeros bearish (opposing) counter only>
212 | COL 16 | <               g_s.bearishOBInvalidationCount    = 0;>
213 | COL 16 | <               g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;>
Span 322–330:
322 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
323 | COL 16 | <               g_s.obInvalidationBoundary = i;>
324 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
325 | COL NONE | <>
326 | COL 16 | <               g_s.tickOBIsValid                 = true;>
327 | COL 16 | <               g_s.tickFVGIsValid                = true;>
328 | COL 16 | <               // Selective reset: bearish bias renewal zeros bullish (opposing) counter only>
329 | COL 16 | <               g_s.bullishOBInvalidationCount    = 0;>
330 | COL 16 | <               g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;>
Token checks:
Line 209 contains the whole token tickOBIsValid: YES (one whole-token match, at column 20).
Line 326 contains the whole token tickOBIsValid: YES (one whole-token match, at column 20).

Item 1.8: D5 applied with target line 209 in SRJ_ImbalanceMgr.mqh, then repeated completely with target line 326.
TARGET 209:
Candidate header line number: 108
Candidate header line, verbatim with its COLUMN:
108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
Full D5 window — every line from the candidate (108) through 208 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read):
108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
109 | COL 34 | <                                 const datetime &time[],int rates_total,int i,>
110 | COL 34 | <                                 bool withinLookbackWindow,bool barClosed)>
111 | COL 3 | <  {>
112 | COL 4 | <   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))>
113 | COL 7 | <      return;>
114 | COL NONE | <>
115 | COL 4 | <   if(low[i] > srjH(high,i,2))>
116 | COL 6 | <     {>
117 | COL 7 | <      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,>
118 | COL 34 | <                                 true,i - 2,low[i],srjH(high,i,2),i);>
119 | COL 7 | <      g_imbalances.Add(newBullFVG);>
120 | COL NONE | <>
121 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
122 | COL 7 | <      if(fvgWithinStructure)>
123 | COL 9 | <        {>
124 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bullish");>
125 | COL 10 | <         if(isInBiasFVG)>
126 | COL 12 | <           {>
127 | COL 13 | <            g_s.tickFVGIsValid = true;>
128 | COL NONE | <>
129 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
130 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
131 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
132 | COL 13 | <            bool hasNewOB     = false;>
133 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
134 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
135 | COL 13 | <            bool scanIsNew    = false;>
136 | COL 13 | <            COrderblock *renewalOB = NULL;>
137 | COL NONE | <>
138 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);>
139 | COL 13 | <            if(nearestIdx > -1)>
140 | COL 15 | <              {>
141 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
142 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
143 | COL 18 | <                 {>
144 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
145 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
146 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
147 | COL 19 | <                  if(scanIsNew)>
148 | COL 21 | <                    {>
149 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
150 | COL 22 | <                     hasNewOB              = true;>
151 | COL 22 | <                     renewalOB             = nearestOB;>
152 | COL 21 | <                    }>
153 | COL 18 | <                 }>
154 | COL 15 | <              }>
155 | COL NONE | <>
156 | COL 13 | <            if(SRJ_InDebugWindow(i))>
157 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
158 | COL 22 | <                     " dir=bullish",>
159 | COL 22 | <                     " nearestIdx=", nearestIdx,>
160 | COL 22 | <                     " obStart=", scanStartBar,>
161 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
162 | COL 22 | <                     " obVal=", scanValBar,>
163 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
164 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
165 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
166 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
167 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
168 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
169 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
170 | COL NONE | <>
171 | COL 13 | <            if(nearestIdx < 0)>
172 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);>
173 | COL NONE | <>
174 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
175 | COL 15 | <              {>
176 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
177 | COL 16 | <               if(g_htfDebugLog &&>
178 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
179 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
180 | COL 25 | <                        " dir=", g_s.currentBias,>
181 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
182 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
183 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
184 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
185 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
186 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
187 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
188 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
189 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
190 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
191 | COL 25 | <                        " resetOn=true");>
192 | COL 16 | <               // ------------------------------>
193 | COL NONE | <>
194 | COL 16 | <               g_s.isDoubleOB = false;>
195 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
196 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
197 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
198 | COL 16 | <               g_s.renewalDirection = "bullish";>
199 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
200 | COL NONE | <               >
201 | COL 16 | <               g_s.bullishStructureRenewalAlert = true;>
202 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
203 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);>
204 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
205 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
206 | COL 16 | <               g_s.obInvalidationBoundary = i;>
207 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
208 | COL NONE | <>

D4 applied to the candidate header (line 108), full parameter list in D4's report format:
PARAM LIST OPENS: line 108 col 33
PARAM LIST CLOSES: line 110 col 74
PARAMETER LIST TEXT: <const double &high[],const double &low[],                                  const datetime &time[],int rates_total,int i,                                  bool withinLookbackWindow,bool barClosed>
1 | const double &high[] | high
2 | const double &low[] | low
3 |                                   const datetime &time[] | time
4 | int rates_total | rates_total
5 | int i | i
6 |                                   bool withinLookbackWindow | withinLookbackWindow
7 | bool barClosed | barClosed
ARG COUNT 7
TARGET 326:
Candidate header line number: 108
Candidate header line, verbatim with its COLUMN:
108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
Full D5 window — every line from the candidate (108) through 325 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read; captured in three shell passes, lines 108-170, 171-267, 268-325):
108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
109 | COL 34 | <                                 const datetime &time[],int rates_total,int i,>
110 | COL 34 | <                                 bool withinLookbackWindow,bool barClosed)>
111 | COL 3 | <  {>
112 | COL 4 | <   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))>
113 | COL 7 | <      return;>
114 | COL NONE | <>
115 | COL 4 | <   if(low[i] > srjH(high,i,2))>
116 | COL 6 | <     {>
117 | COL 7 | <      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,>
118 | COL 34 | <                                 true,i - 2,low[i],srjH(high,i,2),i);>
119 | COL 7 | <      g_imbalances.Add(newBullFVG);>
120 | COL NONE | <>
121 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
122 | COL 7 | <      if(fvgWithinStructure)>
123 | COL 9 | <        {>
124 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bullish");>
125 | COL 10 | <         if(isInBiasFVG)>
126 | COL 12 | <           {>
127 | COL 13 | <            g_s.tickFVGIsValid = true;>
128 | COL NONE | <>
129 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
130 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
131 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
132 | COL 13 | <            bool hasNewOB     = false;>
133 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
134 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
135 | COL 13 | <            bool scanIsNew    = false;>
136 | COL 13 | <            COrderblock *renewalOB = NULL;>
137 | COL NONE | <>
138 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);>
139 | COL 13 | <            if(nearestIdx > -1)>
140 | COL 15 | <              {>
141 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
142 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
143 | COL 18 | <                 {>
144 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
145 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
146 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
147 | COL 19 | <                  if(scanIsNew)>
148 | COL 21 | <                    {>
149 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
150 | COL 22 | <                     hasNewOB              = true;>
151 | COL 22 | <                     renewalOB             = nearestOB;>
152 | COL 21 | <                    }>
153 | COL 18 | <                 }>
154 | COL 15 | <              }>
155 | COL NONE | <>
156 | COL 13 | <            if(SRJ_InDebugWindow(i))>
157 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
158 | COL 22 | <                     " dir=bullish",>
159 | COL 22 | <                     " nearestIdx=", nearestIdx,>
160 | COL 22 | <                     " obStart=", scanStartBar,>
161 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
162 | COL 22 | <                     " obVal=", scanValBar,>
163 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
164 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
165 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
166 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
167 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
168 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
169 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
170 | COL NONE | <>
171 | COL 13 | <            if(nearestIdx < 0)>
172 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);>
173 | COL NONE | <>
174 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
175 | COL 15 | <              {>
176 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
177 | COL 16 | <               if(g_htfDebugLog &&>
178 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
179 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
180 | COL 25 | <                        " dir=", g_s.currentBias,>
181 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
182 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
183 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
184 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
185 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
186 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
187 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
188 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
189 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
190 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
191 | COL 25 | <                        " resetOn=true");>
192 | COL 16 | <               // ------------------------------>
193 | COL NONE | <>
194 | COL 16 | <               g_s.isDoubleOB = false;>
195 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
196 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
197 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
198 | COL 16 | <               g_s.renewalDirection = "bullish";>
199 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
200 | COL NONE | <               >
201 | COL 16 | <               g_s.bullishStructureRenewalAlert = true;>
202 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
203 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);>
204 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
205 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
206 | COL 16 | <               g_s.obInvalidationBoundary = i;>
207 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
208 | COL NONE | <>
209 | COL 16 | <               g_s.tickOBIsValid                 = true;>
210 | COL 16 | <               g_s.tickFVGIsValid                = true;>
211 | COL 16 | <               // Selective reset: bullish bias renewal zeros bearish (opposing) counter only>
212 | COL 16 | <               g_s.bearishOBInvalidationCount    = 0;>
213 | COL 16 | <               g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;>
214 | COL 16 | <               g_s.checklistActivated            = false;>
215 | COL NONE | <                 >
216 | COL 16 | <               if(g_htfDebugLog)>
217 | COL 19 | <                  Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,>
218 | COL 25 | <                        " kind=fvgRenewal",>
219 | COL 25 | <                        " bias=", g_s.currentBias,>
220 | COL 25 | <                        " resetOn=true");>
221 | COL 15 | <              }>
222 | COL 12 | <           }>
223 | COL 10 | <         else>
224 | COL 12 | <           {>
225 | COL 13 | <            // Opposing FVG under a bearish bias.>
226 | COL 13 | <            g_s.hasPersistedOpposingFVG = true;>
227 | COL 13 | <            SRJ_QueueOpposingPromotion(i,"bullish");>
228 | COL 12 | <           }>
229 | COL 9 | <        }>
230 | COL 6 | <     }>
231 | COL NONE | <>
232 | COL 4 | <   if(high[i] < srjL(low,i,2))>
233 | COL 6 | <     {>
234 | COL 7 | <      CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,>
235 | COL 34 | <                                 false,i - 2,srjL(low,i,2),high[i],i);>
236 | COL 7 | <      g_imbalances.Add(newBearFVG);>
237 | COL NONE | <>
238 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
239 | COL 7 | <      if(fvgWithinStructure)>
240 | COL 9 | <        {>
241 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bearish");>
242 | COL 10 | <         if(isInBiasFVG)>
243 | COL 12 | <           {>
244 | COL 13 | <            g_s.tickFVGIsValid = true;>
245 | COL NONE | <>
246 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
247 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
248 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
249 | COL 13 | <            bool hasNewOB     = false;>
250 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
251 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
252 | COL 13 | <            bool scanIsNew    = false;>
253 | COL 13 | <            COrderblock *renewalOB = NULL;>
254 | COL NONE | <>
255 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bearish",g_s.obInvalidationBoundary);>
256 | COL 13 | <            if(nearestIdx > -1)>
257 | COL 15 | <              {>
258 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
259 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
260 | COL 18 | <                 {>
261 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
262 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
263 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
264 | COL 19 | <                  if(scanIsNew)>
265 | COL 21 | <                    {>
266 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
267 | COL 22 | <                     hasNewOB              = true;>
268 | COL 22 | <                     renewalOB             = nearestOB;>
269 | COL 21 | <                    }>
270 | COL 18 | <                 }>
271 | COL 15 | <              }>
272 | COL NONE | <>
273 | COL 13 | <            if(SRJ_InDebugWindow(i))>
274 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
275 | COL 22 | <                     " dir=bearish",>
276 | COL 22 | <                     " nearestIdx=", nearestIdx,>
277 | COL 22 | <                     " obStart=", scanStartBar,>
278 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
279 | COL 22 | <                     " obVal=", scanValBar,>
280 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
281 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
282 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
283 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
284 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
285 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
286 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
287 | COL NONE | <>
288 | COL 13 | <            if(nearestIdx < 0)>
289 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bearish",g_s.obInvalidationBoundary);>
290 | COL NONE | <>
291 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
292 | COL 15 | <              {>
293 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
294 | COL 16 | <               if(g_htfDebugLog &&>
295 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
296 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
297 | COL 25 | <                        " dir=", g_s.currentBias,>
298 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
299 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
300 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
301 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
302 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
303 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
304 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
305 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
306 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
307 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
308 | COL 25 | <                        " resetOn=true");>
309 | COL 16 | <               // ------------------------------>
310 | COL NONE | <>
311 | COL 16 | <               g_s.isDoubleOB = false;>
312 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
313 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
314 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
315 | COL 16 | <               g_s.renewalDirection = "bearish";>
316 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
317 | COL NONE | <               >
318 | COL 16 | <               g_s.bearishStructureRenewalAlert = true;>
319 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
320 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);>
321 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
322 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
323 | COL 16 | <               g_s.obInvalidationBoundary = i;>
324 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
325 | COL NONE | <>

D4 applied to the candidate header (line 108) for target 326: the candidate is the same header line 108, so the parameter list is identical to the TARGET 209 list above (OPENS line 108 col 33; CLOSES line 110 col 74; seven parts: high, low, time, rates_total, i, withinLookbackWindow, barClosed; ARG COUNT 7).
108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
109 | COL 34 | <                                 const datetime &time[],int rates_total,int i,>
110 | COL 34 | <                                 bool withinLookbackWindow,bool barClosed)>
111 | COL 3 | <  {>
112 | COL 4 | <   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))>
113 | COL 7 | <      return;>
114 | COL NONE | <>
115 | COL 4 | <   if(low[i] > srjH(high,i,2))>
116 | COL 6 | <     {>
117 | COL 7 | <      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,>
118 | COL 34 | <                                 true,i - 2,low[i],srjH(high,i,2),i);>
119 | COL 7 | <      g_imbalances.Add(newBullFVG);>
120 | COL NONE | <>
121 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
122 | COL 7 | <      if(fvgWithinStructure)>
123 | COL 9 | <        {>
124 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bullish");>
125 | COL 10 | <         if(isInBiasFVG)>
126 | COL 12 | <           {>
127 | COL 13 | <            g_s.tickFVGIsValid = true;>
128 | COL NONE | <>
129 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
130 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
131 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
132 | COL 13 | <            bool hasNewOB     = false;>
133 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
134 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
135 | COL 13 | <            bool scanIsNew    = false;>
136 | COL 13 | <            COrderblock *renewalOB = NULL;>
137 | COL NONE | <>
138 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);>
139 | COL 13 | <            if(nearestIdx > -1)>
140 | COL 15 | <              {>
141 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
142 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
143 | COL 18 | <                 {>
144 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
145 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
146 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
147 | COL 19 | <                  if(scanIsNew)>
148 | COL 21 | <                    {>
149 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
150 | COL 22 | <                     hasNewOB              = true;>
151 | COL 22 | <                     renewalOB             = nearestOB;>
152 | COL 21 | <                    }>
153 | COL 18 | <                 }>
154 | COL 15 | <              }>
155 | COL NONE | <>
156 | COL 13 | <            if(SRJ_InDebugWindow(i))>
157 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
158 | COL 22 | <                     " dir=bullish",>
159 | COL 22 | <                     " nearestIdx=", nearestIdx,>
160 | COL 22 | <                     " obStart=", scanStartBar,>
161 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
162 | COL 22 | <                     " obVal=", scanValBar,>
163 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
164 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
165 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
166 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
167 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
168 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
169 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
170 | COL NONE | <>
171 | COL 13 | <            if(nearestIdx < 0)>
172 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);>
173 | COL NONE | <>
174 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
175 | COL 15 | <              {>
176 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
177 | COL 16 | <               if(g_htfDebugLog &&>
178 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
179 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
180 | COL 25 | <                        " dir=", g_s.currentBias,>
181 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
182 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
183 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
184 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
185 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
186 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
187 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
188 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
189 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
190 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
191 | COL 25 | <                        " resetOn=true");>
192 | COL 16 | <               // ------------------------------>
193 | COL NONE | <>
194 | COL 16 | <               g_s.isDoubleOB = false;>
195 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
196 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
197 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
198 | COL 16 | <               g_s.renewalDirection = "bullish";>
199 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
200 | COL NONE | <               >
201 | COL 16 | <               g_s.bullishStructureRenewalAlert = true;>
202 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
203 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);>
204 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
205 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
206 | COL 16 | <               g_s.obInvalidationBoundary = i;>
207 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
208 | COL NONE | <>

108 | COL 1 | <void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],>
109 | COL 34 | <                                 const datetime &time[],int rates_total,int i,>
110 | COL 34 | <                                 bool withinLookbackWindow,bool barClosed)>
111 | COL 3 | <  {>
112 | COL 4 | <   if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))>
113 | COL 7 | <      return;>
114 | COL NONE | <>
115 | COL 4 | <   if(low[i] > srjH(high,i,2))>
116 | COL 6 | <     {>
117 | COL 7 | <      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,>
118 | COL 34 | <                                 true,i - 2,low[i],srjH(high,i,2),i);>
119 | COL 7 | <      g_imbalances.Add(newBullFVG);>
120 | COL NONE | <>
121 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
122 | COL 7 | <      if(fvgWithinStructure)>
123 | COL 9 | <        {>
124 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bullish");>
125 | COL 10 | <         if(isInBiasFVG)>
126 | COL 12 | <           {>
127 | COL 13 | <            g_s.tickFVGIsValid = true;>
128 | COL NONE | <>
129 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
130 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
131 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
132 | COL 13 | <            bool hasNewOB     = false;>
133 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
134 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
135 | COL 13 | <            bool scanIsNew    = false;>
136 | COL 13 | <            COrderblock *renewalOB = NULL;>
137 | COL NONE | <>
138 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);>
139 | COL 13 | <            if(nearestIdx > -1)>
140 | COL 15 | <              {>
141 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
142 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
143 | COL 18 | <                 {>
144 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
145 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
146 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
147 | COL 19 | <                  if(scanIsNew)>
148 | COL 21 | <                    {>
149 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
150 | COL 22 | <                     hasNewOB              = true;>
151 | COL 22 | <                     renewalOB             = nearestOB;>
152 | COL 21 | <                    }>
153 | COL 18 | <                 }>
154 | COL 15 | <              }>
155 | COL NONE | <>
156 | COL 13 | <            if(SRJ_InDebugWindow(i))>
157 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
158 | COL 22 | <                     " dir=bullish",>
159 | COL 22 | <                     " nearestIdx=", nearestIdx,>
160 | COL 22 | <                     " obStart=", scanStartBar,>
161 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
162 | COL 22 | <                     " obVal=", scanValBar,>
163 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
164 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
165 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
166 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
167 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
168 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
169 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
170 | COL NONE | <>
171 | COL 13 | <            if(nearestIdx < 0)>
172 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);>
173 | COL NONE | <>
174 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
175 | COL 15 | <              {>
176 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
177 | COL 16 | <               if(g_htfDebugLog &&>
178 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
179 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
180 | COL 25 | <                        " dir=", g_s.currentBias,>
181 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
182 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
183 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
184 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
185 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
186 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
187 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
188 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
189 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
190 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
191 | COL 25 | <                        " resetOn=true");>
192 | COL 16 | <               // ------------------------------>
193 | COL NONE | <>
194 | COL 16 | <               g_s.isDoubleOB = false;>
195 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
196 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
197 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
198 | COL 16 | <               g_s.renewalDirection = "bullish";>
199 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
200 | COL NONE | <               >
201 | COL 16 | <               g_s.bullishStructureRenewalAlert = true;>
202 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
203 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);>
204 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
205 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
206 | COL 16 | <               g_s.obInvalidationBoundary = i;>
207 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
208 | COL NONE | <>
209 | COL 16 | <               g_s.tickOBIsValid                 = true;>
210 | COL 16 | <               g_s.tickFVGIsValid                = true;>
211 | COL 16 | <               // Selective reset: bullish bias renewal zeros bearish (opposing) counter only>
212 | COL 16 | <               g_s.bearishOBInvalidationCount    = 0;>
213 | COL 16 | <               g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;>
214 | COL 16 | <               g_s.checklistActivated            = false;>
215 | COL NONE | <                 >
216 | COL 16 | <               if(g_htfDebugLog)>
217 | COL 19 | <                  Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,>
218 | COL 25 | <                        " kind=fvgRenewal",>
219 | COL 25 | <                        " bias=", g_s.currentBias,>
220 | COL 25 | <                        " resetOn=true");>
221 | COL 15 | <              }>
222 | COL 12 | <           }>
223 | COL 10 | <         else>
224 | COL 12 | <           {>
225 | COL 13 | <            // Opposing FVG under a bearish bias.>
226 | COL 13 | <            g_s.hasPersistedOpposingFVG = true;>
227 | COL 13 | <            SRJ_QueueOpposingPromotion(i,"bullish");>
228 | COL 12 | <           }>
229 | COL 9 | <        }>
230 | COL 6 | <     }>
231 | COL NONE | <>
232 | COL 4 | <   if(high[i] < srjL(low,i,2))>
233 | COL 6 | <     {>
234 | COL 7 | <      CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,>
235 | COL 34 | <                                 false,i - 2,srjL(low,i,2),high[i],i);>
236 | COL 7 | <      g_imbalances.Add(newBearFVG);>
237 | COL NONE | <>
238 | COL 7 | <      bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);>
239 | COL 7 | <      if(fvgWithinStructure)>
240 | COL 9 | <        {>
241 | COL 10 | <         bool isInBiasFVG = (g_s.currentBias == "bearish");>
242 | COL 10 | <         if(isInBiasFVG)>
243 | COL 12 | <           {>
244 | COL 13 | <            g_s.tickFVGIsValid = true;>
245 | COL NONE | <>
246 | COL 13 | <            // Strict-nearest selection, identical to the promotion path, so the OB>
247 | COL 13 | <            // that triggers the renewal is the same OB the promotion will target.>
248 | COL 13 | <            int  latestOBValidationBar = SRJ_NA_INT;>
249 | COL 13 | <            bool hasNewOB     = false;>
250 | COL 13 | <            int  scanStartBar = SRJ_NA_INT;>
251 | COL 13 | <            int  scanValBar   = SRJ_NA_INT;>
252 | COL 13 | <            bool scanIsNew    = false;>
253 | COL 13 | <            COrderblock *renewalOB = NULL;>
254 | COL NONE | <>
255 | COL 13 | <            int nearestIdx = SRJ_StrictNearestOBIndex("bearish",g_s.obInvalidationBoundary);>
256 | COL 13 | <            if(nearestIdx > -1)>
257 | COL 15 | <              {>
258 | COL 16 | <               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);>
259 | COL 16 | <               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))>
260 | COL 18 | <                 {>
261 | COL 19 | <                  scanStartBar = nearestOB.startBar;>
262 | COL 19 | <                  scanValBar   = nearestOB.validationBar;>
263 | COL 19 | <                  scanIsNew    = !nearestOB.hasDrivenRenewal;>
264 | COL 19 | <                  if(scanIsNew)>
265 | COL 21 | <                    {>
266 | COL 22 | <                     latestOBValidationBar = nearestOB.validationBar;>
267 | COL 22 | <                     hasNewOB              = true;>
268 | COL 22 | <                     renewalOB             = nearestOB;>
269 | COL 21 | <                    }>
270 | COL 18 | <                 }>
271 | COL 15 | <              }>
272 | COL NONE | <>
273 | COL 13 | <            if(SRJ_InDebugWindow(i))>
274 | COL 16 | <               Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,>
275 | COL 22 | <                     " dir=bearish",>
276 | COL 22 | <                     " nearestIdx=", nearestIdx,>
277 | COL 22 | <                     " obStart=", scanStartBar,>
278 | COL 22 | <                     " obStartT=", SRJ_BarTimeStr(scanStartBar),>
279 | COL 22 | <                     " obVal=", scanValBar,>
280 | COL 22 | <                     " obValT=", SRJ_BarTimeStr(scanValBar),>
281 | COL 22 | <                     " boundary=", g_s.obInvalidationBoundary,>
282 | COL 22 | <                     " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
283 | COL 22 | <                     " lastRenewalOB=", g_s.lastRenewalOBBar,>
284 | COL 22 | <                     " isNew=", (scanIsNew ? 1 : 0),>
285 | COL 22 | <                     " hasNewOB=", (hasNewOB ? 1 : 0),>
286 | COL 22 | <                     " justChangedBias=", (g_s.justChangedBias ? 1 : 0));>
287 | COL NONE | <>
288 | COL 13 | <            if(nearestIdx < 0)>
289 | COL 16 | <               SRJ_DumpNearestOBCandidates(i,"bearish",g_s.obInvalidationBoundary);>
290 | COL NONE | <>
291 | COL 13 | <            if(hasNewOB && !g_s.justChangedBias)>
292 | COL 15 | <              {>
293 | COL 16 | <               // --- PRE-RESET STATE RECORDER --->
294 | COL 16 | <               if(g_htfDebugLog &&>
295 | COL 19 | <                  (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))>
296 | COL 19 | <                  Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,>
297 | COL 25 | <                        " dir=", g_s.currentBias,>
298 | COL 25 | <                        " bull=", g_s.bullishOBInvalidationCount,>
299 | COL 25 | <                        " bear=", g_s.bearishOBInvalidationCount,>
300 | COL 25 | <                        " tickOB=", g_s.tickOBIsValid,>
301 | COL 25 | <                        " tickFVG=", g_s.tickFVGIsValid,>
302 | COL 25 | <                        " persistOppFVG=", g_s.hasPersistedOpposingFVG,>
303 | COL 25 | <                        " checklistAct=", g_s.checklistActivated,>
304 | COL 25 | <                        " structStart=", g_s.currentStructureStartBar,>
305 | COL 25 | <                        " obInvBoundBefore=", g_s.obInvalidationBoundary,>
306 | COL 25 | <                        " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&>
307 | COL 40 | <                                       g_s.obInvalidationBoundary > g_s.currentStructureStartBar),>
308 | COL 25 | <                        " resetOn=true");>
309 | COL 16 | <               // ------------------------------>
310 | COL NONE | <>
311 | COL 16 | <               g_s.isDoubleOB = false;>
312 | COL 16 | <               g_s.lastRelevantStructureBar = i;>
313 | COL 16 | <               g_s.structureConfirmedThisBar = true;>
314 | COL 16 | <               g_s.drawStructureRenewalLineNow = true;>
315 | COL 16 | <               g_s.renewalDirection = "bearish";>
316 | COL 16 | <               g_s.hasPersistedOpposingFVG = false;>
317 | COL NONE | <               >
318 | COL 16 | <               g_s.bearishStructureRenewalAlert = true;>
319 | COL 16 | <               g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)>
320 | COL 16 | <               SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);>
321 | COL 16 | <               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;>
322 | COL 16 | <               g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging>
323 | COL 16 | <               g_s.obInvalidationBoundary = i;>
324 | COL 16 | <               g_s.fvgDetectionBoundary = i;>
325 | COL NONE | <>


Item 1.9: SRJ_BiasEngine.mqh — every line 222 through 230 inclusive, then every line 276 through 284 inclusive, verbatim with columns:
Span 222–230:
222 | COL 7 | <      g_s.suppressBiasPaneStatusThisBar = true;>
223 | COL 7 | <      g_s.obInvalidationBoundary = i;>
224 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
225 | COL 7 | <      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)>
226 | COL 7 | <      g_s.tickOBIsValid = true;>
227 | COL 7 | <      g_s.tickFVGIsValid = true;>
228 | COL 7 | <      g_s.hasPersistedOpposingFVG = false;>
229 | COL NONE | <      >
230 | COL 7 | <      // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.>
Span 276–284:
276 | COL 7 | <      g_s.obInvalidationBoundary = i;>
277 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
278 | COL 7 | <      g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg>
279 | COL 7 | <      g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg>
280 | COL 7 | <      g_s.tickOBIsValid = true;>
281 | COL 7 | <      g_s.tickFVGIsValid = true;>
282 | COL 7 | <      g_s.hasPersistedOpposingFVG = false;>
283 | COL 7 | <      g_s.bullishOBInvalidationCount = 0;>
284 | COL 7 | <      g_s.bearishOBInvalidationCount = 0;>
Token checks:
Line 226 contains the whole token tickOBIsValid: YES (one whole-token match, at column 11).
Line 280 contains the whole token tickOBIsValid: YES (one whole-token match, at column 11).

Item 1.10: D5 applied with target line 226 in SRJ_BiasEngine.mqh, then repeated completely with target line 280.
TARGET 226:
Candidate header line number: 149
Candidate header line, verbatim with its COLUMN:
149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
Full D5 window — every line from the candidate (149) through 225 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read):
149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
150 | COL 3 | <  {>
151 | COL 4 | <   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))>
152 | COL 7 | <      return;>
153 | COL NONE | <>
154 | COL 4 | <   g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||>
155 | COL 29 | <                            g_s.hasPersistedOpposingFVG;>
156 | COL NONE | <>
157 | COL 4 | <   int currentOpposingCount = (g_s.currentBias=="bullish")>
158 | COL 31 | <                              ? g_s.bearishOBInvalidationCount>
159 | COL 31 | <                              : g_s.bullishOBInvalidationCount;>
160 | COL 4 | <   bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;>
161 | COL NONE | <>
162 | COL 4 | <   int currentInBiasCount = (g_s.currentBias=="bullish")>
163 | COL 29 | <                            ? g_s.bullishOBInvalidationCount>
164 | COL 29 | <                            : g_s.bearishOBInvalidationCount;>
165 | COL 4 | <   bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;>
166 | COL NONE | <>
167 | COL 4 | <   // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.>
168 | COL 4 | <   // The latch captures the state before FVG renewal resets; the live check captures>
169 | COL 4 | <   // any weak signal that becomes true during this bar's FVG or fill passes.>
170 | COL 4 | <   bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||>
171 | COL 28 | <                           ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&>
172 | COL 29 | <                            g_s.hasPersistedOpposingFVG);>
173 | COL NONE | <>
174 | COL 4 | <   int countReferenceBar = g_s.currentStructureStartBar;>
175 | COL NONE | <>
176 | COL 4 | <   if(SRJ_InDebugWindow(i))>
177 | COL 6 | <     {>
178 | COL 7 | <      Print("SRJ DEC t=", SRJ_BarTimeStr(i),>
179 | COL 13 | <            " bar=", i,>
180 | COL 13 | <            " biasBefore=", g_s.currentBias,>
181 | COL 13 | <            " inBias=", currentInBiasCount,>
182 | COL 13 | <            " opp=", currentOpposingCount,>
183 | COL 13 | <            " bull=", g_s.bullishOBInvalidationCount,>
184 | COL 13 | <            " bear=", g_s.bearishOBInvalidationCount,>
185 | COL 13 | <            " structStart=", g_s.currentStructureStartBar,>
186 | COL 13 | <            " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),>
187 | COL 13 | <            " countRef=", countReferenceBar,>
188 | COL 13 | <            " countRefT=", SRJ_BarTimeStr(countReferenceBar),>
189 | COL 13 | <            " lastRelStruct=", g_s.lastRelevantStructureBar,>
190 | COL 13 | <            " obInvBound=", g_s.obInvalidationBoundary,>
191 | COL 13 | <            " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
192 | COL 13 | <            " lastRenewalOB=", g_s.lastRenewalOBBar,>
193 | COL 13 | <            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),>
194 | COL 13 | <            " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),>
195 | COL 13 | <            " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
196 | COL 13 | <            " strong=", (doStrongFlip ? 1 : 0),>
197 | COL 13 | <            " renew=", (doRenewal ? 1 : 0),>
198 | COL 13 | <            " weak=", (doWeakSignalFlip ? 1 : 0));>
199 | COL NONE | <>
200 | COL 7 | <      Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),>
201 | COL 13 | <            " bar=", i,>
202 | COL 13 | <            " oppCount=", currentOpposingCount,>
203 | COL 13 | <            " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),>
204 | COL 13 | <            " renewResult=", (doRenewal ? 1 : 0),>
205 | COL 13 | <            " inBiasCount=", currentInBiasCount,>
206 | COL 13 | <            " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),>
207 | COL 13 | <            " strongResult=", (doStrongFlip ? 1 : 0),>
208 | COL 13 | <            " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),>
209 | COL 13 | <            " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),>
210 | COL 13 | <            " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
211 | COL 13 | <            " weakResult=", (doWeakSignalFlip ? 1 : 0));>
212 | COL 6 | <     }>
213 | COL NONE | <>
214 | COL 4 | <   if(doRenewal)>
215 | COL 6 | <     {>
216 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
217 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
218 | COL 7 | <      g_s.wasBiasFlip = false;>
219 | COL 7 | <      g_s.drawStructureRenewalLineNow = true;>
220 | COL 7 | <      g_s.renewalDirection = g_s.currentBias;>
221 | COL 7 | <      g_s.isDoubleOB = true;>
222 | COL 7 | <      g_s.suppressBiasPaneStatusThisBar = true;>
223 | COL 7 | <      g_s.obInvalidationBoundary = i;>
224 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
225 | COL 7 | <      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)>

D4 applied to the candidate header (line 149), full parameter list in D4's report format:
PARAM LIST OPENS: line 149 col 28
PARAM LIST CLOSES: line 149 col 75
PARAMETER LIST TEXT: <int i,bool withinLookbackWindow,bool barClosed>
1 | int i | i
2 | bool withinLookbackWindow | withinLookbackWindow
3 | bool barClosed | barClosed
ARG COUNT 3
TARGET 280:
Candidate header line number: 149
Candidate header line, verbatim with its COLUMN:
149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
Full D5 window — every line from the candidate (149) through 279 inclusive, verbatim, each with its line number and COLUMN (emitted by shell command directly into this report from the canonical file read):
149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
150 | COL 3 | <  {>
151 | COL 4 | <   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))>
152 | COL 7 | <      return;>
153 | COL NONE | <>
154 | COL 4 | <   g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||>
155 | COL 29 | <                            g_s.hasPersistedOpposingFVG;>
156 | COL NONE | <>
157 | COL 4 | <   int currentOpposingCount = (g_s.currentBias=="bullish")>
158 | COL 31 | <                              ? g_s.bearishOBInvalidationCount>
159 | COL 31 | <                              : g_s.bullishOBInvalidationCount;>
160 | COL 4 | <   bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;>
161 | COL NONE | <>
162 | COL 4 | <   int currentInBiasCount = (g_s.currentBias=="bullish")>
163 | COL 29 | <                            ? g_s.bullishOBInvalidationCount>
164 | COL 29 | <                            : g_s.bearishOBInvalidationCount;>
165 | COL 4 | <   bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;>
166 | COL NONE | <>
167 | COL 4 | <   // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.>
168 | COL 4 | <   // The latch captures the state before FVG renewal resets; the live check captures>
169 | COL 4 | <   // any weak signal that becomes true during this bar's FVG or fill passes.>
170 | COL 4 | <   bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||>
171 | COL 28 | <                           ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&>
172 | COL 29 | <                            g_s.hasPersistedOpposingFVG);>
173 | COL NONE | <>
174 | COL 4 | <   int countReferenceBar = g_s.currentStructureStartBar;>
175 | COL NONE | <>
176 | COL 4 | <   if(SRJ_InDebugWindow(i))>
177 | COL 6 | <     {>
178 | COL 7 | <      Print("SRJ DEC t=", SRJ_BarTimeStr(i),>
179 | COL 13 | <            " bar=", i,>
180 | COL 13 | <            " biasBefore=", g_s.currentBias,>
181 | COL 13 | <            " inBias=", currentInBiasCount,>
182 | COL 13 | <            " opp=", currentOpposingCount,>
183 | COL 13 | <            " bull=", g_s.bullishOBInvalidationCount,>
184 | COL 13 | <            " bear=", g_s.bearishOBInvalidationCount,>
185 | COL 13 | <            " structStart=", g_s.currentStructureStartBar,>
186 | COL 13 | <            " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),>
187 | COL 13 | <            " countRef=", countReferenceBar,>
188 | COL 13 | <            " countRefT=", SRJ_BarTimeStr(countReferenceBar),>
189 | COL 13 | <            " lastRelStruct=", g_s.lastRelevantStructureBar,>
190 | COL 13 | <            " obInvBound=", g_s.obInvalidationBoundary,>
191 | COL 13 | <            " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
192 | COL 13 | <            " lastRenewalOB=", g_s.lastRenewalOBBar,>
193 | COL 13 | <            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),>
194 | COL 13 | <            " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),>
195 | COL 13 | <            " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
196 | COL 13 | <            " strong=", (doStrongFlip ? 1 : 0),>
197 | COL 13 | <            " renew=", (doRenewal ? 1 : 0),>
198 | COL 13 | <            " weak=", (doWeakSignalFlip ? 1 : 0));>
199 | COL NONE | <>
200 | COL 7 | <      Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),>
201 | COL 13 | <            " bar=", i,>
202 | COL 13 | <            " oppCount=", currentOpposingCount,>
203 | COL 13 | <            " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),>
204 | COL 13 | <            " renewResult=", (doRenewal ? 1 : 0),>
205 | COL 13 | <            " inBiasCount=", currentInBiasCount,>
206 | COL 13 | <            " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),>
207 | COL 13 | <            " strongResult=", (doStrongFlip ? 1 : 0),>
208 | COL 13 | <            " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),>
209 | COL 13 | <            " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),>
210 | COL 13 | <            " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
211 | COL 13 | <            " weakResult=", (doWeakSignalFlip ? 1 : 0));>
212 | COL 6 | <     }>
213 | COL NONE | <>
214 | COL 4 | <   if(doRenewal)>
215 | COL 6 | <     {>
216 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
217 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
218 | COL 7 | <      g_s.wasBiasFlip = false;>
219 | COL 7 | <      g_s.drawStructureRenewalLineNow = true;>
220 | COL 7 | <      g_s.renewalDirection = g_s.currentBias;>
221 | COL 7 | <      g_s.isDoubleOB = true;>
222 | COL 7 | <      g_s.suppressBiasPaneStatusThisBar = true;>
223 | COL 7 | <      g_s.obInvalidationBoundary = i;>
224 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
225 | COL 7 | <      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)>
226 | COL 7 | <      g_s.tickOBIsValid = true;>
227 | COL 7 | <      g_s.tickFVGIsValid = true;>
228 | COL 7 | <      g_s.hasPersistedOpposingFVG = false;>
229 | COL NONE | <      >
230 | COL 7 | <      // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.>
231 | COL 7 | <      // In-bias invalidations continue to accumulate toward the next strong flip.>
232 | COL 7 | <      if(g_s.currentBias == "bullish")>
233 | COL 9 | <        {>
234 | COL 10 | <         // Bullish renewal: reset bearish (opposing) counter only>
235 | COL 10 | <         g_s.bearishOBInvalidationCount = 0;>
236 | COL 10 | <         g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;>
237 | COL 9 | <        }>
238 | COL 7 | <      else>
239 | COL 9 | <        {>
240 | COL 10 | <         // Bearish renewal: reset bullish (opposing) counter only>
241 | COL 10 | <         g_s.bullishOBInvalidationCount = 0;>
242 | COL 10 | <         g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;>
243 | COL 9 | <        }>
244 | COL NONE | <>
245 | COL 7 | <      g_s.checklistActivated = false;>
246 | COL 7 | <      if(g_s.currentBias == "bullish")>
247 | COL 10 | <         g_s.bullishStructureRenewalAlert = true;>
248 | COL 7 | <      else>
249 | COL 10 | <         g_s.bearishStructureRenewalAlert = true;>
250 | COL NONE | <>
251 | COL 7 | <      if(g_htfDebugLog)>
252 | COL 10 | <         Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,>
253 | COL 16 | <               " kind=doRenewal",>
254 | COL 16 | <               " bias=", g_s.currentBias,>
255 | COL 16 | <               " resetOn=true");>
256 | COL 6 | <     }>
257 | COL 4 | <   else if(doStrongFlip || doWeakSignalFlip)>
258 | COL 6 | <     {>
259 | COL 7 | <      string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";>
260 | COL 7 | <      g_s.currentBias = nextBias;>
261 | COL 7 | <      g_s.currentStructureStartBar = i;>
262 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
263 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
264 | COL 7 | <      g_s.wasBiasFlip = true;>
265 | COL 7 | <      g_s.drawBiasLineNow = true;>
266 | COL 7 | <      g_s.newBiasDirection = nextBias;>
267 | COL 7 | <      if(doStrongFlip)>
268 | COL 9 | <        {>
269 | COL 10 | <         g_s.isDoubleOB = true;>
270 | COL 10 | <         g_s.suppressBiasPaneStatusThisBar = true;>
271 | COL 9 | <        }>
272 | COL 7 | <      else>
273 | COL 9 | <        {>
274 | COL 10 | <         g_s.isDoubleOB = false;>
275 | COL 9 | <        }>
276 | COL 7 | <      g_s.obInvalidationBoundary = i;>
277 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
278 | COL 7 | <      g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg>
279 | COL 7 | <      g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg>

D4 applied to the candidate header (line 149) for target 280: the candidate is the same header line 149, so the parameter list is identical to the TARGET 226 list above (OPENS line 149 col 28; CLOSES line 149 col 75; three parts: i, withinLookbackWindow, barClosed; ARG COUNT 3).
149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
150 | COL 3 | <  {>
151 | COL 4 | <   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))>
152 | COL 7 | <      return;>
153 | COL NONE | <>
154 | COL 4 | <   g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||>
155 | COL 29 | <                            g_s.hasPersistedOpposingFVG;>
156 | COL NONE | <>
157 | COL 4 | <   int currentOpposingCount = (g_s.currentBias=="bullish")>
158 | COL 31 | <                              ? g_s.bearishOBInvalidationCount>
159 | COL 31 | <                              : g_s.bullishOBInvalidationCount;>
160 | COL 4 | <   bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;>
161 | COL NONE | <>
162 | COL 4 | <   int currentInBiasCount = (g_s.currentBias=="bullish")>
163 | COL 29 | <                            ? g_s.bullishOBInvalidationCount>
164 | COL 29 | <                            : g_s.bearishOBInvalidationCount;>
165 | COL 4 | <   bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;>
166 | COL NONE | <>
167 | COL 4 | <   // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.>
168 | COL 4 | <   // The latch captures the state before FVG renewal resets; the live check captures>
169 | COL 4 | <   // any weak signal that becomes true during this bar's FVG or fill passes.>
170 | COL 4 | <   bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||>
171 | COL 28 | <                           ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&>
172 | COL 29 | <                            g_s.hasPersistedOpposingFVG);>
173 | COL NONE | <>
174 | COL 4 | <   int countReferenceBar = g_s.currentStructureStartBar;>
175 | COL NONE | <>
176 | COL 4 | <   if(SRJ_InDebugWindow(i))>
177 | COL 6 | <     {>
178 | COL 7 | <      Print("SRJ DEC t=", SRJ_BarTimeStr(i),>
179 | COL 13 | <            " bar=", i,>
180 | COL 13 | <            " biasBefore=", g_s.currentBias,>
181 | COL 13 | <            " inBias=", currentInBiasCount,>
182 | COL 13 | <            " opp=", currentOpposingCount,>
183 | COL 13 | <            " bull=", g_s.bullishOBInvalidationCount,>
184 | COL 13 | <            " bear=", g_s.bearishOBInvalidationCount,>
185 | COL 13 | <            " structStart=", g_s.currentStructureStartBar,>
186 | COL 13 | <            " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),>
187 | COL 13 | <            " countRef=", countReferenceBar,>
188 | COL 13 | <            " countRefT=", SRJ_BarTimeStr(countReferenceBar),>
189 | COL 13 | <            " lastRelStruct=", g_s.lastRelevantStructureBar,>
190 | COL 13 | <            " obInvBound=", g_s.obInvalidationBoundary,>
191 | COL 13 | <            " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
192 | COL 13 | <            " lastRenewalOB=", g_s.lastRenewalOBBar,>
193 | COL 13 | <            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),>
194 | COL 13 | <            " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),>
195 | COL 13 | <            " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
196 | COL 13 | <            " strong=", (doStrongFlip ? 1 : 0),>
197 | COL 13 | <            " renew=", (doRenewal ? 1 : 0),>
198 | COL 13 | <            " weak=", (doWeakSignalFlip ? 1 : 0));>
199 | COL NONE | <>
200 | COL 7 | <      Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),>
201 | COL 13 | <            " bar=", i,>
202 | COL 13 | <            " oppCount=", currentOpposingCount,>
203 | COL 13 | <            " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),>
204 | COL 13 | <            " renewResult=", (doRenewal ? 1 : 0),>
205 | COL 13 | <            " inBiasCount=", currentInBiasCount,>
206 | COL 13 | <            " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),>
207 | COL 13 | <            " strongResult=", (doStrongFlip ? 1 : 0),>
208 | COL 13 | <            " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),>
209 | COL 13 | <            " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),>
210 | COL 13 | <            " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
211 | COL 13 | <            " weakResult=", (doWeakSignalFlip ? 1 : 0));>
212 | COL 6 | <     }>
213 | COL NONE | <>
214 | COL 4 | <   if(doRenewal)>
215 | COL 6 | <     {>
216 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
217 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
218 | COL 7 | <      g_s.wasBiasFlip = false;>
219 | COL 7 | <      g_s.drawStructureRenewalLineNow = true;>
220 | COL 7 | <      g_s.renewalDirection = g_s.currentBias;>
221 | COL 7 | <      g_s.isDoubleOB = true;>
222 | COL 7 | <      g_s.suppressBiasPaneStatusThisBar = true;>
223 | COL 7 | <      g_s.obInvalidationBoundary = i;>
224 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
225 | COL 7 | <      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)>

149 | COL 1 | <void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)>
150 | COL 3 | <  {>
151 | COL 4 | <   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))>
152 | COL 7 | <      return;>
153 | COL NONE | <>
154 | COL 4 | <   g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||>
155 | COL 29 | <                            g_s.hasPersistedOpposingFVG;>
156 | COL NONE | <>
157 | COL 4 | <   int currentOpposingCount = (g_s.currentBias=="bullish")>
158 | COL 31 | <                              ? g_s.bearishOBInvalidationCount>
159 | COL 31 | <                              : g_s.bullishOBInvalidationCount;>
160 | COL 4 | <   bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;>
161 | COL NONE | <>
162 | COL 4 | <   int currentInBiasCount = (g_s.currentBias=="bullish")>
163 | COL 29 | <                            ? g_s.bullishOBInvalidationCount>
164 | COL 29 | <                            : g_s.bearishOBInvalidationCount;>
165 | COL 4 | <   bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;>
166 | COL NONE | <>
167 | COL 4 | <   // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.>
168 | COL 4 | <   // The latch captures the state before FVG renewal resets; the live check captures>
169 | COL 4 | <   // any weak signal that becomes true during this bar's FVG or fill passes.>
170 | COL 4 | <   bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||>
171 | COL 28 | <                           ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&>
172 | COL 29 | <                            g_s.hasPersistedOpposingFVG);>
173 | COL NONE | <>
174 | COL 4 | <   int countReferenceBar = g_s.currentStructureStartBar;>
175 | COL NONE | <>
176 | COL 4 | <   if(SRJ_InDebugWindow(i))>
177 | COL 6 | <     {>
178 | COL 7 | <      Print("SRJ DEC t=", SRJ_BarTimeStr(i),>
179 | COL 13 | <            " bar=", i,>
180 | COL 13 | <            " biasBefore=", g_s.currentBias,>
181 | COL 13 | <            " inBias=", currentInBiasCount,>
182 | COL 13 | <            " opp=", currentOpposingCount,>
183 | COL 13 | <            " bull=", g_s.bullishOBInvalidationCount,>
184 | COL 13 | <            " bear=", g_s.bearishOBInvalidationCount,>
185 | COL 13 | <            " structStart=", g_s.currentStructureStartBar,>
186 | COL 13 | <            " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),>
187 | COL 13 | <            " countRef=", countReferenceBar,>
188 | COL 13 | <            " countRefT=", SRJ_BarTimeStr(countReferenceBar),>
189 | COL 13 | <            " lastRelStruct=", g_s.lastRelevantStructureBar,>
190 | COL 13 | <            " obInvBound=", g_s.obInvalidationBoundary,>
191 | COL 13 | <            " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),>
192 | COL 13 | <            " lastRenewalOB=", g_s.lastRenewalOBBar,>
193 | COL 13 | <            " justChangedBias=", (g_s.justChangedBias ? 1 : 0),>
194 | COL 13 | <            " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),>
195 | COL 13 | <            " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
196 | COL 13 | <            " strong=", (doStrongFlip ? 1 : 0),>
197 | COL 13 | <            " renew=", (doRenewal ? 1 : 0),>
198 | COL 13 | <            " weak=", (doWeakSignalFlip ? 1 : 0));>
199 | COL NONE | <>
200 | COL 7 | <      Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),>
201 | COL 13 | <            " bar=", i,>
202 | COL 13 | <            " oppCount=", currentOpposingCount,>
203 | COL 13 | <            " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),>
204 | COL 13 | <            " renewResult=", (doRenewal ? 1 : 0),>
205 | COL 13 | <            " inBiasCount=", currentInBiasCount,>
206 | COL 13 | <            " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),>
207 | COL 13 | <            " strongResult=", (doStrongFlip ? 1 : 0),>
208 | COL 13 | <            " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),>
209 | COL 13 | <            " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),>
210 | COL 13 | <            " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),>
211 | COL 13 | <            " weakResult=", (doWeakSignalFlip ? 1 : 0));>
212 | COL 6 | <     }>
213 | COL NONE | <>
214 | COL 4 | <   if(doRenewal)>
215 | COL 6 | <     {>
216 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
217 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
218 | COL 7 | <      g_s.wasBiasFlip = false;>
219 | COL 7 | <      g_s.drawStructureRenewalLineNow = true;>
220 | COL 7 | <      g_s.renewalDirection = g_s.currentBias;>
221 | COL 7 | <      g_s.isDoubleOB = true;>
222 | COL 7 | <      g_s.suppressBiasPaneStatusThisBar = true;>
223 | COL 7 | <      g_s.obInvalidationBoundary = i;>
224 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
225 | COL 7 | <      // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)>
226 | COL 7 | <      g_s.tickOBIsValid = true;>
227 | COL 7 | <      g_s.tickFVGIsValid = true;>
228 | COL 7 | <      g_s.hasPersistedOpposingFVG = false;>
229 | COL NONE | <      >
230 | COL 7 | <      // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.>
231 | COL 7 | <      // In-bias invalidations continue to accumulate toward the next strong flip.>
232 | COL 7 | <      if(g_s.currentBias == "bullish")>
233 | COL 9 | <        {>
234 | COL 10 | <         // Bullish renewal: reset bearish (opposing) counter only>
235 | COL 10 | <         g_s.bearishOBInvalidationCount = 0;>
236 | COL 10 | <         g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;>
237 | COL 9 | <        }>
238 | COL 7 | <      else>
239 | COL 9 | <        {>
240 | COL 10 | <         // Bearish renewal: reset bullish (opposing) counter only>
241 | COL 10 | <         g_s.bullishOBInvalidationCount = 0;>
242 | COL 10 | <         g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;>
243 | COL 9 | <        }>
244 | COL NONE | <>
245 | COL 7 | <      g_s.checklistActivated = false;>
246 | COL 7 | <      if(g_s.currentBias == "bullish")>
247 | COL 10 | <         g_s.bullishStructureRenewalAlert = true;>
248 | COL 7 | <      else>
249 | COL 10 | <         g_s.bearishStructureRenewalAlert = true;>
250 | COL NONE | <>
251 | COL 7 | <      if(g_htfDebugLog)>
252 | COL 10 | <         Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,>
253 | COL 16 | <               " kind=doRenewal",>
254 | COL 16 | <               " bias=", g_s.currentBias,>
255 | COL 16 | <               " resetOn=true");>
256 | COL 6 | <     }>
257 | COL 4 | <   else if(doStrongFlip || doWeakSignalFlip)>
258 | COL 6 | <     {>
259 | COL 7 | <      string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";>
260 | COL 7 | <      g_s.currentBias = nextBias;>
261 | COL 7 | <      g_s.currentStructureStartBar = i;>
262 | COL 7 | <      g_s.lastRelevantStructureBar = i;>
263 | COL 7 | <      g_s.structureConfirmedThisBar = true;>
264 | COL 7 | <      g_s.wasBiasFlip = true;>
265 | COL 7 | <      g_s.drawBiasLineNow = true;>
266 | COL 7 | <      g_s.newBiasDirection = nextBias;>
267 | COL 7 | <      if(doStrongFlip)>
268 | COL 9 | <        {>
269 | COL 10 | <         g_s.isDoubleOB = true;>
270 | COL 10 | <         g_s.suppressBiasPaneStatusThisBar = true;>
271 | COL 9 | <        }>
272 | COL 7 | <      else>
273 | COL 9 | <        {>
274 | COL 10 | <         g_s.isDoubleOB = false;>
275 | COL 9 | <        }>
276 | COL 7 | <      g_s.obInvalidationBoundary = i;>
277 | COL 7 | <      g_s.fvgDetectionBoundary = i;>
278 | COL 7 | <      g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg>
279 | COL 7 | <      g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg>


Item 1.11: BAR-CANDIDATE FLAGGING — reported for each of the six parameter lists from items 1.5, 1.6, 1.8 and 1.10 (no additional lists arose under 1.5 or 1.6 because the candidates were 89 and 413 respectively). A part is flagged when its VARIABLE NAME per D4(h), converted to lower case, either contains the three-character sequence bar or is exactly the single character i.
List 1 — item 1.5, SRJ_OrderblockMgr.mqh, header line 89 (ARG COUNT 6):
SRJ_OrderblockMgr.mqh | 89 | POSITION 2 | barHigh
SRJ_OrderblockMgr.mqh | 89 | POSITION 3 | barLow
SRJ_OrderblockMgr.mqh | 89 | POSITION 4 | barClose
SRJ_OrderblockMgr.mqh | 89 | POSITION 5 | replayBar
SRJ_OrderblockMgr.mqh | 89 | POSITION 6 | discoveryBar
List 2 — item 1.6, SRJ_OrderblockMgr.mqh, header line 413 (ARG COUNT 9):
SRJ_OrderblockMgr.mqh | 413 | POSITION 7 | i
SRJ_OrderblockMgr.mqh | 413 | POSITION 9 | barClosed
List 3 — item 1.8 target 209, SRJ_ImbalanceMgr.mqh, header line 108 (ARG COUNT 7):
SRJ_ImbalanceMgr.mqh | 108 | POSITION 5 | i
SRJ_ImbalanceMgr.mqh | 108 | POSITION 7 | barClosed
List 4 — item 1.8 target 326, SRJ_ImbalanceMgr.mqh, header line 108 (ARG COUNT 7):
SRJ_ImbalanceMgr.mqh | 108 | POSITION 5 | i
SRJ_ImbalanceMgr.mqh | 108 | POSITION 7 | barClosed
List 5 — item 1.10 target 226, SRJ_BiasEngine.mqh, header line 149 (ARG COUNT 3):
SRJ_BiasEngine.mqh | 149 | POSITION 1 | i
SRJ_BiasEngine.mqh | 149 | POSITION 3 | barClosed
List 6 — item 1.10 target 280, SRJ_BiasEngine.mqh, header line 149 (ARG COUNT 3):
SRJ_BiasEngine.mqh | 149 | POSITION 1 | i
SRJ_BiasEngine.mqh | 149 | POSITION 3 | barClosed
No list returned NONE FLAGGED (every list contains at least one flagged part). DO NOT SELECT ONE: no parameter is marked as an event bar or a processing bar, no parameter is selected as a bar index, and no conclusion is drawn here about which is a bar index. The flagged set is reported and the report stops there; the council selects in PART 2.

Item 1.12: APPEND-SITE FORM (D6) applied in full to each of the eight target lines, in the order given. D6-STRIP is reported for every line used. No part (f) walk ran at any site and no DEVIATION arose at any site (details per site).
SITE 1 — SRJ_OrderblockMgr.mqh 171
  (c) N's D6-STRIP ends in a semicolon: PASS. N contains no open-brace and no close-brace character: PASS (0 and 0). N's open-parenthesis count equals its close-parenthesis count: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = false;>
  P: line 170, D6-STRIP <if(isInBias)>
  Q: line 172, D6-STRIP <else>
  Part (f) walk: DID NOT RUN — P's D6-STRIP ends in a close parenthesis, but P's own open count (1) is not less than its close count (1).
  P-CLASS: BRANCH-HEADER
  Q-CLASS: BARE-ELSE
  OUTCOME: APPEND SITE FORM: UNBRACED BRANCH BODY | ELSE FOLLOWS: YES
SITE 2 — SRJ_OrderblockMgr.mqh 173
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = true;>
  P: line 172, D6-STRIP <else>
  Q: line 176, D6-STRIP <if(ob.isBullish)>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: BARE-ELSE
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: UNBRACED BRANCH BODY | ELSE FOLLOWS: NO
SITE 3 — SRJ_OrderblockMgr.mqh 535
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = false;>
  P: line 534, D6-STRIP <if(isInBias)>
  Q: line 536, D6-STRIP <else>
  Part (f) walk: DID NOT RUN — P's D6-STRIP ends in a close parenthesis, but P's own open count (1) is not less than its close count (1).
  P-CLASS: BRANCH-HEADER
  Q-CLASS: BARE-ELSE
  OUTCOME: APPEND SITE FORM: UNBRACED BRANCH BODY | ELSE FOLLOWS: YES
SITE 4 — SRJ_OrderblockMgr.mqh 537
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = true;>
  P: line 536, D6-STRIP <else>
  Q: line 539, D6-STRIP <if(ob.isBullish)>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: BARE-ELSE
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: UNBRACED BRANCH BODY | ELSE FOLLOWS: NO
SITE 5 — SRJ_ImbalanceMgr.mqh 209
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid                 = true;>
  P: line 207, D6-STRIP <g_s.fvgDetectionBoundary = i;>
  Q: line 210, D6-STRIP <g_s.tickFVGIsValid                = true;>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: STATEMENT
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: BLOCK MEMBER
SITE 6 — SRJ_ImbalanceMgr.mqh 326
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid                 = true;>
  P: line 324, D6-STRIP <g_s.fvgDetectionBoundary = i;>
  Q: line 327, D6-STRIP <g_s.tickFVGIsValid                = true;>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: STATEMENT
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: BLOCK MEMBER
SITE 7 — SRJ_BiasEngine.mqh 226
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = true;>
  P: line 224, D6-STRIP <g_s.fvgDetectionBoundary = i;>
  Q: line 227, D6-STRIP <g_s.tickFVGIsValid = true;>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: STATEMENT
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: BLOCK MEMBER
SITE 8 — SRJ_BiasEngine.mqh 280
  (c) ends in a semicolon: PASS. no braces: PASS (0 and 0). parens equal: PASS (0 = 0).
  N D6-STRIP: <g_s.tickOBIsValid = true;>
  P: line 279, D6-STRIP <g_s.structLegBoundary = i;>
  Q: line 281, D6-STRIP <g_s.tickFVGIsValid = true;>
  Part (f) walk: DID NOT RUN — P's D6-STRIP does not end in a close parenthesis.
  P-CLASS: STATEMENT
  Q-CLASS: OTHER
  OUTCOME: APPEND SITE FORM: BLOCK MEMBER
All eight sites reported. No result stops this item. No brace has been added to anything; this part writes nothing to the canonical tree. No statement is made here about which sites PART 2 should brace.

Item 1.13: TWO TEXT GATES.
(a) LINE 8 TOKEN COUNT — SRJ_FlowLogic.mq5 line 8, whole-token occurrences of the text 34:
  8 | COL 1 | <#property indicator_buffers 34  // [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId).>
  Count: 1
  1-based column of the match: 29
  CONSUMED BY: PART 2's single MODIFY edit, which is authored only for a count of exactly 1. (The count here is 1; no edit is made in this part.)
(b) FOUR-LINE WINDOW CHECK — run twice, six checks per window. Every check returned PASS; no offending text exists.
WINDOW 1 — SRJ_OrderblockMgr.mqh lines 170, 171, 172, 173 (verbatim with columns):
  170 | COL 13 | <            if(isInBias)>
  171 | COL 16 | <               g_s.tickOBIsValid = false;>
  172 | COL 13 | <            else>
  173 | COL 16 | <               g_s.tickOBIsValid = true;>
  (i)   open-brace count 0, close-brace count 0 across the four lines — PASS
  (ii)  no forward-slash-asterisk and no asterisk-forward-slash occurrence — PASS
  (iii) FIRST line STRIPPED <if(isInBias)> ends in a close parenthesis, opens=1 closes=1 — PASS
  (iv)  SECOND line STRIPPED <g_s.tickOBIsValid = false;> ends in a semicolon; whole token tickOBIsValid present (column 5); whole token false present (column 21) — PASS
  (v)   THIRD line STRIPPED <else> is exactly the whole token else and nothing else — PASS
  (vi)  FOURTH line STRIPPED <g_s.tickOBIsValid = true;> ends in a semicolon; whole token tickOBIsValid present (column 5); whole token true present (column 21) — PASS
WINDOW 2 — SRJ_OrderblockMgr.mqh lines 534, 535, 536, 537 (verbatim with columns):
  534 | COL 19 | <                  if(isInBias)>
  535 | COL 22 | <                     g_s.tickOBIsValid = false;>
  536 | COL 19 | <                  else>
  537 | COL 22 | <                     g_s.tickOBIsValid = true;>
  (i)   open-brace count 0, close-brace count 0 across the four lines — PASS
  (ii)  no forward-slash-asterisk and no asterisk-forward-slash occurrence — PASS
  (iii) FIRST line STRIPPED <if(isInBias)> ends in a close parenthesis, opens=1 closes=1 — PASS
  (iv)  SECOND line STRIPPED <g_s.tickOBIsValid = false;> ends in a semicolon; whole token tickOBIsValid present (column 5); whole token false present (column 21) — PASS
  (v)   THIRD line STRIPPED <else> is exactly the whole token else and nothing else — PASS
  (vi)  FOURTH line STRIPPED <g_s.tickOBIsValid = true;> ends in a semicolon; whole token tickOBIsValid present (column 5); whole token true present (column 21) — PASS
CONSUMED BY: R-22's pattern gate. PART 2 authors brace insertions for a window only where all six checks PASS for that window. Both windows PASS all six here; the decision to author them belongs to PART 2, not to this report.

Deviations: none. No DEVIATION line arose anywhere in this run: no QUOTE ON LINE, no PARAM LIST UNCLOSED, no PARAM LIST CONTAINS A QUOTE, no ANGLE BRACKET IN PARAM LIST, no NO CANDIDATE HEADER WITHIN WINDOW, no BLOCK COMMENT NEAR, no CONDITION OPENER NOT FOUND, no P NOT FOUND, no Q NOT FOUND, no CONFLICT, no UNDETERMINED, no PRECONDITION FAILED, no SNAPSHOT DIVERGENT, no STASIS BROKEN, and no line-count MISMATCH.

Splits declared: none.

Commands that failed: three tooling commands failed during the run and were re-issued in corrected form; every figure in this report comes from a successful run.
- Two early PowerShell one-liners (setup for items 0.4 and 0.5) exited with code 1, raw text: "Missing variable name after foreach." / "An expression was expected after '('." / "Not all parse errors were reported." — cause: nested powershell -Command quoting expanded the $ variables before the inner shell ran. Re-issued as direct PowerShell with single-quoted strings; succeeded.
- One D4 invocation during item 1.6's parameter-list build threw: Exception calling "Substring" with "1" argument(s): "startIndex cannot be larger than length of string. Parameter name: startIndex" — cause: a line-arithmetic fault in the builder's D4 helper (same-line opener/closer case). D4 was corrected and re-run; the corrected results for lines 89, 413, 108 and 149 are the ones reported above (the earlier faulty output for line 89/413 was discarded and is not used anywhere in this report).
No canonical read failed; no canonical file was touched by any failed command.

STATUS AND NO-SELF-CERTIFICATION NOTE: This report states only what was read and what was measured. It does not state that this task is verified, complete, conformant or correct, and it does not state that PART 2 may proceed. That determination is the council's. The status word COMPLETED above is the legal status of execution — STAGE 0 (items 0.1–0.5), all thirteen STAGE 1 reads and this STAGE 2 report were performed as written under authorization 155-A2 — and is not a claim of correctness. Nothing was resolved and nothing was selected: no bar index chosen, no branch chosen, no brace added, no sentinel value assigned, no conclusion drawn about what any function does, no figure anchored from any earlier session, and no file in the canonical tree created, modified, renamed or deleted.

END-OF-TASK-155-V4P1-R1
