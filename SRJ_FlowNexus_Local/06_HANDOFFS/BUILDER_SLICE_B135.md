# BUILDER SLICE B-135 - R1 quotes, R3 table, R4/R5 rows (his 11:35 vs machine 11:40)

Scope: reads + greps only (packs, finding, skill, ledger, journal, register, spec, CONTEXT). No edit/compile/run/launch/gate/hunk; 4JUN/B-91/B-123 never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-134` = `5bb85ef881c9b7ac4ef5c617b8def72504244efa` (cut builder/B-135 here; no remote B-135 before push).
- `git log -1` = `5bb85ef B-134 own-body break trial STOPs at S0 (A1 11:30 also qualifies); verdict STOP`.
- `git status --short` count = 531 (pre-existing + untracked, preserved, none staged).
- Protected diff vs 5bb85ef EMPTY by `git diff --quiet` (pointer, RESULT_B134, SLICE_B134, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, FINDING, 99_WORKFLOW incl. kit files).
- Ledger `B134-A2-BRK-OWNBODY` = 1, `1280.` = 0. HANDOFF `B-134:` = 1. CONTEXT `B134-` = 0. Journal 1068 lines.
- SHAs: EA `90240F238A0668885E2D39BDAE5271CE3C08D81B7EA1836DB77F52A42E631AF3` (full 64, LF-norm = raw) / EX5 `6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D` / indicator src `956BF3E3ADB7` / ind-ex5 `27B5F272DCFA` / HTFEngine `D5FD5B063E75` / terminal.ini `4082A94F`. No terminal64 (0).

## R1 QUOTES (file:line; HIS vs MACHINE per register proof key)

- FINDING EXIT-BREAK-RETEST L7 (HIS): `> "This is the rule of break and retest. gap of the POC or AVP lines that break the price of candlestick by body candle close break is flipping the POC bias direction, hence the exit at 11:35. Touch or retest does nothing once entered."`
- FINDING EXIT-BREAK-RETEST L15 (builder reading, coded by his words): `The 8/28 instance: morning Aug-28 London short held past the 10:45 line touch and exited at the 11:35 body-break exit.`
- Skill s23 (HIS): `Break-and-retest: a gap of the POC or AVP lines with price breaking through by BODY candle close flips the bias direction and exits (the 8/28 11:35 instance).`
- Skill s36 (MACHINE time inside HIS pin): `(8/28 anchor D-VWAP, 11:40 BREAK D-POC exit 1.16439, 51 segment)`.
- Skill s49 (HIS ruling): `8/28 London exit-flaw (his words 2026-09-22: entry correct, exit mechanism flawed).`
- FINDING 0828-FVG L8-13 (HIS verbatim 2026-09-11 + filed meaning): `"8/28 was not killed, I took it but early exit due to the D POC gapped and made price above the D POC level. i have attached the image."` / `early exit 1.16464 at the 11:35 open`.
- Ledger item 369, file-L6168-6170 (HIS via 0828-FVG): `his verbatim 2026-09-11 correction + filed meaning entry 1.16466 next-open ~10:05, early exit 1.16464 at 11:35 open`.
- Ledger item 670, file-L6359 (mixed): `(1) 28 Aug short full-loss exit CONFIRMED (SL 17:00 1.16508 -42pts vs 11:40 break +27pts; verdict printed, order never sent - D2, his 11:35 exit vs tester 11:40 same event/bar granularity)`.
- Ledger item 333, file-L5604 (MACHINE census note): `matches NO buffer (Daily-POC 1.16451 at 11:35; feed/read divergence)`.
- Ledger item 619, file-L6308 (MACHINE, 51 segment): `8/28 exits on higher-line break (anchor D-VWAP vs 11:40 BREAK D-POC exit 1.16439, 51 segment)`.
- Journal row 257, file line 258 (HIS): `257,8/28/26,LDN,TF,Bear,Bear,Bear,...,D VWAP,2,AVP,...` (anchor D VWAP; no exit time in row; journal grep `11:3|11:4` = 0).
- Register A1 exit cell (MACHINE): `11:40 BREAK D-POC 1.16439 [matrix; R51]; R60 prints 11:45 fill 1.16440 [R60 G4]`.

## R3 TABLE (A1, SHORT, anchor Daily-VWAP r11; D-POC r10, W-POC r8)

- 11:20 pass, bar 11:15 (pack 291/295/297): o=1.16462 h=1.16470 l=1.16449 c=1.16449; D-POC 1.16532; D-VWAP 1.16480; behind-above: D-POC, W-POC 1.16523; kept ok (pack 307 vBREAK=none).
- 11:25 pass, bar 11:20 (pack 310/316/318): o=1.16450 h=1.16457 l=1.16445 c=1.16445; D-POC 1.16532; D-VWAP 1.16480; behind-above: D-POC, W-POC; ok.
- 11:30 pass, bar 11:25 (pack 332/336/338): o=1.16445 h=1.16459 l=1.16440 c=1.16441; D-POC 1.16532; D-VWAP 1.16480; behind-above: D-POC, W-POC; ok.
- 11:35 pass, bar 11:30 (pack 351/355/356/357): o=1.16440 h=1.16471 l=1.16440 c=1.16463; D-POC 1.16451 (moved 1.16532 -> 1.16451: his gap shape); D-VWAP 1.16479; behind-above: W-POC 1.16523 (D-POC ahead on next-open 1.16464); kept ok. Own-body QUALIFIES (1.16451>1.16440; 1.16463>1.16451; trigger=1; 10<11).
- 11:40 pass, bar 11:35 (pack 370/378/379): o=1.16464 h=1.16466 l=1.16444 c=1.16455; D-POC 1.16451; D-VWAP 1.16479; behind-above: W-POC (D-POC ahead); ok, vBREAK=none (pack 390).
- 11:45 pass, bar 11:40 (pack 394/398/399): o=1.16454 h=1.16454 l=1.16436 c=1.16438; D-POC 1.16451; D-VWAP 1.16479; behind-above: D-POC (next-open read, verdict=BREAK), W-POC; MTEXIT pack 411 `bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439`; deal #3 pack 412 `buy 2.38 EURUSD at 1.16440` 11:45:02. Day pack 2026-08-28.csv line 37 corroborates MTEXIT byte-identical (j866222).
- MTEXIT anatomy: evaluated at the 11:45 pass off the 11:40 open-to-next-open body (bodyHi=1.16454 > L; own close 1.16438 never crossed L); fill 1.16439/1.16440 = the 11:45 open (bodyLo=1.16439; deal +1pt). His exit 1.16464 at the 11:35 open = the 11:35 open to the point (pack 370 o=1.16464), one candle earlier, 25pts better.

## R4/R5 ROWS

- R4: SLICE_B133 S1 line 54 `Method: code-BREAK census (12 rows both windows: only A1-exit + same-line rows) + equality-edge scan (side=ahead with body-edge==val: only A2-17:45 Y-POC rank-passing + 4Jun same-line + A2-17:45 W-VWAP rank-failing) + per-trade behind/through verification (EXITCENSUS val + UJBARMAP o/c).` One sentence: S1 graded machine semantics (behind = census side= vs next open, through = open-to-next-open body), so the 11:30 own-body close-through never surfaced; S0 grades own-open/own-close — that is the exact difference.
- R5: A1 SEPARATES (R2 FOUND 11:35 open; 11:30 qualifier fills 11:35 open 1.16464 = his exit). Others unchanged from B-134 S0 vs his exits: A2 17:45 (fill 17:50 open = s78 owed); A3/A4/A5/A6/A7/B2/B3/C-05-27/C-06-03 NONE; C-06-04 NONE never counted. Verdict line: SEPARATES.
- R6: not needed (no UNKNOWN). No chart call. No carried note.

## RECORD LINES (exact)

- X1 §4: `- B135-OWED-EXIT-NOT-MACHINE-EXIT (planner lesson 2026-10-09): a must-keep exit is his exit, never the machine's; B-134 pinned A1 at the machine's 11:40 while his 28 Aug words say 'hence the exit at 11:35' and his 2026-09-22 ruling calls that exit mechanism flawed, so the S0 stop guarded a machine time. Every 'must keep' exit is checked HIS vs MACHINE against the register proof key before a trial is drafted.`
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relays B-133 to B-135 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: `- B-135: pinned his 28 Aug London exit from the record (11:35 against the machine's 11:40) and re-graded the own-body break on his exits; no source edit or run.`
- X4 ledger `1280.` tag `B135-A1-EXIT-OWED` (R1 + R2 FOUND + R3 + R5 SEPARATES).
- X5 pointer: MEASURED; EA full 64; `Lane: A2-EXIT (first B-133, 2 of 6)`; R2/R5; goal open. Register A-row-1 NOTE (R2 FOUND).
- Pre-commit: X1/X2/X3 counts 1; X4 counts 1 (`1280.`-class), `1279.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF, register; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
