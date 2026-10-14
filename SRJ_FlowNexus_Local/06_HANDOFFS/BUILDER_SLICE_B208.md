# BUILDER SLICE B-208 - raw rows (EURUSD scope; under 600 lines)

Base: builder/B-208 cut at e828d32 (= builder/B-207 head). Print-only diagnostic, always restored. Verdict MEASURED
unless T STOP (none). B-207 addendum 1354 exists on branch (renumber: this filing uses 1355).

## Start gate
```
log-1 e828d32 (backup exact; builder/B-208 cut here; push via backup, never origin). Python 3.13.16 embed.
diff e828d32 EMPTY on all 12 gate files (+1354-collision ACCOUNTED: addendum item, using 1355).
Disk: EA 7c392767/B2EF6E4C, POI 5AF5E035/E5CBE1A2, flow a8201128/c82f175e, SESS 16573a5b, terminal.ini c725e437.
Journal rows 339-340 bytes 166767 ACCOUNTED. Ledger ^1352.=1 ^1353.=1 ^1354.=1 ^1355.=0 pre. No terminal64.
D: 221.1 / C: 18.4 GB free.
```

## Part B (no new words; B1/B2 once each, e828d32)

## Part W (W0 blessedB208 c725e437 x2 copies, restored+verified; W1/W2 exact texts in result)

## Part R
```
R1 FOUND: A1 obDead=1 from live-loop kill (code=3), last write 09:45 id=2170; replay path zero everywhere.
R2: EU long 11,414 distinct OB ids at refOk gate (code=3/4/5/6/7/8 rows; FALSE only via code=1/3).
```

## Part K (K0 .preB208 8bbf936b/568f4ce9/c82f175e; 12 hunks +16/-0; braces 0/0; markers 1+1)
```
K2: compile 0 errors, 3 warnings (pre-existing .mq5 1576/1798/1872 long-to-int; none in hunks); flow E32C1EF6
 post-compile = pre-launch; .B208D 8cc4c502/5f86a20e/e32c1ef6 verified.
```

## Part T (blessedB208 pre-first-launch; fixed watcher; PID stops; ex5 every launch+run)
```
T1 RECON62-B208D: WMI 16288 10:37:41 / terminal 5536 / EURUSD 26Aug-9Sep / replay 10:38:10 / DONE PASSED 10:42:14.
 PRE=0, bytes [0,312969428). 16/16 SAME vs DEALS_RECON62-B206T. Tags: OB 2259, FVG 1309, OPPV 387, FVGKILL 2504,
 OBKILL 925, OBSKIP 1229 + B205FOMC 3. No STOP.
T2 EU0525TD-B208D: WMI 11988 10:44:01 / terminal 16988 / EURUSD 25May-13Oct / replay 10:44:43 / DONE PASSED 11:08:56.
 PRE=1059880, bytes [312969428,1486638970). 44/44 SAME vs DEALS_EU0525TD-B206T. Tags: OB 11678, FVG 7212,
 FVGKILL 13889, OBKILL 5097, OBSKIP 6316, OPPV 2222. No STOP.
T3 restored: OrderblockMgr 8bbf936b, ImbalanceMgr 568f4ce9, flow c82f175e verified; EA/POI untouched; .B208D kept
 unstaged; no terminal64.
```

## Part P (one cut after the batch: RECON-D [0,312969428) + EU-D [312969428,1486638970))
```
P1: A1-FVG 2150 FOUND (form 06:30-06:40, wick-dead 09:55 JL927510, no body pre-entry) vs dead-OB 2170 (killed 09:40
 JL927401, different piece); machine dead-FVG id not printed (flag flips 10:05). 25Jun bearish-10:00 OB NOT FOUND
 (bullish 5744/5745 only; SKIPs NOT-IN-BIAS); FVG 5748 BODY 10:35 (matches window); OPPV bullish rows. 22Jul nearest
 OB 9081 alive at conf; nearest dead FVG 9077 BODY 14:30. 10Jun FVG 3871 BODY + OPPV agree all terms. A6/A7 9:20 XOB
 3293 FOUND exactly, alive through both entries.
P2: 11,678 formed; KILLED 5,097 (all LIVE; replay zero); SKIPPED-only 6,316 (all NOT-IN-BIAS; refOk never fails);
 NEVER 265.
P3: per-take wick/body ids + machine kill candle in OBJECTS (wick never flips flag; 8 takes no-FRESHCOUNT = 0).
P4: 10Jun 2 REFUSE, 25Jun 2 REFUSE, 22Jul 2 REFUSE, A1-A7 0-1 keep, C OTHER-GATE. SEPARATES.
```

## Records + final disk
```
X1 CONTEXT-4 +2 (keep-list-wins defect; count-gate lesson); Brain B-208 +1. X2 HANDOFF-3 B-208 +1. X3 ledger 1355 0->1.
X4 pointer 35-cap (lane 3/6 euro P-verdicts; blessed=blessedB208; Next = F0 trial if P4 separates else narrowest P1
 NOT FOUND; P3 carried; held/HELD/F2/O3/UNRECONCILED/queue/offset).
F5 stage: result, slice, OBJECTS, 8 EU-D day packs, EU_FIX_PLAN, relay skill, ledger, pointer, CONTEXT, HANDOFF,
 CLEANUP_DONE_B208. Never sources/ex5/journals/logs/inis/profiles/scripts/backups/CUTs.
Final disk: kept as 0.4 (restored verified); .B208D/.preB208 unstaged; blessedB208 copies present;
 terminal.ini = blessedB208; no terminal64; journal 340 unstaged.
```
(End of slice)
