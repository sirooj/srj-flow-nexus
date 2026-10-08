# BUILDER RESULT B-108 - XOB touch separator authority and buildability review, OFFLINE-SEPARATOR-AUTHORIZED-NOT-BUILDABLE, MEASURED

Trader summary: B-107's touch reading is real and your record supports it — your 2 June words describe exactly a missing touch at the counted candle, and the spec permits touch without ever demanding it. But the live EA cannot run this check: it sees only the machine's single picked zone per bar, never the full zone population the measurement needs, and the zone IDs reset every run. So the reading stands as evidence, and the build work it needs is now named. No source was edited and no gate was built.

## Relay order (B-108, read-only authority + buildability review)

- Part 0 fresh start on builder/B-107 at 99d7d3f29dafd54c2e29001cea39c5c6ce434bb1, both skills loaded whole first.
- Part B banking (no new rule words). Part R review (R1 evidence verify, R2 authority, R3 reading-vs-gate, R4 runtime inventory, R5 EU-vs-June, R6 decision, R7 boundary). Part X records (ledger 1253). Part F file + push builder/B-108 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB; consulted by grep, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-107` = `99d7d3f29dafd54c2e29001cea39c5c6ce434bb1` (verified exact). Cut `builder/B-108` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-107`: pointer (20 lines); RESULT_B107 head (74-line file, authored prior turn, unchanged); SLICE_B107 head (73-line file, authored prior turn, unchanged); RESULT_B106 T-section (89-line file, unchanged); RESULT_B105 section (98-line file, unchanged); RESULT_B104 section (103-line file, unchanged); RESULT_B103 section (84-line file, unchanged); RESULT_B99 head (68-line file: cross-run provenance, objId instability lineage, unchanged); PLANNER_CONTEXT section-4 tail (130-line file, B-107 lesson present); PLANNER_HANDOFF section-3 tail (70-line file, B-107 line present); relay SKILL.md whole; strategy SKILL.md whole (s178/B-70/B-91/JUN05NY lines re-verified by prior greps on identical bytes); spec v4.2 whole (35807 B, read whole on identical bytes, §§3.5/3.5.1/3.6/10 carried); register whole (11072 B, read whole on identical bytes: rows 310/314/306 + 5/13/17 + A/C/B sections); `SRJ_Types.mqh` (COrderblock fields + Task-98a/110 notes, read); `SRJ_State.mqh` (sizes confirmed, state structs carried); `SRJ_OrderblockMgr.mqh` (46911 B, lifecycle/storage carried); `SRJ_FlowLogic.mq5` (48-buffer map + publish sites + GetOB internal use, inspected by grep); `SRJ_FlowNexus_EA.mq5` (FL_BUF defines + ReadFlow selected-path reads + own direction state + 311 rates reads, inspected by grep); `XOBDIAG_JUNE_TARGETS.csv` re-verified (761 lines, SHA `36844a2b...` re-hashed identical; touch rows 3150/3308 present); `XOBDIAG_RECON62_EU_TARGETS.csv` confirmed present (237177 B).
- 0.4 Names per relay: June evidence `XOBDIAG_JUNE_TARGETS.csv`; EU evidence `XOBDIAG_RECON62_EU_TARGETS.csv`; prior `JUNE-XOB-SEPARATOR-FOUND-OFFLINE` item `1252`; this tag `B108-XOB-TOUCH-AUTHORITY-BUILDABILITY`, item `1253`; kept EA `137076D9CF85` / EX5 `FA4C924978F6` / indicator `956BF3E3ADB7` / EX5 `27B5F272DCFA`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `99d7d3f B-107 June XOB separator classification (relay B-107)` (verified head). `git diff 99d7d3f29dafd54c2e29001cea39c5c6ce434bb1 --` EMPTY (every committed file named). `git status --short` = 427 lines (prior artifacts + B106/B107 files/scripts, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` / indicator disk `956bf3e3...` / EX5 `27b5f272...` (prefixes match). Both evidence CSVs present where needed (no NOT FOUND). No terminal64 launched, no compile, no tester run (read-only turn). No STOP.
- 0.6 Scope: read-only authority + buildability review of the B-107 separator; B-108 text records only.

## Part B - banking

- B1 The current operator message contains the B-108 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - authority and buildability review

- R1 B-107 separator re-verified (every item FOUND; zero NOT FOUND; zero CONTRADICTED): June artifact hashes + build `2026.10.08 21:25:54` re-verified (TARGETS `36844a2b...`, 761 lines); six candles with exact rows (123/139/130/122/123/123); 2 June 30 trade-direction relevant-valid, 0 touch FOUND; 4 June 09:10 3/0 FOUND; 4 June 09:55 3/0 FOUND; 5 June 16:00 32 relevant-valid with 2 touch FOUND (ids 3150/3308 rows present); 16:10/16:15 context-only 0 touch FOUND; source/run provenance per B106 (JUNE0525-B106, USDJPY/300, journal 21:34:11 Core 04, PASSED) FOUND; no trade grade and no gate in any B-107 record FOUND.
- R2 Rule-authority review (exact banked words, grep-verified on identical bytes; what each supports vs never authorizes):
  - 2 June (skill s178 + journal row 310): `"there is no valid XOB retracement or touch there, so no setup ever forms for me"` + `"a touch I do not count"` | supports: touch-absence at the counted 14:20 candle as his stated no-setup reason (measured 30/0 reads exactly onto it) | never authorizes: a universal prohibition on XOB touching (conversion explicitly refused), nor any EA gate by itself | DIRECTLY-AUTHORIZED (as case evidence).
  - 4 June (B-70 veto + journal row 314 + row 13): `"at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."` | supports: the XOB clause only (measured 3/0 per candle reads onto "no retest in play") | never authorizes: bias/CQD clauses as XOB evidence (kept separate; journal row 13 corroborates the split) | DIRECTLY-AUTHORIZED (XOB clause as case evidence; bias/CQD clauses NOT-AUTHORIZED as XOB evidence).
  - XOBSUIT-1 §6-a3: `"no, as long as the SL swing leg is touched or in play from the XOB projection price level that is still valid"` | supports: the SL-leg-walk in-play standard (matches spec §3.5, no recency) | never authorizes: touch-as-requirement (it states touch OR in-play) | DIRECTLY-AUTHORIZED (as the in-play standard).
  - B-91: `"what i meant by retrace and in play are the same thing."` | supports: the single-condition reading used throughout B-104..B-107 | never authorizes: reopening the split readings | DIRECTLY-AUTHORIZED. No-cascade order (`"when i reexplain a rule, i do not want the other rule to cascade to be also wrong."`) | supports: scope guard only | DIRECTLY-AUTHORIZED (as process authority; never a rule change).
  - Spec §3.6 + §10: XOB opposing-candle touch permitted, never disqualifying | supports: using touch as a positive discriminator without rejecting touching rows | never authorizes: requiring touch on every valid setup (conversion explicitly refused) | DIRECTLY-AUTHORIZED (as the permission).
- R3 Reading vs future gate (offline reading FOUND as measured; gate needs stated as requirements):
  - Offline reading (relevant valid trade-direction XOB intersects the counted retest candle): FOUND (B106/B107 measured, id-level verified).
  - Future gate would need live relevant/valid/trade-direction-matched XOBs at the same candle: UNKNOWN as a current capability (R4 finds the full map unreachable - this is the buildability gap, not an established need beyond it).
  - Gate must-nots (selected-XOB print, later confirmation candle, post-entry bar, 5m bias flip, print-log reconstruction): FOUND as recorded constraints - the kept build contains no XOB gate at all, so none is violated (verified: no gate code was ever added; kept sources grep-clean of diagnostic identifiers).
  - Full population preserved beside any selected record: NOT FOUND on the live path (only the single selected pick is published: buffers 22/23/31/33 - the crux, see R4).
  - Must not reject a touching XOB (§3.6/§10): FOUND as constraint (no such rejection in the kept build).
- R4 Runtime buildability inventory (live kept sources, line-referenced; FULL-population requirement vs selected-only exception):
  - every live XOB zone high/low: INDICATOR-INTERNAL-ONLY (`COrderblock.high/low`, Types lines 43-44; `g_orderblocks` read at FlowLogic 1215/1325; only the selected pick published on buffers 22/23, lines 708-709/1218-1219).
  - every live XOB object identity: INDICATOR-INTERNAL-ONLY (`objId`, Types line 63; Types line 30 "nothing reads objId yet"; only selected id on buffer 31, lines 727/1220; ids reset per run anyway per B-95/B-99).
  - every live XOB trade direction: INDICATOR-INTERNAL-ONLY (`isBullish` per record, Types line 48; NO direction buffer exists in the 48-buffer map).
  - every live XOB promotion time: INDICATOR-INTERNAL-ONLY (`promotionBar`, Types line 59; only selected promo time on buffer 33, lines 731/1230).
  - every live XOB validity state: INDICATOR-INTERNAL-ONLY (`isValid` per record, Types line 50; buffer 3 `g_bufOBValid` is a global in-bias flag and buffer 34 its provenance, lines 129/1124 - neither is per-record).
  - every live XOB invalidation state + event time: INDICATOR-INTERNAL-ONLY (`invalidationBar`, Types line 52; no buffer carries it).
  - counted candle OHLC: EA-READABLE (311 CopyRates/CopyTime/iOHLC reads in the EA; UJBARMAP prints o/h/l/c EA-side corroborate).
  - counted candle timestamp: EA-READABLE (CopyTime/iTime among the same 311 reads).
  - trade direction: EA-READABLE (own candidate state, e.g. `isLong` seed logic EA lines 2084-2143; register direction stays offline knowledge).
  - full multi-XOB historical snapshot: NOT-FOUND on the live EA path (no buffer or channel carries it; the only multi-XOB channel ever built was the restored print-only diagnostic - existence proves evidence capability, never live-path availability; pointer R7 + B-86/B-87 corroborate: full map NOT READABLE/BUILDABLE).
  - run/build provenance tied to each row: DIAGNOSTIC-FILE-ONLY (`__DATETIME__` builds + EA census exist only in export files and journal prints, which are PRINT-ONLY evidence; the live path carries no per-row provenance).
  - Selected-pick exception (already EA-readable, B-86 measured): zone hi/lo (bufs 22/23, EA `FL_BUF_XOB_ZONE_HIGH/LOW` lines 206-207, read at EA 6911-6912/7500), objId (buf 31, EA line 2048/6904), promo time (buf 33, EA line 2063) - one pick per bar, never the population the separator needs.
- R5 EU vs June (B-104: 11 valid-take candle-groups, trade-direction relevant XOBs all non-touching, 0 touches; ruled-out C-1530 same shape. B-107: 5JUN1600 retest, 2 trade-direction touches of 32): CONSISTENT-DIFFERENT-POPULATIONS - same method, opposite local outcomes on different pairs/windows/sessions (EURUSD Aug-Sep takes vs USDJPY June retest); no contradiction either way. Never generalized to EURUSD, all sessions, or a universal rule (observed; the 2-touch margin is filed in B-107).
- R6 Exactly one: `OFFLINE-SEPARATOR-AUTHORIZED-NOT-BUILDABLE` - the touch reading is directly supported as evidence by his 2 June touch language, the 4 June XOB clause, XOBSUIT-a3, B-91 and the §3.6 permission, but the live EA cannot consume the required full XOB map (per-record fields + snapshot + provenance all unreachable; only the selected pick is readable; objIds unstable across runs) without new upstream/runtime work. Planner decision only; authorizes no edit or gate.
- R7 Boundary (observed): project goal not called complete; XOB trading gate not called complete; four B-91 readings stay unreopened; no tolerance and no different XOB window chosen (observed - same relevance/validity/touch definitions throughout B-104..B-108). With AUTHORIZED-NOT-BUILDABLE, the next relay must define the smallest upstream/runtime evidence work, not edit the trading gate.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-108-XOB-TOUCH-AUTHORITY-BUILDABILITY` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-108` = 0 -> appended `- B-108: reviewed the June touch separator for rule authority and runtime buildability; no source edit or gate was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B108-XOB-TOUCH-AUTHORITY-BUILDABILITY` = 0 and `^1253.` = 0 -> appended item `1253` (B-107 verification, authority table, runtime inventory, EU-vs-June comparison, R6, no edit/compile/run/gate). `^1252.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-108 MEASURED, AUTHORIZED-NOT-BUILDABLE, kept EA/EX5 unchanged, no compile or runs, no gate and no project-complete claim, next defines smallest upstream work.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B108.md` (raw artifact checks, quoted words + sources, runtime inventory, authority table, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1253. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-108` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (B106/B107 analysis scripts + June/EU artifacts unstaged). Strategy skill, journal CSV, register, spec, includes untouched (all read-only; greps only). No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
