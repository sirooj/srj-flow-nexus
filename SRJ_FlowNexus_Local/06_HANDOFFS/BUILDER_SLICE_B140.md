# BUILDER SLICE B-140 - raw rows behind R1 to R7 (MEASURED)

Scope: reads + greps + row extraction from committed packs and the named log ranges only. No edit/compile/run/launch. 4JUN/SILENT6/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-139` = `5ef84017312b9e4309f51faf8f8e2abfd8d3e86b` (cut builder/B-140 here; no remote B-140 before push).
- `git log -1` = `5ef8401 B-139 price basis: every fill accounted, no machine defect; verdict MEASURED`.
- `git status --short` count = 557 (kept, none staged).
- Protected diff vs 5ef8401 EMPTY by `git diff --quiet` (pointer, RESULT_B139/SLICE_B139, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, 99_WORKFLOW/).
- Ledger `1284.` = 1, `B139-PRICE-BASIS` = 1, `1285.` = 0. CONTEXT `B139-HIS-FILL-FIRST` = 1, `B140-` = 0. HANDOFF `- B-139:` = 1, `- B-140:` = 0.
- Disk SHAs: EA 585093BF / EX5 AB159DE7 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F. No terminal64 (0).

## PART B (append nothing)

- RETARGET-CLOSED-AM L33 + SYMMETRY-NEAREST L33. MANAGE-NEAREST L32 + REVISION-SOURCE-ONLY L32. 9/7 TP SETTLED L30. EXACT-PRICE L34. UNIVERSAL + EXECUTION PINNED L28. RETARGET L90 + same-day CORRECTION L90. NEAREST-ONLY-TP L89. OWN-SOURCE-EXCLUSION L94. ENTRY-BAR READ-BACK L95. POC-OVER-VWAP-SCOPE L137. RETARGET + DAY-CLOSE-FALLBACK L121. CONFIRMATION-BAR L53. NO-OVERFIT L60. 0908-NY-TARGET-YPOC L194.

## R1 PAIRS (re-type grounds; SL zeros)

- HIS-RULE re-types: A4x (L89/L32 + L30 AS.H choice); A6x (L89/L32); A7e (L53 + SEP8 s47 VALID 17:00 SHORT); B2x (L33 6/5 retarget + L121); B3x (L89/L32/L94/L95); C-06-03x (L89/L32, trade HIS-validated).
- A7x stays UNKNOWN: "stop loss|stoploss|stop-loss" 0/0 skill+register; "SL exit|stop exit" 0/0 skill+register; FINDING EXIT-BREAK-RETEST stop-hits L19/L24 (spec/touch-scope prose); EXITMODEL-1 L120/L177 (Q5 SL convention = mechanism); journal 8 Sep NY row 313 (Y-POC target, no SL-exit rule).

## R2 B2x ROWS (EXITS-B137/B2.csv pack + JUNE0525-B137 J-lines)

- UJADMIT J1177863: `entry=160.059 sl=159.598 tp=160.723 R=1.44 poolGen=-1 wsrc=DH20260430 wday=2026.04.30 wage=36` (booked = 30-Apr day high, register row 2 Line [HIS]).
- UJRETARGET J1178356 (pack466, 19:05 pass bar 19:00): `old=160.723 sess=2 tp=160.298 seq=4` + UJRETARGET_BROKER J1178355 (pack465): `oldTp=160.723 newTp=160.298`. curTp none→160.298 (EXITVERDICT packs 473/483/494).
- Session: SESSION_LIMIT pack11 NYAM window used; NY AM server window ends 19:00; corroborating extreme 18:45 bar h=160.298 (pack422 UJBARMAP). No other session-high print (B2.csv NYH/sess=2/SESS/NY_AM: only SESSION_LIMIT/B60-seed/UJRETARGET hits).
- Pre-exit max 160.298 (18:45, unbooked then) < booked 160.723; post-revision highs ≤160.275; first booked-touch = exit deal #9 19:16:32 at 160.298; MTEXIT pack506 bar=19:15 TP_TOUCH exit=160.298 src=-.

## R3 B3x ROWS

- UJADMIT J1197592: `entry=160.524 sl=160.501 tp=160.587 R=2.74 poolGen=-1 wsrc=LOH wday=2026.06.11 wage=0` (booked LOH). Single UJREELECT (bar_key 14:55, oldTP=newTP=160.587, no revision); zero UJRETARGET rows in B3.csv. MTEXIT pack136 bar=15:20 TP exit=160.587; deal #11 pack120 15:23:06 at 160.588.

## R4 A4x ROWS

- UJADMIT J1113881 tp=1.16200; TP_ELECT shadow 09:20 tp=1.16200 (day file 2026-09-07); ORDER tp 1.16200 J1113885; MTEXIT pack391 bar=10:50 TP exit=1.16200; deal #9 pack369 10:53:07 at 1.16201. His line AS.H: L30 rule-choice + s50 "AS.H 1.16200 first touched 10:50 bar".

## R5 A6x ROWS

- UJADMIT J1118710: `entry=1.16205 sl=1.16258 tp=1.16102 R=1.94 poolGen=-1 wsrc=YLOL wday=2026.09.08 wage=0` (booked YLOL). 10:10 bar: mpoc=1.16229 mvwap=1.16072 wpoc=1.16249 wvwap=1.16231 dpoc=1.16244 dvwap=1.16266; RETESTBOOK hits=0; RETESTDIAG nearAbove M-POC / nearBelow M-VWAP. Float 10:10→10:42: D-POC 1.16244 pinned, D-VWAP 1.16264→1.16256 (all above); zero RETARGET rows in A6.csv. Journal 8 Sep London row 285 (file L285): 15m read only — names no target.
- MTEXIT pack156 bar=10:40 TP exit=1.16102; deal #13 pack135 10:42:46 at 1.16102.

## R6 A7 ROWS

- A7e: DEAL pack1 17:00 + TICKET bar=16:55 pack3 (EXITS-B137/A7.csv); CONFIRMATION-BAR L53; SEP8 s47. Deal #14 taken, lost on SL (NO-OVERFIT: machine complied).
- A7x: Y-POC 1.16114 census side=ahead every bar 17:00→17:30; pack lows min 1.16189 (17:10/17:15), 27pts clear — never touched. ownBrk=1 in RECON62: only A1-11:30 + A2-17:45 (none A7). slRef 1.16274 (ORDER sl J1121163); printed highs nearest 17:25 h=1.16273 / 17:30 h=1.16280, pre-entry ≤1.16233 (J1120240/J1120711/J1120733/J1120780) — swing bar NOT FOUND (never computed). Journal row 313 file L313: Y-POC target (his words); Weekly VWAP 1.16207 not the target. Fill 17:26:29 broker SL; EA MTEXIT 17:35 pass.
- Journal zeros: "6/11/26,NY" 0 + "11 June|11-Jun" 0 (no 11 June NY row); "9/7/26,NY" 0 + "7 Sep NY" variants 0 (no 7 Sep NY row); 8 Sep London row 285 names no target.

## R7 C-06-03x ROWS

- UJADMIT J1167800: `entry=159.929 sl=159.889 tp=159.983 R=1.35 poolGen=-1 wsrc=ASH wday=2026.06.03 wage=0` (booked ASH). RETESTDIAG 09:10: no nearer POI above nearby. MTEXIT pack145 bar=09:55 TP exit=159.983; deal #5 pack130 09:59:40 at 159.983.

## R8 TABLE

- B2x HIS-RULE (L33/L121) / UJRETARGET+MTEXIT+deal / ACCOUNTED. B3x HIS-RULE (L89/L32/L94/L95) / UJADMIT+MTEXIT+deal / ACCOUNTED. A4x HIS-RULE (L89/L32/L30) / UJADMIT+MTEXIT+deal / ACCOUNTED. A6x HIS-RULE (L89/L32 + census) / UJADMIT+MTEXIT+deal / ACCOUNTED. A7e HIS-RULE (L53 + SEP8 s47) / DEAL+TICKET / ACCOUNTED. A7x UNKNOWN-basis (SL fired, target untouched, no break, loser kept) / MTEXIT+deal / ACCOUNTED. C-06-03x HIS-RULE (L89, validated) / UJADMIT+MTEXIT+deal / ACCOUNTED. 7/0/0 → exit basis closes; lane line so states.

## RECORD LINES (exact)

- X1 §4: `- B140-RULE-BASIS-BEFORE-UNKNOWN (planner lesson 2026-10-09): ...` (relay text verbatim).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-140 (kit PK-2); ...` (planner-stated).
- X3 §3: `- B-140: graded every kept exit (and the 8 Sep NY entry) against his own banked rule words, 5 June NY 19:16 retarget first; no source edit or run.`
- X4 ledger `1285.` tag `B140-EXIT-BASIS` (R1/R2/R3/R4/R5/R6/R7/R8).
- X5 pointer: latest B-140 MEASURED; SHAs unchanged; `Lane: EXIT-BASIS (closed at 1 of 6)`; stale A2 line replaced; goal open.
- X6 register section B NOTE (R2 ACCOUNTED).
- Pre-commit: X1/X2/X3 counts 1; `1285.`-class 1, `1284.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF, register; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
