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
FORM:            D - SOURCE-ONLY CENSUS. Predecessor Form D for Task 161.
AUTHORIZATION:   NONE REQUIRED, NONE ISSUED. A source-only Form D needs no token.
PRODUCTION EDIT: NOT AUTHORIZED. ZERO BYTES ARE WRITTEN TO ANY .mq5 OR .mqh.
COMPILE:         NOT AUTHORIZED. NOT PERFORMED.
HARNESS RUN:     NOT AUTHORIZED. NOT PERFORMED.
CHART ATTACH:    NOT AUTHORIZED.   ORDERS: NONE. Operation is alert-only.
DELETE:          NOT AUTHORIZED ANYWHERE.
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      45 minutes.

PURPOSE
Task 161 wraps the EA's hypothesis cascade in LoadWorkingSet / HypothesisCascade /
StoreWorkingSet so that a hypothesis can be evaluated without mutating another's state,
and proves it with a PER-FIELD LOAD/STORE LOG. That is Milestone 1. This packet
establishes the surface Task 161 edits, AT CURRENT LINE NUMBERS DERIVED BY CENSUS.

WHY THE LINE NUMBERS IN THE HANDOFF ARE NOT USABLE AS ANCHORS
Revision 63 section 3.6 lists re-based locators - nine g_state writes at 1740, 1781, 2883,
2896, 2908, 3386, 3525, 3614, 3700 and others - obtained by adding 648 to pre-Task-160
positions. They are ADMISSIBLE FOR LOCATION ONLY and P12 forbids using them as anchors.
EVERY FIGURE IN THIS REPORT IS DERIVED BY COMMAND FROM THE FILE ON DISK. Where a derived
figure differs from the re-based expectation, REPORT BOTH AND CONTINUE - a difference is a
finding about the handoff, not an error in the file.

PATH CONSTANTS - the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
EA   = DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
ST   = DF\MQL5\Include\SRJ\SRJ_State.mqh
EVERY RELATIVE PATH RESOLVES UNDER ROOT, NOT UNDER DF\MQL5.

P17: no file is located by filename search, glob, -Recurse, wildcard or MetaEditor
Navigator selection. Every path is literal. A glob whose result happens to agree is STILL
A DEVIATION and is declared. P10: no compile. P11: never open a non-allow-listed file in
MetaEditor. P18: no .ex5 is created, copied or read under 02_TASK_CHECKPOINTS.

CENSUS DISCIPLINE, BINDING ON EVERY COUNT BELOW
  Comment content is DISCARDED BEFORE COUNTING - R-135. Strip // to end of line and
    /* ... */ spans first. Report both the raw and the comment-stripped figure wherever
    they differ, and USE THE STRIPPED FIGURE AS THE ANSWER.
  Identifier matches are WHOLE TOKEN, not substring: a match must not be flanked by
    [A-Za-z0-9_].
  Matches are CASE-SENSITIVE. MQL5 is case-sensitive and SL_REF taught this project that
    lesson once already.
  Region boundaries are established by BRACE COUNTING, never by indentation.
  NO COUNT IN THIS PACKET MAY BE SATISFIED BY THIS PACKET'S OWN INSTRUCTION TEXT.
  Report ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as DISTINCT results.

STOP DISCIPLINE, EXHAUSTIVE. THIS PACKET STOPS ON THREE CONDITIONS AND NO OTHERS:
  a STAGE 1 digest MISMATCH on any of the sixteen
  the EA's byte size or line count differing from 191970 / 3850
  a post-read digest change at STAGE 8
EVERYTHING ELSE DEGRADES AND REPORTS. Where a figure cannot be derived, report NOT
DERIVABLE, name exactly what was missing, and CONTINUE. NEVER GUESS A CLASSIFICATION -
report AMBIGUOUS with the line verbatim and let council rule.

REPORT CONTRACT - DELTA AND EXCEPTION ONLY, WITH NAMED EXCEPTIONS
  Reported IN FULL, because Task 161 cannot be written without them: every g_state
    occurrence at STAGE 2, every field declaration at STAGE 4b, every unassigned field at
    STAGE 4c, every return site at STAGE 3b, the intersection table at STAGE 5, every hit
    at STAGE 6, and the anchor context at STAGE 7.
  One line or one row: a hash that MATCHES, a count that meets its expectation.
  Do not include: certutil success echoes, command strings for commands that succeeded,
    per-file zero rows, methodology beyond one block at the top, or any restatement of
    this packet's instructions.
  A report that omits a disagreement is a defect. A report that expands an agreement is
  waste.

--- STAGE 1 - pre-read stasis, sixteen files ---

certutil -hashfile "<literal path>" SHA256 on each of:
DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
DF\MQL5\Indicators\SRJ_FlowLogic.mq5
DF\MQL5\Include\SRJ\SRJ_Alerts.mqh
DF\MQL5\Include\SRJ\SRJ_BiasEngine.mqh
DF\MQL5\Include\SRJ\SRJ_Draw.mqh
DF\MQL5\Include\SRJ\SRJ_Fractals.mqh
DF\MQL5\Include\SRJ\SRJ_HTFEngine.mqh
DF\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
DF\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh
DF\MQL5\Include\SRJ\SRJ_Panels.mqh
DF\MQL5\Include\SRJ\SRJ_SeedFormat.mqh
DF\MQL5\Include\SRJ\SRJ_Sessions.mqh
DF\MQL5\Include\SRJ\SRJ_State.mqh
DF\MQL5\Include\SRJ\SRJ_Text.mqh
DF\MQL5\Include\SRJ\SRJ_TickCore.mqh
DF\MQL5\Include\SRJ\SRJ_Types.mqh

TARGETS: every one of the sixteen is taken from the STAGE 1 section of
06_HANDOFFS\BUILDER_RESULT_160-REG-R2.md, which is the most recent whole-tree measurement
and already carries the post-Task-160 EA digest. No second report is parsed and no target
is read from a handoff. Case-insensitive hex; a case difference is NEVER a MISMATCH.
ALL SIXTEEN MATCH REQUIRED. Any MISMATCH: STOP, report BLOCKED.
Also report the EA's byte size and integer line count - expected 191970 and 3850 - and
ST's byte size and integer line count. A difference on the EA is a STOP.

--- STAGE 2 - the g_state census. This is the adapter surface. ---

2a  Every occurrence of the whole token g_state in the EA, comment-stripped. Report:
      the total OCCURRENCE count
      the total count of DISTINCT LINES carrying at least one occurrence
      the raw figure before comment-stripping, if different
    Then, IN FULL, one row per occurrence: line number | column | the complete line
    verbatim. Where a line carries two occurrences, give it two rows.
    RECONCILE AGAINST THE HANDOFF, which states nine writes plus 65 reading lines and 73
    occurrences. NOTE THAT 9 + 65 = 74, NOT 73. Report your measured occurrence count and
    distinct-line count beside 73 and 74, and state in one line which of the handoff's
    three figures your measurement contradicts, if any. DO NOT ADJUST YOUR FIGURES TO
    MATCH. This reconciliation is a deliverable.
2b  Classify every occurrence by ONE MECHANICAL TEST AND NO OTHER: the occurrence is a
    WRITE if the token is the left operand of an assignment - the next non-whitespace
    character after the token is '=' and the character after that is NOT '='. Otherwise
    it is a READ.
    Report two lists of line numbers, with counts. Expected nine WRITEs. If the count is
    not nine, report yours beside nine and CONTINUE.
    ANY occurrence you cannot classify by that test - compound assignment, a macro, a
    token inside a string literal, anything at all - is reported as AMBIGUOUS with the
    line verbatim and is NOT classified. Council rules on ambiguity.
2c  For every occurrence, name the enclosing function by BRACE COUNTING from file scope:
      occurrence line | enclosing function's signature line number | function name
    Report the distinct set of enclosing functions with an occurrence count each,
    descending. THIS SET IS THE ADAPTER SURFACE.
2d  The declaration of g_state: line number, the complete line verbatim, and its declared
    type. Confirm by brace count that it is at FILE SCOPE. Expected near re-based 815;
    report the measured number beside 815.

--- STAGE 3 - the cascade boundary, and the return sites the wrapper depends on ---

3a  For each distinct function from 2c THAT CONTAINS AT LEAST ONE WRITE: report its
    signature line verbatim, its signature line number, its opening brace line number,
    its closing brace line number by brace count, and its total line count. Order by
    signature line number.
3b  IN FULL: every return statement inside those functions, comment-stripped, whole token.
    Report enclosing function | line number | the complete line verbatim. Report a per
    function count and a total.
    WHY THIS IS IN FULL AND NOT A COUNT: A-3 section 5.8's wrapper claims "zero
    return-site edits". If StoreWorkingSet must run on exit, every return site is a place
    the working set could escape unstored. The count alone cannot tell council whether the
    claim holds; the sites can.
    R-135 APPLIES WITH FORCE HERE: 'return' is an ordinary English word and this project
    has already been bitten once by a comment-blind return gate.
3c  For each function from 3a, every call site elsewhere in the EA: caller function name,
    line number, the complete line verbatim. Report NO CALL SITE FOUND explicitly if a
    function has none.

--- STAGE 4 - the SState surface, which is the per-field instrument's field set ---

4a  In ST: the struct SState header line number, its closing line number by brace count,
    its body line count, and the line number of the instance declaration whose text is
    SState g_s;. Report each measured figure beside the handoff's expectation of 96, 257,
    161 and 259. Confirm by census that the struct declares NO METHODS - report the count
    of parentheses in its comment-stripped body, and if non-zero, report every such line
    verbatim rather than concluding anything.
4b  IN FULL: every field declaration inside the struct. One row each: line number |
    declared type | field name | array bound if any. Report the total field count.
    This list is the FIELD SET of Milestone 1's per-field load/store log. Task 161 cannot
    be written without it and it may not be summarised.
4c  SRJ_StateInit: its signature line number, opening and closing brace line numbers by
    brace count, and the count of assignment statements inside it. Report each beside the
    handoff's 307, 505 and 153.
    Then, IN FULL, the P5a RECONCILIATION: every field name from 4b that does NOT appear
    as the left operand of an assignment inside SRJ_StateInit. Report the list and its
    count, or NONE. Report the reverse too - anything assigned in SRJ_StateInit that is
    not a field from 4b - or NONE.
    AN UNASSIGNED FIELD IS A FINDING, NOT A DEFECT COUNCIL WILL MINT A NUMBER FOR HERE:
    report it, name it, and do not characterise it. The adapter would inherit it.
    Confirm whether the last field in declaration order is tickOBSetterBar, and whether
    it is assigned.
4d  ST line 188: report it verbatim, report whether it is inside a comment by census of
    the enclosing lines, and report the byte values of any non-ASCII sequence it carries.
    RECORD ONLY. IT IS NOT AN ANCHOR AND NO VERDICT RESTS ON IT.

--- STAGE 5 - the intersection. THE PER-FIELD LOAD/STORE SURFACE. ---

For every field name from 4b, count whole-token comment-stripped occurrences of that name
inside the line ranges established at 3a - the cascade functions only, not the whole EA.
REPORT ONLY NON-ZERO ROWS, IN FULL: field name | occurrence count | count classified WRITE
by 2b's mechanical test | count classified READ | count AMBIGUOUS.
Then three integers: fields touched, fields not touched, total fields.
THIS TABLE IS THE PACKET'S PRIMARY DELIVERABLE. It is the exact set of fields
LoadWorkingSet must load and StoreWorkingSet must store, and it is what Milestone 1's log
instruments. A field that is read but never written is a load-only field and that
distinction is Task 161's whole design.
CAUTION, and report it rather than resolving it: a field accessed as g_s.<name> and a
field accessed through a local alias are the same field but not the same token. Report the
count of occurrences of the whole token g_s inside the 3a ranges, and report whether any
line inside those ranges takes a reference or pointer to g_s or to any of its fields,
quoting each such line verbatim. DO NOT CHASE AN ALIAS. Name it and stop.

--- STAGE 6 - the unnamed state. Council will not invent a name. ---

Search ALL SIXTEEN files, each by its literal absolute path from STAGE 1, comment-stripped,
whole token where the target is an identifier:
  6a  ST_S3_ZONE_WAIT
  6b  every identifier containing ZONE_WAIT
  6c  every identifier containing OFFER or OFFERING, case-insensitive on the search but
      report the actual casing found
  6d  every member of ENUM_SRJ_STATE, listed in declaration order with its line number,
      and for each, its occurrence count across all sixteen files
Report every hit IN FULL: file | line number | the complete line verbatim. Report ABSENT
explicitly where a target has no hits.
PURPOSE, STATED SO THE BUILDER DOES NOT OVER-DELIVER: R-129 appends a candidate state at
value 9 for the offering-observation state and rules that COUNCIL DOES NOT INVENT THE
NAME. If the tree already names it, that name governs. This stage looks. It does not
propose a name, and neither does the report.

--- STAGE 7 - insertion anchors, located by census ---

7a  Report the ten lines immediately preceding the earliest signature line from 3a,
    verbatim with line numbers, and prove by brace count that the line immediately before
    that signature is at FILE SCOPE - depth zero.
7b  Report the ten lines immediately following the latest closing brace from 3a, verbatim
    with line numbers, and prove the same.
7c  Report whether either candidate region falls inside lines 166 through 813 - the
    contract block Task 160 inserted. If it does, say so plainly: an adapter function
    declared inside the type block would be a Task 160 scope violation.
DO NOT RECOMMEND AN ANCHOR. Report the regions. Council rules.

--- STAGE 8 - post-read stasis ---

Re-hash all sixteen source files. ALL SIXTEEN MUST BE EQUAL to STAGE 1 - a census writes
no source. Any change: STOP, report BLOCKED.
Report the EA byte size and line count again: 191970 / 3850.

--- STAGE 9 - persist ---

06_HANDOFFS\BUILDER_RESULT_161-PreA.md. Report the resolved absolute path once, then a
post-write verification read: byte size and integer line count.

--- REPORT FORMAT ---

TASK 161-PreA: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: NONE - source-only Form D
Production files modified: NONE      Source files written: ZERO
Compile: NOT PERFORMED   Harness run: NOT PERFORMED   Chart attach: NOT PERFORMED
Orders placed: NONE      Deletes: ZERO
P17 attestation: every path used was the literal path stated in this packet; no filename
  search, glob, -Recurse, wildcard or Navigator selection was used for any of the sixteen
  files. Declare any deviation even where its result agreed.
P10 attestation: no compile was performed.
Comment-stripping attestation: every count reported below was taken after comment content
  was discarded; raw figures are reported wherever they differ.
Report channel: the resolved absolute path of ROOT as defined in this packet
Commands that failed: <verbatim, with raw error text, or "none">
Splits declared: <or "none">   Truncations: <or "none">
Items reported NOT DERIVABLE: <named, or "none">
Items reported AMBIGUOUS: <named with line verbatim, or "none">
STAGE 1  sixteen hashes one row each MATCH | MISMATCH; EA size and lines; ST size and
         lines
STAGE 2  2a counts plus the handoff reconciliation plus the full occurrence table;
         2b two lists with counts and every AMBIGUOUS row; 2c the mapping table and the
         distinct function set; 2d the declaration
STAGE 3  3a one row per cascade function; 3b the full return-site table with counts;
         3c call sites or NO CALL SITE FOUND
STAGE 4  4a four measured figures beside expectation plus the parenthesis count;
         4b the full field table with total; 4c three figures beside expectation plus both
         reconciliation lists; 4d line 188 verbatim
STAGE 5  the full non-zero intersection table, three integers, the g_s token count, and
         every alias-taking line verbatim or NONE
STAGE 6  6a-6d, every hit in full, ABSENT stated explicitly
STAGE 7  7a and 7b context with depth proof; 7c the one-line answer
STAGE 8  sixteen EQUAL | CHANGED; EA size and lines
STAGE 9  resolved report path, byte size, integer line count

TASK 161-PreA VERDICT, five lines, mechanical only:
  g_state: N occurrences on M lines, W writes, R reads, A ambiguous, across F functions
  cascade: F functions, lines L1-L2, T return sites
  SState: N fields, M assigned in SRJ_StateInit, K UNASSIGNED
  working set: N of M fields touched inside the cascade, W write-only, R read-only
  offering-observation state: NAMED IN SOURCE AS <name> | ABSENT FROM ALL SIXTEEN FILES

No design. No recommendation. No proposed name. No anchor recommendation. Do not edit, do
not compile, do not run. Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as
distinct results. Never infer a missing fact. Never choose among ambiguous objects.
BLOCKED-FOR-COUNCIL rather than a guess.
