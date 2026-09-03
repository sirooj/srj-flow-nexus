# OPERATOR INSTRUCTIONS

## My role

I approve strategy meaning and relay decisions.

I do not reinterpret source evidence.

I do not manually repair builder reports.

I do not authorize production edits from an architecture discussion.

## Three labels

Every issue must be assigned one label:

### OPERATOR ANSWER REQUIRED

Use this when the question concerns:

- strategy meaning;
- target-zone intent;
- stop-zone intent;
- whether behavior is intended or defective;
- discretionary priority;
- operator setup identity;
- approval of a changed contract.

### COUNCIL REVIEW REQUIRED

Use this when the question concerns:

- architecture;
- lifecycle;
- ownership;
- acceptance criteria;
- task sequencing;
- specification amendments;
- whether evidence is sufficient to authorize a Form B.

### DELEGATE TO PLANNER/BUILDER

Use this for:

- source census;
- brace counting;
- exact region extraction;
- parameter-direction inspection;
- call-site census;
- hash collection;
- mechanical parsing;
- implementation after a Form B is approved.

## Normal operating loop

1. Send the current council state and the latest builder result to the council reviewer.
2. Record the council decision in `CURRENT_COUNCIL_STATE.md`.
3. Ask the planner to issue exactly one next task.
4. Inspect the planner's task header:
   - task ID;
   - form;
   - allowed files;
   - prohibited actions;
   - stop conditions;
   - complete rule block for Form D;
   - no placeholders.
5. Start the builder only when the task says:
   `Status: READY FOR BUILDER`.
6. Do not interrupt the builder with additional scope.
7. When the builder finishes, preserve the complete result.
8. Send the result to the planner for mechanical completeness checking.
9. Send the normalized result to the council.
10. Do not authorize the next task until the council disposition is recorded.

## Stop immediately if

- the builder edits an unapproved file;
- a Form D compiles or runs;
- a builder guesses an absent identifier;
- a builder uses an old line number as an anchor;
- a Form B has no predecessor extraction;
- a task contains a placeholder;
- a task asks for strategy interpretation from the builder;
- a hash does not match;
- a required block is missing;
- a source report says `COMPLETED` while any requested item is missing.

## Operator response format

When a ruling is needed, answer only:

```text
OPERATOR ANSWER
Question:
Decision:
Scope:
Reason, if needed:
Effective task:
```

Keep the answer short. Do not add new requirements inside an unrelated task.
