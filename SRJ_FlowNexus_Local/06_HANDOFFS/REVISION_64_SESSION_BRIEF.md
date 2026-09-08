# SRJ Flow Nexus — Revision 64 Session Brief
## Recovery document. Control state only. History by reference.

**This is not a consolidated handoff.** It is the fresh-session control brief. It carries
current state, the active queue, the next action, and an explicit list of what it cannot
verify. Every historical fact is referenced by path and section and is not restated.

**Operating mode:** alert-only. No execution. No live trading.
**Production edits authorized by this document:** NONE.
**Authorizations outstanding:** NONE.

---

## §0 What is VOID, and it is void by declaration rather than by inspection

```
ANY FILE NAMED REVISION_64_CONSOLIDATED_HANDOFF.md          VOID IF PRESENT ON DISK.
  A separate council session produced one or more Revision 64 drafts carrying
  CONTRADICTORY packet bodies, TWO DIFFERENT adapter payload counts (192 and 193), TWO
  DIFFERENT identifier sets (SrjWsDiff / g_ws161_changed against SrjWsCompare /
  g_ws161_changes), TWO DIFFERENT anchors, TWO DIFFERENT collision-census scopes (8 and
  13 entries) and unstable section numbering. It is NOT REPAIRED and NOT QUOTED. Mark it
  SUPERSEDED-VOID in place. NEVER DELETE.
ANY RULING NUMBERED R-216 OR HIGHER                          VOID.
  The ruling counter stands at R-215. Rulings R-1 through R-215 are the record.
01_TASKS\PACKET_161.md                                       ASSEMBLED, INCOMPLETE, VOID
  AS AN EXECUTABLE PACKET. Its assembly arithmetic held exactly - 1008 lines = 764 + 244,
  39495 bytes = 27808 + 11687, prefix digest EQUAL - and its BODY IS TRUNCATED. The
  adapter block is 99 lines where OP3 declares 118; LoadWorkingSet, StoreWorkingSet and
  SrjWs161Census are CALLED BY OP1/OP2 AND DEFINED NOWHERE. Its OP4 says "six lines" and
  delivers seven. RETAINED ON DISK, NEVER EXECUTED. Council reissues the packet whole.
161-A1                                                       WITHDRAWN, NEVER INVOKED.
  Assembly is not invocation and the directive forbade execution, so no token consumed.
  R-215 is superseded on scope. New tokens are issued only after the payload is frozen.
```

**The root cause, recorded because it governs how the next packet is delivered.** R-202
exempted literal payload from R-162's 60-line instruction cap. It did not exempt it from
R-109: a relay paste is issued complete or not at all. A 118-line payload delivered inside
a packet body truncated at the fence. **A literal payload longer than about 60 lines is
delivered as its own artifact, in its own paste, and the packet references it by path.**

---

## §1 Authority, and what a fresh session does not hold

| Layer | Where | Status |
|---|---|---|
| Control state, queue, next action, prohibitions affecting it | **this brief** | authoritative |
| Rulings R-96 → R-152 in compact text | `REVISION_63_CONSOLIDATED_HANDOFF.md` §6.3 | binding, on disk |
| Rulings R-153 → R-161 | same file, §21 (Amendment A) | binding **if applied** — see §7 item 3 |
| Rulings R-162 → R-215 | **NOT ON DISK.** Their substance that bears on the next action is restated in §4 and §5 of this brief; the rest is in the conversation that produced them and is not recoverable | see §7 item 5 |
| The twelve contracts as declared, both state member sets, transition edges, terminator table, ordinal sites | `REVISION_63…` §10 | binding, on disk |
| Contract source text, 648 lines | `SRJ_FlowNexus_EA.mq5` lines 166–813 | binding, in source |
| `155-RT-A`'s packet body | `REVISION_62_CONSOLIDATED_HANDOFF.md` §20.2 | binding, on disk, retained for this purpose only |
| Findings EA-147 → EA-179, ownership table, milestones, scenarios, must-not-conflate list | `REVISION_60…` §§7, 9, 11, 13, 15, 16 | binding, archive |
| Census rule set, 26 entries | `03_SPECIFICATIONS\CensusRules\CENSUS_RULE_BLOCK_THROUGH_A26.md` — 764 lines, 27,808 bytes, UTF-8 no BOM, LF-only, SHA-256 `f401d685a9761dd0d0c50bba3050b0753b710d5accee9d83f6d7511ee9447e8c` | binding, **prepended mechanically, never relayed** |
| Fifteen unchanged canonical digests | `BUILDER_RESULT_160-PreL.md` **STAGE 1 section only** | binding — scope the parse to that section |
| Most recent whole-tree measurement, sixteen digests | `BUILDER_RESULT_160-REG-R2.md` **STAGE 1** | binding, preferred target source |
| Tier 1 baseline: configuration, eleven gate rows, signal line, P8/P8a/P9 | `BUILDER_RESULT_155-REG.md` | binding, on disk |
| Tier 1 count instrument of record | `D:\Videos\Task 155REG Full Logs.txt` — 1,005,333 bytes, 6,577 lines | binding, on disk, **never relayed** |
| Defects 87 → 181, findings EA-180 → EA-218, rulings R-1 → R-41 | `99_NOTES\DefectLedger.txt` (839 lines) and the 60.1–60.7 builder reports | council does not hold the text |

**Council reads no file, derives no figure it was not given, and mints no EA or defect
number.** Counters: rulings **R-215**, defects **181**, findings **EA-218 or higher**.

---

## §2 Canonical state

```
SRJ_FlowNexus_EA.mq5
  93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced
  191970 bytes, 3850 lines, UTF-8 WITH BOM, 3850 CRLF, 0 lone LF, 0 lone CR
  Edited by Task 160. The other FIFTEEN are UNCHANGED.
  Whole tree 12,087 lines across sixteen files. Comparison is CASE-INSENSITIVE hex.

DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = DF\MQL5\SRJ_FlowNexus_Local          <- every relative path resolves here
REPO = DF\MQL5                              <- git root, ABOVE ROOT, not re-rooted
EA   = DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5

Compile artifacts, COMPILE-RUN EVIDENCE ONLY, no gate reads either:
  SRJ_FlowNexus_EA.ex5   118130   2026-09-06 18:42   compiled by Task 160
  SRJ_FlowLogic.ex5      226444   2026-09-05 17:39:34   UNCHANGED

Last accepted production task:  TASK 160 - 648 lines of type-only declarations at EA
  166-813, zero existing lines modified, compile 0/0, collision census 136 of 136 zero
  hits, zero parentheses in comment-stripped text.
Last measurement:  160-REG-R2 COMPLETED AND ACCEPTED. 43 of 43 tag keys count-identical,
  matched lines 5992=5992, bars=1728, signal line IDENTICAL including SL 1.15870, sixteen
  digests EQUAL before and after. Open item 50 CLOSED. 160-CAL WITHDRAWN.
Git snapshot:  b2258470ac61181071393e12af4bf35300fcd984 on main and on backup/main at
  github.com/sirooj/srj-flow-nexus, PRIVATE, visually verified. Origin at forge.mql5.io
  unchanged and never pushed to. Working tree pending count was ZERO at snapshot.
  Snapshot convention, two commands at the end of each accepted task:
    git add -- .gitignore Experts/SRJ_FlowNexus_EA.mq5 Indicators/SRJ_FlowLogic.mq5 Include/SRJ SRJ_FlowNexus_Local
    git commit -m "<TaskId>: <verdict>" && git push backup main
```

### Must not be touched

```
02_TASK_CHECKPOINTS\Rev062_Task160_Contracts\BEFORE\SRJ_FlowNexus_EA.mq5
  digest 0f1f44cb..52331322, the frozen revert path. NEVER moved, edited or deleted.
06_HANDOFFS\COUNCIL_RULING_TASK160_CONTRACTS.md   CONSUMED as an extraction source.
D:\Videos\Task 135 Full Logs.txt                  RETIRED as a gate target.
Any .ex5 under 02_TASK_CHECKPOINTS               P18. None exists; none is created.
Git history                                       NEVER rewritten. Two .ex5 sit in five
  pre-Rev063 commits: a recorded contamination, never cited as lineage, never scrubbed.
```

---

## §3 Task state — changes and current entries only

`REVISION_63…` §5 carries the full table. Deltas:

| Task | Form | Status |
|---|---|---|
| **160** | B | **COMPLETED, ACCEPTED, CLOSED.** The migration's first production edit |
| **160-REG-R2** | OBS | **COMPLETED, ACCEPTED, CLOSED.** Behaviour-neutral by measurement |
| 160-CAL | — | **WITHDRAWN.** `160CAL-A1` never existed and never will |
| **161-PreA** | D | **WITHDRAWN AS ISSUED.** Discharged by free reads `161-FR1` through `161-FR8`, 32 commands. `01_TASKS\PACKET_161-PreA.md` retained on disk, unexecuted |
| **161** | **B** | **NOT ISSUED. Payload not frozen.** See §5 |
| 161-REG | OBS | NOT DRAFTED. Separate packet, separate token, compares against the 155-REG baseline exactly as 160-REG-R2 did |
| **155-RT-A** | D | **QUEUED.** Body at `REVISION_62…` §20.2. No authorization required. Deadline before Task 163, **not** before Task 161 |
| 162 … 166, 141, 142, 129, 130, 131, 154, 156 | — | unchanged from `REVISION_63…` §5 and §13.3 |

**Nothing is blocking.** No token outstanding, no operator question outstanding on
strategy. Two small Task 166 questions are recorded and block nothing.

---

## §4 The measured surface for Task 161 — the only technical rationale this brief carries

Every figure below was derived by command during free reads `161-FR1` … `161-FR8`. Line
numbers are **current-file** and are admissible for **locating a region**, never as
anchors. P12 is unweakened: the packet re-reads and re-pastes its own anchors.

```
THE WORKING SET IS FIFTEEN FIELDS AND ResetSequence DECLARES IT.
  declarations   EA 815-838
  clears         EA 1740-1754, inside ResetSequence 1738
  MEMBERSHIP RULE: the fields ResetSequence clears. A field added there joins the set.
  g_state g_dir g_regime g_sessionAtEntry g_anchorLine g_anchorPrice g_anchorBarTime
  g_divLatch g_touchSeen g_touchBarHi g_touchBarLo g_zoneHi g_zoneLo g_alertedArmed
  g_alertedSignal

DELIBERATELY OUTSIDE IT, each exclusion load-bearing:
  831-834  four session-used latches. SESSION-LEVEL, CROSS-CANDIDATE, per-day, read and
           written only by SessionAlreadyUsed 1051 and MarkSessionUsed 1061. Clearing
           them per candidate breaks B5's mark-once rule.
  845-851  seven g_shadow* fields. GoAbort writes four of them at 1772-1775 BEFORE
           ResetSequence at 1783; a shadow record outlives its sequence by design.
  855-906  40 diagnostic accumulators and three indicator handles. Run-lifetime.

THE CASCADE
  ResetSequence      1738-1755, four call sites: 1783 (inside GoAbort), 2xxx IDLE block,
                     3616, 3768 (OnInit - THE ADAPTER MUST NOT STORE THERE)
  GoAbort            1757-, writes g_state=ST_ABORT at 1781 then calls ResetSequence 1783
  EvaluateClosedBar  2011 to at most 3704. ONE DEFINITION, ONE CALL SITE at 3848.
                     3704 is next-definition and indentation corroborated, NOT
                     brace-counted, and is NOT AN ANCHOR.
  OnTick             3842-3849 IN FULL: static bar-time guard, one assignment, one call.
                     Nothing else runs on a tick, so a wrapper at 3848 is a COMPLETE
                     bracket by measurement.
  OnDeinit           3820-3839. Touches only run-lifetime accumulators and handles.

WRITES TO THE WORKING SET, MAP COMPLETE
  nine g_state writes  1740 1781 2883 2896 2908 3386 3525 3614 3700
  31 `=` occurrences on 27 lines, plus ONE REFERENCE WRITE: g_anchorPrice at 2879 via
    ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift). A write census by
    `identifier =` CANNOT SEE A REFERENCE PARAMETER and every write map built this arc
    carries that hole. No gate rests on one.
  g_anchorPrice is WRITTEN AND NEVER READ. AnchorStr 966-967 returns
    g_lineCode[g_anchorLine], not the price. It stays in the working set - a write-only
    field is still a member - and Task 162's edge C1 gives it its first consumer.

EXITS
  21 returns in EvaluateClosedBar: 2075 2389 2440 2489 2582 2594 2857 2872 2875 2891 2893
    2904 2906 3414 3542 3552 3566 3574 3617 3624 3641
  13 are abort exits. ALL THIRTEEN LIVE GoAbort CALLS RETURN. 2893 and 2906 are labelled
    `candidate RETAINED` in their own print text. 3617 is the signal exit, preceded by
    ResetSequence at 3616.
  GoAbort clears the fifteen globals BEFORE control returns to 3848, so a call-site store
    copies a CLEARED working set on every abort. Correct only if the rejection was
    recorded on the candidate first - edge C6 - and GoAbort records it nowhere but a log
    line. Its abort code is a PARAMETER, invisible at OnTick, so rejectionReason is NOT
    DERIVABLE at the wrapper and stays UNKNOWN under P15.
  ST_ABORT at 1781 and ST_SIGNAL at 3614 and 3700 are WRITTEN AND IMMEDIATELY ERASED by
    ResetSequence. NO EVALUATION POINT CAN OBSERVE EITHER, so the `!= ST_ABORT` clause at
    2375, 2772 and 2820 IS DEAD. Task 161 touches no comparison; Task 162 or 164 DROPS
    that clause rather than translating it.
  The "deliberately does not return" comment at 2756-2761 describes the POIREPLACE block
    at 2772-2795, whose GoAbort was REMOVED BY TASK 91. Stale documentation of a removed
    call. The concurrency hazard it implied DOES NOT EXIST in the current build.

THE MAPPING, 7 / 7 / 1
  SCandidate 661-708:  dir 664, poiAnchorLine 665, poiAnchorPrice 666 + hasPoiAnchorPrice
    667, poiAnchorBarTime 668, regimeAtAdmission 672, tradingWindowAtAdmission 673,
    state 674, divergenceVerdict 682 (ENUM_SRJ_TRI)
  SHypothesis 709-755: state 715, zoneHi 716, zoneLo 717, hasZone 718, touchLatched 719,
    touchBarHigh 722, touchBarLow 723, alertedArmed 742, alertedSignal 743
  g_state MAPS TO BOTH. One ENUM_SRJ_STATE variable carries candidate admission progress
    (ST_IDLE..ST_S3_ZONE_WAIT) and hypothesis post-binding progress (ST_S4_ARMED..ST_S5_*).
    THAT IS THE SINGLETON DEFECT STATED AS A SINGLE FIELD, and it is why §10.6's rows at
    2436 and 2585 read "spans -> TWO tests".
  g_divLatch CANNOT ROUND-TRIP. bool -> ENUM_SRJ_TRI is a widening the build cannot fill:
    false conflates NOT YET EVALUATED with EVALUATED AND NOT DIVERGED. Store maps false
    -> UNKNOWN; the reverse map is LOSSY BY CONSTRUCTION and is recorded as lossy.
  SStructuralBundle 549-566 DOES NOT CARRY THE ZONE. The zone is on the hypothesis, and
    the comment at 690-695 states the reason: it is supplied explicitly, never read from a
    global.
  NO SCandidate AND NO SHypothesis IS INSTANTIATED BY TASK 161. Contract 9's comment at
    687 declares bundle MANDATORY, and the fifteen globals cannot construct one. An
    unpopulated mandatory field is a zero standing for absence, which P15 and R-112 forbid.

THE ENUM APPEND
  ENUM_SRJ_CANDIDATE_STATE 278-287. Its terminator SHARES the last member's line:
    `    CANDIDATE_EXPIRED        = 8 };`
  So appending CANDIDATE_ZONE_WAIT = 9 MODIFIES ONE EXISTING LINE. Every existing member
  name and value survives byte for byte; a comma and a brace move.
  THE NAME IS DERIVED, NOT INVENTED: prefix from the eight declared members, suffix from
  ST_S3_ZONE_WAIT already in source at EA line 138. ZONE_WAIT, OFFER and CANDIDATE_ return
  COUNT=0 across all fourteen non-EA files, so the tree does not name the concept.
  ST_S3_ZONE_WAIT IS A LIVE GATE - written 2908, compared 2436 and 2912 - and is carried,
  not retired.
  ENUM_SRJ_HYPOTHESIS_STATE 316-329 has the same shape and IS NOT TOUCHED.

INSTRUMENT SEMANTICS, and this is what makes the edit behaviour-neutral
  LoadWorkingSet COMPARES AND DOES NOT ASSIGN. At capacity 1 the globals ARE the medium
  and nothing clears them between bars, so an assignment would be a no-op when the values
  agree and would MASK the divergence the instrument exists to find when they do not.
  THE GATE THIS CREATES: store at bar N, compare at bar N+1. Zero mismatches over 1728
  bars means the working set is CLOSED - nothing outside the fifteen fields carries
  sequence state across bars.
  SCOPE STATED HONESTLY: at capacity 1 there is no OTHER hypothesis, so Task 161 delivers
  THE INSTRUMENT AND THE CLOSURE PROOF, NOT THE ISOLATION PROOF. Rev 60 §13.2's pass
  condition needs capacity 2 and is P14-gated, arriving with Task 162. MILESTONE 1 IS NOT
  CLAIMED PASSED ON TASK 161'S RETURN.

ZERO HELPER EDITS AND ZERO RETURN-SITE EDITS, BOTH BY CONSTRUCTION. 81 lines outside the
  cascade touch working-set fields and after the declarations, the clears and 1781 the
  remainder are READS - log formatters 967-1015, FRESHCOUNT print 1256, zone guard
  1277-1279, anchor-rank region 1353-1406, SL-reference region 1561-1711,
  UpdateDivergenceLatch 1724, zone helpers 1863-1994. The fifteen globals stay the working
  medium, so every read keeps working untouched. IF A DRAFT EVER REQUIRES A HELPER EDIT,
  THAT IS THE SIGNAL THE DESIGN DRIFTED.
```

---

## §5 The next action, exactly

**Step 1 — freeze the payload, as its own artifact.** Council authors the adapter block
complete and delivers it in one paste, whole, in a single fence. It is created as
`06_HANDOFFS\ADAPTER_161.txt` by operator paste — a whole-document transcription, which
R-97 assigns to the operator because a human paste cannot half-succeed. The IDE then
reports its **byte size and integer line count**, measured mechanically.

**No line count is stated by council before that measurement.** The numbers 118, 192 and
193 all appear in void or truncated drafts. **None of them is a fact.**

**Step 2 — split the edit, and the split is a recommendation with a stated reason.** The
external reviewer proposed it and council endorses it:

```
161-A   ONE INSERT: the adapter block, as a declaration-only region. Plus one compile.
        WHY IT IS SPLIT: an insert whose payload is read from a named file on disk cannot
        truncate in transit - R-109 permits a paste to instruct the IDE to read a body
        from a file, and that is not a placeholder. It also gives the compile a chance to
        reject the payload BEFORE any existing line is modified, which keeps the file one
        step from the frozen revert digest instead of two.
        NOTHING CALLS THE ADAPTER AFTER 161-A. The functions are defined and unreferenced.
161-B   THE WIRING: the three-line replacement at the EvaluateClosedBar call site, the
        two-line census insert in OnDeinit, and the enum append that modifies line 287.
        NOT DRAFTED. Drafted only after 161-A returns compile 0 errors.
```

**Step 3 — a collision census before either edit, and it does not exist yet.** Task 160
ran 136 of 136 zero hits. **No census has been run for the adapter's identifiers.** The
frozen set from the surviving payload half is:

```
SSrjWorkingSet   g_ws161   g_ws161_stores   g_ws161_loads   g_ws161_changes
g_ws161_mismatch   g_ws161_fieldMiss   SrjWsName   SrjWsCompare
LoadWorkingSet   StoreWorkingSet   SrjWs161Census
```

Twelve identifiers, and **the census is run against the final payload, not against this
list** — if the completed block introduces another name, that name is censused too.
`CANDIDATE_ZONE_WAIT` is separately covered: R-122 puts enum members in the collision set
and the fourteen-file search returned COUNT=0.

**Step 4 — authorization.** New tokens are issued only after the payload is frozen and the
census returns zero hits. `161-A1` is withdrawn. Nothing is authorized by this brief.

### Block conditions for any Task 161 packet, exhaustive

```
the STAGE 1 EA digest is not 93d3639c…3744eced
any anchor matches zero times or more than once
the post-write line-count arithmetic does not balance exactly, where the arithmetic is
  DERIVED FROM THE MEASURED PAYLOAD LENGTH and stated nowhere independently of it (R-141)
the compile reports one or more ERRORS - the gate is the ERROR COUNT, never the exit
  code, and the MetaMQL compiler returns non-zero on a clean build (P7, R-146)
a non-ASCII byte or a lone LF is introduced anywhere in the file
the collision census returns a non-zero hit on any new identifier
On any stop: report BLOCKED, write nothing further, REVERT NOTHING, delete nothing.
```

### Prohibitions that bear on the next action

```
P7   compile gate is the error count.        P10  never Compile All.
P12  no production edit from an architecture document. Every line number in this brief is
     for LOCATION. The packet pastes and verifies its own anchors.
P16  the EA is UTF-8 WITH BOM. The BOM is preserved. Every line council writes into a
     canonical file is PURE ASCII. Byte-preserving outside the edited region. CRLF.
P17  every source path is a LITERAL ABSOLUTE PATH. Not a glob, not a wildcard, not
     -Recurse, not a Navigator selection, AND NOT CONCATENATED OR BUILT FROM A VARIABLE.
     A path computed from a variable failed fourteen reads in one round.
P18  no .ex5 under 02_TASK_CHECKPOINTS.      P19  no binary, log or terminal-state file
     enters the git index; no history is ever rewritten.
R-122  an enum member set may be APPENDED to. AN ENUM MEMBER MAY NEVER BE RENAMED. No
     ordinal comparison may be built on any contract enum.
R-123  Task 161 touches no comparison. The eight ordinal sites are re-expressed in Task
     162 or 164.
Every packet body is AT MOST 60 INSTRUCTION LINES and AT MOST 4 STAGES (R-162). Literal
  payload is not counted (R-202) - AND A LITERAL PAYLOAD OVER ~60 LINES IS DELIVERED AS
  ITS OWN ARTIFACT, NOT INSIDE A PACKET BODY.
Every free-read command is ONE PHYSICAL LINE and EMITS A COUNT AND A TERMINATING SENTINEL,
  so an empty result is a visible zero (R-185).
The builder DUMPS RAW OUTPUT. COUNCIL CLASSIFIES. No composed table, no classification,
  no reconciliation against a council figure is asked of the builder (R-163).
```

---

## §6 Open items that affect sequencing

```
50   CLOSED. Task 160's insertion is behaviour-neutral by measurement.
4    the nearest branch and currentLegHasXOB. OPEN, Task 129, non-blocking.
12   CurrentTradingWindow's London bounds against g_defLondon. HALF-MEASURED: the EA half
     is four ET hour literals at 1027-1049, converted via TC_ZoneToServer and probed
     across dayOffset -1..+1. g_defLondon is outside the EA and unmeasured. NON-BLOCKING.
13   insertion-order chronology. RULED: state the bound, do not establish ordering.
24   does anything consume buffer index 34. Decided by 155-RT-A item 4b. MAY CLOSE FROM
     SOURCE ALONE - item 3g is half-answered.

TASK 162'S PREDECESSOR FORM D CARRIES FIVE ITEMS, none blocking anything ahead of it:
  the zone containment test's <= versus <, DECISIVE FOR THE RECORD'S ONLY SIGNAL
  obValid's distribution across the 161 SL_REF lines. HYPOTHESIS, UNCONFIRMED, NO NUMBER
    BUILT ON IT
  Scenario H's only Tier 2 fixture, as a PRE-RULE measurement before A1's strictly-after
    rule removes it
  whether the three promotion sites enforce valid-and-activated before promoting
  ABORT_NO_TP_TARGET FIRES AT TWO SITES, 2594 and 3542. §10.5 attaches T5a on 3542 alone.
    If 2594 is pre-binding, T5a attaches at two lifecycle points and §10.5 is incomplete.
  AND: the zone is written in TWO regions - 3382-3383 beside ST_S4_ARMED at 3386, and
    AGAIN at 3451-3452 with g_touchSeen=false at 3459. §13.1's measured contamination
    instance - a pre-binding evaluation at 08.18 09:25 reading zone globals an arming
    event set at 09:20 - must be ATTRIBUTED TO OR EXCLUDED FROM the second region. It is
    also the region Task 162's SL 1.15870 single-value gate protects.

FILED TO ITEM 19'S PRINT PACKET:
  SWINGDUMP at EA 1461/1463 reads g_hFlow RAW, no offset, d = barShift..barShift+9, while
  the logic it documents reads through ReadFlow which applies FLOW_SHIFT_OFFSET. The Task
  20 comment at 1087-1091 measures shift 1 as PROVISIONAL at a 52% retraction rate and
  shift 2 as settled. SO SWINGDUMP PRINTS PROVISIONAL VALUES WHILE ITS SUBJECT READS
  SETTLED ONES. Any reasoning taken from SWINGDUMP output is one slot off its subject.
  This makes §13.4's four site=S5 src= values materially more important to read.
  ALSO UNCLASSIFIED: line 2090's FL_BUF_LTF_BIAS read and whether it applies the offset by
  hand as 2128-2133 and 2213-2223 do. Not Task 161's surface.
  NO DEFECT IS ASSERTED. The ReadFlow discipline at 1098-1146 attaches to SEVEN buffers -
  26, 27, 29, 30, 31, 32, 33 - and none of the eleven raw g_hFlow reads touches any of
  them, so R-194 is DOWNGRADED and no violation is demonstrated.

SUBJECTS FILED, NUMBERS ASSIGNED BY THE SCRIBE AT ARCHIVE TIME, none blocking:
  the EA has NO in-journal build-provenance instrument - P8b is the INDICATOR's SRJ BUILD
    line, matching SRJ_FlowLogic.ex5's timestamp to the second. EA run-binary identity
    rests on the .ex5 file line measured before and after inside a packet authorizing no
    compile. Give the EA its own SRJ BUILD line, filed against the next task that edits it.
  the 4c total-file-line row as a two-channel instrument, DEMOTED to record-only
  X64 versus AVX2 producing identical counts and an identical stop price
  the SRJ CQD timing line's blind spot - it prints without a bracket, so no tag key
  the banner-to-disk offset, three observations, +32 +32 +33
  g_anchorPrice written and never read
  a 6-line comment block at 2756-2761 describing behaviour Task 91 removed
  *.log outside logs/ is not covered by the .gitignore; T155_COMPILE.log is committed and
    stays committed
  the damaged-comment set is at least EIGHT lines - EA 159, 1100, 1109, 1113, 1121, 2756,
    SRJ_State.mqh 94 and 188 - and the damage is GENERATIONAL, not random: Task 105-era
    comments are damaged while Task 123-era comments carry clean em-dashes. All comment
    text, all FILED NOT REPAIRED, NONE AN ANCHOR, and no packet has ever measured the set.
  the nested duplicate MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\TASK_155.md, committed as
    found, disposition deferred
```

---

## §7 What this brief CANNOT verify, and none of it may be treated as settled

```
1  THE ADAPTER PAYLOAD'S LINE COUNT IS UNKNOWN. 118 appears in a truncated draft; 192 and
   193 appear in void drafts. NEVER STATE ANY OF THEM. The count is measured from the
   frozen artifact and every arithmetic gate is derived from that measurement.
2  A TRUNCATED DRAFT'S OP4 SAID "six lines" AND DELIVERED SEVEN. Any replacement block's
   line count is measured from the block, never from its prose description.
3  WHETHER REVISION 63'S AMENDMENT A WAS APPLIED IS UNVERIFIED. Amendment A adds §21 -
   rulings R-153 through R-161, the P8b correction, P19 - and edits four regions of
   00_CURRENT_WORKING\CURRENT_STATE.txt. Its paste was issued and no return was recorded.
   VERIFY BEFORE CITING §21 OR ANY RULING R-153..R-161 FROM DISK.
4  WHETHER THE VOID SESSION WROTE ANY FILE IS UNVERIFIED. It may have created a
   REVISION_64 handoff, edited CURRENT_STATE.txt, or written other artifacts. §8's read
   establishes what is on disk. NOTHING IS DELETED - a void file is marked in place.
5  RULINGS R-162 THROUGH R-215 ARE NOT ON DISK. Their substance that bears on the next
   action is in §4 and §5 of this brief. The remainder is not recoverable and nothing
   queued depends on it. R-216 AND ABOVE ARE VOID.
6  NO COLLISION CENSUS EXISTS FOR THE ADAPTER'S IDENTIFIERS. Task 160's 136-of-136 zero
   hits covers the contract names only.
7  EvaluateClosedBar's CLOSING BRACE AT 3704 IS NEXT-DEFINITION AND INDENTATION
   CORROBORATED, NOT BRACE-COUNTED. Admissible for scoping a read. NOT AN ANCHOR.
8  THE EIGHT REFERENCE-TAKING FUNCTIONS - ReadBuf1 1079, ReadFlow 1148, DetectPoiRetest
   1169, ClassifyRegime 1207, CheckLtfAlign 1240, FindNearestSwing 1432,
   UpdateDivergenceLatch 1720, ReadQualifyingZone 1804 - WERE FOUND BY A PATTERN THAT
   CANNOT SEE A PARAMETER LIST WRAPPING TO A SECOND LINE. The set is not proven
   exhaustive and no gate rests on it.
9  §10.6'S EXPRESSIONS ARE ABBREVIATIONS. Measured at 2772: `g_state > ST_IDLE && g_state
   != ST_ABORT && g_anchorLine >= 0 && inWindow` against a table row reading
   `> ST_IDLE && != ST_ABORT`. TWO CONJUNCTS SHORT, one a working-set field in control
   flow. EVERY ORDINAL RE-EXPRESSION READS THE LINE, NEVER THE TABLE.
10 g_state's WRITE COUNT AS AN OCCURRENCE FIGURE. 73 was confirmed as a LINE count by
   Select-String, which emits one result per line. The occurrence figure of 73 is
   council's derivation - 65 stripped lines plus 8 lines carrying two occurrences - and
   the two landing on the same value is coincidence, not confirmation. It bears on no gate.
```

---

## §8 First action in a fresh session — one read, then nothing until it returns

```
Run each command and paste its RAW TERMINAL OUTPUT VERBATIM, including COUNT= and the END
sentinel. Do not classify, summarise, reconcile or interpret. Each command is ONE PHYSICAL
LINE. COUNT=0 IS A RESULT. If a sentinel does not appear, say TRUNCATED and name the
command. Do not retry and do not invent a variant. READ-ONLY: no edit, no compile, no
harness run, no git operation, no file written, nothing deleted.

1  $m = @(Get-ChildItem -LiteralPath 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS' -File); "COUNT=$($m.Count)"; $m | ForEach-Object { "$($_.Name) $($_.Length) $($_.LastWriteTime)" }; 'END1'

2  $f = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\REVISION_63_CONSOLIDATED_HANDOFF.md'; $L = Get-Content -LiteralPath $f; "COUNT=$($L.Count)"; $m = @(Select-String -LiteralPath $f -Pattern '^## .21','^\*\*END-OF-REVISION-63'); $m | ForEach-Object { "$($_.LineNumber) $($_.Line)" }; 'END2'

3  $f = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING\CURRENT_STATE.txt'; $L = Get-Content -LiteralPath $f; "COUNT=$($L.Count)"; $L[0]; $m = @(Select-String -LiteralPath $f -Pattern 'Rulings:','NO TOKEN IS OUTSTANDING','ONLY ONE OPEN ITEM','GIT SNAPSHOT'); $m | ForEach-Object { "$($_.LineNumber) $($_.Line)" }; 'END3'

4  certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256

Then one line: the EA's byte size and integer line count. Nothing else.
```

Command 1 establishes what the void session wrote. Command 2 decides §7 item 3 — whether
Revision 63 carries §21. Command 3 shows whether `CURRENT_STATE.txt` was amended or
overwritten. Command 4 confirms the EA is untouched at `93d3639c…3744eced` / 191,970 /
3,850.

**Then, and only then:** council authors the complete adapter payload as its own artifact,
the IDE measures it, a collision census runs against the measured payload, and `161-A` is
issued with its arithmetic derived from that measurement.

---

**END-OF-REVISION-64-SESSION-BRIEF**