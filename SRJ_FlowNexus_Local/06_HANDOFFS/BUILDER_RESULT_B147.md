# BUILDER RESULT B-147 - old level found in code history; promo-return separates 4 June on both rules

Trader summary: your kill line is in the record now. Before the machine was switched to the exact middle, it killed an XOB where the candle body closed past the higher of the middle and the order-block candle's open - on your 9:20 zone that puts the line at 1.16255, the 09:20 open, and your zone then lives through your whole 16:55 confirmation (no later close ever gets above it). And the spec's own rule - a zone only counts if price comes back to it after it is promoted - splits your trades from the 4 June short cleanly: every one of your valid takes has such a zone at its confirmation candle, 4 June has none, on both the machine's alive-flag and your old level. That reading needs the full live zone map, which the EA cannot read today, so nothing can be built from it yet. The lane is at its six-relay limit. Nothing was changed and nothing was run, and no question is carried.

## Relay order (B-147, XOB-0604 lane 6 of 6, read-only)

- Part 0 on builder/B-146 at 5f45b96f53f6f23aa591346e6fae9b906be4a53a (backup ls-remote verified exact; builder/B-147 cut here). Skills loaded (relay; strategy). Reads: pointer; RESULT_B146 + SLICE_B146; RESULT_B145 R4 + SLICE_B145 sets; RESULT_B143 R2 + SLICE_B143 ranges; XOBSUIT-1 section 1 (old-level line) + section 6; skill OB-LEVEL-HIS + 0908 + XOB-ABSENCE-FIRST + L203/L205; spec v4.2 (0/1.2/3.5/3.5.1/3.6/9.6/10); register whole.
- Start gate: log-1 = 5f45b96; status 581 lines (dirty tree preserved); committed-file diff vs 5f45b96 measured 0 lines; EA 585093BF.../EX5 AB159DE7.../FlowLogic 956BF3E3/27B5F272 match; result-against-commit: CONTEXT B146 = 1, relay B-146 = 1, HANDOFF B-146 = 1, ledger 1291 = 1, journal OB-LEVEL-HIS = 1. No STOP.
- Scope MEASURED. Reads/greps/hashes/git history/offline scans of on-disk artifacts (TEMP scripts uncommitted). No edit/compile/run/launch/script/export. No tolerance/count/distance in any reading.

## Part B - banking

- No new rule words. Nothing appended.

## Part R - reading (kept 585093BF; run + file:line on every row)

### R1 old level FOUND HIGHER (record-first)

- (a) Git history (all branches): pre-change lines raw from 9861414a7553fffa3dd9ecdee34e7d88c2eeaa22 (2026-09-09, parent of the pure-midline change), Include/SRJ/SRJ_OrderblockMgr.mqh:37 `double mid = (obHigh + obLow) / 2.0;` and :39 `double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);`. Changed by d96fd5f (2026-09-09, "T161M E1 pure-midline invalidation level"). Kill test itself unchanged (closedBeyondInvalidation vs invalidationLevel, then and now).
- Old formula for bearish 3293: max(1.16243, obOpen 1.16255) = 1.16255 - higher than mid, as his banked words say. FOUND HIGHER. Set beside OB-LEVEL-HIS verbatim (B-146 banking); the record confirms his direction and fixes the number his words left open.
- (b) Ledger: T161N/pure-midline items 0; "midline rule" only item 1215 (B70-XOB-REC R2.3(a) FOUND). Quoted in slice.
- (c) Pine original: NOT FOUND (PineScript/ holds only HORC_OpeningRange.pine). Never invented a formula.

### R2 3293 on the old level (1.16255; tester UJBARMAP; EQUAL reported, no ruling)

- Formula moves the level never (fixed at creation off the 09:20 open). Candle-by-candle closes 09:20-16:55 (80 candles, whole series in slice): the ONLY body close above 1.16255 is the 09:20 formation candle itself (c=1.16256); every candle after it closes below (09:40 c=1.16248 included). First beyond-level close after formation: NONE. 3293 ALIVE through 16:55 on the old level.
- A7 16:55: alive + range-touched after the 09:40 promotion candle YES (first post-promo touch 09:45, 1.16232-1.16250 overlaps the zone; 16:55 high 1.16230 = zone low). A6 10:05: alive + touched YES (10:05 high 1.16232 inside zone).

### R3 Part S - PROMO-RETURN (spec 3.5.1 relevance->retracement->confirmation; RETRACE-IS-IN-PLAY): alive + range-touched after promo, at or before confirmation

| row | confirmation candle | pack line | MACH ids (pick marked *) | MACH | OLD-LEVEL ids | OLD-LEVEL | |
|---|---|---|---|---|---|---|---|
| A1 | 28 Aug 10:00 | 657 | 1704, 1728, 1784, 2109 | MET | same 4 | MET | SEPARATES |
| A2 | 1 Sep 17:35 | 1532 | 975, 2275, 2286, 2289, *2549 | MET | same 5 | MET | SEPARATES |
| A3 | 4 Sep 16:00 | 2257 | 2722, 2787, 2792, *2793 | MET | same 4 | MET | SEPARATES |
| A4 | 7 Sep 09:20 | 2730 | 2722, 2787, 2792, 2793, 3126, *3130 (6) | MET | same 6 | MET | SEPARATES |
| A5 | 7 Sep 16:45 | 3039 | 2722, 2787, 2792, 2793, 3022, 3126, *3130, 3132, 3139, 3178 (10; * = machine pick) | MET | same 10 | MET | SEPARATES |
| A6 | 8 Sep 10:10 | 3194 | 1704, 1728, 1784, 2109, 2149, 2217, 2896 (pick 2898 absent, no post-promo touch) | MET | same 7 | MET | SEPARATES |
| A7 | 8 Sep 17:00 | 3397 | same 7 as A6 (pick absent) | MET | same 7 | MET | SEPARATES |
| B2 | 5 Jun 16:15 | 1675 | 2720...*3308 (11) | MET | same 11 | MET | SEPARATES |
| B3 | 11 Jun 14:40 | 2606 | 1780...*3913 (18) | MET | same 18 | MET | SEPARATES |
| C-06-03 | 3 Jun 09:10 | 1110 | 1780...*2930 (9) | MET | same 9 | MET | SEPARATES |
| C-06-04 | 4 Jun 09:55 | 1397 | (none: 3038/3046/3052 form-touched, zero promo-touched; pick 3052 absent) | NOT MET | (none) | NOT MET | SEPARATES |
| C-05-27 | beside | 92 | 1405...*2094 (6) | MET | same 6 | MET | beside, never graded |

- Method: close-of-C state = barT C-minus-one rows (B-144 stamp rule); candidates = trade-direction promoted=1 (EU TARGETS groups + June full INCREMENTAL barTs, all present); MACH alive = valid=1; OLD alive = no body close beyond old level max(mid, formation-open) after validation wall; touch = range overlap in [promo, C] (2796 EU + 3920 UJ log bars single-pass; swing-leg UNCHECKED). MACH and OLD id sets identical on every row (no touched candidate differs in alive state between the rules).
- OTHER-GATE (silenced by another gate, killing pack line per B-143 R2): B1 1609 SEEDBIAS_REFUSED; C-06-02 984 confirm=0; C-06-10 2441 S54KILL; C-08-27 505 confirm=0; C-09-01-1530 1414 LTF_MISALIGN; C-09-04-1040 2131 confirm=0; C-08-28-1625 970 TP_RR_FAIL; C-09-08-1645 3379 TP_RR_FAIL.
- Column verdicts: MACH SEPARATES (every A/B2/B3/C-06-03 MET; C-06-04 NOT MET; no other ruled-out row reaches the step). OLD-LEVEL SEPARATES (same). Lane-6 decider stands on rows, not one row.

### R4 buildability (separating columns only; per input)

- Full live XOB list at runtime: NOT FOUND (kept buffers 22/23/31/33 carry the SELECTED pick only: FlowLogic.mq5:63-64/113/128 declarations, :708-709/:727/:731 bindings; Task 102/113 publish one block, B97PROV:1287-1313).
- Each XOB's promotion candle: buffer 33 = selected pick's promo time only (charter section 3:43, Task 113; spec 8 names the promotion-bar export as needed) -> per-XOB across map NOT FOUND.
- Alive state per XOB: global in-bias flags + selected-pick walk only -> per-XOB NOT FOUND.
- Candle ranges since promotion: readable (standard series, no export needed).
- Verdict: NOT BUILDABLE today as a full-map gate (B-115 R4 carried forward); needs upstream full-map export (B-109 contract / B-113 boundary, indicator-side, his scope word per REFINEMENT-PHASE SCOPE). No edit drafted here.

### R5 chart-call gate

- R1 = FOUND HIGHER (neither NOT FOUND nor FOUND NOT HIGHER) -> no carried note. B-146 call stays WITHHELD by planner (X5 note).

## Part X - records (grep-first, append once, verify count 1)

- X1 CONTEXT section 4: B147-HIS-RULES-MEANS-RECORD appended after B146-NEW-WORD-BEFORE-CALL (relay text verbatim; pre-grep 0). Count 1.
- X2 CONTEXT section 5: B-147 session line appended. Count 1.
- X3 HANDOFF section 3: B-147 line appended. Count 1.
- X4 ledger 1292, tag B147-OLDLEVEL-PROMORETURN (Part B/R1-R5). "^1292." = 1.
- X5 pointer (25 lines): latest B-147 MEASURED; SHAs unchanged; "Lane: XOB-0604 (6 of 6)"; R3 verdict lines per column; "B-146 chart call WITHHELD by planner"; "lane at limit: next relay parks XOB-0604"; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (old-level lines + commits, 09:20-16:55 candles, Part S rows + pack lines, buffer lines; under 600 lines). F3 ledger 1292. F4 pointer (35-line cap).
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/logs/journals/inis/profiles/templates/backups/artifacts/TEMP scripts.
- F6 commit + push via backup + ls-remote check. Reply MEASURED, no carried note.

## Final disk state (MEASURED turn; B-137 kept build on disk, verified)

- EA 585093BF.../EX5 AB159DE7...; FlowLogic 956BF3E3/27B5F272; history variants + includes untouched; no launches; TEMP scripts uncommitted. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1292); pointer rewritten (25 lines). Skill/journal/register untouched (no banking). No source/ex5 committed.

(End of file - no carried note)
