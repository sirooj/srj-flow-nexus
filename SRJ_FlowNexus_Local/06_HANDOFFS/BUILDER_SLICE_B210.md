# BUILDER SLICE B-210 - raw rows (EURUSD read-only; under 600 lines)
Base: builder/B-210 cut at 07b3746 (= builder/B-209 head). No edit, no run. Verdict MEASURED.
## Start gate
```
log-1 07b3746 (backup exact; B-210 cut here). Python embed 3.13.16. Skills via index (relay 2 rules, strategy 45 rules; .agents never opened).
diff 07b3746 EMPTY len 0 on 0.3 files + CONTEXT/HANDOFF/ledger/skills (LF-normalized).
Disk: EA 7c392767/B2EF6E4C, POI 5AF5E035/E5CBE1A2, flow a8201128/c82f175e, SESS 16573a5b, OB 8bbf936b, FVG 568f4ce9, tini c725e437. .B208D/.preB208 unstaged.
Journal 166767 (339-340 ACCOUNTED). Ledger ^1356=1 ^1357=0 pre. CUTs 156484716/586834771. No terminal64.
```
## Part B (no new words; 07b3746)
```
B-204 0610/0625/0722 once each (rules/43 L15-17). B-209 AB1 once (relay rules/01b L24). FVG-validity old L41 -> rules/02 L4 (linemap 41).
```
## Part R raw
```
R1 zones (packs): A1 10:00 ZONEPICK xob 1.16492-1.16507 inPlay0 + XOBPROMO 13629 promoT 06:40 + ORIGIN S 13589; his FVG 06:30-06:40 rules/31 L4 (no valid XOB L7). 10Jun 16:10 ZONEPICK xob 1.15361-1.15401 inPlay0 + XOBPROMO 3866 promoT 15:45. 25Jun 10:40 B162ORIGIN S 5747 1.13524-1.13587 formT 10:00 + B152PR z1=5747; his UNKNOWN. 22Jul 14:50 ZONEPICK xob 8925 1.14146-1.14194 inPlay0 + XOBPROMO 8925 promoT 21 July. Kills per his words: block body-close beyond level (R1), FVG wick-whole/body-through rules/02 L4, XOB level B-146 rules/26 L2-3. FLAGS_B210.csv 28 rows (DERIVED/UNKNOWN where selection prints no id).
R2 11,678 OBs: CODE reg-window kills 3238 (27.7%; first pass tab-vs-space bug fixed before filing). Deciding 5747 S 10:00 1.13524-1.13587 lvl 1.13556 inBias1 reg 10:15; bars 10:00 o1.13529 h1.13587 l1.13524 c1.13582 + 10:05 o1.13583 h1.13604 l1.13567 c1.13574>lvl (kill code). His NOT STATED (B-146 XOB-only rules/26 L2-3; 5747 is OB; NO-CASCADE). Replay silent via activation gate (OrderblockMgr 102-117 shouldActivate barLow<ob.low bear; 10:05 low 1.13567>1.13524 false; 119-121 skip if not activated prior; live 505-511 same; refOk 135-140/516-524 never reached). Replay zero 141d (B-208 P2) consistent. Code lines quoted by text location (B-209 slice L20).
R3 22Jul CUT 106 obs / 53 kills / 43 skips / 95 bars. Bearish 14:00-14:50: one (9081 S 14:45 1.14037-1.14073 lvl 1.14055 inBias1 reg 14:55, no kills/skips, alive). London: 9076 S 13:45 1.14046-1.14061 lvl 1.14054 inBias0 killed 14:35 close 1.14064 code3 (alive at 14:00, dead before conf; last-write true via 9080 skip code4 => FRESHCOUNT ob0). Zone 8925 S old alive. Several => chart picks, never picked for him.
R4 OPP: spec 3.4 L39 "Staleness and structural renewal never invalidate" quoted. Strategy rules grep opposite+renewal/cancel: 1 unrelated (FRESH-SWEEP rules/05 L8). Findings grep: 3 unrelated (ADOPT-READINESS:9, DIVCON-1:77/129). Register/journal 0. Verdict NOT FOUND. B-209 OPP fix NO PIN, INFO only.
R5 spec-open: strategy grep behind-zone/global: 0. Findings grep: 0. Register grep: 0. Journal 8/28 LDN row 257 (no zone-vs-global answer). Verdict NOT FOUND. Chart: 28 Aug 10:05 short off 06:30-06:40 gap: 09:25 block (1.16446-1.16479) closed through 09:40 (1.16475). Did it count?
```
## Part S (SEPARATOR_B210.csv 28 rows)
```
S4 zone (code) DOES NOT SEPARATE (break 10Jun UNKNOWN, 25Jun pass, 22Jul pass, A2-A5 UNKNOWN).
S5 zone+R2 code DOES NOT SEPARATE (break 22Jul, 10Jun UNKNOWN, A2-A5 UNKNOWN; 25Jun fixed 1->2).
S6 zone+R2 his DOES NOT SEPARATE (his NOT STATED, same as S4).
S7 global+R2 DOES NOT SEPARATE (break A1 refuse 2, 22Jul pass 1; R2 moves 25Jun 1->2 only).
No S separates (plus R5 open NOT FOUND). No B-211 trial from counts. B-211 carries R3/R5 charts.
```
## X records
```
LESSONS +1 B-210-SPEC-OPEN-FIRST (156/160). LESSONS 19955 <20k (fold none needed).
HANDOFF 3b +1 B-210 (149/200; drop B-200, keep 10 B-201..B-210). HANDOFF 6040 <20k.
CONTEXT Brain B-210. CONTEXT 5551 <20k. Ledger 1357 added. Pointer lane 5 of 6 + goal-map fix (35 lines, 6k).
```
## Size gate (READ_MAP files; slice SEE BELOW)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS; HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy SKILL/rules max PASS; relay SKILL/rules PASS; READ max PASS; FIXPLAN PASS; REPORT/FLAGS/SEPARATOR PASS; BOOTSTRAP PASS; READ_MAP 1588/6000 PASS. All under cap or STOP (none).
```
## Timing + final disk
```
Wall read-only: gate+branch 5m; reads 20m; R1/R2/R3 Python CUT streaming 15m (3.3M lines EU; tab-bug fixed); R4/R5 greps 5m; FLAGS/SEPARATOR 10m; X+READ_MAP 10m; records+push 10m. Total ~75m.
Final disk: kept build unchanged (prefixes in result); .B208D/.preB208 unstaged; blessedB208; tini=c725e437; no terminal64; journal unstaged; CUTs stay.
```
(End of slice)
