# BUILDER SLICE B-209 - raw rows (EURUSD read-only; under 600 lines)
Base: builder/B-209 cut at cdbee44 (= builder/B-208 head). No edit, no run. Verdict MEASURED.
## Start gate
```
log-1 cdbee44 (backup exact; B-209 cut here; push via backup). Python 3.13.16 embed (py launcher missing, embed used).
diff cdbee44 EMPTY len 0 on 12 gate files (pointer, RESULT/SLICE_B208, OBJECTS, FIXPLAN, CLEANUP, register, CONTEXT, HANDOFF, ledger, both skills).
Disk: EA 7c392767c88ff75469022504a34bc62e0f8c319b51aa726c91564448c0a0ebb5 / ex5 b2ef6e4ca9ab28e61ae841ca1c8b9034d109c9b0d469d3606084fdcbc815c5e3; POI 5AF5E0354600635e05b7642236c24a5dd6af0bfec983f3c203d0a65a41190e33 / E5CBE1A2; flow a8201128 / c82f175e; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437 (= blessedB208); .B208D 8cc4c502/5f86a20e/e32c1ef6; .preB208 kept unstaged.
Journal 166767 bytes (12+/3- rows 339-340 unstaged ACCOUNTED). Ledger ^1355=1 ^1356=0 pre. CUTs present RECON 156484716 / EU 586834771 (segments 313MB/1.17GB in day log). No terminal64.
B-208 records: CONTEXT two B-208 (L377/378) + Brain (L379) FOUND; HANDOFF B-208 (L215) FOUND; ledger 1355 FOUND; relay Housekeeping blessed-copy (L97) FOUND. No MISSING.
```
## Part B (no new words; counts cdbee44)
```
0610/0625/0722-EU-INVALID once each (L342/343/344). B-207 B1 (L351) + B2 (L355) once each. EU-FIRST L353 once.
```
## Part R raw
```
R1a A1 OB: RECON 2170 S form 09:25 1.16446-1.16479 lvl 1.16463 inBias0 kill 09:40 close 1.16475 LIVE code3 (JL927325/401/402); EU-D 13650 same (pack #3895/4005/4006). Side S vs SHORT same-side; close above level (adverse for SHORT). No wrong-side kill. FRESHCOUNT A1 #185/#5513 ob1 fvg1 opp0 adv2.
R1b A1 FVG DERIVED older BODY (13633/13639 BODY 09:25, 13647 BODY 09:15) + his 2150 wick 09:55 JL927510 (range 1.16489-1.16491 JL926135). A3-A7 adv1 each DERIVED (last BODY pre-conf in CUT).
R2 25Jun bars (B196BAR pack #702/750/799/850/900/954/1031): 09:40 o1.13572 h1.13575 l1.13547 c1.13570; 09:45 o1.13568 h1.13585 l1.13545 c1.13564; 09:50 o1.13562 h1.13578 l1.13550 c1.13551; 09:55 o1.13551 h1.13551 l1.13522 c1.13527; 10:00 o1.13529 h1.13587 l1.13524 c1.13582; 10:05 o1.13583 h1.13604 l1.13567 c1.13574; 10:10 o1.13575 h1.13579 l1.13500 c1.13500.
OB definition: strategy L231-232 (invalidation level, not always midline; body-close more extreme moves it) + spec 3.4 L109-113 (2-of-3 pre-confirmation only). Formation test: Types NewOrderblock L252-280 (inv = min(mid,open) bull / max(mid,open) bear) + OB CreationPass L222-245 (strict fractal high + bullish candle i-1/i-2) + Fractals L14-33 (bullish = close>open; fractal high = h[i-1]>h[i]+h[i-2]). Walk 10:00: bullish candle (c>o) true; fractal-high needs h[10:00]>h[09:55]+h[10:05] = 1.13587>1.13551 true + 1.13587>1.13604 FALSE -> first refusing term = right-neighbor fractal (NO PIN, code-only). Machine still formed 5747 S 10:00 1.13524-1.13587 lvl1.13556 inBias1 at 10:15 (#966), alive at conf (closes <lvl), killed 10:50 post (#1449). OBJECTS NOT-FOUND contradicted by pack (trust evidence). Bullish 5744 (09:45) +5745 (09:55) skipped NOT-IN-BIAS at 10:10 close 1.13500 (#967/969 + OBPROV code4).
R3 22Jul: strategy L344, register L84, FIXPLAN F2 L36, B204 result, journal 7/22 LDN only: all name "in-bias 5m OB invalidated" with no candle/level/range. Verdict NOT FOUND ("no ruling found"). Chart call in result carried note.
R4 OPP write: ImbalanceMgr .B208D L234-237 (bearish-bias opposing BULL sets flag true + OPPV) + L357-361 (bullish-bias BEAR) + resets L199/L324 (renewal clears) + BiasEngine L226/235/287/295. 25Jun OPPV BULL 10:05 (#904) -> FRESHCOUNT #1720 opp1, then renewal 5748 formation 10:20 clears -> #1731 opp0. Lost write proven. Same check all takes in PIECES (22Jul seed-late, A1 no OPPV).
R5 Wick: strategy L41 (dead when wicked entire range or body-closed) vs machine FillDetection L379-439 (wick shrinks remainder never kills; death = body-close beyond midpoint L427-431) + TickValid L444-496 (latest in-bias filled only). WICK kills pre-conf never flip flag; list per take in PIECES (A1 wick 09:55, 25Jun WICKs 10:10 etc., 22Jul WICK 14:15).
```
## Part S (SEPARATOR_B209.csv 28 rows)
```
S1 DOES NOT SEPARATE (break A1 refuses 2, 25Jun passes 1, 22Jul passes 1; 10Jun refuses 2 good).
S2 DOES NOT SEPARATE (OPP-fix 25Jun 1->2 good; break A1 refuses 2, 22Jul passes 1; side fix NO, wick no move).
S3 DOES NOT SEPARATE (25Jun block 5747 0->1, still refuse; break A1+22Jul). No S separates; breaking A1+22Jul; missing R3 + A1 piece diff; no B-210 trial.
S1=FRESHCOUNT verified every pass listed (A1 #185, 10Jun #812, 25Jun #1733, 22Jul #3434, etc.); any diff would STOP Part S (none).
```
## AW proofs (PK-2->PK-3; before/after bytes + SHA8)
```
ARCHIVE byte-identical to cdbee44 blob (disk CRLF accounted): CONTEXT disk c844a759/blobs ed2c89ff (norm equal), HANDOFF 5e57531f/2ea10182, STRATEGY 619c7d07/a6aa525b, RELAY 2088e96a/2088e96a (LF), REGISTER 7918d9be (22562).
Strategy split: OLD 359 lines 299 nonblank; NEW SKILL 69 lines 8971 910d135d + 45 rules (max 12720, all <20k); proof missing 0 extra 0 PASS; linemap 359 rows READ/STRATEGY_LINEMAP.csv.
Relay split: OLD 134 lines 117 nb; NEW SKILL 13 lines 544 c6e8261c + 01a 11938 db17492a + 01b 15308 fcfc15b8 (both <20k, +AB1/AW7 banking); proof 0/0 PASS; linemap READ/RELAY_LINEMAP.csv.
LESSONS: dated tags 157 total = 124 STANDING in LESSONS (19660->19797 with B-209) + 33 HISTORY (28 +5 XOB B-86/87/88/90/89 moved, oldest parked). Counts equal. LESSONS 19797 <20k.
HANDOFF: 53 lines 6194 <20k (lane table 16 + last10 B-200..B-209 verbatim; full arc in ARCHIVE).
READ: REGISTER 6 copies (6228/5508/7097/700/2501/645, header sha 93ee05f1) + SPEC 12 copies (max 14288, header f2f4cdde); spec/register sources never edited.
AW6: PLANNER_SKILL L2 PK-2->PK-3 (6173 8f?->6124 006b2ae9); step2 read-list -> READ_MAP-first (quoted); TEMPLATE PartX -> LESSONS-one-line + size-gate (3380->3439 3bdcd953); HANDOFF sec1 + BOOTSTRAP read-first lists NOT FOUND (no such list).
AB1: his compact-records words verbatim banked in relay rules/01b Compact subsection (+AW7 6 caps lines verbatim). Ledger 1356 AB sub-line.
```
## Size gate (READ_MAP files; cap PASS/FAIL)
```
pointer 4359/6000+35 PASS (35 lines); result 4048/12000 PASS; slice SEE BELOW; CONTEXT 5471 PASS; LESSONS 19797 PASS; HANDOFF 6194 PASS; SKILL 6124 PASS; TEMPLATE 3439 PASS; strategy SKILL 8971 PASS; relay SKILL 544 PASS; rules max 15308 PASS; READ max 14288 PASS; FIXPLAN 8514 PASS; REPORT 2463 PASS; PIECES 7828 PASS; SEPARATOR 5985 PASS; BOOTSTRAP 2754 PASS; READ_MAP 1575/6000 PASS. All under cap or STOP (none).
```
## Timing + final disk
```
Wall (read-only, no runs): gate+branch 5m; reads 25m; R scans 50m (CUT streaming UTF-8, one script/job); AW splits 70m; X+READ_MAP 15m; records+push 10m. Total ~175m session wall.
Final disk: kept build as result (full SHAs above); .B208D/.preB208 unstaged; blessedB208 copies present; tini = blessedB208; no terminal64; journal 340 unstaged; CUTs stay.
```
(End of slice)
