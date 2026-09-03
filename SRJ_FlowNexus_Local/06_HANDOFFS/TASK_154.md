# TASK 154 — EXPORT STAGE 1, BUFFER 36

**Status:** DRAFT — PENDING COUNCIL AUTHORIZATION — **BLOCKED ON CONTRACT 4 (MULTIPLE OBJECTS IN SCOPE)**

**Form:** B

**Production edit:** NOT YET AUTHORIZED

**Compile:** NOT YET AUTHORIZED

**Run:** NOT AUTHORIZED

**Builder may start:** NO

**Council review required:** YES

**Blocking condition:** Task 160-PreJ Block A returned MULTIPLE OBJECTS IN SCOPE for 7 of 9 flag writes. Builder is FORBIDDEN from selecting among multiple objects per Council ruling 7. Deterministic selection rule required before implementation.

---

## 0. AUTHORIZATION GATE

This task document is a **Form B planning document only**. No production file may be modified, no compilation may occur, and no builder execution may begin until:

1. Task 160-PreJ Block A returns with completed corrected attribution across all seven flag-write regions
2. Council explicitly authorizes production edit and compilation
3. All gate conditions in §8 are met

**The builder is FORBIDDEN from beginning this task until explicit authorization is received.**

---

## 1. PURPOSE

Task 154 implements **Export Stage 1** — the addition of buffer 36 to `SRJ_FlowLogic.mq5` to export the identity of the object whose method wrote the `hasPersistedOpposingFVG` flag on each bar, enabling transitional provenance instrumentation while the candidate architecture is built.

This is a **byte-identity-gated, behaviour-neutral addition** under P7. The new buffer:
- Appends to FlowLogic's existing 34-buffer interface at index 36
- Exports object identity (`objId`) when an attributed write occurs
- Exports a **sentinel value** when a write occurs with NO OBJECT IN SCOPE
- Remains at 0.0 when no write occurred on that bar

Buffer 36 carries **immutable identity** data only — the `objId` value from the structural object that was IN SCOPE at the flag-write statement, as established by Task 160-PreJ Block A's corrected attribution analysis.

**COUNCIL RULING 1 APPLIED:** Buffer 36 may cover only the exact write population explicitly identified by the approved Task 154 contract. If Task 160-PreJ Block A does not identify the population unambiguously, this task is BLOCKED rather than choosing a population.

---

## 2. RESPONSIBILITY — BEFORE AND AFTER

### Before Task 154

**`hasPersistedOpposingFVG` flag:**
- Owned by: `SState` struct (locate by struct name census and brace counting in current source)
- Written by: functions identified in Task 160-PreJ Block A
- Provenance: **not exported, not attributable from EA side**
- Cleared at: `SRJ_StateInit` (locate by function name census and brace counting)

**FlowLogic buffer interface:**
- 34 buffers (indices 0–33) — locate OnInit by census and count SetIndexBuffer calls
- `indicator_buffers 34` property
- Indices 34, 35, 36 verified FREE (Task 160-PreG, EA-175)

### After Task 154

**`hasPersistedOpposingFVG` flag:**
- Ownership: **unchanged** — still owned by `SState`
- Write sites: **unchanged** — same functions
- Write semantics: **unchanged** — same RHS values

**Buffer 36 (`FL_BUF_HASPERSISTEDOPPOSINGFVG_OBJID`):**
- Ownership: FlowLogic export surface
- Responsibility: export the `objId` of the object IN SCOPE at each flag write, or a sentinel when NO OBJECT IN SCOPE
- Write location: FlowLogic `OnCalculate`, inside the per-bar pass sequence, **after the flag-writing passes complete and before the existing export block** (locate export block by census for "g_bufHasPersistedOpposingFVG[i]" or similar flag-export patterns)
- Cleared: never (buffer initialization to 0.0 is sufficient)

**FlowLogic buffer interface:**
- 37 buffers (indices 0–36)
- `indicator_buffers 37` property
- EA read model: **append-safe by design** (§8.7 Revision 60), no EA modification required

**The flag's ownership does NOT transfer to the buffer. The buffer is a read-only export bridge.**

---

## 3. ALLOWED PRODUCTION FILES AND REGIONS

This task may modify **ONLY** the following file and regions:

### 3.1 `SRJ_FlowLogic.mq5` — FOUR allowed edits only

**Edit 1: Buffer constant declaration (file-scope, column 0)**
- **Locate by:** census all existing FL_BUF_* file-scope #define declarations in current source
- **Insert:** one new #define line for `FL_BUF_HASPERSISTEDOPPOSINGFVG_OBJID` with value `36`
- **Placement:** after the last existing FL_BUF_* constant, before OnInit function (located by function name census and brace counting)
- **Byte-identical requirement:** existing FL_BUF_* lines remain unchanged

**Edit 2: indicator_buffers property modification**
- **Locate by:** census for `indicator_buffers` property declaration in current source (file-scope or within OnInit)
- **Modify:** change value from `34` to `37`
- **Requirement:** this is the ONLY modification to the property line; no other text changes

**Edit 3: Buffer registration in OnInit**
- **Locate by:** census `OnInit` function (definition-header rule, brace-count the region)
- **Locate by:** census all existing `SetIndexBuffer` calls within the OnInit region
- **Insert:** one new SetIndexBuffer call: `SetIndexBuffer(36, g_bufHasPersistedOpposingFVG_ObjId, INDICATOR_DATA);` (or equivalent per existing call pattern)
- **Placement:** after the last existing SetIndexBuffer call, before OnInit's closing brace
- **Byte-identical requirement:** all 34 existing SetIndexBuffer calls and their indices (0–33) remain unchanged

**Edit 4: Buffer-36 population logic in OnCalculate**
- **Locate by:** census `OnCalculate` function (definition-header rule, brace-count the region)
- **Locate by:** census the per-bar loop (search for `for(int i = ` or equivalent within OnCalculate)
- **Locate by:** census the existing flag-export block (search for assignments to `g_bufHasPersistedOpposingFVG[i]` or equivalent)
- **Insert:** buffer-36 population code implementing the logic specified in §5, using ONLY the attribution verdicts from Task 160-PreJ Block A
- **Placement:** inside the per-bar loop, after all flag-writing pass calls complete, before or adjacent to the existing flag-export block
- **Requirements:**
  - Implementation MUST be deterministic based on 160-PreJ Block A verdicts
  - If 160-PreJ returns multiple objects IN SCOPE for any write, BLOCKED — COUNCIL DECISION REQUIRED
  - If 160-PreJ does not provide sufficient data for deterministic implementation, BLOCKED — ADDITIONAL COUNCIL RULING REQUIRED

**PROHIBITED MODIFICATIONS:**
- NO changes to `SState` struct (locate by struct name census) or `hasPersistedOpposingFVG` field
- NO changes to any flag-writing function identified in Task 160-PreJ Block A
- NO modification of existing SetIndexBuffer calls or their indices 0–33 (P3a)
- NO renumbering or reordering of existing buffers
- NO changes to `g_zoneHi` or `g_zoneLo` global variables (see §7 prohibition)
- NO changes to the EA (`SRJ_FlowNexus_EA.mq5`)
- NO changes to any .mqh include file

---

## 4. REQUIRED PREDECESSOR EVIDENCE

This task is **GATED on Task 160-PreJ Block A** completing and returning corrected attribution verdicts.

**CRITICAL:** Task 160-PreH attribution output is VOID per Revision 60. All attribution evidence must come ONLY from the accepted Task 160-PreJ Block A result. No line numbers, verdicts, or object identifications from Task 160-PreH may be used.

### 4.1 Attribution results required from Task 160-PreJ Block A

For the `hasPersistedOpposingFVG` flag writes in `SRJ_FVG_CreationRenewalPass`:

**Task 160-PreJ must provide for EACH flag-write statement:**
- Exact statement text and its source line number (as located by Task 160-PreJ)
- RHS value (`true` or `false`)
- Full open-brace stack (outermost to innermost)
- Complete attribution verdict per Amendment 14:
  - Pointer parameters (if any) enumerated with asterisk
  - Qualifying variables (pointer-type or from create/New/Get/At calls) with declaration lines
  - For EACH candidate object: D < S test, [Dopen, Dclose] containment test, stack membership test
  - Final verdict: OBJECT objName IN SCOPE, or NO OBJECT IN SCOPE AT THIS STATEMENT
- If IN SCOPE: use trace for the attributed object (all occurrences in region)

**COUNCIL RULING 2 — TRANSPORT MECHANISM REQUIRED:** The builder MUST NOT recover objId from final flag values or call-site inference. An explicit transport mechanism spanning the flag write to the export stage is required. If Task 160-PreJ Block A does not establish a deterministic transport mechanism for objId from the write site to the buffer-36 population logic, this task is BLOCKED — COUNCIL DECISION REQUIRED on transport design.

### 4.2 Implementation determinacy requirement

**If exactly ONE object IN SCOPE:** buffer 36 writes `(double)obj.objId`

**If MULTIPLE objects IN SCOPE:** Task 154 is BLOCKED — COUNCIL DECISION REQUIRED. The builder MUST NOT select among multiple IN-SCOPE objects. A deterministic selection rule must be separately approved by council before implementation.

**If NO OBJECT IN SCOPE:** buffer 36 writes `-1.0` (sentinel)

**If Task 160-PreJ does not establish deterministic implementation for all four flag writes:** Task 154 is BLOCKED — ADDITIONAL COUNCIL RULING REQUIRED. Do not invent selection logic.

**All line numbers for edit purposes must be located by census in the current source at task execution time. Historical line numbers from any architecture document (including Revision 60 §8.9) are NOT edit anchors per P12.**

**COUNCIL RULING 2 — TRANSPORT MECHANISM:** objId must be transported via an explicit mechanism (e.g., file-scope variable, SState field, parameter passing) from the write site to the export stage. Recovery from flag values or inference is FORBIDDEN. The transport mechanism must:
- Capture objId at each flag-write site (or capture explicit NO-OBJECT state)
- Survive across pass boundaries
- Be readable by buffer-36 population logic
- Support all four write contexts identified by 160-PreJ Block A

**If no deterministic transport mechanism can be established without modifying flag-writing regions:** BLOCKED — COUNCIL DECISION REQUIRED on transport design.

**COUNCIL RULING 6 — MULTIPLE OBJECTS IN SCOPE:** The builder must distinguish:
- No event (flag not written)
- Event with no object in scope (NO OBJECT IN SCOPE verdict from 160-PreJ)
- Event with exactly one object in scope (single IN SCOPE verdict)
- Multiple objects in scope (multiple IN SCOPE verdicts)

**If ANY flag write returns multiple IN SCOPE objects:** BLOCKED — COUNCIL DECISION REQUIRED per ruling 7.

---

## 5. BUFFER-36 PAYLOAD AND SENTINEL BEHAVIOR

### 5.1 Payload when object IN SCOPE

When Task 160-PreJ Block A's attribution returns **exactly ONE object IN SCOPE** at a flag-write statement:

- Buffer 36 writes: `(double)obj.objId` where `obj` is the IN-SCOPE object
- The objId value is read from the object established by Task 160-PreJ Block A's attribution
- Implementation: copy the exact object name and member access from 160-PreJ's verdict without reinterpretation

**COUNCIL RULING 2 — TRANSPORT REQUIREMENT:** The objId value must be transported from the flag-write site to the buffer-36 export logic via an explicit transport mechanism. The builder MUST NOT:
- Infer objId from flag values
- Recover objId from call-site context after the write
- Assume objId is still available at export time

**COUNCIL RULING 4 — TRANSPORT METADATA:** The transport mechanism may include:
- Event identity (which flag write occurred)
- Bar index (the bar directly associated with the qualifying write)
- Attribution state (IN SCOPE / NO OBJECT / NO EVENT)
- objId where exactly one object is in scope
- An explicit no-object state

**If Task 160-PreJ Block A returns MULTIPLE objects IN SCOPE for any flag-write statement:**

**BLOCKED — COUNCIL DECISION REQUIRED per ruling 7**

The builder MUST NOT:
- Choose among multiple IN-SCOPE objects
- Invent a selection priority rule
- Use proximity heuristics, declaration order, or brace depth
- Make any architecture decision about which object to attribute

A deterministic selection rule must be approved by council and added to this task document before implementation may proceed.

### 5.2 Sentinel when NO OBJECT IN SCOPE

When Task 160-PreJ Block A's attribution returns **NO OBJECT IN SCOPE AT THIS STATEMENT**:

Buffer 36 writes: **`-1.0`** (sentinel value)

**Semantic meaning:** The flag write occurred under program logic that does not construct or receive an object pointer/reference in its scope. Per Amendment 14, this is a RESULT, not a failure.

Expected contexts returning NO OBJECT IN SCOPE (based on Revision 60 §12.2):
- Functions with no pointer parameters and no qualifying variable declarations
- Region-level writes (empty brace stack beyond the function's own braces)
- Initialization contexts

**The sentinel is required and valid.** It distinguishes:
- "No flag write this bar" → buffer remains 0.0
- "Flag written, no object to attribute" → buffer = -1.0
- "Flag written, attributed to objId N" → buffer = (double)N

**COUNCIL RULING 6 — STATE DISTINCTION:** The transport mechanism and buffer-36 logic must explicitly distinguish:
- No event (no flag write occurred this bar)
- Event with no object in scope (flag written, NO OBJECT IN SCOPE verdict)
- Event with exactly one object in scope (flag written, single IN SCOPE verdict)
- Multiple objects in scope (BLOCKED per ruling 7)

### 5.3 Handling when flag NOT written

When `hasPersistedOpposingFVG` is **not written** on bar `i`:

Buffer 36 at index `i` writes: **0.0** (default/no-write indicator)

This is distinct from sentinel -1.0 and from any valid objId (which are positive integers starting from 1 per `SRJ_NextObjId` implementation).

### 5.4 Write-detection logic

The buffer-36 population code MUST determine whether a flag write occurred on each bar.

**The builder MUST document which approach is chosen and why.** Permitted approaches:

**Option A — Shadow flag:**
- Declare file-scope bool initialized to `false`
- Set to `true` in or after flag-writing pass(es)
- Reset to `false` at the start of each bar
- Prohibited: modifying any flag-writing region

**Option B — Direct comparison:**
- Save the flag's value before writing passes
- Compare after passes complete
- If changed, a write occurred
- Prohibited: modifying any flag-writing region

**Option C — Per-pass tracking:**
- File-scope tracking variable
- Set by or after each flag-writing pass
- Read by buffer-36 logic
- Prohibited: modifying any flag-writing region

**The implementation approach MUST:**
- Not modify any flag-writing region identified in 160-PreJ Block A
- Not introduce race conditions with the intrabar snapshot
- Be deterministic and mechanically testable
- Be fully documented in the builder result with rationale

**If write-detection logic cannot be implemented without modifying a flag-writing region:** Task 154 is BLOCKED — COUNCIL DECISION REQUIRED on approach.

**COUNCIL RULING 4 — TRANSPORT METADATA:** The transport mechanism must include:
- Event identity (which write occurred, if any)
- Bar index directly associated with the qualifying write
- Attribution state
- objId where exactly one object is in scope
- Explicit no-object state where NO OBJECT IN SCOPE

**COUNCIL RULING 5 — BAR INDEX REQUIREMENT:** The bar index must be the index directly associated with the qualifying write. If it is not deterministically established by Task 160-PreJ Block A, this task is BLOCKED — COUNCIL DECISION REQUIRED.

---

## 6. REPLAY-PATH discoveryBar HANDLING

**Context:** Task 160-PreJ Region 1 analyzes `SRJ_OB_ReplayActivationInvalidation` which performs replay-path operations.

**Implementation requirement depends on Task 160-PreJ Block A verdict:**

**If Task 160-PreJ Block A shows this function writes `hasPersistedOpposingFVG`:**
- The flag write is attributed per 160-PreJ's verdict (pointer parameter or NO OBJECT IN SCOPE)
- **The builder MUST NOT determine replay semantics**
- **The builder MUST NOT invent bar-index mapping logic**
- Implementation is BLOCKED — COUNCIL DECISION REQUIRED on:
  1. Whether replay writes use `discoveryBar` index or live bar `i` index
  2. How the export logic detects replay context
  3. Whether replay-path handling modifies the replay function (prohibited unless explicitly approved)

**If Task 160-PreJ Block A shows this function does NOT write `hasPersistedOpposingFVG`:**
- No replay-path handling required
- Document in builder result: "Task 160-PreJ Block A confirmed no hasPersistedOpposingFVG write in SRJ_OB_ReplayActivationInvalidation"

**The builder MUST NOT:**
- Decide replay-path semantics
- Invent bar-index translation logic
- Assume replay behavior from function names or parameters
- Modify the replay function without explicit authorization

**If replay-path writes exist and implementation is ambiguous:** Task 154 is BLOCKED — COUNCIL DECISION REQUIRED.

**COUNCIL RULING 5 — BAR INDEX REQUIREMENT:** The bar index in the transport metadata must be the index directly associated with the qualifying write. For replay-path writes, if Task 160-PreJ Block A identifies `discoveryBar` as a parameter but does not establish whether it is the qualifying index, this task is BLOCKED — COUNCIL DECISION REQUIRED on bar-index semantics.

**COUNCIL RULING 4 — TRANSPORT METADATA:** The transport mechanism must capture the exact bar index where the write occurred. For replay contexts, this may require distinguishing:
- Live bar index `i`
- Replay target bar `discoveryBar`
- Replay execution bar

If Task 160-PreJ Block A does not establish which index to transport, BLOCKED — COUNCIL DECISION REQUIRED.

---

## 7. PROHIBITION ON RETIRING g_zoneHi / g_zoneLo

Task 154 **MUST NOT**:
- Modify, remove, or retire `g_zoneHi` or `g_zoneLo` global variables
- Change any read sites of these variables (locate by census `g_zoneHi` and `g_zoneLo` in current source)
- Modify write sites or clear sites (locate by census)
- Add new writes or clears
- Rename or replace these variables

**Rationale:** Zone globals are read in control flow by target and stop-reference functions (EA-171, EA-174 per Revision 60). Task 162's zone retirement depends on packet items 18–20 (Revision 60 §4) and must not be preemptively performed.

**If buffer-36 logic requires zone state:** Read the globals directly in their current form; do not create new fields or modify zone handling.

**Verification:** Builder result must confirm: census of g_zoneHi and g_zoneLo shows no modification to any occurrence.

---

## 8. PROHIBITION ON CHANGING SetIndexBuffer LINES OR RENUMBERING BUFFERS

**P3a (buffers append only) is BINDING.**

Task 154 **MUST NOT**:
- Modify any existing `SetIndexBuffer` call (locate all by census in current OnInit function)
- Change any existing buffer index value (0–33)
- Renumber or reorder buffers
- Remove or comment out any existing buffer registration
- Change any existing buffer array name
- Change any existing buffer plot type or style

**Allowed operations:**
- INSERT one new SetIndexBuffer call for buffer 36 (index MUST be 36)
- MODIFY the `indicator_buffers` property value from 34 to 37 (locate by census)

**Verification requirement:** Builder result must list:
- Pre-edit: all 34 SetIndexBuffer calls with their indices (0–33), line numbers, and full text
- Post-edit: confirmation that all 34 calls remain byte-identical
- Post-edit: the new buffer-36 SetIndexBuffer call text and line number

**The EA's FL_BUF_* constants (31 constants per EA-175) are NOT modified by this task.** The EA's read model is append-safe (§8.7 Revision 60), requiring no EA changes.

**COUNCIL RULING 8 — BUFFER VERIFICATION REQUIRED:** The builder must mechanically verify current indicator_buffers property value, all buffer array declarations, all SetIndexBuffer calls with their indices, and buffer ownership (INDICATOR_DATA vs INDICATOR_CALCULATIONS). The builder MUST NOT assume buffers 34, 35, or 36 are free. Existing buffer indices and SetIndexBuffer calls must remain unchanged.

**MECHANICAL VERIFICATION STEPS (builder verification required before implementation):**
1. Census `indicator_buffers` property in SRJ_FlowLogic.mq5 current source
2. Census all buffer array declarations (e.g., `double g_buf*[]`) at file scope
3. Census all `SetIndexBuffer` calls in OnInit function (brace-counted region)
4. Verify indices 0–33 are assigned and 34, 35, 36 are unassigned
5. Report any discrepancy as BLOCKED — COUNCIL DECISION REQUIRED

---

## 8A. MINIMAL INSTRUMENTATION AND FILE-SET CONSTRAINTS

**COUNCIL RULING 3 — MINIMAL ATTRIBUTION-ONLY INSTRUMENTATION:** Minimal attribution-only instrumentation may be proposed, but it is not authorized automatically. The builder must list every affected function and exact edit region for any instrumentation beyond the four allowed edits in §3.

**COUNCIL RULING 9 — SMALLEST NECESSARY FILE SET:** Use the smallest necessary file set. Do not modify:
- The EA (`SRJ_FlowNexus_EA.mq5`)
- `SState` struct (unless required by transport mechanism and explicitly justified)
- Zone globals (`g_zoneHi`, `g_zoneLo`, `g_touchSeen`)
- Unrelated passes (any pass not identified in Task 160-PreJ Block A as a flag writer)
- Unrelated include files (unless required for transport mechanism and explicitly allow-listed)

**PERMITTED FILE MODIFICATIONS (unless justified otherwise):**
- `SRJ_FlowLogic.mq5` ONLY
- Four edit regions specified in §3.1
- No other file may be modified unless:
  1. Required by the approved transport mechanism (Council ruling 2)
  2. Explicitly justified in planning with exact edit regions
  3. Allow-listed by council before implementation begins

**If any file beyond SRJ_FlowLogic.mq5 requires modification:** BLOCKED — COUNCIL DECISION REQUIRED on file-set expansion with complete justification.

**COUNCIL RULING 10 — STRUCTURAL LOCATION ONLY:** Do not use historical line numbers as edit anchors. Locate current regions by identifiers or structural census and use brace counting. All line numbers from Revision 60 §8.9 or any previous task are for reference only — re-locate every region by census at task execution time.

**COUNCIL RULING 11 — TASK 160-PreH ATTRIBUTION VOID:** Do not use Task 160-PreH attribution output. It is void per defect 83 and Amendment 14. All attribution data must come from Task 160-PreJ Block A ONLY.

---

## 8B. UNRESOLVED TECHNICAL CONTRACTS AND BLOCKING CONDITIONS

**COUNCIL RULING 12 — UNRESOLVED CONTRACT BLOCKING:** If any required implementation contract remains unresolved after Task 160-PreJ Block A returns, mark:

**BLOCKED — COUNCIL DECISION REQUIRED**

and do not present the task as READY FOR BUILDER.

**REQUIRED TECHNICAL CONTRACTS (must be resolved by 160-PreJ Block A or explicit council ruling):**

### Contract 1: Write population identification
- **Source:** Council ruling 1
- **Requirement:** Buffer 36 write population must be unambiguously identified by Task 160-PreJ Block A
- **Established fact from Revision 60 §12:** `hasPersistedOpposingFVG` flag writes occur in `SRJ_FVG_CreationRenewalPass`
- **Established fact from BUILDER_RESULT_160-PreJ.md Block A (A3):** Four assignment lines exist at lines 199, 226, 316, 343
- **Unresolved:** Whether all four writes are in the buffer-36 population, or only a subset
- **If unresolved:** BLOCKED — population scope ambiguous

### Contract 2: objId transport mechanism
- **Source:** Council ruling 2
- **Requirement:** Explicit transport spanning flag write to export stage
- **Prohibited:** Recovery from final flag values, call-site inference
- **Required metadata:** Event identity, bar index, attribution state, objId (where exactly one object in scope), explicit no-object state (Council ruling 4)
- **Unresolved:** Transport mechanism design (file-scope variable, SState field, parameter)
- **If unresolved:** BLOCKED — transport mechanism not established

### Contract 3: Bar index determination
- **Source:** Council ruling 5
- **Requirement:** Bar index must be the index directly associated with the qualifying write
- **Established fact from BUILDER_RESULT_160-PreJ.md:** `SRJ_FVG_CreationRenewalPass` has parameter `int i` (position 5)
- **Established fact:** Function writes inside per-bar loop at bar index `i`
- **Status:** RESOLVED if all four writes occur in the same pass at bar `i`
- **Unresolved:** If replay-path writes exist with `discoveryBar` parameter
- **If unresolved:** BLOCKED — bar index not deterministically established

### Contract 4: Multiple-object-in-scope resolution
- **Source:** Council ruling 7
- **Requirement:** Builder must never select among multiple in-scope objects
- **Established fact from BUILDER_RESULT_160-PreJ.md Block A (A4):** 
  - Line 199: newBullFVG, renewalOB IN SCOPE (2 objects)
  - Line 209: newBullFVG, renewalOB IN SCOPE (2 objects)
  - Line 210: newBullFVG, renewalOB IN SCOPE (2 objects)
  - Line 226: newBullFVG IN SCOPE (1 object)
  - Line 244: newBearFVG, renewalOB IN SCOPE (2 objects)
  - Line 316: newBearFVG, renewalOB IN SCOPE (2 objects)
  - Line 326: newBearFVG, renewalOB IN SCOPE (2 objects)
  - Line 327: newBearFVG, renewalOB IN SCOPE (2 objects)
  - Line 343: newBearFVG IN SCOPE (1 object)
- **Status:** **UNRESOLVED — 7 of 9 writes have multiple objects IN SCOPE**
- **Classification:** **BLOCKED — COUNCIL DECISION REQUIRED on selection rule for lines 199, 209, 210, 244, 316, 326, 327**

### Contract 5: Sentinel numeric value
- **Source:** Council ruling (implicit in ruling 6 state distinction)
- **Requirement:** Distinct sentinel for NO OBJECT IN SCOPE vs no write vs valid objId
- **Proposed:** 0.0 = no write, -1.0 = NO OBJECT IN SCOPE, positive = objId
- **Status:** RESOLVED unless council requires different sentinel encoding

### Contract 6: Exact code implementation
- **Source:** Council ruling (do not invent exact code)
- **Requirement:** Implementation must be mechanically derived from 160-PreJ verdicts
- **Prohibited:** Inventing object-selection rules, buffer indices, sentinel values, transport ownership
- **Status:** BLOCKED until contracts 1-4 resolved

**BLOCKING ASSESSMENT AS OF THIS REVISION:**

**Task 154 is BLOCKED on Contract 4 (multiple objects in scope).**

Seven of nine flag-write statements have MULTIPLE objects IN SCOPE per Task 160-PreJ Block A's corrected attribution. The builder is FORBIDDEN from selecting among them (Council ruling 7).

**Required council ruling:** Deterministic selection rule for choosing between `newBullFVG`/`newBearFVG` and `renewalOB` at lines 199, 209, 210, 244, 316, 326, 327.

**Possible selection approaches (council must decide):**
1. Always select the FVG object (newBullFVG or newBearFVG)
2. Always select the renewalOB object
3. Select based on declaration order
4. Select based on which object is "primary" to the write context
5. Expand buffer-36 to record multiple objIds (changes buffer design)
6. Split buffer-36 into two buffers (FVG objId and OB objId)
7. Mark these writes as ambiguous and export sentinel -2.0

**Until council decides:** Task 154 remains DRAFT, NOT READY FOR BUILDER.

---

## 8C. EVIDENCE CLASSIFICATION AND SOURCE FACTS

All content in this task is classified into the categories required by council ruling instructions.

### ESTABLISHED SOURCE FACT (from current production files, mechanically verifiable)

**From SRJ_FlowLogic.mq5 (SHA256: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5 per Revision 60 §8.6):**
- indicator_buffers property value: 34
- SetIndexBuffer calls: 34 (indices 0–33)
- Buffer indices 34, 35, 36: FREE (verified by Task 160-PreG per Revision 60 §12.4)

**From SRJ_FlowNexus_EA.mq5 (SHA256: 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 per Revision 60 §8.6):**
- FL_BUF_* constants: 31 (indices 0-1, 2-27, 29-33; gaps at 28 per EA-175)
- EA does not read buffers 34, 35, or 36
- EA read model: append-safe (Revision 60 §8.7)

**From SState struct (locate by census in SRJ_State.mqh at task execution time):**
- hasPersistedOpposingFVG field: exists, type bool

**From flag-writing functions (per Revision 60 §12 and Task 160-PreJ):**
- SRJ_FVG_CreationRenewalPass: writes hasPersistedOpposingFVG
- Functions identified in Task 160-PreJ Block A: [pending 160-PreJ completion]

### ACCEPTED 160-PreJ EVIDENCE (from BUILDER_RESULT_160-PreJ.md Block A)

**A1 — Seven regions located and bounded:**
- All seven regions from Revision 60 §12 located successfully by definition-header rule
- Brace counting confirmed for all regions
- No region required fallback search

**A2 — Parameter enumeration:**
- SRJ_OB_ReplayActivationInvalidation: 1 pointer parameter (COrderblock *ob)
- SRJ_OB_ActivationInvalidationPass: 0 pointer parameters
- SRJ_FVG_CreationRenewalPass: 0 pointer parameters
- SRJ_FVG_TickValidRecomputePass: 0 pointer parameters
- SRJ_Bias_DecisionBlock: 0 pointer parameters
- SRJ_Bias_PerBarResetPass: 0 pointer parameters
- SRJ_StateInit: 0 parameters

**A3 — hasPersistedOpposingFVG assignment lines:**
- SRJ_OB_ReplayActivationInvalidation: ABSENT (count 0)
- SRJ_OB_ActivationInvalidationPass: ABSENT (count 0)
- SRJ_FVG_CreationRenewalPass: 4 writes (lines 199, 226, 316, 343)
- SRJ_FVG_TickValidRecomputePass: ABSENT (count 0)
- SRJ_Bias_DecisionBlock: 2 writes (lines 228, 282)
- SRJ_Bias_PerBarResetPass: ABSENT (count 0)
- SRJ_StateInit: 1 write (line 329)

**A4 — Corrected attribution per Amendment 14:**

SRJ_FVG_CreationRenewalPass region (111-348):
- Line 199: newBullFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 209: newBullFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 210: newBullFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 226: newBullFVG IN SCOPE (1 object)
- Line 244: newBearFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 316: newBearFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 326: newBearFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 327: newBearFVG, renewalOB IN SCOPE (2 objects) — **MULTIPLE OBJECTS**
- Line 343: newBearFVG IN SCOPE (1 object)

SRJ_Bias_DecisionBlock region (150-371):
- Line 226: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 227: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 228: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 280: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 281: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 282: NO OBJECT IN SCOPE AT THIS STATEMENT

SRJ_StateInit region (298-490):
- Line 327: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 328: NO OBJECT IN SCOPE AT THIS STATEMENT
- Line 329: NO OBJECT IN SCOPE AT THIS STATEMENT

**Critical finding:** `hasPersistedOpposingFVG` has 4 writes in SRJ_FVG_CreationRenewalPass. These 4 writes are the ONLY writes to this flag per Task 160-PreJ Block A (A3). The writes in SRJ_Bias_DecisionBlock (lines 228, 282) and SRJ_StateInit (line 329) target DIFFERENT flags per A3 census results.

**Buffer 36 population:** Based on A3 census, buffer 36 covers the 4 writes at lines 199, 226, 316, 343 in SRJ_FVG_CreationRenewalPass ONLY.

### BUILDER VERIFICATION REQUIRED (at task execution time)

**Must verify mechanically before implementation:**
1. SRJ_FlowLogic.mq5 SHA256 matches Revision 60 stasis value
2. indicator_buffers property value = 34
3. All SetIndexBuffer calls enumerated with indices 0–33
4. Buffer indices 34, 35, 36 unassigned
5. SState struct location and hasPersistedOpposingFVG field existence
6. SRJ_FVG_CreationRenewalPass location by census and brace-counted range
7. Current line numbers for all four flag-write statements (may differ from 160-PreJ if source changed)
8. OnInit and OnCalculate function locations by census
9. Per-bar loop location in OnCalculate
10. Existing flag-export block location

### COUNCIL DECISION REQUIRED

**Unresolved contract 4 (multiple objects in scope):**
- 7 of 9 total flag writes have multiple objects IN SCOPE
- Selection rule for buffer-36 population at lines 199, 209, 210, 244, 316, 326, 327
- Possible approaches listed in §8B Contract 4

**If additional files require modification:**
- Transport mechanism implementation may require modifying files beyond SRJ_FlowLogic.mq5
- Each file must be explicitly justified and allow-listed

**If buffer-36 population differs from the 4 hasPersistedOpposingFVG writes:**
- Council must specify which write subset to cover
- Rationale for exclusions must be documented

---

## 9. CHECKPOINT REQUIREMENTS

Before ANY production file modification:

### 9.1 Local repository checkpoint

Per P14 and Revision 60 §3.4 item 4:
- Create rollback checkpoint in local repository (`D:\` path per Revision 60 §19)
- Checkpoint name: `CHECKPOINT_TASK_154_PRE_EDIT`
- Must capture: `SRJ_FlowLogic.mq5` SHA256 and full file content
- Timestamp: recorded in checkpoint metadata

### 9.2 Checkpoint verification

Before proceeding to implementation:
- Confirm checkpoint created successfully
- Verify checkpoint file is readable
- Record checkpoint location in task result

**If checkpoint creation fails, STOP. Do not proceed with production edit.**

---

## 10. NAMED-FILE COMPILE GATE

Per P7, Task 154 compiles **FlowLogic only** (`SRJ_FlowLogic.mq5`).

### 10.1 Pre-compile verification

Before issuing compile command:
- Confirm: `SRJ_FlowNexus_EA.mq5` SHA256 matches Revision 60 §8.6 control digest `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
- If EA digest MISMATCHES, BLOCKED. Production tree is not in expected state.

### 10.2 Compile command

Exact command:
```
<MetaEditor compile command for SRJ_FlowLogic.mq5>
```

**Do NOT use Compile All.**

**If compilation fails:**
- Report exact error message
- Report all modified line ranges
- STOP. Do not proceed to EA hash gate.

### 10.3 Post-compile capture

After successful FlowLogic compilation:
- Record: new FlowLogic .ex5 timestamp
- Record: new FlowLogic .mq5 SHA256 (should be changed)
- Verify: FlowLogic .ex5 file exists and timestamp is recent

---

## 11. EA HASH CONTROL-FILE GATE

Per Revision 60 §8.6, the EA `.mq5` is the control file for stages 1–3.

**EA digest MUST match Revision 60 stasis value EXACTLY:**
- Expected: `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
- If EA digest changes at ANY point during Task 154, BLOCKED

**Verification points:**
1. Before Task 154 begins (task precondition)
2. Before FlowLogic compile (§10.1)
3. After FlowLogic compile (before run)
4. After Tier 1 run (EA recompile check)

**EA `.ex5` timestamp is NOT the gate.** Only the `.mq5` SHA256 digest.

---

## 12. TIER 1 BYTE-IDENTITY GATE

Task 154 is **byte-identity-gated** per Revision 60 §3.4 item 3.

### 12.1 Tier 1 harness specification

From Revision 60 §8.11:
- Window: 08/14/2026 – 08/22/2026
- Bars: 1,728
- Runtime: ~25 minutes
- Mode: real ticks always (verified from journal)
- Fingerprint: `SRJ XOB-PROMOCENSUS` line must show 372 real ticks

### 12.2 Baseline comparison

**Baseline log:** `D:\Videos\Task 135 Full Logs.txt` (Tier 1 baseline)

**Comparison method:**
1. Run Tier 1 harness with modified FlowLogic + unmodified EA
2. Capture full Expert log
3. Filter to strategy-relevant lines (exclude buffer-36 itself, exclude timestamps, exclude `[ObjId:` diagnostics if introduced)
4. Byte-compare filtered log to baseline

**Strategy-relevant lines include:**
- All `SRJ BIASSTEP` lines
- All `SRJ S1` through `SRJ S5` lines  
- All `SRJ SIGNAL` lines
- All `BIASCENSUS_FINAL` lines
- All `XOB-PROMOCENSUS` lines
- All state transition lines
- All alert lines

**GATE VERDICT:**
- If byte-identical (after filtering): **PASS**, proceed to report
- If ANY difference in strategy-relevant lines: **BLOCKED**, do not proceed

**Buffer-36 export lines are NOT strategy-relevant.** New export may appear in log; this is expected and does not block.

### 12.3 Blocking on differences

If Tier 1 regression shows strategy differences:
- Report: first differing line number in both logs
- Report: context (5 lines before and after)
- Report: affected bar time and bar number
- Classification: **BLOCKED**, Task 154 has introduced behaviour change
- Do NOT proceed to deliverable

**NO TOLERANCE for strategy drift.** Byte-identity is the requirement.

---

## 13. EXPLICIT-DELTA RULE

Per Revision 60 §3.4 item 3:

Task 154 is **inert** — it introduces no strategy behaviour change.

**Expected deltas:**
- FlowLogic buffer count: 34 → 37
- FlowLogic .mq5 SHA256: changes (new buffer code)
- FlowLogic .ex5 timestamp: new
- EA .mq5 SHA256: **NO CHANGE** (control file)
- EA .ex5 timestamp: **NO CHANGE**
- Strategy log: **NO CHANGE** (byte-identical after filtering)

**Unexpected deltas (any ONE blocks the task):**
- EA .mq5 digest changes
- EA .ex5 timestamp changes (EA recompiled)
- Strategy-relevant log lines differ
- `BIASCENSUS_FINAL bars=` count changes
- Alert count changes
- State-transition sequence changes
- Signal timing changes

**If any unexpected delta occurs:**
- Classification: **BLOCKED**
- Root cause: Task 154 implementation modified behaviour-affecting code
- Resolution: rollback from checkpoint, revise implementation, re-run

---

## 14. EXACT STOP CONDITIONS

Task 154 execution MUST STOP immediately if:

1. **Task 160-PreJ Block A not completed**
   - Stop before: any planning or implementation work
   - Reason: attribution data not available

2. **Council authorization not received**
   - Stop before: any production file modification
   - Reason: Form B pending approval

3. **Checkpoint creation fails**
   - Stop before: any production file modification
   - Reason: rollback capability not established

4. **Pre-compile EA digest mismatch**
   - Stop before: FlowLogic compile command
   - Reason: production tree not in expected state

5. **FlowLogic compilation errors**
   - Stop before: run attempt
   - Reason: implementation has syntax/type errors

6. **Mid-task EA digest change**
   - Stop before: completing task
   - Reason: control file modified (P7 violation)

7. **Tier 1 regression shows behaviour difference**
   - Stop before: marking task complete
   - Reason: byte-identity gate failed, behaviour change detected

8. **Attribution verdict from 160-PreJ is ambiguous or incomplete**
   - Stop before: writing buffer-36 population code
   - Reason: multiple objects IN SCOPE with no selection rule, or insufficient data for deterministic implementation
   - Classification: BLOCKED — COUNCIL DECISION REQUIRED

9. **Replay-path handling cannot be determined from 160-PreJ**
   - Stop before: writing buffer-36 population code
   - Reason: replay writes exist but implementation approach is ambiguous
   - Classification: BLOCKED — COUNCIL DECISION REQUIRED

10. **Write-detection logic requires modifying flag-writing regions**
    - Stop before: implementation
    - Reason: prohibited modification required for implementation
    - Classification: BLOCKED — COUNCIL DECISION REQUIRED

**On any stop condition:**
- Report: which condition triggered stop
- Report: current task state (checkpoint taken? compile attempted? run attempted?)
- Rollback: restore from checkpoint if any production file was modified
- Status: Task 154 marked BLOCKED or STOPPED pending resolution

---

## 14A. BUILDER PROHIBITIONS — DECISIONS THE BUILDER MUST NOT MAKE

The builder executing Task 154 is FORBIDDEN from deciding:

### Architecture and ownership
- Which component owns any data or responsibility
- Whether a behavior or design is defective
- Whether an implementation approach violates P13 or any other prohibition
- Object lifecycle or snapshot semantics

### Strategy meaning
- What any flag value means strategically
- Which object is "correct" to attribute when multiple are IN SCOPE
- Whether a sentinel value is appropriate for a given context
- Replay-path behavior or bar-index semantics

### Object selection policy (when multiple IN SCOPE)
- Which of multiple IN-SCOPE objects to select
- Selection priority rules (declaration order, proximity, brace depth)
- Tie-breaking heuristics
- Attribution "reasonableness" or "correctness"

### Implementation approach (when ambiguous)
- Which write-detection approach to use (unless only one is feasible)
- Whether to modify flag-writing regions (always PROHIBITED)
- How to detect replay context
- Where to insert buffer-36 population logic (beyond "after passes, before export")

**If any decision above is required and not determinable from Task 160-PreJ Block A result:**

Task 154 is **BLOCKED — COUNCIL DECISION REQUIRED**

The builder MUST:
- Stop before implementation
- Report the specific ambiguity or missing data
- List the decision required
- NOT proceed with any "reasonable" or "probable" choice

**The builder MAY decide:**
- Exact variable names for shadow flags or tracking (following project conventions)
- Exact insertion line numbers (within allowed regions)
- Comment text (beyond the required §16 comments)
- Formatting and whitespace (following existing code style)

---

## 15. BUILDER RESULT SCHEMA

When Task 154 execution begins (regardless of completion), the builder result MUST contain:

### 15.1 Header block

```
BUILDER RESULT — TASK 154
Status: [COMPLETED | BLOCKED | STOPPED]
Form: B
Production edit: [YES | NO]
Compile: [YES | NO]
Run: [YES | NO]
Files modified: [list or NONE]
Checkpoint taken: [YES | NO | NOT APPLICABLE]
Checkpoint location: [path or N/A]
Stop reason: [if STOPPED, which gate or condition]
```

### 15.2 Precondition confirmation

```
Task 160-PreJ Block A status: [COMPLETED | NOT COMPLETED]
If NOT COMPLETED: STOPPED before any planning or implementation
Council authorization received: [YES | NO]
If NO: STOPPED before any production file modification
Attribution data available from 160-PreJ: [YES | NO | AMBIGUOUS]
If AMBIGUOUS: [describe ambiguity — multiple objects IN SCOPE, missing data, etc.]
```

### 15.3 Attribution summary (copied verbatim from 160-PreJ Block A)

**For `hasPersistedOpposingFVG` flag writes identified by Task 160-PreJ:**

```
Statement 1: [source line as located by census]: [text]
  Attribution verdict from 160-PreJ: [OBJECT objName IN SCOPE | NO OBJECT IN SCOPE]
  If object: objId source = [parameter | variable at declaration line DDD]
  Buffer-36 implementation: [writes objName.objId | writes -1.0 | BLOCKED — multiple IN SCOPE | BLOCKED — ambiguous]

Statement 2: [same format]
Statement 3: [same format]
Statement 4: [same format]
```

**If any statement returns multiple objects IN SCOPE:**
```
BLOCKED — COUNCIL DECISION REQUIRED
Reason: Task 160-PreJ Block A returned N objects IN SCOPE for statement at line NNN
Builder cannot select among: [list object names]
Deterministic selection rule required before implementation may proceed
```

### 15.4 Current-source region location (performed before any edit)

```
Regions located by census in current source (SHA256: [digest]):

FL_BUF_* constant region:
  - First FL_BUF constant: line NNN
  - Last FL_BUF constant: line NNN
  - Insertion point for buffer-36 constant: after line NNN

OnInit function:
  - Located by: census "OnInit" function name
  - Definition header: line NNN
  - Brace-counted range: NNN–NNN
  - SetIndexBuffer calls: NNN–NNN (count: 34, indices 0–33 verified)
  - indicator_buffers property: line NNN, current value "34"

OnCalculate function:
  - Located by: census "OnCalculate" function name
  - Definition header: line NNN
  - Brace-counted range: NNN–NNN
  - Per-bar loop: line NNN
  - Existing flag-export block: line NNN–NNN
  - Insertion point for buffer-36 logic: [line or after line NNN]

hasPersistedOpposingFVG flag-writing functions per 160-PreJ:
  - [function name]: located at lines NNN–NNN (census + brace count)
  - [list all functions identified by 160-PreJ]
```

### 15.5 Implementation details (if edit proceeded)

```
Buffer constant: FL_BUF_HASPERSISTEDOPPOSINGFVG_OBJID = 36
  - Inserted at: line NNN
  - Text: [exact line text]

indicator_buffers property modification:
  - Line: NNN
  - Pre-edit: indicator_buffers 34
  - Post-edit: indicator_buffers 37

SetIndexBuffer call for buffer 36:
  - Inserted at: line NNN
  - Text: [exact line text]

Export logic location:
  - OnCalculate line range: NNN–NNN
  - Write-detection approach: [Option A | Option B | Option C]
  - Rationale for approach: [builder's documented reason]

Replay-path handling:
  - Task 160-PreJ verdict on SRJ_OB_ReplayActivationInvalidation: [writes flag | does not write flag]
  - If writes: [implementation approach | BLOCKED — council decision required]
  - If does not write: no replay handling required
```

### 15.6 SetIndexBuffer byte-identity verification

```
Pre-edit SetIndexBuffer calls (must remain byte-identical):
  Line NNN: [full text] — Post-edit: [UNCHANGED | MODIFIED]
  Line NNN: [full text] — Post-edit: [UNCHANGED | MODIFIED]
  ... [all 34 existing calls listed]

If any existing call MODIFIED: BLOCKED — P3a violation
```

### 15.7 File modifications

For each modified file:
```
File: [path]
Edit 1: Buffer constant declaration
  - Pre-edit SHA256: [digest]
  - Line NNN: inserted [text]
Edit 2: indicator_buffers property
  - Line NNN: modified "34" → "37"
Edit 3: SetIndexBuffer call
  - Line NNN: inserted [text]
Edit 4: Buffer-36 population logic
  - Lines NNN–NNN: inserted [N lines]
Post-edit SHA256: [digest]
Line count change: [+N lines]
```

### 15.8 Compilation results

```
Compilation attempted: [YES | NO]
If NO: [reason — precondition failed, ambiguous attribution, etc.]

If YES:
  Compilation result: [SUCCESS | FAILED]
  If FAILED: [exact error messages]
  If SUCCESS:
    FlowLogic .ex5 timestamp: [new timestamp]
    EA .mq5 SHA256 verified unchanged: [YES | NO]
    If EA changed: BLOCKED — P7 violation
```

### 15.9 Tier 1 regression results

```
Tier 1 run attempted: [YES | NO]
If NO: [reason]

If YES:
  Run completed: [YES | NO]
  Runtime: [NN minutes]
  Bars processed: [N]
  Fingerprint: [SRJ XOB-PROMOCENSUS line]
  Real ticks: [verified YES | NO]

  Baseline comparison:
    Baseline: D:\Videos\Task 135 Full Logs.txt
    Test log: [path]
    Strategy-relevant lines: [byte-identical | DIFFER at line NNN]
    If DIFFER: [context]

  GATE VERDICT: [PASS | BLOCKED]
  If BLOCKED: [reason]
```

### 15.10 Delta summary

```
Expected deltas:
  - FlowLogic buffer count: 34 → 37 [YES | NO]
  - FlowLogic .mq5 SHA256 changed: [YES | NO]
  - FlowLogic .ex5 timestamp new: [YES | NO]
  - EA .mq5 SHA256 unchanged: [YES | NO]
  - Strategy log byte-identical: [YES | NO]

Unexpected deltas detected: [NONE | list]
If any unexpected delta: BLOCKED

Zone global verification:
  - g_zoneHi census: [N occurrences, NONE modified | line NNN modified — BLOCKED]
  - g_zoneLo census: [N occurrences, NONE modified | line NNN modified — BLOCKED]
```

### 15.11 Final status

```
Task 154 completion status: [COMPLETED | BLOCKED | STOPPED]

If COMPLETED:
  - All gates passed
  - Byte-identity confirmed
  - Buffer-36 operational per 160-PreJ verdicts
  - All prohibitions verified

If BLOCKED:
  - Blocking condition: [specific reason]
  - Council decision required on: [specific ambiguity or missing data]
  - Rollback status: [checkpoint restored | no edit performed]

If STOPPED:
  - Stop condition: [precondition not met, authorization not received, etc.]
  - State at stop: [checkpoint taken: YES/NO, compile attempted: YES/NO]
  - No rollback needed: [YES — no edit performed | NO — rollback from checkpoint]
```

---

## 16. BUFFER-36 COMMENT REQUIREMENTS

Per Revision 60 §12.2:

The buffer-36 declaration and registration MUST include comments stating:

1. **Purpose:** "Exports the objId of the object whose method wrote hasPersistedOpposingFVG on each bar"

2. **Population:** "This buffer names a flag-setter population, which may differ from any candidate's bound object"

3. **Transitional nature:** "This is a bridge pending the candidate registry. NOT the final provenance architecture."

4. **Rollback asymmetry:** "The flag (hasPersistedOpposingFVG) rolls back with g_s on the intrabar path. The object (via objId) does NOT roll back (EA-159). The exported objId reflects the object that existed when the flag was written, even if that object is subsequently deleted intrabar."

5. **Sentinel semantics:** "0.0 = no flag write this bar; -1.0 = flag written with NO OBJECT IN SCOPE; positive value = objId of attributed object"

**Without these comments, P13 applies:** a future reader finds identity buffers and concludes provenance was solved, hiding the singleton.

---

## 17. TASK METADATA

```
Task number: 154
Task name: Export Stage 1, Buffer 36
Form: B (production edit)
Depends on: Task 160-PreJ Block A (corrected attribution)
Blocks: Tasks 155, 156 (export stages 2–3 ride on this)
Related findings: EA-152, EA-159, EA-172, EA-175
Related prohibitions: P3a, P7, P12, P13, P16
Specification source: Revision 60 §12
Compile target: SRJ_FlowLogic.mq5 only
Regression tier: Tier 1 (byte-identity)
Estimated compile time: <1 minute
Estimated run time: ~25 minutes
Risk level: LOW (append-only, byte-identity-gated)
Rollback: checkpoint available, mechanical
```

---

## 18. COUNCIL AUTHORIZATION SIGNATURE BLOCK

**This section to be completed by council upon approval:**

```
Task 154 Form B reviewed: [DATE]
Reviewed by: [COUNCIL MEMBER]
Authorization decision: [APPROVED | DEFERRED | REJECTED]
If approved:
  - Production edit authorized: [YES]
  - Compile authorized: [YES]
  - Builder may begin: [YES]
If deferred/rejected:
  - Reason: [text]
  - Required changes: [text]
  - Re-review required: [YES | NO]

Council signature: ___________________________
Date: ___________________________
```

---

**END OF TASK 154 PLANNING DOCUMENT**

**REMINDER: This is a DRAFT. Builder execution is FORBIDDEN until council authorization is received and Task 160-PreJ Block A completes.**

---

## TASK 154 TECHNICAL DRAFT RESULT

**Status:** BLOCKED — COUNCIL DECISION REQUIRED

**File:** C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\TASK_154.md

**Task remains draft:** YES

**Production files modified:** NONE

**Compile:** NO

**Run:** NO

**Unresolved technical contracts:**

1. **Contract 4 — Multiple objects in scope (BLOCKING):**
   - Task 160-PreJ Block A (BUILDER_RESULT_160-PreJ.md) returned corrected attribution
   - 4 hasPersistedOpposingFVG writes identified in SRJ_FVG_CreationRenewalPass (lines 199, 226, 316, 343)
   - Attribution results (A4):
     * Line 199: newBullFVG, renewalOB IN SCOPE (2 objects)
     * Line 226: newBullFVG IN SCOPE (1 object)
     * Line 316: newBearFVG, renewalOB IN SCOPE (2 objects)
     * Line 343: newBearFVG IN SCOPE (1 object)
   - 2 of 4 writes (lines 199, 316) have MULTIPLE objects IN SCOPE
   - Builder is FORBIDDEN from selecting between newBullFVG/newBearFVG and renewalOB (Council ruling 7)
   - **Required:** Deterministic selection rule from council
   - **Possible approaches:** Always select FVG object, always select renewalOB, select by declaration order, split into two buffers, mark ambiguous writes with special sentinel
   - **Classification:** BLOCKED — COUNCIL DECISION REQUIRED

2. **Contract 2 — objId transport mechanism (DESIGN REQUIRED):**
   - Explicit transport spanning flag write to export stage required (Council ruling 2)
   - Prohibited: recovery from flag values, call-site inference
   - Required metadata: event identity, bar index, attribution state, objId (where one object), explicit no-object state (Council ruling 4)
   - **Status:** Design not yet specified; depends on resolution of Contract 4
   - **Classification:** COUNCIL DECISION REQUIRED on transport mechanism design

3. **Contract 1 — Write population identification (RESOLVED):**
   - Task 160-PreJ Block A (A3) identified 4 writes in SRJ_FVG_CreationRenewalPass
   - Lines 199, 226, 316, 343
   - **Status:** RESOLVED — population unambiguously identified
   - Buffer 36 covers these 4 writes ONLY

4. **Contract 3 — Bar index determination (RESOLVED):**
   - All 4 writes occur in SRJ_FVG_CreationRenewalPass at bar index `i` (parameter position 5)
   - No replay-path writes to hasPersistedOpposingFVG (SRJ_OB_ReplayActivationInvalidation A3 result: ABSENT)
   - **Status:** RESOLVED — bar index = `i` for all writes

5. **Contract 5 — Sentinel numeric value (RESOLVED):**
   - 0.0 = no write, -1.0 = NO OBJECT IN SCOPE, positive = objId
   - **Status:** RESOLVED unless council requires different encoding

6. **Contract 6 — Exact code implementation (BLOCKED):**
   - Depends on resolution of Contracts 1, 2, 4
   - **Status:** BLOCKED until selection rule and transport mechanism established

**Builder may start:** NO

**Council review required:** YES

**Council must decide:**
1. Selection rule for multiple-object writes (lines 199, 316) — BLOCKING
2. Transport mechanism design (file-scope variable, SState field, parameter)
3. Whether buffer-36 population covers all 4 writes or a subset

**Checkpoint and hash preservation:**
- Checkpoint, hash comparison, compile gates, and Tier 1 byte-identity gates remain applicable
- All prohibitions (P3a, P7, P10, P11, P12, P13) remain in force
- Explicit-delta rule applies (Revision 60 §3.4 item 3)

**Task 154 classification:** DRAFT — NOT READY FOR BUILDER until Contract 4 resolved.

---

**COUNCIL RULINGS APPLIED:**

1. ✓ Buffer 36 covers only explicit write population (§1, §8B Contract 1)
2. ✓ No objId recovery from final flag values or call-site inference (§4.1, §4.2, §5.1)
3. ✓ Minimal instrumentation not auto-authorized; requires listing affected functions (§8A)
4. ✓ Transport metadata requirements specified (§4.2, §5.1, §5.4)
5. ✓ Bar index must be directly associated with qualifying write (§5.4, §6, §8B Contract 3)
6. ✓ State distinction documented (no event / no object / one object / multiple objects) (§5.2, §8B Contract 4)
7. ✓ Builder MUST NOT select among multiple objects — BLOCKING (§4.2, §5.1, §8B Contract 4)
8. ✓ Buffer verification required — mechanical verification steps listed (§8)
9. ✓ Smallest necessary file set — prohibitions on EA, SState, unrelated passes (§8A)
10. ✓ Structural location only — no historical line numbers as anchors (§8A)
11. ✓ Task 160-PreH void — all attribution from 160-PreJ only (§4, §8A)
12. ✓ Unresolved contracts block task — documented in §8B, blocking status in header

**Evidence classification applied:**
- ESTABLISHED SOURCE FACT: §8C (FlowLogic/EA SHA256, buffer counts, file structure)
- ACCEPTED 160-PreJ EVIDENCE: §8C (A1-A4 attribution results, write enumeration)
- BUILDER VERIFICATION REQUIRED: §8C (10 mechanical verification steps)
- COUNCIL DECISION REQUIRED: §8C (Contract 4 selection rule, transport mechanism, file-set expansion)

**No exact code invented. No object-selection rules invented. No buffer indices invented beyond 36 (established). No sentinel values invented beyond -1.0/0.0 (proposed). No transport ownership assumed.**


