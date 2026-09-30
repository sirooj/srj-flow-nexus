# BUILDER RESULT RECON76-V28-UJ - DONE=PASSED, takes identical to RECON75 (his no-difference CONFIRMED at take level), mechanism delta as designed

Run: RECON76-V28-UJ, DONE=PASSED 14:58:19 (journal `Test passed`, 1:12:30). Segment `06_HANDOFFS\RECON76-V28-UJ_JOURNAL.log` FB7C37F9/6162087/32026 (542258 ticks / 2880 bars - same feed volume as RECON75). Binary proven: EA E516EBFF/684070/12291 + ex5 451464B 06:36:41Z, both re-verified post-run. Window proven by journal testing-line (2026.06.01->2026.06.13 on the v28 binary). VOID gates pass (bars=2880, signals=2, takes=2 - not a 0/0 instrument void).

## PASS A (got)

- Takes 2, byte-identical bars/entries to RECON75: 6/3 London LONG 09:10 159.929 TP_TOUCH 09:55 159.983 (R1.35) + 6/5 NY LONG 16:55 160.115 TP_TOUCH 19:15 160.298 off retargeted tp (R1.56; UJRETARGET seq=2 fired 19:00). Balance 10027.13 identical. Signals 2 (same bars). Rejects silent (8 June: no ALERT, no ADMIT; ALERT total run-wide = 2).
- New telemetry fires as designed (the promised novel evidence): UJRESEED 13 rows (all single per event, no duplicates), UJOPCONF 14, UJSBTELEM with o1/c0/c1/arm fields, al/ok on every reseed row. UJHOLDEXPIRE 0x + ABORT_HOLDER_EXPIRED 0x (two-pattern zero, HELD).
- H3 arm live and attributable: 14:30-bar refusal reads termC=B_BODY (arm correctly inapplicable), 14:35-bar refusal reads termC=A2_CLOSE_BREAK with full field values (A-6 proven on a live row).

## PASS B (should - his frame first, then EA rows)

- HIS 5 June London SHORT (register B1): owed entry 09:45 open 159.948 off Daily-POC, his rule 09:35 retest + 09:40 confirmation. EA: UJRESEED fired 09:20 pass (bar=09:15 SHORT over LONG holder, opConf=0 heldConf=0 per UJOPCONF row, al=0 ok=1) - then S2SEEDBIAS_KILL same pass (sb=0; LTF stayed bullish: SEEDBIAS REJECT biasAligned=0 at 09:05/09:20/09:30/09:35 bars). His confirmation read (09:40 pass on the 09:35 bar) refuses B_BODY (oppCandle=1 bodyDir=0 body=6pts, confirm=0). TWO independent refusals: B2 kill (bias) + B_BODY confirm=0 (term). Even a B2 exemption would not admit without the term. Feed branch open: tester 09:35-bar direction vs his chart (spec 9.1 - chart join owed before attributing B_BODY to logic).
- HIS 11 June LONG (register B3): owed entry 14:40 open 160.524, his rule 14:35 retest+confirmation. EA contender rows (have=1 sbDir=LONG sbL=160.523): 14:35 bar reads o1=160.525 c1=160.522 c0=160.526 - strict fails (c1 1pt under L), armed reclaim fails (o1 2pts over L). Predicate correctly applied to tester values; take-deciding margin is 1-2 points on both arms. Feed branch open (his 14:30/14:35 OHLC vs tester). UJDEFERABORT 14:35 (SHORT squatter, S4) + SUPPRESSED stand; observation path (S3+YIELD-shape) works.
- HIS 5 June NY 16:15 (register B2): still no retest 16:05-16:40 (hits=0, detector gap carried); 16:45 retest + 16:55 late admit unchanged (hypothesized completion, never his bar).
- Churn observed: 13 reseeds incl. 6/9 same-POI alternation (Daily-POC/Weekly-VWAP flip-back chop) + 6/2 + 6/4 + 6/11 instances; H2 restarts per reseed so the timer never bounds churn (GLM A-4 confirmed empirically). Anti-flip guard stays parked (needs new carriage + his session-scope word).

## Grade vs register + vs RECON75

- Register: EU A1-7 untouched (no August run); UJ B1-3 all still missed (same bars, upgraded mechanisms); section-C invalids silent (8 June). NO-OVERFIT holds (no invalid taken).
- vs RECON75: takes 2/2 identical (bars/entries/exits/balance 10027.13/signals). HIS no-difference CONFIRMED at take level; his still-a-regression CONFIRMED (3 owed takes absent). Mechanism delta is the designed proof (single-print reseeds, al/ok carriage, attributable arms, expiry zero).
- Zero-counts: UJHOLDEXPIRE 0x re-proven by ABORT_HOLDER_EXPIRED 0x (two patterns); Test-stopped 0x; second-UJRESEED-per-event 0x (13 events, 13 rows).

## Next direction (v354 relay, two independent questions)

- Q1 rule-wins: B2 kill stood on sb=0 at the 09:15 reseed (holder lost, D5 answered by rows); al=0&ok=1 handling explicit. Which rule yields for the owed take - and does the 09:40 B_BODY refusal (independent of B2) stand on his chart?
- Q2 term/feed: 14:35 1-2pt margins + 09:35 direction - feed-join procedure (his chart OHLC) vs term-design; UJ-RERESEED predicate + arm-offline-derivation as grade procedure.
- No build, no run, no key asked here. EU excluded.
