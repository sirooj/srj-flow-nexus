# BUILDER SLICE B-194 - raw rows per R item (under 600 lines)

Base: builder/B-194 cut at 11c9ff3 (backup exact). Reads only (job_r_b194.py, packs + journal, never the day log). Verdict MEASURED.

## R1a kept path B2 (JUNE0525-B192/2026-06-05, EA 3B5EE8D1)
```
seed 15:20 Monthly-POC LONG (pack 39248)
CONFIRMPOLL 15:20-16:05 confirm=0 (packs 39245-39617) | 16:05 ABORT LTF_MISALIGN (pack 39622; did not kill it)
CONFIRMPOLL 16:10 oppCandle=1 bodyDir=0 touchAttr=1 confirm=0 (pack 39663)
CONFIRMPOLL 16:15 bar=16:10 oppCandle=1 bodyDir=1 (pack 39711, shadow confirm=0)
REGIMECENSUS 15:20-15:45 1/0/0/0, 15:45 2/1/0/0, 16:05 3/1/0/0 (packs 39249-39664)
TP_ELECT 16:15 entry=160.059 sl=159.598 tp=160.723 R=1.44 (pack 39724)
B182DEC FIRE TREND latch=1 div=1 dbar=16:00 (pack 39725) | ENTRY_TICKET + deal #6 16:15:00 @160.065
Road: retained (15:20 seed held to 16:10 confirmation, fired 16:15; no road tag on rows; PREBIND prints absent both builds)
```

## R1b/c trial window (JUNE0525-B193D/2026-06-05, EA 3B5EE8D1 + EX5-D)
```
ANCHOR 16:00 Monthly LONG re-seed (pack 7252) | CONFIRMPOLL 16:00 confirm=0 (same as kept)
ANCHOR 16:45 Daily-POC LONG (7578) | CONFIRMPOLL 16:50 confirm=1 (7632)
TP_ELECT 16:50 entry=160.115 R=1.56 (7645) | B182DEC FIRE TREND (7646) | deal #6 16:55:00 @160.120 (7654)
FIRST difference: REGIMECENSUS bar=15:20 #124 (trial pack 6906: 1/0/4/1) vs kept same bar/pass (pack 39249: 1/0/0/0)
Mapped tag: pLD.L (B182SWEEP bar=14:00, cut j5840321; cached prev-London-low sweep) -> sweepVal 4 via NY gate (15:20 server) | kept reads 0
Regime: sweepTag 0->4, mrOk 0->1 on the Monthly LONG
Loss: R2-renewal SEEDVOID bar=15:30 dir=LONG buf=10 line=160.006 (CUT journal j5841545; tag outside day-pack set, cut ref; kept: none 15:25-15:40)
After: last alive 15:30; 16:00 re-seed dies 16:05 ABORT identically; 16:10 confirm + 16:15 fire never exist on trial
Grade R1d: BREAKS (his 16:15 open lost; register E; skill:92). Corrects G3a UNDECIDED.
```

## R2a 5m 13:50-15:55 (GBP0629-B193D/2026-07-10 UJPROBE ltf; EA 3B5EE8D1)
```
bullish +1.0 bars 13:45-14:20 (packs 4333-4545) | bearish -1.0 from bar 14:25 through 15:50 (packs 4589-5112)
Flip candle 14:25 (bullish 14:20, bearish 14:25; bearish counts from 14:30 open, skill:139-140)
OB-invalidation rows 13:50-15:55: NONE (no 'invalid' row; flip has no counted cause)
```

## R2b S2 rows per short seed (B193D 0710 packs; cut refs where tags outside pack set)
```
14:10 Y-POC seed: FRESHSKIP S2_LTF_ALIGN PRE_BINDING at 14:20 (pack 4510, waiting/held); SUPPRESSED HELD S2_LTF_ALIGN (cut j3841900); SIDE1V_BIRTH tf=0 mr=1 confShort=A_OPP at 14:20 (cut j3841949)
14:50 Daily-POC seed: ANCHOR 14:50 (29677), CONFIRMPOLL 14:50 confirm=0 (29674); no S2 poll rows (never reached S2 polling)
Kills 14:00-16:00: 14:30 LONG ABORT LTF_MISALIGN (4599-4600); 15:05 SHORT ABORT DIV_FALLBACK (4822-4823); 15:20 SHORT ABORT FRESH_OPP_FVG (4920-4921). The 14:15 seed was never aborted.
```

## R2c/d/e/f
- R2c: 15:00 candle Daily-POC SHORT confirm=1 (pack 4818) + 5m bearish (UJPROBE pack 4811) - outcome ABORT DIV_FALLBACK 15:05, not a take. Y-POC seed: NONE (14:15 confirm under 5m bullish).
- R2d: no 5m bias words of his on 10 July ('10 July'/'10 Jul'/'July 10' hit only register F3 setup words + skill paraphrase; '0710' 0 in findings; ledger hits all builder relay text; journal July rows unread per B-167). His only "5m" is the 7:10 zone name.
- R2e: kept UJPROBE ltf identical bar-for-bar (bullish thru 14:20 packs 29319-29477, bearish from 14:25 packs 29520-30039). REPORTED IDENTICAL.
- R2f: no ruling found -> candidate chart call carried (see carried note). Feed: call asks his read (spec 9.1, no attribution). RAW: B-186a covers the retest on normal chart only, never the 5m.

## R3a journal L26 whole (headers Date,Session,Setup,4H,1H,15m,Bias,POI,CVD,TP LQ,Comment,Gain)
```
25,6/9/26,LDN,TF,Bear,Bull,Bear,[bear],,"W AVP, D VWAP",3,S LQ,[4 links],...,L long invalid bias yet and invalid XOB [link],...,0.00,... (Gain 0.00, no take)
```
Other journal patterns 0 (re-proved). Register/skill/findings/ledger: builder text only. Class HIS-DECLINE (reasons quoted); POI identity vs 11:20 fire UNDECIDED (his W AVP/D VWAP vs machine Weekly-POC).

## R3b 9 June cells (JUNE0525-B193D/2026-06-09, EA 3B5EE8D1)
```
Sweep: pAS.L@09:00 (4104) | 09:00 o160.152 h160.152 l160.085 c160.100 (4134, strictly below) | Asia-low NOT PRINTED | London fresh
Retest 11:10 Weekly-POC 160.189 (WINLINE 5263) | 11:10 o160.208 h160.211 l160.174 c160.198 (5249-5250): 15pt wick, body above: VALID
5m: 11:10 +1.0 (5257), 11:15 +1.0 (5311): bullish at confirm + open: MET | 4H/1H/15m +1/-1/-1 | class MEANREV (FIRE 5330)
Zone 160.159-160.194 formed 10:40 promoted 11:05 mid/kill 160.176 (B182MID 5211, PROMO 5212); standing (no KILL; PASS xobWin=1.0 pack 5323; win=1 first=10:40/11:05 packs 5255/5309; xobInPlay=1 pack 5267); most-recent tag = pick (B162ORIGIN 3633 same range formT=10:40 packs 5247/5302)
Confirm 11:15 1pt body confirm=1 (5319; nonzero body, spec 3.6) | CQD verdict=2 dbar=11:10 (5321), div=2 hidden (5330); his type UNMAPPED
Stop 160.153 ONE_OR_NEITHER (5328) | Target 160.278 name NOT PRINTED, R=1.78 (TP_ELECT) | entry 11:20:07 @160.203 | exit SL 12:20:24 @160.152 (SL 160.153, -1pt)
```

## R3c kept first stop (JUNE0525-B192/2026-06-09)
```
11:10 seed (47609) + 11:15 confirm=1 (47653) exist; REGIMECENSUS 11:10 1/0/0/0 (47610), 11:15 1/0/0/0 (47654): regime NONE. First stopping row: pack 47610 (no TP_ELECT follows).
```

## R4 2 Sep fields (RECON62-B193D/2026-09-02.csv, committed)
```
Sweep pAS.L@09:35 (3597) + 09:35 o1.15773 h1.15776 l1.15744 c1.15751 (3624) | Asia-low NOT PRINTED | London fresh
Retest FOMC-VWAP 1.15718 (WINLINE 3963) + 10:20 o1.15741 h1.15742 l1.15713 c1.15726 (3953-3954): VALID
5m 10:20 bearish / 10:25 bullish (UJPROBE 3959/3999) | 4H/1H/15m bearish (3999)
Zone XOB 1.15530-1.15548 promoT 14 Aug 14:20 (ZONEPICK 4009-4010, B60C 4011-4012); formation/middle/kill NOT PRINTED (no B182MID row); standing (no KILL row; B177HZ PASS gapTouch=1.0 xobWin=0.0 pack 4015); commit INPLAYCOMMIT applied=1 commitVia=SWING firstShift=3702 firstVal=1.15540 (4010): only the old swing commits it while the direct check reads in-play (ZONEPICK xobInPlay=1) - said in those words; no post-promotion in-leg candle on rows
B179HZB B latest=14 Aug 14:25 win=0 / S latest=09:55 win=0 (3957-3998); most-recent in-play tag side=B origin=484 1.15504-1.15532 formT=11:30 (3951/3991) - NOT the pick
Confirm 10:25 confirm=1 (4007) | CQD verdict=1/regular/10:05 (4013/4022; his type UNMAPPED) | Stop 1.15614 KEPT_PATH 1-swing (4020; SLSRC chosen=1.15527 packs 4002-4004/4017-4019)
Target Monthly-VWAP 1.15917 (EXITCENSUS value-match 5719) R=1.57 (TP_ELECT 4021) | entry 10:30:02 @1.15736 (4025) | exit MTEXIT 15:20 TP_TOUCH 1.15849 (6781) + deal 15:21 @1.15850 (6730); exit line NOT PRINTED
```

## R4e kept first stop (RECON62-B192/2026-09-02)
```
Seed + confirms exist (packs 21325/21323/21363); pAS.L tag fires (pack 20958) but maps 0. First stopping row: REGIMECENSUS #127 10:20 0/0/0/0 (pack 21326; trial #113 0/0/2/1).
```

## R5 per-tag effect (mapped tag + session)
```
pLD.H/NY (LD.H@13:55 pack 4357): 10 July rows NONE->MEANREV, outcome DIES (S2 then ABORTs); 7/07 F2 identical (no fire/move/remove). Register F untouched.
pLD.L/NY (pLD.L@14:00 cut j5840321): B2 MOVED (16:15 lost 15:30, 16:55 TREND fire). Register B row 2: BREAKS.
pAS.H/London (pAS.H@16:25 pack 7280): 15:40 SHORT mrOk=1, no fire. None touched.
pAS.L/London (pAS.L@09:35 9/02; pAS.L@09:00 6/09 cut j5863572): 2 Sep FIRE (UNDECIDED); 6/09 FIRE (HIS-DECLINED); 9/08 mrOk=1, A6 deal same. No valid row touched.
Narrower-hunk scope: pLD.L-in-NY breaks B2; pAS.L adds 2 Sep + 6/09. Drafts no hunk.
```

## R6 print list (cell -> carrier tag -> value home)
```
Asia-low values: B182SWEEP (tag+bar) -> indicator session loop (prevAsiaLow)
FOMC indicator label: no tag -> EA g_lineCode only (EA:94)
Zone middle/kill/formation: B182MID (absent) -> indicator zone loop at promotion
Target/exit names: TP_ELECT/MTEXIT (values) -> EA booking/exit walk (uj_winnerSource)
PROMO_RETURN: tag absent -> EA S5 gate state
10 July OB-invalidation counts: no per-bar tag -> indicator OB loop
13:55/14:00 o/h/l/c: GAP_TOUCH (touch only) -> unwritten (never touched)
Y-POC 14:15-15:00 values: WINLINE (action only) -> last OPEN 14:10 stands
7:10 XOB: B182MID/B178ZL (no such zone) -> unwritten
14:00 swing high: SWINGPICK (poll bars) -> unwritten
```
(End of slice)
