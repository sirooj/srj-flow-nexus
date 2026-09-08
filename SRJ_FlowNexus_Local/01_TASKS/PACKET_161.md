> **SUPERSEDED-VOID**
>
> VOID AS AN EXECUTABLE PACKET. NEVER EXECUTED. RETAINED ON DISK. NEVER DELETED.
> NEVER QUOTED. NEVER REPAIRED.
>
> The assembly arithmetic of this document held exactly and its BODY IS TRUNCATED. The
> adapter block is 99 lines where OP3 declares 118. LoadWorkingSet, StoreWorkingSet and
> SrjWs161Census are called by OP1 and OP2 and are defined nowhere. Its OP4 states six
> lines and delivers seven.
>
> Task 161 was delivered instead by three packets, each one edit plus one compile:
> 161-A2 inserted the adapter from a named artifact, 161-B1 wired it, 161-C appended
> CANDIDATE_ZONE_WAIT at value 9. All three compiles returned 0 errors 0 warnings.
> Result document: 06_HANDOFFS\BUILDER_RESULT_161-A2B1C.md
> Canonical EA after Task 161:
> abe5aaafa2b2f438dfcdcdd3d44edacddbb2de03eb44268ae42d1a7012487093
>
> Marked in place by council per REVISION_64_SESSION_BRIEF.md section 0 and ruling R-220.


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

FORM:            B - production edit. FOUR OPERATIONS ON ONE FILE, then one compile.
AUTHORIZATION:   161-A1. SINGLE USE. SCOPE, EXHAUSTIVE:
                   four edit operations on SRJ_FlowNexus_EA.mq5
                   one single-file compile of that file
                   nothing else
HARNESS RUN:     NOT AUTHORIZED. The regression is a separate packet with its own token.
CHART ATTACH:    NOT AUTHORIZED.   ORDERS: NONE. Operation is alert-only.
DELETE:          NOT AUTHORIZED ANYWHERE.   Compile All: NEVER (P10).
OTHER FILES:     ZERO BYTES ARE WRITTEN TO ANY FILE OTHER THAN SRJ_FlowNexus_EA.mq5.
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      45 minutes.

EA = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5

P17: EA is the only source path this packet touches and it is written literally above.
No filename search, no glob, no -Recurse, no wildcard, no Navigator selection, and no path
built from a variable. Attest to this in one line.
P16 / P18: no .ex5 is created, copied or read under 02_TASK_CHECKPOINTS.
ENCODING: the EA is UTF-8 WITH BOM. THE BOM IS PRESERVED. Every line this packet writes is
PURE ASCII. The file is byte-preserving outside the four edited regions. CRLF throughout.

STOP DISCIPLINE, EXHAUSTIVE. FIVE CONDITIONS AND NO OTHERS:
  the STAGE 1 digest is not 93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced
  any anchor at STAGE 2 matches zero times or more than once
  the STAGE 3 post-write line-count arithmetic does not balance exactly
  the compile reports one or more ERRORS
  a non-ASCII byte or a lone LF is introduced anywhere in the file
On any stop: report BLOCKED, write nothing further, REVERT NOTHING, delete nothing.
Council decides the revert.

--- STAGE 1 - pre-edit state ---

certutil -hashfile "<EA>" SHA256. MUST equal
93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced, case-insensitive.
Report byte size and integer line count. Expected 191970 and 3850.
Any difference: STOP.

--- STAGE 2 - anchor verification. NO BYTES ARE WRITTEN IN THIS STAGE. ---

For each of the four anchors below, report its match count. EVERY ONE MUST BE EXACTLY 1.
Match on the FULL LINE, whitespace included, as a literal string - not a regex, not a
substring of a longer line.
  A1  "   EvaluateClosedBar(1, currentBarTime);"
  A2  "   if(g_hPoi  != INVALID_HANDLE) IndicatorRelease(g_hPoi);"
  A3  "//====================== OnTick ========================================="
  A4  "    CANDIDATE_EXPIRED        = 8 };"
Report the resolved line number of each. Expected 3848, 3835, 3841, 287.
IF A REPORTED LINE NUMBER DIFFERS FROM ITS EXPECTATION, that is RECORDED AND NOT A STOP -
the anchor text governs and the expectation is council's. A match count other than 1 IS a
stop.

--- STAGE 3 - the four operations, APPLIED IN THIS ORDER AND NO OTHER ---

The order is DESCENDING BY LINE NUMBER so that no operation shifts a later anchor. Do not
reorder. Report the file's line count after each operation.

OP1  REPLACE the single line A1 with these three lines, preserving A1's three-space
     leading indentation on each:
   LoadWorkingSet(1, currentBarTime);
   EvaluateClosedBar(1, currentBarTime);
   StoreWorkingSet(1, currentBarTime);

OP2  INSERT these two lines IMMEDIATELY BEFORE line A2, leaving A2 itself untouched:
   if(InpDebugLog)
      SrjWs161Census();

OP3  INSERT the ADAPTER BLOCK, reproduced verbatim at the end of this packet, IMMEDIATELY
     BEFORE line A3, leaving A3 itself untouched. The block is 118 lines. Copy it byte for
     byte. Do not reflow, re-indent, reword a comment, or alter a blank line.

OP4  REPLACE the single line A4 with these six lines, preserving A4's four-space leading
     indentation on each:
    CANDIDATE_EXPIRED        = 8,
    //--- [Task 161 / R-189] The offering-observation state. Ruled a
    //--- candidate state by Rev 60 6.13 and given no edge by 10.2. Name
    //--- DERIVED, not invented: the CANDIDATE_ prefix from the eight
    //--- declared members, the suffix from ST_S3_ZONE_WAIT already in
    //--- source. NO ORDINAL COMPARISON MAY BE BUILT ON THIS ENUM.
    CANDIDATE_ZONE_WAIT      = 9 };

ARITHMETIC, AND IT IS THE GATE. Derived from the four operations and stated nowhere
independently of them:
  OP1 replaces 1 line with 3   ->  +2
  OP2 inserts 2 lines          ->  +2
  OP3 inserts 118 lines        -> +118
  OP4 replaces 1 line with 6   ->  +5
  TOTAL                        -> +127
  FINAL LINE COUNT = 3850 + 127 = 3977, EXACT. Any other value: STOP.

--- STAGE 4 - post-edit verification, BEFORE any compile ---

4a  Report byte size and integer line count. Line count MUST be 3977.
4b  Report the count of CRLF pairs, lone LF, and lone CR. Expected 3977 / 0 / 0.
4c  Report the count of non-ASCII bytes OUTSIDE the pre-existing damaged comment lines.
    Council holds that EA lines 159 and 2756 carry double-encoded sequences BEFORE this
    edit and both shift by +5 after OP4. Report the file's TOTAL non-ASCII byte count and
    state whether it EQUALS the pre-edit total. IT MUST BE EQUAL - this packet writes pure
    ASCII and introduces none. A CHANGE IS A STOP.
4d  Confirm the file still opens with a UTF-8 BOM.
4e  Report certutil SHA256 of the edited file. This is the NEW CANONICAL EA DIGEST.
4f  Paste back, verbatim, the six lines written by OP4 as they now read on disk, and the
    three lines written by OP1. This is the post-write verification read.
4g  Report the resolved line numbers of the ADAPTER BLOCK's first and last lines.

--- STAGE 5 - one compile ---

Compile SRJ_FlowNexus_EA.mq5 ALONE. Never Compile All (P10).
Report the FULL compiler output verbatim. THE GATE IS THE ERROR COUNT AND NOTHING ELSE
(P7). R-146 applies: THE METAMQL COMPILER RETURNS A NON-ZERO EXIT CODE ON A CLEAN BUILD
and that is expected - do not report it as a failure.
  0 errors: PASS regardless of warnings. Report every warning verbatim.
  1 or more errors: STOP, report BLOCKED with the full output, REVERT NOTHING.
Report the .ex5 dir /-c FILE LINE after the compile. RECORD ONLY - .ex5 size and timestamp
are compile-run evidence and NO GATE READS EITHER (R-142).

--- STAGE 6 - persist ---

06_HANDOFFS\BUILDER_RESULT_161.md. Report the resolved absolute path, byte size and integer
line count.

--- REPORT FORMAT ---

TASK 161: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: 161-A1
Files modified: SRJ_FlowNexus_EA.mq5 ONLY      Other files written: ZERO
Harness run: NOT PERFORMED   Chart attach: NOT PERFORMED   Deletes: ZERO
Compile All: NOT PERFORMED
P17 attestation: one line.
STAGE 1  digest MATCH | MISMATCH, byte size, line count
STAGE 2  four anchors, match count and resolved line number each
STAGE 3  line count after each of the four operations, and the +127 arithmetic
STAGE 4  4a-4g
STAGE 5  full compiler output, error count, warning count, .ex5 file line
STAGE 6  resolved path, byte size, line count

TASK 161 VERDICT, four lines, mechanical only:
  edits: 4 of 4 applied, 2 existing lines modified, 125 lines added
  arithmetic: 3850 + 127 = 3977 EXACT | FAILED
  compile: N errors, M warnings
  EA digest: <full SHA-256>

No design commentary. No recommendation. Do not run the harness. Do not revert. Preserve
ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED rather than a guess.

//====================== TASK 161: working-set adapter =================
//--- MILESTONE 1 INSTRUMENT. NOTHING READS THIS RECORD.
//--- MEMBERSHIP RULE: the fifteen fields ResetSequence clears. A field
//--- added to ResetSequence joins the working set and belongs here too.
//--- NO SHypothesis AND NO SCandidate IS INSTANTIATED. Contract 9
//--- declares bundle MANDATORY and the fifteen globals cannot construct
//--- one, so none is fabricated - a zero standing for absence is exactly
//--- what the contracts were declared to eliminate.
//--- LoadWorkingSet COMPARES AND DOES NOT ASSIGN. At capacity 1 the
//--- globals are the medium and nothing clears them between bars, so an
//--- assignment would be a no-op when the values agree and would MASK the
//--- divergence this instrument exists to find when they do not.
//--- CONTRACT DESTINATIONS, so Task 162 migrates from a stated mapping:
//---   state          -> SCandidate.state AND SHypothesis.state. ONE
//---                     global carries both levels. That is the defect.
//---   dir            -> SCandidate.dir
//---   regime         -> SCandidate.regimeAtAdmission
//---   sessionAtEntry -> SCandidate.tradingWindowAtAdmission
//---   anchorLine     -> SCandidate.poiAnchorLine
//---   anchorPrice    -> SCandidate.poiAnchorPrice + hasPoiAnchorPrice
//---   anchorBarTime  -> SCandidate.poiAnchorBarTime
//---   divLatch       -> SCandidate.divergenceVerdict. bool to TRI is a
//---                     WIDENING THE BUILD CANNOT FILL: false conflates
//---                     not-yet-evaluated with evaluated-and-negative.
//---   touchSeen      -> SHypothesis.touchLatched
//---   touchBarHi     -> SHypothesis.touchBarHigh
//---   touchBarLo     -> SHypothesis.touchBarLow
//---   zoneHi         -> SHypothesis.zoneHi + hasZone
//---   zoneLo         -> SHypothesis.zoneLo
//---   alertedArmed   -> SHypothesis.alertedArmed
//---   alertedSignal  -> SHypothesis.alertedSignal
struct SSrjWorkingSet
  {
   ENUM_SRJ_STATE   state;
   ENUM_SRJ_DIR     dir;
   ENUM_SRJ_REGIME  regime;
   ENUM_SRJ_SESSION sessionAtEntry;
   int              anchorLine;
   double           anchorPrice;
   datetime         anchorBarTime;
   bool             divLatch;
   bool             touchSeen;
   double           touchBarHi;
   double           touchBarLo;
   double           zoneHi;
   double           zoneLo;
   bool             alertedArmed;
   bool             alertedSignal;
   bool             stored;
  };

SSrjWorkingSet g_ws161;
int g_ws161_stores   = 0;
int g_ws161_loads    = 0;
int g_ws161_changes  = 0;
int g_ws161_mismatch = 0;
int g_ws161_fieldMiss[15];

string SrjWsName(int i)
  {
   switch(i)
     {
      case  0: return "state";
      case  1: return "dir";
      case  2: return "regime";
      case  3: return "sessionAtEntry";
      case  4: return "anchorLine";
      case  5: return "anchorPrice";
      case  6: return "anchorBarTime";
      case  7: return "divLatch";
      case  8: return "touchSeen";
      case  9: return "touchBarHi";
      case 10: return "touchBarLo";
      case 11: return "zoneHi";
      case 12: return "zoneLo";
      case 13: return "alertedArmed";
      case 14: return "alertedSignal";
     }
   return "?";
  }

void SrjWsCompare(bool &d[])
  {
   d[0]  = (g_ws161.state          != g_state);
   d[1]  = (g_ws161.dir            != g_dir);
   d[2]  = (g_ws161.regime         != g_regime);
   d[3]  = (g_ws161.sessionAtEntry != g_sessionAtEntry);
   d[4]  = (g_ws161.anchorLine     != g_anchorLine);
   d[5]  = (g_ws161.anchorPrice    != g_anchorPrice);
   d[6]  = (g_ws161.anchorBarTime  != g_anchorBarTime);
   d[7]  = (g_ws161.divLatch       != g_divLatch);
   d[8]  = (g_ws161.touchSeen      != g_touchSeen);
   d[9]  = (g_ws161.touchBarHi     != g_touchBarHi);
   d[10] = (g_ws161.touchBarLo     != g_touchBarLo);
   d[11] = (g_ws161.zoneHi         != g_zoneHi);
   d[12] = (g_ws161.zoneLo         != g_zoneLo);
   d[13] = (g_ws161.alertedArmed   != g_alertedArmed);
   d[14] = (g_ws161.alertedSignal  != g_alertedSignal);
  }
