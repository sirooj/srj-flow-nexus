# BUILDER_RESULT_B252 - relay B-252 (BUILD-IDENTITY 1 of 6), replay-only

Branch: `builder/B-252` (cut at 641d28d). Block window: 2026-10-17 evening into 2026-10-18 early.
Scope held: NO source edit, NO compile of any kind - copy saved ex5 binaries into place, run, restore, read-only inventories.
Question (his words, banked): short and long runs differ - the builder finds out why. Build-chain/toolchain questions are never asked of him (2026-10-17 correction).

## The answer

NOT the compile. All four B-251 runs (B251I/B251ICT, both windows) carried a terminal-held indicator
name `InpCqdName=SRJ_CQD_TickBased_MT5_B250H` (the B-250H diagnostic copy) in their input lists, while
every reference-era baseline (B-242K 10:27, B-241D 09:36, B-248D 19:06) ran the base name
`SRJ_CQD_TickBased_MT5`. The same saved binaries, replayed with the base name pinned in the run ini,
reproduce every reference run byte-for-byte. "file added ... bytes loaded" = disk file + fixed per-species
overhead (EA +32, Flow +33, CQD base +41); name + upstream sha prove identity.

## T5 verdict table (family V1 BINARY)

| trial | binaries | CQD input | result |
|---|---|---|---|
| RECON62-B252R0 (VOIDED) | kept d85cf7d2/61177aa5 | terminal-held B250H copy | VOID - wrong input species; name burned, never reused (ledger 1412) |
| RECON62-B252R0A | kept EA 520,964 + Flow 275,840 | base | == DEALS_RECON62-B242K byte-exact (fc /b: no differences encountered) |
| EU0525TD-B252R0A | kept | base | == DEALS_EU0525TD-B241D byte-exact |
| RECON62-B252R1 | y-day EA 519,380 + Flow 281,670 (.B248DK copies) | base | == DEALS_RECON62-B248D byte-exact |
| EU0525TD-B252R1 | y-day | base | == DEALS_EU0525TD-B248D byte-exact; != DEALS_EU0525TD-B251ICT (B251ICT longer, different deals) |

V1 (BINARY): same ex5 bytes + same input set = same deals, machine-side stable when inputs are pinned.
The B-251 compile nondeterminism (6578e493/520,336 vs 2e53e019/520,402) stays logged history, demoted
to non-behavioral: binary + inputs fully determine deals per the four-way byte equality. The B-251-3
why-chase (include-tree history hunt) becomes an optional builder-side curiosity, not a behavior question.

## Grader lines (fresh re-derivation, same turn as filing; truth = 06_HANDOFFS/REGISTER_TRUTH.csv)

- `GRADE RECON62-B252R0A: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7` (sole exit diff: A1 machine 11:35 1.16467 vs owed 1.16464, +3pt of NOTE B-137, his exit 11:35 open).
- `GRADE RECON62-B252R1: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7` (identical table - both legs byte-equal reproductions of their era references).
- `GRADE EU0525TD-B252R0A: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17` (fires: N25JUN register C 0625-EU-INVALID; N26MAY/N4JUN1005/N15JUL1035 his 2026-10-15 review items 1/3/6 verbatim).
- `GRADE EU0525TD-B252R1: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 3; MACHINE-ONLY ungraded 1; trades 17` (the +1 = M12, the 19 June 15:50 machine take 1.14654 - the K19JUN pair already on record, ungraded by him, carried row).

Every exception row in all four tables is a repeat of an earlier filed batch (QUESTION_LOG, REGISTER_TRUTH,
REVIEW_BATCH_*) - zero new questions, zero re-asks.

## Part Q - review batch

Scope: grader MACHINE-ONLY rows of EU0525TD-B252R0A only (kept build). Fresh grade says
`MACHINE-ONLY ungraded 0` - the batch is EMPTY; nothing to carry, nothing to re-ask. The only
machine-only row anywhere in the family (M12, R1-EU leg) is the long-on-record K19JUN/15:50 pair,
listed here as a repeat, never re-asked.

## Harness facts (all four runs, from DONE + CUT logs, fresh)

| run | window (journal line) | EA sent | Flow sent | CQD sent | PASSED (DONE stamp) |
|---|---|---|---|---|---|
| RECON62-B252R0A | 2026.08.26 00:00 - 2026.09.10 00:00 | 520,996 | 275,873 | 53,471 | 2026-10-17 20:50:56 |
| EU0525TD-B252R0A | 2026.05.25 00:00 - 2026.10.14 00:00 | 520,996 | 275,873 | 53,471 | 2026-10-17 21:32:47 |
| RECON62-B252R1 | 2026.08.26 00:00 - 2026.09.10 00:00 | 519,412 | 281,703 | 53,471 | 2026-10-17 21:52:20 |
| EU0525TD-B252R1 | 2026.05.25 00:00 - 2026.10.14 00:00 | 519,412 | 281,703 | 53,471 | 2026-10-17 22:31:37 |

Every run's input header shows `InpCqdName=SRJ_CQD_TickBased_MT5` (CUT logs L46) - the one-key override
held in all four; the terminal-held B250H name never reappeared. Scanner over the 8.72 GB day log
(20261017.log): R1-EU cut scanned 27,009,292 lines, 34 deals, KILL rows 824.

## Final disk state (T4 restore, verified by hash re-read)

- `Experts\SRJ_FlowNexus_EA.ex5` = D85CF7D2, 520,964 B (kept pre-B251 binary, restored from `.preB252`).
- `Indicators\SRJ_FlowLogic.ex5` = 61177AA5, 275,840 B (restored).
- `config\terminal.ini` = 2862B31F, 20,481 B (restored from WORK copy).
- `MQL5\Profiles\Charts` = 37 files / 1,679,192 B, mirror-exact vs `.preB252` (diff 0). Six run-era
  chart saves found beyond the snapshot (Default\chart01-05.chr + order.wnd) quarantined to
  `C:\Users\winar\AppData\Local\Temp\opencode\srj-quar-charts-b252\` - kept, not deleted, reported here.
- No terminal64 process running.

## Records filed

- `LESSONS.md`: B-252-BINARY-IS-THE-BUILD + include-set keep rule.
- `EU_FIX_PLAN.md`: section 2 keep/replay discipline bullet + section 3 B-252 lane line (this result's digest).
- `SRJ_FLOW_NEXUS_LEDGER.md` item 1413 (claim: B-252 result).
- `BUILDER_SESSION_POINTER.md`: kept-run session baselines = RECON62-B252R0A + EU0525TD-B252R0A; next = B-253 (2 of 6) on council.
- `BUILDER_SLICE_B252.md`: raw launch proofs, inventory diffs, compares, grades, restore proofs.

## Carried note

F4b stays the next planner lead (ungraded K19JUN 15:45 1.14644 vs machine 15:50 1.14654 pair leads the
review shortlist). B-253 (BUILD-IDENTITY 2 of 6) waits on council - builder stops at branch push.

## Commit

Staged paths: this file, BUILDER_SLICE_B252.md, BUILDER_SESSION_POINTER.md, SRJ_FLOW_NEXUS_LEDGER.md,
EU_FIX_PLAN.md, 99_WORKFLOW/LESSONS.md, 99_WORKFLOW/READ_MAP.md, 99_WORKFLOW/TOOLS/job_env_b252.py,
99_WORKFLOW/TOOLS/job_cut_b252.py, 06_HANDOFFS/REPORT/*B252*.csv, 06_HANDOFFS/ROWPACK DEALS files for
the four B-252 runs, .opencode/skills/srj-relay/rules/01b_relay-b.md (one compaction-recipe line),
.opencode/skills/srj-council/SKILL.md (battery pin). Exclude everything else (no code, no ex5, no ini, no logs, no vault).
