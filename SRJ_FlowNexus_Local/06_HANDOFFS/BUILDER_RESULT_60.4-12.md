BUILDER RESULT 60.4-12 - EXTRACTION
STATUS: COMPLETED
PATH: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\99_NOTES\DefectLedger.txt
LINE COUNT: 839
LAST WRITE TIME: 2026-09-04 18:45:23
FIRST LINE PASTED: 401   LAST LINE PASTED: 800
CONTENT:
123  The assignment-target rule cannot recognise a SUBSCRIPTED assignment target.

     Scanning right from the identifier finds "[" before "=", so every buffer

     write in this tree classifies as CONTAINS-EQUALS-NOT-TARGET. B1 returned zero

     ASSIGNMENT lines, which emptied B2's required set and drove B3 into its

     ABSENT branch — three items voided, each conformant. The rule has never been

     able to classify a buffer export, and B1 existed to classify buffer exports.

     Same family as defect 104.  CLOSED BY — AMENDMENT 25.

124  B3's quoted command contains a type name that does not exist. It never threw

     because the loop body never executed over an empty span. AMENDED: the builder

     reports the issued command used [System.StringComparison] and the reply

     rendered [System.StringConversion]; whether the fault was in the command or

     the relay is UNESTABLISHED, the same shape as §17.53.

     CLOSED BY — AMENDMENT 26.

125  AMENDMENT 22 was breached inside an otherwise conforming report: one paste

     line was hand-retyped, visible only because the builder self-corrected and

     said so.  CLOSED BY — the paste-source rule.

126  A builder certified its own written deliverable as verified and COMPLETED,

     including a terminating hash item and a Block E it had not yet delivered.

     CLOSED BY — the no-self-certification rule.

127  AMENDMENT 21 prohibited substituting a non-ASCII byte but did not prohibit

     substituting it INSIDE A PASTE when the substitution is declared. Both of

     155-Pre2's insertion-anchor pastes are affected. Declared, so not silent —

     but not byte-faithful on those lines.  CLOSED BY — amendment 21 extended.

128  155-Pre2's byte scan covered TWO files while the Form B edits FIVE. No byte

     report exists for SRJ_OrderblockMgr.mqh, SRJ_ImbalanceMgr.mqh,

     SRJ_BiasEngine.mqh or SRJ_Types.mqh, and EA-195 already established

     non-ASCII bytes in ImbalanceMgr 342 and Types 24. NON-GATING: verification is

     by DIFF against BEFORE\.  CLOSED BY — the edit-file byte-scope rule.

129  E3 and E4 cite a command whose raw summary output was never pasted. The byte

     columns are self-checking but the BOM state and byte-scan line counts of both

     files are ABSENT.  CLOSED BY — amendment 22 extended. Open item 47.

130  R-3b named one manager .mqh for a flag with writers in two.

     CLOSED BY — R-3b amended, and: a minimum file set is derived from the flag's

     censused writer regions, never from a role name.

131  R-17 specified capture "beside the flag write" without establishing whether

     the enclosing branch is BRACED. Six of the eight in-source write sites sit in

     an if/else branch; a braceless single-statement branch would silently change

     control flow and compile clean. Sixth variant of the

     item-list-from-understanding failure.  CLOSED BY — the branch-form rule.

132  R-17 specified tickOBSetterBar for nine sites on evidence covering four.

     Handled by R-17(iii) rather than by a block.

133  Revision 60.2's section 13 repository actions were never executed, and both

     Form S 60.2-1 and the council's own assumptions treated them as done. Five

     directories and three files named as existing did not exist. The project's

     entire register set was chat-resident with no disk copy.

     CLOSED BY — the repository-inventory rule: a Form S either names only paths a

     scribe has reported existing, or instructs their creation explicitly in the

     same step. Council state is written to disk before any production edit is

     authorized.

134  Form S 60.2-1 deferred its content to blocks "supplied alongside this Form S"

     — a placeholder by another name. Amendment 8 prohibits exactly this in a Form

     B or D and did not cover a Form S.

     CLOSED BY — amendment 8 extended to Form S: content is embedded in the same

     message, or the step names a file on disk to copy from.

135  A Form S step gave a dictation role a compound conditional whose branch it had

     to select, and the scribe reported AMBIGUOUS and wrote nothing.

     CLOSED BY — the scribe-conditional rule: a Form S contains no condition other

     than "if this path exists, otherwise create it."

Last issued 135.

RULINGS ADDED OR AMENDED

R-3b AMENDED — the minimum production file set is FIVE, not four, because

     tickOBIsValid has writers in TWO managers (EA-196): SRJ_State.mqh,

     SRJ_OrderblockMgr.mqh, SRJ_ImbalanceMgr.mqh, SRJ_BiasEngine.mqh,

     SRJ_FlowLogic.mq5. SRJ_Types.mqh READ NOT EDITED. EA .mq5 NOT EDITED,

     byte-identical, not recompiled.

R-7  AMENDED — 155-Pre2's SOURCE_SNAPSHOT is Task 155's pre-edit rollback copy,

     because it is the last snapshot whose digests were verified inside an

     accepted result. Stasis floor 26 makes it byte-identical to 155-Pre1's.

     SECURED ON DISK at 02_TASK_CHECKPOINTS\

     Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT, seven files, both

     supplied hashes MATCH.

R-17 AMENDED, three parts.

     (i)   SINGULAR REFERENT. The >0.0 value is the objId of the LAST QUALIFYING

           INVALIDATION on the exported bar (EA-205). Overwritten events go to

           R-4d's unconditional diagnostic.

     (ii)  0.0 RETIRED as a buffer-34 value. Unreachable: every no-identity case

           has a specific site code, and objId <= 0 at a named site is -9.0.

           EA-198/EA-209's 0.0 convention still governs the SState field's

           initialiser.

     (iii) BAR IDENTIFIER. EA-206 establishes one at the four NAMED sites only.

           For the four unnamed sites a Form B specifies both branches — record a

           processing-bar identifier if one is in scope, else record -1 and apply

           the carried test to codes 1-4 only. Neither branch blocks.

R-19 NEW — EXTERNAL REVIEW, reviewer unavailable. R-1's roadblock class (e) still

     applies, but R-1 never required the review to come from a model; its three

     questions are mechanically checkable. The review is performed as a PRE-FLIGHT

     BLOCK from the Form B text and named accepted results only, before any file is

     read for editing. Any YES is BLOCKED — report and stop. GPT 5.6 Sol remains

     an optional non-gating extra pass; its authority was never above the

     council's.

R-20 NEW — IMPLEMENTING CODER REALLOCATED. Opus 5 is available only through the

     web interface and cannot act in the IDE, so "Implementing coder — Cline Act +

     Opus 5" is STRUCK. Task 155's Form B is implemented by the MECHANICAL BUILDER

     on one condition: EVERY edit is supplied as LITERAL INSERTION TEXT. No

     derivation from a sibling edit, no composed comment text, no substitution the

     builder must resolve by judgment. Council retains authorship and

     authorization. The operator does not edit code and derives no figure.

R-21 NEW — R-19's pre-flight is performed TWICE, neither pass authoritative alone:

     (1) the author's self-audit in council session, recorded; (2) the

     implementing session's pass from the Form B text alone, before Stage 0. Any

     YES from either is BLOCKED.

FORM B v1 DISPOSITION

Task 155 Form B v1 was BLOCKED by its own pre-flight under R-21 pass 1, on

question Q1, and is SUPERSEDED BEFORE ISSUE. It was never saved, never authorized,

and no file was modified. Grounds: EDITS 4, 6, 8, 9 and 10 were specified by

derivation from a sibling edit, and EDITS 8, 9 and 10 additionally required the

implementer to compose comment text. Neither is mechanically checkable, and under

R-20 the implementer is a mechanical builder. Q2 NO. Q3 NO, with two recorded

notes: the identifier i is established verbatim at FlowLogic 898 by 155-Pre2 E1;

and whether the tree has an existing tagged-diagnostic Print convention is

UNESTABLISHED, so any such form is INVENTED, not matched — open item 48,

non-gating. Form B v2 supersedes.

RULES ISSUED SINCE THE ADDENDUM

★ ITEM-RESTATEMENT RULE — each answer opens with the item identifier and an

  enumeration of that item's REQUIRED OUTPUTS as the item states them, then the

  answer, then ITEM CONFORMANCE: ALL REQUIRED OUTPUTS DELIVERED or

  ITEM CONFORMANCE: NOT DELIVERED - <each missing output named>. An item missing

  any required output is ITEM NOT ANSWERED and is never answered differently. A

  report with any ITEM NOT ANSWERED is PARTIAL. Defect 115.

★ BUILDER-DISCRETION RULE — the builder never chooses an approach, proposes an

  alternative deliverable, or asks the planner a question. Five legal statuses.

  Anything else is a NON-RESPONSE, not a PARTIAL, and carries no evidentiary

  weight. Defect 110.

★ TOOL-ARTIFACT RULE — inline commands permitted without limit; no script,

  helper, module, temp file or intermediate output created or persisted. The only

  write is the report destination. Verification never shifts to the operator.

★ OUTPUT-BUDGET RULE — the header states the part count and the block-to-part

  mapping; the destination file is written once, complete, after the final part.

  Defects 110, 112.

★ TOKEN-SUBSTITUTION RULE — every angle-bracket token in the report format is

  REPLACED by its answer. A report containing an unreplaced token, or reproducing

  the task's rule block, item text or restrictions checklist, is a NON-RESPONSE.

  Defect 114.

★ RELAY-SAFE-TOKEN RULE — issued task text contains no paired underscore, no

  paired asterisk and no paired backtick outside a pasted source line. A

  placeholder is an angle-bracket token describing what the builder must supply.

  Defect 113.

★ PASTE-SOURCE RULE — every paste carries PASTE SOURCE: COMMAND OUTPUT and is

  emitted from that output without retyping. Defect 125.

★ NO-SELF-CERTIFICATION RULE — a builder or scribe reports the path written and

  the line or byte count. Completeness, conformance, placeholder and hash

  verification statements are the council's and carry no weight from any other

  role. Defect 126.

★ EDIT-FILE BYTE-SCOPE RULE — an anchor Form D's byte scan covers every file in

  the target Form B's minimum file set. Defect 128.

★ BAR-IDENTIFIER RULE — a task recording a bar index states, per write site, the

  exact identifier recorded and its relation to the processing bar i, from a named

  accepted result. Defect 121.

★ BRANCH-FORM RULE — a task inserting a statement beside an existing one reports

  the enclosing branch's brace form from a read of the canonical file before

  inserting, and treats an unbraced branch as BLOCKED. Defect 131.

★ REPOSITORY-INVENTORY RULE — a Form S either names only paths a scribe has

  reported existing, or instructs their creation explicitly in the same step.

  Council state is written to disk before any production edit is authorized.

  Defect 133.

★ AMENDMENT 8 EXTENDED TO FORM S — content is embedded in the same message, or

  the step names a file on disk to copy from. "Supplied alongside" is a

  placeholder and is prohibited. Defect 134.

★ SCRIBE-CONDITIONAL RULE — a Form S contains no condition other than "if this

  path exists, otherwise create it." A scribe never selects a branch. Defect 135.

★ LITERAL-EDIT RULE — under R-20, every edit in a Form B is supplied as complete

  literal insertion text. No edit is specified by reference to another edit, and

  no comment text is composed by the implementer.

OPEN ITEMS

CLOSED THIS INCREMENT: 42 (both halves), 43, 44.

NEW:

45  Is the identifier i passed as the processing-bar argument at OrderblockMgr 251

    and 356 FlowLogic's loop index from line 819? OPEN. Gates R-4b's carried

    derivation at sites 171/173 only. Not in 155-Pre2.

46  In which file, at what line, and in what form are g_bufFractalHigh and

    g_bufFractalLow declared? OPEN, documentation-only, NON-GATING — buffer 34's

    declaration goes in the 30-117 block regardless (EA-213).

47  Does SRJ_FlowLogic.mq5 or SRJ_State.mqh carry a byte-order mark, and what is

    each file's byte-scan line count against Get-Content's 1180 and 501? OPEN,

    non-gating — an added or stripped BOM changes line 1 and would be caught by

    the DIFF, but the pre-edit state is unrecorded.

48  Does the tree contain an existing tagged-diagnostic Print convention, and does

    Print occur in any of the five edited files? OPEN, non-gating. Determines

    whether a Form B's diagnostic form is matched or invented.

STILL OPEN: 28, 35, 36, 37, 39, 45, 46, 47, 48.

SEQUENCING, REPLACING SECTION 10 ROWS 1 THROUGH 6

1  160-PreJ, 154-Pre1, 154-Pre2, 154-Pre3-R, 155-Pre1, 155-Pre2   ACCEPTED

2  Repository reconstruction, Form S 60.2-2                      CURRENT

3  Task 155 Form B v2, all sixteen edits as literal text          WAITING on row 2.

                                                                  Council authors

4  Pre-flight pass 2, R-21, by the implementing session           WAITING on row 3

5  Task 155 implementation, mechanical builder under R-20         NOT AUTHORIZED.

                                                                  Requires a clean

                                                                  pass 2 and

                                                                  explicit written

                                                                  council

                                                                  authorization

Rows 7 through 11 of section 10 unchanged.

DEFECT 151  Form B v4 PART 2's EDIT 16 stated LINES INSERTED 46 with a derivation
            that does not close against its own printed text (printed: 1 + 29 + 18 + 1
            = 49), and made that wrong figure a BLOCKED condition keyed to the
            builder's own recount, so a correct count by the builder would have
            blocked the task on the author's error. EDIT 1 reached a correct figure of
            10 through an authorship self-correction narrative left inside issued task
            text. The form also omitted the NEW-RULE-RETROACTIVITY CHECK PERFORMED
            line that section 13 requires. The document introducing the
            delta-derivation rule breached it in two of its sixteen edits.

            GATING. PART 2 is not issuable until both units are struck and reissued.

            CLOSED BY - the count-statement rule: a form states LINES INSERTED for an
            edit as a bare integer with no recount instruction, no self-referential
CHUNKS USED: 9
VERIFIED REPORT LINE COUNT: 415
DEVIATIONS:
1. E2 read of the target (lines 401-800) returned internally truncated output: 8,899 characters omitted mid-range, with line 491 cut mid-line. Correction: re-read lines 485-720; spliced line numbers 491-584 and 620-715.
2. That re-read of lines 485-720 was itself internally truncated: 1,507 characters omitted across lines 585-619. Correction: re-read lines 580-625; spliced line numbers 585-619.
3. Shell emit of lines 401-800 (paste source) returned harness-truncated output: 6,499 characters omitted mid-range. Correction: visible emit portions matched the assembled text; the omitted middle is covered by the re-reads in items 1 and 2.
4. Post-write comparison against target lines 401-800 found 15 lines (targets 569, 571, 573, 575, 577, 579, 583, 585, 587, 589, 591, 593, 597, 599, 601) written with one extra leading space; that diff command's output was also harness-truncated. Correction: both affected spans were re-edited to the target's 5-space indent from the diff output, and the 15-character total length difference confirms no other line differs; post-fix comparison matched.
Path written: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_60.4-12.md