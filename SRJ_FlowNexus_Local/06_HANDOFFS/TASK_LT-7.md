# LT-7 — BUILDER TASK

Task ID: LT-7
Status: READY FOR BUILDER
Form: D — source-only extraction and mapping
Title: ComputeSlReference Enclosure and ReadFlow Direction
Authorized by: Council (Rev060)

---

## Purpose

Complete the two residual source closures from the council disposition. Locate
`ComputeSlReference` and `ReadFlow` in the canonical source. Determine the
brace-counted regions, all parameters and their direction, the enclosing
function for the 17 `g_zoneHi`/`g_zoneLo` reader lines in the 921–1063 span,
and collect raw SHA256 hashes for both `.mq5` files. No edit, compile, run, or
canonical-tree write.

---

## Do not

- Edit any file.
- Compile.
- Run.
- Read archived copies.
- Use old line numbers as anchors.
- Infer parameter direction from a call site.
- Provide architecture or strategy opinions.
- Write any file to the canonical tree.

---

## Read

Canonical tree only:

```
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
```

Allowed files:

- `MQL5\Experts\SRJ_FlowNexus_EA.mq5`
- `MQL5\Indicators\SRJ_FlowLogic.mq5`
- `MQL5\Include\SRJ\SRJ_Alerts.mqh`
- `MQL5\Include\SRJ\SRJ_BiasEngine.mqh`
- `MQL5\Include\SRJ\SRJ_Draw.mqh`
- `MQL5\Include\SRJ\SRJ_Fractals.mqh`
- `MQL5\Include\SRJ\SRJ_HTFEngine.mqh`
- `MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh`
- `MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh`
- `MQL5\Include\SRJ\SRJ_Panels.mqh`
- `MQL5\Include\SRJ\SRJ_SeedFormat.mqh`
- `MQL5\Include\SRJ\SRJ_Sessions.mqh`
- `MQL5\Include\SRJ\SRJ_State.mqh`
- `MQL5\Include\SRJ\SRJ_Text.mqh`
- `MQL5\Include\SRJ\SRJ_TickCore.mqh`
- `MQL5\Include\SRJ\SRJ_Types.mqh`

---

## Rule block

(Verbatim census rules — see
`03_SPECIFICATIONS\CensusRules\CENSUS_RULES_VERBATIM.txt`
which is pasted into the builder execution record below.)

RULE 1 — DEFINITION-HEADER DETECTION: A candidate line must not begin with
whitespace, must not begin with "//", must contain NAME in a non-incidental
code position, and must be immediately followed by "(" (after optional spaces).

RULE 2 — INCIDENTAL OCCURRENCE: An occurrence is incidental if either edge of
the identifier token is adjacent to another identifier character. Non-incidental
requires both edges clear.

RULE 3 — CLASSIFICATION: Match closing paren. Scan for ";"-ending line before
opening brace → DECLARATION. Find "{" within 12 lines after closing paren,
match its closing brace by counting → DEFINITION.

RULE 4 — LOCATE WITH FALLBACK: Phase 1 = column-0 candidates only. Phase 2 =
any indentation if Phase 1 yields no definition.

RULE 5 — LINE COUNTS: Report header line, param-closing line, opening-brace
line, brace-counted closing line, count header-to-close, count open-to-close.

RULE 8 — BRACE STACK: Stack for line LN = all map entries E where
E.open < stmt_pos(LN) <= E.close, sorted outermost first.

RULE 9 — PARAMETER TABLE: Extract from definition header. byref = "&" in
parameter text. Direction from definition only, never from call site.

RULE 10 — LEGAL ANSWERS: ABSENT, UNKNOWN, NO DEFINITION FOUND, NOT ENCLOSED,
INSTRUMENT LIMITATION — NON-ASSIGNING OCCURRENCE STACK NOT COMPUTABLE UNDER
CURRENT PIN.

RULE 12 — HASH GATE: SHA256, raw output, compare against supplied values,
report MATCH or MISMATCH. MISMATCH = BLOCKED.

RULE 13 — NO ELLIPSIS in source pastes.

RULE 14 — PARAMETER DIRECTION FROM DEFINITION ONLY.

---

## Work items

### 1. ComputeSlReference

1.1. Locate the full identifier `ComputeSlReference` in all allowed files.
1.2. Report every candidate line and file found.
1.3. Classify each candidate as DEFINITION or DECLARATION per Rule 3.
1.4. For each DEFINITION, report:
     - File
     - Header line number
     - Parameter-list closing line number
     - Opening brace line number
     - Brace-counted closing line number
     - Line count (header to closing brace inclusive)
     - Line count (opening brace to closing brace inclusive)
1.5. List all parameters by position: text, variable name, byref (Y/N), byval (Y/N).
1.6. Paste the complete region from header line through closing brace line,
     one line per output line with line numbers, no ellipses.

### 2. ReadFlow

2.1. Locate the full identifier `ReadFlow` in all allowed files.
2.2. Report every candidate line and file found.
2.3. Classify each candidate as DEFINITION or DECLARATION per Rule 3.
2.4. For each DEFINITION, report:
     - File
     - Header line number
     - Parameter-list closing line number
     - Opening brace line number
     - Brace-counted closing line number
     - Line count (header to closing brace inclusive)
     - Line count (opening brace to closing brace inclusive)
2.5. List all parameters by position: text, variable name, byref (Y/N), byval (Y/N).
2.6. State the direction of parameter at position 2 from the definition header
     and body. Legal answers: by-reference, by-value. Source: definition only.
2.7. Paste the complete definition region, no ellipses.

### 3. Zone-reader line enclosure

3.1. From the canonical EA source, locate every line in the range 921–1063
     (inclusive) that contains `g_zoneHi` or `g_zoneLo` in a non-comment,
     non-string code position.
3.2. For each such line, state:
     - Line number
     - Whether it is a code line or a comment line
     - The name of the enclosing function
     - The brace-counted range of that enclosing function (header line – closing line)
3.3. Report the total count of code lines and the total count of comment lines
     separately.
3.4. If the brace stack for a non-assigning occurrence cannot be computed under
     the current harness, report:
     `INSTRUMENT LIMITATION — NON-ASSIGNING OCCURRENCE STACK NOT COMPUTABLE
     UNDER CURRENT PIN`
     Do not call it absent source evidence.

### 4. Hash gate

4.1. Run SHA256 on `MQL5\Experts\SRJ_FlowNexus_EA.mq5`.
     Paste the raw output exactly.
     Compare against: `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
     Report MATCH or MISMATCH.

4.2. Run SHA256 on `MQL5\Indicators\SRJ_FlowLogic.mq5`.
     Paste the raw output exactly.
     Compare against: `d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5`
     Report MATCH or MISMATCH.

4.3. If either hash is MISMATCH, stop and report BLOCKED. Do not deliver
     source findings from a mismatched file.

---

## Stop conditions

- Stop immediately if a hash is MISMATCH.
- Stop immediately if a required identifier is absent from all allowed files
  and no fallback definition is found. Report `NO DEFINITION FOUND`.
- Stop immediately if any ambiguity arises that is not covered by a legal
  answer. Report BLOCKED with reason.
- Do not continue past a failed command unless the task explicitly permits it.

---

## Required report format

Use the schema from `99_WORKFLOW\RESULT_SCHEMA.md`:

```
BUILDER RESULT
Task:
Status: COMPLETED / PARTIAL / BLOCKED
Files read:
Files written:
Commands failed:
Splits declared:
Truncations:
Source findings:
Requested outputs:
Hash or compile gate:
Open questions:
Next action:
```

Status may only be COMPLETED if every work item (1.1–4.2) has a reported
result. Any missing item requires PARTIAL or BLOCKED.

---

## PLANNER SELF-CHECK

- [x] Exactly one task is being issued.
- [x] Task ID is unique (LT-7).
- [x] Form is stated (D).
- [x] Canonical source path is stated.
- [x] Allowed files are stated (16 files).
- [x] Forbidden actions are stated.
- [x] Every function name is supplied in full.
- [x] No old line number is used as an anchor.
- [x] Every region has a locating method (full identifier census).
- [x] Every requested classification has a falsifiable paste requirement.
- [x] Every possible zero result is allowed (ABSENT / NO DEFINITION FOUND).
- [x] Every missing-source result has a legal answer.
- [x] No strategy decision is delegated to the builder.
- [x] No architecture decision is delegated to the builder.
- [x] Form D contains the complete verbatim census-rule block (above).
- [x] No placeholder remains.
- [x] Hash values are supplied.
- [x] Compile and run restrictions are explicit.
- [x] The task is small enough for the builder.

---

PLANNER RESULT
Task: LT-7
Form: D
Task file: 06_HANDOFFS\TASK_LT-7.md
Builder may start: YES
Blocked reason: NONE
Operator answer required: NONE
