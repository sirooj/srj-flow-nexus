GRADE RECON62-B235K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B234D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
# BUILDER RESULT B-235 - KEPT (EURUSD): next-open-equal banked, B-234 refusal installed
Trader summary: Your verdict is banked word for word: a retest that is valid at its close is still invalid when the next candle opens on the line, so your 7 September long is dropped even though it won. Under that ruling the test change refuses exactly your 17 August and 7 September takes and nothing else, so it is now the kept build, re-proved on the short run deal for deal. Your 22 September short still takes and is the next relay.
## Relay order (B-235 F10 RETEST-EQUAL 4 of 6 addendum; KEPT)
- Part 0 on builder/B-235 cut at cfd31c5 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 cfd31c5, status 903 (+27 B-234 job/launch/grade artifacts ACCOUNTED, listed), gated diff EMPTY except SLICE_B234 1-line size-gate figure fix (ACCOUNTED, recomputed), EA b4db21c5/61829f05 + POI d47a0e68/04fcd8a5 + .B234K 35f0c73f/a6d765f0, tini touch-class ACCOUNTED ([Tester]/[TickLoad] intact, RecompiledAll stamp from B-234 compile), 4 cuts present, both kept DEALS FOUND, tick STATIC (10-06 mtime), no terminal64, ledger ^1381=1 ^1382=0.
- Part B (grep-first): "16:40, the opening of the candle is the same value" count 0 -> rules/52 written verbatim (2157 bytes) + index line; NEXT-OPEN-EQUAL count 0 pre. Journal OPERATOR_TRADE_JOURNAL.csv has no B-233 ruling-row shape: NOT FOUND, skipped.
- Part R: truth A5 KEEP->NEVER (exact row); VALID_TRADES section A row 5 NOTE + section C row appended, nothing deleted; QUESTION_LOG 7-Sep line appended.
- Part S (grader, new truth, raw in slice): B230K 7/7-6/7-1fire (A5 fires); B229D 13/13-12/13-9fires; B234D 7/7-6/7-0; EU B234D 13/13-12/13-7fires. SEPARATOR_B235 = B234 rows with A5 NEVER SILENT SEPARATES. G1 PASSES: no KEEP worse, fires only drop (1->0, 9->7), numbers better both runs.
- Part K (no edit, no compile): .preB235 = b4db21c5/61829f05; installed .B234K -> Experts verified 35f0c73f/a6d765f0, [B234EQ] count 1.
- Part T (same build re-proof): RECON62-B235K window JL 24774119 verified, 18:55:14-19:00:11 PASSED, ex5 a6d765f0 pre/post; cut once (job_cut_b235.py); grade 7/7-6/7-0; deal list identical to B234D deal for deal (incl deal numbers). EU not re-run (same binary + static ticks: ACCOUNTED). Restored 17 charts + tini from .preB235 (chart06.chr deleted by terminal exit, ACCOUNTED); EA stays installed.
- Part P: ROWPACK RECON62-B235K (6 day files DEAL+B234EQ) + EU0525TD-B234D (17 new DEAL+B234EQ; 3 B-234 full-tag packs kept) + DEALS_B235K + INDEX_B235 (21 rows); SETUPS reports EXECUTED-only (7 + 20 rows, NOT PRINTED + tag elsewhere; REJECTED rows need full-tag packs, not rebuilt); REVIEW_BATCH_B235 no new items.
## Final disk state
- Kept: EA 35f0c73f/a6d765f0, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B235.md (no new items).
## Record checklist (grep-verified in staged files)
- B rules/52 + index line: FOUND
- R truth A5 NEVER + VALID_TRADES notes + QUESTION_LOG line: FOUND
- S SEPARATOR_B235 A5 SEPARATES: FOUND
- T DEALS_B235K + cut + grade: FOUND
- P INDEX_B235 + SETUPS x2 + batch: FOUND
- X EU_FIX_PLAN State B-235 + pointer State B-235 + LESSONS RETRUTH-REGRADE + ledger 1382: FOUND
## Carried note
- B-234 commit carries two stale size-gate figures from a stage-then-edit slip (SLICE_B234 "slice 7987" should read 8002; READ_MAP "ae01175b" should read b8fecfd4). The evidence itself is exact; the branch is pushed and never amended. Owned here, not repaired there.
- 22 September 18:55 B196BAR is NOT PRINTED in the B234D packs (kept-cut values stand: o1.14334 h1.14334 l1.14307 c1.14314); the installed walk's latest touch is 18:50, so the 18:55 open never decides. Next relay per pointer: next-open walk to the entry candle open.
- Tini 3a7ea233 is superseded on disk by the B-234 compile stamp (a512582a, [Tester]/[TickLoad] intact); chart06.chr was deleted by a terminal exit (17 files in scope).
- Next: F10 next-open walk diagnostic for 22 Sep 18:55.
