# TASK 154-DESIGN — BUFFER-36 CONTRACT AND ATTRIBUTION TRANSPORT

**Status:** DRAFT — COUNCIL REVIEW REQUIRED

**Form:** REVIEW

**Production edit:** NO

**Compile:** NO

**Run:** NO

**Builder may start:** NO

**Council review required:** YES

---

## 0. PURPOSE

This document presents technically viable transport options for implementing buffer 36's attribution-to-objId export, without selecting among them or authorizing implementation.

**Context:** Task 154 is BLOCKED on Contract 4 (multiple objects in scope) per the draft task file. Before council can decide Contract 4's selection rule, the exact transport mechanism must be designed and approved. This design document presents the architectural options required to unblock Task 154.

**This document:**
- States the accepted Pre1 facts establishing the transport requirement
- Identifies the exact four hasPersistedOpposingFVG writes as the candidate population
- Identifies the two multiple-object cases requiring selection rules
- Presents technically viable transport options
- Reports lifetime, reset timing, ownership, and risks per option
- Explicitly prohibits nearest-object heuristics and retrospective guessing
- Marks all unresolved questions for operator or planner decision

**This document does NOT:**
- Select a transport option
- Write exact implementation code
- Assign current line numbers as edit anchors
- Approve the design for builder execution
- Authorize production file modification

---

## 1. ACCEPTED PRE1 FACTS

From BUILDER_RESULT_154-Pre1.md (corrected):

### 1.1 Pass structure facts

**SRJ_FVG_CreationRenewalPass:**
- Return type: `void` (A1)
- Has output parameters: NO (A5)
- Has reference parameters: YES — `high[]`, `low[]`, `time[]` are const arrays (A2, read-only)
- No mutable output/reference parameter exists (A5)

### 1.2 Object lifetime facts

**newBullFVG, newBearFVG (A4, B1, B3, B4):**
- Type: `CImbalance *`
- Scope: LOCAL (declared inside pass body, lines 117 and 234)
- Heap-allocated: YES (from `SRJ_createImbalance(...)`)
- Stored beyond local: YES — `g_imbalances.Add(newBullFVG)` at line 119, `g_imbalances.Add(newBearFVG)` at line 236
- Accessible after return: YES — objects persist in file-scope `g_imbalances` collection (B4)
- Mechanism: collection traversal via `GetFVG(g_imbalances, k)`

**renewalOB (A4, B1, B3, B4):**
- Type: `COrderblock *`
- Scope: LOCAL (two block-scoped declarations, lines 136 and 253)
- Heap-allocated: NO — assigned from `GetOB(g_orderblocks, nearestIdx)` (lines 141, 258), a collection lookup
- Stored beyond local: the local pointer is not stored; the referenced object is an existing `g_orderblocks` element
- Accessible after return: YES — referenced object persists in file-scope `g_orderblocks` collection (B4)
- Mechanism: collection traversal via `GetOB(g_orderblocks, k)`

**Local pointer variables (newBullFVG, newBearFVG, renewalOB):**
- NOT accessible after pass returns (function-local scope, B4)
- OBJECTS they reference remain accessible via collection traversal

### 1.3 Transport facts

**Existing transport mechanism (C5):**
- Pass execution tracking: ABSENT
- Object identity recording: ABSENT
- Flag-to-object association: ABSENT
- Verdict: **TRANSPORT NOT FOUND IN CURRENT SOURCE**

**Evidence:**
- `hasPersistedOpposingFVG` is a bare boolean in `g_s` struct (C1)
- When set in pass (lines 226, 343 per A4), no objId or object reference is captured alongside it
- FVG pointers (newBullFVG/newBearFVG/renewalOB) are function-local and persisted only as collection members
- OnCalculate has no mechanically reliable record of WHICH object set the flag (C4, C5)

**Pre1 conclusion (Technical Summary):**
- "Can implement without modifying flag-writing function: NO"
- "Reason: Transport is absent. [...] Correlating the flag with a specific object therefore requires a new record written at the flag-write site (i.e., inside the flag-writing function)."
- "Minimum change required: a new file-scope variable or new SState field that records the object identity (objId) of the FVG/OB at the moment hasPersistedOpposingFVG is set"

### 1.4 Buffer facts

**From Pre1 Block D:**
- `indicator_buffers` current value: 34
- Highest SetIndexBuffer index: 33
- **Indices 34, 35, 36: UNASSIGNED** (D4)

### 1.5 Checkpoint facts

**From Pre1 Block E:**
- Checkpoint directory exists: YES (`SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS`)
- Directory is empty: YES
- Usable Task 154 pre-edit checkpoint currently exists: NO
- `.git` available: YES

---

## 2. CANDIDATE POPULATION

From BUILDER_RESULT_160-PreJ.md Block A (A3):

**hasPersistedOpposingFVG assignment lines in SRJ_FVG_CreationRenewalPass (region 111-348):**

1. Line 199: `g_s.hasPersistedOpposingFVG = false;`
2. Line 226: `g_s.hasPersistedOpposingFVG = true;`
3. Line 316: `g_s.hasPersistedOpposingFVG = false;`
4. Line 343: `g_s.hasPersistedOpposingFVG = true;`

**This is the exact and complete candidate population for buffer-36 attribution transport.**

**Population scope:**
- File: `SRJ_ImbalanceMgr.mqh`
- Function: `SRJ_FVG_CreationRenewalPass`
- Region: lines 111-348 (brace-counted)
- Count: 4 writes

**Other regions (from 160-PreJ Block A, A3):**
- SRJ_OB_ReplayActivationInvalidation: hasPersistedOpposingFVG ABSENT (count 0)
- SRJ_OB_ActivationInvalidationPass: hasPersistedOpposingFVG ABSENT (count 0)
- SRJ_FVG_TickValidRecomputePass: hasPersistedOpposingFVG ABSENT (count 0)
- SRJ_Bias_DecisionBlock: 2 writes (lines 228, 282) — **NOT in buffer-36 population** per Revision 60 §12 scope
- SRJ_Bias_PerBarResetPass: hasPersistedOpposingFVG ABSENT (count 0)
- SRJ_StateInit: 1 write (line 329) — **NOT in buffer-36 population** per Revision 60 §12 scope

**The candidate population is NOT expanded beyond the four SRJ_FVG_CreationRenewalPass writes.**

---

## 3. MULTIPLE-OBJECT CASES

From BUILDER_RESULT_160-PreJ.md Block A (A4), corrected attribution per Amendment 14:

**Single-object cases (2 of 4 writes):**
- Line 226: `newBullFVG` IN SCOPE (1 object)
- Line 343: `newBearFVG` IN SCOPE (1 object)

**Multiple-object cases (2 of 4 writes):**

### Case 1: Line 199
- Statement: `g_s.hasPersistedOpposingFVG = false;`
- Objects IN SCOPE: `newBullFVG`, `renewalOB` (2 objects)
- Context: Inside `if(hasNewOB && !g_s.justChangedBias)` block (174-221)
- RHS: `false`

### Case 2: Line 316
- Statement: `g_s.hasPersistedOpposingFVG = false;`
- Objects IN SCOPE: `newBearFVG`, `renewalOB` (2 objects)
- Context: Inside `if(hasNewOB && !g_s.justChangedBias)` block (291-338)
- RHS: `false`

**CRITICAL:** Both multiple-object cases involve:
- A newly created FVG object (`newBullFVG` or `newBearFVG`)
- A renewal orderblock object (`renewalOB`)
- Assignment RHS of `false`
- Context: conditional block testing `hasNewOB && !g_s.justChangedBias`

**The other writes at lines 209, 210, 244, 326, 327 listed in TASK_154.md §8B Contract 4 are NOT hasPersistedOpposingFVG writes.** They are writes to `tickOBIsValid` and `tickFVGIsValid` (160-PreJ Block A, A3). Only lines 199 and 316 are hasPersistedOpposingFVG writes with multiple objects in scope.

---

## 4. TRANSPORT OPTIONS

Each option is presented with complete technical details. No option is selected.

### OPTION A — File-scope single-objId transport variable

**Owner file:** `SRJ_FlowLogic.mq5`

**Affected function or region:**
- Write site: `SRJ_FVG_CreationRenewalPass` in `SRJ_ImbalanceMgr.mqh` (at or adjacent to each of the four flag writes)
- Export site: `OnCalculate` in `SRJ_FlowLogic.mq5`, inside per-bar loop, before or adjacent to existing flag-export block

**Declaration:**
- File-scope in `SRJ_FlowLogic.mq5`: `int g_hasPersistedOpposingFVG_objId = 0;`
- Type: `int` (holds objId or sentinel)

**Lifetime:**
- Exists: entire indicator lifetime (file-scope variable)
- Persists: across bars until overwritten

**Reset timing:**
- Option A1: Reset to 0 at start of each bar (in OnCalculate per-bar loop, before pass calls)
- Option A2: No reset; rely on export logic to distinguish "not written this bar" by comparing flag value before/after passes

**Write timing:**
- Write occurs: inside `SRJ_FVG_CreationRenewalPass`, at or immediately after each of the four flag writes
- Write value: `(int)obj.objId` where `obj` is the selected object, or `-1` if NO OBJECT verdict, or `0` if no write

**Export timing:**
- Read occurs: in `OnCalculate`, after all flag-writing passes complete, before or during existing export block
- Export to buffer 36: `g_bufHasPersistedOpposingFVG_ObjId[i] = (double)g_hasPersistedOpposingFVG_objId;`

**Object identity contents:**
- Single-object case (lines 226, 343): `obj.objId` from the IN SCOPE object (`newBullFVG.objId` or `newBearFVG.objId`)
- Multiple-object case (lines 199, 316): **OPERATOR ANSWER REQUIRED** — which objId to write

**Bar-index contents:**
- Transport does NOT record bar index explicitly
- Bar index is `i` (the per-bar loop variable in OnCalculate and the pass parameter)
- Assumption: all four writes occur at bar `i` (no replay-path writes per 160-PreJ A3)

**No-event representation:**
- Option A1: `g_hasPersistedOpposingFVG_objId == 0` after reset, no write occurred this bar
- Option A2: detect no-event by comparing `g_s.hasPersistedOpposingFVG` before/after passes

**No-object representation:**
- Write `-1` to `g_hasPersistedOpposingFVG_objId` if attribution returns NO OBJECT IN SCOPE
- (No NO OBJECT case exists in the four candidate writes per 160-PreJ A4)

**Multiple-object representation:**
- **OPERATOR ANSWER REQUIRED:** deterministic selection rule
- Possible rules:
  1. Always select FVG object (`newBullFVG` or `newBearFVG`)
  2. Always select OB object (`renewalOB`)
  3. Write sentinel `-2` for "multiple objects, ambiguous"
  4. Expand to two variables (one for FVG objId, one for OB objId)

**Effect on existing flag behavior:**
- NONE if writes are placed immediately after flag assignments
- Flag ownership remains with `SState` struct
- Flag write semantics unchanged

**Required production files:**
1. `SRJ_FlowLogic.mq5` — declare `g_hasPersistedOpposingFVG_objId`, export logic, optional reset logic
2. `SRJ_ImbalanceMgr.mqh` — write to `g_hasPersistedOpposingFVG_objId` at the four flag-write sites

**Risks and acceptance gates:**
- Risk: modifies flag-writing function (forbidden per TASK_154.md §3 unless explicitly justified and approved)
- Risk: cross-file dependency (`SRJ_ImbalanceMgr.mqh` writes a variable declared in `SRJ_FlowLogic.mq5`)
- Risk: multiple-object selection rule must be deterministic and operator-approved
- Gate: OPERATOR ANSWER REQUIRED on multiple-object policy (lines 199, 316)
- Gate: COUNCIL APPROVAL REQUIRED to modify `SRJ_ImbalanceMgr.mqh`

---

### OPTION B — SState struct field transport

**Owner file:** `SRJ_State.mqh`

**Affected function or region:**
- Declaration site: `SState` struct in `SRJ_State.mqh` (struct range 96-247 per Pre1 C1)
- Write site: `SRJ_FVG_CreationRenewalPass` in `SRJ_ImbalanceMgr.mqh` (at or adjacent to each of the four flag writes)
- Export site: `OnCalculate` in `SRJ_FlowLogic.mq5`, inside per-bar loop, before or adjacent to existing flag-export block

**Declaration:**
- Add field to `SState` struct: `int hasPersistedOpposingFVG_objId;`
- Type: `int` (holds objId or sentinel)

**Lifetime:**
- Exists: entire indicator lifetime (struct member of global `g_s`)
- Persists: across bars until overwritten

**Reset timing:**
- Option B1: Reset to 0 in `SRJ_StateInit` or `SRJ_Bias_PerBarResetPass`
- Option B2: Reset to 0 at start of each bar in OnCalculate per-bar loop
- Option B3: No reset; rely on export logic to distinguish "not written this bar"

**Write timing:**
- Write occurs: inside `SRJ_FVG_CreationRenewalPass`, at or immediately after each of the four flag writes
- Write value: `g_s.hasPersistedOpposingFVG_objId = (int)obj.objId;` where `obj` is the selected object, or `-1` if NO OBJECT, or `0` if no write

**Export timing:**
- Read occurs: in `OnCalculate`, after all flag-writing passes complete, before or during existing export block
- Export to buffer 36: `g_bufHasPersistedOpposingFVG_ObjId[i] = (double)g_s.hasPersistedOpposingFVG_objId;`

**Object identity contents:**
- Single-object case (lines 226, 343): `obj.objId` from the IN SCOPE object
- Multiple-object case (lines 199, 316): **OPERATOR ANSWER REQUIRED** — which objId to write

**Bar-index contents:**
- Transport does NOT record bar index explicitly
- Bar index is `i` (pass parameter and OnCalculate loop variable)

**No-event representation:**
- Option B1/B2: `g_s.hasPersistedOpposingFVG_objId == 0` after reset
- Option B3: detect by comparing `g_s.hasPersistedOpposingFVG` before/after passes

**No-object representation:**
- Write `-1` to `g_s.hasPersistedOpposingFVG_objId`
- (No NO OBJECT case in the four candidate writes per 160-PreJ A4)

**Multiple-object representation:**
- **OPERATOR ANSWER REQUIRED:** deterministic selection rule (same options as Option A)

**Effect on existing flag behavior:**
- NONE if writes are placed immediately after flag assignments
- Flag ownership remains with `SState` struct
- Flag write semantics unchanged

**Required production files:**
1. `SRJ_State.mqh` — add `hasPersistedOpposingFVG_objId` field to `SState` struct
2. `SRJ_ImbalanceMgr.mqh` — write to `g_s.hasPersistedOpposingFVG_objId` at the four flag-write sites
3. `SRJ_FlowLogic.mq5` — export logic only (read `g_s.hasPersistedOpposingFVG_objId`, write to buffer 36)

**Risks and acceptance gates:**
- Risk: modifies `SState` struct (expands state surface)
- Risk: modifies flag-writing function (forbidden per TASK_154.md §3 unless explicitly justified and approved)
- Risk: field persists across bars; reset semantics must be defined
- Gate: OPERATOR ANSWER REQUIRED on multiple-object policy
- Gate: OPERATOR ANSWER REQUIRED on reset timing and ownership (StateInit vs per-bar reset)
- Gate: COUNCIL APPROVAL REQUIRED to modify `SRJ_State.mqh` and `SRJ_ImbalanceMgr.mqh`

---

### OPTION C — Shadow flag with post-pass objId recovery

**Owner file:** `SRJ_FlowLogic.mq5`

**Affected function or region:**
- Declaration site: file-scope in `SRJ_FlowLogic.mq5`
- Write site: `OnCalculate` in `SRJ_FlowLogic.mq5`, inside per-bar loop, AFTER pass calls complete
- Recovery site: same (OnCalculate per-bar loop, after passes)

**Declaration:**
- File-scope: `bool g_hasPersistedOpposingFVG_prev = false;`
- File-scope: `int g_hasPersistedOpposingFVG_objId = 0;`

**Lifetime:**
- Exists: entire indicator lifetime (file-scope variables)
- Persists: across bars until overwritten

**Reset timing:**
- `g_hasPersistedOpposingFVG_prev`: written at start of each bar (before pass calls)
- `g_hasPersistedOpposingFVG_objId`: written after pass calls (if flag changed)

**Write timing:**
- Detection: compare `g_s.hasPersistedOpposingFVG` before passes (`g_hasPersistedOpposingFVG_prev`) and after passes
- If changed: flag write occurred this bar
- Recovery: **PROHIBITED** — nearest-object heuristics, retrospective collection guessing, first/newest object selection are all forbidden
- **This option CANNOT satisfy the transport requirement without violating prohibitions**

**Object identity contents:**
- **CANNOT BE DETERMINED** without retrospective guessing or collection traversal heuristics
- The pass does not record which object was IN SCOPE at write time
- Recovery from flag value or collection state would require:
  - Nearest-FVG search (prohibited)
  - "Latest created FVG" heuristic (prohibited)
  - Inferring from `g_imbalances.Total()` or collection iteration (prohibited)

**Bar-index contents:**
- Bar index is `i` (OnCalculate loop variable)

**No-event representation:**
- `g_s.hasPersistedOpposingFVG` unchanged from `g_hasPersistedOpposingFVG_prev`
- `g_hasPersistedOpposingFVG_objId` remains 0

**No-object representation:**
- Cannot distinguish NO OBJECT from no-event without pass instrumentation

**Multiple-object representation:**
- **CANNOT BE DETERMINED** — recovery logic has no record of which object was selected at write time

**Effect on existing flag behavior:**
- NONE (no modification to flag-writing regions)

**Required production files:**
1. `SRJ_FlowLogic.mq5` — shadow flag, detection logic, recovery logic (if any recovery method is approved)

**Risks and acceptance gates:**
- **FATAL RISK:** objId recovery requires retrospective collection guessing, which is explicitly prohibited
- **FATAL RISK:** no deterministic mechanism to identify which object wrote the flag without pass instrumentation
- Gate: **OPERATOR ANSWER REQUIRED** — is retrospective recovery acceptable? (Expected answer: NO per Pre1 conclusion and Council ruling 2)
- Gate: if recovery is unacceptable, Option C is NON-VIABLE

**Option C assessment: NON-VIABLE under current prohibitions.**

---

### OPTION D — Dual file-scope variables (FVG objId and OB objId)

**Owner file:** `SRJ_FlowLogic.mq5`

**Affected function or region:**
- Write site: `SRJ_FVG_CreationRenewalPass` in `SRJ_ImbalanceMgr.mqh` (at or adjacent to each of the four flag writes)
- Export site: `OnCalculate` in `SRJ_FlowLogic.mq5`, inside per-bar loop, before or adjacent to existing export block

**Declaration:**
- File-scope in `SRJ_FlowLogic.mq5`:
  - `int g_hasPersistedOpposingFVG_fvgObjId = 0;`
  - `int g_hasPersistedOpposingFVG_obObjId = 0;`
- Type: `int` for each

**Lifetime:**
- Exists: entire indicator lifetime (file-scope variables)
- Persists: across bars until overwritten

**Reset timing:**
- Reset both to 0 at start of each bar (in OnCalculate per-bar loop, before pass calls)

**Write timing:**
- Write occurs: inside `SRJ_FVG_CreationRenewalPass`, at or immediately after each of the four flag writes
- Write value for single-object cases:
  - Line 226: `g_hasPersistedOpposingFVG_fvgObjId = newBullFVG.objId;`, `g_hasPersistedOpposingFVG_obObjId = 0;`
  - Line 343: `g_hasPersistedOpposingFVG_fvgObjId = newBearFVG.objId;`, `g_hasPersistedOpposingFVG_obObjId = 0;`
- Write value for multiple-object cases:
  - Line 199: `g_hasPersistedOpposingFVG_fvgObjId = newBullFVG.objId;`, `g_hasPersistedOpposingFVG_obObjId = renewalOB.objId;`
  - Line 316: `g_hasPersistedOpposingFVG_fvgObjId = newBearFVG.objId;`, `g_hasPersistedOpposingFVG_obObjId = renewalOB.objId;`

**Export timing:**
- Read occurs: in `OnCalculate`, after all flag-writing passes complete
- **OPERATOR ANSWER REQUIRED:** how to combine two objIds into buffer 36 (single double value)
  - Option D1: Export FVG objId only, discard OB objId
  - Option D2: Export OB objId only, discard FVG objId
  - Option D3: Export both; expand buffer 36 to TWO buffers (buffer 36 = FVG objId, buffer 37 = OB objId)
  - Option D4: Encode both into one double (e.g., `fvgObjId + (obObjId * 10000.0)`); requires decoder on EA side
  - Option D5: Export whichever is non-zero; if both non-zero, **OPERATOR ANSWER REQUIRED** on priority

**Object identity contents:**
- FVG object: `newBullFVG.objId` or `newBearFVG.objId`
- OB object: `renewalOB.objId` (where renewal OB exists)
- Both recorded separately; export encoding decision required

**Bar-index contents:**
- Transport does NOT record bar index explicitly
- Bar index is `i`

**No-event representation:**
- Both variables == 0 after reset, no write occurred this bar

**No-object representation:**
- Write `-1` to relevant variable if NO OBJECT verdict
- (No NO OBJECT case in the four candidate writes per 160-PreJ A4)

**Multiple-object representation:**
- BOTH objIds recorded in separate variables
- Export encoding handles the representation (per operator decision on export options D1-D5)

**Effect on existing flag behavior:**
- NONE if writes are placed immediately after flag assignments

**Required production files:**
1. `SRJ_FlowLogic.mq5` — declare both variables, export logic (encoding decision-dependent), reset logic
2. `SRJ_ImbalanceMgr.mqh` — write to both variables at the four flag-write sites
3. If Option D3 (two buffers): expand `indicator_buffers` to 38, add SetIndexBuffer for buffer 37

**Risks and acceptance gates:**
- Risk: modifies flag-writing function (forbidden per TASK_154.md §3 unless explicitly justified and approved)
- Risk: cross-file dependency
- Risk: export encoding complexity (requires EA-side decoder if Option D4)
- Risk: buffer expansion to 37 if Option D3 (changes task scope from "buffer 36" to "buffers 36 and 37")
- Gate: **OPERATOR ANSWER REQUIRED** on export encoding (D1-D5)
- Gate: COUNCIL APPROVAL REQUIRED to modify `SRJ_ImbalanceMgr.mqh`
- Gate: if Option D3, COUNCIL APPROVAL REQUIRED to expand task scope to two buffers

---

### OPTION E — Event-identity transport (which write occurred)

**Owner file:** `SRJ_FlowLogic.mq5`

**Affected function or region:**
- Write site: `SRJ_FVG_CreationRenewalPass` in `SRJ_ImbalanceMgr.mqh` (at or adjacent to each of the four flag writes)
- Export site: `OnCalculate` in `SRJ_FlowLogic.mq5`, inside per-bar loop, after passes

**Declaration:**
- File-scope in `SRJ_FlowLogic.mq5`: `int g_hasPersistedOpposingFVG_eventId = 0;`
- Type: `int` (holds event ID or 0)

**Lifetime:**
- Exists: entire indicator lifetime (file-scope variable)
- Persists: across bars until overwritten

**Reset timing:**
- Reset to 0 at start of each bar (in OnCalculate per-bar loop, before pass calls)

**Write timing:**
- Write occurs: inside `SRJ_FVG_CreationRenewalPass`, at or immediately after each of the four flag writes
- Write value: unique event ID per write site
  - Line 199: `g_hasPersistedOpposingFVG_eventId = 1;`
  - Line 226: `g_hasPersistedOpposingFVG_eventId = 2;`
  - Line 316: `g_hasPersistedOpposingFVG_eventId = 3;`
  - Line 343: `g_hasPersistedOpposingFVG_eventId = 4;`

**Export timing:**
- Read occurs: in `OnCalculate`, after all flag-writing passes complete
- Recovery: based on event ID, look up the object that WOULD HAVE BEEN in scope at that write
- **DELEGATE TO PLANNER/BUILDER:** recovery logic design per event ID

**Object identity contents:**
- NOT directly recorded in transport
- Recovered in export logic based on event ID:
  - Event 1 (line 199): **OPERATOR ANSWER REQUIRED** — select `newBullFVG` or `renewalOB`?
  - Event 2 (line 226): recover `newBullFVG` (single object, deterministic)
  - Event 3 (line 316): **OPERATOR ANSWER REQUIRED** — select `newBearFVG` or `renewalOB`?
  - Event 4 (line 343): recover `newBearFVG` (single object, deterministic)
- Recovery requires: collection traversal of `g_imbalances` and `g_orderblocks` at export time
- **Risk:** retrospective recovery may select wrong object if collection state changed between write and export

**Bar-index contents:**
- Transport does NOT record bar index explicitly
- Bar index is `i`

**No-event representation:**
- `g_hasPersistedOpposingFVG_eventId == 0` after reset

**No-object representation:**
- Event ID still written (1-4)
- Recovery logic must handle NO OBJECT verdict (write `-1` to buffer 36)

**Multiple-object representation:**
- Event ID identifies the write site
- **OPERATOR ANSWER REQUIRED:** which object to recover per event (events 1 and 3)

**Effect on existing flag behavior:**
- NONE if writes are placed immediately after flag assignments

**Required production files:**
1. `SRJ_FlowLogic.mq5` — declare event-ID variable, export logic with recovery per event, reset logic
2. `SRJ_ImbalanceMgr.mqh` — write event ID at the four flag-write sites

**Risks and acceptance gates:**
- Risk: modifies flag-writing function (forbidden per TASK_154.md §3 unless explicitly justified and approved)
- Risk: cross-file dependency
- Risk: retrospective recovery may be unreliable if collection state changes between write and export
- Risk: recovery logic complexity (event-specific collection traversal at export time)
- Risk: may violate prohibition on "retrospective collection guessing" if recovery uses nearest-object heuristics
- Gate: **OPERATOR ANSWER REQUIRED** on multiple-object policy (events 1 and 3)
- Gate: **DELEGATE TO PLANNER/BUILDER** on recovery logic design per event
- Gate: COUNCIL APPROVAL REQUIRED to modify `SRJ_ImbalanceMgr.mqh`
- Gate: COUNCIL APPROVAL REQUIRED on whether retrospective recovery is acceptable

---

## 5. EXPLICIT PROHIBITIONS

The following approaches are FORBIDDEN and must NOT appear in any transport option:

### 5.1 Nearest-object heuristics
- Searching `g_imbalances` or `g_orderblocks` for "nearest FVG to current bar"
- "Closest OB to price" selection
- Distance-based or proximity-based object selection
- Any spatial or temporal heuristic to choose among objects

### 5.2 First/newest object selection
- "First FVG in collection" selection
- "Latest created FVG" selection
- "Most recent OB" selection
- Collection-order-based selection without explicit write-time record

### 5.3 Retrospective collection guessing
- Inferring which object wrote the flag by inspecting collection state AFTER the write
- "The FVG that exists at bar i must be the one that wrote the flag" assumption
- Traversing collections at export time to guess which object was IN SCOPE at write time (unless event-ID recovery is explicitly approved)

### 5.4 Silent conflation of no-object and multiple-object
- Treating "no object in scope" and "multiple objects in scope" as the same state
- Exporting sentinel `-1` for BOTH no-object and ambiguous-multiple-object cases without distinction
- Failing to distinguish no-event, no-object, single-object, and multiple-object states

### 5.5 Buffer 31/32 selection results as buffer-36 attribution
- Using buffer 31 (`g_bufXobObjId`) or buffer 32 (`g_bufFvgObjId`) as the source for buffer-36 export
- Conflating Section-8 selection query results (XOB/fresh FVG) with hasPersistedOpposingFVG attribution
- The Section-8 buffers export SELECTED zone objIds (per EA-175), NOT flag-attribution objIds

---

## 6. UNRESOLVED QUESTIONS

### 6.1 Operator questions (OPERATOR ANSWER REQUIRED)

**Q1: Multiple-object selection rule (lines 199, 316)**
- Context: Both writes have `newBullFVG`/`newBearFVG` AND `renewalOB` in scope
- Question: Which object's objId should buffer 36 export?
- Options:
  1. Always select FVG object
  2. Always select OB object
  3. Export sentinel `-2` for "multiple objects, ambiguous"
  4. Expand to two buffers (one for FVG, one for OB)
  5. Other (specify)
- **This question affects discretionary trading meaning and requires operator decision.**

**Q2: Transport owner (Options A, B, D, E)**
- Context: Transport variable can be file-scope in SRJ_FlowLogic.mq5 (Options A, D, E) or SState field in SRJ_State.mqh (Option B)
- Question: Which ownership model is preferred?
- Implications:
  - File-scope: simpler declaration, cross-file write dependency
  - SState field: state surface expansion, reset semantics required
- **This question affects architecture and requires operator decision.**

**Q3: Dual-variable export encoding (Option D)**
- Context: If both FVG objId and OB objId are recorded, how to export via buffer 36 (single double value)?
- Question: Which export encoding is acceptable?
- Options: D1 (FVG only), D2 (OB only), D3 (two buffers), D4 (encoded), D5 (priority rule)
- **This question affects EA read model and requires operator decision.**

**Q4: Retrospective recovery acceptability (Options C, E)**
- Context: Options C and E require recovering objId AFTER the write, by inspecting collections or event ID
- Question: Is retrospective recovery acceptable, or must objId be captured AT write time?
- Expected answer: NO per Pre1 conclusion ("requires a new record written at the flag-write site") and Council ruling 2
- **This question affects transport mechanism viability and requires operator decision.**

### 6.2 Technical questions (DELEGATE TO PLANNER/BUILDER)

**T1: Reset timing and ownership**
- Context: Transport variable(s) must be reset to 0 each bar to distinguish no-event from previous-bar writes
- Question: Where to reset?
  - Option A: Start of OnCalculate per-bar loop (before pass calls)
  - Option B: Inside `SRJ_StateInit` or `SRJ_Bias_PerBarResetPass`
  - Option C: No reset, detect no-event by flag comparison
- **Planner/builder can decide based on existing reset patterns in OnCalculate.**

**T2: Write placement within SRJ_FVG_CreationRenewalPass**
- Context: Transport writes must occur at or adjacent to flag writes (lines 199, 226, 316, 343)
- Question: Exact line placement (immediately after flag write, inside same conditional, etc.)?
- **Builder can decide based on brace-counted edit regions and minimal-edit principle.**

**T3: Export-block integration**
- Context: Buffer-36 export logic must integrate with existing export block (OnCalculate lines 896-1146 per Pre1 C4)
- Question: Insert before, inside, or after existing export block?
- **Builder can decide based on buffer-export pattern and intrabar snapshot timing.**

**T4: Event-ID recovery logic design (Option E)**
- Context: If Option E is selected, recovery logic must map event ID to object collection traversal
- Question: Exact recovery implementation per event ID?
- **Builder/planner can design once option E is approved and multiple-object policy is decided.**

---

## 7. PERMITTED PRODUCTION FILES

**If Option A (file-scope single-objId) is selected:**
- `SRJ_FlowLogic.mq5` — declaration, export logic, reset logic
- `SRJ_ImbalanceMgr.mqh` — write at four flag-write sites (requires council approval)

**If Option B (SState field) is selected:**
- `SRJ_State.mqh` — add field to struct (requires council approval)
- `SRJ_ImbalanceMgr.mqh` — write at four flag-write sites (requires council approval)
- `SRJ_FlowLogic.mq5` — export logic only

**If Option C (shadow flag with recovery) is selected:**
- **NON-VIABLE** under current prohibitions

**If Option D (dual variables) is selected:**
- `SRJ_FlowLogic.mq5` — declaration, export logic (encoding-dependent), reset logic
- `SRJ_ImbalanceMgr.mqh` — write at four flag-write sites (requires council approval)
- If Option D3 (two buffers): expand task scope to buffers 36 and 37

**If Option E (event-identity) is selected:**
- `SRJ_FlowLogic.mq5` — declaration, export logic with recovery, reset logic
- `SRJ_ImbalanceMgr.mqh` — write event ID at four flag-write sites (requires council approval)

**All options except C require modification of SRJ_ImbalanceMgr.mqh, which is outside the initially allowed file set per TASK_154.md §3.**

**Council approval required for:**
- Modifying `SRJ_ImbalanceMgr.mqh` (flag-writing function modification)
- Modifying `SRJ_State.mqh` (Option B)
- Expanding task scope to two buffers (Option D3)

---

## 8. SUMMARY TABLE

| Option | Owner file | Modifies flag-writing function | Multiple-object handling | Operator decision required | Technical risk | Viability |
|--------|------------|-------------------------------|--------------------------|----------------------------|----------------|-----------|
| A — Single file-scope variable | SRJ_FlowLogic.mq5 | YES (`SRJ_ImbalanceMgr.mqh`) | OPERATOR ANSWER REQUIRED (Q1) | Q1, Q2 | Cross-file dependency | VIABLE if council approves modification |
| B — SState field | SRJ_State.mqh | YES (`SRJ_ImbalanceMgr.mqh`) | OPERATOR ANSWER REQUIRED (Q1) | Q1, Q2 | State surface expansion, reset semantics | VIABLE if council approves modification |
| C — Shadow flag with recovery | SRJ_FlowLogic.mq5 | NO | CANNOT DETERMINE | Q4 | Retrospective guessing (prohibited) | **NON-VIABLE** |
| D — Dual variables (FVG + OB) | SRJ_FlowLogic.mq5 | YES (`SRJ_ImbalanceMgr.mqh`) | Both objIds recorded | Q2, Q3 | Export encoding complexity | VIABLE if council approves modification and encoding |
| E — Event-identity | SRJ_FlowLogic.mq5 | YES (`SRJ_ImbalanceMgr.mqh`) | OPERATOR ANSWER REQUIRED (Q1) | Q1, Q2, Q4 | Retrospective recovery risk | VIABLE if retrospective recovery approved |

---

## 9. NEXT STEPS

**This document does NOT select an option or authorize implementation.**

**Required for unblocking Task 154:**

1. **OPERATOR ANSWER REQUIRED:**
   - Q1: Multiple-object selection rule (lines 199, 316) — FVG, OB, sentinel, or dual export?
   - Q2: Transport owner preference — file-scope variable or SState field?
   - Q3 (if Option D): Export encoding — which approach (D1-D5)?
   - Q4 (if Options C or E): Retrospective recovery acceptability?

2. **COUNCIL APPROVAL REQUIRED:**
   - Permission to modify `SRJ_ImbalanceMgr.mqh` (all options except C require this)
   - Permission to modify `SRJ_State.mqh` (Option B only)
   - Permission to expand task scope to two buffers (Option D3 only)

3. **PLANNER/BUILDER DECISIONS (after option selected):**
   - T1: Reset timing and ownership
   - T2: Write placement within pass
   - T3: Export-block integration
   - T4 (if Option E): Event-ID recovery logic design

**Once operator questions are answered and council approvals granted:**
- Update TASK_154.md with the selected transport option
- Resolve Contract 2 (transport mechanism) and Contract 4 (multiple-object policy)
- Mark task status: READY FOR BUILDER
- Builder may then implement the approved transport design

---

**END OF TASK 154-DESIGN**

