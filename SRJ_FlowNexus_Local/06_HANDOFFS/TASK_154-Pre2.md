# TASK 154-Pre2 — BUFFER-36 WRITE MULTIPLICITY, OBJID DOMAIN, AND RESET-ORDER CLARIFICATION

**Status:** READY FOR BUILDER

**Form:** D (source-only technical clarification)

**Production edit:** NO

**Compile:** NO

**Run:** NO

**Builder may start:** YES (read-only inspection)

**Council review required:** YES — after builder result

---

## 0. PURPOSE

This task establishes technical facts required for Task 154's transport mechanism design by inspecting current production source to determine:

1. The type and valid domain of `objId` values
2. Whether multiple `hasPersistedOpposingFVG` writes can execute in a single pass call
3. The complete same-bar call and overwrite order
4. Existing initialization and reset conventions for state fields
5. Architecture feasibility facts for scalar transport design

**Context:** Task 154 is BLOCKED on Contract 4 (multiple objects in scope) and Contract 2 (transport mechanism design). TASK_154-DESIGN.md presents five transport options, but several technical questions remain unresolved:

- Can objId = 0 or negative values be valid? (affects sentinel selection)
- Can multiple qualifying writes execute in one pass call? (affects single-scalar viability)
- What is the exact same-bar call order? (affects reset/write/export timing)
- What initialization/reset conventions exist? (affects transport ownership design)

**This task answers these questions from current source WITHOUT:**
- Designing or implementing a transport mechanism
- Selecting among transport options
- Approving sentinel values
- Modifying any source file
- Compiling or running

**What this task does:**
- Mechanically determine objId type and domain from current source
- Prove or disprove mutual exclusion of qualifying writes within one pass call
- Document the exact same-bar call sequence and overwrite opportunities
- Report existing state initialization and reset patterns
- Answer architecture feasibility questions with exact evidence

**What this task does NOT do:**
- Choose between first-write or last-write semantics
- Select a transport mechanism
- Recommend sentinel values
- Design a new state field
- Infer strategy meaning
- Modify any source file
- Compile or run

---

## 1. ALLOWED SOURCE FILES

**Initially allowed:**
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh

**Additional files:** The builder may inspect another canonical file ONLY if an observed symbol definition requires it (e.g., a class type or function declaration not found in the initially allowed files). The builder MUST name and justify each additional file.

**Prohibited:**
- Archived copies (no D:\ path, no 07_ARCHIVE\)
- Workflow-control area files (no .txt dumps as source)
- Files outside the canonical tree
- Historical versions

---

## 2. CONTEXT FROM PREDECESSOR TASKS (reference only, not re-verified)

**From BUILDER_RESULT_154-Pre1.md:**
- SRJ_FVG_CreationRenewalPass returns `void` with no output parameters
- Four `hasPersistedOpposingFVG` writes exist at lines 199, 226, 316, 343 (within region 111-348)
- Objects (`newBullFVG`, `newBearFVG`, `renewalOB`) persist in collections after pass returns
- Transport mechanism NOT FOUND in current source
- Buffer indices 34, 35, 36 are UNASSIGNED

**From BUILDER_RESULT_160-PreJ.md Block A:**
- Line 199: `newBullFVG`, `renewalOB` IN SCOPE
- Line 226: `newBullFVG` IN SCOPE
- Line 316: `newBearFVG`, `renewalOB` IN SCOPE
- Line 343: `newBearFVG` IN SCOPE

**From TASK_154-DESIGN.md:**
- Five transport options presented (A: file-scope variable, B: SState field, C: shadow flag [NON-VIABLE], D: dual variables, E: event-identity)
- Multiple-object selection rule unresolved (operator answer required)
- Transport owner preference unresolved (operator answer required)

**This task does NOT re-verify predecessor results. It establishes NEW technical facts required for transport design.**

---

## 3. INVESTIGATION ITEMS

### Block A — objId type and domain

**A1.** Locate every declaration or definition in the initially allowed files that establishes the type of `objId`:
- Census `objId` in each file
- For each occurrence, classify as: FIELD DECLARATION (in a struct/class), PARAMETER, LOCAL VARIABLE, RETURN TYPE, MEMBER ACCESS, OTHER
- Report the declaring line and full text for every FIELD DECLARATION or type-establishing context

**A2.** Locate `SRJ_NextObjId` by definition-header rule (including fallback if needed) in the initially allowed files:
- Report file containing definition
- Classification: DEFINITION or DECLARATION or ABSENT
- Return type
- Parameter list (if any)
- Brace-counted region range (if DEFINITION)
- Complete definition paste if ≤80 lines

**A3.** From current source, report every initialization, increment, reset, or assignment that establishes the objId domain:
- Initial value assignments (e.g., in constructors, initialization functions, field initializers)
- Increment or assignment patterns (e.g., `objId = SRJ_NextObjId()`, `objId++`)
- Reset or clear operations (e.g., `objId = 0`, `objId = -1`)
- Report line number, full text, and context (which function/struct)

**A4.** Determine ONLY from current source evidence:
- **Can objId = 0 be a valid value?** 
  - Evidence: initial values, comparisons, assignments
  - Report: YES (with evidence), NO (with evidence), or UNKNOWN (insufficient evidence)
- **Can negative objId values be valid?**
  - Evidence: type declaration (signed/unsigned), assignments, comparisons
  - Report: YES (with evidence), NO (with evidence), or UNKNOWN (insufficient evidence)
- **Maximum representable type range:**
  - Report the objId type (e.g., `int`, `long`, `unsigned int`) and its platform range
  - Report: e.g., "int: -2,147,483,648 to 2,147,483,647" or "unsigned int: 0 to 4,294,967,295"
- **Is conversion to double lossless for the source type's full valid range?**
  - Report: YES, NO, or PARTIAL (with explanation)
  - For `int` type: double has 53-bit mantissa, int is 32-bit → lossless conversion
  - For `long` type (64-bit): double cannot represent all 64-bit integers losslessly

**A5.** If the source does not establish a valid-value restriction (e.g., no evidence that objId starts at 1 or never uses 0):
- Report: UNKNOWN
- List what evidence would be required to establish the restriction

**Prohibitions:**
- Do NOT assume that objId starts at 1
- Do NOT assume that 0 is invalid
- Do NOT assume that negative values are invalid
- Do NOT approve or recommend sentinel values

### Block B — qualifying-write control flow

**B1.** Within the brace-counted current definition of `SRJ_FVG_CreationRenewalPass` (locate by definition-header rule and brace counting):
- Re-establish every assignment to `hasPersistedOpposingFVG` by census
- Report line number and exact current source text for each

**B2.** For each assignment from B1, report:
- **Exact current source line:** [number]
- **Exact RHS:** [verbatim text]
- **Full open-brace stack:** outermost to innermost (brace line: closing line, with header)
- **Enclosing conditions:** every `if`, `else`, `for`, `while`, `switch` header in the stack
- **Execution continues after assignment:** YES (no return/break immediately after) or NO (immediate return/break/goto)
- **Control flow affecting other writes:** every `return`, `break`, `continue`, or mutually exclusive branch (`if`/`else`, `switch` cases) relevant to reaching another qualifying assignment

**B3.** Determine whether more than one qualifying assignment can execute during one call for the same bar index:
- Analyze control flow: can execution reach line X and then line Y in the same call?
- Mutual exclusion mechanisms: `if`/`else`, `return`, `break`, `continue`, separate conditional branches
- Report: EXACTLY ONE WRITE PER CALL PROVED, MULTIPLE WRITES PER CALL POSSIBLE, or WRITE MULTIPLICITY UNKNOWN

**B4.** If source proves mutual exclusion (B3 = EXACTLY ONE WRITE PER CALL PROVED):
- Paste the exact control-flow evidence (e.g., mutually exclusive `if`/`else` branches, `return` statements)
- Show that no execution path can reach two qualifying assignments

**B5.** If source permits multiple executions (B3 = MULTIPLE WRITES PER CALL POSSIBLE):
- Report all possible execution orders (e.g., "line 199 then line 226", "line 316 then line 343")
- Report whether any ordering is deterministic or all orderings are path-dependent

**Prohibitions:**
- Do NOT decide whether first-write or last-write semantics are correct
- Do NOT recommend single-scalar vs. multi-event transport
- Do NOT infer strategy meaning from write order

**Legal verdicts:**
- EXACTLY ONE WRITE PER CALL PROVED (with evidence)
- MULTIPLE WRITES PER CALL POSSIBLE (with possible orderings)
- WRITE MULTIPLICITY UNKNOWN (with reason)

### Block C — same-bar call and overwrite order

**C1.** Within the brace-counted current `OnCalculate` definition (locate by definition-header rule):
- Locate the per-bar loop containing `SRJ_FVG_CreationRenewalPass` call
- Report loop header line, loop brace-counted range
- Report loop variable name (e.g., `i`, `bar`)

**C2.** Paste the ordered call sequence from the start of relevant per-bar processing through the buffer export of `hasPersistedOpposingFVG`:
- Include: all function calls that may affect `g_s.hasPersistedOpposingFVG`
- Include: the existing buffer export line for `hasPersistedOpposingFVG` (e.g., `g_bufOppFVG[i] = ...`)
- Format: line number: full text
- Paste ONLY the call statements and assignments, not entire function bodies

**C3.** Report every function called in the C2 interval that can assign to `hasPersistedOpposingFVG`:
- Use current-source definition evidence: locate each called function by definition-header rule
- Census `hasPersistedOpposingFVG` within each called function's brace-counted region
- Report: function name, file, whether it assigns to `hasPersistedOpposingFVG` (YES with line numbers, or NO)

**C4.** Report whether any qualifying boolean write can occur:
- **Before the creation/renewal pass:** can `hasPersistedOpposingFVG` be written before `SRJ_FVG_CreationRenewalPass` is called in the per-bar loop?
  - Report: YES (with function name and call line), NO, or UNKNOWN
- **Inside the pass:** `SRJ_FVG_CreationRenewalPass` itself (already established in Block B)
  - Report: YES (confirmed from B1)
- **After the pass but before export:** can `hasPersistedOpposingFVG` be written after `SRJ_FVG_CreationRenewalPass` returns but before the buffer export?
  - Report: YES (with function name and call line), NO, or UNKNOWN

**C5.** Report the exact export timing for the existing boolean buffer:
- Line number of the export statement (e.g., `g_bufOppFVG[i] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;`)
- Context: inside what conditional/loop (report enclosing headers)
- Relative position: how many function calls occur between `SRJ_FVG_CreationRenewalPass` and the export?

**Prohibitions:**
- Do NOT infer attribution from final flag value
- Do NOT assume that the last write before export is the "correct" attribution
- Do NOT recommend where to place transport writes

### Block D — SState initialization and reset conventions

**D1.** Locate the `SState` struct definition:
- Census `SState` by identifier (struct name)
- Report file, definition header line, brace-counted range
- Report the line number and full text of the `hasPersistedOpposingFVG` field declaration

**D2.** Locate every initialization or reset of `hasPersistedOpposingFVG`:
- Census `hasPersistedOpposingFVG` across all initially allowed files
- For each assignment, report: line number, full text, enclosing function name (by definition-header rule)
- Classify context: INITIALIZATION (in a constructor or init function), PER-BAR RESET, CONDITIONAL WRITE, OTHER

**D3.** Locate the current state-initialization function and per-bar reset function:
- **State initialization:** Census for functions containing "Init" or "StateInit" or "Initialize"
  - Locate `SRJ_StateInit` by definition-header rule (if it exists)
  - Report: definition header line, brace-counted range, whether it assigns to `hasPersistedOpposingFVG`
- **Per-bar reset:** Census for functions containing "Reset" or "PerBarReset"
  - Locate `SRJ_Bias_PerBarResetPass` by definition-header rule (if it exists per 160-PreJ context)
  - Report: definition header line, brace-counted range, whether it assigns to `hasPersistedOpposingFVG`

**D4.** For each initialization/reset function from D3:
- **Definition range:** brace-counted region
- **Relevant paste:** if the function assigns to `hasPersistedOpposingFVG`, paste the assignment line(s)
- **Call timing from OnCalculate or OnInit:** 
  - Census the function name in `OnCalculate` and `OnInit`
  - Report: called from OnInit (once), called from OnCalculate per-bar loop (once per bar), called conditionally (report condition), or NOT CALLED
- **Execution frequency:** runs ONCE (at indicator start), ONCE PER BAR, or OTHER (describe condition)

**D5.** Identify existing fields in `SState` whose lifecycle resembles a per-bar event transport:
- Fields that are:
  - Written by a pass function during per-bar processing
  - Read by export logic in the same bar
  - Reset at the start of each bar or in a per-bar reset pass
- Report: field name, type, write site(s), read site(s), reset site (if any)
- Examples to look for: fields containing "this bar", "event", "last", "pending"

**Prohibitions:**
- Do NOT recommend or design a new field
- Do NOT recommend where to reset a transport variable
- Do NOT interpret field semantics beyond lifecycle observation

### Block E — architecture feasibility facts

**E1.** Is there a deterministic reset point before `SRJ_FVG_CreationRenewalPass` for each processed bar?
- Evidence: per-bar loop structure, calls before the pass, `SRJ_Bias_PerBarResetPass` or similar
- Report: YES (with exact location: function name and call line), NO (with reason), or UNKNOWN

**E2.** Is there a deterministic export point after the pass for the same bar?
- Evidence: buffer export block location, call sequence after the pass
- Report: YES (with exact location: line number of export statement), NO (with reason), or UNKNOWN

**E3.** Can a state-owned scalar represent every observed event if multiple qualifying writes can occur in one call?
- Context: if Block B determines MULTIPLE WRITES PER CALL POSSIBLE
- Analysis: a single scalar (e.g., `int g_hasPersistedOpposingFVG_objId`) can hold only one value at export time
- Report: YES (scalar can represent all events, explain how), NO (scalar loses information, explain what is lost), or N/A (if Block B = EXACTLY ONE WRITE PER CALL PROVED)

**E4.** Would a single scalar necessarily preserve only one event when multiple writes occur?
- Context: if Block B determines MULTIPLE WRITES PER CALL POSSIBLE
- Analysis: if writes occur at lines X and Y in one call, and both write to the same scalar, the second write overwrites the first
- Report: YES (second write overwrites first), NO (both can be preserved, explain mechanism), or N/A (if Block B = EXACTLY ONE WRITE PER CALL PROVED)

**E5.** Does the source establish whether first-write or last-write behavior matches current flag semantics?
- Evidence: flag read timing, export timing, any source comments or documentation
- Report: FIRST-WRITE (with evidence), LAST-WRITE (with evidence), or UNKNOWN

**Legal verdicts for E1-E5:**
- YES (with exact evidence: line numbers, function names, call sequence)
- NO (with exact evidence: what is missing or ambiguous)
- UNKNOWN (with explanation: what additional evidence would resolve the question)
- N/A (if the question does not apply given previous findings)

**Prohibitions:**
- Do NOT choose an architecture
- Do NOT recommend single-scalar vs. multi-event transport
- Do NOT approve first-write or last-write semantics

---

## 4. EXECUTION RULES

**Read source through shell commands only:**
- Use `Get-Content`, `Select-String`, `certutil -hashfile`
- NO opening files in MetaEditor
- NO modifying any file

**Locate regions:**
- By identifier census (case-sensitive)
- By definition-header rule and brace counting
- NO historical line numbers as anchors
- Report current line numbers as evidence only

**Classifications:**
- ESTABLISHED CURRENT SOURCE FACT: mechanically verified from current source
- CONTEXT FROM PREDECESSOR TASKS: facts from Pre1/160-PreJ, not re-verified
- UNKNOWN: insufficient evidence in current source to answer the question

**Prohibitions:**
- NO source edits
- NO compile
- NO application run
- NO strategy interpretation
- NO sentinel approval or recommendation
- NO transport implementation or design
- NO first/newest/nearest-object selection
- NO retrospective collection guessing
- NO source-code recommendation

**If investigation requires additional files:**
- Name the file
- Justify why it is required (e.g., "CImbalance class definition not found in initially allowed files")
- Request permission: ADDITIONAL FILE REQUIRED: [path] for [reason]

---

## 5. RESULT SCHEMA

```
TASK 154-Pre2 RESULT

Status: COMPLETED / PARTIAL / BLOCKED

Files read: [list with full paths and commands used]

Files written: NONE

Commands failed: [command and error, or "none"]

Additional files required: [justified list, or "none beyond initially allowed"]

Current source hashes:
  SRJ_FlowLogic.mq5 SHA256: [digest]
  SRJ_ImbalanceMgr.mqh SHA256: [digest]
  SRJ_State.mqh SHA256: [digest]
  SRJ_Types.mqh SHA256: [digest]

===============================================================================
BLOCK A — OBJID TYPE AND DOMAIN
===============================================================================

A1 — objId type-establishing declarations:
  File: [path]
  Occurrences: [count]
  [line]: [text] — FIELD DECLARATION / PARAMETER / LOCAL / RETURN TYPE / MEMBER ACCESS / OTHER
  [...]
  Declared type: [typename] (from FIELD DECLARATION or type context)

A2 — SRJ_NextObjId definition:
  File: [path]
  Classification: DEFINITION / DECLARATION / ABSENT
  Return type: [typename]
  Parameter list: [text or "none"]
  Brace-counted range: NNN–NNN (if DEFINITION)
  Definition paste (if ≤80 lines):
    [paste]

A3 — objId domain establishment:
  Initial value assignments:
    Line NNN: [text] — context: [function/struct name]
    [...]
  Increment/assignment patterns:
    Line NNN: [text] — context: [function name]
    [...]
  Reset/clear operations:
    Line NNN: [text] — context: [function name]
    [...]

A4 — objId domain questions:
  Can objId = 0 be valid?
    Answer: YES / NO / UNKNOWN
    Evidence: [line numbers, text, reasoning]

  Can negative objId values be valid?
    Answer: YES / NO / UNKNOWN
    Evidence: [type declaration, assignments, comparisons]

  Maximum representable type range:
    Type: [typename]
    Range: [e.g., "int: -2,147,483,648 to 2,147,483,647"]

  Is conversion to double lossless?
    Answer: YES / NO / PARTIAL
    Explanation: [e.g., "int is 32-bit, double mantissa is 53-bit → lossless"]

A5 — Valid-value restrictions:
  [If UNKNOWN for any A4 question:]
  Restriction: UNKNOWN
  Required evidence: [what would establish the restriction]

===============================================================================
BLOCK B — QUALIFYING-WRITE CONTROL FLOW
===============================================================================

B1 — hasPersistedOpposingFVG assignments in SRJ_FVG_CreationRenewalPass:
  Function range: NNN–NNN (brace-counted)
  Assignments:
    Line NNN: [text]
    [...]
  Count: [N]

B2 — Per-assignment analysis:
  Assignment 1:
    Exact current source line: NNN
    Exact RHS: [text]
    Full open-brace stack:
      [brace line]: [closing line] — header: [text]
      [...]
    Enclosing conditions: [if/else/for/while headers from stack]
    Execution continues after assignment: YES / NO
    Control flow affecting other writes: [return/break/continue/else statements]

  Assignment 2:
    [same format]
  [...]

B3 — Write multiplicity verdict:
  Verdict: EXACTLY ONE WRITE PER CALL PROVED / MULTIPLE WRITES PER CALL POSSIBLE / WRITE MULTIPLICITY UNKNOWN
  Analysis: [control-flow reasoning]

B4 — Mutual exclusion evidence (if B3 = EXACTLY ONE WRITE PER CALL PROVED):
  [Paste control-flow evidence showing mutual exclusion]

B5 — Multiple execution orderings (if B3 = MULTIPLE WRITES PER CALL POSSIBLE):
  Possible orderings:
    [e.g., "line 199 then line 226"]
    [...]
  Deterministic ordering: YES / NO / PATH-DEPENDENT

===============================================================================
BLOCK C — SAME-BAR CALL AND OVERWRITE ORDER
===============================================================================

C1 — Per-bar loop in OnCalculate:
  OnCalculate range: NNN–NNN (brace-counted)
  Loop header line: NNN
  Loop header text: [text]
  Loop brace-counted range: NNN–NNN
  Loop variable: [name]

C2 — Ordered call sequence (loop start through hasPersistedOpposingFVG export):
  Line NNN: [call or assignment text]
  [...]
  [include all relevant pass calls and the export line]

C3 — Functions that can assign to hasPersistedOpposingFVG:
  Function: [name]
    File: [path]
    Assigns to hasPersistedOpposingFVG: YES (lines: NNN, NNN) / NO
  [...]

C4 — Qualifying write timing:
  Before creation/renewal pass: YES (function: [name], call line: NNN) / NO / UNKNOWN
  Inside the pass: YES (confirmed from Block B)
  After pass, before export: YES (function: [name], call line: NNN) / NO / UNKNOWN

C5 — Existing boolean buffer export timing:
  Export line: NNN
  Export text: [full text]
  Enclosing context: [conditional/loop headers]
  Calls between pass and export: [count], [function names]

===============================================================================
BLOCK D — SSTATE INITIALIZATION AND RESET CONVENTIONS
===============================================================================

D1 — SState struct:
  File: [path]
  Definition header line: NNN
  Brace-counted range: NNN–NNN
  hasPersistedOpposingFVG field:
    Line NNN: [full text]

D2 — hasPersistedOpposingFVG initialization/reset census:
  Occurrences: [count]
  Line NNN: [text] — function: [name] — context: INITIALIZATION / PER-BAR RESET / CONDITIONAL WRITE / OTHER
  [...]

D3 — State initialization and reset functions:
  SRJ_StateInit (or equivalent):
    File: [path]
    Definition header line: NNN
    Brace-counted range: NNN–NNN
    Assigns to hasPersistedOpposingFVG: YES (line NNN: [text]) / NO

  SRJ_Bias_PerBarResetPass (or equivalent):
    File: [path]
    Definition header line: NNN
    Brace-counted range: NNN–NNN
    Assigns to hasPersistedOpposingFVG: YES (line NNN: [text]) / NO

D4 — Call timing and frequency:
  SRJ_StateInit:
    Called from: OnInit / OnCalculate / NOT CALLED
    Call line: NNN (if called)
    Execution frequency: ONCE / ONCE PER BAR / OTHER: [describe]

  SRJ_Bias_PerBarResetPass:
    Called from: OnInit / OnCalculate / NOT CALLED
    Call line: NNN (if called)
    Execution frequency: ONCE / ONCE PER BAR / OTHER: [describe]

D5 — Existing per-bar event transport fields:
  Field: [name]
    Type: [typename]
    Write site(s): [function names, line numbers]
    Read site(s): [function names, line numbers]
    Reset site: [function name, line number] / NONE
  [... list all matching fields ...]
  Count: [N] / NONE FOUND

===============================================================================
BLOCK E — ARCHITECTURE FEASIBILITY FACTS
===============================================================================

E1 — Deterministic reset point before pass:
  Answer: YES / NO / UNKNOWN
  Evidence: [function name, call line, or reason if NO/UNKNOWN]

E2 — Deterministic export point after pass:
  Answer: YES / NO / UNKNOWN
  Evidence: [line number, export statement, or reason if NO/UNKNOWN]

E3 — Scalar can represent every event (if multiple writes possible):
  Answer: YES / NO / N/A
  Analysis: [explain whether scalar loses information]

E4 — Scalar preserves only one event (if multiple writes):
  Answer: YES / NO / N/A
  Analysis: [explain overwrite behavior]

E5 — First-write vs. last-write semantics:
  Answer: FIRST-WRITE / LAST-WRITE / UNKNOWN
  Evidence: [source comments, export timing, or "insufficient evidence"]

===============================================================================
TECHNICAL SUMMARY
===============================================================================

objId type: [typename]
objId domain:
  Can be 0: YES / NO / UNKNOWN
  Can be negative: YES / NO / UNKNOWN
  Max range: [range text]
  Double conversion lossless: YES / NO / PARTIAL

Write multiplicity: EXACTLY ONE / MULTIPLE POSSIBLE / UNKNOWN

Same-bar overwrite opportunities:
  Before pass: YES / NO
  Inside pass: YES (confirmed)
  After pass before export: YES / NO

Reset conventions:
  Initialization: [function name, timing]
  Per-bar reset: [function name, timing] / NONE

Feasibility facts:
  Reset point before pass: YES / NO / UNKNOWN
  Export point after pass: YES / NO / UNKNOWN
  Scalar viable for multiple events: YES / NO / N/A
  Scalar overwrites on multiple writes: YES / NO / N/A
  First/last-write established: FIRST / LAST / UNKNOWN

Technical uncertainties:
  [List any question that cannot be answered from current source]

===============================================================================
EVIDENCE CLASSIFICATION
===============================================================================

ESTABLISHED CURRENT SOURCE FACT:
  [Every finding mechanically verified from current source in this task]

CONTEXT FROM PREDECESSOR TASKS (not re-verified):
  [Facts from Pre1/160-PreJ used as context only]

UNKNOWN:
  [Any question with insufficient evidence]

===============================================================================
FINAL STATUS
===============================================================================

Production files modified: NONE
Compile: NO
Run: NO
Task classification: COMPLETED / PARTIAL / BLOCKED
If PARTIAL or BLOCKED: [reason]

Operator answer required: NONE (unless a genuine discretionary strategy question is exposed)
Council review required: YES
```

---

## 6. DELIVERY

The builder must deliver:
1. Complete result per schema above
2. All sections filled (report NONE/N/A where applicable)
3. Current source hashes for verification
4. Classification of every finding
5. Clear verdict on write multiplicity
6. Clear verdict on each architecture feasibility question

**If any block cannot be completed:**
- Report PARTIAL with exact reason
- Mark the incomplete block
- Deliver all completed blocks

**If the task is blocked:**
- Report BLOCKED with specific technical blocker
- Report what was completed before blocking
- Suggest resolution

---

**END OF TASK 154-Pre2**
