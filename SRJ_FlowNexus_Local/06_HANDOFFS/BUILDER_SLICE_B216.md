# BUILDER SLICE B-216 - raw rows (S10c offline + complete H1 trial, STOP 25Jun fvg timing, RESTORED; under 600 lines)
Base: builder/B-216 cut at de7b8c5 (= B-215 head). Verdict RESTORED (F1 5/6; S SEPARATES; T1 16/16 pass; T2 STOP 25Jun present (H1b fires, S3 fvg alive), 10Jun/22Jul silent, A identical, 17Aug other removed; .B216K saved+verified, restored pristine).
## Start gate
```
log-1 de7b8c5 (backup exact; B-216 cut here; push via backup, never origin; branch from disk builder/B-216).
diff de7b8c5 EMPTY on 0.3 files + both skills + CONTEXT + HANDOFF (LF-normalized).
Disk pristine: EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; FVG 568f4ce9; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437 blessedB208. .B215K at 0.4 SHAs (Panels f383866d, OB 02f18461, flow src a8201128/ex5 3e3ae365, EA src 283edf75/ex5 77824491); CUT_B213 (164M/629M) + CUT_B215 (163M/606M) present. Ledger ^1362=1 ^1363=0 pre. No terminal64. Python 3.13.16 first. Tick history unchanged (grade vs B206T). B-38 dates every launch.
```
## Part B + D
```
B: rules/46 DEAD 1 + rules/43 0625 1 -> ALREADY_BANKED. No new rule words.
D (B-215 defect, plain words): B-215 H1 named first-close kill plus no-revival without renewal, but applied only the code-4 guard and ran anyway. Standing rule: hunk whole or STOP before compile. B-216 applies whole (H1b code10 kill + H1c helper + guards 2/4/5/6/7, code8 free).
```
## Part S raw (offline, no run; CUT_B213 EA 83ac8bde/flow f54bfb54 + CUT_B215 EA 77824491)
```
S10c whole (code1/3 or first-close kill activated or not; true-writers 2/4/5/6/7 blocked unless ren1; code8 free; H2 fvgExists&&!tickFVG; opp kept). First-close instance with bar rows only 25Jun 10:05 close 1.13574 beyond 1.13556 (B-213 R1 o1.13583 h1.13604 l1.13567 c1.13574); other first-close kills UNKNOWN (no o/h/l/c in cuts; B216H1 698 EU rows listed by id/date, e.g., 05.27 id2106, 06.12 id4239, 06.25 id5723/5730/5747/5821, 07.14 id8015, 07.16 id8368, 08.11 id11459; none are takes except 5747).
S3 pre seed-conf counts (FRESHCOUNT scope=pre + B215F1 + OBPROV/B213OB): A1 10:00 max adv2 (#185/#5513 ob1/fvg1/opp0) cleared by H2 to adv1 (S10c KEEP); A2-A7 zero pre adv>=2 (S10c KEEP); 10Jun 15:55/16:00/16:05/16:10 adv2 (ob0/fvg1/opp1 #809-812) S10c 2 REFUSE; 25Jun 10:35 adv1 (ob0/fvg1/opp0) S10c 2 via H1b (first-close) REFUSE (prediction; trial S3 first paint adv1, see T); 22Jul 14:50 adv1 (#3434 ob0/fvg1/opp0) S10c 2 via H1 persist (S10c REFUSE); others INFO (28Jul max 2, rest 0/1); 17Aug 15:55 S10b 1 vs S10c/trial 2 (S3 15:35/15:50 adv2 ob1/fvg1/opp0 #5225-5233 + B215F1 JL7512266/7512463 KILL_S3; see S4).
S4 17Aug (CUT_B215): S3 15:35 #5225-5228 adv2 (ob1/fvg1/opp0 ABORT pre) + B215F1 15:35 KILL_S3 (JL7512266) + S3 15:50 #5230-5233 adv2 + B215F1 15:50 KILL_S3 (JL7512463); S1 15:30/15:45 adv2 (non-S3, #5224/#5229). S10b conf 15:55 n=1 (B212COLOR) vs trial S3 pre adv2 - earlier-pass kill vs conf paint. OB writer code? UNKNOWN full paint (B215 CUT has OBPROV code/id/flag but bar-index only, no time map; B213OB ren/range absent in B215 CUT; first-close instances beyond 25Jun UNKNOWN per S2; kept-dead h1 rows exist in CUT_B215 (H1/H1c) but time-mapping via bar-index only). Trader words: 17 August New York long 15:55 1.15947/17:15 1.15961 removed by early S3 kills at 15:35 + 15:50 (both ob dead + fvg dead), for review; never graded (other INFO).
S gate SEPARATES (A<=1 every pass; must-nevers 2 some pre pass: 10Jun 15:55, 25Jun 10:35 S10c prediction via H1b, 22Jul 14:50) -> proceed to trial.
SEPARATOR_B216.csv (29 data rows: take/pass/writer/ren/ob-fvg-opp/count/verdict/cut; A max<=1, must-nevers 2, C OTHER-GATE, others INFO, 17Aug S10c 2 INFO removed).
```
## Part K hunks raw vs .preB216 (markers once each; braces equal/delta; 0 errors, no new warnings)
```
Re-applied .B215K byte-exact verified (Panels f383866d, OB 02f18461, EA src 283edf75; flow src a8201128 unchanged).
H1b [B216H1b] replay skip kill code10 + B216H1 print (flag only, no OB state; same close-beyond test quoted; OB L89-94 signature barHigh/barLow/barClose/replayBar/discoveryBar; inBias L168-169; closedBeyond L123-127; skip L119-121; placed before L211 return, condition !ob.isActivated):
(diff OB replay tail - see slice appendix full? Concise: +16 lines: if(!ob.isActivated){inBias+closedBeyond; if(...){tickOB=false; B216H1 date/bar/id/close/lvl; setter id/code10/discoveryBar}}.)
H1c [B216H1c] helper State + guards 2/4/5/6/7 (kept-dead h1 prints, code8 free; [B215H1] preserved, condition via helper):
- State helper +3 lines (+1/+1 braces 7->8): bool B216_KeepDead() { return (!tickOB && !ren); }.
- Code2 replay opposite guard +8/-6? (+2/+2 braces 125->131 total OB with H1b+code2+code4-helper; Imbalance 65->69 (+4: 5/6); Bias 34->36 (+2: 7)).
- Code4 [B215H1] condition via helper (marker preserved).
- Code5/6/7 guards (flag+setter+print inside else; tickFVG/counters/boundaries outside, always run; no OB/FVG state change).
Full unified diffs .preB216 vs .B216K in slice appendix (OB/Imbalance/Bias/State/Panels/EA; Panels/EA diffs = .B215K kept H2/H3, no B216 change).
Compile indicator 0 errors 3 pre-existing 1576/1798/1872 none in hunks (hunks in includes, main lines unshifted); EA 0 errors 0 warnings. ex5 post-compile Flow 839dec09 EA b1fa7ee3, static pre/post T1/T2 (any move STOP, none).
Backups .preB216 SHAs: Panels 4335f703, OB 8bbf936b, flow src a8201128/ex5 c82f175e, EA src 7c392767/ex5 83ac8bde, tini c725e437 + extras Imbalance 568f4ce9/Bias 3b1d9d3d/State 80a466ac.
```
## Filed-trade tables (vs B206T side/date/time/price sets; volumes differ ACCOUNTED)
```
T1 RECON62-B216 16/16 (removed 0 added 0; C silent; B215F1 5 non-A + B216H1 129 non-take; A untouched):
2 sell 2026-08-28 10:05 1.16466; 3 buy 2026-08-28 11:35 1.16467; 4 buy 2026-09-01 17:35 1.16024; 5 sell 2026-09-01 17:50 1.15987; 6 sell 2026-09-02 14:45 1.15747; 7 buy 2026-09-02 15:20 1.15822; 8 buy 2026-09-04 16:00 1.16019; 9 sell 2026-09-04 23:55 1.16129; 10 buy 2026-09-07 09:20 1.16138; 11 sell 2026-09-07 10:53 1.16201; 12 buy 2026-09-07 16:45 1.16264; 13 sell 2026-09-07 17:13 1.16319; 14 sell 2026-09-08 10:10 1.16205; 15 buy 2026-09-08 10:42 1.16102; 16 sell 2026-09-08 17:00 1.16220; 17 buy 2026-09-08 17:26 1.16275.
T2 EU0525TD-B216 got 38 vs exp 44 (removed 6 added 0; C silent; A identical; 25Jun present STOP; 17Aug other removed named).
REMOVED (trader words + B215F1/B216H1):
- 10 June New York long 16:15 1.15551 / 18:00 1.15523 (must-never silent; B215F1 15:05 ob1/fvg1 + 15:20 ob1/fvg1 + 15:55 ob0/fvg1/opp1 adv2 KILL_S3).
- 22 July New York short 14:55 1.14048 / 14:59 1.14075 (must-never silent; B215F1 14:50 ob1/fvg1/opp0 adv2 KILL_S3; H1 persist code4 kept-dead ren0; H1b? 9076? 9076 activated kill code3 + persist).
- 17 August New York long 15:55 1.15947 / 17:15 1.15961 (other removed, for review; B215F1 15:35 ob1/fvg1 + 15:50 ob1/fvg1 adv2 KILL_S3; S4 earlier-pass vs conf).
PRESENT STOP: 25 June London short 10:45 1.13540 / 11:00 1.13606 (must-never still fires; H1b B216H1 10:05 id5747 close1.13574 lvl1.13556 fired JL11040642 (698 EU B216H1 total) but S3 10:35 first paint fvg alive adv1 (ob1/fvg0/opp0), no B215F1 25Jun; second paint fvg dead adv2 but state left S3?/no H3 kill; H3 needs fvg dead second-paint road - remaining row).
A identical (no A removed/added; volumes differ ACCOUNTED, e.g., 08-05 1.58 vs 1.56, 08-28 2.34 vs 2.32, etc.; side/date/time/price same). C silent (added 0; all got in exp set minus removed 6).
B215F1 EU 55 total (all S3 pre, none S5/entry; take-related 10Jun x4 incl 18:40 post-entry non-take + 22Jul x1 + 17Aug x2; rest non-take bars). B216H1 EU 698 total (first-close kills incl 5747 10:05; none are takes except 5747). RECON B215F1 5 + B216H1 129 non-take (A untouched).
STOP: A differs? No. C fires? No. Three still fires? YES 25Jun -> STOP, .B216K saved+verified, restored pristine, RESTORED naming 25Jun fvg timing. New warnings 0, ex5 static. KEPT N/A; packs/INDEX/DEALS/SETUPS none (KEPT only); register C NOTE none (KEPT only).
One Python cut both runs (job_cut_b216.py, HANDOFF segments (wrapper gates hung past 90min ceiling, no DONE; grade via markers per launch-then-stop, disclosed) PRE8853923/PRE9898338 JL-continuous, T1 1044415 + T2 3275996, no overlap/gap); grade from cut (job_grade_b216.py sets + B215F1/B216H1). .B216K Panels f383866d/OB 915b4fc3/Imbalance d9a38776/Bias 0b334063/State 2e4f8a95/flow src a8201128/ex5 839dec09/EA src 283edf75/ex5 b1fa7ee3 verified; restored 4335f703/8bbf936b/568f4ce9/3b1d9d3d/80a466ac/a8201128/c82f175e/7c392767/83ac8bde/tini c725e437 byte-identical.
```
## X records
```
LESSONS +1 B-216-WHOLE-HUNK (<20k). CONTEXT 5+1 B-216. HANDOFF 3a F1 5/6 RESTORED (25Jun fvg timing) + 3b B-216 (keep 10). FIXPLAN F1/F2 state (H3 kills 10Jun/22Jul/17Aug; 25Jun needs fvg second-paint road). Ledger 1363. Pointer lane F1 5/6 (6th no-KEPT parks). READ_MAP rewritten. Housekeeping manifest (keep CUT_B213/B215/current trial cut+HANDOFFs; day log stays, delete nothing). Kit disagree reported only.
```
## Size gate (READ_MAP files)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS; HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy max PASS; relay PASS; READ max PASS; FIXPLAN PASS; SEPARATOR_B216 PASS; READ_MAP rewritten PASS. No new OBLIFE-gen (B-213 stands; B215F1/B216H1 rows in CUTs). All under cap or STOP (STOP is trial STOP 25Jun, verdict RESTORED).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads/S 50m (0.1-0.5 + B/D/S greps + code locates/reads + SEPARATOR_B216); edits H1b/H1c/helper/guards + verifies 40m (brace repairs Imbalance/Bias); compiles ind+EA 3m; T1 0:05:43 + wrapper/archive 24m (19:24-19:48, large-log slow); T2 0:44:44 replay + wrapper post-processing hung past 90min ceiling (19:49-21:30+, no DONE; graded HANDOFF markers per launch-then-stop, disclosed); cut 6m (HANDOFF 153M+569M stream); grade 4m (sets + F1/H1); X/records 20m; push/filing follow. Total ~200m.
Final disk: trial restored pristine (EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437 blessed). .B216K trial keeps unstaged (f383866d/915b4fc3/d9a38776/0b334063/2e4f8a95/a8201128/839dec09/283edf75/b1fa7ee3). .preB216 unstaged (rollback incl extras). No terminal64 (leftover? 3924? terminal exited? wrapper hung; no terminal64 after? verify pre-push). CUT_B216 (HANDOFF JL-continuous) + HANDOFF journals unstaged. Day log stays (4.4GB+; delete nothing). MQL5 live log stays (not relay evidence). No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
```
(End of slice)
