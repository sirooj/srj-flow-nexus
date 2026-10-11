# BUILDER SLICE B-175 - raw rows (his 06:30-06:40 gap rebuilt; machine gap store located; L2 separates)

Base: builder/B-174 head b97cea8 on builder/B-175. Gate per result (864 status; SHAs incl terminal.ini ACCOUNTED+restored; no terminal64). Kept B-170 packs (EA 794DD4B8) + Tester/logs/20261011.log kept-segment copies (903 bars, 0 value mismatches across run copies). B-174 citation-segment note: B-174's OHLC log lines (e.g. 06:45 log 5044012) sit in the B-171 trial segment; values identical on kept copies (0 mismatches); B-175 cites kept-segment lines (e.g. 06:45 log 3481499).

## Gate raw

- terminal.ini drift (ED027741 vs CF80083C, same 20447 B): L146 RecompiledAll 1791720095/1791667171; L150 LastStartTime 1791720154/1791609734; L435 LastScan 1791720215/1791441668; L774 IsVisible 0/1; L874 Dividers blob differs mid-line. No [Tester] window change. Restored byte-for-byte from terminal.ini.preB171 -> CF80083C verified. ACCOUNTED (B-172 class).
- Relay SKILL.md diff --stat: `1 file changed, 7 insertions(+)` (+7 -0). New line: "- Trader summaries and carried notes name zones and events by candle time, price and session only, never by machine zone numbers, tags or log references (his words 2026-10-11, B-175)."

## Part B (grep-first)

- Skill "only FVG at 6:30 to 6:40" 0; "USE ACTUAL CANDLE TIMESTAMP" 0 -> appended (1/1 after). Register "B-175" 0 -> NOTE appended (1 after). Journal 8/28 London row EXISTS (row 257: 257,8/28/26,LDN,...,D VWAP,...) -> reported, appended nothing. Findings/ledger/skill FVG-with-no-XOB search: zeros (nearest: SEP8 16:25-long "no XOB" no-FVG-named L5/19; XOBSUIT-1 L49/76/100); spec 3.5 L128-129 quoted in planner note.

## R1 28 Aug gap (kept log lines)

- 06:30 `UJBARMAP bar=2026.08.28 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494` (log 2461881); 06:35 `o=1.16494 h=1.16494 l=1.16486 c=1.16486` (log 2461912); 06:40 `o=1.16487 h=1.16489 l=1.16475 c=1.16476` (log 2461945). Bearish gap 1.16489-1.16491 (06:30 low above 06:40 high).
- 06:45-09:50 all below (max high 1.16482 at 09:35, log 2462956). 09:55 `o=1.16473 h=1.16491 l=1.16473 c=1.16482` (log 2463077): wick to top tick, body below - first entry, no kill, remainder consumed-empty. 10:00 `o=1.16482 h=1.16486 l=1.16462 c=1.16467` (log 2463147): never enters. Alive at 10:00 (unkilled).
- B60C `bar=2026.08.28 10:00 ... rt=2026.08.28 09:55 ...` (W1:5503). Opposing 09:55 touches (wick 1.16491).
- UJPROBE `bar_key=2026.08.28 09:30 ... ltf=1.0` (log 2462922) -> `bar_key=2026.08.28 09:35 ... ltf=-1.0` (log 2462955): flip into short at 09:35.

## R2 spots (located by text)

- EA:7120-7121 `bool haveFvg = ReadFlow(FL_BUF_FVG_LEG_ZONE_HIGH, fvgHi, barShift) && ...` (S4RQZ pick); EA:9038 S5 re-read; EA:7130-7145 FVG-preferred tiebreak; EA:9109 ZONEPICK print (`haveFvg=%d ... fvg=---`); EA:9401 comment "An FVG has no promotion time of its own."
- Indicator:1260-1329 leg-gap export (gate :1272 `g_s.currentLegHasXOB`; side :1283-1284; unfilled :1286; remainder :1298; leg window :1303; nearest-to-price :1304; write :1324-1326). Detection ImbalanceMgr:115 (bull) + :240-244 (bear `if(high[i] < srjL(low,i,2))`, no minimum). Fill ImbalanceMgr:379-385 backfill, :386-423 wick-shrink (never kills), :424-440 body-midline kill. Draw inputs indicator:311-323 (same g_imbalances store). Blank fallback ImbalanceMgr:478.
- Rows: ZONEPICK haveFvg=0 at 09:55 (W1:5469) and 10:00 (W1:5501); haveFvg=1 rows = 0 in all 107961 -B170 pack rows. Leg-gate state at 09:55/10:00 NOT PRINTED.

## R3 2 July (kept log 3481332-3484694; 24 bullish gaps, all dead or untouched)

- 18:10 `o=1.33706 h=1.33740 l=1.33684 c=1.33708` (log 3484136); 18:05 `o=1.33717 h=1.33721 l=1.33654 c=1.33704` (log 3484116, first-entry/kill candle for late gaps). Nearest live remainder [1.33643-1.33654] (formed 17:50): 30pts under 18:10 low - no touch. 17:40 `o=1.33634 h=1.33643 l=1.33564 c=1.33605` (log 3484018).
- Live long zones at 18:10 (8, B-174): no candle reach in W-L1 17:55-18:10 (lows 1.33654+) or W-L2 17:15-18:10 (lows 1.33555+) vs top zone 1.32677-1.32799. B60C rt=18:10 (W1:7046).

## R4 rows (opp = B60C rt; roads B-174 R4)

- A2 opp 16:45 `o=1.16013 h=1.16013 l=1.15975 c=1.15990` (log 2491739) touches 16:30-16:40 gap 1.15968-1.15981 (unkilled). ARM.
- A3 opp 15:40; gaps dead; zones 1.15907-1.15933 etc. hit 15:30/35/40 (W-L2 + seed window from 15:30, seed-bar W2:11381). ARM.
- A4 opp 09:00; no gap to 09:15; zones hit 09:00/09:05 (seed-bar 09:00 W3:61). ARM.
- A5 opp 16:05 `o=1.16247 h=1.16251 l=1.16238 c=1.16245` (log 2537942) touches 15:15-15:25 gap 1.16230-1.16246 (unkilled). ARM.
- A6 opp 09:40; 09:25-09:35 gap touched-and-killed at 09:40; zone hit by 10:05 bar `o=1.16222 h=1.16232 l=1.16206 c=1.16207` (log 2546991) in first-commit window from 10:00 (W3:3793). ARM.
- A7 opp 16:45; gaps dead; zone hit 16:15 `o=1.16236 h=1.16241 l=1.16226 c=1.16234` (log 2550190) in first-commit window from 16:15 (W3:5340). ARM.
- B2 opp 16:00; gaps touched-and-killed at 16:00; no reach 16:05 `o=160.032 h=160.086 l=159.992 c=160.008` (log 3033915) / 16:10 `o=160.009 h=160.062 l=159.981 c=160.058` (log 3033980) vs top 159.916; direct hits=0 (log 997930). JUMP.
- B3 opp 14:05; gaps dead; zone hit 10:45 `o=160.509 h=160.513 l=160.500 c=160.510` (log 3085991) in first-commit window from 10:45 (W3:10783). ARM.
- C-06-03 opp 09:00 `o=159.927 h=159.927 l=159.905 c=159.910` (log 3003801) touches 08:35-08:45 1pt gap 159.905-159.906 (unkilled; candles log 3003718/3003745); zone hit 09:00/09:05 (z1 W2:5357 cbT 09:05). ARM.
- C-05-27 listed: gaps dead pre-15:25; zone hit 15:25 (log 2948381). ARM.
- T0707 change detector: gaps dead pre-14:40; zone hit by 14:40 bar `o=1.33886 h=1.33892 l=1.33860 c=1.33865` (log 3506199) in seed window (seed-bar 14:40 W2:3762). ARM.
- Refused S3 rows: C-06-04 (S3 ran, PROMO_RETURN_NONE W2:8529, short set EMPTY, only post-opp gap) ; C-06-10 (S3 ran W3:8564+, his INVALID); C-08-27 (S3 ran W1:3457+, his INVALID); C-09-01-1530 (S3 ran W2:3851, at-confirm 5m, gaps killed at 15:25); C-08-28-1625 (S3 ran W1:7097, TP_RR_FAIL W1:7136, diagnostic 16:00-16:10 gap alive+touched by 16:05); C-09-08-1645 (S3 ran W3:5445, TP_RR_FAIL, gaps dead); C-06-02 / C-09-04-1040 (S3 commit never ran). All OTHER-GATE.

## S (REPORT/SEPARATOR_B175.csv, 66 rows)

- HIS-ZONE-L1: MET 11 (A1-A7, B3, C-06-03, C-05-27-listed, T0707); NOT MET B2 + T0702 -> DOES NOT SEPARATE.
- HIS-ZONE-L2: MET 12 (+B2); NOT MET T0702 only -> SEPARATES.
- FVG-ONLY: MET A1/A2/A5/C-06-03; NOT MET rest -> DOES NOT SEPARATE.

## R5

- (b) SEPARATES-but-unseen -> B-176 print-only gap fix run (06:30-06:40 gap at 10:00, deals identical, no gate). Per-zone census export follows, same proof discipline.

(End of slice)
