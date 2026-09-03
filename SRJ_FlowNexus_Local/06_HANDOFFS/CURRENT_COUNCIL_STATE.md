# CURRENT COUNCIL STATE

Project: SRJ Flow Nexus
Revision: Rev060
Mode: alert-only
Execution: disabled
Live trading: disabled
Production edits currently authorized: none

## Roles

- Council reviewer: external web conversation
- Planner: Kiro (Sonnet-class planning)
- Builder: Kiro (literal execution)
- Operator: human approval and relay

## Current task

Task: LT-7
Form: D
Title: ComputeSlReference Enclosure and ReadFlow Direction
Status: AUTHORIZED TO PROCEED

## LT-7 purpose

Complete the two residual source closures from the council report:

1. Locate and read the definition of `ComputeSlReference`.
2. Name the enclosing function and brace-counted range for the 17 zone-reader lines in the 921–1063 span.
3. Locate and read the definition of `ReadFlow`.
4. Determine the direction of its position-2 parameter from the definition header and body.
5. Preserve the instrument limitation for reader-line brace stacks unless the task explicitly computes them.

## Allowed source

Canonical tree only:

```text
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
```

Allowed files:

- `MQL5\Experts\SRJ_FlowNexus_EA.mq5`
- `MQL5\Indicators\SRJ_FlowLogic.mq5`
- all 14 files in `MQL5\Include\SRJ\`

## Prohibited

- No production edit.
- No compile.
- No run.
- No file written to the canonical tree.
- No archived source copies.
- No old line number used as an anchor.
- No inferred parameter direction from a call site.
- No strategy or architecture opinion.
- No comparison with expected counts from earlier reports.

## Required evidence

The builder must:

1. Use the full supplied identifier for every function census.
2. Apply the complete census rule block included by the planner.
3. Locate every candidate and classify it.
4. Brace-count the relevant definitions.
5. Report both:
   - header-to-closing range;
   - opening-brace-to-closing range.
6. Paste the required source regions without abbreviation.
7. Report all relevant parameters and their direction.
8. Report the 17 zone-reader lines and their enclosing function if computable.
9. Report any remaining instrument limitation explicitly.
10. Include raw SHA256 output for both `.mq5` files.

## Supplied stasis values

EA:
```text
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
```

FlowLogic:
```text
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
```

## Current unresolved matters

These remain council or operator matters and must not be decided by the builder:

- target-zone dependency
- stop-zone dependency
- `ComputeSlReference` failure-cause design
- terminator attachment
- confluence constituent set
- session-domain agreement
- promotion-queue repair
- whether a source behavior is a defect

## Next sequence

1. Planner issues the complete LT-7 Form D.
2. Builder executes LT-7.
3. Planner checks completeness and formats the result.
4. Council reviews the result.
5. Only after council acceptance may the next task be issued.
