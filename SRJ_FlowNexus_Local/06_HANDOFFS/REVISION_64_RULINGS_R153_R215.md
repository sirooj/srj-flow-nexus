# SRJ Flow Nexus — Rulings R-153 through R-215
## Archive artifact. Referenced by REVISION_64_SESSION_BRIEF.md §1. Not a control document.

**Status:** binding. **Counter stands at R-215.** R-216 through R-219 were minted by a void
council session and are VOID — never cited. New rulings mint from **R-220**.

**Predecessors on disk:** R-96 → R-152 compact at `REVISION_63_CONSOLIDATED_HANDOFF.md`
§6.3. R-1 → R-41 not held by council.

**This file carries ruling text only.** Current state, the queue, the next action and
prohibitions are in `REVISION_64_SESSION_BRIEF.md`. Where a ruling below is superseded or
retracted, the superseding ruling is named inline.

---

```
R-153  OPEN ITEM 50 CLOSED. TASK 160'S INSERTION IS BEHAVIOUR-NEUTRAL BY MEASUREMENT.
       160-REG-R2 returned 43 of 43 tag keys count-identical, matched lines 5992=5992,
       bars=1728, signal line IDENTICAL including SL 1.15870, sixteen digests EQUAL before
       and after. The 4c total-file-line row is NOT AN EA BEHAVIOUR INSTRUMENT and is
       DEMOTED TO RECORD-ONLY: it counts Tester-channel lines the EA does not emit, and all
       23 differing lines are agent memory figures, initialisation size, tick-preprocessing
       timings, the log filename, the code-variant line, the bytes-loaded banner and four
       Tester bookends. NONE CONTAINS '[SRJ'. THE MATCHED-LINE COUNT IS THE FILE-LEVEL
       INSTRUMENT. BEHAVIOURAL DIVERGENCE ZERO. 160-CAL WITHDRAWN; 160CAL-A1 never existed
       and now never will. R-87's lineage hole CLOSES on the .ex5-file-line chain - measured
       before and after inside a packet authorizing no compile - NOT on any banner
       comparison, which stays prohibited.
       RECORDED, NOT GATED: X64 versus AVX2 across otherwise identical output, which is a
       harder result than the gate asked for; the banner-to-disk offset now three
       observations at +32, +32, +33; and the SRJ CQD timing line's blind spot - it prints
       without a bracket so the tag derivation misses it, and the one differing such line
       differs only in milliseconds while 1169717 ticks and resets=21 agree.

R-154  P8b IS THE INDICATOR'S BUILD LINE, NOT THE EA'S. SRJ BUILD 2026.09.05 17:39:20
       matches SRJ_FlowLogic.ex5's timestamp to the second. THE EA HAS NO IN-JOURNAL
       BUILD-PROVENANCE INSTRUMENT. Until one exists, EA run-binary identity is established
       by the .ex5 file line measured before and after a run inside a packet that authorizes
       no compile. Filed as a subject: give the EA its own SRJ BUILD line, against the next
       task that edits it.

R-155  EVERY ACCEPTED TASK ENDS WITH A GIT SNAPSHOT, SOURCE AND TEXT ONLY. No .ex5 enters
       the history: a restored binary carries a checkout timestamp that is not its compile
       time. The repository is a SNAPSHOT STORE, never a source and never an edit target -
       P14 governs it as it governs 02_TASK_CHECKPOINTS. The snapshot names the task, the EA
       digest and the verdict, and stages an EXPLICIT PATH LIST, never `git add .`.

R-156  THE REPOSITORY IS NOT RE-ROOTED. Root is DF\MQL5, above ROOT. DF\config IS NOT IN THE
       REPOSITORY - nineteen first-level directories enumerated, no config among them, so
       the credential exposure council flagged does not exist here. The sixteen canonical
       sources ARE TRACKED at root-relative paths Experts\, Indicators\, Include\SRJ\, and
       the literal MQL5\... prefix council supplied RESOLVES TO NOTHING - the builder caught
       it and reported rather than silently adjusting.

R-157  BINARIES, LOGS AND TERMINAL STATE LEAVE THE INDEX AND HISTORY IS NOT REWRITTEN.
       `git rm --cached` only, never `git rm`; the files stay on disk. Two .ex5 were already
       tracked across five commits: a RECORDED CONTAMINATION OF THE HISTORY, never cited as
       lineage, NOT SCRUBBED - a rewrite is destructive and irreversible and no gate in this
       project reads a .ex5.

R-158  THE SNAPSHOT IS AN INSTRUMENT, NOT A GATE, because its result is independently
       verifiable by `git show --stat HEAD`, which is R-97's test. WHY THIS DOES NOT
       CONTRADICT THE CENSUS TOOL'S REJECTION: a census IS a gate, and a gate that lags
       silently produces a conforming-looking wrong answer. A snapshot is a persistence
       action whose failure mode is visible. AMENDED BY R-166.

R-159  A PUSH IS AN OPERATOR DECISION AND IS MADE BY NOBODY ELSE. Council issues no push
       instruction. ANSWERED BY R-165.

R-160  HEAD MAY ALREADY HOLD THE PRE-TASK-160 EA SOURCE, AND IT IS MEASURED, NOT ASSUMED.
       Line-ending normalisation is a NAMED CANDIDATE EXPLANATION for a mismatch, stated in
       advance so a difference is not misread. RECORDED, NEVER GATED. The frozen checkpoint
       remains the sole revert path of record either way.

R-161  P19 IS ADDED. No binary, log, or terminal-state file enters the git index, and no git
       history is ever rewritten. REPO\.gitignore is the enforcement instrument, and it makes
       P18 MECHANICAL RATHER THAN A DISCIPLINE: with *.ex5 ignored, the five .ex5 under
       02_TASK_CHECKPOINTS and 07_ARCHIVE cannot enter a commit even by accident.

R-162  PACKET COMPLEXITY IS CAPPED: AT MOST 60 INSTRUCTION LINES AND AT MOST 4 STAGES. No
       stage asks for a composed table, a classification, a reconciliation against a council
       figure, or a formatted report. WHERE MECHANICAL WORK EXCEEDS ONE COMMAND THE BUILDER
       WRITES A SCRIPT FILE AND RUNS IT - an inline command over ~2000 characters is the
       measured failure mode. 161-PreA was 275 lines, nine stages, six report-in-full items
       and three reconciliations, and cost two hours.

R-163  MEASUREMENT AND INTERPRETATION ARE SEPARATED. THE BUILDER DUMPS RAW OUTPUT. COUNCIL
       CLASSIFIES. A raw dump with line numbers requires zero composition and cannot be
       mis-split. Comment-stripping, write-versus-read classification, brace counting and
       enclosing-function mapping MOVE TO COUNCIL. R-96 established there is no capable coder
       in the IDE; this extends the same reasoning to census work.

R-164  One `git rm --cached -f` authorized for a stale staged log blob. --cached MANDATORY;
       the file stays on disk. The builder's refusal of an unauthorized -f WAS CORRECT.

R-165  R-159 IS ANSWERED BY THE OPERATOR: A PRIVATE REMOTE THE OPERATOR CONTROLS. A private
       GitHub repository is authorized as remote `backup`. ORIGIN AT forge.mql5.io IS NOT
       REPOINTED, NOT REMOVED AND NEVER PUSHED TO - the new remote is ADDITIVE. Disclosed:
       the push sends all six commits and the pre-Rev063 ones carry the tracked .ex5.

R-166  161-PreA IS WITHDRAWN AS ISSUED AND REPLACED BY FREE READS. The assembled packet is
       RETAINED ON DISK and its assembly arithmetic held exactly; nothing about it was wrong
       except its size. R-158 AMENDED: the snapshot is a TWO-COMMAND CONVENTION, not a
       60-line script with a param block and four gates. A SCRIPT THAT MUST BE DEBUGGED IS
       NOT A SNAPSHOT INSTRUMENT, IT IS ANOTHER TASK.

R-167  gh IS NOT INSTALLED AND THE PRIVACY CHECK IS VISUAL, NOT MECHANICAL - without gh no
       command reports a remote's visibility, so the control is the creation form's Private
       setting and the verification is the operator reading the repository page. Council
       states that limitation rather than implying a verified private push. THE COMMIT IS
       THE PROVENANCE; the remote is off-machine durability.

R-168  *.log OUTSIDE logs/ IS NOT COVERED by the .gitignore. T155_COMPILE.log is committed
       and STAYS COMMITTED - text evidence, no gate reads it. NOT AMENDED: three operations
       to solve a problem that has cost nothing is not worth it.

R-169  SState IS 144 FIELDS: 51 int, 39 bool, 28 double, 25 string, 1 long. Closed
       arithmetically - 144 fields + 6 blank + 9 comment-only = 159 body lines, 98 through
       256. The handoff's "161 body lines" IS THE BRACE-INCLUSIVE SPAN 97..257 and is not a
       field count. ZERO PARENTHESES in the comment-stripped body: NO METHODS, FLAT POD, so
       a load and a store are plain field copies with no constructor semantics.
       THIRD INSTANCE OF ONE LABELLING DEFECT - two distinct quantities carrying one name -
       after 65-versus-73 and 73-versus-74.
       THE +9 GAP against §12.3's stated 153 SRJ_StateInit assignments is NOT DERIVABLE and
       IS NOT CHARACTERISED. P5a was reported VERIFIED at 160-PreK.
       Also recorded: SRJ_State.mqh LINE 94 carries a double-encoded em-dash, which the
       handoff names only at 188. Comment text, FILED NOT REPAIRED, NOT AN ANCHOR.
       ITS DESTINATION MOVES BY R-175: this is 155-RT-A's transport surface, not Task 161's.

R-170  THE OFFERING-OBSERVATION STATE IS ABSENT FROM THE EA AND SRJ_State.mqh, AND THE ONE
       'OFFER' HIT IS COUNCIL'S OWN INSERTED COMMENT AT EA LINE 270 - a pattern matching the
       text that stated it, which is R-98's failure shape in a search rather than a gate.
       NEW STANDING RULE: ANY IDENTIFIER SEARCH OVER THE EA REPORTS HITS INSIDE LINES 166
       THROUGH 813 SEPARATELY FROM HITS OUTSIDE IT, because council wrote that region and it
       matches council's vocabulary by construction.
       ST_S3_ZONE_WAIT IS A LIVE GATE, unlike ST_SIGNAL: written 2908, compared 2436 and
       2912. Task 161's adapter carries it; it is not retired.

R-171  The appended member's name is DERIVED, not invented, and held open pending the
       fourteen-file search. RULED BY R-189.

R-172  161-FR2 ISSUED: four commands, raw output, no composition.

R-173  P17 IS SHARPENED: A PATH THAT IS CONCATENATED, INTERPOLATED, OR BUILT FROM A VARIABLE
       IS NOT A LITERAL PATH. Fourteen reads failed on $B+'name' - the + operators did not
       survive execution and each filename resolved against the working directory. ZERO FILES
       WERE MISREAD and the failure was loud.
       THE AGGRAVATING FACTOR IS THAT COUNCIL ATTESTED THE DEVIATION INSTEAD OF REMOVING IT.
       NAMING A DEVIATION DOES NOT LICENSE IT. Not the builder's defect - the command was
       wrong before it was dispatched.

R-174  THE CASCADE IS THREE FUNCTIONS. ResetSequence 1738 holds the write at 1740. GoAbort
       1757 holds 1781. EvaluateClosedBar 2011 holds the remaining seven - 2883, 2896, 2908,
       3386, 3525, 3614, 3700 - and spans to at most 3704, DERIVED FROM OnInit OPENING AT
       3707, NOT BRACE-COUNTED, admissible for scoping a read and NOT AN ANCHOR.
       CONSEQUENCE FOR A-3 §5.8: the "zero return-site edits" claim is now falsifiable -
       every return inside those 1694 lines is a site where the working set could escape
       unstored, and R-135 applies with force because 'return' is an ordinary English word.
       ALSO CONFIRMED: MarkSessionUsed is a SINGLE DEFINITION at 1061, so R-133's "appears
       exactly once" concerns its two CALL sites, not two definitions.

R-175  SState IS NOT THE EA'S WORKING SET, AND MILESTONE 1 INSTRUMENTS THE EA'S OWN
       FILE-SCOPE GLOBALS. Occurrences of g_s. in the EA: ONE. R-111 already established
       SRJ_State.mqh is unreachable from the EA. REVISION 63 §12.3 IS CORRECTED: its SState
       figures describe SRJ_FlowLogic's state, NOT Task 161's surface. §13.1's "thirteen
       file-globals" is the correct statement, and the two were carried side by side for
       eleven revisions without being reconciled.
       COUNCIL'S TWELFTH SLIP: censusing the correct structure in the wrong file, because the
       handoff named it as the surface and council did not test that against R-111, which
       council itself issued.

R-176  The private-remote control is satisfied - github.com/sirooj/srj-flow-nexus reads
       Private, visually verified. Primary builder returns to GLM 5.3 Flash. Recorded plainly:
       the 161-FR2 failure was council's command, not the fallback model's execution.

R-177  THE WORKING SET IS FIFTEEN FIELDS AND IT IS DECLARED BY ResetSequence, NOT DERIVED BY
       COUNCIL. Lines 1740-1754 clear g_state, g_dir, g_regime, g_sessionAtEntry,
       g_anchorLine, g_anchorPrice, g_anchorBarTime, g_divLatch, g_touchSeen, g_touchBarHi,
       g_touchBarLo, g_zoneHi, g_zoneLo, g_alertedArmed, g_alertedSignal.
       §13.1'S "THIRTEEN FILE-GLOBALS" IS CORRECTED TO FIFTEEN: 815-830 is thirteen and the
       two per-sequence alert latches at 837-838 belong to the same set, which the comment at
       836 and ResetSequence both state.
       WHY THIS MATTERS MORE THAN THE COUNT: the load and the store do not need council to
       decide membership. ResetSequence IS the membership statement, and any field added there
       joins the working set by construction.
       THREE EXCLUSIONS ARE LOAD-BEARING AND ARE RULED:
         the four session-used latches at 831-834 are SESSION-LEVEL and CROSS-CANDIDATE.
           Clearing them per candidate breaks B5's mark-once rule outright.
         the seven g_shadow* fields at 845-851 are WRITTEN BY GoAbort AND DELIBERATELY NOT
           CLEARED - a shadow record outlives its sequence by design, and line 842 declares it
           influences nothing. AN ADAPTER THAT SWEPT THEM IN WOULD DESTROY THE TRACKER.
         the 40 diagnostic accumulators, three handles and three infrastructure globals are
           RUN-LIFETIME.
       CAVEAT ON THE INSTRUMENT: the pattern matched column-0 declarations whose text contains
       g_. A global not containing g_, or one declared after leading whitespace, WOULD NOT
       HAVE MATCHED. 61 declaration lines were returned and NO GATE RESTS ON THAT BEING
       EXHAUSTIVE.

R-178  R-111 IS RE-VERIFIED AND SState'S IRRELEVANCE TO THE EA IS ABSOLUTE. The EA's include
       list is exactly SRJ\SRJ_TickCore.mqh and Trade\Trade.mqh. The one g_s. occurrence is AT
       LINE 1512 INSIDE A COMMENT, so COMMENT-STRIPPED THE EA REFERENCES SState ZERO TIMES.

R-179  ST_ABORT AND ST_SIGNAL ARE WRITTEN AND IMMEDIATELY ERASED, AND THE `!= ST_ABORT`
       COMPARISON IS DEAD. GoAbort writes ST_ABORT at 1781, logs at 1782, calls ResetSequence
       at 1783 which writes ST_IDLE. NO EVALUATION POINT CAN OBSERVE EITHER VALUE, so the
       second clause at 2375, 2772 and 2820 CAN NEVER BE FALSE. R-121's "assigned twice,
       compared never" is now explained mechanically rather than observed. CLOSED ON ALL THREE
       WRITES BY R-182.

R-180  A CAPTURE FAILURE ON A MULTI-LINE ARRAY ASSIGNMENT IS THE IDE HARNESS, NOT THE MODEL
       AND NOT THE COMMAND. The paths were fully literal and P17-conforming; the
       shell-integration layer failed to capture output. THE BUILDER'S HANDLING WAS CORRECT AND
       WAS THE FIRST TIME THIS SHAPE WAS HANDLED RIGHT: it pasted the error verbatim, did not
       retry, did not invent a variant, and moved on.
       NEW RULE: A FREE READ ISSUES EACH COMMAND AS A SINGLE PHYSICAL LINE. No multi-line array
       assignments, no line continuations, no here-strings. Where a literal path list is too
       long for one line, it is SPLIT ACROSS COMMANDS, never across lines within a command.

R-181  The working-set write map. ITS g_anchorPrice FINDING IS RETRACTED BY R-186 AND R-192.

R-182  R-179 IS CLOSED ON ALL THREE WRITES. 1781 ST_ABORT -> 1783 ResetSequence. 3614
       ST_SIGNAL -> 3616 ResetSequence -> 3617 return. 3700 ST_SIGNAL -> 3702 ResetSequence.
       CONSEQUENCE, BINDING: the three sites at 2375, 2772 and 2820 read `> ST_IDLE &&
       != ST_ABORT` and THE SECOND CLAUSE IS DEAD. The re-expression DROPS it; a translation
       that preserved it would be preserving unreachable code, which is P13's failure shape in
       miniature.

R-183  THERE ARE 21 RETURN SITES IN EvaluateClosedBar AND THEIR ABORT-VERSUS-RETENTION
       PARTITION IS NOT DERIVABLE FROM A RETURN-ONLY PATTERN. §3.6 places ABORT_TP_RR_FAIL at
       3565 and a bare return sits at 3566, PROVING at least one GoAbort sits on its own line
       where a return-only pattern cannot see it. Council does not partition on a pattern
       already shown blind.
       TWO MILESTONE 1 HAZARDS LOCATED RATHER THAN SUSPECTED. THE SECOND IS WITHDRAWN BY
       R-191; THE FIRST SURVIVES AS R-188'S DESIGN QUESTION.
       A-3 §5.8'S CLAIM SURVIVES ONLY IF THE WRAPPER SITS AT THE CALL SITE.

R-184  THE ZONE IS WRITTEN IN TWO REGIONS AND THE SECOND RUNS AFTER ARMING. 3382-3383 write
       g_zoneHi/g_zoneLo in the block that sets ST_S4_ARMED at 3386; 3451-3452 write them
       AGAIN, with g_touchSeen = false at 3459 immediately after. §13.1'S MEASURED
       CONTAMINATION INSTANCE - a pre-binding evaluation at 08.18 09:25 reading zone globals an
       arming event set at 09:20 - MUST BE ATTRIBUTED TO OR EXCLUDED FROM THE SECOND REGION,
       which is also the region Task 162's SL 1.15870 gate protects. FILED TO TASK 162'S
       PREDECESSOR FORM D. NOT DIAGNOSED.
       Also recorded: g_divLatch is written true at 2657 and false at 2881, and 2657 sits inside
       the region §10.6 lists at 2653, CORROBORATING amendment 5's ruling that divergence is
       CANDIDATE-level.

R-185  AN EMPTY COMMAND RESULT IS REPORTED BY THE IDE HARNESS AS A CAPTURE FAILURE, AND
       COUNCIL'S COMMAND IS WHY IT WAS UNREADABLE. Select-String emits NOTHING on no match, so
       the most likely truth was that the search found nothing and the harness could not say so.
       COUNCIL PUT THE FALLBACK IN PROSE BESIDE THE COMMAND INSTEAD OF INSIDE IT, WHERE IT WOULD
       HAVE EXECUTED. R-180 fixed the line-count failure shape and left this one standing.
       NEW RULE, MECHANICAL AND PERMANENT: EVERY FREE-READ COMMAND EMITS A COUNT AND A
       TERMINATING SENTINEL, so an empty result is a visible zero and a truncated capture is
       distinguishable from a complete one. A READ WHOSE EMPTINESS CANNOT BE DISTINGUISHED FROM
       ITS FAILURE IS NOT A MEASUREMENT.

R-186  R-181 IS RETRACTED IN PART AND THE METHOD BEHIND IT IS THE REAL FINDING. g_anchorPrice
       IS WRITTEN, at EA 2879, as a REFERENCE OUT-PARAMETER: ReadBuf1(g_hPoi, pr.topLine,
       g_anchorPrice, barShift). It sits beside g_anchorLine 2876 and g_anchorBarTime 2878 and
       the admission block is coherent. THE "NEVER ASSIGNED" FINDING IS WITHDRAWN.
       A WRITE CENSUS BY `identifier =` IS INCOMPLETE BY CONSTRUCTION: it cannot see a
       reference parameter and it cannot see a compound assignment. EVERY WRITE MAP BUILT THIS
       ARC CARRIES THE SAME HOLE and none is a gate, so nothing built on one is void - but no
       future packet asserts a write map without a reference-pass instrument beside it.

R-187  ALL THIRTEEN LIVE GoAbort CALL SITES RETURN. Ten same-line, three on the following line -
       2074/2075, 2488/2489, 3565/3566. THE PARTITION IS 21 RETURNS = 13 ABORT EXITS + 8
       NON-ABORT, and 2893 and 2906 are explicitly labelled `candidate RETAINED` in their own
       print text.
       ABORT-CODE MAP: UPSTREAM_UNREADY 2074 2440 2891 2904; SESSION_CLOSED 2389; LTF_MISALIGN
       2488; variable-fail 2582; NO_TP_TARGET 2594 3542; NO_SL_REF 3552; TP_RR_FAIL 3565;
       CONCURRENCY 3624; LOT_TOO_SMALL 3641.
       TWO CONSEQUENCES BEYOND THE MAP:
         ABORT_NO_TP_TARGET FIRES AT TWO SITES, 2594 AND 3542. §10.5 attaches T5a to
           HYPOTHESIS_WAITING_TARGET_VALIDITY on the strength of 3542 alone. 2594 sits inside
           the region bounded by §10.6's comparisons at 2572, 2579 and 2585, so WHICH BRANCH IT
           SERVES IS NOT DERIVABLE FROM A LINE NUMBER. If it is pre-binding, T5a attaches at two
           lifecycle points and §10.5 is INCOMPLETE. FILED TO TASK 162'S PREDECESSOR FORM D.
         ABORT_TP_RR_FAIL FIRES ONCE, at 3565, and the comment at 2648 records that the S2
           pre-binding RR abort was REMOVED by Task 31 / Ruling 7a and is now advisory print
           only. THAT CORROBORATES §10.5'S T5b ATTACHMENT FROM SOURCE FOR THE FIRST TIME.
         ABORT_LTF_MISALIGN AT 2488 gives §13.4's undiagnosed 28-of-87 Tier 2 aborts a call
           site. EA-172's replay-order defect must still be excluded before any is attributed
           to strategy.

R-188  EvaluateClosedBar HAS EXACTLY ONE DEFINITION AND EXACTLY ONE CALL SITE: defined 2011,
       called 3848. A-3 §5.8'S "ZERO RETURN-SITE EDITS" CLAIM HOLDS, and the adapter is a
       THREE-LINE EDIT AT ONE LOCATION rather than an intervention inside 1694 lines.
       R-183'S FIRST HAZARD SURVIVES AND IS THE WHOLE DESIGN QUESTION: GoAbort calls
       ResetSequence internally at 1783, so all thirteen abort exits CLEAR THE FIFTEEN GLOBALS
       BEFORE CONTROL RETURNS. A call-site store therefore copies a CLEARED working set on
       every abort - correct only if the rejection was recorded on the candidate first, which
       is edge C6, and GoAbort records it nowhere but a log line.
       RECORDED: 3848's enclosing function was unread at the time of ruling; the insertion point
       is LOCATED, NOT ANCHORED, and P12 stands.

R-189  R-171 IS RULED. THE APPENDED MEMBER IS CANDIDATE_ZONE_WAIT = 9. The fourteen non-EA
       files return COUNT=0 on ZONE_WAIT, OFFER and CANDIDATE_, with sentinels present, so the
       tree DOES NOT NAME THE CONCEPT and R-129's prohibition on council inventing a name is
       satisfied BY DERIVATION rather than invention: the prefix comes from the eight declared
       members, the suffix from ST_S3_ZONE_WAIT already in source at EA 138, and every character
       is checkable by anyone holding both.
       R-122 MAKES THIS ONE-CHANCE: an omitted member costs an append, an invented member costs
       a rename across Tasks 160, 161, 162 and 164.

R-190  161-FR5 ISSUED.

R-191  R-183'S SECOND HAZARD DOES NOT EXIST. The comment at EA 2756-2761 describes the
       POIREPLACE block at 2772-2795, whose GoAbort call was REMOVED BY TASK 91 and survives
       only as the commented record at 2792. IT IS STALE DOCUMENTATION OF A REMOVED CALL. All
       thirteen live GoAbort calls return, so no invocation can abort one candidate and seed
       another in the same bar. P14 is unaffected - it was never contingent on this.
       RECORDED, AND IT IS THE COMMENT'S OWN CLAIM: the POIREPLACE print is retained as a
       COUNTERFACTUAL CENSUS, still firing on every bar the removal lets pass.

R-192  R-181 IS FULLY CORRECTED AND THE FINDING SURVIVES IN A DIFFERENT FORM. g_anchorPrice IS
       WRITTEN AND NEVER READ. Its complete occurrence set is THREE LINES: declaration 820,
       ResetSequence clear 1745, reference write 2879. AnchorStr at 966-967 returns
       g_lineCode[g_anchorLine] and DOES NOT TOUCH THE PRICE, so the retention prints at 2893
       and 2906 report the anchor's LINE CODE.
       IT REMAINS IN THE WORKING SET: R-177 makes ResetSequence the membership statement and a
       write-only field is still a member. NOT DEAD IN THE TARGET ARCHITECTURE - §10.4's edge
       C1 writes poiAnchor* onto SCandidate, so Task 162 gives the value its first consumer.

R-193  THE EA HAS EIGHT REFERENCE-TAKING FUNCTIONS: ReadBuf1 1079, ReadFlow 1148,
       DetectPoiRetest 1169, ClassifyRegime 1207, CheckLtfAlign 1240, FindNearestSwing 1432,
       UpdateDivergenceLatch 1720, ReadQualifyingZone 1804. Across ReadBuf1's 31 occurrences
       the only call passing a working-set global by reference is 2879.
       CAVEAT: the pattern was `^[A-Za-z].*&` and CANNOT SEE A DEFINITION WHOSE PARAMETER LIST
       WRAPS TO A SECOND LINE. The eight-function set is NOT PROVEN EXHAUSTIVE and no gate rests
       on it. CLOSED BY R-198.

R-194  A stated buffer-read discipline may be violated at eleven sites. DOWNGRADED BY R-197.

R-195  §10.6'S EXPRESSIONS ARE ABBREVIATIONS AND MAY NOT BE RE-EXPRESSED FROM THE TABLE.
       Measured at 2772: `g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 &&
       inWindow`. §10.6 records that row as `> ST_IDLE && != ST_ABORT` - TWO CONJUNCTS SHORT,
       one of them a working-set field in control flow. The other seven rows are presumed
       abbreviated on the same basis and NONE IS VERIFIED.
       BINDING ON TASKS 162 AND 164: every ordinal re-expression reads the LINE, never the
       table. Task 161 is unaffected - it wraps a call and touches no comparison.
       ALSO RECORDED FROM 2779-2780: the anchor-tier test is
       `g_authorityRank[new]/2 < g_authorityRank[held]/2`, INTEGER DIVISION PAIRING THE RANKS.
       That is the mechanism behind EA-96's same-bar tie rule and §10.4's B3, measured from
       source for the first time.

R-196  161-FR6 ISSUED.

R-197  R-194 IS DOWNGRADED AND NO DEFECT IS FILED. The ReadFlow discipline documented at EA
       1098-1146 attaches to SEVEN BUFFERS: 26, 27, 29, 30, 31, 32, 33. None of the eleven raw
       ReadBuf1(g_hFlow,...) sites reads any of them, and the shift arithmetic at 2128-2133 and
       2213-2223 - barShift+1, barShift+2 - IS FLOW_SHIFT_OFFSET APPLIED BY HAND, arithmetically
       equal to ReadFlow's evalShift + 1.
       THE BLANKET CLAIM AT 1092-1094 IS CONTRADICTED IN LETTER AND SATISFIED IN EFFECT.
       Recorded as STALE GENERALITY, NOT A DEFECT.
       ONE RESIDUAL, CLOSED BY R-205.

R-198  R-193 IS CLOSED. NONE of ClassifyRegime, CheckLtfAlign, FindNearestSwing,
       UpdateDivergenceLatch or ReadQualifyingZone receives a working-set global by reference.
       Every call site passes a caller-owned local: 2177, 2183, 2439, 2656, 2903, 3434, 1496,
       1497, 1878, 1997, 3049. THE LOCAL-THEN-COPY PATTERN HOLDS UNIVERSALLY, and 2879 IS THE
       SOLE REFERENCE WRITE TO A WORKING-SET FIELD IN THE EA.
       THE MUTATION MAP IS COMPLETE: 15 declarations 815-838, 15 clears 1740-1754, 31 `=` write
       occurrences on 27 lines, 1 reference write at 2879.

R-199  THE WRAPPER AT 3848 BRACKETS EVERY WORKING-SET TOUCH IN A BAR. OnTick is 3842-3849 in
       full: a static bar-time guard, one assignment, one call to EvaluateClosedBar, and NOTHING
       ELSE RUNS ON A TICK. ResetSequence's fourth call site is 3768 inside OnInit, outside the
       bar path - THE ADAPTER MUST NOT STORE THERE. OnDeinit at 3820-3839 touches only
       run-lifetime diagnostic accumulators and the three indicator handles.
       CONSEQUENCE: a load and a store at 3848 are a COMPLETE BRACKET BY MEASUREMENT, not by
       assumption. The insertion region is LOCATED, NOT ANCHORED.

R-200  THE FIFTEEN GLOBALS REMAIN THE WORKING MEDIUM, AND THAT IS WHY TASK 161 EDITS NO HELPER.
       81 lines outside the cascade touch working-set fields: 15 declarations, 15 clears,
       GoAbort's write at 1781, and the remainder READS, concentrated in the log formatters
       967-1015, CheckLtfAlign's FRESHCOUNT print 1256, a zone guard 1277-1279, the anchor-rank
       region 1353-1406, the SL-reference region 1561-1711, UpdateDivergenceLatch 1724, and the
       zone helpers 1863-1994.
       NINETEEN g_zone* LINES ACROSS 1561-1711 CORROBORATE §17'S "five EA functions read them,
       two in control flow on the admission path" FROM SOURCE, and they are the exact surface
       Task 162's SL 1.15870 gate protects.
       A-3 §5.8'S "ZERO RETURN-SITE EDITS" IS NOW JOINED BY ZERO HELPER EDITS, both by
       construction rather than by intent. IF A TASK 161 DRAFT EVER REQUIRES A HELPER EDIT,
       THAT IS THE SIGNAL THE DESIGN DRIFTED, not a cost to absorb.

R-201  GoAbort ALREADY SNAPSHOTS FOUR WORKING-SET FIELDS INTO A RECORD THAT OUTLIVES THE
       SEQUENCE. Lines 1772-1775 copy g_dir, g_anchorLine, g_anchorBarTime and g_sessionAtEntry
       into g_shadowDir/Line/Opened/Sess, taken BEFORE ResetSequence at 1783 and guarded by an
       alert-latch read at 1763. The comment at 1766 states the ordering requirement explicitly.
       THAT IS THE EXISTING PRECEDENT FOR EDGE C6 AND IT RESHAPES R-188'S HAZARD: the adapter
       does not invent a store-on-abort mechanism, it GENERALISES ONE THAT EXISTS. The seven
       g_shadow* fields STAY OUTSIDE the working set - they are the record, not the state.

R-202  R-162'S 60-LINE CAP COUNTS INSTRUCTION LINES. Literal payload - an insert block copied
       verbatim, a quoted anchor, a message file's content - is NOT COUNTED, because copying is
       not composition and length is not complexity. Task 160's 648-line insert proved a large
       literal payload is safe at 0 errors 0 warnings; 161-PreA's 275 lines of instructions
       proved a large instruction set is not.
       AMENDED: this exemption DOES NOT EXEMPT PAYLOAD FROM R-109. A payload longer than about
       sixty lines is delivered as its own artifact and the packet references it by path. A
       118-line payload delivered inside a packet body TRUNCATED AT THE FENCE, producing an
       assembled packet that called three functions it did not define and declared an arithmetic
       gate its own text could not satisfy. R-109 explicitly permits a paste to instruct the IDE
       to read a body from a named file on disk, and that is not a placeholder.

R-203  THE PREDECESSOR FORM D IS DISCHARGED BY MEASUREMENT. 161-FR1 through FR8 delivered what
       PACKET_161-PreA.md was issued to deliver, in 32 commands rather than 9 stages. §13.3's
       order-2 item is CLOSED and the assembled packet stays on disk, unexecuted, its assembly
       arithmetic intact.
       NO FORM B IS DRAFTED FROM A FIELD LIST COUNCIL HAS NOT READ. That is P12 in spirit as
       well as letter.
       RECORDED: the damaged-comment set is at least EIGHT lines - EA 159, 1100, 1109, 1113,
       1121, 2756, SRJ_State.mqh 94 and 188 - and the damage is GENERATIONAL, not random: the
       Task 105-era comments at 1100-1121 are damaged while the Task 123-era comments at
       1139-1144 carry clean em-dashes. All comment text, all FILED NOT REPAIRED, none an
       anchor, and no packet has ever measured the set deliberately.

R-204  THE APPEND OF CANDIDATE_ZONE_WAIT = 9 MODIFIES EA LINE 287, AND TASK 161 IS THE FIRST
       TASK IN THIS MIGRATION TO MODIFY AN EXISTING LINE. ENUM_SRJ_CANDIDATE_STATE spans 278-287
       and its terminator SHARES THE LAST MEMBER'S LINE: `CANDIDATE_EXPIRED = 8 };`. The append
       is a replacement of one line - a comma added after `= 8`, the member and terminator on new
       lines.
       R-122 IS NOT STRAINED: every existing member NAME and VALUE is preserved byte for byte.
       Nothing is renamed and nothing is renumbered. A comma and a brace move.
       THE INTERIOR ALIGNMENT IS TAKEN FROM THE FILE at the packet's own stage, never from a chat
       transcript - leading-whitespace fidelity through a paste chain is not something council
       will assert.
       ENUM_SRJ_HYPOTHESIS_STATE at 316-329 has the same shape and IS NOT TOUCHED. Its twelve
       members are complete per R-128.

R-205  R-197'S RESIDUAL IS CLOSED AND FindNearestSwing IS CORRECT. Line 1439 reads through
       ReadFlow, so the bounded 500-slot walk at 1436-1444 inherits FLOW_SHIFT_OFFSET and the SL
       reference path reads SETTLED slots. The comment at 1426 states it and the body confirms it.
       TASK 162'S PREDECESSOR FORM D LOSES THIS ITEM.
       THE TWO RAW READS AT 1461/1463 ARE DIAGNOSTIC ONLY: inside ComputeSlReference's SWINGDUMP
       block, InpDebugLog-guarded, capped at 20 dumps or site=="S5", reading d = barShift..
       barShift+9 WITH NO OFFSET.
       NEW SUBJECT, NOT CHARACTERISED: the Task 20 comment at 1087-1091 measures shift 1 as the
       PROVISIONAL slot at a 52% retraction rate and shift 2 as settled, SO SWINGDUMP PRINTS
       PROVISIONAL VALUES WHILE THE LOGIC IT DOCUMENTS READS SETTLED ONES. Any reasoning about
       swing selection taken from SWINGDUMP output is ONE SLOT OFF ITS SUBJECT. Filed to item
       19's print packet, which this makes materially more important to read.
       STILL UNCLASSIFIED: line 2090's FL_BUF_LTF_BIAS read. Not Task 161's surface.
       ALSO CONFIRMED: ReadBuf1 at 1079-1085 applies NO offset, so ReadFlow at 1148-1150 is the
       SOLE OFFSET APPLIER IN THE EA.

R-206  §10.2'S STRUCTURE COUNTS ARE CONFIRMED BY CENSUS FOR THE FIRST TIME, from source rather
       than from the builder's report. EIGHTEEN contract enums at 210, 218, 225, 235, 249, 278,
       316, 335, 358, 372, 384, 395, 404, 412, 417, 430, 439, 450. THIRTEEN structs at 471, 491,
       515, 534, 549, 579, 606, 636, 661, 709, 756, 780, 796. Six legacy enums at 19, 137, 141,
       142, 143, 144, with ENUM_SRJ_STATE at 137 and ENUM_SRJ_CANDIDATE_STATE at 278 COEXISTING.
       THE MAPPING TARGETS ARE LOCATED: SCandidate 661-708 with state at 674, SHypothesis 709-755
       with state at 715. R-203's predicted split IS MEASURED.
       SDiagnosticEvent.stateBefore and .stateAfter at 784-785 are ENUM_SRJ_HYPOTHESIS_STATE, so
       the diagnostic event carries HYPOTHESIS transitions and A CANDIDATE TRANSITION NEEDS A
       DIFFERENT CARRIER.

R-207  OPEN ITEM 12 IS HALF-MEASURED AND ITS EA HALF IS ON RECORD. CurrentTradingWindow at
       1027-1049 carries four ET hour literals - London 02:00 to 05:00, NYAM 07:00 to 12:00 -
       converted by TC_ZoneToServer(..., TZ_NEWYORK) and probed across dayOffset -1 to +1 so a
       server-time bar near a day boundary still resolves. Bounds are INCLUSIVE AT THE OPEN and
       EXCLUSIVE AT THE CLOSE.
       THESE ARE THE BOUNDED EXCEPTION §7 ALREADY NAMES: session-boundary definitions, not
       tunable thresholds. The comparison against g_defLondon IS STILL OPEN - that global is not
       in the EA's declaration set and lives outside it, unmeasured. ITEM 12 REMAINS OPEN AND
       NON-BLOCKING.

R-208  R-177'S SESSION EXCLUSION IS CORROBORATED FROM SOURCE. SessionAlreadyUsed 1051-1059 and
       MarkSessionUsed 1061-1066 are the only readers and writers of the four session-used
       globals, and both key on TC_DayStart(barTimeServer) so THE LATCHES ARE PER-DAY, NOT
       PER-RUN. They are session-level and cross-candidate; the adapter does not carry them.
       R-133'S "MarkSessionUsed APPEARS EXACTLY ONCE" IS ABOUT ITS DEFINITION at 1061. Its two
       CALL sites at 3612 and 3698 are what B5 collapses to one.

R-209  161-FR8 ISSUED AS THE MAPPING READ.

R-210  THE FIFTEEN GLOBALS MAP ONTO THE CONTRACTS 7 / 7 / 1 AND NO FIELD IS UNASSIGNED.
       CANDIDATE LEVEL, SCandidate 661-708:
         g_dir -> dir 664; g_anchorLine -> poiAnchorLine 665; g_anchorPrice -> poiAnchorPrice 666
         + hasPoiAnchorPrice 667; g_anchorBarTime -> poiAnchorBarTime 668; g_regime ->
         regimeAtAdmission 672; g_sessionAtEntry -> tradingWindowAtAdmission 673; g_divLatch ->
         divergenceVerdict 682.
       HYPOTHESIS LEVEL, SHypothesis 709-755:
         g_zoneHi -> zoneHi 716 + hasZone 718; g_zoneLo -> zoneLo 717; g_touchSeen ->
         touchLatched 719; g_touchBarHi -> touchBarHigh 722; g_touchBarLo -> touchBarLow 723;
         g_alertedArmed -> alertedArmed 742; g_alertedSignal -> alertedSignal 743.
       SPANS BOTH: g_state -> SCandidate.state 674 AND SHypothesis.state 715.

R-211  g_state IS THE SINGLETON DEFECT AS A SINGLE FIELD, AND THAT IS THE MIGRATION'S WHOLE
       SUBJECT. One ENUM_SRJ_STATE variable carries candidate admission progress (ST_IDLE through
       ST_S3_ZONE_WAIT) and hypothesis post-binding progress (ST_S4_ARMED through ST_S5_*). A
       candidate CANNOT wait at S3 while a hypothesis advances at S5, because there is one
       variable holding one value.
       §10.6'S 2436 AND 2585 ROWS - "spans -> TWO tests" - ARE THIS FACT, and §13.1's "not a
       candidate registry with capacity one; a single mutable process" IS THIS FACT.
       CONSEQUENCE, BINDING: no adapter can make g_state two fields without splitting the
       cascade, which is Task 162's and Task 164's work under R-123. TASK 161 MIRRORS IT INTO
       BOTH DESTINATIONS AND CHANGES NOTHING.

R-212  TWO COUNCIL PREDICTIONS ARE CORRECTED FROM SOURCE.
       SStructuralBundle 549-566 DOES NOT CARRY THE ZONE. It holds bundleId, xob, fvg, hasFvg,
       four leg fields, bindingBar, bindingEvent, relevanceTime, oppFvgRefs and its two capacity
       fields. The zone is SHypothesis.zoneHi/zoneLo/hasZone at 716-718, and the comment at
       690-695 states the reason: THE ZONE IS SUPPLIED EXPLICITLY and an explicit absence is
       passed before binding, never a zero.
       g_alertedArmed AND g_alertedSignal DO HAVE DESTINATIONS, at 742-743, so they are
       hypothesis-level evidence and not emission bookkeeping. Council's guess is withdrawn.
       g_divLatch CANNOT ROUND-TRIP. bool -> ENUM_SRJ_TRI is a widening the build cannot fill:
       false conflates NOT YET EVALUATED with EVALUATED AND NOT DIVERGED, which is exactly the
       distinction R-112 declared the TRI for. The store maps false -> UNKNOWN and true -> the
       validated value; THE REVERSE MAP IS LOSSY AND IS RECORDED AS LOSSY.
       divergenceConsumedBar and hasDivergenceConsumedBar HAVE NO SOURCE.

R-213  TASK 161 INSTANTIATES NO SHypothesis AND NO SCandidate. Contract 9's comment at 687
       declares bundle MANDATORY, NEVER OPTIONAL, and SStructuralBundle requires SXobRecord and
       SFvgRecord identity that arrives over buffers 31 and 32 and is nowhere in the fifteen
       globals. AN UNPOPULATED MANDATORY FIELD IS A ZERO STANDING FOR ABSENCE, which P15 and
       R-112 forbid outright, so NONE IS FABRICATED.
       TASK 161 DECLARES ONE PURPOSE-BUILT RECORD carrying the fifteen fields plus a presence
       flag. IT IS THE INSTRUMENT, NOT THE ARCHITECTURE. Its comment names each field's contract
       destination so Task 162 migrates from a stated mapping rather than re-deriving one.
       NOTHING READS IT.
       THE FIELDS WITH NO WORKING-SET SOURCE ARE NAMED AND LEFT UNWRITTEN: candidateId,
       retestBar, hasRetestBar, retestEvent, createdBar, rejectionReason, rejectionBar,
       hasRejectionBar, divergenceConsumedBar, hasDivergenceConsumedBar, the whole bundle,
       stopRef, targetRef, the adverse triple, all three confirmation fields, terminator,
       cancellationReason, basisLostBar. THAT IS EVIDENCE OWNERSHIP - MILESTONE 3, TASKS 162 AND
       163 - AND NOT MILESTONE 1'S WORK.
       RECORDED: GoAbort's abort code is a PARAMETER, visible at the thirteen call sites and
       nowhere else, so an adapter at OnTick CANNOT SEE IT. Edge C6's rejectionReason is NOT
       DERIVABLE at the wrapper and stays UNKNOWN under P15. R-201's g_shadow* precedent shows
       how Task 162 will capture it; Task 161 does not.

R-214  THE LOAD COMPARES AND DOES NOT ASSIGN, AND THAT IS WHAT MAKES TASK 161 BEHAVIOUR-NEUTRAL
       BY CONSTRUCTION. At capacity 1 the globals ARE the medium and nothing clears them between
       bars, so an assignment on load would be a no-op when the values agree and WOULD MASK THE
       DIVERGENCE THE INSTRUMENT EXISTS TO FIND when they do not. The load reports and returns.
       THE GATE THIS CREATES IS REAL: store at bar N, compare at bar N+1, and ZERO MISMATCHES
       OVER 1728 BARS MEANS THE WORKING SET IS CLOSED - nothing outside the fifteen fields
       carries sequence state across bars. R-199 argues that from OnTick's body; this measures it.
       SCOPE STATED HONESTLY, BECAUSE THE MILESTONE'S NAME OVERPROMISES: at capacity 1 there is
       no OTHER hypothesis, so TASK 161 DELIVERS THE INSTRUMENT AND THE CLOSURE PROOF, NOT THE
       ISOLATION PROOF. Rev 60 §13.2's pass condition REQUIRES CAPACITY 2 AND IS P14-GATED,
       arriving with Task 162. COUNCIL DOES NOT CLAIM MILESTONE 1 PASSED ON TASK 161'S RETURN.
       BECAUSE THE EDIT IS BEHAVIOUR-NEUTRAL BY CONSTRUCTION, the regression compares against the
       155-REG baseline exactly as 160-REG-R2 did, and the tag-key difference set must be empty
       EXCEPT for any new instrument keys, WHICH ENTER AS NEW KEYS AND NOT AS DIFFERENCES.

R-215  161-A1 ISSUED for a four-operation combined edit and one compile. WITHDRAWN, NEVER
       INVOKED - assembly is not invocation and the assembly directive forbade execution, so no
       token consumed. Superseded on scope: Task 161 splits into an adapter insert and a wiring
       edit, for the reasons at REVISION_64_SESSION_BRIEF.md §5.
```

---

**END-OF-RULINGS-R153-R215**