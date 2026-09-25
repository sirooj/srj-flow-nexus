# BUILDER FINDING RETEST-INVALIDATION-V1 (2026-09-25; his chart ruling + prediction; EU run untouched, analysis deferred per his order)

## 1. His words (verbatim, filed whole from his message this turn)

- Prediction: "My prediction is that the result would be significantly different. on USDJPY, you took many invalid setups. the main thing is, either your understanding is flawed regarding the valid POI lines retest or the code does not execute the logic properly."
- Ruling 1 (16:05 venue): "the 16:05 is a valid retest but it broke the POI lines before the confirmation entry candle close so the retest is invalidated. although the +1 retest does not matter, it only matter if the scenatio is breaking the bias of the POI lines by breaking it with a candle body close, essentially breaking the POI bias."
- Ruling 2 (6/8 venue): "i also see the EA disregad the 5m structure bias flip after the retest on the 6/8 london short at 9:35."
- Orders: "Let the EU test run finish first but journal this."
- Severity: "you made a big mistake that changed the critical component of the entry logic."

## 2. Chart read (his Image 1, USDJPY M5, June 4 afternoon)

- Red line ~159.885 (POI line), yellow ~159.895. Cursor bar 2026.06.04 16:20; status readout 17:45 O 159.970 H 159.979 L 159.957 C 159.968.
- Sequence visible: dip under the red line ~16:00-16:05, rally back through it, then strong body closes above into 16:20+ (run to ~160.02).
- Segment-proved same window: 6/04 16:20 SIGNAL SHORT R15.03, EXECUTED 159.864, exit SL 159.897 (loss). His invalidation call targets this take.

## 3. Record-first trail (no question asked - both rules are on record)

- Ruling 1: spec Part A v4.2 S5.4 "Pre-confirmation invalidation" (lines 254-266: candidate armed for its confirming close is DEAD if the POI behind it is body-broken before that close; +1 retest cannot revive - dead is dead) + S2 table row 3 (POI-side exit test scope INCLUDES pre-confirmation invalidation) + S4 (next-open timing) + S8 status line (S5.4 pre-confirmation body-close: NOT BUILT). RULE ON RECORD, BUILD ADMITTED MISSING.
- Ruling 2: spec S3.3 Step 2 (lines 103-107: 5-minute bias live never latched, re-checked every bar zone-wait through gate-check, flip against locked direction KILLS the candidate, post-entry ignored) + S1.1 (structural bias vs POI side). RULE ON RECORD. Code compliance open pending row analysis (LTFFLIP/LTF_MISALIGN rows exist in v7 segment; per-venue audit deferred).
- His prediction: journaled as his prediction; settled at EU grade + post-EU row analysis, never by prose.

## 4. Owned gap (builder defect, stated before any relay)

- v7 built three rescue/relaxation paths (E1b waiver, E2b fallback, E4b confirm-from-S2) WITHOUT the S5.4 pre-confirmation body-break guard the spec marks not-built. More rescues with no invalidation guard = more invalid takes by construction. His severity call stands on this mechanism alone.
- My V280 grade + RECON64 tabulation never consulted S5.4 or S3.3: takes graded as attributed/fated without per-bar body-break or flip-kill checks. Grade scope corrected same turn (section 5). No filed grade is altered by hand here - re-examination runs on rows post-EU.
- Open hypotheses in his framing: (a) builder understanding flawed - PROVED for the grade (S5.4 never consulted); (b) code does not execute - OPEN, settled by row analysis post-EU (which takes break POI pre-confirmation close; which takes survive a post-retest flip; exact code paths).

## 5. Grading consequences (locked for post-EU work)

- Every v7 take re-examined bar-for-bar: POI-behind body-break between retest bar and confirmation close (= invalid per S5.4), and post-retest pre-entry 5m flip (= killed per S3.3).
- EU grade applies S5.4 + S3.3 from the first row. USDJPY grade re-opens on the same two rules; A1/A2/A4 takes already proven fated stay fated - validity is re-judged, fills are not re-typed.
- No packet, no relay, no code touch, no EU halt: his orders. Analysis + council route (if semantic) after EU DONE.

## 6. His EU rulings 2026-09-26 (chart + words, filed whole; EU done, both runs graded)

- Ruling 3 (8/27 venue): "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15." Segment proof same turn (RECON67 E8B0E582): retest book 17:45 hits=1 W-POC (seed); 18:10 book bar=18:05 hits=0; 18:15 book bar=18:10 hits=2 with 18:10 CONFIRMPOLL bodyDir=0; 18:20:01 CONFIRMPOLL bar=18:15 confirm=1 (touchAttr=1) → PREBIND seedbar=17:45 → GUARD opposed=0 pobreak=0 → SIGNAL/EXEC 18:20. Tester confirmed on 18:15 touch and entered 18:20 on a setup dead by his 18:10/18:15 closes. E6b walked 6 bars pobreak=0 (anchor Weekly-POC per-bar reads uncrossed; confirm bar itself excluded by construction). Entry path has no S5.4 guard (section 3 S8 NOT BUILT, still true post-v5).
- Ruling 4 (9/1 venue): "Same with 9/1, YOUR ENTRY LOGIC IS OFF BY +1 candle! Why is the POI line retest after the confirmation candle?!" Segment proof same turn: books 15:05→15:20 hits=0 after the 15:00 SHORT hits=2; 15:30:00 book bar=15:25 hits=2 + CONFIRMPOLL bar=15:25 dir=SHORT confirm=1 same pass → PREBIND seedbar=15:25 (seed==confirm) → GUARD walked=0 silent → SIGNAL/EXEC 15:30. Retest-detection and confirmation coincide in one pass with 4 dead bars since the last standalone retest; no confirm-recency gate in the confirm path (pre-existing, both trees).
- Status of both takes: ruled INVALID entries by him (fills stand as evidence, never his trades). Next: entry-logic packet (S5.4 gate in entry path + confirm-recency + 9/7 NY detector) via council route; revert-vs-fix is his call (revert cannot move entries - kill-only proof on record).

(End of file)
