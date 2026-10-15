# PLANNER_RELAY_TEMPLATE - relay skeleton (kit PK-4)
One fenced text block. Plain text inside, no nested code fences. New file text goes between "=== BEGIN FILE <path> ===" and "=== END FILE ===" markers.

RELAY B-<n> - <short title>
Trader summary: two or three sentences in his words.

## Part 0 - fresh-session start
0.1 Skills to load whole, in order (srj-relay first; srj-strategy when any trading rule is touched).
0.2 git ls-remote backup builder/B-<n-1> must return <full 40-char hash>; cut builder/B-<n> at it; push via backup, never origin.
0.3 Files to read in order on builder/B-<n-1> (exact paths; only files the planner has read).
0.4 Every name the relay uses (files, SHAs, tags, journals, ledger item, kit version).
0.5 Start gate: git log -1; git diff <cut> -- <committed text files> EMPTY; uncommitted disk files by SHA prefix from the latest result's final-state lines; LF-normalize before calling a mismatch; any expected non-empty diff is named here with how to account for it.
0.6 Scope: allowed files and actions; forbidden list; legal results (FOUND, NOT FOUND, ABSENT, UNKNOWN, ACCOUNTED, STOP).

## Part B - banking (grep-first; his new words verbatim, or "no new rule words")
## Part W - workflow edits (only when he ordered them; exact before -> after text)
## Part K - kept-build edit (rule-conflict check; backups .preB<n> with SHAs; raw spots located by text; one edit; one compile) or Part R - reading (read-only measurement on named journals)
## Part S - separator table (required before any Part K trial; from committed pack lines; one row per register row A, B, C; columns: pack lines, reading verdict, SEPARATES / DOES NOT SEPARATE / OTHER-GATE)
## Part T - runs (RECON62 first, then EU0525TD; after each run: python SRJ_FlowNexus_Local/99_WORKFLOW/TOOLS/grade_register.py <DEALS csv> SRJ_FlowNexus_Local/06_HANDOFFS/REGISTER_TRUTH.csv <run> <from> <to>, output pasted raw; STOP rules right after it; restore on STOP)
## Part X - records (pointer, ledger item, one EU_FIX_PLAN State line; LESSONS.md line only for a standing lesson <= 160 chars; PLANNER_CONTEXT section 5 and PLANNER_HANDOFF section 3 are no longer updated per relay (PK-4); each grep-first; then the Part F size gate)
## Part F - file, push, reply
F1 result BUILDER_RESULT_B<n>.md (lines 1-2 = grader summary lines for RECON62 and EU0525TD of the build on disk; then trader summary; relay order; final disk state; review batch path; carried note last if any).
F2 slice BUILDER_SLICE_B<n>.md (raw rows; under 600 lines).
F2b On KEPT: row packs per srj-relay "Row pack" plus ROWPACK/INDEX_B<n>.md.
F3 ledger item. F4 pointer (35-line cap).
F5 stage explicit paths only; never EA, includes, indicators, ex5, journals, logs, inis or backups unless the relay says commit AND he has said so.
F6 commit, push via backup, git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-<n> must return the commit.
Reply line: B-<n> is done, GitHub branch builder/B-<n>, commit <short hash>, verdict <KEPT | RESTORED | MEASURED | STOP>

## Planner self-check before handing it over
- Part 0 alone lets a builder with no memory run it.
- Every file, section and code name cited was read on the branch, or is marked "locate on disk, report NOT FOUND".
- No tolerance, buffer or new number in any rule.
- No question to him that his record answers; no code question to him at all.
- Every input a trial term needs is EA-readable at runtime (B-84).
- Every result claim relied on is in the committed file (B-84 X1/X2).
- A KEPT trial cites a committed Part S table that SEPARATES; a diagnostic needs only the grader (PK-4).
- The pointer's Lane line is read; the 3rd relay in a lane is a diagnostic trial, not another reading (PK-4).
- Every pin cited has skill line numbers; every row has run + EA SHA + file:line or pack line (PK-2).
