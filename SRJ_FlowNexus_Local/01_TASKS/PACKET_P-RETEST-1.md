# PACKET_P-RETEST-1 v1 DRAFT - R2 yields when the void bar confirms the seed (sweep-then-retest restoration)

Status: v1 DRAFT. Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: SAME-CANDLE yield inside the R2 renewal block, +4 lines, zero modified). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token. Booking/classifier/exit/rank-guard/R-floor/regime-votes/confirmation-terms/alert/SL/TP/HTF/session code: all UNCHANGED.
Successor context: RECON57 (built tree 98F6BBAC, graded 5 of 7 valid with fills); this packet restores the 2 sweep-then-retest takes, graded per fix below.

## Authority (all on record, no invention)

- His sweep-then-retest validity 2026-09-22 with chart proof (strategy skill section 2): 8/28 London valid (AS.L sweep, then D VWAP retest) + 9/7 New York LONG valid (liquidity swept, then W POC retest latest). Sweep-first-retest-later is a VALID entry sequence.
- His renewal hypothesis (finding SWEPT-ABSORPTION section 5 + P-VALIDITY-1 R2, his word): a valid retest followed by a session-liquidity touch BEFORE confirmation voids the seed and needs ANOTHER POC/VWAP retest.
- His SAME-CANDLE rule (ledger 618): retest and confirmation may coincide on one candle (entry still next open).
- 51 fills as target figures (ledger 618, 51 segment): 8/28 10:05 SHORT entry 1.16466 R3.43 (seed carried 09:55 to 10:00, confirm=1 on the 10:00 bar with empty book); 9/7 16:45 LONG entry 1.16261 R2.34 (seed carried 14:55).
- Disk mechanism this tree (RECON55/57 segments): 8/28 09:55 SHORT seed killed at 10:00 wall by R2 SEEDVOID (buf=12 line 1.16482); 9/7 14:55 LONG seed killed at 15:00 wall by R2 SEEDVOID (buf=15 line 1.16218, tester lo touches to the pip). 51 predates R2 (built RECON53), so it carried both.
- Journal: row 257 (8/28 TAKEN +0.10/1.21R) + rows 283/284 (9/7 VALID LONG).

## Rule (one yield, N1-neutral)

- When the R2 renewal block would void a seed on a session-liquidity touch, it first asks the live confirmation gate (IsConfirmationCandle on the same bar, SAME-CANDLE): if the void bar itself confirms the seed, the touch IS the other retest his hypothesis requires - keep the seed (print R2CONFIRMKEPT), do not void. Otherwise void exactly as today (his renewal rule intact).
- N1-neutral by save/restore (SIDE1C precedent EA L7934-7945 idiom): the gate writes equality counters, so all six are saved before and restored after; N1EQUALS identical by construction, graded in G3.

## Scope (retest restoration only)

- REQUIRED: 8/28 take 10:05 entry 1.16466 (the 10:00 bar confirms per 51 rows: oppCandle=1 bodyDir=1 body=15 touchAttr=1; gate adds ruled A2 - predicted pass, graded hard).
- OBSERVE (no take predicted): 9/7 (15:00 void bar did NOT confirm LONG on tester geometry: doji body=0; void stands by design). Any 9/7 take is a NAMED mechanism finding, never hidden. H1 fact question (his 15:00 bar low vs 1.16218) rides in the builder report, never in a relay.
- Session-mark consequences of the new 8/28 take (used sessions, MTCOLLISION boundary) itemized at grade, never assumed.
- Untouched: booking (closed by verification - finding BUILDER_FINDING_BOOKING-ASH.md), classifier (re-observe post-build per Sequence), exits, rank gate, R floor, votes, terms, alerts, legs, sessions.

## Sequence (his all-three order 2026-09-23: retest, then classifier-observe, booking closed)

- P2 classifier: TRIGGERED only if post-P1 a live LONG seed still goes unelected under silent REGIMECENSUS votes (re-observe on the P1 segment; 9/7's wrong-side SHORT + votes=0 may reshape once LONG carries). No packet until the trigger prints.
- P3 booking: CLOSED WITHOUT BUILD (finding above: F1 nearest-race already books AS.H 1.16200; census-vs-booking tie-name divergence is filed design, never a fill gap). Reopen only on his word.

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 SAME-CANDLE yield (EA R2 block, insert between the scan-loop close L7781 `        }` and the void branch L7782 `      if(r2_touch)`, 6-space indent, +4 new, +0 modified; seam `        }` + `      if(r2_touch)` single-hit verified):
  new-a L7781a: `      string r2_cfTerm = "";`
  new-b L7781b: `      int r2_nVwEq = g_n1_vwapEq; int r2_nPoEq = g_n1_pocEq; int r2_nVwIv = g_n1_vwapInv; int r2_nPoIv = g_n1_pocInv; int r2_nVwSv = g_n1_vwapSurv; int r2_nPoSv = g_n1_pocSurv;`
  new-c L7781c: `      bool r2_cok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, r2_cfTerm);`
  new-d L7781d: `      g_n1_vwapEq = r2_nVwEq; g_n1_pocEq = r2_nPoEq; g_n1_vwapInv = r2_nVwIv; g_n1_pocInv = r2_nPoIv; g_n1_vwapSurv = r2_nVwSv; g_n1_pocSurv = r2_nPoSv;`
  new-e L7781e: `      if(r2_touch && r2_cfTerm == "") { if(InpDebugLog) PrintFormat("[SRJ-EA] R2CONFIRMKEPT bar=%s dir=%s anchor=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); r2_touch = false; }`
  (r2_cfTerm=="" is the gate's own pass verdict; N1 save/restore keeps census identical; barShift/g_anchorLine/g_dir/barTime/AnchorStr all in scope at the seam - same identifiers the SEEDVOID print uses two lines below)

## Stages (T161N discipline; RECON57 precedent)

S1 Pre-hash gate: re-hash EA (must equal 98F6BBACEE96A182D1C46D7605886E45886316FB636C3031C2CD7FD6083B736C / 622124 B / 11317 lines) plus Panels 4335F703/17047/456 plus ImbalanceMgr 568F4CE9/26422/612 plus State 80A466AC/18231 plus Sessions E12076C4/27178 plus FlowLogic 956BF3E3/70308 plus single-hit (seam pair + IsConfirmationCandle-decl + R2CONFIRMKEPT-absent) plus char-code assert every OLD anchor above; assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1 exact-diff (expected post-build EA 11317 + 5 new = 11322 (+5/-0/+0); rest +0). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on token plus his run word.

## Acceptance (grade segment-vs-RECON57)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11317 + 5 new = 11322 (+5/-0/+0) from literals, rest +0; R2CONFIRMKEPT 1x in source; commit text prepared, commit only on token.
G2 Takes-restored (hard gate): 8/28 take 10:05 entry 1.16466 R3.43 (MTSNAP/SIGNAL/OrderSend chain; lots balance-sized); other 5 takes identical bars/entries; R2CONFIRMKEPT rows cited bar-for-bar (8/28 10:00 expected; any other R2CONFIRMKEPT bar itemized with mechanism); N1EQUALS identical (save/restore proof); 9/7: no take predicted - any 9/7 take/fill is a NAMED finding with mechanism. Session-mark consequences of the 8/28 take itemized (used-session suppressions, MTCOLLISION reads). Any unpredicted election delta HALTS.
G3 State-identical plus take: all non-exit families count-identical vs RECON57 except downstream of the new take; EXITCENSUS prints unchanged by design; verdict deltas itemized bar-for-bar; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 8/28 exit 11:40 1.16439 higher-break (51 shape; rank gate preserved: anchor D-VWAP vs breaking D-POC); other 5 exits identical bars/reasons; DAY_CLOSE count re-derived (only survivors); MTEXIT POI_BODY_BREAK rows == higher-break rows only.
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (EA five-line insert, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON57). Novel evidence vs RECON57: (a) first sweep-then-retest take on this tree (8/28 10:05); (b) first R2CONFIRMKEPT prints; (c) 9/7 observe-rows settling the carry-vs-feed question with H1. Exit figures are target figures until fills print, never realized before.

(End of file)
