# BUILDER SLICE B-147 - old level, candles, Part S rows, buffers (kept 585093BF)

## R1 old level, raw (pre-change parent 9861414, 2026-09-09; changed by d96fd5f T161M E1 pure-midline)
parent OrderblockMgr.mqh:37: `double mid = (obHigh + obLow) / 2.0;`
parent OrderblockMgr.mqh:39: `double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);`
kept OrderblockMgr.mqh:37-40: mid + charter-9 comment (level IS pure midline); :62-70 NewOrderblock(invLevel=mid)
kill test unchanged (closedBeyondInvalidation vs invalidationLevel, both versions)
ledger: T161N/pure-midline items 0; "midline rule" only item 1215 R2.3(a) FOUND (B70-XOB-REC)
Pine original: NOT FOUND (PineScript/ = HORC_OpeningRange.pine only)
3293 old level = max(1.16243, 09:20 open 1.16255) = 1.16255 (FOUND HIGHER, as his words say)

## R2 candles 8 Sep 09:20-16:55 (Tester/logs/20261009.log UJBARMAP; level 1.16255; BEYOND only 09:20 itself)
09:20 o=1.16255 h=1.16256 l=1.16230 c=1.16256 BEYOND (formation; cannot kill)
09:25 c=1.16245 below | 09:30 c=1.16229 below | 09:35 c=1.16230 below | 09:40 c=1.16248 below
09:45 c=1.16240 below | 09:50 c=1.16232 below | 09:55 c=1.16210 below
10:00 c=1.16223 below | 10:05 c=1.16207 below (A6: alive + touched, high 1.16232 in zone)
10:10 c=1.16190 below | 10:15 c=1.16174 below | 10:20 c=1.16142 below | 10:25 c=1.16147 below
10:30 c=1.16136 below | 10:35 c=1.16122 below | 10:40 c=1.16124 below | 10:45 c=1.16119 below
10:50 c=1.16100 below | 10:55 c=1.16128 below | 11:00 c=1.16133 below | 11:05 c=1.16101 below
11:10 c=1.16100 below | 11:15 c=1.16112 below | 11:20 c=1.16129 below | 11:25 c=1.16134 below
11:30 c=1.16147 below | 11:35 c=1.16146 below | 11:40 c=1.16116 below | 11:45 c=1.16128 below
11:50 c=1.16122 below | 11:55 c=1.16103 below | 12:00 c=1.16103 below | 12:05 c=1.16099 below
12:10 c=1.16117 below | 12:15 c=1.16118 below | 12:20 c=1.16116 below | 12:25 c=1.16116 below
12:30 c=1.16118 below | 12:35 c=1.16135 below | 12:40 c=1.16139 below | 12:45 c=1.16135 below
12:50 c=1.16134 below | 12:55 c=1.16140 below | 13:00 c=1.16121 below | 13:05 c=1.16128 below
13:10 c=1.16135 below | 13:15 c=1.16116 below | 13:20 c=1.16112 below | 13:25 c=1.16115 below
13:30 c=1.16102 below | 13:35 c=1.16099 below | 13:40 c=1.16093 below | 13:45 c=1.16106 below
13:50 c=1.16121 below | 13:55 c=1.16125 below | 14:00 c=1.16120 below | 14:05 c=1.16109 below
14:10 c=1.16106 below | 14:15 c=1.16140 below | 14:20 c=1.16143 below | 14:25 c=1.16154 below
14:30 c=1.16152 below | 14:35 c=1.16173 below | 14:40 c=1.16130 below | 14:45 c=1.16138 below
14:50 c=1.16098 below | 14:55 c=1.16133 below | 15:00 c=1.16143 below | 15:05 c=1.16142 below
15:10 c=1.16127 below | 15:15 c=1.16135 below | 15:20 c=1.16139 below | 15:25 c=1.16164 below
15:30 c=1.16185 below | 15:35 c=1.16163 below | 15:40 c=1.16158 below | 15:45 c=1.16186 below
15:50 c=1.16189 below | 15:55 c=1.16202 below | 16:00 c=1.16220 below | 16:05 c=1.16242 below
16:10 c=1.16237 below | 16:15 c=1.16234 below | 16:20 c=1.16252 below | 16:25 c=1.16224 below
16:30 c=1.16206 below | 16:35 c=1.16217 below | 16:40 c=1.16212 below | 16:45 c=1.16217 below
16:50 c=1.16225 below | 16:55 c=1.16220 below (A7: alive + touched, high 1.16230 = zone lo)
First beyond-level close after formation: NONE. Full o/h/l/c in TEMP scan log b147_r2 (uncommitted).

## R3 Part S rows (pack line = confirmation/B60C day-pack line; ids = alive+touched-after-promo; * = machine pick)
A1 10:00 8/28 pack 657: 1704,1728,1784,2109 (MACH MET; OLD same MET)
A2 17:35 9/1 pack 1532: 975,2275,2286,2289,*2549 (MET/MET)
A3 16:00 9/4 pack 2257: 2722,2787,2792,*2793 (MET/MET; close-state barT 1788537000 from full INCREMENTAL, 112 rows)
A4 09:20 9/7 pack 2730: 2722,2787,2792,2793,3126,*3130 (MET/MET)
A5 16:45 9/7 pack 3039: 2722,2787,2792,2793,3022,3126,*3130,3132,3139,3178 (MET/MET)
A6 10:10 9/8 pack 3194: 1704,1728,1784,2109,2149,2217,2896 (pick 2898 no post-promo touch) (MET/MET)
A7 17:00 9/8 pack 3397: same 7 (MET/MET)
B2 16:15 6/5 pack 1675: 2720,2945,1779,1405,2509,2648,*3308,1780,1949,3150,2566 (MET/MET)
B3 14:40 6/11 pack 2606: 1780,*3913,2945,3150,3672,1405,3686,3308,2720,3486,3705,2566,2509,1779,2648,1949,3836,3780 (MET/MET)
C-06-03 09:10 6/3 pack 1110: 1780,1405,*2930,2820,1949,2509,2928,1779,2566 (MET/MET)
C-06-04 09:55 6/4 pack 1397: NONE/NONE (3038/3046/3052 form-touched, zero promo-touched; pick 3052 absent)
C-05-27 beside pack 92: 1405,1949,1779,1780,2088,*2094 (MET/MET, never graded)
OTHER-GATE: B1 1609, C-06-02 984, C-06-10 2441, C-08-27 505, C-09-01-1530 1414, C-09-04-1040 2131, C-08-28-1625 970, C-09-08-1645 3379 (B-143 R2 killing lines)
Method: close-of-C state = barT C-minus-one (B-144 stamp); EU TARGETS groups + June full-INCREMENTAL barTs (all present); OLD alive = no close beyond max(mid,formation-open) after validation wall; touch = range overlap [promo,C]; 2796 EU + 3920 UJ log bars; swing-leg UNCHECKED.

## R4 buffer lines (kept indicator FlowLogic.mq5; selected pick only)
63-64 g_bufXobZoneHigh/Low; 113 g_bufXobObjId; 128 g_bufXobPromoTime
708-709 SetIndexBuffer 22/23; 727 buffer 31; 731 buffer 33 (= charter Task-113 promo-time export)
charter section 3:43 Task-113 promo export; spec 8 promotion-bar export needed
Full live list / per-XOB promo / per-XOB alive: NOT FOUND in EA-readable buffers. Ranges: readable.

(End of slice)
