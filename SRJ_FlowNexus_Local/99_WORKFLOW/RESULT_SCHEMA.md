# RESULT SCHEMA

## Builder result report format

Every builder result must use this exact schema. No field may be omitted.
If a field has no content, write `NONE` or `N/A`.

```text
BUILDER RESULT
Task:                   <task ID>
Status:                 COMPLETED / PARTIAL / BLOCKED
Files read:             <list every file actually read>
Files written:          <list every file written, or NONE>
Commands failed:        <paste failed command and raw error, or NONE>
Splits declared:        <YES — list completed and resume items, or NO>
Truncations:            <describe any output truncation, or NONE>
Source findings:        <numbered list matching work items>
Requested outputs:      <each requested output with its result>
Hash or compile gate:   <raw hash output and MATCH/MISMATCH against supplied value>
Open questions:         <items requiring operator or council decision>
Next action:            <PLANNER CHECK / COUNCIL REVIEW / OPERATOR ANSWER REQUIRED / BLOCKED>
```

## Status rules

- `COMPLETED` — every requested item has a result; no item is missing or deferred.
- `PARTIAL` — at least one item has a result; at least one item could not be completed; reason stated.
- `BLOCKED` — execution could not begin or could not continue past a mandatory stop condition.

A status of `COMPLETED` is invalid if any requested item is absent from the report.

## Planner completeness check format

After receiving a builder result, the planner issues:

```text
PLANNER COMPLETENESS CHECK
Task:
Builder status received:
Items complete:         <count>
Items missing:          <count and list>
Checklist failures:     <list any BUILDER RESULT CHECK items that failed>
Normalized result:      PASS / REQUIRES CORRECTION
Correction task needed: YES / NO
If YES — correction task ID and scope:
```

## Council disposition format

After the council reviews a planner-normalized result:

```text
COUNCIL DISPOSITION
Task:
Result accepted:        YES / NO
Outstanding items:      <list>
Next authorized task:   <task ID or NONE>
Architecture decisions: <any new rulings>
Operator questions:     <any OPERATOR ANSWER REQUIRED items>
```
