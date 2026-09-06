# SRJ Flow Nexus — Revision 63 Consolidated Handoff
## The Migration Has Its First Production Edit. One Measurement Stands Behind It.

**Supersedes** Revision 62, Revision 62 Amendment A, and the Amendment A Addendum in
full, for task control, sequencing, authorization state, canonical-tree state,
prohibitions, contracts, rulings and the open-item register.

**Retains Revision 62 on disk for exactly one purpose:** its §20.2 carries `155-RT-A`'s
packet body, which this document does not restate. Nothing else in Revision 62 is
current.

**Retains** Revision 60 as the architecture and evidence record — §§7, 9, 11, 13, 15, 16,
plus §6.12–6.15 and §10 which are both fully consumed into §10 of this document.

**Operating mode:** alert-only. No execution. No live trading.

**Production edits authorized by this document:** NONE. One harness run is authorized.

---

## §0 Document policy, layering, and what is unrecoverable

Revision 63 is the working record, the queue, and the operator's single relay artifact.
A fresh council instance reads this section first so it knows what it does not have.

| Layer | Document | Status in a fresh session |
|---|---|---|
| Task control, sequencing, authorization, canonical state, prohibitions, rulings, the queued packet body | **Revision 63** (this document) | authoritative |
| The twelve contracts as declared, both state member sets, the terminator table, the transition edges, the ordinal re-expressions | **§10 of this document** | binding, in session |
| The contract source text, 648 lines, as inserted | `06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md`, block digest `bcabf265…41153`, and `SRJ_FlowNexus_EA.mq5` lines 166–813 | binding, on disk, **CONSUMED as an extraction source** |
| Findings EA-147 → EA-179, the ownership table, milestones, scenarios, the must-not-conflate list | **Revision 60 §§7, 9, 11, 13, 15, 16** | binding, available as archive |
| Census rule set, 26 numbered entries | `03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md`, 764 lines, 27,808 bytes, UTF-8 no BOM, SHA-256 `f401d685…9447e8c` | binding, **prepended mechanically, never relayed** |
| Fifteen unchanged canonical digests | `BUILDER_RESULT_160-PreL.md` **STAGE 1 section only** | binding, read from there, never from a handoff |
| The current EA digest | `BUILDER_RESULT_160-R2.md` **STAGE 5d** | binding, and restated at §3.1 |
| Tier 1 baseline counts | **`D:\Videos\Task 155REG Full Logs.txt`**, 1,005,333 bytes, 6,577 lines | binding, on disk, **the count instrument of record (R-149)** |
| Tier 1 configuration, eleven gate rows, signal line, P8/P8a/P9 | `BUILDER_RESULT_155-REG.md`, located verbatim by 160-REG | binding, on disk, quoted at §3.5 |
| Findings EA-180 → EA-218, defects 87 → 181, rulings R-1 → R-41 | builder reports of the 60.1–60.7 arc, `99_NOTES\DefectLedger.txt`, 839 lines | **council does not hold the text.** See §15 |

### Permanently unrecoverable from disk, and none of it blocks anything

```
REVISION_56_CONSOLIDATED_HANDOFF.md            NOT ON THIS MACHINE. Sections 6, 7, 8, 10
  and 14 - EA-1 through EA-146, the log formats, and operator answers R-Q13/14/15 - are
  gone from disk. The operator produced 10.6 and 10.7 from another source; the rest was
  not recoverable.
REVISION_60 sections 6.1 through 6.11        DO NOT EXIST in Revision 60. Section 6 begins
  at 6.12. The original state list is accessible only through the later sections that
  cite it, which is sufficient because 6.14 superseded it.
REVISION_61_CONSOLIDATED_HANDOFF.md           NEVER EXISTED.
Part A Specification v4.2                     on the operator's disk, absent from session,
  and DEMOTED to the oldest layer. It is not senior to amendment A-3 or to any later
  operator ruling.
Document A-4                                  council does not hold it. Its section 5.32
  is cited twice in Rev 60 section 6 and both citations are quoted sufficiently in place.
```

**No document blocks any queued task.** Every specification Tasks 160 through 166 need is
either in session or on disk.

**No line number in this document is a P12 anchor.** §3.6's re-based EA locators are
admissible for locating a region in a later packet's census scope and for nothing else.

---

## §2 Roles, and the one consequence that shapes every packet

| Role | Responsibility | Constraint |
|---|---|---|
| Council / planner | Opus 5, web only. Authors packets, issues rulings, holds the queue | **Reads no file. Derives no figure it was not given. Mints no EA or defect number.** Delivers **paste-ready IDE instructions**, never manual work |
| Operator | **Pastes and relays. Creates a whole document by paste.** States discretionary trading meaning | **Never assembles a packet, never derives a figure, never transcribes a command, never runs PowerShell personally** |
| IDE agent, single | **Cline Act + GLM 5.3 Flash.** Assembly, census, hashing, targeted edits, in-place amendments, authorized compile, harness runs, extraction, persistence | Literal work only. BLOCKED-FOR-COUNCIL rather than a guess |
| Fallback | Cline Act + DeepSeek V4 Flash | Same scope |
| External reviewer | GPT 6 Astra | Objects, or returns NO OBJECTION |

**RETIRED:** Claude Sonnet 4.5 as workflow planner. Opus 5 via Cline Act as coder.

**THE CONSEQUENCE, and it is load-bearing: there is no capable coder in the IDE.** Every
Form B therefore carries **complete literal text** for every operation — exact insert
blocks, exact anchors, exact modified lines. Council supplies text, never intent. **No
Form B may require judgement.** If a packet cannot be written as literal operations it is
not ready to issue and it needs a predecessor Form D. Task 155 and Task 160 both ran this
way: 20 of 20 and 648 lines, both compile 0/0.

### The relay pattern

```
Council posts text in chat.
Operator pastes it to the IDE with a one-line instruction, or pastes a whole document
  into a new file.
IDE writes / assembles / verifies / executes / persists.
Operator relays the named result artifact back to council.
```

**Documentation split.** Whole-document transcription → the operator, because a human
paste cannot half-succeed. Any read-modify-write → the IDE, because a targeted edit is
where a human paste risks a transcription error and an agent is exact.

### Request labels, binding

```
OPERATOR ANSWER REQUIRED   discretionary strategy meaning, or intended trading
                           behaviour, only
DELEGATE TO IDE            every file read, hash, count, census, extract, command,
                           assembly, compile, run
```

The operator is never asked to decide a struct, a parameter, a transport lifetime, a
buffer registration or an implementation mechanic — and is never asked to *perform* one.

### The controlled experiment

Eleven packets and four free-read rounds under this arrangement. Conforming returns,
correct refusals to guess, self-reported and corrected slips, and several self-initiated
additions that closed items council had not thought to ask for. **Six pattern-shape slips
this arc were council's**: case sensitivity on `SL_REF`, substring on `ALERT`, whitespace
shape on input lines, the comment-blind `return` gate, the 5b anchor arithmetic, and
2d's mislocated tag inventory. **None was caught by the pattern itself; all were caught
by the builder.**

---

## §3 Canonical tree — current state

### 3.1 The sixteen files

```
SRJ_FlowNexus_EA.mq5
  93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced
  191970 bytes, 3850 lines, UTF-8 WITH BOM, 3850 CRLF, 0 lone LF, 0 lone CR
  EDITED BY TASK 160. This is the current canonical digest and the only one restated
  in full in this handoff.
```

The **other fifteen are UNCHANGED** and are read from `BUILDER_RESULT_160-PreL.md`
**STAGE 1 section only** — scope the parse to that section, because a pattern applied to
the whole file over-matches. Comparison is **case-insensitive hex**: `certutil` emits
lowercase, some records carry uppercase, and a case difference is **never** a MISMATCH.

Line counts, all sixteen, whole tree 11,439 + 648 = **12,087**:

```
EA 3850   FlowLogic 1242   TickCore 984   SeedFormat 694   Sessions 582   HTFEngine 579
ImbalanceMgr 546   State 516   Panels 439   BiasEngine 399   Types 355   Draw 333
OrderblockMgr 1139   Fractals 205   Text 174   Alerts 50
```

### 3.2 Path constants

```
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
```

**`ROOT` is nested inside `DF\MQL5\`.** Every relative path in every paste resolves under
`ROOT`, never under `DF\MQL5\`. 4 `.mq5` and 10 `.mqh` copies carrying canonical filenames
exist beneath it. **P17 governs: every source path in every packet is a literal absolute
path.**

### 3.3 Compile artifacts — compile-run evidence only, never provenance

```
SRJ_FlowNexus_EA.ex5   118130   file 2026-09-06 18:42   compiled by Task 160
SRJ_FlowLogic.ex5      226444   file 2026-09-05 17:39:34   UNCHANGED
  SRJ BUILD 2026.09.05 17:39:20

THE EA BINARY GREW 2692 BYTES ON A TYPES-ONLY INSERTION. That is the TYPE TABLE, not
  code. The inserted block was proven to contain ZERO PARENTHESES and zero occurrences of
  seventeen code tokens in its comment-stripped text. METADATA IS NOT CODE.
.ex5 SIZE AND TIMESTAMP ARE BOTH DEMOTED. Admissible for exactly one purpose: showing
  nothing recompiled between authorization and run inside a single packet.
BANNER "bytes loaded" IS NOT FILE SIZE. Run-to-run discrimination only.
P8b, THE SRJ BUILD LINE, is the run-binary provenance instrument. It is compile-embedded
  and in-journal. THE BASELINE REPORT CARRIES NONE - measured, zero hits - so P8b enters
  the record for the first time with the next run and its DIFFERENCE from any prior value
  is expected, because Task 160 recompiled the EA.
THE EXPERIMENT IS SINGLE-VARIABLE: FlowLogic.ex5 is the same indicator binary the
  baseline ran against. Exactly one binary moved.
```

### 3.4 Superseded and void — never quote as current

| Value | Disposition |
|---|---|
| EA `.mq5` `0f1f44cb…52331322`, 162,293 bytes, 3,202 lines | **SUPERSEDED by Task 160.** Remains the digest of the **REVERT PATH** and is correct for that purpose only |
| EA `.ex5` `115438` / `08-30 10:31` | **SUPERSEDED by Task 160's compile** |
| FlowLogic `.mq5` `d5525014…fb5664d5` | **SUPERSEDED.** Correct when recorded, held MATCH 21 rounds |
| FlowLogic `.ex5` `08/28/2026 01:04 PM` | **SUPERSEDED but CORROBORATED ACCURATE** to the minute |
| EA `.ex5` `115062` / `08-29 04:50` | **SUPERSEDED BY MEASUREMENT** |
| `c307496079e3…dc3879511`, `08/29/2026 12:54 PM` | **VOID. Never quote.** In `07_ARCHIVE\VoidHashRecords\` |
| Task 160-PreH Block B, every attribution verdict | **VOID DELIVERABLE.** Defects 82, 83, 84. Inputs survive. 160-PreJ's replacement is ACCEPTED AND READ |
| Four `.ex5` formerly under `02_TASK_CHECKPOINTS` | **NON-CANONICAL. QUARANTINED** to `07_ARCHIVE\VoidBinaries\` by 160-QUAR, never deleted |

### 3.5 The Tier 1 baseline, as located on disk

```
CONFIGURATION, verbatim from BUILDER_RESULT_155-REG.md:
  "harness as set, eleven items: EURUSD | M5 | 2026.08.14 - 2026.08.22 | every tick
   based on real ticks | 10000 JPY | 1:100 | SRJ_FlowNexus_EA | InpDebugLog=true |
   InpMode=0 MODE_ALERT_ONLY | optimisation OFF | visual mode OFF. No source file opened
   in MetaEditor; no Compile All, at any point."
  Two input values stated. No 'headers' count is stated anywhere in that report.

RAW LOG:  D:\Videos\Task 155REG Full Logs.txt | 1005333 bytes | 6577 lines | NOT relayed
  THIS FILE IS THE COUNT INSTRUMENT OF RECORD (R-149).

ELEVEN GATE ROWS, as recorded, all PASS:
  Signals 1/1            Aborts 22/22           Candidates seeded 23/23
  Armings 12/12          S3 evaluation bars 54/54
  FRESHSKIP 141/141      FRESHCOUNT 22/22       SUPPRESSED 43/43
  TPCENSUS 174/174       ZONEPICK=INPLAYCOMMIT=XOBPROMO 54=54=54
  ZONECENSUS_FVG 0/0

SIGNAL LINE, verbatim from [SRJ-EA] onward:
  [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870
  TP 1.16141 spr=2

PROVENANCE:  P8 present, verbatim.  P8a = 372 (real ticks; 607 voids a run).
             P9 = bars=1728.        P8b ABSENT from the baseline report.

NOT IN THAT REPORT, and council mislocated it: A DIAGNOSTIC TAG INVENTORY. Zero hits on
  'BUCKET', 'inventor', 'Tags', 'tags'. Exactly four '[SRJ-EA]' hits, none count-led.
  The inventory R-75 cited lives in the SIX EXTRACTS. It is no longer needed: tag tables
  are now DERIVED FROM RAW LOGS by one symmetric command (R-149).
```

### 3.6 The EA's re-based locators — admissible for location only

Task 160's edit was a pure single-point insertion whose byte-exactness was proven twice:
STAGE 5a's intended-versus-disk digest equality, and an independent splice of the block
into the checkpoint copy that reproduced the live digest byte-for-byte. The mapping is
therefore arithmetic, not inferred.

```
old line N, N <= 165   ->  new line N, UNCHANGED
the inserted block     ->  new lines 166 through 813
old line N, N >= 166   ->  new line N + 648
```

**ADMISSIBLE for locating a region in a later packet's census scope. NOT ADMISSIBLE as a
P12 anchor.** Every byte a later packet *writes* is still located by census in that packet
and verified by paste at its own STAGE 2. **P12 is unweakened.**

```
RE-BASED, +648:
  nine g_state writes   1740 1781 2883 2896 2908 3386 3525 3614 3700
  g_state declaration   815          ST_S5_GATE_CHECK set 3525, test 3531
  wouldHold expression  2388         ABORT_NO_TP_TARGET 3542
  ABORT_TP_RR_FAIL      3565         divergence check 3569
  MarkSessionUsed       3612, 3698   PoiRetestResult 1166
  ZoneAdoptable def     1859, region 1860-1909, call site 3434
  ZoneInPlay def        1986

UNCHANGED, above the insertion:
  ENUM_SRJ_MODE 19   ENUM_SRJ_STATE 137-139   ENUM_SRJ_DIR 141   ENUM_SRJ_REGIME 142
  ENUM_SRJ_SESSION 143   ENUM_SRJ_SLMODE 144   abort defines through 164
  LINE 159, still a double-encoded em-dash in comment text, FILED NOT REPAIRED, and
    STILL NOT AN ANCHOR.
```

### 3.7 The revert path, frozen

```
02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\SRJ_FlowNexus_EA.mq5
  digest 0f1f44cb..52331322, VERIFIED EQUAL to the pre-edit file.
  SOURCE ONLY. No .ex5 exists beside it (P18).
  IT MAY NOT BE MOVED, EDITED OR DELETED. It is what makes a 160-CAL revert provably
  exact rather than a judgement call.

06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md - 685 lines, block digest
  bcabf265..41153 - is CONSUMED as an extraction source. That digest is now a historical
  fact and editing the file invalidates it as a source for any re-run. Nothing reads it.
```

---

## §4 Authorization state

```
160REG-A2   ISSUED by this document, unconsumed.
            SCOPE, EXHAUSTIVE: one Tier 1 harness run, one raw log written to disk.

CONSUMED:   155-A3, 155REG-A1, 160QUAR-A1, 160-A1, 160REG-A1.
            160REG-A1 was consumed WITHOUT A RUN - the packet stopped at STAGE 2. A token
            consumes on invocation, so it is re-issued as A2 rather than re-used.
160CAL-A1   DOES NOT EXIST.

Production edit:  NOT AUTHORIZED
Compile:          NOT AUTHORIZED. The EA binary compiled by Task 160 IS THE BINARY UNDER
                  TEST and MAY NOT BE REBUILT. A recompile voids 160-REG-R2.
Chart attach:     NOT AUTHORIZED
Delete:           NEVER AUTHORIZED ANYWHERE. Quarantine is a move.
```

Every item in §12 requires its own authorization, issued as a separate packet naming its
own bounded scope. **A source-only Form D requires no authorization and none is issued
for one.**

---

## §5 Task state

Tasks 91–152 unchanged. Changes and current entries only.

| Task | Form | Status | Note |
|---|---|---|---|
| 153, 128, 132, 157 | — | DISSOLVED | 157 → 163; 128's EA-112 → lifecycle state; 132 was the umbrella |
| 158 + Corrections A/B/C | D | COMPLETED | Architecture recovery census |
| 159 | S | **RULED AND CLOSED** | Twelve contracts approved with amendments; twenty items adjudicated. §10 is the ruling |
| 160-PreD…PreJ | D | COMPLETED | PreH's attribution verdicts VOID; PreJ's replacement ACCEPTED AND READ |
| 160-PreK | D | **ACCEPTED** | Collision surface, `SState` surface, enum census. 136 identifiers ZERO HITS |
| 160-PreL | D | **ACCEPTED** | Include graph, whole-tree type surface, insertion anchors |
| **160** | **B** | **COMPLETED, ACCEPTED, CLOSED** | **648 lines inserted, ZERO existing lines modified, compile 0/0. THE MIGRATION'S FIRST PRODUCTION EDIT** |
| **160-REG** | OBS | **BLOCKED at STAGE 2, superseded** | Council's 2d defect. Stages 1, 2a-2c, 2e, 2f banked |
| **160-REG-R2** | **OBS** | **QUEUED, ISSUABLE NOW.** §20.1 | Tier 1 regression, token 160REG-A2, symmetric tag tables from raw logs |
| 160-CAL | OBS | **DEFERRED, CONDITIONAL** | Issued only if 160-REG-R2 diverges. Not authorized. Not drafted |
| 160-QUAR | OPS | COMPLETED | Four recorded moves, zero deletes |
| 154, 156 | B | PARKED | Buffers 36 and 35 registered, unpopulated. Specification settled. Nothing queued depends on them |
| 155 PART 1 R1, 155-R2 | D/B | COMPLETED AND ACCEPTED | |
| 155-REG | OBS | COMPLETED AND ACCEPTED, BYTE-IDENTICAL | The Tier 1 baseline |
| **155-RT-A** | **D** | **QUEUED. Body at REVISION_62 §20.2** | Buffer-34 read-mechanism census. Item 3g is HALF-ANSWERED FROM SOURCE. Deadline before Task 163 |
| 155-RT-B | OBS | SUSPENDED | Existence decided by 155-RT-A item 4b |
| **161** | **B** | **QUEUED, NEXT AFTER 160-REG-R2** | Legacy cascade adapter, whole extraction, per-field load/store log. **MILESTONE 1.** Adapter surface: nine re-based `g_state` writes plus 65 reading lines, 73 occurrences. **First task that APPENDS an enum member** |
| 162 | B | QUEUED | Candidate-owned binding at capacity 1, both sites, siblings logged. **MILESTONES 2, 3, 4.** Carries the `SL 1.15870` gate and four predecessor Form D items |
| 163 | B | QUEUED | Provenance completion, `GONE` resolution, invalidation event record. Absorbs export stage 4. Carries `OBPROV`'s windowed partition at bar ≥ 120745 |
| 164 | B | QUEUED | Phase A / Phase B, arbitration, EA-144 as commit test, concurrency enabled. **MILESTONES 5, 6.** Census scope is EA-only |
| 165 | B | QUEUED | Pending-entry lifecycle, T3, EA-142/EA-145 repair. **Must NOT implement post-fill target revision** |
| 166 | B | QUEUED | Position and exit engine, post-fill target revision. Two-swing zone-guard repair WITHDRAWN from scope |
| 141, 142 | B | PAUSED | Re-enter after 162. R-Q11 and R-Q12 both now ANSWERED |
| 129, 130 | B | PAUSED | Re-enter after 163 |
| 131 | B | PAUSED, PROMOTED | Union-extreme export. Corrects the branch the record's only signal took. Rides 165 |

**Every prior Form D in the record is ACCEPTED.**

---

## §6 Rulings and the minting rule

### 6.1 Counters

```
Rulings:  R-152
Defects:  181
Findings: EA-218 or higher

Council holds the text of:  R-42 through R-152 in substance
                            defects 45 through 86
                            EA-147 through EA-179
Council does NOT hold:      R-1 through R-41
                            defects 87 through 181
                            EA-180 through EA-218
```

### 6.2 Council may not mint a number

Council does not hold the high-water mark of either series. **Council assigns no new EA
number and no new defect number.** A finding council originates is written with its
subject and its consequence, and the scribe assigns the number at archive time against
the ledger on disk.

### 6.3 R-96 through R-152, compact — the rulings that govern current work

```
R-96   SINGLE IDE AGENT: Cline Act + GLM 5.3 Flash. Sonnet 4.5 and Opus-via-Cline
       RETIRED. CONSEQUENCE: no capable coder in the IDE, so EVERY Form B carries
       COMPLETE LITERAL TEXT and NO FORM B MAY REQUIRE JUDGEMENT.
R-97   Whole-document transcription -> OPERATOR. Any read-modify-write -> IDE. Use the
       instrument whose failure mode is VISIBLE.
R-98   R-65's GREP HALF IS SCOPED TO LINES 1-764 and is corroborative only. The gate is
       ARITHMETIC: hash equality plus exact line and byte sums. A GATE MAY NOT MATCH ITS
       OWN INSTRUCTION TEXT.
R-99   160-PreK ACCEPTED. Twelve contract identifiers ZERO HITS. P5a's precondition
       VERIFIED. Lineage of a pre-R-94 assembly RULED ADMISSIBLE because the R-65
       verification is instrument-independent.
R-100  R-Q12 ANSWERED. EA 655's session-live target exclusion RULED CORRECT AS INTENT.
       Item 16's residual is the POI anchor-tier filter alone. SCENARIO G IS SCORABLE.
       ADMISSION-TARGET ADMISSIBILITY: a session extreme is admissible at admission when
       it is CLOSED, UNSWEPT and NOT CLOSED OVER. Three exclusions, all attributed.
R-101  DOCUMENT PRECEDENCE: where a later specification conflicts with an earlier one,
       THE LATER GOVERNS and the conflict is recorded. Part A v4.2 is the OLDEST layer
       and is NOT senior to A-3 or to a later operator ruling.
R-102  TASK 166'S POST-FILL TARGET REVISION IS SPECIFIED STRUCTURALLY. Trigger: the
       session in progress at fill HAS CLOSED - a state transition, not a clock time.
       Level: that session's direction-matched extreme. Scope: POST-FILL ONLY. It is a
       SEPARATE RECORD with its OWN cause enumeration; the admission target's five-member
       cause set is unchanged. Transport already exists: SRJ_State.mqh's eight prev*
       fields and four wasIn* booleans, read THROUGH the phase-separated snapshot and
       never directly.
R-103  TASK 160 DECLARES TYPES ONLY, IN THE EA. Superseded on the anchor by R-115.
R-105  R-Q11 ANSWERED (A1). The witness must be on a candle STRICTLY AFTER the promotion
       candle, on BOTH paths. touchBar > bundle.xob.promotionBar, strict. Removes 7
       same-bar commits at Tier 2, one of which is the 08/03 false positive.
R-106  SCENARIO H'S ONLY TIER 2 FIXTURE IS ANOTHER OF THE SEVEN and must be captured as a
       PRE-RULE MEASUREMENT before the rule lands. Filed to Task 162's predecessor Form D.
       A1 is the first ruled rule that REMOVES a signal, so the Tier 2 denominator changes
       when it lands.
R-107  R-Q12's original text CORROBORATES R-100/101/102 without amendment. The five
       28-July shorts are CORRECT REJECTIONS. 5 August 11:20 is a CORRECT ADMISSION.
       17 August's seven bars choosing London's closed high over New York's forming high
       is the build agreeing with the operator's own discretionary choice seven times -
       the strongest single agreement measurement in the record.
R-108  BUILDER REPORTS ARE DELTA AND EXCEPTION ONLY. Agreements are one line or one row;
       disagreements are full, with raw output. The evidentiary standard is unchanged -
       every figure is still derived by command. HANDOFFS ARE UNAFFECTED.
R-109  A RELAY PASTE IS ISSUED COMPLETE OR NOT AT ALL. No placeholders, no
       cross-references into the surrounding message. A paste may instruct the IDE to
       read a body from a named file on disk; that is not a placeholder.
R-111  SRJ_Types.mqh AND SRJ_State.mqh ARE UNREACHABLE FROM THE EA, mechanically
       established: the EA includes only SRJ_TickCore.mqh and Trade\Trade.mqh, and
       TickCore includes nothing. The EA cannot see SRJ_NA_INT, SRJ_NA_DBL, SRJ_NA_STR
       or SRJ_NextObjId.
R-112  ABSENCE IS REPRESENTED STRUCTURALLY IN EVERY CONTRACT, NEVER BY A SENTINEL VALUE.
       A tri-state enum, a has-* boolean, an explicit resolution. Duplicating a sentinel
       into the EA would reproduce EA-173 on the value every UNKNOWN rests on.
R-113  candidateId, hypothesisId, bundleId and pendingId are minted by EA-LOCAL counters.
       SObjectRef.objId is NEVER minted - it is a copy arriving over buffers 31, 32, 33.
R-114  FIVE CONTRACT FIELD TYPES ARE EXISTING EA ENUMS AND ARE NOT RE-DECLARED:
       ENUM_SRJ_DIR, ENUM_SRJ_REGIME, ENUM_SRJ_SESSION, ENUM_SRJ_SLMODE, ENUM_SRJ_STATE.
       ENUM_SRJ_SESSION is item 12's FIRST VOCABULARY, named at last.
R-115  TASK 160'S ANCHOR: after EA line 165, before line 166. Applied and closed.
R-116  THE EA IS UTF-8 WITH BOM; the other fifteen are without. EVERY EA EDIT PRESERVES
       THE BOM, is byte-preserving outside the inserted region, and EVERY LINE COUNCIL
       WRITES INTO A CANONICAL FILE IS PURE ASCII. EA line 159 and SRJ_State.mqh line 188
       carry double-encoded em-dashes; both are comment text, FILED NOT REPAIRED, and
       NEITHER IS AN ANCHOR.
R-117  REPOSITORY CORRECTIONS. Revision 61 never existed. No PreJ checkpoint folder
       exists. Rev 60.4 is 1683 lines and THE FILE IS THE AUTHORITY. Revision 56 is not
       on this machine. Packets go to 01_TASKS.
R-119  REVISION 60 SECTION 6 IS SUBSECTIONS 6.12 THROUGH 6.15 ONLY.
R-120  THE TWO STATE MEMBER SETS, superseded in extent by R-128 and complete there.
R-121  ST_SIGNAL IS ASSIGNED TWICE AND COMPARED NEVER. CANDIDATE_COMMITTED is a TERMINAL
       RECORD, NOT A GATE. Milestone 5 gains a free result: nothing in the EA gates on the
       signal state.
R-122  AN ENUM MEMBER SET MAY BE APPENDED TO. AN ENUM MEMBER MAY NEVER BE RENAMED. Every
       incomplete set is marked incomplete IN SOURCE, naming what is unestablished.
       NO ORDINAL COMPARISON MAY BE BUILT ON ANY CONTRACT ENUM, which is what makes
       appending free. An omitted member costs an append; an invented member costs a
       rename across Tasks 160, 161, 162 and 164.
       COLLISION SET: struct names, enum type names, EVERY ENUM MEMBER NAME, and #define
       names. Enum members are GLOBALLY SCOPED in MQL5. STRUCT MEMBER NAMES ARE SCOPED
       AND ARE NOT CENSUSED.
R-123  TASK 160 TOUCHES NO COMPARISON AND NO EXISTING LINE. The eight ordinal comparison
       sites are re-expressed in TASK 162 OR 164, never in Task 160.
R-124  A RUN PACKET TAKES ITS HARNESS CONFIGURATION FROM THE BASELINE REPORT ON DISK,
       never from a handoff and never from council.
R-125  THREE ENGINEERING CAPACITIES, EACH WITH A COUNT AND AN OVERFLOW FLAG:
       SRJ_MAX_OPP_FVG_REFS 8, SRJ_MAX_HYP_PER_CANDIDATE 8, SRJ_MAX_EVENT_OBJREFS 4.
       Bounded-memory safety limits in the 500-slot walk bound's precedent. None is a
       strategy threshold. REACHING A LIMIT IS A RECORDED FACT, never a silent
       truncation. NO REGISTRY CAPACITY IS DECLARED - capacity 1 and P14's isolation gate
       arrive with Task 161.
R-126  SIX DERIVED FIELDS ARE DELIBERATELY NOT DECLARED: anatomyQualified,
       touchAdmissible, admissionR, executionWindowAdmissible, noChaseBound, adverseCount.
       A derived value that cannot be stored cannot go stale.
R-128  BOTH STATE MEMBER SETS ARE COMPLETE. Eight candidate states from C1-C9 (C5 is a
       self-edge and mints no state); twelve hypothesis states from H1-H12. H12 writes
       cancellationReason ON THE HYPOTHESIS, which Rev 60 section 9.8 does not list.
R-129  THE OFFERING-OBSERVATION STATE IS A GAP BETWEEN DELIVERABLE 2 AND DELIVERABLE 3.
       Section 6.13 rules ST_S3_ZONE_WAIT a candidate state; section 10.2 gives it no edge
       and names no member. IT IS APPENDED AT VALUE 9 BY TASK 161. Council does not invent
       the name.
R-131  160-CAL IS DEFERRED AND CONDITIONAL ON 160-REG DIVERGING. The discriminating
       experiment remains available and is PROVABLY CLEAN because the revert reproduces a
       known digest.
R-132  A "SECTION 10.5" CITATION MUST NAME ITS DOCUMENT. Rev 60 10.5 is the BLOCKED
       four-step procedure; Rev 62 10.5 is the RULING that executed it. The second
       supersedes the first.
R-133  FOUR CORROBORATIONS FROM SECTION 10: the execution window resolves to PHASE B and
       H8 is UNGUARDED by it, because a guard would make structural completion depend on
       execution admissibility and destroy Scenario H; P8 is the two-owner boundary and
       TASK 165 MUST NOT IMPLEMENT REVISION; C9 is the only candidate edge Phase B may
       drive and a Phase A write to CANDIDATE_COMMITTED IS A MILESTONE 5 FAILURE; B4
       precedes B5 so a window-inadmissible winner declines WITHOUT marking a session, and
       MarkSessionUsed appears EXACTLY ONCE.
       AND: only H2 and H5 are reversible, both writing state and nothing else. RETENTION
       IS NOT REVERSAL. ANY IMPLEMENTATION THAT REVERTS A FIELD TO REPRESENT WAITING IS
       REINTRODUCING THE SINGLETON'S MUTABILITY UNDER A NEW NAME.
R-134  A WICK-ONLY REVISIT ON A LATER CANDLE IS A VALID RETRACE. touchBarHigh and
       touchBarLow make it auditable. FILED, EXPLICITLY UNRECONCILED: the operator's
       anatomy precondition - valid, activated, fractal-confirmed before promotion - is
       NOT asserted as build behaviour. Whether the three promotion sites enforce it is a
       census, filed to Task 162's predecessor Form D.
R-135  A TOKEN CENSUS MUST DISCARD COMMENT CONTENT BEFORE COUNTING. THE ZERO-PARENTHESIS
       TEST IS THE DURABLE CODE-EMISSION PROOF: no function declaration, no call and no
       control-flow condition can exist without a parenthesis. A comment is never
       reworded to satisfy a gate.
R-137  AN EXTRACTED BLOCK IS DIGEST-VERIFIED, not merely delimiter-bounded. It caught a
       real offset error on its first outing.
R-140  TASK 160-R2 ACCEPTED. 136 of 136 ZERO HITS. Block IDENTICAL on all three figures.
       ZERO PARENTHESES and seventeen ZERO tokens. Both delta equations balanced exactly.
       Intended-versus-disk digest EQUAL, cross-verified by splice. Compile 0/0.
       FlowLogic.ex5 UNCHANGED. Fifteen non-EA files EQUAL. 160-A1 CONSUMED.
R-141  A VERIFICATION STEP'S ARITHMETIC IS DERIVED FROM THE INSERTION POINT, NEVER STATED
       INDEPENDENTLY OF IT.
R-142  THE .ex5 GREW 2692 BYTES ON A TYPES-ONLY INSERTION. That is the TYPE TABLE.
       METADATA IS NOT CODE. Recorded, not gated.
R-143  THE EA'S ANCHORS ARE RE-BASED BY A KNOWN DELTA, ADMISSIBLE FOR LOCATION ONLY.
R-145  THE FOUR SELF-REPORTED FAILURES ARE THE GUARDRAILS WORKING. One P17 near-miss is
       RECORDED, NOT A DEFECT IN THE RESULT: the glob and the literal paths agreed, and
       the agreement is checkable because both were reported.
R-146  THE METAMQL COMPILER RETURNS A NON-ZERO EXIT CODE ON A CLEAN BUILD. Expected. P7's
       gate is the ERROR COUNT and nothing else.
R-147  THE CONTRACTS FILE AND THE CHECKPOINT ARE BOTH FROZEN.
R-148  160-REG's BLOCKED RETURN ACCEPTED. Council's 2d defect. Stages 1, 2a-2c, 2e, 2f
       BANKED.
R-149  TAG TABLES ARE DERIVED FROM RAW LOGS BY ONE COMMAND APPLIED IDENTICALLY TO BOTH
       GENERATIONS. D:\Videos\Task 155REG Full Logs.txt is the COUNT INSTRUMENT OF RECORD.
       Council does not need to know the tag vocabulary: the packet defines a mechanical
       tag key, builds a frequency table over each log, and reports only differing rows.
       AN EMPTY DIFFERENCE SET IS THE GATE. Tag names are output, not input.
R-150  160REG-A2 ISSUED. A token consumes on invocation, not on use.
R-151  A REGRESSION PACKET STOPS ONLY ON A PROVENANCE OR STASIS FAILURE. Blocking stops,
       exhaustive: a STAGE 1 digest MISMATCH, P8a = 607, P8 absent, a configuration
       difference, a source digest change across the run. EVERYTHING ELSE DEGRADES AND
       REPORTS NOT DERIVABLE. A twenty-seven-minute run is not forfeited for a figure
       council mislocated.
R-152  REVISION 63 IS THE WORKING RECORD. Revision 62 is retained for its section 20.2
       alone.
```

---

## §7 Prohibitions P1 through P18

P1 through P11 carry forward exactly: P3a buffers append only; P5 class fields append
only; P5a `SState` fields append only with the initialiser beside them in `SRJ_StateInit`
— **precondition VERIFIED, 153 assignments, last field `tickOBSetterBar` initialised**;
P6 canonical tree only; P7 compile gate is the **error count**, never the exit code;
P8/P8a real ticks and the fingerprint; **P8b the `SRJ BUILD` line**; P9 liveness probe;
P10 never Compile All; P11 never open a non-allow-listed file, read source via shell.

| # | Rule |
|---|---|
| **P12** | No production edit from an architecture document. Every edit requires a predecessor Form D that pasted the exact region, brace-counted, from the canonical tree. A field name, state name or line number in a handoff is not an anchor. **An anchor ages out when its file's digest changes, and not otherwise.** The citation is the digest pair, never the calendar. §3.6's re-based locators are for **location**, not anchoring |
| **P13** | No existing structure renamed to imply an architecture it does not have. A named abstraction that does not own its data is worse than the singleton, because it hides the singleton |
| **P14** | No candidate concurrency until isolation is proven by a per-field load/store log. Capacity stays 1 until Milestone 1 passes. Also governs the local repository: a checkpoint store, **never a source and never an edit target** |
| **P15** | Unknown provenance is `UNKNOWN`. Parentage, structural-leg membership and bundle association are never inferred from price proximity, bound similarity or bar adjacency |
| **P16** | No contract, candidate or hypothesis field may hold a pointer or an array index into `g_orderblocks` or `g_imbalances`. Structural objects are deleted intrabar before the identity export, with no snapshot rollback. Every reference goes through `SObjectRef` — an `objId` plus a resolution outcome re-read by identity every bar |
| **P17** | **No source file is located by filename search, glob, `-Recurse`, wildcard, or MetaEditor Navigator selection. Every source path in every packet is a literal absolute path.** Measured three times: four in-place checkpoint builds, an unrecorded canonical compile, and a STAGE 0 glob whose result happened to agree |
| **P18** | **A checkpoint folder holds source and text only.** No `.ex5` is created, retained or read under `02_TASK_CHECKPOINTS`. Existing ones were quarantined by move to `07_ARCHIVE\VoidBinaries\`, never deleted, and may never be loaded, hashed as tree state, compared against a canonical digest, or cited as lineage |

**The no-dimensional-thresholds rule carries forward.** An operator ruling containing a
number is restated structurally before it enters the specification. A registry capacity is
an engineering safety limit and must be justified as one.

**Two bounded exceptions.** `CurrentTradingWindow`'s hour literals are session-boundary
definitions, but their duplication across two files is open item 12. The 500-slot walk
bound appears four times and each is an engineering safety limit that must be justified as
one wherever it is ported.

---

## §8 Process rules

### Retained, all validated across eleven packets

```
compact phase-separated packets
revision-specific pre-flight destinations
post-write verification read
stated harness write limit with authorized chunking
full-line counts only
wall-clock and retry budgets
report-before-stop on every BLOCKED condition
no revert without a council decision
BLOCKED-FOR-COUNCIL rather than a builder guess
error count and not exit code as the compile gate
the materiality test for within-run corrections
parsed extracts only; the raw log stays on disk
numeric payloads adjudicate from disk unless a baseline proves fidelity
counts as the primary gate instrument; values need corroboration
case, substring, whole-token, whitespace, comment-stripping and
  no-gate-matches-its-own-instruction discipline on every issued command
paste-ready IDE instructions; the operator pastes and relays only
delta-and-exception builder reports
an extracted block is digest-verified
a regression packet degrades rather than stops
```

### Retired as counterproductive

```
multi-part consolidated handoffs as EXECUTION INPUT
defect numbers for administrative observations
ledger and inventory reconstruction ahead of a run
any form whose return could exceed a single conforming report
the operator channel as a default execution path
free reads issued without a queued packet that needs them
```

**Note the precision of the first retirement, because this document is a consolidated
handoff.** What is retired is loading a consolidated handoff into an IDE session **as the
builder's input**. A consolidated handoff remains the correct form for the council's state
record, the operator's relay artifact, and the source the assembler reads a packet body
from. **A builder receives an assembled packet file, and that file is self-contained.**

### Permanent builder guardrails

```
One task per builder run.
Builder receives only the issued task file and explicitly allowed files.
Form D: source-only. No edit, compile or run.
Form B: production edit only after explicit council authorization.
Locate current regions by identifier census, not historical line numbers.
Brace counting, not indentation.
Never infer a missing fact. Never choose among ambiguous objects.
Never infer strategy meaning.
Never use retrospective collection guessing for attribution.
Never use nearest / first / newest-object heuristics.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results.
No ellipses in a source paste. No retyped source line.
Declare every output split and deliver every part.
A successful builder report is not council acceptance until reviewed.
```

---

## §9 The census rule set — by reference

```
FILE OF RECORD:  03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md
                 764 lines, 27808 bytes, UTF-8 without BOM, LF-only, 26 numbered entries
                 SHA-256 f401d685a9761dd0d0c50bba3050b0753b710d5accee9d83f6d7511ee9447e8c
                 390 non-ASCII bytes, its own glyphs, copied verbatim as bytes

DERIVED, NOT USABLE:  CENSUS_RULES_VERBATIM.txt, extracted from .srj\tools\srjcensus.py
                 v1.0.0, encoding 23 amendments as code against the file's 26. MAY NOT be
                 pasted, quoted as a rule, or used as a completeness check. Retained. NOT
                 ADOPTED - a tool that lags silently produces a census that looks
                 conforming and is not.

COMPLETENESS GATE, MECHANICAL AND ARITHMETIC:
  the source's SHA-256 re-read EQUAL after the prepend
  assembled line count  = 764   + the body's line count, exact
  assembled byte size   = 27808 + the body's byte size, exact
  the assembled file's first 27808 bytes hash EQUAL to the source
  and, corroboratively, WITHIN LINES 1 THROUGH 764 ONLY:
    grep -SimpleMatch '16  multi-line call rule'          -> present
    grep -SimpleMatch '15  declaration brace exclusion'   -> present
  THE GREP HALF IS SCOPED AND CORROBORATIVE. It is self-satisfying if the body quotes the
  strings, so the arithmetic is primary. No count of amendments is asserted by council.

ENCODING: the prepend is BYTE-PRESERVING - ReadAllBytes to WriteAllBytes, never a
  read-decode-rewrite through a default-encoding Get-Content. The census block is LF-only
  and a CRLF body is normal; the assembled file legitimately carries both.

AMENDMENTS 17 THROUGH 26: council does not hold their text. Non-gating for issuing a
  Form D, since the builder receives the file. Requested only if a specific return turns
  on one.
```

---

## §10 Architecture layer

### 10.1 Retained from Revision 60, binding, not restated here

| Rev 60 § | Content |
|---|---|
| §7.64–§7.96 | Findings EA-147 through EA-179, four retractions, the void attribution deliverable |
| §9 | The twelve data contracts, every field classified — **fully consumed into the declarations now on disk** |
| §11 | The completed ownership table. Six rows read `NOT STORED`, two read permanently `UNKNOWN` |
| §13 | Milestones 1 through 7 and the scenario set A through H |
| §15 | The must-not-conflate list, forty-odd rows |
| §16 | What must not happen |

### 10.2 The twelve contracts are declared and on disk

`SRJ_FlowNexus_EA.mq5` lines **166 through 813**. 648 lines, pure ASCII, zero parentheses
in comment-stripped text, **18 enums and 13 structs**. Also at
`06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md`, block digest `bcabf265…41153`.

```
DECLARED:  3 defines - SRJ_MAX_OPP_FVG_REFS 8, SRJ_MAX_HYP_PER_CANDIDATE 8,
             SRJ_MAX_EVENT_OBJREFS 4
           18 enums - ENUM_SRJ_RESOLUTION, OBJKIND, TRI, BIAS, LIVESESSION,
             CANDIDATE_STATE, HYPOTHESIS_STATE, REJECTION, TERMINATOR, SL_CAUSE,
             TP_CAUSE, TP_LEVELKIND, FILLMODE, CANCEL_CAUSE, VERDICT, BINDEVENT,
             RETEST_EVENT, EVENTKIND
           13 structs - SObjectRef, SXobRecord, SFvgRecord, SOppFvgEntry,
             SStructuralBundle, SMarketSnapshot, SStopReference, STargetReference,
             SCandidate, SHypothesis, SPendingEntry, SDecision, SDiagnosticEvent
             SOppFvgEntry is oppFvgRefs[]'s element type, NOT A THIRTEENTH CONTRACT.

NOT DECLARED, AND EACH OMISSION MAKES A RULE UNBREAKABLE:
  anatomyQualified   touchAdmissible   admissionR   executionWindowAdmissible
  noChaseBound       adverseCount
NOT DECLARED, ON PURPOSE: any confluence field. The positive-confluence concept does not
  exist in any document council holds. The 2-of-3 is the ADVERSE TRIPLE -
  inBiasObInvalidated, inBiasFvgInvalidated, opposingFvgValidated - each carrying its own
  SObjectRef, which is exactly what export buffers 34, 35 and 36 were built to supply.
NOT DECLARED: any registry, any instance, any initialiser, any function.
```

### 10.3 The two state member sets, complete

```
CANDIDATE, eight declared plus one appended by Task 161:
  CANDIDATE_STATE_UNKNOWN = 0   CANDIDATE_NEW = 1            CANDIDATE_REGIME_WAIT = 2
  CANDIDATE_ALIGNMENT_WAIT = 3  CANDIDATE_HAS_HYPOTHESES = 4 CANDIDATE_COMPLETED = 5
  CANDIDATE_COMMITTED = 6       CANDIDATE_REJECTED = 7       CANDIDATE_EXPIRED = 8
  <UNNAMED, value 9>  the offering-observation state for ST_S3_ZONE_WAIT. Ruled a
    candidate state by Rev 60 6.13, given no edge by 10.2, and NAMED BY NEITHER.
    APPENDED BY TASK 161. Council does not invent the name.

HYPOTHESIS, twelve declared:
  HYPOTHESIS_STATE_UNKNOWN = 0            HYPOTHESIS_BOUND = 1
  HYPOTHESIS_WAITING_TOUCH = 2            HYPOTHESIS_TOUCHED = 3
  HYPOTHESIS_CONFIRMATION_LATCHED = 4     HYPOTHESIS_WAITING_DIVERGENCE = 5
  HYPOTHESIS_WAITING_TARGET_VALIDITY = 6  HYPOTHESIS_WAITING_RR = 7
  HYPOTHESIS_SETUP_COMPLETE = 8           HYPOTHESIS_PENDING_ENTRY = 9
  HYPOTHESIS_REJECTED = 10                HYPOTHESIS_CANCELLED = 11
  HYPOTHESIS_BASIS_LOST = 12

RETIRED: ST_IDLE -> registry emptiness. ST_ABORT -> a recorded rejection.
  HYPOTHESIS_UNBOUND -> unimplemented, because a bundle holds bindingBar.
CANDIDATE_REJECTED is reached ONLY by a candidate-level rule - the forgetting rule, POI
  invalidation, or expiry - NEVER by the death of one hypothesis.
CANDIDATE_COMMITTED is written by PHASE B and by nothing else. A Phase A write to it IS A
  MILESTONE 5 FAILURE.
NO ORDINAL COMPARISON IS PERMITTED ON EITHER ENUM.
```

### 10.4 Transition edges — Rev 60 §10, consumed

```
C1 -> CANDIDATE_NEW              ruled POI retest. THE SOLE ADMISSION LATCH. Writes
                                 candidateId, dir, poiAnchor*, retestBar, retestEvent,
                                 createdBar, tradingWindowAtAdmission
C2 -> REGIME_WAIT                reversible, writes state only
C3 -> ALIGNMENT_WAIT             regime satisfied, writes regimeAtAdmission
C4 -> HAS_HYPOTHESES             first binding. WRITES NO NEW EVIDENCE
C5 -> itself                     later distinct offering, appends hypothesisIds
C6 -> REJECTED                   candidate-level rule ONLY
C7 -> EXPIRED                    forgetting rule. NO EVIDENCE FIELD, deliberately
C8 -> COMPLETED                  >=1 hypothesis reaches SETUP_COMPLETE
C9 -> COMMITTED                  PHASE B ONLY: wins arbitration and passes the commit test

H1  -> BOUND                     S3->S4 arming. Writes the whole bundle plus
                                 stopRef.legIdentity and legBoundaryBarAtLatch
H2  -> WAITING_TOUCH             REVERSIBLE, state only
H3  -> TOUCHED                   touch WITH touchBar > bundle.xob.promotionBar, STRICT
H4  -> CONFIRMATION_LATCHED      writes confirmationBar, confirmationClose,
                                 confirmationTime - all THREE ABSENT FROM THE BUILD
H5  -> one of the three S5 states REVERSIBLE, state only
H6  WAITING_DIVERGENCE -> WAITING_TARGET_VALIDITY   divergence consumed. T4 ADVANCES
H7  WAITING_TARGET_VALIDITY -> WAITING_RR           admissible target found
H8  WAITING_RR -> SETUP_COMPLETE  ruled RR satisfied. Writes refPrice, refBar,
                                 placementRule, and MUST latch selectionCause or accept
                                 permanent UNKNOWN. UNGUARDED BY THE EXECUTION WINDOW
H9  any S5 -> REJECTED           T1, T2, T5a, T5b or the RR re-test. NOT T4
H10 SETUP_COMPLETE -> PENDING_ENTRY
H11 any bound state -> BASIS_LOST bundle.xob.ref.resolution == GONE. TWELVE EDGES IN ONE
H12 any pre-completion -> CANCELLED  writes cancellationReason ON THE HYPOTHESIS

P1 create   P2 no-chase evaluation, derived   P3 wick return seen, REVERSIBLE
P4 superseded by better R, NEW RECORD created, old latches cancellationReason
P5 cancelled   P6 terminated by T3   P7 expired
P8 filled - THE TWO-OWNER BOUNDARY FOR THE TARGET. TASK 165 MUST NOT IMPLEMENT REVISION

B1 collect completions   B2 first valid completion across time
B3 same-bar tie by ruled anchor tier, engineering determinism only below that
B4 execution-window commit test   B5 commit: SIGNAL, MarkSessionUsed ONCE, order, C9
B6 cancel or retain the remainder
B4 AND B5 ARE ORDERED AND THE ORDER IS THE GATE. A declined winner never reaches B5, so
  no session is marked and no signal emitted. MarkSessionUsed appears EXACTLY ONCE,
  replacing the two re-based inline sites at 3612 and 3698.
MILESTONE 6'S EVENT IS B3'S OUTPUT: a bar with two completions and no ARBITRATION_* event
  is a failure REGARDLESS OF THE SIGNAL COUNT.

ONLY H2, H5, C2 AND P3 ARE REVERSIBLE, AND EACH WRITES STATE OR ONE FLAG AND NOTHING
  ELSE. RETENTION IS NOT REVERSAL: an out-of-session hypothesis waits while NOTHING IS
  UNWRITTEN and a terminator simply does not fire. ANY IMPLEMENTATION THAT REVERTS A
  FIELD TO REPRESENT WAITING IS REINTRODUCING THE SINGLETON'S MUTABILITY UNDER A NEW NAME.
```

### 10.5 Terminator attachment, ruled

| Terminator | Attaches to | Diagnostic literal |
|---|---|---|
| **T1** structure invalidated | **any bound state, H1 → P8 inclusive** | `SRJ_TERM_T1_STRUCTURE_INVALIDATED` |
| **T2** bias flips | **same span** | `SRJ_TERM_T2_BIAS_FLIP` |
| **T3** TP or SL before fill | `SPendingEntry` edge **P6**, pre-attached | `SRJ_TERM_T3_REACHED_BEFORE_FILL` |
| **T4** divergence validates | **NOT A TERMINATOR.** Edge **H6**, then Phase B's test | `SRJ_EVK_ADV_T4_DIVERGENCE_CONSUMED` |
| **T5a** target invalid | `HYPOTHESIS_WAITING_TARGET_VALIDITY` | `SRJ_TERM_T5A_TARGET_INVALID` |
| **T5b** RR fails | `HYPOTHESIS_WAITING_RR` | `SRJ_TERM_T5B_RR_FAIL` |

**The build's T5 is two terminators sharing one abort path** — `ABORT_NO_TP_TARGET` at
re-based 3542 and `ABORT_TP_RR_FAIL` at 3565, both above the divergence check at 3569.
That is the three-way split's justification from source rather than drafting preference.

**`HYPOTHESIS_WAITING_DIVERGENCE` has no terminator of its own.** Its only exits are T4 and
the two global adverse edges. So a `SESSION_CLOSED` death at S5 with `divLatch=0` is
**always** the divergence state — which makes the Tier 2 fixture (`wouldHold=1`, one
instance across 5,472 bars, expression at re-based 2388) attributable for the first time.

### 10.6 The eight ordinal sites — a rewrite, not a renumbering

`ENUM_SRJ_STATE` is EA-local at 137–139 and **no member carries an explicit `=` value**, so
the comparisons rest on declaration order. Re-expression is a rewrite of positions.

| Re-based line | Expression | Becomes | Owner |
|---|---|---|---|
| 2074 | `!= ST_IDLE` | a candidate exists | candidate registry |
| 2375, 2772, 2820 | `> ST_IDLE && != ST_ABORT` | a live non-terminal candidate exists | candidate registry |
| 2436 | `>= ST_S3_ZONE_WAIT && <= ST_S5_GATE_CHECK` | **spans binding → TWO tests** | candidate OR hypothesis |
| 2572 | `>= ST_S2_LTF_ALIGN && < ST_S4_ARMED` | pre-binding only | candidate only |
| 2579 | `>= ST_S4_ARMED && <= ST_S5_GATE_CHECK` | post-binding only | hypothesis only |
| 2585 | `>= ST_S2_LTF_ALIGN && <= ST_S5_GATE_CHECK` | **spans → TWO tests** | candidate OR hypothesis |
| 2653 | `>= ST_S1_REGIME` | any candidate past admission | candidate only |

**2585 is the one that matters.** It encloses Task 142's only permitted site and
`ComputeSlReference`'s S2 poll. Re-expressing it touches two queued tasks.

### 10.7 Amendments this document makes to Revision 60

```
1  Section 8.6's stasis quadruple is replaced by section 3.
2  Section 14's sequencing table is replaced by section 13.
3  Section 17.38's void-attribution limitation now reads: one attribution deliverable is
   void, its replacement is accepted, and the replacement's consequences are read.
4  Section 10.3's terminator attachments are corrected by 10.5 above - T1/T2 span
   H1->P8, T4 is not a terminator, T5 is two terminators.
5  Section 9.8's divergence placement is corrected to CANDIDATE level. SIBLINGS SHARE THE
   DIVERGENCE LATCH. "It inherits nothing" governs the hypothesis-level set - bundle,
   opposing candle, confirmation, the adverse triple - not the candidate-level shared set.
6  Section 9.8 is also corrected to carry cancellationReason, required by edge H12.
7  Section 0's citation of Part A v4.2 section 3.7 as the confluence constituent set is
   WITHDRAWN. Section 3.7 is the target-admissibility section.
8  Milestone 5's census scope is EA-ONLY, ruled.
9  Section 13.4's SRJ INV claim is WITHDRAWN - both INV and INVALID are absent from the
   full capture. Its SLZONEGUARD claim is withdrawn: the zero is EXPLAINED on both halves.
```

---

## §11 What is blocking the project

**Nothing council owes. Nothing the operator owes. One harness run.**

`160-REG-R2` measures whether Task 160's insertion is behaviour-neutral. Byte-identity is
expected **by construction** — zero parentheses, seventeen zero tokens, no existing line
touched — and **expectation is not evidence.** Its body is §20.1.

```
IDENTICAL  -> Task 160 is confirmed behaviour-neutral BY MEASUREMENT. Task 161 unblocked.
              R-87's lineage hole CLOSES AS A SIDE EFFECT: a binary compiled today from
              today's source reproduced a baseline measured on a 2026-08-30 binary.
              160-CAL is WITHDRAWN.
DIVERGENT  -> BLOCKED-FOR-COUNCIL. No diagnosis, no attribution, NO REVERT by the
              builder. Council issues 160-CAL as a revert-recompile-rerun against the
              frozen checkpoint, exact by digest.
```

### 11.1 No operator question is outstanding

`R-Q11` and `R-Q12` are both **ANSWERED and CLOSED**. Two small Task 166 questions are
recorded and neither blocks anything: may a post-fill target revision fire on **more than
one** session close, and may it **reduce R**. Council will ask when Task 166 is next.

### 11.2 Task 162's predecessor Form D carries four items, none blocking anything ahead of it

```
the zone containment test's inclusivity, <= versus <, five lines of source, DECISIVE FOR
  THE RECORD'S ONLY SIGNAL
obValid's distribution across the 161 SL_REF lines. HYPOTHESIS, EXPLICITLY UNCONFIRMED,
  NO NUMBER BUILT ON IT: all eight two-swing lines read obValid=0 and every sampled
  one-swing line reads obValid=1, so branch selection may be determined by obValid alone
Scenario H's ONLY Tier 2 fixture, captured as a PRE-RULE measurement before the
  strictly-after rule removes it
whether the three promotion sites enforce valid-and-activated before promoting - the
  operator's anatomy precondition, filed as UNRECONCILED
```

---

## §12 The bounded items in front of the project

### 12.1 `160-REG-R2` — the Tier 1 regression

```
Form:            OBS, one harness run
Authorization:   160REG-A2, issued by section 4
Body:            section 20.1
Cost:            60 minutes, of which the run is about 27
Closes:          Task 160's behavioural gate; R-87's lineage hole if IDENTICAL;
                 160-CAL's existence either way
```

### 12.2 `155-RT-A` — buffer-34 read-mechanism census

```
Form:            D, source-only
Authorization:   NONE REQUIRED, NONE ISSUED
Body:            REVISION_62_CONSOLIDATED_HANDOFF.md section 20.2, unchanged
Cost:            30 minutes, no run
Decides:         open item 24 and whether 155-RT-B exists at all. Item 4b: does anything
                 read index 34.
Deadline:        before Task 163, NOT before Task 161.
CHEAPER THAN DRAFTED: item 3g is HALF-ANSWERED FROM SOURCE already. OBPROV codes 1-4
  print ob.objId and assign g_s.tickOBSetterId on ADJACENT LINES - 176/177, 186/187,
  558/559, 568/569 - so print and transport carry the identical expression. The remaining
  link is FlowLogic's export write, which is 3a's item. OPEN ITEM 24 MAY CLOSE FROM
  SOURCE ALONE.
NOTE, from the whole-tree objId census: codes 5-8 always report id=0 and the token objId
  appears in only three files on 18 lines, so THEIR id EXPRESSION IS NOT objId. id=0 reads
  as a correct NO OBJECT IN SCOPE - objId = 0 is the declared unassigned sentinel - which
  is exactly the case P15 and SObjectRef were designed for. Code 9 is SRJ_StateInit's
  default. Codes 1 and 2 exist in source and did not fire at Tier 1.
```

### 12.3 Task 161 — the cascade adapter, Milestone 1

```
Form:            B, and it needs a predecessor Form D
Authorization:   REQUIRED, not issued
Gate:            160-REG-R2 IDENTICAL
Surface:         nine re-based g_state writes plus 65 reading lines, 73 occurrences.
                 SState is flat: header 96, close 257, 161 body lines, no methods,
                 SState g_s; at 259. SRJ_StateInit is 307-505 with 153 assignments.
Design:          A-3 section 5.8's own wrapper - LoadWorkingSet / HypothesisCascade /
                 StoreWorkingSet, "zero return-site edits", signature migration
                 withdrawn - MATCHES THE DRAFTED ADAPTER EXACTLY.
Appends:         the offering-observation candidate state at value 9.
CAUTION, LOAD-BEARING: SRJ_State.mqh line 188 is byte-substituted and may not serve as an
  anchor without a re-read. It is comment text and no verdict rests on it.
```

### 12.4 `160-CAL` — deferred and conditional

```
Issued ONLY if 160-REG-R2 diverges. Not authorized. Not drafted. 160CAL-A1 DOES NOT
EXIST. Its shape is fixed: revert to the frozen checkpoint, verify the EA digest returns
to 0f1f44cb..52331322 exactly, recompile, re-run Tier 1. A revert that reproduces a known
digest is not a judgement call, which is what makes deferring safe.
```

### 12.5 `155-RT-B` — suspended, decision table pre-committed

| `155-RT-A` return | Consequence |
|---|---|
| 4b NO CONSUMER **and** 3g same expression | Open item 24 closes as **PREMATURE**. `155-RT-B` **withdrawn**. Cheapest outcome |
| 4b NO CONSUMER **and** 3g different | Item 24 narrows to *"does the buffer receive what the print reports"*, answerable inside Task 163 |
| 4b CONSUMED | The same-bar overwrite becomes a **transport defect**. `155-RT-B` drafted, scoped to the consumer's read |
| index 34 within `indicator_plots` | If ever needed: chart attach, Data Window read. Minutes, one authorization |
| index 34 beyond plots, or `INDICATOR_CALCULATIONS` | A reader script at a **new path outside the canonical sixteen**, using `ChartIndicatorGet` on a manually attached instance rather than `iCustom` so no input list must be matched |
| 3d sentinel UNKNOWN | `155-RT-B` reads a range and reports the distribution; the sentinel is identified as the modal value, never assumed |
| 5b `objId` in object names | `155-RT-B` reports buffer values as MEMBER / NOT-MEMBER of the on-chart objId set. That is the real correctness test |
| 5b `objId` absent | Correctness becomes partially unfalsifiable on a live chart and honest verification moves to Task 163 |

---

## §13 Milestones and sequencing

### 13.1 The objective, restated because instrumentation makes it easy to lose

Structural agreement is **0 of 12**, unchanged across eleven revisions. That is the only
number that decides whether this build reproduces the operator's strategy, and it has not
moved because the thing being measured was never the thing that was broken.

The diagnosis was reached twice independently. The EA's working state is thirteen
file-globals. Every downstream operation — regime, alignment, freshness, target, stop,
divergence, zone, touch, confirmation, signal, throttle, alert — reads or writes that one
set. **That is not a candidate registry with capacity one; it is a single mutable
process.** A registry becomes concurrent by raising a constant. A single mutable process
becomes concurrent only after it acquires the concept of a candidate.

**What changed with Task 160: the concept now exists in the source.** Twelve structs, two
state enums, an object reference that resolves by identity, and absence represented
structurally. It is inert, it is unreferenced, and it is the first representation in this
project capable of expressing the strategy. Nothing reads it yet. Task 161 is what starts.

**The measured instance of the diagnosis:** a pre-binding evaluation at 08.18 09:25 read
zone globals an arming event set at 09:20. Either the same candidate de-armed without a
zone reset, or a different candidate read a zone another candidate armed. Both are the
singleton defect, and the log cannot separate them — which is precisely what Milestone 1's
per-field load/store log exists to do.

### 13.2 Milestones — none has been attempted

| # | Milestone | Passes when | Task |
|---|---|---|---|
| 1 | State isolation | A hypothesis is evaluated without changing another's state. Proven by a per-field load/store log, **not a signal count** | 161 |
| 2 | Identity preservation | A hypothesis retains XOB, FVG and bundle identity across bars, re-read by identity not re-selection. **Includes a `GONE` case with both last-observed fields, or a stated zero** | 162 |
| 3 | Evidence ownership | Every touch, confirmation, divergence, invalidation, stop and target fact is attributable to the hypothesis that owns it | 162, 163 |
| 4 | Sibling preservation | A later structural object produces a logged sibling rather than replacing the first hypothesis, at **both** binding sites. **Siblings share the divergence latch** | 162 |
| 5 | Phase separation | Evaluation produces decisions and commits nothing. **Scope EA-only.** A Phase A write to `CANDIDATE_COMMITTED` is the named failure | 164 |
| 6 | Deterministic arbitration | Multiple completions resolve by explicit rules. Every multi-completion bar carries an `ARBITRATION_*` event naming winner and rule | 164 |
| 7 | Scenario reproduction | **Only now** are A, B, C, D, G and H scored | after 164 |

**Milestone 5 is the one that pays for the rest.** Once evaluation commits nothing, an
admission-changing edit can be measured against a stable denominator and EA-133 stops
being a blanket caveat. **Tasks 141 and 142 are cheap after Milestone 5 and expensive
before it.** That is the whole sequencing argument and it has not changed.

### 13.3 Sequence

| Order | Item | Gate | Harness | Owner |
|---|---|---|---|---|
| **1** | **`160-REG-R2`** | 160REG-A2 | Tier 1 ~27 min | **builder, issuable now** |
| 2 | **Task 161** predecessor Form D | 160-REG-R2 IDENTICAL | none | builder |
| 3 | **Task 161** cascade adapter. **Milestone 1** | its Form D | Tier 1 + per-field load/store log | builder |
| 4 | **Task 162** predecessor Form D, four items | 161 | none | builder |
| 5 | **Task 162** binding. **Milestones 2, 3, 4** | its Form D | Tier 2 ~84 min + **the `SL 1.15870` value gate** | builder |
| 6 | **Task 163** provenance completion | 162 | Tier 2 | builder |
| 7 | **Task 164** Phase A / B. **Milestones 5, 6** | 163 | Tier 2 then Tier 3 ~252 min | builder |
| 8 | Task 165 pending-entry lifecycle | 164 | Tier 2 | builder |
| 9 | Tasks 141, 142, 129, 130, 131 | their stated predecessors | as recorded | builder |
| 10 | Task 166 position and exit engine | 165 + two scenarios passing | Tier 3 | builder |
| — | `155-RT-A` | none | none | builder, before Task 163 |

**Run-budget rule.** Carry **~1.7% per registered buffer** — 26 min 50.7 s against
25 min 30.4 s for three registrations over 1,728 bars. Tier 1 ~27 min at 37 buffers,
Tier 2 ~84 min, Tier 3 ~252 min. **Registration is what costs, not population**, so
populating buffers 35 and 36 would not move the figure.

Behaviour-neutral edits regress at Tier 1. Admission-changing measurement runs at Tier 1
if the phenomenon is in the window, Tier 2 if it needs 08/03, 08/05 or 07.28. Tier 3 locks
in a change or claims the whole signal set. **`D:\Videos\Task 135 Full Logs.txt` is
retired as a gate target. Task 123's Tier 3 is three generations behind**, so the next
Tier 3 run re-establishes that baseline as well as measuring whatever it was spent on.

**Total to Milestone 6 from here:** two source-only Form Ds, four Form Bs, three Tier 1
runs, three Tier 2 runs. Roughly six and a half hours of measurement to reach a
representation that can express the strategy — against sixty tasks that did not.

### 13.4 Deferred reads, filed by destination. None is requested as a free read.

| Deferred read | Destination |
|---|---|
| The containment test's `<=` versus `<` | Task 162's predecessor Form D |
| `obValid`'s distribution across the 161 `SL_REF` lines | Same |
| Scenario H's pre-rule fixture | Same |
| Whether the three promotion sites enforce valid-and-activated | Same |
| The four `site=S5` lines' `src=` values | Item 19's print packet |
| `OBPROV`'s windowed `id`/`code` partition at bar ≥ 120745 | Task 163's packet |
| `OBPROV`'s enumeration width — at least nine wide, codes 1–2 unobserved | `155-RT-A` item 3f |
| Whether `OBPROV`'s `id` is buffer 34's expression | `155-RT-A` item 3g, half-answered |
| Whether anything reads index 34 | `155-RT-A` item 4b |
| The 08.21 19:00 `close=` print site | `155-RT-A` item 3h, record-only |
| `LTF_MISALIGN`, 28 of 87 Tier 2 aborts, Daily-POC 12 of 28 | still mapped and not diagnosed. **EA-172's replay-order defect must be excluded before any abort is attributed to strategy** |
| A-3 §5.20's `SESSION_CLOSED` population by state and offset | sizes EA-144 before Task 164 implements it. The 22 `SESSIONHOLD` lines are already extracted |
| The two Task-102 buffers `g_bufXobObjId` and `g_bufFvgObjId`, indices unknown | `155-RT-A` STAGE 2c will place them. **If either already exports an XOB or FVG identity, Task 163's provenance design has a source it was not counting on** |

---

## §14 Open-item register

Revision 60 §18 carries forward. Changes and current entries only.

| # | Item | Status |
|---|---|---|
| 4 | Should the `nearest` branch set `currentLegHasXOB`? | OPEN. Council reading, not censusable, not an operator question. Task 129 |
| 6 | T1/T2/T4/T5's conditions and attachment; the 2-of-3 constituent set | **CLOSED.** Terminator half by A-3 §5.10; confluence half WITHDRAWN as mis-cited |
| 12 | Do `CurrentTradingWindow`'s London bounds and `g_defLondon` agree? | OPEN. A Part A question. Non-blocking |
| 13 | Insertion-order chronology; `SRJ_FVGOverCap` against a count its own pass decrements | **RULED: state the bound, do not establish ordering.** No Form D. A planner hypothesis, explicitly unconfirmed, **no number may be built on it** |
| 18, 19, 20 | Alerts emission; the two FlowLogic passes; `ZoneAdoptable` / `ZoneInPlay` | **ALL CLOSED.** Three emission channels, `SendMail(` indicator-only. Neither pass deletes; four capacity-driven delete paths, inventory complete. `ZoneAdoptable` is a fifth zone reader but an equality short-circuit only, does not read `g_touchSeen`; `ZoneInPlay` exists |
| 21 | Buffer 35's region-level write naming an object | CLOSED as source review. Implementation PARKED with Task 156 |
| 22 | Which object each of the seven flag-write regions attributes to | **CLOSED** by 160-PreJ Block A, accepted and read |
| 23 | Buffer 36's event and transport contract | **PARKED, withdrawn as a blocker.** Its answer is `SStructuralBundle.oppFvgRefs[]`, now declared |
| 24 | Does anything consume index 34? | **RE-SCOPED. Decided by `155-RT-A` item 4b. May close from source alone** |
| 25, 26, 27, 49 | Task 155's neutrality; the 159 ruling; the nine unnamed includes; the rule block's line count | **ALL CLOSED** |
| **50** | **Is Task 160's insertion behaviour-neutral?** | **OPEN. `160-REG-R2` decides it. THE ONLY OPEN ITEM BLOCKING ANYTHING** |

**New, subjects only, numbers assigned by the scribe at archive time:**

```
the .ex5 type-table growth of 2692 bytes on a code-free insertion
council's sixth pattern-shape slip, 2d citing the wrong artifact for the tag inventory
council's fifth slip, 5b's anchor arithmetic stated independently of its insertion point
council's fourth slip, the comment-blind return gate; and the zero-parenthesis test as
  its durable replacement
the STAGE 0 glob deviation as a P17 near-miss whose result agreed
the MetaMQL compiler's non-zero exit code on a clean build, now expected
the offering-observation candidate state, unnamed by Deliverable 3
SHypothesis.cancellationReason, absent from Rev 60 9.8 and required by edge H12
document A-4 and its section 5.32
a Phase B window-decline event kind, to be appended by Task 164
the Rev 60 10.5 versus Rev 62 10.5 citation collision
the unrecorded 2026-08-30 canonical compile and the EA source edit it carried
the banner-to-disk size mapping, two paired observations disagreeing by +32 and +33
the executable census tool at .srj\tools\srjcensus.py v1.0.0, three amendments behind the
  file of record. NOT ADOPTED, NOT QUEUED, text NOT REQUESTED - a faster census does not
  move 0 of 12
census amendments 17 through 26, whose text council does not hold
OBPROV codes 5-8's print sites, unlocated by the whole-tree objId census
the two Task-102 buffers and their indices
whether a post-fill revision may fire on more than one session close, and may reduce R
the non-ASCII census-pattern limitation
obValid as the possible sole determinant of branch selection
```

---

## §15 Parked, and not lost

```
Defects 87-181, findings EA-180 through EA-218, rulings R-1 to R-41: text not held by
  council. On disk in the builder reports of the 60.1-60.7 arc and in
  99_NOTES\DefectLedger.txt, 839 lines. Ledger ranges 401-800 and 801-839 are extracted
  and byte-verified in BUILDER_RESULT_60.4-12.md and -13.md.
Open item 28, the unread 154-Pre1 and 154-Pre2 hash results.
Buffer 35 and buffer 36 population. Registered, unpopulated, parked with Tasks 156 and
  154. Their SPECIFICATION IS SETTLED - oppFvgRefs[] and the adverse triple, both now
  declared - so the parking costs nothing.
The executable census tool. NOT adopted. Its text is NOT requested.
Every finding, limitation and defect numbered in Revisions 60 through 60.7 that this
  document does not restate.

RECOVERY IS QUEUED BEHIND STRATEGY WORK, NOT AHEAD OF IT. A parked number is picked up
  only when a specific ruling requires that specific number, and then for that number
  alone. Ledger reconstruction ahead of a run is retired.
```

---

## §16 Stasis

```
PRE-155 SERIES:  CLOSED AT 28, NOT CONTINUOUS.
  CAVEAT: continuous EA source stasis across 2026-08-28 -> 08-30 is UNESTABLISHED. An
  unrecorded EA source edit occurred in that interval, deduced not suspected - inputs
  measured identical excludes gating, SWEPTMASK 174 = TPCENSUS 174 excludes non-firing,
  and a deterministic compiler cannot emit prints the source lacks. Which of two
  intermediate compiles carried it is NOT RESOLVABLE; both binaries are gone.
  160-REG-R2 CLOSES THIS AS A SIDE EFFECT IF IT RETURNS IDENTICAL.

POST-155 SERIES: LENGTH 9, WITH ONE AUTHORIZED BREAK.
  155-R2 Packet C S4      five digests EQUAL across the compile
  155-REG STAGE 1 and 7   sixteen each
  160-PreK STAGE 1 and 7  sixteen each, all against targets
  160-PreL STAGE 1 and 6  sixteen each
  160-R2 STAGE 1          sixteen MATCH
  160-R2 STAGE 7          fifteen EQUAL, EA CHANGED AS INTENDED - declared in advance,
                          bounded to one file, verified in both directions
  160-REG STAGE 1         sixteen MATCH against the new EA digest
  Extended by 160-REG-R2 STAGE 1 and STAGE 5 to length 11.

SCOPE:  WHOLE TREE, sixteen files. Source stasis is the two .mq5 digests plus the fourteen
  .mqh digests, and nothing else. .ex5 SIZE AND TIMESTAMP ARE COMPILE-RUN EVIDENCE AND NO
  GATE MAY BE BUILT ON EITHER. Banner "bytes loaded" is not file size.

RUN PROVENANCE, four instruments:
  P8    journal line "generating based on real ticks"
  P8a   SRJ XOB-PROMOCENSUS fingerprint as an integer - 372 real ticks, 607 generated
        and VOIDS THE RUN
  P9    liveness probe on BIASCENSUS_FINAL bars=, baseline 1728
  P8b   the SRJ BUILD line, compile-embedded, in-journal, per-run. ABSENT from the
        baseline report; enters the record with the next run.
```

---

## §17 What must not happen

Revision 60 §16 carries forward in full. Sharpened, added, or changed in force:

- **No `.ex5` size or timestamp in any gate**, and **no cross-instrument comparison**
  between a banner `bytes loaded` figure and a disk size. Both `.ex5` fields have moved in
  this project without a recorded source edit.
- **No claim that the EA's 2,692-byte binary growth is behaviour.** It is the type table.
  The block was proven code-free by zero parentheses and seventeen zero tokens.
- **No claim of continuous EA source stasis across 2026-08-28 → 08-30.**
- **No gate against `D:\Videos\Task 135 Full Logs.txt`.** Retired. Its capture is complete
  but its EA binary differed. Absence claims sourced from it are statements about the Task
  135 run, not about the current build.
- **No value-bearing gate without cross-generation comparison or intra-batch sibling
  corroboration.** Counts remain the primary instrument.
- **No source file located by filename search, glob, `-Recurse`, wildcard, or Navigator
  selection** — and a glob whose result happens to agree is still a deviation and is
  declared.
- **No `.ex5` created, retained or read under `02_TASK_CHECKPOINTS`. No delete where a
  move will do.**
- **No move, edit or deletion of the frozen revert checkpoint.**
- **No recompile of the EA before `160-REG-R2` runs.** The binary Task 160 produced is the
  binary under test.
- **No operator hand-assembly, hand-transcription, or personal-shell command execution.**
  Council delivers paste-ready IDE instructions or it delivers nothing.
- **No consolidated handoff loaded into an IDE session as builder input.**
- **No use of `CENSUS_RULES_VERBATIM.txt` as a rule source, a paste, or a completeness
  check.** The amendment-8 gate is arithmetic plus a byte-match against the file of record.
- **No gate that matches its own instruction text.** The grep half is scoped to lines
  1–764 and is corroborative only.
- **No token census that has not discarded comment content first.** `return`, `if`, `for`
  and `while` are ordinary English words and a comment is never reworded to satisfy a gate.
- **No citation of Part A v4.2 §3.7 as the confluence constituent set.** Withdrawn.
- **No claim that `SRJ INV` is an available instrument.** Both `INV` and `INVALID` are
  absent from the full capture.
- **No use of Task 160-PreH Block B's attribution verdicts** — void, and they may not be
  quoted, compared against, or re-derived.
- **No claim that `Alert(` and `SendNotification(` occur only inside `EmitAlert`** without
  the qualifier *in the EA*. `SRJ_DispatchAlert` is a second emitter and `SendMail(` is a
  third channel that exists nowhere in the EA.
- **No windowed figure derived from `OBPROV`'s 2678 / 1654 / 1024** without the bar ≥
  120745 boundary. The history batch is 1,703 lines. In-window fires ≈ 975 is
  **PROVISIONAL**; Task 163's figure is authoritative.
- **No claim that the project is blocked on buffer 36, buffer 35, or open item 23.**
- **No comparison of a live file against `Rev060_Task155_ExportStage_Buffer34\BEFORE\`.**
- **No gate compared against a truncated digest.** Comparison is case-insensitive.
- **No mechanical retirement of `g_zoneHi`/`g_zoneLo` that fails to reproduce
  `SL 1.15870` on 2026.08.17 16:20:01.** Five EA functions read them, two in control flow
  on the admission path. A retirement that compiles silently moves the only stop in the
  record.
- **No ordinal comparison built on any contract enum, and no enum member ever renamed.**
- **No implementation that reverts a field to represent waiting.** Retention is not
  reversal.
- **No sentinel value used to represent absence in a contract.**
- **No pointer and no array index into `g_orderblocks` or `g_imbalances` in any contract
  field.**
- **No production edit, compile, chart attach or harness run without a separate
  authorization naming its own bounded scope.**
- **No new EA number or defect number minted by council.**
- **No paid planning model spent on a mechanical file update.**

**Operation stays alert-only.**

---

## §18 Repository actions

```
1. Create 06_HANDOFFS\REVISION_63_CONSOLIDATED_HANDOFF.md from this document. Operator
   paste, one operation.
2. Mark 06_HANDOFFS\REVISION_62_CONSOLIDATED_HANDOFF.md in place:
     SUPERSEDED BY REVISION 63, EXCEPT SECTION 20.2 WHICH REMAINS THE PACKET BODY OF
     RECORD FOR 155-RT-A.
   Do not delete. Do not move.
3. Rewrite 00_CURRENT_WORKING\CURRENT_STATE.txt in full from section 18.1. Operator
   paste, replacing the file - the append-governed version has three superseded objective
   blocks and a stale tree block, and a fresh session must not have to reconcile them.
4. Retain as historical archive, council reference only, loaded into no IDE session:
     REVISION_60_CONSOLIDATED_HANDOFF.md          2638 lines
     REVISION_60.4_CONSOLIDATED_HANDOFF.md        1683 lines, THE FILE IS THE AUTHORITY
     99_NOTES\DefectLedger.txt                     839 lines
     BUILDER_RESULT_60.4-10 / -11 / -12 / -13.md
   Revisions 60.1 through 60.7 remain marked SUPERSEDED; 60.1 must carry a visible note
   that its 154-Design-Review blocker is WITHDRAWN, not outstanding.
5. Archive BUILDER_RESULT_160-R2.md as the record of the migration's first production
   edit, and BUILDER_RESULT_160-PreL.md as the SOLE SOURCE of the fifteen unchanged
   digests.
6. Create 02_TASK_CHECKPOINTS\Rev063_Task160_Applied\ holding BUILDER_RESULT_160-R2.md,
   BUILDER_RESULT_160-PreK.md and BUILDER_RESULT_160-PreL.md. SOURCE AND TEXT ONLY. No
   .ex5. Never overwrite an existing BEFORE folder.
7. Do NOT touch 02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\. It is the frozen
   revert path.
8. Update every MANIFEST.txt touched by Task 160 to carry the current EA digest. Record
   the .ex5 figures under a heading naming them COMPILE-RUN EVIDENCE, NOT SOURCE
   PROVENANCE.
9. Do NOT create a Task 154 or Task 156 checkpoint. Both are parked, and a checkpoint
   folder for a task that will not run is a lineage claim for an edit that does not exist.
```

### 18.1 `CURRENT_STATE.txt` — the full replacement

```text
Working revision: Rev063
Operating mode: alert-only

DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
  ROOT IS NESTED INSIDE DF\MQL5. EVERY RELATIVE PATH IN EVERY PASTE RESOLVES UNDER ROOT.
  Same-named copies of canonical files exist beneath it: 4 .mq5 and 10 .mqh.
  P17: every source path is literal. Never a filename search, glob, -Recurse, wildcard or
  Navigator selection. A glob whose result agrees is still a deviation and is declared.

CURRENT EA DIGEST, edited by Task 160:
  SRJ_FlowNexus_EA.mq5
    93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced
    191970 bytes, 3850 lines, UTF-8 WITH BOM, 3850 CRLF, 0 lone LF, 0 lone CR
THE OTHER FIFTEEN DIGESTS ARE UNCHANGED and are read from BUILDER_RESULT_160-PreL.md
  STAGE 1 SECTION ONLY. Scope the parse to that section; the whole file over-matches.
  Never from a handoff. Never truncated. Comparison is CASE-INSENSITIVE hex.
WHOLE TREE: 12,087 lines across sixteen files.

Last applied production task: TASK 160, ACCEPTED
  648 lines of type-only contract declarations inserted into SRJ_FlowNexus_EA.mq5 at
  lines 166-813. ZERO existing lines modified, ZERO deleted. Compile 0 errors 0 warnings,
  one file, no Compile All. Collision census 136 of 136 ZERO HITS. Code-emission proof:
  ZERO PARENTHESES and seventeen ZERO tokens in comment-stripped text.
Last measurement: 155-REG, BYTE-IDENTICAL. Task 160's own regression is NOT YET RUN.

Compile artifacts - COMPILE-RUN EVIDENCE, NEVER PROVENANCE:
  SRJ_FlowNexus_EA.ex5   118130   file 2026-09-06 18:42   compiled by Task 160
  SRJ_FlowLogic.ex5      226444   file 2026-09-05 17:39:34   UNCHANGED
  The EA binary grew 2692 bytes on a types-only insertion. That is the TYPE TABLE, not
  code. METADATA IS NOT CODE. No gate reads .ex5 size or timestamp.
  P8b, the SRJ BUILD line, is the run-binary provenance instrument and is ABSENT from the
  155-REG report. It enters the record with the next run.

SUPERSEDED, do not quote as current:
  EA .mq5   0f1f44cb..52331322 / 162293 bytes / 3202 lines - remains the digest of the
            REVERT PATH and is correct for that purpose only
  EA .ex5   115438 / 08-30 10:31    and    115062 / 08-29 04:50
  FlowLogic .mq5  d5525014..fb5664d5      FlowLogic .ex5  08/28/2026 01:04 PM
VOID, never quote:  c307496079e3..dc3879511  and  08/29/2026 12:54 PM
VOID DELIVERABLE:   Task 160-PreH Block B, every attribution verdict. Inputs survive.
NON-CANONICAL, QUARANTINED to 07_ARCHIVE\VoidBinaries\ by 160-QUAR, never deleted: four
  .ex5 formerly under 02_TASK_CHECKPOINTS.

THE REVERT PATH IS FROZEN AND IS SOURCE ONLY:
  02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\SRJ_FlowNexus_EA.mq5
  digest 0f1f44cb..52331322, VERIFIED EQUAL to the pre-edit file. MAY NOT BE MOVED,
  EDITED OR DELETED. It is what makes a 160-CAL revert exact rather than a judgement call.
06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md is CONSUMED as an extraction source. Its
  block digest bcabf265..41153 is a historical fact. Nothing reads it.

THE EA'S ANCHORS ARE RE-BASED BY A KNOWN DELTA, ADMISSIBLE FOR LOCATION ONLY:
  old line N, N <= 165  ->  unchanged.  block -> 166 through 813.  N >= 166 -> N + 648.
  Every byte a later packet WRITES is still located by census in that packet and verified
  by paste at its own STAGE 2. P12 IS UNWEAKENED.
  RE-BASED: nine g_state writes 1740 1781 2883 2896 2908 3386 3525 3614 3700; g_state
    declaration 815; ST_S5_GATE_CHECK set 3525 test 3531; wouldHold 2388;
    ABORT_NO_TP_TARGET 3542; ABORT_TP_RR_FAIL 3565; divergence check 3569;
    MarkSessionUsed 3612 and 3698; PoiRetestResult 1166; ZoneAdoptable 1859 region
    1860-1909 call 3434; ZoneInPlay 1986.
  UNCHANGED, above the insertion: ENUM_SRJ_MODE 19; ENUM_SRJ_STATE 137-139;
    ENUM_SRJ_DIR 141; ENUM_SRJ_REGIME 142; ENUM_SRJ_SESSION 143; ENUM_SRJ_SLMODE 144;
    abort defines through 164; line 159, damaged comment text, STILL NOT AN ANCHOR.
  SRJ_State.mqh line 188 carries the same damage and the same treatment.

TIER 1 BASELINE:
  RAW LOG  D:\Videos\Task 155REG Full Logs.txt | 1005333 bytes | 6577 lines | NOT relayed
    THIS FILE IS THE COUNT INSTRUMENT OF RECORD. Tag tables are DERIVED FROM RAW LOGS by
    one command applied identically to both generations. Council does not need to know the
    tag vocabulary; an empty difference set is the gate.
  CONFIG, verbatim: EURUSD | M5 | 2026.08.14 - 2026.08.22 | every tick based on real
    ticks | 10000 JPY | 1:100 | SRJ_FlowNexus_EA | InpDebugLog=true | InpMode=0
    MODE_ALERT_ONLY | optimisation OFF | visual mode OFF. Eleven items, two input values.
  ELEVEN GATE ROWS, all PASS: Signals 1/1, Aborts 22/22, Candidates seeded 23/23,
    Armings 12/12, S3 evaluation bars 54/54, FRESHSKIP 141/141, FRESHCOUNT 22/22,
    SUPPRESSED 43/43, TPCENSUS 174/174, ZONEPICK=INPLAYCOMMIT=XOBPROMO 54=54=54,
    ZONECENSUS_FVG 0/0.
  SIGNAL LINE: [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42
    SL 1.15870 TP 1.16141 spr=2
  P8 present. P8a = 372 (607 VOIDS A RUN). P9 = bars=1728. P8b ABSENT.
  BUILDER_RESULT_155-REG.md CARRIES NO TAG INVENTORY - measured, zero hits. The inventory
    R-75 cited lives in the six extracts and is no longer needed.
  D:\Videos\Task 135 Full Logs.txt is RETIRED as a gate.
Run budget: ~1.7% per REGISTERED buffer. Tier 1 ~27 min, Tier 2 ~84 min, Tier 3 ~252 min.
  Registration is what costs, not population.

Authorization:
  160REG-A2 ISSUED, unconsumed. SCOPE: ONE TIER 1 HARNESS RUN, one raw log to disk.
  CONSUMED: 155-A3, 155REG-A1, 160QUAR-A1, 160-A1, 160REG-A1.
    160REG-A1 consumed WITHOUT A RUN - the packet stopped at STAGE 2 on a council defect.
    A token consumes on invocation, so it is re-issued as A2, never re-used.
  160CAL-A1 DOES NOT EXIST.
  Production edit / compile / chart attach: NOT AUTHORIZED. THE EA BINARY COMPILED BY
    TASK 160 IS THE BINARY UNDER TEST AND MAY NOT BE REBUILT.
  Delete: NEVER AUTHORIZED ANYWHERE.

Read-only IDE workflow:        VALIDATED END TO END
Production-edit IDE workflow:  VALIDATED END TO END, twice
Harness-run link:              VALIDATED
Chart-attach link:             NOT VALIDATED, and MAY NEVER BE NEEDED

Rulings: R-161   Defects: 181   Findings: EA-218 or higher
Council mints no new EA or defect number.

Census rule set of record:
  03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md
  764 lines, 27808 bytes, UTF-8 no BOM, LF-only, 26 numbered entries
  SHA-256 f401d685a9761dd0d0c50bba3050b0753b710d5accee9d83f6d7511ee9447e8c
  Amendment 8 is satisfied by MECHANICAL BYTE-PRESERVING PREPEND. THE GATE IS ARITHMETIC:
    source hash re-read EQUAL, lines = 764 + body, bytes = 27808 + body, and the
    assembled prefix hashes EQUAL to the source. The two greps are SCOPED TO LINES 1-764
    and are corroborative only - a gate may not match its own instruction text.
  CENSUS_RULES_VERBATIM.txt is DERIVED - never pasted, never a completeness check.

WORKFLOW: ALL execution and ALL mechanical file work goes to the IDE.
  IDE AGENT, single: Cline Act + GLM 5.3 Flash. Fallback: Cline Act + DeepSeek V4 Flash.
  RETIRED: Claude Sonnet 4.5 as workflow planner; Opus 5 via Cline Act as coder.
    CONSEQUENCE: NO CAPABLE CODER IN THE IDE. Every Form B carries COMPLETE LITERAL TEXT
    for every operation, and NO FORM B MAY REQUIRE JUDGEMENT.
  Whole-document transcription -> OPERATOR pastes into a new file.
  Any read-modify-write -> IDE.
  Builder reports are DELTA AND EXCEPTION ONLY. Handoffs stay full.
  A relay paste is issued COMPLETE or not at all.
  Council: Opus 5, web only, reads no file. External reviewer: GPT 6 Astra.
  Packets go to 01_TASKS. PACKET_160-PreK.md stays in 06_HANDOFFS.

WORKING RECORD: 06_HANDOFFS\REVISION_63_CONSOLIDATED_HANDOFF.md.
  REVISION_62 is SUPERSEDED EXCEPT SECTION 20.2, which remains the packet body of record
  for 155-RT-A.
UNRECOVERABLE FROM DISK, and none of it blocks anything: REVISION_56 in full - EA-1
  through EA-146, the log formats, answers R-Q13/14/15; REVISION_60 sections 6.1-6.11;
  REVISION_61, which never existed; Part A v4.2, DEMOTED to the oldest layer; document
  A-4.

NO OPERATOR QUESTION IS OUTSTANDING. R-Q11 (A1, strictly-after on both paths) and R-Q12
  (a live session extreme is not admissible at admission; a closed one is, and a post-fill
  revision is Task 166's) are both ANSWERED AND CLOSED. Two small Task 166 questions are
  recorded and neither blocks anything: may a post-fill revision fire on more than one
  session close, and may it reduce R.

Current objective: THE MIGRATION.
  1  TASK 160-REG-R2. Tier 1, token 160REG-A2, body at REVISION_63 section 20.1.
     Configuration READ FROM BUILDER_RESULT_155-REG.md and never retyped. Tag tables
     DERIVED FROM BOTH RAW LOGS by one identical command. IDENTICAL confirms Task 160
     behaviour-neutral, closes R-87's lineage hole as a side effect, and withdraws
     160-CAL. DIVERGENT is BLOCKED-FOR-COUNCIL with no revert by the builder.
     THE ONLY THING QUEUED.
  2  TASK 161 predecessor Form D, then TASK 161. Cascade adapter, MILESTONE 1. Surface is
     the nine re-based g_state writes plus 65 reading lines. FIRST TASK THAT APPENDS AN
     ENUM MEMBER - the offering-observation candidate state at value 9, unnamed by
     Deliverable 3 and NOT invented by council.
  3  TASK 162 predecessor Form D, four items: the containment test's <= versus <,
     obValid's distribution across the 161 SL_REF lines, Scenario H's PRE-RULE fixture
     capture before the strictly-after rule removes it, and whether the three promotion
     sites enforce valid-and-activated before promoting. Then TASK 162, MILESTONES 2/3/4,
     carrying the SL 1.15870 single-value gate.
  4  TASK 163, then 164 (MILESTONES 5, 6), then 165, then 141/142/129/130/131, then 166.
  -  155-RT-A, body at REVISION_62 section 20.2, unchanged and cheaper - item 3g is half
     answered from source. Deadline before Task 163, NOT before Task 161.
  -  160-CAL: DEFERRED AND CONDITIONAL. Issued only if 160-REG-R2 diverges.

PARKED: Task 154, Task 156, buffers 35 and 36, open item 23. Nothing queued depends on
  them and their specification is now DECLARED IN SOURCE.
BLOCKED ON NOTHING: no document blocks any queued task.
ONLY ONE OPEN ITEM BLOCKS ANYTHING: is Task 160's insertion behaviour-neutral.

Task 162 carries a SINGLE-VALUE REGRESSION GATE: the zone retirement must reproduce
  SL 1.15870 on 2026.08.17 16:20:01. It is the only stop in the record. Five EA functions
  read the zone globals, two in control flow on the admission path.

Structural agreement: 0 of 12. Unchanged across ELEVEN revisions - and the first
  representation capable of expressing the strategy is now IN THE SOURCE rather than
  drafted. Twelve structs, two state enums, identity-resolved object references, absence
  represented structurally. Inert, unreferenced, and Task 161 is what starts reading it.

Do not edit archived copies. Do not read ROOT as source (P14). No .ex5 under
  02_TASK_CHECKPOINTS (P18). Never Compile All (P10). Never open a non-allow-listed file
  in MetaEditor (P11). Never delete where a move will do. Never rename an enum member.
  Never build an ordinal comparison on a contract enum. Never revert a field to represent
  waiting. Never represent absence with a sentinel value.
```

---

## §19 Next single action

```
BUILDER, needs nothing but assembly:
  160-REG-R2. Section 20.1 carries its ASSEMBLY DIRECTIVE and its body. Token 160REG-A2.
  About 60 minutes, of which the run is 27. IT IS THE ONLY THING QUEUED.

COUNCIL, on an IDENTICAL return:
  160-CAL WITHDRAWN. R-87 CLOSED. Open item 50 CLOSED. Task 161's predecessor Form D
  drafted - the per-field load/store instrumentation surface, which is Milestone 1's proof
  and the first measurement that can separate the two readings of the 08.18 09:25
  contamination instance.

COUNCIL, on a DIVERGENT return:
  160-CAL issued as a revert-recompile-rerun, exact by digest against the frozen
  checkpoint. Nothing is reverted by the builder.

BUILDER, whenever, non-blocking:
  155-RT-A, body at REVISION_62 section 20.2. Deadline before Task 163.

NO OPERATOR ANSWER IS REQUIRED BY THIS DOCUMENT.
```

---

## §20 Queued packet body — verbatim, for mechanical assembly

`155-RT-A`'s body is **not restated here.** It lives at
`REVISION_62_CONSOLIDATED_HANDOFF.md` §20.2, unchanged, and that file is retained on disk
for exactly that purpose.

### 20.1 `160-REG-R2`

```text
ASSEMBLY DIRECTIVE — 160-REG-R2
Performed by: Cline Act + GLM 5.3 Flash. No census, no edit, no judgement.

 1. Read 03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md as BYTES.
    Record its SHA-256.
 2. Create 01_TASKS\PACKET_160-REG-R2.md = that file's bytes VERBATIM, followed by the
    BODY below verbatim. UTF-8, no BOM, byte-preserving. ReadAllBytes to WriteAllBytes
    only; never a read-decode-rewrite through a default-encoding Get-Content.
 3. Re-hash the source file. It MUST equal step 1. If not: STOP, report BLOCKED, delete
    nothing.
 4. Verify the assembled file:
      line count = 764   + the BODY's line count, exact
      byte size  = 27808 + the BODY's byte size, exact
      the assembled file's first 27808 bytes hash EQUAL to the source's digest
      WITHIN LINES 1 THROUGH 764 ONLY: '16  multi-line call rule' present, and
        '15  declaration brace exclusion' present
 5. Report all four results plus the assembled file's path, byte size and integer line
    count. DO NOT EXECUTE THE PACKET.
```

**BODY — `160-REG-R2`**

```text
FORM:            OBS - one Tier 1 harness run. NO SOURCE IS WRITTEN AND NOTHING IS
                 COMPILED.
SUPERSEDES:      PACKET_160-REG.md, which BLOCKED at STAGE 2 because its item 2d cited a
                 report that carries no diagnostic tag inventory. THE STOP WAS CORRECT
                 AND THE DEFECT WAS COUNCIL'S. Stages 1 and 2a-2c, 2e, 2f are banked and
                 are re-derived here only because a packet is self-contained.
AUTHORIZATION:   160REG-A2. SINGLE USE. SCOPE, EXHAUSTIVE:
                   one Tier 1 harness run
                   one raw log written to disk
                   nothing else
PRODUCTION EDIT: NOT AUTHORIZED. ZERO BYTES ARE WRITTEN TO ANY .mq5 OR .mqh.
COMPILE:         NOT AUTHORIZED. THE EA BINARY PRODUCED BY TASK 160 IS THE BINARY UNDER
                 TEST AND MAY NOT BE REBUILT. A recompile voids this packet.
CHART ATTACH:    NOT AUTHORIZED
ORDERS:          NONE. Operation is alert-only.
DELETE:          NOT AUTHORIZED ANYWHERE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      60 minutes, of which the run is about 27.

PATH CONSTANTS - the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
EVERY RELATIVE PATH NAMED BELOW RESOLVES UNDER ROOT, NOT UNDER DF\MQL5.

P17: no file is located by filename search, glob, -Recurse, wildcard or MetaEditor
Navigator selection, INCLUDING the fourteen include files. Every path is literal. A glob
whose result happens to agree is STILL A DEVIATION and is declared.
P10: no compile occurs in this packet at all.
P11: never open a non-allow-listed file in MetaEditor.
P18: no .ex5 is created, copied or read under 02_TASK_CHECKPOINTS.

STOP DISCIPLINE, EXHAUSTIVE. THIS PACKET STOPS ON FIVE CONDITIONS AND NO OTHERS:
  a STAGE 1 digest MISMATCH
  P8a = 607, which means generated ticks and VOIDS the run
  P8 absent from the journal
  a configuration difference from the baseline at STAGE 3
  a source digest change across the run at STAGE 5
EVERYTHING ELSE DEGRADES AND REPORTS. Where a secondary comparison cannot be built,
report NOT DERIVABLE, name exactly what was missing, and CONTINUE ON THE PRIMARY
INSTRUMENT. A twenty-seven-minute run is not forfeited for a figure council mislocated.

REPORT CONTRACT - DELTA AND EXCEPTION ONLY.
  In full: the header, the P17 attestation, every failed command with raw error text,
    every split, every truncation, every stop condition, every mandated verdict line,
    every figure this packet asks to be quoted verbatim, and EVERY FIGURE THAT DIFFERS
    from its comparison target with the raw output beside it.
  One line or one row: a hash that MATCHES, a hash that is EQUAL, a count that is
    IDENTICAL. Aggregate: "sixteen EQUAL, none changed".
  Do not include: certutil success echoes, command strings for commands that succeeded,
    per-file zero rows, TAG TABLE ROWS WHOSE COUNTS AGREE, methodology beyond one block
    at the top, the bytes-free line of any dir output, or any restatement of this packet's
    instructions.
  A report that omits a disagreement is a defect. A report that expands an agreement is
  waste. Every figure is derived by command.

PURPOSE, AND BOTH OUTCOMES ARE RESULTS
Task 160 inserted 648 lines of type-only declarations into SRJ_FlowNexus_EA.mq5 at lines
166 through 813 and recompiled it. The block was proven to contain ZERO PARENTHESES and
zero occurrences of seventeen code tokens in its comment-stripped text, so it emits no
executable code and byte-identity against the Tier 1 baseline is expected BY
CONSTRUCTION. THIS PACKET MEASURES THAT RATHER THAN ASSUMING IT.
  IDENTICAL  -> Task 160 confirmed behaviour-neutral by measurement. A binary compiled on
                2026-09-06 from 2026-09-06 source reproduced a baseline measured on a
                binary compiled 2026-08-30, which closes the EA lineage hole as a side
                effect.
  DIVERGENT  -> BLOCKED-FOR-COUNCIL. Do not diagnose it, do not attribute it, and DO NOT
                REVERT ANYTHING. Council will issue a revert-recompile-rerun against
                02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\SRJ_FlowNexus_EA.mq5,
                whose digest 0f1f44cb..52331322 makes the revert provably exact.
THE EXPERIMENT IS SINGLE-VARIABLE. SRJ_FlowLogic.ex5 is unchanged at 226444 bytes /
09/05/2026 05:39 PM and is the same indicator binary the baseline ran against. Exactly one
binary moved.

--- STAGE 1 - pre-run stasis, sixteen files ---

certutil -hashfile "<literal path>" SHA256 on each of:
DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5
DF\MQL5\Indicators\SRJ_FlowLogic.mq5
DF\MQL5\Include\SRJ\SRJ_Alerts.mqh
DF\MQL5\Include\SRJ\SRJ_BiasEngine.mqh
DF\MQL5\Include\SRJ\SRJ_Draw.mqh
DF\MQL5\Include\SRJ\SRJ_Fractals.mqh
DF\MQL5\Include\SRJ\SRJ_HTFEngine.mqh
DF\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
DF\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh
DF\MQL5\Include\SRJ\SRJ_Panels.mqh
DF\MQL5\Include\SRJ\SRJ_SeedFormat.mqh
DF\MQL5\Include\SRJ\SRJ_Sessions.mqh
DF\MQL5\Include\SRJ\SRJ_State.mqh
DF\MQL5\Include\SRJ\SRJ_Text.mqh
DF\MQL5\Include\SRJ\SRJ_TickCore.mqh
DF\MQL5\Include\SRJ\SRJ_Types.mqh

TARGETS COME FROM TWO REPORTS AND THE SPLIT IS DELIBERATE:
  SRJ_FlowNexus_EA.mq5 -> the digest at STAGE 5d of 06_HANDOFFS\BUILDER_RESULT_160-R2.md.
    Expected 93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced.
  the other fifteen    -> parsed from the STAGE 1 SECTION ONLY of 06_HANDOFFS\
    BUILDER_RESULT_160-PreL.md. Scope the parse to that section; a pattern applied to the
    whole file over-matches. THAT REPORT'S OWN EA ROW IS 0f1f44cb.. AND MUST NOT BE USED.
Case-insensitive hex; a case difference is NEVER a MISMATCH. ALL SIXTEEN MATCH REQUIRED.
Any MISMATCH: STOP, report BLOCKED, run nothing. An EA mismatch means something touched
the file after Task 160 and this packet's premise is void.

Also report the EA's byte size and integer line count. Expected 191970 and 3850. A
difference here is a STOP.

Record both artifact FILE LINES, before, RECORD ONLY, NEVER GATED:
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"
Expected 118130 / 09/06/2026 06:42 PM and 226444 / 09/05/2026 05:39 PM. FILE LINES only;
the bytes-free line is disk state and is discarded. Recorded for exactly one purpose: to
show nothing recompiled between authorization and run.

--- STAGE 2 - the baseline, read from disk ---

2a  From 06_HANDOFFS\BUILDER_RESULT_155-REG.md, report VERBATIM the harness run
    configuration - symbol, timeframe, model, date range, deposit, leverage, and every EA
    input name with its value. Expected, and confirm or correct it: "EURUSD | M5 |
    2026.08.14 - 2026.08.22 | every tick based on real ticks | 10000 JPY | 1:100 |
    SRJ_FlowNexus_EA | InpDebugLog=true | InpMode=0 MODE_ALERT_ONLY | optimisation OFF |
    visual mode OFF", eleven items, two input values.
    IF THIS CANNOT BE LOCATED: STOP. Nothing else in this packet is meaningful without it.
    DO NOT substitute a value from any handoff. DO NOT reconstruct a configuration. DO
    NOT infer an input's value from its name.
2b  From the same report, the eleven gate rows, quoted as they appear.
2c  From the same report, the signal line verbatim from [SRJ-EA] onward, and the P8a
    fingerprint integer and the P9 bars= figure.
2d  THE BASELINE RAW LOG. Confirm that D:\Videos\Task 155REG Full Logs.txt exists and
    report its byte size and integer line count. Expected 1005333 bytes and 6577 lines. A
    difference is RECORDED, NOT A STOP, but say so plainly and report both figures - the
    baseline log is the count instrument and a moved log must be visible.
    THE RAW LOG IS NOT RELAYED. Its path, size and line count are its provenance.
2e  BUILD THE BASELINE TAG TABLE from that raw log, by the derivation defined at STAGE 4a.
    Report: the number of distinct tag keys, the total number of lines matched, and the
    UNTAGGED count. DO NOT PASTE THE TABLE. It is an intermediate.

--- STAGE 3 - one Tier 1 harness run ---

Run the harness using EXACTLY the configuration reported at 2a. Report verbatim the
configuration you used and state that it is character-identical to 2a, or name every
difference field by field. A CONFIGURATION DIFFERENCE IS A STOP, not a caveat: the
comparison at STAGE 4 is meaningless if the inputs moved.

Write the raw log to disk.
3a  the new raw log's absolute path, byte size and integer line count. NOT RELAYED.
3b  P8: the journal line containing "generating based on real ticks", verbatim. If absent:
    STOP.
3c  P8a: the SRJ XOB-PROMOCENSUS fingerprint as an integer. 372 IS REAL TICKS. 607 IS
    GENERATED AND VOIDS THE RUN - if 607, STOP.
3d  P8b: the SRJ BUILD line, verbatim. THIS IS EXPECTED TO BE NEW - the baseline report
    carries none, and Task 160 recompiled the EA. Report it as a new record, not as a
    difference.
3e  P9: the BIASCENSUS_FINAL bars= figure, beside the baseline's from 2c.

--- STAGE 4 - compare, and the tag table is the primary instrument ---

4a  THE TAG KEY DERIVATION. Apply it IDENTICALLY to the baseline log and the new log. The
    same command, the same parameters, twice.
      consider only lines containing the literal [SRJ
      from each such line, discard everything up to and including the LAST ] character
      from the remainder, take the FIRST whitespace-delimited token
      if that token consists solely of characters A-Z, 0-9 and underscore AND is 4 or
        more characters long, it is that line's TAG KEY
      otherwise that line's TAG KEY is the literal UNTAGGED
      build a frequency table of TAG KEY over the whole file
    Report the command once. Report for each log: distinct key count, total lines matched,
    UNTAGGED count.
    COUNCIL DOES NOT SUPPLY THE TAG VOCABULARY AND DOES NOT NEED IT. The keys are output.
4b  THE DIFFERENCE SET. Compare the two frequency tables. Report ONLY:
      keys whose counts DIFFER, as key | baseline | observed | delta
      keys present in the baseline and ABSENT from the new log
      keys present in the new log and ABSENT from the baseline
    Then one line: "N of M keys count-identical".
    AN EMPTY DIFFERENCE SET IS THE GATE. Do not paste agreeing rows.
4c  Total matched-line counts and total file line counts, baseline beside observed, and
    IDENTICAL or DIFFERENT for each.
4d  THE ELEVEN GATE ROWS. For each row from 2b, derive the observed figure from the new
    log and report baseline beside observed, IDENTICAL or DIFFERENT. Expand only the
    DIFFERENT ones, with the raw derivation.
    IF THE 155-REG REPORT DOES NOT RECORD HOW A ROW WAS DERIVED, report that row as
    NOT DERIVABLE, name it, AND CONTINUE. Do not guess a derivation. Do not stop. The tag
    table at 4b is the primary instrument and it does not depend on this item.
4e  THE SIGNAL LINE. Derive the new log's signal line - the line containing the literal
    ALERT SRJ SIGNAL - and report it beside the baseline's from 2c, IDENTICAL or
    DIFFERENT from [SRJ-EA] onward. If DIFFERENT, paste both in full and name every field
    that moved. Report the count of such lines in each log.
    SL 1.15870 IS THE ONLY STOP IN THE RECORD. If it moved, say so as a field difference
    and do not comment further.
4f  ONE LINE, MECHANICAL: BEHAVIOURALLY IDENTICAL | DIVERGENT AT N POINTS.
    N is the size of 4b's difference set plus the count of DIFFERENT rows at 4c, 4d and
    4e. A NOT DERIVABLE row is not a divergence and is not counted.
    Do not diagnose. Do not attribute. Do not speculate about a cause. Do not revert.

--- STAGE 5 - post-run stasis ---

Re-hash all sixteen source files. ALL SIXTEEN MUST BE EQUAL to STAGE 1 - a harness run
writes no source. Any change: STOP, report BLOCKED.
Record both artifact FILE LINES, after. BOTH MUST BE UNCHANGED from STAGE 1. A moved .ex5
means a compile occurred inside a packet that does not authorize one: report BLOCKED.

--- STAGE 6 - persist ---

06_HANDOFFS\BUILDER_RESULT_160-REG-R2.md. Report the resolved absolute path once, then a
post-write verification read: byte size and integer line count.

--- REPORT FORMAT ---

TASK 160-REG-R2: COMPLETED | BLOCKED | PARTIAL
Authorization consumed: 160REG-A2
Production files modified: NONE      Source files written: ZERO
Compile: NOT PERFORMED
Chart attach: NOT PERFORMED   Orders placed: NONE   Deletes: ZERO
P17 attestation: every path used was the literal path stated in this packet; no filename
  search, glob, -Recurse, wildcard or Navigator selection was used for any of the sixteen
  files or either log. Declare any deviation even where its result agreed.
P10 attestation: no compile was performed.
Report channel: the resolved absolute path of ROOT as defined in this packet
Commands that failed: <verbatim, with raw error text, or "none">
Splits declared: <or "none">   Truncations: <or "none">
Items reported NOT DERIVABLE: <named, or "none">
STAGE 1  sixteen hashes one row each, MATCH | MISMATCH, and which report each target came
         from; EA byte size and line count; two artifact FILE LINES, before
STAGE 2  2a configuration verbatim; 2b eleven rows; 2c signal line, P8a, P9; 2d baseline
         log path, size, line count; 2e baseline table's three figures
STAGE 3  configuration used and its character-identity statement; 3a-3e
STAGE 4  4a the derivation command once plus three figures per log; 4b THE DIFFERENCE SET
         ONLY plus the aggregate line; 4c two comparisons; 4d differences expanded and
         NOT DERIVABLE rows named; 4e the signal comparison; 4f one line
STAGE 5  sixteen EQUAL | CHANGED; two artifact FILE LINES, after
STAGE 6  resolved report path, byte size, integer line count

TASK 160-REG-R2 VERDICT, five lines, mechanical only:
  provenance: P8 present, P8a <integer>, P9 <figure>, P8b <verbatim>
  configuration: CHARACTER-IDENTICAL TO BASELINE | DIFFERS AT N FIELDS
  tag tables: N of M keys count-identical, difference set size N
  behaviour vs Task 155REG: IDENTICAL | DIVERGENT AT N POINTS
  tree: sixteen EQUAL, both artifacts UNCHANGED | BLOCKED

No diagnosis. No hypothesis. No attribution of any divergence. No revert. Do not compile.
Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results. Never infer
a missing fact. Never choose among ambiguous objects. BLOCKED-FOR-COUNCIL rather than a
guess.
```

---

---

## §21 Amendment A to Revision 63 — issued after 160-REG-R2 returned

**This amendment is read as part of Revision 63.** Revision 64 will absorb it at the next
consolidation; until then, where §21 conflicts with an earlier section of this document,
**§21 governs** and the conflict is named below.

### 21.1 Open item 50 is CLOSED. Task 160 is behaviour-neutral by measurement.

`160-REG-R2` returned COMPLETED. **§14's item 50 now reads CLOSED**, and §5's `160-REG-R2`
row now reads **COMPLETED, ACCEPTED, CLOSED**. `160-CAL` is **WITHDRAWN** and `160CAL-A1`
now never will exist. `160REG-A2` is **CONSUMED**. §4's authorization state carries **no
outstanding token**.

43 of 43 diagnostic tag keys count-identical, difference set size 0
matched lines 5992 = 5992 IDENTICAL
bars= 1728 = 1728 IDENTICAL
signal line IDENTICAL from [SRJ-EA] onward, SL 1.15870 unmoved
seven derivable gate rows IDENTICAL, four reported NOT DERIVABLE and named
P8 present, P8a 372 real ticks, sixteen digests EQUAL before and after

**The verdict line's "DIVERGENT AT 1 POINT" is not an EA behaviour result.** The single
DIFFERENT row was 4c's total-file-line count, and all 23 differing lines are Tester- and
agent-channel bookkeeping — memory figures, initialisation-data size, tick-preprocessing
timings, the log filename, the code-variant line, the `bytes loaded` banner, and four
Tester bookends the baseline capture did not uniformly include. **None contains `[SRJ`.**
Per R-153 that row is **DEMOTED TO RECORD-ONLY** and the matched-line count is the
file-level instrument. **Behavioural divergence: zero points.**

**Recorded, not gated, and the second is harder than the gate asked for:**

X64 versus AVX2. The tester loaded the EA as X64 where the baseline journal records
AVX2 - a different compiled code path through the same .ex5 - and produced identical
counts and an identical stop price. A floating-point instruction-set difference moved
no figure. Not designed for, and stronger than the result requested.
The banner-to-disk offset is now THREE observations: +32, +32, +33. Still no gate.
The SRJ CQD timing line is a BLIND SPOT IN THE 4a TAG KEY: it prints "SRJ CQD" with no
bracket, so the derivation misses it. The one such differing line differs only in
milliseconds while 1169717 ticks and resets=21 agree. Filed as a subject.

### 21.2 §3.3 and §16 are CORRECTED. P8b is the INDICATOR's build line, not the EA's.

`SRJ BUILD 2026.09.05 17:39:20` matches `SRJ_FlowLogic.ex5`'s file timestamp to the
second. **The EA has no in-journal build-provenance instrument.** Every sentence in §3.3
and §16 calling P8b the *run-binary provenance instrument* is wrong and is withdrawn as
to the EA; P8b remains a valid **indicator** build instrument and a valid run-to-run
discriminator.

**EA run-binary identity is established instead by a chain the packet already built:** the
`.ex5` file line measured at STAGE 1 and again at STAGE 5 and unchanged, inside a packet
that authorized no compile, with the tester naming the same literal path that was hashed.
That is precisely the one purpose §3.3 admits `.ex5` size and timestamp for, so **R-87
closes on that chain** and not on a banner comparison, which §17 still forbids.

**Filed as a subject for the scribe:** give the EA its own `SRJ BUILD` line, and file it
against **Task 161**, which is the next packet that edits the EA anyway.

### 21.3 P19 is added, and the repository is now governed

| # | Rule |
|---|---|
| **P19** | **No binary, log, or terminal-state file enters the git index, and no git history is ever rewritten.** A restored `.ex5` carries a checkout timestamp that is not its compile time. Enforcement is `REPO\.gitignore`, which makes **P18 mechanical rather than a discipline**: with `*.ex5` ignored, the five `.ex5` under `02_TASK_CHECKPOINTS` and `07_ARCHIVE` cannot enter a commit even by accident. The repository is a **snapshot store, never a source and never an edit target** — P14 governs it as it governs `02_TASK_CHECKPOINTS`. A **push is an operator decision** and is made by nobody else. |

**Repository state of record.** Root `DF\MQL5`, above `ROOT`, and **not re-rooted** —
R-156. `DF\config` is **not in the repository**, nineteen first-level directories
enumerated. Branch `main`, remote `origin` at `forge.mql5.io`. The sixteen canonical
sources are **tracked at root-relative paths** — `Experts\`, `Indicators\`,
`Include\SRJ\` — and the literal `MQL5\...` prefix §20.1 used **resolves to nothing`,
which the builder caught rather than silently adjusting.

**Every accepted task now ends with a snapshot,** invoked as
`.srj\tools\srj_snapshot.ps1 -TaskId <id> -Verdict <verdict> -MessageFile <path>`. It
stages an explicit allow-list, refuses to commit an excluded addition, and never pushes.
**It is not a gate** — `git show --stat HEAD` verifies it independently, which is why
R-158 admits it where the census tool was refused.

**Two anomalies recorded, neither touched:** the nested duplicate
`MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\TASK_155.md`, committed as found with disposition
deferred; and a root-level `06_HANDOFFS` distinct from the one under
`SRJ_FlowNexus_Local`.

### 21.4 §16's stasis series is extended

`160-REG-R2` STAGE 1 and STAGE 5 each returned sixteen EQUAL. **POST-155 SERIES LENGTH IS
NOW 11**, with the one authorized break at 160-R2 STAGE 7 unchanged. The pre-155 caveat
at §16 — continuous EA source stasis across 2026-08-28 → 08-30 — **is now CLOSED as R-153
provides**: a binary compiled 2026-09-06 from 2026-09-06 source reproduced a baseline
measured on a binary compiled 2026-08-30.

### 21.5 §11, §12 and §19 are superseded on the next action

**Nothing is blocking.** No token is outstanding. No operator answer is required on
strategy; one **disclosure** question is open and it is not a blocker — whether commits
are pushed to `forge.mql5.io`, kept local, or pushed to a private remote the operator
controls. Council does not decide it (R-159).

**Next: `161-PreA`, a source-only Form D.** No authorization required, none issued. It
establishes Task 161's adapter surface at **current line numbers rather than §3.6's
re-based locators**, which are admissible for location only and are not anchors. Its body
is §21.6. After it, Task 161 itself — Milestone 1, the per-field load/store log, and the
first measurement capable of separating the two readings of the 08.18 09:25 contamination
instance.

`155-RT-A` is unchanged: body at Revision 62 §20.2, deadline before Task 163, not before
Task 161.

### 21.6 `161-PreA` — the packet body is issued separately

The body is delivered as a relay paste alongside this amendment and is assembled into
`01_TASKS\PACKET_161-PreA.md` by the standard directive. It is not restated here.

### 21.7 Counters and new subjects

Rulings: R-161
Defects: 181, unchanged - council mints none
Findings: EA-218 or higher, unchanged - council mints none

NEW SUBJECTS, numbers assigned by the scribe at archive time:
the 4c total-file-line row as a two-channel instrument, demoted to record-only -
council's SEVENTH pattern-shape slip of this arc
a path prefix stated relative to the wrong repository root - the EIGHTH
P8b misattributed to the EA when it is the indicator's build line
the EA's absence of any in-journal build-provenance instrument, and the SRJ BUILD line
to be added by Task 161
X64 versus AVX2 producing identical counts and an identical stop price
the SRJ CQD timing line's blind spot in the 4a tag key - no bracket, so no tag
the banner-to-disk offset, third observation, +33
two .ex5 already present in five git commits: a recorded history contamination, never
cited as lineage, never scrubbed
the nested duplicate MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\TASK_155.md
the root-level 06_HANDOFFS distinct from SRJ_FlowNexus_Local\06_HANDOFFS
whether HEAD's EA blob reproduces the revert-path digest - a second independent revert
path if it does

**END-OF-REVISION-63**