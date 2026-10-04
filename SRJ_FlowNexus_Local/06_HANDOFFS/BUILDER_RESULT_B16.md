# BUILDER RESULT B-16 - the two extras die silent in RECON62, R-refused in-between, fired after the skip; no banked rule kills either (measurement + banking record)

Step 0 raw, Part A start gate (measured 2026-10-04, terminal disk):
- A1 git log -1: cc7dca4 on builder/B-15 (as expected). git status --short line count: 58. Branch builder/B-16 cut from cc7dca4.
- A2 SHA-256 prefix checks, all pass, no STOP: EA F04AF9C3... (685444 B); HTFEngine D5FD5B06...; FlowLogic.ex5 27B5F272...; EA.ex5 D7DEA923....
- A3 skill SHAs: .opencode copy B5DC5BD0... (123 lines, full source sections 1-9); .agents copy AEE595D2... (12 lines, stub, no section headings - difference reported, no reconciliation). Backup .opencode SKILL.md.preB16 = B5DC5BD0 (never committed).
- A4 journals, all present: (j1) RECON62-DAY2355-FULL_JOURNAL.log 6463131 B; (j2) RECON62-B11R1_JOURNAL.log 9550913 B (before-edit run, balance 10061.88); (j3) RECON62-B15R1_JOURNAL.log 9495742 B (trial run, balance 10101.97).

## Part B - why each extra was silent before (raw rows, then one plain line)

X1 8/27 17:05 SHORT D-POC. j1: seed S1 17:00 (CONFIRMPOLL 17:00 confirm=1 on the 16:55 bar), then nothing - no S2 continuation and no kill row in-window (died unconfirmed S1). j2: seed S1->S2->S3, UJALIGN_BYPASS on 17:00 (m15=-1.0 rf=1), S5 armed, ELIGSTATE rLive=0.19 tp=1.16510, TP_ELECT R=0.19, SLNONFIRE RR_FAIL, ABORT TP_RR_FAIL. j3: BYPASS, S5, ELIGSTATE rLive=2.73 tp=1.16322, SIGNAL R=2.73, UJ1R PASS x2, FIRED (deal #2 at 1.16524, BREAK exit 1.16513 deal #3).
X2 9/1 09:55 LONG W-VWAP. j1: no LONG setup at all (SHORT polls only: TPCENSUS SHORT winners YNYL, CONFIRMPOLL SHORT confirm=0). j2: SHORT polls FAIL R=0.32/0.43, LONG holder S4 (Weekly-VWAP), ELIGSTATE rLive=0.89 tp=1.16052, SLNONFIRE RR_FAIL, ABORT TP_RR_FAIL. j3: SHORT polls PASS R=1.36/1.56 (no fire), LONG S4->S5, ELIGSTATE rLive=1.81 tp=1.16077, SIGNAL R=1.81, FIRED (deal #6 at 1.16031, SL exit 1.16001 deal #7).

B1 table (bar | j1 | j2 | j3):
- X1 17:05: j1 no booking (S1 stall) | j2 tp=1.16510 R=0.19, death TP_RR_FAIL | j3 tp=1.16322 R=2.73 fired.
- X2 09:55: j1 no LONG setup | j2 tp=1.16052 R=0.89, death TP_RR_FAIL | j3 tp=1.16077 R=1.81 fired.
B2 targets won in j2 but dropped by the skip in j3: X1 - TPCENSUS #68 winner=LIVE best=1.16510 (SHORT ref 1.16524, distPts=14); origin unresolvable on record (no session-extreme print equals 1.16510 in either journal; won 8/27 polls so origin <= 25 Aug by the pool range gate); first printed straddle 26 Aug 17:00 (hi=1.16532, both journals). X2 LONG - TPCENSUS #127 winner=LIVE best=1.16052 (ref 1.16028, distPts=24); origin <= 26 Aug (already won 8/28 polls #85); first printed straddle 28 Aug 17:20 (hi=1.16094).
- Plain line: YES for both - each j2 kill was a sub-1R refusal on an already-taken line (X1 R=0.19 on taken 1.16510; X2 R=0.89 on taken 1.16052).
B3 what killed each extra in j1: X1 - S1 stall (T1 tree has no carry machinery: NOMATCH/BYPASS counts are 0 run-wide, so nothing continued the seed). X2 - absent (no LONG formed).
- Plain lines: j1's silence differs from j2's R-refusal in kind, not degree - j1 never carried either setup (no BYPASS path exists in that tree); j2 carried both via BYPASS (rf=1 on X1) then refused them at the R-gate on taken lines; j3 carried both and booked past the skipped lines. RECON62's silence comes from the missing carry path (plus the missing pool itself: j1 admitted lists carry session/POI names only, zero LIVE:/PD: rows), never from a rule.

## Part C - record-first, his words only (zeros re-proved with two differently-formed patterns)

C1 8/27 decline: his chart ruling (RETEST-INVALIDATION-V1 Ruling 3): "8/27 that is the correct exit, but the entry is WRONG! ..." - the 18:20 entry. FAMILYPASS packet rule (v147-FAMILYPASS-FRESH-ISSUE line 291): "MUST-SILENT every declined day (8/26, 8/27, 8/31, 9/1, 9/2, 9/3, 9/9 + his-invalid rows)".
- Plain line: his words cover only the 18:20 setup; whole-day silence is council packet machinery, not his words.
C2 9/1 09:55 London LONG: swept 77 findings (sole hit is a Sep-8 chain, false positive); skill (only 8/28 + RECON51 09:55 hits, never 9/1 09:55); ledger (no 9/1-09:55 string, two probes); journal (LDN rows 265 sub-1R Y-AVP reject + 266 MR no-take - neither is the 09:55 W-VWAP LONG).
- Plain line: no ruling found for the 9/1 09:55 London LONG.
C3 kill-rule walk (rows from Part B): X1 (NYAM, TREND, R 2.73, first take, no live position): 5M-FLIP-KILL - no flip rows in window; 2-of-3 - no FRESHCOUNT/VETO rows; FRESH-SWEEP - mean-reversion only, N/A; OWN-SOURCE - target line unnamed, cannot claim; LIVE-TRADE/one-per-session - no block; sessions - NYAM ok; 1R - passes.
- Plain line: no banked rule kills the 8/27 17:05 SHORT (rows j3 7308-7522).
X2 (LONDON, TREND, R 1.81, no live position): same walk, same absences (no flip, no fresh rows, TREND so no sweep rule, target line unnamed, session free, R passes).
- Plain line: no banked rule kills the 9/1 09:55 LONG (rows j3 13883-14012).
C4 9/1 17:35 15m at 16:50-17:35: HTFAUDIT hits are exit-mechanics (16:45 open-instant vs 17:30 confirmed read), SLDEF5 is 9/8 regime; B-15's 9/7-9/8 search was also empty and is not repeated.
- Plain line: no ruling found for his 15m chart words at 9/1 16:50-17:35.

## Part D - the 15m guard at the three missing valid takes (read-only)

D1 guard reads from UJALIGN rows in j3 (M15-bar OHLC: the history container is proprietary and my partial parse never reached file-validated status - OHLC half unmeasurable, stated, not inferred):
- 9/1 LONG: bull at 16:45/17:00/17:05/17:10 bars, bear at 16:50/16:55 (rows 15289-15473). Plain: guard read with the trade on four passes, against it on two - including bear on 16:50 + 16:55 mid-window.
- 9/7 LONG: bull on 09:00, bear on 09:05/09:10/09:15 (rows 25901-26006). Plain: bear on every bar after the seed bar, including bear on the 09:15 confirmation bar at the 09:20 pass.
- 9/8 SHORT: bear on 10:00, bull on 10:05 (rows 28673/28729). Plain: aligned on 10:00, flipped against the short on the 10:05 confirmation bar at the 10:10 pass.
D2 provenance: the guard comment reads [P-UJIMPL-IMPL-1 v8 IE2] (EA 9068) - added by the V8 relay. Authorizing pin: no pin found (GATE-AUTHORIZATION, skill section 8 line 115, demands a quotable pin for every gate and names the seedbias gate as shipless; B-12 D1 already established no universal 15m mandate exists on record).

## Part E - banked the two B-15 carried items (conflict check first: none found)
- TAKEN-LINE-NOT-A-TARGET restates spec 3.7 L187 + NEAREST-ONLY-TP + instances (all present, no contradiction). SWEEP-TEST-STRICT restates his two no-tolerance verbatims (both banked: NO-TOLERANCE section 5, TOUCH-OR-BREAK section 7); no skill line endorses any sweep buffer (the v226 open item was council text, never skill). No contradiction - appended section 10 to the .opencode copy only (the .agents copy is a 12-line stub; no reconciliation).
- Edited copy: SHA-256 3DEA0519F1570613B1B8D903E8EBB38E8EEE21813EAF59DE82918D9B2E2ECC1D, 127 lines (was 123). .agents copy untouched (AEE595D2...).

### Journal-code glossary (codes cited above, few words each)
- STATE S1-S4 (+S5 edge): lifecycle. ANCHOR_ELECT/SEED: election/seed. SIDE1T_SEEDBIAS (CONSIDER/REJECT-BIAS-TIMING): seed bias. CONFIRMPOLL/CONFIRM_STRUCT_FAIL (A_OPP): confirmation. TPCENSUS (winner/best/distPts/admitted): target census. TP_ELECT (shadow/entry/sl/tp/R): election. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility. SLNONFIRE (RR_FAIL/wouldFire): no-fire. UJ1R (POLL/FIRELOCAL/FAIL/PASS): R check. ZONESHADOW: zone R print. UJALIGN_PASS/NOMATCH/BYPASS (m15/rf): 15m guard + votes. SUPPRESSED (HELD/SUPERSEDED): holder. ABORT (TP_RR_FAIL/LTF_MISALIGN): abort + reason. A6REFUSED: refusal. SIDE1C_BOTHDIRS: direction check. UJDEFERABORT: deferred abort. FRESHCOUNT/FRESHVETO: freshness. SIDE1Y_PDSESS (pdAsiaH/pdLondonH/pdNyH/pdPmH): previous-day session extremes. SWINGPICK/SWINGDUMP/S3INPLAY: swing/zone bar prints. SEL52CTX/A6TERM: stop selection. EXITVERDICT: exit verdict. SLADDER/SLADMARK: stop ladder. IDCHANGE: candidate identity. ALERT SRJ SIGNAL: entry signal. MTEXIT: managed exit. BIASCENSUS/ZONECENSUS/WS161_CENSUS: end censuses. HEARTBEAT: wrapper progress.

## Final disk state
- EA F04AF9C3 on disk (685444 B, unedited, uncommitted). EA.ex5 D7DEA923 matches it. HTFEngine D5FD5B06. FlowLogic.ex5 27B5F272. terminal.ini [Tester] still June USDJPY (verified this turn: Symbol=USDJPY, 1780272000/1781308800). No terminal running. STOP-B check at close: EA/EX5 SHAs re-verified unchanged (F04AF9C3/D7DEA923), terminal.ini untouched - nothing to restore.

## Carried note (for the planner; B-17 per its plan)
- C2 + C4 ended "no ruling found". In trader words: "On 1 Sep London, you show a morning setup but no 09:55 long from the weekly VWAP at 1.16031, stop 1.16001, target 1.16077 - did you take it, skip it, or was it never a setup?" / "On 1 Sep New York, your 15m read between 16:50 and 17:35 - what did it show on the bars into your 17:35 long at 1.16024?" Reaches him only through the planner, and only if B-17 still needs it after C3 (no banked rule kills either extra, so both bars are trade-call candidates).
- D1 M15-OHLC half unmeasurable (proprietary history container; guard-vote half complete from UJALIGN rows).
- Branch note stands: 23152ca + 2531837 stay on builder/B-13 (23152ca local-only unpushed); builder/B-16 was cut from cc7dca4 as listed.

(End of file)
