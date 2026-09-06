```
FORM:            D — source-only
AUTHORIZATION:   NONE REQUIRED AND NONE ISSUED
PRODUCTION EDIT: NOT AUTHORIZED. Zero bytes written to the canonical tree.
COMPILE:         NOT AUTHORIZED
CHART ATTACH:    NOT AUTHORIZED
HARNESS RUN:     NOT AUTHORIZED
ORDERS:          NONE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      35 minutes. On any BLOCKED condition, report-before-stop.
CHANNEL:         BUILDER. Workspace-relative report paths permitted; the resolved
                 absolute path is reported once. Every source path below is literal.
ASSEMBLY:        R-65. CENSUS_RULE_BLOCK_THROUGH_A26.md is prepended verbatim,
                 byte-preserving, before this body. Verification block below.
```

### Path constants — literal, and the only paths this packet uses

```
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
```

### P17, stated in the header because it is load-bearing for this packet

**No source file is located by filename search, glob, `-Recurse`, wildcard, or MetaEditor Navigator selection. Every source path is the literal absolute path stated in this packet.** `ROOT` is nested inside `DF\MQL5\`, and 4 `.mq5` plus 10 `.mqh` copies carrying the same filenames as the canonical sixteen exist beneath `02_TASK_CHECKPOINTS` and `07_ARCHIVE`. A filename-based lookup can silently hash or paste an archived generation and the report would look conforming. P14, and now measured twice — R-78's four in-place checkpoint builds and R-84's unrecorded 08-30 canonical compile.

### Purpose

Task 160 declares the twelve contracts as an inert architecture shell and must compile Tier 1 byte-identical. This packet establishes, against the current tree, **where those declarations can land, what they would collide with, and what the insertion surface looks like.** It writes nothing.

Under R-67 an anchor ages out when its file's digest changes and not otherwise, so `SRJ_FlowNexus_EA.mq5` and `SRJ_Types.mqh` anchors from prior Form Ds are current and are not re-censused here. What is censused is the **insertion surface**, which no prior Form D targeted.

### Assembly verification, performed before the builder run

```
CENSUS_RULE_BLOCK_THROUGH_A26.md SHA-256 before the prepend
CENSUS_RULE_BLOCK_THROUGH_A26.md SHA-256 after the prepend   -> must be EQUAL
assembled task file line count                               -> must equal 764 + body lines
grep, -SimpleMatch, for '16  multi-line call rule'            -> must be present
grep, -SimpleMatch, for '15  declaration brace exclusion'     -> must be present
```

Any failure: do not run. Report BLOCKED. R-66 governs — the prepend is byte-preserving and never a read-decode-rewrite through a default-encoding `Get-Content`.

### STAGE 1 — whole-tree stasis, sixteen files

Raw `certutil` output including the `CertUtil: … completed successfully` echo. **Targets are read from `06_HANDOFFS\BUILDER_RESULT_155-REG.md` STAGE 7** — never from a handoff, never truncated. Comparison is **case-insensitive hex** (R-57): `certutil` emits lowercase, the record carries uppercase, and a case difference is never a MISMATCH.

```
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
```

**All sixteen MATCH required. There is no RECORDED-NO-TARGET row in this packet** — that is what R-60 bought. Any MISMATCH: STOP, report BLOCKED, read nothing further.

Additionally compare `SRJ_Types.mqh`'s observed digest against `06_HANDOFFS\BUILDER_RESULT_155-R2.md` section 8.3(a) and state MATCH or MISMATCH. Expected `773d9944…808e78dc`, case-insensitive. This is the cross-generation pair that R-67 rests on and it is confirmed once; confirming it again costs one line.

Then both artifacts, **RECORD only, never gated** (R-58):

```
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
```

Expected `226444` / `09/05/2026 05:39 PM` and `115438` / `08/30/2026 10:31 AM`. Report the file lines only; the `bytes free` line is disk state and is discarded. Neither `.ex5` size nor timestamp is provenance (R-58); both are admissible here solely to show nothing recompiled inside this packet.

### STAGE 2 — `SRJ_Types.mqh` declaration surface

Full-line pastes, contiguous, no ellipsis, no retyped line. Enclosing construct by full open-brace stack, never by proximity or indentation.

| Item | Requirement |
|---|---|
| 2a | Total line count of the file, and the last line pasted verbatim with its number. |
| 2b | Every include-guard directive — `#ifndef`, `#define`, `#endif` — full lines with numbers. State whether the file is guarded and name the guard token. |
| 2c | Every `#include` line, file order, with numbers. Count reported. |
| 2d | Every file-scope `struct` declaration. Per amendment 1, do **not** enumerate type keywords — census the declaration form. For each: the declaration line verbatim with number, the matching `}` line with number, the brace-counted span. Count reported. Amendment 15: a `}` is never a declaration. |
| 2e | Every file-scope `enum` declaration, same treatment. Count reported. |
| 2f | Every file-scope `class` declaration, same treatment, or **ABSENT**. |
| 2g | Every file-scope `#define`, full lines with numbers. Count reported. |
| 2h | The **last file-scope declaration in the file** — kind, identifier, closing `}` line number, and the line number of the first line after it. This is the append point. If anything follows it other than blank lines, comments and `#endif`, paste it. |

### STAGE 3 — collision census for the twelve contract identifiers

Across **all sixteen files**, using the literal paths from STAGE 1. Case-sensitive, whole-token per amendment 10. Each identifier is a separate pattern; never sum `N_LINES` across patterns (amendment 5).

```
SObjectRef        SXobRecord         SFvgRecord         SStructuralBundle
SMarketSnapshot   SCandidate         SHypothesis        SStopReference
STargetReference  SPendingEntry      SDecision          SDiagnosticEvent
```

For each: per-file hit count, and every hit as a full-line paste with file and line number. **Expected result is zero hits in all sixteen files for all twelve.** Any hit is a collision Task 160 must resolve before it writes, and it is `BLOCKED-FOR-COUNCIL` — never a name the builder changes.

Then the same census for five field and enum identifiers the contracts introduce, which are the likeliest collisions:

```
objId             relevanceTime      legToken           bundleId
adverseLatches
```

### STAGE 4 — the `SState` append surface, P5a

| Item | Requirement |
|---|---|
| 4a | `SState`'s declaration line and matching `}` line, with numbers, and its containing file named. |
| 4b | The **last field declared in `SState`** — full line, number, and the closing `}` line number. |
| 4c | `SRJ_StateInit`'s definition line, matching `}` line, brace-counted span, containing file. |
| 4d | The **last assignment inside `SRJ_StateInit`** — full line and number. |
| 4e | State whether every field pasted at 4b has a corresponding initialiser in `SRJ_StateInit`. Answer by paste, not by prose. If any field has no initialiser, name it. This is P5a's precondition and Task 160 must not append past an unmet one. |

### STAGE 5 — include graph

| Item | Requirement |
|---|---|
| 5a | Every `#include` in `SRJ_FlowNexus_EA.mq5`, file order, full lines with numbers. Count reported. |
| 5b | Every `#include` in `SRJ_FlowLogic.mq5`, file order, full lines with numbers. Count reported. |
| 5c | Every `#include` in `SRJ_State.mqh`, file order, full lines with numbers, or **ABSENT**. |
| 5d | State mechanically whether `SRJ_Types.mqh` appears in each of 5a, 5b, 5c, and at which ordinal position. Do not infer transitive inclusion. If a file does not include it directly, answer **NOT DIRECTLY INCLUDED**. |

### STAGE 6 — the lifecycle enum, current state

| Item | Requirement |
|---|---|
| 6a | The enum containing `ST_IDLE` — declaration line, every member line verbatim in declaration order with numbers, closing `}` line. Containing file named. Member count reported. |
| 6b | Whether any member carries an explicit `=` value. Full lines for any that do, or **ABSENT**. This decides whether the eight ordinal comparisons rest on declaration order or on assigned values, and therefore whether the item-9 re-expression is a rewrite or a renumbering. |
| 6c | Every `ST_S5_GATE_CHECK` hit across all sixteen files, full lines with file and number. Count reported. |

### STAGE 7 — post-read stasis

Re-run STAGE 1's sixteen hashes and both `dir /-c` calls. All sixteen EQUAL, both artifact file lines UNCHANGED. **A source-only census writes nothing and compiles nothing.** Any change means a file was opened in MetaEditor or a compile occurred, and the census is void.

### STAGE 8 — persist

```
06_HANDOFFS\BUILDER_RESULT_160-PreK.md
```

Report the resolved absolute path once (R-62, builder channel). Then a post-write verification read: byte size and integer line count.

### Report format

```
TASK 160-PreK: COMPLETED | BLOCKED | PARTIAL
Authorization: NONE REQUIRED, NONE CONSUMED
Production files modified: NONE
Compile: NOT PERFORMED     Chart attach: NOT PERFORMED
Harness run: NOT PERFORMED Orders placed: NONE

Assembly verification per R-65:
  rule-set SHA-256 before / after prepend: EQUAL | CHANGED
  assembled line count vs 764 + body: MATCH | MISMATCH
  '16  multi-line call rule' present: YES | NO
  '15  declaration brace exclusion' present: YES | NO
Report channel: resolved absolute path of the workspace root
P17 attestation: every source path used was the literal path stated in the packet;
  no filename search, glob, -Recurse or Navigator selection was used

Commands that failed: <command as issued and raw error text, or "none">
Splits declared: <block, item, exact resume line, or "none">
Truncations: <one declaration, or "none">

STAGE 1  sixteen hashes, target from BUILDER_RESULT_155-REG.md STAGE 7 vs observed,
         MATCH | MISMATCH, case-insensitive
         SRJ_Types.mqh vs BUILDER_RESULT_155-R2.md 8.3(a): MATCH | MISMATCH
         two .ex5 dir /-c file lines, before, RECORD
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
```

No diagnosis. No hypothesis. No statement about where a declaration should go — that is council's. Preserve ABSENT, UNKNOWN, NO OBJECT IN SCOPE and BLOCKED as distinct results. Never infer a missing fact. Never choose among ambiguous objects. Brace counting, not indentation. No ellipsis in a source paste. No retyped source line.