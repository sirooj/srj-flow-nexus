# REPORT/SEPARATORS_EU_B207 - three would-be fixes measured on rows (euro only; verdict MEASURED)

Scope: EURUSD only per his EU-FIRST order. Sources: committed RECON62-B206T packs (A-rows, except FRESHCOUNT -
not in the B-206 recipe - cited from EU day packs, same build/bars/ticks, disclosed per row), new EU0525TD-B206T day
packs (101 days, 48 tags + B205FOMC + FRESHCOUNT + OBPROV, session windows, CRLF), on-disk CUTs for method rows.
No source edit, compile or run. S tables use committed pack lines only.

## R1 - rule words first (skill lines + spec; NO RULE WORDS flagged)
- (a) In-bias OB kill: close beyond the invalidation level kills (skill 231: the level is higher than the midline for
  a bearish XOB; a closer candle that has not passed it kills nothing). Machine shape: OrderblockMgr 123-133
  (close beyond ob.invalidationLevel, activated on a prior bar only) gated by 168-180 (flag flips only when the killed
  OB is in-bias AND invalidationBar >= currentStructureStartBar AND validation/invalidation bars differ). Wick through
  a block: NO RULE WORDS (his wick rule, skill 41, is FVG-only).
- (b) In-bias FVG kill: wicked through its entire range or body-closed through (skill 41); otherwise the untested
  remainder stays the POI.
- (c) Opposite FVG validated: banked as a count term (skill 57: 9/4 INVALID on in-bias FVG invalidated + OPP validated;
  skill 342: 10 June not valid on validated OPP FVG). Validation mechanics: NO RULE WORDS (machine: OPP creation to a
  persisted flag, skill 57 - never ruled).
- (d) 2-of-3 count, pre-confirmation only: spec 3.4 L111-118 (two or more adverse of in-bias OB dead / in-bias FVG dead
  / opposite FVG validated invalidates; his verbatim combos; explicitly pre-confirmation, never after the confirming
  close) + skill 116 (5M-FLIP-KILL cite) + skill 57 (CheckFreshness kill pre-confirmation only, his Q4). Machine: EA
  2770-2780 (kill only when twoOfThreeKills), callers EA 8388 (false at S5_GATE_CHECK) and EA 7606 (false at S5).
- (e) XOB in play / retrace: spec 3.5 L131 (penetrated by a bar's range or a confirmed protective-side swing within the
  current leg, no recency/bar-count) + B-91 skill 201-203 (retrace IS in play, one thing) + 4 June skill 198/217/221
  (no retest of XOB in play). Machine: B177HZ EA ~10452-10480 (gapTouch OR xobWin presence test; never side-vs-stop,
  never kill-state).

## R2 - block state (D1b)
- 25 June 10:00 bearish OB: his words place it at the 10:00 candle (skill 343; B196BAR 10:00 o/h/l/c
  1.13529/1.13587/1.13524/1.13582). Machine rows carry no range or invalidation level for it (unpromoted OB - levels
  NOT PRINTED). No invalidation event on rows anywhere in 09:30-10:45 (zero SRJ INV rows - printed only inside the
  indicator debug window - and zero OBPROV code=1/2 in the whole EU CUT). FRESHCOUNT obDead=0 on every pass from the
  10:35 seed to the 10:45 entry (EU/06-25 #1176,#1185,#1204,#1206, all fvgDead=1 oppFvg=0 adv=1 HOLD). FOUND cause: the
  machine's close-beyond-level trigger never fired for this OB on rows, so the flag never flipped. First candle
  meeting his kill words: NOT DETERMINABLE (no printed level to close beyond).
- 22 July 5m in-bias OB: same shape. B196BAR 14:25-14:50 o/h/l/c on rows (EU CUT); no SRJ INV / OBPROV code=1 in
  14:25-14:55; obDead=0 on #2482 (S3 pre) and #2504/#2506 (S5 post), fvgDead=1 adv=1 HOLD throughout. FOUND cause: same
  (trigger never fired on rows). Kill candle: NOT DETERMINABLE (level NOT PRINTED).

## R3 - confirmation-pass freshness counts (adverse terms; S5 HOLD rows prove the skip)
- 10 June 16:10: o0 f1 p1 adv2 ABORT/pre (EU/06-10#3126) + HOLD/post (EU/06-10#3149,#3151). EA 8388 passed false here.
- 25 June 10:40: o0 f1 p0 adv1 HOLD pre+post (EU/06-25#1176,#1185,#1204,#1206).
- 22 July 14:50: o0 f1 p0 adv1 HOLD pre+post (EU/07-22#2482,#2504,#2506).
- A1 10:00: o1 f1 p0 adv2 ABORT/pre (EU/08-28#797) + HOLD/post (EU/08-28#816,#818).
- A2 17:30: o0 f0 p1 adv1 (EU/09-01#4545,#4554,#4573,#4575). A3 15:55: o0 f1 p0 adv1 (EU/09-04#3574,#3583,#3599-3603;
  cross-run citation, RECON CUT #653-656 same flags). A4 09:15: adv1 (EU/09-07#358,#368,#386,#388). A5 16:40: adv1
  (EU/09-07#4597,#4606,#4624,#4626). A6 10:05: adv1 (EU/09-08#1061,#1070,#1093,#1095). A7 16:55: adv1
  (EU/09-08#4643,#4652,#4669,#4671).
- 8 takes print no FRESHCOUNT at confirmation (26May, 28May, 29Jun, 8Jul, 15Jul, 28Jul, 2Sep, 22Sep): count 0
  (EA 2777 prints only when adverse>0).
- Confirmation-pass skip spot: EA 8381-8388 (S5_GATE_CHECK calls CheckFreshness with false -> HOLD) and EA 7606.

## R4 - stop leg vs zone (entry/sl from TP_ELECT; zone+formation from B201FROM; leg bars from B196BAR; B177HZ beside)
- Method: leg = zone formation -> confirmation candle; penetration = any leg bar's range overlapping the zone
  (spec 3.5 first test); side LONG: FAR-SIDE if zoneHi<stop, STRADDLE if zoneLo<stop<=zoneHi else BETWEEN
  (SHORT mirrored). No distances (his standing prohibition).
- A1 10:05 e1.16466 sl1.16508, z1.16492-1.16507 f06:40: NOT-REACHED (nearest 09:55 h1.16491, 1pt short, RECON_W1#7591;
  INPLAYCOMMIT hits=0, RECON_W1#7601); BETWEEN; HZ PASS (W1:7646).
- A2 17:35: REACHED@17:25 (W2:6611); BETWEEN. A3 16:00 e1.16018 sl1.15847 z1.15907-1.15933 f3Sep: REACHED
  (W2:16561); BETWEEN. A4 09:20: REACHED (W3:80); BETWEEN. A5 16:45: REACHED (W3:2826); STRADDLE. A6 10:10:
  REACHED (W3:4972); BETWEEN. A7 17:00: REACHED (W3:4972); BETWEEN.
- 10JUN 16:15 e1.15546 sl1.15359 z1.15361-1.15401: NOT-REACHED (confbar EU#3125); BETWEEN; HZ PASS (EU#3136).
- 25JUN 10:45 e1.13540 sl1.13604 z1.13524-1.13587: REACHED@10:20 (EU#964); BETWEEN; HZ PASS (EU#1191).
- 22JUL 14:55 e1.14048 sl1.14075 z1.14146-1.14194: REACHED@10:20 (EU#855); FAR-SIDE; HZ PASS (EU#2491).
- D3-euro cross-check: 4Jun/29Jun/15Jul/28Jul/17Aug/22Sep/8Oct FAR-SIDE confirmed on rows (26May extra FAR-SIDE,
  REACHED@25th 18:10 EU#4988 - outside D3's 8, same build/ticks, disclosed).

## S1 - refuse when the confirmation count is 2+ (pack lines | verdict)
- A1: EU/08-28#797,#816,#818 (adv2) | REFUSE - breaks the table.
- A2-A7: adv1 rows above | keep. 10JUN: EU/06-10#3126,#3149,#3151 (adv2) | REFUSE.
- 25JUN: EU/06-25#1176,#1185,#1204,#1206 (adv1) | keep (miss). 22JUL: EU/07-22#2482,#2504,#2506 (adv1) | keep (miss).
- OTHER-GATE: 4S1040 no rows either run; 27AUG RECON/08-27#3074 dead seed LTF_MISALIGN; 1S1530 RECON_W2#5648 dead seed
  SETUP-DEFINED; 28A1625 RECON_W1#9869 TP_RR_FAIL; 8S1645 RECON_W3#7597 TP_RR_FAIL.
- UNRULED 13 (counted, never graded): 26May, 28May, 4Jun, 29Jun, 8Jul, 15Jul, 28Jul, 5Aug, 17Aug, 2Sep, 4Sep-09:30,
  22Sep, 8Oct.
- Verdict: DOES NOT SEPARATE. Trader line: "this fix refuses your 10 June long but also kills your valid 28 August
  short (both count 2 at confirmation)."

## S2 - his OB-kill words on rows (pack lines | verdict)
- All ten graded rows: keep. No take's in-bias block has a printed range+level to close beyond (R2), and zero
  OBPROV code=1/2 rows exist in the whole EU CUT, so the kill words never engage on rows. A1's obDead=1 is the
  machine's global flag, not his block's kill (identity NOT PRINTED) - no refusal without evidence.
- Mechanism spots (sources, not pack lines): EA 172/183 (flag flips only for in-bias kills), OrderblockMgr 123-133
  (close-beyond-level trigger), EA 2778 (2-of-3 gate).
- Verdict: DOES NOT SEPARATE. Trader line: "this fix refuses nothing on rows - no block level is printed and no
  invalidation event fires, so your 10 June, 25 June and 22 July trades all walk through."

## S3 - refuse when R4 says NOT REACHED, literal reading (pack lines | verdict)
- A1: FROM W1:7656, TP W1:7651, HZ W1:7646, 09:55 W1:7591, INPLAY W1:7601 | NOT-REACHED | REFUSE - breaks the table.
- A2-A7: FROM/TP/HZ/reach lines above (W2:6680/6673/6667/6611; W2:16669/16662/16656/16561; W3:248/242/236/80;
  W3:3322/3316/3310/2826; W3:5232/5225/5219/4972; W3:7743/7738/7732/4972) | REACHED | keep.
- 10JUN: FROM EU#3150, TP EU#3142, HZ EU#3136, confbar EU#3125 | NOT-REACHED | REFUSE.
- 25JUN: FROM EU#1205, TP EU#1197, HZ EU#1191, reach EU#964 | REACHED | keep (miss).
- 22JUL: FROM EU#2505, TP EU#2497, HZ EU#2491, reach EU#855 | REACHED | keep (miss).
- OTHER-GATE + UNRULED as S1.
- Verdict: DOES NOT SEPARATE. Trader line: "this fix refuses your 10 June long but also your 28 August short, and
  still lets your 25 June and 22 July shorts through." D3-class note: read as far-side-only, it keeps all 7 valid
  takes but refuses none of the three never-takes either.

## S4 - combined S1 or S2 or S3 (same rows)
- Refuses: 10JUN (S1+S3), A1 (S1+S3). Passes: 25JUN, 22JUL (no reading), A2-A7 (S1-clean, S3-clean).
- Verdict: DOES NOT SEPARATE. Trader line: "combined, the fixes still kill your 28 August short and still miss your
  25 June and 22 July shorts."
