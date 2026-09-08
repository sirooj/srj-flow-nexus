# NEW SESSION PROMPT — paste this whole file's contents into a fresh Cline session
Continue the SRJ Flow Nexus project in this workspace.

FIRST ACTION: read the MQL5\.clinerules file FULLY — it is the project's workflow,
invariants, file map, and standing state. Its section 7.1 (CURRENT STATE — CONSOLIDATED)
governs; the entries above it are history.

THEN READ, IN ORDER:
1. SRJ_FlowNexus_Local\00_CURRENT_WORKING\GOAL_STATEMENT.md
   (the goal statement + AGREEMENT SAMPLES 2 and 3)
2. SRJ_FlowNexus_Local\00_CURRENT_WORKING\CHARTER.md
   (the strategy, the milestone map, the operator rulings in sections 7 and 9)
3. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-CERT.md
   (the T161H certification of the current EA state — supersedes the digest history)
4. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_CQD-DA.md
   (the CQD detection audit + the operator's ruling addendum at its end)

THE ROLES: the operator (present in the session) holds intent and is the final
authority; YOU are the builder and the operator's primary interface — no invented
strategy, no executive directions, no canonical-file edits without a packet.
THE COUNCIL RELAY IS DEFERRED: the web-based council has no access to the local
repository, so the operator rules DIRECTLY as council of record in-session; batch
relays to Opus 5 / GPT 6 Astra only when the operator asks for one.

THE OPERATOR RULINGS THAT GOVERN THE NEXT WORK (recorded in .clinerules 7.1):
- THE CQD INDICATOR (Indicators\SRJ_CQD_TickBased_MT5.mq5) IS CORRECT BY DESIGN.
  Every rule and behavior — including the 2-of-4 anchor gate and the micro-fractal
  pivots — is the operator's deliberate choice. CQD-DA-1..7 are measurements of
  deliberate behavior, NOT defects. DO NOT propose indicator changes.
- THE DISAGREEMENT RESOLUTION IS EA-SIDE. The EA's CONSUMPTION of the CQD verdict
  stream is where the 08.18 disagreement lives: the EA latched verdict -2 at bar
  14:40 (read 14:50:01) and fired the known FALSE POSITIVE (the 14:50:01 SHORT
  R=1.06); the operator judges that divergence invalid. The latest-at-confirmation
  walk is implemented and correct as far as it goes; the missing piece is the
  operator's VALIDITY CRITERIA expressed as EA-side consumption rules (which
  verdicts count, over which window, confirmed-vs-preview semantics). ASK for these
  criteria once the mechanism map is on the table; do not invent them.

THE IMMEDIATE WORK, IN ORDER:
1. THE EA-SIDE DIVERGENCE-CONSUMPTION AUDIT (code-technical, builder): map exactly
   how the EA reads and gates the CQD verdicts — UpdateDivergenceLatch's walk (EA
   ~L1945-2010), the shift-2-only visibility (EA-78; EA ~L3072), the census read
   (EA ~L2321-2332), the CQDRECHECK diagnostic — and lay the mechanism out for the
   operator's validity ruling. The EA's own journal already carries the verdict
   stream (T161H_JOURNAL.log, 08.18 afternoon): -2@14:20 (read 14:30:01, latched
   S5 dir=SHORT), +1@14:30 (14:40:00, IDLE), -2@14:40 (read 14:50:01, latched ->
   the signal), +2@14:50, -2@15:00, -1@15:20, +2@15:25/30/35 — the stream
   alternates rapidly; present this timeline WITH the mechanism map.
2. THE CQD-DEBUG RUN (authorized, but BLOCKED on a canonical edit): the EA's
   iCustom binding passes only InpCqd_NoReset / InpCqd_MaxCarryBars /
   InpCqd_MaxBackfillDays (EA L45-48); the CQD's own InpDebugLog cannot be set
   from the tester ini. The one-line pass-through (or CQD default flip) is a
   PACKET item — draft it, do not apply it without the operator's packet.
3. THE FLOWLOGIC MIDLINE AUDIT continuation (.clinerules 7.1 work item 2): locate
   the invalidationLevel assignment (the Types constructor's caller — NOT YET
   FOUND); compare the criterion against the operator's midline body-close rule.
4. The operator's pending semantic items (anchor-tier/POI-selection rule,
   divergence-validity criteria, journal #223 screenshots) are in .clinerules 7.1.

THE OPERATOR'S PENDING INPUTS: the divergence-validity criteria in EA-consumption
form (work item 1 produces the mechanism map that frames the question); the
anchor-tier/POI-selection rule (open item a); nothing else blocks.

FOLLOW THE INVARIANTS IN .clinerules SECTION 5 — especially: no canonical edit without
a packet/token (the operator can issue one directly in-session), digests are the
instrument (never mtimes or .ex5 sizes), literal absolute paths only, nothing under
02_TASK_CHECKPOINTS, no git add/commit/push without an explicit token, and
raw-output-verbatim reporting.