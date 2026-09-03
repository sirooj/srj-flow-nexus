# BUILDER RESULT — TASK 160-PreJ

Preconditions confirmed before execution:
1. Task file exists: YES — TASK_160-PreJ.md (544 lines), read via shell (`type`).
2. Status: READY FOR BUILDER (task header line 3).
3. Form: D (task header line 4).
4. Production edit: NO; Compile: NO; Run: NO (task header lines 5-7; block: "NO EDIT. NO COMPILE. NO RUN. NO FILE WRITTEN TO THE CANONICAL TREE.").
5. Census rule block present: YES — "CENSUS RULE SET — PASTED VERBATIM, NOT REFERENCED" begins inside the task and runs to its `====` terminator.

```
BUILDER RESULT
Task:                   160-PreJ (Form D, source-only)
Status:                 COMPLETED
Files read:             see FILES READ below (16 canonical files, shell only)
Files written:          this result file only (workflow-control area);
                        production files modified: NONE
Commands failed:        see COMMANDS THAT FAILED below
Splits declared:        YES — see SPLITS DECLARED below
Truncations:            NONE (no TRUNCATED marker issued; split boundaries declared instead)
Checkpoints:            none (read-only task)
Next action:            PLANNER CHECK
```

## FILES READ (every full path and the command used)

Shell command forms used (P11 satisfied — no MetaEditor):
- R1: `findstr /n /r "^" "<path>" | Select-Object -Skip <S> -First <N>` (line-numbered region reads)
- R2: `findstr /n /l /c:'<pattern>' [/c:'<p2>' ...] <16 explicit file paths>` (cross-file censuses)
- R3: `findstr /n /r "^[A-Za-z_].*(" "<path>"` (column-0 definition-header enumeration)
- R4: `certutil -hashfile "<path>" SHA256`
- R5: `Get-Content -LiteralPath '<path>'` (task file and workflow-area listing only)

Files (DF = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06):
1. DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5 (3202 lines) — R1 chunks/spans: 1-350, 362-378, 1109-1156, 1211-1288, 1288-1365, 1363-1542, 1543-1722, 1723-1872, 1873-2022, 2023-2142, 2143-2262, 2263-2382, 2383-2502, 2503-2622, 2623-2742, 2743-2862, 2863-2982, 2983-3061; plus R2, R3.
2. DF\MQL5\Indicators\SRJ_FlowLogic.mq5 (1180 lines) — R1 spans: 705-749, 749-828, 829-908, 908-997, 998-1086, 1087-1180; plus R2, R3.
3. DF\MQL5\Include\SRJ\SRJ_Alerts.mqh (50 lines) — R1 whole file; R2.
4. DF\MQL5\Include\SRJ\SRJ_BiasEngine.mqh (386 lines) — R1 spans: 11-90, 144-263, 264-386; R2.
5. DF\MQL5\Include\SRJ\SRJ_Draw.mqh (333 lines) — R2 only (no pattern hits; censused).
6. DF\MQL5\Include\SRJ\SRJ_Fractals.mqh (205 lines) — R2 only.
7. DF\MQL5\Include\SRJ\SRJ_HTFEngine.mqh (579 lines) — R2 only.
8. DF\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh (532 lines) — R1 spans: 108-227, 228-352, 377-506; R2.
9. DF\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh (1104 lines) — R1 spans: 85-204, 413-537, 538-667, 668-777; R2.
10. DF\MQL5\Include\SRJ\SRJ_Panels.mqh (439 lines) — R2 only.
11. DF\MQL5\Include\SRJ\SRJ_SeedFormat.mqh (694 lines) — R2 only.
12. DF\MQL5\Include\SRJ\SRJ_Sessions.mqh (582 lines) — R2 only.
13. DF\MQL5\Include\SRJ\SRJ_State.mqh (501 lines) — R1 spans: 294-368, 369-438, 439-501; R2.
14. DF\MQL5\Include\SRJ\SRJ_Text.mqh (174 lines) — R2 only.
15. DF\MQL5\Include\SRJ\SRJ_TickCore.mqh (984 lines) — R2 only.
16. DF\MQL5\Include\SRJ\SRJ_Types.mqh (355 lines) — R2 only.

All R2 censuses passed the SAME explicit 16-path list — no wildcard recursion, so no archived or mirrored copy was read (P14 satisfied: no D: path read).

## COMMANDS THAT FAILED (as issued, with raw error text)

1. `dir /b "C:\...\MQL5\Include\SRJ"` (x3 variants, setup phase)
   Raw error: `dir : Cannot find path 'C:\b' because it does not exist.` and `Get-ChildItem : A positional parameter cannot be found that accepts argument 'C:\...\Indicators\SRJ_FlowLogic.mq5'.`
   Cause: shell layer runs PowerShell; `dir` resolved to Get-ChildItem. Recovered with `Get-ChildItem -Name`.
2. `powershell -NoProfile -Command "$f='...'; (Get-Content $f).Count"` and `"$c = Get-Content ...; $c[55..160]"` (x2 batches)
   Raw error: `True='C:\...' is not recognized as the name of a cmdlet...` / `Missing type name after '['.`
   Cause: the shell layer strips `$` variables. Recovered by inlining paths and using `Select-Object -Skip/-First`.
3. One `Get-Content` pipeline was left waiting at `Supply values for the following parameters: Path[0]:` after `$f` was stripped; abandoned, no output consumed. Listed for completeness.
4. Systematic artifact: every `findstr ... | Select-Object -First N` command exits code 1 because `Select-Object -First` closes the pipe early; findstr then reports non-zero. Raw marker: `[Command exited with code 1]`, no error text. In every case the requested output was emitted COMPLETE (verified against file line counts and boundary re-reads). Pipeline-termination artifacts, not data failures.

## SPLITS DECLARED

The delivered report is emitted in 3 parts (output-length control, per the delivery rule):
- PART 1 — header/meta confirmations + BLOCK A complete (A1-A6). Resume: BLOCK B.
- PART 2 — BLOCK B complete (B1-B5) + BLOCK C complete (C1-C6). Resume: BLOCK D.
- PART 3 — BLOCK D complete (D1-D5) + report-format confirmations + FINAL HASH ITEM.
Every part is delivered; the final hash item is in PART 3.

## DEFINITION-HEADER CLASSIFICATIONS (every candidate)

Candidate test: column 0, NAME followed by "(", not beginning with "//"; parameter-list closing line found; if any line from candidate through that closing line ends in ";" -> DECLARATION, else DEFINITION. Fallback NOT reached for any name (every name yielded a DEFINITION).

| Name | File | Candidate line | Param list closes | Classification | Fallback reached |
|---|---|---|---|---|---|
| SRJ_OB_ReplayActivationInvalidation | Include\SRJ\SRJ_OrderblockMgr.mqh | 89 | 94 | DEFINITION | NO |
| SRJ_OB_ActivationInvalidationPass | Include\SRJ\SRJ_OrderblockMgr.mqh | 413 | 416 | DEFINITION | NO |
| SRJ_FVG_CreationRenewalPass | Include\SRJ\SRJ_ImbalanceMgr.mqh | 108 | 110 | DEFINITION | NO |
| SRJ_FVG_TickValidRecomputePass | Include\SRJ\SRJ_ImbalanceMgr.mqh | 380 | 380 | DEFINITION | NO |
| SRJ_Bias_DecisionBlock | Include\SRJ\SRJ_BiasEngine.mqh | 149 | 149 | DEFINITION | NO |
| SRJ_Bias_PerBarResetPass | Include\SRJ\SRJ_BiasEngine.mqh | 16 | 16 | DEFINITION | NO |
| SRJ_StateInit | Include\SRJ\SRJ_State.mqh | 297 | 297 | DEFINITION | NO |
| SRJ_OB_InactiveLinePrunePass | Include\SRJ\SRJ_OrderblockMgr.mqh | 613 | 613 | DEFINITION | NO |
| SRJ_OB_OpposingCachePass | Include\SRJ\SRJ_OrderblockMgr.mqh | 633 | 633 | DEFINITION | NO |
| SRJ_Bias_WeakFlipLatchPass | Include\SRJ\SRJ_BiasEngine.mqh | 376 | 376 | DEFINITION | NO |
| SRJ_Alerts_DispatchBiasRenewal | Include\SRJ\SRJ_Alerts.mqh | 20 | 20 | DEFINITION | NO |
| ZoneAdoptable | Experts\SRJ_FlowNexus_EA.mq5 | 1211 | 1211 | DEFINITION | NO |
| ZoneInPlay | Experts\SRJ_FlowNexus_EA.mq5 | 1338 | 1338 | DEFINITION | NO |

For each name the cross-file census (R2) returned exactly ONE column-0 candidate (the DEFINITION above); all other occurrences were indented call sites or comment mentions. No DECLARATION candidates exist for any of the 13 names.

## PASTE-SIZING RULE (per region)

| Region | Range (brace-counted) | Lines | Decision |
|---|---|---|---|
| A1 x7 regions | see A1 | 101/155/238/37/222/28/193 | NOT PASTED (item forbids) |
| B1 SRJ_FVG_TickValidRecomputePass | 381-417 | 37 | WHOLE (<=80) |
| C2 SRJ_OB_InactiveLinePrunePass | 614-631 | 18 | WHOLE (<=120) |
| C2 SRJ_OB_OpposingCachePass | 634-677 | 44 | WHOLE (<=120) |
| C2 SRJ_Bias_WeakFlipLatchPass | 377-384 | 8 | WHOLE (<=120) |
| C2 SRJ_Alerts_DispatchBiasRenewal | 21-41 | 21 | WHOLE (<=120) |
| D2 ZoneAdoptable | 1212-1261 | 50 | WHOLE (<=90) |
| D5 ZoneInPlay | 1339-1361 | 23 | NOT PASTED (item forbids) |

## RULE-USE CONFIRMATIONS

- Brace rule used: brace counting — CONFIRMED for A1 (all 7), A4(c), A4(d), B1, B3, B5, C1 (all 4), C4 (no entries arose), C5, C6, D1, D4, D5. No indentation used to bound any region; every closing line found by increment/decrement to zero. No `}`-led line classified as anything but CLOSING BRACE (Amendment 15).
- Enclosing-construct rule used: CONFIRMED — every FULL open-brace stack computed from the region's opening brace to the statement line, outermost first, each entry reported as <brace line>: <closing line>, headers resolved by upward scan to the first preceding if/else/for/while/switch/do line not terminated by ";" (or the definition header for the region's own brace). No proximity matching.
- Attribution rule used (Amendment 14 corrected): CONFIRMED — (a) POINTER PARAMETERS enumerated from each definition header (asterisk test); (e1) D < S tested per candidate; (e2) BOTH opening AND brace-counted closing line tested ([Dopen,Dclose] containment); (e3) stack membership tested. Per named statement, the failing part(s) are named where a candidate was rejected. No verdict built on INCIDENTAL/STRING-LITERAL/COMMENT lines. Regions whose only object is a pointer parameter did NOT return "no construction".
- Multi-line call rule used: CONFIRMED — every argument list closed by matching paren at depth across line boundaries; every continued list marked ARGUMENT LIST CONTINUES ON NEXT LINE with pasted lines and JOINED text; NO answer reported as UNTERMINATED.
- Census-pattern provenance (Amendment 13): CONFIRMED — every pattern matched exactly as supplied, full identifiers, case-sensitive. INCIDENTAL-ONLY results marked with the containing identifier. No pattern retyped or corrected.
- Keyword censuses (Amendment 10): whole-token counts reported as RESULT; raw substring counts as DIAGNOSTIC.
- Multi-pattern totals (Amendment 5): N_LINES never summed across patterns; a line matching k patterns is one line with [matched: ...].
- No expected value from any earlier task used; no previous-task line number used as an anchor; every region located by this task's censuses and bounded by this task's brace counting.

# ============================================================
# PART 1 — BLOCK A (corrected attribution across the seven flag-write regions)
# ============================================================

## A1 — the seven regions located, classified, brace-bounded

All seven names located by census (R2) across all 16 files; each had exactly one column-0 candidate. Brace counting from each opening brace to zero confirmed (BRACE RULE USED).

| # | Name | File | Header line | Param list closes | Opening brace | Closing brace | Region lines | Line count | Brace counting confirmed |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SRJ_OB_ReplayActivationInvalidation | SRJ_OrderblockMgr.mqh | 89 | 94 | 95 | 195 | 95-195 | 101 | YES |
| 2 | SRJ_OB_ActivationInvalidationPass | SRJ_OrderblockMgr.mqh | 413 | 416 | 417 | 571 | 417-571 | 155 | YES |
| 3 | SRJ_FVG_CreationRenewalPass | SRJ_ImbalanceMgr.mqh | 108 | 110 | 111 | 348 | 111-348 | 238 | YES |
| 4 | SRJ_FVG_TickValidRecomputePass | SRJ_ImbalanceMgr.mqh | 380 | 380 | 381 | 417 | 381-417 | 37 | YES |
| 5 | SRJ_Bias_DecisionBlock | SRJ_BiasEngine.mqh | 149 | 149 | 150 | 371 | 150-371 | 222 | YES |
| 6 | SRJ_Bias_PerBarResetPass | SRJ_BiasEngine.mqh | 16 | 16 | 17 | 44 | 17-44 | 28 | YES |
| 7 | SRJ_StateInit | SRJ_State.mqh | 297 | 297 | 298 | 490 | 298-490 | 193 | YES |

Non-candidate occurrences of the seven names elsewhere (reported, not classified as candidates): SRJ_OrderblockMgr.mqh 101 (comment), 251 (call), 275 (comment), 356 (call); SRJ_FlowLogic.mq5 857 (call), 855/866/868/873/878 (calls); SRJ_BiasEngine.mqh 343 (comment); Experts 1802 (comment); SRJ_FlowLogic.mq5 100 (comment), 668/800 (calls); SRJ_Types.mqh 26 (comment); SRJ_FlowLogic.mq5 862/864 (calls of the two OB passes — see census). None is a column-0 candidate; none is a declaration.

## A2 — parameter tables (per A1 DEFINITION)

R1: parameter spans multiple lines -> pasted first, one source line per output line.

DEFINITION 1 SRJ_OB_ReplayActivationInvalidation — parameter list spans lines 89-94; pasted:
```
89:bool SRJ_OB_ReplayActivationInvalidation(COrderblock *ob,
90:                                         const double barHigh,
91:                                         const double barLow,
92:                                         const double barClose,
93:                                         const int replayBar,
94:                                         const int discoveryBar)
```
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | COrderblock *ob | BY VALUE | yes |
| 2 | const double barHigh | BY VALUE | no |
| 3 | const double barLow | BY VALUE | no |
| 4 | const double barClose | BY VALUE | no |
| 5 | const int replayBar | BY VALUE | no |
| 6 | const int discoveryBar | BY VALUE | no |
(BY REFERENCE/BY VALUE applied mechanically: contains "&" -> BY REFERENCE; otherwise BY VALUE. The pointer parameter is flagged by CONTAINS-ASTERISK.)

DEFINITION 2 SRJ_OB_ActivationInvalidationPass — parameter list spans lines 413-416; pasted:
```
413:void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[],
414:                                       const double &low[],const double &close[],
415:                                       const datetime &time[],int rates_total,int i,
416:                                       bool withinLookbackWindow,bool barClosed)
```
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | const double &open[] | BY REFERENCE | no |
| 2 | const double &high[] | BY REFERENCE | no |
| 3 | const double &low[] | BY REFERENCE | no |
| 4 | const double &close[] | BY REFERENCE | no |
| 5 | const datetime &time[] | BY REFERENCE | no |
| 6 | int rates_total | BY VALUE | no |
| 7 | int i | BY VALUE | no |
| 8 | bool withinLookbackWindow | BY VALUE | no |
| 9 | bool barClosed | BY VALUE | no |

DEFINITION 3 SRJ_FVG_CreationRenewalPass — parameter list spans lines 108-110; pasted:
```
108:void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],
109:                                 const datetime &time[],int rates_total,int i,
110:                                 bool withinLookbackWindow,bool barClosed)
```
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | const double &high[] | BY REFERENCE | no |
| 2 | const double &low[] | BY REFERENCE | no |
| 3 | const datetime &time[] | BY REFERENCE | no |
| 4 | int rates_total | BY VALUE | no |
| 5 | int i | BY VALUE | no |
| 6 | bool withinLookbackWindow | BY VALUE | no |
| 7 | bool barClosed | BY VALUE | no |

DEFINITION 4 SRJ_FVG_TickValidRecomputePass (single-line list, no paste required):
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | bool withinLookbackWindow | BY VALUE | no |

DEFINITION 5 SRJ_Bias_DecisionBlock (single-line list, no paste required):
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | int i | BY VALUE | no |
| 2 | bool withinLookbackWindow | BY VALUE | no |
| 3 | bool barClosed | BY VALUE | no |

DEFINITION 6 SRJ_Bias_PerBarResetPass (single-line list, no paste required):
| position | parameter text | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK |
|---|---|---|---|
| 1 | bool barClosed | BY VALUE | no |

DEFINITION 7 SRJ_StateInit — NO PARAMETERS (empty parameter list `()`).

## A3 — flag-write assignment lines per region (assignment-target rule, region range only)

Format: `<line>: <text> | ASSIGNS-TO <name> | RHS <verbatim>`. Count per region per identifier; ABSENT where the identifier does not occur in the region at all. Comment/string rules (Amendment 3/9) applied; no comment line is listed.

REGION 1 SRJ_OB_ReplayActivationInvalidation (95-195):
```
171:               g_s.tickOBIsValid = false; | ASSIGNS-TO tickOBIsValid | RHS false
173:               g_s.tickOBIsValid = true; | ASSIGNS-TO tickOBIsValid | RHS true
```
tickOBIsValid count: 2. tickFVGIsValid: ABSENT (count 0). hasPersistedOpposingFVG: ABSENT (count 0).

REGION 2 SRJ_OB_ActivationInvalidationPass (417-571):
```
535:                     g_s.tickOBIsValid = false; | ASSIGNS-TO tickOBIsValid | RHS false
537:                     g_s.tickOBIsValid = true; | ASSIGNS-TO tickOBIsValid | RHS true
```
tickOBIsValid count: 2. tickFVGIsValid: ABSENT (count 0). hasPersistedOpposingFVG: ABSENT (count 0).

REGION 3 SRJ_FVG_CreationRenewalPass (111-348):
```
127:            g_s.tickFVGIsValid = true; | ASSIGNS-TO tickFVGIsValid | RHS true
199:               g_s.hasPersistedOpposingFVG = false; | ASSIGNS-TO hasPersistedOpposingFVG | RHS false
209:               g_s.tickOBIsValid                 = true; | ASSIGNS-TO tickOBIsValid | RHS true
210:               g_s.tickFVGIsValid                = true; | ASSIGNS-TO tickFVGIsValid | RHS true
226:            g_s.hasPersistedOpposingFVG = true; | ASSIGNS-TO hasPersistedOpposingFVG | RHS true
244:            g_s.tickFVGIsValid = true; | ASSIGNS-TO tickFVGIsValid | RHS true
316:               g_s.hasPersistedOpposingFVG = false; | ASSIGNS-TO hasPersistedOpposingFVG | RHS false
326:               g_s.tickOBIsValid                 = true; | ASSIGNS-TO tickOBIsValid | RHS true
327:               g_s.tickFVGIsValid                = true; | ASSIGNS-TO tickFVGIsValid | RHS true
343:            g_s.hasPersistedOpposingFVG = true; | ASSIGNS-TO hasPersistedOpposingFVG | RHS true
```
tickOBIsValid count: 2 (209, 326). tickFVGIsValid count: 4 (127, 210, 244, 327). hasPersistedOpposingFVG count: 4 (199, 226, 316, 343).
(Non-assignment occurrences of the three identifiers inside the region, reported for completeness, classified USE — no verdict built on them: 183, 184, 185 (Print argument lists), 300, 301, 302 (same).)

REGION 4 SRJ_FVG_TickValidRecomputePass (381-417):
```
390:   g_s.tickFVGIsValid = true; | ASSIGNS-TO tickFVGIsValid | RHS true
415:         g_s.tickFVGIsValid = !latestBiasFVGIsFilled; | ASSIGNS-TO tickFVGIsValid | RHS !latestBiasFVGIsFilled
```
tickOBIsValid: ABSENT (count 0). tickFVGIsValid count: 2 (390, 415). hasPersistedOpposingFVG: ABSENT (count 0).

REGION 5 SRJ_Bias_DecisionBlock (150-371):
```
226:      g_s.tickOBIsValid = true; | ASSIGNS-TO tickOBIsValid | RHS true
227:      g_s.tickFVGIsValid = true; | ASSIGNS-TO tickFVGIsValid | RHS true
228:      g_s.hasPersistedOpposingFVG = false; | ASSIGNS-TO hasPersistedOpposingFVG | RHS false
280:      g_s.tickOBIsValid = true; | ASSIGNS-TO tickOBIsValid | RHS true
281:      g_s.tickFVGIsValid = true; | ASSIGNS-TO tickFVGIsValid | RHS true
282:      g_s.hasPersistedOpposingFVG = false; | ASSIGNS-TO hasPersistedOpposingFVG | RHS false
```
tickOBIsValid count: 2 (226, 280). tickFVGIsValid count: 2 (227, 281). hasPersistedOpposingFVG count: 2 (228, 282).
(Non-assignment occurrence lines in-region: 154, 155, 171, 172, 183, 184, 185, 195, 208, 209, 210 — USE only, in conditions/Print argument lists.)

REGION 6 SRJ_Bias_PerBarResetPass (17-44): tickOBIsValid: ABSENT. tickFVGIsValid: ABSENT. hasPersistedOpposingFVG: ABSENT. (No A3 lines.)

REGION 7 SRJ_StateInit (298-490):
```
327:   g_s.tickOBIsValid                  = true; | ASSIGNS-TO tickOBIsValid | RHS true
328:   g_s.tickFVGIsValid                 = true; | ASSIGNS-TO tickFVGIsValid | RHS true
329:   g_s.hasPersistedOpposingFVG        = false; | ASSIGNS-TO hasPersistedOpposingFVG | RHS false
```
tickOBIsValid count: 1. tickFVGIsValid count: 1. hasPersistedOpposingFVG count: 1.

## A4 — full attribution per statement (Amendment 14 corrected, region by region)

Paste searched per region: the region's own line-numbered read (R1 span listed in FILES READ). All parts (a)-(e) reported with every number used. Candidates are only (a) pointer parameters and (b) qualifying variables; value parameters/locals are not objects under the rule.

### REGION 1 (95-195) — statements S=171 and S=173
(a) EVERY PARAMETER whose text contains "*": 1 | COrderblock *ob | ob. Pointer parameter: IN SCOPE AT EVERY STATEMENT IN THE BODY, needs no scope test.
(b) variables declared with pointer type or assigned from a call containing create/New/Get/At: NONE. (98/99/104/123 = `= false;`; 135 RHS is member access `g_s.currentStructureStartBar`, not a call; 136/137 calls are SrjIsNa — not qualifying; 168 no call.)
(c) S=171 full open-brace stack (opening -> brace-counted closing; header by upward scan):
- 95 -> 195 (header 89, definition header)
- 122 -> 192 (header 121, `if(ob.isActivated && ob.isValid && !didActivate)`)
- 130 -> 191 (header 129, `if(closedBeyondInvalidation)`)
- 161 -> 190 (header 160, `if(refOk)`)
S=173: same stack (173 lies between the same braces).
(d) no (b) variables -> no [Dopen, Dclose] entries.
(e) candidates: ob only. Parameter — in scope at every statement (no scope test required per rule). Conjunction: IN SCOPE.
VERDICT S=171: ob — IN SCOPE. VERDICT S=173: ob — IN SCOPE.

### REGION 2 (417-571) — statements S=535 and S=537
(a) EVERY PARAMETER whose text contains "*": NONE (nine parameters, none contains "*").
(b) qualifying variables: 427: `COrderblock *ob = GetOB(g_orderblocks,k);` | ob | RHS `GetOB(g_orderblocks,k)` | declaration line D=427 (pointer type AND call contains "Get").
(c) S=535 full open-brace stack:
- 417 -> 571 (header 413, definition header)
- 426 -> 570 (header 425, `for(int k = g_orderblocks.Total() - 1; k >= 0; k--)` — FOR IN STACK)
- 481 -> 569 (header 480, `if(barClosed)`)
- 483 -> 568 (header 482, `if(ob.isActivated && ob.isValid)`)
- 495 -> 567 (header 494, `if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)`)
- 525 -> 553 (header 524, `if(refOk)`)
S=537: same stack.
(d) ob: innermost brace entry containing D=427 is 426 -> [426, 570] (the region's own braces 417 [417,571] are the outermost containing entry).
(e) ob: (e1) 427 < 535 = YES; (e2) 426 <= 535 <= 570 = YES; (e3) 426 appears in the S=535 stack = YES. Conjunction: IN SCOPE.
VERDICT S=535: ob — IN SCOPE. VERDICT S=537: ob — IN SCOPE (same three YES with S=537).

### REGION 3 (111-348) — statements S=127, 199, 209, 210, 226, 244, 316, 326, 327, 343
(a) EVERY PARAMETER whose text contains "*": NONE.
(b) qualifying variables:
- 117: `CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,` | newBullFVG | RHS TERMINATOR NOT ON LINE; remainder verbatim: `SRJ_createImbalance(time,rates_total,i,` then next line `true,i - 2,low[i],srjH(high,i,2),i);` | D=117 (pointer type AND call contains "create")
- 136: `COrderblock *renewalOB = NULL;` | renewalOB | RHS `NULL` | D=136 (pointer type)
- 141: `COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);` | nearestOB | RHS `GetOB(g_orderblocks,nearestIdx)` | D=141 (pointer type AND "Get")
- 234: `CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,` | newBearFVG | RHS TERMINATOR NOT ON LINE; remainder verbatim: `SRJ_createImbalance(time,rates_total,i,` then next line `false,i - 2,srjL(low,i,2),high[i],i);` | D=234
- 253: `COrderblock *renewalOB = NULL;` | renewalOB | RHS `NULL` | D=253
- 258: `COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);` | nearestOB | RHS `GetOB(g_orderblocks,nearestIdx)` | D=258
(c) stacks (opening -> brace-counted closing, header by upward scan):
- S=127: 111->348 (header 108); 116->230 (115); 123->229 (122); 126->222 (125).
- S=199: + 175->221 (174, `if(hasNewOB && !g_s.justChangedBias)`). S=209, S=210: same as S=199.
- S=226: 111->348; 116->230; 123->229; 224->228 (223, `else`).
- S=244: 111->348; 233->347 (232); 239->346 (238); 243->339 (242).
- S=316: + 292->338 (291, `if(hasNewOB && !g_s.justChangedBias)`). S=326, S=327: same as S=316.
- S=343: 111->348; 233->347; 239->346; 341->345 (340, `else`).
(d) [Dopen, Dclose] per (b) variable: newBullFVG D=117: [116, 230]. renewalOB D=136: [126, 222]. nearestOB D=141: [140, 154]. newBearFVG D=234: [233, 347]. renewalOB D=253: [243, 339]. nearestOB D=258: [257, 271].
(e) per statement (e1: D<S; e2: Dopen<=S<=Dclose; e3: entry in stack):
- S=127: newBullFVG YES/YES/YES -> IN SCOPE. renewalOB(136) NO(e1)/-/- -> NOT IN SCOPE (e1 failed). nearestOB(141) NO(e1) -> NOT IN SCOPE (e1). newBearFVG(234) NO(e1). renewalOB(253) NO(e1). nearestOB(258) NO(e1). VERDICT: newBullFVG IN SCOPE.
- S=199: newBullFVG YES/YES/YES -> IN SCOPE. renewalOB(136) YES/YES/YES -> IN SCOPE. nearestOB(141) YES/NO(e2: 199>154)/- -> NOT IN SCOPE (e2 failed). newBearFVG(234) NO(e1). renewalOB(253) NO(e1). nearestOB(258) NO(e1). VERDICT: newBullFVG, renewalOB IN SCOPE.
- S=209: identical numbers to S=199 -> newBullFVG, renewalOB IN SCOPE; nearestOB(141) NOT IN SCOPE (e2).
- S=210: identical -> newBullFVG, renewalOB IN SCOPE; nearestOB(141) NOT IN SCOPE (e2).
- S=226: newBullFVG YES/YES(116<=226<=230)/YES -> IN SCOPE. renewalOB(136) YES/NO(e2: 226>222)/- -> NOT IN SCOPE (e2). nearestOB(141) YES/NO(e2) -> NOT IN SCOPE (e2). newBearFVG(234) NO(e1). renewalOB(253) NO(e1). nearestOB(258) NO(e1). VERDICT: newBullFVG IN SCOPE.
- S=244: newBullFVG YES/NO(e2: 244>230)/- -> NOT IN SCOPE (e2). renewalOB(136) YES/NO(e2: 244>222) -> NOT IN SCOPE (e2). nearestOB(141) YES/NO(e2: 244>154) -> NOT IN SCOPE (e2). newBearFVG YES/YES(233<=244<=347)/YES -> IN SCOPE. renewalOB(253) YES/YES(243<=244<=339)/YES -> IN SCOPE. nearestOB(258) NO(e1: 258>244) -> NOT IN SCOPE (e1). VERDICT: newBearFVG, renewalOB IN SCOPE.

- S=316: newBullFVG YES/NO(e2)/- -> NOT IN SCOPE (e2). renewalOB(136) YES/NO(e2) -> NOT IN SCOPE. nearestOB(141) YES/NO(e2) -> NOT IN SCOPE. newBearFVG YES/YES(233<=316<=347)/YES -> IN SCOPE. renewalOB(253) YES/YES(243<=316<=339)/YES -> IN SCOPE. nearestOB(258) YES/NO(e2: 316>271)/- -> NOT IN SCOPE (e2). VERDICT: newBearFVG, renewalOB IN SCOPE.
- S=326: identical to S=316 -> newBearFVG, renewalOB IN SCOPE; nearestOB(258) NOT IN SCOPE (e2).
- S=327: identical -> newBearFVG, renewalOB IN SCOPE; nearestOB(258) NOT IN SCOPE (e2).
- S=343: newBullFVG YES/NO(e2)/- -> NOT IN SCOPE. renewalOB(136) YES/NO(e2) -> NOT IN SCOPE. nearestOB(141) YES/NO(e2) -> NOT IN SCOPE. newBearFVG YES/YES(233<=343<=347)/YES -> IN SCOPE. renewalOB(253) YES/NO(e2: 343>339)/- -> NOT IN SCOPE (e2). nearestOB(258) YES/NO(e2: 343>271)/- -> NOT IN SCOPE (e2). VERDICT: newBearFVG IN SCOPE.

### REGION 4 (381-417) — statements S=390 and S=415
(a) EVERY PARAMETER whose text contains "*": NONE (single parameter, no asterisk).
(b) qualifying variables: 399: `CImbalance *fvg = GetFVG(g_imbalances,k);` | fvg | RHS `GetFVG(g_imbalances,k)` | D=399 (pointer type AND "Get").
(c) S=390 stack: 381->417 (header 380, definition header). S=415 stack: 381->417; 393->416 (header 392, `if(!SrjIsNa(fvgSearchBoundary) && g_imbalances.Total() > 0)`).
(d) fvg: innermost brace entry containing D=399 is 398 -> [398, 413] (398 is the `for(int k=0; k<n; k++)` body brace; header 397).
(e) S=390: fvg (e1) 399 < 390 = NO -> NOT IN SCOPE (e1 failed; no (a) candidate exists). VERDICT: NO OBJECT IN SCOPE AT THIS STATEMENT.
S=415: fvg (e1) 399 < 415 = YES; (e2) 398 <= 415 <= 413 = NO (415 > 413) -> NOT IN SCOPE (e2 failed). VERDICT: NO OBJECT IN SCOPE AT THIS STATEMENT.

### REGION 5 (150-371) — statements S=226, 227, 228, 280, 281, 282
(a) EVERY PARAMETER whose text contains "*": NONE (three parameters, none contains "*").
(b) qualifying variables: NONE. (157/162/170/174/259/293 declare values from conditions/ternaries/member access — no pointer type, no create/New/Get/At call.)
(c) S=226/227/228 stack: 150->371 (header 149, definition header); 215->256 (header 214, `if(doRenewal)`). S=280/281/282 stack: 150->371; 258->299 (header 257, `else if(doStrongFlip || doWeakSignalFlip)`).
(d) no (b) variables -> none.
(e) no candidates exist -> no candidate can satisfy any part.
VERDICT S=226, S=227, S=228, S=280, S=281, S=282: NO OBJECT IN SCOPE AT THIS STATEMENT.

### REGION 6 (17-44)
No A3 statements. Nothing to attribute.

### REGION 7 (298-490) — statements S=327, S=328, S=329
(a) EVERY PARAMETER whose text contains "*": NONE (no parameters at all).
(b) qualifying variables: NONE (no pointer declaration and no create/New/Get/At call on an assignment RHS; 448-478 are FreeMode/Clear calls without "=").
(c) S=327/328/329 stack: 298->490 (header 297, definition header).
(d) none. (e) no candidates exist.
VERDICT S=327, S=328, S=329: NO OBJECT IN SCOPE AT THIS STATEMENT.

## A5 — use traces (every IN-SCOPE name from A4, region range only)

Format `<line>: <text>`; INCIDENTAL marked with containing identifier. Count per name. Region 6 and the regions with no IN-SCOPE names have no trace.

REGION 1 — trace of `ob` (IN SCOPE at S=171, S=173). 26 lines, count 26:
```
96:   if(ob==NULL) return false;
102:   if(!ob.isActivated)
105:      if(ob.isBullish)
106:         shouldActivate = (barHigh > ob.high);
108:         shouldActivate = (barLow < ob.low);
112:         ob.isActivated   = true;
113:         ob.isValid       = true;
114:         ob.validationBar = replayBar;
121:   if(ob.isActivated && ob.isValid && !didActivate)
124:      if(ob.isBullish)
125:         closedBeyondInvalidation = (barClose < ob.invalidationLevel);
127:         closedBeyondInvalidation = (barClose > ob.invalidationLevel);
131:         ob.isValid         = false;
132:         ob.invalidationBar = replayBar;
136:         bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
138:                      (ob.invalidationBar >= countReferenceBar) &&
139:                      !SrjIsNa(ob.validationBar) &&
148:                  " obStart=", ob.startBar,
149:                  " obStartT=", SRJ_BarTimeStr(ob.startBar),
150:                  " obVal=", ob.validationBar,
151:                  " obInv=", ob.invalidationBar,
152:                  " obCreation=", ob.creationBar,  // NEW
153:                  " isBull=", (ob.isBullish ? 1 : 0),
163:            if(ob.isBullish)
168:            bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
169:                            (g_s.currentBias=="bearish" && !ob.isBullish);
```
INCIDENTAL notes: on lines 148-152 the strings "obStart=", "obStartT=", "obVal=", "obInv=", "obCreation=" also contain the substring `ob` inside the longer tokens (containing identifiers obStart, obStartT, obVal, obInv, obCreation, inside string literals); the `ob.` member uses on those lines are direct uses. Uppercase `OB` in firstBullishOBInvalidationBar etc. is NOT a case-sensitive `ob` match and is not listed.

REGION 2 — trace of `ob` (IN SCOPE at S=535, S=537). 52 lines, count 52:
```
427:      COrderblock *ob = GetOB(g_orderblocks,k);
428:      if(ob==NULL) continue;
430:      if(!ob.isActivated)
433:         if(ob.isBullish)
434:            shouldActivate = (liveHigh > ob.high);
436:            shouldActivate = (liveLow < ob.low);
440:            ob.isActivated   = true;
441:            ob.isValid       = true;
442:            ob.validationBar = i;
444:            if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
445:            if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
447:            int safeX1 = (int)MathMax(ob.startBar, i - 4500);
448:            int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);
450:            if(ob.isBullish && g_showValidBullishOB)
452:               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
453:                                    safeX1,ob.high,safeX2,ob.high,
456:               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
457:                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
461:            else if(!ob.isBullish && g_showValidBearishOB)
463:               ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
464:                                    safeX1,ob.low,safeX2,ob.low,
467:               ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
468:                                    safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
474:               ob.obLineName  = "";
475:               ob.midLineName = "";
482:         if(ob.isActivated && ob.isValid)
485:            if(ob.isBullish)
486:               closedBeyondInvalidation = (liveClose < ob.invalidationLevel);
488:               closedBeyondInvalidation = (liveClose > ob.invalidationLevel);
491:            bool wouldBeSameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == i);
492:            bool isCreationBar = (!SrjIsNa(ob.creationBar) && ob.creationBar == i);  // NEW
496:               ob.isValid         = false;
497:               ob.invalidationBar = i;
502:               bool sameBarValInv = (!SrjIsNa(ob.validationBar) && ob.validationBar == ob.invalidationBar);
505:                            (ob.invalidationBar >= countReferenceBar) &&
506:                            !SrjIsNa(ob.validationBar) &&
512:                        " obStart=", ob.startBar,
513:                        " obStartT=", SRJ_BarTimeStr(ob.startBar),
514:                        " obVal=", ob.validationBar,
515:                        " obInv=", ob.invalidationBar,
516:                        " obCreation=", ob.creationBar,  // NEW debug output
517:                        " isBull=", (ob.isBullish ? 1 : 0),
527:                  if(ob.isBullish)
532:                  bool isInBias = (g_s.currentBias=="bullish" && ob.isBullish) ||
533:                                  (g_s.currentBias=="bearish" && !ob.isBullish);
539:                  if(ob.isBullish)
555:               if(ob.HasObLine())
557:                  color invalidColor = ob.isBullish ? g_invalidatedBullishColor
559:                  SRJ_SetTrendColor(ob.obLineName, invalidColor);
560:                  SRJ_SetTrendExtend(ob.obLineName, g_extendInvalidated);
562:               if(ob.HasMidLine())
564:                  SRJ_SetTrendColor(ob.midLineName, g_invalidatedMidlineColor);
565:                  SRJ_SetTrendExtend(ob.midLineName, g_extendInvalidated);
```
INCIDENTAL notes: 512-516 strings "obStart=", "obStartT=", "obVal=", "obInv=", "obCreation=" contain `ob` in longer tokens (obStart, obStartT, obVal, obInv, obCreation); `ob.` member uses are direct. Uppercase OB tokens not listed.

REGION 3 — traces (IN SCOPE per A4): `newBullFVG` N_LINES 2 / N_OCC 2; `renewalOB` N_LINES 6 / N_OCC 8; `nearestOB` N_LINES 14 / N_OCC 16; `newBearFVG` N_LINES 2 / N_OCC 2:
```
117:      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,     [newBullFVG]
119:      g_imbalances.Add(newBullFVG);                                        [newBullFVG]
136:            COrderblock *renewalOB = NULL;                                 [renewalOB D=136]
141:               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);   [nearestOB D=141]
142:               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))  [nearestOB x2]
144:                  scanStartBar = nearestOB.startBar;                       [nearestOB]
145:                  scanValBar   = nearestOB.validationBar;                  [nearestOB]
146:                  scanIsNew    = !nearestOB.hasDrivenRenewal;              [nearestOB]
149:                     latestOBValidationBar = nearestOB.validationBar;      [nearestOB]
151:                     renewalOB             = nearestOB;                    [renewalOB, nearestOB]
204:               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;    [renewalOB x2]
234:      CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,     [newBearFVG]
236:      g_imbalances.Add(newBearFVG);                                        [newBearFVG]
253:            COrderblock *renewalOB = NULL;                                 [renewalOB D=253]
258:               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);   [nearestOB D=258]
259:               if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))  [nearestOB x2]
261:                  scanStartBar = nearestOB.startBar;                       [nearestOB]
262:                  scanValBar   = nearestOB.validationBar;                  [nearestOB]
263:                  scanIsNew    = !nearestOB.hasDrivenRenewal;              [nearestOB]
266:                     latestOBValidationBar = nearestOB.validationBar;      [nearestOB]
268:                     renewalOB             = nearestOB;                    [renewalOB, nearestOB]
321:               if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;    [renewalOB x2]
```
Counts: N_LINES — newBullFVG 2 (117, 119); renewalOB 6 (136, 151, 204, 253, 268, 321); nearestOB 14 (141, 142, 144, 145, 146, 149, 151, 258, 259, 261, 262, 263, 266, 268); newBearFVG 2 (234, 236). N_OCC (counting repeats on a line) — newBullFVG 2; renewalOB 8; nearestOB 16; newBearFVG 2. No INCIDENTAL occurrences of these four names inside longer identifiers in the region.

REGION 4 — no IN-SCOPE names (both verdicts were NO OBJECT IN SCOPE AT THIS STATEMENT) -> no trace.
REGION 5 — no IN-SCOPE names -> no trace.
REGION 6 — no A3 statements, no IN-SCOPE names -> no trace.
REGION 7 — no IN-SCOPE names -> no trace.

## A6 — per-region census (8 separate patterns, multi-pattern + substring rules, region range only)

Patterns: objId, COrderblock, CImbalance, GetOB, GetFVG, SRJ_createImbalance, SRJ_NextObjId, discoveryBar. N_OCC per pattern; ONE per-region N_LINES; each distinct line pasted once with [matched: ...]; ABSENT per pattern where it does not occur; NO CAPS; no N_LINES summed across patterns.

REGION 1 (95-195):
- objId ABSENT. COrderblock ABSENT. CImbalance ABSENT. GetOB ABSENT. GetFVG ABSENT. SRJ_createImbalance ABSENT. SRJ_NextObjId ABSENT.
- discoveryBar N_OCC=9 (no repeats except as noted).
- N_LINES = 9:
```
142:         if(SRJ_InDebugWindow(discoveryBar))                             [matched: discoveryBar]
143:            Print("SRJ INV t=", SRJ_BarTimeStr(discoveryBar),            [matched: discoveryBar]
144:                  " bar=", discoveryBar,                                 [matched: discoveryBar]
164:               g_bullishInvalidationBarsHistory.Add(discoveryBar);  // attribute to discovery bar   [matched: discoveryBar x2]
166:               g_bearishInvalidationBarsHistory.Add(discoveryBar);                                       [matched: discoveryBar]
179:                  g_s.firstBullishOBInvalidationBar = discoveryBar;                                        [matched: discoveryBar]
180:               g_s.lastBullishOBInvalidationBar = discoveryBar;                                            [matched: discoveryBar]
186:                  g_s.firstBearishOBInvalidationBar = discoveryBar;                                        [matched: discoveryBar]
187:               g_s.lastBearishOBInvalidationBar = discoveryBar;                                            [matched: discoveryBar]
```
(Line 164 contains discoveryBar twice — both counted: eight single-occurrence lines + one two-occurrence line = 9 occurrences.)

REGION 2 (417-571):
- objId ABSENT. CImbalance ABSENT. GetFVG ABSENT. SRJ_createImbalance ABSENT. SRJ_NextObjId ABSENT. discoveryBar ABSENT.
- COrderblock N_OCC=1; GetOB N_OCC=1.
- N_LINES = 1:
```
427:      COrderblock *ob = GetOB(g_orderblocks,k);                          [matched: COrderblock, GetOB]
```

REGION 3 (111-348):
- objId ABSENT. GetFVG ABSENT. SRJ_NextObjId ABSENT. discoveryBar ABSENT.
- COrderblock N_OCC=4 (136, 141, 253, 258); CImbalance N_OCC=2 (117, 234); GetOB N_OCC=2 (141, 258); SRJ_createImbalance N_OCC=2 (117, 234).
- N_LINES = 6:
```
117:      CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,   [matched: CImbalance, SRJ_createImbalance]
136:            COrderblock *renewalOB = NULL;                               [matched: COrderblock]
141:               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx); [matched: COrderblock, GetOB]
234:      CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,    [matched: CImbalance, SRJ_createImbalance]
253:            COrderblock *renewalOB = NULL;                               [matched: COrderblock]
258:               COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx); [matched: COrderblock, GetOB]
```

REGION 4 (381-417):
- objId ABSENT. COrderblock ABSENT. GetOB ABSENT. SRJ_createImbalance ABSENT. SRJ_NextObjId ABSENT. discoveryBar ABSENT.
- CImbalance N_OCC=1; GetFVG N_OCC=1.
- N_LINES = 1:
```
399:         CImbalance *fvg = GetFVG(g_imbalances,k);                       [matched: CImbalance, GetFVG]
```

REGION 5 (150-371): all eight patterns ABSENT. N_LINES = 0. (A count of 0 is a result.)
REGION 6 (17-44): all eight patterns ABSENT. N_LINES = 0.
REGION 7 (298-490): all eight patterns ABSENT. N_LINES = 0. (Line 487 `g_srjObjIdSeq = 0;` contains `ObjId` with capital O — NOT a case-sensitive match for the pattern `objId`; reported as no match.)

# ============================================================
# PART 2 — BLOCK B (buffer 35's scope question) + BLOCK C
# ============================================================

## B1 — SRJ_FVG_TickValidRecomputePass region and paste

Location: census (R2) found the single column-0 candidate at SRJ_ImbalanceMgr.mqh line 380; parameter list closes on 380; line 380 does not end in ";" -> DEFINITION. Brace counting: opening brace 381, closing brace 417 (depth reaches 0 at 417). BRACE RULE USED. Range 381-417, integer line count 37. 37 <= 80 -> paste WHOLE (range 381-417, 37 lines):
```
380:void SRJ_FVG_TickValidRecomputePass(bool withinLookbackWindow)
381:  {
382:   if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))
383:      return;
384:
385:   int fvgSearchBoundary = (g_s.currentBias=="bullish") ? g_s.cachedSwingBarBearish
386:                                                        : g_s.cachedSwingBarBullish;
387:   if(SrjIsNa(fvgSearchBoundary))
388:      fvgSearchBoundary = g_s.currentStructureStartBar;
389:
390:   g_s.tickFVGIsValid = true;
391:
392:   if(!SrjIsNa(fvgSearchBoundary) && g_imbalances.Total() > 0)
393:     {
394:      int  latestBiasFVGBar = SRJ_NA_INT;
395:      bool latestBiasFVGIsFilled = false;
396:      int n = g_imbalances.Total();
397:      for(int k=0; k<n; k++)
398:        {
399:         CImbalance *fvg = GetFVG(g_imbalances,k);
400:         if(fvg==NULL) continue;
401:         bool isInBias = (g_s.currentBias=="bullish" && fvg.isBullish) ||
402:                         (g_s.currentBias=="bearish" && !fvg.isBullish);
403:         bool isWithinBoundary = (fvg.startBar >= fvgSearchBoundary) &&
404:                                 (fvg.startBar >= g_s.strictLimitBar);
405:         if(isInBias && isWithinBoundary)
406:           {
407:            if(SrjIsNa(latestBiasFVGBar) || fvg.startBar > latestBiasFVGBar)
408:              {
409:               latestBiasFVGBar = fvg.startBar;
410:               latestBiasFVGIsFilled = fvg.isFilled;
411:              }
412:           }
413:        }
414:      if(!SrjIsNa(latestBiasFVGBar))
415:         g_s.tickFVGIsValid = !latestBiasFVGIsFilled;
416:     }
417:  }
```
(Line 380 pasted with the region for context; the region proper is 381-417.)

## B2 — statements from the B1 paste only (paste searched: B1, lines 381-417)

every "for"/"while"/"switch"/"do" header (whole-token rule):
- 397: `for(int k=0; k<n; k++)` — RESULT (whole-token count) = 1; DIAGNOSTIC (raw substring count of "for") = 1.
- No while, no switch, no do in the paste (ABSENT, counts 0).

every return statement:
- 383: `return;` — BARE.
- Statement count 1; raw substring-hit count for "return" = 1.

every assignment-target line (exact RHS; Amendment 11 applied):
```
385: target fvgSearchBoundary | RHS TERMINATOR NOT ON LINE — remainder verbatim:
     `(g_s.currentBias=="bullish") ? g_s.cachedSwingBarBearish`
     then next line `                                     : g_s.cachedSwingBarBullish;`
388: target fvgSearchBoundary | RHS `g_s.currentStructureStartBar`
390: target tickFVGIsValid | RHS `true`
394: target latestBiasFVGBar | RHS `SRJ_NA_INT`
395: target latestBiasFVGIsFilled | RHS `false`
396: target n | RHS `g_imbalances.Total()`
399: target fvg | RHS `GetFVG(g_imbalances,k)`
401: target isInBias | RHS TERMINATOR NOT ON LINE — remainder verbatim: `(g_s.currentBias=="bearish" && !fvg.isBullish);` (line 402)
403: target isWithinBoundary | RHS TERMINATOR NOT ON LINE — remainder verbatim: `(fvg.startBar >= g_s.strictLimitBar);` (line 404)
409: target latestBiasFVGBar | RHS `fvg.startBar`
410: target latestBiasFVGIsFilled | RHS `fvg.isFilled`
415: target tickFVGIsValid | RHS `!latestBiasFVGIsFilled`
```

every line containing "Total(":
```
392:   if(!SrjIsNa(fvgSearchBoundary) && g_imbalances.Total() > 0)
396:      int n = g_imbalances.Total();
```
every line containing "startBar":
```
403:         bool isWithinBoundary = (fvg.startBar >= fvgSearchBoundary) &&
404:                                 (fvg.startBar >= g_s.strictLimitBar);
409:               latestBiasFVGBar = fvg.startBar;
```
every line containing "isFilled":
```
410:               latestBiasFVGIsFilled = fvg.isFilled;
```
(Case-sensitivity note: lines 395 and 415 contain `latestBiasFVGIsFilled` — capital `I` in `IsFilled` — NOT a case-sensitive match for `isFilled`; line 410 matches via `fvg.isFilled`.)
every line containing "strictLimitBar":
```
404:                                 (fvg.startBar >= g_s.strictLimitBar);
```
every comparison line by the comparison rule for "latestBiasFVGBar":
- NONE. No line containing `latestBiasFVGBar` contains `==` or `!=` and no line's first non-space token is `case`. (The identifier occurs at 394, 407, 409, 414; line 407 uses `>` and a SrjIsNa call, which does not satisfy the comparison rule.)

## B3 — lowest-numbered tickFVGIsValid write (S = 390)

Selection rule applied: smallest line number among this region's assignment lines for tickFVGIsValid -> S=390 (`g_s.tickFVGIsValid = true;`).
- Line: `390:   g_s.tickFVGIsValid = true;`
- FULL open-brace stack (enclosing-construct rule): single entry — 381 -> 417 (header 380, the definition header). No deeper brace encloses 390.
- Every variable and pointer parameter satisfying attribution (a) or (b) with D < S: NONE WITH D < S. ((a): the header's single parameter `bool withinLookbackWindow` contains no "*" — no pointer parameter exists. (b): the only qualifying declaration is fvg at D=399, and 399 > 390.)
- VERDICT: NO OBJECT IN SCOPE AT THIS STATEMENT.

## B4 — loop directions (from B1 paste only)

Every `for` header found in B2: one, at 397.
```
397:      for(int k=0; k<n; k++) | INIT `int k=0` | CONDITION `k<n` | INCREMENT `k++`
```
(Clauses verbatim between the header's unquoted ";" characters at paren depth 1.)

## B5 — 16-file census for SRJ_FVG_TickValidRecomputePass (substring rule)

Shell census (R2, all 16 explicit paths). Per-file results; N_OCC counted per file; N_LINES per file (distinct lines).

| File | N_OCC | N_LINES | Classification |
|---|---|---|---|
| SRJ_FlowNexus_EA.mq5 | 0 | 0 | ABSENT |
| SRJ_FlowLogic.mq5 | 1 | 1 | 873 = CALL SITE |
| SRJ_Alerts.mqh | 0 | 0 | ABSENT |
| SRJ_BiasEngine.mqh | 0 | 0 | ABSENT |
| SRJ_Draw.mqh | 0 | 0 | ABSENT |
| SRJ_Fractals.mqh | 0 | 0 | ABSENT |
| SRJ_HTFEngine.mqh | 0 | 0 | ABSENT |
| SRJ_ImbalanceMgr.mqh | 1 | 1 | 380 = DEFINITION HEADER |
| SRJ_OrderblockMgr.mqh | 0 | 0 | ABSENT |
| SRJ_Panels.mqh | 0 | 0 | ABSENT |
| SRJ_SeedFormat.mqh | 0 | 0 | ABSENT |
| SRJ_Sessions.mqh | 0 | 0 | ABSENT |
| SRJ_State.mqh | 0 | 0 | ABSENT |
| SRJ_Text.mqh | 0 | 0 | ABSENT |
| SRJ_TickCore.mqh | 0 | 0 | ABSENT |
| SRJ_Types.mqh | 0 | 0 | ABSENT |

Distinct lines pasted once:
```
SRJ_FlowLogic.mq5 873:      SRJ_FVG_TickValidRecomputePass(withinLookbackWindow);      [CALL SITE]
SRJ_ImbalanceMgr.mqh 380:void SRJ_FVG_TickValidRecomputePass(bool withinLookbackWindow)   [DEFINITION HEADER]
```

CALL SITE detail (SRJ_FlowLogic.mq5:873):
- Exact argument list text under the multi-line call rule: the matching ")" of the "(" following the name is on the SAME line -> argument list text `withinLookbackWindow` (call reads `SRJ_FVG_TickValidRecomputePass(withinLookbackWindow);`). Not continued; no JOINED mark needed.
- Enclosing function: OnCalculate, located by the definition-header rule (candidate at SRJ_FlowLogic.mq5 line 705, column 0, parameter list closes on 714, no ";" -> DEFINITION). Brace-counted range 715-1179, integer line count 465. BRACE RULE USED.
- FULL open-brace stack at 873 (each entry opening -> brace-counted closing, header by upward scan):
  - 715 -> 1179 (header 705, definition header)
  - 820 -> 1152 (header 819, `for(int i = start; i < rates_total; i++)` — FOR IN STACK)

# ============================================================
# BLOCK C (the four unread FlowLogic passes, and the emission surface)
# ============================================================

## C1 — the four names located, classified, brace-bounded

All four located by census (R2); each had exactly one column-0 candidate. Brace counting confirmed (BRACE RULE USED).

| Name | File | Header line | Param list closes | Opening brace | Closing brace | Lines | Count | Confirmed |
|---|---|---|---|---|---|---|---|---|
| SRJ_OB_InactiveLinePrunePass | SRJ_OrderblockMgr.mqh | 613 | 613 | 614 | 631 | 614-631 | 18 | YES |
| SRJ_OB_OpposingCachePass | SRJ_OrderblockMgr.mqh | 633 | 633 | 634 | 677 | 634-677 | 44 | YES |
| SRJ_Bias_WeakFlipLatchPass | SRJ_BiasEngine.mqh | 376 | 376 | 377 | 384 | 377-384 | 8 | YES |
| SRJ_Alerts_DispatchBiasRenewal | SRJ_Alerts.mqh | 20 | 20 | 21 | 41 | 21-41 | 21 | YES |

Other occurrences (not candidates): SRJ_FlowLogic.mq5 862 (call), 864 (call), 866 (call), 880 (call). No fallback required.

## C2 — pastes (line count first; all four <= 120 -> WHOLE)

SRJ_OB_InactiveLinePrunePass — 18 lines — WHOLE (613-631):
```
613:void SRJ_OB_InactiveLinePrunePass(bool withinLookbackWindow)
614:  {
615:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
616:      return;
617:
618:   int n = g_orderblocks.Total();
619:   for(int k=0; k<n; k++)
620:     {
621:      COrderblock *ob = GetOB(g_orderblocks,k);
622:      if(ob==NULL) continue;
623:      if(ob.isActivated) continue;
624:      if(ob.startBar < g_s.strictLimitBar)
625:        {
626:         if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
627:         if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
628:         continue;
629:        }
630:     }
631:  }
```

SRJ_OB_OpposingCachePass — 44 lines — WHOLE (633-677):
```
633:void SRJ_OB_OpposingCachePass(int i,int finalLookback,bool withinLookbackWindow)
634:  {
635:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
636:      return;
637:
638:   int n = g_orderblocks.Total();
639:   for(int k=0; k<n; k++)
640:     {
641:      COrderblock *ob = GetOB(g_orderblocks,k);
642:      if(ob==NULL) continue;
643:      if(ob.isActivated && !SrjIsNa(ob.validationBar) && ob.validationBar == i)
644:        {
645:         bool isOpposing = (g_s.currentBias=="bullish" && !ob.isBullish) ||
646:                           (g_s.currentBias=="bearish" &&  ob.isBullish);
647:         if(isOpposing)
648:           {
649:            bool opposingFVGExists = false;
650:            int m = g_imbalances.Total();
651:            for(int j=0; j<m; j++)
652:              {
653:               CImbalance *fvg = GetFVG(g_imbalances,j);
654:               if(fvg==NULL) continue;
655:               bool fvgIsOpposing = (g_s.currentBias=="bullish" && !fvg.isBullish) ||
656:                                    (g_s.currentBias=="bearish" &&  fvg.isBullish);
657:               if(fvgIsOpposing && fvg.startBar > ob.swingBar)
658:                 {
659:                  opposingFVGExists = true;
660:                  break;
661:                 }
662:              }
663:            if(opposingFVGExists)
664:              {
665:               int swingOffset = i - ob.swingBar;
666:               if(swingOffset > 0 && swingOffset <= finalLookback)
667:                 {
668:                  if(g_s.currentBias == "bullish")
669:                     g_s.cachedSwingBarBearish = ob.swingBar;
670:                  else
671:                     g_s.cachedSwingBarBullish = ob.swingBar;
672:                 }
673:              }
674:           }
675:        }
676:     }
677:  }
```

SRJ_Bias_WeakFlipLatchPass — 8 lines — WHOLE (376-384):
```
376:void SRJ_Bias_WeakFlipLatchPass()
377:  {
378:   if(SrjIsNa(g_s.currentBias))
379:      return;
380:
381:   // Latch the weak-flip condition if all three preconditions are met
382:   if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG)
383:      g_s.weakFlipPreconditionMet = true;
384:  }
```

SRJ_Alerts_DispatchBiasRenewal — 21 lines — WHOLE (20-41):
```
20:void SRJ_Alerts_DispatchBiasRenewal(int i)
21:  {
22:   if(g_enableBiasFlipAlerts)
23:     {
24:      if(g_s.bullishBiasFlipAlert)
25:         SRJ_DispatchAlert(g_alertBar_bullFlip, i,
26:                           "SRJ Flow Logic: Bullish Bias Flip Detected");
27:      if(g_s.bearishBiasFlipAlert)
28:         SRJ_DispatchAlert(g_alertBar_bearFlip, i,
29:                           "SRJ Flow Logic: Bearish Bias Flip Detected");
30:     }
31:
32:   if(g_enableStructureRenewalAlerts)
33:     {
34:      if(g_s.bullishStructureRenewalAlert)
35:         SRJ_DispatchAlert(g_alertBar_bullRenewal, i,
36:                           "SRJ Flow Logic: Bullish Structure Renewal");
37:      if(g_s.bearishStructureRenewalAlert)
38:         SRJ_DispatchAlert(g_alertBar_bearRenewal, i,
39:                           "SRJ Flow Logic: Bearish Structure Renewal");
40:     }
41:  }
```

## C3 — per-region statements (paste searched named per region)

### REGION SRJ_OB_InactiveLinePrunePass (paste searched: C2 WHOLE 613-631)
- every parameter: 1 | bool withinLookbackWindow | BY VALUE.
- ".Delete(" lines: ABSENT. (Lines 626/627 contain `SRJ_DeleteObj(` — no dot precedes `Delete`, so the pattern `.Delete(` does not match.)
- ".Add(" lines: ABSENT. ".Clear(" lines: ABSENT.
- ".Total(" lines:
```
615:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
618:   int n = g_orderblocks.Total();
```
- "g_orderblocks":
```
615:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
618:   int n = g_orderblocks.Total();
621:      COrderblock *ob = GetOB(g_orderblocks,k);
```
- "g_imbalances": ABSENT. "ObjectDelete": ABSENT. "barClosed": ABSENT. "Alert": ABSENT. "SendNotification": ABSENT. "Print": ABSENT.
- assignment-target lines (exact RHS):
```
618:   int n = g_orderblocks.Total(); | target n | RHS `g_orderblocks.Total()`
621:      COrderblock *ob = GetOB(g_orderblocks,k); | target ob | RHS `GetOB(g_orderblocks,k)`
626:         if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; } | target obLineName (third occurrence on the line) | RHS `""`
627:         if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; } | target midLineName (third occurrence on the line) | RHS `""`
```
- "for"/"while"/"switch"/"do" headers (whole-token): 619 `for(int k=0; k<n; k++)` — RESULT 1, DIAGNOSTIC 1 (raw substring "for" = 1). while/switch/do ABSENT.
- return statements: 616 `return;` — BARE. Statement count 1; raw substring-hit count 1. (622/628 are `continue;`.)

### REGION SRJ_OB_OpposingCachePass (paste searched: C2 WHOLE 633-677)
- every parameter: 1 | int i | BY VALUE; 2 | int finalLookback | BY VALUE; 3 | bool withinLookbackWindow | BY VALUE.
- ".Delete(" lines: ABSENT. ".Add(": ABSENT. ".Clear(": ABSENT.
- ".Total(" lines:
```
635:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
638:   int n = g_orderblocks.Total();
650:            int m = g_imbalances.Total();
```
- "g_orderblocks":
```
635:   if(!(withinLookbackWindow && g_orderblocks.Total() > 0))
638:   int n = g_orderblocks.Total();
641:      COrderblock *ob = GetOB(g_orderblocks,k);
```
- "g_imbalances":
```
650:            int m = g_imbalances.Total();
653:               CImbalance *fvg = GetFVG(g_imbalances,j);
```
- "ObjectDelete": ABSENT. "barClosed": ABSENT. "Alert": ABSENT. "SendNotification": ABSENT. "Print": ABSENT.
- assignment-target lines (exact RHS):
```
638:   int n = g_orderblocks.Total(); | target n | RHS `g_orderblocks.Total()`
641:      COrderblock *ob = GetOB(g_orderblocks,k); | target ob | RHS `GetOB(g_orderblocks,k)`
645:         bool isOpposing = (g_s.currentBias=="bullish" && !ob.isBullish) || | target isOpposing | RHS TERMINATOR NOT ON LINE — remainder verbatim: `(g_s.currentBias=="bearish" &&  ob.isBullish);` (line 646)
649:            bool opposingFVGExists = false; | target opposingFVGExists | RHS `false`
650:            int m = g_imbalances.Total(); | target m | RHS `g_imbalances.Total()`
653:               CImbalance *fvg = GetFVG(g_imbalances,j); | target fvg | RHS `GetFVG(g_imbalances,j)`
655:               bool fvgIsOpposing = (g_s.currentBias=="bullish" && !fvg.isBullish) || | target fvgIsOpposing | RHS TERMINATOR NOT ON LINE — remainder verbatim: `(g_s.currentBias=="bearish" &&  fvg.isBullish);` (line 656)
659:                  opposingFVGExists = true; | target opposingFVGExists | RHS `true`
665:               int swingOffset = i - ob.swingBar; | target swingOffset | RHS `i - ob.swingBar`
669:                     g_s.cachedSwingBarBearish = ob.swingBar; | target cachedSwingBarBearish | RHS `ob.swingBar`
671:                     g_s.cachedSwingBarBullish = ob.swingBar; | target cachedSwingBarBullish | RHS `ob.swingBar`
```
- "for"/"while"/"switch"/"do" headers (whole-token): 639 `for(int k=0; k<n; k++)`; 651 `for(int j=0; j<m; j++)` — RESULT 2, DIAGNOSTIC 2. while/switch/do ABSENT.
- return statements: ABSENT. Statement count 0; raw substring-hit count 0.

### REGION SRJ_Bias_WeakFlipLatchPass (paste searched: C2 WHOLE 376-384)
- every parameter: NONE (empty parameter list).
- ".Delete(": ABSENT. ".Add(": ABSENT. ".Clear(": ABSENT. ".Total(": ABSENT. "g_orderblocks": ABSENT. "g_imbalances": ABSENT. "ObjectDelete": ABSENT. "barClosed": ABSENT. "Alert": ABSENT. "SendNotification": ABSENT. "Print": ABSENT.
- assignment-target lines:
```
383:      g_s.weakFlipPreconditionMet = true; | target weakFlipPreconditionMet | RHS `true`
```
- "for"/"while"/"switch"/"do": ABSENT — RESULT 0, DIAGNOSTIC 0.
- return statements: 379 `return;` — BARE. Statement count 1; raw substring-hit count 1.

### REGION SRJ_Alerts_DispatchBiasRenewal (paste searched: C2 WHOLE 20-41)
- every parameter: 1 | int i | BY VALUE.
- ".Delete(": ABSENT. ".Add(": ABSENT. ".Clear(": ABSENT. ".Total(": ABSENT. "g_orderblocks": ABSENT. "g_imbalances": ABSENT. "ObjectDelete": ABSENT. "barClosed": ABSENT.
- "Alert" lines (ALL INCIDENTAL — containing identifiers named):
```
20: SRJ_Alerts_DispatchBiasRenewal(int i)                     [INCIDENTAL — SRJ_Alerts_DispatchBiasRenewal]
22: if(g_enableBiasFlipAlerts)                                [INCIDENTAL — g_enableBiasFlipAlerts]
24: if(g_s.bullishBiasFlipAlert)                              [INCIDENTAL — bullishBiasFlipAlert]
25: SRJ_DispatchAlert(g_alertBar_bullFlip, i,                 [INCIDENTAL — SRJ_DispatchAlert]
27: if(g_s.bearishBiasFlipAlert)                              [INCIDENTAL — bearishBiasFlipAlert]
28: SRJ_DispatchAlert(g_alertBar_bearFlip, i,                 [INCIDENTAL — SRJ_DispatchAlert]
32: if(g_enableStructureRenewalAlerts)                        [INCIDENTAL — g_enableStructureRenewalAlerts]
34: if(g_s.bullishStructureRenewalAlert)                      [INCIDENTAL — bullishStructureRenewalAlert]
35: SRJ_DispatchAlert(g_alertBar_bullRenewal, i,              [INCIDENTAL — SRJ_DispatchAlert]
37: if(g_s.bearishStructureRenewalAlert)                      [INCIDENTAL — bearishStructureRenewalAlert]
38: SRJ_DispatchAlert(g_alertBar_bearRenewal, i,              [INCIDENTAL — SRJ_DispatchAlert]
```
- "SendNotification": ABSENT. "Print": ABSENT.
- assignment-target lines: NONE.
- "for"/"while"/"switch"/"do": ABSENT — RESULT 0, DIAGNOSTIC 0.
- return statements: ABSENT. Statement count 0; raw substring-hit count 0.

## C4 — delete and alert stacks (from C3)

Lines containing `.Delete(` reported in C3: NONE in any of the four regions. (The only delete-shaped calls are `SRJ_DeleteObj(` at 626/627, which do not contain the pattern `.Delete(`.)
Lines containing `Alert` that are NOT INCIDENTAL: NONE in any of the four regions (the Alerts region's Alert occurrences are all INCIDENTAL, listed above; no non-incidental Alert line exists in any C2 paste).
Therefore C4 has no lines to stack: the FULL open-brace stack requirement, the ANY-LOOP-OR-SWITCH-IN-STACK verdict, and the nearest enclosing "if" by BRACE SCOPE have no instance to compute. Reported as NONE for both categories (a count of 0 is a result). No verdict was built on an INCIDENTAL line.

## C5 — 16-file emission census (patterns: Alert(, SendNotification(, PlaySound(, SendMail(, SendFTP()

Shell census (R2, all 16 explicit paths). Per-file N_OCC per pattern; SINGLE per-file N_LINES; ABSENT per pattern per file where it does not occur; NO CAPS; no N_LINES summed across patterns.

| File | Alert( | SendNotification( | PlaySound( | SendMail( | SendFTP( | N_LINES |
|---|---|---|---|---|---|---|
| SRJ_FlowNexus_EA.mq5 | 5 | 1 | ABSENT | ABSENT | ABSENT | 6 |
| SRJ_FlowLogic.mq5 | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Alerts.mqh | 7 | 1 | ABSENT | 1 | ABSENT | 9 |
| SRJ_BiasEngine.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Draw.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Fractals.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_HTFEngine.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_ImbalanceMgr.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_OrderblockMgr.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Panels.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_SeedFormat.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Sessions.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_State.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Text.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_TickCore.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |
| SRJ_Types.mqh | ABSENT | ABSENT | ABSENT | ABSENT | ABSENT | 0 |

Distinct lines pasted once (per file, in line order):
```
SRJ_FlowNexus_EA.mq5 362:void EmitAlert(const string kind, const string detail, bool pushable)   [matched: Alert(]  [INCIDENTAL — EmitAlert]
SRJ_FlowNexus_EA.mq5 371:   if(pushable && InpAlertPopup) Alert(msg);   [matched: Alert(]
SRJ_FlowNexus_EA.mq5 373:   if(pushable && InpAlertPush && !SendNotification(msg))   [matched: SendNotification(]
SRJ_FlowNexus_EA.mq5 1116:      EmitAlert("STAND-DOWN", "reason=" + reason, false);   [matched: Alert(]  [INCIDENTAL — EmitAlert]
SRJ_FlowNexus_EA.mq5 2754:            EmitAlert("HEADS-UP",   [matched: Alert(]  [INCIDENTAL — EmitAlert]
SRJ_FlowNexus_EA.mq5 2951:         EmitAlert("SIGNAL",   [matched: Alert(]  [INCIDENTAL — EmitAlert]
SRJ_Alerts.mqh 7:void SRJ_DispatchAlert(int &lastBarGuard,int i,const string msg)   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
SRJ_Alerts.mqh 13:   Alert(msg);   [matched: Alert(]
SRJ_Alerts.mqh 15:      SendNotification(msg);   [matched: SendNotification(]
SRJ_Alerts.mqh 17:      SendMail("SRJ Flow Logic", msg);   [matched: SendMail(]
SRJ_Alerts.mqh 25:         SRJ_DispatchAlert(g_alertBar_bullFlip, i,   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
SRJ_Alerts.mqh 28:         SRJ_DispatchAlert(g_alertBar_bearFlip, i,   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
SRJ_Alerts.mqh 35:         SRJ_DispatchAlert(g_alertBar_bullRenewal, i,   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
SRJ_Alerts.mqh 38:         SRJ_DispatchAlert(g_alertBar_bearRenewal, i,   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
SRJ_Alerts.mqh 47:   SRJ_DispatchAlert(g_alertBar_extPromote, i, "SRJ Flow Logic: Extreme OB Promoted (" + dirMsg + ")");   [matched: Alert(]  [INCIDENTAL — SRJ_DispatchAlert]
```
(PlaySound( and SendFTP( are ABSENT in all 16 files — a count of 0 is a result.)

Enclosing function per distinct line (definition-header rule; brace-counted range; line count; BRACE RULE USED):
- EA 362: NO ENCLOSING FUNCTION - FILE SCOPE (the line is itself the definition header of EmitAlert; that definition's brace range is 363-376, 14 lines).
- EA 371: EmitAlert — brace range 363-376, 14 lines.
- EA 373: EmitAlert — brace range 363-376, 14 lines.
- EA 1116: GoAbort — definition header at EA 1109 (closes 1109), brace range 1110-1136, 27 lines.
- EA 2754: EvaluateClosedBar — definition header at EA 1363 (closes 1363), brace range 1364-3056, 1693 lines.
- EA 2951: EvaluateClosedBar — brace range 1364-3056, 1693 lines.
- Alerts 7: NO ENCLOSING FUNCTION - FILE SCOPE (the line is itself the definition header of SRJ_DispatchAlert; brace range 8-18, 11 lines).
- Alerts 13: SRJ_DispatchAlert — brace range 8-18, 11 lines.
- Alerts 15: SRJ_DispatchAlert — brace range 8-18, 11 lines.
- Alerts 17: SRJ_DispatchAlert — brace range 8-18, 11 lines.
- Alerts 25: SRJ_Alerts_DispatchBiasRenewal — brace range 21-41, 21 lines.
- Alerts 28: SRJ_Alerts_DispatchBiasRenewal — brace range 21-41, 21 lines.
- Alerts 35: SRJ_Alerts_DispatchBiasRenewal — brace range 21-41, 21 lines.
- Alerts 38: SRJ_Alerts_DispatchBiasRenewal — brace range 21-41, 21 lines.
- Alerts 47: SRJ_FireExtremePromote — definition header at Alerts 43 (closes 43), brace range 44-48, 5 lines.

## C6 — SRJ_ call sites inside OnCalculate (SRJ_FlowLogic.mq5 only)

Enclosing function of the SRJ_Alerts_DispatchBiasRenewal call site (line 880): OnCalculate — definition-header rule candidate at line 705 (column 0, `int OnCalculate(const int rates_total,`), parameter list closes on line 714 (`const int &spread[])`), no ";" -> DEFINITION. Brace counting: opening brace 715, closing brace 1179. Range 715-1179, integer line count 465. BRACE RULE USED. Paste searched: the OnCalculate region 715-1179 (read in full, line-numbered, via R1 spans 705-749, 749-828, 829-908, 908-997, 998-1086, 1087-1180).

Every call site of any name matching `SRJ_` (substring rule) within 715-1179, ascending line order, with called name and exact argument list text under the multi-line call rule. Comment mentions (969, 985, 986, 1039) and string literals are NOT call sites and are excluded. Argument lists that close on the call's own line are quoted as-is; continued lists are marked.

```
743:   SRJ_ComputeLookback(rates_total);                                   name SRJ_ComputeLookback, args `rates_total`
799:      SRJ_DeleteAllObjects();                                          name SRJ_DeleteAllObjects, args (empty)
800:      SRJ_StateInit();                                                 name SRJ_StateInit, args (empty)
801:      SRJ_BindInputs();                                                name SRJ_BindInputs, args (empty)
802:      SRJ_HTF_Init();                                                  name SRJ_HTF_Init, args (empty)
849:      SRJ_OB_CreationPass(open,high,low,close,time,rates_total,i,      name SRJ_OB_CreationPass — ARGUMENT LIST CONTINUES ON NEXT LINE
850:                          withinLookbackWindow,barClosed);             JOINED: `open,high,low,close,time,rates_total,i,withinLookbackWindow,barClosed`
852:      SRJ_Sessions_Pass(high,low,time,rates_total,i,                   name SRJ_Sessions_Pass — ARGUMENT LIST CONTINUES ON NEXT LINE
853:                        withinLookbackWindow);                         JOINED: `high,low,time,rates_total,i,withinLookbackWindow`
855:      SRJ_Bias_PerBarResetPass(barClosed);                             name SRJ_Bias_PerBarResetPass, args `barClosed`
857:      SRJ_OB_ActivationInvalidationPass(open,high,low,close,time,rates_total,i,   name SRJ_OB_ActivationInvalidationPass — CONTINUES ON NEXT LINE
858:                                        withinLookbackWindow,barClosed);          JOINED: `open,high,low,close,time,rates_total,i,withinLookbackWindow,barClosed`
860:      SRJ_OB_CounterAggregationPass(i,barClosed);                      name SRJ_OB_CounterAggregationPass, args `i,barClosed`
862:      SRJ_OB_InactiveLinePrunePass(withinLookbackWindow);              name SRJ_OB_InactiveLinePrunePass, args `withinLookbackWindow`
864:      SRJ_OB_OpposingCachePass(i,finalLookback,withinLookbackWindow);  name SRJ_OB_OpposingCachePass, args `i,finalLookback,withinLookbackWindow`
866:      SRJ_Bias_WeakFlipLatchPass();                                    name SRJ_Bias_WeakFlipLatchPass, args (empty)
868:      SRJ_FVG_CreationRenewalPass(high,low,time,rates_total,i,         name SRJ_FVG_CreationRenewalPass — CONTINUES ON NEXT LINE
869:                                  withinLookbackWindow,barClosed);     JOINED: `high,low,time,rates_total,i,withinLookbackWindow,barClosed`
871:      SRJ_FVG_FillDetectionPass(open,close,i,withinLookbackWindow,barClosed);   name SRJ_FVG_FillDetectionPass, args `open,close,i,withinLookbackWindow,barClosed`
873:      SRJ_FVG_TickValidRecomputePass(withinLookbackWindow);            name SRJ_FVG_TickValidRecomputePass, args `withinLookbackWindow`
875:      SRJ_Bias_StructureDetectionPass(high,low,i,finalLookback,        name SRJ_Bias_StructureDetectionPass — CONTINUES ON NEXT LINE
876:                                      withinLookbackWindow,barClosed); JOINED: `high,low,i,finalLookback,withinLookbackWindow,barClosed`
878:      SRJ_Bias_DecisionBlock(i,withinLookbackWindow,barClosed);        name SRJ_Bias_DecisionBlock, args `i,withinLookbackWindow,barClosed`
880:      SRJ_Alerts_DispatchBiasRenewal(i);                               name SRJ_Alerts_DispatchBiasRenewal, args `i`
881:      SRJ_OB_DeferredPromotionPass(i,barClosed);                       name SRJ_OB_DeferredPromotionPass, args `i,barClosed`
882:      SRJ_Draw_BiasAndRenewalLines(high,low,time,rates_total,i);       name SRJ_Draw_BiasAndRenewalLines, args `high,low,time,rates_total,i`
883:      SRJ_FVG_DrawRefreshPass(time,rates_total,i,withinLookbackWindow);   name SRJ_FVG_DrawRefreshPass, args `time,rates_total,i,withinLookbackWindow`
884:      SRJ_EmitFractals(high,low,close,i,last_bar_index,finalLookback,inShowFractals);   name SRJ_EmitFractals, args `high,low,close,i,last_bar_index,finalLookback,inShowFractals`
885:      SRJ_Panels_BiasPane(open,high,low,close,time,rates_total,i,      name SRJ_Panels_BiasPane — CONTINUES ON NEXT LINE
886:                          inShowBiasPane,inBiasPaneOffsetBars);        JOINED: `open,high,low,close,time,rates_total,i,inShowBiasPane,inBiasPaneOffsetBars`
888:      SRJ_OB_PruningPass(withinLookbackWindow);                        name SRJ_OB_PruningPass, args `withinLookbackWindow`
889:      SRJ_FVG_PruningPass(withinLookbackWindow);                       name SRJ_FVG_PruningPass, args `withinLookbackWindow`
892:         SRJ_PruneBiasChangeLines(inKeepBiasChangeLinesCount);         name SRJ_PruneBiasChangeLines, args `inKeepBiasChangeLinesCount`
893:         SRJ_PruneStructureRenewalLines(inKeepStructureRenewalLinesCount);   name SRJ_PruneStructureRenewalLines, args `inKeepStructureRenewalLinesCount`

910:            if(SRJ_isStrictFractalHigh(high, i, 1))                     name SRJ_isStrictFractalHigh, args `high, i, 1`
912:            if(SRJ_isStrictFractalLow(low, i, 1))                       name SRJ_isStrictFractalLow, args `low, i, 1`
958:            int xobIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);   name SRJ_NearestPromotedOBIndex, args `g_s.currentBias`
974:                     datetime t113_pt = SRJ_BarTime(t113_pb);           name SRJ_BarTime, args `t113_pb`
1047:            int slObIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);  name SRJ_NearestPromotedOBIndex, args `g_s.currentBias`
1060:            if(g_htfDebugLog && SRJ_InDebugWindow(i))                   name SRJ_InDebugWindow, args `i`
1061:               Print("SRJ SLREF t=", SRJ_BarTimeStr(target),            name SRJ_BarTimeStr, args `target`
1075:            datetime rbT = SRJ_BarTime(g_s.obInvalidationBoundary);    name SRJ_BarTime, args `g_s.obInvalidationBoundary`
1079:         if(g_htfDebugLog && SRJ_InDebugWindow(i))                     name SRJ_InDebugWindow, args `i`
1080:            Print("SRJ RENEWBOUND t=", SRJ_BarTimeStr(target),         name SRJ_BarTimeStr, args `target`
1103:         int liveSid = SRJ_GetSessionId(time[i]);                      name SRJ_GetSessionId, args `time[i]`
1119:            datetime slbT = SRJ_BarTime(g_s.structLegBoundary);        name SRJ_BarTime, args `g_s.structLegBoundary`
1123:         if(g_htfDebugLog && SRJ_InDebugWindow(i))                     name SRJ_InDebugWindow, args `i`
1124:            Print("SRJ STRUCTLEG t=", SRJ_BarTimeStr(target),          name SRJ_BarTimeStr, args `target`
1130:         if(g_htfDebugLog && SRJ_InDebugWindow(i))                     name SRJ_InDebugWindow, args `i`
1131:            Print("SRJ SWEPTMASK t=", SRJ_BarTimeStr(target),          name SRJ_BarTimeStr, args `target`
1135:         if(g_htfDebugLog && SRJ_InDebugWindow(i))                     name SRJ_InDebugWindow, args `i`
1137:            Print("SRJ EXPORT t=", SRJ_BarTimeStr(target),             name SRJ_BarTimeStr, args `target`
1148:      if(SRJ_InDebugWindow(i))                                         name SRJ_InDebugWindow, args `i`
1149:         Print("SRJ BIASEND t=", SRJ_BarTimeStr(i),                    name SRJ_BarTimeStr, args `i`
1154:   SRJ_HTF_RunAll(inHtfLookbackBars,inHtfMaxTrackedObjects,            name SRJ_HTF_RunAll — ARGUMENT LIST CONTINUES ON NEXT LINE
1155:                  inUseConfirmedHTFOnly,time[last_bar_index]);         JOINED: `inHtfLookbackBars,inHtfMaxTrackedObjects,inUseConfirmedHTFOnly,time[last_bar_index]`
1157:   SRJ_Panels_DataWarning(inShowDataWarnings, rates_total - 1, rates_total);   name SRJ_Panels_DataWarning, args `inShowDataWarnings, rates_total - 1, rates_total`
1162:   SRJ_HTF_GetOutputs(g_htfHi, inUseConfirmedHTFOnly, h1_b, h1_2, h1_3, h1_o);   name SRJ_HTF_GetOutputs, args `g_htfHi, inUseConfirmedHTFOnly, h1_b, h1_2, h1_3, h1_o`
1163:   SRJ_HTF_GetOutputs(g_htfMid, inUseConfirmedHTFOnly, h2_b, h2_2, h2_3, h2_o);  name SRJ_HTF_GetOutputs, args `g_htfMid, inUseConfirmedHTFOnly, h2_b, h2_2, h2_3, h2_o`
1164:   SRJ_HTF_GetOutputs(g_htfLo, inUseConfirmedHTFOnly, h3_b, h3_2, h3_3, h3_o);   name SRJ_HTF_GetOutputs, args `g_htfLo, inUseConfirmedHTFOnly, h3_b, h3_2, h3_3, h3_o`
1166:   SRJ_Panels_MTFBox(inAutoDetectERLSweep, g_erlSweepFromStr, g_erlTargetToStr,  name SRJ_Panels_MTFBox — ARGUMENT LIST CONTINUES ON NEXT LINES
1167:                     g_htfHighTargetStr, g_htfMidTargetStr, g_htfLowTargetStr,
1168:                     g_alertNumber, g_erlAlertNumber,
1169:                     inShowLiquiditySweepDebugLabel, inShowLiquidityLevelsDebug,
1170:                     rates_total - 1, rates_total,
1171:                     h1_b, h1_2, h1_3, h1_o,
1172:                     h2_b, h2_2, h2_3, h2_o,
1173:                     h3_b, h3_2, h3_3, h3_o);                           closing ")" on line 1173
JOINED: `inAutoDetectERLSweep, g_erlSweepFromStr, g_erlTargetToStr, g_htfHighTargetStr, g_htfMidTargetStr, g_htfLowTargetStr, g_alertNumber, g_erlAlertNumber, inShowLiquiditySweepDebugLabel, inShowLiquidityLevelsDebug, rates_total - 1, rates_total, h1_b, h1_2, h1_3, h1_o, h2_b, h2_2, h2_3, h2_o, h3_b, h3_2, h3_3, h3_o`
```

Called names ABSENT from every list in this task (a result, reported per the item): SRJ_ComputeLookback, SRJ_DeleteAllObjects, SRJ_BindInputs, SRJ_HTF_Init, SRJ_OB_CreationPass, SRJ_Sessions_Pass, SRJ_OB_CounterAggregationPass, SRJ_FVG_FillDetectionPass, SRJ_Bias_StructureDetectionPass, SRJ_OB_DeferredPromotionPass, SRJ_Draw_BiasAndRenewalLines, SRJ_FVG_DrawRefreshPass, SRJ_EmitFractals, SRJ_Panels_BiasPane, SRJ_OB_PruningPass, SRJ_FVG_PruningPass, SRJ_PruneBiasChangeLines, SRJ_PruneStructureRenewalLines, SRJ_isStrictFractalHigh, SRJ_isStrictFractalLow, SRJ_NearestPromotedOBIndex, SRJ_BarTime, SRJ_BarTimeStr, SRJ_InDebugWindow, SRJ_GetSessionId, SRJ_HTF_RunAll, SRJ_Panels_DataWarning, SRJ_HTF_GetOutputs, SRJ_Panels_MTFBox.
Called names present in task lists: SRJ_StateInit (A1), SRJ_Bias_PerBarResetPass (A1), SRJ_OB_ActivationInvalidationPass (A1), SRJ_OB_InactiveLinePrunePass (C1), SRJ_OB_OpposingCachePass (C1), SRJ_Bias_WeakFlipLatchPass (C1), SRJ_FVG_CreationRenewalPass (A1), SRJ_FVG_TickValidRecomputePass (B5), SRJ_Bias_DecisionBlock (A1), SRJ_Alerts_DispatchBiasRenewal (C1).

# ============================================================
# PART 3 — BLOCK D (`ZoneAdoptable`) + FINAL HASH ITEM
# ============================================================

## D1 — ZoneAdoptable located, classified, brace-bounded

Census (R2) across all 16 files: single column-0 candidate at SRJ_FlowNexus_EA.mq5 line 1211 (`bool ZoneAdoptable(int barShift, double zHi, double zLo)`), parameter list closes on 1211, no ";" -> DEFINITION. Fallback NOT reached. Brace counting: opening brace 1212, closing brace 1261 (depth 0 at 1261). File: Experts\SRJ_FlowNexus_EA.mq5. Header line 1211; opening brace line 1212; closing brace line 1261; region 1212-1261; integer line count 50. Brace counting confirmed (BRACE RULE USED).

## D2 — ZoneAdoptable paste (50 lines <= 90 -> WHOLE; range 1212-1261)

```
1211:bool ZoneAdoptable(int barShift, double zHi, double zLo)
1212:  {
1213:   if(!(zHi > 0.0 && zLo > 0.0)) return false;
1214:
1215:   if(MathAbs(zHi - g_zoneHi) <= _Point * 0.5 &&
1216:      MathAbs(zLo - g_zoneLo) <= _Point * 0.5)
1217:      return true;
1218:
1219:   bool   ok  = false;
1220:   string via = "none";
1221:   double bHi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
1222:   double bLo = iLow (_Symbol, PERIOD_CURRENT, barShift);
1223:
1224:   if(bHi >= zLo && bLo <= zHi) { ok = true; via = "BAR"; }
1225:
1226:   int    buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
1227:   double sw1 = 0.0, sw2 = 0.0;
1228:   int    sh1 = -1,  sh2 = -1;
1229:
1230:   if(FindNearestSwing(buf, barShift, sw1, sh1))
1231:     {
1232:      if(sw1 >= zLo && sw1 <= zHi)
1233:        { ok = true; if(via == "none") via = "SWING1"; }
1234:
1235:      for(int s = sh1 + 1; s <= sh1 + 500; s++)
1236:        {
1237:         double v2;
1238:         if(!ReadFlow(buf, v2, s))          break;
1239:         if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
1240:         if(MathAbs(v2 - sw1) <= _Point)    continue;
1241:         sw2 = v2; sh2 = s;
1242:         break;
1243:        }
1244:
1245:      if(sw2 > 0.0 && sw2 >= zLo && sw2 <= zHi)
1246:        { ok = true; if(via == "none") via = "SWING2"; }
1247:     }
1248:
1249:   if(InpDebugLog)
1250:      PrintFormat("[SRJ-EA] ZONEADOPT bar=%s dir=%s adopt=%d via=%s newLo=%s newHi=%s "
1251:                  "barLo=%s barHi=%s sw1=%s@%d sw2=%s@%d",
1252:                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
1253:                  DirName(g_dir), (int)ok, via,
1254:                  DoubleToString(zLo, _Digits),
1255:                  DoubleToString(zHi, _Digits),
1256:                  DoubleToString(bLo, _Digits),
1257:                  DoubleToString(bHi, _Digits),
1258:                  (sw1 > 0.0 ? DoubleToString(sw1, _Digits) : "-"), sh1,
1259:                  (sw2 > 0.0 ? DoubleToString(sw2, _Digits) : "-"), sh2);
1260:   return ok;
1261:  }
```
(Line 1211 pasted with the region for context; the region proper is 1212-1261.)

## D3 — statements from the D2 paste only (paste searched: D2, lines 1212-1261)

every parameter:
| position | parameter text | BY REFERENCE or BY VALUE |
|---|---|---|
| 1 | int barShift | BY VALUE |
| 2 | double zHi | BY VALUE |
| 3 | double zLo | BY VALUE |

every return statement:
```
1213:   if(!(zHi > 0.0 && zLo > 0.0)) return false;    CARRIES-AN-EXPRESSION — exact returned expression `false`
1217:      return true;                                 CARRIES-AN-EXPRESSION — exact returned expression `true`
1260:   return ok;                                      CARRIES-AN-EXPRESSION — exact returned expression `ok`
```
Statement count 3; raw substring-hit count for "return" = 3.

every "for"/"while"/"switch"/"do" header (whole-token rule):
- 1235: `for(int s = sh1 + 1; s <= sh1 + 500; s++)` — RESULT (whole-token count) = 1; DIAGNOSTIC (raw substring count of "for") = 1. while/switch/do ABSENT.

every line containing "g_zoneHi":
```
1215:   if(MathAbs(zHi - g_zoneHi) <= _Point * 0.5 &&
```
every line containing "g_zoneLo":
```
1216:      MathAbs(zLo - g_zoneLo) <= _Point * 0.5)
```
every line containing "g_touchSeen": ABSENT (no occurrence in 1212-1261).
every line containing "objId": ABSENT.
every line containing "Print":
```
1250:      PrintFormat("[SRJ-EA] ZONEADOPT bar=%s dir=%s adopt=%d via=%s newLo=%s newHi=%s "
```
(Pattern `Print` matches inside `PrintFormat` — reported as matched; the containing identifier is PrintFormat.)

every assignment-target line (exact RHS; Amendment 11 applied; Amendment 15 respected — no `}`-led line listed):
```
1219:   bool   ok  = false; | target ok | RHS `false`
1220:   string via = "none"; | target via | RHS `"none"`
1221:   double bHi = iHigh(_Symbol, PERIOD_CURRENT, barShift); | target bHi | RHS `iHigh(_Symbol, PERIOD_CURRENT, barShift)`
1222:   double bLo = iLow (_Symbol, PERIOD_CURRENT, barShift); | target bLo | RHS `iLow (_Symbol, PERIOD_CURRENT, barShift)`
1224:   if(bHi >= zLo && bLo <= zHi) { ok = true; via = "BAR"; } | targets ok (RHS `true`) AND via (RHS `"BAR"`)
1226:   int    buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH; | target buf | RHS `(g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH`
1227:   double sw1 = 0.0, sw2 = 0.0; | targets sw1 (RHS `0.0`) AND sw2 (RHS `0.0`)
1228:   int    sh1 = -1,  sh2 = -1; | targets sh1 (RHS `-1`) AND sh2 (RHS `-1`)
1233:        { ok = true; if(via == "none") via = "SWING1"; } | targets ok (RHS `true`) AND via (RHS `"SWING1"`; the `via == "none"` occurrence is a comparison, not a target)
1241:         sw2 = v2; sh2 = s; | targets sw2 (RHS `v2`) AND sh2 (RHS `s`)
1246:        { ok = true; if(via == "none") via = "SWING2"; } | targets ok (RHS `true`) AND via (RHS `"SWING2"`)
```
(Line 1237 `double v2;` is a declaration without "=" — not an assignment line.)

every "if" line, with its FULL open-brace stack (each entry opening -> brace-counted closing; header by upward scan):
```
1213:   if(!(zHi > 0.0 && zLo > 0.0)) return false;
      stack: 1212 -> 1261 (header 1211, definition header)
1215:   if(MathAbs(zHi - g_zoneHi) <= _Point * 0.5 &&      [condition continues on 1216; body 1217]
      stack: 1212 -> 1261
1224:   if(bHi >= zLo && bLo <= zHi) { ok = true; via = "BAR"; }
      stack: 1212 -> 1261 (the braces on 1224 open and close on the line itself)
1230:   if(FindNearestSwing(buf, barShift, sw1, sh1))
      stack: 1212 -> 1261 (body brace 1231 -> 1247)
1232:      if(sw1 >= zLo && sw1 <= zHi)
      stack: 1212 -> 1261; 1231 -> 1247
1233:        { ok = true; if(via == "none") via = "SWING1"; }
      stack: 1212 -> 1261; 1231 -> 1247 (the braces on 1233 open and close on the line itself)
1238:         if(!ReadFlow(buf, v2, s))          break;
      stack: 1212 -> 1261; 1231 -> 1247; 1236 -> 1243
1239:         if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
      stack: 1212 -> 1261; 1231 -> 1247; 1236 -> 1243
1240:         if(MathAbs(v2 - sw1) <= _Point)    continue;
      stack: 1212 -> 1261; 1231 -> 1247; 1236 -> 1243
1245:      if(sw2 > 0.0 && sw2 >= zLo && sw2 <= zHi)
      stack: 1212 -> 1261; 1231 -> 1247
1249:   if(InpDebugLog)
      stack: 1212 -> 1261
```

## D4 — 16-file census for ZoneAdoptable (substring rule)

Shell census (R2, all 16 explicit paths). Per-file N_OCC / N_LINES:

| File | N_OCC | N_LINES | Result |
|---|---|---|---|
| SRJ_FlowNexus_EA.mq5 | 5 | 5 | lines 1211, 1336, 1641, 2638, 2786 |
| SRJ_FlowLogic.mq5 | 0 | 0 | ABSENT |
| SRJ_Alerts.mqh | 0 | 0 | ABSENT |
| SRJ_BiasEngine.mqh | 0 | 0 | ABSENT |
| SRJ_Draw.mqh | 0 | 0 | ABSENT |
| SRJ_Fractals.mqh | 0 | 0 | ABSENT |
| SRJ_HTFEngine.mqh | 0 | 0 | ABSENT |
| SRJ_ImbalanceMgr.mqh | 0 | 0 | ABSENT |
| SRJ_OrderblockMgr.mqh | 0 | 0 | ABSENT |
| SRJ_Panels.mqh | 0 | 0 | ABSENT |
| SRJ_SeedFormat.mqh | 0 | 0 | ABSENT |
| SRJ_Sessions.mqh | 0 | 0 | ABSENT |
| SRJ_State.mqh | 0 | 0 | ABSENT |
| SRJ_Text.mqh | 0 | 0 | ABSENT |
| SRJ_TickCore.mqh | 0 | 0 | ABSENT |
| SRJ_Types.mqh | 0 | 0 | ABSENT |

Distinct lines pasted once (with INCIDENTAL marking where the substring rule requires — none of the EA lines embeds the name in a longer identifier, so none is INCIDENTAL):
```
SRJ_FlowNexus_EA.mq5 1211:bool ZoneAdoptable(int barShift, double zHi, double zLo)   [DEFINITION HEADER]
SRJ_FlowNexus_EA.mq5 1336://--- The S3 block's inline copy and ZoneAdoptable's copy are NOT removed. That   [OTHER — comment line]
SRJ_FlowNexus_EA.mq5 1641:      // same price, and no existing guard can see it: ZoneAdoptable compares   [OTHER — comment line]
SRJ_FlowNexus_EA.mq5 2638:      //--- ZoneInPlay and ZoneAdoptable are deliberately NOT changed here: the   [OTHER — comment line]
SRJ_FlowNexus_EA.mq5 2786:      if(ReadQualifyingZone(barShift, s35_zHi, s35_zLo, s35_fromFvg) && ZoneAdoptable(barShift, s35_zHi, s35_zLo) && ((g_dir == DIR_LONG) ? (s35_zLo <= g_zoneLo + _Point * 0.5) : (s35_zHi >= g_zoneHi - _Point * 0.5)))   [CALL SITE]
```

CALL SITE detail (SRJ_FlowNexus_EA.mq5:2786):
- Exact argument list text under the multi-line call rule: the matching ")" following the call's "(" is on the SAME line -> argument list text `barShift, s35_zHi, s35_zLo`. Not continued.
- Enclosing function: EvaluateClosedBar — definition-header rule candidate at EA line 1363 (column 0, `void EvaluateClosedBar(int barShift, datetime barTime)`), parameter list closes on 1363, no ";" -> DEFINITION. Brace-counted range 1364-3056 (verified by counting every line 1364-3056; depth reaches 0 at 3056; the next column-0 header is OnInit at 3059). Integer line count 1693. BRACE RULE USED.
- FULL open-brace stack at 2786, each entry with OPENING line and BRACE-COUNTED CLOSING line, headers resolved by upward scan:
  - 1364 -> 3056 (header 1363, definition header)
  - 2771 -> 2881 (header 2770, `if(g_state == ST_S4_ARMED)`)
  (The call sits in the if-condition on 2786 itself; the braces of that if open on 2787, after the statement line, so they are not in the statement's stack.)

## D5 — ZoneInPlay

Census (R2) across all 16 files: single column-0 candidate at SRJ_FlowNexus_EA.mq5 line 1338 (`bool ZoneInPlay(int barShift, double zHi, double zLo)`), parameter list closes on 1338, no ";" -> DEFINITION. Fallback NOT reached. Bounded by brace counting: opening brace 1339, closing brace 1361 (depth 0 at 1361). Range 1339-1361, integer line count 23. Brace counting confirmed (BRACE RULE USED). NOT PASTED (item forbids). Other occurrences (not candidates): EA 1616 (comment), 2365 (call site `s55_fvgInPlay = ZoneInPlay(barShift, MathMax(fvgHi, fvgLo), MathMin(fvgHi, fvgLo));`), 2367 (call site `s55_xobInPlay = ZoneInPlay(barShift, MathMax(xobHi, xobLo), MathMin(xobHi, xobLo));`), 2638 (comment); SRJ_FlowLogic.mq5 1009 (comment). No DECLARATION candidates.

## REPORT-FORMAT CONFIRMATIONS

- Definition-header classifications: delivered above — every candidate (one per name, 13 names), its parameter-list closing line, DEFINITION (13/13), fallback never reached.
- Paste-sizing rule: delivered per region above (WHOLE / NOT PASTED as listed; no region pasted of unmeasured size — every paste is preceded by its range and integer line count).
- Brace rule used: brace counting — confirmed for A1, A4(c), A4(d), B1, B3, B5, C1, C4 (no instances), C5, C6, D1, D4, D5.
- Enclosing-construct rule used: FULL open-brace stacks computed (A4(c) all ten statements; B3; B5; D3; D4), headers resolved by upward scan, never by proximity; every brace entry reported with opening AND brace-counted closing line.
- Attribution rule used: (a) pointer parameters enumerated from every definition header (only SRJ_OB_ReplayActivationInvalidation has one: `COrderblock *ob`); (e1) D < S tested; (e2) opening AND brace-counted closing line tested; (e3) stack membership tested; failing part named per rejected candidate. `NO OBJECT IN SCOPE AT THIS STATEMENT` reported where nothing qualified (Regions 4, 5, 7; B3).
- Multi-line call rule used: every argument list closed by matching paren across line boundaries (B5, C6, D4); continued lists pasted and JOINED; nothing reported as UNTERMINATED.
- Census-pattern provenance: every pattern matched as supplied (case-sensitive, full identifiers); INCIDENTAL-ONLY occurrences marked with containing identifiers (EmitAlert, SRJ_DispatchAlert, alert-flag members, PrintFormat, obStart/obVal/obInv/obCreation/obStartT string tokens). No pattern substituted or re-run.
- Legal answers used where correct: ABSENT (per-file/per-pattern census zeros, D3 g_touchSeen/objId, A3 absences), NO OBJECT IN SCOPE AT THIS STATEMENT (A4, B3), NO ENCLOSING FUNCTION - FILE SCOPE (C5), NONE WITH D < S (B3). No inferred value substituted anywhere; no count compared to any figure from any earlier task.

## FINAL ITEM — MANDATORY (raw certutil output and comparison)

`certutil -hashfile "DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256` — raw output:
```
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5:
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
CertUtil: -hashfile command completed successfully.
```
- Supplied stasis (task header): `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
- Observed: `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
- Result: **MATCH**

`certutil -hashfile "DF\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256` — raw output:
```
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5:
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
CertUtil: -hashfile command completed successfully.
```
- Supplied stasis (task header): `d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5`
- Observed: `d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5`
- Result: **MATCH**

Both hashes match the supplied values. Both .mq5 files are byte-identical to the state the task was issued against.

END OF REPORT — TASK 160-PreJ. All Blocks A-D delivered across Parts 1-3; final hash item delivered in this part.























