TASK 155 - FORM B v3. PRODUCTION EDIT SPECIFICATION.

Buffer 34 export stage: tickOBIsValid provenance. Contract R-17 as amended, R-18, R-22.

Implementer: MECHANICAL BUILDER, or FALLBACK BUILDER (Cline Act + DeepSeek V4 Flash)

under R-20 when GLM quota is unavailable.

SUPERSEDES Form B v2, which was BLOCKED at item 1.7 by pre-flight-clean pass 2 after

STAGE 1. v1 was BLOCKED at pre-flight and never issued. NO FILE HAS BEEN MODIFIED BY

ANY VERSION OF THIS TASK.

WHAT CHANGED FROM v2, so you do not have to compare:

  Four write sites in SRJ_OrderblockMgr.mqh are UNBRACED single-statement if/else

  bodies. v2 blocked there, correctly. R-22 now instructs one brace pair around each

  of the four bodies, as literal insertion, gated by item 1.10.

  Every OrderblockMgr line number has been REMOVED from inserted comment text.

  STAGE 0 gains a brace census and an existing-BEFORE branch. STAGE 1 gains the

  pattern gate and a wider read window. STAGE 3 gains a brace-delta check.

  A BLOCKED or PARTIAL return is now WRITTEN TO THE REPORT DESTINATION.

STATUS: NOT AUTHORIZED. You may read this Form B and perform its PRE-FLIGHT BLOCK.

NO FILE MAY BE MODIFIED until the pre-flight returns three NOs AND the council

authorizes in writing in this session. If you reach STAGE 0 without that

authorization present, report NOT AUTHORIZED and STOP.

RELAY INTEGRITY. Unit counts:

      PRE-FLIGHT   3 questions

      STAGE 0      5 steps

      STAGE 1     10 reads

      STAGE 2     16 edits

      STAGE 3      8 checks

      STAGE 4      3 steps

      STAGE 5      1 report

    Declared total: 3 + 5 + 10 + 16 + 8 + 3 + 1 = 46 units.

    The final line is the token END-OF-TASK-155-V3.

    If that token is absent from the text you received, or any stage's unit count does

    not match, report RELAY INCOMPLETE, name the last unit received in full, and STOP.

    This is not a PARTIAL.

CANONICAL SCOPE. This is a PRODUCTION EDIT task and the first exception to the

  standing no-modify prohibition. You MAY modify exactly these five files:

      MQ\Include\SRJ\SRJ_State.mqh

      MQ\Include\SRJ\SRJ_OrderblockMgr.mqh

      MQ\Include\SRJ\SRJ_ImbalanceMgr.mqh

      MQ\Include\SRJ\SRJ_BiasEngine.mqh

      MQ\Indicators\SRJ_FlowLogic.mq5

  You may NOT modify any other file anywhere, including

  MQ\Experts\SRJ_FlowNexus_EA.mq5 and MQ\Include\SRJ\SRJ_Types.mqh.

  New files are written under MQ\SRJ_FlowNexus_Local\ only.

COMPILE ARTIFACT. The command-line compile at item 3.4 emits SRJ_FlowLogic.ex5 into

  MQ\Indicators\. That .ex5 is an EXPECTED artifact of a commanded step, is NOT a

  canonical-scope violation, is EXCLUDED from the DIFF scope check and from every

  byte-identity assertion. Report its full path and post-compile timestamp under

  "Files written". Do not copy it into CP\AFTER\. Do not hash it. Any .ex5 file found

  in SNAP or in CP\BEFORE\ is IGNORED: never hashed, never copied, never restored.

P11. Read every file by shell command. DO NOT OPEN ANY CANONICAL FILE IN METAEDITOR at

  any point, including to compile. Compile from the command line.

P17 DOES NOT APPLY TO AN APPROVED FORM B IMPLEMENTATION. You may consult language

  reference material. You may NOT load any prior revision, prior builder result, or

  any project document other than this Form B as a standing instruction. In

  particular, no figure from any earlier session is an anchor: every line, column,

  count and identifier this task uses is read in STAGE 1 of THIS session.

ENCODING. This tree carries the three-byte sequence 0xE2 0x80 0x94 inside comments -

  16 lines in SRJ_FlowLogic.mq5, 2 in SRJ_State.mqh, and an unscanned population in

  the other three files. Use an editing method that preserves bytes on every line this

  Form B does not name. Every line this Form B inserts is pure ASCII. Verification is

  by DIFF, not by digest alone. A change on any unnamed line is BLOCKED.

NO-SELF-CERTIFICATION. Report what you read, what you changed, and what the compiler

  said. Do NOT state that this task is verified, complete, conformant or correct. That

  determination is the council's.

BUILDER DISCRETION. You do not choose an approach, propose an alternative, or ask the

  council a question. Legal statuses: COMPLETED, BLOCKED, PARTIAL, RELAY INCOMPLETE,

  NOT AUTHORIZED. Anything else is a NON-RESPONSE and carries no weight.

  EVERY status is written to the REPORT DESTINATION before this session ends, once,

  complete, carrying every stage you completed and every figure you derived. A BLOCKED

  report is not a stub and is not optional.

MQ = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5

CP = MQ\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34

SNAP = MQ\SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT

REPORT DESTINATION: MQ\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155.md

  This write is AUTHORIZED. Written ONCE, COMPLETE. Never a stub.

SUPPLIED VALUES, so every comparison is mechanical:

  EA .mq5 SHA256

    0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322

  FlowLogic .mq5 SHA256

    d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5

  Line counts: EA 3202, FlowLogic 1180, SRJ_State.mqh 501.

  Safe integer range for long to double: magnitude at most 9007199254740992.

=============================== PRE-FLIGHT BLOCK ===============================

3 QUESTIONS. Answer from THIS FORM B'S TEXT ONLY, before reading any file for

editing. You may read directory listings only, to answer Q2. Report each as YES or NO

with your reason.

  Q1  Does this Form B contain an instruction whose result is not mechanically

      checkable?

  Q2  Does it touch a file outside the five-file minimum set stated above?

  Q3  Does it depend on a fact not present in a named accepted result?

Any YES is BLOCKED. Report BLOCKED, name the question, quote the instruction at issue,

and STOP. Do not reconcile, do not substitute, do not proceed.

Three NOs releases STAGE 0 only if the council has authorized in writing.

You do not rule. You do not author. You do not authorize.

================================================================================

STAGE 0 - ROLLBACK COPY AND BASELINE. 5 STEPS.

0.1  Establish CP\BEFORE\ by the first branch that applies, and report which.

       BRANCH EXISTING - CP\BEFORE\ already exists and contains all seven files

         named below. Copy nothing. Proceed to 0.2, which re-verifies them.

       BRANCH SNAP - CP\BEFORE\ does not exist or is incomplete, and SNAP contains

         all seven. Copy the seven from SNAP into CP\BEFORE\.

       BRANCH DIRECT - neither of the above. Copy the seven from the canonical tree.

     The seven:

       MQ\Experts\SRJ_FlowNexus_EA.mq5

       MQ\Indicators\SRJ_FlowLogic.mq5

       MQ\Include\SRJ\SRJ_State.mqh

       MQ\Include\SRJ\SRJ_OrderblockMgr.mqh

       MQ\Include\SRJ\SRJ_ImbalanceMgr.mqh

       MQ\Include\SRJ\SRJ_BiasEngine.mqh

       MQ\Include\SRJ\SRJ_Types.mqh

     Any .ex5 present in SNAP or CP\BEFORE\ is ignored entirely.

0.2  Run certutil -hashfile SHA256 on the seven files in CP\BEFORE\ AND on the same

     seven in the canonical tree. Paste RAW output for all fourteen. Record them in

     CP\MANIFEST.txt together with the two supplied digests and three supplied line

     counts. If CP\MANIFEST.txt already exists, append a new dated section; do not

     overwrite it.

     If any BEFORE hash differs from its canonical counterpart, report SNAPSHOT

     DIVERGENT with both values and STOP.

0.3  Compare the canonical EA and FlowLogic digests to the two supplied values.

     If either MISMATCHES, report STASIS BROKEN with both values and STOP. Modify

     nothing.

0.4  Record the Get-Content line count of each of the five files you will edit. These

     are your pre-edit line counts for item 3.2.

0.5  BRACE CENSUS. For each of the five files you will edit, count the total number of

     open-brace characters and the total number of close-brace characters in the whole

     file, and report both integers per file. These are your pre-edit brace counts for

     item 3.8.

STAGE 1 - PRE-INSERT READS. 10 READS. NO EDIT IN THIS STAGE.

This Form B does NOT supply the text to be matched. You READ each line from the

canonical file and REPORT it verbatim with the 1-based column of its first non-space

character. A mismatch between what you report and what this Form B describes is

BLOCKED, not a discrepancy to reconcile in place. Derive every brace stack by BRACE

COUNTING, never by indentation.

1.1  SRJ_FlowLogic.mq5 - report verbatim with columns: 8, 9, 117, 118, 617, 618, 664,

     665, 746, 747, 753, 793, 797, 798, 799, 800, 819, 866, 888, 889, 898, 899, 900,

     902, 903, 904, 905, 954, 966.

     Then report these five checks as PASS or FAIL with the offending text:

       (a) 117, 617, 664 and 797 each end in a semicolon.

       (b) 746 contains both "if" and "prevCalc".

       (c) 800 contains "SRJ_StateInit".

       (d) 819 contains the whole token "for".

       (e) 900 stripped of whitespace is a single open-brace character.

     ANY FAIL is BLOCKED. Report BLOCKED - FLOWLOGIC ANCHOR CHECK <letter>, and STOP.

1.2  SRJ_State.mqh - report verbatim with columns: 96, 97, 126, 127, 128, 245, 246,

     247, 249, 326, 327, 328, 329, 330.

     Then report as PASS or FAIL:

       (a) 246 ends in a semicolon.

       (b) 247 stripped of whitespace is a close brace followed by a semicolon.

       (c) 327 contains "tickOBIsValid".

     ANY FAIL is BLOCKED. Report BLOCKED - STATE ANCHOR CHECK <letter>, and STOP.

1.3  SRJ_OrderblockMgr.mqh REGION 1 - report verbatim with columns every line from 156

     through 180 inclusive.

     From the function header at 89 and its parameter list, report EVERY parameter as

     <position> | <parameter text> | <variable name>, with an ARG COUNT. Report the

     header line 89 verbatim with its column.

1.4  SRJ_OrderblockMgr.mqh REGION 2 - report verbatim with columns every line from 520

     through 545 inclusive, and additionally 413, 425, 480, 482, 494, 524, 570, 571.

     From the function header at 413 and its parameter list, report EVERY parameter as

     in 1.3, with an ARG COUNT.

1.5  SRJ_ImbalanceMgr.mqh - report verbatim with columns 205 through 213 inclusive,

     then 322 through 330 inclusive. Report the enclosing function of 209 and of 326

     by the definition-header rule, each as

       HEADER <n> | PARAM LIST CLOSES <n> | OPENING BRACE <n> | CLOSING BRACE <n> |

       BODY LINES <n> | HEADER-INCLUSIVE LINES <n>

     and report EVERY parameter of each header with an ARG COUNT.

     Report as PASS or FAIL that 209 and 326 each contain "tickOBIsValid". A FAIL is

     BLOCKED.

1.6  SRJ_BiasEngine.mqh - report verbatim with columns 222 through 230 inclusive, then

     276 through 284 inclusive. Report the enclosing function of 226 and of 280 in the

     same six-field form, and EVERY parameter of each header with an ARG COUNT.

     Report as PASS or FAIL that 226 and 280 each contain "tickOBIsValid". A FAIL is

     BLOCKED.

1.7  BRANCH-FORM DETERMINATION. For EACH of the eight write sites - OrderblockMgr 171,

     173, 535, 537; ImbalanceMgr 209, 326; BiasEngine 226, 280 - derive by BRACE

     COUNTING from the write line upward and report exactly one of:

       BRANCH FORM: BRACED, enclosing brace [OPEN <n>, CLOSE <n>]

       BRANCH FORM: UNBRACED SINGLE STATEMENT, if-line <n>, else-line <n or NONE>

       BRANCH FORM: NOT A BRANCH, enclosing block [OPEN <n>, CLOSE <n>]

     EXPECTED, and each is gated:

       171, 173, 535, 537 - UNBRACED SINGLE STATEMENT. Any other return here is

         BLOCKED: report BLOCKED - BRANCH FORM CHANGED AT SITE <n> with the form you

         found, and STOP. R-22's brace instruction is written for the unbraced shape

         only and is wrong for any other.

       209, 326, 226, 280 - NOT A BRANCH. Any UNBRACED SINGLE STATEMENT here is

         BLOCKED: report BLOCKED - UNBRACED SITE OUTSIDE R-22 SCOPE, name the site,

         and STOP. DO NOT ADD BRACES THERE. The council re-rules.

1.8  BAR-IDENTIFIER DETERMINATION.

     (a) From 1.3's parameter list, report the parameter NAME at POSITION 6. This is

         <BARP6>, the PROCESSING bar. Also report POSITION 5's name and mark it

         EVENT BAR - NOT RECORDED.

     (b) From 1.4's parameter list, report the parameter NAME at POSITION 7. This is

         <BARP7>.

     (c) For ImbalanceMgr 209, ImbalanceMgr 326, BiasEngine 226 and BiasEngine 280,

         from 1.5's and 1.6's parameter lists ONLY, report per site either

           BAR IDENTIFIER IN SCOPE: <name>, parameter position <n>

         or

           NO BAR IDENTIFIER IN SCOPE

         Do not infer from a comment. Do not use a global. Do not search beyond the

         parameter lists you reported. Report per site BRANCH A (identifier in scope)

         or BRANCH B (none).

1.9  LINE 8 TOKEN GUARD. In SRJ_FlowLogic.mq5 line 8, count occurrences of the WHOLE

     TOKEN 34 - the character before and after each match must be absent or

     non-identifier. Report the integer count and the 1-based column of each match.

     If the count is not exactly 1, report BLOCKED - LINE 8 TOKEN COUNT <n>, and STOP.

1.10 UNBRACED PATTERN GATE, per R-22(v). Run these six checks TWICE: once over

     SRJ_OrderblockMgr.mqh lines 170, 171, 172, 173, and once over lines 534, 535,

     536, 537. Report each check PASS or FAIL per window, with the offending text.

       (a) The four lines together contain ZERO open-brace and ZERO close-brace

           characters. Report both counts.

       (b) The four lines together contain no block-comment opener and no block-comment

           closer.

       (c) The FIRST line, with any trailing line-comment removed and trailing

           whitespace stripped, ends in a close parenthesis, and its count of open

           parentheses equals its count of close parentheses.

       (d) The SECOND line, stripped, ends in a semicolon and contains both

           "tickOBIsValid" and the whole token "false".

       (e) The THIRD line, with any trailing line-comment removed and stripped, is

           exactly the whole token "else" and nothing else.

       (f) The FOURTH line, stripped, ends in a semicolon and contains both

           "tickOBIsValid" and the whole token "true".

     ANY FAIL in either window is BLOCKED. Report BLOCKED - PATTERN GATE <letter> AT

     WINDOW <first line number>, quote the line, and STOP. Do not add braces. Do not

     proceed. The council re-rules.

STAGE 2 - THE EDITS. 16 EDITS.

WHITESPACE RULE, BINDING FOR EVERY LINE. Every literal line below is named with a

  WHITESPACE REFERENCE. The line you write is: the leading whitespace of that

  reference line exactly as you reported it in STAGE 1, followed by the literal line

  as shown here INCLUDING any leading spaces shown here. Nothing else.

SUBSTITUTION RULE. Six tokens appear in the literal text: <BARP6>, <BARP7>, <BAR5>,

  <BAR6>, <BAR7>, <BAR8>. Each is replaced by the exact identifier text you reported

  in the named STAGE 1 item. This is a text copy. Do not abbreviate, requalify or

  prefix it. Report every substitution as

  <token> RESOLVED TO <identifier> FROM ITEM <n>.

APPLY INSERTION POINTS IN DESCENDING LINE ORDER WITHIN EACH FILE so lower line numbers

  stay valid. For SRJ_OrderblockMgr.mqh the order is exactly:

  after 537, after 536, after 535, after 534, after 173, after 172, after 171,

  after 170. State the application order you used per file.

APPEND ONLY, except EDIT 11 which is the single MODIFY in this task. P3a: no existing

  SetIndexBuffer line is modified, reordered or deleted. Do not reformat, realign or

  reflow any existing line. Do not touch FlowLogic line 9. The four brace lines added

  in EDITS 3 to 6 are INSERTIONS; the lines they surround are not modified.

SITE CODE TABLE, fixed:

  1  SRJ_OrderblockMgr.mqh 171   replay path, in-bias, false

  2  SRJ_OrderblockMgr.mqh 173   replay path, else, true

  3  SRJ_OrderblockMgr.mqh 535   activation/invalidation pass, in-bias, false

  4  SRJ_OrderblockMgr.mqh 537   activation/invalidation pass, else, true

  5  SRJ_ImbalanceMgr.mqh  209   FVG creation/renewal, bullish

  6  SRJ_ImbalanceMgr.mqh  326   FVG creation/renewal, bearish

  7  SRJ_BiasEngine.mqh    226   decision block, doRenewal

  8  SRJ_BiasEngine.mqh    280   decision block, flip

  9  SRJ_State.mqh         327   SRJ_StateInit default

-------------------------------------------------------------------------------

EDIT 1 - SRJ_State.mqh. INSERT AFTER LINE 246, BEFORE LINE 247.

WHITESPACE REFERENCE, all nine lines: line 246.

// [Task 155] tickOBIsValid provenance transport. Buffer 34. The value contract

// lives at the export block in SRJ_FlowLogic.mq5. tickOBSetterId is the FIRST

// long field in SState. long is required because objId is declared long in

// SRJ_Types.mqh, and truncating it would make buffer 34's identity unverifiable

// against the object it names. The exact safe integer range for long to double

// conversion is 9007199254740992, and the export asserts it.

long     tickOBSetterId;

int      tickOBSetterCode;

int      tickOBSetterBar;

-------------------------------------------------------------------------------

EDIT 2 - SRJ_State.mqh. INSERT IMMEDIATELY AFTER LINE 327, per P5a.

WHITESPACE REFERENCE, all five lines: line 327. Do not modify 327, 328 or 329.

// [Task 155] provenance defaults. Site code 9 means StateInit default with no

// write since. Bar -1 means no bar context exists in this function.

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 9;

g_s.tickOBSetterBar  = -1;

-------------------------------------------------------------------------------

EDIT 3 - SRJ_OrderblockMgr.mqh, SITE CODE 1. TWO INSERTION POINTS.

Substitute <BARP6> from item 1.8(a).

3A  INSERT AFTER LINE 170, BEFORE LINE 171. WHITESPACE REFERENCE: line 170.

{

3B  INSERT AFTER LINE 171, BEFORE LINE 172.

    3B-i  WHITESPACE REFERENCE, all fourteen lines: line 171.

// [Task 155] tickOBIsValid provenance capture, site code 1. ob is a parameter of

// this function and is already dereferenced by the guards that admit this write,

// so it is the orderblock whose invalidation set the flag, and no null test is

// added here because one would be stricter than the code already executing.

// The recorded bar is the PROCESSING bar parameter. The EVENT bar parameter is

// NOT recorded: recording it would make the export's carried test report every

// replay write as carried.

// The if and else bodies of this construct were UNBRACED in the source. This task

// inserts one brace pair around each body and around nothing else. In this

// language if(C) S; and if(C) { S; } are the same statement and the else binds to

// the same if in both forms, so control flow is unchanged. No existing line was

// modified.

Print("[SRJ][T155][OBPROV] site=1 bar=", <BARP6>, " id=", ob.objId, " prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = ob.objId;

g_s.tickOBSetterCode = 1;

g_s.tickOBSetterBar  = <BARP6>;

    3B-ii WHITESPACE REFERENCE, this one line: line 170.

}

-------------------------------------------------------------------------------

EDIT 4 - SRJ_OrderblockMgr.mqh, SITE CODE 2. TWO INSERTION POINTS.

Substitute <BARP6> from item 1.8(a).

4A  INSERT AFTER LINE 172, BEFORE LINE 173. WHITESPACE REFERENCE: line 172.

{

4B  INSERT AFTER LINE 173, BEFORE LINE 174.

    4B-i  WHITESPACE REFERENCE, all eight lines: line 173.

// [Task 155] tickOBIsValid provenance capture, site code 2. ob is a parameter of

// this function and is already dereferenced by the guards that admit this write,

// so it is the orderblock whose invalidation set the flag. The recorded bar is

// the PROCESSING bar parameter. The EVENT bar parameter is NOT recorded.

Print("[SRJ][T155][OBPROV] site=2 bar=", <BARP6>, " id=", ob.objId, " prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = ob.objId;

g_s.tickOBSetterCode = 2;

g_s.tickOBSetterBar  = <BARP6>;

    4B-ii WHITESPACE REFERENCE, this one line: line 172.

}

-------------------------------------------------------------------------------

EDIT 5 - SRJ_OrderblockMgr.mqh, SITE CODE 3. TWO INSERTION POINTS.

Substitute <BARP7> from item 1.8(b).

5A  INSERT AFTER LINE 534, BEFORE LINE 535. WHITESPACE REFERENCE: line 534.

{

5B  INSERT AFTER LINE 535, BEFORE LINE 536.

    5B-i  WHITESPACE REFERENCE, all thirteen lines: line 535.

// [Task 155] tickOBIsValid provenance capture, site code 3. ob is named in a

// resolved guard header of this write's brace stack and is already dereferenced

// there, so no null test is added. This site executes inside the per-orderblock

// loop of this function, so several orderblocks may be invalidated on one bar and

// each overwrites this record. The exported value therefore names the LAST

// qualifying invalidation on the bar, in descending loop order. The overwritten

// events are carried by the Print below, which is unconditional and tagged, and

// no gate reads it.

// The if and else bodies of this construct were UNBRACED in the source. This task

// inserts one brace pair around each body and around nothing else, which is

// semantics-preserving in this language. No existing line was modified.

Print("[SRJ][T155][OBPROV] site=3 bar=", <BARP7>, " id=", ob.objId, " prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = ob.objId;

g_s.tickOBSetterCode = 3;

g_s.tickOBSetterBar  = <BARP7>;

    5B-ii WHITESPACE REFERENCE, this one line: line 534.

}

-------------------------------------------------------------------------------

EDIT 6 - SRJ_OrderblockMgr.mqh, SITE CODE 4. TWO INSERTION POINTS.

Substitute <BARP7> from item 1.8(b).

6A  INSERT AFTER LINE 536, BEFORE LINE 537. WHITESPACE REFERENCE: line 536.

{

6B  INSERT AFTER LINE 537, BEFORE LINE 538.

    6B-i  WHITESPACE REFERENCE, all eight lines: line 537.

// [Task 155] tickOBIsValid provenance capture, site code 4. ob is named in a

// resolved guard header of this write's brace stack. This site executes inside

// the per-orderblock loop of this function, so the exported value names the LAST

// qualifying invalidation on the bar, in descending loop order.

Print("[SRJ][T155][OBPROV] site=4 bar=", <BARP7>, " id=", ob.objId, " prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = ob.objId;

g_s.tickOBSetterCode = 4;

g_s.tickOBSetterBar  = <BARP7>;

    6B-ii WHITESPACE REFERENCE, this one line: line 536.

}

-------------------------------------------------------------------------------

EDIT 7 - SRJ_ImbalanceMgr.mqh. INSERT IMMEDIATELY AFTER LINE 209.

WHITESPACE REFERENCE, every line: line 209.

APPLY BRANCH A OR BRANCH B exactly as item 1.8(c) reported for this site. Report

which branch you applied. Item 1.7 must have returned NOT A BRANCH for this site.

BRANCH A - item 1.8(c) reported a bar identifier for ImbalanceMgr 209.

Substitute <BAR5> with that identifier.

// [Task 155] tickOBIsValid provenance capture, site code 5. An object is in scope

// in this block, but the source NAMES none in this statement or in any resolved

// header of its brace stack, so no identity is recorded here. The buffer receives

// the site sentinel -11.0.

Print("[SRJ][T155][OBPROV] site=5 bar=", <BAR5>, " id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 5;

g_s.tickOBSetterBar  = <BAR5>;

BRANCH B - item 1.8(c) reported NO BAR IDENTIFIER IN SCOPE for ImbalanceMgr 209.

// [Task 155] tickOBIsValid provenance capture, site code 5. An object is in scope

// in this block, but the source NAMES none in this statement or in any resolved

// header of its brace stack, so no identity is recorded here. The buffer receives

// the site sentinel -11.0. No bar identifier is in scope at this site, so the

// recorded bar is -1 and the export applies no carried test to this code.

Print("[SRJ][T155][OBPROV] site=5 bar=NOT RECORDED id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 5;

g_s.tickOBSetterBar  = -1;

-------------------------------------------------------------------------------

EDIT 8 - SRJ_ImbalanceMgr.mqh. INSERT IMMEDIATELY AFTER LINE 326.

WHITESPACE REFERENCE, every line: line 326.

APPLY BRANCH A OR BRANCH B exactly as item 1.8(c) reported for this site. Report

which branch you applied. Item 1.7 must have returned NOT A BRANCH for this site.

BRANCH A - item 1.8(c) reported a bar identifier for ImbalanceMgr 326.

Substitute <BAR6> with that identifier.

// [Task 155] tickOBIsValid provenance capture, site code 6. An object is in scope

// in this block, but the source NAMES none in this statement or in any resolved

// header of its brace stack, so no identity is recorded here. The buffer receives

// the site sentinel -12.0.

Print("[SRJ][T155][OBPROV] site=6 bar=", <BAR6>, " id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 6;

g_s.tickOBSetterBar  = <BAR6>;

BRANCH B - item 1.8(c) reported NO BAR IDENTIFIER IN SCOPE for ImbalanceMgr 326.

// [Task 155] tickOBIsValid provenance capture, site code 6. An object is in scope

// in this block, but the source NAMES none in this statement or in any resolved

// header of its brace stack, so no identity is recorded here. The buffer receives

// the site sentinel -12.0. No bar identifier is in scope at this site, so the

// recorded bar is -1 and the export applies no carried test to this code.

Print("[SRJ][T155][OBPROV] site=6 bar=NOT RECORDED id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 6;

g_s.tickOBSetterBar  = -1;

-------------------------------------------------------------------------------

EDIT 9 - SRJ_BiasEngine.mqh. INSERT IMMEDIATELY AFTER LINE 226.

WHITESPACE REFERENCE, every line: line 226.

APPLY BRANCH A OR BRANCH B exactly as item 1.8(c) reported for this site. Report

which branch you applied. Item 1.7 must have returned NOT A BRANCH for this site.

BRANCH A - item 1.8(c) reported a bar identifier for BiasEngine 226.

Substitute <BAR7> with that identifier.

// [Task 155] tickOBIsValid provenance capture, site code 7. NO object is in scope

// at this statement, established twice by prior source review. The buffer

// receives the site sentinel -21.0.

Print("[SRJ][T155][OBPROV] site=7 bar=", <BAR7>, " id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 7;

g_s.tickOBSetterBar  = <BAR7>;

BRANCH B - item 1.8(c) reported NO BAR IDENTIFIER IN SCOPE for BiasEngine 226.

// [Task 155] tickOBIsValid provenance capture, site code 7. NO object is in scope

// at this statement, established twice by prior source review. The buffer

// receives the site sentinel -21.0. No bar identifier is in scope at this site,

// so the recorded bar is -1 and the export applies no carried test to this code.

Print("[SRJ][T155][OBPROV] site=7 bar=NOT RECORDED id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 7;

g_s.tickOBSetterBar  = -1;

-------------------------------------------------------------------------------

EDIT 10 - SRJ_BiasEngine.mqh. INSERT IMMEDIATELY AFTER LINE 280.

WHITESPACE REFERENCE, every line: line 280.

APPLY BRANCH A OR BRANCH B exactly as item 1.8(c) reported for this site. Report

which branch you applied. Item 1.7 must have returned NOT A BRANCH for this site.

BRANCH A - item 1.8(c) reported a bar identifier for BiasEngine 280.

Substitute <BAR8> with that identifier.

// [Task 155] tickOBIsValid provenance capture, site code 8. NO object is in scope

// at this statement, established twice by prior source review. The buffer

// receives the site sentinel -22.0.

Print("[SRJ][T155][OBPROV] site=8 bar=", <BAR8>, " id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 8;

g_s.tickOBSetterBar  = <BAR8>;

BRANCH B - item 1.8(c) reported NO BAR IDENTIFIER IN SCOPE for BiasEngine 280.

// [Task 155] tickOBIsValid provenance capture, site code 8. NO object is in scope

// at this statement, established twice by prior source review. The buffer

// receives the site sentinel -22.0. No bar identifier is in scope at this site,

// so the recorded bar is -1 and the export applies no carried test to this code.

Print("[SRJ][T155][OBPROV] site=8 bar=NOT RECORDED id=NONE prevCode=", g_s.tickOBSetterCode, " prevId=", g_s.tickOBSetterId, " prevBar=", g_s.tickOBSetterBar);

g_s.tickOBSetterId   = 0;

g_s.tickOBSetterCode = 8;

g_s.tickOBSetterBar  = -1;

-------------------------------------------------------------------------------

EDIT 11 - SRJ_FlowLogic.mq5 LINE 8. MODIFY. The only modification in this task.

Item 1.9 must have reported exactly ONE whole-token 34 on line 8. Construct the new

line 8 as follows and in no other way:

  (a) take line 8 exactly as you read it in item 1.1, byte for byte;

  (b) replace that single whole-token 34 with 37, changing nothing else;

  (c) append to the END of the resulting line the following literal text, preceded by

      a single space:

[Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred to Task 156), 36 (hasPersistedOpposingFVG provenance, population deferred to Task 163).

Report the pre-edit line 8 and the post-edit line 8, both verbatim.

LINE 9 IS NOT EDITED. State this explicitly. All three new buffers register as

INDICATOR_CALCULATIONS, which is EA-reachable, so no plot is added and the plots count

does not change.

-------------------------------------------------------------------------------

EDIT 12 - SRJ_FlowLogic.mq5. INSERT AFTER LINE 117, BEFORE LINE 118.

WHITESPACE REFERENCE, all six lines: line 117.

// [Task 155] Provenance buffers for the three exported flags. Buffer 34 is

// populated by this task. Buffers 35 and 36 are registered and initialised here

// and carry a deferred-population sentinel. See the export block.

double g_bufOBValidProv[];

double g_bufFVGValidProv[];

double g_bufOppFVGProv[];

-------------------------------------------------------------------------------

EDIT 13 - SRJ_FlowLogic.mq5. INSERT AFTER LINE 617, BEFORE LINE 618.

WHITESPACE REFERENCE, all five lines: line 617.

P3a: no existing SetIndexBuffer line is modified, reordered or deleted.

// [Task 155] Indices 34, 35, 36. INDICATOR_CALCULATIONS, the same type argument

// as index 33, which the EA demonstrably reads.

SetIndexBuffer(34, g_bufOBValidProv,  INDICATOR_CALCULATIONS);

SetIndexBuffer(35, g_bufFVGValidProv, INDICATOR_CALCULATIONS);

SetIndexBuffer(36, g_bufOppFVGProv,   INDICATOR_CALCULATIONS);

-------------------------------------------------------------------------------

EDIT 14 - SRJ_FlowLogic.mq5. INSERT AFTER LINE 664, BEFORE LINE 665.

WHITESPACE REFERENCE, all four lines: line 664.

// [Task 155]

ArraySetAsSeries(g_bufOBValidProv,  false);

ArraySetAsSeries(g_bufFVGValidProv, false);

ArraySetAsSeries(g_bufOppFVGProv,   false);

-------------------------------------------------------------------------------

EDIT 15 - SRJ_FlowLogic.mq5. INSERT AFTER LINE 797, BEFORE LINE 798.

WHITESPACE REFERENCE, all ten lines: line 797.

This insertion point is inside the block bounded by 747 and 808, which is guarded by

the condition on line 746, so these three calls run on the same path as the existing

thirty-four. They run BEFORE the SRJ_StateInit call at 800, which is where the three

SState provenance fields receive their defaults.

// [Task 155] EMPTY_VALUE, not 0.0 - see the declaration comment.

// EMPTY_VALUE means outside the calculated window, matching g_bufOBValid's own

// initialiser at 753, so buffer 34 and the flag it describes are uncomputed

// together and cannot disagree there. 0.0 is NOT used, because the tree's two

// existing objId buffers initialise to 0.0 to mean "no object selected", and

// buffer 34 needs a value distinct from that for "not calculated". Buffer 34 has

// no 0.0 value anywhere in its contract.

ArrayInitialize(g_bufOBValidProv,  EMPTY_VALUE);

ArrayInitialize(g_bufFVGValidProv, EMPTY_VALUE);

ArrayInitialize(g_bufOppFVGProv,   EMPTY_VALUE);

-------------------------------------------------------------------------------

EDIT 16 - SRJ_FlowLogic.mq5. INSERT IMMEDIATELY AFTER LINE 904, BEFORE LINE 905.

WHITESPACE REFERENCE, every line: line 902.

This lies inside the block opened at 900 under the guard on 899, so all six writes sit

in one guarded block on one bar and the flag can never be read from a different bar

than its provenance. The write is a plain double cast, matching the form at 966, not

the ternary form at 902, because it carries an identity rather than a boolean. The file

performs no NormalizeDouble and no epsilon comparison anywhere, so the safe-range

assertion below is the only conversion check present.

// [Task 155] Buffer 34 - the provenance of the value of g_s.tickOBIsValid present

// at this line on the exported bar, and NOTHING else. The indicator reads a

// different value of the same flag at 866 and inside SRJ_Bias_DecisionBlock

// before that function writes it, and the panel path reads another. No claim

// about weakFlipPreconditionMet, checklistActivated, doWeakSignalFlip or the pane

// colour may be built on this buffer.

// This buffer names a FLAG-SETTER population. It may differ from any candidate's

// bound object. That difference is the measurement.

// TRANSITIONAL. Superseded by Task 163's object-addressable interface.

// NO GATE MAY READ THIS BUFFER.

// The flag and its provenance roll back with g_s on the intrabar path; the OBJECT

// does not, and the pruning passes at 888 and 889 can delete it later in the same

// bar. A restored or surviving provenance may name an object that no longer

// exists. That is Task 163's GONE outcome and is out of scope here.

// VALUES

//   EMPTY_VALUE  outside the calculated window, from ArrayInitialize only

//   > 0.0        objId of the LAST qualifying invalidation on this bar, site

//                codes 1 to 4, all four named and type-agreeing

//   -3.0         carried: the recorded setter bar is not this bar

//   -11.0        site 5, an object is in scope but the source names none

//   -12.0        site 6

//   -21.0        site 7, no object in scope

//   -22.0        site 8

//   -31.0        site 9, SRJ_StateInit default, no write since

//   -9.0         invariant violated

// 0.0 is NOT a value of this buffer. Every no-identity case carries its own site

// code, and an objId of zero or less at a named site is an invariant violation.

{

   long   srjT155Id   = g_s.tickOBSetterId;

   int    srjT155Code = g_s.tickOBSetterCode;

   int    srjT155Bar  = g_s.tickOBSetterBar;

   double srjT155Prov = -9.0;

   if(srjT155Code < 1 || srjT155Code > 9)

      srjT155Prov = -9.0;

   else if(srjT155Code == 9)

      srjT155Prov = -31.0;

   else if(srjT155Code <= 4)

   {

      // Carried is derived against i, the PROCESSING bar of the loop whose header

      // is at 819 - never against target, which is i - 1 and would report every

      // write as carried.

      if(srjT155Bar > i)

         srjT155Prov = -9.0;

      else if(srjT155Bar != i)

         srjT155Prov = -3.0;

      else if(srjT155Id > 0 && srjT155Id <= 9007199254740992)

         srjT155Prov = (double)srjT155Id;

      else

         srjT155Prov = -9.0;

   }

   else

   {

      // Site codes 5 to 8 carry no identity. A bar is recorded at these sites only

      // where one is in scope. Where it is not, the recorded bar is -1, no carried

      // test is applied, and the site sentinel stands - because a carried verdict

      // there would report a comparison the source does not supply.

      if(srjT155Bar >= 0 && srjT155Bar > i)

         srjT155Prov = -9.0;

      else if(srjT155Bar >= 0 && srjT155Bar != i)

         srjT155Prov = -3.0;

      else if(srjT155Code == 5)

         srjT155Prov = -11.0;

      else if(srjT155Code == 6)

         srjT155Prov = -12.0;

      else if(srjT155Code == 7)

         srjT155Prov = -21.0;

      else

         srjT155Prov = -22.0;

   }

   g_bufOBValidProv[target] = srjT155Prov;

   // [Task 155] Buffers 35 and 36 are REGISTERED by this task and their

   // POPULATION IS DEFERRED - buffer 35 to Task 156, buffer 36 to Task 163.

   // -99.0 means exactly that and nothing else, and is distinct from every value

   // in buffer 34's contract. Buffer 36 can never carry an identity, because no

   // object is NAMED at any of its four pass-site writes, which is why its

   // population was deferred rather than built.

   g_bufFVGValidProv[target] = -99.0;

   g_bufOppFVGProv[target]   = -99.0;

}

STAGE 3 - VERIFICATION. 8 CHECKS. NO EDIT IN THIS STAGE.

3.1  DIFF each of the five edited files against its CP\BEFORE\ copy. Paste the FULL

     diff output per file. The diff must show ONLY insertions, plus the one

     modification at FlowLogic line 8. The four brace lines in SRJ_OrderblockMgr.mqh

     appear as INSERTED lines; if any of lines 170, 171, 172, 173, 534, 535, 536 or

     537 appears as CHANGED rather than unchanged, that is BLOCKED.

     Any change on any line this Form B does not name - including a whitespace,

     encoding, line-ending or byte change inside a comment - is BLOCKED. Restore that

     file from CP\BEFORE\ and report.

3.2  Report the post-edit Get-Content line count of each of the five files and the

     delta against item 0.4.

3.3  Run certutil -hashfile SHA256 on MQ\Experts\SRJ_FlowNexus_EA.mq5 and

     MQ\Include\SRJ\SRJ_Types.mqh. Paste RAW output. Both must be byte-identical to

     their CP\BEFORE\ copies. A mismatch is BLOCKED.

3.4  Compile MQ\Indicators\SRJ_FlowLogic.mq5 ONLY, from the command line, not from

     MetaEditor. Do NOT compile SRJ_FlowNexus_EA.mq5. Paste the compiler's RAW output

     including every warning. Any error is BLOCKED. Report every warning; suppress and

     reformat none.

3.5  Grep the five edited files for the exact text 9007199254740992. Report every file

     and line on which it occurs.

3.6  Report the verbatim post-edit text of FlowLogic line 8 and of the plots line, and

     state PLOTS LINE NOT EDITED.

3.7  Grep the five edited files for the exact text [SRJ][T155][OBPROV] and report the

     count and every file and line. The expected count is eight, one per write site.

     Report the count you observe; do not adjust anything to reach eight.

3.8  BRACE DELTA. Repeat item 0.5's brace census on the five files post-edit and report

     the delta per file for both characters. REQUIRED:

       SRJ_OrderblockMgr.mqh   open +4   close +4

       SRJ_FlowLogic.mq5       open +1   close +1

       SRJ_State.mqh           open  0   close  0

       SRJ_ImbalanceMgr.mqh    open  0   close  0

       SRJ_BiasEngine.mqh      open  0   close  0

     Any other delta, in either character in any file, is BLOCKED. Restore that file

     from CP\BEFORE\ and report.

STAGE 4 - CHECKPOINT. 3 STEPS.

4.1  Create CP\AFTER\ and copy the five edited files plus the two unedited control

     files into it. Record RAW certutil SHA256 for all seven in CP\MANIFEST.txt beside

     the BEFORE values. No .ex5 is copied or hashed.

4.2  Copy the full STAGE 3 diff output to CP\EXTRACTIONS\DIFF_155.txt and the raw

     compiler output to CP\EXTRACTIONS\COMPILE_155.txt.

4.3  Copy this Form B to CP\TASK_HANDOFF.txt.

NO TEST RUN. NO BACKTEST. NO CHART ATTACH. NO LIVE TRADING. The Tier 1 regression is

  a separate authorization and is NOT granted by this Form B.

STAGE 5 - REPORT. 1 UNIT. Write to the REPORT DESTINATION, once, complete. This write

happens for EVERY status, including BLOCKED. Replace every angle-bracket token below

with its answer. Do not reproduce this Form B's edit text or restrictions checklist in

the report.

TASK 155: COMPLETED | BLOCKED | PARTIAL | RELAY INCOMPLETE | NOT AUTHORIZED

Form B version: v3

Relay check: <token PRESENT or ABSENT> | <unit counts received per stage> |

             <COUNT LINE CONSISTENT or INCONSISTENT with both figures>

Pre-flight: Q1 <YES or NO and reason> | Q2 <...> | Q3 <...>

Authorization in session: <quote the council's authorization, or NOT PRESENT>

Reference documents loaded: <every one by filename, or none>

Report destination: <the full path written>

Stages completed: <the highest item reached, and the item at which you stopped>

Files read: <every full path and the command used>

Files modified: <the five paths only, or none>

Files written: <report destination, every CP path, and the .ex5 path with timestamp>

Snapshot branch: <BRANCH EXISTING, BRANCH SNAP or BRANCH DIRECT>

Baseline hashes: <raw certutil for all fourteen, and the two supplied comparisons>

Pre-edit line counts: <per file, from item 0.4>

Pre-edit brace counts: <per file, both characters, from item 0.5>

Anchor verification: <per line read in STAGE 1, verbatim text and column>

FlowLogic anchor checks: <a to e, PASS or FAIL>

State anchor checks: <a to c, PASS or FAIL>

Flag-presence checks: <ImbalanceMgr 209, 326 and BiasEngine 226, 280, PASS or FAIL>

Line 8 token guard: <count and columns from item 1.9>

Branch-form determination: <per site, from item 1.7>

Pattern gate: <per window, checks a to f, PASS or FAIL, from item 1.10>

Bar-identifier determination: <per site, from item 1.8, and BRANCH A or B applied per

                              edit 7, 8, 9, 10>

Substitutions resolved: <token RESOLVED TO identifier FROM ITEM n, all six>

Insertion points applied: <every one, file and line, in the order applied>

Diff: <full output per file, and the statement that only named lines changed>

Post-edit line counts and deltas: <per file>

Brace deltas: <per file, both characters, against the required values>

EA and Types byte-identical: <raw certutil, BEFORE and AFTER, both files>

Compile: <raw output, every warning>

Safe-range assertion present at: <file and line, from item 3.5>

Diagnostic tag count: <count and locations, from item 3.7>

Line 8 post-edit and plots line: <both verbatim, and PLOTS LINE NOT EDITED>

Splits declared: <every part boundary, or none>

Commands that failed: <command as issued and raw error text, or none>

RESTRICTIONS CHECKLIST

- No file modified outside the five named. EA .mq5 and SRJ_Types.mqh byte-identical,

  asserted by hash. The compiled .ex5 is an expected artifact and is excluded from

  every scope and byte assertion.

- No canonical file opened in MetaEditor. Compile from the command line.

- No test run, no backtest, no chart attach, no live trading.

- No existing SetIndexBuffer line modified, reordered or deleted.

- FlowLogic line 9, the plots line, not edited.

- No line reformatted, realigned or reflowed. No encoding change. Every inserted line

  is pure ASCII. Verified by DIFF, not by digest alone.

- Braces are added at exactly four insertion points in SRJ_OrderblockMgr.mqh, under

  R-22, and nowhere else. No brace is added at sites 5 to 8. No existing line is

  modified to add one.

- The event-bar parameter at OrderblockMgr 171 and 173 is never recorded.

- The carried test compares the recorded setter bar against i, never against target.

- No gate, filter, alert, input, iCustom call or EA-side read added or changed.

- The diagnostic Print is unconditional and tagged, and is not gated on InpDebugLog or

  SRJ_InDebugWindow.

- No buffer index other than 34, 35, 36. No SState field other than the three named.

  No sentinel value other than those in EDIT 16.

- No objId treated as a cross-run identity.

- Buffers 35 and 36 are registered and initialised only. No capture site for either is

  edited. No SState field is appended for either.

- No edit derived from another edit. No comment text composed by the implementer. No

  line number from any earlier session used as an anchor.

- If any check is BLOCKED, restore from CP\BEFORE\, write the BLOCKED report to the

  report destination, and stop. Do not reconcile in place. Do not attempt a second

  approach.

END-OF-TASK-155-V3
