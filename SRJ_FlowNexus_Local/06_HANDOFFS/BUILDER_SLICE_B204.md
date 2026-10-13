# BUILDER SLICE B-204 - raw rows (under 600 lines)

Base: builder/B-204 cut at 185d548 (= builder/B-203 head). Source rows: B-202 day cuts on disk (EU/GU/UJ0525TD-B202) via one script per job (r0 probe, r1 nine-take, r1b compact, r2 38-take, r3a retest candles, r3b divergence windows, r3c FRESHCOUNT day-log scan, r4 confirm/terms/zone digest); KEYROWS_B203 NOT FOUND on disk. Relay B-204 + his 2026-10-14 words. Verdict MEASURED (read-only).

## Start gate
```
log-1 185d54896fa151e2b495146cca984863b7e699e4 (backup exact). Branch builder/B-204 cut here. Push via backup, never origin.
diff 185d548 EMPTY on pointer/RESULT_B203/SLICE_B203/REVIEW_J2D_B203/register/both skills/CONTEXT/HANDOFF/ledger.
Disk SAME: EA 7c392767C88FF754, ex5 B2EF6E4CA9AB28E6, IND a8201128289252927/c82f175E20D5BF1DF, SESS 16573A5B6B7F70DEB.
terminal.ini DIFFERENT c725e437 (blessed a5834591 in preB197-202; delta = 2 window-layout lines IsVisible + Dividers-0, same length 20447, no Tester block; B-198 re-save class, no run launched).
Journal row 337 bytes 165359 ACCOUNTED pre-banking. Ledger ^1349.=1 ^1350.=0 pre. Python 3.13.16 embed (py launcher absent).
```

## Part B banking (skill lines 328-349; journal row 338 unstaged 165359 -> 166074)
```
His words 2026-10-14 filed verbatim in strategy skill (typos his). Paraphrases: J2D-EA-DEFECTS (341); 0610-EU-INVALID (342); 0625-EU-INVALID (343); 0722-EU-INVALID (344); 0708-EU-DIV (345); 0618-EU-FOMC-EXIT (346); 0715-EU-MR-NOT-VALID (347); FOMC-MULTI-ANCHOR (348); QUESTIONS-NOT-RULINGS (349).
Register C +3 must-never: 10 Jun EU NY long 16:15 1.15551; 25 Jun EU London short 10:45 1.13540; 22 Jul EU NY short 14:55 1.14048.
```

## R0 bias-column source (job_r0_b204.py; day-log 20261013.log JL 24711021-24711444)
```
UJBARMAP bar=2026.06.04 08:20 o=1.16079 h=1.16080 l=1.16057 c=1.16061 mpoc=1.16490 mvwap=1.16271 wpoc=1.16490 wvwap=1.16271 dpoc=1.16089 dvwap=1.16063 ltf=-1.0 (JL 24711021; prices + ltf only, no 4H/1H/15m direction)
B-203 4 June cell 1.16490/1.16490/1.16089/1.0 = mpoc/wpoc/dpoc/ltf (UJBARMAP bar=09:15 JL 24711444). B201FROM ht=-1/1/1|1.0 on every take (PACK 608 JL 24713037 for 4 Jun; all 38 in job_r2_b204.out).
```

## R1 nine takes (pack_line + CUT journal_line JL; raws trimmed to the measured fields)
```
4JUN L 10:05 1.16117: FIRE PACK604 JL24713026 anc=Daily-POC out=FIRE reg=TREND latch=1 div=2 kind=hidden dbar=09:55
 FROM PACK608 JL24713037 sd=09:55 sw=NOTREACHED zn=1.15967-1.15972|01:40|NR|ST el=Daily-POC|LONG|1.16089|09:55 ht=-1/1/1|1.0
 DEAL PACK610 JL24713044 buy 1.16117; MTEXIT PACK790 JL24713258 bar=10:20 SL exit=1.16069; deal 10:21 1.16069
 DIV latched hidden-bull 09:55 (PACK595 JL24712798 latch=1; D130 verdict=2 oppPassed=-1 oppBar=09:35 PACK594 JL24712797)
 BAR 09:55 o=1.16119 h=1.16121 l=1.16078 c=1.16107 (PACK538 JL24712540) - 11pts through, REACHED
10JUN L 16:15 1.15551: FIRE PACK3013 JL24776511 anc=Daily-VWAP reg=TREND latch=1 div=1 kind=regular dbar=16:05
 FROM PACK3019 JL24776524 sd=15:30 sw=NOTREACHED zn=1.15361-1.15401|15:45|NR|ST el=Daily-VWAP|LONG|1.15463|15:30 ht=1/-1/1|1.0
 REGIME 15:30-15:40 votes=1 trendOk=0; 15:45 votes=2 trendOk=1 (PACK2567/2618/2665/2718)
 DEAL PACK3021 JL24776531 buy 1.15551; MTEXIT PACK4073 JL24777718 bar=17:55 POI_BODY_BREAK Daily-POC 1.15543 exit=1.15523; deal 18:00 1.15523
 DIV latched regular-bull 16:05 (PACK3004 JL24776138 latch=1; D130 verdict=1 oppPassed=-1 oppBar=15:45 PACK3003 JL24776137)
 BAR 15:30 o=1.15464 h=1.15578 l=1.15424 c=1.15497 (PACK2562 JL24774594) - 39pts through, REACHED
18JUN L 09:45 1.15256: FIRE PACK404 JL24880792 anc=Daily-POC reg=TREND latch=1 div=2 kind=hidden dbar=09:35
 FROM PACK408 JL24880803 sd=09:35 sw=NOTREACHED zn=1.15089-1.15112|04:00|NR|ST el=Daily-POC|LONG|1.15217|09:35 ht=-1/1/1|1.0
 DEAL PACK410 JL24880810 buy 1.15256; MTEXIT PACK807 JL24881274 bar=10:25 SL exit=1.15101; deal 10:25 1.15101
 DIV latched hidden-bull 09:35 (PACK396 JL24880493 latch=1; D130 verdict=2 oppPassed=-1 oppBar=09:10 PACK395 JL24880492)
 BAR 09:35 o=1.15275 h=1.15277 l=1.15191 c=1.15224 (PACK342 JL24880138) - 26pts through, REACHED
 FOMC at 09:50-10:05: zero FOMC prints (EXITCENSUS PACK490-495 JL24880907-24880912 Daily/Weekly/Monthly only)
25JUN S 10:45 1.13540: FIRE PACK1120 JL24969068 anc=Weekly-POC reg=TREND latch=0 div=-1 kind=regular dbar=10:05
 FROM PACK1126 JL24969081 sd=10:30 sw=NOTREACHED zn=1.13524-1.13587|10:20|NR|ST el=Weekly-POC|SHORT|1.13548|09:05 ht=-1/1/-1|-1.0
 DEAL PACK1128 JL24969088 sell 1.13540; MTEXIT PACK1357 JL24969356 bar=11:00 SL exit=1.13604; deal 11:00 1.13606
 DIV latched regular-bear 10:05 (PACK1111 JL24968667 latch=0; D130 verdict=-1 oppPassed=1 oppBar=09:35 PACK1110 JL24968666)
 BAR 09:05 o=1.13614 h=1.13631 l=1.13590 c=1.13615 (PACK127 JL24965527) - 83pts through, REACHED (B60C PRIOR)
 09:30-11:00 window (job_r3b): UJPROBE latestNZ=-1 from 10:05; CQDRECHECK -1.0/-1.0; no bullish after 09:35, no bearish 10:20-10:50 on rows
29JUN L 16:15 1.14039: FIRE PACK2866 JL25002014 anc=Weekly-POC reg=TREND latch=0 div=2 kind=hidden dbar=15:50
 FROM PACK2871 JL25002027 sd=16:10 sw=NOTREACHED zn=1.13928-1.13952|09:40|NR|ST el=Weekly-POC|LONG|1.14031|16:10 ht=-1/1/1|1.0
 DEAL PACK2873 JL25002033 buy 1.14039; MTEXIT 17:15 TP_TOUCH exit=1.14149 (PACK675 JL25002812 in full cut); deal 17:19 1.14152
 DIV latched hidden-bull 15:50 (PACK2857 JL25001542 latch=0; D130 verdict=2 oppPassed=-1 oppBar=14:55 PACK2856 JL25001541)
 BAR 16:10 o=1.14033 h=1.14044 l=1.14029 c=1.14036 (PACK2843 JL25001500) - 2pts through, REACHED marginal
8JUL S 14:50 1.14002: FIRE PACK2368 JL25144125 anc=Daily-POC reg=TREND latch=1 div=-2 kind=hidden dbar=14:40
 FROM PACK2372 JL25144135 sd=14:40 sw=NOTREACHED zn=1.14065-1.14095|14:35|NR|ST el=Daily-POC|SHORT|1.14057|14:40 ht=-1/-1/-1|-1.0
 DEAL PACK2374 JL25144141 sell 1.14002; MTEXIT PACK3406 JL25145308 bar=16:30 SL exit=1.14095; deal 16:32 1.14095
 DIV latched hidden-bear 14:40 (PACK2359 JL25143732 latch=1; D130 verdict=-2 oppPassed=1 oppBar=14:35 PACK2358 JL25143731; CQDRECHECK -2.0/-2.0 PACK2351 JL25143718)
 BAR 14:40 o=1.13946 h=1.14072 l=1.13930 c=1.14041 (PACK2299 JL25143277) - 15pts through, REACHED
 13:45-14:50 window (job_r3b): UJPROBE hidden latestNZ=-2 14:00-14:25; CQDRECHECK +2.0/+2.0 at 14:30 pass, +1.0/+1.0 at 14:45 pass, -2.0/-2.0 at 14:50 pass
15JUL L 10:35 1.14227: FIRE PACK922 JL25239198 anc=Quarterly-VWAP reg=TREND latch=0 div=2 kind=hidden dbar=10:20
 FROM PACK927 JL25239209 sd=10:25 sw=NOTREACHED zn=1.14042-1.14070|07-14 15:30|NR|ST el=Quarterly-VWAP|LONG|1.14207|09:55 ht=1/1/-1|1.0
 DEAL PACK929 JL25239215 buy 1.14227; exit deal 12:32 1.14189 (PACK2022 JL25240433); MTEXIT NOT PRINTED
 DIV latched hidden-bull 10:20 (PACK913 JL25238716 latch=0; D130 verdict=2 oppPassed=-1 oppBar=09:25 PACK912 JL25238715)
 BAR 09:55 o=1.14346 h=1.14359 l=1.14279 c=1.14286 (PACK565 JL25237876) - 72pts ABOVE line, NOT reached
 REGIME 10:25 votes=2 trendOk=1 sweepTag=0 mrOk=0 (PACK857 JL25238226); SEEDBIAS_REFUSED 09:55 other seed (PACK514 JL25237817)
22JUL S 14:55 1.14048: FIRE PACK2386 JL25345026 anc=Weekly-POC reg=TREND latch=1 div=-1 kind=regular dbar=14:45
 FROM PACK2392 JL25345039 sd=14:45 sw=NOTREACHED zn=1.14146-1.14194|07-21 17:30|NR|ST el=Weekly-POC|SHORT|1.14065|14:45 ht=-1/1/-1|-1.0
 DEAL PACK2394 JL25345046 sell 1.14048; MTEXIT PACK2508 JL25345183 bar=15:00 SL exit=1.14075; deal 14:59 1.14075
 DIV latched regular-bear 14:45 (PACK2377 JL25344527 latch=1; D130 verdict=-1 oppPassed=2 oppBar=14:25 PACK2376 JL25344526)
 BAR 14:45 o=1.14050 h=1.14073 l=1.14037 c=1.14052 (PACK2309 JL25343962) - 8pts through, REACHED
28JUL S 10:45 1.13689: FIRE PACK1068 JL25431651 anc=Daily-VWAP reg=TREND latch=0 div=-1 kind=regular dbar=10:10
 FROM PACK1072 JL25431663 sd=10:40 sw=NOTREACHED zn=1.13775-1.13801|06:45|NR|ST el=Daily-VWAP|SHORT|1.13709|10:10 ht=-1/-1/1|-1.0
 DEAL PACK1074 JL25431669 sell 1.13689; MTEXIT PACK1479 JL25432134 bar=11:20 BREAK Daily-POC 1.13702 exit=1.13713; deal 11:25 1.13714
 DIV latched regular-bear 10:10 (PACK1059 JL25431070 latch=0; D130 verdict=-1 oppPassed=2 oppBar=10:05 PACK1058 JL25431069)
 BAR 10:10 o=1.13718 h=1.13734 l=1.13707 c=1.13729 (PACK747 JL25429186) - 25pts through, REACHED (B60C BOTH PACK1057 JL25431067)
 FRESH_OB_DEAD 09:55 other seed (PACK548 JL25427952); LTF_MISALIGN 10:10 other seed (PACK698 JL25429127)
```

## R2 class census (job_r2/r3a/r3c; code locates by text, read-only)
```
D1 gate CheckFreshness EA:2770-2780 (2-of-3, pre-confirmation only EA:2761-2768). FRESHCOUNT day-log rows:
 10JUN #810 bar=16:00 S3 obDead=0 fvgDead=1 oppFvg=1 adverse=2 ABORT pre (JL24775588)
 10JUN #811 bar=16:05 S3 adverse=2 ABORT pre (JL24775851); #812 bar=16:10 S3 adverse=2 ABORT pre (JL24776116)
 10JUN #813/#814 bar=16:10 S5 adverse=2 HOLD post (JL24776523/24776525); FRESHSKIP PRE_BINDING 15:55/16:00 (PACK2766/2821)
 25JUN #1612 bar=10:35 S4 obDead=0 fvgDead=1 oppFvg=0 adverse=1 HOLD pre (JL24968313); #1613 10:40 HOLD (JL24968368); #1614 10:40 HOLD (JL24968657); #1615/#1616 S5 HOLD (JL24969080/24969082)
 22JUL #3238 bar=14:50 S3 adverse=1 HOLD pre (JL25344506); #3239/#3240 S5 HOLD post (JL25345038/25345040)
D2 latch D130LATCH EA:10346 / B196DIV EA:10355; walk EA:10329-10345. "late" NOT FOUND in EA/FlowLogic/CQD (all hits are later/translate). Fired rows: none late in either window (oppPassed 09:35 / 14:35, both older).
D3 gate B177HZ EA:10452-10480 (gapTouch retest-bar OR xobWin confirmation-bar >= 0.5 else HISZONE_NONE). PASS all 38. FAR-side 11: EU 4Jun/29Jun/15Jul/22Jul/28Jul/17Aug/22Sep/8Oct, GU 21Jul/12Aug, UJ 15Jun. Register A/B/F: none (B2 zone above stop, BETWEEN).
D4 retest candles (job_r3a, B196BAR all 38): REACHED 4Jun 11pts / 29Jun 2pts. NOT reached 8: 15Jul 72pts off; 1Sep EU 1pt short (A2); 8Sep NY 4pts short (A7); 22Sep 255pts off; GU 10Jun 185pts off; GU 12Aug 13pts short; GU 25Aug 61pts short; UJ 23Jun 1pt short.
D5 all 38 FIRE reg=TREND sw=NOTREACHED. MR verdict printed once: GU 25Aug sweepTag=3 mrOk=1 14:00-15:50 (PACK1630/2224/2610), fired TREND 17:05.
D6 InpFomcTimesServer="2026.07.29 21:00" (POI marker:85); absAnchor at init (:1983); FomcActiveNow defined never called (:543); EA 3 positionals only (:12387-12392); ini override 0 hits. FOMC-POC rows by date: none before 30 Jul (18 Jun zero), from 30 Jul daily (121/116/343/...). Yearly-POC/Yearly-VWAP 0 hits all packs. B182DEC/FIRE rows never anchor FOMC (0 fires).
R0b B201FROM ht on all 38 takes (job_r2_b204.out lines 1-773).
```

## Records
```
X1 CONTEXT-4 B204-CAUSE-NOT-LABELS 0->1 + B204-REGISTER-PASSING-IS-NOT-HOLDING 0->1; Brain B-204 0->1 (2026-10-14). X2 HANDOFF-3 B-204 0->1 MEASURED. X3 ledger 1350 0->1 (journal 166074). X4 pointer 30 lines.
F5 stage: result, slice, REVIEW, DEFECTS, register, strategy skill, relay skill, ledger, pointer, CONTEXT, HANDOFF. Never EA/includes/indicators/ex5/journals/logs/inis/profiles/scripts/backups/CUTs/job outs.
Final disk unchanged B-203 except records (EA 7c392767, ex5 B2EF6E4C).
```
(End of slice)
