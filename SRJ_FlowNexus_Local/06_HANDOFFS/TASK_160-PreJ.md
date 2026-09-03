# TASK_160-PreJ HANDOFF FILE

Status: READY FOR BUILDER
Form: D
Mode: source-only
Production edit: NO
Compile: NO
Run: NO

---

# 12. LIVE TASK — Task 160-PreJ — Form D. Corrected attribution, buffer 35's scope, the unread passes, and `ZoneAdoptable`.

**Source extraction and mapping only. No edit. No compile. No run. No file written to the canonical tree.**

**Why this task exists.** **Block A** re-runs the attribution that defect 83 voided, across all seven flag-write regions, under amendment 14's corrected three-part scope test with mandatory pointer-parameter enumeration. **Block B** settles whether buffer 35's region-level write can name an object at all, which decides export stage 3's shape. **Block C** reads the four FlowLogic passes the record has never seen and censuses the whole tree's emission surface, which closes packet item 4 and completes or corrects EA-159's delete-path inventory. **Block D** reads `ZoneAdoptable`, the guard on EA-150's second binding site. **After Block A returns, Task 154's Form B is writable.**

**No expected value from any earlier return appears below.** No region size, no count, no line number and no scope verdict from 160-PreH is stated as an expectation anywhere in this task. **The seven Block A regions are named by identifier, and each one is located by census and bounded by brace counting inside this task.**

```
TASK 160-PreJ — Form D. EXTRACTION AND MAPPING ONLY.
NO EDIT. NO COMPILE. NO RUN. NO FILE WRITTEN TO THE CANONICAL TREE.

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

★ DELIVERY RULE, BINDING AND FIRST. This report has four blocks and must arrive
  COMPLETE, INCLUDING THE FINAL HASH ITEM. If output must be split, split it,
  declare every boundary in "Splits declared", and DELIVER EVERY PART. Do not emit
  a TRUNCATED marker beside a boundary already declared as a split. If a block
  cannot be delivered, report PARTIAL and name the block — never COMPLETED with a
  block missing. ★

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
  DIAGNOSTIC. Never make a keyword a substring pattern. ★

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

★ PASTE SIZING RULE. For every region: FIRST report its brace-counted range and
  integer line count. THEN paste only what the item names. If an item says "paste
  WHOLE if <= N lines" and the count exceeds N, say EXCEEDS N and paste only the
  item's fallback. Never paste a region of unmeasured size. ★

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
        enclosing-construct rule, and for EACH brace entry its OPENING line and its
        BRACE-COUNTED CLOSING line.
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
  "NO DEFINITION FOUND", "NOT ENCLOSED", "HEADER UNRESOLVED", "NO BRACED BODY",
  "RHS TERMINATOR NOT ON LINE", "NO ENCLOSING FUNCTION - FILE SCOPE",
  "NO OBJECT IN SCOPE AT THIS STATEMENT", "CLOSING BRACE",
  "ARGUMENT LIST CONTINUES ON NEXT LINE".
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

★ MULTI-LINE CALL RULE. Where an item asks for the exact argument list text of a
  call, the argument list runs from the "(" following the called name to the
  MATCHING ")" at the same paren depth, ACROSS LINE BOUNDARIES. If the matching ")"
  is not on the call's own line, report "ARGUMENT LIST CONTINUES ON NEXT LINE" and
  then PASTE EVERY LINE from the call line through the line carrying the matching
  ")", one pasted source line per output line, and report the joined argument text
  separately marked JOINED. Never report a truncated argument list without that
  mark and never report UNTERMINATED as a final answer. ★

★ ANSWERABILITY, WITH COMPUTABILITY AND SELF-SELECTION. Where an item asks for a
  verdict, answer ONLY from the paste named in that item, and name the paste
  searched. A task must never ask a question whose answer lives outside a region the
  same task requested, and must never ask for a comparison against a value it did
  not supply. An item must never ask for a classification the builder cannot compute
  from what the task requested. An item whose referent is singular where the
  producing item may return several must state its own selection rule in the item
  text. ★

★ CLASSIFY MECHANICALLY. Never classify from a comment. ★

★ AMENDMENT 8 — NO PLACEHOLDER IN AN ISSUED TASK. A Form B or Form D containing a
  bracketed instruction to the planner, an unfilled reference, or a rule cited by
  section number instead of pasted, is not issuable. This rule block is pasted
  VERBATIM into every Form D header — never referenced, never summarised, never left
  as a placeholder for assembly. ★

★ NO LINE NUMBER FROM ANY PREVIOUS TASK IS AN ANCHOR. Locate every region by census
  in THIS task, then bound it by brace counting. ★

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
```

### Block A — corrected attribution across all seven flag-write regions

**A1.** Locate each of these seven names by the definition-header rule **including its fallback**, as separate patterns. Each is supplied as a FULL identifier.

```
SRJ_OB_ReplayActivationInvalidation
SRJ_OB_ActivationInvalidationPass
SRJ_FVG_CreationRenewalPass
SRJ_FVG_TickValidRecomputePass
SRJ_Bias_DecisionBlock
SRJ_Bias_PerBarResetPass
SRJ_StateInit
```

For each, report every candidate, its parameter-list closing line, and its classification. For each DEFINITION, bound it by brace counting and report file, header line, opening brace line, closing brace line, integer line count, brace counting confirmed. **Do not paste any region.**

**A2.** For each A1 DEFINITION, report **every parameter** of the definition header as `<position> | <parameter text> | BY REFERENCE or BY VALUE | CONTAINS-ASTERISK: yes or no`. Where the parameter list spans more than one line, paste every line of it, one pasted source line per output line, before reporting the parameter table.

**A3.** For each A1 DEFINITION, and **from that brace-counted range only**, report every line that assigns to any of these three identifiers by the assignment-target rule, as `<line>: <text> | ASSIGNS-TO <name> | RHS <verbatim>`:

```
tickOBIsValid
tickFVGIsValid
hasPersistedOpposingFVG
```

Report the integer count per region per identifier. **A count of 0 is a result.** Report `ABSENT` where an identifier does not occur in the region at all.

**A4.** For **every** line reported in A3, apply the **attribution rule (amendment 14)** in full, region by region, and report parts (a), (b), (c), (d) and (e) separately with every number used. Name the paste searched per region. Report the conjunction as `IN SCOPE` or `NOT IN SCOPE` per candidate, and where nothing qualifies report `NO OBJECT IN SCOPE AT THIS STATEMENT`.

**A5.** For every variable and every parameter reported `IN SCOPE` in A4, and from the same region's brace-counted range only, report every line in which that name appears, as `<line>: <text>`, marked INCIDENTAL where the substring rule requires and reporting the containing identifier. Report the integer count per name.

**A6.** For each A1 DEFINITION, and from that range only, census each of these as a **separate pattern** under the multi-pattern and substring rules, and paste every distinct line once with `[matched: …]`:

```
objId
COrderblock
CImbalance
GetOB
GetFVG
SRJ_createImbalance
SRJ_NextObjId
discoveryBar
```

Report `N_OCC` per pattern and a single per-region `N_LINES`. Report `ABSENT` per pattern where it does not occur. **NO CAPS.**

### Block B — buffer 35's scope question

**B1.** Locate `SRJ_FVG_TickValidRecomputePass` by the definition-header rule, bound it by brace counting, report the range and integer line count. **Paste the region WHOLE if 80 lines or fewer**; otherwise say EXCEEDS 80 and paste from the opening brace through the last line carrying a return statement, inclusive, stating the range.

**B2.** From the B1 paste only, naming the paste searched:

```
every "for" or "while" or "switch" or "do" header by the whole-token rule =
   <line>: <text>, or ABSENT, with the whole-token count as the RESULT and the raw
   substring count as a DIAGNOSTIC
every return statement = <line>: <text>, BARE or CARRIES-AN-EXPRESSION with the
   exact returned expression text; report the statement count and the raw
   substring-hit count separately
every assignment-target line = <line>: <text>, with the exact RHS
every line containing "Total(" = <line>: <text>, or ABSENT
every line containing "startBar" = <line>: <text>, or ABSENT
every line containing "isFilled" = <line>: <text>, or ABSENT
every line containing "strictLimitBar" = <line>: <text>, or ABSENT
every comparison line by the comparison rule for the identifier "latestBiasFVGBar"
   = <line>: <text>, or ABSENT
```

**B3.** From the B1 paste only, for the **lowest-numbered** line that assigns to `tickFVGIsValid` — the selection rule for this item is: the smallest line number among the A3 assignment lines for this region — report:

```
<line>: <text>
its FULL open-brace stack per the enclosing-construct rule, with each entry's
   OPENING line and BRACE-COUNTED CLOSING line, or NOT ENCLOSED
every variable and every pointer parameter satisfying attribution-rule part (a) or
   (b) whose declaration line D satisfies D < S, listed with D, or
   NONE WITH D < S
VERDICT: NO OBJECT IN SCOPE AT THIS STATEMENT, or the list of IN SCOPE candidates
```

**B4.** From the B1 paste only, report the **loop direction** of every `for` header found in B2, as `<line>: <text> | INIT <text> | CONDITION <text> | INCREMENT <text>`, taking each clause verbatim between the header's unquoted `;` characters at paren depth 1. **No statement about what the direction means.**

**B5.** Census all 16 files for `SRJ_FVG_TickValidRecomputePass` under the substring rule. Report `N_OCC`, a single per-file `N_LINES`, and paste every distinct line once. Classify each as `DEFINITION HEADER`, `CALL SITE`, `DECLARATION`, or `OTHER` stating which. For every CALL SITE, report its exact argument list text under the **multi-line call rule**, its enclosing function with brace-counted range and integer line count, and its FULL open-brace stack.

### Block C — the four unread FlowLogic passes, and the emission surface

**C1.** Locate each of these four names by the definition-header rule **including its fallback**, as separate patterns. Each is supplied as a FULL identifier.

```
SRJ_OB_InactiveLinePrunePass
SRJ_OB_OpposingCachePass
SRJ_Bias_WeakFlipLatchPass
SRJ_Alerts_DispatchBiasRenewal
```

For each, report every candidate, its parameter-list closing line, and its classification. Bound each DEFINITION by brace counting and report file, header line, opening brace line, closing brace line, integer line count, brace counting confirmed.

**C2.** For each C1 DEFINITION, report the integer line count first. **Paste WHOLE if 120 lines or fewer**; otherwise say EXCEEDS 120 and paste the header through the last line carrying a return statement, inclusive, stating the range.

**C3.** From each C2 paste only, and naming the paste searched per region:

```
every parameter = <position> | <parameter text> | BY REFERENCE or BY VALUE
every line containing ".Delete(" = <line>: <text>, or ABSENT
every line containing ".Add(" = <line>: <text>, or ABSENT
every line containing ".Clear(" = <line>: <text>, or ABSENT
every line containing ".Total(" = <line>: <text>, or ABSENT
every line containing "g_orderblocks" = <line>: <text>, or ABSENT
every line containing "g_imbalances" = <line>: <text>, or ABSENT
every line containing "ObjectDelete" = <line>: <text>, or ABSENT
every line containing "barClosed" = <line>: <text>, or ABSENT
every line containing "Alert" = <line>: <text>, or ABSENT, marking INCIDENTAL
   where the substring rule requires and reporting the containing identifier
every line containing "SendNotification" = <line>: <text>, or ABSENT
every line containing "Print" = <line>: <text>, or ABSENT
every assignment-target line = <line>: <text>, with the exact RHS
every "for" or "while" or "switch" or "do" header by the whole-token rule =
   <line>: <text>, or ABSENT
every return statement = <line>: <text>, BARE or CARRIES-AN-EXPRESSION with the
   exact returned expression text
```

**C4.** For every line reported in C3 containing `.Delete(`, and separately for every line containing `Alert` that is not INCIDENTAL, report:

```
<file> <line>: <text>
its FULL open-brace stack per the enclosing-construct rule, outermost first, with
   each entry's OPENING line and BRACE-COUNTED CLOSING line
VERDICT: <ANY-LOOP-OR-SWITCH-IN-STACK: yes, naming every such entry |
          NO-LOOP-OR-SWITCH-IN-STACK>
the nearest enclosing "if" by BRACE SCOPE, entire line, marked SAME-LINE where
   required, or NOT ENCLOSED
```

**C5.** Census **all 16 files** for each of these as a **separate pattern** under the multi-pattern and substring rules:

```
Alert(
SendNotification(
PlaySound(
SendMail(
SendFTP(
```

Report per file `N_OCC` per pattern and a **single** per-file `N_LINES`. Paste each distinct line once as `<file> <line>: <text>` with `[matched: …]`. **NO CAPS.** For every distinct line, report its enclosing function by the definition-header rule with the brace-counted range and integer line count, or `NO ENCLOSING FUNCTION - FILE SCOPE`. Report `ABSENT` per file per pattern where it does not occur. **A count of 0 is a result.**

**C6.** In `SRJ_FlowLogic.mq5` only, locate the enclosing function of the call site of `SRJ_Alerts_DispatchBiasRenewal` by the definition-header rule and bound it by brace counting, reporting the range and integer line count. Then, from that range only, report **every** call site of any name matching `SRJ_` under the substring rule, as `<line>: <text>`, in ascending line order, with the called name and the exact argument list text under the **multi-line call rule**. Name the paste searched. **A name absent from any list in this task is a result and must be reported.**

### Block D — `ZoneAdoptable`

**D1.** Locate `ZoneAdoptable` by the definition-header rule **including its fallback**. Report every candidate, its parameter-list closing line, and its classification. Bound the DEFINITION by brace counting and report file, header line, opening brace line, closing brace line, integer line count, brace counting confirmed.

**D2.** Report the integer line count first. **Paste the region WHOLE if 90 lines or fewer**; otherwise say EXCEEDS 90 and paste the header through the last line carrying a return statement, inclusive, stating the range.

**D3.** From the D2 paste only, naming the paste searched:

```
every parameter = <position> | <parameter text> | BY REFERENCE or BY VALUE
every return statement = <line>: <text>, BARE or CARRIES-AN-EXPRESSION with the
   exact returned expression text; report the statement count and the raw
   substring-hit count separately
every "for" or "while" or "switch" or "do" header by the whole-token rule =
   <line>: <text>, or ABSENT
every line containing "g_zoneHi" = <line>: <text>, or ABSENT
every line containing "g_zoneLo" = <line>: <text>, or ABSENT
every line containing "g_touchSeen" = <line>: <text>, or ABSENT
every line containing "objId" = <line>: <text>, or ABSENT
every line containing "Print" = <line>: <text>, or ABSENT
every assignment-target line = <line>: <text>, with the exact RHS
every "if" line = <line>: <text>, with its FULL open-brace stack
```

**D4.** Census all 16 files for `ZoneAdoptable` under the substring rule. Report `N_OCC`, a single per-file `N_LINES`, and paste every distinct line once, marking INCIDENTAL where the substring rule requires and reporting the containing identifier. Classify each non-INCIDENTAL line as `DEFINITION HEADER`, `CALL SITE`, `DECLARATION`, or `OTHER` stating which. For every CALL SITE, report its exact argument list text under the multi-line call rule, its enclosing function with brace-counted range and integer line count, and its FULL open-brace stack with each entry's OPENING line and BRACE-COUNTED CLOSING line.

**D5.** Locate `ZoneInPlay` by the definition-header rule including its fallback. Report every candidate, its parameter-list closing line, and its classification. If a DEFINITION exists, bound it by brace counting and report the range and integer line count. **Do not paste it.** If none exists, report `NO DEFINITION FOUND`.

### Report format

```
TASK 160-PreJ: COMPLETED | BLOCKED | PARTIAL
Files read: <every full path and the command used>
Files written: none
Checkpoints: none (read-only task)
Commands that failed: <command as issued and raw error text, or "none">
Splits declared: <block, item, exact resume line, or "none">
                 A PART BOUNDARY IS A SPLIT AND MUST APPEAR HERE, AND EVERY PART
                 MUST BE DELIVERED.
Truncations: <block and item with "TRUNCATED AT n OF total", or "none">
Definition-header classifications: <every candidate, its param-list closing line,
                                    DEFINITION or DECLARATION, and whether the
                                    fallback was reached>
Paste-sizing rule: <per region, WHOLE / TERMINATOR-BOUNDED / EXCEEDS N, and the
                    line count>
Brace rule used: brace counting — confirm for A1, A4(c), A4(d), B1, B3, B5, C1,
                    C4, C5, C6, D1, D4, D5
Enclosing-construct rule used: confirm that FULL open-brace stacks were computed
                    and that headers were resolved by upward scan, not proximity
Attribution rule used: confirm that (a) enumerated POINTER PARAMETERS from the
                    definition header, that (e1) D < S was tested, that (e2) tested
                    BOTH the opening AND the brace-counted CLOSING line, and that
                    (e3) tested stack membership. State per named statement which of
                    (e1), (e2), (e3) failed where a candidate was rejected.
Multi-line call rule used: confirm that every argument list was closed by matching
                    paren across line boundaries, and that no answer was reported
                    as UNTERMINATED
Census-pattern provenance: confirm that every pattern naming a function was matched
                    as supplied, and report INCIDENTAL-ONLY where it applies

<Block A: A1 classifications and ranges, A2 parameter tables, A3 assignment lines,
          A4 full attribution per statement, A5 use traces, A6 per-region census>
<Block B: B1 range and paste, B2 statements, B3 lowest-write verdict, B4 loop
          directions, B5 call-site census>
<Block C: C1 classifications and ranges, C2 pastes, C3 per-region statements,
          C4 delete and alert stacks, C5 16-file emission census, C6 ordered
          SRJ_ call list>
<Block D: D1 classification and range, D2 paste, D3 statements, D4 call-site
          census, D5 ZoneInPlay classification>

FINAL ITEM, MANDATORY — THIS ITEM MUST APPEAR IN THE DELIVERED OUTPUT:
  certutil -hashfile "DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256    -> paste raw
  certutil -hashfile "DF\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256    -> paste raw
  Compare each to the value supplied in this task's header. State MATCH or
  MISMATCH per file, quoting both the supplied value and the observed value.
```

No diagnosis. No hypothesis. No architecture opinion. No statement about what any number means.

## 12.1 Restrictions checklist

- No source edits. No compile. No test run. No file written to the canonical tree.
- No line number from any previous task used as an anchor. Every region located by census in this task and bounded by brace counting.
- No expected count and no expected region size stated. **No observed value compared to any figure from any previous task, including 160-PreG and 160-PreH.** In particular, no scope verdict from 160-PreH may be quoted, compared to, or used to shortcut Block A — **that output is void and re-deriving it from the void answer would reproduce the defect.**
- No enclosing construct or condition reported by textual proximity. Brace scope only, full stack, headers resolved by upward scan, **and every brace entry reported with both its opening and its brace-counted closing line.**
- **No scope verdict computed from opening lines alone.** All three parts of amendment 14(e) are required, each reported separately with its numbers.
- **No pointer parameter omitted from attribution.** A region whose only object is a parameter must not return "no construction."
- No `N_LINES` summed across patterns. No completeness verdict on a summed per-pattern total.
- No keyword censused as a substring; whole-token result, raw count as diagnostic only.
- No census pattern naming a function typed from memory; every one is supplied as a full identifier, and INCIDENTAL-ONLY is a legal result.
- **No argument list reported as UNTERMINATED.** The multi-line call rule closes it or the lines are pasted.
- **No `}` line reported as a declaration.** Amendment 15.
- No buffer index proposed, no buffer count asserted, no `SState` field name proposed, no candidate capacity.
- No `iCustom` or input change.
- No `.txt` dump as source. No `D:` path read, including the local repository (P14).
- No `objId` treated as a cross-run identity.
- No inferred value substituted for missing data. Every legal answer in the rule block is a correct answer, including `NO OBJECT IN SCOPE AT THIS STATEMENT`.
- No verdict built on an INCIDENTAL, STRING-LITERAL, COMMENT or CONTAINS-EQUALS-NOT-TARGET line.
- No production code in the response. No paste abbreviated with `...`. No line retyped. No shell prompt text inside a paste. **One pasted source line per output line, in every statement list.**
- No region pasted whose line count was not reported first.
- A part boundary is a split, must be declared, and **every part must be delivered including the final hash item**.
- Both hashes must match the supplied values at the end.

Local checkpoint before issue: `Rev060_Task160_PreJ_AttributionRerunAndUnreadPasses`, source-only shape — `SOURCE_SNAPSHOT\ EXTRACTIONS\ TASK_HANDOFF.txt\ RESULT.txt`.
