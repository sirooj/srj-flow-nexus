BUILDER RESULT 60.4-11 - EXTRACTION
STATUS: COMPLETED
PATH: 99_NOTES\DefectLedger.txt
LINE COUNT: 839
LAST WRITE TIME: 2026-09-04 18:45:23
FIRST LINE PASTED: 1   LAST LINE PASTED: 400   LINES REMAINING: 439
CONTENT:
REVISION 60.2 — ADDENDUM INCREMENT 1

Prepared by Council + Planner/Master (Opus 5). Supersedes nothing. Extends

sections 1, 3, 4, 5, 6, 7, 8, 9, 10 and 11 of the addendum above.

ROLE TABLE, AMENDED BY R-20

  Council + Planner/Master (Opus 5) — web interface only, no IDE access. Rules,

    audits, authors every Form B / Form D / Form S, and authorizes. No role has

    authority above it.

  External reviewer (GPT 5.6 Sol) — objects, or returns NO OBJECTION. Does not

    rule, author, authorize, or opine on architecture. Currently inaccessible.

  Operator — discretionary strategy meaning only; relays files and status. NO

    verification role. NO coding role. Derives no figure in any result.

  Workflow scribe (Claude Default + Sonnet 4.5) — writes dictation to disk.

  Mechanical builder (Cline Act + GLM 5.3 Flash; fallback DeepSeek V4 Flash) —

    literal extraction, census, brace counting, hashing, precisely specified

    edits, AND production implementation of a Form B under R-20.

  Implementing coder (Cline Act + Opus 5) — ROLE STRUCK. Opus 5 is web-only and

    cannot act in the IDE.

FINDINGS EA-205 .. EA-221

EA-205  Region 2's writes execute inside a LOOP. Stack at OrderblockMgr 535/537:

        for(425,570) -> if(barClosed) 480 -> if(ob.isActivated && ob.isValid) 482

        -> if(closedBeyondInvalidation && !wouldBeSameBarValInv && !isCreationBar)

        494 -> if(refOk) 524 -> if(isInBias) 532 / else. k runs Total()-1 down to

        0, so SEVERAL orderblocks may be invalidated in one pass and each writes

        the flag. The exported double names the LAST write in descending-k order.

EA-206  TWO bar identifiers are in scope at OrderblockMgr 171/173: parameter

        position 5 is the EVENT bar, position 6 is the PROCESSING bar. Both call

        sites pass i as the sixth argument — OrderblockMgr 251 and 356. Region 2

        receives the processing bar as parameter position 7. tickOBSetterBar

        records position 6 at 171/173 and position 7 at 535/537. Recording the

        event bar would make the carried test report every replay write as

        carried.

EA-207  The two site pairs are not reachable under the same conditions. Region 2's

        writes require barClosed true (guard 480). Region 1 has NO barClosed

        guard; it is reached from the creation paths at OrderblockMgr 238 and 343

        via the calls at 251 and 356. The setter-code field distinguishes

        reachable populations, not merely source locations.

EA-208  EA-197 corroborated by full-region paste. Region 1: if(refOk) 160 ->

        if(isInBias) 168 -> writes 171 (false) / 173 (true), inside

        if(closedBeyondInvalidation) 129 inside

        if(ob.isActivated && ob.isValid && !didActivate) 121. Region 2: if(refOk)

        524 -> if(isInBias) 532 -> writes 535 (false) / 537 (true). ob is named in

        a resolved guard header of every one of the four stacks.

EA-209  The tree writes 0.0 AT THE WRITE SITE for "no object selected", with the

        meaning stated in source. FlowLogic 954

          g_bufXobObjId[target]    = 0.0;   // [Task 102] 0 = no object selected

        and 993 for the FVG buffer. Corroborates EA-198 from the write side.

EA-210  FlowLogic performs NO normalisation and NO epsilon comparison on any

        exported value. Whole-file: NormalizeDouble N_OCC 0, DBL_EPSILON N_OCC 0,

        (long) N_OCC 0, MathAbs N_OCC 2 both at 1012 inside a MathMin distance

        computation. All nine (double) occurrences: 450 and 500 (PeriodSeconds in

        SRJ_ComputeLookback) and seven export writes at 939, 966, 976, 1028, 1077,

        1108, 1121. Buffer 34's write is a plain (double) cast and nothing else.

        EA-182's safe-range assertion is the only conversion check available.

EA-211  Buffer 34's export write requires NO null guard, on the tree's own

        standard. The identity is captured into an SState field at the setter

        site, so the export at 902 dereferences nothing. At the four setter sites

        ob is ALREADY dereferenced by the resolved guard headers that admit the

        write — OrderblockMgr 121 and 482 — so a null test there would be stricter

        than the code already executing. The existing 954/966 pair is guarded

        because it dereferences xob AT the export; buffer 34 does not.

EA-212  The COMPLETE lifecycle of the tree's two existing objId buffers, as buffer

        34's template:

          declaration        102, 103   double g_bufXobObjId[];  column 1

          SetIndexBuffer     613, 614   indices 31, 32, INDICATOR_CALCULATIONS

          ArraySetAsSeries   660, 661   false

          ArrayInitialize    793, 794   0.0

          write sites        954 / 966  and  993 / 1028

        Declarations 102 and 103 lie INSIDE the 30-117 span.

EA-213  g_bufFractalHigh and g_bufFractalLow are NOT DECLARED IN

        SRJ_FlowLogic.mq5 AT ALL. Whole-file census returns N_OCC 3 each and every

        occurrence is a USE: SetIndexBuffer 566/567 (indices 0 and 1,

        INDICATOR_DATA), ArraySetAsSeries 568/569, ArrayInitialize 748/749. ZERO

        lines have either identifier immediately followed by "[", so no

        declaration exists in the file in any form or at any column. EA-202 is

        REINSTATED and RESTATED: the two arrays are declared OUTSIDE

        SRJ_FlowLogic.mq5, location UNLOCATED. Also corroborates EA-194: indices

        0-1 ARE INDICATOR_DATA, from SetIndexBuffer's own third argument.

EA-214  The full-recalculation block's complete contents, [747, 808]: 34

        ArrayInitialize calls 748-797, then SRJ_DeleteAllObjects 799,

        SRJ_StateInit 800, SRJ_BindInputs 801, SRJ_HTF_Init 802,

        g_snapValid = false 804, g_intrabarObjects.Clear() 805, start = 2 at 807.

        ORDERING, material to Task 155: the buffer initialisers run BEFORE

        SRJ_StateInit. Buffer 34's ArrayInitialize insertion point is AFTER 797

        and BEFORE 799.

EA-215  The tree STATES ITS INITIALISER-CHOICE RATIONALE in a comment above each

        group inside the block: 783, 786, 789, 792, 796, all in the form

        // [Task NN] <value>, not <other> - see the declaration comment.

        R-18's required EMPTY_VALUE-versus-0.0 statement has an established form

        to match rather than invent.

EA-216  The buffer census closes arithmetically. 34 SetIndexBuffer indices 0-33,

        34 ArrayInitialize calls at 748-797, 32 declarations in FlowLogic plus the

        2 declared elsewhere = 34. EA-203's four-region map is complete.

EA-217  SRJ_State.mqh 96 reads  struct SState  with NO semicolon; 97 is "  {" at

        column 3; 246 is "   string   dataWarningName;" at column 4; 247 is "  };"

        at column 3; 249 is "SState g_s;" at column 1. §17.53's State-96 concern

        is RESOLVED — the "struct SState;" delivered by 155-Pre1 was a relay

        artifact. The insertion point (after 246, before 247) is confirmed

        verbatim, and the field form is "   <type>     <name>;" at column 4.

        StateInit 327/328/329 are at column 4 with aligned "=".

EA-218  FlowLogic 8 verbatim:

          #property indicator_buffers 34  // [Task 113] Was 33. Added 33 (selected

          XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32

          (selected FVG objId).

        FlowLogic 9 verbatim:  #property indicator_plots   2

        Both at column 1. R-6a's "append in the same form" is a MATCHED pattern.

EA-219  The three flag exports write a TERNARY, not a cast.

          902  g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;   (col 10)

          903  g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;

          904  g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;

        898 "int target = i - 1;" and 899 "if(target >= 0)" both at column 7.

        Buffer 34's write follows 966's (double)-cast form, NOT 902's ternary,

        because it carries an identity rather than a boolean.

EA-220  The non-ASCII population of the two files scanned, by byte scan.

        FlowLogic, 16 lines: 3, 5, 57, 63, 84, 100, 134, 783, 786, 789, 792, 796,

          985, 989, 1009, 1112.

        SRJ_State.mqh, 2 lines: 94, 188.

        Every occurrence is the same three-byte sequence 0xE2 0x80 0x94.

        EA-195's four-line set is SUPERSEDED for these two files.

EA-221  Every one of the 21 anchor lines in 155-Pre2 E1 and E2 is ASCII CLEAN.

        Count of non-clean anchor lines: 0. The byte-substitution risk is confined

        to COMMENT lines inside the surrounding pastes; not one line a Form B

        inserts at or beside is affected.

Last issued EA-221.

EA-202  SUSPENDED then REINSTATED. Suspended because its sole evidence was

        155-Pre1 D3, a paste declared complete and delivered short (defect 108).

        REINSTATED and RESTATED by EA-213 on a whole-file census.

LIMITATIONS

17.53  RESOLVED. The corruption is in BUILDER_RESULT_155-Pre1.md, introduced by

       the builder's report writer; the canonical source is unaffected. State 96

       confirmed as "struct SState" by EA-217. Blocks A, B and C of that result

       ARE byte-faithful; Blocks D and E are NOT and no insertion text may be

       taken from them.

17.54  RESOLVED. The ArrayInitialize block [747, 808] is guarded by

       if(prevCalc == 0) at FlowLogic 746, where prevCalc is assigned from

       prev_calculated at 730. It runs on FULL RECALCULATION ONLY. Three appended

       calls inherit that guard, which is what R-18 requires.

17.55  155-Pre2 C4's 30-117 paste and D3's 747-808 paste are byte-substituted on

       comment lines: C4 at 57, 63, 84, 100; D3 at 783, 786, 789, 792, 796. Every

       anchor line itself is ASCII CLEAN (EA-221). No insertion text may be taken

       from either paste. A Form B names file, line and identifier, and the

       implementer reads each line from the canonical file and reports it verbatim

       before inserting. EA-195's DIFF requirement is reinforced, not satisfied,

       by these pastes.

Last issued 17.55.

DEFECT LEDGER 110 .. 135

110  A Form D was issued with unbounded output and no part mapping, so the builder

     chose the delivery shape.  CLOSED BY — the output-budget rule.

111  ROOT CAUSE, planner's. The census rule block mandated brace counting but

     never mandated MECHANICAL DERIVATION, so hand-transcription of thousands of

     source lines was a legal method for every Form D issued to date. Both

     observed failure modes share this cause: a builder that transcribed by hand

     for three hours and corrupted the output, and a builder that measured the

     same job and returned a non-response. Parent of 105, 108, 109.

     CLOSED BY — AMENDMENT 22.

112  The report destination could be occupied by a stub before any legal status

     was reached.  CLOSED BY — the output-budget rule's single-write clause, and:

     a file at a report destination that does not carry one of the five statuses

     is renamed VOID_<name> and is never read as a result.

113  Issued task text carried paired underscore placeholders, which do not survive

     markdown relay. Observed: "A *, B* , C *, D* , E _" returned as

     "A *, B* , C *, D* , E _". Outbound sibling of defect 105 and §17.53.

     CLOSED BY — the relay-safe-token rule.

114  The report format's angle-bracket tokens could be echoed back unfilled and

     the document still looked like a report. The report destination was occupied

     by the task text itself.  CLOSED BY — the token-substitution rule.

115  The report format numbered its headings but never required an answer to

     identify the item's required outputs, so a report could answer twenty-one

     different questions and satisfy every conformance line. Observed: fifteen of

     twenty-one items substituted under a COMPLETED status line.

     CLOSED BY — the item-restatement rule.

116  AMENDMENT 22 mandated derivation by command but did not make the command's

     output BINDING. Two items reported the correct mechanical figure and then

     substituted an invented "standard convention" figure, overriding the

     region-bounds convention rule's own definition of BODY LINES.

     CLOSED BY — AMENDMENT 23.

117  A census item's PATTERN and SCOPE were substitutable without detection. A

     literal pattern became a case-insensitive regex and a whole-file scope became

     a line range carried in from a previous task.  CLOSED BY — AMENDMENT 24.

118  A1's classification set had no class for a constructor definition header, so

     SRJ_Types.mqh 65 was classified DECLARATION in A1 while A3 correctly treats

     the same line as a definition header. The report contradicts itself because

     the item left no legal way not to.

119  A5(iv) operationalised item 42's REACHABILITY question as whether the text

     "ob.objId" OCCURS at the four sites — precisely the sites where a Form B will

     write new code, so ABSENT is the only possible answer and the item could

     neither establish nor refute what it was written to settle. Reachability is a

     property of the member's access specifier and the variable's type. Fifth

     variant of the item-list-from-understanding failure.

120  Amendment 12 supplied NO ENCLOSING FUNCTION - FILE SCOPE but no legal answer

     for a line inside a CLASS BODY that is not inside a function. Types 63 and

     114 are neither.  CLOSED BY — amendment 12 extended.

121  R-17 specified tickOBSetterBar without establishing which bar identifier is

     in scope at each write site. TWO are in scope at OrderblockMgr 171/173 and

     they differ; recording the event bar would report every replay write as

     carried and the error would be invisible in the export.

     CLOSED BY — the bar-identifier rule.

122  R-17 named "the objId of the INVALIDATED ORDERBLOCK", a singular referent, at

     sites the source can execute many times per bar (EA-205). The answerability

     rule's self-selection clause was violated by the ruling, not by an item.

     CLOSED BY — R-17(i) amended.

DEVIATIONS:
1. Read of target lines 1-200 returned output with an internal truncation (391 characters spanning source lines 96-105 were omitted from the returned text); CORRECTION — re-read lines 90-110 and spliced the verbatim lines into the paste.
2. Read of target lines 201-400 returned output with an internal truncation (215 characters spanning source lines 301-305 were omitted from the returned text); CORRECTION — re-read lines 296-310 and spliced the verbatim lines into the paste.
3. The single editor write of this report (15012 characters) was refused by the editor tool as too large; CORRECTION — the report was written to the same destination in four sequential editor chunks (create plus three anchored appends), executed to completion, then verified by re-read.
Path written: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_60.4-11.md