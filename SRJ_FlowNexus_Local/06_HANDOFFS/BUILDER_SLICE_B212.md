# BUILDER SLICE B-212 - raw rows (kept run + print-only colour diagnostic, always restored; under 600 lines)
Base: builder/B-212 cut at d81d71d (= B-211 head). Verdict MEASURED (F1 1/6; S9a/b break 25Jun only; no trial).
## Start gate
```
log-1 d81d71d (backup exact; B-212 cut here; no remote B-212 before push; push via backup).
diff d81d71d EMPTY on 0.3 files + skills + CONTEXT + HANDOFF + ledger (LF-normalized; strategy index+rules untouched this turn).
Disk: EA src 7c392767 / ex5 83ac8bde (rebuilt pin, B-211 provenance); POI 5AF5E035/E5CBE1A2 (ex5 unverified, never compiled); flow a8201128/c82f175e; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437. .B211D/.preB211 unstaged.
Journal 167197 (341 ACCOUNTED). Ledger ^1358=1 ^1359=0 pre. CUT_B211 at sizes (168906916/625704293). No terminal64. Python embed. B-38 dates write+readback every launch (RECON 1787702400/1788998400; EU 1779667200/1791936000).
```
## Part B (grep-first)
```
B1 rules/46 present once (file + d81d71d name list) -> ALREADY_BANKED d81d71d. No new rule words.
B2 his resume words grep 0/0/0 (AGENTS.md 72KB, relay SKILL+01a/01b, journal 167197) -> NOT FOUND, nothing banked, nothing paraphrased (workflow observed in slice only).
```
## Part T0 (kept identity, before readings)
```
RECON62-B212K (kept 83ac8bde/c82f175e): PRE=0 fresh log; DONE PASSED (3:39, 563338 ticks/3168 bars = B-208/B-211 fingerprint); ex5 static; leftover stopped by PID. Filed table 16/16 identical (tester deal rows #2-17 vs B206T; T0 CUT 1,967,014 rows unstaged). T0 PASSES -> 83ac8bde kept ex5 of record. T0b: no compile this turn before T1 (moot until T1; backups below).
```
## Part R raw
```
R1 correction (EU CUT_B211, JL): 25Jun n=2 at 09:20 DEAD/DEAD JL3134310 + 09:25 DEAD/DEAD JL3134351 (pre-seed morning passes); conf 10:40 pairs n=1/1 (JL3137000/3137734: LIVE/DEAD 10:00/10:05). 22Jul n=2 at 14:30 JL3514361, 14:35 x2 JL3514401/409, 14:40 x2 JL3514449/459, 14:45 JL3514500 (all DEAD/DEAD); conf 14:50 pair n=1 (JL3514590 LIVE/DEAD 13:20/13:50) then n=0 (JL3515609 LIVE/LIVE 14:15/13:40 ren=1). B-211 result's "must-nevers count 2" = window-max (earlier bars); conf truth = pairs above. EA matches pre-renewal (first) print (see R2). Record corrected (relay R1 bought this).
R2 (conf bar; FRESHCOUNT obDead/fvgDead/oppFvg/adverse/verdict/scope/JL beside B211PANEL pre+post): 10Jun 0/1/1/2 ABORT-pre JL2930806 + 2x HOLD-post (JL2931213/215) vs PANEL 2 (JL2930601 LIVE/DEAD/opp-yes) then 0 (JL2931232 LIVE/LIVE/opp-no) -> EA matches FIRST (2). 25Jun 0/1/0/1 HOLD-pre JL3137004 (+post x3) vs PANEL 1/1 -> matches (1). 22Jul 0/1/0/1 HOLD-pre JL3515054 (+post x2) vs PANEL 1 then 0 -> matches FIRST (1). A1 0/1/0/2?? (B211 RECON#185 S3 ob1/fvg1/opp0 adv2 ABORT-pre JL2890992 + S5 posts) vs B212COLOR 10:00 triple n=1 (tickOB 0/fvgEx 0/tickFVG 0/opp 0 ren 0 JL2890776/858 + JL5306412/462 EU dup) -> EA count 2 vs colour 1 (FVG fallback vs display gate - panel-color count keeps A1, raw-flag count refuses; S9 uses colour). A2-A7 per COLOUR/PANEL files (all <=1 colour; FRESHCOUNT per R3 seed windows in slice table below).
R3 availability: tickOB (ob DEAD<=>0 else 1) PRINTED; tickFVG (fvg DEAD<=>0 else 1) PRINTED; hasOpp (yes<=>1) PRINTED; count+ren PRINTED (B212COLOR, 3,132 + 20,604 rows, both runs identical values); fvgExists DISPLAY gate (Panels L194-210/261/275: doubleOB ? ForDisplay : Now; detectionBar-bounded + suppress/isInitialFlipBar) PRINTED as fvgEx (0/1) per bar. Seed rule (disclosed): latest continuous same-date S3/S4-pre FRESHCOUNT chain (5-min grid) at/before conf (prints carry no seed id; A2 chains 09:20/16:10/17:30 prove the need). Seeds: A1 10:00, A2 17:30, A3 15:45, A4 09:05, A5 16:35, A6 10:05, A7 16:55, 10Jun 15:50, 25Jun 10:35, 22Jul 14:50.
R4 renewals 22Jul 14:35-14:50 (B212D EU CUT): exactly ONE ren=1 row (bar 14:55 JL4557165, post-entry; pre-entry ren=0 on all 11 rows 14:30-14:50 incl. conf pair). Trigger: OB 9081 S 14:45 1.14037-1.14073 (pack #2694, reg 14:55) + FVG UNKNOWN (no formation row 14:50-14:55 in pack tag set; ImbalanceMgr nearest-OB scan + hasNewOB gate DERIVED). Pre-entry machine agrees his no-renewal words. B-144: b= stamps are export-bar (post-next-bar processing) writer convention, applied to both prints. Reconciles B-210 R3 (9081 alive at conf; 9076 dead 14:35 code3 pack #2549; zone 8925 in-play pack #2750/51) + PANEL 14:15 block (9080-class bullish pick shape, not his block).
R5: buffer-4 dead at A1 conf (FRESHCOUNT #185 fvgDead=1 JL2890992 + EU dup); fvgExists false on panel (fvgEx=0 on all three 10:00 colour rows JL2890776/858 + EU dups; display gate Panels L201-210/257-261; his box no-FVG-line; Text L53-56 !fvgExists+!tickOB -> "OBx" only). 08:00 gap (1.16440-1.16444) = BOTH print-fallback piece (.B211D L1238-1248 structure fallback block, quoted: "if(SrjIsNa(b211_fBest) && !SrjIsNa(g_s.currentStructureStartBar) ...") AND tick-flag piece (TickValid fallback P-VNEXT-1 E2, ImbalanceMgr L478-493 same shape); panel DISPLAY gate excludes it (detectionBar + doubleOB + suppress). R5 answered from rows + hunk text as ordered.
```
## Part T1 raw
```
Backups .preB212 (T0b): Panels.mqh 4335f703 + Flow ex5 c82f175e + EA ex5 83ac8bde (SHAs given, before compile).
Hunk: Panels RenderBiasPane after colour block (anchor L275-277 + L279, verified by bytes); [B212COLOR] once (comment+print one set); braces 46/46 -> 48/48 (+2/+2); locals + read-only queries only (inBiasOBExists documents read-only); session HH gate; one PrintFormat ~95 chars.
Compile (harness): FlowLogic 0 errors + 3 warnings at ORIGINAL lines 1576/1798/1872 (none in hunk - hunk lives in Panels.mqh include; main-file line numbers unshifted) = B-208 K2 class, no new warnings. EA untouched (no compile needed; 0/0 stands from B-211).
ex5: post-compile Flow 332a097c (EA 83ac8bde untouched); pre-T1-launch same; post-T1 same; post-T2 same (binary proof, no mid-run move).
T1-RECON (RECON62-B212D): DONE PASSED (3:39-ish; deals 16/16 identical incl. 3,132 colour rows; filed table vs B206T NONE mismatches). Leftover stopped by PID.
T2-EU (EU0525TD-B212D): EU dates set+verified; DONE PASSED per wrapper + marker "Test passed in 0:26:02" (6171443 ticks/29373 bars = B-211 fingerprint; wrapper DONE file absent, missed - marker + operator confirmations used, disclosed); 44/44 identical; 20,604 colour rows.
One batch cut (T1 JL + T2 JL-continuous lines, no overlap/gap; T0 CUT separate unstaged). STOP: no deal differs (16+44), no new warning, ex5 static. No STOP.
Save/restore: .B212D (Panels d5f17a59 + Flow 332a097c verify); restored Panels 4335f703 + flow ex5 c82f175e byte-identical; EA files untouched (7c392767/83ac8bde verified, no writes).
Anomalies owned + disclosed: (a) T1 launched pre-compile with kept binary (voided kept rerun TERMINAL_EXITED_EARLY, segment excluded); (b) hunk found in place pre-backup with exact intended bytes (adopted after diff-proof; .preB212 pristine secures restore); (c) day-log line-generation break mid-turn (T0 CUT orphaned from rotated source; T1+T2 chain self-coherent by brackets+continuity; rotation watch recommended); (d) wrapper missed T2 DONE (marker used).
```
## Part S (SEPARATOR_B212.csv 28 rows: 10 takes + 5 C + 13 others)
```
S9a (colour, seed->conf): A1 1, A2 1, A3 0, A4 1, A5 1, A6 1, A7 0 (all KEEP); 10Jun 2, 22Jul 2 (REFUSE-GOOD); 25Jun 1 (PASSES-BREAKS-MUST-NEVER). S9b (his no-renewal on 22Jul): identical (22Jul already 2). Verdict DOES NOT SEPARATE, breaking 25Jun only. Others INFO (28Jul refuses at 2, matches his F3 no-zone words; rest 0/1 unchanged vs S1). C OTHER-GATE.
EA-readability: buffers 3/4/5 carry tickOB/tickFVG/hasOpp (B-211 R1 FOUND, re-verified live this turn); fvgExists display + renewal trigger unexported (B-149 sequence needed: print (this turn) -> separate -> buffer) -> no trial even if separated. No B-213 trial. F1-relay-2 measures the 25Jun registration kill (R2 cause; R4 filed INFO).
```
## X records
```
LESSONS +2 panel/seed + ex5-backup (folded B145 HISTORY for cap; full text ARCHIVE L173 + HISTORY list here: B145-STAMP-CORRECTED (B-143): an XOBDIAG row stamped barT holds the state after the next candle's passes...). LESSONS <20k.
rules/01a +1 ex5-backup line (Trial discipline). CONTEXT 4+1 parked-lane evidence + 5+1 Brain B-212. HANDOFF 3a F1 row + 3b B-212 (keep 10). FIXPLAN F0 parked line. Ledger 1359. Pointer lane F1 1/6 + T0 + S9 + FILL-EXACT bid/ask/spread/Model-4 (35-line cap).
```
## Size gate (READ_MAP files; slice SEE BELOW)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS; HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy SKILL/rules max PASS; relay SKILL/rules PASS; READ max PASS; FIXPLAN PASS; COLOUR PASS; SEPARATOR PASS; BOOTSTRAP PASS; READ_MAP 1496/6000 PASS. All under cap or STOP (none).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads 15m; T0 3:39 + gate 5m; R-script EU pass 6m; T1 hunk/verify/compile 10m; T1-RECON 3:39 + gate; T2-EU 26:02; cuts 4+8m; S-grade 4m; others pass 4m; X/records 15m; push/filing follow. Total ~90m.
Final disk: sources kept byte-identical (EA 7c392767, Panels 4335f703, flow a8201128); flow ex5 c82f175e byte-identical; EA ex5 83ac8bde kept of record (T0 16/16); POI/Sessions untouched; .B212D/.preB212/.preB208 unstaged; tini blessed c725e437; no terminal64; journal 167197 (341 ACCOUNTED); CUT_B212 (T1+T2 JL-continuous) + T0 CUT stay, unstaged; Tester day log (2.07GB) deleted post-filing (manifest: evidence in CUTs; void kept-rerun + pre-1967015 generations excluded); MQL5 live log stays (not relay evidence). No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
```
(End of slice)
