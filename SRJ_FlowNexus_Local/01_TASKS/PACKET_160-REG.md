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
FORM:            OBS - one Tier 1 harness run. NO SOURCE IS WRITTEN AND NOTHING IS
                 COMPILED.
AUTHORIZATION:   160REG-A1. SINGLE USE. SCOPE, EXHAUSTIVE:
                   one Tier 1 harness run
                   one raw log written to disk
                   nothing else
PRODUCTION EDIT: NOT AUTHORIZED. ZERO BYTES ARE WRITTEN TO ANY .mq5 OR .mqh.
COMPILE:         NOT AUTHORIZED. The EA binary produced by Task 160 IS THE BINARY UNDER
                 TEST and MAY NOT BE REBUILT. A recompile voids this packet.
CHART ATTACH:    NOT AUTHORIZED
ORDERS:          NONE. Operation is alert-only.
DELETE:          NOT AUTHORIZED ANYWHERE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      60 minutes, of which the run is about 27. Report-before-stop on any
                 BLOCKED condition.

PATH CONSTANTS - the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local

P17: no file is located by filename search, glob, -Recurse, wildcard or MetaEditor
Navigator selection. Every path is the literal absolute path stated here, INCLUDING the
fourteen include files. ROOT is nested inside DF\MQL5 and same-named copies of canonical
files exist beneath it. A glob that happens to agree is still a deviation and must be
declared.
P10: no compile occurs in this packet at all.
P11: never open a non-allow-listed file in MetaEditor.
P18: no .ex5 is created, copied or read under 02_TASK_CHECKPOINTS.

REPORT CONTRACT - DELTA AND EXCEPTION ONLY.
  In full: the header, the P17 attestation, every failed command with raw error text,
    every split, every truncation, every BLOCKED condition, every mandated verdict line,
    every figure this packet asks to be quoted verbatim, and EVERY FIGURE THAT DIFFERS
    from its comparison target with the raw output beside it.
  One line or one row: a hash that MATCHES, a hash that is EQUAL, a count that is
    IDENTICAL. Aggregate agreements: "sixteen EQUAL, none changed".
  Do not include: certutil success echoes, command strings for commands that succeeded,
    per-file zero rows, per-tag rows whose counts agree, methodology beyond one block at
    the top, the bytes-free line of any dir output, or any restatement of this packet's
    instructions.
  A report that omits a disagreement is a defect. A report that expands an agreement is
  waste.

PURPOSE, AND BOTH OUTCOMES ARE RESULTS
Task 160 inserted 648 lines of type-only declarations into SRJ_FlowNexus_EA.mq5 and
recompiled it. The block was proven to contain ZERO PARENTHESES and zero occurrences of
seventeen code tokens in its comment-stripped text, so it emits no executable code and
byte-identity against the Tier 1 baseline is expected BY CONSTRUCTION. THIS PACKET
MEASURES THAT RATHER THAN ASSUMING IT.
  IDENTICAL  -> Task 160 is confirmed behaviour-neutral by measurement; Task 161 is
                unblocked; and R-87's lineage hole closes as a side effect, because a
                binary compiled today from today's source reproduced a baseline measured
                on a binary compiled on 2026-08-30. 160-CAL is then WITHDRAWN.
  DIVERGENT  -> BLOCKED-FOR-COUNCIL. Do not diagnose it, do not attribute it, and DO NOT
                REVERT. Council will issue 160-CAL as a revert-recompile-rerun against
                the checkpoint at
                02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\SRJ_FlowNexus_EA.mq5,
                whose digest 0f1f44cb..52331322 makes the revert provably exact.
THE EXPERIMENT IS SINGLE-VARIABLE. SRJ_FlowLogic.ex5 is unchanged at 226444 bytes /
09/05/2026 05:39 PM, which is the same indicator binary the baseline ran against. Exactly
one binary moved.

--- STAGE 1 - pre-run stasis, sixteen files ---

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

TARGETS, and note that they come from TWO reports:
  SRJ_FlowNexus_EA.mq5 -> the digest recorded at STAGE 5d of 06_HANDOFFS\
    BUILDER_RESULT_160-R2.md, read from that file. Expected
    93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced.
  the other fifteen    -> parsed mechanically from the STAGE 1 SECTION ONLY of
    06_HANDOFFS\BUILDER_RESULT_160-PreL.md. Scope the parse to that section; a pattern
    applied to the whole file will over-match.
Case-insensitive hex; a case difference is NEVER a MISMATCH. ALL SIXTEEN MATCH REQUIRED.
Any MISMATCH: STOP, report BLOCKED, run nothing. An EA mismatch specifically means
something touched the file after Task 160 and this packet's premise is void.

Also report the EA's byte size and integer line count. Expected 191970 bytes and 3850
lines. Any difference: STOP, report BLOCKED.

Record both artifact FILE LINES, before, RECORD ONLY, NEVER GATED:
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"
Expected 118130 / 09/06/2026 06:42 PM and 226444 / 09/05/2026 05:39 PM. Report the FILE
LINES only; the bytes-free line is disk state and is discarded. Neither size nor
timestamp is a gate, and they are recorded here for exactly one purpose: to show that
nothing recompiled between authorization and run.

--- STAGE 2 - read the baseline configuration from disk ---

Read 06_HANDOFFS\BUILDER_RESULT_155-REG.md and report VERBATIM, as it appears there:
2a  the harness run configuration - symbol, timeframe, model, date range from and to,
    deposit, leverage, and every EA input name with its value. Report the count of input
    values and the count of headers if the report states them.
2b  the log path the baseline wrote to, its byte size and its line count as recorded.
2c  the eleven gate rows, quoted as they appear.
2d  the diagnostic tag inventory - every tag name with its baseline count. Report the
    number of tags found.
    ONE INSTRUCTION ON THIS INVENTORY: the row led by a timestamp, of the form
    '<count> [SRJ-EA] 2026', IS AN UNDECOMPOSED BUCKET AND IS NOT A TAG. It contains the
    abort lines and the signal line. Report it SEPARATELY, labelled BUCKET, and do not
    include it in the tag count or in the tag comparison at STAGE 4b.
2e  the signal line, verbatim, from [SRJ-EA] onward.
2f  the P8 journal line, the P8a fingerprint integer, the P9 liveness figure, and the P8b
    SRJ BUILD line if the report carries one.
IF ANY OF 2a THROUGH 2f CANNOT BE LOCATED: report which, report the headings you did
find, and STOP. Council will supply the missing half rather than have it guessed. DO NOT
substitute a value from any handoff. DO NOT reconstruct a configuration. DO NOT infer an
input's value from its name.

--- STAGE 3 - one Tier 1 harness run ---

Run the harness using EXACTLY the configuration reported at 2a. Report verbatim the
configuration you used and state that it is character-identical to 2a, or name every
difference field by field. A configuration difference is a BLOCKED condition, not a
caveat: the comparison at STAGE 4 is meaningless if the inputs moved.

Write the raw log to disk.
3a  the raw log's absolute path, byte size and integer line count. THE RAW LOG IS NOT
    RELAYED - it stays on disk and its path, size and line count are its provenance.
3b  P8: the journal line containing "generating based on real ticks", verbatim. If absent:
    STOP, report BLOCKED.
3c  P8a: the SRJ XOB-PROMOCENSUS fingerprint as an integer. 372 IS REAL TICKS. 607 IS
    GENERATED AND VOIDS THE RUN - if 607, report BLOCKED and stop.
3d  P8b: the SRJ BUILD line, verbatim. This is the run-binary provenance instrument and it
    is EXPECTED TO DIFFER from the baseline's, because Task 160 recompiled the EA. A
    difference here is a RESULT, not a failure. Report it beside the baseline's from 2f.
3e  P9: the BIASCENSUS_FINAL bars= figure. Report it beside the baseline's.

--- STAGE 4 - compare against the baseline and report the delta ---

Every comparison is against the figures read at STAGE 2, never against a figure in any
handoff and never against council's expectation.

4a  The eleven gate rows: for each, baseline value beside observed value, and IDENTICAL or
    DIFFERENT. Expand only the DIFFERENT ones, in full, with raw output.
4b  The diagnostic tag inventory, BUCKET EXCLUDED: for each tag from 2d, baseline count
    beside observed count. Report ONLY the tags whose counts DIFFER, in full, with both
    counts and the raw derivation. Then one line: "N of M tags count-identical".
4c  The BUCKET row: baseline count beside observed count, IDENTICAL or DIFFERENT. Report
    it separately and do not fold it into 4b's figure.
4d  The signal line: baseline from 2e beside observed, and IDENTICAL or DIFFERENT. If
    DIFFERENT, paste both in full and name every field that moved.
4e  Any tag present in one generation and absent in the other, named, with the generation
    it appears in.
4f  ONE LINE, MECHANICAL: BEHAVIOURALLY IDENTICAL | DIVERGENT AT N POINTS.
    Do not diagnose a divergence. Do not attribute one. Do not speculate about a cause.
    Do not revert anything. That is council's.

--- STAGE 5 - post-run stasis ---

Re-hash all sixteen source files. ALL SIXTEEN MUST BE EQUAL to STAGE 1 - a harness run
writes no source. Any change: report BLOCKED.
Record both artifact FILE LINES, after. BOTH MUST BE UNCHANGED from STAGE 1. A moved
.ex5 means a compile occurred inside a packet that does not authorize one: report BLOCKED.

--- STAGE 6 - persist ---

06_HANDOFFS\BUILDER_RESULT_160-REG.md. Report the resolved absolute path once, then a
post-write verification read: byte size and integer line count.

--- REPORT FORMAT ---

TASK 160-REG: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: 160REG-A1
Production files modified: NONE
Source files written: ZERO
Compile: NOT PERFORMED
Chart attach: NOT PERFORMED   Orders placed: NONE   Deletes: ZERO
P17 attestation: every path used was the literal path stated in this packet; no filename
  search, glob, -Recurse, wildcard or Navigator selection was used for any of the sixteen
  files. Declare any deviation even where its result agreed.
P10 attestation: no compile was performed.
Report channel: the resolved absolute path of ROOT as defined in this packet
Commands that failed: <verbatim, with raw error text, or "none">
Splits declared: <or "none">   Truncations: <or "none">
STAGE 1  sixteen hashes one row each, MATCH | MISMATCH, and which report each target came
         from; EA byte size and line count; two artifact FILE LINES, before
STAGE 2  2a-2f as read from the baseline report, verbatim, with the BUCKET row labelled
         and separated
STAGE 3  configuration used and its character-identity statement; 3a-3e
STAGE 4  4a-4f, DIFFERENCES EXPANDED, agreements aggregated
STAGE 5  sixteen EQUAL | CHANGED; two artifact FILE LINES, after, UNCHANGED | CHANGED
STAGE 6  resolved report path, byte size, integer line count

TASK 160-REG VERDICT, four lines, mechanical only:
  provenance: P8 present, P8a <integer>, P9 <figure>, P8b <verbatim>
  configuration: CHARACTER-IDENTICAL TO BASELINE | DIFFERS AT N FIELDS
  behaviour vs Task 155REG: IDENTICAL | DIVERGENT AT N POINTS
  tree: sixteen EQUAL, both artifacts UNCHANGED | BLOCKED

No diagnosis. No hypothesis. No attribution of any divergence. No revert. Do not compile.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results. Never infer
a missing fact. Never choose among ambiguous objects. BLOCKED-FOR-COUNCIL rather than a
guess.
