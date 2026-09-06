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
