# SRJ Flow Nexus — Revision 60 Consolidated Handoff
## The Admission Path Is Fully Read. Attribution Is Void And Must Be Re-Run.

**Supersedes** Revision 59 **and all of its addenda** for task control, sequencing, specification direction, prohibitions, contracts and the open-item register.
**Retains** Revision 56 §§6, 7, 8, 10, 14 as the evidence layer.
**Operating mode:** alert-only. No execution, no live trading.
**Prepared from:** Revision 59, the returns of Task 160-PreF, 160-PreG and 160-PreH, and the planner amendments issued between them.

---

# 0. Document policy and required session inputs — read this first

Revision 60 is the working record. It is **not** self-contained, and two of its gaps are blocking.

| Layer | Document | Status in a fresh session |
|---|---|---|
| Task control, sequencing, prohibitions, architecture target, acceptance, contracts | **Revision 60** (this document) | authoritative |
| Measured evidence, log formats, defect ledger EA-1 … EA-146, operator answers R-Q13/14/15 | **Revision 56 §§6, 7, 8, 10, 14** | binding, **absent from recent sessions** |
| Terminator definitions T1–T5, lifecycle rulings, provenance contract, forgetting rule | **Revision 56 §5 (amendment A-3)** | binding, **absent, and open item 6 is blocked on it** |
| Confluence constituents (the 2-of-3 set) | **Part A Specification v4.2 §3.7** | binding, **absent, and open item 6 is blocked on it** |
| Strategy meaning | Part A v4.2 + A-3 + **A-4** (§5 below) | authoritative |

**Two documents must enter the next session or two deliverables stay `UNKNOWN`.** Revision 56 §5 and Part A v4.2 §3.7. Without them: `SHypothesis.confluenceLatches` has no constituent set, T1/T2/T4/T5 cannot be attached to the split S5 states, and **Task 165 is blocked rather than deferred.** Everything through Task 164 is unaffected.

**The line map in §8 is a navigation aid, not an anchor set (P12).** Every region in it was established by census plus brace counting in one of the last ten source-only returns, and both `.mq5` digests were verified unchanged at the start and end of each. **No architecture task may anchor on a number in this document.** The 714/691 discrepancy at §8.10 and the `SState` bound discrepancy closed at §7.92 are the standing proofs of why.

**Task lineage.** Tasks 91–152 complete or closed-partial per Rev 56 §4. Task 153 dissolved (Block A → Task 158 Block H; Blocks B–D **now superseded**, §12.6). Task 158 and its three corrections COMPLETED. Task 159 delivered in three parts plus an addendum. Task 160-PreD COMPLETED; 160-PreD-R dissolved before issue; **160-PreD-R2, 160-PreE, 160-PreF, 160-PreG and 160-PreH all COMPLETED.** Tasks 154–157 re-scoped; 154–156 released, 157 dissolved into 163. Tasks 128 and 132 dissolved. Tasks 141, 142, 129, 130, 131 paused.

**The next builder task is 160-PreJ and its full text is at §12.** Four blocks: the corrected attribution across all flag-write regions, buffer 35's scope question, FlowLogic's three unread passes plus the emission-surface census, and `ZoneAdoptable`. **After it returns, Task 154's Form B is writable.**

---

# 0.1 Fresh-session opening position

> You are the planner/coder model for SRJ Flow Nexus. Revision 60 changes nothing about the method Revision 57 established. It records that ten source-only tasks have now run, that the admission path is fully read for the first time, and that **the last round's central deliverable was void because the planner's own rule was arithmetically wrong.**
>
> Revision 57 reset the project from patch-driven to model-first: establish the ownership map from source, define the data contracts, then migrate one responsibility per stage. **The ownership map is complete. Twelve data contracts are drafted with every field classified. The lifecycle mapping is closed. `EvaluateClosedBar`'s extraction property, its single call site, `ComputeNearestTpTarget`, `TpTargetUpdateBest` and `ComputeSlReference` are all read — the whole admission path.**
>
> **No production edit has been made. No number has been measured.** Revisions 57 through 60 contain no new measurement at all. The first number will come from Task 160's Tier 1 regression.
>
> **Thirty-three source findings are on record from this arc (EA-147 through EA-179) and seven of them changed a design.** The four largest: **EA-159** forced P16 — structural objects are deleted intrabar with no snapshot rollback, so no candidate may ever hold a pointer or an array index, and identity re-lookup needs a first-class `GONE` outcome. **EA-165** split one contract field into two vocabularies. **EA-171 and EA-174** together established that *both* of the hypothesis's derived references — target and stop — read the live zone globals in control flow, so §9.9 and §9.10 were drafted wrong and Task 162's zone retirement would silently move every target and every stop. And **EA-163's order-block half was withdrawn on evidence**, the first of three findings this project has now retracted.
>
> **Read §18.4 before writing a task.** Fifty-five of the eighty-six recorded census defects are the planner's, and the root now repeats in three variants: a rule specified against a target whose shape had not been established first; a gate declared clear against a region no task has read; and — new, and the most expensive — **a rule whose arithmetic is wrong in a way that produces a self-consistent answer.** Defect 83 reported six variables in scope at a statement that precedes their declaration, and rejected the one variable that genuinely was in scope. The builder computed it exactly as written. §3.5 carries the corrected rule set with all fifteen amendments. Use it verbatim, pasted, never referenced by section number.
>
> Do not rewrite the EA. Do not propose one-line gate changes aimed at aggregate signal counts. Do not make the singleton candidate-aware by copying global flags into structs. Operation stays alert-only.

---

# 1. Roles — unchanged

| Role | Responsibility |
|---|---|
| Operator | Final authority on discretionary strategy meaning |
| External council | Specification auditor, architecture reviewer, independent advisor |
| Planner/coder (you) | Converts rulings and directives into numbered, builder-safe tasks |
| Builder agent | Literal edits, extraction, compilation, mechanical log parsing |

Label every request **OPERATOR ANSWER REQUIRED** or **DELEGATE TO PLANNER/BUILDER**.

**Specification amendments, contract changes and council deliverables are planner work.** Handing a Form S to the builder would ask it to classify design consequences from findings, which is the one thing the discipline is built on refusing.

The council's directives and this document are **architecture and task-control documents**, not production specifications. Every struct field, lifecycle state and state name below is an **architectural placeholder**, reconciled against Part A and the operator's rulings before it enters a Form B.

**Builder standing: twenty consecutive rounds procedurally clean on substance.** Its behaviour is the standard to preserve — halting on an identifier that does not exist rather than substituting; reporting `ABSENT` and naming the paste searched; reporting `RHS = UNKNOWN` rather than guessing; marking incidental matches; leaving planner-owned columns blank; following the letter of a rule where the rule was wrong; disclosing failed commands verbatim with their consequence and recovering the lost item in the next block; leaving self-caught contaminated output on the record as superseded rather than quietly replacing it. **In the last round it disclosed four self-corrections, two helper limitations, and — critically — volunteered that `ob` is a function parameter rather than a local, which is the fact that exposed defect 84 in a rule that had just returned a clean-looking answer.** Three times in five rounds it located a gap in the planner's rule set that no item asked about.

---

# 2. Standing prohibitions — P1 through P16

P1 through P11 carry forward exactly as Revision 56 §2 defines them, including P3a (buffers append only), P5 (class fields append only), P5a (`SState` fields append only with the initialiser beside them in `SRJ_StateInit`), P6 (canonical tree only), P7 (compile gate), P8/P8a (real ticks and the fingerprint), P9 (liveness probe), P10 (never Compile All), P11 (never open a non-allow-listed file; read source via shell).

| # | Rule |
|---|---|
| **P12** | No production edit from an architecture document. Every edit requires a predecessor Form D that pasted the exact region, brace-counted, from the canonical tree, **in that task or its immediate predecessor**. A field name, state name or line number in Revision 57–60 or a council directive is not an anchor. **An anchor ages out: a region established two source-only tasks ago is not a predecessor anchor** (defect 75) |
| **P13** | No existing structure renamed to imply an architecture it does not have. A named abstraction that does not own its data is worse than the singleton, because it hides the singleton |
| **P14** | No candidate concurrency until isolation is proven by a per-field load/store log. Capacity stays 1 until Council Milestone 1 passes. Also governs the local repository: it is a checkpoint store, never a source or an edit target |
| **P15** | Unknown provenance is represented as `UNKNOWN`. Parentage, structural-leg membership and bundle association are never inferred from price proximity, bound similarity or bar adjacency |
| **P16** | **No contract field, no candidate field and no hypothesis field may hold a pointer or an array index into `g_orderblocks` or `g_imbalances`.** Structural objects are deleted intrabar, before the identity export, with no snapshot rollback. A stored pointer becomes dangling and a stored index silently renames. Every reference goes through `SObjectRef` — an `objId` plus a resolution outcome re-read by identity every bar. Storing a pointer or an index is a P13 violation in effect: it names an object without owning the guarantee that the object exists |

**The standing no-dimensional-thresholds rule carries forward without change.** An operator ruling containing a number is restated structurally before it enters the specification. A registry capacity is an engineering safety limit and must be justified as one, never as strategy.

**Two bounded exceptions are established.** `CurrentTradingWindow`'s hour literals are **session-boundary definitions**, not strategy thresholds, so the rule does not reach them — but their duplication across two files does (open item 12). And the **500-slot walk bound** now appears three times inside `ComputeSlReference` alone (EA 922, 983, 1046) plus its original site; it is an engineering safety limit in each case and must be justified as one wherever it is ported.

---

# 3. Task protocol

**Form B** (edits), **Form D** (extraction and census) and **Form S** (specification amendment, planner deliverable, council-reviewed) carry forward exactly as Revision 56 §3 and Revision 57 §3 define them, including the compile-verification gate, the run-without-compile stasis check, the export-stage gate inversion, the counting patterns, the log-line selection method and the three-tier harness.

A Form B that introduces or moves a responsibility requires a Form S establishing which component owns that responsibility afterwards.

### 3.4 The architecture-task gate — binding on Tasks 160 through 166

Every architecture Form B carries, in addition to the standard Form B gate:

1. **A responsibility statement** — which component owns each fact the edit touches, before and after.
2. **A leakage proof obligation** — for any task that loads or stores legacy globals, a per-field log of every field read and written, and a stated expectation that the restored value equals the saved value on every non-owning path.
3. **A byte-identity or explicit-delta declaration.** An inert edit regresses byte-identical at Tier 1; any delta is `BLOCKED`. A behaviour-changing edit states the expected direction and the reason, and states that magnitude is not predicted (EA-133).
4. **A rollback checkpoint** in the local repository (§19), taken before the edit, named per §19's convention.

### 3.5 The corrected census rule set — PASTE VERBATIM INTO EVERY FORM D

Fifty-five of the eighty-six recorded census defects are the planner's. Each rule below closed one or more of them. **Paste this block into every Form D header. Do not paraphrase, do not reference it by section number (defect 71), and do not drop a rule between tasks — defect 59 was dropping the substring rule after having written it.** Fifteen amendments are marked; all fifteen are binding.

```
★ ALL CENSUS MATCHES ARE CASE-SENSITIVE. Similar names are separate patterns:
  "londonHigh" and "prevLondonHigh" are DIFFERENT and must be censused apart. ★

★ SUBSTRING RULE. An identifier occurrence lying inside a LONGER identifier is
  reported and marked INCIDENTAL, and NO VERDICT may be built on it. Report the
  containing identifier. (Closed defect 59: "validationBar" inside
  "invalidationBar".) ★

★ AMENDMENT 10 — WHOLE-TOKEN RULE. Where a census pattern is a LANGUAGE KEYWORD —
  for, while, switch, do, if, else, return, break, continue, goto, case — match
  WHOLE TOKENS only: the character before and after the match must each be absent
  or non-identifier (not a letter, digit or underscore). Report the whole-token
  count as the census RESULT and the raw substring count separately as a
  DIAGNOSTIC. Never make a keyword a substring pattern. (Closed defect 77: "do" as
  a substring returned 109 hits inside double, inWindow, g_shadowActive and
  ZoneAdoptable against 0 real occurrences.) ★

★ MULTI-PATTERN CENSUS RULE. Where a block lists several patterns, report per file:
    N_OCC   = total pattern hits, PER PATTERN, counting repeats on a line
    N_LINES = a SINGLE per-file count of DISTINCT lines matching at least one
              pattern
  Paste each DISTINCT line exactly ONCE as <file> <line>: <text>, and append
  [matched: p1, p2]. Paste count must equal the per-file N_LINES summed over files.
  NO CAPS. (Closed defects 48 and 57.) ★

★ AMENDMENT 5 — MULTI-PATTERN TOTALS RULE. NEVER sum N_LINES across patterns — a
  line matching three patterns is ONE line. No completeness verdict may be built on
  a summed per-pattern total. (Closed defect 70.) ★

★ AMENDMENT 9 — BLOCK-COMMENT RULE. Comment exclusion covers "/* ... */" as well as
  "//". Discard every character from an unquoted "/*" through the matching "*/",
  including across line boundaries, before applying any census, assignment-target,
  comparison, return-statement or header test. A line wholly inside a block comment
  is reported as COMMENT and no verdict may be built on it. (Closed defect 76.) ★

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
  is EXPECTED — never search for "identifier =" as one literal. (Closed defects 47,
  54, 60, 68.) ★

★ AMENDMENT 11 — RIGHT-HAND-SIDE RULE. Where an item asks for the exact right-hand
  side of an assignment, the RHS is the text after the qualifying "=" up to, but
  excluding, the first unquoted ";" at the same paren and bracket depth. If no such
  ";" exists on the line — a for-init clause, a multi-line initialiser — report
  RHS TERMINATOR NOT ON LINE and paste the remainder verbatim, marked as such.
  Never report end-of-line text as an RHS without that mark. (Closed defect 78.) ★

★ COMPARISON RULE. A line COMPARES X if X occurs on the line, not INCIDENTAL,
  outside every string and every comment, and the line contains "==" or "!=" or the
  line's first non-space token is "case". ★

★ AMENDMENT 1 — FILE-SCOPE DECLARATION RULE. NEVER ENUMERATE TYPE KEYWORDS. A line
  is a file-scope declaration if it begins at column 0, does not begin with "//",
  ends in ";", contains the named identifier as an assignment target or as the last
  token before ";" or "[", and its first token is not one of
  if/for/while/return/switch/case/else. Report the first token as the declared type
  VERBATIM, whatever it is. (Closed defect 66: an enumerated keyword set omitted
  ENUM_SRJ_DIR, ENUM_SRJ_REGIME and ENUM_SRJ_SESSION.) ★

★ AMENDMENT 15 — DECLARATION BRACE EXCLUSION. A line whose first non-space token
  is "}" is NEVER a declaration, whatever else the line contains and however it
  terminates. Report it as CLOSING BRACE. This applies to the file-scope
  declaration rule and to every relaxed variant of it. When an item asks for the
  HIGHEST-numbered declaration in a range, a CLOSING BRACE line may not be that
  answer. (Closed defect 85: "};" was reported as the highest declaration in the
  SState struct, which contradicted the recorded last-field line and could not be
  distinguished from a genuine disagreement.) ★

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
  definition. If none exists, report NO DEFINITION FOUND. (Closed defect 53.) ★

★ AMENDMENT 7 — FALSIFIABILITY RULE. Where an item asks for a classification that
  gates a design decision, the item MUST also require the brace-counted range and a
  paste sufficient to falsify the classification — WHOLE if within the item's size
  bound, else the header through the first terminator. A classification delivered
  without a paste is not verifiable and may not gate a decision. (Closed the
  714/691 discrepancy: a self-consistent DECLARATION verdict on a byte-identical
  file stood for two rounds and was exposed the moment a whole region was pasted.) ★

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
  close an unbalanced paren. (Closed defects 61 and 67.) ★

★ AMENDMENT 6 — ENCLOSING-CONSTRUCT RULE. To name the construct enclosing a
  statement, compute the FULL open-brace stack from the region's opening brace to
  the statement, outermost first, and report EVERY entry as <line>: <text>
  unmodified. For each entry whose first non-space token is "{", scan upward to the
  first preceding line whose first non-space token is if/else/for/while/switch/do
  AND whose own text is not terminated by ";", and report THAT line as the entry's
  header. Classify from the header, never from the brace line. Report the whole
  stack, not only the innermost. If any entry's header is for/while/switch/do, SAY
  SO EXPLICITLY. If no header can be resolved for an entry, report HEADER UNRESOLVED
  and paste the brace line verbatim. (Closed defect 72.) ★

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
  "NO OBJECT IN SCOPE AT THIS STATEMENT". That is a RESULT, not a failure.
  (Closed defects 82, 83 and 84: a scope test comparing only against brace OPENING
  lines reported six variables in scope at a statement 35 lines before the first of
  their declarations, and rejected the one variable that genuinely was in scope; and
  the rule admitted no pointer parameters, so a region whose only object is a
  parameter returned "no construction".) ★

★ AMENDMENT 4 — RETURN-STATEMENT RULE. Where an item asks about returns, report
  STATEMENTS and substring hits SEPARATELY and never conflate them. A line carries a
  return statement only if "return" occurs outside every double-quoted string,
  outside every comment, and is not part of a longer word — returns, returned,
  returning are INCIDENTAL by the substring rule. Report per qualifying line whether
  the statement is BARE ("return;") or CARRIES AN EXPRESSION, and report both the
  statement count and the raw substring-hit count. (Closed defect 69.) ★

★ CLASSES ARE NOT MUTUALLY EXCLUSIVE unless the item says so. Report a line once per
  applicable class. (Closed defect 46.) ★

★ LEGAL ANSWERS: "ABSENT" (not in the named paste), "NOT STORED" (no identifier
  holds the fact), "UNKNOWN" (source does not establish it), "NO CALL IN THIS FILE",
  "NO DEFINITION FOUND", "NOT ENCLOSED", "HEADER UNRESOLVED", "NO BRACED BODY",
  "RHS TERMINATOR NOT ON LINE", "NO ENCLOSING FUNCTION - FILE SCOPE",
  "NO OBJECT IN SCOPE AT THIS STATEMENT", "CLOSING BRACE".
  Never substitute the nearest available identifier. (Closed defect 49.) ★

★ AMENDMENT 12 — FILE-SCOPE ANSWER RULE. Where an item asks for an enclosing
  function, enclosing construct or brace stack, "NO ENCLOSING FUNCTION - FILE SCOPE"
  is a LEGAL ANSWER and must be listed as one in the item. A #define, a file-scope
  declaration or a preprocessor line has no enclosing region and the item must not
  imply one. (Closed defect 79.) ★

★ AMENDMENT 13 — CENSUS-PATTERN PROVENANCE RULE. Where a census pattern names a
  FUNCTION, the pattern is taken from a definition header established in THIS task
  or supplied in the item text as a FULL identifier. If a pattern yields only
  INCIDENTAL matches under the substring rule, report INCIDENTAL-ONLY and report the
  containing identifier for every match. DO NOT substitute the containing identifier
  and DO NOT re-run with a corrected pattern unless the item text names that
  pattern. Report and stop. (Closed defect 81: four pass names censused without
  their SRJ_ prefix were every one a proper substring of the real identifier, so the
  item answered nothing and the pass order stayed unestablished for a round.) ★

★ ANSWERABILITY, WITH COMPUTABILITY AND SELF-SELECTION. Where an item asks for a
  verdict, answer ONLY from the paste named in that item, and name the paste
  searched. A task must never ask a question whose answer lives outside a region the
  same task requested, and must never ask for a comparison against a value it did
  not supply. An item must never ask for a classification the builder cannot compute
  from what the task requested — "is this an ENUM_* member" is not decidable without
  a type census (defect 73). An item whose referent is singular where the producing
  item may return several must state its own selection rule in the item text
  (defect 74). (Closed defects 45, 52, 55, 56, 62, 73, 74.) ★

★ CLASSIFY MECHANICALLY. Never classify from a comment. ★

★ AMENDMENT 8 — NO PLACEHOLDER IN AN ISSUED TASK. A Form B or Form D containing a
  bracketed instruction to the planner, an unfilled reference, or a rule cited by
  section number instead of pasted, is not issuable. This rule block is pasted
  VERBATIM into every Form D header — never referenced, never summarised, never left
  as a placeholder for assembly. (Closed defect 71.) ★

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
```

---

# 4. Task status

Tasks 91–152 unchanged from Revision 56 §4. Changes and new entries only.

| Task | Form | Status | Outcome |
|---|---|---|---|
| 153 | D | DISSOLVED | Block A → Task 158 Block H, closed. **Blocks B–D superseded** by 160-PreG/PreH (§12.6) |
| 158 | D | COMPLETED | Architecture recovery census, eight blocks. Stasis MATCH |
| 158-CorrectionA/B/C | D | COMPLETED | Map completion, ruling maps, guards and gating. Stasis MATCH each |
| 159 | S | **DELIVERED, awaiting council** | Twelve contracts, lifecycle mapping closed, transition rules, ownership table. **Twenty packet items at §11.7** |
| 160-PreD | D | COMPLETED | Enum, append points, cascade range, four free riders. Stasis MATCH |
| 160-PreD-R | D | DISSOLVED before issue | Superseded by 160-PreD-R2 |
| 160-PreD-R2 | D | COMPLETED | Four recoveries. Stasis MATCH |
| 160-PreE | D | COMPLETED | Extraction property, array ordering, target verdict. Stasis MATCH |
| 160-PreF | D | **COMPLETED** | Entry point, call sites, append regions, `TpTargetUpdateBest`. Items 14, 15 closed. Stasis MATCH |
| 160-PreG | D | **COMPLETED** | Buffer interface, flag census, `SState` bound, `barClosed`, zone readers. Items 16, 17 closed. Stasis MATCH |
| 160-PreH | D | **COMPLETED** | `ComputeSlReference`, attribution, `SState` bound settled, pass order, buffer gaps. **Attribution output VOID (defect 83).** Stasis MATCH |
| **160-PreJ** | **D** | **LIVE — §12** | Corrected attribution ×7 regions; buffer-35 scope; three unread FlowLogic passes + emission census; `ZoneAdoptable`. No edit, no compile, no run |
| 154 | B | **RELEASED, one round out** | Export stage 1, buffer 36. **Writable after 160-PreJ Block A** |
| 155–156 | B | RE-SCOPED, released | Export stages 2–3. **Stage 3's shape depends on 160-PreJ Block B** |
| 160 | B | QUEUED | Architecture shell. Inert, Tier 1 byte-identical. **Gated on council only — the source half of its gate is met** |
| 161 | B | QUEUED | Legacy cascade adapter, whole extraction, per-field load/store log. **Milestone 1.** Body property and call site both established |
| 162 | B | QUEUED | Candidate-owned binding at capacity 1, siblings logged. **Milestones 2, 3, 4.** Zone retirement now depends on packet items 18–20 |
| 163 | B | QUEUED | Provenance completion, absorbs export stage 4. Scenario B becomes measurable |
| 164 | B | QUEUED | Phase A / Phase B, arbitration, EA-144 as commit test, concurrency enabled. **Milestones 5, 6** |
| 165 | B | QUEUED, **BLOCKED on documents** | Pending-entry lifecycle, T3, EA-142/EA-145 repair. Needs A-3 §5.10 and Part A §3.7 |
| 166 | B | QUEUED | Position and exit engine, plus post-fill target revision. EA-157 (two defects) and EA-158 sit behind it |
| 157 | B | DISSOLVED into 163 | Export stage 4 becomes Task 163's EA-side read |
| 141 | B | PAUSED | Strict promotion bound. R-Q11 answered. Re-enters after 162 |
| 142 | B | PAUSED, **shape changed twice** | `NO_TP_TARGET` advisory. Re-enters after 162 + council items 15, 17, 18 |
| 128 | B | DISSOLVED | EA-112 → lifecycle state; EA-144 → Phase B commit test |
| 132 | B | DISSOLVED | Umbrella for 160–164 |
| 129 | B | PAUSED, re-scoped | EA-120 limb 2 is now EA-156, three links not one. Re-enters after 163 + open item 4 |
| 130 | B | PAUSED | Promotion repair, one Form B per defect. Re-enters after 163 |
| 131 | B | PAUSED | Union-extreme export. Rides Task 165 |

---

# 5. Specification amendment A-4

A-3 (Revision 56 §5) is retained in full and is not superseded. A-4's §§5.30–5.33 carry forward from Revision 57 §5 unchanged: the nine layers, the field classification, the binding rule, and the table of what the two-phase split moves.

## 5.34 — A-4.1, from R-Q11. Promotion admissibility and the witness rule.

1. **Strong-path eligibility.** An order block is eligible for promotion on the opposing-double-invalidation event only if its own activation event precedes the invalidation counting that drives that event.
2. **Deferred promotion on the imbalance path.** Where an in-bias FVG is validated or present while the order block is not yet activated, promotion is *pending*. It fires at that order block's activation event, with no intervening wait: inactive → activated → promoted in one event.
3. **The witness rule.** The bar that performs the promotion is a **witness only**. Retracement or touch evidence is admissible only from bars strictly after the promotion event. Pre-promotion retracement of the same object is discarded and one further revisit is required.
4. **What satisfies the revisit.** Price entering the promoted XOB, or the retracement, or the leg from which the stop reference is taken being in play.

**Classification consequence.** The promotion event is immutable identity on the structural object record and latched setup evidence on the hypothesis at binding. Touch admissibility is a **derived** ordering comparison, never stored: `touchBar > bundle.xob.promotionBar`. Pre-promotion touch is **inadmissible, not forgotten** — `HYPOTHESIS_WAITING_TOUCH` must not be satisfiable by evidence dated at or before the promotion event. Because both operands are immutable identity, the comparison cannot drift, which makes EA-142's class of defect structurally impossible here rather than repaired.

**Implementation status, from source.** Ruling 1 is **implemented correctly** (§7.66). Ruling 3 is **enforceable from existing data** — buffer 33 carries the promotion time from the same object pointer as the bounds and the id, and the EA already reads it at 2288 as a diagnostic; Task 141 needs no new export, only that the read stops being diagnostic. Ruling 2 is **not implemented and is two defects, not one** (EA-157, §7.73 and §7.80): the selector requires `isActivated`, so nothing can enter the queue slot for an unactivated target, and nothing retains the slot if one somehow did. Repair is upstream FlowLogic work behind Task 166.

**Ruling 4 has an implementation the record did not know about.** *"The leg from which the stop reference is taken being in play"* is one of three revisit satisfiers, and `ComputeSlReference` — read for the first time this arc — is where that leg is chosen. It has **five `false` exits, three 500-slot walks, two independent zone guards, and a branch whose guards do not apply** (EA-176, EA-178). Packet item 19 is the consequence.

## 5.35 — A-4.2, from R-Q12. Target validity and post-fill revision.

1. **At admission**, a session extreme is a valid target only if that session has closed. A still-forming session extreme is not a valid target.
2. **After fill**, if the session in which entry occurred has since closed, the target may be revised to that session's extreme while the position is open.
3. A nearer valid target appearing after fill may license revision to the nearer target.
4. Realised outcome may therefore fall below the admission reward-to-risk **by design**.

**Classification consequence, and it splits an owner.** The target reference at setup completion is **latched setup evidence** owned by the hypothesis. The post-fill target is **live mutable state owned by the position and exit manager**. The target has two owners across one lifecycle. **Task 165 latches the admission target; Task 166 owns revision, and 165 must not implement it.**

**Implementation status.** Part 1 is **verified implemented** (§7.67). Parts 2 and 3 are **entirely absent**, confirming they belong to Task 166.

**§17.14's status.** The blanket prohibition on quoting R as strategy-correct was conditional on EA-138, EA-142, EA-145 and on R-Q12. The specification half is now met. **The prohibition lifts when Task 165 makes every emitted R computable from latched references, and not before.** It gained a third leg this arc: at the S2 poll, admission R is computed from a stop *and* a target that are both filtered by a rule which is inert before arming and live after (EA-171, EA-174).

---

# 6. Lifecycle model — Deliverable 2, closed

## 6.12 The mapping rule set

Every `ENUM_SRJ_STATE` member resolves to exactly one outcome by these tests, applied in order:

| # | Test | Outcome |
|---|---|---|
| 1 | Entered before any structural bundle exists, and no bundle field is read while in it | becomes a **candidate state** |
| 2 | Entered only after a bundle exists, and at least one bundle or evidence field is read while in it | becomes a **hypothesis state** |
| 3 | Guard set contains two or more conditions whose terminators A-3 §5.10 treats separately | **splits into N hypothesis states** |
| 4 | Only role is to represent absence of a candidate, or that a sequence died | becomes **registry emptiness or a rejection record**, retired |
| 5 | Written but never tested, or tested but never written | **retired**, and the retirement is a finding |

## 6.13 The enum is eight members and all eight are live

Task 160-PreD Block A pasted the declaration whole — EA 137–139, three lines, brace-counted — and censused every member as a separate pattern across all sixteen files. **Test 5 returns nothing.** The nine live `g_state` write sites independently reproduce Task 158 Block A's count of nine.

| # | Member | Assigned at | Compared at | Outcome |
|---|---|---|---|---|
| 1 | `ST_IDLE` | 167 (declaration initialiser), 1092 (`ResetSequence`) | 1426, 1727, 2124, 2172, 2207 | **retired → registry emptiness.** Test 4 |
| 2 | `ST_S1_REGIME` | 2235 | 2005, 2239 | **candidate state** → `CANDIDATE_REGIME_WAIT` |
| 3 | `ST_S2_LTF_ALIGN` | 2248 | 2252 | **candidate state** → `CANDIDATE_ALIGNMENT_WAIT` |
| 4 | `ST_S3_ZONE_WAIT` | 2260 | 2264 | **candidate state** — offering observation per A-4 §5.32 |
| 5 | `ST_S4_ARMED` | 2738 | 2770 | **hypothesis state** → `HYPOTHESIS_BOUND` onward. A-3 §5.1's ruled binding point is the S3→S4 transition |
| 6 | `ST_S5_GATE_CHECK` | 2877 | 2883 | **splits into three hypothesis states.** Test 3 |
| 7 | `ST_SIGNAL` | 2966, 3052 | none | **candidate state** → `CANDIDATE_COMMITTED`. Both assignments sit inside Phase B commit paths |
| 8 | `ST_ABORT` | 1133 (`GoAbort`) | 1727, 2124, 2172 | **retired → recorded rejection.** Test 4 |

**Range comparisons are why `g_state`'s ordinal order is load-bearing today and must not be in the model.** Eight sites compare by inequality — see EA-162 at §7.78. A candidate and a hypothesis are separate objects with separate state fields, so an inequality spanning both is not expressible. **Each must be re-expressed as a membership or ownership test in Task 162 or 164, and each is a place where a mechanical port would compile and be wrong.**

## 6.14 §6.11 amended — three states added, one retired, every addition accounted for

| State | Origin | Accounting |
|---|---|---|
| `HYPOTHESIS_WAITING_DIVERGENCE` | in §6.11 | limb 1 of `ST_S5_GATE_CHECK`'s split; also absorbs EA-112's out-of-session carve-out |
| `HYPOTHESIS_WAITING_TARGET_VALIDITY` | new | limb 2 of the same split |
| `HYPOTHESIS_WAITING_RR` | new | limb 3 of the same split |
| `HYPOTHESIS_BASIS_LOST` | new | retires nothing. Required by EA-159. Terminal, no strategy meaning |
| `HYPOTHESIS_UNBOUND` | in §6.11 | **retired unimplemented.** A hypothesis cannot exist before binding, because the bundle holds `bindingBar` |

`ST_S5_GATE_CHECK` carries three meanings, A-3 §5.10 treats T4, T5 and the RR re-test separately, and §7.53 shows the `S5 waiting:` literal cannot distinguish them. **Terminator attribution stays unmeasurable until that state splits.**

`HYPOTHESIS_BASIS_LOST` represents an outcome the build cannot express: the bound object no longer exists. Open item 3 is closed and every delete path is capacity-driven, so **its population measures pruning scope and must never be attributed to a strategy rule.** It must be distinguishable in the log from every rejection reason and every terminator. **EA-163's surviving FVG half means the state can still absorb a fill event, which is why the diagnostic must carry `lastFilledObserved`.**

## 6.15 The third operator question dissolves — do not ask it

Rejection is a **hypothesis** outcome. A hypothesis reaching `HYPOTHESIS_REJECTED` leaves its candidate in `CANDIDATE_HAS_HYPOTHESES`, and A-4 §5.32's sibling rule already permits a later offering to create a sibling. A rejected bundle is a dead sibling; a later bundle binds normally. A-3 §5.6's *"a rejected setup consumes nothing"* is satisfied because only Phase B's commit marks a session. §5.19.2's three-armings-from-three-candidates is what the model predicts rather than a behaviour to be explained. `CANDIDATE_REJECTED` is reached only by a candidate-level rule — the forgetting rule, POI invalidation, or expiry — never by the death of one hypothesis. **The question stays unasked.**

---

# 7. Findings

Revision 56 §7.1–§7.60 and Revision 57 §7.61–§7.63 are retained without change. Findings from this arc, consolidated.

## 7.64 EA-150 — binding has two write sites, not one
Arming at EA 2734/2735 is guarded by `if((haveFvg || haveXob) && s31_inPlay)` at 2732. A **second** live assignment exists at 2803/2804 inside the S4 block, guarded by the adoption plus directional-improvement test at 2786 and the delta test at 2788/2789, with touch revalidation at 2808–2811. **Task 162 must convert both, and the sibling-creation event must fire at 2803, not only at 2734.** The 2786 guard is `ZoneAdoptable`, which has never been read — Block D of the live task.

## 7.65 EA-151 — no identity is stored at binding
`objId`, `OBJ_ID`, `PROMO_TIME` and any assignment to a variable whose name contains `Id`/`id` are `ABSENT` from the arming paste. The ids are read at 2273/2274 and printed at 2276, then discarded. **The binding act stores two prices.**

## 7.66 R-Q11 ruling 1 is implemented correctly — recorded as agreement
All three activation sites write `isActivated = true` and `validationBar` in one block under a single guard: HTFEngine 174/176 (`j`), OrderblockMgr 112/114 (`replayBar`), OrderblockMgr 440/442 (`i`). `SRJ_countOpposingInvalidationsSinceActivation(bool obIsBullish, int sinceBar)` is eleven lines, counts opposing-history entries where `oppArr.At(j) > sinceBar`, and is called at OrderblockMgr 906 with `obCheck.validationBar` inside a left-to-right `&&` chain whose `obCheck.isActivated` term precedes it. Strictly greater, so an invalidation on the activation bar is excluded, matching the operator's wording.

## 7.67 R-Q12's admission half is implemented — verified mechanically
FlowLogic 1103–1107 is an exclusive else-if chain driven by the evaluated bar's own time, setting swept-mask live bits 10 (Asia), 11 (London), 12 (NY), 13 (PM). `TpSessionLevelFiltered` (EA 650–655) returns `true` — filtered — when the level's live bit is set. Previous-day indices 0 and 1 receive no live bit and are always admissible. FlowLogic 920–923 exports `g_s.londonHigh` directly and Sessions 289 resets it only on the next London rise, so after London closes the value persists with the bit off. `inLondonNow` and its siblings exist only in `SRJ_Sessions_Pass` and are **not** what the mask reads.

## 7.68 EA-152 — exported flags are last-writer-wins within one bar, and the writer set is five functions
Per-bar pass order, as now established from the real call sequence (§7.93): `SRJ_OB_CreationPass` → `SRJ_Sessions_Pass` → `SRJ_Bias_PerBarResetPass` → `SRJ_OB_ActivationInvalidationPass` → `SRJ_OB_CounterAggregationPass` → `SRJ_OB_InactiveLinePrunePass` → `SRJ_OB_OpposingCachePass` → `SRJ_Bias_WeakFlipLatchPass` → `SRJ_FVG_CreationRenewalPass` → `SRJ_FVG_FillDetectionPass` → `SRJ_FVG_TickValidRecomputePass` → `SRJ_Bias_StructureDetectionPass` → `SRJ_Bias_DecisionBlock` → `SRJ_Alerts_DispatchBiasRenewal` → `SRJ_OB_DeferredPromotionPass` → draw/panel passes → export 902–904.

`tickFVGIsValid` describes a **selection**, not an object: unconditional `true` at ImbalanceMgr 390, re-derived conditionally at 415 from a per-bar ascending re-selection over `g_imbalances`. **Export stage 2's buffer 34 must record the last-writing pass, not only the object** — and §7.91 sharpens that requirement.

**Correction on the record.** §7.68 previously attributed OrderblockMgr 171/173 to `SRJ_OB_ActivationInvalidationPass`. They belong to `SRJ_OB_ReplayActivationInvalidation` (89–195). The writer set is **five functions**, not four.

## 7.69 EA-153 — the reset lives inside the cascade's abort path, and it emits
`GoAbort` (EA 1109–1136) logs, conditionally calls `EmitAlert` (STAND-DOWN 1116), sets `ST_ABORT` 1133, calls `ResetSequence()` 1135. Fifteen `GoAbort` call sites inside `EvaluateClosedBar`. `ResetSequence` (**1090–1107, 18 lines**) assigns all thirteen working-set globals, zeroes `g_zoneHi`/`g_zoneLo` at 1103/1104, and clears both alert latches at 1105/1106. **Four call sites: 1135, 2968, 3054 and 3120 (inside `OnInit`).**

**A naive `LoadWorkingSet → HypothesisCascade → StoreWorkingSet` adapter stores a post-reset working set on every abort path.** Task 161 must capture the terminal state at the abort. `EmitAlert` reads `g_dir`, `g_sessionAtEntry` and `AnchorStr()` directly, so **Task 164's emitter must take the hypothesis as an argument.**

## 7.70 EA-159 — objects are deleted intrabar and the deletion is permanent
The intrabar snapshot block saves and restores `g_s` and nothing else. `g_srjObjIdSeq` and `g_objSeq` are absent from it; `g_orderblocks` and `g_imbalances` are neither saved, restored nor cleared; the only object handling is `g_intrabarObjects`, a `CArrayString` of chart-object names whose restore path calls `ObjectDelete`. Both structural arrays are cleared only in `SRJ_StateInit` (State 463/464), on full recalc. `g_sSnapshot` has **zero occurrences in the EA**.

Object **creation** is `barClosed`-gated (OrderblockMgr 202, ImbalanceMgr 112), so the intrabar re-run cannot accumulate duplicates. Object **deletion is not gated**: both pruning passes are called at FlowLogic 888/889 with `withinLookbackWindow` only, run **before** the identity export at 954/966, and `barClosed` is `ABSENT` from both regions.

*Good for the migration:* EA-side candidate and hypothesis records are entirely insulated from the snapshot mechanism. Task 160's registries can live on the EA side with no snapshot coupling.

*EA-159:* across an intrabar re-run, object population shrinks monotonically and is never rolled back while `g_s` reverts. An exported `objId` can name a destroyed object; a held pointer becomes dangling. **P16. Identity re-lookup must have a first-class `GONE` outcome.**

## 7.71 EA-155 — leg membership can only ever be a bar-index relation
Eighteen types exist. Exactly two carry `objId`: `COrderblock` (Types 63) and `CImbalance` (Types 114), each with one construction region assigning `objId = SRJ_NextObjId()`. **No HTF type carries `objId`** — an HTF activation is unaddressable by construction. The structural leg is `g_s.structLegBoundary`, an `int` inside `SState`, written at BiasEngine 279, initialised at State 326, and it **rolls back on the intrabar path** while the objects it bounds do not.

**Scenario B's criterion must be restated:** an adverse `objId` whose `startBar` falls at or after the bundle's `legBoundaryBar` **as that boundary stood at the binding bar**. Weaker than the original wording and the strongest form the source supports. **Council packet item 1.**

## 7.72 EA-156 — the dead-export chain is three links
`didPromoteStrong` declared `false` at OrderblockMgr 895 with no `true` assignment in 895–933 → `if(didPromoteStrong)` at 934 contains `SRJ_FireExtremePromote` and, at 937, the **only** `currentLegHasXOB = true` in the tree → the field is initialised `false` at State 325 and set `false` at BiasEngine 134 and 278, so it is permanently `false` → FlowLogic 994 reads it as the gate on the FVG-to-XOB expansion-leg membership export. **That export is unconditionally empty.** Repair is one assignment plus a decision about the `nearest` branch (open item 4).

## 7.73 EA-157 — a queued promotion whose target is not activated is discarded, not retained
Queue → `SRJ_QueueNearestPromotion(i, bias, boundary, slot)`; defer → `SRJ_OB_DeferredPromotionPass(i, barClosed)` fires when `barClosed && i > pendingPromoteBar` then **clears all five slot fields unconditionally** (999–1003); reconcile → `SRJ_promotionReconcile` at OrderblockMgr 788–940, 153 lines; apply → `SRJ_ApplyPromotion(ob)` sets `isPromoted = true` at 781, line widths only, bounds unchanged; stamp → `promotionBar = i` at 858 and 913.

Mode `"all"` guard set at 904–906: `matches && isValid && isActivated && boundaryOk && anatomy && !isPromoted && countOpposingInvalidationsSinceActivation(...) >= 2`. Mode `"nearest"` exit set: 791 → 793 `noLockAtTrigger` → 805 loop → 811 `matches bias && cand.isActivated && cand.startBar == lockedTargetBar` → 818 `targetGone` → 829 `anatomy` → 842 `alreadyPromoted` → 852 apply. **No `isValid` test, no boundary test, no invalidation count** — EA-113 and EA-118 mechanically confirmed. The `boundary` parameter reaching this branch is only printed (824, 883). **See §7.80: this is two defects.**

## 7.74 EA-158 — the promotion queue has two slots and two inconsistent collision rules
`SRJ_QueueNearestPromotion` returns early without queueing if that slot's `pendingPromoteBar == i` (958, 972). BiasEngine 312/328 write slot 2 **directly**, reconciling only if `pendingPromoteBar2 < i`, so a slot-2 entry queued on the same bar is overwritten and lost without reconcile. **Task 159 must not model the promotion queue as a registry.** Sits behind Task 166.

## 7.75 EA-160 — promotion evidence is permanently non-attributable
The opposing-invalidation count is a query against `g_bullishInvalidationBarsHistory` / `g_bearishInvalidationBarsHistory`, appended per event attributed to `discoveryBar` (164/166) or `i` (528/530) and pruned against `g_s.strictLimitBar` (577/578). **The double opposing invalidation justifying a promotion cannot be attributed to the promoted XOB's own leg, and the count is not reconstructible later.** The promotion *event* is latchable; the evidence is not. `UNKNOWN` under P15, no field invented. **This bounds what Scenario B can ever demonstrate.**

## 7.76 EA-161 — Phase A contains an alert emission, and it may not be the only one
`EmitAlert` (EA 362–376) has three call sites: 1116 STAND-DOWN inside `GoAbort`, 2754 HEADS-UP and 2951 SIGNAL inside the cascade. `Alert(` and `SendNotification(` occur only inside `EmitAlert` **in the EA**, both gated on `pushable`, and **only SIGNAL passes `true`**. HEADS-UP and STAND-DOWN sit in code that becomes **Phase A**. **Proposed resolution, packet item 4:** both become `SDiagnosticEvent` kinds and lose their emission path; SIGNAL stays and moves to Phase B; the emitter takes the hypothesis as an argument.

**Scope widened by §7.93.** `SRJ_Alerts_DispatchBiasRenewal(i)` is called at FlowLogic 880, inside the per-bar pass sequence, and has never been read. If it emits, the emission surface is not EA-only and packet item 4's resolution is incomplete. **Block C of the live task settles it.**

## 7.77 The commit surface is six lines of 1,694
`MarkSessionUsed` 2964 and 3050 · `LogSignal` ×1 · `EmitAlert(…, true)` 2951 · `g_trade.Buy` 3017 · `g_trade.Sell` 3019 · `ResetSequence` 2968 and 3054. Zero `OrderSend`. Both commit paths terminate the bar: 2964 → 2968 → 2969 `return`, and 3050 → 3054 → function end 3056. **A side effect followed immediately by a `return` is a commit that terminates the bar, and Phase A must not contain one.**

## 7.78 EA-162 — `g_state`'s ordinal ordering is load-bearing at eight sites

| Line | Expression shape |
|---|---|
| 1426 | `g_state != ST_IDLE` |
| 1727 | `g_state > ST_IDLE && g_state != ST_ABORT && !inWindow` |
| 1788 | `g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK` |
| 1924 | `InpDebugLog && g_state >= ST_S2_LTF_ALIGN && g_state < ST_S4_ARMED` |
| 1931 | `g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK` |
| 1937 | `g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK` |
| 2005 | `!g_divLatch && g_state >= ST_S1_REGIME && g_dir != DIR_NONE` |
| 2124 / 2172 | `g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0` |

1788, 1931 and 1937 all span the S3/S4 boundary, which is exactly the binding point. **Each becomes a membership or ownership test in Task 162 or 164, with a responsibility statement.** Sequencing note: **1937 is the enclosing guard of Task 142's only permitted site at 1946**, established mechanically by brace stack, and it also encloses `ComputeSlReference`'s S2 poll call at 1949. Task 142's block replacement sits inside a guard Task 162 or 164 must re-express.

## 7.79 Three corroborations
**EA-146** verbatim at OrderblockMgr 170–173 and 534–537: `if(isInBias) g_s.tickOBIsValid = false; else g_s.tickOBIsValid = true;`. The flag means *"the most recent OB invalidation event was not in-bias"*. **EA-127** at State 487 plus Types 31/32: `objId` is a within-run handle, never a cross-run key. **EA-113/EA-118** confirmed from the guard chain rather than a census print.

## 7.80 EA-157 is two defects — `SRJ_StrictNearestOBIndex` read at last
**DEFINITION at `SRJ_OrderblockMgr.mqh` 691–729, 39 lines, brace-counted, pasted whole.** A forward DECLARATION exists at **`SRJ_ImbalanceMgr.mqh` 14** — a different file from the one the record searched for three rounds.

```
703  matches = (bias=="bullish" && ob.isBullish) || (bias=="bearish" && !ob.isBullish)
705  if(!matches)                                    continue;
706  if(!ob.isValid || !ob.isActivated)              continue;
707  if(ob.startBar < g_s.strictLimitBar)            continue;
708  if(!SrjIsNa(boundary) &&
709     (SrjIsNa(ob.validationBar) || ob.validationBar < boundary))
710                                                  continue;
712  better: bestIdx < 0, else startBar > bestStart, else startBar == bestStart
       && validationBar > bestVal
728  return bestIdx;                                 (-1 when nothing qualifies)
```

**Line 706 requires `isActivated`.** The queue cannot lock an unactivated order block, so R-Q11 ruling 2's deferred path is **unreachable at the queue as well as at the reconcile**. EA-157 is **two defects**, the repair is larger than retaining a slot, and it stays behind Task 166.

Three inferences became results: `boundary` is consumed at queue time as a `validationBar` comparison (708–710); `isPromoted` is `ABSENT`, so the selector can return an already-promoted OB and reconcile 842 is the only guard; the selection rule is **largest `startBar`, tie broken by larger `validationBar`**, which attributes EA-149's rule to this function and **closes §17.24**. Note that 706/707 apply the same `strictLimitBar` bound the pruning pass's first delete applies — two expressions of one bound in two files, agreeing by coincidence, not by construction.

## 7.81 Open item 3 closes — `GONE` is retention-shaped on all four sites
`SRJ_OB_PruningPass` OrderblockMgr **1072–1102, 31 lines**; `SRJ_FVG_PruningPass` ImbalanceMgr **495–530, 36 lines**. Both pasted whole.

| Path | Site | Criterion |
|---|---|---|
| OB, first | 1086 | `if(ob.startBar < g_s.strictLimitBar)` at 1082 — lookback prune |
| OB, second | 1098 | precondition `if(!ob.isValid && !SrjIsNa(ob.invalidationBar))` at 1091, **decided by** `SRJ_OBOverCap(g_orderblocks, k, g_keepInvalidatedCount)` at 1092 |
| FVG, first | 509 | `if(fvg.startBar < g_s.strictLimitBar)` at 505 |
| FVG, second | 526 | precondition `if(fvg.isFilled && !SrjIsNa(fvg.fillBar))` at 514, decided by `g_deleteFVGAfterFill` at 516 **or** `SRJ_FVGOverCap(…, g_keepInvalidatedFVGCount)` at 519 |

`barClosed` is `ABSENT` from both regions. The literals `retention`/`Retention` are `ABSENT` — the vocabulary is `OverCap` and `keepInvalidatedCount`. **Every delete path is capacity-driven; invalidation and fill are preconditions, never the decision.** So `HYPOTHESIS_BASIS_LOST` keeps its non-attributable design, its population measures pruning scope, **and Task 162 has one design instead of two.** Packet item 3 is approvable as drafted.

## 7.82 EA-163 — amended and split. The order-block half is withdrawn.
Both cap functions are DEFINITIONs in **`SRJ_Draw.mqh`** — `SRJ_OBOverCap` 240–260, `SRJ_FVGOverCap` 262–285. A retention decision governing object lifetime lives in the drawing module.

```
SRJ_OBOverCap(orderblocks, selfIdx, keepInvalidatedCount):
  false unless self is invalidated with a non-NA invalidationBar, then
  myRank = |{ o : !o.isValid && !SrjIsNa(o.invalidationBar)
                  && o.invalidationBar > self.invalidationBar }|
  return (keepInvalidatedCount > 0 && myRank >= keepInvalidatedCount);
```

**The OB cap counts only invalidated order blocks and ranks them by invalidation recency.** `keepInvalidatedCount` is a **floor on retained invalidated objects**, not a ceiling on the array. Two arithmetic consequences: a freshly-invalidated OB has `myRank == 0` (the comparison at 255 is strictly greater, so same-bar invalidations do not count each other), and `0 >= keepInvalidatedCount` is false whenever the `> 0` guard holds — **so it cannot be deleted in the pass that invalidated it**; and `keepInvalidatedCount <= 0` **disables this delete path entirely** rather than deleting everything.

**EA-163 is retracted as a same-bar masking defect on the order-block path.** An invalidated OB is observable as `isValid == false` through identity for at least one bar before capacity can remove it.

**EA-163 survives on the FVG path, unconditionally.** ImbalanceMgr 516: `if(g_deleteFVGAfterFill) shouldDelete = true;` bypasses the cap. When that flag is set, **a filled FVG is deleted in the pass that filled it**, so `SFvgRecord.isFilled` may never be observable as `true` through identity and a bound hypothesis sees `GONE` where the fill event should have been. Hence `SObjectRef.lastFilledObserved`.

## 7.83 EA-166 — the two cap functions do not share a retention rule
```
SRJ_FVGOverCap: posInFVGList = self's index among filled FVGs in ARRAY ORDER
                fvgFilledCount = total filled FVGs
                return (keepInvalidatedFVGCount > 0 &&
                        posInFVGList < fvgFilledCount - keepInvalidatedFVGCount);
```
The OB cap orders by `invalidationBar` — an immutable event. The FVG cap orders by **position in `g_imbalances`**.

**Narrowed by open item 11.** Both arrays are declared `CArrayObj` at `SRJ_State.mqh` **251** and **252**, and across all sixteen files their method surfaces are identical and append-only: `.Add(` ×2 each (ImbalanceMgr 119/236, OrderblockMgr 242/347), `.Delete(` ×2 each, `.Total(` ×14 each, `.Clear(` ×1 each (State 464/463), `.FreeMode(` ×1 each (State 449/448). **`.Insert(` and `.Sort(` are `ABSENT` for both**, as are `.At(`, `.Detach(`, `.Shift(`. Indexed access runs through `GetFVG(...)` / `GetOB(...)` helpers.

**Nothing reorders either array**, so `posInFVGList` ranks by **insertion order among survivors**. The reproducibility claim is retracted. Two residuals stay `UNKNOWN` under P15: insertion order is not established to be **chronological**, and **the cap may be evaluated against a count the same pass decrements** — the pruning loop iterates downward from `Total() - 1` deleting in place while each candidate's `posInFVGList` does not shrink. **The second is a planner hypothesis, explicitly unconfirmed; no number may be built on it.** Open item 13.

## 7.84 EA-164 and EA-165 — the admission latch, and two session vocabularies
`g_sessionAtEntry` has three assignment-target lines and **one live write**: 170 is the declaration initialiser, 1095 is `ResetSequence`, and **2232 `g_sessionAtEntry = sess;`** is the write. It sits inside `if(g_state == ST_IDLE)` at **2207** by brace scope, after `DetectPoiRetest`'s early return at 2227, beside `g_anchorLine` 2228, `g_dir` 2229, `g_anchorBarTime` 2230, `g_anchorPrice` 2231, and **before** `g_divLatch = false` 2233 and the `ST_S1_REGIME` transition at 2235. `MarkSessionUsed` is `ABSENT` from the window. **EA-164: the field is written at candidate admission, not at binding.** Edge C1 gains it, edge C4 loses it.

`sess` is declared at **EA 1365**, file-body scope, `NOT ENCLOSED`:
```
1365:    ENUM_SRJ_SESSION sess = CurrentTradingWindow(barTime);
1366:    bool inWindow = (sess != SESSION_NONE);
```
`CurrentTradingWindow(datetime barTimeServer)` is a DEFINITION at **EA 379–401**. It probes three day offsets, builds London **02:00–05:00 ET** and NY **07:00–12:00 ET** via `TC_MakeTime`, converts with `TC_ZoneToServer(…, TZ_NEWYORK)`, and returns `SESSION_LONDON`, `SESSION_NYAM` or `SESSION_NONE`. **The evaluated bar's own window, from `barTime`, no `TimeCurrent()`, no lookahead.**

**EA-165: two vocabularies, both called "session."** `CurrentTradingWindow` is a **three-member trading-window** domain built from hour literals inside the EA. `SRJ_GetSessionId` (`SRJ_Sessions.mqh` **175–183**, nine lines, pasted whole) is a **five-member session** domain — converts to NY time, returns on first match Asia `0`, London `1`, NY `2`, PM `3`, else `SRJ_NA_INT` — defined by `g_defAsia`/`g_defLondon`/`g_defNY`/`g_defPM`. Different files, different domains, London defined twice, agreement unestablished. **Asia and PM have no window counterpart**, so an Asia-session target level is admissible while no candidate can ever be admitted in an Asia window. Open item 12, a council reading.

The throttle question closes clean: `SessionAlreadyUsed(sess, barTime)` at 2210 consults the throttle with the **same** `sess` that 2232 latches. One value, two uses, one of which is not the candidate's to own. **No EA-107 shape here**, and §9.7's ruling that the throttle stays file-global is corroborated rather than merely reasoned.

## 7.85 EA-167, EA-168, EA-169 — the target function, read whole
`ComputeNearestTpTarget` is a DEFINITION at **EA 659–775, 117 lines**, param list closing 660, four parameters with `tpTargetOut` the only by-reference, four `for` headers at 699, 706, 735, 746.

**EA-167.** Its exit set is two lines: `772: if(!haveBest) return false;` and `774: return true;`. **One `false` return.** Both candidate groups — the ten session/PD buffers at 699–704 and the POI lines at 706–712 — collapse into one `best`/`haveBest` accumulator. **`NO_TP_TARGET` cannot distinguish "no structure found" from "structure found but inadmissible."** Open item 7 closed with a negative answer, and **Task 142's shape changed.** The information is computed and discarded one line up, at `702: if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))`.

**Both abort sites re-established mechanically.** `GoAbort(ABORT_NO_TP_TARGET, …)` at **1946** under `1937: g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK` → `1941: if(!ComputeNearestTpTarget(…))`, and at **2894** under `2883: g_state == ST_S5_GATE_CHECK` → `2889: if(!ComputeNearestTpTarget(…))`. **1946 is Task 142's only permitted site.** `ABORT_NO_TP_TARGET` is a `#define` at EA **161**, file scope.

**EA-168. The two candidate groups are governed by different filters, and neither by the other's.**

| Group | Lines | Filter |
|---|---|---|
| session / previous-day, ten buffers | 699–704 | `!TpSessionLevelFiltered(i, s39_mask)` at 702 — the swept/live mask |
| POI lines | 706–712 | `k == g_anchorLine \|\| (g_authorityRank[k] / 2) > (anchorRank / 2)` at 708 — an anchor-tier test |

`TpSessionLevelFiltered` occurs **exactly once** in the whole function, at 702. **The POI group is not mask-filtered and the session group is not tier-filtered.** A POI line can win the target selection on a bar where its session-level competitors were excluded by the mask. That is a target-selection mechanism, so it is a **Scenario G input** rather than a Task 142 detail. The comment at 670 asserts deliberateness and §3.5 forbids classifying from a comment. **Council packet item 16.**

**EA-169. EA-137 widens to two independent causes.** The TPCENSUS diagnostic block at **719–771** re-walks both groups and **omits `TpSessionLevelFiltered` entirely**, building `admitted` from an inline direction test at 740 and 752 plus an `EMPTY_VALUE` test at 739 and 751. The decision loops at 699–712 apply the filter at 702 and test no `EMPTY_VALUE` at all — **`SrjIsNa` is `ABSENT` from all 117 lines** — and both pass `v` straight into `TpTargetUpdateBest`. So `TPCENSUS admitted=` differs from the decision set because it omits a filter the decision applies **and** because it reimplements admission in code the decision does not run. §16's prohibition on reading `TPCENSUS admitted=` as the candidate set is established from a whole-region paste.

## 7.86 Open item 10 closes — Task 161's extraction property is established

| Item | Result |
|---|---|
| whole-token census of `EvaluateClosedBar` | `for` **11**, `while` **0**, `switch` **0**, `do` **0**. 109 incidental substring hits |
| loop bodies, brace-counted | **eleven** `for` headers, all braced: 1371–1382, 1399–1403, 1407–1410, 1440–1465, 1967–1977, 2038–2064, 2414–2421, 2494–2508, 2568–2583, 2687–2702, 2935–2943 |
| return statements | `RETURN_STATEMENTS` **21**, `RAW_SUBSTRING_HITS` **28**, **all 21 BARE**, depths 2 to 4 |
| full open-brace stacks | **count of returns whose stack contains a `for`/`while`/`switch`/`do` entry = 0** |
| independent cross-check | `INSIDE` **0**, `NOT INSIDE` **21**, **`DISAGREEMENT COUNT = 0`** |
| jump statements | `goto` **0**. `continue` 8, `break` 12, 20 distinct lines, **every one with a loop in its stack** |

**So Task 161 needs zero return-site edits**, established by two independent computations. All 21 returns are plain, bare, function-body returns nested only inside `if` or `else` blocks — and the `else` half was load-bearing: return 2766's innermost construct resolves to `2761: else`.

## 7.87 EA-170 — the EA has no `barClosed`, and `SMarketSnapshot` cannot manufacture one
`EvaluateClosedBar(int barShift, datetime barTime)` takes neither a closed-bar flag nor `prev_calculated`/`rates_total`. Its single call site passes `barShift` as the literal `1`. New-bar detection is `static datetime s_lastBarTime` inside `OnTick`, tested at **EA 3198**.

**Census closes it: in the EA, `barClosed` 0 occurrences, `prev_calculated` 0, `rates_total` 0, `g_lastBarTime` 0.** Only `s_lastBarTime`, three lines, all inside `OnTick` 3194–3201.

**§9.6 is amended.** `SMarketSnapshot.barClosed` was justified as *"the smallest change that makes the intrabar/closed distinction auditable."* On the EA path there is nothing to audit — the distinction does not exist there. The field becomes **invariant-true-by-construction with the invariant stated in source**, or it is retired. It may not be presented as an audit of a fact the EA cannot read. This is §8.7's one-way interface a second time; the first was the retention configuration.

And because `s_lastBarTime` is a **function-static**, it is invisible to `SRJ_StateInit`, to `ResetSequence` and to any registry: nothing a candidate owns can be told a new bar began, and the fact is consumed and discarded before `EvaluateClosedBar` is entered. `g_lastBarTime` exists in `SRJ_State.mqh`, is cleared at State 489, and has zero EA occurrences.

## 7.88 EA-171 — target admission has three filters nobody had, and one reads a global §9.8 retires
`TpTargetUpdateBest` is a DEFINITION at **EA 614–635, 22 lines**, param list closing 615, positioned *before* both `TpSessionLevelFiltered` and `ComputeNearestTpTarget`. Both candidate groups pass through it:

```
617  if(v == EMPTY_VALUE || v <= 0.0)                                        return;
619  if(!inDir)                                                              return;
631  if(g_zoneHi > 0.0 && g_zoneLo > 0.0 && v >= g_zoneLo && v <= g_zoneHi)  return;
633  if(!haveBest || dist < MathAbs(best - currentPrice))   { best = v; haveBest = true; }
```

Line 631 is corroborated twice inside one task — a census and a whole-region paste agree, so it is not a transcription artifact.

- **§9.10 amended.** `STargetReference` selection is **not** a function of the snapshot and direction alone. It depends on the bound hypothesis's zone. Task 162 retiring `g_zoneHi`/`g_zoneLo` therefore changes target selection unless the zone is supplied to this function deliberately, and a mechanical retirement would compile and silently move every target.
- **EA-167 is worse than recorded.** The zone globals read `0.0` until the S3 transition, so 631 is inert before arming and live after. Task 142's permitted site at 1946 sits under a guard spanning `ST_S2_LTF_ALIGN` through `ST_S5_GATE_CHECK` — **the same `false` exit carries a different admissibility rule on either side of arming.**
- **Packet item 15 changes arity.** Five distinct causes collapse into one `false`: mask (702, session group), tier (708, POI group), non-positive or empty (617), direction (619), zone containment (631). Two additive counters no longer cover it.
- **Tie rule, for Scenario G.** Strict `<` at 633, so an exact distance tie goes to whichever group iterates first: the ten session/PD buffers at 699–704 before the POI lines at 706–712.
- **§17.32's exposure is retracted.** *"An empty buffer slot can become the selected target"* is withdrawn on evidence — 617 guards it.

## 7.89 EA-172 — `tickOBIsValid` has five writing functions, one is a replay path, and one writes inside a loop
§7.68's attribution of OrderblockMgr 171/173 was wrong. They are in **`SRJ_OB_ReplayActivationInvalidation`** (**89–195, 107 lines**, param list closing 94), a different function on a different path, which attributes its invalidation history to `discoveryBar` rather than `i` (164/166). **So a flag write can originate from the replay of a past bar during the current bar's processing, and buffer 34 cannot name the bar the event belongs to without also naming `discoveryBar`.**

The write at **535/537** is **the only one of all flag assignments with a loop in its brace stack** — the full stack is `426 {for}, 481 {if}, 483 {if}, 495 {if}, 525 {if}`, and the `for` header is `425: for(int k = g_orderblocks.Total() - 1; k >= 0; k--)`. Each invalidating order block in that loop overwrites the flag, and **the loop descends, so the last writer is the lowest array index** — with append-only arrays (EA-166) that is the *earliest-inserted* invalidating object. Combined with EA-146's `if(isInBias) false; else true`, an out-of-bias invalidation at a low index masks an in-bias invalidation at a higher one.

**That is intra-pass masking by array order, structurally distinct from EA-152's cross-pass last-writer-wins.** Buffer 34 must export the winning object's identity rather than a pass name — which is what stage 2 was drafted to do, so the design holds and its justification is stronger.

## 7.90 EA-173 — three definitions of "the bar is closed," in three files, on two timeframes
FlowLogic computes it once per bar at **847**: `bool barClosed = BarClosed(i, rates_total);`, threaded into nine of the per-bar pass calls. `SRJ_HTFEngine.mqh` **107** computes its own: `bool barClosed = (j < htfTotal - 1);` — **on the HTF index, not the LTF one.** The EA has none and gates `EvaluateClosedBar` on `currentBarTime != s_lastBarTime` at 3198.

Nine `.mqh` functions carry `barClosed` as a parameter; eleven use it as a local or a guard; zero pass it as an argument inside the includes. **Their agreement is unestablished. Same shape as EA-165.** Two vocabularies for a session, three for a bar boundary.

Consequence: `SMarketSnapshot.barClosed` is **established** as invariant-true on the EA path, from the guard at 3198 rather than reasoned. EA-170's amendment stands with its scope caveat lifted.

## 7.91 EA-174 — the stop reference is zone-dependent too, and `ComputeSlReference` is read at last
**DEFINITION at EA 801–1069, 269 lines**, param list closing 803, brace-counted, **pasted whole**. Five parameters: `barShift` by value, `dir` by value, **`slRefOut` by reference**, **`slModeOut` by reference**, `site` by value. Four `for` headers at 810, 922, 983, 1046. No `while`, no `switch`, no `do`. Nine `Print` sites.

It reads `g_zoneHi`/`g_zoneLo` on **17 lines**, and the classification is the finding:

| Class | Lines |
|---|---|
| **CONTROL-FLOW** | **928, 976, 988** |
| OTHER (the guard's own operands) | 921 (`t75_zone` computed), 977 (continuation of the 976 condition) |
| PRINT-ARGUMENT | 940, 941, 954, 955, 998, 999, 1011, 1012, 1037, 1038, 1062, 1063 |

Verbatim, the control-flow set:
```
921       bool   t75_zone = (g_zoneHi > 0.0 && g_zoneLo > 0.0);
928          if(t75_zone && t75_v >= g_zoneLo && t75_v <= g_zoneHi)          continue;
976    if(!obSwingSideOk && g_zoneHi > 0.0 && g_zoneLo > 0.0 &&
977       slRefOut >= g_zoneLo && slRefOut <= g_zoneHi)
988          if(t67_v >= g_zoneLo && t67_v <= g_zoneHi) continue;
```

**Two call sites, and they mirror the target function's:** **1949** with `"S2POLL"` under the brace stack `1938 {if}`, and **2899** with `"S5"` under `2884 {if}`. Both inside `EvaluateClosedBar`. 1949 sits three lines after Task 142's permitted site.

So **both** of the hypothesis's derived references read the live zone. §9.9 `SStopReference` and §9.10 `STargetReference` were both drafted as functions of latched evidence plus direction; both are functions of the live zone. And because `ResetSequence` zeroes the pair at 1103/1104 and only the arming path sets them, **every one of these filters is inert before arming and live after** — confirmed from both ends. **§17.14 gains a third leg**, and **§17.35 remains blocking until packet items 18 and 19 are ruled.**

## 7.92 EA-176, EA-177, EA-178 — inside `ComputeSlReference`

**EA-176. Five `false` exits, at least five distinct causes, and the caller sees one bool.** Statement census: **8 return statements, 8 raw substring hits, all CARRYING AN EXPRESSION** — six `false`, two `true`. Contrast `EvaluateClosedBar`'s 21 bare returns; the extraction properties of the two functions are not comparable.

| Line | Expression | Cause |
|---|---|---|
| 830 | `false` | `ReadFlow(FL_BUF_LTF_OB_VALID, …)` failed |
| 882 | `false` | LONG 1-swing branch, side test failed **and** no fallback low |
| 884 | `false` | SHORT 1-swing branch, side test failed **and** no fallback high |
| 956 | `false` | Task 75 side guard exhausted 500 slots |
| 1013 | `false` | Task 67 zone guard exhausted 500 slots |
| 1039 | `true` | 1-swing branch succeeded |
| 1064 | `true` | 2-swing branch succeeded |
| 1067 | `false` | 2-swing branch exhausted 500 slots |

**This is EA-167's problem in a second place, and worse.** `ComputeNearestTpTarget` collapses five causes into one `false`; `ComputeSlReference` collapses at least six into one, and its S5 caller at 2899 turns that into a single abort reason.

**And the branch structure is asymmetric.** The 1-swing branch is entered at `879: if((int)MathRound(obValid) == 1)`; the 2-swing branch at `1041: else`. **Both zone-related guards — Task 75's side guard at 915–958 and Task 67's zone guard at 976–1015 — live inside the 1-swing branch only.** The 2-swing branch's walk at 1046–1066 applies neither a side test nor a zone-containment test; its only admission rule is `v != EMPTY_VALUE && v > 0.0` plus `MathAbs(v - firstVal) > _Point`. **A stop reference selected on the 2-swing path can sit inside the adopted zone or on the wrong side of the entry reference, and the two guards that exist to prevent exactly that do not run.** Both guards are additionally scoped to `!obSwingSideOk`, so they are inert on the OB_SWING path by design.

**EA-177. The stop reference's own reference price is the one the record already flags as wrong.** `869: double slCurPx = iClose(_Symbol, PERIOD_CURRENT, barShift);` is the operand of `obSwingSideOk` (876–878), of `t75_sideOk` (914) and of the walk's side test (927). The source comments at 866–868 name it as *"EA-23b's known-wrong reference — the least-bad option available until Ruling 7a lands."* **One operand, three tests, and it is the same close EA-142 records as recomputed per bar rather than latched.** §3.5 forbids classifying from a comment, so the comment is corroboration only — but the identifier and its three uses are established from the paste.

**EA-178. Three 500-slot walk bounds inside one function**, at 922, 983 and 1046, plus a 10-slot diagnostic loop at 810. Each is an **engineering safety limit**, none is a strategy threshold, and each must be re-justified as one wherever it is ported. The no-dimensional-thresholds rule does not reach them; the fact that one function carries three independent expressions of the same bound does reach §15's *"two expressions of one bound agreeing by coincidence"* row.

`slModeOut` is written at **885** (`SL_MODE_1SWING`) and **1054** (`SL_MODE_2SWING`) — two values, one per branch, so the mode is recoverable from the output even though the failure cause is not.

## 7.93 EA-179 — the per-bar pass sequence is nineteen calls, not ten, and nine of them were unnamed
`OnCalculate` in FlowLogic is a DEFINITION at **705–1179, 475 lines**. Its per-bar pass sequence occupies **849–885** and is pasted contiguously (843–887, 45 lines). Preceding it:

```
844       g_s.safeLimitBar = (int)MathMax(0, last_bar_index - finalLookback - safetyBuffer);
845       g_s.withinLookbackWindow = (i >= 2) && (i >= last_bar_index - finalLookback);
846       bool withinLookbackWindow = g_s.withinLookbackWindow;
847       bool barClosed = BarClosed(i, rates_total);
```

The nineteen `SRJ_` calls in order, with the ten already on the record marked ✓:

| Line | Call | |
|---|---|---|
| 849 | `SRJ_OB_CreationPass` | ✓ |
| 852 | `SRJ_Sessions_Pass` | **new** |
| 855 | `SRJ_Bias_PerBarResetPass` | ✓ |
| 857 | `SRJ_OB_ActivationInvalidationPass` | ✓ |
| 860 | `SRJ_OB_CounterAggregationPass` | ✓ |
| 862 | `SRJ_OB_InactiveLinePrunePass` | **new** |
| 864 | `SRJ_OB_OpposingCachePass` | **new** |
| 866 | `SRJ_Bias_WeakFlipLatchPass` | **new** |
| 868 | `SRJ_FVG_CreationRenewalPass` | ✓ |
| 871 | `SRJ_FVG_FillDetectionPass` | ✓ |
| 873 | `SRJ_FVG_TickValidRecomputePass` | ✓ |
| 875 | `SRJ_Bias_StructureDetectionPass` | ✓ |
| 878 | `SRJ_Bias_DecisionBlock` | ✓ |
| 880 | **`SRJ_Alerts_DispatchBiasRenewal`** | **new — an emission-shaped name inside Phase-A-equivalent code** |
| 881 | `SRJ_OB_DeferredPromotionPass` | ✓ |
| 882 | `SRJ_Draw_BiasAndRenewalLines` | **new** |
| 883 | `SRJ_FVG_DrawRefreshPass` | **new** |
| 884 | `SRJ_EmitFractals` | **new** |
| 885 | `SRJ_Panels_BiasPane` | **new** |

**Three of the nine matter for the migration and one matters for EA-161.** `SRJ_OB_InactiveLinePrunePass` (862) and `SRJ_OB_OpposingCachePass` (864) both run **between** the invalidation pass and the FVG passes and both have object-touching names; if either deletes from `g_orderblocks`, EA-159's delete-path inventory is incomplete and P16's justification changes shape. `SRJ_Bias_WeakFlipLatchPass` (866) runs immediately before FVG creation and has a latch name, so it is a candidate writer of state the FVG passes read. **`SRJ_Alerts_DispatchBiasRenewal` (880) is an alert dispatch inside the indicator's per-bar sequence** — if it calls `Alert(` or `SendNotification(`, EA-161's emission surface is not EA-only and packet item 4's resolution is incomplete. **Block C of the live task settles all four.**

Nine argument lists returned `UNTERMINATED` because the call spans two lines and the item admitted no legal answer for that — **defect 86**, closed by requiring the continuation pasted.

## 7.94 §17.36 closes — the `SState` bound, settled falsifiably
`SState` is a struct at `SRJ_State.mqh` **96–247**, opening brace **97**, closing brace **247**, **152 lines**, brace counting confirmed. `SState g_s;` at **249**.

The last twelve lines were pasted whole:
```
236:    string   erlBias;
238:    string   currentSessionSlot;
239:    int      currentSlotStartBar;
240:    string   freshSweepTag;
241:    int      freshSweepBar;
242:    string   freshSweepExpirySession;
243:    bool     freshSweepExpired;
245:    string   mtfBoxName;
246:    string   dataWarningName;
247:   };
```

**The last field declaration is 246. The closing brace is 247.** §8.9's figures were correct; the competing 247/247 was an artifact of a relaxed declaration rule that admitted `};` as a declaration because it ends in `;` and its first token is not an excluded keyword. **Closed by amendment 15**, and the builder disclosed the classification as rule-driven rather than semantic in the same report — which is why one round settled it instead of two.

**And that is the point of amendment 7 restated.** A two-line disagreement on a byte-identical file was resolved by a twelve-line paste. §8.10's 714/691 case cost three rounds for want of the same paste.

## 7.95 EA-175 — amended, and its dead-export claim withdrawn
FlowLogic declares `#property indicator_buffers 34` and makes **34** `SetIndexBuffer` calls at 566–617, indices 0–33 contiguous, all inside FlowLogic `OnInit` (**563–697, 135 lines**). The EA defines **31** `FL_BUF_*` constants with replacement texts spanning 2–33. The gap set is **{0, 1, 28}**:

| Index | Buffer | Kind | Readers |
|---|---|---|---|
| 0 | `g_bufFractalHigh` | `INDICATOR_DATA` | FlowLogic 566/568/748; `SRJ_Fractals.mqh` 107/116/140/176/198/199 |
| 1 | `g_bufFractalLow` | `INDICATOR_DATA` | FlowLogic 567/569/749; `SRJ_Fractals.mqh` 108/117/141/177/200/201 |
| 28 | `g_bufRenewalBoundaryTime` | **`INDICATOR_CALCULATIONS`** | FlowLogic only — 68, 604, 651, 784, 1070, 1077, **read at 1082/1083** |

**The "dead export" claim is withdrawn.** Buffer 28 is declared `INDICATOR_CALCULATIONS` and is written and read inside FlowLogic. An internal calculation buffer needs no EA reader by design, and zero occurrences in the EA and in all fourteen `.mqh` files is the expected shape, not a defect. Buffers 0 and 1 are `INDICATOR_DATA` plots consumed by `SRJ_Fractals.mqh`, which reads and writes them by array name rather than through `FL_BUF_*`, so their absence from the constant set is also expected.

**What survives is narrower and still worth carrying.** The EA's constant set covers **31 of 34 buffers**, and the three it omits are omitted for three different reasons — two are plot arrays consumed inside an include, one is an internal calculation buffer. **So `#property indicator_buffers 34` is the count the export stages must increment, indices 34/35/36 are genuinely free, and the final count of 37 is arithmetically confirmed for the first time.** That is the fact §12.4 needed and had never had.

**Fourth retraction on the record.** EA-175's dead-export claim joins line 714's `SRJ_StrictNearestOBIndex` verdict, EA-163's order-block half, and §17.32's empty-slot exposure in `07_ARCHIVE\RetractedFindings\`.

## 7.96 The attribution result is VOID — defects 82, 83 and 84

Task 160-PreH's Block B was the round's central deliverable: convert *scope* into *attribution* for every flag-write region, so export stage 1's buffer can name the object that set the flag. **Its output is void, and the cause is entirely the planner's.**

**Defect 83 — the arithmetic.** The attribution rule tested scope by comparing a variable's declaration line against the **opening** lines of the statement's brace stack only. It never tested `D < S`, and it never tested against a **closing** line. Two errors follow at once, and the return exhibits both:

- At `SRJ_FVG_CreationRenewalPass` line **199**, the rule reported `newBearFVG` (declared 234), `renewalOB` (253) and `nearestOB` (258) as **YES, in scope** — three variables whose declarations lie 35, 54 and 59 lines *after* the statement.
- At `SRJ_OB_ActivationInvalidationPass` line **535**, the rule reported `ob` (declared 427, inside the `for` body opened at 426, unambiguously live at 535) as **NO, not in scope**, because 427 < 481 and the rule compared against the inner `if`'s opening line.

**The one variable that genuinely was in scope was rejected, and three that could not possibly be were accepted.** The builder computed it exactly as written and disclosed every number it used, which is the only reason this is recoverable.

**Defect 84 — pointer parameters.** `SRJ_OB_ReplayActivationInvalidation` takes `COrderblock *ob` in its header (param list closing 94). A parameter is in scope at every statement in the body. The rule's clause (a) enumerated only variables *declared inside* the paste, so the region returned **"NOT ASSIGNED FROM ANY CONSTRUCTION IN THIS PASTE"** for both flag writes at 171/173 — a self-consistent answer that would have gone into stage 1's Form B as *"this pass has no object to attribute"* when it has one in its signature. **The builder volunteered that `ob` is a parameter rather than a local. Nothing in the item asked, and no other mechanism would have caught it.**

**Defect 82 — the original.** The predecessor item asked whether an object was *in scope*, which is not the question stage 1 asks. Stage 1 asks which object the flag write **attributes** to. Scope was returned correctly and answered a different question.

**Amendment 14 replaces the rule** with a three-part scope test — `D < S`, containment within `[Dopen, Dclose]`, and membership of that brace entry in the statement's stack — plus mandatory enumeration of pointer parameters. **Every attribution answer from 160-PreH is void and Block A of the live task re-runs all seven regions.**

**What survives from that block, because it is not attribution:** the four buffer-36 assignment lines and their exact RHS (ImbalanceMgr 199 `false`, 226 `true`, 316 `false`, 343 `true`); their full brace stacks; the six candidate variables with their declaration lines and RHS (`newBullFVG` 117 and `newBearFVG` 234 from `SRJ_createImbalance`; `renewalOB` 136 and 253, both `= NULL`; `nearestOB` 141 and 258 from `GetOB(g_orderblocks, nearestIdx)`); the per-variable use traces; and every region bound. **The inputs to attribution are established. Only the verdict is void.**

---

# 8. Verified architecture facts

Revision 56 §8.0–§8.5 carry forward unchanged: the canonical tree and its stasis quadruple, the FlowLogic buffer map and the verified buffer-33 write template, the EA read model and the `ReadFlow` requirement, the three zone-read sites with their whitespace discriminators, the log site catalogue and the retained-log inventory.

## 8.6 Canonical tree and stasis

```
DF = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
     DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5        3,202 lines
     DF\MQL5\Indicators\SRJ_FlowLogic.mq5        1,180 lines
     DF\MQL5\Include\SRJ\  — 14 .mqh files
Total 16 files. Dukascopy MT5.
```

| Item | Value |
|---|---|
| FlowLogic `.mq5` SHA256 | `d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5` |
| FlowLogic `.ex5` timestamp | `08/28/2026 01:04 PM` |
| EA `.mq5` SHA256 | `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322` |
| EA `.ex5` timestamp | `08/29/2026 04:50 AM` |
| **VOID — never quote** | `c307496079e30e902329b3236c35a4c8c71152b939dfa6f38e67514dc3879511` and `08/29/2026 12:54 PM` |

**Both `.mq5` digests were verified MATCH at Task 158, CorrectionA, CorrectionB, CorrectionC, 160-PreD, 160-PreD-R2, 160-PreE, 160-PreF, 160-PreG and 160-PreH**, the last six at both task start and the final item. **Twenty-one consecutive rounds with stasis confirmed.**

**These roles invert at export stage 1.** Stages 1–3 compile FlowLogic by design, so the EA `.mq5` becomes the control file and EA-131's invariant ends at stage 1, re-recorded per stage.

## 8.7 The read model is append-safe, and that is load-bearing

The EA uses 31 individual `#define FL_BUF_*` constants with no count constant, no index enum and no fixed-width array, and every FlowLogic read on a logic path goes through `ReadFlow` → `ReadBuf1`. **Appending buffers cannot break it**, which is what makes the transitional provenance interface cheap. FlowLogic declares `indicator_buffers 34` and uses indices 0–33 contiguously, so **34/35/36 are free and the post-append count is 37** (§7.95).

It is also why it is tempting to treat as the final design and is not: a candidate registry cannot express per-hypothesis object lookups through a fixed set of global indicator buffers.

**And it runs one way only, now demonstrated twice.** The retention configuration — `g_keepInvalidatedCount`, `g_keepInvalidatedFVGCount`, `g_deleteFVGAfterFill` — is FlowLogic-side and EA-unreadable (§17.29). The **closed-bar fact** is the second case: FlowLogic computes it at 847, `SRJ_HTFEngine.mqh` computes a different one at 107, and the EA has none at all (EA-170, EA-173).

## 8.8 The intrabar snapshot, settled

`g_sSnapshot` is declared at FlowLogic 119 and has **zero occurrences in the EA**. The snapshot block saves and restores `g_s` wholesale and nothing else; `g_srjObjIdSeq` and `g_objSeq` are absent from it. `g_orderblocks` and `g_imbalances` are cleared only in `SRJ_StateInit` at State 463/464, on full recalc.

- A field inside `SState` is restored correctly across the intrabar re-run and a file-global beside it is not, which is why **P5a exists and is not negotiable**.
- **EA-side candidate and hypothesis records are entirely insulated.** Task 160's registries live on the EA side with no snapshot coupling.
- Object population shrinks monotonically intrabar and never rolls back (EA-159, P16).
- **The delete-path inventory may be incomplete.** `SRJ_OB_InactiveLinePrunePass` (FlowLogic 862) and `SRJ_OB_OpposingCachePass` (864) have never been read and both run inside the per-bar sequence with object-touching names (EA-179). Block C of the live task settles whether either deletes.

## 8.9 Line map — navigation aid only, never an anchor (P12)

Every entry was established by census plus brace counting in one of the last ten returns. **Re-establish any region a task touches in that task or its immediate predecessor. An anchor two source-only tasks old is not a predecessor anchor (defect 75).**

**`SRJ_FlowNexus_EA.mq5`**

| Region | Range | Note |
|---|---|---|
| `ENUM_SRJ_STATE` | 137–139 | 3 lines, 8 members, no explicit values |
| `ABORT_NO_TP_TARGET` | 161 | `#define`, file scope, no enclosing region |
| **singleton declaration block** | `//===== Singleton sequence state` 166, declarations **167–190** | session-used flags 183–186, alert latches 189/190. **Task 160's append region** |
| shadow block | **192–203** | re-established in 160-PreF |
| `g_state` / `g_sessionAtEntry` declarations | 167 / 170 | both with initialisers |
| `StateName` | 281 → | case labels 285–292, one per member |
| `LogState` / `LogAbort` | 321 / 329 | |
| `EmitAlert` | 362–376 | `Alert(` and `SendNotification(` occur only here **in the EA**, both gated on `pushable` |
| `CurrentTradingWindow` | **379–401** | three-member window domain, London 02:00–05:00 ET, NY 07:00–12:00 ET, else `SESSION_NONE` (EA-165) |
| **`TpTargetUpdateBest`** | **614–635, 22 lines** | param list closes 615. Exits **617** (`EMPTY_VALUE \|\| <= 0`), **619** (direction), **631** (zone containment). Tie strict `<` at 633 (EA-171) |
| `TpSessionLevelFiltered` | 650–655 | live-bit filter; sid comments 651–654, **never classify from them** |
| **`ComputeNearestTpTarget`** | **659–775, 117 lines** | param list closes 660; `tpTargetOut` the only by-ref; `for` at 699, 706, 735, 746; decision loops 699–704 and 706–712; TPCENSUS 719–771; returns 772 `false` / 774 `true`; `SrjIsNa` ABSENT throughout |
| **`ComputeSlReference`** | **801–1069, 269 lines** | param list closes 803; `slRefOut` and `slModeOut` by-ref; `for` at 810, 922, 983, 1046; **8 returns, all carrying an expression, six `false`**; zone control-flow at **928, 976, 988**; `slCurPx` 869; `slModeOut` 885/1054; 1-swing branch 879, 2-swing `else` 1041 (EA-174, EA-176, EA-177, EA-178) |
| `ResetSequence` | **1090–1107, 18 lines** | 13 globals; zone zeroed **1103/1104**; alert latches 1105/1106. **Four call sites: 1135, 2968, 3054, 3120** |
| `GoAbort` | 1109–1136 | `EmitAlert` STAND-DOWN 1116, `ST_ABORT` 1133, `ResetSequence()` 1135 |
| **`ZoneAdoptable`** | **1211–1261, 51 lines** | **never read.** One call site, **2786** — EA-150's second binding guard |
| `EvaluateClosedBar` | **1363–3056, 1694 lines** | one contiguous brace-counted region. **21 bare returns, none inside any loop. Eleven `for`, no `while`/`switch`/`do`. Zero `goto`. 20 jump statements, all loop-local.** 15 `GoAbort` call sites |
| `sess` declaration | 1365 | `ENUM_SRJ_SESSION sess = CurrentTradingWindow(barTime);` — `NOT ENCLOSED`. `inWindow` 1366 |
| loop bodies inside the cascade | 1371–1382, 1399–1403, 1407–1410, 1440–1465, 1967–1977, 2038–2064, 2414–2421, 2494–2508, 2568–2583, 2687–2702, 2935–2943 | eleven, all `for` |
| `NO_TP_TARGET` continuous poll | 1937 guard → 1941 call → **1946** | range test; 1937 is one of EA-162's eight sites. **Task 142's only permitted site** |
| **`ComputeSlReference` S2 poll** | **1949**, stack `1938 {if}`, `site="S2POLL"` | three lines after Task 142's site |
| throttle consult / admission latch | 2207 `if(g_state == ST_IDLE)`, 2210 `SessionAlreadyUsed(sess, barTime)`, 2227 retest early return, 2228–2232, 2233, 2235 | **`g_sessionAtEntry` at 2232** |
| `ReadBuf1(... g_anchorPrice ...)` | 2231 | the **single** by-reference write to the working set |
| state assignments | 2235, 2248, 2260, 2738, 2877, 2966, 3052, plus 1092 and 1133 | |
| object ids read, printed, discarded | 2273/2274, 2276 | EA-151 |
| promotion time read as diagnostic | 2288 | R-Q11 ruling 3's operand already present |
| zone write 1 | 2732 guard, **2734/2735** | S3→S4 arming, the ruled binding point |
| HEADS-UP latch and emit | 2753, 2754 | |
| zone write 2 | **2786 `ZoneAdoptable`** / 2788 / 2789 guards, **2803/2804** | EA-150; touch revalidation 2808–2811 |
| `FindLegTouch` call | 2841 | params 4/5 by-ref, both args locals |
| S5-gate target abort | 2883 guard → 2889 call → **2894** | equality test. **Never edit** |
| **`ComputeSlReference` S5 call** | **2899**, stack `2884 {if}`, `site="S5"` | |
| SIGNAL latch and emit | 2950, **2951** | only site passing `pushable = true` |
| commit path A | 2964 `MarkSessionUsed`, 2966 `ST_SIGNAL`, 2968 `ResetSequence`, 2969 `return` | |
| trade calls | 3017 `g_trade.Buy`, 3019 `g_trade.Sell` | zero `OrderSend` |
| commit path B | 3050, 3052, 3054, end 3056 | |
| `OnInit` | **3059–3123, 65 lines** | **two** lines reduce to `}`: **3102 with four leading spaces** and **3123 with three** (the closing brace). `ResetSequence()` called at **3120** |
| `OnDeinit` | **3126–3191, 66 lines** | |
| **`OnTick`** | **3194–3201, 8 lines** | `static datetime s_lastBarTime` **3196**, guard **3198**, **the single `EvaluateClosedBar` call at 3200** with args `1, currentBarTime`, `NO-LOOP-OR-SWITCH-IN-STACK`, `NOT ENCLOSED` |
| `OnCalculate` / `OnTimer` / `OnChartEvent` | **NO DEFINITION FOUND** | not present in the EA |

**`SRJ_FlowLogic.mq5`**

| Region | Line(s) | Note |
|---|---|---|
| `g_bufRenewalBoundaryTime` declaration | **68** | buffer 28's array, `INDICATOR_CALCULATIONS` |
| `g_sSnapshot` declaration | 119 | zero occurrences in the EA |
| keep-count assignments | **358, 379, 380** | ← `in*` variables. **No `Inp` on any RHS; zero occurrences of all three in the EA** |
| **`OnInit`** | **563–697, 135 lines** | **all 34 `SetIndexBuffer` calls, 566–617**, indices 0–33 contiguous. Buffer 28 at **604** |
| **`OnCalculate`** | **705–1179, 475 lines** | contains the whole per-bar sequence |
| `barClosed` origin | **847** | `bool barClosed = BarClosed(i, rates_total);` — threaded into nine pass calls |
| **per-bar pass sequence** | **849–885, nineteen `SRJ_` calls** | full order at §7.93. Unread: 852, 862, 864, 866, 880, 882, 883, 884, 885 |
| flag export block | 902–904 | reads whatever survived the pass order |
| pruning calls | **888, 889** | `withinLookbackWindow` only; **not** `barClosed`-gated; run **before** the identity export |
| buffer 33 promotion time | 964–976 | same object pointer as bounds and id |
| identity export | 954 (`= 0.0`), 966 (`= (double)xob.objId`) | |
| leg-membership export gate | 994 | gated on the permanently-false `currentLegHasXOB` (EA-156) |
| `g_s.londonHigh` export | 920–923 | |
| swept-mask live bits | 1103–1107 | exclusive else-if on the bar's own time; bit 10 Asia, 11 London, 12 NY, 13 PM |
| buffer 28 write / read | 1070, 1077 / **1082, 1083** | internal calculation buffer, FlowLogic-only by design |

**Include files**

| Region | File and line(s) |
|---|---|
| **`SState` struct** | `SRJ_State.mqh` **96–247, 152 lines.** Opening brace **97**, **last field declaration 246**, closing brace **247**. `objId`/`ObjId`/`SetterId`/`setterId`/`Setter` all **ABSENT** from the struct |
| `g_s` | `SRJ_State.mqh` **249** |
| `g_orderblocks` / `g_imbalances` | `SRJ_State.mqh` **251 / 252**, both `CArrayObj`. `FreeMode` 448/449, `Clear` 463/464. **`.Insert(` and `.Sort(` ABSENT for both across all 16 files** |
| `SRJ_StateInit` | `SRJ_State.mqh` 297–490, 194 lines. Array clears 463–478, `g_objSeq`/`g_srjObjIdSeq` 486/487, `g_lastBarTime` cleared **489**, closing brace 490 |
| buffer-36 clear site | `SRJ_State.mqh` **329** |
| keep-count declarations | `SRJ_State.mqh` **20 / 40 / 41** |
| `currentLegHasXOB` / `structLegBoundary` init | `SRJ_State.mqh` 325 / 326 |
| composite object key | `SRJ_Types.mqh` 22–30; comment at 24 |
| `SRJ_NextObjId` | `SRJ_Types.mqh` 31/32 |
| `objId` fields | `SRJ_Types.mqh` 63 (`COrderblock`), 114 (`CImbalance`) — **the only two of eighteen types** |
| `SRJ_OBOverCap` / `SRJ_FVGOverCap` | `SRJ_Draw.mqh` **240–260** / **262–285** |
| fractal buffers | `SRJ_Fractals.mqh` 107/108 declarations, 116/117, 140/141, 176/177, 198–201 |
| HTF `barClosed` | `SRJ_HTFEngine.mqh` **107** — `(j < htfTotal - 1)`, HTF index (EA-173) |
| activation sites | `SRJ_OrderblockMgr.mqh` 112/114 and 440/442, `SRJ_HTFEngine.mqh` 174/176 |
| **`SRJ_OB_ReplayActivationInvalidation`** | `SRJ_OrderblockMgr.mqh` **89–195, 107 lines**, param list closes **94**, **`COrderblock *ob` is a parameter**. Owns `tickOBIsValid` writes **171/173**, stack `122 {if}, 130 {if}, 161 {if}`; history attributed to `discoveryBar` 164/166 |
| **`SRJ_OB_ActivationInvalidationPass`** | `SRJ_OrderblockMgr.mqh` **413–571, 159 lines**, param list closes 416. `ob = GetOB(g_orderblocks,k)` at **427** inside `for` at **425/426**. Writes **535/537**, stack `426 {for}, 481 {if}, 483 {if}, 495 {if}, 525 {if}` |
| `SRJ_OB_CreationPass` | `SRJ_OrderblockMgr.mqh` 197–411, 215 lines |
| `SRJ_OB_CounterAggregationPass` | `SRJ_OrderblockMgr.mqh` 573–611, 39 lines |
| `SRJ_StrictNearestOBIndex` | **DEFINITION `SRJ_OrderblockMgr.mqh` 691–729, 39 lines.** Forward DECLARATION `SRJ_ImbalanceMgr.mqh` **14**. Guards 703/705/706/707/708–710; better-test 712; `return bestIdx` 728. **`isPromoted` ABSENT** |
| `SRJ_ApplyPromotion` | `SRJ_OrderblockMgr.mqh` 780–786; `isPromoted = true` 781 |
| `SRJ_promotionReconcile` | `SRJ_OrderblockMgr.mqh` 788–940, 153 lines; `nearest` exits 791/793/805/811/818/829/842/852 |
| `promotionBar` stamps | `SRJ_OrderblockMgr.mqh` 858, 913 |
| `didPromoteStrong` chain | `SRJ_OrderblockMgr.mqh` 895 decl, 904–906 guards, 934 gate, **937** the only `currentLegHasXOB = true` |
| queue collision | `SRJ_OrderblockMgr.mqh` 949, 958, 972; slot clear 999–1003 |
| `SRJ_OB_DeferredPromotionPass` | `SRJ_OrderblockMgr.mqh` 993–1016, 24 lines |
| `SRJ_OB_PruningPass` | `SRJ_OrderblockMgr.mqh` **1072–1102, 31 lines.** Guard 1082, delete 1086; precondition 1091, cap call 1092, delete 1098. `barClosed` ABSENT |
| invalidation history | append `SRJ_OrderblockMgr.mqh` 164/166, 528/530; prune 577/578 |
| **`SRJ_FVG_CreationRenewalPass`** | `SRJ_ImbalanceMgr.mqh` **108–348, 241 lines**, param list closes 110. `newBullFVG` **117** ← `SRJ_createImbalance`, `newBearFVG` **234** ← `SRJ_createImbalance`; `renewalOB` **136**/**253** ← `NULL`; `nearestOB` **141**/**258** ← `GetOB`. `.Add(` 119/236. Buffer-36 writes **199** `false` (stack `116{if},123{if},126{if},175{if}`), **226** `true` (`116{if},123{if},224{else}`), **316** `false` (`233{if},240{if},243{if},292{if}`), **343** `true` (`233{if},240{if},341{else}`). `hasDrivenRenewal` 204/321. FVG creation gate 112; leg anchor 202/319 |
| `SRJ_FVG_FillDetectionPass` | `SRJ_ImbalanceMgr.mqh` 350–378, 29 lines |
| **`SRJ_FVG_TickValidRecomputePass`** | `SRJ_ImbalanceMgr.mqh` **380–417, 38 lines**, param list closes 380. `fvg = GetFVG(g_imbalances,k)` at **399**. Writes **390** (`true`, stack **empty — region level**) and **415** (`!latestBiasFVGIsFilled`, stack `393 {if}`). Ascending walk 397, selection latch 407–411, strict `>` |
| `SRJ_FVG_PruningPass` | `SRJ_ImbalanceMgr.mqh` **495–530, 36 lines.** Guard 505, delete 509; precondition 514, `g_deleteFVGAfterFill` 516, cap call 519, delete 526. `barClosed` ABSENT |
| `SRJ_Bias_PerBarResetPass` | `SRJ_BiasEngine.mqh` 16–44, 29 lines |
| `SRJ_Bias_StructureDetectionPass` | `SRJ_BiasEngine.mqh` 46–147, 102 lines; takes `barClosed` |
| **`SRJ_Bias_DecisionBlock`** | `SRJ_BiasEngine.mqh` **149–371, 223 lines.** Three scalar parameters; **zero `Orderblock`/`Imbalance`/`objId`/`COrderblock`/`CImbalance` matches in 223 lines.** Buffer-36 clears **228**, **282** |
| `currentLegHasXOB = false` | `SRJ_BiasEngine.mqh` 134, 278 |
| `structLegBoundary` write | `SRJ_BiasEngine.mqh` 135, 279 |
| rollback-asymmetry comment | `SRJ_BiasEngine.mqh` 305–307 — corroboration only, never evidence |
| reconcile calls | `SRJ_BiasEngine.mqh` 309, 325; slot-2 direct writes 312, 328; queue 339 |
| `SRJ_GetSessionId` | `SRJ_Sessions.mqh` **175–183, 9 lines.** NY conversion, first-match Asia 0 / London 1 / NY 2 / PM 3 / `SRJ_NA_INT` |
| `londonHigh` reset | `SRJ_Sessions.mqh` 289 |

## 8.10 Retired from the line map

**`SRJ_OrderblockMgr.mqh` 714 is not `SRJ_StrictNearestOBIndex`.** An earlier return classified 714 as a DECLARATION of that name; on a byte-identical file with a matching digest, 714 is `          better = true;` inside the definition's body, and the header is 691. The earlier verdict was self-consistent and wrong, and nothing in that report could have exposed it. **691–729 stands; every statement that cited 714 is retired.** This is the standing case for **amendment 7, the falsifiability rule**.

**`SState`'s 247/247 pair is retired.** §7.94 settled it at last field **246**, closing brace **247**, from a twelve-line paste. Closed by amendment 15.

## 8.11 The harness, settled and measured three times

Real ticks always, verified from the journal line `generating based on real ticks` and confirmed by the `SRJ XOB-PROMOCENSUS` fingerprint: **372** Tier 1 real ticks, **607** generated, **691** Tier 2. Runtime ~70 bars/min.

| Tier | Window | Bars | Runtime | Use |
|---|---|---|---|---|
| 1 | 08.14–08.22 | 1,728 | 25 min | behaviour-neutral regression, byte-identity |
| 2 | 07.28–08.22 | 5,472 | 80 min | when 08/03, 08/05 or 07.28 is needed |
| 3 | 06.01–08.22 | — | ~240 min | lock in a change or claim the whole signal set |

Baselines: `D:\Videos\Task 135 Full Logs.txt` (Tier 1) and `D:\Videos\Task 144 Full Logs.txt` (Tier 2, fully provenanced). **Task 123's Tier 3 is two generations behind**, so the next Tier 3 run re-establishes the baseline as well as measuring whatever it was spent on. No harness change without a liveness probe on `BIASCENSUS_FINAL bars=`.

---

# 9. Task 159 Deliverable 1 — the twelve data contracts

Every field carries exactly one classification. **These are architectural placeholders (P12).** No field exists that does not trace to an A-3 ruling, a numbered defect, or a region one of the ten source-only returns located.

## 9.1 The classification set

| Class | Write rule |
|---|---|
| **immutable identity** | written once, at creation or binding. A later write is a defect the event recorder must be able to prove did not happen |
| **latched setup evidence** | written once, at a named lifecycle point |
| **live mutable state** | re-read per bar **by identity**, never by re-selection |
| **derived value** | recomputed freely, never stored as evidence |
| **diagnostic only** | may not be read by any gate |
| **resolved reference** | a stored identity plus a resolution outcome, re-read per bar by identity, whose outcome is `RESOLVED`, `GONE` or `UNKNOWN` |

**`GONE` is a first-class lifecycle input, not an error.** A hypothesis whose bound XOB returns `GONE` has lost its structural basis and must transition, not continue against stale copied fields.

**Write-once means a second write creates a new record, never a mutation.** Three places look like re-writing latched evidence — the zone replacement at 2803/2804, the touch revalidation at 2808–2811, and A-3 §5.3's better-R reference. All three become **record creation**.

**A Phase A output may not carry a Phase B field.** If a Phase A record could hold a Phase B verdict, Milestone 5 becomes unprovable by inspection and degrades to a signal count.

**New binding rule from this arc — defect 80.** **A contract field's justification must name the region that supplies its value.** `SMarketSnapshot.barClosed` was justified as making a distinction auditable without establishing that the owning side can read the fact; the EA cannot (EA-170). Every field's traced-to column is now a claim about a readable region, not about a concept.

## 9.2 `SObjectRef` — the contract every other contract goes through

| Field | Class | Traced to |
|---|---|---|
| `objId` | immutable identity | EA-127; assigned at construction on the only two paths that have the field |
| `objKind` | immutable identity | only `COrderblock` and `CImbalance` carry `objId`; HTF types cannot be referenced at all (EA-155) |
| `startBar` | immutable identity, **run-scoped** | composite key at `SRJ_Types.mqh` 22–30 |
| `promotionTime` | immutable identity, **cross-run stable** | buffer 33, stamped from the same pointer as bounds and id |
| `resolution` | resolved reference | `RESOLVED`, `GONE` or `UNKNOWN`. **`GONE`'s cause is capacity-driven on every path** (§7.81) |
| `resolvedBar` | derived value | the bar `resolution` was last computed on; never evidence |
| `lastValidObserved` | resolved reference | EA-163. The last `isValid` seen while `RESOLVED`. On the OB path the invalidation-then-prune ordering is known, so this **records** rather than disambiguates |
| `lastFilledObserved` | resolved reference | **EA-163's surviving half.** `g_deleteFVGAfterFill` can delete in the fill pass, so without this a fill event is unrecoverable from a `GONE` |

`objId` is never a cross-run key. Cross-run comparison uses `promotionTime` or the composite. **No pointer, no array index (P16).**

## 9.3 `SXobRecord`

| Field | Class | Note |
|---|---|---|
| `ref` | immutable identity | the only handle |
| `isBullish` | immutable identity | |
| `high`, `low` | immutable identity | written at construction; `SRJ_ApplyPromotion` changes line widths only |
| `invalidationLevel` | immutable identity | Types 251 |
| `activationBar` | immutable identity | = `validationBar`, written once under the activation guard at all three sites |
| `isActivated` | live mutable state, **monotonic false→true** | no `isActivated = false` outside constructors and factories |
| `isValid` | live mutable state, **monotonic true→false after invalidation** | `true` only at activation (113, 441, 175); `false` at invalidation (131, 496, 188). **Observable through identity for at least one bar before capacity removal** (§7.82) |
| `invalidationBar` | latched setup evidence | may be NA. **Also the OB cap's ranking key** |
| `isPromoted` | immutable identity after promotion | write-once, 781 |
| `promotionBar` | immutable identity | write-once at the call site, 858/913 |
| `hasDrivenRenewal` | live mutable state | consumption flag, ImbalanceMgr 204/321 |
| `anatomyQualified` | derived value | called per evaluation, never stored |

**The witness rule is a comparison between two immutable-identity fields and the touch bar, never a stored flag.** `tickOBIsValid` is **excluded by name** — it describes the last invalidation *event* (EA-146), and **it is written inside a descending loop where the last writer is the earliest-inserted invalidating object** (EA-172). **The opposing-invalidation count is not a field and cannot be** (EA-160).

## 9.4 `SFvgRecord`

| Field | Class | Note |
|---|---|---|
| `ref` | immutable identity | |
| `isBullish` | immutable identity | |
| `high`, `low` | immutable identity | |
| `startBar` | immutable identity, run-scoped | leg anchored at `i - 2` |
| `isFilled` | live mutable state | `SRJ_FVG_FillDetectionPass` (ImbalanceMgr 350–378). **May never be observable as `true` when `g_deleteFVGAfterFill` is set** (EA-163) |
| `fillBar` | latched setup evidence | the FVG cap's precondition operand |
| `validityForBundle` | resolved reference | **not** `tickFVGIsValid` |

`tickFVGIsValid` is excluded by name (EA-152): unconditional `true` at ImbalanceMgr 390 at region level, re-derived at 415 inside the `393 {if}` block from a per-bar ascending re-selection. Copying it would carry the ambiguity into N records — P13's worse-than-singleton case.

## 9.5 `SStructuralBundle`

| Field | Class | Note |
|---|---|---|
| `xob` | immutable identity at binding | never re-selected |
| `fvg` | immutable identity at binding | may be absent; absence explicit, not zero |
| `legBoundaryBar` | immutable identity at binding, **or UNKNOWN** | EA-155 |
| `legMembership` | derived value **or UNKNOWN** | `fvg.startBar >= legBoundaryBar`, evaluated against a value with different rollback semantics from the objects compared |
| `bindingBar` | immutable identity | |
| `bindingEvent` | immutable identity | |

Because the bundle holds `bindingBar`, **a bundle never exists unbound** — which is why `HYPOTHESIS_UNBOUND` is retired unimplemented.

## 9.6 `SMarketSnapshot` — amended by EA-170 and EA-173

One per evaluated bar, immutable once built, consumed by Phase A.

| Field | Class | Note |
|---|---|---|
| `barIndex`, `barTime` | immutable identity | |
| **`barClosed`** | immutable identity, **invariant-true by construction** | **AMENDED.** The EA has no `barClosed`, no `prev_calculated`, no `rates_total` and no `g_lastBarTime`; the fact is a function-static `s_lastBarTime` tested at EA 3198 and discarded before `EvaluateClosedBar` is entered. **The invariant must be stated in source. The field may not be presented as an audit of a fact the EA cannot read** (EA-170). FlowLogic's own definition at 847 and `SRJ_HTFEngine.mqh`'s at 107 are two further definitions whose agreement is unestablished (EA-173) |
| `open`, `high`, `low`, `close` | immutable identity | |
| `bias`, `regime` | immutable identity | read once per bar, never re-read mid-evaluation |
| `sweptMask` | immutable identity | buffer 29; live bits are session membership on this bar's time |
| `tradingWindow` | immutable identity | **EA-165.** Domain `{LONDON, NYAM, NONE}`, computed once per evaluated bar from `barTime` at EA 1365 |
| `sessionLiveId` | immutable identity | domain Asia 0 / London 1 / NY 2 / PM 3 / `SRJ_NA_INT`. Not the same domain as `tradingWindow` and **never compared to it** |
| `executionWindowAdmissible` | derived value | EA-144, **derived from `tradingWindow`** in Phase B's commit test, never stored |

## 9.7 `SCandidate`

| Field | Class | Traced to |
|---|---|---|
| `candidateId` | immutable identity, engineering, run-scoped | attribution key; not a strategy fact |
| `dir` | immutable identity | `g_dir`, EA 2229 |
| `poiAnchorLine` | immutable identity | `g_anchorLine`, 2228 |
| `poiAnchorPrice` | latched setup evidence | `g_anchorPrice`, written **by reference** at 2231 |
| `poiAnchorBarTime` | immutable identity | `g_anchorBarTime`, 2230 |
| `retestBar` | immutable identity | **NOT STORED in the build.** The contract creates the storage |
| `retestEvent` | immutable identity | gap-tap recency ruling governs which taps qualify |
| `regimeAtAdmission` | latched setup evidence | `g_regime`, written at the regime-wait exit |
| `tradingWindowAtAdmission` | **immutable identity**, domain `{LONDON, NYAM, NONE}` | `g_sessionAtEntry` ← `sess` ← `CurrentTradingWindow(barTime)`. Single live write **EA 2232**, inside `if(g_state == ST_IDLE)` at 2207. **Edge C1.** EA-164, EA-165 |
| `state` | live mutable state | `g_state`'s candidate-level meanings |
| `hypothesisIds` | live mutable state | append-only; siblings accumulate |
| `createdBar` | immutable identity | |
| `rejectionReason` | latched setup evidence | half of the *candidate-specific rejection* milestone |

**Three things are explicitly not candidate fields.** The **session throttle** stays file-global, written once each in `MarkSessionUsed` by Phase B after a winner commits. The **zone** is neither a candidate nor a hypothesis field (§9.8). And **candidate expiry has no field**, because its trigger is unnamed.

## 9.8 `SHypothesis`

| Field | Class | Traced to |
|---|---|---|
| `hypothesisId` | immutable identity, engineering | |
| `candidateId` | immutable identity | parentage **established by construction**, the only place it is free (P15) |
| `bundle` | immutable identity at binding | holds `bindingBar`/`bindingEvent` |
| `siblingRank` | **diagnostic only** | a sibling inherits nothing, so no gate may read the link |
| `state` | live mutable state | |
| `zoneHi`, `zoneLo` | **derived value — RETIREMENT BLOCKED** | `g_zoneHi`/`g_zoneLo` recomputed from `bundle.xob` per bar. **§17.35: five EA functions read them, two of which (`TpTargetUpdateBest`, `ComputeSlReference`) read them in control flow on the admission path.** Retirement requires packet items 18, 19, 20 ruled |
| `touchLatched` | latched setup evidence | `g_touchSeen` |
| `touchBar` | latched setup evidence | |
| `touchBarHigh`, `touchBarLow` | latched setup evidence | |
| `touchAdmissible` | derived value | `touchBar > bundle.xob.promotionBar`. R-Q11 ruling 3 |
| `confirmationBar` | latched setup evidence | **absent in the build** |
| `confirmationClose` | latched setup evidence | **absent.** EA-142: recomputed as `iClose(barShift)` per bar. **EA-177: the same close is `slCurPx` at EA 869 and the operand of three stop-side tests** |
| `confirmationTime` | latched setup evidence | **absent** |
| `divergenceVerdict` | latched setup evidence | `g_divLatch` |
| `divergenceConsumedBar` | latched setup evidence | EA-143 |
| `stopRef` | see §9.9 | |
| `targetRef` | see §9.10 | |
| `confluenceLatches` | latched setup evidence, **CONSTITUENT SET UNKNOWN** | blocked on Part A v4.2 §3.7 |
| `confluenceCount` | derived value | a count over named latches is a derivation regardless of the set |
| `rejectionReason`, `rejectionBar` | latched setup evidence | recorded rejection, deferred removal |
| `alertedArmed`, `alertedSignal` | live mutable state | set 2753/2950, cleared 1105/1106. Read by a gate, so not diagnostic-only |
| `basisLostBar` | latched setup evidence | latched on H11. **The diagnostic event must name the `objId`, the last `RESOLVED` bar, `lastValidObserved` AND `lastFilledObserved`** |

**The zone retirement is the substance of EA-150 and EA-151's repair, and it is now the riskiest single change in Task 162.** Three consequences hold:

- **EA-150's second write site is deleted, not ported.** The 2803/2804 replacement becomes a sibling with its own bundle. `HYPOTHESIS_SIBLING_CREATED` fires at **both** 2734 and 2803. **Its guard at 2786 is `ZoneAdoptable`, 51 lines, never read** — Block D of the live task.
- **The touch revalidation at 2808–2811 is deleted with it.** Two of `g_touchSeen`'s four writes are this repair and its companion reset.
- **And retirement changes target and stop selection unless the zone is supplied deliberately.** `TpTargetUpdateBest` 631 and `ComputeSlReference` 928/976/988 read the pair in control flow, and all of them are inert before arming and live after. **A mechanical retirement compiles and silently moves every target and every stop.**

```
On resolution == GONE:
    latch basisLostBar
    transition to HYPOTHESIS_BASIS_LOST
    record a diagnostic event naming the objId, the last RESOLVED bar,
    lastValidObserved and lastFilledObserved

HYPOTHESIS_BASIS_LOST is terminal, is distinguishable from every ruled terminator
T1..T5 and from every rejection reason, and may NEVER be attributed to a strategy
rule.
```

## 9.9 `SStopReference` — amended by EA-174, EA-176, EA-177, EA-178

| Field | Class | Note |
|---|---|---|
| `legIdentity` | immutable identity, **latched at binding** | see the ordering consequence |
| `legBoundaryBarAtLatch` | immutable identity at latch | EA-155: a bar-index relation, latched, never read live |
| `sourceObjectRef` | immutable identity at latch **or UNKNOWN** | P15 |
| `refPrice` | latched setup evidence | EA-145. `slRef` is a caller local; `slRefOut` is `ComputeSlReference`'s by-reference output with **zero persistent storage**. One measured candidate's value spanned 278 points on an unchanged zone |
| `refBar` | latched setup evidence | |
| `placementRule` | immutable identity at latch | **Two values recoverable from source:** `SL_MODE_1SWING` (EA 885) and `SL_MODE_2SWING` (EA 1054), written by branch |
| **`selectionCause`** | **UNKNOWN, and it may stay that way** | **NEW. EA-176:** `ComputeSlReference` has **six `false` exits** covering at least six distinct causes — buffer read failure (830), 1-swing side test with no fallback (882, 884), Task 75 side-guard exhaustion (956), Task 67 zone-guard exhaustion (1013), 2-swing walk exhaustion (1067). The S5 caller at 2899 turns all of them into one abort reason. **Packet item 19** |
| `zoneDependent` | **derived, and it must be recorded** | **NEW. EA-174:** selection reads `g_zoneHi`/`g_zoneLo` at 928, 976, 988, inert before arming and live after |
| `unionExtremeComponents` | latched setup evidence | Task 131's export rides here |

**One ordering consequence, and it moves a write point.** R-Q11 ruling 4 makes *the leg of the SL placement being in play* one of three satisfiers of the revisit requirement, which makes the stop leg an **input to touch admissibility** — before setup completion. So the write point splits: `legIdentity` and `legBoundaryBarAtLatch` latch at binding; `refPrice`, `refBar` and `placementRule` latch at the ruled placement point. Both halves write-once. **Council packet item 2, superseded in scope by item 19.**

**And one branch asymmetry that is not a classification question.** EA-176: the Task 75 side guard and the Task 67 zone guard both live inside the 1-swing branch. **The 2-swing branch applies neither**, so a stop reference selected there can sit inside the adopted zone or on the wrong side of the entry reference. **Packet item 20.** This is a defect-or-intent reading, not a contract field.

## 9.10 `STargetReference` — admission half only, amended by EA-171

| Field | Class | Note |
|---|---|---|
| `levelKind` | immutable identity at latch | |
| `levelSessionId` | immutable identity at latch | four-member domain plus NA, from `SRJ_GetSessionId`. **Never compared to `tradingWindow`** |
| `levelPrice` | latched setup evidence | EA-138, EA-142. `tpTarget` is a caller local with zero persistent storage |
| `latchedBar` | latched setup evidence | latched at setup completion |
| `sessionClosedAtLatch` | derived value, evaluated once at latch | R-Q12 part 1, verified implemented |
| `admissionR` | **derived value** | never stored as evidence, never quoted as an outcome |
| **`zoneDependent`** | **derived, and it must be recorded** | **NEW. EA-171:** `TpTargetUpdateBest` 631 excludes any candidate contained in `[g_zoneLo, g_zoneHi]`, inert before arming and live after. **Selection is not a function of the snapshot and direction alone.** Packet item 18 |
| `selectionCause` | **UNKNOWN, and its arity is now five** | EA-167 + EA-171. Five causes collapse into one `false`: mask (702), tier (708), non-positive/empty (617), direction (619), zone containment (631). **Two counters no longer cover it — packet item 15** |
| `tieRule` | immutable identity, engineering | Strict `<` at 633, so an exact distance tie goes to the group iterating first: session/PD buffers before POI lines. **A Scenario G input** |

**Post-fill revision is not in this contract.** R-Q12 parts 2 and 3 are live mutable state owned by the position and exit manager, Task 166.

## 9.11 `SPendingEntry`

| Field | Class | Note |
|---|---|---|
| `pendingId` | immutable identity, engineering | |
| `hypothesisId` | immutable identity | |
| `entryPrice` | latched setup evidence | the confirmation close. EA-142's repair, and EA-177's operand |
| `entryPriceSourceBar` | latched setup evidence | |
| `createdBar` | immutable identity | |
| `noChaseBound` | derived value | recomputed from latched confirmation; a transition rule, not a stored bound |
| `wickReturnSeen` | live mutable state | |
| `cancellationReason` | latched setup evidence | A-3 §5.11's set |
| `terminator` | latched setup evidence | T1–T5; **T3 has never existed in any build** |
| `fillBar`, `fillPrice` | latched setup evidence | at fill, ownership passes to the position manager |

**The better-R reference creates a replacement record.** Mutating `entryPrice` would reintroduce EA-142 inside its own repair. **T3 is why this cannot be folded into the hypothesis:** target or stop reached before fill terminates the *pending entry*, not the setup.

## 9.12 `SDecision` — Phase A's output

| Field | Class |
|---|---|
| `hypothesisId` | immutable identity |
| `snapshotBarIndex` | immutable identity |
| `stateBefore`, `stateAfter` | immutable identity |
| `verdict` | immutable identity. Placeholders: `NO_CHANGE`, `ADVANCED`, `COMPLETED`, `REJECTED`, `CANCELLED`, `BASIS_LOST` |
| `completionBar` | immutable identity, present only on `COMPLETED` |
| `anchorTier` | immutable identity |
| `rejectionReason` | immutable identity, present only on `REJECTED` |

**Omitted deliberately, and each omission is a milestone's proof:** no signal flag, no session-usage field, no order reference, no arbitration outcome, no emission state. Task 164's Milestone 5 census compares Phase A's region against §7.77's six-line commit surface, and a contract that could hold any of those makes the census answer nothing.

## 9.13 `SDiagnosticEvent`

| Field | Class |
|---|---|
| `eventKind` | immutable identity |
| `barIndex`, `barTime` | immutable identity |
| `candidateId`, `hypothesisId` | immutable identity, either may be **absent explicitly** |
| `objectRefs` | immutable identity, `SObjectRef` values only — never pointers (P16) |
| `payload` | diagnostic only |

**No gate may read an event.** **Every event kind carries its own distinguishing literal** — five terminators sharing an event kind would reproduce §7.53 in a fresh namespace. No log line may ever be selected by a date literal.

Event kinds the milestones require: the per-field load/store record (Milestone 1), `HYPOTHESIS_SIBLING_CREATED` (Milestone 4), object-resolution and `BASIS_LOST` (EA-159, carrying both last-observed fields), rejection carrying candidate and hypothesis identity, and `ARBITRATION_*` naming winner and rule (Milestone 6).

**One free corroborator exists and has never been used.** `SRJ INV` prints a per-object invalidation trace from both OB paths, gated on `SRJ_InDebugWindow`. It separates *the bound OB toggled* from *an unrelated OB switched the branch* without waiting for buffer 34, and it is the natural oracle for EA-145, for `GONE`, and for EA-163's FVG half. **EA-172 raises its value: the descending loop at OrderblockMgr 425 means the flag's last writer is the earliest-inserted invalidating object, and `SRJ INV` is the only place the losing objects appear.**

## 9.14 Working-set disposition — every identifier mapped or retired

| Build identifier | Live writes | Disposition |
|---|---|---|
| `g_state` | 9, two functions | **Split** per §6.13 |
| `g_dir` | 1 (2229) | `SCandidate.dir` |
| `g_regime` | 1 | `SMarketSnapshot.regime` + `SCandidate.regimeAtAdmission` |
| `g_sessionAtEntry` | 1 (**2232**) | **`SCandidate.tradingWindowAtAdmission`**, edge C1 |
| `g_anchorLine` | 1 (2228) | `SCandidate.poiAnchorLine` |
| `g_anchorPrice` | declaration + **1 by reference** at 2231 | `SCandidate.poiAnchorPrice`. The single by-reference case |
| `g_anchorBarTime` | 1 (2230) | `SCandidate.poiAnchorBarTime` |
| `g_divLatch` | 2 | `divergenceVerdict` + `divergenceConsumedBar` |
| `g_touchSeen` | 4 | `touchLatched`. Two writes are the zone-swap repair and its reset; both disappear |
| `g_touchBarHi` / `g_touchBarLo` | 1 each | `touchBarHigh` / `touchBarLow` |
| **`g_zoneHi` / `g_zoneLo`** | 3 each, plus zeroing at `ResetSequence` **1103/1104** | **RETIREMENT BLOCKED.** Derived from `bundle.xob` in principle. **Five EA reader functions; `TpTargetUpdateBest` (631) and `ComputeSlReference` (928/976/988) read them in control flow on the admission path. ABSENT from all 15 non-EA files, so retirement crosses no buffer interface.** Packet items 18, 19, 20 |
| `g_alertedArmed` / `g_alertedSignal` | set 2753/2950, cleared 1105/1106 | `SHypothesis`, subject to EA-161 |
| 4 × session-used flags | 1 each, in `MarkSessionUsed` | **Not migrated.** File-global, written by Phase B after commit |

**Two retirements — one of which is blocked — four non-migrations, one split, nothing invented.** Task 161's adapter loads and stores thirteen fields plus two alert latches, of which exactly one is written by reference.

**No capacity number appears anywhere in the contracts.** Capacity is set in Task 160 and justified there as an engineering safety limit in the precedent of the 500-slot walk bound — which now appears **three times inside `ComputeSlReference` alone** (EA-178), each requiring its own engineering justification wherever it is ported.

---

# 10. Task 159 Deliverable 3 — transition rules

## 10.1 The reversibility rule

An edge is **irreversible** if it writes any immutable-identity or latched-evidence field, **reversible** only if every field it writes is live mutable state or derived. Almost every edge is irreversible, and that is the intended property: it is what lets §3.4's leakage proof demonstrate a write-once field was written once.

**Retention is not reversal.** EA-112's out-of-session survival keeps a hypothesis in `HYPOTHESIS_WAITING_DIVERGENCE` across a window close. Nothing is unwritten; a terminator simply does not fire. Any implementation that reverts a field to represent waiting is reintroducing the singleton's mutability under a new name.

## 10.2 Candidate edges

| # | Edge | Trigger | Fields written | Reversible |
|---|---|---|---|---|
| C1 | → `CANDIDATE_NEW` | ruled POI retest | `candidateId`, `dir`, `poiAnchor*`, `retestBar`, `retestEvent`, `createdBar`, **`tradingWindowAtAdmission`** | no |
| C2 | → `CANDIDATE_REGIME_WAIT` | admission to regime evaluation | `state` | yes |
| C3 | → `CANDIDATE_ALIGNMENT_WAIT` | regime satisfied | `regimeAtAdmission`, `state` | no |
| C4 | → `CANDIDATE_HAS_HYPOTHESES` | first binding event (H1 fires) | `hypothesisIds`, `state` — **no new evidence** | no |
| C5 | → itself | later distinct offering | `hypothesisIds` append | no |
| C6 | → `CANDIDATE_REJECTED` | **candidate-level rule only** | `rejectionReason`, `state` | no |
| C7 | → `CANDIDATE_EXPIRED` | forgetting rule | `state` | no |
| C8 | → `CANDIDATE_COMPLETED` | ≥1 hypothesis reaches `SETUP_COMPLETE` | `state` | no |
| C9 | → `CANDIDATE_COMMITTED` | **Phase B only**: wins arbitration and passes the commit test | `state` | no |

**C1 is the sole admission latch and C4 writes no new evidence** — EA-164's consequence, council packet item 12. **C9 is the only candidate edge Phase B may drive** — a Phase A census finding a write to `CANDIDATE_COMMITTED` is a Milestone 5 failure. C7 has no evidence field, deliberately.

## 10.3 Hypothesis edges

| # | Edge | Trigger | Fields written | Reversible |
|---|---|---|---|---|
| H1 | → `BOUND` | ruled binding event, S3→S4 arming | `hypothesisId`, `candidateId`, whole `bundle`, `stopRef.legIdentity`, `stopRef.legBoundaryBarAtLatch` | no |
| H2 | → `WAITING_TOUCH` | binding complete | `state` | yes |
| H3 | → `TOUCHED` | leg touch **with** `touchBar > bundle.xob.promotionBar` | `touchLatched`, `touchBar`, `touchBarHigh`, `touchBarLow`, `state` | no |
| H4 | → `CONFIRMATION_LATCHED` | ruled confirmation event | `confirmationBar`, `confirmationClose`, `confirmationTime` | no |
| H5 | → one of the three S5 states | ruled gate entry | `state` | yes |
| H6 | `WAITING_DIVERGENCE` → `WAITING_TARGET_VALIDITY` | divergence verdict consumed | `divergenceVerdict`, `divergenceConsumedBar`, `state` | no |
| H7 | `WAITING_TARGET_VALIDITY` → `WAITING_RR` | admissible target found | whole `targetRef` | no |
| H8 | `WAITING_RR` → `SETUP_COMPLETE` | ruled RR satisfied | `stopRef.refPrice`, `refBar`, `placementRule` | no |
| H9 | any S5 state → `REJECTED` | T1, T2, T4, T5 or the RR re-test fires | `rejectionReason`, `rejectionBar`, `terminator`, `state` | no |
| H10 | `SETUP_COMPLETE` → `PENDING_ENTRY` | pending entry created | `SPendingEntry` created | no |
| H11 | **any bound state** → `BASIS_LOST` | `bundle.xob.ref.resolution == GONE` | `basisLostBar`, `state` | no |
| H12 | any pre-completion state → `CANCELLED` | A-3 §5.11 set | `cancellationReason`, `state` | no |

**H3 is R-Q11 ruling 3 and it is a guard, not a field.** Task 141's limb is this guard. **H8 is where the two-part stop latch closes** — and EA-176 means H8 must also latch `stopRef.selectionCause` or accept that it is permanently `UNKNOWN`. **H9's terminator set requires transcription** from A-3 §5.10 — see §10.5. **H11 is twelve edges collapsed into one row**, because EA-159 means any bar can return `GONE`.

## 10.4 The execution-window rule — resolved in favour of Phase B

Revision 57 said the execution-window rule becomes a guard on the edge into `HYPOTHESIS_SETUP_COMPLETE`; §5.33 and Task 164 said EA-144 becomes **Phase B's commit test**. **Resolved in favour of Phase B**, on the grounds of §15's own must-not-conflate list: *structural validity versus execution admissibility*. A guard on H8 would make structural completion **depend** on execution admissibility, so a structurally perfect setup arriving outside the window would never appear as a completion at all. That destroys Scenario H.

**H8 is unguarded by the window.** Phase B applies the test at commit and produces a decline outcome distinguishable from every rejection reason and terminator. This also vindicates dissolving Task 128.

## 10.5 The terminator attachment rule — blocked on A-3

Revision 57 stated both that *"T1–T5 become five named terminator edges out of `HYPOTHESIS_WAITING_DIVERGENCE`"* and that `ST_S5_GATE_CHECK` must split three ways. **Both cannot hold.** Resolved in favour of the measurement argument — §7.53 is a measured finding, the other is a drafting note. **Council packet item 10.**

```
For each terminator T in {T1..T5}:
  1. Identify from A-3 §5.10 the condition T tests.
  2. Attach T to exactly one of:
       HYPOTHESIS_WAITING_DIVERGENCE       divergence availability or its window
       HYPOTHESIS_WAITING_TARGET_VALIDITY  target existence or admissibility
       HYPOTHESIS_WAITING_RR               the reward-to-risk relation
       SPendingEntry, edge P6              an event after setup completion
  3. If the condition tests none of these, T is UNATTACHED and is a finding,
     not a placement.
  4. Record per T: the state, the fields H9 writes, and the literal the
     diagnostic event must carry.
```

Step 4's literal is not optional. **T3 is pre-attached**: *reached before fill* is an event after setup completion, so it attaches to `SPendingEntry` edge P6 and needs no A-3.

## 10.6 Pending-entry edges

| # | Edge | Trigger | Fields written | Reversible |
|---|---|---|---|---|
| P1 | create | H10 | `pendingId`, `hypothesisId`, `entryPrice`, `entryPriceSourceBar`, `createdBar` | no |
| P2 | no-chase evaluation | per bar | none — `noChaseBound` is derived | n/a |
| P3 | wick return observed | ruled wick-return | `wickReturnSeen` | yes |
| P4 | superseded by better R | A-3 §5.3 | **new record created**; old latches `cancellationReason` | no |
| P5 | cancelled | A-3 §5.11 | `cancellationReason` | no |
| P6 | terminated by T3 | target or stop reached before fill | `terminator` | no |
| P7 | expired | ruled expiry | `terminator` | no |
| P8 | filled | fill event | `fillBar`, `fillPrice`; ownership passes to the position manager | no |

**P8 is the two-owner boundary for the target.** Task 165 must not implement revision.

## 10.7 Phase B edges

| # | Edge | Trigger | Owner |
|---|---|---|---|
| B1 | collect completions | end of Phase A | Phase B |
| B2 | apply first valid completion across time | A-3 §5.6 | Phase B |
| B3 | resolve same-bar tie by ruled anchor tier | A-3 §5.6, then engineering determinism only below that | Phase B |
| B4 | apply execution-window commit test | EA-144, §10.4 | Phase B |
| B5 | commit: emit SIGNAL, `MarkSessionUsed` **once**, submit order, C9 | §7.77's surface | Phase B |
| B6 | cancel or retain the remainder | A-3 §5.11 | Phase B |

**B4 and B5 are ordered and the order is the gate.** A window-inadmissible winner declines at B4 and **never reaches B5**, so no session is marked and no signal emitted for a declined setup. `MarkSessionUsed` appears exactly once, replacing the two inline sites at 2964 and 3050. **Milestone 6's event is B3's output** — a bar with two completions and no `ARBITRATION_*` event is a failure regardless of the signal count.

---

# 11. Task 159 Deliverable 4 — the completed ownership table

**No cell is an anchor (P12).** Column 2 records what the source-only tasks established; every region must be re-established by the implementing Form B's predecessor Form D.

| Responsibility | Current owner | Stored in | Required future owner | Adapter |
|---|---|---|---|---|
| **per-bar entry** | **`OnTick` EA 3194–3201; `s_lastBarTime` static 3196, guard 3198** | function-static, invisible to any registry | snapshot builder's call site — **one caller, outside any loop** | **one-line wrap at 3200** |
| POI retest event | `EvaluateClosedBar` (`DetectPoiRetest` call, early return 2227) | **NOT STORED** | `SCandidate.retestBar`, `retestEvent` | no — new storage |
| regime classification | cascade region | `g_regime`, 1 write | snapshot + `regimeAtAdmission` | yes, 161–162 |
| LTF alignment | cascade region | **NOT STORED as evidence** | derived in Phase A | yes, 161–162 |
| structural bundle | 2734/2735 **and** 2803/2804 (guard **2786 `ZoneAdoptable`, unread**) | `g_zoneHi`, `g_zoneLo` | `SHypothesis.bundle`, immutable; **globals retired only after items 18–20** | yes, 161 only |
| XOB identity | read 2273/2274, printed 2276, **discarded** | **NOT STORED** | `SObjectRef` in `SXobRecord` | no — new storage |
| FVG identity | same | **NOT STORED** | `SObjectRef` in `SFvgRecord` | no — new storage |
| opposing-FVG evidence | `SRJ_FVG_CreationRenewalPass` 108–348 (writes 199/226/316/343) and `SRJ_Bias_DecisionBlock` 149–371 (clears 228/282) | `g_s.hasPersistedOpposingFVG` | `SFvgRecord.validityForBundle`; **never a copied global** | yes, 163 |
| touch | `FindLegTouch` + cascade | `g_touchSeen`, `g_touchBarHi`, `g_touchBarLo` | `SHypothesis` touch fields; admissibility derived per H3 | yes, 161–162 |
| confirmation | recomputed per bar via `iClose(barShift)`; **same value as `slCurPx` EA 869** | **NOT STORED** | `confirmationBar/Close/Time`, latched | no — new storage |
| divergence | `UpdateDivergenceLatch`, downstream of an abort's `return` | `g_divLatch` | `divergenceVerdict` + `divergenceConsumedBar`, Phase A per hypothesis | yes, 161–162 |
| **stop reference** | **`ComputeSlReference` EA 801–1069, called 1949 and 2899** | **NOT STORED** — two by-ref outputs into caller locals | `SStopReference`, two-part latch H1/H8 | no — new storage |
| **stop selection rule** | **`ComputeSlReference`: 1-swing branch 879, 2-swing `else` 1041; side guard 915–958; zone guard 976–1015; three 500-slot walks** | — | `placementRule` (two values), `selectionCause` (**six exits, one bool**), `zoneDependent` | **EA-176/177/178, packet items 19, 20** |
| target reference | `ComputeNearestTpTarget` 659–775 into a caller local | **NOT STORED** | `STargetReference` at admission; **position manager after fill** | no — new storage |
| **target admission rule** | **`TpTargetUpdateBest` EA 614–635; exits 617/619/631; tie strict `<` 633** | — | `STargetReference` fields; **`zoneDependent` required** | **EA-171, packet items 15, 18** |
| target selection filters | 702 mask for the session group; 708 anchor tier for the POI group | — | one stated rule per group, or a ruled asymmetry | **EA-168, Scenario G input, item 16** |
| pending entry | none | **NOT STORED** | `SPendingEntry`, Task 165 | no — new storage |
| session throttle | `MarkSessionUsed`, 2 call sites; consulted 2210 | 4 file-globals | **stays file-global**, Phase B at B5 | no |
| signal emission | `EmitAlert(…, true)` 2951 + `LogSignal` | `g_alertedSignal` | Phase B at B5; emitter takes the hypothesis | yes, 164 |
| **indicator-side alert dispatch** | **`SRJ_Alerts_DispatchBiasRenewal`, FlowLogic 880 — UNREAD** | — | **UNKNOWN.** If it emits, EA-161's surface is not EA-only | **open item 18** |
| order execution | `g_trade.Buy` 3017 / `Sell` 3019 | — | Phase B at B5, then Task 166 | no |
| exit management | none | **NOT STORED** | Task 166 | no |
| object construction identity | `SRJ_createImbalance` (ImbalanceMgr 117, 234), `NewOrderblock` | `objId`, `SRJ_NextObjId()` | unchanged; consumed via `SObjectRef` | no |
| **object lifetime / resolution** | `SRJ_OB_PruningPass` 1072–1102, `SRJ_FVG_PruningPass` 495–530, called 888/889 intrabar. **Inventory may be incomplete: FlowLogic 862, 864 unread** | array membership only | `SObjectRef.resolution`; `GONE` drives H11 | no — new (EA-159) |
| retention decision | `SRJ_OBOverCap` / `SRJ_FVGOverCap`, `SRJ_Draw.mqh` 240–285 | invalidation recency (OB) vs array position (FVG) | not migrated; consumed as `GONE` | no — EA-163, EA-166 |
| retention configuration | FlowLogic 358/379/380 ← `in*` | three globals | **EA-unreadable.** Either exported in 163 or every `BASIS_LOST` figure carries a caveat | **§17.29** |
| promotion event | `SRJ_ApplyPromotion` + 858/913 | `isPromoted`, `promotionBar`, buffer 33 | `SXobRecord`, immutable | no |
| promotion evidence | `countOpposingInvalidationsSinceActivation` over pruned global history | invalidation-bar history arrays | **UNKNOWN — permanently non-attributable** (EA-160, P15) | n/a |
| activation event | three sites, `isActivated` + `validationBar` together | `COrderblock`, `CHTF_Orderblock` | `SXobRecord.activationBar` | no |
| **OB validity flag** | **five writing functions.** `SRJ_OB_ReplayActivationInvalidation` 89–195 writes 171/173 (`ob` is a **parameter**); `SRJ_OB_ActivationInvalidationPass` 413–571 writes 535/537 **inside a descending `for` at 425** | `g_s.tickOBIsValid` | **excluded by name.** Buffer 34 exports the winning object's identity, and must name `discoveryBar` for replay writes | **EA-172, stage 2** |
| **FVG validity flag** | `SRJ_FVG_TickValidRecomputePass` 380–417: 390 at region level, 415 inside `393 {if}` | `g_s.tickFVGIsValid` | **excluded by name** — describes a selection | **stage 3, scope open** |
| promotion target selection | `SRJ_StrictNearestOBIndex` 691–729 | largest `startBar`, tie by larger `validationBar`; requires `isValid && isActivated` | FlowLogic, **after Task 166**. **EA-157 is two defects** | n/a |
| pending promotion | queue + `SRJ_OB_DeferredPromotionPass` 993–1016 | two-slot `pendingPromote*` group | FlowLogic, after Task 166 | n/a |
| structural leg boundary | `SRJ_Bias_*` → `g_s.structLegBoundary` | `int` in `SState`, rolls back intrabar | `legBoundaryBarAtLatch` **or UNKNOWN** | yes, 163 |
| session-live marking | FlowLogic 1103–1107 | buffer 29 bits 10–13 | `sweptMask` + `sessionLiveId` | no |
| trading-window classification | `CurrentTradingWindow` 379–401, called once at 1365 | local `sess`; latched at 2232 | `SMarketSnapshot.tradingWindow` + `SCandidate.tradingWindowAtAdmission` | yes, 161–162 |
| **closed-bar fact** | **three definitions: FlowLogic 847, HTFEngine 107, EA 3198 (function-static)** | none crosses to the EA | `SMarketSnapshot.barClosed`, **invariant-true by construction** | **no — EA-170, EA-173** |
| execution-window admissibility | **nowhere** | — | Phase B at B4 | no — new |
| arbitration | **nowhere** — the singleton cannot tie | — | Phase B at B2/B3 | no — new |
| alert latches | 2753/2950 set, 1105/1106 cleared | two globals | `SHypothesis`, subject to EA-161 | yes, 164 |
| working-set reset | `ResetSequence` 1090–1107, **four call sites: 1135, 2968, 3054, 3120** | all 13 globals + zone + latches | record creation and terminal states; **no wholesale reset** | yes, 161 — EA-153 |
| state ordering | eight inequality comparison sites | `g_state`'s ordinal value | membership/ownership tests on two objects | yes, 162 and 164 |

**Six rows read `NOT STORED`, two read permanently `UNKNOWN`, four regions are unread.** The six are the contracts' reason to exist: **the model is not correcting misclassified fields, it is creating storage that never existed.** The unread four are FlowLogic 862, 864, 866 and 880, plus `ZoneAdoptable` on the EA side — all in the live task.

## 11.7 Council review packet — twenty items

| # | Item | Why it needs review |
|---|---|---|
| 1 | **Scenario B's criterion restated** as a bar-index relation against `legBoundaryBarAtLatch` as it stood at binding | Weaker than the original wording and the strongest form the source supports (EA-155) |
| 2 | **`SStopReference` splits its write point** — leg identity at H1, price at H8 | R-Q11 ruling 4 makes the stop leg an input to touch admissibility. **Superseded in scope by item 19** |
| 3 | **`HYPOTHESIS_BASIS_LOST`** as a terminal state with no strategy meaning | **Approvable as drafted.** Every delete path is capacity-driven |
| 4 | **EA-161's resolution** — HEADS-UP and STAND-DOWN become diagnostic events, SIGNAL moves to Phase B, emitter takes the hypothesis | An unarbitrated hypothesis announcing itself from inside Phase A is a commitment in substance. **Incomplete until FlowLogic 880 is read** |
| 5 | **Better-R creates a replacement pending entry** rather than mutating latched evidence | The alternative reintroduces EA-142 inside its own repair |
| 6 | **The execution-window rule is Phase B's commit test, not a guard on H8** | Scenario H requires completion-then-decline (§10.4) |
| 7 | **`HYPOTHESIS_UNBOUND` retired unimplemented**; S1/S2/S3 candidate, S4 the first hypothesis state | The bundle holds `bindingBar` |
| 8 | **The third operator question dissolves** — rejection is per-hypothesis | Derived from the model; no operator attention spent |
| 9 | **`ST_IDLE` and `ST_ABORT` retire**, and the **eight ordinal comparison sites** must each be re-expressed | EA-162. A mechanical port compiles and is wrong |
| 10 | **T1–T5 distribute across the three split S5 states** | A measured finding (§7.53) outranks a drafting note |
| 11 | **`GONE` must carry the last observed state**, `lastFilledObserved` beside `lastValidObserved` | **Narrowed to the FVG path.** The OB half is withdrawn |
| 12 | **`tradingWindowAtAdmission`** — moved from edge C4 to C1, three-member domain distinct from `levelSessionId`'s five | EA-164 + EA-165. The claims needing a ruling: **binding writes no candidate evidence**, and a window and a session must never be compared |
| 13 | **FVG retention ranks by array position**, so FVG-path `GONE` chronology is `UNKNOWN` under P15 | Decides whether Task 163 must establish array ordering or state the bound and stop. Ordering is closed — append-only, nothing reorders — but *chronological* insertion is not established, and the same-pass decrement is an explicitly unconfirmed planner hypothesis (§17.33) |
| 14 | **Task 161's whole-extraction claim is established** — 21 bare returns, none inside any of eleven loops, zero `goto`, all jump statements loop-local, two independent computations, zero disagreement, **and the call site now read: one caller, `OnTick` 3200, outside any loop** | Changed from a warning to a result. Both halves of the extraction argument are met for the first time. Nothing to rule; recorded so the council can see the sequencing argument no longer rests on an assumption |
| 15 | **`NO_TP_TARGET`'s cause set is five, not two** — mask (702), tier (708), non-positive/empty (617), direction (619), zone containment (631) | EA-167 + EA-171. Two additive counters no longer cover it, and two of the five live in a different function from the other three, so any instrument spans both. Either a stated permanent bound or an instrument whose arity matches the causes |
| 16 | **The POI group is not mask-filtered and the session group is not tier-filtered** | A target-selection mechanism, so a **Scenario G input**. The comment at 670 asserts deliberateness and may not be used as classification |
| 17 | **The pre-arm / post-arm asymmetry** — target and stop admissibility both change at the S3→S4 transition because the zone operands are zero before it, and Task 142's permitted site sits inside a guard that spans the change | EA-171 + EA-174. One abort reason covering two rules is either a defect or the intent. A Part A reading; the source comments at 629–630 and 973–975 assert deliberateness and §3.5 forbids classifying from them |
| 18 | **May target admission depend on the hypothesis's zone?** `TpTargetUpdateBest` 631 excludes any candidate contained in `[g_zoneLo, g_zoneHi]` | If yes, `STargetReference` is a function of the hypothesis and §5.35's two-owner split needs restating. If no, 631 is a defect and Task 162 must remove rather than port it. **Either answer changes a contract; the drafted contract assumed neither** |
| 19 | **May the stop reference depend on the live zone, and is `selectionCause` recoverable?** `ComputeSlReference` reads the zone in control flow at 928, 976, 988, and collapses **six `false` exits covering at least six causes** into one bool that its S5 caller turns into one abort reason | EA-174, EA-176. Supersedes packet item 2 in scope: the write-point split is the smaller half. R-Q11 ruling 4 makes this leg an input to touch admissibility, so an unrecoverable selection cause bounds what Task 141 can ever demonstrate |
| 20 | **`ComputeSlReference`'s branch asymmetry** — the Task 75 side guard (915–958) and the Task 67 zone guard (976–1015) both live inside the 1-swing branch. The 2-swing branch at 1041–1066 applies **neither** | EA-176. A stop reference selected on the 2-swing path can sit inside the adopted zone or on the wrong side of the entry reference, and the two guards that exist to prevent exactly that do not run. A defect-or-intent reading, not a contract field |

**Items 3, 8 and 14 are approvable or informational.** Items 1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20 need a ruling. Item 15 needs a choice. **Item 4 cannot be closed until FlowLogic 880 is read** — Block C of the live task.

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

## 12.2 What this task decides

**Block A is the round's central deliverable and it is a repair, not an extension.** Export stage 1's Form B has one unanswered question: which object does the flag write attribute to. 160-PreH asked it under a rule that tested a variable's declaration line against brace *opening* lines only, never against `D < S` and never against a *closing* line, and the result exhibited both errors at once — three variables accepted whose declarations lie 35, 54 and 59 lines *after* the statement, and the one variable that was unambiguously live rejected. Amendment 14 replaces the test with `D < S`, containment in `[Dopen, Dclose]`, and stack membership, each reported separately with its numbers so a wrong answer cannot be self-consistent again. **The item also enumerates pointer parameters, because a region whose only object is in its signature returned "no construction" and that answer would have gone into a Form B as a design fact.**

The seven regions are named deliberately. Three of them — `SRJ_Bias_DecisionBlock`, `SRJ_Bias_PerBarResetPass` and `SRJ_StateInit` — are expected to return `NO OBJECT IN SCOPE AT THIS STATEMENT`, and **that is why amendment 14 makes it a legal answer rather than a failure.** A pass that clears a flag on a bias flip has no object to name, and the correct buffer value there is a sentinel. Asking the question and receiving a clean negative is what separates a sentinel justified from source from a zero someone chose.

**Block B settles export stage 3's shape.** Buffer 35 exports a *selection*, and its region carries two writes with different structure: one at region level and one inside an `if`. If the region-level write precedes every pointer declaration in the function, then **no object can be attributed to it at all**, and stage 3 must either export a sentinel for that write or be scoped to the conditional write only. B3 asks the question with its own selection rule stated in the item text, and B4 establishes the walk direction from the header's clauses rather than from a description — which matters because EA-172 established that a descending walk makes the last writer the earliest-inserted object and this walk is not that one.

**Block C closes packet item 4 and may reopen P16's justification.** `SRJ_Alerts_DispatchBiasRenewal` sits at FlowLogic 880, inside the per-bar sequence, with an emission-shaped name, and has never been read. If it calls `Alert(` or `SendNotification(`, then EA-161's emission surface is not EA-only, the proposed resolution — HEADS-UP and STAND-DOWN become diagnostic events, SIGNAL moves to Phase B — is incomplete, and the council would be ruling on a surface that is missing a member. **C5's sixteen-file census settles it for the whole tree in one item rather than one file at a time**, and it covers `PlaySound(`, `SendMail(` and `SendFTP(` because an emission surface defined as two function names is a surface defined by what somebody remembered.

`SRJ_OB_InactiveLinePrunePass` (862) and `SRJ_OB_OpposingCachePass` (864) both run between the invalidation pass and the FVG passes and both have object-touching names. **If either calls `.Delete(` on `g_orderblocks`, EA-159's delete-path inventory is incomplete** — the record currently names two pruning passes and states that every delete path is capacity-driven, and that statement gates `HYPOTHESIS_BASIS_LOST`'s non-attributable design and Task 162's single design. A third delete path with a different criterion would change both. `SRJ_Bias_WeakFlipLatchPass` (866) runs immediately before FVG creation and has a latch name, so it is a candidate writer of state the FVG passes read.

**Block D reads the guard on the second binding site.** `ZoneAdoptable` is called at EA 2786 and is the gate on EA-150's zone replacement — the write Task 162 deletes and converts into a sibling-creation event. Converting a site whose guard has never been read means the sibling event fires under conditions nobody has stated. D3 asks whether the guard reads the zone globals itself, which would make it a fourth zone reader and widen §17.35 again, and whether it reads `g_touchSeen`, which would tie it to the touch revalidation at 2808–2811 that Task 162 deletes with it. D5 checks `ZoneInPlay` because EA-132 is a latent item pointed at both names and the record has never established that the second one exists.

## 12.3 What this task does not do

It reads no promotion-queue write path, does not touch `SRJ_promotionReconcile`, does not census the eight ordinal comparison sites, does not read `g_defLondon` (open item 12 is a council reading, not a census), does not compose `SRJ_FVGOverCap` with `SRJ_FVG_PruningPass` (open item 13 is a free rider behind Task 163), and does not read the six FlowLogic draw and panel passes at 882–885 beyond what C6 reports as a call. It asks no question whose answer lives outside a region it requests. **Nothing in it can change the fact that Task 160 is additive and inert.**

## 12.4 Export stages 154–156 — released, and what they must carry

**Block H's release condition is met and the buffer arithmetic is now confirmed.** Task 158 Block H and CorrectionA Block B together establish that exactly two of eighteen types carry `objId`, each has one construction region, each assigns `objId = SRJ_NextObjId()` inside it, no type with the field has zero construction regions, and no construction region omits the assignment. A buffer exporting `objId` is not blind to its population.

**And EA-175's amendment supplies the fact §12.4 needed and never had.** FlowLogic declares `indicator_buffers 34` and makes 34 `SetIndexBuffer` calls at indices 0–33 contiguously, all inside FlowLogic `OnInit`. **Indices 34, 35 and 36 are genuinely free and the post-append count of 37 is arithmetically confirmed.** The EA's 31 `FL_BUF_*` constants omit three buffers for three different reasons — 0 and 1 are `INDICATOR_DATA` plot arrays consumed by `SRJ_Fractals.mqh` by array name, and 28 is an `INDICATOR_CALCULATIONS` buffer written and read inside FlowLogic. None of the three is a defect and the dead-export claim is withdrawn.

Stages 1–3 are **issuable at any time**, byte-identity-gated, 25 minutes each, and independent of the migration's sequence. Their purpose is **transitional provenance instrumentation** — a bridge that makes flag provenance readable while the architecture is built. Not the candidate architecture and not a step toward it.

- The compile gate **inverts** — stages 1–3 compile FlowLogic by design, so the EA `.mq5` becomes the control file. EA-131's invariant ends at stage 1 and is re-recorded per stage.
- P10 and P11 apply with more force than on any prior task: three stages compile a file that has never been compiled in this project's recorded history, and Task 126 destroyed a control by opening it in the editor.
- P5a governs the `SState` field. P3a governs the buffer append. Every `= true` reset must clear its companion id.
- **Buffer 34 must export the winning object's identity, and must name `discoveryBar` for replay-path writes** (EA-172). A pass name is not sufficient: five functions write `tickOBIsValid`, one of them replays a past bar, and one of them writes inside a descending loop where the last writer is the earliest-inserted invalidating object. **That is intra-pass masking by array order, structurally distinct from EA-152's cross-pass last-writer-wins**, and only an identity can separate them.
- **Buffer 35 carries a selection, not an event**, and Block B decides whether its region-level write can name an object at all.
- **Buffer 36's inputs are established and its attribution is Block A's.** The four assignment lines, their RHS, their brace stacks, the six candidate variables with their declaration lines and RHS, and the per-variable use traces all survive 160-PreH. Only the verdict was void.
- **Each buffer's comment must state that it names a flag-setter population**, that this may differ from any candidate's bound object, and that the buffer is a bridge pending the candidate registry. Without that a future reader finds three identity buffers and concludes the provenance problem was solved. P13 applies.
- **No buffer may pair a flag with an identity without recording that the two have different rollback semantics** (EA-159) — the flag rolls back with `g_s`, the object does not.
- **Where Block A returns `NO OBJECT IN SCOPE AT THIS STATEMENT`, the buffer value is a sentinel and its meaning must be stated in source** as "reset by bias flip, no object" or its equivalent. A sentinel justified from a census is a design decision; an unexplained zero is a defect waiting to be read as one.

**Stage 4 is dissolved into Task 163**, where it becomes the object-addressable interface a bound hypothesis queries.

## 12.5 Tasks 160 through 166 — shapes

Each stage has one responsibility, one gate, and an explicit statement of what it does not do. Each becomes a Form B after its predecessor returns.

### Task 160 — the architecture shell. Inert.

Adds: candidate registry array, hypothesis registry array, event recorder, per-bar snapshot builder, lifecycle enums, capacity constants, iteration helpers. **On the EA side** — `g_sSnapshot` has zero occurrences in the EA, so EA-side records are insulated from the intrabar restore.

**Adds no behaviour.** The singleton remains the active decision path. The snapshot is built and not consumed. The registries are allocated and empty.

**Gate: Tier 1 byte-identical on all eight counters and the signal line.** Any delta is `BLOCKED` — an additive edit that changes behaviour has a bug, not a finding.

**Does not:** bind anything, evaluate anything, read anything on a decision path, replace any global, or name the singleton a candidate registry (P13).

**Capacity justification, required in source:** the initial capacity constant is an engineering safety limit in the precedent of the 500-slot walk bound — which appears **three times inside `ComputeSlReference` alone** (EA-178), each requiring its own justification wherever it is ported. Never a strategy statement.

**`SMarketSnapshot.barClosed` is invariant-true by construction and the invariant must be stated in source** (EA-170, EA-173). It may not be presented as an audit of a fact the EA cannot read.

**The source half of Task 160's gate is met.** `OnTick` 3194–3201 is the single entry point, 3200 the single call site, outside any loop, and the append regions were re-established in 160-PreF. **The remaining gate is the council's.**

### Task 161 — the legacy cascade adapter. Milestone 1.

```
EvaluateLegacyHypothesis(hypothesis, snapshot)
    LoadWorkingSet(hypothesis)      // writes the 13 globals + 2 alert latches
    HypothesisCascade(barShift)     // existing body, ZERO return-site edits
    StoreWorkingSet(hypothesis)     // reads them back
```

**The extraction is whole, not split.** Splitting into prologue, cascade and epilogue without an ownership map preserves every leak while making it harder to see (EA-148).

**Both halves of the extraction argument are now established.** The body: 21 return statements, all bare, none inside any of eleven `for` loops, no `while`/`switch`/`do`, zero `goto`, 20 jump statements all loop-local, computed two independent ways with zero disagreement. The call site: **one caller, `OnTick` 3200, `NO-LOOP-OR-SWITCH-IN-STACK`, `NOT ENCLOSED`, arguments `1, currentBarTime`.** So the adapter is a **one-line wrap** and §12.4's favourable branch is taken.

**EA-153 is a design constraint, not a detail.** `GoAbort` logs, emits STAND-DOWN and calls `ResetSequence`, and there are fifteen abort sites inside the cascade. `ResetSequence` is 1090–1107 with **four** call sites — 1135, 2968, 3054 and 3120 inside `OnInit`. A naive adapter stores a **post-reset** working set on every abort path, so Milestone 1's restored-equals-saved assertion would pass while recording nothing. **The terminal state must be captured at the abort; `StoreWorkingSet` cannot be the only recorder.**

**Requires:** per-field load/store logging — every field loaded, every field stored, both values — plus a restored-equals-saved assertion on every non-owning path. Exactly one field is written by reference (`g_anchorPrice` via `ReadBuf1` at 2231), and the load/store set must cover it.

**Gate:** Tier 1 byte-identical, **plus** a leakage log showing zero unexplained field divergence. Capacity stays 1 (P14). **The log is the real gate and byte-identity is the safety net** — if the record is not produced the task is PARTIAL regardless of how clean the regression looks.

**Does not:** enable concurrency, change binding, or move any side effect out.

### Task 162 — candidate-owned binding. Milestones 2, 3, 4.

Moves from *global selector → global zone* to *hypothesis → immutable structural bundle*, **at capacity 1**. Binds object identities at the ruled binding event. Re-reads by identity every bar. Creates a **sibling** when a different offering appears, logged with both identities. Records invalidation, touch, confirmation and divergence against the owning hypothesis.

**Converts both binding sites** — 2734/2735 and 2803/2804 — and fires `HYPOTHESIS_SIBLING_CREATED` at both (EA-150). Deletes the touch revalidation at 2808–2811 with the second site. **The second site's guard is `ZoneAdoptable` at 2786, 51 lines, read for the first time in Block D of the live task.**

**Absorbs four dissolved items.** EA-112's out-of-session survival becomes `HYPOTHESIS_WAITING_DIVERGENCE` persisting across the window close. EA-143's divergence repair follows from the latch running inside a per-hypothesis evaluation. EA-49's three zone-read sites gain something to consolidate onto. **EA-162's eight ordinal comparison sites are re-expressed here or in 164**, each with a responsibility statement.

**One design for `GONE`, not two.** Open item 3 is closed and every delete path currently known is capacity-driven, so `GONE` handling has a single shape. **It must still log `lastValidObserved` and `lastFilledObserved`** — the OB path's ordering is known, but the FVG path can delete in the fill pass (EA-163). **Block C may add a third delete path**, and if it does this paragraph is re-derived rather than carried.

**The zone retirement is now the riskiest single change in this task and it is BLOCKED on three council items.** `TpTargetUpdateBest` reads `g_zoneHi`/`g_zoneLo` in control flow at 631; `ComputeSlReference` reads them in control flow at 928, 976 and 988. Both are on the admission path, both are inert before arming and live after, and **a mechanical retirement would compile and silently move every target and every stop** (EA-171, EA-174). Retirement requires packet items 18, 19 and 20 ruled. The globals are `ABSENT` from all fifteen non-EA files, so retirement crosses no buffer interface — the risk is entirely inside the EA and entirely about which component supplies the zone to two functions that currently read it as ambient.

**Gate:** admission-changing, so **direction stated, magnitude not predicted** (EA-133). Expected direction: the 08.03 17:05 substitution becomes a logged sibling rather than a silent replacement, and every documented `IDCHANGE` during `S3_ZONE_WAIT` produces a sibling event.

**Does not:** enable concurrency, arbitrate, latch the stop price or the target, or implement the execution-window gate.

**Tasks 141 and 142 re-enter after this task**, because this is where their denominator settles.

### Task 163 — provenance completion.

Completes the object-addressable interface: OB invalidation setter identity, FVG selection identity, opposing-FVG setter identity, structural-leg association as a **bar-index relation** (EA-155), object-specific validity lookup, and the `RESOLVED`/`GONE`/`UNKNOWN` resolution outcome (EA-159).

**Consumes export stages 1–3 as the transitional interface** and absorbs stage 4's EA-side read. Where source cannot establish parentage or leg membership, the field is `UNKNOWN` and the diagnostic says so (P15).

**Three obligations from this arc.** An **invalidation event record**, not only a flag, because `SRJ INV` is the available oracle and the flag alone cannot separate the bound OB toggling from an unrelated OB switching the branch — and EA-172 raises the value of that record, because the descending loop at OrderblockMgr 425 means the flag's last writer is the *earliest-inserted* invalidating object and `SRJ INV` is the only place the losing objects appear. A decision on the **retention configuration crossing the buffer interface**: either `g_keepInvalidatedCount`, `g_keepInvalidatedFVGCount` and `g_deleteFVGAfterFill` are exported so the EA can record them beside a `BASIS_LOST` count, or every such count carries a stated caveat (§17.29). And, new this arc, a **`GONE` cause taxonomy that survives Block C** — if either FlowLogic 862 or 864 deletes from `g_orderblocks`, the delete-path inventory is incomplete, "every delete path is capacity-driven" is no longer established, and both `HYPOTHESIS_BASIS_LOST`'s non-attributable design and Task 162's single-design claim are re-derived rather than carried.

**Gate:** Scenario B's **restated** criterion becomes measurable for the first time — an adverse `objId` whose `startBar` falls at or after the bundle's `legBoundaryBarAtLatch` as that boundary stood at binding (packet item 1). A disagreement between flag-setter identity and bound identity is a **positive** result. A zero is the failure mode, and Block H is what rules it out in advance.

**Tasks 129 and 130 re-enter after this task.** Task 129 is EA-156, three links not one, and its second limb is open item 4. Open item 13 rides here as a free rider.

### Task 164 — Phase A / Phase B. Milestones 5, 6. Concurrency enabled.

Phase A evaluates every live hypothesis against one snapshot and commits nothing. Phase B collects completions, applies first valid completion across time, resolves same-bar ties by the ruled anchor tier, applies **EA-144's execution-window test as the commit gate**, selects one winner, emits SIGNAL, marks the session once, submits, and cancels or retains the remainder. Removal is deferred until iteration completes. The four session globals stay file-global.

**Concurrency is enabled here and only here**, after Milestone 1's isolation proof (P14).

**Gate:** Milestone 5 — no signal, no session mark, no order originates in Phase A, proven by a census of Phase A's region against §7.77's six-line surface. Milestone 6 — every multi-completion bar carries an `ARBITRATION_*` event set naming the winner and the rule applied.

**EA-161's resolution applies, with one scope caveat.** HEADS-UP and STAND-DOWN become diagnostic events and lose their emission path; the emitter takes the hypothesis as an argument rather than reading `g_dir`, `g_sessionAtEntry` and `AnchorStr()`. **The caveat: the emission surface is established EA-only and has never been censused across the tree.** `SRJ_Alerts_DispatchBiasRenewal` sits inside FlowLogic's per-bar sequence at 880 with an emission-shaped name. Block C of the live task settles it, and until it returns *"`Alert(` and `SendNotification(` occur only inside `EmitAlert`"* carries **in the EA** as a standing qualifier.

**EA-162's eight ordinal sites land here or in 162**, each re-expressed as a membership or ownership test with a responsibility statement. Three of them span the S3/S4 boundary, which is exactly the binding point, so a candidate-side and a hypothesis-side state cannot both satisfy one inequality.

**Expected direction:** the nine same-direction suppressions of §7.59 become concurrent evaluations. Three of them inverted the anchor hierarchy, and A-3 §5.6 rules that first *valid completion* governs — so those three are recoveries. **Magnitude not predicted.**

### Task 165 — pending-entry lifecycle. **Blocked on documents.**

Implements A-3 §5.3 and A-4 §5.30 layer 7: latched confirmation price, divergence completion, no-chase dominance, wick-return, better-R **replacement record**, cancellation per §5.11, fill diagnostics. **Builds T3.** **Repairs EA-142 and EA-145.** Task 131's union-extreme export rides here.

**Blocked, not deferred.** Requires **Revision 56 §5** and **Part A v4.2 §3.7**. Without §5.10 the terminator set cannot be attached to the split S5 states; without §3.7 `confluenceLatches` has no constituent set and no placeholder may stand in for it.

**Latches the admission target only.** R-Q12 parts 2 and 3 are Task 166's, and EA-177 sharpens why the confirmation latch matters here rather than later: `slCurPx` at EA 869 is `iClose(barShift)`, it is the operand of `obSwingSideOk`, of `t75_sideOk` and of the walk's side test, and it is the same close EA-142 records as recomputed per bar rather than latched. **One unlatched value drives three stop-side tests and the entry price.**

**Gate:** every R figure emitted after this task is computed from latched references. **This is the task after which the R prohibition (§17.14) lifts** — and it now has three legs to clear, not two, because admission R at the S2 poll is computed from a stop *and* a target both filtered by a rule that is inert before arming and live after.

**Does not:** implement post-fill target revision.

### Task 166 — position and exit engine.

Order submission, fill handling, stop and target management, exit policy, **and post-fill target revision** — revise to the entry session's extreme once that session has closed, and revise to a nearer valid target. Separated from admission and validated separately.

**Not started until admission correctness is established**, meaning Milestones 1–6 pass and at least two scenarios reproduce structurally.

**Three defect groups sit behind it.** **EA-157 is two defects**, so its repair is larger than retaining a slot: `SRJ_StrictNearestOBIndex` 706 requires `isActivated`, so nothing can enter the queue for an unactivated target, and the deferred pass clears the slot unconditionally. **EA-158** is the two-slot queue with two inconsistent collision rules. And **EA-176's branch asymmetry** — the Task 75 side guard and the Task 67 zone guard live inside the 1-swing branch only, so a stop reference selected on the 2-swing path can sit inside the adopted zone or on the wrong side of the entry reference — is an admission defect discovered late, and if the council rules it a defect at packet item 20 it is repaired here rather than in 162, because it is a selection rule inside a function Task 162 does not own.

## 12.6 SUPERSEDED — Task 153 Blocks B, C, D

Blocks B, C and D were held through Revisions 57–59 as the predecessor Form D for export stage 1. **They are now superseded, not held.** Tasks 160-PreG and 160-PreH covered their ground and covered it better:

| Held block | Superseded by | Why the replacement is stronger |
|---|---|---|
| B — FlowLogic's flag-export region, six append anchors | 160-PreG Blocks A and C | The buffer interface was established from all 34 `SetIndexBuffer` calls with their indices and their enclosing region, plus the `#property` count and the EA's 31 constants, so **34/35/36 free and 37 final is arithmetic rather than assumption** |
| C — buffer 36's set and clear sites verbatim, object-in-scope proof | 160-PreG Block B, corrected by 160-PreJ Block A | Block C's fixed ±14-line window could not reach a declaration 109 lines above its setter. The replacement bounds the **enclosing region by brace counting**, so a declaration anywhere in the function is inside the paste by construction. **The failure mode was removed structurally rather than by guessing a larger number** |
| D — collision census | 160-PreG Block C (C2) plus 160-PreJ Block A (A3) | Per-flag writer counts by enclosing function, across all sixteen files, with every write's brace stack |

**Two things must not be lost with them.** Block A's census pattern was `new COrderblock` / `new CImbalance` while the assignment lives in factory functions named `NewOrderblock` / `NewImbalance` — Task 158 Block H closed that question for all eighteen types, so the pattern defect is closed rather than carried. And Block C's paste-window limitation is now **defect 75's sibling in the evidence layer**: a fixed context window is an anchor in disguise, and the brace-counted enclosing region is the general repair. Both are recorded in `07_ARCHIVE\SupersededTasks\` as text.

---

# 13. Acceptance — milestones before scenarios

**The scenario set A through H is retained exactly as Revision 56 §9 defines it**, including Scenario B's tightened criterion (now restated per packet item 1), Scenario C's identification as purely EA-139, Scenario D's single blocker, Scenario F's feed-divergence control, Scenario G's target-selection fixture and Scenario H's execution-window negative.

**Scenario G has gained three inputs across two arcs and none was known when the fixture was written.** EA-168 — the POI group is not mask-filtered and the session group is not tier-filtered, so a POI line can win on a bar where its session-level competitors were excluded. EA-167 — the selection cause is not recoverable from `NO_TP_TARGET`. And EA-171 — the tie rule is a strict `<` at EA 633, so an exact distance tie goes to whichever group iterates first, and admission excludes any candidate contained in the adopted zone. **Scenario G cannot be scored as a target-selection agreement or disagreement until packet items 15, 16, 17 and 18 are ruled.**

**Scenario H gained one.** EA-176 means a completion can carry a stop reference selected by a branch that applied neither the side guard nor the zone guard, so a structurally-complete-then-declined outcome may be structurally complete on a reference the guards would have rejected. That does not change Scenario H's purpose; it changes what a pass means.

**Scenarios are not the next thing measured.** Structural agreement has been 0 of 12 for eight revisions and the cause is representational. Seven structural milestones come first, each measurable at Tier 1 or Tier 2.

| # | Milestone | Passes when | Task |
|---|---|---|---|
| **1** | **State isolation** | A hypothesis can be evaluated without changing another's state. Proven by a per-field load/store log, **not by a signal count** | 161 |
| **2** | **Identity preservation** | A hypothesis retains its XOB, FVG and bundle identity across later bars, and a re-read is by identity rather than re-selection | 162 |
| **3** | **Evidence ownership** | Every touch, confirmation, divergence, invalidation, stop and target fact is attributable to the hypothesis that owns it | 162, 163 |
| **4** | **Sibling preservation** | A later structural object produces a logged sibling rather than replacing the first hypothesis, at **both** binding sites | 162 |
| **5** | **Phase separation** | Evaluation produces decisions and commits nothing — no signal, no session usage, no order | 164 |
| **6** | **Deterministic arbitration** | Multiple completed hypotheses resolve by explicit rules: first completion across time, ruled anchor tier same-bar, engineering determinism only below that | 164 |
| **7** | **Scenario reproduction** | **Only now** are A, B, C, D, G and H scored | after 164 |

**Milestones 1 through 4 are cheap and byte-adjacent.** Milestone 1's edit is inert at Tier 1 plus a log, and its structural claim is now established at both ends — 21 bare returns none inside a loop, and one call site outside any loop. Milestone 2's edit changes which object a candidate is bound to only in cases the record already documents as substitutions. That is the opposite of the last sixty tasks, where every measurement moved a denominator.

**Milestone 5 is the one that pays for the rest.** Once evaluation commits nothing, an admission-changing edit can be measured against a stable denominator and EA-133 stops being a blanket caveat. **Tasks 141 and 142 become cheap after Milestone 5 and are expensive before it** — that is the whole sequencing argument.

**Milestone 2's `GONE` gate, from EA-159 and EA-163.** Identity preservation must include a `GONE` case: at least one logged resolution failure with `basisLostBar` latched **and both last-observed fields present**, or a stated zero population. A zero is a result. An unhandled `GONE` is a Milestone 2 failure even if identity is otherwise preserved, because it means the re-read has no failure path. **An FVG-path `GONE` without `lastFilledObserved` is also a failure**, because EA-163's surviving half makes the fill event unrecoverable without it.

**Milestone 5's census gate gains a scope condition.** The census compares Phase A's region against §7.77's six-line commit surface. If Block C establishes that FlowLogic emits, the surface has a seventh member on the indicator side, and **Milestone 5's census must state whether it covers the indicator or only the EA.** A milestone whose scope is unstated is a milestone that can pass against half its surface.

---

# 14. Sequencing

| # | Task | Content | Gate | Harness | Risk |
|---|---|---|---|---|---|
| **160-PreJ** | **Form D. Corrected attribution ×7 regions; buffer-35 scope; three unread passes + emission census; `ZoneAdoptable`** | **LIVE** | none | none | none |
| **council** | **Review Task 159 Parts 1–3 and the twenty packet items** | runs **in parallel** with 160-PreJ | none | none | none |
| **154** | Export stage 1, buffer 36. Transitional provenance. Compile gate inverts | **160-PreJ Block A** | Tier 1, 25 min | byte-identical | `.mq5` + `.mqh` |
| **155–156** | Export stages 2–3, buffers 34/35. **Stage 3's shape depends on 160-PreJ Block B** | 154 | Tier 1 ×2, 25 min each | byte-identical | `.mq5` + `.mqh` |
| **160** | Architecture shell. Registries, snapshot, event recorder, enums, capacity. **Inert** | **council only** — the source half is met | Tier 1, 25 min | **byte-identical** | EA only, low |
| **161** | Legacy cascade adapter, whole extraction at the single call site, per-field load/store log, abort capture. **Milestone 1** | 160 | Tier 1, 25 min | byte-identical + leakage log | EA only, medium |
| **162** | Candidate-owned binding at capacity 1, both sites, siblings logged. Absorbs EA-112, EA-143, EA-49, EA-162. **Milestones 2, 3, 4** | 161 **+ packet items 18, 19, 20 for the zone row** | Tier 2, 80 min | direction stated, magnitude not predicted | EA only, medium |
| **163** | Provenance completion, object-addressable lookups, `GONE` resolution, invalidation event record, retention-config decision. Absorbs export stage 4. **Scenario B becomes measurable** | 162, 154–156 | Tier 2, 80 min | Scenario B restated criterion | EA + `.mqh` |
| 141 | Strict promotion bound: the H3 guard, limb 1 committed + limb 2 shadowed | 162 | Tier 2, 80 min | EA only, one token |
| 142 | `NO_TP_TARGET` advisory at EA 1946 only. **Shape open on four items** | 162 **+ council items 15, 17, 18** | Tier 1 then Tier 2 | EA only |
| 129 | EA-156's three-link chain. Promoted-XOB flag from both branches, restores the FVG export | 163 + open item 4 | Tier 3, ~240 min | `.mqh` |
| 130 | Promotion repair, one Form B per defect: EA-113, EA-114, EA-119, EA-115, EA-120 limb 1 | 163 | Tier 1 per edit, Tier 3 once | `.mqh` |
| **164** | Phase A / Phase B, arbitration, EA-144 as commit gate, EA-161's resolution. **Concurrency enabled. Milestones 5, 6** | 163 **+ open item 18's answer for the emission surface** | Tier 2 then Tier 3 | EA only, large |
| **165** | Pending-entry lifecycle. §5.3, T3, EA-142 and EA-145 repaired. Task 131 rides here | 164 **+ A-3 §5.10 + Part A §3.7** | Tier 2, 80 min | EA only, large |
| **166** | Position and exit engine, post-fill target revision, then EA-157 (two defects), EA-158, and EA-176's branch asymmetry if ruled a defect | 165 + 2 scenarios passing | Tier 3 | EA only + `.mqh`, large |
| EA-137 | `TPCENSUS`'s session loop omits `TpSessionLevelFiltered`. **Now EA-169, two causes** | — | rides Task 142's decision | trivial |
| EA-132 | `ZoneAdoptable` and `ZoneInPlay` onto the promotion bound. **Latent, and `ZoneAdoptable` is read in 160-PreJ Block D** | 162 | Tier 1 | EA only |

**One sequencing change from Revision 59, and it is a promotion.** Export stage 1 was *"issuable at any time"*; it is now **first in the queue after 160-PreJ Block A**, because its predecessor Form D is complete apart from the attribution verdict and because stages 1–3 are the only thing on the board that produces a measurement without waiting for the council. Task 160 remains gated on the council's half and nothing in the builder's power changes that.

**Run-budget rule, unchanged.** Behaviour-neutral edits regress at Tier 1 (25 min). Admission-changing measurement runs at Tier 1 if the phenomenon is in the window, Tier 2 (80 min) if it needs 08/03, 08/05 or 07.28. Tier 3 (~240 min) locks in a change or claims the whole signal set. **Task 123 is two generations behind, so the next Tier 3 run re-establishes the baseline as well as measuring whatever it was spent on.**

**Total to Milestone 6:** one free task, one council review in parallel, three Tier 1 export stages at 25 minutes, three more Tier 1 runs at 25 minutes for the shell, the adapter and its log, three Tier 2 runs at 80 minutes for binding, provenance and the phase split. **Roughly seven hours of measurement to reach a representation that can express the strategy** — against sixty tasks that did not. The figure is up from five and a half because the export stages moved from optional to first.

**Cheap measurements still worth queuing, no edit required:**

- **`SRJ INV` has never been used.** A per-object invalidation trace from both OB paths, gated on `SRJ_InDebugWindow`. It separates *the bound OB toggled* from *an unrelated OB switched the branch* without waiting for buffer 34, it is the natural oracle for `GONE` and for EA-163's FVG half, and **EA-172 makes it the only place the losing objects of the descending loop at OrderblockMgr 425 appear.**
- **`LTF_MISALIGN` is mapped but not diagnosed.** 28 of 87 Tier 2 aborts, `Daily-POC` 12 of 28. The replay-order defect must be excluded before any is attributed to strategy — and EA-172 gives that defect a name and a mechanism for the first time.
- **A-3 §5.20's population from the existing log.** A census of `SESSION_CLOSED` deaths by state and offset from the window close sizes EA-144 before Task 164 implements it. The 22 `SESSIONHOLD` lines are already extracted.
- **The `SLSIDEGUARD` and `SLZONEGUARD` diagnostics are already in the build and have never been read from a log.** Both print under `InpDebugLog` with the rejected value, the chosen value, both shifts and both zone bounds. They are the existing instrument for EA-176's failure-cause question, and reading them from a retained log costs nothing and may make packet item 19's instrument unnecessary.
- **Tier 3 re-run under the current generation**, whenever a Tier 3 slot is spent for any reason. Settles the 07.31 / 08.10 / 08.11 deltas and attributes 08/05's novelty to Task 133 or Task 135.

---

# 15. Issues that must not be conflated

Revision 56 §14 and Revision 57 §14 carry forward in full. Restated where this arc changed their force, plus the new rows.

| Issue | Separate question |
|---|---|
| **Representation versus behaviour** | Did this edit change what the system can *express*, or only what it *does*? A byte-identical run proves the second and says nothing about the first |
| **Registry with capacity one versus a single mutable process** | The first becomes concurrent by raising a constant. The second becomes concurrent only after acquiring the concept of a candidate. The EA is the second (EA-147) |
| **Named abstraction versus owned data** | Does this struct own its fields, or read globals? A struct that wraps the singleton hides it (P13) |
| **Ownership versus location** | Which component *owns* this fact, as against which function happens to write it today? |
| **Field classification** | Immutable identity, latched evidence, live mutable state, derived, diagnostic-only, or resolved reference? |
| **Misclassified versus absent** | `slRef` and `tpTarget` are caller locals receiving by-reference writes with **zero persistent storage**, and confirmation has no field at all. **The contract does not correct a classification; it creates the storage** |
| **In scope versus attributed to** | Does an object *exist* at this statement, or does the statement *name* it? Scope was returned correctly for four regions and answered a different question than stage 1 asks (defect 82) |
| **Scope by lower bound versus scope by containment** | A declaration line above a brace opening proves nothing. Scope requires `D < S`, containment in `[Dopen, Dclose]`, **and** membership of that brace entry in the statement's stack. Testing one part produces two opposite errors at once (defect 83) |
| **Local variable versus pointer parameter** | A parameter is in scope at every statement in the body and needs no test. A rule that enumerates only declarations inside the region reports "no object" for a region whose object is in its signature (defect 84) |
| **Re-read versus re-select** | Did the candidate look up its own object by identity, or ask the selector again and take whatever came back? |
| **Resolved versus gone versus unknown** | Did the identity lookup succeed, fail because the object was destroyed, or fail because the lookup could not be performed? Three outcomes, and only the first permits evaluation to continue (EA-159) |
| **Retention prune versus invalidation removal** | **Answered on the four known paths: every delete is capacity-driven** (§7.81). The answer is conditional on the delete-path inventory being complete, and two unread passes could add to it |
| **Invalidation observability versus invalidation event** | On the OB path the flag is observable for at least one bar before capacity removal, so `isValid == false` is reachable. On the FVG path `g_deleteFVGAfterFill` can delete in the fill pass, so `isFilled == true` may never be observable (EA-163) |
| **Event-ordered versus position-ordered retention** | The OB cap ranks by `invalidationBar`, an immutable event. The FVG cap ranks by array position. One is reconstructible from evidence, the other is not (EA-166) |
| **Cross-pass last-writer-wins versus intra-pass masking by array order** | EA-152 is a pass-order question. EA-172 is not: within one pass a descending loop lets the earliest-inserted invalidating object be the last writer, so **a pass name cannot identify the writer and only an object identity can** |
| **Unknown versus inferred** | Established from source, or guessed from proximity? An inferred parent produces a false structural match §13 cannot catch (P15) |
| **Evaluation versus commitment** | Did this code record a decision, or emit, mark a session and return? A side effect followed by a `return` is a commit that terminates the bar |
| **Extraction versus decomposition** | Was the cascade moved whole behind an adapter, or split along guessed seams? The second preserves every leak and hides it (EA-148) |
| **Return-site property versus call-site property** | **Both established.** 21 bare returns none inside a loop, and one caller at `OnTick` 3200 outside any loop. An extraction argument needs both and now has both |
| **Promotion event versus promotion evidence** | The event is latchable on the object. The evidence — the opposing-invalidation count over pruned global history — is **permanently non-attributable** (EA-160) |
| **Inadmissible versus absent target** | **Answered negatively, and the arity is five.** Mask, tier, non-positive/empty, direction, zone containment — all one `false` (EA-167, EA-171) |
| **Absent versus inadmissible stop** | The same question in a second place and worse: `ComputeSlReference` has **six `false` exits covering at least six causes**, and its S5 caller turns all of them into one abort reason (EA-176) |
| **Guarded branch versus unguarded branch** | The 1-swing branch applies a side guard and a zone guard. The 2-swing branch applies neither. A stop reference is not one rule (EA-176) |
| **Decision-path admission versus diagnostic admission** | `TPCENSUS admitted=` omits a filter the decision applies **and** reimplements admission in code the decision does not run (EA-169) |
| **Mask filter versus tier filter** | The session group is filtered by the swept/live mask at 702; the POI group by an anchor-tier test at 708. Neither is subject to the other's (EA-168) |
| **Inert-before-arming versus live-after-arming** | The zone operands read `0.0` until the S3 transition, so every filter reading them carries a different rule on either side of the binding point — and Task 142's permitted site sits inside a guard that spans it (EA-171, EA-174) |
| **Latched evidence versus ambient global** | A reference drafted as a function of latched evidence plus direction is not that if it reads a live global in control flow. **Both** the target and the stop are in this class, and a mechanical retirement of the global would compile and move both (EA-171, EA-174) |
| **Trading window versus session** | A **window** is an execution-admissibility interval defined in the EA over two named windows plus NONE. A **session** is a level-provenance interval defined in Sessions.mqh over four plus NA. An answer to one is not an answer to the other (EA-165) |
| **Three definitions of a bar boundary** | FlowLogic computes it at 847 on the LTF index, `SRJ_HTFEngine.mqh` at 107 on the HTF index, the EA has none and uses a function-static time comparison. Their agreement is unestablished (EA-173) |
| **A fact the owner can read versus a fact it cannot** | `SMarketSnapshot.barClosed` was justified as making a distinction auditable on a side that cannot read the distinction. **A contract field's justification must name the region that supplies its value** (defect 80, EA-170) |
| **Admission target versus revised target** | Latched at setup completion by the hypothesis, versus revised after fill by the position manager. Two owners, one lifecycle (R-Q12) |
| **Admission-R versus realised-R** | Realised outcome may fall below admission R **by design** (R-Q12 part 4). A gain under 1R is not evidence of a defect |
| **Ordinal state versus state label** | Eight sites compare `g_state` by inequality. Once states live on two objects, an inequality spanning the S3/S4 boundary has no meaning (EA-162) |
| **Terminator versus basis loss** | A ruled terminator is a strategy outcome. `HYPOTHESIS_BASIS_LOST` has no strategy meaning and must never be attributed to a rule |
| **Substring hit versus statement** | A raw `return` substring count is not comparable to a return-statement count, and the difference gated Task 161's argument for two rounds (defect 69, amendment 4) |
| **Classification versus falsifiable classification** | A verdict without the paste that could falsify it stood for two rounds on a byte-identical file and was wrong (§8.10). A twelve-line paste settled the same class of disagreement in one round (§7.94). **Amendment 7 is the difference and amendment 15 is its companion** |
| **A dead export versus an internal calculation buffer** | An `INDICATOR_CALCULATIONS` buffer written and read inside its own file needs no external reader by design. Absence from a consumer is the expected shape, not a defect — and asserting otherwise cost this project its fourth retraction (EA-175) |
| **Self-consistent versus correct** | A rule can produce an answer that is internally coherent, arithmetically derived, fully disclosed, and wrong. Three of the project's four retractions are this shape. **The defence is a paste that can falsify it and a rule whose parts are reported separately** |

Carried forward and worth restating: **verdict versus latch** — was a divergence *reading* available, or actually *consumed*? **Recall miss at which level** — never found, found and killed at candidate level, or found and killed on the target poll? **Structural validity versus execution admissibility** — a completion can be structurally correct and still declined because its execution bar falls outside the window.

A correct directional forecast is not a valid setup. A winning signal is not a strategy match. A losing operator trade can still be an exact structural reproduction. A large R is not evidence of a good setup if a nearer target was filtered out to produce it — or if the stop that produced the denominator was selected by a branch that ran neither of the two guards written to reject it. A divergence verdict printed in the journal is not a divergence the candidate was allowed to use. A rejection that agrees with the operator's decision is not a rejection that agrees with his reasoning. And **a struct named `SHypothesis` is not a hypothesis until it owns its bundle.**

---

# 16. What must not happen

Revision 56 §13 and Revision 57 §13 carry forward in full. Restated where this arc changed their force.

**New or sharpened this revision:**

- **No attribution answer from Task 160-PreH may be used, quoted, compared against, or re-derived.** That output is void. Block A of the live task re-runs all seven regions from source under amendment 14, and a verdict reconstructed from the void answer reproduces the defect with a fresh timestamp.
- **No scope verdict computed from brace opening lines alone.** All three parts of amendment 14(e) are required and each is reported separately with its numbers. A rule that tests one bound accepted three variables declared 35, 54 and 59 lines after the statement and rejected the one that was live.
- **No pointer parameter omitted from an attribution.** A parameter is in scope at every statement in the body. "No construction in this paste" is not a legal answer for a region whose object is in its signature.
- **No buffer value left as an unexplained zero where Block A returns `NO OBJECT IN SCOPE AT THIS STATEMENT`.** It is a sentinel and its meaning is stated in source.
- **No claim that `Alert(` and `SendNotification(` occur only inside `EmitAlert` without the qualifier "in the EA"**, until Block C's sixteen-file census returns. Packet item 4 cannot be closed before it.
- **No statement that every delete path is capacity-driven without the scope condition** that FlowLogic 862 and 864 are unread. If either deletes, `HYPOTHESIS_BASIS_LOST`'s design and Task 162's single-design claim are re-derived, not carried.
- **No mechanical retirement of `g_zoneHi`/`g_zoneLo`.** Five EA functions read them and two — `TpTargetUpdateBest` at 631 and `ComputeSlReference` at 928/976/988 — read them **in control flow on the admission path**, inert before arming and live after. A retirement that compiles silently moves every target and every stop. Packet items 18, 19, 20 must be ruled first.
- **No `SStopReference` or `STargetReference` presented as a function of latched evidence and direction.** Both are functions of the live zone until the council rules otherwise, and `zoneDependent` is recorded on both.
- **No `ComputeSlReference` failure treated as one cause.** Six `false` exits, at least six causes, one bool at the caller, one abort reason at S5.
- **No stop reference from the 2-swing branch assumed to have passed a side or zone test.** Neither guard runs there.
- **No 500-slot bound ported without its own engineering justification.** The bound now appears three times inside one function plus its original site, and one function carrying three independent expressions of the same limit is exactly §15's "two expressions of one bound agreeing by coincidence" row.
- **No `}` line reported or accepted as a declaration** (amendment 15). It cost a round on a two-line disagreement that a twelve-line paste settled.
- **No argument list reported as UNTERMINATED as a final answer.** The multi-line call rule closes it by matching paren across line boundaries or the lines are pasted.
- **No fixed-line context window used where an enclosing region is available.** A ±14-line window could not reach a declaration 109 lines above its setter; the brace-counted enclosing region reaches it by construction. **A fixed context window is an anchor in disguise.**
- **No census pattern naming a function typed from memory** (amendment 13). Four pass names censused without their `SRJ_` prefix were every one a proper substring of the real identifier, the item answered nothing, and the pass order stayed unestablished for a round.
- **No buffer described as a dead export without checking its `SetIndexBuffer` type.** An `INDICATOR_CALCULATIONS` buffer written and read inside one file has no external reader by design.

**Carried forward, unchanged in force:**

- No production edit from an architecture document (P12). No structure renamed to imply an architecture it does not have (P13). No concurrency before isolation is proven by a per-field load/store log (P14). No inferred provenance (P15). **No pointer and no array index into `g_orderblocks` or `g_imbalances` in any contract, candidate or hypothesis field (P16)** — every reference goes through `SObjectRef`.
- **No silent continuation on a failed identity lookup.** `GONE` transitions to `HYPOTHESIS_BASIS_LOST` with `basisLostBar` latched and a diagnostic naming the `objId`, the last `RESOLVED` bar, `lastValidObserved` **and** `lastFilledObserved`.
- **No `BASIS_LOST` population attributed to a strategy rule**, and **no `BASIS_LOST` count quoted without the three retention-configuration values recorded beside it**. They are FlowLogic-side and EA-unreadable (§17.29).
- **No global flag copied into a candidate or hypothesis struct.** `tickOBIsValid` and `tickFVGIsValid` are excluded by name.
- **No mechanical port of an ordinal state comparison.** Each of EA-162's eight sites is re-expressed deliberately with a responsibility statement.
- **No post-fill target revision inside Task 165. No placeholder field for an unnamed constituent.**
- **No comparison between `tradingWindow` and `sessionLiveId`, or between `tradingWindowAtAdmission` and `levelSessionId`** (EA-165).
- **No `TPCENSUS admitted=` read as the candidate set** (EA-169). **No `NO_TP_TARGET` occurrence read as "no structure existed"** (EA-167).
- **No gate declared clear against a region no task has read** (defect 75). **No anchor reused across two source-only tasks** — P12's window is the task or its immediate predecessor, and it ages out.
- **No two responsibilities moved in one stage.** Task 132 was dissolved for exactly this. **No lifecycle state added without retiring or mapping an existing one.**
- **No export buffer read as "the candidate's object."** Buffers 34/35/36 name a **flag-setter** population and disagreement is the measurement. Each annotated transitional in source.
- No one-line gate change aimed at aggregate signal counts. No no-substitution refusal rule.
- No run without the provenance gate: raw `dir` both sides plus both SHA256 values for a compile; the three-way stasis check for a no-compile run. **A summarised gate is not the gate.** No `.ex5` timestamp or hash quoted from a summary. No `.ex5` size treated as provenance (EA-125). **No export-stage gate treating FlowLogic's hash as the invariant** — EA-131's invariant ends at stage 1 and is re-recorded per stage.
- No "Compile All" (P10). No opening a non-allow-listed file (P11). Read source via shell for every Form D.
- No `SState` field without its initialiser in `SRJ_StateInit` beside the field it accompanies (P5a), and no file-global beside `g_s` as a substitute. No buffer index renumbered, no existing `SetIndexBuffer` line modified or deleted (P3a).
- No run under 1-minute OHLC (EA-128) or generated `Every tick` (EA-129). Verify from the journal line `generating based on real ticks` and report the `SRJ XOB-PROMOCENSUS` integer (P8a). No harness change without a liveness probe on `BIASCENSUS_FINAL bars=`.
- No edit to any `D:` path or `.txt` dump. Canonical tree only (P6). **No line number used as an anchor without re-establishing it in the same task or its immediate predecessor** — every number in §8.9 is a navigation aid, and §8.10 is the standing proof.
- No `objId` as a cross-run key — use `promotionTime` or the composite key at `SRJ_Types.mqh` 22–30.
- No shadow bar-count quoted as a predicted committed magnitude (EA-133). No edit reordering the shadows relative to the Task 133 override inside the S3 block. No limb-2 anchor on the BAR expression alone. No two admission-changing limbs in one run.
- No dimensional threshold, ever. An operator ruling containing a number is restated structurally first. The two bounded exceptions are `CurrentTradingWindow`'s session-boundary hour literals and the 500-slot walk bounds, each of which is an engineering limit that must be justified as one.
- **No edit to the S5-gate `GoAbort(ABORT_NO_TP_TARGET)` at 2894. The continuous poll at 1946 only** — and 1946's enclosing guard at 1937 is one of EA-162's eight sites and also encloses `ComputeSlReference`'s S2 poll at 1949.
- No cast of `distPts=` without guarding `-`. No `SWEPTMASK`/`TPCENSUS` pairing on `bar=` — pair by journal adjacency. No `S5 waiting:` field cited as a changing value. No `SESSIONHOLD` line keyed by `poi=`.
- No `tickOBIsValid = 1` read as *"the in-bias OB is valid"* (EA-146). No `fvgDead=1` read as describing the bound zone.
- No claim that approximate agreement in direction, session, anchor or entry time is a structural match. **No assumption about which of the operator's setups a log instance corresponds to.**
- **No R figure quoted as strategy-correct while EA-138, EA-142 and EA-145 are open** (§17.14).
- No count and no prose accepted as evidence. Region pastes and raw command output only. No case-insensitive match. No single-substring match spanning a variable-length field. No pasted log line abbreviated or retyped. No table dropping an unlisted row. No paste cap on an unmeasured population. No region paste split with a gap. No `Truncations: none` beside an admitted omission. **No report labelled COMPLETED with a block missing.**
- No brace-delimited region request stated against the definition line's indentation. No log-line selection by a date literal. No census rule a script cannot execute without interpretation. **No question whose answer lives outside a region the same task requested, and no comparison against a value the task did not supply.** No Form B or Form D containing a placeholder, an unfilled reference, or a rule cited by section number instead of pasted. No builder-reported capability limit accepted.
- No census run after the edits it gates. No stitched run treated as a regression. No signal-set delta attributed across tiers or generations without stating both. No `boundaryOk` or `oppInvalCount` value used. No Tier 3 figure quoted from Task 123 as current.
- **No scoring of 07.28 as operator agreement in either direction.** His setup was the morning SHORT (Scenario G, a target-selection miss); the London LONG is an execution-timing decline (Scenario H).
- Operation stays alert-only.

---

# 17. Evidence limitations

Revision 56 §16.1–§16.19 carry forward in full and unchanged. Items that carried forward keep their familiar sub-numbers under §17 — so the R prohibition remains **§17.14**.

**§17.4 The migration's own gates are weaker than the gates they replace, and that is deliberate.** A byte-identity gate proves an edit changed no behaviour. It does not prove the edit changed the *representation* correctly. Tasks 160 and 161 are gated on byte-identity **plus** a leakage log — the log is the real gate and the byte-identity is the safety net. **Milestone 1's proof is a per-field load/store record, not a signal count**, and if that record is not produced the task is PARTIAL regardless of how clean the regression looks. Task 144 is the warning: it was byte-clean and its compile gate was void.

**§17.14 Every R figure is conditional on three open defects, and now on a fourth condition.** Unchanged in force. R-Q12 is answered, so the specification half is met, and the prohibition lifts when Task 165 makes every emitted R computable from latched references. **The fourth condition arrived this arc:** at the S2 poll, admission R is computed from a stop *and* a target that are both filtered by rules reading `g_zoneHi`/`g_zoneLo`, which are zero before arming and live after, inside a guard that spans the change (EA-171, EA-174). Until then no R figure may be quoted as strategy-correct.

**§17.20 The architecture directive was a source-informed reading, and it has been converted.** Task 158 and its three corrections were the conversion, and the ten source-only tasks since have closed seventeen of the open items it left. **What remains open is not the reading but the items at §18.3.** No production edit may be made from Revision 57–60 or a council directive (P12).

**§17.21 to §17.23** carry forward unchanged: two admission-changing tasks are measured after a representation change rather than before it, the reason it is still correct to defer them is EA-133 applied to itself, and no claim about what the migration will cost has been measured.

**§17.24 CLOSED.** `SRJ_StrictNearestOBIndex` read — DEFINITION at OrderblockMgr 691–729, forward declaration at ImbalanceMgr 14. EA-149's *largest `startBar` wins* traces to line 712. **The retirement of line 714 is the standing case for the falsifiability rule** (§8.10).

**§17.25 A promotion-rejection census is available only inside the debug window.** Three of the four `nearest`-branch rejection reasons print only under `SRJ_InDebugWindow(i)` — OrderblockMgr 795, 820, 831, 844 — while `XOB-PROMOCENSUS` at 874 is unconditional. **No promotion-rejection population may be quoted from a full-run log.** Relevant to Task 163.

**§17.26 CLOSED, with a scope condition.** The four known delete criteria are read and all four are capacity-driven; invalidation and fill are preconditions, never decisions. **The closure is conditional on the delete-path inventory being complete**, and FlowLogic 862 and 864 are unread (§17.39).

**§17.27 CLOSED.** Both digests verified MATCH at the start and end of every source-only task since 160-PreD. **Twenty-one consecutive rounds with stasis confirmed.**

**§17.28 Nothing in Revisions 57 through 60 has been measured.** This arc's content is thirty-three source-level findings, twelve data contracts, a lifecycle mapping, a transition rule set, an ownership table, one new prohibition and fifteen census-rule amendments. EA-147 through EA-179 are source findings corroborated by census and brace counting, **not measured populations.** The seven milestones are proposed gates, not achieved ones. **The first number this arc produces will come from export stage 1's or Task 160's Tier 1 regression**, and until then every claim about what the migration will cost is an estimate.

**§17.29 The retention configuration is FlowLogic-side and the EA cannot read it.** `g_keepInvalidatedCount`, `g_keepInvalidatedFVGCount` and `g_deleteFVGAfterFill` are declared at `SRJ_State.mqh` 20/40/41 and each has exactly one assignment, all three in FlowLogic at 358/379/380, from `in*` variables with **no `Inp` on any right-hand side**. All three have **zero occurrences in the EA**. So a `BASIS_LOST` population depends on indicator inputs no EA-side diagnostic can record beside it, and **comparing two runs' `BASIS_LOST` counts is unsound unless the three values are known equal.** Either they are exported in Task 163 or every figure carries a stated caveat. **This is the first of two one-way-interface cases; EA-170 is the second.**

**§17.30 A summed per-pattern `N_LINES` cannot support a completeness verdict.** Closed as a rule by amendment 5, retained as a limitation on the one census that produced it.

**§17.31 CLOSED.** The EA's per-bar entry point and `EvaluateClosedBar`'s call sites are read: `OnTick` 3194–3201, one call site at 3200, `NO-LOOP-OR-SWITCH-IN-STACK`, `NOT ENCLOSED`, arguments `1, currentBarTime`. **Task 161's adapter is a one-line wrap.**

**§17.32 CLOSED, and its exposure RETRACTED.** `TpTargetUpdateBest` guards `EMPTY_VALUE` at 617. *"An empty buffer slot can become the selected target"* is withdrawn on evidence.

**§17.33 Two residuals stand on FVG retention and one is a planner hypothesis.** Insertion order is established as append-only with nothing reordering, but is **not established to be chronological**. And the claim that `SRJ_FVGOverCap` is evaluated against a count its own pruning pass decrements is **a planner hypothesis, explicitly unconfirmed** — it requires the cap and the pruning pass pasted whole in one task and composed, which no task has done. **No number may be built on it.** Open item 13.

**§17.34 CLOSED.** `SMarketSnapshot.barClosed`'s original justification is void on the EA path and the field is invariant-true by construction. Established by census — `barClosed` 0, `prev_calculated` 0, `rates_total` 0, `g_lastBarTime` 0 in the EA — and corroborated by the guard at EA 3198. The scope caveat is lifted. **What survives as a limitation is EA-173:** three definitions of the bar-boundary fact exist in three files on two timeframes and **their agreement is unestablished.**

**§17.35 The zone retirement is BLOCKED, and the block is now specific.** All five EA reader functions are enumerated and `ComputeSlReference` is read. Two of the five read the pair **in control flow on the admission path** — `TpTargetUpdateBest` at 631, `ComputeSlReference` at 928/976/988 — and all such reads are inert before arming and live after. The globals are `ABSENT` from all fifteen non-EA files, so retirement crosses no buffer interface. **No Task 162 retirement may be written until packet items 18, 19 and 20 are ruled.** This is no longer an unread-region problem; it is a design question with the evidence attached.

**§17.36 CLOSED.** `SState` is 96–247, last field declaration **246**, closing brace **247**, settled by a twelve-line paste. The competing 247/247 was an artifact of a relaxed declaration rule admitting `};`. Closed by amendment 15, and the builder disclosed the classification as rule-driven rather than semantic in the same report, which is why one round settled it instead of two.

**§17.37 CLOSED.** `ComputeSlReference` is read whole — 801–1069, 269 lines. It produced EA-174, EA-176, EA-177 and EA-178 and it changed two contracts.

**§17.38 New, and it is the largest limitation on this revision. Every attribution answer on the record is void.** Task 160-PreH's Block B was the round's central deliverable and its scope test compared declaration lines against brace **opening** lines only — never `D < S`, never a **closing** line. The return exhibits both possible errors simultaneously: three variables accepted whose declarations lie 35, 54 and 59 lines *after* the statement, and the one variable unambiguously live at its statement rejected. **The builder computed it exactly as written and disclosed every number used, which is the only reason it is recoverable.** Nothing may be built on any of it. The inputs — assignment lines, RHS values, brace stacks, candidate variables with declaration lines, use traces, region bounds — survive and are not affected. **Only the verdict is void, and Block A of the live task re-runs all seven regions.**

**§17.39 New. The delete-path inventory may be incomplete.** `SRJ_OB_InactiveLinePrunePass` (FlowLogic 862) and `SRJ_OB_OpposingCachePass` (864) have never been read, both run inside the per-bar sequence between the invalidation pass and the FVG passes, and both have object-touching names. **If either calls `.Delete(` on `g_orderblocks`, then "every delete path is capacity-driven" is no longer established**, `HYPOTHESIS_BASIS_LOST`'s non-attributable design loses its source basis, Task 162's single-design claim becomes two designs, and P16's justification changes shape. Block C of the live task settles it. Until then §7.81 and §17.26 carry this condition.

**§17.40 New. The emission surface is established EA-only and has never been censused across the tree.** `Alert(` and `SendNotification(` occur only inside `EmitAlert` **in the EA**. `SRJ_Alerts_DispatchBiasRenewal` sits at FlowLogic 880 inside the per-bar pass sequence with an emission-shaped name and is unread. **Packet item 4 cannot be closed, and Milestone 5's census cannot state its scope, until Block C returns.** Nine of the nineteen per-bar calls were unnamed until this arc; four of the nine are read in the live task and five are draw and panel passes reported only as calls.

**§17.41 New. The per-bar pass sequence is established as nineteen calls and their argument lists are partially unread.** Nine of them returned `UNTERMINATED` because the call spans two lines and the item admitted no legal answer for that — defect 86, closed by the multi-line call rule. **The call order is established; nine argument lists are not.** No claim about what a pass receives may be built on a call site whose argument list was reported unterminated.

---

# 18. Open-item register

`EA-nnn` numbers are never reused. Revision 56 §15 and Revision 57 §15 carry forward in full.

## 18.1 This arc's findings, consolidated

| # | Finding | Status |
|---|---|---|
| **EA-147** | The orchestration layer has no candidate object. Thirteen file-globals constitute the entire working state — a single mutable process, not a registry with capacity one | Target of Tasks 160–164 |
| **EA-148** | `EvaluateClosedBar` is 1,694 lines and is simultaneously the strategy engine and the diagnostic harness | Task 161 extracts it whole; blind extraction prohibited |
| **EA-149** | Candidate identity is not preserved. **The selector's rule is attributed to source**: `SRJ_StrictNearestOBIndex` 712, largest `startBar`, tie by larger `validationBar` | Task 162 |
| **EA-150** | Binding has **two** write sites: 2734/2735 at the arming and 2803/2804 inside the S4 block, with touch revalidation 2808–2811. **The second site's guard is `ZoneAdoptable` at 2786** | Task 162 converts both; sibling event at both. Guard read in 160-PreJ Block D |
| **EA-151** | No identity is stored at binding. Ids read 2273/2274, printed 2276, discarded. **The binding act stores two prices** | Task 162 |
| **EA-152** | Exported flags are last-writer-wins within one bar. **Corrected: the writer set is five functions, not four.** `tickFVGIsValid` describes a **selection** | Export stage 2; superseded in mechanism by EA-172 |
| **EA-153** | The reset lives inside the cascade's abort path and `GoAbort` also logs and emits. Fifteen abort sites; `ResetSequence` 1090–1107 with four call sites | Design constraint on Task 161 |
| **EA-155** | Leg membership can only ever be a bar-index relation. No HTF type carries `objId`; `structLegBoundary` rolls back intrabar while the objects do not | Packet item 1; Task 163 |
| **EA-156** | The dead-export chain is three links. **The FVG leg-membership export is unconditionally empty** | Task 129, re-scoped; second limb is open item 4 |
| **EA-157** | **Two defects.** `SRJ_StrictNearestOBIndex` 706 requires `isActivated`, so nothing can enter the queue for an unactivated target, **and** the deferred pass clears the slot unconditionally | New FlowLogic work, **after Task 166** |
| **EA-158** | The promotion queue has two slots and two inconsistent collision rules | **Never model the queue as a registry.** After Task 166 |
| **EA-159** | **Structural objects are deleted intrabar and the deletion survives the snapshot rollback.** Pruning is `withinLookbackWindow`-gated only, runs at 888/889 before the identity export, `barClosed` ABSENT from both regions | **Binding on every contract. P16.** Inventory possibly incomplete — §17.39 |
| **EA-160** | Promotion evidence is permanently non-attributable — a query over pruned global bar-index history | **UNKNOWN under P15.** Bounds what Scenario B can demonstrate |
| **EA-161** | Phase A contains an alert emission. HEADS-UP 2754 and STAND-DOWN 1116 emit from code that becomes Phase A | Packet item 4. **Scope widened by EA-179 — incomplete until FlowLogic 880 is read** |
| **EA-162** | `g_state`'s ordinal ordering is load-bearing at eight sites, three spanning the S3/S4 binding boundary. **1937 encloses both Task 142's site and the S2 stop poll** | Tasks 162 and 164, each site re-expressed deliberately |
| **EA-163** | **Amended and split. The order-block half is WITHDRAWN** — the OB cap ranks by `invalidationBar` recency with a strict `>`, so a freshly-invalidated OB has `myRank == 0` and cannot be deleted in the pass that invalidated it, and `keepInvalidatedCount <= 0` disables the path entirely. **Survives on the FVG path**, where `g_deleteFVGAfterFill` bypasses the cap | **Binding on 162 and 163, FVG path only.** `lastFilledObserved` required. Rate configuration-dependent and EA-unreadable (§17.29) |
| **EA-164** | `g_sessionAtEntry`'s single live write is at candidate admission (EA 2232, inside `if(g_state == ST_IDLE)` at 2207), not at binding | **CONFIRMED.** Edge C1 gains the field, C4 loses it |
| **EA-165** | **Two session vocabularies.** `CurrentTradingWindow` (EA 379–401) three members from EA hour literals; `SRJ_GetSessionId` (Sessions 175–183) five from `g_def*`. London defined twice, agreement unestablished. Asia and PM have no window counterpart | **Contract amended.** The two domains never compared. Open item 12 |
| **EA-166** | The two cap functions do not share a retention rule — OB by `invalidationBar`, FVG by array position. **Narrowed**: both arrays append-only across all 16 files, nothing reorders, so position is insertion order | Two residuals `UNKNOWN` (§17.33). Packet item 13 |
| **EA-167** | **`NO_TP_TARGET` cannot distinguish inadmissible from absent.** One `false` exit at EA 772; both candidate groups collapse into one accumulator | **Task 142's shape changed.** Arity widened to five by EA-171. Packet item 15 |
| **EA-168** | The two target-candidate groups are governed by different filters — mask at 702 for the session group, anchor tier at 708 for the POI group — and neither by the other's | **Scenario G input.** Packet item 16 |
| **EA-169** | **EA-137 widens to two independent causes.** The TPCENSUS block omits `TpSessionLevelFiltered` **and** reimplements admission in code the decision does not run. `SrjIsNa` ABSENT from all 117 lines | §16's prohibition established from a whole-region paste |
| **EA-170** | **The EA has no `barClosed`, no `prev_calculated`, no `rates_total`, no `g_lastBarTime`.** New-bar detection is a function-static `s_lastBarTime` tested at 3198 and discarded before `EvaluateClosedBar` is entered | **§9.6 amended.** Field is invariant-true by construction with the invariant stated in source, or retired. Defect 80's evidence |
| **EA-171** | **Target admission has three filters and one reads the zone globals in control flow.** `TpTargetUpdateBest` 614–635: exits 617 (empty/non-positive), 619 (direction), **631 (zone containment)**; tie strict `<` at 633 | **§9.10 amended.** `zoneDependent` required. Packet items 15, 17, 18 |
| **EA-172** | **`tickOBIsValid` has five writing functions, one is a replay path attributing history to `discoveryBar`, and one writes inside a descending loop where the last writer is the earliest-inserted invalidating object** | **Intra-pass masking by array order**, structurally distinct from EA-152. Buffer 34 must export identity, and name `discoveryBar` for replay writes |
| **EA-173** | **Three definitions of "the bar is closed," in three files, on two timeframes.** FlowLogic 847 (LTF), HTFEngine 107 (HTF index), EA none. Nine `.mqh` functions take it as a parameter, zero pass it inside the includes | Agreement unestablished. **Same shape as EA-165.** Establishes EA-170's invariant from the guard rather than by reasoning |
| **EA-174** | **The stop reference is zone-dependent too.** `ComputeSlReference` 801–1069 reads the pair on 17 lines, **three in control flow** — 928, 976, 988. Call sites 1949 (`"S2POLL"`) and 2899 (`"S5"`) | **§9.9 amended.** `zoneDependent` required. §17.14 gains a third leg. Packet item 19 |
| **EA-175** | **Amended, and the dead-export claim WITHDRAWN.** 34 `SetIndexBuffer` calls, indices 0–33; the EA's 31 constants omit {0, 1, 28} for three different reasons — two `INDICATOR_DATA` plots consumed inside `SRJ_Fractals.mqh`, one `INDICATOR_CALCULATIONS` buffer written and read inside FlowLogic | **Fourth retraction.** What survives: **34/35/36 free and the final count of 37 arithmetically confirmed** — the fact §12.4 needed and never had |
| **EA-176** | **`ComputeSlReference` has six `false` exits covering at least six causes, and its branch structure is asymmetric.** Both zone-related guards live inside the 1-swing branch; the 2-swing branch applies neither a side test nor a zone-containment test | **EA-167's problem in a second place and worse.** `selectionCause` may be permanently `UNKNOWN`. Packet items 19, 20 |
| **EA-177** | **The stop reference's own reference price is the one already flagged as wrong.** `slCurPx` = `iClose(barShift)` at EA 869 is the operand of `obSwingSideOk`, of `t75_sideOk` and of the walk's side test — the same close EA-142 records as recomputed per bar rather than latched | Task 165's confirmation latch has three consumers, not one |
| **EA-178** | **Three 500-slot walk bounds inside one function**, at 922, 983, 1046, plus a 10-slot diagnostic loop at 810. Each an engineering safety limit | Each re-justified as one wherever ported. §15's "two expressions of one bound" row |
| **EA-179** | **The per-bar pass sequence is nineteen calls, not ten, and nine were unnamed.** Four matter: FlowLogic 862 and 864 (object-touching, possible deletes), 866 (a latch before FVG creation), **880 `SRJ_Alerts_DispatchBiasRenewal` — an emission-shaped name inside Phase-A-equivalent code** | **Block C of the live task settles all four.** §17.39, §17.40, §17.41. Produced defect 86 |

## 18.2 Promoted, re-scoped, corroborated or retracted

| # | Change |
|---|---|
| **EA-103** | Downstream of EA-149. Export stages remain its transitional instrumentation; repair is Task 163 |
| **EA-112 / EA-143 / EA-144** | Change owner, not status. EA-112 → `HYPOTHESIS_WAITING_DIVERGENCE`; EA-143 → per-hypothesis evaluation; **EA-144 → Phase B's commit gate at B4**. Task 128's fall-through patch withdrawn |
| **EA-142 / EA-145** | Not misclassified fields — `slRef` and `tpTarget` are caller locals receiving by-reference writes with **zero persistent storage**, and confirmation has no field at all. **EA-177 adds that the unlatched close drives three stop-side tests as well as the entry price** |
| **EA-137** | **Superseded in scope by EA-169** — two causes, not one |
| **EA-138 / EA-139 / EA-134** | Unchanged in content, re-sequenced behind Task 162 |
| **EA-113 / EA-118** | **Mechanically confirmed** from the `nearest` branch's guard chain and from both ends: `boundary` is consumed at queue time as a `validationBar` comparison at OrderblockMgr 708–710 |
| **EA-120** | Superseded in scope by **EA-156** — three links, not one orphaned flag |
| **EA-127 / EA-146** | Corroborated a third time, at State 487 + Types 31/32 and at OrderblockMgr 170–173 + 534–537. **EA-146 gains force from EA-172:** the flag's meaning combines with array order to mask an in-bias invalidation behind an out-of-bias one |
| **EA-152** | **Corrected.** Five writing functions; 171/173 belong to `SRJ_OB_ReplayActivationInvalidation`, not the activation pass |
| **EA-154** | Resolved into EA-159 |
| **Four retractions on the record** | Line 714's `SRJ_StrictNearestOBIndex` verdict (§8.10) · EA-163's order-block half (§7.82) · §17.32's empty-slot exposure (EA-171) · EA-175's dead-export claim (§7.95). **All four were self-consistent when made. Three were exposed by a paste; one by reading the buffer's declared type.** Each is filed in `07_ARCHIVE\RetractedFindings\` with the return that withdrew it and the rule or paste that exposed it |

**Everything else in Revision 56 §15 stands unchanged**, including the closures: EA-141, EA-140, EA-131 (ending at export stage 1 by design), EA-126, EA-129, EA-128, EA-125, EA-122, EA-121, EA-111, EA-62, EA-104, EA-105, EA-107, and every resolved planner hypothesis in that section's second table.

## 18.3 Open items — current state

| # | Item | Consumed by | Status |
|---|---|---|---|
| 1 | `SRJ_StrictNearestOBIndex`'s guard set | EA-157's repair scope | **CLOSED. Requires `isActivated` at 706. EA-157 is two defects** |
| 2 | sid-to-session mapping | `STargetReference.levelSessionId` | **CLOSED.** Sessions 175–183, Asia 0 / London 1 / NY 2 / PM 3 / `SRJ_NA_INT` |
| 3 | delete criteria; `GONE` semantics | `SObjectRef`, `BASIS_LOST`, Task 162's design | **CLOSED on four paths, conditional on §17.39.** Produced EA-163 |
| 4 | should the `nearest` branch set `currentLegHasXOB`? | Task 129 | open. **Council, not censusable, not an operator question** |
| 5 | `g_sessionAtEntry`'s write point | transition table | **CLOSED** at the admission block; `sess`'s derivation closed with it |
| 6 | T1/T2/T4/T5's conditions and attachment; the 2-of-3 constituent set | `confluenceLatches`, H9, Task 165 | **BLOCKED on Revision 56 §5 and Part A v4.2 §3.7** |
| 7 | does `NO_TP_TARGET` distinguish inadmissible from absent? | Task 142's shape | **CLOSED — no. One `false` exit, five causes.** Produced EA-167 and widened by EA-171 |
| 8 | `ENUM_SRJ_STATE`'s member list | Deliverable 2 | **CLOSED — eight members, all live** |
| 9 | cap semantics; keep-count provenance | EA-163's rate | **CLOSED.** OB cap is a floor ranked by event; FVG cap ranks by position; all three values FlowLogic-side and EA-unreadable |
| 10 | `EvaluateClosedBar`'s returns by enclosing construct | Task 161's extraction claim | **CLOSED IN FULL.** 21 bare returns, none in any of eleven loops, zero `goto`, two mechanisms, zero disagreement |
| 11 | array ordering | EA-166 | **CLOSED on ordering — append-only, nothing reorders.** Two residuals at §17.33 |
| 12 | do `CurrentTradingWindow`'s London bounds and `g_defLondon` agree? | EA-165 | open. **Council, a Part A reading.** The hour literals are session-boundary definitions, so the no-dimensional-thresholds rule does not reach them — but their duplication across two files does |
| 13 | Is insertion order chronological, and is `SRJ_FVGOverCap` evaluated against a count its own pass decrements? | EA-166, Task 163 | open. **Free rider behind Task 163. A planner hypothesis, explicitly unconfirmed** |
| 14 | `TpTargetUpdateBest`'s admission rule and its `EMPTY_VALUE` handling | Task 142, Scenario G | **CLOSED.** Guards at 617; three filters total; produced EA-171 and retracted §17.32 |
| 15 | The EA's per-bar entry point and `EvaluateClosedBar`'s call sites | Tasks 160 and 161 | **CLOSED.** One entry point, one call site, outside any loop. Adapter is a one-line wrap |
| 16 | Does `barClosed` occur anywhere in the EA? | EA-170's scope | **CLOSED — zero occurrences**, with `prev_calculated`, `rates_total` and `g_lastBarTime` also zero |
| 17 | Which functions read `g_zoneHi`/`g_zoneLo`, and are they on the admission path? | §17.35, Task 162 | **CLOSED.** Five EA readers; two read in control flow on the admission path; ABSENT from all 15 non-EA files. **The item closed and the design question opened** — packet items 18, 19, 20 |
| **18** | **Does `SRJ_Alerts_DispatchBiasRenewal` emit, and does any `.mqh` file call `Alert(`, `SendNotification(`, `PlaySound(`, `SendMail(` or `SendFTP(`?** | EA-161, packet item 4, Milestone 5's scope | **in 160-PreJ Block C. Gates packet item 4 and Task 164's emitter design** |
| **19** | **Do FlowLogic 862 (`SRJ_OB_InactiveLinePrunePass`) or 864 (`SRJ_OB_OpposingCachePass`) delete from `g_orderblocks`, and does 866 (`SRJ_Bias_WeakFlipLatchPass`) write state the FVG passes read?** | EA-159's inventory, §17.39, Task 162's `GONE` design | **in 160-PreJ Block C. Gates §7.81's closure and Task 162's single-design claim** |
| **20** | **What does `ZoneAdoptable` test, does it read the zone globals or `g_touchSeen`, and does `ZoneInPlay` exist?** | EA-150's second site, EA-132, Task 162 | **in 160-PreJ Block D. Gates the sibling-creation event's conditions** |
| **21** | **Can buffer 35's region-level write name an object at all?** | Export stage 3's shape | **in 160-PreJ Block B. Gates stage 3's scope** |
| **22** | **Which object does each of the seven flag-write regions attribute to?** | Export stages 1–3, §17.38 | **in 160-PreJ Block A. Gates Task 154's Form B. The previous answer is VOID** |

**Seventeen closed, five open in the live task, five open on the council, one blocked on documents.** The four council items that are not in a task — 4, 12, 13 and the three zone rulings — are readings, not censuses, and no further Form D can advance them.

## 18.4 Planner census-defect ledger — 55 of 86

The root now repeats in three variants: **a rule specified against a target whose shape had not been established first**; **a gate declared clear against a region no task has read**; and — new, and the most expensive — **a rule whose arithmetic is wrong in a way that produces a self-consistent answer.** §3.5 carries the rule that closed each.

| # | Defect | Closed by |
|---|---|---|
| 45–62 | as Revision 56 and 57 record them: stasis values not supplied, mutually exclusive classes, whitespace-blind patterns, mixed line/occurrence counts, no `NOT STORED` value offered, argument-position pairing, `new ` substring, out-of-scope questions, multi-line forward declarations, no string-literal exclusion, cross-function pastes, unused identifier shapes, ambiguous `N_LINES`, malformed pattern text, dropped substring rule, untested assignment target, multi-line `if` extraction, terminator stopping short | the corresponding rules in §3.5 |
| 63 | Deliverable 2 specified against an enum no task had pasted | 160-PreD Block A |
| 64 | Item 6 promised as transcription without checking its source documents were in session | §18.3 item 6, blocked and stated |
| 65 | The report format carried no completeness rule | **DELIVERY RULE, now first in every header** |
| 66 | Enumerated a type-keyword set that omitted every `ENUM_SRJ_*` type | file-scope declaration rule (amendment 1) |
| 67 | Enclosing condition searched by textual proximity, not brace scope | enclosing-condition rule (amendment 2) |
| 68 | Assignment rule excluded string literals but not comment tails | comment exclusion (amendment 3) |
| 69 | Asked for lines containing `return` against a record holding a statement count | return-statement rule (amendment 4) |
| 70 | Asked for per-pattern `N_LINES` plus a total, contradicting the rule | multi-pattern totals rule (amendment 5) |
| 71 | Issued a task header carrying an unfilled bracketed placeholder where the rule block belonged | no-placeholder rule (amendment 8) |
| 72 | Enclosure rule keyed on the innermost brace line's first token, in a tree that opens blocks with a bare `{` | enclosing-construct rule (amendment 6) |
| 73 | Asked whether an RHS is *"a literal or an `ENUM_*` member"* — not decidable without a type census | answerability, computability limb |
| 74 | Referred to *"the D1 assignment line"* in the singular where the producing item could return several | answerability, self-selection limb |
| 75 | **Declared Task 160's gate clear against two unread regions: an append anchor that had aged out of P12's window, and a per-bar entry point no task had ever read.** A gate the planner declares clear is a gate nobody re-checks | P12's ageing clause; Task 160's gate became council + a source block; §17.31 and §17.39 are its evidence-side entries |
| 76 | Comment exclusion covered `//` only, so `/* … */` prose was censused as code | block-comment rule (amendment 9) |
| 77 | Language keywords censused as substrings; `do` returned 109 incidental hits against 0 real | whole-token rule (amendment 10) |
| 78 | RHS extraction undefined where no `;` closes the assignment on the line | right-hand-side rule (amendment 11) |
| 79 | An enclosing-stack item admitted no legal answer for a file-scope match | file-scope answer rule (amendment 12) |
| **80** | **A contract field was justified as making a distinction auditable without establishing that the owning side can read the fact.** `SMarketSnapshot.barClosed` was drafted against a fact the EA does not possess (EA-170) | §9.1's binding rule: **a contract field's justification must name the region that supplies its value** |
| **81** | **Four census patterns naming functions were typed from memory without their `SRJ_` prefix.** Every match was a proper substring of the real identifier, so the item returned INCIDENTAL for all ten lines and answered nothing; the pass order stayed unestablished for a round | census-pattern provenance rule (amendment 13) |
| **82** | **Asked whether an object is *in scope* where the deliverable needed to know which object the statement *attributes* to.** Scope was returned correctly and answered a different question than export stage 1 asks | the attribution rule, first version — itself defective, see 83 and 84 |
| **83** | **The attribution rule's arithmetic was wrong and produced a self-consistent answer.** It tested a variable's declaration line against the **opening** lines of the statement's brace stack only — never `D < S`, never a **closing** line. Both possible errors appeared in one return: three variables accepted whose declarations lie 35, 54 and 59 lines *after* the statement, and the one variable unambiguously live at its statement rejected. **The entire attribution deliverable is void** | attribution rule, corrected (amendment 14): `D < S`, containment in `[Dopen, Dclose]`, and stack membership, each reported separately with its numbers |
| **84** | **The attribution rule enumerated only variables declared inside the paste, so a region whose only object is a pointer parameter returned "NOT ASSIGNED FROM ANY CONSTRUCTION IN THIS PASTE."** `SRJ_OB_ReplayActivationInvalidation` takes `COrderblock *ob` in its header; that answer would have entered a Form B as *"this pass has no object to attribute."* **The builder volunteered that `ob` is a parameter. Nothing in the item asked** | amendment 14(a): every pointer parameter of the definition header is enumerated and is in scope at every statement in the body |
| **85** | **A relaxed declaration rule admitted `};` as the highest-numbered declaration in the `SState` struct**, because the line ends in `;` and its first token is not an excluded keyword. The result contradicted the recorded last-field line and could not be distinguished from a genuine disagreement | declaration brace exclusion (amendment 15). The builder disclosed the classification as rule-driven rather than semantic in the same report, which is why one round settled it |
| **86** | **An item asked for exact argument-list text and admitted no legal answer for a call spanning two lines.** Nine of nineteen per-bar pass calls returned `UNTERMINATED`, so the call order was established while nine argument lists were not | multi-line call rule: the list is closed by matching paren across line boundaries, or every line from the call through the matching `)` is pasted and the joined text marked JOINED |

**Builder deviations across this arc, all disclosed and none affecting a verdict.** Two PowerShell helper failures — a brace-depth type error with the lost item recovered in the next block and the recomputed range reconciled, and a pattern-occurrence helper whose paren test failed on all ten lines of one item, bypassed with a direct index scan and the root cause reported as unidentified rather than guessed. A pointer declarator (`COrderblock *ob`) unrecognised by one local-declaration detector, disclosed and corrected. A first-token regex that could not match `#`, which classified every `#define` as a use, self-caught and re-run. A case-insensitivity slip in one matcher, self-caught, with the contaminated output left on the record as superseded. Console echo corruption noted factually rather than silently cleaned. Multi-item answers collapsed onto single output lines in several statement lists.

Against that: `ABSENT` / `UNKNOWN` / `NOT ENCLOSED` / `NO DEFINITION FOUND` / `NO OBJECT IN SCOPE AT THIS STATEMENT` reported with the paste named throughout; incidental matches marked with the containing identifier; planner-owned columns left blank; both hashes quoted supplied-and-observed at the start and end of every round; every part of every declared split delivered; and **the letter of at least eleven broken rules followed with the gap disclosed rather than papered over.** Three times in five rounds the builder located a gap in the planner's rule set that no item asked about, and the last of those — `ob` is a parameter, not a local — is the only reason defect 84 was caught before it entered a Form B.

---

# 19. Local version control

A full Git workflow is unnecessary. A manual local repository outside the MetaTrader tree is sufficient, and **P14 constrains it absolutely: the repository is a checkpoint store and is never a source or an edit target.** Five stale FlowLogic copies and four stale OrderblockMgr copies under `D:\` have already cost this project one void task.

```text
SRJ_FlowNexus_Local\
│
├── 00_CURRENT_WORKING\          <- mirror of what is in MetaEditor. NEVER an edit target
│   ├── EA\  FlowLogic\  Include\
│   └── CURRENT_STATE.txt
│
├── 01_CANONICAL_BASELINES\
│   ├── Rev056_PreArchitecture\      EA\ FlowLogic\ Include\ MANIFEST.txt
│   ├── Rev057_ArchitectureReset\    EA\ FlowLogic\ Include\ MANIFEST.txt
│   ├── Rev058_ContractsComplete\    EA\ FlowLogic\ Include\ MANIFEST.txt
│   ├── Rev059_MapComplete\          EA\ FlowLogic\ Include\ MANIFEST.txt
│   └── Rev060_AdmissionPathRead\    EA\ FlowLogic\ Include\ MANIFEST.txt
│
├── 02_TASK_CHECKPOINTS\
│   ├── Rev057_Task158_ArchitectureCensus\
│   ├── Rev057_Task158_CorrectionA_MapCompletion\
│   ├── Rev057_Task158_CorrectionB_RulingMaps\
│   ├── Rev057_Task158_CorrectionC_GuardsAndGating\
│   ├── Rev057_Task160_PreD_EnumAndAppendPoints\
│   ├── Rev058_Task160_PreD_R2_FourRecoveries\
│   ├── Rev059_Task160_PreE_ExtractionProperty\
│   ├── Rev059_Task160_PreF_EntryPointAndTargetRule\
│   ├── Rev059_Task160_PreG_ExportStage1AndTwoFreeRiders\
│   ├── Rev059_Task160_PreH_SlReferenceAndAttribution\    <- Block B's output VOID
│   ├── Rev060_Task160_PreJ_AttributionRerunAndUnreadPasses\   <- LIVE, source-only
│   ├── Rev060_Task154_ExportStage1\                      <- queued, edit shape
│   ├── Rev060_Task160_ArchitectureShell\                 <- queued, edit shape
│   ├── Rev060_Task161_LegacyAdapter\                     <- queued, edit shape
│   └── Rev060_Task162_BindingPoint\                      <- queued, edit shape
│
├── 03_SPECIFICATIONS\          PartA\ Architecture\ Provenance\ Lifecycle\ AcceptanceTests\
│   ├── Contracts\              <- Task 159 Parts 1-3, the addendum, the 20-item packet
│   └── CensusRules\            <- the §3.5 rule block as ONE pasteable file, 15 amendments
├── 04_TEST_RECORDS\            Tier1\ Tier2\ Tier3\ CompileRecords\ RunRecords\
├── 05_LOGS\                    Baselines\ TaskExtracts\ ScenarioA..H\
├── 06_HANDOFFS\                Revision46\ Revision56\ Revision57\ Revision58\
│                               Revision59\ Revision60\
├── 07_ARCHIVE\                 VoidTasks\ SupersededTasks\ StaleSourceCopies\
│                               RetiredDesigns\ RetractedFindings\ VoidHashRecords\
│                               VoidDeliverables\
└── 99_NOTES\                   OpenQuestions.txt DefectLedger.txt SourceTreeMap.txt
```

**Task 160-PreD-R has no checkpoint folder and must not acquire one.** It was dissolved before issue and superseded by 160-PreD-R2; its record belongs in `07_ARCHIVE\SupersededTasks\` as text, not as a source snapshot. A checkpoint folder for a task that never ran is a lineage claim for an edit that never existed.

**Task 153's Blocks B, C and D move from held to superseded this revision** and go to `07_ARCHIVE\SupersededTasks\` as text, with §12.6's table naming what replaced each and why the replacement is stronger.

`CURRENT_STATE.txt` carries plain text and nothing else:

```text
Working revision: Rev060
Last applied task: none. No production edit since the architecture reset
Operating mode: alert-only
Canonical source location: [full path to DF\MQL5]
EA .mq5 SHA256:        0f1f44cb...52331322
FlowLogic .mq5 SHA256: d5525014...fb5664d5
VOID — never quote:    c3074960...dc3879511  and  08/29/2026 12:54 PM
Stasis: both .mq5 digests MATCH, 21 consecutive rounds, verified at task start and
        at the final item of the last six source-only tasks
VOID DELIVERABLE: Task 160-PreH Block B, every attribution verdict. Defect 83.
        Inputs survive; verdicts may not be quoted, compared or re-derived
Current objective: run Task 160-PreJ (four blocks, free), council review in parallel,
                   then Task 154 export stage 1, then Task 160 — inert shell,
                   Tier 1 byte-identity
Blocked: Task 165. Requires Revision 56 §5 (A-3) and Part A v4.2 §3.7 in session
Blocked: Task 162's zone-retirement row. Requires packet items 18, 19, 20 ruled
Do not edit archived copies. Do not read this tree as source (P14).
```

**Checkpoint shapes.** An edit task uses `BEFORE\ AFTER\ COMPILE_RECORD\ RUN_RECORD\ TASK_HANDOFF.txt`. A source-only task uses `SOURCE_SNAPSHOT\ EXTRACTIONS\ TASK_HANDOFF.txt\ RESULT.txt`.

**Procedure.** Stop editing → copy the working source into a new checkpoint folder named by revision and task → record date and purpose in `TASK_HANDOFF.txt` → apply only the approved task → save into `00_CURRENT_WORKING` → compile only the named file → record the compile result raw, including the `CertUtil: … completed successfully` echo → run the required tier → copy into `AFTER\` → update `CURRENT_STATE.txt`. Never overwrite the previous checkpoint.

**Naming.** `Rev060_Task160_PreJ_AttributionRerunAndUnreadPasses`, `Rev060_Task154_ExportStage1`, `Rev060_Task161_LegacyAdapter`. Never `final`, `latest`, `new`, `new2`, `fixed`, `fixed-final` — those names lose lineage, and lineage is the only thing this tree is for.

**Never overwritten:** a baseline, a task checkpoint, a compile record, a run log, a handoff, a void-task record, a retracted finding, a void deliverable. A correction creates a sibling — `Task158_CorrectionA`, `Task160_PreD_R2`, `Task160_PreJ` — never a replacement.

**Restated because it is the one way this helps or hurts.** Rollback is copying a known-good snapshot back into the canonical tree, deliberately, as a named action. It is not a place to read from during a census. Five stale FlowLogic copies and four stale OrderblockMgr copies under `D:\` have already cost one void task, and P14 exists because a full local mirror multiplies that hazard rather than reducing it.

## 19.1 Five things the repository must carry that Revision 57's shape did not

- **Every `MANIFEST.txt` carries the stasis quadruple** — both `.mq5` SHA256 values and both `.ex5` timestamps, raw. A baseline without the quadruple cannot be verified as the baseline it claims to be, which is the failure Task 144 recorded.
- **`07_ARCHIVE\VoidHashRecords\` holds §8.6's void quadruple** with the reason it is void. A void hash that lives only in a handoff will eventually be quoted as current by someone reading the wrong revision.
- **`03_SPECIFICATIONS\Contracts\` holds Task 159 Parts 1–3, the addendum and the twenty-item packet as delivered**, not as summarised here. Revision 60's §§9–11 are the working record; the parts are the artifact the council reviews, and §17.4's argument — that a summarised gate is not the gate — applies to specifications exactly as it applies to compile records.
- **`03_SPECIFICATIONS\CensusRules\` holds §3.5's rule block as one file, verbatim and pasteable, and `07_ARCHIVE\RetractedFindings\` holds what the record has withdrawn.** The first exists because amendment 8 forbids a Form D citing a rule by section number, and defect 71 was issuing a header with a placeholder where the block belonged — a file that can be pasted whole is the mechanical answer to a defect whose cause was assembly. The second exists because this arc produced the project's first four retractions: **line 714's `SRJ_StrictNearestOBIndex` verdict** (§8.10, self-consistent, wrong, on a byte-identical file), **EA-163's order-block half** (§7.82, withdrawn on arithmetic), **§17.32's empty-slot exposure** (retracted by EA-171's line 617), and **EA-175's dead-export claim** (withdrawn on a buffer's declared type). Each entry names what was withdrawn, the return that withdrew it, and the rule or paste that exposed it.
- **New. `07_ARCHIVE\VoidDeliverables\` holds Task 160-PreH's Block B in full, marked void, with defect 83 and defect 84 stated beside it.** This is a different artifact from a retracted finding and from a void task. The task ran, was procedurally clean, delivered every part, and matched both hashes; its central deliverable is void because the planner's rule was arithmetically wrong. The inputs — assignment lines, RHS values, brace stacks, candidate variables with their declaration lines, use traces, region bounds — are correct and are cited by Revision 60 §7.96. **The verdicts are void and may not be quoted, compared against, or re-derived.** A void deliverable filed only as prose in the current revision will be re-derived by the next reader who finds the clean-looking table first, which is exactly how §8.10's line 714 survived two rounds.

---

# Appendix — where the project stands

Three rulings are in the build and each was verified rather than asserted. The promotion bound landed with an independent in-log oracle agreeing on all 47 evaluation bars. The binding-point window landed and its binary invariant returned zero at 1,728 bars and again at 5,472. Task 144's two print-only instruments came back byte-clean across every behaviour counter and all three signal lines. That is a working method and it is retained in full: shadow, shadow, commit with the shadow retained as an oracle, and a gate whose failure mode is a single integer.

**Revision 57 changed what that method points at. Revision 58 recorded that the change worked. Revision 59 recorded that it kept working. Revision 60 records the first time it caught a wrong answer that looked right.** For roughly sixty tasks the method was pointed at gates, and the record shows what that produced: a defect register past 180 entries, nine verified runs, four verified line maps, a discipline that catches its own planner errors within one round, and **structural agreement of 0 of 12, unchanged across eight revisions.** The recall number did not move because the thing being measured was never the thing that was broken.

**Ten source-only tasks have now run and the admission path is fully read.** Task 158 and its three corrections converted the council's source-informed reading into census-verified fact. 160-PreD established the enum, the append points and the cascade range; 160-PreD-R2 recovered four items; 160-PreE closed the extraction property; 160-PreF read the entry point and the target admission rule; 160-PreG established the buffer interface, the flag writer set and the zone reader enumeration; 160-PreH read `ComputeSlReference` whole. `ENUM_SRJ_STATE` has exactly eight members, all live, and every one maps to a candidate state, a hypothesis state, a three-way split or a retirement. **Twelve data contracts are drafted with every field classified**, the lifecycle mapping is closed, the transition rule set is written, the ownership table has no unmapped row, and **both halves of Task 161's extraction argument are established** — 21 bare returns, none inside any of eleven loops, zero `goto`, every jump statement loop-local, computed two independent ways with zero disagreement, and one caller at `OnTick` 3200 outside any loop. Both outstanding operator questions are answered and the third dissolved into the model without being asked.

**The diagnosis is unchanged and it was reached twice independently.** The EA's working state is thirteen file-globals. Every downstream operation — regime, alignment, freshness, target, stop, divergence, zone, touch, confirmation, signal, throttle, alert — reads or writes that one set. That is not a candidate registry with capacity one; it is a single mutable process, and the distinction determines the cost of a fix. A registry becomes concurrent by raising a constant. A single mutable process becomes concurrent only after it acquires the concept of a candidate. **Six register items are downstream of that one absence**, and reading them as six problems is what made sixty tasks feel like progress.

**Thirty-three findings are on record from this arc and seven of them changed a design.** EA-159 is still the largest: structural objects are deleted intrabar, before the identity export, with no snapshot rollback, so no candidate may hold a pointer or an array index and identity re-lookup needs a first-class `GONE` outcome. That is P16, and it reaches into every one of the twelve contracts. EA-165 split one contract field into two vocabularies — a three-member trading window defined in the EA and a five-member session defined in Sessions.mqh, both previously called "session," with London defined twice and their agreement unestablished. **EA-171 and EA-174 together are the most expensive finding of the arc**: both of the hypothesis's derived references — the target and the stop — read `g_zoneHi`/`g_zoneLo` in control flow on the admission path, and both are inert before arming and live after. §9.9 and §9.10 were drafted as functions of latched evidence plus direction; they are functions of the live zone, and Task 162's zone retirement would have compiled cleanly while silently moving every target and every stop. EA-176 found six `false` exits collapsing into one bool inside a 269-line function whose two zone guards run on only one of its two branches. And **EA-163's order-block half was withdrawn on arithmetic**, the first of four retractions this project has now recorded.

**Three things this revision did not do, stated plainly.** It measured nothing — Revisions 57 through 60 contain no new measurement at all, the first number will come from export stage 1's or Task 160's Tier 1 regression, and every cost estimate here is an estimate. It did not close item 6, because the two documents that rule the terminator set and the confluence constituents are not in session, so **Task 165 is blocked rather than deferred** and two deliverables stay `UNKNOWN` until Revision 56 §5 and Part A v4.2 §3.7 enter a session. And it again deferred two fully drafted edits whose anchors are verified and whose fixtures are real, because a number measured against a denominator that is about to move is a number the project will have to discard. That lesson has been paid for twice.

**What this revision did that the last one could not have.** It destroyed its own central deliverable and said so. Task 160-PreH's Block B was the round's whole purpose — convert scope into attribution so export stage 1's buffer can name the object that set a flag — and the rule I wrote to do it tested a variable's declaration line against brace *opening* lines only. It never tested `D < S` and never tested a closing line, so it accepted three variables declared 35, 54 and 59 lines *after* the statement and rejected the one variable that was unambiguously live. The builder computed it exactly as written, disclosed every number it used, and then volunteered — unasked — that `ob` in a fourth region is a function parameter rather than a local, which is the fact that exposed a second defect in the same rule. **Fifty-five of the eighty-six recorded census defects are the planner's, the builder is twenty consecutive rounds procedurally clean on substance, and three times in five rounds it has located a gap in my rule set that no item asked about.** That asymmetry is this project's most reliable instrument, and it is the only reason a self-consistent wrong answer did not enter a Form B as a design fact.

The root has three variants now and the third is the expensive one. A rule specified against a target whose shape had not been established first — that costs a round. A gate declared clear against a region no task has read — that costs a task. **A rule whose arithmetic is wrong in a way that produces a self-consistent answer costs a deliverable, and the only defence is a paste that can falsify it and a rule whose parts are reported separately with their numbers.** Amendment 7 was written for the first. Amendment 14 was written for the third. Three of the four retractions on this record are that shape.

**The sequence is short and the gates are cheap.** Task 160-PreJ is free and the council review runs in parallel with it. Three Tier 1 export stages at 25 minutes each make flag provenance readable while the architecture is built. Three more Tier 1 runs introduce the registries inert, extract the cascade whole behind a one-line wrap, and prove isolation with a per-field load/store log rather than a signal count. Three Tier 2 runs at 80 minutes move binding, complete provenance, and split evaluation from commitment. **Roughly seven hours of measurement to reach a representation that can express the strategy** — after which Tasks 141, 142, 129, 130 and 131 become cheap, because they will finally be measured against a denominator that holds still.

Structural agreement is 0 of 12. That is the only number that decides whether this build reproduces the strategy, and it is the only number the next seven tasks are aimed at.

---

That completes Revision 60. The document now runs §0 through §19.1 plus the appendix; combined with what you already have above the truncation point, it is whole and can open a fresh session on its own, with the two blocking document gaps stated at §0 and the void deliverable stated at §17.38 and §19.1.