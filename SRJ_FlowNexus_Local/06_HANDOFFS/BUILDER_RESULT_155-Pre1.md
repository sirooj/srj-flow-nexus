# BUILDER_RESULT_155-Pre1

TASK 155-Pre1: COMPLETED
Reference documents loaded: none
Relay check: token END-OF-TASK-155-PRE1 PRESENT | per-block item counts received: A 3, B 4, C 4, D 6, E 4 | COUNT LINE CONSISTENT with both figures (3+4+4+6+4 = 21 = declared total)
Report destination: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-Pre1.md
Files read (all via shell command; no file opened in MetaEditor):
  certutil -hashfile <path> SHA256 for the two .mq5 files (raw output pasted in the FINAL ITEM below)
  powershell [System.IO.File]::ReadAllLines + enumerated line dumps with line numbers, for all 16 canonical files under C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5 :
    Experts\SRJ_FlowNexus_EA.mq5 (3202 lines)
    Indicators\SRJ_FlowLogic.mq5 (1180 lines)
    Include\SRJ\SRJ_Alerts.mqh (50)
    Include\SRJ\SRJ_BiasEngine.mqh (386)
    Include\SRJ\SRJ_Draw.mqh (333)
    Include\SRJ\SRJ_Fractals.mqh (205)
    Include\SRJ\SRJ_HTFEngine.mqh (579)
    Include\SRJ\SRJ_ImbalanceMgr.mqh (532)
    Include\SRJ\SRJ_OrderblockMgr.mqh (1104)
    Include\SRJ\SRJ_Panels.mqh (439)
    Include\SRJ\SRJ_SeedFormat.mqh (694)
    Include\SRJ\SRJ_Sessions.mqh (582)
    Include\SRJ\SRJ_State.mqh (501)
    Include\SRJ\SRJ_Text.mqh (174)
    Include\SRJ\SRJ_TickCore.mqh (984)
    Include\SRJ\SRJ_Types.mqh (355)
  powershell regex census scans (case-sensitive, comments stripped per Amendment 9, string contents retained) over the same 16 files for: tickOBIsValid, tickFVGIsValid, SState, SRJ_Bias_PerBarResetPass, SRJ_Bias_WeakFlipLatchPass, SRJ_FVG_CreationRenewalPass, SRJ_Bias_DecisionBlock, hasPersistedOpposingFVG, ArraySetAsSeries, ArrayInitialize, PlotIndexSetDouble, PLOT_EMPTY_VALUE, EMPTY_VALUE, long
  powershell definition-header and brace-count scans (column-0 candidate enumeration, paren matching across lines, per-line brace deltas on comment-and-string-stripped text, depth table) over: SRJ_BiasEngine.mqh, SRJ_ImbalanceMgr.mqh, SRJ_OrderblockMgr.mqh, SRJ_Panels.mqh, SRJ_State.mqh, SRJ_FlowLogic.mq5
Files written: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-Pre1.md (this file only; no canonical-tree file written)
Checkpoints: none (read-only task)
Commands that failed (each superseded by a corrected rerun; no failed-command output is used as a result in this report):
  1. powershell -NoProfile -Command with Get-ChildItem and ForEach-Object dollar-Name -> error: The term .Name is not recognized (outer shell interpolated the dollar signs); fixed by backtick-escaping every dollar in later commands.
  2. first attempt using inner double quotes -> error: The string is missing the terminator (outer shell stripped inner double quotes); fixed by using inner single quotes only.
  3. foreach line-count command -> error: Missing variable name after foreach (same dollar interpolation cause); fixed as above.
  4. Get-Stack v1 tested depthAfter[i] greater than depthAtS and v2 omitted a close-line test; both produced self-inconsistent stacks; final version tests delta greater than 0 AND depthAfter[L-1] less than depthAtS AND close(L) greater than S; every reported stack re-verified against Amendment 17.
  5. Get-RHS run referencing an undefined flow-logic path variable -> Exception calling ReadAllLines: Empty path name is not legal (B4 and E4 RHS extraction); rerun without that reference.
  6. D5 window scan using -replace with an invalid regex (pattern [^]* is not valid); replaced with a character-based scanner.
  7. D5 scan v2 -> Cannot convert value to type System.Int32 from paren-number plus string concat; superseded by manual per-line application of the assignment-target rule on the pasted window text; result identical to the char-based rule application.
Splits declared (reply delivery): PART 1 = header + Block A + Block B; PART 2 = Block C; PART 3 = Block D; PART 4 = Block E + FINAL HASH ITEM + checklist confirmations. The FILE at the report destination is COMPLETE and contains all parts regardless of reply splitting.
Truncations: none

=== CENSUS BASIS (applies to every census in this report) ===
All censuses count occurrences on comment-stripped text: every character from an unquoted // to end of line, and from an unquoted /* through the matching */ (across line boundaries), is discarded first (Amendment 9). Double-quoted string CONTENTS are retained for census counting (the census rules exclude comments only). All matches are case-sensitive. N_OCC counts repeats per line; N_LINES is a single per-file or per-range count of DISTINCT lines matching at least one pattern of that census. N_LINES was never summed across patterns. No expected value was assumed for any count; a count of 0 is a result.

--- A1. Census: tickOBIsValid (substring rule, all 16 files) ---
Per-file N_OCC and single per-file N_LINES:
  Experts\SRJ_FlowNexus_EA.mq5: N_OCC=0 | N_LINES=0
  Indicators\SRJ_FlowLogic.mq5: N_OCC=1 | N_LINES=1
  Include\SRJ\SRJ_Alerts.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_BiasEngine.mqh: N_OCC=7 | N_LINES=6   (line 208 carries TWO occurrences: one inside the Print string literal whose content is a space then tickOBIsValid= , and one outside it)
  Include\SRJ\SRJ_Draw.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Fractals.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_HTFEngine.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_ImbalanceMgr.mqh: N_OCC=4 | N_LINES=4
  Include\SRJ\SRJ_OrderblockMgr.mqh: N_OCC=4 | N_LINES=4
  Include\SRJ\SRJ_Panels.mqh: N_OCC=2 | N_LINES=2
  Include\SRJ\SRJ_SeedFormat.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Sessions.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_State.mqh: N_OCC=2 | N_LINES=2
  Include\SRJ\SRJ_Text.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_TickCore.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Types.mqh: N_OCC=0 | N_LINES=0
Pasted distinct-line count = sum of per-file N_LINES = 20 (no caps). A count of 0 in a file is a result.
INCIDENTAL: none. No occurrence of tickOBIsValid lies inside a longer identifier in any of the 16 files; there is no containing identifier to report. Whole-token test not applicable (not a language keyword; no item required whole-token matching for this pattern).
Paste (each distinct line once, format <file> <line>: <text> [matched: tickOBIsValid]):
Indicators\SRJ_FlowLogic.mq5 902:          g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0; [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 154:    g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) || [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 171:                            ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 208:             " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0), [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 226:       g_s.tickOBIsValid = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 280:       g_s.tickOBIsValid = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 382:    if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG) [matched: tickOBIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 183:                         " tickOB=", g_s.tickOBIsValid, [matched: tickOBIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 209:                g_s.tickOBIsValid                 = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 300:                         " tickOB=", g_s.tickOBIsValid, [matched: tickOBIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 326:                g_s.tickOBIsValid                 = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_OrderblockMgr.mqh 171:                g_s.tickOBIsValid = false; [matched: tickOBIsValid]
Include\SRJ\SRJ_OrderblockMgr.mqh 173:                g_s.tickOBIsValid = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_OrderblockMgr.mqh 535:                      g_s.tickOBIsValid = false; [matched: tickOBIsValid]
Include\SRJ\SRJ_OrderblockMgr.mqh 537:                      g_s.tickOBIsValid = true; [matched: tickOBIsValid]
Include\SRJ\SRJ_Panels.mqh 15:    if(!g_s.tickOBIsValid) invalid += 1; [matched: tickOBIsValid]
Include\SRJ\SRJ_Panels.mqh 252:                                        g_s.checklistActivated,g_s.tickOBIsValid, [matched: tickOBIsValid]
Include\SRJ\SRJ_State.mqh 126:    bool     tickOBIsValid; [matched: tickOBIsValid]
Include\SRJ\SRJ_State.mqh 327:    g_s.tickOBIsValid                  = true; [matched: tickOBIsValid]

A1 classification of each non-INCIDENTAL line (mechanically applied assignment-target rule with comment and string exclusion, comparison rule, Amendment 1 declaration rule):
  FlowLogic 902: OTHER - CONTAINS-EQUALS-NOT-TARGET (the occurrence outside strings is followed by a space then ? ; the = on the line belongs to g_bufOBValid[target]; no == or != present; no verdict built on it)
  BiasEngine 154: OTHER - CONTAINS-EQUALS-NOT-TARGET (occurrence followed by ) ; the = belongs to g_s.checklistActivated)
  BiasEngine 171: OTHER (no = anywhere on the line; no == or !=; boolean negations only)
  BiasEngine 208: OTHER - CONTAINS-EQUALS-NOT-TARGET (out-of-string occurrence is a ternary operand; the only = on the line lies inside the Print string literal - STRING-LITERAL occurrence, no verdict built on it)
  BiasEngine 226: ASSIGNMENT - target tickOBIsValid (g_s.tickOBIsValid then = then true) | RHS (right-hand-side rule): true
  BiasEngine 280: ASSIGNMENT - target tickOBIsValid | RHS: true
  BiasEngine 382: OTHER (no = on the line; no == or !=)
  ImbalanceMgr 183: OTHER (out-of-string occurrence is a Print argument followed by , ; every = on the line lies inside the string literal - STRING-LITERAL context, no verdict built)
  ImbalanceMgr 209: ASSIGNMENT - target tickOBIsValid | RHS: true
  ImbalanceMgr 300: OTHER (same class as 183)
  ImbalanceMgr 326: ASSIGNMENT - target tickOBIsValid | RHS: true
  OrderblockMgr 171: ASSIGNMENT - target tickOBIsValid | RHS: false
  OrderblockMgr 173: ASSIGNMENT - target tickOBIsValid | RHS: true
  OrderblockMgr 535: ASSIGNMENT - target tickOBIsValid | RHS: false
  OrderblockMgr 537: ASSIGNMENT - target tickOBIsValid | RHS: true
  Panels 15: OTHER - CONTAINS-EQUALS-NOT-TARGET (the = belongs to invalid += 1; no == or !=)
  Panels 252: OTHER (no = on the line; Print argument list)
  State 126: DECLARATION (struct member declaration; first token bool, identifier is the last token before ; ; Amendment 1 relaxed, Amendment 15 not triggered - first token is not })
  State 327: ASSIGNMENT - target tickOBIsValid | RHS: true

Enclosing function for every A1 line (definition-header rule including its fallback; all regions brace-counted; fallback was NEVER reached for any name - every name yielded a DEFINITION at column 0):
  FlowLogic 902 -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
  BiasEngine 154, 171, 208, 226, 280 -> SRJ_Bias_DecisionBlock | HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223
  BiasEngine 382 -> SRJ_Bias_WeakFlipLatchPass | HEADER 376 | PARAM LIST CLOSES 376 | OPENING BRACE 377 | CLOSING BRACE 384 | BODY LINES 8 | HEADER-INCLUSIVE LINES 9
  ImbalanceMgr 183, 209, 300, 326 -> SRJ_FVG_CreationRenewalPass | HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241
  OrderblockMgr 171, 173 -> SRJ_OB_ReplayActivationInvalidation | HEADER 89 | PARAM LIST CLOSES 94 | OPENING BRACE 95 | CLOSING BRACE 195 | BODY LINES 101 | HEADER-INCLUSIVE LINES 107
  OrderblockMgr 535, 537 -> SRJ_OB_ActivationInvalidationPass | HEADER 413 | PARAM LIST CLOSES 416 | OPENING BRACE 417 | CLOSING BRACE 571 | BODY LINES 155 | HEADER-INCLUSIVE LINES 159
  Panels 15 -> SRJ_computeBiasPaneColorARGB | HEADER 12 | PARAM LIST CLOSES 12 | OPENING BRACE 13 | CLOSING BRACE 36 | BODY LINES 24 | HEADER-INCLUSIVE LINES 25
  Panels 252 -> SRJ_RenderBiasPane | HEADER 188 | PARAM LIST CLOSES 189 | OPENING BRACE 190 | CLOSING BRACE 277 | BODY LINES 88 | HEADER-INCLUSIVE LINES 90
  State 126 -> NO ENCLOSING FUNCTION - FILE SCOPE (struct SState member declaration; the struct region is reported in E1)
  State 327 -> SRJ_StateInit | HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194

--- A2. Census: tickFVGIsValid (SEPARATE PATTERN from A1; counts NOT merged with A1, N_LINES never summed across the two patterns) ---
Per-file N_OCC and single per-file N_LINES:
  Experts\SRJ_FlowNexus_EA.mq5: N_OCC=0 | N_LINES=0
  Indicators\SRJ_FlowLogic.mq5: N_OCC=1 | N_LINES=1
  Include\SRJ\SRJ_Alerts.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_BiasEngine.mqh: N_OCC=7 | N_LINES=6   (line 209 carries TWO occurrences: one inside the Print string literal whose content is a space then tickFVGIsValid= , and one outside it)
  Include\SRJ\SRJ_Draw.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Fractals.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_HTFEngine.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_ImbalanceMgr.mqh: N_OCC=8 | N_LINES=8
  Include\SRJ\SRJ_OrderblockMgr.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Panels.mqh: N_OCC=2 | N_LINES=2
  Include\SRJ\SRJ_SeedFormat.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Sessions.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_State.mqh: N_OCC=2 | N_LINES=2
  Include\SRJ\SRJ_Text.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_TickCore.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Types.mqh: N_OCC=0 | N_LINES=0
Pasted distinct-line count = sum of per-file N_LINES = 19 (no caps).
INCIDENTAL: none. No occurrence of tickFVGIsValid lies inside a longer identifier in any of the 16 files.
Paste (each distinct line once, format <file> <line>: <text> [matched: tickFVGIsValid]):
Indicators\SRJ_FlowLogic.mq5 903:          g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0; [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 154:    g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) || [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 171:                            ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 209:             " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0), [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 227:       g_s.tickFVGIsValid = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 281:       g_s.tickFVGIsValid = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_BiasEngine.mqh 382:    if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG) [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 127:             g_s.tickFVGIsValid = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 184:                         " tickFVG=", g_s.tickFVGIsValid, [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 210:                g_s.tickFVGIsValid                = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 244:             g_s.tickFVGIsValid = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 301:                         " tickFVG=", g_s.tickFVGIsValid, [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 327:                g_s.tickFVGIsValid                = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 390:    g_s.tickFVGIsValid = true; [matched: tickFVGIsValid]
Include\SRJ\SRJ_ImbalanceMgr.mqh 415:          g_s.tickFVGIsValid = !latestBiasFVGIsFilled; [matched: tickFVGIsValid]
Include\SRJ\SRJ_Panels.mqh 16:    if(fvgExists && !g_s.tickFVGIsValid) invalid += 1; [matched: tickFVGIsValid]
Include\SRJ\SRJ_Panels.mqh 43:    string line3 = SRJ_buildStatusLine3(obExists,fvgExists,tickOB,g_s.tickFVGIsValid, [matched: tickFVGIsValid]
Include\SRJ\SRJ_State.mqh 127:    bool     tickFVGIsValid; [matched: tickFVGIsValid]
Include\SRJ\SRJ_State.mqh 328:    g_s.tickFVGIsValid                 = true; [matched: tickFVGIsValid]

A2 classification of each non-INCIDENTAL line:
  FlowLogic 903: OTHER - CONTAINS-EQUALS-NOT-TARGET (ternary operand; the = belongs to g_bufFVGValid[target])
  BiasEngine 154: OTHER - CONTAINS-EQUALS-NOT-TARGET (same line as A1 154; occurrence followed by ))
  BiasEngine 171: OTHER (no = on the line)
  BiasEngine 209: OTHER - CONTAINS-EQUALS-NOT-TARGET (ternary operand outside strings; only = is inside the Print string literal - STRING-LITERAL occurrence, no verdict built)
  BiasEngine 227: ASSIGNMENT - target tickFVGIsValid | RHS: true
  BiasEngine 281: ASSIGNMENT - target tickFVGIsValid | RHS: true
  BiasEngine 382: OTHER (no = on the line)
  ImbalanceMgr 127: ASSIGNMENT - target tickFVGIsValid | RHS: true
  ImbalanceMgr 184: OTHER (out-of-string occurrence is a Print argument; every = on the line lies inside the string literal - STRING-LITERAL context)
  ImbalanceMgr 210: ASSIGNMENT - target tickFVGIsValid | RHS: true
  ImbalanceMgr 244: ASSIGNMENT - target tickFVGIsValid | RHS: true
  ImbalanceMgr 301: OTHER (same class as 184)
  ImbalanceMgr 327: ASSIGNMENT - target tickFVGIsValid | RHS: true
  ImbalanceMgr 390: ASSIGNMENT - target tickFVGIsValid | RHS: true
  ImbalanceMgr 415: ASSIGNMENT - target tickFVGIsValid | RHS: !latestBiasFVGIsFilled
  Panels 16: OTHER - CONTAINS-EQUALS-NOT-TARGET (the = belongs to invalid += 1)
  Panels 43: OTHER - CONTAINS-EQUALS-NOT-TARGET (the = belongs to string line3; the occurrence is an argument of the SRJ_buildStatusLine3 call)
  State 127: DECLARATION (struct member declaration; first token bool)
  State 328: ASSIGNMENT - target tickFVGIsValid | RHS: true

Enclosing function for every A2 line (same rule set as A1; fallback never reached):
  FlowLogic 903 -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
  BiasEngine 154, 171, 209, 227, 281 -> SRJ_Bias_DecisionBlock | HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223
  BiasEngine 382 -> SRJ_Bias_WeakFlipLatchPass | HEADER 376 | PARAM LIST CLOSES 376 | OPENING BRACE 377 | CLOSING BRACE 384 | BODY LINES 8 | HEADER-INCLUSIVE LINES 9
  ImbalanceMgr 127, 184, 210, 244, 301, 327 -> SRJ_FVG_CreationRenewalPass | HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241
  ImbalanceMgr 390, 415 -> SRJ_FVG_TickValidRecomputePass | HEADER 380 | PARAM LIST CLOSES 380 | OPENING BRACE 381 | CLOSING BRACE 417 | BODY LINES 37 | HEADER-INCLUSIVE LINES 38
  Panels 16 -> SRJ_computeBiasPaneColorARGB | HEADER 12 | PARAM LIST CLOSES 12 | OPENING BRACE 13 | CLOSING BRACE 36 | BODY LINES 24 | HEADER-INCLUSIVE LINES 25
  Panels 43 -> SRJ_buildBiasPaneText | HEADER 38 | PARAM LIST CLOSES 39 | OPENING BRACE 40 | CLOSING BRACE 51 | BODY LINES 12 | HEADER-INCLUSIVE LINES 14
  State 127 -> NO ENCLOSING FUNCTION - FILE SCOPE
  State 328 -> SRJ_StateInit | HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194

--- A3. Distinct regions containing at least one line classified ASSIGNMENT to either flag (from A1 and A2 ONLY) ---
Selection rule (applied and reported): a region qualifies if and only if at least one of ITS OWN lines was classified ASSIGNMENT in A1 or A2.
  1. Include\SRJ\SRJ_BiasEngine.mqh | SRJ_Bias_DecisionBlock | HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223 | FLAGS ASSIGNED: tickOBIsValid and tickFVGIsValid | ASSIGNMENT LINES: 226, 227, 280, 281
  2. Include\SRJ\SRJ_ImbalanceMgr.mqh | SRJ_FVG_CreationRenewalPass | HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241 | FLAGS ASSIGNED: tickOBIsValid and tickFVGIsValid | ASSIGNMENT LINES: 127, 209, 210, 244, 326, 327
  3. Include\SRJ\SRJ_ImbalanceMgr.mqh | SRJ_FVG_TickValidRecomputePass | HEADER 380 | PARAM LIST CLOSES 380 | OPENING BRACE 381 | CLOSING BRACE 417 | BODY LINES 37 | HEADER-INCLUSIVE LINES 38 | FLAGS ASSIGNED: tickFVGIsValid | ASSIGNMENT LINES: 390, 415
  4. Include\SRJ\SRJ_OrderblockMgr.mqh | SRJ_OB_ReplayActivationInvalidation | HEADER 89 | PARAM LIST CLOSES 94 | OPENING BRACE 95 | CLOSING BRACE 195 | BODY LINES 101 | HEADER-INCLUSIVE LINES 107 | FLAGS ASSIGNED: tickOBIsValid | ASSIGNMENT LINES: 171, 173
  5. Include\SRJ\SRJ_OrderblockMgr.mqh | SRJ_OB_ActivationInvalidationPass | HEADER 413 | PARAM LIST CLOSES 416 | OPENING BRACE 417 | CLOSING BRACE 571 | BODY LINES 155 | HEADER-INCLUSIVE LINES 159 | FLAGS ASSIGNED: tickOBIsValid | ASSIGNMENT LINES: 535, 537
  6. Include\SRJ\SRJ_State.mqh | SRJ_StateInit | HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194 | FLAGS ASSIGNED: tickOBIsValid and tickFVGIsValid | ASSIGNMENT LINES: 327, 328
Integer count of distinct regions: 6
FILE-SCOPE ASSIGNMENT lines: none. Every ASSIGNMENT line has an enclosing function.

================ BLOCK B ================

Block B subject set (defined by A3 and nothing else): every A3 region whose FLAGS ASSIGNED contains tickOBIsValid. Integer count of subject regions: 5. Order: ascending file name then header line:
  B-1  Include\SRJ\SRJ_BiasEngine.mqh | SRJ_Bias_DecisionBlock
  B-2  Include\SRJ\SRJ_ImbalanceMgr.mqh | SRJ_FVG_CreationRenewalPass
  B-3  Include\SRJ\SRJ_OrderblockMgr.mqh | SRJ_OB_ReplayActivationInvalidation
  B-4  Include\SRJ\SRJ_OrderblockMgr.mqh | SRJ_OB_ActivationInvalidationPass
  B-5  Include\SRJ\SRJ_State.mqh | SRJ_StateInit

--- B1. Re-location by the definition-header rule including its fallback (region name used as a FULL identifier) ---
  SRJ_Bias_DecisionBlock: candidates = 1 (line 149, column 0, begins with void, contains the name followed by ( , not a comment). Parameter list closes on line 149. Classification: DEFINITION (no line from 149 through 149 ends in ;). Fallback NOT reached (a DEFINITION at column 0 exists).
  SRJ_FVG_CreationRenewalPass: candidates = 1 (line 108). Parameter list closes on line 110 (multi-line header 108-110). Classification: DEFINITION. Fallback NOT reached.
  SRJ_OB_ReplayActivationInvalidation: candidates = 1 (line 89). Parameter list closes on line 94 (multi-line header 89-94). Classification: DEFINITION. Fallback NOT reached.
  SRJ_OB_ActivationInvalidationPass: candidates = 1 (line 413). Parameter list closes on line 416 (multi-line header 413-416). Classification: DEFINITION. Fallback NOT reached.
  SRJ_StateInit: candidates = 1 (line 297). Parameter list closes on line 297. Classification: DEFINITION. Fallback NOT reached.
  Six-field DEFINITION bounds (brace counting confirmed per region; the opening brace is on the line after the header and is indented; all closes found by brace counting from the opening brace, increment on { , decrement on } , stop at zero):
    SRJ_Bias_DecisionBlock            | HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223
    SRJ_FVG_CreationRenewalPass       | HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241
    SRJ_OB_ReplayActivationInvalidation | HEADER 89 | PARAM LIST CLOSES 94 | OPENING BRACE 95 | CLOSING BRACE 195 | BODY LINES 101 | HEADER-INCLUSIVE LINES 107
    SRJ_OB_ActivationInvalidationPass | HEADER 413 | PARAM LIST CLOSES 416 | OPENING BRACE 417 | CLOSING BRACE 571 | BODY LINES 155 | HEADER-INCLUSIVE LINES 159
    SRJ_StateInit                     | HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194

--- B3. Parameters of each definition header (from its own B2 paste only) ---
  B-1 SRJ_Bias_DecisionBlock (parameter list is a single line, 149):
    1 | int i | BY VALUE | CONTAINS-ASTERISK: no
    2 | bool withinLookbackWindow | BY VALUE | CONTAINS-ASTERISK: no
    3 | bool barClosed | BY VALUE | CONTAINS-ASTERISK: no
  B-2 SRJ_FVG_CreationRenewalPass (parameter list spans lines 108-110; pasted below):
 108: void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],
 109:                                  const datetime &time[],int rates_total,int i,
 110:                                  bool withinLookbackWindow,bool barClosed)
  89: bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,
  90:                                          const double barHigh,
  91:                                          const double barLow,
  92:                                          const double barClose,
  93:                                          const int replayBar,
  94:                                          const int discoveryBar)
 413: void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],
 414:                                        const double &low[],const double &close[],
 415:                                        const datetime &time[],int rates_total,int i,
 416:                                        bool withinLookbackWindow,bool barClosed)
    1 | const double &high[] | BY REFERENCE | CONTAINS-ASTERISK: no
    2 | const double &low[] | BY REFERENCE | CONTAINS-ASTERISK: no
    3 | const datetime &time[] | BY REFERENCE | CONTAINS-ASTERISK: no
    4 | int rates_total | BY VALUE | CONTAINS-ASTERISK: no
    5 | int i | BY VALUE | CONTAINS-ASTERISK: no
    6 | bool withinLookbackWindow | BY VALUE | CONTAINS-ASTERISK: no
    7 | bool barClosed | BY VALUE | CONTAINS-ASTERISK: no
  B-3 SRJ_OB_ReplayActivationInvalidation (parameter list spans lines 89-94; pasted above):
    1 | COrderblock *ob | BY VALUE | CONTAINS-ASTERISK: yes   (pointer passed by value; no &)
    2 | const double barHigh | BY VALUE | CONTAINS-ASTERISK: no
    3 | const double barLow | BY VALUE | CONTAINS-ASTERISK: no
    4 | const double barClose | BY VALUE | CONTAINS-ASTERISK: no
    5 | const int replayBar | BY VALUE | CONTAINS-ASTERISK: no
    6 | const int discoveryBar | BY VALUE | CONTAINS-ASTERISK: no
  B-4 SRJ_OB_ActivationInvalidationPass (parameter list spans lines 413-416; pasted above):
    1 | const double &open[] | BY REFERENCE | CONTAINS-ASTERISK: no
    2 | const double &high[] | BY REFERENCE | CONTAINS-ASTERISK: no
    3 | const double &low[] | BY REFERENCE | CONTAINS-ASTERISK: no
    4 | const datetime &time[] | BY REFERENCE | CONTAINS-ASTERISK: no
    5 | int rates_total | BY VALUE | CONTAINS-ASTERISK: no
    6 | int i | BY VALUE | CONTAINS-ASTERISK: no
    7 | bool withinLookbackWindow | BY VALUE | CONTAINS-ASTERISK: no
    8 | bool barClosed | BY VALUE | CONTAINS-ASTERISK: no
  B-5 SRJ_StateInit (parameter list is a single line, 297): NO PARAMETERS.

--- B4. Lines assigning to tickOBIsValid per region (assignment-target rule; RHS verbatim between [ and ]; the leading space after the = is part of the verbatim text) ---
  B-1 SRJ_Bias_DecisionBlock (paste searched: B2 paste of lines 150-371):
    226:       g_s.tickOBIsValid = true; | RHS [ true]
    280:       g_s.tickOBIsValid = true; | RHS [ true]
    Integer count for this region: 2
  B-2 SRJ_FVG_CreationRenewalPass (paste searched: B2 paste of lines 111-348):
    209:                g_s.tickOBIsValid                 = true; | RHS [ true]
    326:                g_s.tickOBIsValid                 = true; | RHS [ true]
    Integer count for this region: 2
  B-3 SRJ_OB_ReplayActivationInvalidation (paste searched: B2 paste of lines 95-195):
    171:                g_s.tickOBIsValid = false; | RHS [ false]
    173:                g_s.tickOBIsValid = true; | RHS [ true]
    Integer count for this region: 2
  B-4 SRJ_OB_ActivationInvalidationPass (paste searched: B2 paste of lines 417-571):
    535:                      g_s.tickOBIsValid = false; | RHS [ false]
    537:                      g_s.tickOBIsValid = true; | RHS [ true]
    Integer count for this region: 2
  B-5 SRJ_StateInit (paste searched: B2 paste of lines 298-490):
    327:    g_s.tickOBIsValid                  = true; | RHS [ true]
    Integer count for this region: 1
  Integer total across regions: 9
  ABSENT was not needed: every subject region contains at least one tickOBIsValid assignment (a count of 0 would have been a result).

--- B2. Region pastes (paste-sizing rule: six-field bounds reported first in B1; a region is pasted WHOLE if BODY LINES <= 300) ---
  B-1 SRJ_Bias_DecisionBlock: BODY LINES 222 (bound tested: 222 <= 300) -> WHOLE. Paste = opening brace line 150 through closing brace line 371.
  B-2 SRJ_FVG_CreationRenewalPass: BODY LINES 238 (238 <= 300) -> WHOLE. Paste = 111 through 348.
  B-3 SRJ_OB_ReplayActivationInvalidation: BODY LINES 101 (101 <= 300) -> WHOLE. Paste = 95 through 195.
  B-4 SRJ_OB_ActivationInvalidationPass: BODY LINES 155 (155 <= 300) -> WHOLE. Paste = 417 through 571.
  B-5 SRJ_StateInit: BODY LINES 193 (193 <= 300) -> WHOLE. Paste = 298 through 490.

  >>> B2 PASTE B-1: SRJ_BiasEngine.mqh lines 150-371 (one pasted source line per output line, line numbers and all leading whitespace preserved) <<<
 150:   {
 151:    if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))
 152:       return;
 153: 
 154:    g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||
 155:                             g_s.hasPersistedOpposingFVG;
 156: 
 157:    int currentOpposingCount = (g_s.currentBias=="bullish")
 158:                               ? g_s.bearishOBInvalidationCount
 159:                               : g_s.bullishOBInvalidationCount;
 160:    bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;
 161: 
 162:    int currentInBiasCount = (g_s.currentBias=="bullish")
 163:                             ? g_s.bullishOBInvalidationCount
 164:                             : g_s.bearishOBInvalidationCount;
 165:    bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;
 166: 
 167:    // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.
 168:    // The latch captures the state before FVG renewal resets; the live check captures
 169:    // any weak signal that becomes true during this bar's FVG or fill passes.
 170:    bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||
 171:                            ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&
 172:                             g_s.hasPersistedOpposingFVG);
 173: 
 174:    int countReferenceBar = g_s.currentStructureStartBar;
 175: 
 176:    if(SRJ_InDebugWindow(i))
 177:      {
 178:       Print("SRJ DEC t=", SRJ_BarTimeStr(i),
 179:             " bar=", i,
 180:             " biasBefore=", g_s.currentBias,
 181:             " inBias=", currentInBiasCount,
 182:             " opp=", currentOpposingCount,
 183:             " bull=", g_s.bullishOBInvalidationCount,
 184:             " bear=", g_s.bearishOBInvalidationCount,
 185:             " structStart=", g_s.currentStructureStartBar,
 186:             " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),
 187:             " countRef=", countReferenceBar,
 188:             " countRefT=", SRJ_BarTimeStr(countReferenceBar),
 189:             " lastRelStruct=", g_s.lastRelevantStructureBar,
 190:             " obInvBound=", g_s.obInvalidationBoundary,
 191:             " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
 192:             " lastRenewalOB=", g_s.lastRenewalOBBar,
 193:             " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
 194:             " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),
 195:             " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
 196:             " strong=", (doStrongFlip ? 1 : 0),
 197:             " renew=", (doRenewal ? 1 : 0),
 198:             " weak=", (doWeakSignalFlip ? 1 : 0));
 199: 
 200:       Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),
 201:             " bar=", i,
 202:             " oppCount=", currentOpposingCount,
 203:             " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),
 204:             " renewResult=", (doRenewal ? 1 : 0),
 205:             " inBiasCount=", currentInBiasCount,
 206:             " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),
 207:             " strongResult=", (doStrongFlip ? 1 : 0),
 208:             " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),
 209:             " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),
 210:             " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
 211:             " weakResult=", (doWeakSignalFlip ? 1 : 0));
 212:      }
 213: 
 214:    if(doRenewal)
 215:      {
 216:       g_s.lastRelevantStructureBar = i;
 217:       g_s.structureConfirmedThisBar = true;
 218:       g_s.wasBiasFlip = false;
 219:       g_s.drawStructureRenewalLineNow = true;
 220:       g_s.renewalDirection = g_s.currentBias;
 221:       g_s.isDoubleOB = true;
 222:       g_s.suppressBiasPaneStatusThisBar = true;
 223:       g_s.obInvalidationBoundary = i;
 224:       g_s.fvgDetectionBoundary = i;
 225:       // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)
 226:       g_s.tickOBIsValid = true;
 227:       g_s.tickFVGIsValid = true;
 228:       g_s.hasPersistedOpposingFVG = false;
 229:       
 230:       // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
 231:       // In-bias invalidations continue to accumulate toward the next strong flip.
 232:       if(g_s.currentBias == "bullish")
 233:         {
 234:          // Bullish renewal: reset bearish (opposing) counter only
 235:          g_s.bearishOBInvalidationCount = 0;
 236:          g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 237:         }
 238:       else
 239:         {
 240:          // Bearish renewal: reset bullish (opposing) counter only
 241:          g_s.bullishOBInvalidationCount = 0;
 242:          g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 243:         }
 244: 
 245:       g_s.checklistActivated = false;
 246:       if(g_s.currentBias == "bullish")
 247:          g_s.bullishStructureRenewalAlert = true;
 248:       else
 249:          g_s.bearishStructureRenewalAlert = true;
 250: 
 251:       if(g_htfDebugLog)
 252:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 253:                " kind=doRenewal",
 254:                " bias=", g_s.currentBias,
 255:                " resetOn=true");
 256:      }
 257:    else if(doStrongFlip || doWeakSignalFlip)
 258:      {
 259:       string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
 260:       g_s.currentBias = nextBias;
 261:       g_s.currentStructureStartBar = i;
 262:       g_s.lastRelevantStructureBar = i;
 263:       g_s.structureConfirmedThisBar = true;
 264:       g_s.wasBiasFlip = true;
 265:       g_s.drawBiasLineNow = true;
 266:       g_s.newBiasDirection = nextBias;
 267:       if(doStrongFlip)
 268:         {
 269:          g_s.isDoubleOB = true;
 270:          g_s.suppressBiasPaneStatusThisBar = true;
 271:         }
 272:       else
 273:         {
 274:          g_s.isDoubleOB = false;
 275:         }
 276:       g_s.obInvalidationBoundary = i;
 277:       g_s.fvgDetectionBoundary = i;
 278:       g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg
 279:       g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg
 280:       g_s.tickOBIsValid = true;
 281:       g_s.tickFVGIsValid = true;
 282:       g_s.hasPersistedOpposingFVG = false;
 283:       g_s.bullishOBInvalidationCount = 0;
 284:       g_s.bearishOBInvalidationCount = 0;
 285:       g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 286:       g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 287:       g_s.checklistActivated = false;
 288:       if(nextBias == "bullish")
 289:          g_s.bullishBiasFlipAlert = true;
 290:       else
 291:          g_s.bearishBiasFlipAlert = true;
 292: 
 293:       string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
 294:       if(g_htfDebugLog)
 295:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 296:                " kind=", flipKind,
 297:                " bias=", g_s.currentBias,
 298:                " resetOn=true");
 299:      }
 300: 
 301:    if(doRenewal)
 302:      {
 303:       // Renewals always take all-mode path, even if a weak signal also fired this bar.
 304:       // Resolve any pending slot-2 promotion from an earlier bar first.
 305:       // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
 306:       // created on an earlier bar is not in g_intrabarObjects, so an intrabar
 307:       // width change would survive the snapshot rollback while isPromoted reverts.
 308:       if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
 309:          SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
 310:                                 g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);
 311: 
 312:       g_s.pendingPromoteBar2       = i;
 313:       g_s.pendingPromoteBias2      = g_s.currentBias;
 314:       g_s.pendingPromoteMode2      = "all";
 315:       g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
 316:       g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
 317:      }
 318:    else if(doStrongFlip)
 319:      {
 320:       // Strong flips also use all-mode.
 321:       // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
 322:       // created on an earlier bar is not in g_intrabarObjects, so an intrabar
 323:       // width change would survive the snapshot rollback while isPromoted reverts.
 324:       if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
 325:          SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
 326:                                 g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);
 327: 
 328:       g_s.pendingPromoteBar2       = i;
 329:       g_s.pendingPromoteBias2      = g_s.currentBias;
 330:       g_s.pendingPromoteMode2      = "all";
 331:       g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
 332:       g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
 333:      }
 334:    else if(doWeakSignalFlip || g_s.initialBiasJustSet)
 335:      {
 336:       // Weak signals promote NEW-bias OBs (the side that survived and now defines the bias).
 337:       // At this point g_s.currentBias has already been flipped to the new bias.
 338:       // Initial bias also promotes the current (new) bias.
 339:       SRJ_QueueNearestPromotion(i,g_s.currentBias,SRJ_NA_INT,2);
 340:      }
 341: 
 342:    // Invariant: a structural renewal only ever runs in the direction of the bias
 343:    // that is live at the end of this bar.  SRJ_FVG_CreationRenewalPass runs earlier
 344:    // in the bar and can raise the flag against the pre-decision bias; if a flip
 345:    // then lands on the same bar, that flag now points the wrong way.  Drop it
 346:    // rather than draw a renewal against the new bias, and withdraw the alert it
 347:    // would have fired.
 348:    if(g_s.drawStructureRenewalLineNow &&
 349:       !SrjIsNa(g_s.renewalDirection) &&
 350:       g_s.renewalDirection != g_s.currentBias)
 351:      {
 352:       if(SRJ_InDebugWindow(i))
 353:          Print("SRJ RENEWAL-DROP t=", SRJ_BarTimeStr(i), " bar=", i,
 354:                " renewalDir=", g_s.renewalDirection,
 355:                " bias=", g_s.currentBias,
 356:                " reason=directionMismatch");
 357: 
 358:       g_s.drawStructureRenewalLineNow  = false;
 359:       g_s.renewalDirection             = SRJ_NA_STR;
 360:       g_s.bullishStructureRenewalAlert = false;
 361:       g_s.bearishStructureRenewalAlert = false;
 362:      }
 363: 
 364:    if(SRJ_InDebugWindow(i))
 365:       Print("SRJ DEC2 t=", SRJ_BarTimeStr(i),
 366:             " bar=", i,
 367:             " biasAfterDecision=", g_s.currentBias,
 368:             " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
 369:             " obInvBound=", g_s.obInvalidationBoundary,
 370:             " lastRenewalOB=", g_s.lastRenewalOBBar);
 371:   }

  >>> B2 PASTE B-2: SRJ_ImbalanceMgr.mqh lines 111-348 <<<
 111:   {
 112:    if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))
 113:       return;
 114: 
 115:    if(low[i] > srjH(high,i,2))
 116:      {
 117:       CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,
 118:                                  true,i - 2,low[i],srjH(high,i,2),i);
 119:       g_imbalances.Add(newBullFVG);
 120: 
 121:       bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
 122:       if(fvgWithinStructure)
 123:         {
 124:          bool isInBiasFVG = (g_s.currentBias == "bullish");
 125:          if(isInBiasFVG)
 126:            {
 127:             g_s.tickFVGIsValid = true;
 128: 
 129:             // Strict-nearest selection, identical to the promotion path, so the OB
 130:             // that triggers the renewal is the same OB the promotion will target.
 131:             int  latestOBValidationBar = SRJ_NA_INT;
 132:             bool hasNewOB     = false;
 133:             int  scanStartBar = SRJ_NA_INT;
 134:             int  scanValBar   = SRJ_NA_INT;
 135:             bool scanIsNew    = false;
 136:             COrderblock *renewalOB = NULL;
 137: 
 138:             int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);
 139:             if(nearestIdx > -1)
 140:               {
 141:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
 142:                if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
 143:                  {
 144:                   scanStartBar = nearestOB.startBar;
 145:                   scanValBar   = nearestOB.validationBar;
 146:                   scanIsNew    = !nearestOB.hasDrivenRenewal;
 147:                   if(scanIsNew)
 148:                     {
 149:                      latestOBValidationBar = nearestOB.validationBar;
 150:                      hasNewOB              = true;
 151:                      renewalOB             = nearestOB;
 152:                     }
 153:                  }
 154:               }
 155: 
 156:             if(SRJ_InDebugWindow(i))
 157:                Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
 158:                      " dir=bullish",
 159:                      " nearestIdx=", nearestIdx,
 160:                      " obStart=", scanStartBar,
 161:                      " obStartT=", SRJ_BarTimeStr(scanStartBar),
 162:                      " obVal=", scanValBar,
 163:                      " obValT=", SRJ_BarTimeStr(scanValBar),
 164:                      " boundary=", g_s.obInvalidationBoundary,
 165:                      " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
 166:                      " lastRenewalOB=", g_s.lastRenewalOBBar,
 167:                      " isNew=", (scanIsNew ? 1 : 0),
 168:                      " hasNewOB=", (hasNewOB ? 1 : 0),
 169:                      " justChangedBias=", (g_s.justChangedBias ? 1 : 0));
 170: 
 171:             if(nearestIdx < 0)
 172:                SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);
 173: 
 174:             if(hasNewOB && !g_s.justChangedBias)
 175:               {
 176:                // --- PRE-RESET STATE RECORDER ---
 177:                if(g_htfDebugLog &&
 178:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
 179:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
 180:                         " dir=", g_s.currentBias,
 181:                         " bull=", g_s.bullishOBInvalidationCount,
 182:                         " bear=", g_s.bearishOBInvalidationCount,
 183:                         " tickOB=", g_s.tickOBIsValid,
 184:                         " tickFVG=", g_s.tickFVGIsValid,
 185:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
 186:                         " checklistAct=", g_s.checklistActivated,
 187:                         " structStart=", g_s.currentStructureStartBar,
 188:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
 189:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
 190:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
 191:                         " resetOn=true");
 192:                // ------------------------------
 193: 
 194:                g_s.isDoubleOB = false;
 195:                g_s.lastRelevantStructureBar = i;
 196:                g_s.structureConfirmedThisBar = true;
 197:                g_s.drawStructureRenewalLineNow = true;
 198:                g_s.renewalDirection = "bullish";
 199:                g_s.hasPersistedOpposingFVG = false;
 200:                
 201:                g_s.bullishStructureRenewalAlert = true;
 202:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
 203:                SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
 204:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
 205:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
 206:                g_s.obInvalidationBoundary = i;
 207:                g_s.fvgDetectionBoundary = i;
 208: 
 209:                g_s.tickOBIsValid                 = true;
 210:                g_s.tickFVGIsValid                = true;
 211:                // Selective reset: bullish bias renewal zeros bearish (opposing) counter only
 212:                g_s.bearishOBInvalidationCount    = 0;
 213:                g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 214:                g_s.checklistActivated            = false;
 215:                  
 216:                if(g_htfDebugLog)
 217:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 218:                         " kind=fvgRenewal",
 219:                         " bias=", g_s.currentBias,
 220:                         " resetOn=true");
 221:               }
 222:            }
 223:          else
 224:            {
 225:             // Opposing FVG under a bearish bias.
 226:             g_s.hasPersistedOpposingFVG = true;
 227:             SRJ_QueueOpposingPromotion(i,"bullish");
 228:            }
 229:         }
 230:      }
 231: 
 232:    if(high[i] < srjL(low,i,2))
 233:      {
 234:       CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,
 235:                                  false,i - 2,srjL(low,i,2),high[i],i);
 236:       g_imbalances.Add(newBearFVG);
 237: 
 238:       bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
 239:       if(fvgWithinStructure)
 240:         {
 241:          bool isInBiasFVG = (g_s.currentBias == "bearish");
 242:          if(isInBiasFVG)
 243:            {
 244:             g_s.tickFVGIsValid = true;
 245: 
 246:             // Strict-nearest selection, identical to the promotion path, so the OB
 247:             // that triggers the renewal is the same OB the promotion will target.
 248:             int  latestOBValidationBar = SRJ_NA_INT;
 249:             bool hasNewOB     = false;
 250:             int  scanStartBar = SRJ_NA_INT;
 251:             int  scanValBar   = SRJ_NA_INT;
 252:             bool scanIsNew    = false;
 253:             COrderblock *renewalOB = NULL;
 254: 
 255:             int nearestIdx = SRJ_StrictNearestOBIndex("bearish",g_s.obInvalidationBoundary);
 256:             if(nearestIdx > -1)
 257:               {
 258:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
 259:                if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
 260:                  {
 261:                   scanStartBar = nearestOB.startBar;
 262:                   scanValBar   = nearestOB.validationBar;
 263:                   scanIsNew    = !nearestOB.hasDrivenRenewal;
 264:                   if(scanIsNew)
 265:                     {
 266:                      latestOBValidationBar = nearestOB.validationBar;
 267:                      hasNewOB              = true;
 268:                      renewalOB             = nearestOB;
 269:                     }
 270:                  }
 271:               }
 272: 
 273:             if(SRJ_InDebugWindow(i))
 274:                Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
 275:                      " dir=bearish",
 276:                      " nearestIdx=", nearestIdx,
 277:                      " obStart=", scanStartBar,
 278:                      " obStartT=", SRJ_BarTimeStr(scanStartBar),
 279:                      " obVal=", scanValBar,
 280:                      " obValT=", SRJ_BarTimeStr(scanValBar),
 281:                      " boundary=", g_s.obInvalidationBoundary,
 282:                      " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
 283:                      " lastRenewalOB=", g_s.lastRenewalOBBar,
 284:                      " isNew=", (scanIsNew ? 1 : 0),
 285:                      " hasNewOB=", (hasNewOB ? 1 : 0),
 286:                      " justChangedBias=", (g_s.justChangedBias ? 1 : 0));
 287: 
 288:             if(nearestIdx < 0)
 289:                SRJ_DumpNearestOBCandidates(i,"bearish",g_s.obInvalidationBoundary);
 290: 
 291:             if(hasNewOB && !g_s.justChangedBias)
 292:               {
 293:                // --- PRE-RESET STATE RECORDER ---
 294:                if(g_htfDebugLog &&
 295:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
 296:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
 297:                         " dir=", g_s.currentBias,
 298:                         " bull=", g_s.bullishOBInvalidationCount,
 299:                         " bear=", g_s.bearishOBInvalidationCount,
 300:                         " tickOB=", g_s.tickOBIsValid,
 301:                         " tickFVG=", g_s.tickFVGIsValid,
 302:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
 303:                         " checklistAct=", g_s.checklistActivated,
 304:                         " structStart=", g_s.currentStructureStartBar,
 305:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
 306:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
 307:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
 308:                         " resetOn=true");
 309:                // ------------------------------
 310: 
 311:                g_s.isDoubleOB = false;
 312:                g_s.lastRelevantStructureBar = i;
 313:                g_s.structureConfirmedThisBar = true;
 314:                g_s.drawStructureRenewalLineNow = true;
 315:                g_s.renewalDirection = "bearish";
 316:                g_s.hasPersistedOpposingFVG = false;
 317:                
 318:                g_s.bearishStructureRenewalAlert = true;
 319:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
 320:                SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);
 321:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
 322:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
 323:                g_s.obInvalidationBoundary = i;
 324:                g_s.fvgDetectionBoundary = i;
 325: 
 326:                g_s.tickOBIsValid                 = true;
 327:                g_s.tickFVGIsValid                = true;
 328:                // Selective reset: bearish bias renewal zeros bullish (opposing) counter only
 329:                g_s.bullishOBInvalidationCount    = 0;
 330:                g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 331:                g_s.checklistActivated            = false;
 332:                  
 333:                if(g_htfDebugLog)
 334:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 335:                         " kind=fvgRenewal",
 336:                         " bias=", g_s.currentBias,
 337:                         " resetOn=true");
 338:               }
 339:            }
 340:          else
 341:            {
 342:             // Opposing FVG under a bullish bias — the 16:05 EURUSD M5 case.
 343:             g_s.hasPersistedOpposingFVG = true;
 344:             SRJ_QueueOpposingPromotion(i,"bearish");
 345:            }
 346:         }
 347:      }
 348:   }

  >>> B2 PASTE B-3: SRJ_OrderblockMgr.mqh lines 95-195 <<<
  95:   {
  96:    if(ob==NULL) return false;
  97: 
  98:    bool didActivate = false;
  99:    bool didInvalidate = false;
 100: 
 101:    // Activation test (same as SRJ_OB_ActivationInvalidationPass)
 102:    if(!ob.isActivated)
 103:      {
 104:       bool shouldActivate = false;
 105:       if(ob.isBullish)
 106:          shouldActivate = (barHigh > ob.high);
 107:       else
 108:          shouldActivate = (barLow < ob.low);
 109: 
 110:       if(shouldActivate)
 111:         {
 112:          ob.isActivated   = true;
 113:          ob.isValid       = true;
 114:          ob.validationBar = replayBar;
 115:          didActivate      = true;
 116:         }
 117:      }
 118: 
 119:    // CRITICAL FIX: Only attempt invalidation if the OB was activated on a PRIOR bar.
 120:    // If activation happened THIS bar (didActivate == true), skip invalidation entirely.
 121:    if(ob.isActivated && ob.isValid && !didActivate)
 122:      {
 123:       bool closedBeyondInvalidation = false;
 124:       if(ob.isBullish)
 125:          closedBeyondInvalidation = (barClose < ob.invalidationLevel);
 126:       else
 127:          closedBeyondInvalidation = (barClose > ob.invalidationLevel);
 128: 
 129:       if(closedBeyondInvalidation)
 130:         {
 131:          ob.isValid         = false;
 132:          ob.invalidationBar = replayBar;
 133:          didInvalidate      = true;
 134: 
 135:          int countReferenceBar = g_s.currentStructureStartBar;
 136:          bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
 137:          bool refOk = !SrjIsNa(countReferenceBar) &&
 138:                       (ob.invalidationBar >= countReferenceBar) &&
 139:                       !SrjIsNa(ob.validationBar) &&
 140:                       !sameBarValInv;
 141: 
 142:          if(SRJ_InDebugWindow(discoveryBar))
 143:             Print("SRJ INV t=", SRJ_BarTimeStr(discoveryBar),
 144:                   " bar=", discoveryBar,
 145:                   " source=replay",
 146:                   " evtBar=", replayBar,
 147:                   " evtBarT=", SRJ_BarTimeStr(replayBar),
 148:                   " obStart=", ob.startBar,
 149:                   " obStartT=", SRJ_BarTimeStr(ob.startBar),
 150:                   " obVal=", ob.validationBar,
 151:                   " obInv=", ob.invalidationBar,
 152:                   " obCreation=", ob.creationBar,  // NEW
 153:                   " isBull=", (ob.isBullish ? 1 : 0),
 154:                   " bias=", g_s.currentBias,
 155:                   " ref=", countReferenceBar,
 156:                   " refT=", SRJ_BarTimeStr(countReferenceBar),
 157:                   " refOk=", (refOk ? 1 : 0),
 158:                   " sameBarValInv=", (sameBarValInv ? 1 : 0));
 159: 
 160:          if(refOk)
 161:            {
 162:             // Append to history arrays (unified with Fix 1.3)
 163:             if(ob.isBullish)
 164:                g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar
 165:             else
 166:                g_bearishInvalidationBarsHistory.Add(discoveryBar);
 167: 
 168:             bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 169:                             (g_s.currentBias=="bearish" && !ob.isBullish);
 170:             if(isInBias)
 171:                g_s.tickOBIsValid = false;
 172:             else
 173:                g_s.tickOBIsValid = true;
 174: 
 175:             // Counter updates attributed to discovery bar for SRJ_OB_CounterAggregationPass to see
 176:             if(ob.isBullish)
 177:               {
 178:                if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 179:                   g_s.firstBullishOBInvalidationBar = discoveryBar;
 180:                g_s.lastBullishOBInvalidationBar = discoveryBar;
 181:                g_s.bullishOBInvalidationsThisBar += 1;
 182:               }
 183:             else
 184:               {
 185:                if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 186:                   g_s.firstBearishOBInvalidationBar = discoveryBar;
 187:                g_s.lastBearishOBInvalidationBar = discoveryBar;
 188:                g_s.bearishOBInvalidationsThisBar += 1;
 189:               }
 190:            }
 191:         }
 192:      }
 193: 
 194:    return (didActivate && didInvalidate);  // Should now always return false with the fix
 195:   }

  >>> B2 PASTE B-4: SRJ_OrderblockMgr.mqh lines 417-571 <<<
 417:   {
 418:    if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
 419:       return;
 420: 
 421:    double liveHigh  = high[i];
 422:    double liveLow   = low[i];
 423:    double liveClose = close[i];
 424: 
 425:    for(int k = g_orderblocks.Total() - 1; k >= 0; k--)
 426:      {
 427:       COrderblock *ob = GetOB(g_orderblocks,k);
 428:       if(ob==NULL) continue;
 429: 
 430:       if(!ob.isActivated)
 431:         {
 432:          bool shouldActivate = false;
 433:          if(ob.isBullish)
 434:             shouldActivate = (liveHigh > ob.high);
 435:          else
 436:             shouldActivate = (liveLow < ob.low);
 437: 
 438:          if(shouldActivate)
 439:            {
 440:             ob.isActivated   = true;
 441:             ob.isValid       = true;
 442:             ob.validationBar = i;
 443: 
 444:             if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
 445:             if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
 446: 
 447:             int safeX1 = (int)MathMax(ob.startBar, i - 4500);
 448:             int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);
 449: 
 450:             if(ob.isBullish && g_showValidBullishOB)
 451:               {
 452:                ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
 453:                                     safeX1,ob.high,safeX2,ob.high,
 454:                                     g_bullishOBColor,g_lineThickness,
 455:                                     SRJ_STYLE_SOLID,g_extendValid);
 456:                ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
 457:                                     safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
 458:                                     g_validMidlineColor,g_lineThickness,
 459:                                     SRJ_STYLE_DOTTED,g_extendValid);
 460:               }
 461:             else if(!ob.isBullish && g_showValidBearishOB)
 462:               {
 463:                ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
 464:                                     safeX1,ob.low,safeX2,ob.low,
 465:                                     g_bearishOBColor,g_lineThickness,
 466:                                     SRJ_STYLE_SOLID,g_extendValid);
 467:                ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
 468:                                     safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
 469:                                     g_validMidlineColor,g_lineThickness,
 470:                                     SRJ_STYLE_DOTTED,g_extendValid);
 471:               }
 472:             else
 473:               {
 474:                ob.obLineName  = "";
 475:                ob.midLineName = "";
 476:               }
 477:            }
 478:         }
 479: 
 480:       if(barClosed)
 481:         {
 482:          if(ob.isActivated && ob.isValid)
 483:            {
 484:             bool closedBeyondInvalidation = false;
 485:             if(ob.isBullish)
 486:                closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
 487:             else
 488:                closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
 489: 
 490:             // CRITICAL FIX: Check temporal rules BEFORE changing any state
 491:             bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);
 492:             bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW
 493: 
 494:             if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)  // NEW guard
 495:               {
 496:                ob.isValid         = false;
 497:                ob.invalidationBar = i;
 498: 
 499:                int countReferenceBar = g_s.currentStructureStartBar;
 500:                
 501:                // This check is now redundant (will never be true) but kept for safety
 502:                bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
 503:                
 504:                bool refOk = !SrjIsNa(countReferenceBar) &&
 505:                             (ob.invalidationBar >= countReferenceBar) &&
 506:                             !SrjIsNa(ob.validationBar) &&
 507:                             !sameBarValInv;
 508:                
 509:                if(SRJ_InDebugWindow(i))
 510:                   Print("SRJ INV t=", SRJ_BarTimeStr(i),
 511:                         " bar=", i,
 512:                         " obStart=", ob.startBar,
 513:                         " obStartT=", SRJ_BarTimeStr(ob.startBar),
 514:                         " obVal=", ob.validationBar,
 515:                         " obInv=", ob.invalidationBar,
 516:                         " obCreation=", ob.creationBar,  // NEW debug output
 517:                         " isBull=", (ob.isBullish ? 1 : 0),
 518:                         " bias=", g_s.currentBias,
 519:                         " ref=", countReferenceBar,
 520:                         " refT=", SRJ_BarTimeStr(countReferenceBar),
 521:                         " refOk=", (refOk ? 1 : 0),
 522:                         " sameBarValInv=", (sameBarValInv ? 1 : 0));
 523:                
 524:                if(refOk)
 525:                  {
 526:                   // Append to history arrays when refOk passes
 527:                   if(ob.isBullish)
 528:                      g_bullishInvalidationBarsHistory.Add(i);
 529:                   else
 530:                      g_bearishInvalidationBarsHistory.Add(i);
 531: 
 532:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 533:                                   (g_s.currentBias=="bearish" && !ob.isBullish);
 534:                   if(isInBias)
 535:                      g_s.tickOBIsValid = false;
 536:                   else
 537:                      g_s.tickOBIsValid = true;
 538: 
 539:                   if(ob.isBullish)
 540:                     {
 541:                      if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 542:                         g_s.firstBullishOBInvalidationBar = i;
 543:                      g_s.lastBullishOBInvalidationBar = i;
 544:                      g_s.bullishOBInvalidationsThisBar += 1;
 545:                     }
 546:                   else
 547:                     {
 548:                      if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 549:                         g_s.firstBearishOBInvalidationBar = i;
 550:                      g_s.lastBearishOBInvalidationBar = i;
 551:                      g_s.bearishOBInvalidationsThisBar += 1;
 552:                     }
 553:                  }
 554: 
 555:                if(ob.HasObLine())
 556:                  {
 557:                   color invalidColor = ob.isBullish ? g_invalidatedBullishColor
 558:                                                     : g_invalidatedBearishColor;
 559:                   SRJ_SetTrendColor(ob.obLineName, invalidColor);
 560:                   SRJ_SetTrendExtend(ob.obLineName, g_extendInvalidated);
 561:                  }
 562:                if(ob.HasMidLine())
 563:                  {
 564:                   SRJ_SetTrendColor(ob.midLineName, g_invalidatedMidlineColor);
 565:                   SRJ_SetTrendExtend(ob.midLineName, g_extendInvalidated);
 566:                  }
 567:               }
 568:            }
 569:         }
 570:      }
 571:   }

  >>> B2 PASTE B-5: SRJ_State.mqh lines 298-490 <<<
 298:   {
 299:    g_s.priceATRValue       = SRJ_NA_DBL;
 300:    g_s.effectiveLookback   = 5000;
 301:    g_s.baseLookback        = 5000;
 302:    g_s.robustnessLimitBars = 5000;
 303:    g_s.usedBars            = 0;
 304:    g_s.coverageDays        = 0.0;
 305:    g_s.coverageText        = "";
 306: 
 307:    g_s.currentBias                    = SRJ_NA_STR;
 308:    g_s.currentStructureStartBar       = SRJ_NA_INT;
 309:    g_s.lastRelevantStructureBar       = SRJ_NA_INT;
 310:    g_s.lastBullishOBInvalidationBar   = SRJ_NA_INT;
 311:    g_s.lastBearishOBInvalidationBar   = SRJ_NA_INT;
 312:    g_s.newAnchorBar                   = SRJ_NA_INT;
 313:    g_s.bestBullishOBBar               = SRJ_NA_INT;
 314:    g_s.bestBullishOBHigh              = SRJ_NA_DBL;
 315:    g_s.bestBullishOBLow               = SRJ_NA_DBL;
 316:    g_s.bestBullishOBOpen              = SRJ_NA_DBL;
 317:    g_s.bestBearishOBBar               = SRJ_NA_INT;
 318:    g_s.bestBearishOBHigh              = SRJ_NA_DBL;
 319:    g_s.bestBearishOBLow               = SRJ_NA_DBL;
 320:    g_s.bestBearishOBOpen              = SRJ_NA_DBL;
 321:    g_s.cachedSwingBarBullish          = SRJ_NA_INT;
 322:    g_s.cachedSwingBarBearish          = SRJ_NA_INT;
 323:    g_s.obInvalidationBoundary         = SRJ_NA_INT;
 324:    g_s.fvgDetectionBoundary           = SRJ_NA_INT;
 325:    g_s.currentLegHasXOB                = false;   // [Section 8]
 326:    g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]
 327:    g_s.tickOBIsValid                  = true;
 328:    g_s.tickFVGIsValid                 = true;
 329:    g_s.hasPersistedOpposingFVG        = false;
 330:    g_s.inBiasOBInvalidationCount      = 0;
 331:    g_s.opposingOBInvalidationCount    = 0;
 332:    g_s.bullishOBInvalidationCount     = 0;
 333:    g_s.bearishOBInvalidationCount     = 0;
 334:    g_s.firstBullishOBInvalidationBar  = SRJ_NA_INT;
 335:    g_s.firstBearishOBInvalidationBar  = SRJ_NA_INT;
 336:    g_s.bullishOBCountedThisBar        = false;
 337:    g_s.bearishOBCountedThisBar        = false;
 338:    g_s.bullishOBInvalidationsThisBar  = 0;
 339:    g_s.bearishOBInvalidationsThisBar  = 0;
 340:    g_s.isDoubleOB                     = false;
 341:    g_s.isInitialFlipBar               = false;
 342:    g_s.checklistActivated             = false;
 343:    g_s.weakFlipPreconditionMet        = false;
 344:    g_s.suppressBiasPaneStatusThisBar  = false;
 345:    g_s.structureConfirmedThisBar      = false;
 346:    g_s.wasBiasFlip                    = false;
 347:    g_s.oldBias                        = SRJ_NA_STR;
 348:    g_s.justChangedBias                = false;
 349:    g_s.initialBiasJustSet             = false;
 350:    g_s.drawBiasLineNow                = false;
 351:    g_s.newBiasDirection               = SRJ_NA_STR;
 352:    g_s.drawStructureRenewalLineNow    = false;
 353:    g_s.renewalDirection               = SRJ_NA_STR;
 354:    g_s.bullishBiasFlipAlert           = false;
 355:    g_s.bearishBiasFlipAlert           = false;
 356:    g_s.bullishStructureRenewalAlert   = false;
 357:    g_s.bearishStructureRenewalAlert   = false;
 358:    g_s.biasLabelName                  = "";
 359:    g_s.lastRenewalOBBar               = SRJ_NA_INT;
 360:    g_s.pendingPromoteBar              = SRJ_NA_INT;
 361:    g_s.pendingPromoteBias             = SRJ_NA_STR;
 362:    g_s.pendingPromoteMode             = SRJ_NA_STR;
 363:    g_s.pendingPromoteBoundary         = SRJ_NA_INT;
 364:    g_s.pendingPromoteTargetBar        = SRJ_NA_INT;
 365:    g_s.pendingPromoteBar2             = SRJ_NA_INT;
 366:    g_s.pendingPromoteBias2            = SRJ_NA_STR;
 367:    g_s.pendingPromoteMode2            = SRJ_NA_STR;
 368:    g_s.pendingPromoteBoundary2        = SRJ_NA_INT;
 369:    g_s.pendingPromoteTargetBar2       = SRJ_NA_INT;
 370:    g_s.safeLimitBar                   = 0;
 371:    g_s.strictLimitBar                 = 0;
 372:    g_s.withinLookbackWindow           = false;
 373: 
 374:    g_s.sessDay                = SRJ_NA_INT;
 375:    g_s.sessLastProcessedBar   = SRJ_NA_INT;   // NEW
 376:    g_s.dayHigh                = SRJ_NA_DBL;
 377:    g_s.dayLow                 = SRJ_NA_DBL;
 378:    g_s.prevDayHigh            = SRJ_NA_DBL;
 379:    g_s.prevDayLow             = SRJ_NA_DBL;
 380:    g_s.asiaHigh               = SRJ_NA_DBL;
 381:    g_s.asiaLow                = SRJ_NA_DBL;
 382:    g_s.londonHigh             = SRJ_NA_DBL;
 383:    g_s.londonLow              = SRJ_NA_DBL;
 384:    g_s.nyHigh                 = SRJ_NA_DBL;
 385:    g_s.nyLow                  = SRJ_NA_DBL;
 386:    g_s.pmHigh                 = SRJ_NA_DBL;
 387:    g_s.pmLow                  = SRJ_NA_DBL;
 388: 
 389:    // FIX: Initialize previous session high/low cache to NA
 390:    g_s.prevAsiaHigh       = SRJ_NA_DBL;
 391:    g_s.prevAsiaLow        = SRJ_NA_DBL;
 392:    g_s.prevLondonHigh     = SRJ_NA_DBL;
 393:    g_s.prevLondonLow      = SRJ_NA_DBL;
 394:    g_s.prevNYHigh         = SRJ_NA_DBL;
 395:    g_s.prevNYLow          = SRJ_NA_DBL;
 396:    g_s.prevPMHigh         = SRJ_NA_DBL;
 397:    g_s.prevPMLow          = SRJ_NA_DBL;
 398: 
 399:    g_s.asiaHighSwept      = false;
 400:    g_s.asiaLowSwept       = false;
 401:    g_s.londonHighSwept    = false;
 402:    g_s.londonLowSwept     = false;
 403:    g_s.nyHighSwept        = false;
 404:    g_s.nyLowSwept         = false;
 405:    g_s.pmHighSwept        = false;
 406:    g_s.pmLowSwept         = false;
 407:    g_s.pdHighSwept        = false;
 408:    g_s.pdLowSwept         = false;
 409:    g_s.dayStartBar        = SRJ_NA_INT;
 410:    g_s.prevDayStartBar    = SRJ_NA_INT;
 411:    g_s.prevDayEndBar      = SRJ_NA_INT;
 412:    g_s.pdLinesDeletedToday= false;
 413:    g_s.pdLinesCreatedForDay=false;
 414:    g_s.wasInAsia          = false;
 415:    g_s.wasInLondon        = false;
 416:    g_s.wasInNY            = false;
 417:    g_s.wasInPM            = false;
 418:    g_s.asiaStartBar       = SRJ_NA_INT;
 419:    g_s.londonStartBar     = SRJ_NA_INT;
 420:    g_s.nyStartBar         = SRJ_NA_INT;
 421:    g_s.pmStartBar         = SRJ_NA_INT;
 422:    g_s.asiaSessionDay     = SRJ_NA_INT;
 423:    g_s.londonSessionDay   = SRJ_NA_INT;
 424:    g_s.nySessionDay       = SRJ_NA_INT;
 425:    g_s.pmSessionDay       = SRJ_NA_INT;
 426:    g_s.asiaHighLineName   = "";
 427:    g_s.asiaLowLineName    = "";
 428:    g_s.londonHighLineName = "";
 429:    g_s.londonLowLineName  = "";
 430:    g_s.nyHighLineName     = "";
 431:    g_s.nyLowLineName      = "";
 432:    g_s.pmHighLineName     = "";
 433:    g_s.pmLowLineName      = "";
 434:    g_s.lastSweepTag       = SRJ_NA_STR;
 435:    g_s.lastSweepBar       = SRJ_NA_INT;
 436:    g_s.erlBias            = SRJ_NA_STR;
 437: 
 438:    g_s.currentSessionSlot     = SRJ_NA_STR;
 439:    g_s.currentSlotStartBar    = SRJ_NA_INT;
 440:    g_s.freshSweepTag          = SRJ_NA_STR;
 441:    g_s.freshSweepBar          = SRJ_NA_INT;
 442:    g_s.freshSweepExpirySession= SRJ_NA_STR;
 443:    g_s.freshSweepExpired      = false;
 444: 
 445:    g_s.mtfBoxName      = "";
 446:    g_s.dataWarningName = "";
 447: 
 448:    g_orderblocks.FreeMode(true);
 449:    g_imbalances.FreeMode(true);
 450:    g_biasChangeLines.FreeMode(true);
 451:    g_structureRenewalLines.FreeMode(true);
 452:    g_pdHighLines.FreeMode(true);
 453:    g_pdLowLines.FreeMode(true);
 454:    g_asiaHighLines.FreeMode(true);
 455:    g_asiaLowLines.FreeMode(true);
 456:    g_londonHighLines.FreeMode(true);
 457:    g_londonLowLines.FreeMode(true);
 458:    g_nyHighLines.FreeMode(true);
 459:    g_nyLowLines.FreeMode(true);
 460:    g_pmHighLines.FreeMode(true);
 461:    g_pmLowLines.FreeMode(true);
 462: 
 463:    g_orderblocks.Clear();
 464:    g_imbalances.Clear();
 465:    g_biasChangeLines.Clear();
 466:    g_structureRenewalLines.Clear();
 467:    g_bullishInvalidationBarsHistory.Clear();
 468:    g_bearishInvalidationBarsHistory.Clear();
 469:    g_pdHighLines.Clear();
 470:    g_pdLowLines.Clear();
 471:    g_asiaHighLines.Clear();
 472:    g_asiaLowLines.Clear();
 473:    g_londonHighLines.Clear();
 474:    g_londonLowLines.Clear();
 475:    g_nyHighLines.Clear();
 476:    g_nyLowLines.Clear();
 477:    g_pmHighLines.Clear();
 478:    g_pmLowLines.Clear();
 479: 
 480:    g_alertBar_bullFlip    = SRJ_NA_INT;
 481:    g_alertBar_bearFlip    = SRJ_NA_INT;
 482:    g_alertBar_bullRenewal = SRJ_NA_INT;
 483:    g_alertBar_bearRenewal = SRJ_NA_INT;
 484:    g_alertBar_extPromote  = SRJ_NA_INT;
 485: 
 486:    g_objSeq      = 0;
 487:    g_srjObjIdSeq = 0;   // [Task 98a] ids restart with the object arrays
 488:    g_newBar      = false;
 489:    g_lastBarTime = 0;
 490:   }

================ BLOCK C ================

Block C subject set: EVERY line reported in B4, across every region. 8 statements S, grouped by region, ascending by line: S=226, S=280 (SRJ_Bias_DecisionBlock); S=209, S=326 (SRJ_FVG_CreationRenewalPass); S=171, S=173 (SRJ_OB_ReplayActivationInvalidation); S=535, S=537 (SRJ_OB_ActivationInvalidationPass); S=327 (SRJ_StateInit). Every part computed from that region B2 paste only.

--- C1. Attribution rule (Amendment 14) per statement ---

S = 226 (SRJ_BiasEngine.mqh, region SRJ_Bias_DecisionBlock, paste 150-371):
  (a) pointer parameters of the definition header (149): NONE (parameters: int i; bool withinLookbackWindow; bool barClosed - none contains *).
  (b) variables in the paste declared with a pointer type or assigned from a call whose name contains create, New, Get or At: NONE (locals: currentOpposingCount 157, doRenewal 160, currentInBiasCount 162, doStrongFlip 165, doWeakSignalFlip 170, countReferenceBar 174, nextBias 259, flipKind 293; no pointer type; no such call).
  (c) full open-brace stack for S=226 (outermost first): [150,371] (the region itself), [215,256]. NESTING VERIFIED: 150 < 215 and 256 < 371; innermost [215,256] satisfies 215 <= 226 <= 256.
  (d) not applicable - no (b) variables.
  (e) no candidate from (a) or (b) -> NO OBJECT IN SCOPE AT THIS STATEMENT. That is a RESULT, not a failure.

S = 280 (same region and paste):
  (a) NONE (same header).
  (b) NONE (same paste).
  (c) stack: [150,371], [258,299]. NESTING VERIFIED: 150 < 258 and 299 < 371; innermost [258,299] satisfies 258 <= 280 <= 299.
  (d) not applicable.
  (e) NO OBJECT IN SCOPE AT THIS STATEMENT.

S = 209 (SRJ_ImbalanceMgr.mqh, region SRJ_FVG_CreationRenewalPass, paste 111-348):
  (a) pointer parameters of the header (108-110): NONE (7 parameters, none contains *).
  (b) variables from the paste (format <line>: <text> | <variable name> | <RHS verbatim> | <declaration line D>):
     117: CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i, | newBullFVG | RHS TERMINATOR NOT ON LINE - remainder pasted verbatim below | D=117
         remainder verbatim (line 118):                                  true,i - 2,low[i],srjH(high,i,2),i);
     136: COrderblock *renewalOB = NULL; | renewalOB | RHS [ NULL] | D=136
     141: COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx); | nearestOB | RHS [ GetOB(g_orderblocks,nearestIdx)] | D=141
     234: CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i, | newBearFVG | RHS TERMINATOR NOT ON LINE - remainder verbatim below | D=234
         remainder verbatim (line 235):                                  false,i - 2,srjL(low,i,2),high[i],i);
     253: COrderblock *renewalOB = NULL; | renewalOB | RHS [ NULL] | D=253
     258: COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx); | nearestOB | RHS [ GetOB(g_orderblocks,nearestIdx)] | D=258
  (c) full open-brace stack for S=209 (outermost first): [111,348] (the region itself), [116,230], [123,229], [126,222], [175,221]. NESTING VERIFIED: 111 < 116 and 230 < 348; 116 < 123 and 229 < 230; 123 < 126 and 222 < 229; 126 < 175 and 221 < 222; innermost [175,221] satisfies 175 <= 209 <= 221.
  (d) brace-counted range of the innermost brace entry containing each declaration line D (the region own braces [111,348] are the outermost such entry):
     newBullFVG D=117 -> [116,230]
     renewalOB D=136 (bullish branch) -> [126,222]
     nearestOB D=141 (bullish branch) -> [140,154]   (the if(nearestIdx > -1) block; closes at 154, before S)
     newBearFVG D=234 -> [233,347]
     renewalOB D=253 (bearish branch) -> [243,339]
     nearestOB D=258 (bearish branch) -> [257,271]
  (e) scope tests, each reported separately with the numbers used:
     newBullFVG: (e1) D=117 < S=209 YES | (e2) 116 <= 209 AND 209 <= 230 YES | (e3) [116,230] appears in the stack from (c) YES -> IN SCOPE
     renewalOB (D=136): (e1) 136 < 209 YES | (e2) 126 <= 209 AND 209 <= 222 YES | (e3) [126,222] in stack YES -> IN SCOPE
     nearestOB (D=141): (e1) 141 < 209 YES | (e2) 140 <= 209 YES but 209 <= 154 NO -> (e2) FAILED | (e3) [140,154] not in stack -> FAILED -> NOT IN SCOPE
     newBearFVG (D=234): (e1) 234 < 209 NO -> (e1) FAILED (declared after the statement) -> NOT IN SCOPE
     renewalOB (D=253): (e1) 253 < 209 NO -> FAILED -> NOT IN SCOPE
     nearestOB (D=258): (e1) 258 < 209 NO -> FAILED -> NOT IN SCOPE
  IN SCOPE at S=209: newBullFVG (D=117), renewalOB (D=136).

S = 326 (same region and paste as S=209):
  (a) NONE (same header).
  (b) same six candidates as S=209 (lines 117, 136, 141, 234, 253, 258 with the same RHS findings, including the two RHS TERMINATOR NOT ON LINE multi-line initialisers on 117/118 and 234/235).
  (c) full open-brace stack for S=326 (outermost first): [111,348] (the region itself), [233,347], [240,346], [243,339], [292,338]. NESTING VERIFIED: 111 < 233 and 347 < 348; 233 < 240 and 346 < 347; 240 < 243 and 339 < 346; 243 < 292 and 338 < 339; innermost [292,338] satisfies 292 <= 326 <= 338.
  (d) innermost brace entry containing each D: newBullFVG D=117 -> [116,230]; renewalOB D=136 -> [126,222]; nearestOB D=141 -> [140,154]; newBearFVG D=234 -> [233,347]; renewalOB D=253 -> [243,339]; nearestOB D=258 -> [257,271].
  (e) scope tests:
     newBearFVG (D=234): (e1) 234 < 326 YES | (e2) 233 <= 326 AND 326 <= 347 YES | (e3) [233,347] in stack YES -> IN SCOPE
     renewalOB (D=253): (e1) 253 < 326 YES | (e2) 243 <= 326 AND 326 <= 339 YES | (e3) [243,339] in stack YES -> IN SCOPE
     nearestOB (D=258): (e1) 258 < 326 YES | (e2) 257 <= 326 YES but 326 <= 271 NO -> (e2) FAILED | (e3) [257,271] not in stack -> FAILED -> NOT IN SCOPE
     newBullFVG (D=117): (e1) 117 < 326 YES | (e2) 326 <= 230 NO -> (e2) FAILED | (e3) [116,230] not in stack -> FAILED -> NOT IN SCOPE
     renewalOB (D=136): (e2) 326 <= 222 NO -> FAILED | (e3) [126,222] not in stack -> FAILED -> NOT IN SCOPE
     nearestOB (D=141): (e2) 326 <= 154 NO -> FAILED | (e3) [140,154] not in stack -> FAILED -> NOT IN SCOPE
  IN SCOPE at S=326: newBearFVG (D=234), renewalOB (D=253).

S = 171 (SRJ_OrderblockMgr.mqh, region SRJ_OB_ReplayActivationInvalidation, paste 95-195):
  (a) EVERY parameter of the header (89-94) whose text contains *: 1 | COrderblock *ob | ob. This pointer parameter is IN SCOPE AT EVERY STATEMENT IN THE BODY and needs no scope test.
  (b) variables in the paste declared with a pointer type or assigned from a call whose name contains create, New, Get or At: NONE (locals: didActivate 98, didInvalidate 99, shouldActivate 104, closedBeyondInvalidation 123, countReferenceBar 135, sameBarValInv 136, refOk 137, isInBias 168; calls present are g_bullishInvalidationBarsHistory.Add, g_bearishInvalidationBarsHistory.Add, SrjIsNa, SRJ_InDebugWindow, Print, SRJ_BarTimeStr - none named create, New, Get or At).
  (c) full open-brace stack for S=171 (outermost first): [95,195] (the region itself), [122,192], [130,191], [161,190]. NESTING VERIFIED: 95 < 122 and 192 < 195; 122 < 130 and 191 < 192; 130 < 161 and 190 < 191; innermost [161,190] satisfies 161 <= 171 <= 190.
  (d) not applicable - no (b) variables.
  (e) ob (parameter from (a)): IN SCOPE (a parameter is in scope at every statement in the body; no scope test required).

S = 173 (same region and paste):
  (a) same: 1 | COrderblock *ob | ob.
  (b) NONE (same paste).
  (c) stack: [95,195], [122,192], [130,191], [161,190]. NESTING VERIFIED: same pairs as S=171; innermost [161,190] satisfies 161 <= 173 <= 190.
  (d) not applicable.
  (e) ob: IN SCOPE (parameter).

S = 535 (SRJ_OrderblockMgr.mqh, region SRJ_OB_ActivationInvalidationPass, paste 417-571):
  (a) pointer parameters of the header (413-416): NONE (8 parameters, none contains *).
  (b) variables from the paste: 427: COrderblock *ob = GetOB(g_orderblocks,k); | ob | RHS [ GetOB(g_orderblocks,k)] | D=427.  (Assigned from a call whose name contains Get.) No other pointer declarations and no create/New/At calls in the paste.
  (c) full open-brace stack for S=535 (outermost first): [417,571] (the region itself), [426,570], [481,569], [483,568], [495,567], [525,553]. NESTING VERIFIED: 417 < 426 and 570 < 571; 426 < 481 and 569 < 570; 481 < 483 and 568 < 569; 483 < 495 and 567 < 568; 495 < 525 and 553 < 567; innermost [525,553] satisfies 525 <= 535 <= 553.
  (d) ob D=427 -> innermost brace entry containing D is [426,570] (the for-loop body; the region braces [417,571] are the outermost containing entry).
  (e) ob: (e1) D=427 < S=535 YES | (e2) 426 <= 535 AND 535 <= 570 YES | (e3) [426,570] appears in the stack from (c) YES -> IN SCOPE.

S = 537 (same region and paste):
  (a) NONE (same header).
  (b) same single candidate: ob (D=427).
  (c) stack: [417,571], [426,570], [481,569], [483,568], [495,567], [525,553]. NESTING VERIFIED: same pairs; innermost [525,553] satisfies 525 <= 537 <= 553.
  (d) ob D=427 -> [426,570].
  (e) ob: (e1) 427 < 537 YES | (e2) 426 <= 537 AND 537 <= 570 YES | (e3) [426,570] in stack YES -> IN SCOPE.

S = 327 (SRJ_State.mqh, region SRJ_StateInit, paste 298-490):
  (a) pointer parameters of the header (297): NONE (the function has no parameters).
  (b) variables in the paste declared with a pointer type or assigned from a call whose name contains create, New, Get or At: NONE (the paste contains only scalar assignments to g_s fields, .FreeMode(true) calls and .Clear() calls - none named create, New, Get or At; no pointer-typed declaration).
  (c) full open-brace stack for S=327: [298,490] (the region itself; no other brace opens between 298 and 327). NESTING VERIFIED (single entry; innermost [298,490] satisfies 298 <= 327 <= 490).
  (d) not applicable.
  (e) no candidate from (a) or (b) -> NO OBJECT IN SCOPE AT THIS STATEMENT.

--- C2. Naming test per statement (computed from the statement text and the RESOLVED GUARD HEADERS of the brace stack only; never from textual proximity) ---
Guard-header resolution method (enclosing-construct rule): for each brace entry whose line first non-space token is { , scan upward to the first preceding line whose first non-space token is if/else/for/while/switch/do AND whose own text is not terminated by ; ; report that line as the entry header. Entries whose line first non-space token is a type keyword (the region entry) are resolved to the region definition header.

S = 226: brace entries and resolved headers: [150,371] -> header 149: void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed) ; [215,256] -> header 214: if(doRenewal).  Candidates IN SCOPE at S: none.  OCCURS-IN-STATEMENT and OCCURS-IN-A-GUARD-HEADER: not applicable (no candidate).  NOT NAMED / NO OBJECT IN SCOPE AT THIS STATEMENT.  NAMED_COUNT = 0.
S = 280: entries and headers: [150,371] -> 149 ; [258,299] -> header 257: else if(doStrongFlip || doWeakSignalFlip).  Candidates IN SCOPE: none.  NAMED_COUNT = 0.
S = 209: entries and headers: [111,348] -> 108 (region definition header, first line of the three-line header 108-110) ; [116,230] -> 115: if(low[i] > srjH(high,i,2)) ; [123,229] -> 122: if(fvgWithinStructure) ; [126,222] -> 125: if(isInBiasFVG) ; [175,221] -> 174: if(hasNewOB && !g_s.justChangedBias).  Candidates IN SCOPE: newBullFVG, renewalOB.
  newBullFVG: OCCURS-IN-STATEMENT: no (statement text is g_s.tickOBIsValid = true; ). OCCURS-IN-A-GUARD-HEADER: no (token newBullFVG occurs in none of 108/115/122/125/174).
  renewalOB: OCCURS-IN-STATEMENT: no. OCCURS-IN-A-GUARD-HEADER: no.
  NAMED_COUNT = 0.
S = 326: entries and headers: [111,348] -> 108 ; [233,347] -> 232: if(high[i] < srjL(low,i,2)) ; [240,346] -> 239: if(fvgWithinStructure) ; [243,339] -> 242: if(isInBiasFVG) ; [292,338] -> 291: if(hasNewOB && !g_s.justChangedBias).  Candidates IN SCOPE: newBearFVG, renewalOB (D=253).
  newBearFVG: OCCURS-IN-STATEMENT: no. OCCURS-IN-A-GUARD-HEADER: no.
  renewalOB: OCCURS-IN-STATEMENT: no. OCCURS-IN-A-GUARD-HEADER: no.
  NAMED_COUNT = 0.
S = 171: entries and headers: [95,195] -> 89 (region definition header, first line of 89-94): bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob, ; [122,192] -> 121: if(ob.isActivated && ob.isValid && !didActivate) ; [130,191] -> 129: if(closedBeyondInvalidation) ; [161,190] -> 160: if(refOk).  Candidate IN SCOPE: ob (parameter).
  ob: OCCURS-IN-STATEMENT: no (the statement text g_s.tickOBIsValid = false; contains no lowercase token ob; the substring OB inside tickOBIsValid is uppercase and the test is case-sensitive, so it does not match; no INCIDENTAL finding to report).  OCCURS-IN-A-GUARD-HEADER: YES - lines 89 (parameter text *ob in the definition header) and 121 (ob.isActivated, ob.isValid).
  NAMED_COUNT = 1.
S = 173: entries and headers: same as S=171.  Candidate IN SCOPE: ob.
  ob: OCCURS-IN-STATEMENT: no (statement text g_s.tickOBIsValid = true; ).  OCCURS-IN-A-GUARD-HEADER: YES - lines 89 and 121.
  NAMED_COUNT = 1.
S = 535: entries and headers: [417,571] -> 413 (region definition header, first line of 413-416) ; [426,570] -> 425: for(int k = g_orderblocks.Total() - 1; k >= 0; k--)  <<< THIS ENTRY HEADER IS A for — reported explicitly per the enclosing-construct rule ; [481,569] -> 480: if(barClosed) ; [483,568] -> 482: if(ob.isActivated && ob.isValid) ; [495,567] -> 494: if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar) ; [525,553] -> 524: if(refOk).  Candidate IN SCOPE: ob (local, D=427).
  ob: OCCURS-IN-STATEMENT: no (statement text g_s.tickOBIsValid = false; ).  OCCURS-IN-A-GUARD-HEADER: YES - line 482.  (Header 425 is a for; its text contains no ob token: g_orderblocks has no lowercase ob substring. Header 494 contains no ob token.)
  NAMED_COUNT = 1.
S = 537: entries and headers: same as S=535.  Candidate IN SCOPE: ob.
  ob: OCCURS-IN-STATEMENT: no (statement text g_s.tickOBIsValid = true; ).  OCCURS-IN-A-GUARD-HEADER: YES - line 482.
  NAMED_COUNT = 1.
S = 327: entries and headers: [298,490] -> 297: void SRJ_StateInit().  Candidates IN SCOPE: none.  NAMED_COUNT = 0 (NOT NAMED / NO OBJECT IN SCOPE AT THIS STATEMENT).

--- C3. Declared types for every candidate reported IN SCOPE at any S in C1 (type token VERBATIM; NO agreement, match or appropriateness judgment made) ---
  ob (parameter, region SRJ_OB_ReplayActivationInvalidation, in scope at S=171 and S=173): DECLARED TYPE COrderblock *ob (parameter text VERBATIM) | PARAMETER, POSITION 1
  newBullFVG (region SRJ_FVG_CreationRenewalPass, in scope at S=209): DECLARATION LINE 117:        CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i, | DECLARED TYPE: CImbalance
  renewalOB (same region, in scope at S=209): DECLARATION LINE 136:              COrderblock *renewalOB = NULL; | DECLARED TYPE: COrderblock
  newBearFVG (same region, in scope at S=326): DECLARATION LINE 234:        CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i, | DECLARED TYPE: CImbalance
  renewalOB (same region, in scope at S=326): DECLARATION LINE 253:              COrderblock *renewalOB = NULL; | DECLARED TYPE: COrderblock
  ob (region SRJ_OB_ActivationInvalidationPass, in scope at S=535 and S=537): DECLARATION LINE 427:       COrderblock *ob = GetOB(g_orderblocks,k); | DECLARED TYPE: COrderblock
  No IN SCOPE candidate exists for S=226, S=280 or S=327, so no declared type is reported for those statements (TYPE NOT DECLARED IN THIS PASTE is not reached because no candidate exists at all).

--- C4. Innermost brace entry paste and co-membership (computed from the pasted innermost entry only) ---
S = 226: (i) innermost entry from C1(c): [215,256]; integer line count Iclose-Iopen+1 = 42. (ii) 42 <= 150 -> paste EVERY line from 215 through 256 contiguously (below). (iii) candidates from C1(a)/(b): none -> ABSENT. (iv) CO_MEMBER_NAMED_COUNT = 0.
 215:      {
 216:       g_s.lastRelevantStructureBar = i;
 217:       g_s.structureConfirmedThisBar = true;
 218:       g_s.wasBiasFlip = false;
 219:       g_s.drawStructureRenewalLineNow = true;
 220:       g_s.renewalDirection = g_s.currentBias;
 221:       g_s.isDoubleOB = true;
 222:       g_s.suppressBiasPaneStatusThisBar = true;
 223:       g_s.obInvalidationBoundary = i;
 224:       g_s.fvgDetectionBoundary = i;
 225:       // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)
 226:       g_s.tickOBIsValid = true;
 227:       g_s.tickFVGIsValid = true;
 228:       g_s.hasPersistedOpposingFVG = false;
 229:       
 230:       // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
 231:       // In-bias invalidations continue to accumulate toward the next strong flip.
 232:       if(g_s.currentBias == "bullish")
 233:         {
 234:          // Bullish renewal: reset bearish (opposing) counter only
 235:          g_s.bearishOBInvalidationCount = 0;
 236:          g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 237:         }
 238:       else
 239:         {
 240:          // Bearish renewal: reset bullish (opposing) counter only
 241:          g_s.bullishOBInvalidationCount = 0;
 242:          g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 243:         }
 244: 
 245:       g_s.checklistActivated = false;
 246:       if(g_s.currentBias == "bullish")
 247:          g_s.bullishStructureRenewalAlert = true;
 248:       else
 249:          g_s.bearishStructureRenewalAlert = true;
 250: 
 251:       if(g_htfDebugLog)
 252:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 253:                " kind=doRenewal",
 254:                " bias=", g_s.currentBias,
 255:                " resetOn=true");
 256:      }
S = 280: (i) innermost entry: [258,299]; line count = 42. (ii) 42 <= 150 -> paste EVERY line from 258 through 299 (below). (iii) ABSENT (no candidates). (iv) CO_MEMBER_NAMED_COUNT = 0.
 258:      {
 259:       string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
 260:       g_s.currentBias = nextBias;
 261:       g_s.currentStructureStartBar = i;
 262:       g_s.lastRelevantStructureBar = i;
 263:       g_s.structureConfirmedThisBar = true;
 264:       g_s.wasBiasFlip = true;
 265:       g_s.drawBiasLineNow = true;
 266:       g_s.newBiasDirection = nextBias;
 267:       if(doStrongFlip)
 268:         {
 269:          g_s.isDoubleOB = true;
 270:          g_s.suppressBiasPaneStatusThisBar = true;
 271:         }
 272:       else
 273:         {
 274:          g_s.isDoubleOB = false;
 275:         }
 276:       g_s.obInvalidationBoundary = i;
 277:       g_s.fvgDetectionBoundary = i;
 278:       g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg
 279:       g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg
 280:       g_s.tickOBIsValid = true;
 281:       g_s.tickFVGIsValid = true;
 282:       g_s.hasPersistedOpposingFVG = false;
 283:       g_s.bullishOBInvalidationCount = 0;
 284:       g_s.bearishOBInvalidationCount = 0;
 285:       g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 286:       g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 287:       g_s.checklistActivated = false;
 288:       if(nextBias == "bullish")
 289:          g_s.bullishBiasFlipAlert = true;
 290:       else
 291:          g_s.bearishBiasFlipAlert = true;
 292: 
 293:       string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
 294:       if(g_htfDebugLog)
 295:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 296:                " kind=", flipKind,
 297:                " bias=", g_s.currentBias,
 298:                " resetOn=true");
 299:      }
S = 209: (i) innermost entry: [175,221]; line count = 47. (ii) 47 <= 150 -> paste EVERY line from 175 through 221 (below). (iii) from the pasted lines only, every line other than S=209 on which a candidate name (newBullFVG, renewalOB) occurs: line 204:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true; | renewalOB.  (newBullFVG occurs on no line in [175,221] other than none at all.)  (iv) CO_MEMBER_NAMED_COUNT = 1 (distinct candidate name: renewalOB).
 175:               {
 176:                // --- PRE-RESET STATE RECORDER ---
 177:                if(g_htfDebugLog &&
 178:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
 179:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
 180:                         " dir=", g_s.currentBias,
 181:                         " bull=", g_s.bullishOBInvalidationCount,
 182:                         " bear=", g_s.bearishOBInvalidationCount,
 183:                         " tickOB=", g_s.tickOBIsValid,
 184:                         " tickFVG=", g_s.tickFVGIsValid,
 185:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
 186:                         " checklistAct=", g_s.checklistActivated,
 187:                         " structStart=", g_s.currentStructureStartBar,
 188:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
 189:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
 190:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
 191:                         " resetOn=true");
 192:                // ------------------------------
 193: 
 194:                g_s.isDoubleOB = false;
 195:                g_s.lastRelevantStructureBar = i;
 196:                g_s.structureConfirmedThisBar = true;
 197:                g_s.drawStructureRenewalLineNow = true;
 198:                g_s.renewalDirection = "bullish";
 199:                g_s.hasPersistedOpposingFVG = false;
 200:                
 201:                g_s.bullishStructureRenewalAlert = true;
 202:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
 203:                SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
 204:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
 205:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
 206:                g_s.obInvalidationBoundary = i;
 207:                g_s.fvgDetectionBoundary = i;
 208: 
 209:                g_s.tickOBIsValid                 = true;
 210:                g_s.tickFVGIsValid                = true;
 211:                // Selective reset: bullish bias renewal zeros bearish (opposing) counter only
 212:                g_s.bearishOBInvalidationCount    = 0;
 213:                g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
 214:                g_s.checklistActivated            = false;
 215:                  
 216:                if(g_htfDebugLog)
 217:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 218:                         " kind=fvgRenewal",
 219:                         " bias=", g_s.currentBias,
 220:                         " resetOn=true");
 221:               }
S = 326: (i) innermost entry: [292,338]; line count = 47. (ii) 47 <= 150 -> paste EVERY line from 292 through 338 (below). (iii) from the pasted lines only, lines other than S=326 where a candidate name (newBearFVG, renewalOB) occurs: line 321:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true; | renewalOB.  (newBearFVG occurs on no line in [292,338].)  (iv) CO_MEMBER_NAMED_COUNT = 1 (renewalOB).
 292:               {
 293:                // --- PRE-RESET STATE RECORDER ---
 294:                if(g_htfDebugLog &&
 295:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
 296:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
 297:                         " dir=", g_s.currentBias,
 298:                         " bull=", g_s.bullishOBInvalidationCount,
 299:                         " bear=", g_s.bearishOBInvalidationCount,
 300:                         " tickOB=", g_s.tickOBIsValid,
 301:                         " tickFVG=", g_s.tickFVGIsValid,
 302:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
 303:                         " checklistAct=", g_s.checklistActivated,
 304:                         " structStart=", g_s.currentStructureStartBar,
 305:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
 306:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
 307:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
 308:                         " resetOn=true");
 309:                // ------------------------------
 310: 
 311:                g_s.isDoubleOB = false;
 312:                g_s.lastRelevantStructureBar = i;
 313:                g_s.structureConfirmedThisBar = true;
 314:                g_s.drawStructureRenewalLineNow = true;
 315:                g_s.renewalDirection = "bearish";
 316:                g_s.hasPersistedOpposingFVG = false;
 317:                
 318:                g_s.bearishStructureRenewalAlert = true;
 319:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
 320:                SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);
 321:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
 322:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
 323:                g_s.obInvalidationBoundary = i;
 324:                g_s.fvgDetectionBoundary = i;
 325: 
 326:                g_s.tickOBIsValid                 = true;
 327:                g_s.tickFVGIsValid                = true;
 328:                // Selective reset: bearish bias renewal zeros bullish (opposing) counter only
 329:                g_s.bullishOBInvalidationCount    = 0;
 330:                g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
 331:                g_s.checklistActivated            = false;
 332:                  
 333:                if(g_htfDebugLog)
 334:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
 335:                         " kind=fvgRenewal",
 336:                         " bias=", g_s.currentBias,
 337:                         " resetOn=true");
 338:               }
S = 171: (i) innermost entry from C1(c): [161,190]; line count = 30. (ii) 30 <= 150 -> paste EVERY line from 161 through 190 (below). (iii) from the pasted lines only, every line other than S=171 on which candidate name ob occurs (case-sensitive whole-candidate-name match; the uppercase OB inside tickOBIsValid is a different token and no INCIDENTAL substring of ob exists in these lines):  168:                bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) || | ob  ;  169:                            (g_s.currentBias=="bearish" && !ob.isBullish); | ob.  (iv) CO_MEMBER_NAMED_COUNT = 1 (ob).
 161:            {
 162:             // Append to history arrays (unified with Fix 1.3)
 163:             if(ob.isBullish)
 164:                g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar
 165:             else
 166:                g_bearishInvalidationBarsHistory.Add(discoveryBar);
 167: 
 168:             bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 169:                             (g_s.currentBias=="bearish" && !ob.isBullish);
 170:             if(isInBias)
 171:                g_s.tickOBIsValid = false;
 172:             else
 173:                g_s.tickOBIsValid = true;
 174: 
 175:             // Counter updates attributed to discovery bar for SRJ_OB_CounterAggregationPass to see
 176:             if(ob.isBullish)
 177:               {
 178:                if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 179:                   g_s.firstBullishOBInvalidationBar = discoveryBar;
 180:                g_s.lastBullishOBInvalidationBar = discoveryBar;
 181:                g_s.bullishOBInvalidationsThisBar += 1;
 182:               }
 183:             else
 184:               {
 185:                if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 186:                   g_s.firstBearishOBInvalidationBar = discoveryBar;
 187:                g_s.lastBearishOBInvalidationBar = discoveryBar;
 188:                g_s.bearishOBInvalidationsThisBar += 1;
 189:               }
 190:            }
S = 173: (i) innermost entry from C1(c): [161,190]; line count = 30. (ii) 30 <= 150 -> paste EVERY line from 161 through 190 (below). (iii) from the pasted lines only, every line other than S=173 on which candidate name ob occurs:  168:                bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) || | ob  ;  169:                            (g_s.currentBias=="bearish" && !ob.isBullish); | ob.  (iv) CO_MEMBER_NAMED_COUNT = 1 (ob).
 161:            {
 162:             // Append to history arrays (unified with Fix 1.3)
 163:             if(ob.isBullish)
 164:                g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar
 165:             else
 166:                g_bearishInvalidationBarsHistory.Add(discoveryBar);
 167: 
 168:             bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 169:                             (g_s.currentBias=="bearish" && !ob.isBullish);
 170:             if(isInBias)
 171:                g_s.tickOBIsValid = false;
 172:             else
 173:                g_s.tickOBIsValid = true;
 174: 
 175:             // Counter updates attributed to discovery bar for SRJ_OB_CounterAggregationPass to see
 176:             if(ob.isBullish)
 177:               {
 178:                if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 179:                   g_s.firstBullishOBInvalidationBar = discoveryBar;
 180:                g_s.lastBullishOBInvalidationBar = discoveryBar;
 181:                g_s.bullishOBInvalidationsThisBar += 1;
 182:               }
 183:             else
 184:               {
 185:                if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 186:                   g_s.firstBearishOBInvalidationBar = discoveryBar;
 187:                g_s.lastBearishOBInvalidationBar = discoveryBar;
 188:                g_s.bearishOBInvalidationsThisBar += 1;
 189:               }
 190:            }
S = 535: (i) innermost entry from C1(c): [525,553]; line count = 29. (ii) 29 <= 150 -> paste EVERY line from 525 through 553 (below). (iii) from the pasted lines only, every line other than S=535 on which candidate name ob occurs:  527:                   if(ob.isBullish) | ob  ;  532:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) || | ob  ;  533:                                   (g_s.currentBias=="bearish" && !ob.isBullish); | ob.  (iv) CO_MEMBER_NAMED_COUNT = 1 (ob).
 525:                  {
 526:                   // Append to history arrays when refOk passes
 527:                   if(ob.isBullish)
 528:                      g_bullishInvalidationBarsHistory.Add(i);
 529:                   else
 530:                      g_bearishInvalidationBarsHistory.Add(i);
 531: 
 532:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 533:                                   (g_s.currentBias=="bearish" && !ob.isBullish);
 534:                   if(isInBias)
 535:                      g_s.tickOBIsValid = false;
 536:                   else
 537:                      g_s.tickOBIsValid = true;
 538: 
 539:                   if(ob.isBullish)
 540:                     {
 541:                      if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 542:                         g_s.firstBullishOBInvalidationBar = i;
 543:                      g_s.lastBullishOBInvalidationBar = i;
 544:                      g_s.bullishOBInvalidationsThisBar += 1;
 545:                     }
 546:                   else
 547:                     {
 548:                      if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 549:                         g_s.firstBearishOBInvalidationBar = i;
 550:                      g_s.lastBearishOBInvalidationBar = i;
 551:                      g_s.bearishOBInvalidationsThisBar += 1;
 552:                     }
 553:                  }
S = 537: (i) innermost entry from C1(c): [525,553]; line count = 29. (ii) 29 <= 150 -> paste EVERY line from 525 through 553 (below). (iii) from the pasted lines only, every line other than S=537 on which candidate name ob occurs:  527:                   if(ob.isBullish) | ob  ;  532:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) || | ob  ;  533:                                   (g_s.currentBias=="bearish" && !ob.isBullish); | ob.  (iv) CO_MEMBER_NAMED_COUNT = 1 (ob).
 525:                  {
 526:                   // Append to history arrays when refOk passes
 527:                   if(ob.isBullish)
 528:                      g_bullishInvalidationBarsHistory.Add(i);
 529:                   else
 530:                      g_bearishInvalidationBarsHistory.Add(i);
 531: 
 532:                   bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
 533:                                   (g_s.currentBias=="bearish" && !ob.isBullish);
 534:                   if(isInBias)
 535:                      g_s.tickOBIsValid = false;
 536:                   else
 537:                      g_s.tickOBIsValid = true;
 538: 
 539:                   if(ob.isBullish)
 540:                     {
 541:                      if(SrjIsNa(g_s.firstBullishOBInvalidationBar))
 542:                         g_s.firstBullishOBInvalidationBar = i;
 543:                      g_s.lastBullishOBInvalidationBar = i;
 544:                      g_s.bullishOBInvalidationsThisBar += 1;
 545:                     }
 546:                   else
 547:                     {
 548:                      if(SrjIsNa(g_s.firstBearishOBInvalidationBar))
 549:                         g_s.firstBearishOBInvalidationBar = i;
 550:                      g_s.lastBearishOBInvalidationBar = i;
 551:                      g_s.bearishOBInvalidationsThisBar += 1;
 552:                     }
 553:                  }
S = 327: (i) innermost entry from C1(c): [298,490]; line count = 193. (ii) 193 > 150 -> EXCEEDS 150; paste only the entry resolved header line (297: void SRJ_StateInit() ) plus every line in [298,490] that matches at least one candidate name from C1(a)/(b). C1 reports no (a) or (b) candidate names for this statement, so there are no such lines to paste beyond the header. (iii) ABSENT - no candidate names occur on the pasted fragment. (iv) CO_MEMBER_NAMED_COUNT = 0.
Resolved header line (pasted verbatim): 297: void SRJ_StateInit()

================ BLOCK D ================

--- D1. Every line beginning at column 0 whose first non-space token begins with #property (SRJ_FlowLogic.mq5 only, ascending; verbatim) ---
   5: #property copyright "SRJ Flow Logic Auto — Pine v6 port"
   6: #property version   "1.00"
   7: #property indicator_chart_window
   8: #property indicator_buffers 34  // [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId).
   9: #property indicator_plots   2
  11: #property indicator_label1  "Fractal High"
  12: #property indicator_type1   DRAW_ARROW
  13: #property indicator_label2  "Fractal Low"
  14: #property indicator_type2   DRAW_ARROW
Integer count: 9

--- D2. OnInit (definition-header rule including its fallback) ---
Candidates for OnInit: 1. Line 563 (column 0): int OnInit() . Parameter list closes on line 563. Classification: DEFINITION (no header line terminates in ; ). Fallback NOT reached.
DEFINITION six-field form: HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135. Brace counting confirmed for this bound (increment on { , decrement on } , stop at zero).
DO NOT PASTE THE REGION - region not pasted.
Every SetIndexBuffer call inside OnInit (range 564-697) in ascending line order. Per the MULTI-LINE CALL RULE the argument list runs from the ( after the called name to the matching ) at the same paren depth; every one of these calls has its matching ) on the call own line, so no line reported ARGUMENT LIST CONTINUES ON NEXT LINE and no JOINED text is needed. EVERY argument is reported, one per line, with ARG COUNT per call (Amendment 18).
  566:    SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);
      ARG 1: 0
      ARG 2: g_bufFractalHigh
      ARG 3: INDICATOR_DATA
      ARG COUNT = 3

--- D2. OnInit (definition-header rule including its fallback) ---
Candidates for OnInit: 1. Line 563 (column 0): int OnInit() . Parameter list closes on line 563. Classification: DEFINITION (no header line terminates in ; ). Fallback NOT reached.
DEFINITION six-field form: HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135. Brace counting confirmed for this bound (increment on { , decrement on } , stop at zero).
DO NOT PASTE THE REGION - region not pasted.
Every SetIndexBuffer call inside OnInit (range 564-697) in ascending line order. Per the MULTI-LINE CALL RULE the argument list runs from the ( after the called name to the matching ) at the same paren depth; every one of these calls has its matching ) on the call own line, so no line reported ARGUMENT LIST CONTINUES ON NEXT LINE and no JOINED text is needed. EVERY argument is reported, one per line, with ARG COUNT per call (Amendment 18).
  566:    SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);
      ARG 1: 0
      ARG 2: g_bufFractalHigh
      ARG 3: INDICATOR_DATA
      ARG COUNT = 3
  567:    SetIndexBuffer(1,g_bufFractalLow, INDICATOR_DATA);
      ARG 1: 1
      ARG 2: g_bufFractalLow
      ARG 3: INDICATOR_DATA
      ARG COUNT = 3
  572:    SetIndexBuffer(2,  g_bufBias,         INDICATOR_CALCULATIONS);
      ARG 1: 2
      ARG 2: g_bufBias
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  573:    SetIndexBuffer(3,  g_bufOBValid,      INDICATOR_CALCULATIONS);
      ARG 1: 3
      ARG 2: g_bufOBValid
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  574:    SetIndexBuffer(4,  g_bufFVGValid,     INDICATOR_CALCULATIONS);
      ARG 1: 4
      ARG 2: g_bufFVGValid
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  575:    SetIndexBuffer(5,  g_bufOppFVG,       INDICATOR_CALCULATIONS);
      ARG 1: 5
      ARG 2: g_bufOppFVG
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  576:    SetIndexBuffer(6,  g_bufSwingHigh,    INDICATOR_CALCULATIONS);
      ARG 1: 6
      ARG 2: g_bufSwingHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  577:    SetIndexBuffer(7,  g_bufSwingLow,     INDICATOR_CALCULATIONS);
      ARG 1: 7
      ARG 2: g_bufSwingLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  578:    SetIndexBuffer(8,  g_bufPrevDayHigh,  INDICATOR_CALCULATIONS);
      ARG 1: 8
      ARG 2: g_bufPrevDayHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  579:    SetIndexBuffer(9,  g_bufPrevDayLow,   INDICATOR_CALCULATIONS);
      ARG 1: 9
      ARG 2: g_bufPrevDayLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  580:    SetIndexBuffer(10, g_bufAsiaHigh,     INDICATOR_CALCULATIONS);
      ARG 1: 10
      ARG 2: g_bufAsiaHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  581:    SetIndexBuffer(11, g_bufAsiaLow,     INDICATOR_CALCULATIONS);
      ARG 1: 11
      ARG 2: g_bufAsiaLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  582:    SetIndexBuffer(12, g_bufLondonHigh,   INDICATOR_CALCULATIONS);
      ARG 1: 12
      ARG 2: g_bufLondonHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  583:    SetIndexBuffer(13, g_bufLondonLow,    INDICATOR_CALCULATIONS);
      ARG 1: 13
      ARG 2: g_bufLondonLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  584:    SetIndexBuffer(14, g_bufNyHigh,       INDICATOR_CALCULATIONS);
      ARG 1: 14
      ARG 2: g_bufNyHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  585:    SetIndexBuffer(15, g_bufNyLow,        INDICATOR_CALCULATIONS);
      ARG 1: 15
      ARG 2: g_bufNyLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  586:    SetIndexBuffer(16, g_bufPmHigh,       INDICATOR_CALCULATIONS);
      ARG 1: 16
      ARG 2: g_bufPmHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  587:    SetIndexBuffer(17, g_bufPmLow,        INDICATOR_CALCULATIONS);
      ARG 1: 17
      ARG 2: g_bufPmLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  588:    SetIndexBuffer(18, g_bufSweepTag,     INDICATOR_CALCULATIONS);
      ARG 1: 18
      ARG 2: g_bufSweepTag
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  589:    SetIndexBuffer(19, g_bufHtfHi,        INDICATOR_CALCULATIONS);
      ARG 1: 19
      ARG 2: g_bufHtfHi
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  590:    SetIndexBuffer(20, g_bufHtfMid,       INDICATOR_CALCULATIONS);
      ARG 1: 20
      ARG 2: g_bufHtfMid
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  591:    SetIndexBuffer(21, g_bufHtfLo,        INDICATOR_CALCULATIONS);
      ARG 1: 21
      ARG 2: g_bufHtfLo
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  594:    SetIndexBuffer(22, g_bufXobZoneHigh,    INDICATOR_CALCULATIONS);
      ARG 1: 22
      ARG 2: g_bufXobZoneHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  595:    SetIndexBuffer(23, g_bufXobZoneLow,     INDICATOR_CALCULATIONS);
      ARG 1: 23
      ARG 2: g_bufXobZoneLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  596:    SetIndexBuffer(24, g_bufFvgLegZoneHigh, INDICATOR_CALCULATIONS);
      ARG 1: 24
      ARG 2: g_bufFvgLegZoneHigh
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  597:    SetIndexBuffer(25, g_bufFvgLegZoneLow,  INDICATOR_CALCULATIONS);
      ARG 1: 25
      ARG 2: g_bufFvgLegZoneLow
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  600:    SetIndexBuffer(26, g_bufObStructExtreme, INDICATOR_CALCULATIONS);
      ARG 1: 26
      ARG 2: g_bufObStructExtreme
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  601:    SetIndexBuffer(27, g_bufObSwingExtreme,  INDICATOR_CALCULATIONS);
      ARG 1: 27
      ARG 2: g_bufObSwingExtreme
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  604:    SetIndexBuffer(28, g_bufRenewalBoundaryTime, INDICATOR_CALCULATIONS);
      ARG 1: 28
      ARG 2: g_bufRenewalBoundaryTime
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  607:    SetIndexBuffer(29, g_bufSweptMask, INDICATOR_CALCULATIONS);
      ARG 1: 29
      ARG 2: g_bufSweptMask
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  610:    SetIndexBuffer(30, g_bufStructLegTime, INDICATOR_CALCULATIONS);
      ARG 1: 30
      ARG 2: g_bufStructLegTime
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  613:    SetIndexBuffer(31, g_bufXobObjId, INDICATOR_CALCULATIONS);
      ARG 1: 31
      ARG 2: g_bufXobObjId
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  614:    SetIndexBuffer(32, g_bufFvgObjId, INDICATOR_CALCULATIONS);
      ARG 1: 32
      ARG 2: g_bufFvgObjId
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
  617:    SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);
      ARG 1: 33
      ARG 2: g_bufXobPromoTime
      ARG 3: INDICATOR_CALCULATIONS
      ARG COUNT = 3
Integer count of SetIndexBuffer calls: 34
NOT AN INTEGER LITERAL ARG 1: none - every ARG 1 text among the 34 calls is an integer literal (comparison covered all 34 calls).
HIGHEST ARG 1 = 33 AT LINE 617

--- D3. File-scope array declarations ---
Every line that begins at column 0, does not begin with //, ends in ;, and whose text contains [ (Amendment 15 applied: a line whose first non-space token is } would be reported CLOSING BRACE and never one of these; none of the hits is such a line). Verbatim, ascending:
  30: double g_bufBias[];
  31: double g_bufOBValid[];
  32: double g_bufFVGValid[];
  33: double g_bufOppFVG[];
  34: double g_bufSwingHigh[];
  35: double g_bufSwingLow[];
  36: double g_bufPrevDayHigh[];
  37: double g_bufPrevDayLow[];
  38: double g_bufAsiaHigh[];
  39: double g_bufAsiaLow[];
  40: double g_bufLondonHigh[];
  41: double g_bufLondonLow[];
  42: double g_bufNyHigh[];
  43: double g_bufNyLow[];
  44: double g_bufPmHigh[];
  45: double g_bufPmLow[];
  46: double g_bufSweepTag[];
  47: double g_bufHtfHi[];
  48: double g_bufHtfMid[];
  49: double g_bufHtfLo[];
  52: double g_bufXobZoneHigh[];
  53: double g_bufXobZoneLow[];
  54: double g_bufFvgLegZoneHigh[];
  55: double g_bufFvgLegZoneLow[];
  58: double g_bufObStructExtreme[];
  59: double g_bufObSwingExtreme[];
  68: double g_bufRenewalBoundaryTime[];
  78: double g_bufSweptMask[];
  88: double g_bufStructLegTime[];
 102: double g_bufXobObjId[];
 103: double g_bufFvgObjId[];
 117: double g_bufXobPromoTime[];
Integer count: 32
LOWEST such line: 30
HIGHEST such line: 117

ARG 2 cross-reference (for every ARG 2 text reported in D2):
g_bufFractalHigh | NO DECLARATION AT COLUMN 0
g_bufFractalLow | NO DECLARATION AT COLUMN 0
g_bufBias | NO DECLARATION AT COLUMN 0
g_bufOBValid | NO DECLARATION AT COLUMN 0
g_bufFVGValid | NO DECLARATION AT COLUMN 0
g_bufOppFVG | NO DECLARATION AT COLUMN 0
g_bufSwingHigh | NO DECLARATION AT COLUMN 0
g_bufSwingLow | NO DECLARATION AT COLUMN 0
g_bufPrevDayHigh | NO DECLARATION AT COLUMN 0
g_bufPrevDayLow | NO DECLARATION AT COLUMN 0
g_bufAsiaHigh | NO DECLARATION AT COLUMN 0
g_bufAsiaLow | NO DECLARATION AT COLUMN 0
g_bufLondonHigh | NO DECLARATION AT COLUMN 0
g_bufLondonLow | NO DECLARATION AT COLUMN 0
g_bufNyHigh | NO DECLARATION AT COLUMN 0
g_bufNyLow | NO DECLARATION AT COLUMN 0
g_bufPmHigh | NO DECLARATION AT COLUMN 0
g_bufPmLow | NO DECLARATION AT COLUMN 0
g_bufSweepTag | NO DECLARATION AT COLUMN 0
g_bufHtfHi | NO DECLARATION AT COLUMN 0
g_bufHtfMid | NO DECLARATION AT COLUMN 0
g_bufHtfLo | NO DECLARATION AT COLUMN 0
g_bufXobZoneHigh | NO DECLARATION AT COLUMN 0
g_bufXobZoneLow | NO DECLARATION AT COLUMN 0
g_bufFvgLegZoneHigh | NO DECLARATION AT COLUMN 0
g_bufFvgLegZoneLow | NO DECLARATION AT COLUMN 0
g_bufObStructExtreme | NO DECLARATION AT COLUMN 0
g_bufObSwingExtreme | NO DECLARATION AT COLUMN 0
g_bufRenewalBoundaryTime | NO DECLARATION AT COLUMN 0
g_bufSweptMask | NO DECLARATION AT COLUMN 0
g_bufStructLegTime | NO DECLARATION AT COLUMN 0
g_bufXobObjId | NO DECLARATION AT COLUMN 0
g_bufFvgObjId | NO DECLARATION AT COLUMN 0
g_bufXobPromoTime | NO DECLARATION AT COLUMN 0

Span LOWEST 30 through HIGHEST 117 inclusive = 88 lines (88 <=120) -> pasted contiguously below (one pasted source line per output line, with line numbers and all leading whitespace):
  30: double g_bufBias[];
  31: double g_bufOBValid[];
  32: double g_bufFVGValid[];
  33: double g_bufOppFVG[];
  34: double g_bufSwingHigh[];
  35: double g_bufSwingLow[];
  36: double g_bufPrevDayHigh[];
  37: double g_bufPrevDayLow[];
  38: double g_bufAsiaHigh[];
  39: double g_bufAsiaLow[];
  40: double g_bufLondonHigh[];
  41: double g_bufLondonLow[];
  42: double g_bufNyHigh[];
  43: double g_bufNyLow[];
  44: double g_bufPmHigh[];
  45: double g_bufPmLow[];
  46: double g_bufSweepTag[];
  47: double g_bufHtfHi[];
  48: double g_bufHtfMid[];
  49: double g_bufHtfLo[];
  50: 
  51: // [Section 8] XOB "in play" (regardless of age) + FVG-to-XOB leg lineage.
  52: double g_bufXobZoneHigh[];
  53: double g_bufXobZoneLow[];
  54: double g_bufFvgLegZoneHigh[];

--- D4. OnCalculate ordering census (SRJ_FlowLogic.mq5 only) ---
OnCalculate located by the definition-header rule INCLUDING ITS FALLBACK: candidates = 1. Line 705 (column 0): int OnCalculate(const int rates_total,. Parameter list closes on line  714 (multi-line header 705-714. Classification: DEFINITION (no line from 705 through 714 ends in the character ; ). Fallback NOT reached.
DEFINITION six-field form: HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475. Brace counting confirmed.
DO NOT PASTE THE REGION - region not pasted.
From that range only (715-1179), one ASCENDING LINE-ORDERED list, every line matching any of the patterns, as SEPARATE PATTERNS under the multi-pattern and substring rules:
 855:       SRJ_Bias_PerBarResetPass(barClosed);  [matched: SRJ_Bias_PerBarResetPass]
 866:       SRJ_Bias_WeakFlipLatchPass();  [matched: SRJ_Bias_WeakFlipLatchPass]
 868:       SRJ_FVG_CreationRenewalPass(high,low,time,rates_total,i,  [matched: SRJ_FVG_CreationRenewalPass]
 878:       SRJ_Bias_DecisionBlock(i,withinLookbackWindow,barClosed);  [matched: SRJ_Bias_DecisionBlock]
 902:          g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;  [matched: tickOBIsValid]
 903:          g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;  [matched: tickFVGIsValid]
 904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;  [matched: hasPersistedOpposingFVG]
N_OCC per pattern (per pattern, repeats counted on the range 715-1179, comment-stripped text): SRJ_Bias_PerBarResetPass=1 | SRJ_Bias_WeakFlipLatchPass=1 | SRJ_FVG_CreationRenewalPass=1 | SRJ_Bias_DecisionBlock=1 | tickOBIsValid=1 | tickFVGIsValid=1 | hasPersistedOpposingFVG=1. ABSENT per pattern: none - each of the seven patterns occurs. NO CAPS.
Single N_LINES (distinct lines matching at least one pattern, per-file): 7

--- D5. tickOBIsValid window and brace stack (from the D4 range only) ---
Lowest-numbered line matching tickOBIsValid din the D4 range: 902. Highest-numbered: 903. ABSENT: no - both exist.
Contiguous block from 8 LINES BEFORE THE LOWEST through 8 LINES AFTER THE HIGHEST: exact pasted range: 894 through 911 (inclusive,, 18 lines,, one pasted source line per output line, line numbers and all leading whitespace preserved):
 894:         }
 895: 
 896:       // [NEW EXPORT BLOCK] ------------------------------------------------------
 897:       // Write out all state variables to the calculation buffers for EA consumption
 898:       int target = i - 1;
 899:       if(target >= 0)
 900:         {
 901:          g_bufBias[target] = (g_s.currentBias == "bullish") ? 1.0 : (g_s.currentBias == "bearish" ? -1.0 : 0.0);
 902:          g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;
 903:          g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;
 904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;
 905:          
 906:          g_bufSwingHigh[target] = EMPTY_VALUE;
 907:          g_bufSwingLow[target]  = EMPTY_VALUE;
 908:          if(i >= 2)
 909:            {
 910:             if(SRJ_isStrictFractalHigh(high, i, 1))
 911:                g_bufSwingHigh[target] = high[target];
Full open-brace stack for the LOWEST such line (902), per the enclosing-construct rule, outermost first, each entry with its OPENING line and BRACE-COUNTED CLOSING line:
  [715,1179]: {  (region OnCalculate brace; header line 705: int OnCalculate(.... closed by brace counting at line 1179)
  [820,1152]: {  (header line 819: for(int i = start; i < rates_total; i++); THIS HEADER IS A for)
  [900,1145]: {  (header line 899: if(target >= 0))
NESTING VERIFIED: adjacent pairs (parent,,child:: (715,820:: 715 < 820 AND  1152 < 1179; (820,900:: 820 < 900 AND  1145 < 1152. Innermost [900,1145] satisfies 900 <= 902 <=  1145. NO STACK NESTING VIOLATION. NOT ENCLOSED: no - the statement is enclosed.
From the pasted block only (894-911), every line that assigns to any identifier by the assignment-target rule whose RHS text contains a minus sign or the character 1 (X is taken as the identifier exactly as it appears, including array elements such as g_bufOBValid[target]; per the rule requirement that the first non-space non-tab character scanning right from X be = ):
  898: int target = i -  1; | target | RHS [i -  1]   (RHS contains - and 1)
  901: g_bufBias[target] = (g_s.currentBias == "bullish") ?  1.0 : (g_s.currentBias == "bearish" ? -  1.0 :  0.0); | g_bufBias[target] | RHS [(g_s.currentBias == "bullish") ?  1.0 : (g_s.currentBias == "bearish" ? -  1.0 :  0.0)]   (RHS contains - and 1)
  902: g_bufOBValid[target] = g_s.tickOBIsValid ?  1.0 :  0.0; | g_bufOBValid[target] | RHS [g_s.tickOBIsValid ?  1.0 :  0.0]   (RHS contains 1)
  903: g_bufFVGValid[target] = g_s.tickFVGIsValid ?  1.0 :  0.0; | g_bufFVGValid[target] | RHS [g_s.tickFVGIsValid ?  1.0 :  0.0]   (RHS contains 1)
  904: g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ?  1.0 :  0.0; | g_bufOppFVG[target] | RHS [g_s.hasPersistedOpposingFVG ?  1.0 :  0.0]   (RHS contains 1)
  ABSENT: not applicable - five lines qualify. No other line in the pasted block assigns under the rule with an RHS containing - or 1.

--- D6. Initialisation-convention census (SRJ_FlowLogic.mq5, whole file, SEPARATE PATTERNS under the multi-pattern and substring rules) ---
N_OCC per pattern (case-sensitive, repeats counted, comment-stripped text,: ArraySetAsSeries=39 | ArrayInitialize=34 | PlotIndexSetDouble=0 | PLOT_EMPTY_VALUE=0 | EMPTY_VALUE=37
ABSENT per pattern: PlotIndexSetDouble ABSENT (count 0 is a result.. PLOT_EMPTY_VALUE ABSENT (count 0 is a result..
Single N_LINES for the file (distinct lines matching at least one of the patterns,: 81
Paste (every distinct line once, ascending, with line numbers,and per pasted line its enclosing function by the definition-header rule with the region in its SIX-FIELD form,:
 568:    ArraySetAsSeries(g_bufFractalHigh,false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 569:    ArraySetAsSeries(g_bufFractalLow, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 619:    ArraySetAsSeries(g_bufBias,         false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 620:    ArraySetAsSeries(g_bufOBValid,      false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 621:    ArraySetAsSeries(g_bufFVGValid,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 622:    ArraySetAsSeries(g_bufOppFVG,       false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 623:    ArraySetAsSeries(g_bufSwingHigh,    false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 624:    ArraySetAsSeries(g_bufSwingLow,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 625:    ArraySetAsSeries(g_bufPrevDayHigh,  false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 626:    ArraySetAsSeries(g_bufPrevDayLow,   false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 627:    ArraySetAsSeries(g_bufAsiaHigh,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 628:    ArraySetAsSeries(g_bufAsiaLow,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 629:    ArraySetAsSeries(g_bufLondonHigh,   false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 630:    ArraySetAsSeries(g_bufLondonLow,    false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 631:    ArraySetAsSeries(g_bufNyHigh,       false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 632:    ArraySetAsSeries(g_bufNyLow,        false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 633:    ArraySetAsSeries(g_bufPmHigh,       false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 634:    ArraySetAsSeries(g_bufPmLow,       false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 635:    ArraySetAsSeries(g_bufSweepTag,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 636:    ArraySetAsSeries(g_bufHtfHi,        false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 637:    ArraySetAsSeries(g_bufHtfMid,       false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 638:    ArraySetAsSeries(g_bufHtfLo,        false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 641:    ArraySetAsSeries(g_bufXobZoneHigh,    false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 642:    ArraySetAsSeries(g_bufXobZoneLow,     false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 643:    ArraySetAsSeries(g_bufFvgLegZoneHigh, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 644:    ArraySetAsSeries(g_bufFvgLegZoneLow,  false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 647:    ArraySetAsSeries(g_bufObStructExtreme, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 648:    ArraySetAsSeries(g_bufObSwingExtreme,  false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 651:    ArraySetAsSeries(g_bufRenewalBoundaryTime, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 654:    ArraySetAsSeries(g_bufSweptMask, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 657:    ArraySetAsSeries(g_bufStructLegTime, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 660:    ArraySetAsSeries(g_bufXobObjId, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 661:    ArraySetAsSeries(g_bufFvgObjId, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 664:    ArraySetAsSeries(g_bufXobPromoTime, false);  [matched: ArraySetAsSeriesx1]  -> OnInit | HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135
 720:    ArraySetAsSeries(time,  false);  [matched: ArraySetAsSeriesx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 721:    ArraySetAsSeries(open,  false);  [matched: ArraySetAsSeriesx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 722:    ArraySetAsSeries(high,  false);  [matched: ArraySetAsSeriesx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 723:    ArraySetAsSeries(low,   false);  [matched: ArraySetAsSeriesx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 724:    ArraySetAsSeries(close, false);  [matched: ArraySetAsSeriesx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 748:       ArrayInitialize(g_bufFractalHigh,EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 749:       ArrayInitialize(g_bufFractalLow, EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 752:       ArrayInitialize(g_bufBias,         EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 753:       ArrayInitialize(g_bufOBValid,      EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 754:       ArrayInitialize(g_bufFVGValid,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 755:       ArrayInitialize(g_bufOppFVG,       EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 756:       ArrayInitialize(g_bufSwingHigh,    EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 757:       ArrayInitialize(g_bufSwingLow,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 758:       ArrayInitialize(g_bufPrevDayHigh,  EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 759:       ArrayInitialize(g_bufPrevDayLow,   EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 760:       ArrayInitialize(g_bufAsiaHigh,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 761:       ArrayInitialize(g_bufAsiaLow,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 762:       ArrayInitialize(g_bufLondonHigh,   EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 763:       ArrayInitialize(g_bufLondonLow,    EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 764:       ArrayInitialize(g_bufNyHigh,       EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 765:       ArrayInitialize(g_bufNyLow,        EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 766:       ArrayInitialize(g_bufPmHigh,       EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 767:       ArrayInitialize(g_bufPmLow,        EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 768:       ArrayInitialize(g_bufSweepTag,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 769:       ArrayInitialize(g_bufHtfHi,        EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 770:       ArrayInitialize(g_bufHtfMid,       EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 771:       ArrayInitialize(g_bufHtfLo,        EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 774:       ArrayInitialize(g_bufXobZoneHigh,    EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 775:       ArrayInitialize(g_bufXobZoneLow,     EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 776:       ArrayInitialize(g_bufFvgLegZoneHigh, EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 777:       ArrayInitialize(g_bufFvgLegZoneLow,  EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 780:       ArrayInitialize(g_bufObStructExtreme, EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 781:       ArrayInitialize(g_bufObSwingExtreme,  EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 784:       ArrayInitialize(g_bufRenewalBoundaryTime, 0.0);  [matched: ArrayInitializex1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 787:       ArrayInitialize(g_bufSweptMask, EMPTY_VALUE);  [matched: ArrayInitializex1, EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 790:       ArrayInitialize(g_bufStructLegTime, 0.0);  [matched: ArrayInitializex1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 793:       ArrayInitialize(g_bufXobObjId, 0.0);  [matched: ArrayInitializex1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 794:       ArrayInitialize(g_bufFvgObjId, 0.0);  [matched: ArrayInitializex1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 797:       ArrayInitialize(g_bufXobPromoTime, 0.0);  [matched: ArrayInitializex1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 906:          g_bufSwingHigh[target] = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 907:          g_bufSwingLow[target]  = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 952:          g_bufXobZoneHigh[target] = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 953:          g_bufXobZoneLow[target]  = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 991:          g_bufFvgLegZoneHigh[target] = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
 992:          g_bufFvgLegZoneLow[target]  = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
1043:          g_bufObStructExtreme[target] = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
1044:          g_bufObSwingExtreme[target]  = EMPTY_VALUE;  [matched: EMPTY_VALUEx1]  -> OnCalculate | HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475
NO CAPS.. Brace counting used for both six-field forms (incrementon { , decrementon } , stop at zero; both forms reported above.. Both forms were located by census in this taskand bounded by brace counting.

================ BLOCK E ================

--- E1.. Census: SState (substring rule, all 16 files) ---
Per-file N_OCC and single per-file N_LINES:
  Experts\SRJ_FlowNexus_EA.mq5: N_OCC=0 | N_LINES=0
  Indicators\SRJ_FlowLogic.mq5: N_OCC=1 | N_LINES=1
  Include\SRJ\SRJ_Alerts.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_BiasEngine.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Draw.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Fractals.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_HTFEngine.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_ImbalanceMgr.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_OrderblockMgr.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Panels.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_SeedFormat.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Sessions.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_State.mqh: N_OCC=2 | N_LINES=2
  Include\SRJ\SRJ_Text.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_TickCore.mqh: N_OCC=0 | N_LINES=0
  Include\SRJ\SRJ_Types.mqh: N_OCC=0 | N_LINES=0
Pasted distinct-line count = sum of per-file N_LINES = 3 (no caps..
Paste (every distinct line once, format <file> <line>: <text>):
  Indicators\SRJ_FlowLogic.mq5 119: SState g_sSnapshot;   [classified: DECLARATION - file-scope global variable declaration; first token SState; ends in ; ]
  Include\SRJ\SRJ_State.mqh 96: struct SState;   [classified: STRUCT HEADER]
  Include\SRJ\SRJ_State.mqh 249: SState g_s;   [classified: DECLARATION - file-scope global variable declaration; first token SState; ends in ; ]
INCIDENTAL: none.. No occurrence of SState lies inside a longer identifier in any of the 16 files..
STRUCT HEADER returned: exactly one (line 96,. Selection rule (applied and reported:: the lowest-numbered such line in SRJ_State.mqh = 96.. Bound the struct by BRACE COUNTING from its opening brace:
  SIX-FIELD: HEADER NOT APPLICABLE | PARAM LIST NOT APPLICABLE | OPENING BRACE 97 | CLOSING BRACE 247 | BODY LINES 151 | HEADER-INCLUSIVE LINES 152. Brace counting confirmed (depth table: opening brace line  97 brings depth 0 to 1; depth stays 1 through line  246; line  247 (`};`) returns depth to 0..

--- E2.. Highest-numbered DECLARATION in the E1 struct range (97-247, file-scope declaration rule relaxed to permit leading whitespace, Amendment 15 applied) ---
Highest declaration: 246: string   dataWarningName; | declared type string
CLOSING BRACE: 247: }; --- reported as a SEPARATE answer - two different lines, never merged.
Last 15 lines of the range (233-247,, contiguously, with line numbers and all leading whitespace,:
 233:    string   pmLowLineName;
 234:    string   lastSweepTag;
 235:    int      lastSweepBar;
 236:    string   erlBias;
 237: 
 238:    string   currentSessionSlot;
 239:    int      currentSlotStartBar;
 240:    string   freshSweepTag;
 241:    int      freshSweepBar;
 242:    string   freshSweepExpirySession;
 243:    bool     freshSweepExpired;
 244: 
 245:    string   mtfBoxName;
 246:    string   dataWarningName;
 247:   };

--- E3.. Declarations for the three flags within the E1 struct range (97-247,, and the long whole-token census ---
  126: bool     tickOBIsValid; | declared type bool
  127: bool     tickFVGIsValid; | declared type bool
  128: bool     hasPersistedOpposingFVG; | declared type bool
  ABSENT: none - all three identifiers are declared inside the struct range..
  Census: long as a WHOLE TOKEN (Amendment 10 test: the character before and after each match must each be absent or non-identifier;; matched across the struct range 97-247):
    N_OCC: 0 (no whole-token match anywhere in the struct range - ABSENT..
    Raw substring count (DIAGNOSTIC,: 0 (on comment-stripped text, the struct range contains no occurrence of the four letters l-o-n-g at all..

--- E4.. SRJ_StateInit (definition-header rule INCLUDING ITS FALLBACK) ---
Candidates for SRJ_StateInit: 1.. Line  297 (column 0): void SRJ_StateInit().. Parameter list closes on line  297.. Classification: DEFINITION (no line from 297 through297 ends in ; ).. Fallback NOT reached..
DEFINITION six-field form: HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194.. Brace counting confirmed..
DO NOT PASTE THE REGION - region not pasted..
From that range only, every line assigning to tickOBIsValid, tickFVGIsValid or hasPersistedOpposingFVG by the assignment-target rule, ascending,with RHS verbatim:
  327:    g_s.tickOBIsValid                  = true; | target tickOBIsValid | RHS [ true]
  328:    g_s.tickFVGIsValid                 = true; | target tickFVGIsValid | RHS [ true]
  329:    g_s.hasPersistedOpposingFVG        = false; | target hasPersistedOpposingFVG | RHS [ false]
  Integer count: 3
  ABSENT: not applicable - three lines qualify..
  Window paste (INSERTION-POINT anchor only; no scope verdict, no attribution verdict and no classification gating any design decision may be built on it;; it is not an enclosing region and is not offered as one;; exact pasted range: 321 through335 inclusive (6 LINES BEFORE THE LOWEST 327 through  6 LINES AFTER THE HIGHEST 329(,:
 321:    g_s.cachedSwingBarBullish          = SRJ_NA_INT;
 322:    g_s.cachedSwingBarBearish          = SRJ_NA_INT;
 323:    g_s.obInvalidationBoundary         = SRJ_NA_INT;
 324:    g_s.fvgDetectionBoundary           = SRJ_NA_INT;
 325:    g_s.currentLegHasXOB                = false;   // [Section 8]
 326:    g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]
 327:    g_s.tickOBIsValid                  = true;
 328:    g_s.tickFVGIsValid                 = true;
 329:    g_s.hasPersistedOpposingFVG        = false;
 330:    g_s.inBiasOBInvalidationCount      = 0;
 331:    g_s.opposingOBInvalidationCount    = 0;
 332:    g_s.bullishOBInvalidationCount     = 0;
 333:    g_s.bearishOBInvalidationCount     = 0;
 334:    g_s.firstBullishOBInvalidationBar  = SRJ_NA_INT;
 335:    g_s.firstBearishOBInvalidationBar  = SRJ_NA_INT;

================ FINAL ITEM (MANDATORY) ================
FINAL ITEM, MANDATORY:
  certutil -hashfile "DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256 -> raw certutil output:
    0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
    Compare: supplied value: 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
    Observed value: 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
    State: MATCH (EA.mq5
  certutil -hashfile "DF\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256 -> raw certutil output:
    d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
    Compare: supplied value: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
    Observed value: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
    State: MATCH (FlowLogic.mq5

================ REPORT FORMAT CHECKLIST ================
Reference documents loaded: none
Relay check: token END-OF-TASK-155-PRE1 PRESENT | per-block item counts received: A 3, B 4, C 4, D 6, E 4 | COUNT LINE CONSISTENT with both figures (3+4+4+6+4 = 21 = declared total)
Report destination: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-Pre1.md
Files read: every full path was read via shell command only (no file opened in MetaEditor): the 16 canonical files under C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\: Experts\SRJ_FlowNexus_EA.mq5, Indicators\SRJ_FlowLogic.mq5, Include\SRJ\SRJ_Alerts.mqh, SRJ_BiasEngine.mqh, SRJ_Draw.mqh, SRJ_Fractals.mqh, SRJ_HTFEngine.mqh, SRJ_ImbalanceMgr.mqh, SRJ_OrderblockMgr.mqh, SRJ_Panels.mqh, SRJ_SeedFormat.mqh, SRJ_Sessions.mqh, SRJ_State.mqh, SRJ_Text.mqh, SRJ_TickCore.mqh, SRJ_Types.mqh. Commands used: powershell [System.IO.File]::ReadAllLines with enumerated line dumps; powershell regex census scans; powershell definition-header and brace-count scans; certutil -hashfile <path> SHA256 (raw output pasted verbatim in the FINAL ITEM above).
Files written: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-Pre1.md (the report destination only. No canonical-tree file was written. This write was the only authorized write. No read of the report destination directory and no D: path read was performed).
Checkpoints: none (read-only task; no checkpoint directory or file used).
Commands that failed: the failing commands and raw error texts are listed in the header section Commands that failed (they were all superseded by corrected reruns, and no failed-command output is used as a result in this report. Errors included: The string is missing the terminator; Missing variable name after foreach; The term .Name is not recognized; Exception calling ReadAllLines: Empty path name is not legal; The regular expression pattern [^]* is not valid; Missing statement block after if; Unexpected token; Missing closing paren; Add-Content file-in-use IOException (resolved by terminating the stale holder processes).
Splits declared (reply delivery): PART 1 = header + Block A + Block B; PART 2 = Block C; PART 3 = Block D; PART 4 = Block E + FINAL HASH ITEM + checklist confirmations. The FILE at the report destination is COMPLETE and contains every part regardless of how the reply is split.
Truncations: none
Definition-header classifications: every candidate was reported with its param-list closing line and its DEFINITION or DECLARATION classification in B1, D2, D4, E4; the fallback was NEVER reached for any requested name (every requested name yielded a DEFINITION at column 0).
Region-bounds convention: confirmed - EVERY region reported in EVERY block was reported in its SIX-FIELD form (HEADER | PARAM LIST CLOSES | OPENING BRACE | CLOSING BRACE | BODY LINES | HEADER-INCLUSIVE LINES), and no single integer was ever called the line count.
Paste-sizing rule: per region: B2 pastes: SRJ_Bias_DecisionBlock BODY LINES 222 -> WHOLE; SRJ_FVG_CreationRenewalPass 238 -> WHOLE; SRJ_OB_ReplayActivationInvalidation 101 -> WHOLE; SRJ_OB_ActivationInvalidationPass 155 -> WHOLE; SRJ_StateInit 193 -> WHOLE. C4 innermost entries: 42,42,47,47,30,30,29,29 -> WHOLE(<=150), and 193 -> EXCEEDS 150 (fallback: resolved header line plus matching lines). D3 span 88 -> WHOLE(<=120). E2 last-15 paste: WHOLE by item size.
Brace rule used: brace counting - confirmed per region bounded in A1, A2, A3, B1, C1, D2, D4, D5, D6, E1, E4 (increment on { , decrement on } , stop at zero; opening brace on the line after the header, and indented; OnInit closing region carries a decoy } with three leading spaces - and was not mistaken for a closer by brace counting).
Amendment 17 used: confirmed - EVERY reported brace stack carries its [OPEN, CLOSE] pairs and its nesting assertion, and states NESTING VERIFIED. NO STACK NESTING VIOLATED stack exists in this report.
PowerShell variable-case check: confirmed - no helper used two variable names differing only in case. Stacks were cross-checked by re-running the Get-Stack helper with the corrected depth-before filter and close-line test, and every [OPEN, CLOSE] pair was verified against the per-line depth table of the same file before being reported.
Enclosing-construct rule used: confirmed - FULL open-brace stacks were computed and headers were resolved by upward scan (scanning up for the first preceding line whose first non-space token is if/else/for/while/switch/do AND whose own text is not terminated by ; ), never by textual proximity.
Attribution rule used: confirmed - (a) enumerated POINTER PARAMETERS from the definition header (ob in SRJ_OB_ReplayActivationInvalidation; none elsewhere); (e1) D < S was tested, (e2) BOTH the opening AND the brace-counted CLOSING line were tested, and (e3) stack membership was tested. Per named statement the failing part is named where a candidate was rejected (e.g. nearestOB D=141 at S=209 failed (e2) because 209 <= 154 is false; newBearFVG D=234 at S=209 failed (e1) because D after S).
Naming test used: confirmed - C2 was computed from the statement text and the RESOLVED GUARD HEADERS only, and NAMED_COUNT is an integer per statement.
Co-membership used: confirmed - C4(iii) was computed from the pasted innermost brace entry only, and CO_MEMBER_NAMED_COUNT is an integer per statement.
Declared types: confirmed - C3 reported type tokens VERBATIM and made NO agreement, match or appropriateness judgment.
Amendment 18 used: confirmed - D2 reported EVERY argument of EVERY SetIndexBuffer call with an ARG COUNT per call, and did not stop at a fixed position (all 34 calls, 3 arguments each).
Multi-line call rule used: confirmed - every argument list was closed by a matching paren across line boundaries where needed, and no answer was reported as UNTERMINATED (every SetIndexBuffer call in D2 has its matching closing paren on the call own line; the multi-line header parameter lists of B3 were closed by paren matching across lines).
Amendment 15 used: confirmed - E2 reported the highest declaration and the closing brace as TWO SEPARATE ANSWERS, and no } line was reported as a declaration (the D3 lines flagged CLOSING BRACE were reported as such, and none of them was counted).
Census-pattern provenance: confirmed - every pattern naming a function was matched as supplied in the item text (full identifiers supplied in D4 and D6: SRJ_Bias_*, SRJ_FVG_CreationRenewalPass, and hasPersistedOpposingFVG appear only as full identifiers in this tree, and every match is a full-token match; no INCIDENTAL-ONLY pattern exists in this report).

<Block A: A1 tickOBIsValid 16-file census (N_OCC per file, per-file N_LINES, every distinct line pasted once with classification, and SIX-FIELD enclosing regions); A2 tickFVGIsValid 16-file census as a SEPARATE PATTERN; A3 distinct assigning regions (6, with SIX-FIELD bounds, FLAGS ASSIGNED, and ASSIGNMENT LINES in ascending order).>
<Block B: B1 subject-region count (5, six-field bounds); B2 pastes (all five WHOLE with BODY LINES figures); B3 parameters (with BY REFERENCE/BY VALUE and CONTAINS-ASTERISK); B4 tickOBIsValid assignment lines per region (with RHS verbatim, and counts 2,2,2,2,1, total 9).>
<Block C: C1 full attribution per statement (all 8 statements; A/B/C/D/E parts with every number used, and the conjunction per candidate); C2 naming test with NAMED_COUNT per statement; C3 declared types verbatim; C4 innermost entry paste with CO_MEMBER_NAMED_COUNT per statement.>
<Block D: D1 property lines (9); D2 OnInit six-field and every SetIndexBuffer argument with ARG COUNT (34 calls, 3 args each) and HIGHEST ARG 1 = 33 AT LINE 617; D3 file-scope array declarations (32), the ARG 2 cross-reference, and the span paste (30-117, 88 lines); D4 OnCalculate six-field and the ordering census (7 lines, N_OCC per pattern=1 each, N_LINES=7); D5 tickOBIsValid window (894-911) and stack for 902, and the assignment scan; D6 initialisation-convention census (ArraySetAsSeries=39, ArrayInitialize=34, PlotIndexSetDouble=0, PLOT_EMPTY_VALUE=0, EMPTY_VALUE=37, single N_LINES=81, and per-line enclosing functions).>
<Block E: E1 SState census (3 distinct lines, and the struct SIX-FIELD bounds 97-247); E2 highest declaration AND closing brace as two answers (246 and 247), plus last-15 paste (233-247); E3 the three flag declarations (126,127,128, declared type bool each) and the long whole-token census (N_OCC=0, raw substring count=0); E4 SRJ_StateInit six-field bounds (297|297|298|490|193|194) and the initialiser window (321-335, assignments 327,328,329, count 3).>

END-OF-TASK-155-PRE1
