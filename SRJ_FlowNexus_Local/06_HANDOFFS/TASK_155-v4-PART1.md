TASK 155 - FORM B v4, PART 1 OF 2. READ-ONLY BASELINE AND PRE-INSERT READS.

Buffer 34 export stage: tickOBIsValid provenance.

Implementer: MECHANICAL BUILDER, or FALLBACK BUILDER, under R-20.

SUPERSEDES Form B v3 in its entirety. v3 was BLOCKED at pre-flight Q3. v2 was

BLOCKED at its item 1.7. v1 was BLOCKED at pre-flight and never issued.

NO FILE HAS BEEN MODIFIED BY ANY VERSION OF THIS TASK.

WHAT THIS PART DOES, AND WHAT IT DOES NOT.

  THIS PART MAKES NO EDIT, RUNS NO COMPILER, AND PRODUCES NO .ex5.

  It establishes a rollback baseline and reports source lines verbatim.

  It RESOLVES NOTHING and SELECTS NOTHING. Where a previous version asked you to

  decide which parameter is a bar identifier, or which of two branches applies, this

  part asks you to report the FULL list and let the council decide. That is not a

  courtesy: your report is the sole input to PART 2, which will contain the council's

  decisions as literal text with no tokens and no branches left in it.

  Every term this part requires you to apply is DEFINED IN THIS DOCUMENT, in the

  DEFINITIONS BLOCK below. No rule name, prohibition tag or figure is used here whose

  operative content is not stated here. If you find one, that is a legitimate

  pre-flight YES on Q3 - report it.

  Every figure this part requires is consumed either by a gate stated here or by

  PART 2's authorship. Nothing is requested for the record alone.

STATUS: NOT AUTHORIZED. You may read this document and perform its PRE-FLIGHT BLOCK.

NOTHING ELSE PROCEEDS until the pre-flight returns three NOs AND the council

authorizes PART 1 in writing in this session. If you reach STAGE 0 without that

authorization present, report NOT AUTHORIZED and STOP.

RELAY INTEGRITY. Unit counts:

      PRE-FLIGHT   3 questions

      STAGE 0      5 steps

      STAGE 1     13 reads

      STAGE 2      1 report

    Declared total: 3 + 5 + 13 + 1 = 22 units.

    The final line is the token END-OF-TASK-155-V4-PART1.

    If that token is absent from the text you received, or any stage's unit count does

    not match, report RELAY INCOMPLETE, name the last unit received in full, and STOP.

    This is not a PARTIAL.

CANONICAL SCOPE.

  NO FILE IN THE CANONICAL TREE IS MODIFIED BY THIS PART. Specifically, no file under

  MQ\Experts\, MQ\Indicators\ or MQ\Include\ is created, modified, renamed or deleted.

  You WRITE only under MQ\SRJ_FlowNexus_Local\, and only these:

      the REPORT DESTINATION named below

      CP\BEFORE\ and its seven copies

      CP\MANIFEST.txt

  NO COMPILE. NO .ex5 IS PRODUCED OR EXPECTED IN THIS PART.

READ METHOD. Read every file by shell command. DO NOT OPEN ANY CANONICAL FILE IN

  METAEDITOR at any point, for any reason.

REFERENCE MATERIAL. You may consult language reference material. You may NOT load any

  prior revision, prior builder result, prior version of this task, or any project

  document other than this document as a standing instruction. No figure from any

  earlier session is an anchor. Every line, column, count and identifier this part

  reports is read in THIS session from the canonical tree.

ENCODING. This tree carries the three-byte sequence 0xE2 0x80 0x94 inside comments.

  This part writes nothing to the canonical tree, so no byte can change there. Where

  you paste a source line, paste it from command output without retyping it.

NO-SELF-CERTIFICATION. Report what you read and what you measured. Do NOT state that

  this task is verified, complete, conformant or correct, and do NOT state that PART 2

  may proceed. That determination is the council's.

BUILDER DISCRETION. You do not choose an approach, propose an alternative, or ask the

  council a question. Legal statuses: COMPLETED, BLOCKED, PARTIAL, RELAY INCOMPLETE,

  NOT AUTHORIZED. Anything else is a NON-RESPONSE and carries no weight.

  EVERY status is written to the REPORT DESTINATION before this session ends, once,

  complete, carrying every step you performed and every figure you derived. A BLOCKED

  report is not a stub and is not optional.

READ-STAGE COMPLETION. STAGE 1 has NO internal stopping condition. Perform all

  thirteen reads even where one of them deviates from what this document describes.

  Where a read deviates, report it in place, on its own line, prefixed DEVIATION, and

  CONTINUE to the next read. A deviation in one read never suppresses another. Only

  item 0.2 or item 0.3 can stop this part early, because either invalidates the

  baseline that every other figure rests on.

MQ = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5

CP = MQ\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34

SNAP = MQ\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT

REPORT DESTINATION: MQ\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-PART1.md

  This write is AUTHORIZED. Written ONCE, COMPLETE. Never a stub.

  Do NOT write to BUILDER_RESULT_155.md. That filename is reserved for PART 2.

SUPPLIED VALUES, so every comparison in STAGE 0 is mechanical:

  EA .mq5 SHA256

    0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322

  FlowLogic .mq5 SHA256

    d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5

  Line counts: EA 3202, FlowLogic 1180, SRJ_State.mqh 501.

============================= DEFINITIONS BLOCK =============================

Five definitions. Every one of them is applied somewhere below, and nothing below

applies any term not defined here.

D1  WHOLE TOKEN. A match of a text T inside a line is a WHOLE TOKEN match when the

    character immediately before the match and the character immediately after the

    match are each either absent, because the match is at the start or end of the

    line, or are NOT one of: the letters A to Z, the letters a to z, the digits 0 to

    9, the underscore character.

D2  STRIPPED. To STRIP a line: first, if the line contains the double-quote

    character, do not strip it - report DEVIATION: QUOTE ON LINE <n> and report the

    line verbatim instead. Otherwise, find the first occurrence of two consecutive

    forward-slash characters; if one exists, discard it and every character after it

    on that line. Then remove all leading and trailing space and tab characters. The

    result is the STRIPPED line.

D3  COLUMN. The COLUMN of a line is the 1-based index of its first character that is

    neither a space nor a tab. A line consisting only of spaces and tabs, or an empty

    line, has COLUMN reported as NONE.

D4  PARAMETER LIST DELIMITATION AND SPLITTING. Given a HEADER LINE H:

    (a) The list OPENS at the first open-parenthesis character on line H. Report its

        line and column.

    (b) Scanning forward from that opener, character by character, across as many

        lines as needed, maintain a depth that starts at 1, increases by 1 at each

        open parenthesis and decreases by 1 at each close parenthesis. The list

        CLOSES at the character where the depth first reaches 0. Report its line and

        column as PARAM LIST CLOSES. If depth does not reach 0 within 40 lines of H,

        report DEVIATION: PARAM LIST UNCLOSED and skip parts (c) to (h).

    (c) If any line from H to the closing line inclusive contains a double-quote

        character, report DEVIATION: PARAM LIST CONTAINS A QUOTE, paste those lines

        verbatim, and skip parts (d) to (h).

    (d) The PARAMETER LIST TEXT is every character strictly between the opener and

        the closer. Before joining, remove from each line any occurrence of two

        consecutive forward slashes and everything after it on that line. Join the

        remaining fragments with a single space character between fragments from

        different lines. Paste the resulting PARAMETER LIST TEXT verbatim.

    (e) If the parameter list text contains a less-than or a greater-than character,

        report DEVIATION: ANGLE BRACKET IN PARAM LIST and skip parts (f) to (h).

    (f) SPLIT the parameter list text at every comma character whose parenthesis

        depth, counted from the start of the parameter list text, is 0. The results

        are the PARTS, numbered from POSITION 1 in left-to-right order. If there is

        exactly one part and that part stripped of spaces and tabs is empty, or is

        the whole-token void per D1, then ARG COUNT is 0 and there are no positions.

    (g) ARG COUNT is the number of parts.

    (h) The VARIABLE NAME of a part: take the part; remove all leading and trailing

        space and tab characters; if it contains an equals character, discard that

        character and everything after it and remove trailing spaces and tabs again;

        if it now ends in an open-square-bracket followed by a close-square-bracket,

        discard those two characters and remove trailing spaces and tabs again; the

        VARIABLE NAME is the LAST maximal run of characters drawn from the letters A

        to Z, the letters a to z, the digits 0 to 9 and the underscore character, in

        what remains. If no such run exists, report the variable name as NONE.

    REPORT FORMAT, one line per part:

      <position> | <part text verbatim> | <variable name>

    followed by a line reading  ARG COUNT <n>.

D5  UPWARD HEADER WINDOW for a target line N in a named file. Scan upward from line

    N minus 1 toward line N minus 400, stopping at line 1 if reached. The CANDIDATE

    HEADER is the FIRST line L encountered in that upward scan for which ALL FOUR of

    the following hold:

      (i)   L's COLUMN per D3 is 1.

      (ii)  L STRIPPED per D2 contains an open-parenthesis character.

      (iii) L STRIPPED does not begin with a hash character, does not begin with two

            consecutive forward slashes, and does not begin with a forward slash

            followed by an asterisk.

      (iv)  L STRIPPED does not begin with any of these WHOLE TOKENS per D1: if, for,

            while, switch, else, return, do, case, catch.

    Report the candidate's line number and paste line L verbatim with its COLUMN.

    Then paste EVERY line from L through N minus 1 inclusive, verbatim, each with its

    line number and COLUMN.

    If no candidate is found within the window, report NO CANDIDATE HEADER WITHIN

    WINDOW and paste the 40 lines immediately above N instead.

    D5 is a REPORTING procedure. It concludes nothing about what the function is or

    does.

=============================================================================

=============================== PRE-FLIGHT BLOCK ===============================

3 QUESTIONS. Answer from THIS DOCUMENT'S TEXT ONLY, before reading any canonical

file. You may read directory listings only, to answer Q2. Report each as YES or NO

with your reason.

  Q1  Does this document contain an instruction whose result is not mechanically

      checkable?

  Q2  Does it modify any file in the canonical tree, or write outside

      MQ\SRJ_FlowNexus_Local\?

  Q3  Does it require you to apply a term, rule, prohibition or figure whose

      operative content is not stated in this document?

Any YES is BLOCKED. Report BLOCKED, name the question, quote the instruction at

issue, write the BLOCKED report to the REPORT DESTINATION, and STOP. Do not

reconcile, do not substitute, do not proceed. If a YES is partly right and partly

wrong, that is still a YES and still a full stop - you do not weigh which part

matters. That is the council's.

Three NOs releases STAGE 0 only if the council has authorized PART 1 in writing.

You do not rule. You do not author. You do not authorize.

================================================================================

STAGE 0 - BASELINE AND ROLLBACK COPY. 5 STEPS.

0.1  Establish CP\BEFORE\ by the first branch that applies, and report which.

       BRANCH EXISTING - CP\BEFORE\ already exists and contains all seven files named

         below. Copy nothing. Proceed to 0.2, which re-verifies them.

       BRANCH SNAP - CP\BEFORE\ does not exist or is incomplete, and SNAP contains all

         seven. Copy the seven from SNAP into CP\BEFORE\.

       BRANCH DIRECT - neither of the above. Copy the seven from the canonical tree.

     The seven:

       MQ\Experts\SRJ_FlowNexus_EA.mq5

       MQ\Indicators\SRJ_FlowLogic.mq5

       MQ\Include\SRJ\SRJ_State.mqh

       MQ\Include\SRJ\SRJ_OrderblockMgr.mqh

       MQ\Include\SRJ\SRJ_ImbalanceMgr.mqh

       MQ\Include\SRJ\SRJ_BiasEngine.mqh

       MQ\Include\SRJ\SRJ_Types.mqh

     Any file with the extension .ex5 present in SNAP or CP\BEFORE\ is ignored

     entirely: never copied, never hashed, never counted, never restored.

0.2  Run certutil -hashfile SHA256 on the seven files in CP\BEFORE\ AND on the same

     seven in the canonical tree. Paste RAW output for all fourteen. Record them in

     CP\MANIFEST.txt together with the two supplied digests and three supplied line

     counts. If CP\MANIFEST.txt already exists, append a new dated section; do not

     overwrite it.

     If any BEFORE hash differs from its canonical counterpart, report SNAPSHOT

     DIVERGENT with both values, write the report, and STOP.

0.3  Compare the canonical EA and FlowLogic digests to the two supplied values.

     If either MISMATCHES, report STASIS BROKEN with both values, write the report,

     and STOP.

0.4  Report the Get-Content line count of each of the seven files. Compare the three

     you have supplied values for and report MATCH or MISMATCH per file. A MISMATCH

     here is a DEVIATION, not a stop.

0.5  BRACE CENSUS. For each of the five files PART 2 will edit - SRJ_State.mqh,

     SRJ_OrderblockMgr.mqh, SRJ_ImbalanceMgr.mqh, SRJ_BiasEngine.mqh,

     SRJ_FlowLogic.mq5 - count the total number of open-brace characters and the

     total number of close-brace characters in the whole file. Report both integers

     per file. PART 2 consumes these as its pre-edit brace baseline.

STAGE 1 - READS. 13 READS. NO EDIT. NO COMPILE. NO INTERNAL STOP.

For every line you report, paste it verbatim from command output without retyping it,

and give its line number and its COLUMN per D3. Where a check is named, report PASS

or FAIL and, on FAIL, paste the offending text and prefix the line DEVIATION. A FAIL

does not stop this stage.

1.1  SRJ_FlowLogic.mq5 - report verbatim with columns: 8, 9, 117, 118, 617, 618, 664,

     665, 746, 747, 753, 793, 797, 798, 799, 800, 819, 866, 888, 889, 898, 899, 900,

     902, 903, 904, 905, 954, 966.

     Then report these five checks:

       (a) each of 117, 617, 664 and 797 STRIPPED ends in a semicolon.

       (b) 746 contains the whole token if and the whole token prevCalc.

       (c) 800 contains the whole token SRJ_StateInit.

       (d) 819 contains the whole token for.

       (e) 900 STRIPPED is a single open-brace character and nothing else.

1.2  SRJ_State.mqh - report verbatim with columns: 96, 97, 126, 127, 128, 245, 246,

     247, 249, 326, 327, 328, 329, 330.

     Then report these three checks:

       (a) 246 STRIPPED ends in a semicolon.

       (b) 247 STRIPPED is a close-brace character followed by a semicolon.

       (c) 327 contains the whole token tickOBIsValid.

1.3  SRJ_OrderblockMgr.mqh - report verbatim with columns EVERY line from 156 through

     180 inclusive. Additionally report line 89 verbatim with its column.

1.4  SRJ_OrderblockMgr.mqh - report verbatim with columns EVERY line from 520 through

     545 inclusive. Additionally report lines 413, 425, 480, 482, 494, 524, 570 and

     571 verbatim with columns.

1.5  Apply D5 with target line 171 in SRJ_OrderblockMgr.mqh. Report the candidate

     header line number and the full window. Then state whether that candidate line

     number is 89, is a different line, or was not found, using exactly one of:

       CANDIDATE IS 89

       CANDIDATE IS <n>, NOT 89

       NO CANDIDATE HEADER WITHIN WINDOW

     Then apply D4 to the candidate header and report the full parameter list in D4's

     report format. If the candidate is not 89, ALSO apply D4 to line 89 and report

     that parameter list too, labelled separately.

1.6  Apply D5 with target line 535 in SRJ_OrderblockMgr.mqh. Report the candidate

     header line number and the full window. Then state exactly one of:

       CANDIDATE IS 413

       CANDIDATE IS <n>, NOT 413

       NO CANDIDATE HEADER WITHIN WINDOW

     Then apply D4 to the candidate header and report the full parameter list. If the

     candidate is not 413, ALSO apply D4 to line 413 and report that list too,

     labelled separately.

1.7  SRJ_ImbalanceMgr.mqh - report verbatim with columns EVERY line from 205 through

     213 inclusive, then EVERY line from 322 through 330 inclusive.

     Then report whether line 209 contains the whole token tickOBIsValid, and whether

     line 326 does.

1.8  Apply D5 with target line 209 in SRJ_ImbalanceMgr.mqh, then apply D4 to the

     candidate header and report the full parameter list. Repeat both, separately and

     completely, with target line 326.

1.9  SRJ_BiasEngine.mqh - report verbatim with columns EVERY line from 222 through 230

     inclusive, then EVERY line from 276 through 284 inclusive.

     Then report whether line 226 contains the whole token tickOBIsValid, and whether

     line 280 does.

1.10 Apply D5 with target line 226 in SRJ_BiasEngine.mqh, then apply D4 to the

     candidate header and report the full parameter list. Repeat both, separately and

     completely, with target line 280.

1.11 BAR-CANDIDATE FLAGGING. For each of the six parameter lists you reported in items

     1.5, 1.6, 1.8 and 1.10 - and for any additional list you reported under 1.5 or

     1.6 because the candidate was not 89 or 413 - list every part whose VARIABLE NAME

     per D4(h), converted to lower case, either contains the three-character sequence

     bar or is exactly the single character i. Report each as

       <file> | <header line> | POSITION <n> | <variable name>

     If a list has no such part, report NONE FLAGGED for that list.

     DO NOT SELECT ONE. DO NOT CONCLUDE WHICH IS A BAR INDEX. DO NOT MARK ANY

     PARAMETER AS AN EVENT BAR OR A PROCESSING BAR. Report the flagged set and stop

     there. The council selects in PART 2.

1.12 BRANCH-FORM DETERMINATION. For EACH of the eight target lines - OrderblockMgr

     171, 173, 535, 537; ImbalanceMgr 209, 326; BiasEngine 226, 280 - derive the

     enclosing form by counting brace characters upward from the target line, never by

     indentation, and report exactly one of:

       BRANCH FORM: BRACED, enclosing brace [OPEN <n>, CLOSE <n>]

       BRANCH FORM: UNBRACED SINGLE STATEMENT, if-line <n>, else-line <n or NONE>

       BRANCH FORM: NOT A BRANCH, enclosing block [OPEN <n>, CLOSE <n>]

     Report all eight. Do not stop on any result. Do not add a brace to anything - this

     part writes nothing to the canonical tree.

1.13 TWO TEXT GATES.

     (a) LINE 8 TOKEN COUNT. In SRJ_FlowLogic.mq5 line 8, count WHOLE TOKEN per D1

         occurrences of the text 34. Report the integer and the 1-based column of each

         match.

     (b) UNBRACED PATTERN CHECK. Run these six checks TWICE: once over

         SRJ_OrderblockMgr.mqh lines 170, 171, 172, 173 as one window, and once over

         lines 534, 535, 536, 537 as a second window. Report each check PASS or FAIL

         per window with the offending text.

           (i)   The four lines together contain ZERO open-brace and ZERO close-brace

                 characters. Report both counts per window.

           (ii)  The four lines together contain no occurrence of a forward slash

                 followed by an asterisk, and none of an asterisk followed by a

                 forward slash.

           (iii) The FIRST line STRIPPED ends in a close parenthesis, and its count of

                 open parentheses equals its count of close parentheses.

           (iv)  The SECOND line STRIPPED ends in a semicolon and contains the whole

                 token tickOBIsValid and the whole token false.

           (v)   The THIRD line STRIPPED is exactly the whole token else and nothing

                 else.

           (vi)  The FOURTH line STRIPPED ends in a semicolon and contains the whole

                 token tickOBIsValid and the whole token true.

STAGE 2 - REPORT. 1 UNIT. Write to the REPORT DESTINATION, once, complete. This write

happens for EVERY status, including BLOCKED. Replace every angle-bracket token below

with its answer. Do not reproduce this document's definitions block or restrictions

checklist in the report.

TASK 155 PART 1: COMPLETED | BLOCKED | PARTIAL | RELAY INCOMPLETE | NOT AUTHORIZED

Form version: v4 PART 1

Relay check: <token PRESENT or ABSENT> | <unit counts received per stage> |

             <COUNT LINE CONSISTENT or INCONSISTENT with both figures>

Pre-flight: Q1 <YES or NO and reason> | Q2 <...> | Q3 <...>

Authorization in session: <quote the council's authorization, or NOT PRESENT>

Reference documents loaded: <every one by filename, or none>

Report destination: <the full path written>

Steps completed: <the highest item reached, and the item at which you stopped>

Files read: <every full path and the command used>

Files written: <report destination and every CP path. State NO CANONICAL FILE

               MODIFIED and NO COMPILE PERFORMED>

Snapshot branch: <BRANCH EXISTING, BRANCH SNAP or BRANCH DIRECT>

Baseline hashes: <raw certutil for all fourteen, and the two supplied comparisons>

Line counts: <all seven, and MATCH or MISMATCH for the three supplied>

Brace census: <per file, both characters, from item 0.5>

Item 1.1: <every line verbatim with column, then checks a to e>

Item 1.2: <every line verbatim with column, then checks a to c>

Item 1.3: <lines 156 to 180 and line 89, verbatim with columns>

Item 1.4: <lines 520 to 545 and the eight named lines, verbatim with columns>

Item 1.5: <candidate statement, full window, parameter list or lists in D4 format>

Item 1.6: <candidate statement, full window, parameter list or lists in D4 format>

Item 1.7: <both spans verbatim with columns, then both token checks>

Item 1.8: <both candidates, both windows, both parameter lists in D4 format>

Item 1.9: <both spans verbatim with columns, then both token checks>

Item 1.10: <both candidates, both windows, both parameter lists in D4 format>

Item 1.11: <every flagged part, or NONE FLAGGED per list. No selection made>

Item 1.12: <all eight branch forms>

Item 1.13: <token count and columns; then both windows, checks i to vi>

Deviations: <every DEVIATION line you reported, gathered in one list, or none>

Splits declared: <every part boundary, or none>

Commands that failed: <command as issued and raw error text, or none>

RESTRICTIONS CHECKLIST

- No file in the canonical tree created, modified, renamed or deleted. Writes confined

  to the report destination, CP\BEFORE\ and CP\MANIFEST.txt.

- No compile. No .ex5 produced. No test run, no backtest, no chart attach, no live

  trading.

- No canonical file opened in MetaEditor.

- No source line retyped. Every pasted line comes from command output.

- No parameter selected as a bar index. No branch chosen. No sentinel value assigned.

  No conclusion drawn about what any function does.

- No figure from any earlier session used as an anchor.

- Every read in STAGE 1 performed, including after a FAIL or a DEVIATION.

- The report is written to the report destination for every status, once, complete.

- BUILDER_RESULT_155.md is not written. That name is reserved for PART 2.

END-OF-TASK-155-V4-PART1
