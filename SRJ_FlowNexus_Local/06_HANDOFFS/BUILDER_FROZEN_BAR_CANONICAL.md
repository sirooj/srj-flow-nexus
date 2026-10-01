# BUILDER FROZEN-BAR CANONICAL EVENT SET - version 1 (produced by grade V369, 2026-10-01)

Source: `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_REGISTER_VALID_TRADES.md` (his audited trades; transcription only, nothing inferred, UNKNOWN where unknown).
Serialization: take_id | evaluated_bar | pass_time | entry_bar | line_name | entry_price | outcome_class | reason. Take id = date|session|pair|direction|entry-time, server-time strings, no conversion. Entry time sits in the id and in the entry triple by design. Comparison = set equality on exact records, order-free; duplicate take ids rejected. Taken list = the 8 TAKEN-valid events. Event set = all 17 events below.

## TAKEN-valid (8)

1. 2026-08-28|London|EURUSD|SHORT|10:05 | UNKNOWN | UNKNOWN | 10:05 open | D-VWAP | 1.16466 | TAKEN-valid | exit 11:40 BREAK D-POC 1.16439; his anchor-rank ruling
2. 2026-09-01|NewYork|EURUSD|LONG|17:35 | 17:30 retest+confirmation bar per his words, row-shape unverified | UNKNOWN | 17:35 open | Monthly-VWAP | 1.16024 | TAKEN-valid | journal row 301, valid-taken-not-taken-by-him per his 2026-09-23 ruling
3. 2026-09-04|NewYork|EURUSD|LONG|16:00 | UNKNOWN | UNKNOWN | 16:00 | UNKNOWN | 1.16019 | TAKEN-valid | journal rows 277/279; 0.84 retired flawed per him; BOTH-TRUE trend+meanrev per him
4. 2026-09-07|London|EURUSD|LONG|09:20 | UNKNOWN | UNKNOWN | 09:20 open | AS.H booked nearest per his rule-choice | 1.16138 | TAKEN-valid | journal row 281; sweep-then-retest per his chart proof
5. 2026-09-07|NewYork|EURUSD|LONG|16:45 | 16:40 bar per his chart proof | UNKNOWN | 16:45 | W-POC | 1.16264 | TAKEN-valid | seed 14:55 stands before 16:40 confirm; journal rows 283/284
6. 2026-09-08|London|EURUSD|SHORT|10:10 | UNKNOWN | UNKNOWN | 10:10 | UNKNOWN | 1.16205 | TAKEN-valid | SEP8 ruling VALID
7. 2026-09-08|NewYork|EURUSD|SHORT|17:00 | 16:55 bar booked hits=1 per his confirmation rule | UNKNOWN | 17:00 | UNKNOWN | 1.16220 | TAKEN-valid | SEP8 ruling VALID; 16:40 correctly blocked R0.68 under his 1R floor
8. 2026-06-03|London|USDJPY|LONG|09:10 | UNKNOWN | UNKNOWN | 09:10 open | UNKNOWN | 159.929 | TAKEN-valid | TP_TOUCH 09:55 at 159.983; valid-taken per his 4-valid word 2026-09-27

## MISS (3, known gaps: absent-as-takes in the taken list, may become takes through fixes)

9. 2026-06-05|London|USDJPY|SHORT|09:45 | 09:35 retest bar | UNKNOWN | 09:45 open | Daily-POC | owed | MISS | confirmation 09:40 bar; entry 09:45 open per his message-C words
10. 2026-06-05|NewYork|USDJPY|LONG|16:15 | UNKNOWN | UNKNOWN | 16:15 | Old high 160.723 April-30th day high per him | owed | MISS | pool blind past 10 days; retarget commissioned per him
11. 2026-06-11|NewYork|USDJPY|LONG|14:40 | 14:35 retest+confirmation bar | UNKNOWN | 14:40 open | Daily-POC anchor per his A2 | owed | MISS | 14:40 pass confirm=1 then FRESHCOUNT HOLD on fvgDead; his rule: FVG irrelevant post-flip

## INVALID-silent (6: no take and no alert emission; reject prints allowed)

12. 2026-09-04|10:40|SHORT | UNKNOWN | UNKNOWN | UNKNOWN | in-bias POI | tester TP_TOUCH win | INVALID-silent | INVALID-WINNER per him: in-bias FVG invalidated + OPP validated
13. 2026-09-01|15:30|take | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | tester-only | INVALID-silent | TESTER-ONLY: never his, absent from his 7
14. 2026-08-27|take | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | tester-only | INVALID-silent | TESTER-ONLY per him: last valid retest 18:05, dead by 18:10/18:15 closes
15. 2026-08-28|16:25|take | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | tester-only | INVALID-silent | DECLINED: vs his decline, E6-only
16. 2026-09-08|16:45|declined | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | never valid | INVALID-silent | DECLINED by him, never valid
17. 2026-08-28|NewYork|news-bar | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN | no take | INVALID-silent | FALSE-ALERT: A1 kill-all decline owns it, not EA defect

## Invalid classes (4, representatives for the slice manifest)

- INVALID-WINNER: event 12 (4 Sep 10:40)
- TESTER-ONLY: event 13 (1 Sep 15:30)
- DECLINED: event 16 (8 Sep 16:45)
- FALSE-ALERT: event 17 (8/28 NY news bar, time undisclosed on record)

(End of file)
