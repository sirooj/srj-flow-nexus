REPORT PATH: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS

TASK 155-Pre2 — Form D. EXTRACTION AND MAPPING ONLY.

NO EDIT. NO COMPILE. NO RUN.

★ RELAY INTEGRITY. This task has FIVE blocks. Item counts per block:

      Block A  5 items  (A1-A5)

      Block B  4 items  (B1-B4)

      Block C  4 items  (C1-C4)

      Block D  4 items  (D1-D4)

      Block E  4 items  (E1-E4)

    Declared total: 21 items.  (5+4+4+4+4 = 21)

    The task's final line is the token  END-OF-TASK-155-PRE2.

    If that token is ABSENT from the text you received, or if any BLOCK's item

    count does not match the figures above, report RELAY INCOMPLETE, name the

    last item you received in full, and STOP. Do not answer any block. This is

    not a PARTIAL result and no block may be answered from it.

    If the PER-BLOCK figures are internally consistent but disagree with the

    declared total, the PER-BLOCK figures GOVERN. Report COUNT LINE INCONSISTENT

    with both figures and PROCEED. Do not stop. ★

★ CANONICAL SCOPE, BOTH HALVES BINDING.

    (1) NO FILE WRITTEN UNDER MQL5\Experts\, MQL5\Indicators\ OR MQL5\Include\.

        NO EXISTING FILE MODIFIED ANYWHERE.

    (2) A NEW file under MQL5\SRJ_FlowNexus_Local\ is permitted when and only

        when this task's REPORT DESTINATION names it. That write is AUTHORIZED. ★

★ REPORT DESTINATION. Write your complete report to the file:

      <the directory on the line beginning "REPORT PATH:" in this message>

      \BUILDER_RESULT_155-Pre2.md

  This write is AUTHORIZED. It is a WRITE ONLY: do not read anything from that

  directory and do not read any D: path (P14).

  If no line beginning "REPORT PATH:" is present in this message, report

  DESTINATION MISSING and STOP before reading any file.

  Deliver the report BOTH as that file AND in your reply. The report format's

  "Files written:" line reads that full path. ★

★ DISABLE REFERENCE SKILLS FOR THIS TASK. No language reference, pattern

  library, architecture guide, prior revision, prior builder result or any

  document outside the sixteen canonical files and this task text may be loaded

  or consulted (P17). Your report must carry the line:

      Reference documents loaded: <every one, by filename, or "none">

  A report declaring a loaded reference document is PARTIAL, not COMPLETED, and

  no verdict in it may gate a decision. ★

DF = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06

READ ONLY, VIA SHELL COMMAND ONLY:

  DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5

  DF\MQL5\Indicators\SRJ_FlowLogic.mq5

  all 14 .mqh files in DF\MQL5\Include\SRJ\

★ READ EVERY FILE WITH A SHELL COMMAND. DO NOT OPEN ANY FILE IN METAEDITOR (P11).

★ STASIS VALUES, SUPPLIED SO THE FINAL COMPARISON IS MECHANICAL:

    EA .mq5 SHA256:

      0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322

    FlowLogic .mq5 SHA256:

      d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5

  Compare raw certutil output to THESE TWO VALUES ONLY.

★ DELIVERY RULE, BINDING AND FIRST. This report has five blocks and must arrive

  COMPLETE, INCLUDING THE FINAL HASH ITEM. If output must be split, split it,

  declare every boundary in "Splits declared", and DELIVER EVERY PART. Do not emit

  a TRUNCATED marker beside a boundary already declared as a split. If a block

  cannot be delivered, report PARTIAL and name the block — never COMPLETED with a

  block missing. The FILE at the report destination must be COMPLETE regardless

  of how the reply is split. ★

★ REPORT-TEXT FIDELITY, BINDING. Write the report in plain ASCII. Do not

  post-process, reflow, spell-correct, de-duplicate or annotate any pasted source

  line or any pattern name. A previous report of this project was delivered with

  pattern names altered, punctuation doubled and words joined; the counts survived

  but the pastes became unusable as insertion text. Every pasted source line and

  every pattern name is emitted exactly as read or exactly as supplied. ★

★ POWERSHELL VARIABLE-CASE WARNING, BINDING. PowerShell variable names are

  CASE-INSENSITIVE: $O and $o are the SAME variable. Any helper that uses two

  names differing only in case will silently overwrite one with the other and can

  produce INCOMPLETE BUT SELF-CONSISTENT results. Use names that differ by more

  than case, and verify every computed brace stack against AMENDMENT 17 before

  reporting it. ★

================ CENSUS RULE SET — PASTED VERBATIM, NOT REFERENCED ================

★ ALL CENSUS MATCHES ARE CASE-SENSITIVE. Similar names are separate patterns:

  "londonHigh" and "prevLondonHigh" are DIFFERENT and must be censused apart. ★

★ SUBSTRING RULE. An identifier occurrence lying inside a LONGER identifier is

  reported and marked INCIDENTAL, and NO VERDICT may be built on it. Report the

  containing identifier. ★

★ AMENDMENT 10 — WHOLE-TOKEN RULE. Where a census pattern is a LANGUAGE KEYWORD —

  for, while, switch, do, if, else, return, break, continue, goto, case — match

  WHOLE TOKENS only: the character before and after the match must each be absent

  or non-identifier (not a letter, digit or underscore). Report the whole-token

  count as the census RESULT and the raw substring count separately as a

  DIAGNOSTIC. Never make a keyword a substring pattern. Where an item states that

  a NON-KEYWORD pattern is to be matched as a WHOLE TOKEN, apply the same test

  and say so. ★

★ MULTI-PATTERN CENSUS RULE. Where a block lists several patterns, report per file:

    N_OCC   = total pattern hits, PER PATTERN, counting repeats on a line

    N_LINES = a SINGLE per-file count of DISTINCT lines matching at least one

              pattern

  Paste each DISTINCT line exactly ONCE as <file> <line>: <text>, and append

  [matched: p1, p2]. Paste count must equal the per-file N_LINES summed over files.

  NO CAPS. ★

★ AMENDMENT 5 — MULTI-PATTERN TOTALS RULE. NEVER sum N_LINES across patterns — a

  line matching three patterns is ONE line. No completeness verdict may be built on

  a summed per-pattern total. ★

★ AMENDMENT 9 — BLOCK-COMMENT RULE. Comment exclusion covers "/* ... */" as well as

  "//". Discard every character from an unquoted "/*" through the matching "*/",

  including across line boundaries, before applying any census, assignment-target,

  comparison, return-statement or header test. A line wholly inside a block comment

  is reported as COMMENT and no verdict may be built on it. ★

★ ASSIGNMENT-TARGET RULE, WITH AMENDMENT 3 — COMMENT EXCLUSION. Before applying the

  rule, discard the line if its first non-space characters are "//", and discard any

  portion of the line at or after an unquoted "//"; also apply the block-comment

  rule. An identifier and an "=" inside a comment is reported as COMMENT, never as

  an assignment. A line then assigns TO identifier X if and only if:

    (1) X occurs on the line, not INCIDENTAL, and outside every double-quoted

        string, AND

    (2) scanning right from that occurrence, the first non-space non-tab character

        is "=", AND

    (3) the character immediately after that "=" is not "=".

  A line containing X and "=" where the "=" is not reached by (2) is reported as

  CONTAINS-EQUALS-NOT-TARGET. A line failing (1) on the string test is reported as

  STRING-LITERAL. No verdict may be built on COMMENT, STRING-LITERAL or

  CONTAINS-EQUALS-NOT-TARGET. Alignment whitespace between the identifier and "="

  is EXPECTED — never search for "identifier =" as one literal. ★

★ AMENDMENT 11 — RIGHT-HAND-SIDE RULE. Where an item asks for the exact right-hand

  side of an assignment, the RHS is the text after the qualifying "=" up to, but

  excluding, the first unquoted ";" at the same paren and bracket depth. If no such

  ";" exists on the line — a for-init clause, a multi-line initialiser — report

  RHS TERMINATOR NOT ON LINE and paste the remainder verbatim, marked as such.

  Never report end-of-line text as an RHS without that mark. ★

★ COMPARISON RULE. A line COMPARES X if X occurs on the line, not INCIDENTAL,

  outside every string and every comment, and the line contains "==" or "!=" or the

  line's first non-space token is "case". ★

★ AMENDMENT 1 — FILE-SCOPE DECLARATION RULE. NEVER ENUMERATE TYPE KEYWORDS. A line

  is a file-scope declaration if it begins at column 0, does not begin with "//",

  ends in ";", contains the named identifier as an assignment target or as the last

  token before ";" or "[", and its first token is not one of

  if/for/while/return/switch/case/else. Report the first token as the declared type

  VERBATIM, whatever it is. ★

★ AMENDMENT 15 — DECLARATION BRACE EXCLUSION. A line whose first non-space token

  is "}" is NEVER a declaration, whatever else the line contains and however it

  terminates. Report it as CLOSING BRACE. This applies to the file-scope

  declaration rule and to every relaxed variant of it. When an item asks for the

  HIGHEST-numbered declaration in a range, a CLOSING BRACE line may not be that

  answer. ★

★ DEFINITION-HEADER RULE, WITH ITS FALLBACK. A line is a candidate if it begins at

  column 0, contains the name followed by "(", and does not begin with "//". Find

  the line containing the matching closing ")" of the parameter list. If that line,

  or any line from the candidate through it, ends in ";" -> DECLARATION, do not

  bound it. Otherwise -> DEFINITION, bound it. Report EVERY candidate with its

  classification and the line on which the parameter list closes. A multi-line

  forward declaration is a DECLARATION.

  FALLBACK, BINDING: if a name yields candidates but NONE is a DEFINITION, DO NOT

  STOP. Report "NO DEFINITION AT COLUMN 0", then census the BARE NAME across all 16

  files, paste every match, and report every line where the name is followed by "("

  and the line does NOT end in ";" REGARDLESS OF INDENTATION, with its exact leading

  whitespace. If one exists, bound it by brace counting and treat it as the

  definition. If none exists, report NO DEFINITION FOUND. ★

★ AMENDMENT 7 — FALSIFIABILITY RULE. Where an item asks for a classification that

  gates a design decision, the item MUST also require the brace-counted range and a

  paste sufficient to falsify the classification — WHOLE if within the item's size

  bound, else the header through the first terminator. A classification delivered

  without a paste is not verifiable and may not gate a decision. ★

★ BRACE RULE. Bound every region by BRACE COUNTING from its opening brace —

  increment on "{", decrement on "}", stop at zero. Do NOT use indentation. In this

  tree the opening brace is on the line AFTER the header and is indented, blocks are

  opened with a bare "{" on its own line, and OnInit's closing region carries a

  decoy "}" with three leading spaces. Confirm per region that brace counting was

  used. ★

★ REGION-BOUNDS CONVENTION RULE. EVERY region reported in EVERY block of this task

  is reported in SIX FIELDS, on one line, labelled, in this order:

      HEADER <line> | PARAM LIST CLOSES <line> | OPENING BRACE <line> |

      CLOSING BRACE <line> | BODY LINES <closing - opening + 1> |

      HEADER-INCLUSIVE LINES <closing - header + 1>

  Both counts, always, labelled. NO SINGLE INTEGER IS EVER CALLED "the line count."

  Where a region has no parameter list — a struct, a class, a bare block — report

  PARAM LIST NOT APPLICABLE and report the remaining fields, using

  HEADER NOT APPLICABLE only where no header line exists at all. Where an item

  states a paste size bound, the bound is tested against BODY LINES. ★

★ PASTE SIZING RULE. For every region: FIRST report its six-field bounds. THEN paste

  only what the item names. If an item says "paste WHOLE if <= N lines" and BODY

  LINES exceeds N, say EXCEEDS N and paste only the item's fallback. Never paste a

  region of unmeasured size. ★

★ AMENDMENT 19 — PASTE-COMPLETENESS RULE. Where an item requires a CONTIGUOUS span

  or region paste, report immediately after the paste:

      PASTED FROM <first line number emitted> THROUGH <last line number emitted>

      PASTED LINE COUNT <integer number of output lines emitted>

      DECLARED SPAN COUNT <integer>

      ASSERTION: PASTE COMPLETE   or   PASTE INCOMPLETE

  The assertion is PASTE COMPLETE if and only if the pasted line count equals the

  declared span count AND the last line emitted is the declared last line. If it is

  PASTE INCOMPLETE, say so with both figures, name the first line NOT emitted, and

  declare it in "Truncations". A span pasted short while "Truncations: none" is

  declared is a delivery-rule violation and the item is not answered.

  (Closed defect 108.) ★

★ AMENDMENT 20 — SINGLE-ANSWER RULE. Each item is answered EXACTLY ONCE. Do not

  emit an item's heading, bounds or answer twice. If a correction is needed, emit

  the item once in its corrected form; do not append a second copy. Two copies of

  one item that disagree are indistinguishable from a genuine disagreement on a

  byte-identical file. (Closed defect 109.) ★

★ AMENDMENT 21 — NON-ASCII BYTE RULE. This tree contains bytes outside the printable

  ASCII range inside comments. Where an item asks you to report a line's bytes, or

  where a pasted line contains any byte other than TAB (0x09) or 0x20 through 0x7E,

  report for that line:

      NON-ASCII BYTE AT COLUMN <1-based column>, VALUE 0x<hex>

  once per such byte, and otherwise report ASCII CLEAN. NEVER substitute, transcode,

  normalise or omit such a byte silently. Where an item says "do not paste the line

  text", report only the file, the line number and the byte report. ★

★ AMENDMENT 2 — ENCLOSING-CONDITION RULE. Where an item asks for a nearest enclosing

  "if", it is found by BRACE SCOPE, never by textual proximity. From the statement's

  line scan upward, counting "}" and "{": a candidate "if" qualifies only if the

  statement lies inside the block that "if" opens. An "if" whose braces both close

  on its own line, or close before the statement, DOES NOT ENCLOSE IT and must not

  be reported. Report the ENTIRE qualifying line unmodified, marked SAME-LINE if the

  "if" shares its line with the statement. If nothing encloses the statement inside

  the paste, report NOT ENCLOSED. Never extract a fragment of a condition and never

  close an unbalanced paren. ★

★ AMENDMENT 6 — ENCLOSING-CONSTRUCT RULE. To name the construct enclosing a

  statement, compute the FULL open-brace stack from the region's opening brace to

  the statement, outermost first, and report EVERY entry as <line>: <text>

  unmodified. For each entry whose first non-space token is "{", scan upward to the

  first preceding line whose first non-space token is if/else/for/while/switch/do

  AND whose own text is not terminated by ";", and report THAT line as the entry's

  header. Classify from the header, never from the brace line. Report the whole

  stack, not only the innermost. If any entry's header is for/while/switch/do, SAY

  SO EXPLICITLY. If no header can be resolved for an entry, report HEADER UNRESOLVED

  and paste the brace line verbatim. ★

★ AMENDMENT 17 — STACK-NESTING VERIFICATION RULE. Every reported brace stack states

  each entry as [OPEN, CLOSE], both lines brace-counted, outermost first. Before

  reporting, assert that for every adjacent pair (parent, child):

        parent.OPEN < child.OPEN  AND  child.CLOSE < parent.CLOSE

  and that the named statement S satisfies  innermost.OPEN <= S <= innermost.CLOSE.

  Report the assertion as NESTING VERIFIED. If any pair fails, report

  STACK NESTING VIOLATED, name the failing pair with its four numbers, and build

  NO VERDICT on that stack. A stack reported without the assertion is not

  verifiable and may not gate a decision. (Closed defect 99.) ★

★ AMENDMENT 14 — ATTRIBUTION RULE, CORRECTED. THE PREVIOUS VERSION OF THIS RULE WAS

  ARITHMETICALLY WRONG AND ITS OUTPUT IS VOID. Where an item asks which OBJECT a

  statement attributes to, it is not enough that an object exists in the region.

  Report, from the named paste only:

    (a) EVERY PARAMETER of the region's definition header whose parameter text

        contains "*", as <position> | <parameter text> | <variable name>. A

        parameter is IN SCOPE AT EVERY STATEMENT IN THE BODY and needs no scope

        test. Reporting "NOT ASSIGNED FROM ANY CONSTRUCTION IN THIS PASTE" while a

        pointer parameter exists is WRONG.

    (b) every variable in the paste declared with a pointer type or assigned from a

        call whose name contains "create", "New", "Get" or "At", as

        <line>: <text> | <variable name> | <RHS verbatim> | <declaration line D>.

    (c) for the named statement at line S, its FULL open-brace stack per the

        enclosing-construct rule AND amendment 17, and for EACH brace entry its

        OPENING line and its BRACE-COUNTED CLOSING line.

    (d) for each variable from (b), the BRACE-COUNTED RANGE of the innermost brace

        entry that CONTAINS its declaration line D — call it [Dopen, Dclose] — where

        the region's own braces are the outermost such entry.

    (e) IN SCOPE AT S if and only if ALL THREE hold, each reported separately as

        YES or NO with the numbers used:

            (e1) D < S

            (e2) Dopen <= S AND S <= Dclose

            (e3) the brace entry [Dopen, Dclose] is the region itself, or appears in

                 the statement's stack from (c)

        Report the conjunction as IN SCOPE or NOT IN SCOPE.

  A variable declared AFTER the statement is NOT IN SCOPE however its numbers

  compare to brace openings. A variable declared at the TOP of a loop body IS IN

  SCOPE at statements deeper inside that same loop body. Testing only lower bounds

  produces both errors at once.

  If no parameter from (a) and no variable from (b) is IN SCOPE, report

  "NO OBJECT IN SCOPE AT THIS STATEMENT". That is a RESULT, not a failure. ★

★ AMENDMENT 16 — MULTI-LINE CALL RULE. Where an item asks for the exact argument

  list text of a call, the argument list runs from the "(" following the called name

  to the MATCHING ")" at the same paren depth, ACROSS LINE BOUNDARIES. If the

  matching ")" is not on the call's own line, report

  "ARGUMENT LIST CONTINUES ON NEXT LINE" and then PASTE EVERY LINE from the call

  line through the line carrying the matching ")", one pasted source line per output

  line, and report the joined argument text separately marked JOINED. Never report a

  truncated argument list without that mark and never report UNTERMINATED as a final

  answer. (Closed defect 86.) ★

★ AMENDMENT 18 — ARGUMENT-POSITION RULE, EXTENDED. An item may NOT ask for the

  argument at a named POSITION unless the item text states, from a named accepted

  result, what that position holds. Where it does not, the item asks for EVERY

  argument of the call, each reported separately by position, with an ARG COUNT, and

  the planner selects afterwards. Where an item asks you to find a call by the TEXT

  of one argument, report the position searched and, if no call matches, report

  NOT FOUND and then report EVERY argument of EVERY such call in ascending line

  order.

  EXTENSION: an item may NOT ask whether an identifier occupies a stated POSITION ON

  A LINE — a column, a first token — unless the item states what occupies that

  position in this tree. Where it does not, the item asks for the LINE and for the

  1-BASED COLUMN at which the identifier begins, and the planner locates it.

  (Closed defects 98 and 104.) ★

★ AMENDMENT 4 — RETURN-STATEMENT RULE. Where an item asks about returns, report

  STATEMENTS and substring hits SEPARATELY and never conflate them. A line carries a

  return statement only if "return" occurs outside every double-quoted string,

  outside every comment, and is not part of a longer word — returns, returned,

  returning are INCIDENTAL by the substring rule. Report per qualifying line whether

  the statement is BARE ("return;") or CARRIES AN EXPRESSION, and report both the

  statement count and the raw substring-hit count. ★

★ CLASSES ARE NOT MUTUALLY EXCLUSIVE unless the item says so. Report a line once per

  applicable class. ★

★ LEGAL ANSWERS: "ABSENT" (not in the named paste), "NOT STORED" (no identifier

  holds the fact), "UNKNOWN" (source does not establish it), "NO CALL IN THIS FILE",

  "NO DEFINITION FOUND", "NO DECLARATION FOUND", "NOT ENCLOSED",

  "HEADER UNRESOLVED", "NO BRACED BODY", "RHS TERMINATOR NOT ON LINE",

  "NO ENCLOSING FUNCTION - FILE SCOPE", "NO OBJECT IN SCOPE AT THIS STATEMENT",

  "CLOSING BRACE", "ARGUMENT LIST CONTINUES ON NEXT LINE", "NOT NAMED",

  "NOT FOUND", "HEADER NOT APPLICABLE", "PARAM LIST NOT APPLICABLE",

  "STACK NESTING VIOLATED", "TYPE NOT DECLARED IN THIS PASTE",

  "NO DECLARATION AT COLUMN 0", "PASTE INCOMPLETE", "ASCII CLEAN".

  Never substitute the nearest available identifier. ★

★ AMENDMENT 12 — FILE-SCOPE ANSWER RULE. Where an item asks for an enclosing

  function, enclosing construct or brace stack, "NO ENCLOSING FUNCTION - FILE SCOPE"

  is a LEGAL ANSWER and must be listed as one in the item. A #define, a file-scope

  declaration or a preprocessor line has no enclosing region and the item must not

  imply one. ★

★ AMENDMENT 13 — CENSUS-PATTERN PROVENANCE RULE. Where a census pattern names a

  FUNCTION, the pattern is taken from a definition header established in THIS task

  or supplied in the item text as a FULL identifier. If a pattern yields only

  INCIDENTAL matches under the substring rule, report INCIDENTAL-ONLY and report the

  containing identifier for every match. DO NOT substitute the containing identifier

  and DO NOT re-run with a corrected pattern unless the item text names that

  pattern. Report and stop. ★

★ ANSWERABILITY, WITH COMPUTABILITY AND SELF-SELECTION. Where an item asks for a

  verdict, answer ONLY from the paste named in that item, and name the paste

  searched. A task must never ask a question whose answer lives outside a region the

  same task requested, and must never ask for a comparison against a value it did

  not supply. An item must never ask for a classification the builder cannot compute

  from what the task requested. An item whose referent is singular where the

  producing item may return several must state its own selection rule in the item

  text. ★

★ CLASSIFY MECHANICALLY. Never classify from a comment. ★

★ NO TYPE-AGREEMENT JUDGMENT. Where an item asks for a DECLARED TYPE, report the

  type token VERBATIM and STOP. Do not state, imply or evaluate whether that type

  agrees with, matches, or is appropriate to any flag, buffer or subject. That

  comparison is the planner's and is not a builder answer. ★

★ NO REACHABILITY JUDGMENT. Where an item asks whether an identifier or member

  OCCURS, report the occurrences and STOP. Do not state, imply or evaluate whether

  a member is accessible, reachable, valid, permitted or usable at any statement.

  That is the planner's and is not a builder answer. ★

★ AMENDMENT 8 — NO PLACEHOLDER IN AN ISSUED TASK. A Form B or Form D containing a

  bracketed instruction to the planner, an unfilled reference, or a rule cited by

  section number instead of pasted, is not issuable. This rule block is pasted

  VERBATIM into every Form D header — never referenced, never summarised, never left

  as a placeholder for assembly. ★

★ NO LINE NUMBER FROM ANY PREVIOUS TASK IS AN ANCHOR. Locate every region by census

  in THIS task, then bound it by brace counting.

  ONE CARVE-OUT, STATED HERE AND LIMITED TO BLOCK E: Block E supplies line numbers

  as VERIFICATION TARGETS and asks for their verbatim text and their bytes ONLY. No

  region bound, no scope verdict, no classification and no design decision may be

  built on a Block E line number. Blocks A, B, C and D locate every region by census

  in this task. ★

★ NO EXPECTED VALUE IS STATED FOR ANY CENSUS OR ANY REGION SIZE. A count of 0 is a

  result, never BLOCKED. Do not compare any count or line count to any figure from

  any previous task. ★

★ PASTE CONTIGUOUSLY with line numbers and all leading whitespace. A PART BOUNDARY

  IS A SPLIT and must appear in "Splits declared". ONE Truncations declaration per

  report. Do not emit a TRUNCATED marker beside a boundary already declared as a

  split. ★

★ NEVER ABBREVIATE WITH "..." AND NEVER RETYPE A LINE. ONE PASTED SOURCE LINE PER

  OUTPUT LINE — never collapse several onto one output line and never join them with

  separators. This applies to EVERY statement list in EVERY block. NO SHELL PROMPT

  TEXT INSIDE A PASTE. ★

★ NO PROSE IN PLACE OF DATA. NO DIAGNOSIS. NO HYPOTHESIS. NO ARCHITECTURE

  OPINION. ★

★ STASIS VALUES MUST BE SUPPLIED IN THE TASK TEXT so the final comparison is

  mechanical. Never instruct a comparison against "the recorded value". ★

===================================================================================

BLOCK A — THE COrderblock CLASS, objId, AND MEMBER OCCURRENCE AT THE FLAG WRITES.

5 ITEMS.

A1. Census all 16 files for  COrderblock  under the substring rule. Report per file

    N_OCC and a single per-file N_LINES. Paste every distinct line once as

    <file> <line>: <text>, marking INCIDENTAL where the substring rule requires and

    reporting the containing identifier. Classify each non-INCIDENTAL line as

    CLASS HEADER, DECLARATION, PARAMETER, or OTHER stating which. A count of 0 in a

    file is a result.

    Then, for the line classified CLASS HEADER, bound the class by BRACE COUNTING

    from its opening brace and report it in its SIX-FIELD form, using

    PARAM LIST NOT APPLICABLE. Confirm brace counting was used.

    SELECTION RULE FOR THIS ITEM, applied and reported: if more than one CLASS

    HEADER is returned, take the LOWEST-numbered such line in the file that has the

    greatest number of CLASS HEADER lines; if still tied, take the lowest-numbered

    such line in the alphabetically first file path. State which branch you applied.

A2. From the A1 class range ONLY, report the integer BODY LINES first, then:

      (i)  paste the range WHOLE if BODY LINES <= 200, contiguously, one pasted

           source line per output line, with line numbers and all leading

           whitespace; otherwise say EXCEEDS 200 and paste the class header line

           plus EVERY line in the range that is a declaration under the file-scope

           declaration rule relaxed to permit leading whitespace, with AMENDMENT 15

           applied;

      (ii) apply AMENDMENT 19's paste-completeness report to whatever you pasted;

      (iii) report the declaration line for the identifier  objId  as

            <line>: <text> | declared type <first token verbatim>, or ABSENT.

    Report the type token and STOP. Make no agreement or appropriateness judgment.

A3. Census all 16 files for  objId  under the substring rule. Report per file N_OCC

    and a single per-file N_LINES. Paste every distinct line once as

    <file> <line>: <text>, marking INCIDENTAL where the substring rule requires and

    reporting the containing identifier for every INCIDENTAL match. Classify each

    non-INCIDENTAL line as DECLARATION, ASSIGNMENT (by the assignment-target rule,

    with its RHS by the right-hand-side rule), COMPARISON (by the comparison rule),

    MEMBER ACCESS (the occurrence is immediately preceded by "."), or OTHER stating

    which. For every non-INCIDENTAL line report its enclosing function by the

    definition-header rule INCLUDING ITS FALLBACK, with the region in its SIX-FIELD

    form, or NO ENCLOSING FUNCTION - FILE SCOPE. NO CAPS.

A4. Locate  SRJ_OB_ReplayActivationInvalidation  and

    SRJ_OB_ActivationInvalidationPass  by the definition-header rule INCLUDING ITS

    FALLBACK, as SEPARATE PATTERNS. Each is supplied as a FULL identifier. For each,

    report every candidate, its parameter-list closing line, and its classification.

    Report each DEFINITION in its SIX-FIELD form and confirm brace counting was

    used. Then, per region, report BODY LINES first and paste the region WHOLE if

    BODY LINES <= 300, contiguously, one pasted source line per output line;

    otherwise say EXCEEDS 300 and paste the opening brace through the last line

    carrying a return statement, inclusive, stating the range. Apply AMENDMENT 19's

    paste-completeness report to each paste.

    Then, per region, from its own paste only and naming the paste searched, report

    every line that assigns to  tickOBIsValid  by the assignment-target rule, as

    <line>: <text> | RHS <verbatim>, with the integer count per region.

A5. For each region in A4, from its own A4 paste ONLY and naming the paste searched:

      (i)  report every parameter of its definition header as

           <position> | <parameter text> | BY REFERENCE or BY VALUE |

           CONTAINS-ASTERISK: yes or no. Where a parameter list spans more than one

           line, paste every line of it first, one pasted source line per output

           line;

      (ii) report every occurrence of the exact three-character text  ob.  as

           <line>: <text> | member <the identifier immediately following the "."> ,

           in ascending line order, with the integer count;

      (iii) report the DISTINCT SET of member identifiers from (ii), one per output

            line, alphabetically, with the integer size of the set;

      (iv) report whether the exact text  ob.objId  occurs, as

           OCCURS AT <every line number>  or  ABSENT.

    ABSENT is a legal answer for (ii), (iii) and (iv) and a count of 0 is a result.

    Report occurrences and STOP. Make no reachability judgment.

BLOCK B — THE EXISTING objId EXPORTS AND THE TREE'S CONVERSION CONVENTION. 4 ITEMS.

B1. In SRJ_FlowLogic.mq5 only, whole file, census each of these as a SEPARATE

    PATTERN under the multi-pattern and substring rules:

        g_bufXobObjId

        g_bufFvgObjId

    Report N_OCC per pattern and a single N_LINES for the file. Paste every distinct

    line once as <line>: <text> with [matched: ...]. Classify each as DECLARATION

    (by the file-scope declaration rule, with AMENDMENT 15 applied), ASSIGNMENT (by

    the assignment-target rule, with its RHS by the right-hand-side rule), or OTHER

    stating which. For every pasted line report its enclosing function by the

    definition-header rule INCLUDING ITS FALLBACK, with the region in its SIX-FIELD

    form, or NO ENCLOSING FUNCTION - FILE SCOPE. Report ABSENT per pattern where it

    does not occur.

B2. For EVERY line classified ASSIGNMENT in B1, report its FULL open-brace stack per

    the enclosing-construct rule AND AMENDMENT 17, outermost first, each entry as

    [OPEN, CLOSE] with its RESOLVED HEADER line as <line>: <text> unmodified or

    HEADER UNRESOLVED, and state NESTING VERIFIED or STACK NESTING VIOLATED. Where

    an entry's header is for/while/switch/do, SAY SO EXPLICITLY. NOT ENCLOSED is a

    legal answer.

B3. Take the LOWEST-numbered line classified ASSIGNMENT in B1. If ABSENT, report

    ABSENT and paste nothing. Otherwise report the INNERMOST brace entry from its B2

    stack as [Iopen, Iclose] and its integer line count Iclose - Iopen + 1, then

    paste EVERY line from Iopen through Iclose contiguously if that count <= 150;

    otherwise say EXCEEDS 150 and paste the entry's resolved header line, the lines

    from Iopen through Iopen + 25, and the lines from Iclose - 25 through Iclose,

    stating all ranges. Apply AMENDMENT 19's paste-completeness report.

    Then, from whatever you pasted only, report every line containing an unquoted

    "(" immediately followed by a type-looking token and an unquoted ")" — that is,

    report every line containing the exact text  (double)  and every line containing

    the exact text  (long)  and every line containing the exact text  (int)  , as

    SEPARATE PATTERNS, each as <line>: <text>, with N_OCC per pattern and a single

    N_LINES, or ABSENT per pattern.

B4. In SRJ_FlowLogic.mq5 only, whole file, census each of these as a SEPARATE

    PATTERN under the multi-pattern and substring rules:

        (double)

        (long)

        NormalizeDouble

        MathAbs

        DBL_EPSILON

    Report N_OCC per pattern and a single N_LINES for the file. Paste every distinct

    line once as <line>: <text> with [matched: ...]. For every pasted line report

    its enclosing function by the definition-header rule with the region in its

    SIX-FIELD form, or NO ENCLOSING FUNCTION - FILE SCOPE. Report ABSENT per pattern

    where it does not occur. NO CAPS. A count of 0 is a result.

BLOCK C — THE FILE-SCOPE BUFFER ARRAY DECLARATION REGION, LOCATED WITHOUT ANY

POSITION ASSUMPTION. 4 ITEMS.

C1. In SRJ_FlowLogic.mq5 only, whole file, census each of these as a SEPARATE

    PATTERN under the multi-pattern and substring rules:

        g_bufFractalHigh

        g_bufFractalLow

    Report N_OCC per pattern and a single N_LINES for the file. Paste every distinct

    line once as <line>: <text> with [matched: ...]. For every pasted line report

    its enclosing function by the definition-header rule INCLUDING ITS FALLBACK,

    with the region in its SIX-FIELD form, or NO ENCLOSING FUNCTION - FILE SCOPE.

    Report ABSENT per pattern where it does not occur.

C2. For each of the two patterns in C1, and applying AMENDMENT 18's EXTENSION,

    report every line on which that identifier occurs immediately followed by the

    character  [  , as:

        <line>: <text>

        COLUMN OF IDENTIFIER <1-based column at which the identifier begins>

        FIRST TOKEN OF LINE <verbatim>

        LINE ENDS IN SEMICOLON <yes or no>

        FIRST NON-SPACE CHARACTER IS "//" <yes or no>

    in ascending line order, with the integer count per pattern. If no such line

    exists for a pattern, report NO DECLARATION FOUND for that pattern.

C3. In SRJ_FlowLogic.mq5 only, whole file, on comment-stripped text, report EVERY

    line that ends in  ;  AND contains the two-character text  []  , as:

        <line>: <text>

        COLUMN OF FIRST NON-SPACE CHARACTER <1-based>

        FIRST TOKEN OF LINE <verbatim>

        IDENTIFIER IMMEDIATELY PRECEDING "[]" <verbatim, or NOT FOUND>

    in ascending line order, with AMENDMENT 15 applied — a line whose first

    non-space token is  }  is reported as CLOSING BRACE and is never one of these.

    Report the integer count, and report the LOWEST and the HIGHEST such line as

    TWO SEPARATE ANSWERS. Then report, for each such line, its enclosing function by

    the definition-header rule with the region in its SIX-FIELD form, or

    NO ENCLOSING FUNCTION - FILE SCOPE. A count of 0 is a result.

C4. Report the integer line count of the span from the LOWEST to the HIGHEST line

    reported in C3, inclusive. If that count <= 200, paste the span contiguously,

    one pasted source line per output line, with line numbers and all leading

    whitespace. If it exceeds 200, say EXCEEDS 200 and paste the LOWEST line through

    LOWEST + 40, and HIGHEST - 40 through HIGHEST, stating both ranges.

    Apply AMENDMENT 19's paste-completeness report to whatever you pasted. If the

    paste is PASTE INCOMPLETE, say so, name the first line not emitted, declare it

    in "Truncations", and do not describe the item as answered.

    ★ This span is an INSERTION-POINT anchor only. No scope verdict, no attribution

      verdict and no classification gating a design decision may be built on it. ★

BLOCK D — THE ArrayInitialize GUARD AND THE FIRST-CALCULATION PATH. 4 ITEMS.

D1. In SRJ_FlowLogic.mq5 only, locate  OnCalculate  by the definition-header rule

    INCLUDING ITS FALLBACK. Report every candidate, its parameter-list closing line,

    and its classification. Report the DEFINITION in its SIX-FIELD form and confirm

    brace counting was used. DO NOT PASTE THE REGION. Then, from that range only and

    naming the paste searched, report EVERY line containing  ArrayInitialize  under

    the substring rule, as <line>: <text>, in ascending line order, with N_OCC and a

    single N_LINES. Report the LOWEST and the HIGHEST such line as TWO SEPARATE

    ANSWERS. ABSENT is a legal answer.

D2. For the LOWEST line reported in D1 and, separately, for the HIGHEST line

    reported in D1, report the FULL open-brace stack per the enclosing-construct

    rule AND AMENDMENT 17, outermost first, each entry as [OPEN, CLOSE] with its

    RESOLVED HEADER line as <line>: <text> unmodified or HEADER UNRESOLVED, and

    state NESTING VERIFIED or STACK NESTING VIOLATED. Where an entry's header is

    for/while/switch/do, SAY SO EXPLICITLY. NOT ENCLOSED is a legal answer. Report

    whether the two statements share the SAME innermost entry, as

    SAME INNERMOST ENTRY: yes with its [OPEN, CLOSE]  or  no with both pairs.

D3. Take the INNERMOST brace entry of the LOWEST line reported in D1, as

    [Iopen, Iclose] from D2. Report its integer line count Iclose - Iopen + 1. If

    that count <= 150, paste EVERY line from Iopen through Iclose contiguously, one

    pasted source line per output line. Otherwise say EXCEEDS 150 and paste the

    entry's resolved header line, the lines from Iopen through Iopen + 25, and the

    lines from Iclose - 25 through Iclose, stating all ranges. Apply AMENDMENT 19's

    paste-completeness report.

D4. From the D1 OnCalculate range only, census each of these as a SEPARATE PATTERN

    under the multi-pattern and substring rules:

        prev_calculated

        rates_total

    Report N_OCC per pattern and a single N_LINES. Paste every distinct line once as

    <line>: <text> with [matched: ...], in ascending line order. Classify each as

    ASSIGNMENT (by the assignment-target rule, with its RHS), COMPARISON (by the

    comparison rule), or OTHER stating which. Report ABSENT per pattern where it does

    not occur. NO CAPS. Do not sum N_LINES across the two patterns.

BLOCK E — ANCHOR VERIFICATION AND BYTE REPORT. 4 ITEMS.

★ The line numbers in E1 and E2 are VERIFICATION TARGETS, supplied under the carve-

  out stated in the rule block above. These items ask for VERBATIM TEXT and BYTES

  only. No region bound, no scope verdict, no classification and no design decision

  may be built on them. No expected text is supplied and none may be inferred. ★

E1. In SRJ_FlowLogic.mq5 only, report the following lines, each as

    <line>: <text> verbatim with all leading whitespace, one pasted source line per

    output line, in the order listed, and for each also report

    COLUMN OF FIRST NON-SPACE CHARACTER <1-based>:

        8

        9

        617

        664

        797

        898

        899

        902

        903

        904

    If a line number exceeds the file's line count, report LINE DOES NOT EXIST and

    report the file's integer line count.

E2. In SRJ_State.mqh only, report the following lines, each as <line>: <text>

    verbatim with all leading whitespace, one pasted source line per output line, in

    the order listed, and for each also report

    COLUMN OF FIRST NON-SPACE CHARACTER <1-based>:

        96

        97

        126

        127

        128

        246

        247

        249

        327

        328

        329

    If a line number exceeds the file's line count, report LINE DOES NOT EXIST and

    report the file's integer line count.

E3. Apply AMENDMENT 21 to every line reported in E1 and every line reported in E2.

    Per line report either ASCII CLEAN, or one

    NON-ASCII BYTE AT COLUMN <1-based column>, VALUE 0x<hex>

    entry per offending byte. Report the integer count of lines that are not ASCII

    CLEAN.

E4. For SRJ_FlowLogic.mq5 and for SRJ_State.mqh, each reported separately, report

    EVERY line containing at least one byte other than TAB (0x09) or 0x20 through

    0x7E, as:

        <file> <line>: NON-ASCII BYTE AT COLUMN <1-based>, VALUE 0x<hex>

    one entry per offending byte, in ascending line order.

    DO NOT PASTE THE LINE TEXT for these lines. Report the integer count of such

    lines per file. A count of 0 is a result and is reported as

    NO NON-ASCII BYTES IN THIS FILE.

REPORT FORMAT

TASK 155-Pre2: COMPLETED | BLOCKED | PARTIAL | RELAY INCOMPLETE | DESTINATION MISSING

Reference documents loaded: <every one, by filename, or "none">

Relay check: <token END-OF-TASK-155-PRE2 PRESENT or ABSENT> |
             <per-block item counts received, as five integers in block order> |
             <COUNT LINE CONSISTENT or COUNT LINE INCONSISTENT with both figures>

Report destination: <the full path written>

Files read: <every full path and the command used>

Files written: <the report destination path only>

Checkpoints: none (read-only task)

Commands that failed: <command as issued and raw error text, or "none">

Splits declared: <block, item, exact resume line, or "none">

                 A PART BOUNDARY IS A SPLIT AND MUST APPEAR HERE, AND EVERY PART

                 MUST BE DELIVERED. The FILE must be complete regardless.

Truncations: <block and item with "TRUNCATED AT n OF total", or "none">

             EVERY PASTE INCOMPLETE ASSERTION FROM AMENDMENT 19 MUST APPEAR HERE.

Amendment 19 used: <per paste: PASTED FROM / THROUGH / PASTED LINE COUNT /

                    DECLARED SPAN COUNT / PASTE COMPLETE or PASTE INCOMPLETE>

Amendment 20 used: confirm each item was answered EXACTLY ONCE and that no item's

                    heading, bounds or answer appears twice

Report-text fidelity: confirm no pasted source line and no pattern name was

                    post-processed, reflowed, spell-corrected or annotated, and that

                    the report is plain ASCII apart from AMENDMENT 21's byte reports

Definition-header classifications: <every candidate, its param-list closing line,

                                    DEFINITION or DECLARATION, and whether the

                                    fallback was reached>

Region-bounds convention: confirm EVERY region in EVERY block was reported in its

                    SIX-FIELD form, and that no single integer was called

                    "the line count"

Paste-sizing rule: <per region, WHOLE / TERMINATOR-BOUNDED / EXCEEDS N, and the

                    BODY LINES figure the bound was tested against>

Brace rule used: brace counting — confirm per region bounded in A1, A3, A4, B1, B3,

                    C1, C3, D1, D3

Amendment 17 used: confirm EVERY reported brace stack carries its [OPEN, CLOSE]

                    pairs and its nesting assertion, and state NESTING VERIFIED or

                    name every STACK NESTING VIOLATED stack

PowerShell variable-case check: confirm no helper used two variable names differing

                    only in case, and state how the stacks were cross-checked

Enclosing-construct rule used: confirm FULL open-brace stacks were computed and

                    headers resolved by upward scan, not proximity

Amendment 18 used: confirm C2 reported the COLUMN and FIRST TOKEN rather than

                    asserting a position, and that B1's classifications were not

                    built on an assumed argument position

Declared types: confirm A2 reported the type token VERBATIM and made NO agreement,

                    match or appropriateness judgment

Reachability: confirm A5 reported occurrences only and made NO accessibility,

                    validity or usability judgment

Amendment 21 used: confirm every byte outside TAB and 0x20-0x7E was reported by

                    column and hex value and that none was substituted or omitted

Amendment 15 used: confirm no "}" line was reported as a declaration in A2, B1 or C3

Census-pattern provenance: confirm every pattern naming a function was matched as

                    supplied, and report INCIDENTAL-ONLY where it applies

Block E carve-out: confirm Block E's line numbers were used for VERBATIM TEXT and

                    BYTES only, and that no region bound, scope verdict or

                    classification anywhere in this report rests on them

<Block A: A1 COrderblock census and class six-field bounds, A2 class paste and the

          objId declaration, A3 objId 16-file census, A4 the two OrderblockMgr

          regions with six-field bounds, pastes and tickOBIsValid assignments,

          A5 parameters, every "ob." occurrence, the distinct member set, and

          whether ob.objId occurs>

<Block B: B1 the two objId buffer censuses with classifications and enclosing

          regions, B2 stacks with nesting assertions, B3 innermost entry paste and

          the cast census, B4 whole-file conversion-convention census>

<Block C: C1 fractal buffer censuses, C2 column and first-token report per

          declaration-shaped line, C3 every "[];"-shaped line with columns and

          enclosing regions, C4 the span paste with its completeness assertion>

<Block D: D1 OnCalculate six-field and every ArrayInitialize line with lowest and

          highest, D2 both stacks and the same-innermost-entry answer, D3 innermost

          entry paste, D4 prev_calculated and rates_total census>

<Block E: E1 FlowLogic verification lines, E2 State verification lines, E3 per-line

          byte report, E4 whole-file non-ASCII byte report for the two files>

FINAL ITEM, MANDATORY — THIS ITEM MUST APPEAR IN THE DELIVERED OUTPUT AND IN THE

WRITTEN FILE:

  certutil -hashfile "DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256    -> paste raw

  certutil -hashfile "DF\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256    -> paste raw

  Compare each to the value supplied in this task's header. State MATCH or

  MISMATCH per file, quoting both the supplied value and the observed value.

No diagnosis. No hypothesis. No architecture opinion. No statement about what any

number means.

RESTRICTIONS CHECKLIST

- No source edits. No compile. No test run. No file written under MQL5\Experts\,

  MQL5\Indicators\ or MQL5\Include\. No existing file modified anywhere. The ONLY

  permitted write is the report destination named in this header.

- No read of the report destination directory, and no D: path read at all (P14).

- No reference document, language guide, pattern library, prior revision or prior

  builder result loaded or consulted. Declare "Reference documents loaded:" (P17).

- No line number from any previous task used as an anchor in Blocks A, B, C or D.

  Block E's line numbers are verification targets and carry no verdict.

- No expected count, no expected region size, no expected text, and no comparison to

  any figure from any previous task — including 160-PreG, 160-PreH, 160-PreJ,

  154-Pre1, 154-Pre2, 154-Pre3-R and 155-Pre1.

- No attribution verdict from 160-PreH quoted, compared against, or re-derived.

- Every region reported in its SIX-FIELD form. No single integer called "the line

  count."

- Every brace stack reported with [OPEN, CLOSE] pairs and amendment 17's nesting

  assertion. No verdict built on a STACK NESTING VIOLATED stack.

- Every contiguous paste carries amendment 19's completeness assertion. A short

  paste is declared PASTE INCOMPLETE and named in Truncations.

- Every item answered exactly once. No duplicated heading, bounds or answer.

- No pasted source line or pattern name post-processed, reflowed, spell-corrected,

  joined or annotated.

- No type-agreement, match or appropriateness judgment anywhere. A2 reports tokens.

- No reachability, accessibility, validity or usability judgment anywhere. A5

  reports occurrences.

- No position asserted without reporting the column and the first token.

- No "}" line reported as a declaration.

- No argument list reported as UNTERMINATED.

- No N_LINES summed across patterns. No completeness verdict on a summed

  per-pattern total.

- No non-ASCII byte substituted, transcoded, normalised or omitted. Every one

  reported by column and hex value.

- No buffer index proposed, no buffer count asserted, no SState field name proposed,

  no sentinel value proposed, no field type recommended, no capacity.

- No iCustom or input change. No .txt dump as source.

- No objId treated as a cross-run identity.

- No inferred value substituted for missing data. Every legal answer is a correct

  answer, including ABSENT, NOT FOUND, NO DECLARATION FOUND, NO DEFINITION FOUND,

  TYPE NOT DECLARED IN THIS PASTE, PASTE INCOMPLETE and ASCII CLEAN.

- No verdict built on an INCIDENTAL, STRING-LITERAL, COMMENT or

  CONTAINS-EQUALS-NOT-TARGET line.

- No production code in the response. No paste abbreviated with "...". No line

  retyped. No shell prompt text inside a paste. One pasted source line per output

  line, in every statement list.

- No region pasted whose six-field bounds were not reported first.

- A part boundary is a split, must be declared, and every part must be delivered

  including the final hash item. The written file must be complete regardless.

- Both hashes must match the supplied values at the end.

END-OF-TASK-155-PRE2

DEFECT 110  A Form D was issued with unbounded output and no part mapping, so the
            builder chose the delivery shape. The delivery rule permitted a split
            but nothing pre-declared one.
            CLOSED BY — the output-budget rule: a Form D states its part count and
            its block-to-part mapping in the header, and the report destination is
            written once, complete, after the final part.

DEFECT 111  ROOT CAUSE, and it is the planner's. The census rule block mandates
            brace counting but never mandated MECHANICAL DERIVATION, so
            hand-transcription of thousands of source lines was a legal method for
            every item in every Form D issued to date. Both observed failure modes
            share this cause: a builder that transcribed by hand for three hours
            and corrupted the output (defects 105, 108, 109, §17.53), and a builder
            that measured the same job and returned a non-response.
            Parent of 105, 108, 109.
            CLOSED BY — AMENDMENT 22, the mechanical derivation rule.

DEFECT 112  The report destination could be occupied by a stub before any legal
            status was reached. A non-report file at that path is indistinguishable
            from a result to any later session.
            CLOSED BY — the output-budget rule's single-write clause, and: a file at
            a report destination that does not carry one of the five statuses is
            renamed VOID_<name>_nonresponse.md and is never read as a result.

AMENDMENT 22  mechanical derivation rule — every figure and every paste derived by
              an inline shell command, quoted in the report; no hand transcription.
              The §3.5 block now carries TWENTY-TWO amendments. Update the §9
              inventory. [defects 105, 108, 109, 111]

★ BUILDER-DISCRETION RULE   — the builder never chooses an approach, proposes an
  alternative deliverable, or asks the planner a question. Five legal statuses.
  Anything else is a NON-RESPONSE, not a PARTIAL, and carries no evidentiary
  weight. Defect 110.
★ TOOL-ARTIFACT RULE       — inline commands permitted without limit; no script,
  helper, module, temp file or intermediate output created or persisted. The only
  write is the report destination. Verification never shifts to the operator.
  Defect 110.
★ OUTPUT-BUDGET RULE       — the header states the part count and the
  block-to-part mapping; the destination file is written once, complete, after the
  final part. Defect 110, 112.

Last defect 112. Last amendment 22. Findings, limitations, rulings and open items
unchanged — 155-Pre2 has returned no source evidence.

DIRECTIVE 155-Pre2-D3. Issued task text, extending TASK_155-Pre2. Not a reference
document under P17. SUPERSEDES DIRECTIVES D1 and D2 entirely. TASK_155-Pre2's five
blocks, twenty-one items, per-block counts and terminator token are UNCHANGED.

A previous attempt at this task returned a report that answered twenty-one questions
OF ITS OWN DEVISING under a COMPLETED status line, and twice overrode its own
correct command output with an invented convention. The nine rules below exist to
make both impossible. Read them before reading any file.

1. ITEM-RESTATEMENT RULE. Each answer opens with the item identifier, then an
   enumeration of that item's REQUIRED OUTPUTS as the item's own text states them,
   then the answer, then a final line reading
       ITEM CONFORMANCE: ALL REQUIRED OUTPUTS DELIVERED
   or  ITEM CONFORMANCE: NOT DELIVERED - <each missing output named>
   An item missing any required output is ITEM NOT ANSWERED. Never answer a
   different question in its place. A report with any ITEM NOT ANSWERED is PARTIAL.

2. AMENDMENT 22 - MECHANICAL DERIVATION RULE. Every count, line number, column,
   brace bound, byte report and paste is DERIVED BY AN INLINE SHELL COMMAND, never
   by reading and transcribing. Quote the command and paste its output for every
   item. A figure not traceable to a quoted command is not answered.

3. AMENDMENT 23 - OUTPUT-BINDING RULE. The quoted command's output IS the answer.
   If you believe an output is wrong, report OUTPUT DISPUTED with both figures and
   your reason, AND REPORT THE COMMAND'S FIGURE AS THE ANSWER. Do not correct,
   convert, round or substitute. BODY LINES is defined by the region-bounds
   convention rule as CLOSING BRACE minus OPENING BRACE plus 1 and by nothing else.
   No external convention, standard or practice may override a definition in this
   task's rule block.

4. AMENDMENT 24 - PATTERN-FIDELITY AND SCOPE-DECLARATION RULE. Every census reports
       PATTERN AS SUPPLIED: <the literal text from the item>
       COMMAND: <the exact command string issued>
       ASSERTION: PATTERN AS SUPPLIED  or  PATTERN SUBSTITUTED
       SCOPE: WHOLE FILE, LINES 1 THROUGH <file line count>
         or SCOPE: LINES <a> THROUGH <b>, ESTABLISHED IN THIS TASK BY <item>
   A regex, wildcard, case-insensitive flag or word-boundary token is a SUBSTITUTION
   unless the item's text supplies it. All matching is CASE-SENSITIVE. A scope
   narrower than the item states VOIDS the item. No line range from any previous
   task may bound any census in Blocks A, B, C or D.

5. FILE-PATH RULE. Every census hit, every definition candidate and every region is
   reported with its FULL FILE PATH. Where an item spans sixteen files, every file
   is listed with its count including the files whose count is 0.

6. STACK-COMPUTATION RULE. Every brace stack entry's RESOLVED HEADER must satisfy
   header line < that entry's OPEN line, and every entry must satisfy
   parent.OPEN < child.OPEN and child.CLOSE < parent.CLOSE. Compute and print these
   comparisons as numbers before stating NESTING VERIFIED. A header line lying
   outside its own entry's [OPEN, CLOSE] is STACK NESTING VIOLATED. Do not type the
   assertion; derive it.

7. BUILDER-DISCRETION RULE. You do not choose an approach, propose an alternative
   deliverable, or ask the planner a question. Legal outputs are the item answers
   and one of COMPLETED, BLOCKED, PARTIAL, RELAY INCOMPLETE, DESTINATION MISSING.
   Anything else is a NON-RESPONSE and carries no evidentiary weight. PARTIAL naming
   what you did not reach IS legal and is correct if you run short.

8. TOOL-ARTIFACT RULE. Any inline command is permitted. Do NOT create, write, save
   or persist a script, helper, module, temp file or intermediate output. The only
   permitted write is the REPORT DESTINATION.

9. TOKEN-SUBSTITUTION AND SINGLE-WRITE RULE. Replace every angle-bracket token in
   the REPORT FORMAT with its answer. Do not reproduce this task's rule block, item
   text or restrictions checklist in your report. The REPORT DESTINATION is written
   ONCE, COMPLETE, after PART 3. Never write a stub, a placeholder or a task copy to
   that path. If you cannot reach PART 3, report PARTIAL in your reply and write
   nothing to the report destination.

PART MAPPING, MANDATED:
    PART 1 of 3   Block A          (A1-A5)
    PART 2 of 3   Block B          (B1-B4)
    PART 3 of 3   Blocks C, D, E, then the FINAL HASH ITEM
Each part opens with PART n OF 3 and closes with END OF PART n OF 3. Declare all
three boundaries in Splits declared. The status line appears in PART 3 only, and is
COMPLETED only if all twenty-one items report ALL REQUIRED OUTPUTS DELIVERED and
both hashes match.

The FINAL HASH ITEM pastes certutil's RAW output including its header and trailer
lines, not the hash alone.

Everything else in TASK_155-Pre2 stands verbatim, including amendments 1-21.

Begin with PART 1 OF 3.

END-OF-DIRECTIVE-155-Pre2-D3