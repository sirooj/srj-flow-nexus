# BUILDER RESULT V379-GRADE - Q1 CONDITIONAL CONFIRM + Q2 OBJECT (packet v29; council gate held)

## Intake and freshness

The live pointer and POST-V380 handoff both identify V379-UJEXEMPT-16 as the sole pending review. Packet FIX-2v29 is SHA-256 C459AA7875D8319917B3CB6C0E15ED20936C9743F31832644DF3F8C5210EBF5C / 48,260 bytes / 184 lines. Relay V379 is SHA-256 43B668ACF9A20E6E98B65B5BDF79B83F834F015106FC534FF8602BFA4FD839C9 / 74,716 bytes / 391 lines. Both still match the handoff.

Freshness evidence: before filing, the V379 seat markers were 0x in both verdict files. The two supplied attachments identify the exact V379 relay and their source seats; both were created on 2026-10-01 UTC. The attachment bytes were embedded unchanged and verified after writing. Sonnet intake SHA-256 F685AB237AE52A65E3FA5780275D7D482244DA2B8AB5A05BF7A6E2300AED2731 (7,627 bytes); GLM intake SHA-256 FB1C9127E83A68537481EB42800D067DF238894600A20CA6A2677EF669103968 (10,644 bytes).

Filed whole under the exact V379 OPEN/END markers. Read-back confirms each correct seat file has one OPEN and one END marker; source bytes round-trip exactly. No V379 block was filed in any other seat file.

## Q1 - conditional CONFIRM

- Sonnet: CONFIRM, conditional on repairs. GLM: CONFIRM.
- Grade: conditional CONFIRM, with no OBJECT vote on Q1. This is not a code/build clearance; named page conditions remain open and the separate Q2 result holds the council gate.
- Sonnet's six page defects: Q1 change-sentence parenthetical misattaches the 09:05 match; `exempt` flag names a broader promotion condition than the new disjunct; same-direction assertion depends on the off-page `S2ResolveLive` body; `!aligned` includes opposite LTF and does not enforce the stated flip kill at the edge; P110 lineage header is stale; P010's behavior-round count needs its counting rule. The seat says defects 3 and 4 decide whether Q1 stays CONFIRM.
- GLM confirms the specified edit set, including its four-branch behavior and same-direction comparison; its Ask A still records identity-blindness, sentinel behavior, print duplication drift, P115/P116 wording risks, and other non-verdict-blocking details.
- Q1 close: preserve Sonnet's conditions for any later page fold; do not represent this grade as unconditional clearance.

## Q2 - OBJECT / AMEND-WITH-HALT

- Sonnet: OBJECT. GLM: CONFIRM.
- Grade: OBJECT under council tie rule §47; any OBJECT amends, and each question is graded independently. The split does not clear the causal acceptance gate.
- Sonnet's blocking findings: P159-P161 ledger values conflict with the NA treatment in P112/P116; P113's branch-invariance assertion for P158/P162 conflicts with the session-cap gate; 8-June Ku cells are forecasts rather than established invariants; P115 predicate (1) is graded on T instead of requiring an M assertion that exercises the new disjunct; P118 does not isolate disjunct-based promotion. Sonnet identifies the first two as the basis for OBJECT and also requests P127/P159-P161/P120 repairs.
- GLM confirms the causal battery but its Ask A independently flags the P112/P116/P120/P127/P155-P157/P159-P161 NA-versus-ledger ambiguity and asks for an explicit operative rule; its Ask B proposes deriving branch columns from edge-existence at grade time. These comments are advisory under GLM's stated CONFIRM, but they do not cancel Sonnet's OBJECT.
- Q2 close: OBJECT; amend with halt. The V379 council gate is not clear.

## Gate and scope

This grade is record-only. No packet fold or EA edit was made. No build, run, key request, commit, or push was made. No live activation is cleared. The separate vote-free GO/HOLD signal remains unprovided; it was not treated as a condition for filing or for these independent Q1/Q2 tallies. Q2 OBJECT independently blocks clearance.
