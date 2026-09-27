# BUILDER_RESULT_RECON72-V9-UJ (2026-09-27; v9 tree 48EDC504, DONE=PASSED, 1/4 venues)

## 0. Pre-grade proofs (same turn; stop-conditions cleared)

- EA re-measured pre-grade: 48EDC50446565E5AC6C5598C2FF6BC505C28FFD9FB77683AB6F2E0B9EF9605B7 / 664981 B / 12028 lines. Matches the v9 built tree. Grade proceeds.
- DONE=RECON72-V9-UJ RESULT=PASSED 2026-09-27 22:42:43 (file-read, shell-independent).
- Segment: `06_HANDOFFS\RECON72-V9-UJ_JOURNAL.log`, 4288334 B, 23002 lines (Get-Content count) = ARCHIVED_LINES=23002 (journal lines 22828-45829 of the day log). Archive pre-existed (wrapper lock-tolerant write); count re-proven here.
- Gates re-derived from the SEGMENT only (never STATUS lists, never the day log): `Test passed in 0:48:06` (542258 ticks, 2880 bars); initial deposit 10000.00 USD; final balance 10118.27 USD; BIASCENSUS_FINAL / ZONECENSUS_FINAL / WS161_CENSUS present; XOB_PROMOCENSUS 472 rows; `ALERT SRJ SIGNAL` exactly 1.

## 1. PASS A - got: one take, one target hit

- 3 June London USDJPY LONG off the Daily-VWAP line: confirmation 09:05 bar, entry 09:10 open 159.929 (tester fill 159.932, 3.71 lots tester-sized), stop 159.889, target 159.983, risk check R=1.35 PASS on the firing tuple (poll twin R=2.25 on stop 159.905 beside it, evidence only).
- Lifecycle rows (all segment-proven): ALERT at the 09:10 pass (R=1.35 SL 159.889 TP 159.983); MTSNAP bar=09:05 (sl=159.889 parity); UJMEMO_PASS (POLL R=2.25 wsrc=ASH); UJ1R FIRE R=1.35 PASS; UJADMIT trade_seq=1 (sl=159.889 tp=159.983 R=1.35 wsrc=ASH); ORDER gateOutcome=PASS flipNewThisBar=0; EXITVERDICT want=0 (managing open); MTLIFE verdict=TP_TOUCH closeBar=09:55 closePx=159.983; tester `take profit triggered #2 buy 3.71 USDJPY 159.932 ... at 159.983`. Balance 10000.00 -> 10118.27 (+118.27, the single take).
- A-SL1: every pre-declared value matches (entry/SL/TP/R/signal 09:05/fill 09:10 bars, memo sl 159.905, poll R 2.25, MTSNAP parity). PASS.
- Mandated audit (finding RETEST-INVALIDATION-V1 section 5, executed before any take grade): S5.4 - retest bar 09:00 inside Daily-VWAP, confirmation bar 09:05 inside Daily-VWAP (RETESTDIAG both bars), zero BREAK rows in the 09:00-09:10 window: no POI-behind body-break evidenced, clean. S3.3 - UJPROBE h1=1.0/m15=1.0/ltf=1.0 aligned through the window, zero FLIP rows, ORDER flipNewThisBar=0: no post-retest pre-entry flip evidenced, clean. The take stands VALID; fills not re-typed.
- No-extra proof: ALERT / UJADMIT / UJMEMO_PASS / MTSNAP each exactly 1 run-wide. No admission outside A-SL1 (UJ-EXTRA: none).

## 2. PASS B - should: scoreboard vs his 4-valid word

- His 4-valid word (2026-09-27, packet P-UJIMPL-IMPL-2 line 10): 3 June London LONG + 5 June 09:45 SHORT + 5 June 16:15 LONG + 11 June 14:40 LONG.
- Register update this turn: section C bullet `3 June London take (blind): tester-only, unruled` SUPERSEDED by his word - 6/3 is now VALID-taken (entry 09:10 open 159.929, TP_TOUCH 09:55). The three UJ misses stand with mechanisms in section 3.
- Scoreboard, UJ blind window 1-13 June: takes 1/4 (6/3 TP win); misses 3 (mechanisms below, each with death rows); falses 0; tester-only takes outside his four: 0.
- EU-pending: A-EU-PRESERVE ungraded (no EU sibling run exists; a run needs a new Luna key + his word; not asked this turn).

## 3. What went wrong (one mechanism per miss; death rows quoted whole)

### 3a. A-S2P - 5 June London USDJPY SHORT, Daily-POC line (owed confirmation 09:40 bar, entry 09:45 open): FAILED, UJ-NOADMIT + UJ-NOPROMO

- Promotions fired 3x for one key (09:05, 09:15, 09:30 bars; S2WAIT 0 rows at/bar<=09:00 same-key, so the 09:05 pin holds as first - exactly-once still violated by the repeats).
- Every instance died the same way, trend-align guard abort (LTFFLIP at the 09:10/09:20/09:35 evaluations precedes each):
  `[SRJ-EA] 2026.06.05 09:15:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=SHORT`
  `[SRJ-EA] 2026.06.05 09:25:04 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=SHORT`
  `[SRJ-EA] 2026.06.05 09:40:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=SHORT`
- Confirmation arrived early at the 09:15 bar (`CONFIRMPOLL bar=2026.06.05 09:15 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=1 shadow=true`) while that instance was being aborted - never at the owed 09:40 bar (no CONFIRMPOLL rows at 09:35/09:40/09:45; RETESTBOOK hits=0 at 09:40 and 09:45; RETESTDIAG 09:40 nearAbove Daily-POC:4.0pts - price off the line).
- S3 waits ended `S3 waiting: no qualifying zone` twice (CONFIRM_PREBIND_FAIL 09:15 term=A2_CLOSE_BREAK, 09:30 term=A_OPP). Corroboration: `SHADOW_CONVERT fail=LTF_MISALIGN dir=SHORT poi=Daily-POC opened=2026.06.05 09:25 barsToConvert=3 - would have been admitted under an order-independent model`.
- Mechanism: FIX C promotes on M15 alignment, but the carried LTF-misalign abort kills every promoted instance within 1-2 bars. The setup never survives to his confirmation bar. Interaction never scoped in v9 (owned D1, section 5).

### 3b. A-POIV - 11 June New York USDJPY LONG, Daily-POC line (retest + confirmation 14:35 bar, entry 14:40 open): FAILED, UJ-NOTOUCH + UJ-NOPROMO

- First instance (14:20-signal, promoted at the 14:25 pass) aborted:
  `[SRJ-EA] 2026.06.11 14:30:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=LONG`
  (preceded by `LTFFLIP bar=2026.06.11 14:25 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT - LTF bias turned against the locked direction`; corroborated by `SHADOW_CONVERT fail=LTF_MISALIGN dir=LONG poi=Daily-POC opened=2026.06.11 14:20 barsToConvert=2`).
- Second instance (14:30-signal, promoted same pass) confirmed at 14:35 (`CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true`, RETESTBOOK hits=2), armed S4, printed HEADS-UP, booked YLOH 160.587 with risk checks R=1.75 (14:35 ref 160.524) and R=3.05 (14:40 ref 160.520) both PASS - everything his rule needs - but never fired: no UJMEMO_PASS, no FIRE, no ADMIT at any pass through 14:55.
- Touch gate: run-wide `zoneTouch=1` count = 0 (25/25 UJTOUCHSEEN rows zoneTouch=0: 20 LONG + 5 SHORT, dual-pattern proven - per-row listing plus direct `zoneTouch=1` 0-hit assert). The key's sole touch row sits outside the window with geometry unproven:
  `[SRJ-EA] UJTOUCHSEEN evalBar=2026.06.11 14:40 touchBar=2026.06.11 14:40 dir=LONG anchor=Daily-POC zoneTouch=0`
  (acceptance window evalBar in [14:20,14:35], touchBar<=14:35, zoneTouch=1). UJ-NOTOUCH attaches.
- FRESHCOUNT #21-24 verdict=HOLD (fvgDead=1 adverse=1; never 2-of-3 abort, never promote): the candidate sat in S4_ARMED through 14:55 while later polls read confirm=0 (14:45 body=1pt, 14:50 doji, 14:55 touchAttr=0).
- S2 census: no same-key S2WAIT at/bar<=14:15 (0 rows); only evidences are the 14:20 + 14:30 promotions (duplicate for one key: UJ-NOPROMO). R25/R16-content absence carried as: no same-key S2 rows other than the two promotions in 14:15-14:35 (exact base-row text not re-pulled; stated openly, never assumed).
- Mechanism: the v9 touch-proof print never observes geometric intersection on this feed (setter-fires-only across 12 days). Per P188 a UJ-NOTOUCH outcome routes the touch-vs-retest mechanism question to the next round visibly (council, quoted + rowed, ruled by name) - a mechanism question, never a fix defect, never his call.

### 3c. A-FB - 5 June New York USDJPY LONG (owed signal 16:10 bar, entry 16:15 open): FAILED, UJ-NOADMIT

- Death row: `[SRJ-EA] 2026.06.05 16:10:00 ABORT reason=SUB_1R state=S3_ZONE_WAIT poi=Daily-POC dir=LONG`.
- Fallback elected YNYH 160.028 at 19pts (`TPFALLBACK bar=2026.06.05 16:05 dir=LONG tp=160.028 distPts=19 src=YNYH`, UJFBPOOL pool listed) against stop 159.881 (128pts risk off ref 160.009): `UJ1R bar=2026.06.05 16:05 src=POLL entry=160.009 sl=159.881 tp=160.028 risk=0.128 reward=0.019 R=0.15 verdict=FAIL`. Chain never reached the 16:15 pass (RETESTBOOK hits=0 at 16:10/16:15): UJ-NOADMIT per the acceptance taxonomy (eval-16:05 death at the 16:10 pass prevents arrival, never UJ-FBDEAD).
- The refusal is CORRECT under his kept 1R floor (sub-1R refused, never taken - his rule, never questioned). Open thread: the stop it measured against (159.881, S2POLL 1SWING slot 18) sits 128pts under the 160.009 reference while the nearest in-direction target is 19pts away - SL-width vs fallback-target pairing is the next diagnosis (council route with rows on file; the floor itself stands).
- Fallback machinery works: NO_TP_TARGET 0 run-wide (second pattern: direct 0-hit assert beside the per-row evidence); UJFBPOOL + TPFALLBACK 10 each.

## 4. L-final

- 1/4 UJ admissions (A-SL1 PASS; A-S2P / A-POIV / A-FB FAILED with the findings above). EU comparison graded separately when its run lands. Multiple findings attach per section 3; one RESOLUTION per venue stands (no take = failed venue, no regrade).

## 5. Owned defects (per-mistake pins, same turn)

- D1: v9 design never executed CARRIED-GATE-INTERACTION (srj-council section 15) for FIX C vs the LTF_MISALIGN abort. The packet's settled-rules audit (line 23) listed downstream guards but never the guard's per-bar fire behavior on the promoted path. RECON72 proof: 3 promotions aborted inside 30 minutes on 5 June morning + the 11 June 14:20 instance. Pin appended to srj-council section 15 same turn.
- D2: A-S2P acceptance pre-declared the fixed run's confirmation bar (09:40, `series all-0 through eval-09:35`) from base-tree rows, though promote-earlier predictably moves confirmation earlier (actual first confirm=1 at 09:15). Acceptance time-series predictions need a fixed-tree source or a hypothesis label. New pin srj-council section 26 same turn.

## 6. Next (named; nothing asked this turn)

- Next packet direction (builder-decided technical shape, veto-able on report): (i) touch-vs-retest council round per P188 with the 25-row zero-touch census + FindLegTouch premise quoted whole; (ii) LTF-interaction scope (promote-and-hold vs abort semantics on the promoted path); (iii) SL-width diagnosis for the 16:05 fallback election. Drafting opens the fold the same block as grading per relay-ready scoping; transport only on a battery-green draft, never mixed into this turn.
- No build, no run, no key, no transport asked this turn. Next run (EU sibling or UJ re-proof) needs a new Luna key + his word.
