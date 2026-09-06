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
FORM:            B - production edit and compile
SUPERSEDES:      PACKET_160.md, which BLOCKED at STAGE 3d on a defective council gate.
                 STAGE 3 is amended. Every other stage is unchanged.
AUTHORIZATION:   160-A1, UNCONSUMED and re-issued. SINGLE USE. SCOPE, EXHAUSTIVE:
                   one copy of the pre-edit SRJ_FlowNexus_EA.mq5 to a checkpoint folder
                   one insertion into DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
                   one compile of that one file
                   nothing else
HARNESS RUN:     NOT AUTHORIZED. Task 160-REG is a separate packet with its own token.
CHART ATTACH:    NOT AUTHORIZED
ORDERS:          NONE. Operation is alert-only.
DELETE:          NOT AUTHORIZED ANYWHERE
OTHER FILES:     NO file other than SRJ_FlowNexus_EA.mq5 is written. The other fifteen
                 canonical files are READ ONLY, for hashing.
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      60 minutes. Report-before-stop on any BLOCKED condition.

PATH CONSTANTS - the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local

P17: no source file is located by filename search, glob, -Recurse, wildcard or MetaEditor
Navigator selection. Every path is the literal absolute path stated here. ROOT is nested
inside DF\MQL5 and same-named copies of canonical files exist beneath it.
P10: NEVER Compile All. Compile the ONE named file only.
P11: never open a non-allow-listed file in MetaEditor. Read source via shell.
P18: no .ex5 is created, retained or read under 02_TASK_CHECKPOINTS. The checkpoint
     folder receives SOURCE ONLY.
P12: every anchor in this packet is verified by paste at STAGE 2 before a byte is written.

REPORT CONTRACT - DELTA AND EXCEPTION ONLY.
  In full: the header, the P17 and P10 attestations, every failed command with raw error
    text, every split, every truncation, every BLOCKED condition, every mandated verdict
    line, every source paste this packet asks for, and EVERY FIGURE THAT DIFFERS from its
    comparison target with the raw output beside it.
  One line or one row: a hash that MATCHES, a hash that is EQUAL, a count that is
    IDENTICAL, a census that returns ZERO. Aggregate: "fifteen EQUAL, none changed".
  Do not include: certutil success echoes, command strings for commands that succeeded,
    per-file zero rows, per-pattern zero rows, per-line ASCII CLEAN rows, methodology
    beyond one block at the top, the bytes-free line of any dir output, or any restatement
    of this packet's instructions.
  A report that omits a disagreement is a defect. A report that expands an agreement is
  waste. The evidentiary standard is unchanged: every figure is derived by command.

PURPOSE
Declare the twelve migration data contracts in the EA as an INERT ARCHITECTURE SHELL.
TYPES ONLY. No instance, no registry, no array of records, no initialiser, no function,
no #property change, no include change, and NO EXISTING LINE MODIFIED. Unreferenced type
declarations emit no code, so the Tier 1 regression is byte-identical BY CONSTRUCTION and
Task 160-REG measures that rather than establishing it.
THE EIGHT ORDINAL g_state COMPARISONS ARE NOT TOUCHED. They are re-expressed in Task 162
or 164. A mechanical port of them would compile and be wrong.

--- STAGE 0 - collision gate. NO BYTE IS WRITTEN UNTIL THIS PASSES ---

Census the identifier list below across ALL SIXTEEN canonical literal paths. Case-
sensitive, WHOLE-TOKEN, COMMENT CONTENT DISCARDED BEFORE COUNTING. Enum members are
GLOBALLY SCOPED in MQL5 and are therefore censused. STRUCT MEMBER NAMES ARE SCOPED AND
ARE NOT CENSUSED.

Report per-pattern hits ONLY where a hit exists, each as a full-line paste with file and
line number. Then one line: "N of M identifiers ZERO HITS". EXPECTED RESULT IS ZERO HITS
FOR EVERY IDENTIFIER, and the prior run measured 136 of 136 ZERO HITS against an unchanged
tree. ANY HIT IS BLOCKED-FOR-COUNCIL: report it, write nothing, compile nothing. NEVER
change a name.

Defines: SRJ_MAX_OPP_FVG_REFS SRJ_MAX_HYP_PER_CANDIDATE SRJ_MAX_EVENT_OBJREFS

Enum type names: ENUM_SRJ_RESOLUTION ENUM_SRJ_OBJKIND ENUM_SRJ_TRI ENUM_SRJ_BIAS
ENUM_SRJ_LIVESESSION ENUM_SRJ_CANDIDATE_STATE ENUM_SRJ_HYPOTHESIS_STATE
ENUM_SRJ_REJECTION ENUM_SRJ_TERMINATOR ENUM_SRJ_SL_CAUSE ENUM_SRJ_TP_CAUSE
ENUM_SRJ_TP_LEVELKIND ENUM_SRJ_FILLMODE ENUM_SRJ_CANCEL_CAUSE ENUM_SRJ_VERDICT
ENUM_SRJ_BINDEVENT ENUM_SRJ_RETEST_EVENT ENUM_SRJ_EVENTKIND

Struct type names: SObjectRef SXobRecord SFvgRecord SOppFvgEntry SStructuralBundle
SMarketSnapshot SStopReference STargetReference SCandidate SHypothesis SPendingEntry
SDecision SDiagnosticEvent

Enum member names: SRJ_RES_UNKNOWN SRJ_RES_RESOLVED SRJ_RES_GONE SRJ_OBK_NONE
SRJ_OBK_ORDERBLOCK SRJ_OBK_IMBALANCE SRJ_TRI_UNKNOWN SRJ_TRI_FALSE SRJ_TRI_TRUE
SRJ_BIAS_UNKNOWN SRJ_BIAS_NONE SRJ_BIAS_BULLISH SRJ_BIAS_BEARISH SRJ_LSESS_NA
SRJ_LSESS_ASIA SRJ_LSESS_LONDON SRJ_LSESS_NY SRJ_LSESS_PM CANDIDATE_STATE_UNKNOWN
CANDIDATE_NEW CANDIDATE_REGIME_WAIT CANDIDATE_ALIGNMENT_WAIT CANDIDATE_HAS_HYPOTHESES
CANDIDATE_COMPLETED CANDIDATE_COMMITTED CANDIDATE_REJECTED CANDIDATE_EXPIRED
HYPOTHESIS_STATE_UNKNOWN HYPOTHESIS_BOUND HYPOTHESIS_WAITING_TOUCH HYPOTHESIS_TOUCHED
HYPOTHESIS_CONFIRMATION_LATCHED HYPOTHESIS_WAITING_DIVERGENCE
HYPOTHESIS_WAITING_TARGET_VALIDITY HYPOTHESIS_WAITING_RR HYPOTHESIS_SETUP_COMPLETE
HYPOTHESIS_PENDING_ENTRY HYPOTHESIS_REJECTED HYPOTHESIS_CANCELLED HYPOTHESIS_BASIS_LOST
SRJ_REJ_NONE SRJ_REJ_FRESH_OB_DEAD SRJ_REJ_FRESH_OPP_FVG SRJ_REJ_TP_RR_FAIL
SRJ_REJ_NO_REGIME SRJ_REJ_LTF_MISALIGN SRJ_REJ_UPSTREAM_UNREADY SRJ_REJ_SESSION_LIMIT
SRJ_REJ_SESSION_CLOSED SRJ_REJ_LOT_TOO_SMALL SRJ_REJ_CONCURRENCY_LIMIT SRJ_REJ_NO_SL_REF
SRJ_REJ_NO_TP_TARGET SRJ_REJ_POI_REPLACED SRJ_TERM_NONE
SRJ_TERM_T1_STRUCTURE_INVALIDATED SRJ_TERM_T2_BIAS_FLIP SRJ_TERM_T3_REACHED_BEFORE_FILL
SRJ_TERM_T5A_TARGET_INVALID SRJ_TERM_T5B_RR_FAIL SRJ_SLC_UNKNOWN SRJ_SLC_OB_SWING
SRJ_SLC_FALLBACK_SIDE SRJ_SLC_FALLBACK_EMPTY SRJ_TPC_UNKNOWN SRJ_TPC_SWEPT_MASK
SRJ_TPC_ANCHOR_TIER SRJ_TPC_EMPTY_OR_NONPOSITIVE SRJ_TPC_DIRECTION
SRJ_TPC_ZONE_CONTAINMENT SRJ_TPK_UNKNOWN SRJ_TPK_SESSION_EXTREME
SRJ_TPK_PREV_DAY_EXTREME SRJ_TPK_POI_LINE SRJ_FILL_UNKNOWN SRJ_FILL_WICK_RETURN_ONLY
SRJ_FILL_MARKET SRJ_CANCEL_NONE SRJ_CANCEL_SUPERSEDED_BY_BETTER_R SRJ_VER_UNKNOWN
SRJ_VER_NO_CHANGE SRJ_VER_ADVANCED SRJ_VER_COMPLETED SRJ_VER_REJECTED SRJ_VER_CANCELLED
SRJ_VER_BASIS_LOST SRJ_BIND_UNKNOWN SRJ_BIND_S3_TO_S4_ARMING
SRJ_BIND_ZONE_REPLACEMENT_SIBLING SRJ_RETEST_UNKNOWN SRJ_EVK_UNKNOWN
SRJ_EVK_FIELD_LOAD_STORE SRJ_EVK_HYPOTHESIS_SIBLING_CREATED SRJ_EVK_OBJECT_RESOLUTION
SRJ_EVK_HYPOTHESIS_BASIS_LOST SRJ_EVK_HYPOTHESIS_REJECTED SRJ_EVK_CANDIDATE_REJECTED
SRJ_EVK_ADV_T4_DIVERGENCE_CONSUMED SRJ_EVK_ARBITRATION SRJ_EVK_HEADS_UP
SRJ_EVK_STAND_DOWN SRJ_EVK_POST_FILL_TARGET_REVISED

--- STAGE 1 - pre-edit stasis, sixteen files ---

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

Targets: parse the sixteen digest rows mechanically from 06_HANDOFFS\
BUILDER_RESULT_160-PreL.md STAGE 1. Case-insensitive hex; a case difference is NEVER a
MISMATCH. ALL SIXTEEN MATCH REQUIRED. Any MISMATCH: STOP, report BLOCKED, write nothing.

Record both artifact FILE LINES, before, RECORD ONLY, never gated:
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"

Report SRJ_FlowNexus_EA.mq5's byte size and integer line count. Expected 162293 bytes and
3202 lines. Report its BOM state and its line-ending census: count of CRLF pairs, count of
lone LF, count of lone CR. Expected UTF-8 WITH BOM, 3202 CRLF, zero lone LF, zero lone CR.
THESE FIGURES ARE LOAD-BEARING - STAGE 4 must match them.

--- STAGE 2 - anchor verification and checkpoint. P12 ---

2a  Paste DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5 lines 160 through 170, contiguous, full
    lines with numbers, with the four assertion lines: PASTED FROM, PASTED LINE COUNT,
    DECLARED SPAN COUNT, ASSERTION: PASTE COMPLETE.
2b  Confirm MECHANICALLY, by comparison against the paste:
      line 164 text is exactly   #define ABORT_POI_REPLACED     "POI_REPLACED"
      line 165 is EMPTY
      line 166 text is exactly   //====================== Singleton sequence state ====================
    Any mismatch on any of the three: STOP, report BLOCKED, write nothing. Report which.
2c  A21: for every line pasted at 2a, report only the lines carrying a non-ASCII byte,
    with column and byte value, and mark them BYTE-SUBSTITUTED. Then one line for the
    rest. EA line 159 is known to carry a double-encoded em-dash; it is OUTSIDE this
    paste, it is comment text, and it is NOT AN ANCHOR.
2d  Create 02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\ if absent and copy
    DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5 into it, byte-for-byte. If the folder and the
    copy already exist from the prior BLOCKED run, verify the existing copy's SHA-256
    against STAGE 1's observed EA digest and report VERIFIED EXISTING rather than
    overwriting. Either way the copy's digest MUST EQUAL STAGE 1's EA digest. SOURCE ONLY
    - no .ex5 is created, copied or read here (P18). This copy is the revert path and its
    digest equality is what makes a revert provably exact.

--- STAGE 3 - extract the insert block and prove it emits no code ---

Read 06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md.

3a  Extract the contiguous region that BEGINS at the line whose text starts with
      //====================== [Task 160]
    and ENDS at the line whose text is exactly
      //====================== end [Task 160] contracts ===================
    inclusive of both. If either delimiter is absent or occurs more than once: STOP,
    report BLOCKED, write nothing.
3b  Report the extracted block's integer line count, byte size and SHA-256. Then compare
    all three against the figures recorded at STAGE 3b of 06_HANDOFFS\
    BUILDER_RESULT_160.md, read from that file and never from a handoff. Expected 648
    lines, 29677 bytes, digest beginning bcabf265 and ending 41153, case-insensitive.
    ANY DIFFERENCE MEANS THE CONTRACTS FILE MOVED BETWEEN RUNS: STOP, report BLOCKED,
    write nothing.
3c  Verify the block is PURE ASCII - every byte in 9, 10, 13, or 32 through 126. Report
    the count of bytes outside that set. IT MUST BE ZERO. Any non-ASCII byte: STOP,
    report BLOCKED.
3d  BUILD THE COMMENT-STRIPPED CODE TEXT. This step is not optional and STAGES 3e and 3f
    are counted against its output and never against the raw block.
      Report the count of the two-character sequences /* and */ in the block. BOTH MUST BE
        ZERO - the block uses line comments only. Any non-zero: STOP, report BLOCKED.
      From each line, discard everything from the FIRST occurrence of // to the end of
        that line. The block contains NO STRING LITERAL IN CODE, so a naive strip is
        safe. VERIFY THAT CLAIM: report the count of double-quote characters remaining in
        the stripped text. IT MUST BE ZERO. Any non-zero: STOP, report BLOCKED, and paste
        the offending lines.
      Report the number of non-blank lines remaining in the stripped text.
3e  ON THE COMMENT-STRIPPED TEXT ONLY, report the count of ( and the count of ).
    BOTH MUST BE ZERO. No function declaration, no function call and no control-flow
    condition can exist without a parenthesis, so zero parentheses is the mechanical
    proof that this block declares types and nothing else. Any non-zero: STOP, report
    BLOCKED, and paste every stripped line carrying one.
3f  ON THE COMMENT-STRIPPED TEXT ONLY, whole-token, case-sensitive, report the count for
    each of these seventeen tokens: #include  #property  SetIndexBuffer  ArrayResize
    ArrayInitialize  Print  PrintFormat  Alert  SendNotification  SendMail  OnTick
    OnInit  OnCalculate  return  if  for  while
    ALL MUST BE ZERO. Report only the non-zero counts, then one line: "seventeen of
    seventeen ZERO in code text". Any non-zero: STOP, report BLOCKED, and paste the
    offending stripped lines.
    WHY THE STRIP MATTERS: 'return', 'if', 'for' and 'while' are ordinary English words
    and this block carries several hundred lines of ruling text in comments. A
    comment-inclusive count on those four tokens is unworkable by construction, and the
    prior run of this packet blocked on exactly that defect.
3g  On the COMMENT-STRIPPED TEXT, report the count of lines whose first token is enum and
    the count whose first token is struct. Expected 18 and 13.

--- STAGE 4 - the insertion. THE ONLY WRITE TO A CANONICAL FILE ---

Insert the STAGE 3a block, RAW AND COMPLETE INCLUDING ITS COMMENTS, into
DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5 AFTER line 165 and BEFORE line 166. THE
COMMENT-STRIPPED TEXT IS AN ANALYSIS ARTIFACT AND IS NEVER WHAT IS WRITTEN.

BINDING ON THE WRITE:
  The BOM IS PRESERVED. The file is UTF-8 WITH BOM and it stays that way.
  BYTES OUTSIDE THE INSERTION ARE NOT TOUCHED. No whole-file read-decode-rewrite. No
    encoding normalisation. No line-ending normalisation. No trailing-whitespace
    stripping. Operate on the byte array: take the original bytes up to and including
    line 165's terminator, append the block's bytes with each line terminated by the SAME
    TERMINATOR the file uses per STAGE 1's census, then append the remaining original
    bytes unchanged.
  NO EXISTING LINE IS MODIFIED, MOVED, REFORMATTED OR DELETED.
  ZERO BYTES ARE WRITTEN TO ANY OTHER FILE.

4a  Report the new byte size and integer line count.
4b  DELTA DERIVATION, arithmetic stated explicitly: lines before + block lines = lines
    after, and bytes before + block bytes as terminated = bytes after. Both must balance
    exactly. Any imbalance: report BLOCKED and do not compile.
4c  Re-report the line-ending census. Any lone LF or lone CR that was zero before and is
    non-zero now: STOP, report BLOCKED.

--- STAGE 5 - verify the insertion before compiling ---

5a  Compute the SHA-256 of the byte sequence you INTENDED to write - original bytes up to
    line 165's terminator, plus the block as terminated, plus the remaining original
    bytes - and compare it to the SHA-256 of the file as it now reads from disk. THEY
    MUST BE EQUAL. This is a single exact check that no byte outside the insertion moved.
    Any inequality: STOP, report BLOCKED, and state that a revert may be required.
5b  Paste the file's lines 160 through 172 as they now read, full lines with numbers,
    with the four assertion lines. Lines 164, 165 and 166 must be unchanged from 2a; line
    167 must be the block's first line.
5c  Paste the last 6 lines of the inserted region and the 3 lines immediately after it,
    contiguous, full lines with numbers, with the four assertion lines. The line
    immediately after the block must be the one whose text is exactly
      //====================== Singleton sequence state ====================
5d  Report the new EA SHA-256 in full. THIS IS THE NEW CANONICAL DIGEST and Task 160-REG
    will assert against it.

--- STAGE 6 - compile. One file. P10, P7 ---

Compile DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5 ONLY. Never Compile All.
6a  ERROR COUNT and WARNING COUNT as integers. THE GATE IS THE ERROR COUNT, NEVER THE
    EXIT CODE. Report the full text of every error and every warning, verbatim, however
    many there are.
6b  If the error count is above zero: STOP, report BLOCKED with the full error text, and
    DO NOT REVERT. Council decides. A revert is a separate authorization.
6c  Record SRJ_FlowNexus_EA.ex5's dir /-c FILE LINE, after. It IS EXPECTED TO CHANGE - a
    recompile moves it and the SRJ BUILD line is compile-embedded. Neither size nor
    timestamp is a gate.
6d  Record SRJ_FlowLogic.ex5's dir /-c FILE LINE, after. IT MUST BE UNCHANGED. If it
    moved, a Compile All occurred: report BLOCKED.

--- STAGE 7 - post-edit stasis ---

Re-hash all sixteen source files.
  THE FIFTEEN NON-EA FILES MUST BE EQUAL to STAGE 1. Any change: report BLOCKED.
  SRJ_FlowNexus_EA.mq5 MUST DIFFER from STAGE 1 and MUST EQUAL 5d.
Report as: "fifteen EQUAL, none changed" plus the EA's before and after digests.

--- STAGE 8 - persist ---

06_HANDOFFS\BUILDER_RESULT_160-R2.md. Report the resolved absolute path once, then a
post-write verification read: byte size and integer line count.

--- REPORT FORMAT ---

TASK 160-R2: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: 160-A1
Production files modified: SRJ_FlowNexus_EA.mq5 ONLY
Other canonical files written: ZERO
Lines inserted: N     Existing lines modified: ZERO     Lines deleted: ZERO
Compile: PERFORMED, one file, errors N warnings N
Harness run: NOT PERFORMED   Chart attach: NOT PERFORMED   Orders: NONE   Deletes: ZERO
P17 attestation: every source path used was the literal path stated in this packet.
P10 attestation: Compile All was not used; one file was compiled.
P18 attestation: no .ex5 was created, copied or read under 02_TASK_CHECKPOINTS.
Report channel: resolved absolute path of the workspace root
Commands that failed: <verbatim, with raw error text, or "none">
Splits declared: <or "none">   Truncations: <or "none">
STAGE 0  hits only, then "N of M identifiers ZERO HITS"
STAGE 1  sixteen hashes one row each; two artifact FILE LINES; EA size, line count, BOM
         state, line-ending census
STAGE 2  2a paste with four assertion lines; 2b three confirmations; 2c non-ASCII only;
         2d checkpoint path, CREATED or VERIFIED EXISTING, and digest equality
STAGE 3  3a extraction bounds; 3b count, size, digest, all three vs BUILDER_RESULT_160.md;
         3c zero; 3d two sequence counts, quote count, non-blank line count; 3e two paren
         counts; 3f non-zero counts only then the aggregate line; 3g two counts
STAGE 4  4a new size and line count; 4b the two balancing equations; 4c census
STAGE 5  5a EQUAL or BLOCKED; 5b and 5c pastes with four assertion lines each;
         5d the new EA digest in full
STAGE 6  error count, warning count, all error and warning text, both artifact lines
STAGE 7  fifteen EQUAL; EA before and after digests
STAGE 8  resolved report path, byte size, integer line count

TASK 160 VERDICT, five lines, mechanical only:
  collision census: ZERO HITS | N HITS
  code-emission proof: ZERO PARENTHESES AND SEVENTEEN ZERO TOKENS | BLOCKED
  insertion: N lines inserted, ZERO existing lines modified | BLOCKED
  compile: 0 errors | N errors
  tree: fifteen EQUAL, EA changed as intended | BLOCKED

No diagnosis. No hypothesis. No revert without a council decision. Do not run the
harness. Do not reword any comment in the block. Preserve ABSENT, UNKNOWN, NO OBJECT IN
SCOPE and BLOCKED as distinct results. Never infer a missing fact.
BLOCKED-FOR-COUNCIL rather than a guess.
