# SRJ Flow Nexus — Revision 62 Consolidated Handoff
## The Council Debt Is Cleared. The Migration Is The Only Thing Left.

**Supersedes** Revision 61 and Revisions 60.1 through 60.7 in full, for task control, sequencing, authorization state, canonical-tree state, prohibitions, contracts, rulings and the open-item register.

**Retains** Revision 60 as the architecture and evidence record — specifically §§6, 7, 9, 10, 11, 13, 15, 16 — as amended by the Task 159 ruling recorded at §10.5 of this document. Retains Revision 56 §§6, 7, 8, 10, 14 as the deeper evidence layer, still absent from session.

**Operating mode:** alert-only. No execution. No live trading.

**Production edits authorized by this document:** NONE.

---

## §0 Document policy, layering, and required session inputs

Revision 62 is the working record, the queue, and the operator's single relay artifact. It is not fully self-contained, and the layering is deliberate. A fresh council instance reads this section first so it knows what it does not have.

| Layer | Document | Status in a fresh session |
|---|---|---|
| Task control, sequencing, authorization, canonical state, prohibitions, rulings, queued packet bodies | **Revision 62** (this document) | authoritative |
| Twelve data contracts as amended, the twenty adjudicated packet items, the terminator attachment table, the eight ordinal re-expressions | **§10.5 of this document** | binding, in session |
| Lifecycle model, transition rules C1–C9 / H1–H12 / P1–P8 / B1–B6, ownership table, findings EA-147 → EA-179, scenario set, the must-not-conflate list | **Revision 60 §§6, 7, 9, 10, 11, 13, 15, 16** | binding, available as archive |
| Census rule set, 26 numbered entries | `03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md`, 764 lines, UTF-8 no BOM | binding, **prepended mechanically, never relayed** (R-63, R-65) |
| Full 64-character digests of all sixteen files | `BUILDER_RESULT_155-REG.md` STAGE 7 | binding, read from there, never from a handoff |
| Current-generation Tier 1 baseline: eight counters, signal line, 50-tag diagnostic inventory | `BUILDER_RESULT_155-REG.md` and its six extracts | binding, on disk |
| Terminator definitions T1–T5, lifecycle rulings, provenance contract, forgetting rule, no-chase, arbitration, execution-window rule | **Revision 56 §5 / amendment A-3** | binding, **was in session, consumed into §10.5. Re-supply only if a new §5 question arises** |
| Measured evidence, log formats, defect ledger EA-1 … EA-146, operator answers R-Q13/14/15 | **Revision 56 §§6, 7, 8, 10, 14** | binding, **absent, non-blocking** |
| Findings EA-180 → EA-218, defects 87 → 181, rulings R-1 → R-41 | builder reports of the 60.1–60.7 arc, `99_NOTES\DefectLedger.txt` | **council does not hold the text.** See §15 |
| Part A Specification v4.2 | operator's disk | **absent.** No longer blocking anything — see §11.3 |

**The six-revision document blockade is over.** Revision 56 §5 entered session and was fully consumed into rulings. Part A v4.2 §3.7 was never the document council needed — the citation was mis-made and is withdrawn (§10.5, item 16). **No document is blocking any queued task.**

**No line number in this document is an anchor (P12).** Every figure in §3 is a state reference for a baseline capture. Under R-67 an anchor ages out when its file's digest changes and not otherwise, so anchors are cited as a digest pair, never as a date.

---

## §1 What Revision 62 settles

### 1.1 The workflow is fully validated except for one link that may never be needed

| Link | Status | Established by |
|---|---|---|
| Task assembly from a council packet | VALIDATED | 160-PreJ, 154-Pre1/Pre2, 155 PART 1 |
| Source extraction, census, brace counting, whole-region paste | VALIDATED | ten source-only tasks |
| Report correction and council acceptance | VALIDATED | 160-PreJ's A5 count correction |
| Authorization gate and token consumption | VALIDATED | 155-A3, 155REG-A1, both consumed |
| Baseline assertion against a named prior artifact | VALIDATED | 155 STAGE 2, 155-REG STAGE 1 |
| Anchor reads and per-operation gates | VALIDATED | 155 R7, 20 of 20 |
| Literal edits with delta derivation | VALIDATED | 139 lines inserted, one line modified |
| Compiler resolution and compile | VALIDATED | 0 errors, 0 warnings |
| Post-edit diff assertion | VALIDATED | 155 STAGE 7 |
| Report persistence | VALIDATED | every builder result on disk |
| Whole-tree sixteen-file stasis assertion | VALIDATED | 155-REG STAGE 1 and STAGE 7 |
| **Harness run, log write, extraction, counter comparison, provenance** | **VALIDATED** | **155-REG, R-55** |
| **Chart attach and runtime buffer read** | **NOT VALIDATED, and may never be needed** | R-80 — decided by `155-RT-A` item 4b |

### 1.2 Council's debt is cleared

Revision 61 §11 named four blockers, three of them council's or the operator's rather than a builder's. All four are resolved.

```
Task 159's twelve contracts, awaiting review since Revision 58   RULED
BUILDER_RESULT_160-PreJ.md, accepted but unread                  READ, items 18/19/20 CLOSED
Revision 56 section 5, named blocking for six revisions          IN SESSION, consumed
Part A v4.2 section 3.7, named blocking for six revisions        CITATION WITHDRAWN
```

**Task 160's both gates are met (R-61).** Council gate by the Task 159 ruling; baseline gate by `155-REG`'s current-generation Tier 1 measurement. It needs one predecessor Form D for its anchors and then it is a Form B.

### 1.3 The instrumentation arc is closed, and what it actually bought

Thirty-nine rulings landed between Revision 61 and this document. Almost all of them are instrumentation adjudication, and the arc is now closed by decision rather than by exhaustion.

What it bought, in order of value to the migration:

1. **A current-generation Tier 1 baseline that means something.** Task 135's log was taken on a different EA binary (R-76, R-87). Byte-identity against it was never a gate.
2. **A single-value regression gate for Task 162.** `SL 1.15870` on 2026.08.17 16:20:01, corroborated by four independent lines. The zone retirement must reproduce it (R-89).
3. **Milestone 1's first measured contamination instance.** A pre-binding evaluation read zone globals an arming set five minutes earlier (R-90). The singleton defect, measured rather than argued.
4. **Item 2's premise confirmed by measurement**, which justifies Task 131's promotion rather than arguing it (R-82).
5. **Item 19's print narrowed to a named population of eight**, and its site-independence established (R-83, R-91).
6. **Two unrecorded compile events dated**, and P17/P18 promoted out of measurement into the numbered prohibition set.

Structural agreement is **0 of 12**, unchanged across ten revisions. Nothing above moved it. §13.1 is why.

---

## §2 Roles and the validated workflow

### 2.1 The role table, with R-94's correction in force

| Role | Responsibility | Constraint |
|---|---|---|
| Council / planner | Opus 5, web only. Authors packets, issues rulings, holds the queue | **Reads no file. Derives no figure it was not given. Mints no EA or defect number** (§6.3). Delivers **paste-ready IDE instructions**, never manual work |
| External reviewer | GPT 6 Astra. Objects, or returns NO OBJECTION | Its 60.5 objection was sustained in full (R-46) |
| Operator | **Pastes and relays. Nothing else.** States discretionary trading meaning | **Never creates a file, assembles a packet, transcribes a command, or runs PowerShell personally** (R-94) |
| Workflow-document planner | Claude Default + Claude Sonnet 4.5, in the IDE | Creates workflow files only. Never decides architecture. **Plan mode is read-only and must not be used to create a file** |
| Assembler | Cline Act + any cheap available model | R-65's mechanical prepend and file production only. No census, no edit, no judgement |
| Builder + scribe | Cline Act + GLM 5.3 Flash | Literal work only. BLOCKED-FOR-COUNCIL rather than a guess |
| Mechanical fallback | Cline Act + DeepSeek V4 Flash | Same scope when GLM quota is unavailable |
| Complex approved coder | Opus 5 via Cline Act | Only after a Form B is explicitly authorized. Never decides whether behaviour is a defect |

### 2.2 The relay pattern — the operator's whole job

```
Council posts text in chat.
Operator pastes it to the IDE with a one-line instruction.
IDE writes / assembles / verifies / executes / persists.
Operator relays the named result artifact back to council.
```

Three pastes is the standard shape for a queued packet: one to the workflow planner if a document must be created, one to the assembler, one to the builder. §19 carries the current pastes verbatim.

### 2.3 Request labels, binding

```text
OPERATOR ANSWER REQUIRED       discretionary strategy meaning, or intended
                              trading behaviour, only
DELEGATE TO IDE                every file read, hash, count, census, extract,
                              PowerShell command, assembly, compile, run
```

The operator is never asked to decide a struct, a parameter, a transport lifetime, a buffer registration, an object traversal, or an implementation mechanic — and is never asked to *perform* one.

### 2.4 The controlled experiment of R-49

Eight packets and four free-read rounds under this arrangement. Conforming returns throughout, correct refusals to guess, self-reported and corrected slips, and several self-initiated additions that closed items council had not thought to ask for. Retained. Still not a claim about model quality in general.

**Three pattern-shape slips this session were council's or the drafting side's** — case sensitivity on `SL_REF`, substring on `ALERT`, whitespace shape on the input lines. All additive or null, all reconciled to zero residual, none caught by the pattern itself. R-79 is the fix.

---

## §3 Canonical tree — current state, whole-tree assertable

### 3.1 The sixteen files

Full 64-character digests live in `06_HANDOFFS\BUILDER_RESULT_155-REG.md` STAGE 7 and are read from there, never from a handoff, never truncated. **Comparison is case-insensitive hex** — `certutil` emits lowercase, the record carries uppercase, and a case difference is never a MISMATCH (R-57).

| File | Digest, abbreviated | Lines | Status |
|---|---|---|---|
| `MQL5\Include\SRJ\SRJ_State.mqh` | `C6D56BC1…FD2E` | 516 | edited by Task 155 |
| `MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh` | `524D5D40…E60F` | 1139 | edited by Task 155 |
| `MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh` | `64CF3275…02AE` | 546 | edited by Task 155 |
| `MQL5\Include\SRJ\SRJ_BiasEngine.mqh` | `FC1E3871…092B` | 399 | edited by Task 155 |
| `MQL5\Indicators\SRJ_FlowLogic.mq5` | `1EA7858F…3B08` | 1242 | edited by Task 155 |
| `MQL5\Experts\SRJ_FlowNexus_EA.mq5` | `0f1f44cb…52331322` | — | **CONFIRMED** by 155-REG STAGE 1 |
| `MQL5\Include\SRJ\SRJ_Types.mqh` | `773d9944…808e78dc` | — | **CONFIRMED**, cross-generation pair vs 155-R2 8.3(a) |
| `SRJ_Alerts.mqh`, `SRJ_Draw.mqh`, `SRJ_Fractals.mqh`, `SRJ_HTFEngine.mqh`, `SRJ_Panels.mqh`, `SRJ_SeedFormat.mqh`, `SRJ_Sessions.mqh`, `SRJ_Text.mqh`, `SRJ_TickCore.mqh` | recorded at 155-REG STAGE 1 and 7 | — | **comparison targets (R-60)** |

**Whole-tree stasis is assertable on all sixteen files.** Revision 61 §3.3's scope limit and open item 27 are both closed.

### 3.2 Path constants

```text
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
```

**`ROOT` is nested inside `DF\MQL5\`.** Every archived `.mq5` and `.mqh` beneath it is visible in MetaEditor's Navigator and is compilable. 4 `.mq5` and 10 `.mqh` copies carry the same filenames as the canonical sixteen. P10, P11, P14 and now **P17** are the only barriers; there is no structural one.

### 3.3 Compile artifacts — compile-run evidence only, never provenance

```text
CURRENT   MQL5\Indicators\SRJ_FlowLogic.ex5
          226444 bytes   file 2026-09-05 17:39:34
          SRJ BUILD 2026.09.05 17:39:20   <- P8b, in-journal, compile-embedded

CURRENT   MQL5\Experts\SRJ_FlowNexus_EA.ex5
          115438 bytes   file 2026-08-30 10:31
          Source not edited by Task 155, not recompiled by it.

.ex5 SIZE AND TIMESTAMP ARE BOTH DEMOTED (R-58). Both have moved in this project
  without a recorded source edit. Admissible for exactly one purpose: proving nothing
  recompiled between authorization and run inside a single packet.

BANNER "bytes loaded" IS NOT FILE SIZE (R-86). Two paired observations disagree by
  different amounts — EA 115470 banner vs 115438 disk (+32), FlowLogic 226477 vs
  226444 (+33). Valid for RUN-TO-RUN DISCRIMINATION ONLY. No claim crosses instruments.

P8b: THE SRJ BUILD LINE is the run-binary provenance instrument (R-85). Compile-
  embedded, in-journal, per-run, present pre-155 in every retained log. It replaces
  what R-58's demotion removed.
```

### 3.4 Superseded and void — never quote

| Value | Disposition |
|---|---|
| FlowLogic `.mq5` `d5525014…fb5664d5` | **SUPERSEDED.** Correct when recorded, held MATCH 21 rounds, replaced by authorized edit |
| FlowLogic `.ex5` `08/28/2026 01:04 PM` | **SUPERSEDED but CORROBORATED ACCURATE.** Matches Task 135's `SRJ BUILD 2026.08.28 13:04:21` to the minute (R-84) |
| EA `.ex5` `115062` / `08/29/2026 04:50 AM` | **SUPERSEDED BY MEASUREMENT.** Disk reads `115438` / `08-30 10:31` |
| `c307496079e3…dc3879511` and `08/29/2026 12:54 PM` | **VOID. Never quote.** Filed in `07_ARCHIVE\VoidHashRecords\` |
| Task 160-PreH Block B, every attribution verdict | **VOID DELIVERABLE.** Defects 82, 83, 84. Inputs survive. 160-PreJ's replacement is ACCEPTED |
| Four `.ex5` under `02_TASK_CHECKPOINTS` | **NON-CANONICAL.** Compiled in place 2026-09-04, matching no canonical size. Quarantine ordered (R-78, P18, §20.3) |

Superseded was correct and is stale. Void was never correct. Non-canonical was never tree state.

### 3.5 Two unrecorded compile events, both dated

```text
2026-08-30 ~10:31-10:32   BOTH canonical binaries rebuilt. Not in the record.
  FlowLogic: source digest held MATCH across the interval, so the rebuild is
    behaviourally inert.
  EA: carried at least the SWEPTMASK and SESSIONHOLD prints. DEDUCED, not suspected —
    inputs measured identical (20 values, 10 headers, 15556 bytes both runs) excludes
    gating; SWEPTMASK 174 = TPCENSUS 174 in both generations excludes non-firing; a
    deterministic compiler cannot emit prints the source lacks. (R-87)
  Which of the two intermediate compiles carried it is NOT RESOLVABLE. Both
    intermediate binaries are gone.

2026-09-04   Four .ex5 compiled in place under the checkpoint store, as EA+FlowLogic
  pairs at two distinct times, matching no canonical size. NOT the mechanism behind
  the 08-30 movement — no canonical timestamp moved on 09-04. (R-78)

CONSEQUENCE: continuous EA source stasis across 2026-08-28 -> 08-30 is UNESTABLISHED
  and may not be claimed. TREE STATE IS UNAFFECTED — 0f1f44cb..52331322 is confirmed
  current and was asserted EQUAL across Task 155. Tasks 160 and 161 are not endangered.
  FILED, NOT CHASED.
```

### 3.6 Baseline folder, superseded as a comparison target

```text
02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\
```

Pre-155 state, retained as history. **No future packet compares a live file against it.** Its two `.ex5` are non-canonical and are quarantined by §20.3.

---

## §4 Authorization state

```text
NO LIVE AUTHORIZATION FOR ANY EXECUTION.

155-A3       CONSUMED (R-53)
155REG-A1    CONSUMED (R-55)
160QUAR-A1   ISSUED by §20.3, unconsumed. Scope: FOUR FILE MOVES. Nothing else.

Production edit:  NOT AUTHORIZED
Compile:          NOT AUTHORIZED
Chart attach:     NOT AUTHORIZED
Harness run:      NOT AUTHORIZED
Delete:           NEVER AUTHORIZED ANYWHERE. Quarantine is a move (R-78).
```

Every item in §12 requires its own authorization, issued as a separate packet naming its own bounded scope. **A source-only Form D requires no authorization and none is issued for one.**

---

## §5 Task state

Tasks 91–152 unchanged from Revision 56 §4. Changes and current entries only.

| Task | Form | Status | Note |
|---|---|---|---|
| 153 | D | DISSOLVED | Block A → 158 Block H. Blocks B–D superseded by 160-PreG/PreH |
| 158 + CorrectionA/B/C | D | COMPLETED | Architecture recovery census. Stasis MATCH each |
| **159** | **S** | **RULED AND CLOSED** | Twelve contracts approved with amendments; twenty items adjudicated. **§10.5 is the ruling and it is Task 160's specification** |
| 160-PreD/PreD-R2/PreE/PreF/PreG | D | COMPLETED | Stasis MATCH each. **PreF's anchors are aged out for the five edited files, current for the EA and Types (R-67)** |
| 160-PreH | D | COMPLETED | Inputs survive. **Every attribution verdict VOID** — defects 82, 83, 84 |
| 160-PreJ | D | **COMPLETED, ACCEPTED, AND READ** | Corrected attribution ×7 regions, four unread FlowLogic passes, whole-tree emission census, `ZoneAdoptable`, `ZoneInPlay`. **Blocks C and D are now read; open items 18, 19, 20 CLOSED** |
| 154-Pre1 | D | COMPLETED AND ACCEPTED | No flag-to-object transport exists |
| 154-Pre2 | D | COMPLETED AND ACCEPTED | `objId` is `long`, factory IDs begin at 1; four mutually exclusive writes per pass; no per-bar reset — **corroborated from the runtime side by R-90** |
| **154** | B | **PARKED** | Buffer 36 registered, unpopulated. Open item 23 parked. Not blocked, not queued |
| 155 PART 1 R1 | D | COMPLETED AND ACCEPTED | Source-only |
| **155 v4 PART 2 R7** | **B** | **COMPLETED AND ACCEPTED (R-53)** | 20 of 20 ops. 139 lines inserted, FlowLogic line 8 modified. Three buffers registered, one populated. Compile 0/0. **The only production edit in the record** |
| **155-REG** | **OBS** | **COMPLETED AND ACCEPTED (R-55). BYTE-IDENTICAL** | 11 of 11 gate rows, 49 diagnostic tags count-identical, 16 of 16 hashes EQUAL, signal line IDENTICAL, P8/P8a/P9 clean. **The current-generation Tier 1 baseline** |
| **156** | B | **PARKED** | Buffer 35 registered, unpopulated |
| 157 | B | DISSOLVED into 163 | |
| **160-PreK** | **D** | **QUEUED, ISSUABLE NOW.** §20.1 | Anchor re-establishment for Task 160 under P12 / R-67. Source-only, no authorization |
| **160** | **B** | **BOTH GATES MET (R-61)** | Architecture shell, inert, Tier 1 byte-identical vs Task 155REG. Blocked only on 160-PreK's return |
| **155-RT-A** | **D** | **QUEUED, ISSUABLE NOW.** §20.2 | Buffer-34 read-mechanism census. Hold discharged. **Item 4b decides open item 24** |
| **155-RT-B** | OBS | **SUSPENDED (R-73)** | Withdrawal or drafting decided by 155-RT-A item 4b (R-80) |
| **160-QUAR** | **OPS** | **QUEUED, non-blocking.** §20.3 | Four recorded moves. `160QUAR-A1` issued |
| 161 | B | QUEUED | Legacy cascade adapter, whole extraction, per-field load/store log. **Milestone 1.** A-3 §5.8's own wrapper corroborates the drafted design exactly |
| 162 | B | QUEUED | Candidate-owned binding at capacity 1, both sites, siblings logged. **Milestones 2, 3, 4.** **Zone-retirement row UNBLOCKED** by items 18, 19. **Carries R-89's single-value gate.** Siblings share the divergence latch |
| 163 | B | QUEUED | Provenance completion, `GONE` resolution, invalidation event record. Absorbs export stage 4. **Carries `OBPROV`'s windowed partition at bar ≥ 120745** |
| 164 | B | QUEUED | Phase A / Phase B, arbitration, EA-144 as commit test, concurrency enabled. **Milestones 5, 6.** **Census scope is EA-only, ruled. Three emission channels, not two** |
| 165 | B | **QUEUED, DOCUMENT BLOCK LIFTED** | Pending-entry lifecycle, T3, EA-142/EA-145 repair. A-3 §5.10 consumed; the §3.7 citation withdrawn |
| 166 | B | QUEUED | Position and exit engine, post-fill target revision. **Two-swing zone-guard repair WITHDRAWN from scope** (item 20) |
| 141 | B | PAUSED | Strict promotion bound. Re-enters after 162 |
| 142 | B | PAUSED | `NO_TP_TARGET` advisory. Re-enters after 162 |
| 129 | B | PAUSED, re-scoped | EA-156, three links. Re-enters after 163 + open item 4 |
| 130 | B | PAUSED | Promotion repair, one Form B per defect. Re-enters after 163 |
| **131** | B | **PAUSED, PROMOTED** | Union-extreme export. **The union extreme corrects the branch the record's only signal took (R-82).** Rides 165 |
| 128, 132 | B | DISSOLVED | EA-112 → lifecycle state; EA-144 → Phase B commit test; 132 was the umbrella for 160–164 |

**Every prior Form D in the record is ACCEPTED**, per Revision 60.4 §2, unchanged.

---

## §6 Rulings, defects, and the minting rule

### 6.1 Counters

```text
Rulings:  R-95
Defects:  181
Findings: EA-218 or higher

Council holds the text of:  R-42 through R-95 in substance
                            defects 45 through 86
                            EA-147 through EA-179
Council does NOT hold:      R-1 through R-41
                            defects 87 through 181
                            EA-180 through EA-218
```

### 6.2 R-55 through R-95, compact

```text
R-55  155-REG ACCEPTED. BYTE-IDENTICAL adopted. Open items 25 and 27 CLOSED. EA .mq5
      digest CONFIRMED. Harness link VALIDATED. Baseline = BUILDER_RESULT_155-REG.md.
R-56  PARSED EXTRACTS ONLY. A raw log is written to disk, its path/size/line count
      reported as provenance, and the file itself is never relayed.
R-57  Digest comparison is CASE-INSENSITIVE HEX. No builder returns MISMATCH on case.
R-58  .ex5 SIZE and TIMESTAMP are compile-run evidence only. No provenance gate ever.
R-59  RETIRED by R-74.
R-60  WHOLE-TREE STASIS ASSERTABLE ON ALL SIXTEEN FILES.
R-61  TASK 160'S BOTH GATES ARE MET. Council gate by the 159 ruling; baseline by 155-REG.
R-62  ISSUED COMMANDS ARE PASTE-READY AND CHANNEL-MARKED. Superseded in effect by R-94.
R-63  CENSUS_RULE_BLOCK_THROUGH_A26.md is the rule set of record. CENSUS_RULES_VERBATIM
      .txt is DERIVED and may not be pasted, quoted, or used as a completeness check.
R-64  Revision 61 §9's completeness index is NON-AUTHORITATIVE. The amendment-8 gate is
      MECHANICAL: byte-match against the file of record.
R-65  AMENDMENT-8 COMPLIANCE BY MECHANICAL PREPEND, cheap model, hash-verified. Council
      never relays the rule set.
R-66  The rule set of record is UTF-8 without BOM. The prepend is BYTE-PRESERVING.
R-67  AN ANCHOR AGES OUT WHEN ITS FILE'S DIGEST CHANGES, AND NOT OTHERWISE. P12's force
      is unchanged; only the age-out test is amended. Aged out by Task 155: FlowLogic
      and the four edited includes. NOT aged out: the EA and Types, both confirmed.
R-68  'SRJ INV' IS UNESTABLISHED AS AN INSTRUMENT. Rev 61 §13.4's claim WITHDRAWN.
      Confirmed permanent: both INV and INVALID are absent from the full capture.
R-69  NUMERIC PAYLOADS ADJUDICATE FROM DISK, with the file's SHA-256 beside the relay —
      unless the payload reconciles against an independent baseline, which is itself
      the fidelity proof.
R-70  FREE-READ RETURN FORMAT: no TASK header, no stage sections, no attestations.
      Command as issued beside raw output, extract provenance, every supplement declared.
R-71  R-55's verdict is SCOPED. It asserts the eleven gate rows, the signal line from
      [SRJ-EA] onward, and BIASCENSUS_FINAL including both sign histograms. Narrowed by
      R-74 to COUNT-identity across 50 tags; content identity only where compared.
R-72  The 08.21 19:00 SLSIDEGUARD close= is a RECORDED ANOMALY, non-gating.
R-73  155-RT-B PROVISIONALLY SUSPENDED. Discharged as a hold on 155-RT-A.
R-74  R-59 RETIRED. Task 135's capture is COMPLETE — zero decomposition residual.
      Council's "different capture surface" reading WITHDRAWN. ZONECENSUS_FVG = 0
      survives in both generations; EA-120 holds.
R-75  THE 155REG DIAGNOSTIC INVENTORY IS THE CURRENT-GENERATION AUTHORITY. FIFTY TAGS
      PLUS ONE UNDECOMPOSED BUCKET. The '732 [SRJ-EA] 2026' row is the bucket and holds
      the 22 ABORT lines and the SIGNAL line. It may not be read as a tag.
R-76  THE 180 NEW [SRJ-EA] LINES ARE A PRINT-ONLY EA BINARY DELTA, NOT BEHAVIOUR.
      Sole surviving explanation with no alternative open (R-92).
R-77  A SINGLE-LINE VALUE WITH NO CORROBORATING SIBLING IN ITS PRINT BATCH IS NOT
      SELF-VALIDATING. Counts are corruption-robust and remain the primary gate
      instrument. A value-bearing gate needs cross-generation comparison or intra-batch
      sibling corroboration.
R-78  COMPILED BINARIES ARE QUARANTINED FROM THE CHECKPOINT STORE, NEVER DELETED.
      A checkpoint folder holds source and text only. See P18.
R-79  THE CENSUS RULE SET'S CASE, SUBSTRING AND WHOLE-TOKEN DISCIPLINE EXTENDS TO EVERY
      ISSUED COMMAND, plus a fourth class: A PATTERN MAY NOT ASSUME WHITESPACE SHAPE.
      Prefer -SimpleMatch on a stable literal over any pattern encoding layout.
R-80  BUFFER 34 IS LOSSY RELATIVE TO THE LOG, BY CONSTRUCTION. Same-bar multi-fire is
      observed; a buffer holds one value per bar. OPEN ITEM 24 RE-SCOPED to "does
      anything consume index 34," decided by 155-RT-A item 4b.
R-81  OBPROV COUNTS ARE NOT IN-WINDOW EVENT COUNTS. The boundary is bar >= 120745,
      derived from IDCHANGE's bar=122414 / bars=1670 pair.
R-82  ITEM 2's SIGNAL-LEVEL CLAIM CONFIRMED BY MEASUREMENT — the run's single signal
      carries sl_mode=1-swing, so §5.9's union-extreme requirement bites on the branch
      the signal took. Task 131's promotion is justified. The implicit claim that the
      two-swing branch is unreached is CORRECTED: it fires 8 times, none on the signal.
R-83  ITEM 19's PRINT STANDS, NARROWED. SLSRC fires on branch=1-swing 153 times and on
      branch=2-swing ZERO times, exceptionless. Council's four-value threshold WITHDRAWN
      as an arbitrary number. SLZONEGUARD's zero is explained on the pre-binding half.
R-84  SECTION 3.6'S FORK IS RESOLVED AND REV 60 §8.6 IS CORROBORATED TO THE MINUTE.
      The "misrecorded timestamp" branch is ELIMINATED. The 2026-08-30 unrecorded
      compile event is CONFIRMED.
R-85  THE SRJ BUILD LINE IS ADOPTED AS P8b, the run-binary provenance instrument.
      Reported verbatim beside P8, P8a and P9 in every future run packet.
R-86  BANNER "bytes loaded" IS NOT FILE SIZE. Run-to-run discrimination only.
R-87  AN UNRECORDED EA SOURCE EDIT OCCURRED between 2026-08-28 17:24 and the 08-30
      compile. Deduced, not suspected. Tree state is not endangered. Continuous EA
      source stasis across that interval is UNESTABLISHED.
R-88  ITEM 17'S ASYMMETRY IS MEASURED ON BOTH HALVES. Post-binding silence is explained
      POSITIVELY: four site=S5 evaluations, live zones, all slRef positions outside or
      exactly at the boundary. Nothing to reject. Deferred: the containment test's
      inclusivity, five lines of source, to Task 162's predecessor Form D.
R-89  THE SIGNAL'S STOP IS THE ZONE BOUNDARY. slRef 1.15870 = zoneLo = SIGNAL sl_ref =
      HEADS-UP zone low, four independent lines on 2026.08.17 16:20:01. Task 162's zone
      retirement must reproduce it exactly.
R-90  ZONE-GLOBAL VACUITY IS STATE-DEPENDENT, NOT SITE-DEPENDENT. Council's framing
      CORRECTED. First measured instance of cross-state contamination in the record;
      separating its two readings is exactly Milestone 1's per-field load/store log.
R-91  R-83 STRENGTHENED. The two-swing branch's instrumentation gap is TOTAL and
      SITE-INDEPENDENT. Item 19's population is eight, named and dated.
R-92  R-76 IS THE SOLE SURVIVING EXPLANATION. (a) confirmed twice, (b) excluded by
      twenty identical input values, (c) excluded by SWEPTMASK 174 = TPCENSUS 174.
      Harness identity corroborated at the VALUE level in both generations.
R-93  OBPROV IN-WINDOW FIRES = 975, PROVISIONAL. Authoritative figure is Task 163's.
R-94  ALL EXECUTION AND ALL MECHANICAL FILE WORK GOES TO THE IDE CHANNEL. The
      operator's entire job is PASTE AND RELAY. The operator channel is retired as a
      default. Council delivers paste-ready IDE instructions.
R-95  QUEUED PACKET BODIES LIVE IN THIS HANDOFF'S §20. A packet is ASSEMBLED FROM the
      appendix by the IDE; the builder receives the assembled file. The handoff itself
      is still never loaded as builder input.
```

### 6.3 Council may not mint a number

Council does not hold the current high-water mark of either the EA-finding series or the defect series. **Council therefore assigns no new EA number and no new defect number.** A finding council originates is written with its subject and its consequence, and the scribe assigns the number at archive time against the ledger on disk.

---

## §7 Prohibitions P1 through P18

P1 through P11 carry forward exactly as Revision 56 §2 defines them, including P3a (buffers append only), P5 (class fields append only), P5a (`SState` fields append only with the initialiser beside them in `SRJ_StateInit`), P6 (canonical tree only), P7 (compile gate), P8/P8a (real ticks and the fingerprint), **P8b (the `SRJ BUILD` line, R-85)**, P9 (liveness probe), P10 (never Compile All), P11 (never open a non-allow-listed file; read source via shell).

| # | Rule |
|---|---|
| **P12** | No production edit from an architecture document. Every edit requires a predecessor Form D that pasted the exact region, brace-counted, from the canonical tree. A field name, state name or line number in a handoff is not an anchor. **Force unchanged. The age-out test is R-67's: an anchor ages out when its file's digest changes, and not otherwise. The citation is the digest pair, never the calendar** (defect 75) |
| **P13** | No existing structure renamed to imply an architecture it does not have. A named abstraction that does not own its data is worse than the singleton, because it hides the singleton |
| **P14** | No candidate concurrency until isolation is proven by a per-field load/store log. Capacity stays 1 until Milestone 1 passes. Also governs the local repository: it is a checkpoint store, **never a source and never an edit target** |
| **P15** | Unknown provenance is represented as `UNKNOWN`. Parentage, structural-leg membership and bundle association are never inferred from price proximity, bound similarity or bar adjacency |
| **P16** | No contract, candidate or hypothesis field may hold a pointer or an array index into `g_orderblocks` or `g_imbalances`. Structural objects are deleted intrabar, before the identity export, with no snapshot rollback. Every reference goes through `SObjectRef` — an `objId` plus a resolution outcome re-read by identity every bar |
| **P17** | **No source file is located by filename search, glob, `-Recurse`, wildcard, or MetaEditor Navigator selection. Every source path in every packet is a literal absolute path.** `ROOT` is nested inside `DF\MQL5\` and 14 same-named copies of canonical files exist beneath it. A filename lookup can hash or paste an archived generation and the report would look conforming. Measured twice: R-78's four in-place checkpoint builds, R-84's unrecorded canonical compile |
| **P18** | **A checkpoint folder holds source and text only. A compile record is text; a compiled binary is a lineage claim for a build nobody authorized.** No `.ex5` is created, retained or read under `02_TASK_CHECKPOINTS`. Existing ones are quarantined by move to `07_ARCHIVE\VoidBinaries\`, never deleted, and may never be loaded, hashed as tree state, compared against a canonical digest, or cited as lineage |

**The no-dimensional-thresholds rule carries forward without change.** An operator ruling containing a number is restated structurally before it enters the specification. A registry capacity is an engineering safety limit and must be justified as one.

**Two bounded exceptions stand.** `CurrentTradingWindow`'s hour literals are session-boundary definitions, so the rule does not reach them — but their duplication across two files does, and that is open item 12. The 500-slot walk bound appears three times inside `ComputeSlReference` alone plus its original site; each is an engineering safety limit and must be justified as one wherever it is ported.

---

## §8 Process rules — retained and retired

### Retained, all validated across eight packets and four free-read rounds

```text
compact phase-separated packets (R-48)
revision-specific pre-flight destinations (R-45)
post-write verification read
stated harness write limit with authorized chunking
full-line counts only
wall-clock and retry budgets
report-before-stop on every BLOCKED condition
no revert without a council decision
BLOCKED-FOR-COUNCIL rather than a builder guess
error count and not exit code as the compile gate
R-47's materiality test
parsed extracts only; the raw log stays on disk (R-56)
numeric payloads adjudicate from disk unless a baseline proves fidelity (R-69)
free-read return format (R-70)
counts as the primary gate instrument; values need corroboration (R-77)
case, substring, whole-token and whitespace discipline on every issued command (R-79)
paste-ready IDE instructions; the operator pastes and relays only (R-94)
```

### Retired as counterproductive

```text
multi-part consolidated handoffs as EXECUTION INPUT
defect numbers for administrative observations
ledger and inventory reconstruction ahead of a run
any form whose return could exceed a single conforming report
the operator channel as a default execution path (R-94)
free reads issued without a queued packet that needs them
```

**Note the precision of the first retirement, because this document is a consolidated handoff.** What is retired is loading a consolidated handoff into an IDE session **as the builder's input**. A consolidated handoff remains the correct form for the council's state record, the operator's relay artifact, and — per R-95 — the source the assembler reads a packet body from. A builder receives an assembled packet file, and that file is self-contained.

### Permanent builder guardrails, unchanged

```text
One task per builder run.
Builder receives only the issued task file and explicitly allowed files.
Form D: source-only. No edit, compile or run.
Form B: production edit only after explicit council authorization.
Locate current regions by identifier census, not historical line numbers.
Brace counting, not indentation.
Never infer a missing fact.
Never choose among ambiguous objects.
Never infer strategy meaning.
Never use retrospective collection guessing for attribution.
Never use nearest / first / newest-object heuristics.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results.
No ellipses in a source paste. No retyped source line.
Declare every output split and deliver every part.
Include raw hash output when requested.
A successful builder report is not council acceptance until reviewed.
```

---

## §9 The census rule set — by reference, and the completeness gate is mechanical

```text
FILE OF RECORD:  03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md
                 764 lines, 27808 bytes, UTF-8 without BOM
                 26 numbered entries. Its first line is amendment 8's own language:
                 "PASTED VERBATIM, NOT REFERENCED"

DERIVED, NOT USABLE:  CENSUS_RULES_VERBATIM.txt — extracted from .srj\tools\
                 srjcensus.py, TOOL_VERSION 1.0.0, encoding amendments 1-23 as code.
                 MAY NOT be pasted into a Form D, quoted as a rule, or used as a
                 completeness check (R-63). Retained.

COMPLETENESS GATE, MECHANICAL (R-64, R-65):
  the issued task file's rule-set region byte-matches the file of record, verified
  by SHA-256 unchanged across the prepend
  assembled line count = 764 + body lines
  grep -SimpleMatch '16  multi-line call rule'          -> present
  grep -SimpleMatch '15  declaration brace exclusion'   -> present
  No count of amendments is asserted by council or required of the builder.

REVISION 61 §9's INDEX IS NON-AUTHORITATIVE. It listed fifteen amendments plus the
  multi-line call rule; the file carries 26 entries. The file is the authority.

ENCODING: UTF-8 no BOM. The prepend is BYTE-PRESERVING, never a read-decode-rewrite
  through a default-encoding Get-Content. Any inspection read specifies -Encoding UTF8.
  A relayed excerpt showing mojibake is a read-path artifact, not file damage (R-66).

LIMITATION, filed: no census pattern in the rule set is KNOWN to contain a non-ASCII
  character; the claim rests on two file heads, not on the file. Non-load-bearing
  under a byte-preserving prepend.

AMENDMENTS 17 THROUGH 26: council does not hold their text. Non-gating for issuing a
  Form D, since the builder receives the file. Potentially load-bearing for
  INTERPRETING a return. Council requests specific entries only if a specific return
  turns on one.
```

**Open item 49 is closed.** The 764-line measurement matched neither figure in defect 136 because the §9 index was the error, not the file (R-63, R-64).

---

## §10 Architecture layer

### 10.1 Retained from Revision 60, binding, not restated here

| Revision 60 § | Content |
|---|---|
| §6 | Lifecycle model. Eight enum members, all live; the mapping rule set; the three-way `ST_S5_GATE_CHECK` split; `HYPOTHESIS_BASIS_LOST`; `HYPOTHESIS_UNBOUND` retired unimplemented |
| §7.64 – §7.96 | Findings EA-147 through EA-179, four retractions, the void attribution deliverable |
| §9 | The twelve data contracts, every field classified. `SObjectRef` is the contract every other contract goes through |
| §10 | Transition rules. Candidate edges C1–C9, hypothesis edges H1–H12, pending-entry P1–P8, Phase B B1–B6, the reversibility rule |
| §11 | The completed ownership table. Six rows read `NOT STORED`, two read permanently `UNKNOWN` |
| §13 | Milestones 1 through 7 and the scenario set A through H |
| §15 | The must-not-conflate list, forty-odd rows |
| §16 | What must not happen |
| §18 | The open-item register and the planner census-defect ledger |

### 10.2 Amendments Revision 61 made to that layer, carried forward

1. §8.6's stasis quadruple is replaced by §3 of this document. **Its FlowLogic `.ex5` timestamp is corroborated accurate to the minute by R-84**, and its two `.ex5` values are compile-run evidence, not source provenance (R-58).
2. §14's sequencing table is replaced by §13 of this document.
3. §17.38's void attribution limitation now reads: *one attribution deliverable in the record is void, its replacement is accepted, and the replacement's architecture consequences are now read* — see §10.4.

### 10.3 Further amendments Revision 62 makes

4. **§10.3's terminator attachments are corrected** by §10.5's terminator table — T1/T2 span H1→P8, T4 is not a terminator, and the build's T5 is two terminators sharing one abort path.
5. **§9.8's divergence placement is corrected** to candidate level. Siblings share the divergence latch.
6. **§0's citation of Part A v4.2 §3.7 as the confluence constituent set is withdrawn.** §3.7 is the target-admissibility section.
7. **Milestone 5's census scope is EA-only**, ruled, and the milestone text must say so.
8. **§13.4's `SRJ INV` free-read claim is withdrawn** (R-68). **§13.4's `SLSIDEGUARD`/`SLZONEGUARD` claim is partially withdrawn**: both have now been read; `SLSIDEGUARD` returned 34 lines and one `selectionCause` member, `SLZONEGUARD` returned zero and is explained on both halves (R-83, R-88).

Everything else in Revision 60 stands.

### 10.4 What 160-PreJ's Blocks C and D established, now read

**Open item 18 — CLOSED, positive. FlowLogic emits, and the surface has three channels.**

```text
SRJ_Alerts.mqh
  SRJ_DispatchAlert   definition 7, brace range 8-18, 11 lines
    13:   Alert(msg);                          <- UNCONDITIONAL, no pushable equivalent
    15:      SendNotification(msg);
    17:      SendMail("SRJ Flow Logic", msg);  <- EXISTS NOWHERE IN THE EA
  five call sites:
    SRJ_Alerts_DispatchBiasRenewal  25, 28, 35, 38
    SRJ_FireExtremePromote          47
Tree-wide:  PlaySound(  ABSENT     SendFTP(  ABSENT
```

The qualifier *"in the EA"* on `Alert(`/`SendNotification(` is **permanent and measured**. `SendMail(` is a third channel and it is indicator-only. Gating on `Alert(` is upstream, on `g_enableBiasFlipAlerts` / `g_enableStructureRenewalAlerts` plus the `lastBarGuard` dedupe.

**Open item 19 — CLOSED. Neither pass deletes.**

| Pass | Range | `.Delete(` | Finding |
|---|---|---|---|
| `SRJ_OB_InactiveLinePrunePass` | 614–631 | **ABSENT** | Deletes **chart objects only** — `SRJ_DeleteObj(ob.obLineName)` / `(ob.midLineName)` at 626/627. The OB stays in the array. **The name is misleading** |
| `SRJ_OB_OpposingCachePass` | 634–677 | **ABSENT** | Reads both arrays, writes `g_s.cachedSwingBarBearish` / `cachedSwingBarBullish` |
| `SRJ_Bias_WeakFlipLatchPass` | 377–384 | — | Writes `g_s.weakFlipPreconditionMet = true` when `(!tickOBIsValid) && (!tickFVGIsValid) && hasPersistedOpposingFVG` — **the adverse 2-of-3 read as a conjunction, in the indicator, one pass before FVG creation** |

**The delete-path inventory is complete at four paths, all capacity-driven.** §7.81's closure, §17.26's closure and §17.39 lose their scope conditions. `HYPOTHESIS_BASIS_LOST` keeps its non-attributable design. Task 162 has **one** `GONE` design.

**Open item 20 — CLOSED. `ZoneAdoptable` reads the zone; `ZoneInPlay` exists.**

```text
ZoneAdoptable   DEFINITION EA 1211, region 1212-1261, 50 lines
                params: int barShift, double zHi, double zLo   (all BY VALUE)
                three returns: 1213 false, 1217 true, 1260 ok
  1215-1217:  same-zone equality short-circuit against g_zoneHi / g_zoneLo
  1224 BAR test   1232 SWING1 test   1235 500-slot walk -> SWING2 at 1245
  1249 ZONEADOPT print
  g_touchSeen ABSENT      objId ABSENT
  call site EA 2786, stack 1364->3056, 2771->2881 (if g_state == ST_S4_ARMED)
ZoneInPlay      DEFINITION EA 1338, region 1339-1361, 23 lines. Call sites 2365, 2367.
```

`ZoneAdoptable` **is** a fifth zone-global reader, but only as a same-zone equality short-circuit, not an admissibility filter — materially weaker than `TpTargetUpdateBest` 631 or `ComputeSlReference` 928/976/988, and it retires cleanly once the bundle supplies the zone. It does **not** read `g_touchSeen`, so the sibling-creation event at 2803 is not coupled to the touch revalidation at 2808–2811 through this guard. EA-132 points at two real functions and both retain the legacy ladder.

### 10.5 The Task 159 ruling — Task 160's specification

**All twelve contracts APPROVED.** Amendments only.

| Contract | Amendment |
|---|---|
| `SObjectRef` | **Unamended.** A-3 §5.4's `relevanceTime` is the same field as `promotionTime` |
| `SXobRecord` | **Unamended.** All six of A-3 §5.4's named backing-XOB fields present |
| `SFvgRecord` | **+ `parentXobRef`**, resolved reference, `UNKNOWN` until Task 163 derives it from the leg. `CImbalance` does not carry it. P15 governs |
| `SStructuralBundle` | **+ `bundleId`** immutable, engineering. **+ `legToken`** immutable at binding **or UNKNOWN** — the cross-run form of `legBoundaryBarAtLatch`; keep both. **+ `oppFvgRefs[]`** — A-3 §5.4's `oppFvgIds[]` with detection time, direction, validation state. **This is buffer 36's population and it belongs on the bundle.** Capacity is an engineering safety limit in the 500-slot precedent |
| `SMarketSnapshot` | Unamended |
| `SCandidate` | **+ `divergenceVerdict`, `divergenceConsumedBar`, MOVED here from `SHypothesis`.** A-3 §5.4 puts the divergence latch at candidate level and the build agrees — `g_divLatch` resets at EA 2233 beside `g_anchorBarTime` and `g_sessionAtEntry`. **Consequence for Task 162: siblings SHARE the divergence latch.** §5.6's *"it inherits nothing"* governs hypothesis-level fields — bundle, opposing candle, confirmation, 2-of-3 — not the candidate-level shared set |
| `SHypothesis` | Four amendments, below |
| `SStopReference` | `unionExtremeComponents` **mandatory with `UNKNOWN`**. **+ `unionExtremeAvailable`** boolean, `false` until Task 131. `selectionCause` is a **six-member** enumeration; `src=` measures three of them at Tier 1 — `FALLBACK_SIDE` 86, `OB_SWING` 66, `FALLBACK_EMPTY` 1 |
| `STargetReference` | `zoneDependent` → **immutable identity at latch**. `selectionCause` is a **five-member** enumeration |
| `SPendingEntry` | **+ `fillMode`** ∈ {`WICK_RETURN_ONLY`, `MARKET`}, immutable at creation. **+ `noChaseDominant`**, derived. A-3 §5.3's no-chase pending fills on wick return **only** — a different fill rule, so it is stored, not recomputed |
| `SDecision` | Unamended. Phase B's window decline is a separate record, not a Phase A verdict |
| `SDiagnosticEvent` | Unamended in shape. The six terminator literals are in the terminator table below |

**`SHypothesis`'s four amendments.**

1. `divergenceVerdict`, `divergenceConsumedBar` → **moved to `SCandidate`.**
2. `confluenceLatches` / `confluenceCount` → **RENAMED `adverseLatches` / `adverseCount`, constituent set ESTABLISHED** from A-3 §5.13 and §5.1:

```text
adverseLatches.inBiasObInvalidated     latched setup evidence + SObjectRef   <- buffer 34
adverseLatches.inBiasFvgInvalidated    latched setup evidence + SObjectRef   <- buffer 35
adverseLatches.opposingFvgValidated    latched setup evidence + SObjectRef   <- buffer 36

adverseCount = count of true members       derived
2-of-3 rule:  adverseCount >= 2  ->  T1 fires
evaluated:    binding -> SC inclusive (rejection), SC -> fill (cancellation, §5.11)
```

Each carries an `SObjectRef`, **which is exactly what the three export buffers were built to supply.** The instrumentation detour turns out to have been building this field's evidence layer without the field being specified.

3. **The Part A §3.7 citation is withdrawn.** There is no "confluence" concept in the documents held. The 2-of-3 is the adverse triple. If Part A defines a separate positive-confluence set, it is a new open item and **Task 165 is not blocked on it.**
4. `zoneHi` / `zoneLo` → **reclassified from "RETIREMENT BLOCKED" to "derived from `bundle.xob`, supplied explicitly as a parameter."** Items 18 and 19 unblock it.

#### The twenty packet items

| # | Ruling |
|---|---|
| 1 | **APPROVED.** Scenario B's criterion is a bar-index relation against `legBoundaryBarAtLatch` as it stood on the binding bar. The bundle also carries `relevanceTime = xob.ref.promotionTime`; **cross-run scoring uses `relevanceTime`, never the bar index.** The latch is taken on a closed bar, satisfied by construction because `SMarketSnapshot.barClosed` is invariant-true on the EA path |
| 2 | **APPROVED**, superseded in scope by 19. A-3 §5.9 rules the one-swing branch must use the **union extreme of bound XOB and in-bias FVG**, and EA-108 establishes no buffer carries it. **The run's single signal took the one-swing branch (R-82, measured), so the record's only stop is wrong by §5.9** — independently of EA-145's instability and EA-177's unlatched close. Three defects on one field. `unionExtremeComponents` becomes mandatory-with-`UNKNOWN` plus `unionExtremeAvailable`, `false` until Task 131 exports it. **Corrected: the two-swing branch is not unreached — it fires 8 times, none on the signal** |
| 3 | **APPROVED, scope condition DISCHARGED** by open item 19 |
| 4 | **APPROVED for the EA side, EXTENDED for the tree.** HEADS-UP and STAND-DOWN become `SDiagnosticEvent` kinds and lose their emission path; SIGNAL moves to Phase B; the emitter takes the hypothesis as an argument. **The indicator's five dispatch sites stay and are out of Phase A/B scope by subject matter** — they announce market-structure facts, not candidate commitments. **Milestone 5's census is EA-only** |
| 5 | **APPROVED, now specifiable.** A-3 §5.3's no-chase test **dominates and is evaluated first**, so P4 is reachable only when `worse_price` is false. Ordering: no-chase → if worse, P1 creates at `P_dc` **wick-fill-only** and P4 is unreachable → if not worse, compute `R_dc` and `R_sc`, and P4 fires only when `R_dc > R_sc` and `R_dc` is valid. Superseded record latches `cancellationReason = SUPERSEDED_BY_BETTER_R` |
| 6 | **APPROVED**, quotable verbatim from A-3 §5.20. B4 is measured behaviour-neutral on the current signal set — no Tier 2 signal sits at 11:55 or 18:55 — so **its first live run should show zero declines and that zero is a result** |
| 7 | **APPROVED.** A-3 §5.1: *"the S3→S4 arming transition IS the binding point"* |
| 8 | **APPROVED, corroborated by measurement.** A-3 §5.6's *"a rejected setup consumes nothing"* plus zone `1.15794–1.15813` arming three times on 08.18 from three different candidates — reproduced at Tier 1 |
| 9 | **APPROVED**, with the re-expression table below |
| 10 | **RULED IN FULL. Open item 6's terminator half CLOSED.** Table below. Three corrections to Rev 60 §10.3 |
| 11 | **APPROVED.** `lastValidObserved` separates EA-145's two readings; `lastFilledObserved` makes A-3 §5.15's forgetting rule observable rather than asserted |
| 12 | **APPROVED, both claims, and there are THREE vocabularies not two.** The EA's three-member window; `SRJ_GetSessionId`'s five-member session; and a **buffer-level** encoding — buffer 18's sweep tag `1`=AS.H … `8`=PM.L plus buffer 29's 14-bit mask, bits 0–9 swept per `sessbufs[]`, bits 10–13 live per Asia/London/NY/PM. **No two of the three may be compared** |
| 13 | **RULED: state the bound and stop. Do NOT establish array ordering.** Task 163 records `GONE` with `resolvedBar` and both last-observed fields, and states in source that FVG-path `GONE` chronology is `UNKNOWN`. No Form D |
| 14 | **NOTED, informational, independently corroborated.** A-3 §5.8's own wrapper — `LoadWorkingSet` / `HypothesisCascade` / `StoreWorkingSet`, *"zero return-site edits"*, signature migration withdrawn — matches Task 161's drafted adapter exactly |
| 15 | **CHOICE MADE: the instrument, smaller than drafted.** `selectionCause` is a five-member enumeration. Causes (702) mask and (708) tier are **already instrumented** by the existing `SWEPTMASK`/`TPCENSUS` pair. The other three — 617 empty/non-positive, 619 direction, 631 zone containment — live in `TpTargetUpdateBest`, 22 lines, and need **one print**, print-only, byte-identical gate, Task 144 pattern. Until it lands those three are `UNKNOWN` and `NO_TP_TARGET` may not be read as *"no structure existed"* |
| 16 | **SPLIT THREE WAYS, and the §3.7 citation was wrong.** Rev 56 §5.18 quotes §3.7 directly: two exclusions only — *"already swept as session liquidity"* and *"closed over"* — and it explicitly accepts movement. §3.7 is the **target-admissibility** section. Session-swept (EA 649) **RULED CORRECT**; session-live (EA 655) **NOT IN §3.7, requires R-Q12**; POI anchor-tier (EA 708) **NOT IN §3.7 and §3.7 does not exclude POI lines at all — newly unattributable.** Scenario G cannot be scored until R-Q12 returns. The comment at 670 remains inadmissible as classification |
| 17 | **RULED: the test's content is admissible; the ASYMMETRY is the defect.** A-3 §5.1's completion test enumerates *"bound bundle valid, opposing candle, DC, divergence, valid stop reference, valid target, ≥1R… and an execution bar inside a trading window."* Zone containment is not among them, but a target inside the entry zone is degenerate under any reading. **The test becomes unconditional via items 18 and 19 — same rule, both sides, one meaning.** Pre-binding it is vacuous by construction, not by a zeroed global. **Now measured on both halves (R-88): pre-binding zones are literally 0.0 on every sampled line; post-binding four `site=S5` evaluations carried live zones and had nothing to reject** |
| 18 | **YES — made explicit rather than ambient.** `TpTargetUpdateBest` takes the zone as a parameter. Pre-binding the caller passes an **explicit absence**, not `0.0`. Post-binding it passes the bundle's zone. `zoneDependent` becomes **immutable identity at latch**. §5.35's split strengthened: the **admission** target is hypothesis-owned and zone-dependent; the **post-fill** target is position-manager-owned and **not** zone-dependent, because after fill the zone is spent. **Zone retirement UNBLOCKED on the target side** |
| 19 | **YES — same treatment.** `ComputeSlReference` takes the zone as a parameter; both guards become unconditional with an explicit-absence zone pre-binding. On `selectionCause`: **`src=` is already in the build and covers every one-swing call at every site — 153 of 153, exceptionless.** The required print targets **the two-swing branch, which has no selection-cause instrumentation at any site** (R-83, R-91). Population: eight evaluations, all `site=S2POLL`, all `obValid=0`, dated 08.18 and 08.21. **Zone retirement UNBLOCKED on the stop side** |
| 20 | **RESOLVED AS INTENT, and EA-176 is PARTIALLY RETRACTED.** A-3 §5.9: *"Two-swing walk is the only branch that may land inside the zone."* The **zone guard's** absence on the two-swing branch is **ruled correct**. The **side guard's** absence is **not** covered — a stop on the wrong side of the entry reference is not a stop. That half stands. **Task 166 does not repair the zone-guard absence.** Recorded: no measured instance of a two-swing stop landing inside its zone; A-3 §5.9's permission was not exercised at Tier 1 |

#### Terminator attachment, ruled — three corrections to Rev 60 §10.3

| Terminator | A-3 §5.10 text | Attaches to | Diagnostic literal |
|---|---|---|---|
| **T1** | bound structure invalidated | **any bound state, H1 → P8 inclusive.** Rejection before SC, cancellation after (§5.11). **NOT S5-only** | `TERM_T1_STRUCTURE_INVALIDATED` |
| **T2** | bias flips against direction | **same span.** §5.11 names it a pending-entry cancellation too | `TERM_T2_BIAS_FLIP` |
| **T3** | TP or SL reached before fill | `SPendingEntry` edge **P6** — pre-attached, confirmed | `TERM_T3_REACHED_BEFORE_FILL` |
| **T4** | divergence validates at entry or better → **execute** | **NOT A TERMINATOR.** Edge **H6**, then Phase B's §5.20 test | `ADV_T4_DIVERGENCE_CONSUMED` |
| **T5a** | target level no longer valid | `HYPOTHESIS_WAITING_TARGET_VALIDITY` | `TERM_T5A_TARGET_INVALID` |
| **T5b** | RR no longer satisfied | `HYPOTHESIS_WAITING_RR` | `TERM_T5B_RR_FAIL` |

**Correction 1.** §10.3's H9 listed T4 among its rejection triggers. Wrong — T4 advances.
**Correction 2.** §10.3 scoped T1/T2 to the S5 states. A-3 §5.1 puts the 2-of-3 at binding→SC inclusive and §5.11 extends it to pending-entry cancellation, so **T1 and T2 span H1 through P8** as one rule expressed as two edges.
**Correction 3, the payoff.** **The build's T5 is two terminators sharing one abort path** — `ABORT_NO_TP_TARGET` at 2894 and `ABORT_TP_RR_FAIL` at 2917, both above the divergence check at 2921. That is the mechanical justification for the three-way `ST_S5_GATE_CHECK` split, from source rather than drafting preference.

**And `HYPOTHESIS_WAITING_DIVERGENCE` has no terminator of its own.** Its only exits are T4 and the two global adverse edges. So a `SESSION_CLOSED` death at S5 with `divLatch=0` is **always** the divergence state — which makes the Tier 2 fixture (`wouldHold=1`, 1 instance across 5,472 bars) attributable for the first time.

#### Item 9 — the eight ordinal sites, re-expressed

| Line | Expression | Becomes | Owner |
|---|---|---|---|
| 1426 | `!= ST_IDLE` | a candidate exists | candidate registry |
| 1727, 2124, 2172 | `> ST_IDLE && != ST_ABORT` | a live non-terminal candidate exists | candidate registry |
| 1788 | `>= ST_S3_ZONE_WAIT && <= ST_S5_GATE_CHECK` | **spans the binding point → TWO tests** | candidate OR hypothesis |
| 1924 | `>= ST_S2_LTF_ALIGN && < ST_S4_ARMED` | pre-binding only | candidate only |
| 1931 | `>= ST_S4_ARMED && <= ST_S5_GATE_CHECK` | post-binding only | hypothesis only |
| 1937 | `>= ST_S2_LTF_ALIGN && <= ST_S5_GATE_CHECK` | **spans → TWO tests** | candidate OR hypothesis |
| 2005 | `>= ST_S1_REGIME` | any candidate past admission | candidate only |

**1937 is the one that matters.** It encloses Task 142's only permitted site at 1946 **and** `ComputeSlReference`'s S2 poll at 1949. Re-expressing it touches two queued tasks. **`160-PreK` STAGE 6b decides whether this is a rewrite or a renumbering** — whether the comparisons rest on declaration order or on assigned enum values.

---

## §11 What is blocking the project

Nothing council owes. Nothing the operator owes. One builder run.

### 11.1 The single blocker: `160-PreK`

Task 160's council gate is met and its baseline gate is met (R-61). What it does not have is **current anchors**. Its source half was declared met at 160-PreF, before Task 155 edited five of the sixteen files. Under R-67, anchors into `SRJ_FlowLogic.mq5`, `SRJ_State.mqh`, `SRJ_OrderblockMgr.mqh`, `SRJ_ImbalanceMgr.mqh` and `SRJ_BiasEngine.mqh` are **aged out**; anchors into `SRJ_FlowNexus_EA.mq5` and `SRJ_Types.mqh` are **current**, both digest-confirmed.

Council does not hold 160-PreF's anchor set, so it cannot certify which of Task 160's specific anchors sat in which file. `160-PreK` re-establishes the **insertion surface**, which no prior Form D targeted, and it is narrower than it would have been because R-67 spares the EA census.

**`160-PreK` is source-only, needs no authorization, and is the only thing between this project and its first migration edit.**

### 11.2 What is no longer blocking

```text
Task 159's contracts        RULED (§10.5)
160-PreJ Blocks C and D     READ (§10.4). Open items 18, 19, 20 CLOSED
Revision 56 §5 / A-3        CONSUMED into §10.5
Part A v4.2 §3.7            CITATION WITHDRAWN. Was never the needed document
Open item 49                CLOSED. The rule set of record is whole at 764 lines
Open item 23 / buffer 36    PARKED. Nothing queued depends on it
Open items 25, 27           CLOSED by 155-REG
The chart-attach link       MAY NEVER BE NEEDED (R-80)
```

### 11.3 Absent documents, and none of them blocks anything

| Document | Consequence of absence |
|---|---|
| Revision 56 §§6, 7, 8, 10, 14 | Defect ledger EA-1…EA-146, log formats, operator answers R-Q13/14/15. Non-blocking |
| Part A Specification v4.2 | Open item 12's London-bounds question and any positive-confluence concept, if one exists. **Non-blocking for Tasks 160 through 166** |
| `99_NOTES\DefectLedger.txt`, 839 lines | Defects 87–181, findings EA-180–218, rulings R-1–R-30. **Recovery is queued behind strategy work, never ahead of it** (§15) |
| Census amendments 17–26 | Non-gating for issuing a Form D. Requested only if a specific return turns on one |

### 11.4 Still requiring the operator, and neither blocks Task 160

```text
R-Q11   outstanding, gates Task 141
R-Q12   outstanding, gates Task 142, gates the session-live target exclusion (item 16),
        and now gates whether ANY R figure in the record may be called strategy-correct.
        Scenario G cannot be scored until it returns.
```

Both are discretionary strategy meaning. Both are old. Council will ask them when the task that needs them is next, not before.

---

## §12 The bounded items in front of the project

Each is a separate packet. Bodies for the three issuable ones are in §20.

### 12.1 `160-PreK` — anchor re-establishment for Task 160

```text
Form:            D, source-only
Authorization:   NONE REQUIRED, NONE ISSUED
Body:            §20.1
Cost:            35 minutes, no run
Closes:          Task 160's source gate under P12 / R-67; P5a's precondition verified
                 rather than assumed; identifier collision ruled out BEFORE any byte is
                 written; STAGE 6b decides whether item 9 is a rewrite or a renumbering
```

### 12.2 `155-RT-A` — buffer-34 read-mechanism census

```text
Form:            D, source-only
Authorization:   NONE REQUIRED, NONE ISSUED
Body:            §20.2
Cost:            30 minutes, no run
Decides:         open item 24 (re-scoped by R-80) and whether 155-RT-B exists at all.
                 Item 4b is the decision point: does anything read index 34.
Deadline:        before Task 163, NOT before Task 160. Task 160 does not read buffer 34.
```

### 12.3 `160-QUAR` — the R-78 quarantine

```text
Form:            OPS, four recorded file moves
Authorization:   160QUAR-A1, issued by §20.3. Scope: four moves. Never a delete.
Body:            §20.3
Cost:            10 minutes
Blocks:          nothing. Foldable into any builder sitting.
```

### 12.4 Task 160 — the migration's first production edit

```text
Form:            B
Authorization:   REQUIRED, will be issued as its own packet. NOT issued here.
Gate:            council ruling (met, §10.5) + current baseline (met, 155-REG) +
                 current anchors (160-PreK's return)
Harness:         Tier 1, ~27 min, byte-identical against Task 155REG
Drafted by:      council, from BUILDER_RESULT_160-PreK.md
```

### 12.5 `155-RT-B` — suspended, and its decision table is pre-committed

| `155-RT-A` return | Consequence |
|---|---|
| 4b = NO CONSUMER **and** 3g = same expression | Open item 24 closes as **PREMATURE**. `155-RT-B` **withdrawn**. The export is write-only until Task 163 builds its consumer; `OBPROV` is the instrument meanwhile. Cheapest outcome |
| 4b = NO CONSUMER **and** 3g = different expressions | Item 24 narrows to *"does the buffer receive what the print reports."* Answerable inside Task 163's own instrumentation. `155-RT-B` still withdrawn |
| 4b = CONSUMED | A consumer exists. R-80's same-bar overwrite becomes a **transport defect**, not a caveat. `155-RT-B` is drafted, scoped to the consumer's read |
| 2b index 34 within `indicator_plots`, `INDICATOR_DATA` | If ever needed: chart attach, Data Window read. Minutes, one authorization |
| 2b index 34 beyond `indicator_plots`, or `INDICATOR_CALCULATIONS` | If ever needed: a reader script at a **new path outside the canonical sixteen**, using `ChartIndicatorGet` on a manually attached instance rather than `iCustom` so no input list must be matched. Council drafts it literally; one authorization naming the path, the compile scope and the shift bound |
| 3d sentinel = UNKNOWN | `155-RT-B` reads a **range** and reports the full value distribution with bar times. The sentinel is identified as the modal value rather than assumed |
| 5b `objId` present in object names | `155-RT-B` censuses chart object names and reports buffer values as MEMBER / NOT-MEMBER of the on-chart objId set. That is the real correctness test |
| 5b `objId` absent | Correctness becomes partially unfalsifiable on a live chart, and honest verification moves to Task 163's instrumentation. Council will say so rather than dress up a weaker test |

---

## §13 Milestones and sequencing

### 13.1 The objective, restated because ten revisions of instrumentation have made it easy to lose

Structural agreement is **0 of 12**, unchanged across ten revisions. That is the only number that decides whether this build reproduces the operator's strategy, and it has not moved because the thing being measured was never the thing that was broken.

The diagnosis is unchanged and was reached twice independently. The EA's working state is thirteen file-globals. Every downstream operation — regime, alignment, freshness, target, stop, divergence, zone, touch, confirmation, signal, throttle, alert — reads or writes that one set. **That is not a candidate registry with capacity one; it is a single mutable process.** A registry becomes concurrent by raising a constant. A single mutable process becomes concurrent only after it acquires the concept of a candidate.

Six register items are downstream of that one absence, and reading them as six problems is what made sixty tasks feel like progress.

**R-90 is the first measured instance of that diagnosis.** A pre-binding evaluation at 08.18 09:25 read zone globals an arming event set at 09:20. Either the same candidate de-armed without a zone reset, or a different candidate read a zone another candidate armed. Both are the singleton defect, and the log cannot separate them — which is precisely what Milestone 1's per-field load/store log exists to do.

### 13.2 Milestones — unchanged, and none has been attempted

| # | Milestone | Passes when | Task |
|---|---|---|---|
| 1 | State isolation | A hypothesis is evaluated without changing another's state. Proven by a per-field load/store log, **not a signal count** | 161 |
| 2 | Identity preservation | A hypothesis retains XOB, FVG and bundle identity across bars, re-read by identity not re-selection. **Includes a `GONE` case with both last-observed fields, or a stated zero** | 162 |
| 3 | Evidence ownership | Every touch, confirmation, divergence, invalidation, stop and target fact is attributable to the hypothesis that owns it | 162, 163 |
| 4 | Sibling preservation | A later structural object produces a logged sibling rather than replacing the first hypothesis, at **both** binding sites. **Siblings share the divergence latch** (§10.5) | 162 |
| 5 | Phase separation | Evaluation produces decisions and commits nothing. Census of Phase A against the six-line commit surface. **Scope is EA-only, ruled** | 164 |
| 6 | Deterministic arbitration | Multiple completions resolve by explicit rules. Every multi-completion bar carries an `ARBITRATION_*` event naming winner and rule | 164 |
| 7 | Scenario reproduction | **Only now** are A, B, C, D, G and H scored | after 164 |

Milestones 1 through 4 are cheap and byte-adjacent. **Milestone 5 is the one that pays for the rest:** once evaluation commits nothing, an admission-changing edit can be measured against a stable denominator and EA-133 stops being a blanket caveat. **Tasks 141 and 142 are cheap after Milestone 5 and expensive before it.** That is the whole sequencing argument and it has not changed.

### 13.3 Sequence

| Order | Item | Gate | Harness | Owner |
|---|---|---|---|---|
| **1** | **`160-PreK`** | none | none | **builder, issuable now** |
| 2 | **Task 160** architecture shell, inert | 160-PreK's anchors | Tier 1 ~27 min, byte-identical vs Task 155REG | builder, Opus for the edit |
| 2 | `155-RT-A` | none | none | builder, parallel-safe but sequential per guardrail |
| 3 | **Task 161** cascade adapter. **Milestone 1** | 160 | Tier 1 + per-field load/store log | builder, Opus for the edit |
| 4 | **Task 162** binding. **Milestones 2, 3, 4** | 161 | Tier 2 ~84 min + **the `SL 1.15870` value gate** | builder, Opus for the edit |
| 5 | **Task 163** provenance completion | 162 | Tier 2 ~84 min | builder |
| 6 | **Task 164** Phase A / B. **Milestones 5, 6** | 163 | Tier 2 then Tier 3 ~252 min | builder, Opus for the edit |
| 7 | Task 165 pending-entry lifecycle | 164 | Tier 2 | builder |
| 8 | Tasks 141, 142, 129, 130, 131 | their stated predecessors | as recorded | builder |
| 9 | Task 166 position and exit engine | 165 + two scenarios passing | Tier 3 | builder |
| — | `160-QUAR` | none | none | builder, whenever |

**Run-budget rule, amended by measurement.** Carry **~1.7% per registered buffer** — 26 min 50.7 s against 25 min 30.4 s for three registrations over 1,728 bars. Tier 1 ~27 min at 37 buffers, Tier 2 ~84 min, Tier 3 ~252 min. Registration is what costs, not population, so populating buffers 35 and 36 would not move the figure.

Behaviour-neutral edits regress at Tier 1. Admission-changing measurement runs at Tier 1 if the phenomenon is in the window, Tier 2 if it needs 08/03, 08/05 or 07.28. Tier 3 locks in a change or claims the whole signal set. **`D:\Videos\Task 135 Full Logs.txt` is retired as a gate target; the baseline is Task 155REG. Task 123's Tier 3 is three generations behind**, so the next Tier 3 run re-establishes that baseline as well as measuring whatever it was spent on.

**Total to Milestone 6 from here:** two source-only Form Ds, four Form Bs, three Tier 1 runs, three Tier 2 runs. Roughly six and a half hours of measurement to reach a representation that can express the strategy — against sixty tasks that did not.

### 13.4 Cheap reads still worth queuing, and where they now live

Revision 61 §13.4's list is substantially spent. Corrected state:

```text
SRJ INV                 WITHDRAWN (R-68). Both INV and INVALID are absent from the
                        6,577-line full capture. It was never an available instrument.

SLSIDEGUARD             READ. 34 lines, all site=S2POLL, all zoneLo=zoneHi=0.00000,
                        chosen=NONE 9 of 34. One selectionCause member measured.
                        Direct measured corroboration of items 17, 18, 19.

SLZONEGUARD             READ, returned ZERO, and the zero is EXPLAINED on both halves
                        (R-83, R-88). Not an instrumentation gap.

SLSRC / SL_REF          READ. 153 = 153 exceptionless; src= covers every one-swing call
                        at every site; the two-swing gap is total and site-independent.
                        Item 19's requirement narrowed and its population named.

LTF_MISALIGN            STILL MAPPED AND NOT DIAGNOSED. 28 of 87 Tier 2 aborts,
                        Daily-POC 12 of 28. EA-172 names the replay-order defect and
                        must be excluded before any abort is attributed to strategy.

A-3 §5.20's population   STILL AVAILABLE. A census of SESSION_CLOSED deaths by state and
                        offset from the window close sizes EA-144 before Task 164
                        implements it. The 22 SESSIONHOLD lines are already extracted.
```

**Deferred reads now filed by destination, and none is requested as a free read.** No further free reads are issued until a packet needs them.

| Deferred read | Destination |
|---|---|
| The containment test's `<=` versus `<`, decisive for the record's only signal | Task 162's predecessor Form D (R-88, R-89) |
| `obValid`'s distribution across the 161 `SL_REF` lines. **Hypothesis, explicitly unconfirmed, no number built on it:** all eight two-swing lines read `obValid=0` and every sampled one-swing line reads `obValid=1`, so branch selection may be determined by `obValid` alone. If so, §5.9 bites on exactly 153 evaluations | Same |
| The four `site=S5` lines' `src=` values | Item 19's print packet |
| `OBPROV`'s windowed `id`/`code` partition at bar ≥ 120745 | Task 163's packet (R-81, R-93) |
| `OBPROV`'s enumeration width, codes 1–2 unobserved | `155-RT-A` item 3f |
| Whether `OBPROV`'s `id` is buffer 34's expression | `155-RT-A` item 3g |
| Whether anything reads index 34 | `155-RT-A` item 4b |
| The 08.21 19:00 `close=` print site | `155-RT-A` item 3h, record-only (R-77) |

---

## §14 Open-item register

Revision 60 §18 carries forward. Changes and current entries only.

| # | Item | Consumed by | Status |
|---|---|---|---|
| 4 | Should the `nearest` branch set `currentLegHasXOB`? | Task 129 | OPEN. Council reading, not censusable, not an operator question |
| 6 | T1/T2/T4/T5's conditions and attachment; the 2-of-3 constituent set | `adverseLatches`, H9, Task 165 | **TERMINATOR HALF CLOSED** by A-3 §5.10. **CONFLUENCE HALF WITHDRAWN as mis-cited** |
| 12 | Do `CurrentTradingWindow`'s London bounds and `g_defLondon` agree? | EA-165 | OPEN. A Part A question |
| 13 | Is insertion order chronological? Is `SRJ_FVGOverCap` evaluated against a count its own pass decrements? | EA-166, Task 163 | **RULED: state the bound, do not establish ordering.** No Form D. **A planner hypothesis, explicitly unconfirmed. No number may be built on it** |
| 18 | Does `SRJ_Alerts_DispatchBiasRenewal` emit? | packet item 4, Milestone 5's scope | **CLOSED, positive. Three channels; `SendMail(` is indicator-only** |
| 19 | Do FlowLogic 862 or 864 delete? | Task 162's `GONE` design | **CLOSED. Neither deletes. Four capacity-driven delete paths, inventory complete** |
| 20 | What does `ZoneAdoptable` test? Does `ZoneInPlay` exist? | EA-132, Task 162 | **CLOSED. Fifth zone reader, equality short-circuit only, no `g_touchSeen`. `ZoneInPlay` exists at EA 1338** |
| 21 | Can buffer 35's region-level write name an object? | export stage 3 | CLOSED as source review. Implementation PARKED with Task 156 |
| 22 | Which object does each of the seven flag-write regions attribute to? | §17.38 | **CLOSED by 160-PreJ Block A, accepted and now read** |
| 23 | What event and transport contract does buffer 36 implement? | Task 154 | **PARKED. Withdrawn as a blocker.** Its answer is `SStructuralBundle.oppFvgRefs[]` (§10.5) |
| 24 | Does buffer 34 carry a correct value at runtime? | Task 163's provenance design | **RE-SCOPED (R-80) to "does anything consume index 34." Decided by `155-RT-A` item 4b** |
| 25 | Is the Task 155 edit behaviour-neutral, and does a current-generation Tier 1 baseline exist? | Task 160's gate | **CLOSED by 155-REG. MEASURED behaviour-neutral, not derived** |
| 26 | Is the twenty-item packet ruled, and are the twelve contracts approved? | Task 160's council gate | **CLOSED. §10.5** |
| 27 | Nine include files unnamed by the 155 diff gate | whole-tree stasis | **CLOSED. It was ten, not nine. All sixteen carry a recorded digest** |
| 49 | The census rule block's line count | any Form D | **CLOSED. 764 lines is correct; Rev 61 §9's index was the error (R-63, R-64)** |

**New, subjects only, numbers assigned by the scribe at archive time:**

```text
the unrecorded 2026-08-30 canonical compile event and the EA source edit it carried
the banner-to-disk size mapping, two paired observations disagreeing by +32 and +33
the zone containment test's inclusivity, <= versus <, decisive for the only signal
the executable census tool at .srj\tools\srjcensus.py v1.0.0, outside the canonical
  tree, encoding 23 amendments against the file of record's 26. NOT adopted, NOT
  queued, and its text is not requested — a faster census does not move 0 of 12
census amendments 17 through 26, whose text council does not hold
OBPROV's enumeration width, codes 3-8 observed, 1-2 unobserved
the 732-line timestamp-led bucket, undecomposed, containing the 22 aborts and the signal
buffer 34's same-bar overwrite as a transport defect, conditional on a consumer existing
the POI anchor-tier target filter, unattributable to Part A §3.7
the non-ASCII census-pattern limitation
obValid as the possible sole determinant of branch selection
the nested local repository's same-filename hazard (now P17)
```

**Closed across Revisions 56 through 62: twenty-eight items. Open on council reasoning: four. Parked with the export stages: two. Re-scoped and pending one builder return: one.**

---

## §15 Parked, and not lost

```text
Defects 154-172 and rulings R-31 to R-41: text not held by council. The ledger ranges
  that would recover them are on disk, extracted and byte-verified, in
  BUILDER_RESULT_60.4-12.md lines 401-800 and -13.md lines 801-839. Council has not
  read them and does not need to.

Defects 87-153 and 173-181; findings EA-180 through EA-218; rulings R-1 to R-30: text
  not held by council. In the builder reports of the 60.1-60.7 arc and in
  99_NOTES\DefectLedger.txt, 839 lines.

Open item 28, the unread 154-Pre1 and 154-Pre2 hash results.

Buffer 35 and buffer 36 population, and open item 23's transport contract. Registered,
  unpopulated, parked with Tasks 156 and 154. Their specification is settled —
  SStructuralBundle.oppFvgRefs[] and adverseLatches — so the parking costs nothing.

The executable census tool. Out of the canonical tree, three amendments behind the file
  of record, and a tool that lags silently produces a census that looks conforming and
  is not. NOT adopted. Its text is NOT requested.

Every finding, limitation and defect numbered in Revisions 60 through 60.7 that this
  document does not restate.

RECOVERY IS QUEUED BEHIND STRATEGY WORK, NOT AHEAD OF IT. A parked number is picked up
  only when a specific ruling requires that specific number, and then for that number
  alone. Ledger reconstruction ahead of a run is retired (§8).
```

---

## §16 Stasis

```text
PRE-155 SERIES:  CLOSED AT 28, and NOT CONTINUOUS.
  It measured the absence of unauthorized drift on FlowLogic's .mq5, which held MATCH
  for 21 consecutive rounds. Its evidentiary role passed to STAGE 7's diff assertions.
  CAVEAT (R-87): continuous EA source stasis across 2026-08-28 -> 08-30 is
  UNESTABLISHED. An unrecorded EA source edit occurred in that interval.

POST-155 SERIES: LENGTH 3.
  155-R2 Packet C S4    five digests EQUAL across the compile
  155-REG STAGE 1       sixteen digests, six against targets, ten recorded
  155-REG STAGE 7       sixteen digests EQUAL across the run
  Extended by 160-PreK STAGE 1 and STAGE 7 to length 5, all sixteen against targets.

SCOPE:  WHOLE TREE, sixteen files (R-60). Source stasis is the two .mq5 digests plus
  the fourteen .mqh digests, and nothing else.
  .ex5 SIZE and TIMESTAMP are compile-run evidence and NO GATE MAY BE BUILT ON EITHER
  (R-58). Banner "bytes loaded" is not file size (R-86).

RUN PROVENANCE, four instruments:
  P8    journal line "generating based on real ticks"
  P8a   SRJ XOB-PROMOCENSUS fingerprint as an integer — 372 is real ticks, 607 is
        generated and voids the run
  P9    liveness probe on BIASCENSUS_FINAL bars=
  P8b   the SRJ BUILD line, compile-embedded, in-journal, per-run (R-85)
```

---

## §17 What must not happen

Revision 60 §16 and Revision 61 §17 carry forward in full. Sharpened, added, or changed in force by this revision:

- **No `.ex5` size or timestamp in any gate**, and **no cross-instrument comparison** between a banner `bytes loaded` figure and a disk size (R-58, R-86). Both `.ex5` fields have moved in this project without a recorded source edit.
- **No claim of continuous EA source stasis across 2026-08-28 → 08-30** (R-87).
- **No gate against `D:\Videos\Task 135 Full Logs.txt`.** Retired as a comparison target. Its capture is complete (R-74) but its EA binary differed (R-76). Absence claims sourced from it are statements about the Task 135 run, not about the current build.
- **No value-bearing gate without cross-generation comparison or intra-batch sibling corroboration** (R-77). One field of one line in a 6,577-line journal is measurably wrong by one character and the mechanism is unidentified. Counts remain the primary instrument.
- **No source file located by filename search, glob, `-Recurse`, wildcard, or Navigator selection** (P17).
- **No `.ex5` created, retained or read under `02_TASK_CHECKPOINTS`** (P18). **No delete where a move will do** (R-78).
- **No operator hand-assembly, hand-transcription, or personal-shell command execution** (R-94). Council delivers paste-ready IDE instructions or it delivers nothing.
- **No consolidated handoff loaded into an IDE session as builder input.** A builder receives an assembled, self-contained packet file. This document is the council's state record, the operator's relay artifact, and the assembler's source for §20 (R-95).
- **No use of `CENSUS_RULES_VERBATIM.txt` as a rule source, a paste, or a completeness check** (R-63). **No use of Revision 61 §9's index as a completeness check** (R-64). The amendment-8 gate is a byte-match against the file of record.
- **No citation of Part A v4.2 §3.7 as the confluence constituent set.** Withdrawn. The 2-of-3 is the adverse triple: `inBiasObInvalidated`, `inBiasFvgInvalidated`, `opposingFvgValidated`, each carrying an `SObjectRef`.
- **No claim that `SRJ INV` is an available instrument** (R-68). Both `INV` and `INVALID` are absent from the full capture.
- **No use of Task 160-PreH Block B's attribution verdicts** — void, and they may not be quoted, compared against, or re-derived. 160-PreJ's replacement is accepted and read.
- **No claim that Alert(` and `SendNotification(` occur only inside `EmitAlert`** without the qualifier *in the EA*. `SRJ_DispatchAlert` is a second, independent emitter and `SendMail(` is a third channel that exists nowhere in the EA.
- **No windowed figure derived from `OBPROV`'s 2678 / 1654 / 1024** without the bar ≥ 120745 boundary (R-81, R-93). The history batch is 1703 lines.
- **No claim that the project is blocked on buffer 36, buffer 35, or open item 23.** They are parked and their specification is settled. A reader who finds Revision 60.1 and concludes otherwise is reading a withdrawn blocker.
- **No comparison of a live file against `Rev060_Task155_ExportStage_Buffer34\BEFORE\`.** Pre-155 history, and its two `.ex5` are non-canonical.
- **No gate compared against a truncated digest.** The full 64-character values are read from `BUILDER_RESULT_155-REG.md` STAGE 7, and comparison is case-insensitive (R-57).
- **No mechanical retirement of `g_zoneHi`/`g_zoneLo` that fails to reproduce `SL 1.15870` on 2026.08.17 16:20:01** (R-89). Five EA functions read them, two in control flow on the admission path. A retirement that compiles silently moves the only stop in the record.
- **No production edit, compile, chart attach or harness run without a separate authorization naming its own bounded scope** (§4).
- **No Claude Plan mode used to create a file.** Read-only in this setup. Use Claude Default + Sonnet 4.5 for workflow-document creation.
- **No paid planning model spent on a mechanical file update.** Delegate the R-65 prepend and any `CURRENT_STATE.txt` rewrite to Cline with a cheap available model.
- **No new EA number or defect number minted by council** (§6.3).

Everything else in Revision 60 §16 stands unchanged, including P12 through P18's consequences, the `GONE` handling rules, the emission-surface qualifier, the ordinal-state-comparison prohibition, and the no-dimensional-thresholds rule with its two bounded exceptions.

**Operation stays alert-only.**

---

## §18 Repository actions

Documentation and one recorded quarantine. No production checkpoint is created by this revision.

```text
 1. Create 06_HANDOFFS\REVISION_62_CONSOLIDATED_HANDOFF.md from this document.
    UTF-8 without BOM.

 2. Mark 06_HANDOFFS\REVISION_61_CONSOLIDATED_HANDOFF.md SUPERSEDED BY REVISION 62
    in place. Do not delete. Add two visible notes:
      section 9's completeness index is NON-AUTHORITATIVE per R-64
      section 13.4's 'SRJ INV' free-read claim is WITHDRAWN per R-68

 3. Retain as historical archive, council reference only, loaded into no IDE session:
      REVISION_60_CONSOLIDATED_HANDOFF.md         2638 lines
      REVISION_60.4_CONSOLIDATED_HANDOFF.md       1722 lines
      99_NOTES\DefectLedger.txt                    839 lines
      BUILDER_RESULT_60.4-10 / -11 / -12 / -13.md
    Revisions 60.1 through 60.7 remain marked SUPERSEDED; 60.1 must carry a visible
    note that its 154-Design-Review blocker is WITHDRAWN, not outstanding.

 4. Archive BUILDER_RESULT_155-REG.md as the accepted current-generation Tier 1
    baseline and the SOLE SOURCE of the sixteen full digests.

 5. Create 06_HANDOFFS\COUNCIL_RULING_TASK159.md from section 10.5 of this document —
    the twelve contracts with amendments, the twenty adjudicated items, the terminator
    attachment table, the eight ordinal re-expression rows. IT IS TASK 160'S
    SPECIFICATION and Task 160's Form B will cite it.

 6. Create 02_TASK_CHECKPOINTS\Rev062_Task155REG_Baseline\ holding
    BUILDER_RESULT_155-REG.md and the six extracts. SOURCE AND TEXT ONLY (P18).
    No .ex5. Never overwrite an existing BEFORE folder.

 7. Move 02_TASK_CHECKPOINTS\Rev060_Task160_PreJ_...\ from LIVE to
    COMPLETED / ACCEPTED AND READ BY COUNCIL, source-only.

 8. Execute section 20.3, 160-QUAR. Four recorded moves, never a delete.

 9. Update every MANIFEST.txt touched by Task 155 to carry the current source digests.
    Record the .ex5 figures under a heading that names them COMPILE-RUN EVIDENCE, NOT
    SOURCE PROVENANCE, and record the SRJ BUILD stamp beside the FlowLogic entry.

10. Do NOT create a Task 154 checkpoint. Do NOT create a Task 156 checkpoint. Both are
    parked, and a checkpoint folder for a task that will not run is a lineage claim for
    an edit that does not exist.

11. Rewrite CURRENT_STATE.txt to section 18.1 below. Delegate to Cline with a cheap
    available model — never a paid planning model.
```

### 18.1 `CURRENT_STATE.txt`

```text
Working revision: Rev062
Operating mode: alert-only

DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
  ROOT IS NESTED INSIDE DF\MQL5. Same-named copies of all sixteen canonical files exist
  beneath it: 4 .mq5 and 10 .mqh. P17: every source path is literal. Never a filename
  search, glob, -Recurse, wildcard or Navigator selection.

FULL DIGESTS, all sixteen files: read from BUILDER_RESULT_155-REG.md STAGE 7.
  Never from a handoff. Never truncated. Comparison is CASE-INSENSITIVE hex (R-57).

Last applied production task: Task 155 v4 PART 2 R7, ACCEPTED (R-53)
  20 of 20 operations, 139 lines inserted, FlowLogic line 8 modified
  Compile 0 errors 0 warnings. Three buffers registered, one populated.
Last measurement: 155-REG, ACCEPTED (R-55), BYTE-IDENTICAL
  11 of 11 gate rows, 49 diagnostic tags count-identical across generations,
  16 of 16 hashes EQUAL, signal line IDENTICAL, P8/P8a/P9 clean.

Current tree, abbreviated:
  SRJ_State.mqh          C6D56BC1..FD2E    516
  SRJ_OrderblockMgr.mqh  524D5D40..E60F   1139
  SRJ_ImbalanceMgr.mqh   64CF3275..02AE    546
  SRJ_BiasEngine.mqh     FC1E3871..092B    399
  SRJ_FlowLogic.mq5      1EA7858F..3B08   1242
  SRJ_FlowNexus_EA.mq5   0f1f44cb..52331322   CONFIRMED
  SRJ_Types.mqh          773d9944..808e78dc   CONFIRMED
  nine remaining .mqh    recorded at 155-REG STAGE 1 and 7, now comparison targets
  WHOLE-TREE STASIS IS ASSERTABLE ON ALL SIXTEEN FILES (R-60).

Compile artifacts — COMPILE-RUN EVIDENCE, NEVER PROVENANCE (R-58):
  SRJ_FlowLogic.ex5   226444  file 2026-09-05 17:39:34  SRJ BUILD 2026.09.05 17:39:20
  SRJ_FlowNexus_EA.ex5 115438 file 2026-08-30 10:31
  Banner "bytes loaded" is NOT file size (R-86). Run-to-run discrimination only.
  P8b: the SRJ BUILD line is the run-binary provenance instrument (R-85).

SUPERSEDED, do not quote as current:
  FlowLogic .mq5  d5525014..fb5664d5
  FlowLogic .ex5  08/28/2026 01:04 PM   (corroborated ACCURATE by R-84, but stale)
  EA .ex5         115062 / 08-29 04:50
VOID, never quote:  c307496079e3..dc3879511  and  08/29/2026 12:54 PM
VOID DELIVERABLE:   Task 160-PreH Block B, every attribution verdict. Defects 82/83/84.
  Inputs survive. 160-PreJ's replacement is ACCEPTED AND READ.
NON-CANONICAL:      four .ex5 under 02_TASK_CHECKPOINTS, compiled in place 2026-09-04,
  matching no canonical size. Quarantine ordered (R-78, P18, Rev62 section 20.3).

Two unrecorded compile events, both dated:
  2026-08-30 ~10:31-10:32  both canonical binaries rebuilt. FlowLogic's source digest
    held MATCH so its rebuild is inert; the EA's carried at least the SWEPTMASK and
    SESSIONHOLD prints (R-87).
  2026-09-04               four checkpoint binaries (R-78).
  Continuous EA source stasis 08-28 -> 08-30 is UNESTABLISHED. Tree state UNAFFECTED.

Authorization: NO LIVE AUTHORIZATION FOR ANY EXECUTION.
  155-A3 CONSUMED. 155REG-A1 CONSUMED. 160QUAR-A1 ISSUED, unconsumed, four file moves.
  Production edit / compile / chart attach / harness run: NOT AUTHORIZED.
  Delete: NEVER AUTHORIZED ANYWHERE.

Read-only IDE workflow:        VALIDATED END TO END
Production-edit IDE workflow:  VALIDATED END TO END
Harness-run link:              VALIDATED (155-REG, R-55)
Chart-attach link:             NOT VALIDATED, and MAY NEVER BE NEEDED (R-80)

Tier 1 baseline: Task 155REG. D:\Videos\Task 135 Full Logs.txt is RETIRED as a gate.
Run budget: ~1.7% per registered buffer. Tier 1 ~27 min, Tier 2 ~84 min, Tier 3 ~252 min.

Rulings: R-95   Defects: 181   Findings: EA-218 or higher
Council mints no new EA or defect number.

Census rule set of record:
  03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md
  764 lines, 27808 bytes, UTF-8 without BOM, 26 numbered entries.
  Amendment 8 is satisfied by MECHANICAL PREPEND (R-65), hash-verified, byte-preserving.
  CENSUS_RULES_VERBATIM.txt is DERIVED — never pasted, never a completeness check (R-63).
  Revision 61 section 9's index is NON-AUTHORITATIVE (R-64).

WORKFLOW (R-94): ALL execution and ALL mechanical file work goes to the IDE.
  The operator PASTES AND RELAYS. The operator never creates a file, assembles a
  packet, transcribes a command, or runs PowerShell personally.
  Council delivers paste-ready IDE instructions.
  Queued packet bodies live in REVISION_62 section 20 (R-95).

Current objective: THE MIGRATION.
  1  160-PreK   source-only, no authorization, ISSUABLE NOW. Rev62 section 20.1.
                Task 160's anchors under P12 / R-67. THE ONLY BLOCKER.
  2  Task 160   architecture shell, inert, Tier 1 byte-identical vs Task 155REG.
                Both gates met (R-61). Specification = COUNCIL_RULING_TASK159.md.
  2  155-RT-A   source-only, no authorization, issuable. Rev62 section 20.2.
                Item 4b decides open item 24 and whether 155-RT-B exists.
  3  Task 161   cascade adapter. MILESTONE 1.
  -  160-QUAR   four recorded moves, non-blocking. Rev62 section 20.3.

PARKED: Task 154, Task 156, buffers 35 and 36, open item 23. Nothing queued depends on
  them and their specification is settled. The Revision 60.1 blocker is WITHDRAWN.
UNBLOCKED SINCE REV 61: Task 160 (both gates), Task 162's zone-retirement row,
  Task 165 (document block lifted), Task 164's emitter design, Task 166's scope.
BLOCKED ON NOTHING: no document blocks any queued task.
STILL REQUIRING THE OPERATOR, neither blocking Task 160: R-Q11, R-Q12.

Task 162 carries a SINGLE-VALUE REGRESSION GATE: the zone retirement must reproduce
  SL 1.15870 on 2026.08.17 16:20:01. It is the only stop in the record (R-89).

Planner: Claude Default + Claude Sonnet 4.5. Plan mode is READ-ONLY, never use it to
  create a file.
Assembler: Cline Act + any cheap available model. R-65 prepend only.
Execution interface: Cline Act. Mechanical builder: GLM 5.3 Flash.
Fallback: DeepSeek V4 Flash. Complex approved coder: Opus 5, authorized Form B only.
Council: Opus 5, web only, reads no file. External reviewer: GPT 6 Astra.

Structural agreement: 0 of 12. Unchanged across TEN revisions.

Do not edit archived copies. Do not read ROOT as source (P14). No .ex5 under
  02_TASK_CHECKPOINTS (P18). Never Compile All (P10). Never open a non-allow-listed
  file in MetaEditor (P11). Never delete where a move will do (R-78).
```

---

## §19 Next single action

Nothing is pending with council. Nothing is pending with the operator beyond pasting. One builder run stands between this project and its first migration edit.

```text
BUILDER, needs nothing but assembly:
  160-PreK. Source-only, no authorization, 35 minutes. Section 20.1 carries its
  ASSEMBLY DIRECTIVE and its body. It re-establishes Task 160's anchors against the
  current tree under P12 / R-67, and STAGE 3 rules out the one thing that can silently
  break Tier 1 byte-identity — an identifier collision — BEFORE any byte is written.

COUNCIL, on that return:
  Task 160's Form B. First production edit of the migration. Its own authorization
  packet, citing COUNCIL_RULING_TASK159.md as its specification.

BUILDER, whenever, non-blocking:
  155-RT-A, section 20.2. Its item 4b decides open item 24 and very likely withdraws
  155-RT-B entirely.
  160-QUAR, section 20.3. Four recorded moves.

NO OPERATOR ANSWER IS REQUIRED BY THIS DOCUMENT.
R-Q11 and R-Q12 remain outstanding and will be asked when the task that needs them is
next. Neither blocks Task 160.
```

---

## §20 Queued packet bodies — verbatim, for mechanical assembly (R-95)

Each subsection carries an ASSEMBLY DIRECTIVE and then a body. The assembler produces the named task file; the builder receives that file and never this document.

### 20.1 `160-PreK`

```text
ASSEMBLY DIRECTIVE — 160-PreK
Performed by: Cline Act + any cheap available model. No census, no edit, no judgement.

 1. Read 03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md as BYTES.
    Record its SHA-256.
 2. Create 01_TASKS\PACKET_160-PreK.md = that file's bytes VERBATIM, followed by the
    BODY below verbatim. UTF-8, no BOM, byte-preserving. Never a read-decode-rewrite
    through a default-encoding Get-Content (R-66).
 3. Re-hash the source file. It MUST equal step 1. If not: STOP, report BLOCKED,
    delete nothing.
 4. Verify the assembled file:
      line count = 764 + the BODY's line count
      grep -SimpleMatch '16  multi-line call rule'          -> present
      grep -SimpleMatch '15  declaration brace exclusion'   -> present
 5. Report all four results plus the assembled file's path, byte size and integer line
    count. DO NOT EXECUTE THE PACKET.
```

**BODY — `160-PreK`**

```text
FORM:            D — source-only
AUTHORIZATION:   NONE REQUIRED AND NONE ISSUED
PRODUCTION EDIT: NOT AUTHORIZED. Zero bytes written to the canonical tree.
COMPILE:         NOT AUTHORIZED
CHART ATTACH:    NOT AUTHORIZED
HARNESS RUN:     NOT AUTHORIZED
ORDERS:          NONE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      35 minutes. On any BLOCKED condition, report-before-stop.
REPORT PATHS:    workspace-relative permitted; report the resolved absolute path once.

PATH CONSTANTS — the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local

P17, LOAD-BEARING FOR THIS PACKET:
No source file is located by filename search, glob, -Recurse, wildcard, or MetaEditor
Navigator selection. Every source path is the literal absolute path stated below.
ROOT is nested inside DF\MQL5, and 4 .mq5 plus 10 .mqh copies carrying the same
filenames as the canonical sixteen exist beneath 02_TASK_CHECKPOINTS and 07_ARCHIVE.
A filename-based lookup can silently hash or paste an archived generation and this
report would look conforming. Measured twice: four in-place checkpoint builds on
2026-09-04, and an unrecorded canonical compile on 2026-08-30.

PURPOSE
Task 160 declares twelve data contracts as an inert architecture shell and must compile
Tier 1 byte-identical. This packet establishes, against the current tree, WHERE those
declarations can land, WHAT they would collide with, and what the insertion surface
looks like. It writes nothing. Under R-67 an anchor ages out when its file's digest
changes and not otherwise, so SRJ_FlowNexus_EA.mq5 and SRJ_Types.mqh anchors from prior
Form Ds are current and are not re-censused here.

--- STAGE 1 — whole-tree stasis, sixteen files ---

Raw certutil output including the "CertUtil: ... completed successfully" echo.
TARGETS are read from 06_HANDOFFS\BUILDER_RESULT_155-REG.md STAGE 7 — never from a
handoff, never truncated. Comparison is CASE-INSENSITIVE HEX (R-57): certutil emits
lowercase, the record carries uppercase, and a case difference is NEVER a MISMATCH.

certutil -hashfile "DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256
certutil -hashfile "DF\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Alerts.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_BiasEngine.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Draw.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Fractals.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_HTFEngine.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Panels.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_SeedFormat.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Sessions.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_State.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Text.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_TickCore.mqh" SHA256
certutil -hashfile "DF\MQL5\Include\SRJ\SRJ_Types.mqh" SHA256

ALL SIXTEEN MATCH REQUIRED. There is no RECORDED-NO-TARGET row in this packet.
Any MISMATCH: STOP, report BLOCKED, read nothing further.

Additionally compare SRJ_Types.mqh's observed digest against
06_HANDOFFS\BUILDER_RESULT_155-R2.md section 8.3(a) and state MATCH or MISMATCH.
Expected 773d9944..808e78dc, case-insensitive. This is the cross-generation pair R-67
rests on.

Then both artifacts, RECORD ONLY, NEVER GATED (R-58):
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
Expected 226444 / 09/05/2026 05:39 PM and 115438 / 08/30/2026 10:31 AM.
Report the FILE LINES ONLY. The "bytes free" line is disk state and is discarded.
Neither .ex5 size nor timestamp is provenance; both are admissible here solely to show
nothing recompiled inside this packet.

--- STAGE 2 — SRJ_Types.mqh declaration surface ---

Full-line pastes, contiguous, no ellipsis, no retyped line. Enclosing construct by FULL
OPEN-BRACE STACK, never by proximity or indentation.

2a  Total line count of the file, and the last line pasted verbatim with its number.
2b  Every include-guard directive — #ifndef, #define, #endif — full lines with numbers.
    State whether the file is guarded and name the guard token.
2c  Every #include line, file order, with numbers. Count reported.
2d  Every file-scope struct declaration. Per amendment 1, do NOT enumerate type
    keywords — census the declaration form. For each: the declaration line verbatim
    with number, the matching } line with number, the brace-counted span. Count
    reported. Amendment 15: a } is NEVER a declaration.
2e  Every file-scope enum declaration, same treatment. Count reported.
2f  Every file-scope class declaration, same treatment, or ABSENT.
2g  Every file-scope #define, full lines with numbers. Count reported.
2h  The LAST FILE-SCOPE DECLARATION IN THE FILE — kind, identifier, closing } line
    number, and the line number of the first line after it. This is the append point.
    If anything follows it other than blank lines, comments and #endif, paste it.

--- STAGE 3 — collision census for the twelve contract identifiers ---

Across ALL SIXTEEN FILES, using the literal paths from STAGE 1. Case-sensitive,
whole-token per amendment 10. Each identifier is a SEPARATE pattern; never sum N_LINES
across patterns (amendment 5).

SObjectRef        SXobRecord         SFvgRecord         SStructuralBundle
SMarketSnapshot   SCandidate         SHypothesis        SStopReference
STargetReference  SPendingEntry      SDecision          SDiagnosticEvent

For each: per-file hit count, and every hit as a full-line paste with file and line
number. EXPECTED RESULT IS ZERO HITS IN ALL SIXTEEN FILES FOR ALL TWELVE. Any hit is a
collision Task 160 must resolve before it writes, and it is BLOCKED-FOR-COUNCIL — never
a name the builder changes.

Then the same census for five field and enum identifiers the contracts introduce, the
likeliest collisions:
objId             relevanceTime      legToken           bundleId
adverseLatches

--- STAGE 4 — the SState append surface, P5a ---

4a  SState's declaration line and matching } line, with numbers, containing file named.
4b  The LAST FIELD DECLARED IN SState — full line, number, and the closing } line number.
4c  SRJ_StateInit's definition line, matching } line, brace-counted span, containing file.
4d  The LAST ASSIGNMENT INSIDE SRJ_StateInit — full line and number.
4e  State whether every field pasted at 4b has a corresponding initialiser in
    SRJ_StateInit. ANSWER BY PASTE, NOT BY PROSE. If any field has no initialiser, name
    it. This is P5a's precondition and Task 160 must not append past an unmet one.

--- STAGE 5 — include graph ---

5a  Every #include in SRJ_FlowNexus_EA.mq5, file order, full lines with numbers. Count.
5b  Every #include in SRJ_FlowLogic.mq5, file order, full lines with numbers. Count.
5c  Every #include in SRJ_State.mqh, file order, full lines with numbers, or ABSENT.
5d  State MECHANICALLY whether SRJ_Types.mqh appears in each of 5a, 5b, 5c, and at
    which ordinal position. DO NOT INFER TRANSITIVE INCLUSION. If a file does not
    include it directly, answer NOT DIRECTLY INCLUDED.

--- STAGE 6 — the lifecycle enum, current state ---

6a  The enum containing ST_IDLE — declaration line, every member line verbatim in
    declaration order with numbers, closing } line. Containing file named. Member
    count reported.
6b  Whether any member carries an explicit = value. Full lines for any that do, or
    ABSENT. This decides whether the eight ordinal comparisons rest on declaration
    order or on assigned values.
6c  Every ST_S5_GATE_CHECK hit across all sixteen files, full lines with file and
    number. Count reported.

--- STAGE 7 — post-read stasis ---

Re-run STAGE 1's sixteen hashes and both dir /-c calls. All sixteen EQUAL, both
artifact FILE LINES UNCHANGED. A source-only census writes nothing and compiles
nothing. Any change means a file was opened in MetaEditor or a compile occurred, and
the census is void.

--- STAGE 8 — persist ---

06_HANDOFFS\BUILDER_RESULT_160-PreK.md
Report the resolved absolute path once. Then a post-write verification read: byte size
and integer line count.

--- REPORT FORMAT ---

TASK 160-PreK: COMPLETED | BLOCKED | PARTIAL
Authorization: NONE REQUIRED, NONE CONSUMED
Production files modified: NONE
Compile: NOT PERFORMED     Chart attach: NOT PERFORMED
Harness run: NOT PERFORMED Orders placed: NONE

P17 attestation: every source path used was the literal path stated in this packet;
  no filename search, glob, -Recurse, wildcard or Navigator selection was used.
Report channel: resolved absolute path of the workspace root

Commands that failed: <command as issued and raw error text, or "none">
Splits declared: <block, item, exact resume line, or "none">
Truncations: <one declaration, or "none">

STAGE 1  sixteen hashes, target from BUILDER_RESULT_155-REG.md STAGE 7 vs observed,
         MATCH | MISMATCH, case-insensitive
         SRJ_Types.mqh vs BUILDER_RESULT_155-R2.md 8.3(a): MATCH | MISMATCH
         two .ex5 dir /-c FILE LINES, before, RECORD
STAGE 2  2a-2h, full-line pastes with line numbers, counts
STAGE 3  twelve contract identifiers plus five field identifiers, per-file counts,
         every hit pasted
STAGE 4  4a-4e, full-line pastes with line numbers
STAGE 5  5a-5d, full-line pastes with line numbers, counts, ordinal positions
STAGE 6  6a-6c, full-line pastes with line numbers, counts
STAGE 7  sixteen hashes EQUAL | CHANGED; two .ex5 lines UNCHANGED | CHANGED
STAGE 8  resolved report path, byte size, integer line count

COLLISION VERDICT, one line, mechanical only:
  twelve contract identifiers: ZERO HITS | N HITS (list identifiers)

No diagnosis. No hypothesis. No statement about where a declaration should go — that is
council's. Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct
results. Never infer a missing fact. Never choose among ambiguous objects. Brace
counting, not indentation. No ellipsis in a source paste. No retyped source line.
BLOCKED-FOR-COUNCIL rather than a guess.
```

### 20.2 `155-RT-A`

```text
ASSEMBLY DIRECTIVE — 155-RT-A
Identical to 20.1's five steps. Output: 01_TASKS\PACKET_155-RT-A.md.
Verify: line count = 764 + the BODY's line count, plus the two greps.
```

**BODY — `155-RT-A`**

```text
FORM:            D — source-only
AUTHORIZATION:   NONE REQUIRED AND NONE ISSUED
PRODUCTION EDIT: NOT AUTHORIZED. Zero bytes written to the canonical tree.
COMPILE:         NOT AUTHORIZED
CHART ATTACH:    NOT AUTHORIZED
HARNESS RUN:     NOT AUTHORIZED
ORDERS:          NONE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      30 minutes. On any BLOCKED condition, report-before-stop.

PATH CONSTANTS and P17: identical to PACKET_160-PreK.md's header. Every source path is
the literal absolute path stated below. No filename search, glob, -Recurse, wildcard or
Navigator selection.

FILES READ:  DF\MQL5\Indicators\SRJ_FlowLogic.mq5
             DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
             plus, for STAGE 1 hashing only, the remaining fourteen.
             No other file is read. P11: read via shell, never open in MetaEditor.

PURPOSE, stated so a BLOCKED return is still a result
This packet establishes WHETHER BUFFER 34'S RUNTIME IDENTITY IS REACHABLE FROM THE
JOURNAL, and if not, whether it is reachable from a chart and by what mechanism. It
reads nothing at runtime. A finding that index 34 is a calculation buffer with no Data
Window presence is a SUCCESSFUL OUTCOME, not a failure. ITEM 4b IS THIS PACKET'S
DECISION POINT: if nothing reads index 34, open item 24 is PREMATURE rather than
unanswered.

--- STAGE 1 — whole-tree stasis, sixteen files ---

Identical to PACKET_160-PreK.md STAGE 1 in every respect: the same sixteen literal
certutil calls, targets read from 06_HANDOFFS\BUILDER_RESULT_155-REG.md STAGE 7,
case-insensitive hex, all sixteen MATCH required, both dir /-c calls RECORD-ONLY, any
MISMATCH is STOP and BLOCKED.

If BUILDER_RESULT_160-PreK.md exists and reports COMPLETED, targets may instead be read
from its STAGE 7. STATE WHICH REPORT WAS USED.

--- STAGE 2 — buffer registration surface in SRJ_FlowLogic.mq5 ---

Full-line pastes, contiguous, no ellipsis, no retyped line.

2a  Every "#property indicator_" line, full lines in file order. Count reported.
2b  The value of #property indicator_buffers AND the value of #property indicator_plots.
    If indicator_plots is ABSENT, say ABSENT — DO NOT INFER A DEFAULT.
2c  Every SetIndexBuffer( call. Full lines. Count reported. DO NOT SUMMARISE. For each:
    the index literal, the array identifier, and the third argument verbatim —
    INDICATOR_DATA, INDICATOR_CALCULATIONS, or absent.
2d  For indices 31, 32, 33, 34 specifically: the SetIndexBuffer line, the array's
    declaration line, and its ArraySetAsSeries line if present.
2e  Every PlotIndexSetDouble( and PlotIndexSetInteger( call. Full lines, multi-line
    argument lists closed by matching paren across lines. Count reported. Flag any
    carrying PLOT_EMPTY_VALUE.
2f  IndicatorSetString( calls, in particular any setting INDICATOR_SHORTNAME. Full
    lines, or ABSENT.
2g  #property indicator_separate_window or #property indicator_chart_window — which,
    or ABSENT.

--- STAGE 3 — buffer 34's write, initialisation and print surface ---

Using the array identifier established at 2d for index 34.

3a  Every line assigning to that array — <name>[ on the left of = . Full lines. For
    each, the enclosing function name by FULL OPEN-BRACE STACK, not proximity. Count.
3b  Every ArrayInitialize( call naming that array. Full lines, or ABSENT.
3c  Any per-bar or per-pass reset of that array — a write inside a bar loop not
    dependent on an object. Report as a classification WITH THE PASTE THAT COULD REFUTE
    IT (amendment 7).
3d  THE SENTINEL. State the value the array holds when no identity is exported, and
    cite the line that establishes it. If nothing establishes it, answer UNKNOWN — DO
    NOT CHOOSE AMONG CANDIDATES.
3e  The same as 3a for indices 31, 32 and 33: one write line each plus the enclosing
    function. If an index has no write, answer ABSENT.
3f  Every Print or PrintFormat call whose literal contains OBPROV. Full lines, argument
    list closed by matching paren across lines. Enclosing function by full open-brace
    stack. Count reported. For each: the expression passed as code, as id, and as flag,
    verbatim. ADDITIONALLY: state the complete set of literal values the code
    expression can take, BY PASTE. Codes 3 through 8 are observed at runtime; codes 1
    and 2 are not. Whether the enumeration is six wide, eight wide, or wider is this
    item's question, and it is answered by source or answered UNKNOWN.
3g  State MECHANICALLY whether the expression passed as id at 3f is the SAME EXPRESSION
    as the assignment to the buffer-34 array at 3a. ANSWER BY PASTE, NOT PROSE. If they
    are different expressions, paste both and say so. If undeterminable from these
    lines, answer UNKNOWN. DO NOT INFER EQUIVALENCE FROM SIMILAR NAMING.
3h  Every Print or PrintFormat call whose literal contains SLSIDEGUARD. Full lines.
    Report the expression passed as the close field verbatim, and its array index or
    shift argument if it has one. RECORD-ONLY. THIS ITEM DOES NOT GATE THIS PACKET AND
    NO VERDICT DEPENDS ON IT.

--- STAGE 4 — the consumer surface in SRJ_FlowNexus_EA.mq5 ---

4a  Every iCustom( call in the EA. Full lines, ARGUMENT LIST CLOSED BY MATCHING PAREN
    ACROSS LINES per the multi-line call rule. Count reported. If ABSENT, say ABSENT.
4b  Every CopyBuffer( call in the EA. Full lines. For each, the buffer index argument
    verbatim, and the enclosing function by full open-brace stack. Count reported.
    THEN STATE MECHANICALLY whether any CopyBuffer call names index 34, and if so paste
    it. IF NONE DOES, ANSWER "NO CONSUMER OF INDEX 34". THIS IS THE PACKET'S DECISION
    POINT AND IT MUST BE ANSWERED AS A SINGLE EXPLICIT LINE.
4c  FlowLogic's complete input declaration list. Full lines, file order, type, name and
    default value as written. Count reported.

--- STAGE 5 — object naming, for ground truth ---

5a  Every assignment to obLineName and to midLineName. Full lines, enclosing function
    by brace stack.
5b  State whether the constructed name contains the object's objId, and cite the paste
    that establishes it. If the construction uses a counter, a bar index, a time, or
    anything other than objId, say so and name what it uses. If undeterminable from
    these lines, answer UNKNOWN.

--- STAGE 6 — post-read stasis ---

Re-run STAGE 1's sixteen hashes and both dir /-c calls. All sixteen EQUAL, both
artifact file lines UNCHANGED.

--- STAGE 7 — persist ---

06_HANDOFFS\BUILDER_RESULT_155-RT-A.md
Resolved absolute path reported once, then a post-write verification read: byte size
and integer line count.

--- REPORT FORMAT ---

As PACKET_160-PreK.md's format, with this verdict block replacing the collision verdict:

MECHANISM VERDICT, three lines, mechanical only:
  index 34 is WITHIN indicator_plots | BEYOND indicator_plots | UNDETERMINED
  buffer 34's identity is LOG-READABLE via OBPROV | NOT LOG-READABLE | UNDETERMINED
  index 34 consumer: NO CONSUMER | CONSUMED at <function>, line <n>

No diagnosis. No statement about whether buffer 34 is correct — that is council's.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results.
BLOCKED-FOR-COUNCIL rather than a guess.
```

### 20.3 `160-QUAR`

```text
ASSEMBLY DIRECTIVE — 160-QUAR
This is an OPS packet and reads no source. The census rule set is NOT prepended.
Create 01_TASKS\PACKET_160-QUAR.md from the BODY below verbatim.
```

**BODY — `160-QUAR`**

```text
FORM:            OPS — recorded file moves. No source read, no census, no hash of tree.
AUTHORIZATION:   160QUAR-A1. Single use. SCOPE: MOVE FOUR NAMED .ex5 FILES. Nothing else.
PRODUCTION EDIT: NOT AUTHORIZED. No file under DF\MQL5\Experts, \Indicators or
                 \Include is read, written, moved or hashed by this packet.
COMPILE:         NOT AUTHORIZED
DELETE:          NOT AUTHORIZED. THIS IS A MOVE. NEVER A DELETE (R-78).
WALL CLOCK:      10 minutes.

ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local

PURPOSE
Four non-canonical binaries sit under the checkpoint store. They match no canonical
size, they were compiled in place as EA+FlowLogic pairs at two distinct times on
2026-09-04, and they are not copies. P18 forbids a binary in a checkpoint folder because
it is a lineage claim for a build nobody authorized.

SOURCES, literal, and these four only:
ROOT\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowLogic.ex5
ROOT\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowNexus_EA.ex5
ROOT\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT\SRJ_FlowLogic.ex5
ROOT\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT\SRJ_FlowNexus_EA.ex5

DESTINATION, created if absent:
ROOT\07_ARCHIVE\VoidBinaries\

PROCEDURE
 1. Record each source file's FullName, Length and LastWriteTime BEFORE the move.
 2. Move each with a LITERAL source and a LITERAL destination path. NO -Recurse, NO
    wildcard, NO glob (P17). Because the two pairs share filenames, PREFIX EACH
    DESTINATION FILENAME WITH ITS SOURCE CHECKPOINT FOLDER NAME so nothing overwrites
    anything.
 3. Re-list the destination folder after the moves.
 4. Confirm each of the four source paths NO LONGER EXISTS and each destination path
    DOES.
 5. Write ROOT\07_ARCHIVE\VoidBinaries\README.txt stating: these four binaries were
    compiled in place inside the checkpoint store on 2026-09-04; they match no
    canonical size; they are NON-CANONICAL; and per R-78 and P18 they may never be
    loaded, hashed as tree state, compared against a canonical digest, or cited as
    lineage.
 6. Persist to 06_HANDOFFS\BUILDER_RESULT_160-QUAR.md.

REPORT
TASK 160-QUAR: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: 160QUAR-A1
Canonical files touched: NONE
Deletes performed: ZERO
four sources: name, Length, LastWriteTime, before
four destinations: name, Length, LastWriteTime, after
four source paths: CONFIRMED ABSENT | STILL PRESENT
README.txt: written, byte size, integer line count
report path, byte size, integer line count

Any deviation, any name collision, any source that will not move: STOP, report BLOCKED,
DELETE NOTHING.
```

---

**END-OF-REVISION-62**