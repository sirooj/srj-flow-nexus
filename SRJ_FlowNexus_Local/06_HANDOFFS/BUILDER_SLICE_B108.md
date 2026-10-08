# BUILDER SLICE B-108 - artifact checks, words, inventory, authority table, record lines (authority + buildability, MEASURED)

Scope: read-only authority + buildability review of the B-107 touch separator. No edit, compile, launch, run, gate. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-107` = `99d7d3f29dafd54c2e29001cea39c5c6ce434bb1` (verified; cut builder/B-108 here).
- `git log -1` = `99d7d3f B-107 June XOB separator classification (relay B-107)`.
- `git status --short` line count = 427 (prior artifacts + B106/B107 files/scripts; preserved, untouched).
- `git diff 99d7d3f29dafd54c2e29001cea39c5c6ce434bb1 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...`. Indicator disk `956bf3e3...` / EX5 `27b5f272...`.
- June CSVs present (TARGETS 761 lines `36844a2b...` re-hashed identical; touch rows 3150/3308 present). EU CSV present (237177 B). No terminal64 launched, no compile, no tester run. No STOP.

## PART B GREPS (before/after)

- Operator message = B-108 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-108-XOB-TOUCH-AUTHORITY-BUILDABILITY` in 99_WORKFLOW 0->1 (context X1). `B-108` in 99_WORKFLOW 0->1 (handoff X2).
- `B108-XOB-TOUCH-AUTHORITY-BUILDABILITY` in SRJ_FlowNexus_Local 0->1 (ledger 1253). `^1253.` 0->1; `^1252.` = 1 beside.

## READS (in relay order, on builder/B-107)

- Pointer 20 lines; RESULT_B107 head (74-line file, prior turn, unchanged); SLICE_B107 head (73-line file, prior turn, unchanged); RESULT_B106 T-section (89-line file, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B104 section (103-line file, unchanged); RESULT_B103 section (84-line file, unchanged); RESULT_B99 head (68-line file: crossrun + objId-instability lineage, unchanged); PLANNER_CONTEXT §4 tail (130-line file, B-107 lesson present); PLANNER_HANDOFF §3 tail (70-line file, B-107 line present); relay skill whole (67 lines); strategy skill whole (64 KB; word-lines re-verified); spec v4.2 (35807 B, identical bytes, §§3.5/3.5.1/3.6/10 carried); register (11072 B, identical bytes: rows 310/314/306 + 5/13/17 + A/C/B); Types (COrderblock fields + Task-98a/110 notes); State + OrderblockMgr (sizes carried, lifecycle/storage); FlowLogic (48-buffer map + publish sites + GetOB internal use); EA (FL_BUF defines + ReadFlow selected reads + own direction + 311 rates reads); JUNE_TARGETS re-verified (touch rows present); EU_TARGETS present.

## RAW ARTIFACT CHECKS (R1)

- TARGETS SHA `36844a2b...` (761 lines) re-hashed identical. Six candles exact (123/139/130/122/123/123). Build `2026.10.08 21:25:54` single. B-107 counts re-stated: 2JUN td 30/0/30; 4JUN0910 td 3/0/3; 4JUN0955 td 3/0/3; 5JUN1600 td 32/2/30; 5JUN1610 td 32/0/32; 5JUN1615 td 32/0/32. Provenance per B106 (JUNE0525-B106, USDJPY/300, 21:34:11 Core 04 PASSED). No grade, no gate anywhere.

## QUOTED WORDS + SOURCES (R2; grep-verified on identical bytes)

- s178 (+ journal row 310): "there is no valid XOB retracement or touch there, so no setup ever forms for me" + "a touch I do not count" (15:35 LONG 159.774 ruled out).
- B-70 veto (+ rows 314/13): "at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play." (09:55 SHORT 159.868 tester-only).
- XOBSUIT-1 §6-a3: "no, as long as the SL swing leg is touched or in play from the XOB projection price level that is still valid".
- B-91: "what i meant by retrace and in play are the same thing." + no-cascade "when i reexplain a rule, i do not want the other rule to cascade to be also wrong."
- JUN05NY (lines 151/170/172/174) + journal row 306: 16:00 retest, "16:00 flipped bearish and 16:05 flipped back bullish", 16:10 confirmation, "5 June New York long entry is the 16:15 candle open".
- Spec §3.6/§10: touch permitted, never disqualifying; permission is not a prohibition and never a requirement.

## AUTHORITY TABLE (R2)

- 2 June words | touch-absence at 14:20 as his no-setup reason (30/0 reads onto it) | no universal touch prohibition, no gate | DIRECTLY-AUTHORIZED (case evidence).
- 4 June XOB clause | "no retest in play" (3/0 per candle reads onto it) | bias/CQD clauses never XOB evidence | DIRECTLY-AUTHORIZED (XOB clause; bias/CQD NOT-AUTHORIZED as XOB evidence).
- XOBSUIT-a3 | SL-leg-walk in-play standard (§3.5, no recency) | never touch-as-requirement | DIRECTLY-AUTHORIZED (in-play standard).
- B-91 single-condition + no-cascade | the reading used B-104..B-108 | never a reopening | DIRECTLY-AUTHORIZED (reading + process guard).
- §3.6/§10 permission | positive discriminator without rejecting touching rows | never touch-required-on-every-setup | DIRECTLY-AUTHORIZED (permission).

## RUNTIME INVENTORY (R4; kept sources, line-referenced; FULL requirement vs selected-only exception)

- live XOB hi/lo: INDICATOR-INTERNAL-ONLY (Types 43-44; g_orderblocks FlowLogic 1215/1325; selected-only bufs 22/23 @708-709/1218-1219).
- live XOB objId: INDICATOR-INTERNAL-ONLY (Types 63 + line-30 "nothing reads objId yet"; selected-only buf 31 @727/1220; ids reset per run B-95/B-99).
- live XOB direction: INDICATOR-INTERNAL-ONLY (isBullish Types 48; NO direction buffer in the 48-buffer map).
- live XOB promo time: INDICATOR-INTERNAL-ONLY (promotionBar Types 59; selected-only buf 33 @731/1230).
- live XOB validity: INDICATOR-INTERNAL-ONLY (isValid Types 50; bufs 3/34 are global flag + provenance @129/1124, never per-record).
- live XOB invalidation + event time: INDICATOR-INTERNAL-ONLY (invalidationBar Types 52; no buffer).
- candle OHLC: EA-READABLE (311 EA rates reads; UJBARMAP o/h/l/c EA-side corroborate).
- candle timestamp: EA-READABLE (CopyTime/iTime among the 311).
- trade direction: EA-READABLE (own candidate state, EA isLong seed 2084-2143; register direction stays offline).
- full multi-XOB snapshot: NOT-FOUND on the live EA path (no channel; only channel ever was the restored print-only diagnostic; pointer R7 + B-86/B-87 corroborate NOT-BUILDABLE full map).
- per-row run/build provenance: DIAGNOSTIC-FILE-ONLY (__DATETIME__ + EA census in files/prints only; prints are PRINT-ONLY evidence).
- Selected-pick exception already readable (B-86): hi/lo bufs 22/23 (EA defines 206-207, reads 6911-6912/7500), objId buf 31 (EA 2048/6904), promo buf 33 (EA 2063) - one pick per bar, never the needed population.

## READING VS GATE (R3)

- Offline reading FOUND (measured, id-verified). Future-gate live needs UNKNOWN as current capability (the R4 gap). Gate must-nots FOUND as constraints (kept build has no XOB gate; sources grep-clean). Full-population-beside-selected NOT FOUND on live path (selected-only publication). No-touch-rejection FOUND as constraint (§3.6/§10; no such rejection in kept build).

## EU VS JUNE (R5)

- CONSISTENT-DIFFERENT-POPULATIONS (B-104: 11 valid EU groups, trade-direction relevant all non-touching; B-107: 5JUN1600 retest, 2/32 trade-direction touches; same method, different pairs/windows/sessions; no contradiction either way; never generalized; 2-touch margin filed).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-108-XOB-TOUCH-AUTHORITY-BUILDABILITY (planner lesson 2026-10-08, B-108): reviewed the offline June touch separator against banked XOB words, specification authority and live runtime inputs without enabling a gate.`
- X2 handoff §3 appended once: `- B-108: reviewed the June touch separator for rule authority and runtime buildability; no source edit or gate was performed.`
- X3 ledger `1253.` appended once (tag `B108-XOB-TOUCH-AUTHORITY-BUILDABILITY`; verification, authority, inventory, comparison, R6, no edit/compile/run/gate).
- X4 pointer 20->20 lines (cap 35): latest B-108 MEASURED; AUTHORIZED-NOT-BUILDABLE; kept EA/EX5 unchanged; no compile/runs; no gate and no project-complete claim; next defines smallest upstream work.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1252.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R6: `OFFLINE-SEPARATOR-AUTHORIZED-NOT-BUILDABLE` (planner decision only; no edit, no gate).

(End of slice)
