FORM:            D — source-only
AUTHORIZATION:   NONE REQUIRED AND NONE ISSUED
PRODUCTION EDIT: NOT AUTHORIZED. Zero bytes written to the canonical tree.
COMPILE:         NOT AUTHORIZED
CHART ATTACH:    NOT AUTHORIZED
HARNESS RUN:     NOT AUTHORIZED
ORDERS:          NONE
BUILDER:         Cline Act + GLM 5.3 Flash. Fallback DeepSeek V4 Flash.
WALL CLOCK:      25 minutes. On any BLOCKED condition, report-before-stop.
REPORT PATHS:    workspace-relative permitted; report the resolved absolute path once.

PATH CONSTANTS — the only paths this packet uses:
DF   = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06
ROOT = C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local

P17, LOAD-BEARING:
No source file is located by filename search, glob, -Recurse, wildcard, or MetaEditor
Navigator selection. Every source path is the literal absolute path stated below.
ROOT is nested inside DF\MQL5, and 4 .mq5 plus 10 .mqh copies carrying the same
filenames as the canonical sixteen exist beneath 02_TASK_CHECKPOINTS and 07_ARCHIVE.
A filename-based lookup can silently hash or paste an archived generation and this
report would look conforming.

PURPOSE
160-PreK established that SRJ_Types.mqh carries ZERO structs and ZERO enums, that
ENUM_SRJ_STATE is declared inside SRJ_FlowNexus_EA.mq5 at lines 137-139, and that the
EA directly includes only two files, neither of them SRJ_Types.mqh or SRJ_State.mqh.
Task 160 must declare twelve struct contracts where its consumers can see them. This
packet establishes THE COMPLETE INCLUDE GRAPH, THE WHOLE-TREE TYPE SURFACE, and THE
EA'S INSERTION REGION so that Task 160's Form B can be written as literal operations.
It writes nothing. It draws no conclusion about where a declaration should go — that is
council's.

--- STAGE 1 — whole-tree stasis, sixteen files ---

Raw certutil output including the "CertUtil: ... completed successfully" echo.
TARGETS are read from 06_HANDOFFS\BUILDER_RESULT_160-PreK.md STAGE 7 — never from a
handoff, never truncated. Comparison is CASE-INSENSITIVE HEX (R-57): certutil emits
lowercase, the record may carry uppercase, and a case difference is NEVER a MISMATCH.

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

ALL SIXTEEN MATCH REQUIRED. Any MISMATCH: STOP, report BLOCKED, read nothing further.

Then both artifacts, RECORD ONLY, NEVER GATED (R-58):
cmd /c dir /-c "DF\MQL5\Indicators\SRJ_FlowLogic.ex5"
cmd /c dir /-c "DF\MQL5\Experts\SRJ_FlowNexus_EA.ex5"
Expected 226444 / 09/05/2026 05:39 PM and 115438 / 08/30/2026 10:31 AM.
Report the FILE LINES ONLY. The "bytes free" line is disk state and is discarded.

Also report each file's integer line count, all sixteen, as a single table. Expected,
from 160-PreK's derivation notes: EA 3202, FlowLogic 1242, Alerts 50, BiasEngine 399,
Draw 333, Fractals 205, HTFEngine 579, ImbalanceMgr 546, OrderblockMgr 1139, Panels 439,
SeedFormat 694, Sessions 582, State 516, Text 174, TickCore 984, Types 355. State MATCH
or MISMATCH per file against those figures.
--- STAGE 2 — the complete include graph, all sixteen files ---

For each of the sixteen literal paths above, in that order:

2a  Every #include line, file order, full lines with 1-based line numbers. Per-file
    count reported. If a file has none, answer ABSENT.
2b  For each file, TWO mechanical statements, direct inclusion only:
      does this file DIRECTLY include SRJ_Types.mqh?  YES at ordinal N of M | NO
      does this file DIRECTLY include SRJ_State.mqh?  YES at ordinal N of M | NO
    DO NOT INFER TRANSITIVE INCLUSION. DO NOT COMPUTE A REACHABILITY SET. Report the
    graph; council computes reachability.
2c  For each #include naming a file OUTSIDE the canonical sixteen — for example
    <Trade\Trade.mqh> or <Arrays\ArrayObj.mqh> — list it separately with its file and
    line number. Count reported. No such file is read by this packet.

--- STAGE 3 — whole-tree file-scope type surface ---

Across ALL SIXTEEN literal paths. Comment content discarded before the census. Brace
bounds by brace counting, never indentation. Amendment 1 applies: census the
DECLARATION FORM, do not enumerate type keywords. Amendment 15: a } is never a
declaration.

3a  Every file-scope struct declaration in every file. For each: file, declaration line
    verbatim with number, matching } line with number, brace-counted span. Per-file
    count and a whole-tree count reported. If a file has none, answer ABSENT for that
    file.
3b  Every file-scope enum declaration in every file, same treatment. For each enum,
    ADDITIONALLY: every member identifier in declaration order, and whether ANY member
    carries an explicit "=" value — full lines for any that do, or ABSENT.
3c  Every file-scope class declaration in every file, same treatment. Declaration line
    only plus brace bounds; do not paste class bodies.
3d  Every file-scope typedef or #define that introduces a type name, or ABSENT.

--- STAGE 4 — the EA's insertion region, and the objId sequence ---

4a  SRJ_FlowNexus_EA.mq5, lines 1 through 60, contiguous, full lines with numbers.
    PASTED FROM / PASTED LINE COUNT / DECLARED SPAN COUNT / ASSERTION: PASTE COMPLETE.
4b  SRJ_FlowNexus_EA.mq5, lines 130 through 200, contiguous, full lines with numbers.
    Same four assertion lines. This region contains ENUM_SRJ_STATE at 137-139 and
    whatever follows it; council needs to see what an insertion after 139 would sit
    between.
4c  SRJ_Types.mqh, lines 1 through 36, contiguous, full lines with numbers. Same four
    assertion lines. This region contains the include guard, the three SRJ_NA defines,
    the file-scope global at line 31, and whatever declares or defines SRJ_NextObjId.
4d  Every definition of SRJ_NextObjId across all sixteen files — full lines, brace
    bounds by brace counting, containing file named. If ABSENT from all sixteen, say
    ABSENT.
4e  A21 declaration: for every line pasted in 4a, 4b and 4c, state ASCII CLEAN, or name
    the line, the column, and the byte value of every non-ASCII byte and mark that line
    BYTE-SUBSTITUTED and NOT USABLE AS AN ANCHOR WITHOUT A RE-READ.

--- STAGE 5 — g_state's declaration ---

5a  Census the whole-token identifier g_state across all sixteen files, case-sensitive,
    comment content discarded. Report per-file N_OCC and per-file N_LINES. DO NOT paste
    every hit.
5b  Of those hits, report ONLY the DECLARATION — the line that declares g_state, with
    its containing file, its line number, its full text, and its declared type. If more
    than one line could be the declaration, paste every candidate and answer UNKNOWN
    rather than choosing. If no declaration is found in the sixteen files, answer
    ABSENT.

--- STAGE 6 — post-read stasis ---

Re-run STAGE 1's sixteen hashes and both dir /-c calls. All sixteen EQUAL, both artifact
FILE LINES UNCHANGED. A source-only census writes nothing and compiles nothing. Any
change means a file was opened in MetaEditor or a compile occurred, and the census is
void.

--- STAGE 7 — persist ---

06_HANDOFFS\BUILDER_RESULT_160-PreL.md
Report the resolved absolute path once. Then a post-write verification read: byte size
and integer line count.

--- REPORT FORMAT ---

TASK 160-PreL: COMPLETED | BLOCKED | PARTIAL
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

STAGE 1  sixteen hashes, target from BUILDER_RESULT_160-PreK.md STAGE 7 vs observed,
         MATCH | MISMATCH, case-insensitive
         sixteen line counts vs the expected table, MATCH | MISMATCH per file
         two .ex5 dir /-c FILE LINES, before, RECORD
STAGE 2  2a per file with counts; 2b two statements per file; 2c external includes
STAGE 3  3a-3d, per-file and whole-tree counts, declaration and brace lines pasted
STAGE 4  4a-4c contiguous pastes with the four assertion lines each; 4d; 4e
STAGE 5  5a per-file counts; 5b the declaration or UNKNOWN or ABSENT
STAGE 6  sixteen hashes EQUAL | CHANGED; two .ex5 lines UNCHANGED | CHANGED
STAGE 7  resolved report path, byte size, integer line count

GRAPH VERDICT, three lines, mechanical only:
  files DIRECTLY including SRJ_Types.mqh: <list, or NONE>
  files DIRECTLY including SRJ_State.mqh: <list, or NONE>
  whole-tree file-scope struct count: <n>   enum count: <n>

No diagnosis. No hypothesis. No statement about where a declaration should go, no
reachability computation, no recommendation. Preserve ABSENT, UNKNOWN, NO OBJECT IN
SCOPE and BLOCKED as distinct results. Never infer a missing fact. Never choose among
ambiguous objects. Brace counting, not indentation. No ellipsis in a source paste. No
retyped source line. BLOCKED-FOR-COUNCIL rather than a guess.
