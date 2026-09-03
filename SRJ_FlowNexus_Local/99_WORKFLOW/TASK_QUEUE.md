# TASK QUEUE

## Active

| Task ID | Form | Title                                       | Status                  |
|---------|------|---------------------------------------------|-------------------------|
| LT-7    | D    | ComputeSlReference Enclosure and ReadFlow Direction | AWAITING COUNCIL — planner check PASS |

## Pending (blocked on prior task completion)

_None._

## Completed

| Task ID | Form | Title | Completed Date | Result File |
|---------|------|-------|----------------|-------------|
| LT-1 through LT-6 | — | Prior extraction tasks | See 07_ARCHIVE | — |

## Queue rules

1. Only one task may be in READY FOR BUILDER status at a time.
2. A new task may not enter READY FOR BUILDER until the council accepts the prior result.
3. The planner updates this file when a task transitions.
4. The operator does not modify task status directly.

## Status values

- `AUTHORIZED TO PROCEED` — council has approved; planner has not yet issued the task file
- `READY FOR BUILDER` — task file issued; builder may start
- `IN PROGRESS` — builder is executing
- `AWAITING PLANNER CHECK` — builder has reported; planner is checking completeness
- `AWAITING COUNCIL` — planner-checked result is with the council
- `ACCEPTED` — council has accepted the result
- `BLOCKED` — task cannot proceed; reason recorded in task file
