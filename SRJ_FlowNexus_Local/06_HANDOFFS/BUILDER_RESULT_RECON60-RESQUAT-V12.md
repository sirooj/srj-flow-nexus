# BUILDER_RESULT_RECON60-RESQUAT-V12 (2026-09-25, G1-G4 graded: G1 PASS, G2 PASS, G3 PASS, G4 PASS)

## Authority (all present before the first gate pull)

- Packet 01_TASKS\PACKET_P-RESQUAT-1.md v12 405DB460/52763/378 (Q1 +81, Q2 +91, combined +172 NET, post 11502).
- Relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v270-RESQUAT-CLEAR11.md 0F1BDF87/70153/535 (twin transport record).
- Luna key PACKET_P-RESQUAT-1 v12 CLEARED one-build-one-run (5/5, SPENT HERE on this build+run).
- His words banked: run word (2026-09-24, build and run granted) + completion word (this session, run has completed please proceed).
- Stop-and-report mismatch condition checked green before grading (EA D74FE972/633552/11502 + packet 405DB460/52763/378 + relay 0F1BDF87/70153/535 + DONE present, all re-measured this block).
- Commit rule per his 2026-09-23 order (builder-called, commit after every build; result commit at grade time): build commit rides first, result commit rides this file.

## Execution record (S1-S5 on DONE)

- S1 green (record 733/734, carried): EA pre-hash 15A41634/622631/11330 exact + 12 anchors byte-matched + buffers 48/48 + names word-boundary + MSU/POI/GoAbort/ECB/detector gates.
- S2 applied E1-E9 exact-diff with per-edit byte-verify (E5 corrupt short-by-2 caught by count+diff and repaired by scripted range-replace, diff 0; E9 under-anchor owned as luck-not-discipline; record 734).
- S3 post: EA D74FE972/633552/11502 (differs from S3 0C0F179E: one-line stray-label neutralize post-S3-hash, +0 net; compiled 0/0 AFTER the fix - this digest is the built tree that ran).
- S4 compile 0 errors 0 warnings both targets (EA 6397ms + Flow 5841ms, RESQUAT-V12 logs re-read verbatim this block).
- S5 launched WMI_PID=9436 RC=0 instant, ceiling 90 respected, same envelope as RECON59 (InpMode 1, RECON50_DEMO_USD ini). DONE=PASSED 2026-09-25 06:10:01. Wall 0:51:08 (05:18:53 launch to 06:10:01 DONE; test passed 0:50:19).
- Segment: 06_HANDOFFS\RECON60-RESQUAT-V12_JOURNAL.log 4824FE61/6465733/34269 (wrapper-archived; STATUS terminal state PASSED; ARCHIVED_LINES 34269 == file lines 34269).
- Baselines: RECON59 7A7E74C0/6618090/34993 (6 takes).
- Feed identical to RECON59 (563338 ticks, 3168 bars; BIASCENSUS_FINAL byte-identical; ZONECENSUS_FINAL byte-identical; PROMOCENSUS 469/469; WS161 loads/stores 3168/3168 mismatch 0 - changes 208 vs 212, itemized below).
- Final balance 10450.09 (delta -48.96 vs 10499.05 with DIFFERING deal sets by construction - EA-driven, diagnosed below, no residual claim).
- Tabulation: machine pulls same-method both sides (.Contains parity; zeros re-proved) in 06_HANDOFFS\RECON60-RESQUAT-V12_TABULATION.txt (173 lines).

## Realized delta (packet novel-evidence vocabulary)

- DELIVERED (a) first 9/1 take on the suppressed tree: SIGNAL 17:35 LONG Monthly-VWAP R=1.17 + MTSNAP 17:30 + PRE-SEND entry 1.16024 exact + EXECUTED fill 1.16024 + ENTRY_TICKET ticket=4 pid=4 ppid=4 + deals #4/#5 + MTEXIT/MTLIFE SL chain (tab L85, L103, L105, L115, L117, L124-L125, L149-L150).
- DELIVERED (b) first executed BREAK + DAY_CLOSE fills with retcodes: MTCLOSE 8/28 11:40 leg=POI_BODY_BREAK action=1 retcode=10009 deal=3 + MTCLOSE 9/4 23:55 leg=DAY_CLOSE action=1 retcode=10009 deal=7 (tab L88-L89; JOIN ref==exit MATCH x2, tab L90-L91).
- DELIVERED (c) suppression census rows with takes intact: EVICTSUPPRESS bar= 3 (08-31 + 09-01 + 09-04 ARM rows) + RESEED_BLOCKED SKIP 3 (08-31 x2 + 09-01 17:00) + EVICTSUPPRESS_FIRE 1 (09-01 17:35, same bar as the take) + 7/7 takes with S5->SIGNAL 7/7 (tab L29, L56-L58, L83).
- DELIVERED (d) proved-flat closes with pid-authoritative joins under the hedging-only gate: flat=1 on both MTCLOSE rows; closepid==entryPid in-row (2==2, 6==6); closepid==ENTRY_TICKET pid (2, 6); closeentry==1 (exit class) x2; no live pid remains; zero SL/TP/HTF/CANCEL legs (tab L88-L89).
- DELIVERED (e) self-contained success rows: ENTRY_TICKET 7/7 nonzero ticket with pid==ppid nonzero (tab L55, L76; rows: tickets 2/4/6/8/10/12/14).
- Mechanism dividend (causal, quoted): 60 introduces ZERO new aborts (ABORT set-diff only60=0, tab L118) while the 3 chain-death ABORTs of 59 are gone: 08-31 18:20 FRESH_OB_DEAD S4 Yearly-POC LONG (08-31 re-squat death) + 09-01 17:50 FRESH_OPP_FVG S4 Yearly-POC LONG (re-squatter death, too late in 59) + 09-01 19:05 SESSION_CLOSED S1 Yearly-POC SHORT (chain residue) (tab L119-L121). 59-side re-seeds that 60 suppresses: 08-31 17:00 Yearly-POC SEED + 09-01 16:55 Yearly-POC SEED (seg59 rows pulled this block); 59-side squat that blocked the winner: 09-01 17:30/17:35 SUPPRESSED Yearly-POC-held rows (cum_n=69/70).

## Acceptance grades

- G1 PASS: 0/0 both targets; post-hashes recorded (D74FE972/633552/11502); budget 11330 + 172 = 11502 from literals (S3 recount governs).
- G2 PASS: 9/1 take 17:35 entry 1.16024 with the full SIGNAL/MTSNAP/PRE-SEND/fill/ENTRY_TICKET chain (nonzero ticket, persisted pid) - hard gate now TAKES. Other takes identical bars/entries (MTSNAP/MTEXIT/MTLIFE set-diffs carry only the 9/1 rows, tab L102-L103/L114-L117; PRE-SEND diffs are the 9/1-new row plus lots-only on 4 shared rows, tab L104-L113). 9/4-invalid still refused (10:35 S4 FRESH_OPP_FVG + 10:40 S5 FRESH_VETO triplets, pulled this block). MTCOLLISION 0/0 + COLLISION 0/0. EVICTSUPPRESS-bar 3 == DIV_FALLBACK S5-origin ABORT 3 (tab L79). EVICTSUPPRESS_SKIP 0, RESEED INDEX-INVALID 0. RESEED SKIP post-16:55 = 1 (09-01 17:00 row). F-a tuple join holds on all 3 SKIP rows (08-31 pair match 08-31 EV tuple; 09-01 row matches 09-01 EV tuple). FIRE 1 <= ARM 3 with a take in the armed session (FIRE 17:35 == take bar). Day-key join: FIRE day=2026.09.01 == EVICTSUPPRESS untilDay=2026.09.01 for NYAM. R-a: SESSION_LIMIT 09-01 17:40 post-take with exactly one 9/1 PRE-SEND; 7 PRE-SENDs in 7 sessions, never a double-send. ANCHOR_ELECT Monthly-VWAP at 17:00 (next evaluation after the 16:55 eviction). SUPPRESSED Yearly-POC-held rows in 17:00-17:35 = 0 (two differently-formed probes, tab L81-L82). No unpredicted election delta: POIREPLACE +1 sits at 09-01 17:15 inside the predicted span (documented non-preempt, tier 1 vs held tier 3); ANCHOR -2 are the two suppressed re-seeds; every other delta day-localizes to 08-31/09-01 (tab L94-L96).
- G3 PASS: identical - feed/census/TP_TOUCH 9/9/FRESH_VETO 12/12/TP_RR_FAIL 16/16/LTF_MISALIGN 60/60/DIV 9/9/S5->ABORT 10/10/DIV_WAIT 8/8/CONFIRM 4/4/PREEMPT 15/15/LTFFLIP 16/16/XOB 469/469/BIAS+ZONE byte-identical/WS161 loads/stores/mismatch identical. Deltas itemized with venue: take-additive (SIGNAL/MTSNAP/PRE/EXIT/MTLIFE/EXITVERDICT-slice/TP_ELECT-slice/SESSION_LIMIT/POIREPLACE-slice/orders/deals +1 take; EXITCENSUS +48 all on the take open bars 17:35-17:50 LONG, tab per-day L96; EXITVERDICT +4 and TP_ELECT +1 all 09-01) + chain-subtractive (ABORT/A6REFUSED/FRESH_OPP_FVG/FRESH_OB_DEAD/STAND-DOWN/SESSION_CLOSED-slice/SUPPRESSED/FRESHCOUNT/TPCENSUS/CHAIN/HEADS-UP/ANCHOR-slice/VETOCLEAR-slice, all on 08-31/09-01 except the single 09-02 SHORT day-clear downstream of the 09-01 chain) + new-print families (MTCLOSE 2, ENTRY_TICKET 7 - predicted) + lots-second (8/28 2.38 and 9/4 0.57 identical pre-divergence; 2.50/2.48, 3.90/3.92, 1.95/1.96 re-derived downstream of the diverged balance path, entries/bars identical). MTCLOSE joins: ref==exit MATCH x2; pid triple-match x2; closeentry==1 x2; flat==1 x2; retcode DONE 2/2; MTCLOSE_FAIL 0; action=0 0; SKIP-NO-SEND 0; NOTHING-TO-CLOSE 0. WS161 changes 208 vs 212 (loads/stores/bars identical; residual mechanism, same class as 58/59).
- G4 PASS: 8/28 close 11:45 fill 1.16440 vs ref 1.16439 (1pt spread, bar-granularity tolerance); stop fill 1.16510 gone (no ticket-2 deals after #3; 59-side row quoted tab L136/L161). 9/4 flatten 00:00:07 fill 1.16093 exact vs ref; target fill 1.16307 gone (no ticket-6 deals after #7; 59-side row quoted tab L140/L165). Other exits identical bars/reasons/entries/fills (MTEXIT set-diff carries only the 9/1 SL row; 9/7 TP 1.16201/1.16315, 9/8 TP 1.16102 + SL 1.16275 same prices both runs). DAY_CLOSE 4 = 3 + the MTCLOSE row of the same 23:55 event (tab L15).
- L-final: G1 PASS / G2 PASS / G3 PASS / G4 PASS. Scope delivered whole: first 9/1 take + first executed verdicts + suppression census with takes intact.

## 9/1 take chain (read-only on the segment, same block)

- 16:55 the squatter aborts (Yearly-POC LONG, DIV_FALLBACK, S5_GATE_CHECK) - eviction fires at the predicted venue (DIV triplet pulled this block).
- 16:55-bar keys the suppression tuple (EVICTSUPPRESS bar=2026.09.01 16:50 poi=Yearly-POC dir=LONG sess=NYAM untilDay=2026.09.01 action=ARM).
- 17:00 the re-seed is refused by name (RESEED_BLOCKED bar=2026.09.01 16:55 evictedDay=2026.09.01 action=SKIP) - no S1-to-S4 walk, no HEADS-UP, no holder.
- 17:00 ANCHOR_ELECT Monthly-VWAP rank 7 tier 3 LONG SEED (next evaluation elects the winner line).
- 17:35 S5->SIGNAL + ALERT SRJ SIGNAL LONG Monthly-VWAP NYAM R=1.17 + PRE-SEND lots=2.05 entry=1.16024 + EXECUTED fill=1.16024 (R_executed=1.08, spread cost 0.09) + ENTRY_TICKET ticket=4 deal=4 pid=4 ppid=4 + deals #4/#5.
- 17:35 FIRE clears the session set (EVICTSUPPRESS_FIRE sess=NYAM day=2026.09.01); 17:40 SESSION_LIMIT seals NYAM (R-a).
- 17:50 the take stops (MTEXIT SL entry=1.16022 exit=1.15975; deal #5 sell 2.05 at 1.15975). Entry reproduced exact; exit is the broker SL - his 17:45 early-exit reference stays tolerance-open on record (no question asked).
- Alternatives tested: session marks (LIMIT prints once per take session, 7/7, no double-send - rejected as blocker); R floor (R_logged 1.17 >= 1.0 - rejected); S5 divergence (S5->SIGNAL fired - rejected); CQD (no veto on the winner bar - rejected as blocker); lots (2.05 derived, graded second - rejected as cause).

## Balance note (EA-driven, never a residual)

- Deal sets differ by construction (14/14 vs 12/12): +9/1 entry/SL pair; 8/28 exit 1.16440 (BREAK close, +26pts) replacing 59 SL fill 1.16510 (loss); 9/4 exit 1.16093 (DAY_CLOSE flatten, +74pts) replacing 59 TP fill 1.16307; ticket sequence shifted +2 downstream of the inserted 9/1 pair with lots re-derived (see G3). Balance MUST differ (-48.96); no swap/commission rows carry it as non-EA. Contrast 59 (-7.08 on tick-identical deals, carried as broker-accounting residual). G-grades rest on bars/entries/fills, all proven above.

## Goal join (window 08-26 to 09-09; scoreboard re-joined)

- HIT - 8/28 London SHORT (entry/bar identical; exit now 11:40 BREAK close fill 1.16440 vs his 11:35 body-break exit - converged to a 1-bar verdict delta with the stop-loss exit gone).
- HIT - 9/4 NY LONG R1.66 (entry identical; exit DAY_CLOSE flatten bar 23:55 vs his day-close-minus-5 rule - the verdict bar IS 23:55, rule-matched).
- HIT - 9/7 London LONG R1.76 + 9/7 NY LONG R2.34 (entries/bars identical; lots re-derived only).
- HIT - 9/8 London SHORT R1.94 + 9/8 17:00 SHORT (entries/bars identical; lots re-derived only).
- TAKE-NOW - 9/1 NY LONG (his VALID row; tester takes 2.05 at 1.16024 exact, SL 17:50 - entry HIT, exit tolerance-open, no question).
- REFUSED - 9/4 10:40 INVALID SHORT (S5 FRESH_VETO preserved).
- Rejects silent (no 8/28 NY signal; 14 fills == 7 signals + 7 broker exits). Deployment bar SHUT (no live money ever; full-journal open; 9/1 exit-tolerance ruling open).

## Cost and next

- Cost: one build (E1-E9 suppression record + gate + arms + executor + sole resolver, STAGE-1 gated) + one run 0:51:08 wall (90 ceiling respected; test 0:50:19) + Luna key RESQUAT-1 SPENT. Novel evidence delivered: all five packet items (a) through (e) with rows.
- Next: no packet drafted here; any follow-on (9/1 exit-tolerance join, full-journal span) goes via council route on his scope word. No transport owed (grading turns carry no transport ask). Result commit follows this file (builder-called).

(End of file)
