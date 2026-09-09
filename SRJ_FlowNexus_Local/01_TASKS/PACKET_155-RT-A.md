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

★ AMENDMENT 22 - MECHANICAL DERIVATION RULE. Every count, line number, column,

  brace bound, byte report and paste is DERIVED BY AN INLINE SHELL COMMAND, never

  by reading and transcribing. For every item, quote the exact command issued and

  paste its output. A figure that cannot be traced to a quoted command is not

  answered. EXTENSION: where a command emits summary lines, those lines are pasted

  VERBATIM; a derived restatement does not substitute for them. [defects 105, 108,

  109, 111, 129]

★ AMENDMENT 23 - OUTPUT-BINDING RULE. The quoted command's output IS the answer.

  A builder that believes an output is wrong reports OUTPUT DISPUTED with both

  figures and the reason, AND REPORTS THE COMMAND'S FIGURE AS THE ANSWER. No

  invented convention, correction, conversion, rounding or substitution. BODY

  LINES is defined by the region-bounds convention rule as CLOSING BRACE minus

  OPENING BRACE plus 1 and by nothing else. No external convention, standard or

  practice may override a definition in this rule block. [defect 116]

★ AMENDMENT 24 - PATTERN-FIDELITY AND SCOPE-DECLARATION RULE. Every census reports

      PATTERN AS SUPPLIED: <the literal text from the item>

      COMMAND: <the exact command string issued>

      ASSERTION: PATTERN AS SUPPLIED  or  PATTERN SUBSTITUTED

      SCOPE: WHOLE FILE, LINES 1 THROUGH <file line count>

        or SCOPE: LINES <a> THROUGH <b>, ESTABLISHED IN THIS TASK BY <item>

  A regex, wildcard, escape, whitespace-tolerant construct, case-insensitive flag

  or word-boundary token is a SUBSTITUTION unless the item's text supplies it. All

  matching is CASE-SENSITIVE. A scope narrower than the item states VOIDS the

  item. No line range from any previous task may bound any census. [defect 117]

★ AMENDMENT 25 - SUBSCRIPT-TOLERANT ASSIGNMENT-TARGET RULE. In condition (2) of

  the assignment-target rule, if the first non-space non-tab character right of the

  identifier is "[", advance to the MATCHING "]" at the same bracket depth and

  resume the scan from the next character. If the first non-space character after

  that "]" is "=" and the character after it is not "=", the line ASSIGNS TO the

  identifier and is reported as

      SUBSCRIPTED ASSIGNMENT TARGET, subscript <text between the brackets>

  with its RHS by amendment 11. Nested subscripts are handled by depth counting,

  never by finding the first "]". [defect 123]

★ AMENDMENT 26 - COMMAND-EXERCISE RULE. A census or classification command whose

  loop body executed zero times is reported as

  COMMAND NOT EXERCISED - ZERO ITERATIONS and may not be cited as the derivation

  of a result. An empty scope is reported as SCOPE EMPTY - NO DERIVATION REQUIRED.

  Verify that every quoted command's type names and cmdlets are the ones actually

  invoked. [defect 124]

★ AMENDMENT 8, EXTENDED TO FORM S. A Form B, Form D or Form S containing a

  bracketed instruction to another role, an unfilled reference, a rule cited by

  section number instead of pasted, or content deferred to a block "supplied

  alongside", is not issuable. Content is embedded in the same message, or the

  step names a file on disk to copy from. [defect 134]

★ AMENDMENT 12, EXTENDED. "NO ENCLOSING FUNCTION - CLASS BODY <class name>, region

  <six fields>" is a LEGAL ANSWER for a line inside a class or struct body that is

  not inside a function. [defect 120]

★ AMENDMENT 21, EXTENDED. A line containing a byte outside TAB (0x09) and 0x20

  through 0x7E is emitted from RAW BYTES. Where the channel cannot carry it, the

  line is reported as BYTE-SUBSTITUTED AT COLUMN <n>, VALUE 0x<hex>, is not

  presented as verbatim, and MAY NOT SERVE AS AN ANCHOR without a re-read under

  the anchor-verification rule. [defect 127]


AMENDMENT INVENTORY — TWENTY-SIX

The census block must carry all twenty-six amendments plus every named rule.

A missing entry is a blocking defect in the block, not an omission of detail.

 1  file-scope declaration rule, never enumerate type keywords

 2  enclosing-condition rule, brace scope not proximity

 3  comment exclusion in the assignment-target rule

 4  return-statement rule, statements vs substring hits

 5  multi-pattern totals rule, never sum N_LINES across patterns

 6  enclosing-construct rule, FULL brace stack with resolved headers

 7  falsifiability rule, a classification needs a paste

 8  no placeholder in an issued task, EXTENDED to Form S      [defect 134]

 9  block-comment rule

10  whole-token rule for language keywords

11  right-hand-side rule, RHS terminator

12  file-scope answer rule, EXTENDED with the class-body answer [defect 120]

13  census-pattern provenance rule, INCIDENTAL-ONLY, report and stop

14  attribution rule CORRECTED, parts (a)-(e) with (e1)(e2)(e3)

15  declaration brace exclusion

16  multi-line call rule                                       [defect 86/91]

17  stack-nesting verification rule                            [defect 99]

18  argument-position rule and its position-clause extension   [defects 98, 104]

19  paste-completeness rule                                    [defect 108]

20  single-answer rule                                         [defect 109]

21  non-ASCII byte rule, EXTENDED with byte-substitution        [defect 127]

22  mechanical derivation rule, EXTENDED with summary lines     [defects 111, 129]

23  output-binding rule                                        [defect 116]

24  pattern-fidelity and scope-declaration rule                [defect 117]

25  subscript-tolerant assignment-target rule                  [defect 123]

26  command-exercise rule                                      [defect 124]

Plus, unnumbered and all still binding: case-sensitivity, substring rule,

multi-pattern census rule, assignment-target rule, comparison rule,

definition-header rule with its FALLBACK, brace rule, region-bounds convention

rule, paste sizing rule, legal answers list, no-type-agreement rule,

no-reachability rule, answerability with computability and self-selection,

classify mechanically, no line number from a previous task is an anchor, no

expected value, paste contiguously, never abbreviate, no prose in place of data,

stasis values supplied in task text, PowerShell variable-case warning.

Plus the named rules: addendum source, compact handoff spine, relay integrity,

count arithmetic, region-bounds convention, naming, reader-class, closure-scope,

edit-region enumeration, ledger-to-rule-block reconciliation, report-destination

with supply clause, canonical-scope, anchor-verification, Form-B-first anchor

derivation, buffer-lifecycle, item-restatement, builder-discretion, tool-artifact,

output-budget, token-substitution, relay-safe-token, paste-source,

no-self-certification, edit-file byte-scope, bar-identifier, branch-form,

repository-inventory, scribe-conditional, literal-edit, P17.
FORM:            D — source-only
AUTHORIZATION:   NONE REQUIRED AND NONE ISSUED
PRODUCTION EDIT: NOT AUTHORIZED. Zero bytes written to the canonical tree.
COMPILE:         NOT AUTHORIZED
CHART ATTACH:    NOT AUTHORIZED
HARNESS RUN:     NOT AUTHORIZED
ORDERS:          NONE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      30 minutes. On any BLOCKED condition, report-before-stop.

PATH CONSTANTS and P17: identical to PACKET_160-PreK.md's header. Every source path is
the literal absolute path stated below. No filename search, glob, -Recurse, wildcard or
Navigator selection.

FILES READ:  DF\MQL5\Indicators\SRJ_FlowLogic.mq5
             DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
             plus, for STAGE 1 hashing only, the remaining fourteen.
             No other file is read. P11: read via shell, never open in MetaEditor.

PURPOSE, stated so a BLOCKED return is still a result
This packet establishes WHETHER BUFFER 34'S RUNTIME IDENTITY IS REACHABLE FROM THE
JOURNAL, and if not, whether it is reachable from a chart and by what mechanism. It
reads nothing at runtime. A finding that index 34 is a calculation buffer with no Data
Window presence is a SUCCESSFUL OUTCOME, not a failure. ITEM 4b IS THIS PACKET'S
DECISION POINT: if nothing reads index 34, open item 24 is PREMATURE rather than
unanswered.

--- STAGE 1 — whole-tree stasis, sixteen files ---

Identical to PACKET_160-PreK.md STAGE 1 in every respect: the same sixteen literal
certutil calls, targets read from 06_HANDOFFS\BUILDER_RESULT_155-REG.md STAGE 7,
case-insensitive hex, all sixteen MATCH required, both dir /-c calls RECORD-ONLY, any
MISMATCH is STOP and BLOCKED.

If BUILDER_RESULT_160-PreK.md exists and reports COMPLETED, targets may instead be read
from its STAGE 7. STATE WHICH REPORT WAS USED.

--- STAGE 2 — buffer registration surface in SRJ_FlowLogic.mq5 ---

Full-line pastes, contiguous, no ellipsis, no retyped line.

2a  Every "#property indicator_" line, full lines in file order. Count reported.
2b  The value of #property indicator_buffers AND the value of #property indicator_plots.
    If indicator_plots is ABSENT, say ABSENT — DO NOT INFER A DEFAULT.
2c  Every SetIndexBuffer( call. Full lines. Count reported. DO NOT SUMMARISE. For each:
    the index literal, the array identifier, and the third argument verbatim —
    INDICATOR_DATA, INDICATOR_CALCULATIONS, or absent.
2d  For indices 31, 32, 33, 34 specifically: the SetIndexBuffer line, the array's
    declaration line, and its ArraySetAsSeries line if present.
2e  Every PlotIndexSetDouble( and PlotIndexSetInteger( call. Full lines, multi-line
    argument lists closed by matching paren across lines. Count reported. Flag any
    carrying PLOT_EMPTY_VALUE.
2f  IndicatorSetString( calls, in particular any setting INDICATOR_SHORTNAME. Full
    lines, or ABSENT.
2g  #property indicator_separate_window or #property indicator_chart_window — which,
    or ABSENT.

--- STAGE 3 — buffer 34's write, initialisation and print surface ---

Using the array identifier established at 2d for index 34.

3a  Every line assigning to that array — <name>[ on the left of = . Full lines. For
    each, the enclosing function name by FULL OPEN-BRACE STACK, not proximity. Count.
3b  Every ArrayInitialize( call naming that array. Full lines, or ABSENT.
3c  Any per-bar or per-pass reset of that array — a write inside a bar loop not
    dependent on an object. Report as a classification WITH THE PASTE THAT COULD REFUTE
    IT (amendment 7).
3d  THE SENTINEL. State the value the array holds when no identity is exported, and
    cite the line that establishes it. If nothing establishes it, answer UNKNOWN — DO
    NOT CHOOSE AMONG CANDIDATES.
3e  The same as 3a for indices 31, 32 and 33: one write line each plus the enclosing
    function. If an index has no write, answer ABSENT.
3f  Every Print or PrintFormat call whose literal contains OBPROV. Full lines, argument
    list closed by matching paren across lines. Enclosing function by full open-brace
    stack. Count reported. For each: the expression passed as code, as id, and as flag,
    verbatim. ADDITIONALLY: state the complete set of literal values the code
    expression can take, BY PASTE. Codes 3 through 8 are observed at runtime; codes 1
    and 2 are not. Whether the enumeration is six wide, eight wide, or wider is this
    item's question, and it is answered by source or answered UNKNOWN.
3g  State MECHANICALLY whether the expression passed as id at 3f is the SAME EXPRESSION
    as the assignment to the buffer-34 array at 3a. ANSWER BY PASTE, NOT PROSE. If they
    are different expressions, paste both and say so. If undeterminable from these
    lines, answer UNKNOWN. DO NOT INFER EQUIVALENCE FROM SIMILAR NAMING.
3h  Every Print or PrintFormat call whose literal contains SLSIDEGUARD. Full lines.
    Report the expression passed as the close field verbatim, and its array index or
    shift argument if it has one. RECORD-ONLY. THIS ITEM DOES NOT GATE THIS PACKET AND
    NO VERDICT DEPENDS ON IT.

--- STAGE 4 — the consumer surface in SRJ_FlowNexus_EA.mq5 ---

4a  Every iCustom( call in the EA. Full lines, ARGUMENT LIST CLOSED BY MATCHING PAREN
    ACROSS LINES per the multi-line call rule. Count reported. If ABSENT, say ABSENT.
4b  Every CopyBuffer( call in the EA. Full lines. For each, the buffer index argument
    verbatim, and the enclosing function by full open-brace stack. Count reported.
    THEN STATE MECHANICALLY whether any CopyBuffer call names index 34, and if so paste
    it. IF NONE DOES, ANSWER "NO CONSUMER OF INDEX 34". THIS IS THE PACKET'S DECISION
    POINT AND IT MUST BE ANSWERED AS A SINGLE EXPLICIT LINE.
4c  FlowLogic's complete input declaration list. Full lines, file order, type, name and
    default value as written. Count reported.

--- STAGE 5 — object naming, for ground truth ---

5a  Every assignment to obLineName and to midLineName. Full lines, enclosing function
    by brace stack.
5b  State whether the constructed name contains the object's objId, and cite the paste
    that establishes it. If the construction uses a counter, a bar index, a time, or
    anything other than objId, say so and name what it uses. If undeterminable from
    these lines, answer UNKNOWN.

--- STAGE 6 — post-read stasis ---

Re-run STAGE 1's sixteen hashes and both dir /-c calls. All sixteen EQUAL, both
artifact file lines UNCHANGED.

--- STAGE 7 — persist ---

06_HANDOFFS\BUILDER_RESULT_155-RT-A.md
Resolved absolute path reported once, then a post-write verification read: byte size
and integer line count.

--- REPORT FORMAT ---

As PACKET_160-PreK.md's format, with this verdict block replacing the collision verdict:

MECHANISM VERDICT, three lines, mechanical only:
  index 34 is WITHIN indicator_plots | BEYOND indicator_plots | UNDETERMINED
  buffer 34's identity is LOG-READABLE via OBPROV | NOT LOG-READABLE | UNDETERMINED
  index 34 consumer: NO CONSUMER | CONSUMED at <function>, line <n>

No diagnosis. No statement about whether buffer 34 is correct — that is council's.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results.
BLOCKED-FOR-COUNCIL rather than a guess.
