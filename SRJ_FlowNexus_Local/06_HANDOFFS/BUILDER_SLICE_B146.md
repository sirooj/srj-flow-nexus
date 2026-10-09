# BUILDER SLICE B-146 - words source, level record, level table, R3 rows (kept 585093BF)

## B1 his level words, raw (operator message with the B-145 relay, this session; em dash E2-80-94)
"I, as the operator, would like to clarify that the XOB here, the midline of it, is not really the 0.5 level. The invalidation level is higher than the midline, so I should not call it, generally speaking, the midline level. It is the invalidation level because the close of the candle is higher for this bearish XOB. Although the 0.5 might be invalidated, the actual invalidation level has not been invalidated by a closer candle. I can provide a screenshot if you want. Just look at my rules: the midline level is not necessarily always the 0.5 level. If the body closure of the candle is more extreme—higher or lower respectively—then the invalidation level is not at the 0.5."
(ledger 1290: paraphrase only, not a verbatim source.)

## B5 earlier level record (date + file:line)
XOBSUIT-1 section 6 answer 1 (2026-09-09), BUILDER_FINDING_XOBSUIT-1.md:85-93: "no, only invalidation just like ordinary OB that got invalidated with a candle body closure beyond the midline" (full text lines 85-86; consequence 97-105).
CHARTER.md:146-152 XOB VALIDATION RULE: "What qualifies an XOB is the invalidation of it. When there is a candle body closure that closes beyond the XOB midline level." (+ 9.1 addendum 2026-09-09 at :158; EA has no independent check :149-151).
Include/SRJ/SRJ_OrderblockMgr.mqh:37-40: mid=(high+low)/2; charter-9 comment (level IS pure midline); :62-70 NewOrderblock(invLevel=mid). No other write site in Include/SRJ.
Later word governs: skill section 0 (spec+later-words canon).

## R1 level table, 3293 (zone 1.16230-1.16256; his level: higher than midline 1.16243, no price fixed)
candle | tester close | vs mid 1.16243 | his level | grade
09:20 | 1.16256 | above | UNKNOWN | UNKNOWN (formation; level unfixed)
09:25 | 1.16245 | above by 2 | UNKNOWN | UNKNOWN (level unfixed)
09:30 | 1.16229 | below | UNKNOWN | UNKNOWN
09:35 | 1.16230 | below | UNKNOWN | UNKNOWN
09:40 | 1.16248 | above by 5 | UNKNOWN | UNKNOWN (tester's kill candle; his level unfixed)
09:45 | 1.16240 | below | UNKNOWN | UNKNOWN
16:55 | 1.16220 | below | UNKNOWN | UNKNOWN
Every tester candle 09:20-16:55: level UNKNOWN (his words name no price and no setting candle). First beyond-level candle: UNDETERMINABLE. No EQUAL rulings (no fixed level to equal).

## R3 rows (machine-killed SHORT promoted; his-status UNKNOWN all)
EU dead at 16:55 close (barT-16:50): 3293 (promoT 09:40, machine kill 09:40); 3298 1.16229-1.16198 (startT 10:00, promoT 10:20, kill 16:00); 3324 1.16190-1.16145 (startT 14:35, promoT 14:50, kill 15:30)
June dead at 09:50 close (full INCREMENTAL barT-09:45 = 1780566300): 3107 159.898-159.868 (startT 08:55, promoT 09:05, kill 09:15)
B-145 live sets re-checked: A7 form-touched 1704/1728/1784/1891/2109/2149/2217/2896/2898(pick); promo-touched 1704/1728/1784/2109/2149/2217/2896. C-06-04 form-touched 3038/3046/3052(pick); promo-touched NONE. (Range-touch only; swing-leg UNCHECKED.)

(End of slice)
