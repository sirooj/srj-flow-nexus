# `TASK_155-v4-PART2-R1.md` — PART 1 of 3

```text

TASK 155 FORM B v4 PART 2 REVISION 1 - EXPORT STAGE, BUFFER 34 PROVENANCE. THE EDITS.

SUPERSEDES IN FULL: TASK 155 Form B v4 PART 2 as emitted at Revision 60.4, ABANDONED
  under R-30. No figure, edit, gate or unit of that emission is quoted anywhere in this
  document. VOID FIGURES, never quoted: 46, +59, 1239.

STATUS OF THIS DOCUMENT: authored complete at one authorship. It carries no strike, no
  addendum and no erratum. If any figure in it is wrong, it is abandoned and reissued
  as R2. Nobody merges anything into it.

RELAY LINE
  PARTS: 3.
  BLOCK-TO-PART MAP
    PART 1  BLOCK 1, BLOCK 2, BLOCK 3
    PART 2  BLOCK 4, BLOCK 5
    PART 3  BLOCK 6, BLOCK 7, BLOCK 8
  BLOCKS: 8
  UNITS PER BLOCK: 8, 8, 3, 5, 7, 17, 2, 6
  SUM OF UNITS: 56
  CONTINUATION TOKENS: PART 1 ends CONTINUES-IN-PART-2. PART 2 ends
    CONTINUES-IN-PART-3. PART 3 ends END-OF-TASK-155-V4-PART2-R1.
  If the terminator token END-OF-TASK-155-V4-PART2-R1 is absent, or a continuation
  token is absent, or any per-block unit count does not match what you received, report
  RELAY INCOMPLETE, name the last unit received, and STOP. That is not a PARTIAL.
  Where the per-block counts and the sum disagree, the PER-BLOCK figures GOVERN; report
  COUNT LINE INCONSISTENT and PROCEED.

EVERY INSTRUCTION IN THIS DOCUMENT IS ADDRESSED TO THE BUILDER. Nothing in it is
addressed to the operator. Nothing in it asks any role to assemble, merge, correct or
complete this form.

```

## BLOCK 1 — HEADER, SCOPE, DESTINATIONS, PROHIBITIONS (8 units)

```text

1.1 DESTINATIONS

  CANONICAL ROOT
    C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5

  REPORT PATH:
    C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS

  REPORT DESTINATION, full run, AUTHORIZED:
    ...\06_HANDOFFS\BUILDER_RESULT_155.md

  REPORT DESTINATION, pre-flight-only invocation, AUTHORIZED:
    ...\06_HANDOFFS\BUILDER_RESULT_155-PREFLIGHT.md

  REPORT DESTINATION, destination-occupied block, AUTHORIZED:
    ...\06_HANDOFFS\BUILDER_RESULT_155-BLOCKED-01.md

  These three filenames are the only files this task may create anywhere.
  The report destination is written ONCE, COMPLETE, after the final stage. In-chat-only
  delivery of this form is PROHIBITED.

  If a full run finds BUILDER_RESULT_155.md already present, do not overwrite it and do
  not append to it: write the BLOCKED report to BUILDER_RESULT_155-BLOCKED-01.md and
  stop before reading any canonical file.

  If the REPORT PATH line above is absent from what you received, report DESTINATION
  MISSING and stop before reading any file.

1.2 FILE SET. FIVE FILES EDITED, and no other file modified anywhere.

    MQL5\Include\SRJ\SRJ_State.mqh
    MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh
    MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
    MQL5\Include\SRJ\SRJ_BiasEngine.mqh
    MQL5\Indicators\SRJ_FlowLogic.mq5

  READ, NOT EDITED, and asserted byte-identical before and after by digest:
    MQL5\Experts\SRJ_FlowNexus_EA.mq5
    MQL5\Include\SRJ\SRJ_Types.mqh

1.3 CANONICAL-SCOPE RULE, BOTH HALVES, WITH THIS TASK'S EXCEPTIONS STATED.

  HALF ONE. NO FILE IS WRITTEN UNDER MQL5\Experts\, MQL5\Indicators\ OR MQL5\Include\,
    EXCEPT the five files named in unit 1.2, which this form authorizes to be modified
    in place, AND EXCEPT the compile artifact named in unit 1.4.

  HALF TWO. NO EXISTING FILE IS MODIFIED ANYWHERE, EXCEPT those same five files.

  A new file under MQL5\SRJ_FlowNexus_Local\ is permitted only at the three report
    destinations named in unit 1.1. No checkpoint copy, no AFTER folder, no snapshot
    and no manifest is authorized by this form. Do not create one.

1.4 COMPILE-ARTIFACT RULE. This task commands one compile. The resulting
  MQL5\Indicators\SRJ_FlowLogic.ex5 is an EXPECTED artifact, is NOT a canonical-scope
  violation, and is EXCLUDED from the DIFF scope check and from every byte-identity
  assertion in this form. Report its full path and its post-compile timestamp. Never
  hash it. Never copy it. Never move it.

1.5 PROHIBITIONS, each with its operative content stated inline.

  P3a  No existing SetIndexBuffer line is modified, reordered or deleted. Buffer
       registration is APPEND ONLY. EDIT 13 appends three new SetIndexBuffer lines
       after the existing highest one and touches no existing line.

  P5a  An appended SState field is accompanied by its initialiser in SRJ_StateInit.
       EDIT 1 appends the three fields; EDIT 2 appends the three initialisers. Both
       are performed or neither is.

  P7   Compile SRJ_FlowLogic.mq5 ONLY. No other file is compiled.

  P10  Gate form of P7. The gate is satisfied by that one compile and by nothing else.
       Nothing is run, attached to a chart, backtested or optimised.

  P11  Read and compile by shell command only. NEVER open a canonical file in
       MetaEditor. Apply edits by file-editing operations, never through the MetaEditor
       graphical interface.

  P12  No line number from a previous task is an anchor. Every line number in this form
       is verified by BLOCK 4's own read from the canonical file before any edit is
       applied.

  P14  Do not read the local repository as CODE SOURCE. One exception, authorized here
       and bounded: the seven files under
       02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\ are read as the
       DIFF REFERENCE at STAGE 1 and STAGE 5 only. No character of insertion text comes
       from them. Canonical code is read only from MQL5\Experts\, MQL5\Indicators\ and
       MQL5\Include\SRJ\.

  P17  DOES NOT APPLY. This is an approved Form B implementation, not a Form D. Do not
       disable reference skills. Report the line "Reference documents loaded:" for the
       record; it is informational here and gates nothing.

1.6 AUTHORIZATION STATE. This form is not self-authorizing. STAGE 0 requires an
  authorization token stated in this session's relay wrapper. If no token is present,
  the invocation is PRE-FLIGHT ONLY: answer BLOCK 3, write to
  BUILDER_RESULT_155-PREFLIGHT.md, and STOP without entering STAGE 0.

1.7 NO-SELF-CERTIFICATION. Report the path written and the line count of the report.
  Do NOT state that the task is complete, conformant, verified, correct or clean.
  Completeness, conformance, placeholder and hash-verification JUDGMENTS are the
  council's.

  You DO report the mechanical outcome of every gate as PASS or BLOCKED, and you DO
  report EQUAL or NOT EQUAL for a byte comparison of two strings that are both pasted
  in the report. Those are measurements, not certifications.

1.8 STATUS AND DISCRETION.

  THE FIVE LEGAL STATUSES: COMPLETED, PARTIAL, BLOCKED, RELAY INCOMPLETE,
  DESTINATION MISSING. Anything else is a NON-RESPONSE.

  Every legal status is written to the report destination before the session ends,
  carrying every stage completed and every figure derived to that point. A BLOCKED
  report is written once, complete, and is not a stub. Only a NON-RESPONSE writes
  nothing.

  You never choose an approach, never propose an alternative deliverable, and never ask
  a question. If this form does not determine an action, that is a BLOCKED condition
  and you report it as one.

```

## BLOCK 2 — DEFINITIONS (8 units)

```text

Self-contained. Every term this form requires you to APPLY is defined here, and this
form applies nothing it does not define. D1, D2 and D3 carry the same operative content
they had in PART 1; D4, D5 and D6 are not used by this form and are deliberately absent.

D1  WHOLE TOKEN. A run of characters T occurs as a whole token at a position if the
    character immediately before it and the character immediately after it are each
    either absent, meaning start or end of line, or NOT one of A-Z, a-z, 0-9,
    underscore. All matching in this form is CASE-SENSITIVE. An occurrence count is the
    number of such positions on the line, or in the file, as the item states.

D2  STRIPPED. The line with every leading and trailing space character and tab
    character removed, and nothing else changed.

D3  COLUMN. The 1-based index of the first character of the named text, counting every
    byte on the line from the first, including spaces and tabs. A line whose STRIPPED
    form is empty has COLUMN NONE.

D7  LEADING SPACE COUNT. The number of space characters at the start of the line,
    before the first non-space character. For a line whose STRIPPED form is empty, the
    LEADING SPACE COUNT is the total number of space characters on the line.

    This form asserts and specifies leading whitespace as a COUNT OF SPACE CHARACTERS
    ONLY.

    TAB CONDITION. Nineteen lines are named in BLOCK 6 as a WHITESPACE REFERENCE:
      SRJ_State.mqh 246, 327
      SRJ_OrderblockMgr.mqh 170, 171, 172, 173, 534, 535, 536, 537
      SRJ_ImbalanceMgr.mqh 209, 326
      SRJ_BiasEngine.mqh 226, 280
      SRJ_FlowLogic.mq5 117, 617, 664, 797, 902

    If ANY of those nineteen lines contains a tab character anywhere in its leading
    whitespace, that is a BLOCKED condition: report it, name the line, and perform no
    edit.

    Every inserted line in BLOCK 6 is specified as LEADING SPACES followed by a number,
    then a vertical bar, then the exact text of the line. Construct the line as that
    many space characters followed by that text, exactly. The number GOVERNS. The
    vertical bar is a delimiter in this form and is never inserted into source.

    INTERIOR SPACING, meaning any run of two or more spaces inside an inserted line
    used to align an equals sign or a comment, is COSMETIC. Take it as printed. If
    relay has collapsed an interior run to a single space, insert a single space. That
    is NOT a deviation and is not reported as one. Leading whitespace is never cosmetic.

D8  INSERTION POINT. "INSERT AFTER line N" means the inserted lines become new lines
    immediately following existing line N. Existing line N is unchanged. Existing line
    N+1 is unchanged and moves down. Nothing is overwritten.

    EVERY LINE NUMBER IN THIS FORM IS AN ORIGINAL PRE-EDIT LINE NUMBER. Apply the
    operations within each file in the DESCENDING ORDER stated at unit 6.0, so that no
    applied operation invalidates a line number used later.

D9  BRACE CENSUS. Over the raw bytes of the whole file, the count of byte 0x7B, the
    open brace character, and separately the count of byte 0x7D, the close brace
    character. Comments and string literals are NOT excluded. This is a byte count.

D10 LINE COUNT. The number of lines in the file, produced by the same single command
    used for the baseline figures at unit 4.2 and re-used unchanged at unit 7.1. Paste
    that command's raw output both times.

D11 DEVIATION. Any respect in which what you did differs from what this form specifies,
    including a corrected command, a retried operation, a tool failure, or an
    interior-space difference you chose to normalise. Report every deviation in place,
    at the unit where it occurred, and again in the report's deviation list. Zero
    deviations is a legal and expected outcome; do not manufacture one.

```

## BLOCK 3 — PRE-FLIGHT BLOCK, PASS 2 (3 units)

```text

Answer these three from THIS DOCUMENT'S TEXT ALONE, before reading any file. Do not open
a canonical file to answer them. Any YES is a FULL BLOCK: write the BLOCKED report and
STOP. You do not weigh which YES is load-bearing, you do not report a partial YES
differently, and you do not proceed on the unaffected units. Triage is the council's.

Q1  Does any instruction in this document require you to CHOOSE, INFER, DERIVE, COMPOSE
    or RESOLVE anything that this document does not already state in full? Include: any
    comment text you would have to compose, any identifier you would have to select, any
    line number you would have to compute, any edit specified by reference to another
    edit, any branch you would have to pick, and any count of this form's own text you
    would have to make in order to know what to insert.

    ANSWER: YES or NO. If YES, name the block and unit.

Q2  Does any instruction in this document require writing to, creating, deleting or
    modifying any file other than the five files at unit 1.2, the three report
    destinations at unit 1.1, and the compile artifact at unit 1.4?

    ANSWER: YES or NO. If YES, name the block, unit and path.

Q3  Is any instruction in this document not MECHANICALLY CHECKABLE from this document
    plus the canonical files alone? Include: any defined term, named rule, prohibition
    tag or named figure whose operative content is NOT stated inline here; any check
    whose PASS condition is not stated; any BLOCKED condition whose wording is not
    given; and any required figure that no edit and no check in this document consumes.

    ANSWER: YES or NO. If YES, name the block, unit and the term or figure.

```

```text

CONTINUES-IN-PART-2

```

---

# `TASK_155-v4-PART2-R1.md` — PART 2 of 3

## BLOCK 4 — BASELINE AND MANDATORY PRE-INSERT READS (5 units)

```text

4.1 BASELINE DIGESTS. Hash all seven files at unit 1.2 with SHA256 by shell command and
    paste the RAW command output. Compare each against the value below by byte
    comparison of the two pasted strings and report EQUAL or NOT EQUAL.

      SRJ_FlowNexus_EA.mq5
        0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322

      SRJ_FlowLogic.mq5
        d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5

      SRJ_State.mqh
        85b2635627b0e217d233afcea191f9cab766f309eea464080248be13422d02d8

      SRJ_OrderblockMgr.mqh
        9dcd8d8db57089e525a5ed1ccfe4ba6b4c4b1d63e72d6868cd101e1b4da5f27d

      SRJ_ImbalanceMgr.mqh
        87886cd42e38ed6592dc798ca17a1ebb889b5f4521f389d5fd837fcaa2d482b6

      SRJ_BiasEngine.mqh
        384a25bad6f92cdadd62f6d297b71b7a0afc809c7a50bbd4fac532c85b7ad89e

      SRJ_Types.mqh
        773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc

    Then hash the seven files under
      02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\

    and report EQUAL or NOT EQUAL against the same seven values. Fourteen comparisons
    in total.

    ANY NOT EQUAL IS A BASELINE-INTEGRITY FAILURE. It is the ONLY condition that stops
    the read stage before completion. Report BLOCKED and perform no edit. A NOT EQUAL
    on a BEFORE file means the DIFF reference is unsound and no edit could be verified.

    STASIS NOTE. The two .mq5 digests above are the supplied stasis values. Both must be
    EQUAL pre-edit. SRJ_FlowLogic.mq5 necessarily DIFFERS after the edit and that is
    expected, not a stasis break. SRJ_FlowNexus_EA.mq5 must still be EQUAL after the
    edit. This form makes no stasis-floor claim. Do not quote a floor.

4.2 BASELINE LINE COUNTS, per D10. Paste the raw output of ONE command over all seven
    files and report EQUAL or NOT EQUAL per file against:

      SRJ_FlowNexus_EA.mq5   3202
      SRJ_FlowLogic.mq5      1180
      SRJ_State.mqh           501
      SRJ_OrderblockMgr.mqh  1104
      SRJ_ImbalanceMgr.mqh    532
      SRJ_BiasEngine.mqh      386
      SRJ_Types.mqh           355

    A NOT EQUAL is BLOCKED. These seven figures are consumed by unit 7.1.

4.3 BASELINE BRACE CENSUS, per D9, on the five edited files. Paste the raw output and
    report EQUAL or NOT EQUAL per file against:

      SRJ_State.mqh            7 open /   7 close
      SRJ_OrderblockMgr.mqh  121 open / 121 close
      SRJ_ImbalanceMgr.mqh    56 open /  56 close
      SRJ_BiasEngine.mqh      34 open /  34 close
      SRJ_FlowLogic.mq5       70 open /  70 close

    A NOT EQUAL is BLOCKED. These five figures are consumed by unit 7.2.

4.4 MANDATORY PRE-INSERT READS. 103 lines across five files. Read each line from the
    canonical file by shell command and report it VERBATIM with its COLUMN per D3 and
    its LEADING SPACE COUNT per D7.

    THIS FORM PASTES THE EXPECTED TEXT OF NO SOURCE LINE, and you never match against a
    pasted source line. You match against the WHOLE TOKENS named below per D1, against
    the stated STRIPPED-form condition where one is given, and against the stated
    LEADING SPACES count where one is given.

    Each line carries a class:

      CLASS A  ANCHOR. Must contain every named whole token, AND its leading space
               count must equal the stated number. Either failure is BLOCKED.

      CLASS B  CONTEXT. Must contain every named whole token, or satisfy the stated
               stripped-form condition. Failure is BLOCKED.

      CLASS C  EMPTY. Stripped form must be empty. Failure is BLOCKED. Report the
               leading space count for the record; it is not asserted.

      CLASS D  RECORD ONLY. No assertion. Read it, report it verbatim. Never BLOCKED.

    ONE PASTE PER FIGURE. Each of the 103 lines is reported exactly once, in the single
    read table at STAGE 2 of the report, and appears nowhere else in the report.

    SRJ_FlowLogic.mq5, 26 lines

      8   A  LEADING SPACES 0.  tokens: property, indicator_buffers, 34
      9   B  tokens: property, indicator_plots, 2
      117 A  LEADING SPACES 0.  tokens: double, g_bufXobPromoTime
      118 C
      617 A  LEADING SPACES 3.  tokens: SetIndexBuffer, 33, g_bufXobPromoTime,
                                        INDICATOR_CALCULATIONS
      618 C
      664 A  LEADING SPACES 3.  tokens: ArraySetAsSeries, g_bufXobPromoTime, false
      665 C
      746 B  tokens: if, prevCalc
      747 B  stripped form is exactly one open brace character
      753 B  tokens: ArrayInitialize, g_bufOBValid, EMPTY_VALUE
      793 B  tokens: ArrayInitialize, g_bufXobObjId
      797 A  LEADING SPACES 6.  tokens: ArrayInitialize, g_bufXobPromoTime
      798 C
      799 B  token: SRJ_DeleteAllObjects
      800 B  token: SRJ_StateInit
      819 B  tokens: for, rates_total
      898 B  tokens: int, target, i
      899 B  tokens: if, target
      900 B  stripped form is exactly one open brace character
      902 A  LEADING SPACES 9.  tokens: g_bufOBValid, target, tickOBIsValid
      903 B  tokens: g_bufFVGValid, tickFVGIsValid
      904 B  tokens: g_bufOppFVG, hasPersistedOpposingFVG
      905 C
      954 B  tokens: g_bufXobObjId, target
      966 B  tokens: g_bufXobObjId, objId, double

    SRJ_State.mqh, 14 lines

      96  B  tokens: struct, SState
      97  B  stripped form is exactly one open brace character
      126 B  tokens: bool, tickOBIsValid
      127 B  tokens: bool, tickFVGIsValid
      128 B  tokens: bool, hasPersistedOpposingFVG
      245 B  tokens: string, mtfBoxName
      246 A  LEADING SPACES 3.  tokens: string, dataWarningName
      247 B  stripped form is exactly one close brace character followed by one
             semicolon and nothing else
      249 B  tokens: SState, g_s
      326 B  token: structLegBoundary
      327 A  LEADING SPACES 3.  tokens: tickOBIsValid, true
      328 B  tokens: tickFVGIsValid, true
      329 B  tokens: hasPersistedOpposingFVG, false
      330 B  token: inBiasOBInvalidationCount

    SRJ_OrderblockMgr.mqh, 25 lines

      89  B  tokens: SRJ_OB_ReplayActivationInvalidation, COrderblock, ob
      121 B  tokens: if, ob, isActivated, isValid, didActivate
      129 B  tokens: if, closedBeyondInvalidation
      160 B  tokens: if, refOk
      168 B  tokens: bool, isInBias, currentBias, isBullish
      169 B  tokens: currentBias, isBullish
      170 A  LEADING SPACES 12. tokens: if, isInBias
      171 A  LEADING SPACES 15. tokens: tickOBIsValid, false
      172 A  LEADING SPACES 12. stripped form is exactly the whole token else
      173 A  LEADING SPACES 15. tokens: tickOBIsValid, true
      174 C
      413 B  token: SRJ_OB_ActivationInvalidationPass
      425 B  token: for
      427 B  tokens: COrderblock, ob
      480 B  tokens: if, barClosed
      482 B  tokens: if, ob, isActivated, isValid
      494 B  tokens: if, closedBeyondInvalidation, wouldBeSameBarValInv, isCreationBar
      524 B  tokens: if, refOk
      532 B  tokens: bool, isInBias, currentBias, ob, isBullish
      533 B  tokens: currentBias, isBullish
      534 A  LEADING SPACES 18. tokens: if, isInBias
      535 A  LEADING SPACES 21. tokens: tickOBIsValid, false
      536 A  LEADING SPACES 18. stripped form is exactly the whole token else
      537 A  LEADING SPACES 21. tokens: tickOBIsValid, true
      538 C

    SRJ_ImbalanceMgr.mqh, 19 lines

      108 B  token: SRJ_FVG_CreationRenewalPass
      205 D
      206 D
      207 B  token: fvgDetectionBoundary
      208 C
      209 A  LEADING SPACES 15. tokens: tickOBIsValid, true
      210 B  tokens: tickFVGIsValid, true
      211 D
      212 D
      213 D
      322 D
      323 D
      324 B  token: fvgDetectionBoundary
      325 C
      326 A  LEADING SPACES 15. tokens: tickOBIsValid, true
      327 B  tokens: tickFVGIsValid, true
      328 D
      329 D
      330 D

    SRJ_BiasEngine.mqh, 19 lines

      149 B  tokens: SRJ_Bias_DecisionBlock, int, i, bool, withinLookbackWindow,
                     barClosed
      222 D
      223 D
      224 B  token: fvgDetectionBoundary
      225 D
      226 A  LEADING SPACES 6.  tokens: tickOBIsValid, true
      227 B  tokens: tickFVGIsValid, true
      228 D
      229 D
      230 D
      276 D
      277 D
      278 D
      279 B  token: structLegBoundary
      280 A  LEADING SPACES 6.  tokens: tickOBIsValid, true
      281 B  tokens: tickFVGIsValid, true
      282 D
      283 D
      284 D

    TOTAL READS: 26 + 14 + 25 + 19 + 19 = 103.

    CONSUMED BY: every CLASS A and CLASS B assertion gates the edit; every CLASS A
    leading-space count is the whitespace reference an edit in BLOCK 6 uses; every
    CLASS C and CLASS D line establishes that the insertion point's neighbour is what
    this form assumes it is.

4.5 READ-STAGE COMPLETION CLAUSE. Perform ALL 103 reads. A failure in one read never
    suppresses another and never terminates the stage. Report every failure in place,
    at its own row. Only a BASELINE-INTEGRITY FAILURE at unit 4.1 stops the stage.

    After all 103 reads are reported, if one or more CLASS A, B or C assertions failed,
    the STATUS is BLOCKED, NO EDIT IS APPLIED, and the mismatch is never reconciled in
    place. Do not adjust a line number to make an assertion pass. Do not search
    neighbouring lines for a better match.

```

## BLOCK 5 — RE-GATES (7 units)

```text

Run all seven after BLOCK 4 completes and before any edit is applied. Each is a
mechanical measurement with a stated PASS condition and a stated BLOCKED wording.
Report the measured figure and PASS or BLOCKED. Any BLOCKED means no edit is applied.

G1  LINE 8 TOKEN GATE. On SRJ_FlowLogic.mq5 line 8, count occurrences of the whole
    token 34 per D1, and report the COLUMN per D3 of the occurrence.

    PASS if the count is exactly 1 and the column is exactly 29.

    CONSUMED BY: EDIT 11, which replaces exactly that occurrence.

    BLOCKED WORDING: "G1 BLOCKED: line 8 whole-token 34 count is N at column C,
    required exactly 1 at column 29. No edit applied."

G2  FOUR-LINE WINDOW GATE, WINDOW 1 = SRJ_OrderblockMgr.mqh 170, 171, 172, 173.

    Six checks, all must PASS:

      (a) the four lines together contain zero open brace characters and zero close
          brace characters;

      (b) the four lines together contain neither block-comment delimiter, meaning
          neither a forward slash followed immediately by an asterisk, nor an asterisk
          followed immediately by a forward slash;

      (c) line 170 ends in a close parenthesis, and its open-parenthesis count equals
          its close-parenthesis count, and that count is 1;

      (d) line 171 ends in a semicolon and contains the whole tokens tickOBIsValid and
          false;

      (e) the stripped form of line 172 is exactly the whole token else;

      (f) line 173 ends in a semicolon and contains the whole tokens tickOBIsValid and
          true.

    CONSUMED BY: EDIT 3 and EDIT 4, which insert a brace pair into this window.

    BLOCKED WORDING: "G2 BLOCKED: window 1 check X failed. No edit applied."

G3  FOUR-LINE WINDOW GATE, WINDOW 2 = SRJ_OrderblockMgr.mqh 534, 535, 536, 537.

    The same six checks (a) through (f), reading 534 for 170, 535 for 171, 536 for 172
    and 537 for 173.

    CONSUMED BY: EDIT 5 and EDIT 6.

    BLOCKED WORDING: "G3 BLOCKED: window 2 check X failed. No edit applied."

G4  APPEND-SITE FORM, THE FOUR BRACED SITES. For each of SRJ_OrderblockMgr.mqh 171,
    173, 535 and 537, take the nearest line ABOVE and the nearest line BELOW whose
    stripped form is neither empty nor begins with two forward slashes. Bound each scan
    to twenty lines; if no such line is found within twenty, that is BLOCKED.

    A site returns UNBRACED BRANCH BODY when all of the following hold: the write line
    ends in a semicolon; the write line contains no brace character; the write line's
    open-parenthesis count equals its close-parenthesis count; and the nearest
    significant line ABOVE is either a line ending in a close parenthesis whose
    stripped form begins with the whole token if, or a line whose stripped form is
    exactly the whole token else.

    PASS requires all four sites to return UNBRACED BRANCH BODY.

    CONSUMED BY: EDIT 3, 4, 5 and 6, whose brace insertion is authorized for these four
    sites and no others.

    BLOCKED WORDING: "G4 BLOCKED: site S did not return UNBRACED BRANCH BODY. No edit
    applied."

G5  APPEND-SITE FORM, THE FOUR BLOCK-MEMBER SITES. For each of SRJ_ImbalanceMgr.mqh 209
    and 326 and SRJ_BiasEngine.mqh 226 and 280, take the nearest significant line above
    and below by the same definition and the same twenty-line bound as G4.

    A site returns BLOCK MEMBER when all of the following hold: the write line ends in a
    semicolon; the write line contains no brace character; the nearest significant line
    ABOVE ends in a semicolon; and the nearest significant line BELOW ends in a
    semicolon.

    PASS requires all four sites to return BLOCK MEMBER.

    A site here returning UNBRACED BRANCH BODY is BLOCKED, and no brace is inserted at
    any of these four sites under any circumstance.

    CONSUMED BY: EDIT 7, 8, 9 and 10, none of which inserts a brace.

    BLOCKED WORDING: "G5 BLOCKED: site S did not return BLOCK MEMBER. No edit applied.
    No brace inserted."

G6  DIGEST GATE. Unit 4.1 produced fourteen comparisons.

    PASS if all fourteen are EQUAL.

    CONSUMED BY: the DIFF at unit 8.3, which is only meaningful against a verified
    BEFORE reference.

    BLOCKED WORDING: "G6 BLOCKED: N of 14 digest comparisons are NOT EQUAL. No edit
    applied."

G7  IDENTIFIER-COLLISION GATE. This form introduces ten identifiers. An existing
    identifier of the same name would either fail to compile or silently shadow.

    Count whole-token occurrences per D1 of each of the following ten identifiers in
    each of the five edited files, BEFORE any edit. Fifty figures.

      tickOBSetterId
      tickOBSetterCode
      tickOBSetterBar
      g_bufOBValidProv
      g_bufFVGValidProv
      g_bufOppFVGProv
      t155ProvId
      t155ProvCode
      t155ProvBar
      t155ProvOut

    PASS if every one of the fifty figures is 0.

    CONSUMED BY: this gate's own BLOCKED condition, by EDIT 1, 2, 12 and 16 which
    introduce the ten names, and by unit 8.4(v) which re-measures them after the edit.

    BLOCKED WORDING: "G7 BLOCKED: identifier X occurs N times in file F before the
    edit. No edit applied."

```

```text

CONTINUES-IN-PART-3

```

---

# `TASK_155-v4-PART2-R1.md` — PART 3 of 3

## BLOCK 6 — THE SIXTEEN EDITS (17 units)

```text

6.0 APPLICATION ORDER. Twenty operations: nineteen insertions and one modification.

    Apply them file by file, in exactly this order, so that every ORIGINAL pre-edit line
    number is still valid at the moment it is used.

      SRJ_State.mqh          EDIT 2,  EDIT 1

      SRJ_OrderblockMgr.mqh  EDIT 6B, EDIT 6A, EDIT 5B, EDIT 5A,
                             EDIT 4B, EDIT 4A, EDIT 3B, EDIT 3A

      SRJ_ImbalanceMgr.mqh   EDIT 8,  EDIT 7

      SRJ_BiasEngine.mqh     EDIT 10, EDIT 9

      SRJ_FlowLogic.mq5      EDIT 16, EDIT 15, EDIT 14, EDIT 13, EDIT 12, EDIT 11

    Every inserted line below is given as LEADING SPACES n, a vertical bar, then the
    exact text, per D7. The vertical bar is a delimiter and is never inserted.

    Insert the lines of an edit in the order printed.

    LINES INSERTED is stated for each edit as a bare integer. You do not recount this
    form. You measure the FILES at BLOCK 7 and compare against the figures stated there.

```

### EDIT 1 — `SRJ_State.mqh`, INSERT AFTER 246, BEFORE 247

```text

Whitespace reference: line 246, LEADING SPACES 3.

LINES INSERTED: 10.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 3 | // [Task 155] Buffer 34 transport. These three fields carry the
LEADING SPACES 3 | // provenance of the tickOBIsValid value to the export block. long is
LEADING SPACES 3 | // required here, not matched: COrderblock declares objId as long in
LEADING SPACES 3 | // SRJ_Types.mqh, and truncating it would make the exported identity
LEADING SPACES 3 | // unverifiable. Exact long-to-double conversion holds only inside the
LEADING SPACES 3 | // safe integer range 9007199254740992. The value contract for the
LEADING SPACES 3 | // exported buffer is stated beside the export write, not here.
LEADING SPACES 3 | long     tickOBSetterId;
LEADING SPACES 3 | int      tickOBSetterCode;
LEADING SPACES 3 | int      tickOBSetterBar;

```

### EDIT 2 — `SRJ_State.mqh`, INSERT AFTER 327, BEFORE 328

```text

P5a. Whitespace reference: line 327, LEADING SPACES 3.

LINES INSERTED: 5.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 3 | // [Task 155] Site code 9 means SRJ_StateInit default, no write since.
LEADING SPACES 3 | // Bar -1 means no bar context exists in this function.
LEADING SPACES 3 | g_s.tickOBSetterId                 = 0;
LEADING SPACES 3 | g_s.tickOBSetterCode               = 9;
LEADING SPACES 3 | g_s.tickOBSetterBar                = -1;

```

### EDIT 3 — `SRJ_OrderblockMgr.mqh` SITE 1, TWO INSERTION POINTS

```text

Authority for the brace pair: R-22, for this site and the three other named
SRJ_OrderblockMgr.mqh sites only. Insertion only. No existing line is modified,
reordered, reindented or deleted.

EDIT 3A  INSERT AFTER 170, BEFORE 171.   Whitespace reference: line 170.

LEADING SPACES 12 | {

EDIT 3B  INSERT AFTER 171, BEFORE 172.

         Capture lines: whitespace reference line 171, LEADING SPACES 15.
         Close brace:   whitespace reference line 170, LEADING SPACES 12.

LEADING SPACES 15 | // [Task 155] Buffer 34 provenance capture. Site code 1. The bar
LEADING SPACES 15 | // recorded is discoveryBar, the PROCESSING bar of this call, and not
LEADING SPACES 15 | // replayBar, which is the event bar.
LEADING SPACES 15 | Print("[SRJ][T155][OBPROV] code=1 id=", ob.objId, " bar=", discoveryBar, " flag=false");
LEADING SPACES 15 | g_s.tickOBSetterId   = ob.objId;
LEADING SPACES 15 | g_s.tickOBSetterCode = 1;
LEADING SPACES 15 | g_s.tickOBSetterBar  = discoveryBar;
LEADING SPACES 12 | }

EDIT 3 LINES INSERTED: 9.   BRACES ADDED: 1 open, 1 close.

```

### EDIT 4 — `SRJ_OrderblockMgr.mqh` SITE 2, TWO INSERTION POINTS

```text

EDIT 4A  INSERT AFTER 172, BEFORE 173.   Whitespace reference: line 172.

LEADING SPACES 12 | {

EDIT 4B  INSERT AFTER 173, BEFORE 174.

         Capture lines: whitespace reference line 173, LEADING SPACES 15.
         Close brace:   whitespace reference line 172, LEADING SPACES 12.

LEADING SPACES 15 | // [Task 155] Buffer 34 provenance capture. Site code 2. The bar
LEADING SPACES 15 | // recorded is discoveryBar, the processing bar of this call.
LEADING SPACES 15 | Print("[SRJ][T155][OBPROV] code=2 id=", ob.objId, " bar=", discoveryBar, " flag=true");
LEADING SPACES 15 | g_s.tickOBSetterId   = ob.objId;
LEADING SPACES 15 | g_s.tickOBSetterCode = 2;
LEADING SPACES 15 | g_s.tickOBSetterBar  = discoveryBar;
LEADING SPACES 12 | }

EDIT 4 LINES INSERTED: 8.   BRACES ADDED: 1 open, 1 close.

```

### EDIT 5 — `SRJ_OrderblockMgr.mqh` SITE 3, TWO INSERTION POINTS

```text

EDIT 5A  INSERT AFTER 534, BEFORE 535.   Whitespace reference: line 534.

LEADING SPACES 18 | {

EDIT 5B  INSERT AFTER 535, BEFORE 536.

         Capture lines: whitespace reference line 535, LEADING SPACES 21.
         Close brace:   whitespace reference line 534, LEADING SPACES 18.

LEADING SPACES 21 | // [Task 155] Buffer 34 provenance capture. Site code 3. This pass
LEADING SPACES 21 | // invalidates orderblocks inside a descending loop, so several may
LEADING SPACES 21 | // write the flag in one bar. The LAST write survives to the export;
LEADING SPACES 21 | // the unconditional Print below carries every event.
LEADING SPACES 21 | Print("[SRJ][T155][OBPROV] code=3 id=", ob.objId, " bar=", i, " flag=false");
LEADING SPACES 21 | g_s.tickOBSetterId   = ob.objId;
LEADING SPACES 21 | g_s.tickOBSetterCode = 3;
LEADING SPACES 21 | g_s.tickOBSetterBar  = i;
LEADING SPACES 18 | }

EDIT 5 LINES INSERTED: 10.   BRACES ADDED: 1 open, 1 close.

```

### EDIT 6 — `SRJ_OrderblockMgr.mqh` SITE 4, TWO INSERTION POINTS

```text

EDIT 6A  INSERT AFTER 536, BEFORE 537.   Whitespace reference: line 536.

LEADING SPACES 18 | {

EDIT 6B  INSERT AFTER 537, BEFORE 538.

         Capture lines: whitespace reference line 537, LEADING SPACES 21.
         Close brace:   whitespace reference line 536, LEADING SPACES 18.

LEADING SPACES 21 | // [Task 155] Buffer 34 provenance capture. Site code 4. The LAST
LEADING SPACES 21 | // write in this descending loop survives to the export.
LEADING SPACES 21 | Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true");
LEADING SPACES 21 | g_s.tickOBSetterId   = ob.objId;
LEADING SPACES 21 | g_s.tickOBSetterCode = 4;
LEADING SPACES 21 | g_s.tickOBSetterBar  = i;
LEADING SPACES 18 | }

EDIT 6 LINES INSERTED: 8.   BRACES ADDED: 1 open, 1 close.

```

### EDIT 7 — `SRJ_ImbalanceMgr.mqh` SITE 5, INSERT AFTER 209, BEFORE 210

```text

NO BRACE IS INSERTED. G5 establishes BLOCK MEMBER form at this site. R-22 does not
extend here.

Whitespace reference: line 209, LEADING SPACES 15.

LINES INSERTED: 8.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 15 | // [Task 155] Buffer 34 provenance capture. Site code 5. An
LEADING SPACES 15 | // orderblock object is in scope in this pass, but the source names
LEADING SPACES 15 | // none at this write, so no identity is recorded and the export
LEADING SPACES 15 | // emits the site sentinel -11.0.
LEADING SPACES 15 | Print("[SRJ][T155][OBPROV] code=5 id=0 bar=", i, " flag=true");
LEADING SPACES 15 | g_s.tickOBSetterId   = 0;
LEADING SPACES 15 | g_s.tickOBSetterCode = 5;
LEADING SPACES 15 | g_s.tickOBSetterBar  = i;

```

### EDIT 8 — `SRJ_ImbalanceMgr.mqh` SITE 6, INSERT AFTER 326, BEFORE 327

```text

NO BRACE IS INSERTED.

Whitespace reference: line 326, LEADING SPACES 15.

LINES INSERTED: 6.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 15 | // [Task 155] Buffer 34 provenance capture. Site code 6. No identity
LEADING SPACES 15 | // is recorded; the export emits the site sentinel -12.0.
LEADING SPACES 15 | Print("[SRJ][T155][OBPROV] code=6 id=0 bar=", i, " flag=true");
LEADING SPACES 15 | g_s.tickOBSetterId   = 0;
LEADING SPACES 15 | g_s.tickOBSetterCode = 6;
LEADING SPACES 15 | g_s.tickOBSetterBar  = i;

```

### EDIT 9 — `SRJ_BiasEngine.mqh` SITE 7, INSERT AFTER 226, BEFORE 227

```text

NO BRACE IS INSERTED.

Whitespace reference: line 226, LEADING SPACES 6.

LINES INSERTED: 7.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 6 | // [Task 155] Buffer 34 provenance capture. Site code 7. No orderblock
LEADING SPACES 6 | // object is in scope at this write, so no identity is recorded and the
LEADING SPACES 6 | // export emits the site sentinel -21.0.
LEADING SPACES 6 | Print("[SRJ][T155][OBPROV] code=7 id=0 bar=", i, " flag=true");
LEADING SPACES 6 | g_s.tickOBSetterId   = 0;
LEADING SPACES 6 | g_s.tickOBSetterCode = 7;
LEADING SPACES 6 | g_s.tickOBSetterBar  = i;

```

### EDIT 10 — `SRJ_BiasEngine.mqh` SITE 8, INSERT AFTER 280, BEFORE 281

```text

NO BRACE IS INSERTED.

Whitespace reference: line 280, LEADING SPACES 6.

LINES INSERTED: 6.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 6 | // [Task 155] Buffer 34 provenance capture. Site code 8. No object is
LEADING SPACES 6 | // in scope; the export emits the site sentinel -22.0.
LEADING SPACES 6 | Print("[SRJ][T155][OBPROV] code=8 id=0 bar=", i, " flag=true");
LEADING SPACES 6 | g_s.tickOBSetterId   = 0;
LEADING SPACES 6 | g_s.tickOBSetterCode = 8;
LEADING SPACES 6 | g_s.tickOBSetterBar  = i;

```

### EDIT 11 — `SRJ_FlowLogic.mq5` LINE 8, MODIFY

```text

THE ONLY MODIFICATION IN THIS TASK. Two operations on line 8, in this order. Do not
retype any existing character of line 8.

11.1  Replace the two characters at columns 29 and 30, which G1 has already measured as
      the single whole-token 34, with the two characters 37. Change nothing else on the
      line.

11.2  Append to the END of line 8 one space character followed by exactly this text:

[Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred).

DECLARED, DELIBERATE PATTERN MISMATCH, stated at authorship and not a decision you make:
the existing comment chain on line 8 lists the newest task FIRST. This edit appends the
new entry LAST. Grounds: appending is a byte-mechanical operation on the existing line,
whereas prepending would require rewriting the whole line and would put a transcription
of existing production text back into production source. The tag form
"[Task NN] Was X. Added ..." IS matched.

LINE 9 IS NOT EDITED. Stated explicitly. The plots count stays at 2. All three new
buffers register as INDICATOR_CALCULATIONS, which is EA-reachable.

Report line 8 verbatim BEFORE the modification and verbatim AFTER it. Unit 8.4(i)
measures the result.

LINES INSERTED: 0.   BRACES ADDED: 0 open, 0 close.   LINE DELTA CONTRIBUTION: 0.

```

### EDIT 12 — `SRJ_FlowLogic.mq5`, INSERT AFTER 117, BEFORE 118

```text

Whitespace reference: line 117, LEADING SPACES 0.

LINES INSERTED: 3.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 0 | double g_bufOBValidProv[];    // [Task 155] Buffer 34. Provenance of the tickOBIsValid value exported at the flag export block. Initialised to EMPTY_VALUE, not 0.0: 0.0 is spoken for by this file's two objId buffers as "no object selected", and EMPTY_VALUE keeps this buffer uncomputed in exactly the bars where g_bufOBValid is uncomputed.
LEADING SPACES 0 | double g_bufFVGValidProv[];   // [Task 155] Buffer 35. Registered now, population deferred to Task 156. Same EMPTY_VALUE rationale as buffer 34.
LEADING SPACES 0 | double g_bufOppFVGProv[];     // [Task 155] Buffer 36. Registered now, population deferred to Task 163. Same EMPTY_VALUE rationale as buffer 34.

```

### EDIT 13 — `SRJ_FlowLogic.mq5`, INSERT AFTER 617, BEFORE 618

```text

P3a. Append only. No existing SetIndexBuffer line is touched.

Whitespace reference: line 617, LEADING SPACES 3.

LINES INSERTED: 3.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 3 | SetIndexBuffer(34, g_bufOBValidProv,  INDICATOR_CALCULATIONS);
LEADING SPACES 3 | SetIndexBuffer(35, g_bufFVGValidProv, INDICATOR_CALCULATIONS);
LEADING SPACES 3 | SetIndexBuffer(36, g_bufOppFVGProv,   INDICATOR_CALCULATIONS);

```

### EDIT 14 — `SRJ_FlowLogic.mq5`, INSERT AFTER 664, BEFORE 665

```text

Whitespace reference: line 664, LEADING SPACES 3.

LINES INSERTED: 3.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 3 | ArraySetAsSeries(g_bufOBValidProv,  false);
LEADING SPACES 3 | ArraySetAsSeries(g_bufFVGValidProv, false);
LEADING SPACES 3 | ArraySetAsSeries(g_bufOppFVGProv,   false);

```

### EDIT 15 — `SRJ_FlowLogic.mq5`, INSERT AFTER 797, BEFORE 798

```text

This insertion point is inside the full-recalculation block guarded by the
if(prevCalc == 0) line at 746, and BEFORE the SRJ_StateInit call at 800. The three
appended calls inherit that guard, which is what the initialisation ruling requires.

Whitespace reference: line 797, LEADING SPACES 6.

LINES INSERTED: 4.   BRACES ADDED: 0 open, 0 close.

LEADING SPACES 6 | // [Task 155] EMPTY_VALUE, not 0.0 - see the declaration comment.
LEADING SPACES 6 | ArrayInitialize(g_bufOBValidProv,  EMPTY_VALUE);
LEADING SPACES 6 | ArrayInitialize(g_bufFVGValidProv, EMPTY_VALUE);
LEADING SPACES 6 | ArrayInitialize(g_bufOppFVGProv,   EMPTY_VALUE);

DECLARED, DELIBERATE BYTE MISMATCH, stated at authorship: the tree's five existing
rationale comments in this block use a non-ASCII em dash byte sequence. The comment
above uses an ASCII hyphen-minus instead, because inserting a non-ASCII byte is
prohibited. The comment FORM is matched; the dash character is deliberately not. This
is not a deviation for you to report.

```

### EDIT 16 — `SRJ_FlowLogic.mq5`, INSERT AFTER 904, BEFORE 905

```text

This insertion point is inside the block that opens at 900 under the if(target >= 0)
line at 899, so the subscripted writes below are guarded exactly as the three existing
flag exports are.

Whitespace reference: line 902, LEADING SPACES 9. EVERY line of this edit, including
both braces, carries LEADING SPACES 9. The tree's own brace-at-column-9 style on line
900 is deliberately not matched, so that the whole edit sits on one pinned column and
nothing is derived.

LINES INSERTED: 49.   BRACES ADDED: 1 open, 1 close.

LEADING SPACES 9 | {
LEADING SPACES 9 | // [Task 155] BUFFER 34 CONTRACT.
LEADING SPACES 9 | // This buffer names the PROVENANCE of the g_s.tickOBIsValid value
LEADING SPACES 9 | // present at this export block on the exported bar, and nothing else.
LEADING SPACES 9 | // The indicator reads that flag elsewhere in the same bar with other
LEADING SPACES 9 | // values, so no claim about the weak-flip latch, the checklist, the
LEADING SPACES 9 | // decision block or the bias pane colour may be built on this buffer.
LEADING SPACES 9 | // CARRIED is derived by comparing the recorded setter bar against i,
LEADING SPACES 9 | // the processing bar of the enclosing loop. It is NEVER compared
LEADING SPACES 9 | // against target.
LEADING SPACES 9 | // VALUES
LEADING SPACES 9 | //   EMPTY_VALUE  outside the calculated window
LEADING SPACES 9 | //   greater than 0.0  objId of the LAST qualifying orderblock
LEADING SPACES 9 | //                invalidation on this bar, written this bar by site
LEADING SPACES 9 | //                code 1, 2, 3 or 4
LEADING SPACES 9 | //   -3.0         carried: the recorded setter bar is not i
LEADING SPACES 9 | //   -11.0        site 5, bullish FVG creation or renewal reset. An
LEADING SPACES 9 | //                object is in scope; the source names none
LEADING SPACES 9 | //   -12.0        site 6, bearish FVG creation or renewal reset
LEADING SPACES 9 | //   -21.0        site 7, decision block doRenewal. No object in scope
LEADING SPACES 9 | //   -22.0        site 8, decision block flip. No object in scope
LEADING SPACES 9 | //   -31.0        site 9, SRJ_StateInit default, no write since
LEADING SPACES 9 | //   -9.0         invariant violated: setter bar greater than i, objId
LEADING SPACES 9 | //                not positive at a named site, objId outside the exact
LEADING SPACES 9 | //                long-to-double range 9007199254740992, or a site code
LEADING SPACES 9 | //                outside this set
LEADING SPACES 9 | // Buffers 35 and 36 are REGISTERED here and receive the single
LEADING SPACES 9 | // explicit sentinel -99.0 meaning POPULATION DEFERRED: buffer 36 to
LEADING SPACES 9 | // Task 163, buffer 35 to Task 156. No consumer may read -99.0 as a
LEADING SPACES 9 | // provenance.
LEADING SPACES 9 | long   t155ProvId   = g_s.tickOBSetterId;
LEADING SPACES 9 | int    t155ProvCode = g_s.tickOBSetterCode;
LEADING SPACES 9 | int    t155ProvBar  = g_s.tickOBSetterBar;
LEADING SPACES 9 | double t155ProvOut  = -9.0;
LEADING SPACES 9 | if(t155ProvBar > i)                           t155ProvOut = -9.0;
LEADING SPACES 9 | else if(t155ProvCode == 9)                    t155ProvOut = -31.0;
LEADING SPACES 9 | else if(t155ProvBar != i)                     t155ProvOut = -3.0;
LEADING SPACES 9 | else if(t155ProvCode == 5)                    t155ProvOut = -11.0;
LEADING SPACES 9 | else if(t155ProvCode == 6)                    t155ProvOut = -12.0;
LEADING SPACES 9 | else if(t155ProvCode == 7)                    t155ProvOut = -21.0;
LEADING SPACES 9 | else if(t155ProvCode == 8)                    t155ProvOut = -22.0;
LEADING SPACES 9 | else if(t155ProvCode < 1 || t155ProvCode > 4) t155ProvOut = -9.0;
LEADING SPACES 9 | else if(t155ProvId <= 0)                      t155ProvOut = -9.0;
LEADING SPACES 9 | else if(t155ProvId > 9007199254740992)        t155ProvOut = -9.0;
LEADING SPACES 9 | else                                          t155ProvOut = (double)t155ProvId;
LEADING SPACES 9 | g_bufOBValidProv[target]  = t155ProvOut;
LEADING SPACES 9 | g_bufFVGValidProv[target] = -99.0;
LEADING SPACES 9 | g_bufOppFVGProv[target]   = -99.0;
LEADING SPACES 9 | }

```

## BLOCK 7 — DELTA DERIVATION (2 units)

```text

Both deltas are DERIVED FROM THIS FORM'S OWN LITERAL INSERTION TEXT, counted at
authorship. Neither is asserted from expectation. You do not recount this form. You
measure the FILES and compare against the figures below.

7.1 LINE DELTA. Derivation: the sum of the LINES INSERTED figure stated by each of this
    form's own edits, per file. EDIT 11 modifies an existing line and contributes 0.

      SRJ_State.mqh

        EDIT 1 = 10, EDIT 2 = 5                                    DELTA +15

        PRE-EDIT 501    POST-EDIT REQUIRED 516

      SRJ_OrderblockMgr.mqh

        EDIT 3 = 9, EDIT 4 = 8, EDIT 5 = 10, EDIT 6 = 8            DELTA +35

        PRE-EDIT 1104   POST-EDIT REQUIRED 1139

      SRJ_ImbalanceMgr.mqh

        EDIT 7 = 8, EDIT 8 = 6                                     DELTA +14

        PRE-EDIT 532    POST-EDIT REQUIRED 546

      SRJ_BiasEngine.mqh

        EDIT 9 = 7, EDIT 10 = 6                                    DELTA +13

        PRE-EDIT 386    POST-EDIT REQUIRED 399

      SRJ_FlowLogic.mq5

        EDIT 11 = 0, EDIT 12 = 3, EDIT 13 = 3, EDIT 14 = 3,

        EDIT 15 = 4, EDIT 16 = 49                                  DELTA +62

        PRE-EDIT 1180   POST-EDIT REQUIRED 1242

      SRJ_FlowNexus_EA.mq5

        NOT EDITED                                                 DELTA 0

        PRE-EDIT 3202   POST-EDIT REQUIRED 3202

      SRJ_Types.mqh

        NOT EDITED                                                 DELTA 0

        PRE-EDIT 355    POST-EDIT REQUIRED 355

    Re-measure ALL SEVEN line counts after the edits, per D10, with the SAME command
    used at unit 4.2, and paste its raw output. Seven files are measured, not five: the
    two unedited files' zero delta is a MEASUREMENT here, never an assumption.

    PASS if every one of the seven post-edit counts equals its POST-EDIT REQUIRED
    figure.

    BLOCKED WORDING: "LINE DELTA BLOCKED: file F post-edit line count is N, required R.
    The edit is applied and unverified. No compile performed."

    On this BLOCKED condition you do NOT compile, you do NOT revert, and you do NOT
    adjust any file to reach the figure. Write the BLOCKED report carrying every
    measured count and stop. Restoration is the council's decision, not yours.

7.2 BRACE DELTA, per D9, on the five edited files.

    Derivation: the brace-bearing insertions in this form are EDIT 3A and 3B, 4A and 4B,
    5A and 5B, and 6A and 6B, one open and one close brace each, all in
    SRJ_OrderblockMgr.mqh; and EDIT 16, one open and one close brace, in
    SRJ_FlowLogic.mq5. Every other edit in this form inserts zero brace characters, and
    no comment line or string literal inserted by this form contains a brace character.

      SRJ_OrderblockMgr.mqh   OPEN +4  CLOSE +4     121 / 121  ->  125 / 125

      SRJ_FlowLogic.mq5       OPEN +1  CLOSE +1      70 /  70  ->   71 /  71

      SRJ_State.mqh           OPEN  0  CLOSE  0       7 /   7  ->    7 /   7

      SRJ_ImbalanceMgr.mqh    OPEN  0  CLOSE  0      56 /  56  ->   56 /  56

      SRJ_BiasEngine.mqh      OPEN  0  CLOSE  0      34 /  34  ->   34 /  34

    Re-measure and paste the raw output.

    PASS if every one of the ten post-edit figures equals the figure above, and every
    one of the five files is brace-balanced, meaning its open count equals its close
    count.

    BLOCKED WORDING: "BRACE DELTA BLOCKED: file F post-edit brace census is X open /
    Y close, required A open / B close. The edit is applied and unverified. No compile
    performed."

    A file that is not brace-balanced is BLOCKED on the same terms and with the same
    prohibition on reverting or adjusting.

```

## BLOCK 8 — STAGES, COMPILE, VERIFICATION, REPORT FORMAT (6 units)

```text

8.1 STAGE SEQUENCE. Perform in this order. A BLOCKED condition at any stage stops the
    task at that stage; every stage completed to that point is reported.

      STAGE 0  Confirm the authorization token is present in this session's wrapper
               (unit 1.6). Confirm the full-run report destination is free (unit 1.1).
               Perform BLOCK 3 pre-flight pass 2 and record the three answers.

      STAGE 1  Units 4.1, 4.2, 4.3.

      STAGE 2  Unit 4.4, governed by unit 4.5. All 103 reads.

      STAGE 3  BLOCK 5. Gates G1 through G7.

      STAGE 4  BLOCK 6. Apply the twenty operations in the order at unit 6.0.

      STAGE 5  BLOCK 7, then unit 8.3.

      STAGE 6  Unit 8.2. Compile SRJ_FlowLogic.mq5.

      STAGE 7  Unit 8.4.

      STAGE 8  Write the report to the destination at unit 1.1, once, complete.

    NO EDIT IS APPLIED unless STAGE 0 through STAGE 3 are all clean. A BLOCKED condition
    in STAGE 0, 1, 2 or 3 means the canonical tree is byte-unchanged, and the report
    says so.

8.2 COMPILE. P7 and P10. Compile SRJ_FlowLogic.mq5 ONLY, from the command line, using
    metaeditor64.exe with a compile argument naming that one file and a log argument.
    NEVER open the file in the MetaEditor graphical interface (P11). Do not compile
    SRJ_FlowNexus_EA.mq5. Do not compile any .mqh.

    Paste the command issued and the compiler log's raw error and warning summary.
    Report the error count and the warning count as figures.

    PASS CONDITION: the reported error count is 0.

    BLOCKED WORDING: "COMPILE BLOCKED: N errors. The edit is applied and does not
    compile. Log pasted below. No further action taken." Do not revert. Do not attempt
    a fix.

    A non-zero WARNING count is NOT a BLOCKED condition. Report the count and paste the
    warning lines.

    Report the full path of MQL5\Indicators\SRJ_FlowLogic.ex5 and its post-compile
    timestamp. Do not hash it. Do not copy it (unit 1.4).

8.3 DIFF VERIFICATION. Verification is by DIFF against
    02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\, not by digest
    alone. Digest inequality proves only that something changed.

    Diff each of the five edited files against its BEFORE counterpart by shell command
    and paste the raw output. Five diffs, five pastes.

    PASS CONDITIONS:

      (a) every reported difference is an ADDED line, except SRJ_FlowLogic.mq5 line 8,
          which is the one CHANGED line this task authorizes;

      (b) no line is reported as DELETED in any of the five files;

      (c) no line other than SRJ_FlowLogic.mq5 line 8 is reported as CHANGED in any of
          the five files;

      (d) REPORTED AS ITS OWN NAMED RESULT, never folded into (a): SRJ_OrderblockMgr.mqh
          original lines 170, 171, 172, 173, 534, 535, 536 and 537 each appear as
          CONTEXT or UNCHANGED, and NONE of the eight appears as CHANGED or DELETED. The
          four inserted brace lines appear as ADDED. This is the check that would catch
          a reindentation.

    Any failure of (a) through (d) is BLOCKED. BLOCKED WORDING: "DIFF BLOCKED: file F
    reports a DELETED or unauthorized CHANGED line at L. The edit is applied and
    unverified." Do not revert.

    Then hash all seven canonical files again and paste the raw output. ASSERT:

      SRJ_FlowNexus_EA.mq5 digest EQUAL to its unit 4.1 value

      SRJ_Types.mqh        digest EQUAL to its unit 4.1 value

    Either NOT EQUAL is BLOCKED. The five edited files' digests necessarily differ; paste
    them for the record and assert nothing about them.

8.4 POST-EDIT SOURCE-PRESENCE MEASUREMENTS. Each is a count or a verbatim line. Report
    the figure. Do not adjust any file to reach an expected figure.

      (i)   SRJ_FlowLogic.mq5 line 8 verbatim. Count whole-token 37 occurrences and
            whole-token 34 occurrences per D1, and report the column of the 37.

            EXPECTED: one 37 at column 29; two 34, both inside the text appended by
            EDIT 11. A departure is reported and is BLOCKED.

      (ii)  SRJ_FlowLogic.mq5 line 9 verbatim. It must be byte-identical to its unit 4.4
            reading. A difference is BLOCKED.

      (iii) Count the string 9007199254740992 in each of the five edited files.

            EXPECTED: SRJ_State.mqh 1, SRJ_FlowLogic.mq5 2, the other three 0.

            A departure is reported and is BLOCKED.

      (iv)  Count the string [SRJ][T155][OBPROV] in each of the five edited files and
            report the total. EXPECTED: SRJ_OrderblockMgr.mqh 4, SRJ_ImbalanceMgr.mqh 2,
            SRJ_BiasEngine.mqh 2, SRJ_State.mqh 0, SRJ_FlowLogic.mq5 0, TOTAL 8.

            REPORT THE OBSERVED COUNT AND ADJUST NOTHING TO REACH EIGHT. A departure is
            reported and is BLOCKED.

      (v)   Count each of G7's ten identifiers per D1 in each of the five edited files.

            EXPECTED, stated so the figures can be checked and NOT as a BLOCKED
            condition:

              tickOBSetterId    State 2, OrderblockMgr 4, ImbalanceMgr 2,
                                BiasEngine 2, FlowLogic 1.  TOTAL 11

              tickOBSetterCode  same distribution.           TOTAL 11

              tickOBSetterBar   same distribution.           TOTAL 11

              g_bufOBValidProv  FlowLogic 5, others 0

              g_bufFVGValidProv FlowLogic 5, others 0

              g_bufOppFVGProv   FlowLogic 5, others 0

              t155ProvId        FlowLogic 4, others 0

              t155ProvCode      FlowLogic 8, others 0

              t155ProvBar       FlowLogic 3, others 0

              t155ProvOut       FlowLogic 13, others 0

            A departure is reported and is NOT BLOCKED. These are informational totals;
            the DIFF at unit 8.3 is the authority on what changed.

      (vi)  Non-ASCII byte scan of the five edited files: report, per file, the count of
            lines containing any byte greater than 0x7F, and list those line numbers.

            Informational. Not a BLOCKED condition. The DIFF is the authority.

8.5 PROHIBITED ACTIONS. None of the following is authorized by this form, and none is
    performed under any condition, including BLOCKED:

      no test run, no strategy-tester run, no backtest, no optimisation

      no chart attach of the indicator or of the EA

      no live trading, no demo trading, no order of any kind

      no compile of SRJ_FlowNexus_EA.mq5 and no compile of any .mqh

      no checkpoint copy, no AFTER folder, no snapshot, no manifest

      no revert, no restore, no rollback

      no file created anywhere except the three report destinations at unit 1.1

      no script, helper, module, temp file or persisted intermediate output; inline
        shell commands are permitted without limit

      no verification delegated to any other role

    The Tier 1 regression is a SEPARATE authorization and is not part of this task.

8.6 REPORT FORMAT. Write ONE file, ONCE, COMPLETE, to the destination at unit 1.1, at
    STAGE 8. Replace every angle-bracket token with its answer. A report containing an
    unreplaced token, or reproducing this form's rule text, item text or prohibition
    list, is a NON-RESPONSE.

      TASK 155 FORM B v4 PART 2 R1 - BUILDER RESULT

      STATUS: <COMPLETED or PARTIAL or BLOCKED or RELAY INCOMPLETE or DESTINATION MISSING>

      Invocation: <FULL RUN or PRE-FLIGHT ONLY>

      Authorization token observed: <the token text, or NONE>

      Reference documents loaded: <filenames, or none>

      Parts received: <count>   Continuation tokens observed: <list>

      Terminator token observed: <YES or NO>

      Stages completed: <list>

      Canonical tree modified: <YES or NO>

      Compile performed: <YES or NO>

      PRE-FLIGHT PASS 2

        Q1 <YES or NO> <if YES, block and unit>

        Q2 <YES or NO> <if YES, block, unit and path>

        Q3 <YES or NO> <if YES, block, unit, term or figure>

      STAGE 1 BASELINE

        <raw digest output, seven canonical files>

        <raw digest output, seven BEFORE files>

        <fourteen EQUAL or NOT EQUAL results>

        <raw line-count output, seven files, and seven EQUAL or NOT EQUAL results>

        <raw brace-census output, five files, and five EQUAL or NOT EQUAL results>

      STAGE 2 PRE-INSERT READS

        <one table, 103 rows, in the order listed at unit 4.4. Columns: FILE, LINE,
         CLASS, VERBATIM TEXT, COLUMN, LEADING SPACES, RESULT PASS or BLOCKED with the
         failing token or condition named. Each of the 103 lines appears exactly once in
         this report and nowhere else in it.>

        READS PERFORMED: <count out of 103>

        ASSERTION FAILURES: <count>

      STAGE 3 RE-GATES

        G1 <measured count and column> <PASS or the BLOCKED wording>

        G2 <results for checks a through f> <PASS or the BLOCKED wording>

        G3 <results for checks a through f> <PASS or the BLOCKED wording>

        G4 <result per site, four sites> <PASS or the BLOCKED wording>

        G5 <result per site, four sites> <PASS or the BLOCKED wording>

        G6 <count of EQUAL out of 14> <PASS or the BLOCKED wording>

        G7 <fifty figures> <PASS or the BLOCKED wording>

      STAGE 4 EDITS APPLIED

        <one row per operation, twenty rows, in the order at unit 6.0. Columns:
         OPERATION, FILE, INSERT AFTER line or MODIFY, LINES INSERTED, APPLIED YES or NO>

        EDIT 11 line 8 BEFORE: <verbatim>

        EDIT 11 line 8 AFTER:  <verbatim>

      STAGE 5 DELTAS AND DIFF

        <raw post-edit line-count output, seven files>

        <per file: measured, required, PASS or the BLOCKED wording>

        <raw post-edit brace-census output, five files>

        <per file: measured, required, PASS or the BLOCKED wording>

        <five raw diff outputs, one per edited file>

        <results for conditions a, b, c>

        <result for condition d, named separately>

        <raw post-edit digest output, seven files>

        <SRJ_FlowNexus_EA.mq5 EQUAL or NOT EQUAL> <SRJ_Types.mqh EQUAL or NOT EQUAL>

      STAGE 6 COMPILE

        <command issued>

        <raw error and warning summary>

        ERRORS: <count>   WARNINGS: <count>

        <warning lines, or NONE>

        .ex5 path: <full path>   timestamp: <value>

      STAGE 7 SOURCE-PRESENCE

        (i)   <line 8 verbatim, 37 count, 34 count, column of 37> <result>

        (ii)  <line 9 verbatim> <byte-identical YES or NO>

        (iii) <five counts> <result>

        (iv)  <five counts and total> <result>

        (v)   <ten identifier count sets> <informational>

        (vi)  <per-file non-ASCII line counts and line numbers> <informational>

      DEVIATIONS

        <numbered list per D11, each naming the block and unit where it occurred, every
         failed command and every correction; or the single line NONE>

      REPORT

        Path written: <full path>

        Line count of this report: <count>

END-OF-TASK-155-V4-PART2-R1

```
