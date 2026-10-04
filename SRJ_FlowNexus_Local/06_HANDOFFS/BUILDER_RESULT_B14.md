# BUILDER RESULT B-14 - history-pool suspect cleared: both now-winners are LIVE rows, and his words bless older-day highs at entry (measurement record, no trial)

Step 0 raw, Part A start gate (measured 2026-10-04, terminal disk):
- A1 git log -1: 23152ca Permissions: auto-allow git add/commit/push + workflow external directories (operator word 2026-10-04) - differs from 4cc9779 (the permissions cherry-pick landed after the relay was written; not a STOP). Branch builder/B-14 cut from 4cc9779 literally as listed (23152ca + 2531837 stay behind on builder/B-13, local-only 23152ca unpushed).
- A1 git status --short line count: 44 on builder/B-14 (40 carried + B-13-result-tracked? stated as measured; plus the 2 new .preB14 untracked backups).
- A2 SHA-256 prefix checks, all pass, no STOP: EA F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B); HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; FlowLogic.ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; EA.ex5 D7DEA92375D8DADB38E8A8B5667DF7891D65C6EA6F4B5DD5F47C76D2B338DC96.
- A4 backups before anything else: .preB14 EA F04AF9C3...; .preB14 EX5 D7DEA923... (each equals its disk file; never committed).

## Part B - measure, no edit (today's EA, 12300 lines)

B1 text counts (count plus line numbers): ABORT_SUB_1R 3x (402, 10677, 10697); "third candidate loop" 1x (2569); SrjUjPoolConsumable( 4x (330, 2571, 11663, 12116); "managed-side pool loop" 1x (11661); UJALIGN_BYPASS 1x (9082); UJALIGN_NOMATCH 2x (9076, 9235).
- Raw spot under `third candidate loop: published history pool` (function bool ComputeNearestTpTarget, EA 2508):
2569: //--- [P-UJIMPL-IMPL-1 v8 IE5] third candidate loop: published history pool,
2570: //--- consumable only when READY for the election day; tie order session > pool > POI.
2571: if(SrjUjPoolConsumable(uj_dk))
2572:   {
2573:    for(int uji = 0; uji < ArraySize(uj_pool); uji++)
2574:       TpTargetUpdateBest(uj_pool[uji].value, dir, currentPrice, best, haveBest,
2575:                          uj_pool[uji].source, uj_pool[uji].dayKey, uj_pool[uji].poolGen);
2576:   }

B2 target winners, existing journals only (no run). 4 Sep 16:00 LONG: RECON62 TPCENSUS #232 winner=YLOH best=1.16302 (session level, yesterday's London high, day 9/3; TP_ELECT tp=1.16302 R=1.66, row 15547) vs B-11R1 TPCENSUS #236/#237 winner=LIVE best=1.16052 (LIVE-session level, today still open; TP_ELECT tp=1.16052 R=0.20, row 23971; SLNONFIRE rewardPts=34 riskPts=171, row 23975). 8 Sep 17:00 SHORT: RECON62 TPCENSUS #276 winner=Yearly-POC best=1.16114 (POI line; TP_ELECT tp=1.16114 R=1.96, row 20243) vs B-11R1 TPCENSUS #309 winner=LIVE best=1.16206 (LIVE-session level; TP_ELECT tp=1.16206 R=0.26, row 29794; SLNONFIRE rewardPts=14 riskPts=54, row 29798). Stops identical both takes (9/4 slRef=1.15847 both rows 15543/23967; 9/8 slRef=1.16274 both rows 20239/29790).
- Plain lines: 4 Sep - booked then YLOH 1.16302 (9/3 London high, session level); wins now LIVE 1.16052 (today's open session). 8 Sep 17:00 - booked then Yearly-POC 1.16114 (POI line); wins now LIVE 1.16206 (today's open session). Neither now-winner is a history-pool row.

B3 15m guard, measured only. Raw UJALIGN_BYPASS spot (EA 9082, inside the IE2 guard block at 9068-9083): the block runs only when the gate's own confirmation test already failed (if(!cfPassZ)); inside, 15m-misaligned-or-unread prints UJALIGN_NOMATCH and returns (9075-9076), 15m-aligned prints UJALIGN_PASS (9077); the else branch - confirmation already passed - prints UJALIGN_BYPASS (9082) and walks through.
- Plain line: BYPASS lets a setup through when the confirmation predicate already passed on the bar (the 15m check is then skipped as telemetry).
- 7 Sep 09:15 (B-11R1 25151 confirm=1 poll, 25156 NOMATCH m15=-1.0): the gate's own test failed on the 09:15 bar while the diagnostic poll read confirm=1, and 15m read bearish against the long - NOMATCH, return before the S5 edge.
- 8 Sep 10:05 (B-11R1 28037 confirm=1 poll, 28078 NOMATCH m15=1.0): same shape - gate failed on 10:05, 15m read bullish against the short - NOMATCH. No edit.

B4 record-first search (his words verbatim, file plus line). His words bless an older-day high AT ENTRY: "because the valid nearest target is the april 30th previous day high for 160.723 and that is more than 10 days of the code max session detection. but eventually, the TP target is revised to the current new york session high once it's over. i want your solution." (council-carried his words, v326-UJIMPL-11 line 24 / v327 line 24; finding USDJPY-MISSES A2; register section B row 2: Old high 160.723 April-30th day high, pool blind past 10 days, retarget commissioned). Ledger 903 (line 6595): booked YNYH 160.028 refused R0.15, "his line = April-30 high 160.723 ... R5.6, would pass"; ledger 904 (line 6596): entry-open math, "his 160.723 line at R3.7 would pass". Skill section 5 RETARGET line 90 carries the OPEN staleness question (age vs distance, his call) - but his April-30 instance (36 days old, "valid nearest target") answers it for entry. Skill section 9 (2026-10-04, line 121): nearest closed-session high while floating, day-close fallback. EXITMODEL-1: booking race + nearest-wins comparator unchanged (council P025 across v301-v307: TpTargetUpdateBest, nearest-in-PRICE, session > pool > POI tie order).
- Result: QUOTES FOUND (not "no ruling found") - older-day highs are valid entry targets by his words (any age, nearest-in-price).

## Part C - skipped entirely (C0 gate fails both ways, no edit, no compile, no run)
- C0 condition 1 (both now-winners are history-pool rows): FALSE - B2 proves both winners are LIVE-session rows (TPCENSUS #236/#237/#309 winner=LIVE).
- C0 condition 2 (B4 finds no words): FALSE - B4 quotes his April-30 words plus ledger 903/904 plus NEAREST-ANY-AGE.
- No rule-conflict check was needed (nothing edited). Verdict path: MEASURED. No USDJPY run in this relay.

## Part D - death rows (Part C skipped, so from B-11R1 as the relay orders; raw rows filed in B-11, at most 10 per take plus one plain line)
- 9/1 17:35 LONG: seeded S1 17:35:01 (CONFIRMPOLL 17:30 confirm=1), never left S1, no kill row - died unconfirmed.
- 9/4 16:00 LONG: S5 reached, ABORT TP_RR_FAIL rLive=0.20 (slRef=1.15847) - S5 R-gate refused.
- 9/7 09:20 LONG: S4 held, entry pass UJALIGN_NOMATCH (m15=-1.0), then CONFIRM_STRUCT_FAIL A_OPP - never promoted.
- 9/7 16:45 LONG: S5 reached, ABORT FRESH_VETO (vetoBar 10:40) - S5 vetoed.
- 9/8 10:10 SHORT: S4 armed, entry pass UJALIGN_NOMATCH (m15=1.0), then A_OPP - never promoted.
- 9/8 17:00 SHORT: S5 reached (re-seed), ABORT TP_RR_FAIL rLive=0.26 (slRef=1.16274) - S5 R-gate refused.

### Journal-code glossary (codes cited above, few words each)
- TPCENSUS (winner/best/distPts/admitted): target census (winning line, best price, distance, admitted lines). TP_ELECT (shadow/entry/sl/tp/R): target election. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility + live R. SLNONFIRE (RR_FAIL/rewardPts/riskPts/wouldFire): no-fire record. UJPOISKIP: POI skip. TpTargetUpdateBest: nearest-wins comparator. SrjUjPoolConsumable: pool-ready test. UJALIGN_NOMATCH/PASS/BYPASS: 15m guard verdicts. CONFIRMPOLL/CONFIRM_STRUCT_FAIL (A_OPP/C_TOUCH/B_BODY): confirmation poll/gate fails. ABORT (TP_RR_FAIL/FRESH_VETO): abort + reason. A6REFUSED: refusal. STATE S1-S5: lifecycle. SUPPRESSED: holder record. FRESHVETO: freshness veto. ALERT SRJ SIGNAL: entry signal. MTEXIT: managed exit.

## Part E - final state
- E1 no-edit branch: EA SHA-256 re-verified unchanged F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B).
- E2 terminal.ini [Tester] June intact (Symbol=USDJPY, 1780272000/1781308800, independent read; untouched this turn). No terminal running. core.autocrlf untouched (still true, system scope).
- E3 disk state: EA F04AF9C3 (matches .preB14, uncommitted); HTFEngine D5FD5B06 (uncommitted); FlowLogic.ex5 27B5F272 (matches restored 956BF3E3 source); EA.ex5 D7DEA923 (matches F04AF9C3 source). Journals (incl. the 2 new .preB14 backups' siblings - the preB14 files stay untracked, never committed) unpushed.

## Carried note (for the planner)
- C0 failed both ways, so the history pool at entry is CLEARED as the mover: both now-winners are LIVE-session levels (not pool rows), and his April-30 words bless older-day highs at entry anyway. The live-session winner is the new suspect class (RETARGET-CLOSED-AM already forbids still-open sessions as retarget objects; whether it also forbids them at entry is unruled on this record - B4's quotes cover older-day highs, never today's open session).
- Branch note stands: 23152ca + 2531837 stay on builder/B-13 (23152ca local-only unpushed); builder/B-14 was cut from 4cc9779 as listed. Merge or push on his word.

(End of file)
