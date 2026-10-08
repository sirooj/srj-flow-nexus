# BUILDER SLICE B-84 - Part W before/after lines, K3 raw spots + XOB-read NOT FOUND evidence (STOP at K3; no edit, no compile, no runs)

Conventions: kept EA 137076D9 (kept + hunk S + hunk RKD, 695359 B, LF-only, UNCHANGED this turn - no source edit made). .preB84 backups kept (EA 137076D9 / ex5 FA4C9249 / terminal.ini 88a0deb1 + 42 chart files with manifest). No .B84X was cut (STOP before K4). No j47/j48 (no runs).

## PART W BEFORE/AFTER LINES (text only; raw)

W1 .opencode/skills/srj-relay/SKILL.md:
- BEFORE (frontmatter): `description: Run an SRJ B-series relay from the planner (SuperApp AI) - start gate, trial discipline, result file, push, one-line reply. Load first whenever the inbound message is a relay "B-<n>".`
- AFTER: `description: Run an SRJ B-series relay from the planner (ClickUp Brain) - start gate, trial discipline, result file, push, one-line reply. Load first whenever the inbound message is a relay "B-<n>".`
- BEFORE (Roles): `- Planner: the SuperApp AI in the operator's SuperApp project thread (replaced the PromptQL bot 2026-10-07, relay B-52). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal. Its context file is SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md.`
- AFTER: `- Planner: ClickUp Brain, the AI in the operator's ClickUp workspace (planner from relay B-81; the SuperApp AI and the PromptQL bot are history). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal and cannot push. Its context file is SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md; its cold-start page is SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_HANDOFF.md; its ClickUp-side wiki is the ClickUp skill "SRJ Relay Planner".`
- grep SuperApp|PromptQL after: 1 remaining line (line 9, the new history parenthetical itself); changed none.
W2 99_WORKFLOW/PLANNER_CONTEXT.md (4 replacements, before -> after):
- `- Planner: the AI planner session the operator opens (his SuperApp thread, or a PromptQL bot - used again from relay B-57). Read-only GitHub access. No terminal, cannot push.` -> `- Planner: ClickUp Brain (the AI in his ClickUp workspace) since relay B-81, with the ClickUp skill "SRJ Relay Planner" as its wiki (Relay Template, Planner Lessons, Handoff State). The SuperApp AI and the PromptQL bot are history only (section 5). Read-only GitHub access through ClickUp's GitHub connection. No terminal, cannot push.`
- `  Read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md on the branch below first, then follow it.` -> `  Load the SRJ Relay Planner skill, then read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md and PLANNER_HANDOFF.md on the branch below and follow them.`
- `4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block.` -> `4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block, then refresh the Handoff State page of the ClickUp skill SRJ Relay Planner (planner-side; the builder never touches it).`
- `- Screenshots: the builder cannot open SuperApp uploads; the planner describes them in plain words inside the relay.` -> `- Screenshots: the builder cannot open uploads he makes in the ClickUp chat; the planner describes them in plain words inside the relay.`
W3 AGENTS.md: grep SuperApp|PromptQL = 0 lines (no change; 12-line cap untriggered). .clinerules: 0. .agents/: 1 line (skills/srj-relay/SKILL.md:3 stub frontmatter "from the planner (SuperApp AI)" - stub, never opened; count + line reported, no edit).
W4 99_WORKFLOW/PLANNER_HANDOFF.md: created with the relay's exact text (em dash verified U+2014 in the spec line; LF-only, no BOM).

## K3 RAW SPOTS (kept EA 137076D9; hunk-C insertion contexts all FOUND)

- Decl :1111 `ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;` (CONFIRM_DIV_WAIT context).
- Signature :2481-2482 + touch :2532 + fail/surv :2533-2534 + `return true;` :2535 (touch block + B60C print per SLICE_B69 D4 to be added here).
- ResetSequence :6855 + P-BUILD3 context (stamp site).
- Seed site :8437 `g_anchorLine    = pr.topLine;` + RK clear+plant + :8443 `g_anchorBarTime = barTime;` + :8445 SrjS54Snap (stamp site).
- UJDEFERAPPLY GoAbort :8756 (C1 block site).
- Call sites :9340 (uj_carryTerm) / :9360 (cfTermZ) / :9548 (cfTerm).
- DirName :1792, enum :226, ComputeNearestTpTarget signature :2658 (dir in scope).

## K3 XOB-READ EVIDENCE (NOT FOUND - the STOP)

New term needs, at the counted candle (up to 15 shifts before confirmation, e.g. 2 June 14:20 vs 15:30): (a) every live trade-direction XOB's zone, (b) each one's promotion time, (c) each one's kill/invalidation state, (d) the machine's own in-play verdict.
EA reads on disk (kept 137076D9, located by text):
- XOB zone: ONLY the single selected zone per shift (FL_BUF_XOB_ZONE_HIGH :206/22 + _LOW :207/23, consumed at :6911-6912/:7500-7501/:8800-8801 as singular haveXob/xobHi/xobLo). No loop over XOBs anywhere (every `for` iterates POI_NLINES).
- Promotion time: ONLY the pick's (FL_BUF_XOB_PROMO_TIME :2063/33, consumed once at :8790).
- Object id: ONLY the pick's (FL_BUF_XOB_OBJ_ID :2048/31, consumed at :6904/:7529/:8775).
- Kill/invalidation: ZERO EA reads (grep OBPROV|obInval|promoBar|KillBar = 1 unrelated struct field; OBPROV code=4 lives in FlowLogic prints only, never consumed via ReadFlow).
- In-play: ZoneInPlay(barShift, hi, lo, ...) is shift-callable per GIVEN zone (:7118), but needs the zone first (see above).
- SXobRecord (:748, used once at :809) sits inside a cross-run scoring bundle (SStructuralBundle), not a runtime live-XOB store.
The B-83 census (every live XOB + kill state + penetration witnesses) was built from FlowLogic PRINT rows (XOB-PROMOCENSUS census + OBPROV code=4 kills), which the EA cannot read at runtime (shadow instruments are print-only by council design).
Hence: the EA cannot read (a)-(c) for an older counted candle without an include/indicator edit (new FlowLogic buffers publishing the full live map per shift) or a reconstruction from prints (forbidden). Readable pieces for a redesign, recorded without proposing: candle OHLC at any shift (iHigh/iLow), POI lines (ReadBuf1), pick-zone + pick-promo at any shift (buffers 22/23/31/33), ZoneInPlay at any shift for a given zone, confirmation machinery as-is.
STOP filed per K3. No edit made (EA still 137076D9, verified after). No compile, no runs, no j47/j48.

(End of slice)
