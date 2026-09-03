# TASK 154-Pre1 — TECHNICAL CLARIFICATION FOR TRANSPORT MECHANISM

**Status:** READY FOR BUILDER

**Form:** D (source-only technical clarification)

**Production edit:** NO

**Compile:** NO

**Run:** NO

**Builder may start:** YES (read-only inspection)

**Council review required:** YES — after builder result

---

## 0. PURPOSE

This task inspects current production source to establish technical facts required for Task 154's transport mechanism design. It does NOT design, propose, or implement any transport mechanism.

**Context:** Task 154 is BLOCKED on Contract 4 (multiple objects in scope) and Contract 2 (transport mechanism design). Before council can decide Contract 4's selection rule, the technical facts about object lifetime, pass structure, and existing transport mechanisms must be established from current source.

**This task answers:**
1. How SRJ_FVG_CreationRenewalPass is declared and called
2. Whether it returns a value or has output/reference parameters
3. Whether any existing shared state or event record transports object identity from the pass to OnCalculate
4. Whether newBullFVG, newBearFVG, or renewalOB remain accessible after the pass returns
5. Whether the existing flag-export block has event tracking
6. Whether buffer 36 can be implemented without modifying the flag-writing function
7. Whether a new transport mechanism would be required
8. Current buffer census (indicator_buffers, arrays, SetIndexBuffer calls)
9. Whether indices 34, 35, 36 are currently unassigned
10. Local workflow checkpoint directory available in this workspace

**What this task does NOT do:**
- Design or propose a transport mechanism
- Choose between newBullFVG/newBearFVG and renewalOB
- Decide sentinel semantics
- Infer strategy meaning
- Modify any source file
- Compile or run

---

## 1. ALLOWED SOURCE FILES

**Initially allowed:**
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
- C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh

**Additional files:** The builder may inspect another canonical file ONLY if an include directive or symbol reference proves it is required. The builder MUST name and justify each additional file.

**Prohibited:**
- Archived copies (no D:\ path, no 07_ARCHIVE\)
- Workflow-control area files (no .txt dumps as source)
  - Sole exception: `TASK_154.md` may be read ONLY for Block E2, which verifies the checkpoint requirement
- No other workflow-control file may be read as source evidence
- Files outside the canonical tree
- Historical versions

---

## 2. INVESTIGATION ITEMS

### Block A — Pass declaration and call structure

**A1.** Locate `SRJ_FVG_CreationRenewalPass` by definition-header rule (including fallback) in the initially allowed files. Report:
- File containing definition
- Definition header line
- Parameter list (paste if multi-line)
- Return type
- Every parameter: position, text, BY REFERENCE or BY VALUE, type
- Brace-counted region range

**A2.** Census `SRJ_FVG_CreationRenewalPass` in SRJ_FlowLogic.mq5 only. Report every occurrence as:
- Line number: text
- Classification: CALL SITE or OTHER

**A3.** For each CALL SITE from A2, report:
- Exact argument list text (multi-line call rule)
- Enclosing function (definition-header rule, brace-counted range)
- Whether the call assigns a return value to a variable
- Whether any argument is passed by reference (& parameter)

**A4.** From the A1 brace-counted region only, census each of these identifiers separately:
```
newBullFVG
newBearFVG
renewalOB
objId
discoveryBar
```
Report per identifier:
- N_OCC (occurrences)
- Declaration line (if declared in this region): full text
- Assignment lines: line number, full text, RHS
- Use lines (non-declaration, non-assignment): line number, full text

**A5.** From the A1 brace-counted region only, report:
- Every `return` statement: line number, text, BARE or CARRIES-AN-EXPRESSION
- Every output or reference parameter write: line number, text (assignment to a & parameter)

### Block B — Object lifetime and accessibility

**B1.** For each of newBullFVG, newBearFVG, renewalOB (from A4 declarations):
- Declaration type (e.g., `CImbalance *`, `COrderblock *`)
- Scope: LOCAL (inside pass function) or FILE-SCOPE or GLOBAL
- If LOCAL: line number where declared relative to the function's opening brace
- Whether the object is heap-allocated (assigned from `new`, `create*`, `Get*`, `At*`)
- Whether the pointer is stored anywhere beyond the local variable

**B2.** Census each of these in SRJ_FlowLogic.mq5 file scope (column 0 declarations only):
```
g_imbalances
g_orderblocks
```
Report per identifier:
- File-scope declaration: line number, full text, type
- Whether the type is a collection (CArrayObj, array, etc.)
- ABSENT if not found at file scope

**B3.** If newBullFVG/newBearFVG are local pointers: do they point to objects stored in g_imbalances? Report:
- STORED IN COLLECTION: if assignment RHS contains `.Add(` or collection insertion
- STORED ELSEWHERE: if assignment RHS stores the pointer in a different structure
- LOCAL ONLY: if the pointer is not stored beyond the local variable
- CANNOT DETERMINE: if the analysis requires reading additional files

**B4.** After SRJ_FVG_CreationRenewalPass returns to its caller (from A3):
- Are newBullFVG, newBearFVG, renewalOB accessible from OnCalculate scope?
- If YES: through what mechanism (file-scope variable, collection traversal, return value, output parameter)
- If NO: report OBJECTS NOT ACCESSIBLE AFTER RETURN

### Block C — Existing transport and export mechanisms

**C1.** Census `SState` struct in SRJ_State.mqh:
- Locate struct definition by census and brace counting
- Report struct brace-counted range
- List every field containing `objId` substring: line number, field name, type
- List every field containing `bar` substring: line number, field name, type
- List every field containing `event` substring: line number, field name, type
- List the `hasPersistedOpposingFVG` field: line number, full text, type

**C2.** Census file-scope variables in SRJ_FlowLogic.mq5 (column 0 only):
- Every variable declaration containing `objId` substring: line number, full text
- Every variable declaration containing `event` substring: line number, full text
- Every variable declaration containing `flag` substring: line number, full text
- Every variable declaration containing `transport` substring: line number, full text
- Report NONE if no matches

**C3.** In SRJ_FlowLogic.mq5, locate `OnCalculate` by definition-header rule and brace-count it. From that region only:
- Census for `hasPersistedOpposingFVG`: every occurrence, line number, full text
- Classify each as: WRITE (assignment target), READ (right-hand side or condition), OTHER
- For each WRITE: is it to a buffer array (contains `[i]` or `[bar]` syntax)?
- Report the exact buffer-export pattern (e.g., `g_bufName[i] = g_s.flagName`)

**C4.** From the C3 OnCalculate region, locate the flag-export block:
- Search for buffer writes to `g_buf*[i]` or similar patterns
- Report the brace-counted range of the export block
- Report line numbers where hasPersistedOpposingFVG is exported
- Report whether any objId, event, or tracking variable is read in the same block

**C5.** From the C3 OnCalculate region:
- Is there any variable that tracks which pass executed on this bar?
- Is there any variable that records object identity from pass execution?
- Is there any mechanism that associates flag writes with object identity?
- Report TRANSPORT PRESENT or TRANSPORT NOT FOUND with exact variable names if present

### Block D — Buffer census and verification

**D1.** Census `indicator_buffers` in SRJ_FlowLogic.mq5:
- Every occurrence: line number, full text
- Current value (numeric)
- Location: file-scope property or OnInit local

**D2.** Census buffer array declarations in SRJ_FlowLogic.mq5 file scope:
- Every `double *[]` or `double g_buf*[]` declaration at column 0
- Line number, variable name, full text
- Count: total buffer array declarations

**D3.** Locate `OnInit` by definition-header rule, brace-count it. From that region only:
- Census all `SetIndexBuffer` calls
- For each: line number, full text, extract index (1st argument), array name (2nd argument), buffer type (3rd argument)
- Report indices in ascending order: 0, 1, 2, ..., N
- Report highest assigned index
- Report whether indices 34, 35, 36 appear in any SetIndexBuffer call

**D4.** Verification:
- Does (indicator_buffers value) = (highest SetIndexBuffer index + 1)?
- Are indices 0 through (indicator_buffers - 1) assigned contiguously?
- Report INDICES 34, 35, 36 UNASSIGNED or INDEX N ALREADY ASSIGNED

### Block E — Checkpoint directory census

**E1.** List available directories in the workspace:
- Check for `.git` directory existence
- Check for local checkpoint/snapshot directories
- Report full paths of any workflow checkpoint directories found
- Report NONE if no checkpoint directory exists in workspace

**E2.** Census `CHECKPOINT` in TASK_154.md (workflow-control, not source):
- Report the checkpoint name specified: line number, full text
- Report the checkpoint requirement: PRE-EDIT or other

---

## 3. RESULT SCHEMA

```
TASK 154-Pre1 RESULT

Status: COMPLETED / PARTIAL / BLOCKED

Files read: [list with full paths and commands used]

Files written: NONE

Commands failed: [command and error, or "none"]

Additional files required: [justified list, or "none beyond initially allowed"]

Current source hashes:
  SRJ_FlowLogic.mq5 SHA256: [digest]
  SRJ_ImbalanceMgr.mqh SHA256: [digest]
  SRJ_State.mqh SHA256: [digest]

===============================================================================
BLOCK A — PASS DECLARATION AND CALL STRUCTURE
===============================================================================

A1 — SRJ_FVG_CreationRenewalPass definition:
  File: [path]
  Definition header line: NNN
  Parameter list: [paste if multi-line, or inline]
  Return type: [void / typename]
  Parameters:
    Position | Text | BY REFERENCE / BY VALUE | Type
    [table]
  Brace-counted range: NNN–NNN

A2 — SRJ_FVG_CreationRenewalPass census in SRJ_FlowLogic.mq5:
  Occurrences: N
  [line]: [text] — CALL SITE / OTHER

A3 — Call site analysis:
  Call at line NNN:
    Argument list: [text or ARGUMENT LIST CONTINUES ON NEXT LINE with paste]
    Enclosing function: [name], range NNN–NNN
    Assigns return value: YES / NO
    Reference arguments: [list or NONE]

A4 — Identifier census in pass region (NNN–NNN):
  newBullFVG:
    N_OCC: N
    Declaration: line NNN: [text] / ABSENT
    Assignments: [line: text, RHS | ...] / NONE
    Uses: [line: text | ...] / NONE

  newBearFVG:
    [same format]

  renewalOB:
    [same format]

  objId:
    [same format]

  discoveryBar:
    [same format]

A5 — Return statements and output writes in pass region:
  Return statements: [line: text, BARE/CARRIES-AN-EXPRESSION | ...] / NONE
  Output parameter writes: [line: text | ...] / NONE

===============================================================================
BLOCK B — OBJECT LIFETIME AND ACCESSIBILITY
===============================================================================

B1 — Object declarations:
  newBullFVG:
    Type: [full type]
    Scope: LOCAL / FILE-SCOPE / GLOBAL
    Declaration line: NNN (N lines from function opening brace)
    Heap-allocated: YES (from [call name]) / NO
    Stored beyond local: YES (mechanism: [...]) / NO

  newBearFVG:
    [same format]

  renewalOB:
    [same format]

B2 — Collection census at file scope:
  g_imbalances:
    Declaration: line NNN: [text]
    Type: [typename]
    Is collection: YES / NO
    / ABSENT

  g_orderblocks:
    [same format]

B3 — Object storage analysis:
  newBullFVG/newBearFVG storage:
    STORED IN COLLECTION: [evidence line: text]
    / STORED ELSEWHERE: [evidence]
    / LOCAL ONLY
    / CANNOT DETERMINE: [reason]

  renewalOB storage:
    [same format]

B4 — Accessibility after return:
  newBullFVG, newBearFVG, renewalOB accessible from OnCalculate after pass returns:
    YES: through [mechanism: collection traversal / file-scope variable / return value / output parameter]
    / NO: OBJECTS NOT ACCESSIBLE AFTER RETURN
    / PARTIAL: [details]

===============================================================================
BLOCK C — EXISTING TRANSPORT AND EXPORT MECHANISMS
===============================================================================

C1 — SState struct census:
  Struct range: NNN–NNN in SRJ_State.mqh
  Fields containing "objId": [line: field name, type | ...] / NONE
  Fields containing "bar": [line: field name, type | ...] / NONE
  Fields containing "event": [line: field name, type | ...] / NONE
  hasPersistedOpposingFVG field: line NNN: [text], type [typename]

C2 — File-scope transport variable census in SRJ_FlowLogic.mq5:
  Variables containing "objId": [line: text | ...] / NONE
  Variables containing "event": [line: text | ...] / NONE
  Variables containing "flag": [line: text | ...] / NONE
  Variables containing "transport": [line: text | ...] / NONE

C3 — OnCalculate hasPersistedOpposingFVG census:
  OnCalculate range: NNN–NNN
  hasPersistedOpposingFVG occurrences:
    Line NNN: [text] — WRITE to buffer / READ / OTHER
    [...]
  Buffer-export pattern: [e.g., g_bufHasPersistedOpposingFVG[i] = g_s.hasPersistedOpposingFVG]

C4 — Flag-export block analysis:
  Export block range: NNN–NNN
  hasPersistedOpposingFVG export line(s): [NNN: text | ...]
  objId/event/tracking variables read in export block: [names] / NONE

C5 — Transport mechanism present:
  Pass execution tracking: [variable name, line: text] / ABSENT
  Object identity recording: [variable name, line: text] / ABSENT
  Flag-to-object association: [mechanism description] / ABSENT
  VERDICT: TRANSPORT PRESENT: [exact mechanism]
           / TRANSPORT NOT FOUND IN CURRENT SOURCE

===============================================================================
BLOCK D — BUFFER CENSUS AND VERIFICATION
===============================================================================

D1 — indicator_buffers census:
  Occurrences: N
  Line NNN: [text]
  Current value: NN
  Location: file-scope property / OnInit local

D2 — Buffer array declarations (file scope, column 0):
  Count: NN
  Line NNN: double [varname][]; [full text]
  [...]

D3 — SetIndexBuffer census in OnInit (range NNN–NNN):
  Count: NN
  Line NNN: [text] — index N, array [name], type [INDICATOR_DATA/INDICATOR_CALCULATIONS]
  [... in ascending index order ...]
  Highest assigned index: NN
  Indices 34, 35, 36: ABSENT from SetIndexBuffer calls / INDEX N ALREADY ASSIGNED

D4 — Verification:
  indicator_buffers value (NN) = highest index (NN) + 1: YES / NO — [explanation if NO]
  Indices 0–(NN-1) contiguous: YES / NO — [gaps listed if NO]
  VERDICT: INDICES 34, 35, 36 UNASSIGNED / INDEX N ALREADY ASSIGNED

===============================================================================
BLOCK E — CHECKPOINT DIRECTORY CENSUS
===============================================================================

E1 — Workspace directory census:
  .git directory: EXISTS at [path] / ABSENT
  Local checkpoint directories: [full paths] / NONE
  Workflow checkpoint directories: [full paths] / NONE

E2 — TASK_154.md checkpoint requirement:
  Checkpoint name: [text from line NNN]
  Requirement: PRE-EDIT / [other]

===============================================================================
TECHNICAL SUMMARY
===============================================================================

Pass structure:
  SRJ_FVG_CreationRenewalPass returns: [void / typename]
  Has output parameters: YES / NO
  Has reference parameters: YES / NO

Object lifetime:
  newBullFVG, newBearFVG: [LOCAL ONLY / STORED IN g_imbalances / OTHER]
  renewalOB: [LOCAL ONLY / STORED IN g_orderblocks / OTHER]
  Accessible after return: YES / NO
  If YES, mechanism: [collection traversal / file-scope variable / other]

Existing transport:
  TRANSPORT PRESENT: [exact mechanism with variable names]
  / TRANSPORT NOT FOUND IN CURRENT SOURCE

Buffer 36 implementation:
  Can implement without modifying flag-writing function: YES / NO
  Reason: [based on object accessibility and transport presence]

Required technical changes:
  If TRANSPORT NOT FOUND:
    Minimum change required: [new file-scope variable / new SState field / output parameter / return struct / other]
    Justification: [based on object lifetime analysis]
    File(s) requiring modification: [list]
  If TRANSPORT PRESENT:
    No new mechanism required / [details]

Buffer verification:
  indicator_buffers current value: NN
  Highest SetIndexBuffer index: NN
  Indices 34, 35, 36: UNASSIGNED / ASSIGNED

Checkpoint directory:
  Available: [path] / NONE in workspace
  .git available: YES / NO

Technical blockers:
  [list any technical impossibilities discovered, or "none"]

===============================================================================
EVIDENCE CLASSIFICATION
===============================================================================

ESTABLISHED CURRENT SOURCE FACT:
  [every mechanically verified fact from source inspection]

ACCEPTED 160-PreJ EVIDENCE (context only, not re-verified):
  [facts from BUILDER_RESULT_160-PreJ.md used for context]

TRANSPORT PRESENT / TRANSPORT NOT FOUND:
  [classification with evidence]

ADDITIONAL FILE REQUIRED:
  [any file beyond initially allowed three, with justification]

COUNCIL DECISION REQUIRED:
  [any question this task cannot answer mechanically]

===============================================================================
FINAL STATUS
===============================================================================

Production files modified: NONE
Compile: NO
Run: NO
Task classification: COMPLETED / PARTIAL / BLOCKED
If PARTIAL or BLOCKED: [reason]
```

---

## 4. EXECUTION RULES

**Read source through shell commands only:**
- Use `Get-Content`, `Select-String`, `certutil -hashfile`
- NO opening files in MetaEditor
- NO modifying any file

**Locate regions:**
- By identifier census (case-sensitive)
- By brace counting (increment on `{`, decrement on `}`, stop at zero)
- NO historical line numbers as anchors
- Report current line numbers as evidence only

**Classifications:**
- ESTABLISHED CURRENT SOURCE FACT: mechanically verified from current source
- ACCEPTED 160-PreJ EVIDENCE: context from BUILDER_RESULT_160-PreJ.md, not re-verified
- TRANSPORT PRESENT: explicit mechanism found in current source
- TRANSPORT NOT FOUND: no mechanism found; report minimum change required
- ADDITIONAL FILE REQUIRED: beyond initially allowed three, with justification
- COUNCIL DECISION REQUIRED: question requiring architecture decision

**Prohibitions:**
- NO source edits
- NO compile
- NO application run
- NO workflow-source mixing (no .txt dumps as source)
- NO archived copies (no D:\, no 07_ARCHIVE\)
- NO design proposals
- NO choosing between newBullFVG/newBearFVG and renewalOB
- NO deciding sentinel semantics
- NO inferring strategy meaning

**If transport is absent:**
- Report: TRANSPORT NOT FOUND IN CURRENT SOURCE
- Identify minimum technical change required (e.g., "new file-scope variable to record objId at flag write")
- DO NOT design the mechanism
- DO NOT recommend a specific approach
- DO NOT implement any change

**If investigation requires additional files:**
- Name the file
- Justify why it is required (e.g., "include directive at line NNN", "symbol FooBar not found in allowed files")
- Request permission: ADDITIONAL FILE REQUIRED: [path] for [reason]

---

## 5. DELIVERY

The builder must deliver:
1. Complete result per schema above
2. All sections filled (report NONE/ABSENT where applicable)
3. Current source hashes for verification
4. Classification of every finding
5. Clear verdict on transport presence
6. Clear verdict on buffer 36 implementability without modifying the pass

**If any block cannot be completed:**
- Report PARTIAL with exact reason
- Mark the incomplete block
- Deliver all completed blocks

**If the task is blocked:**
- Report BLOCKED with specific technical blocker
- Report what was completed before blocking
- Suggest resolution (e.g., "requires reading file X which is outside allowed set")

---

**END OF TASK 154-Pre1**
