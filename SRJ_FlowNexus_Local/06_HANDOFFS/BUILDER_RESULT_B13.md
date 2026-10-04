# BUILDER RESULT B-13 - T1 takes 7/7, T2 takes 0/7: V8 is the losing layer (measurement record)

Step 0 raw, Part A start gate (measured 2026-10-04, terminal disk):
- A1 git log -1: 4a20e5f Permissions: auto-allow git add/commit/push + workflow external directories (operator word 2026-10-04) - NOT f11a71a: the cherry-pick landed on builder/B-11 after the relay was written. Branch builder/B-13 was still cut from f11a71a literally as listed (4a20e5f and 59fd96e stay behind, local-only, unpushed, on his word).
- A1 git status --short line count: 44 on builder/B-13 (40 carried + 4 .preB13 untracked).
- A2 SHA-256 checks, all 5 prefix-passed, no STOP: EA F04AF9C3...; .preB12 F04AF9C3...; HTFEngine D5FD5B06...; FlowLogic.ex5 634183D2...; EA.ex5 F3D3F240....
- A3 read-only: core.autocrlf=true from file:C:/Program Files/Git/etc/gitconfig (system scope); core.eol and core.safecrlf unset (no output). git hash-object of today's HTFEngine (D5FD5B06, 23026 B) = f35b02bd17f0195d13951bf7fb42d89124302380 - EQUALS the HEAD blob f35b02bd. git diff --stat HEAD -- the file: empty. So today's engine does NOT differ from HEAD in content: 604 lines CRLF + 2 lines LF on disk vs 606 lines LF committed - endings only, zero content lines changed (no quote owed). "D5FD5B06" first appears in BUILDER_RESULT_B12.md (B-12 A3); no earlier relay or result carries it.
- A4 branch builder/B-13 from f11a71a (verified log line). A5 backups before anything else: .preB13 EA F04AF9C3...; HTFEngine D5FD5B06...; FlowLogic.ex5 634183D2...; EA.ex5 F3D3F240... (each equals its disk file; never committed).

## Part B - blob IDs re-verified with git first (git rev-parse, all 9 match the Why table)
- T1 d0589ef: EA 91e64f21..., HTFEngine 5bc7a171..., FlowLogic 324d84da... MATCH.
- T2 8e061b1: EA 50cc9db8..., HTFEngine f35b02bd..., FlowLogic 324d84da... MATCH.
- T3 71f1e55: EA 842e4824..., HTFEngine f35b02bd..., FlowLogic 324d84da... MATCH.
- Rule-conflict check on the one-command -c option: no banked word or skill line forbids it (Select-String 0 hits across AGENTS.md + all srj skills; second python substring probe 0 across 13 files). The standing "do not update git config" rule is not triggered - -c writes no file (proven below after every swap).
- T1 swap (exact command, working tree only): EA on disk A82F15E7/633938 + hash-object 91e64f21... MATCH; HTFEngine F5AECA89/20564 + hash-object 5bc7a171... MATCH; core.autocrlf still true.
- T1 compiles: FlowLogic 0 errors, 0 warnings, 5408 ms, ex5 2065276C6FC8075B223AFFB814E28EAA439726E57C84F770989A30E51D387DF8 (235728 B); EA 0 errors, 0 warnings, 5727 ms, ex5 0CA9AFD08418437080043A66A1FE8BBDA341FFAAB50E3201F1015EEF9B73C68F (405756 B).
- T2 swap (exact command): EA 14C7476C/660687 + hash-object 50cc9db8... MATCH; HTFEngine 75962657/22422 + hash-object f35b02bd... MATCH; core.autocrlf still true.
- T2 compiles: FlowLogic 0 errors, 0 warnings, 6790 ms, ex5 F8908B764ECB6072C429C62C9AD78E849A49B39BE0AE42C9F58B6FAE74B9A055 (236880 B); EA 0 errors, 0 warnings, 7617 ms, ex5 E607A911428134B6104643BEEA3B6966FCDF526A24D11741473E5190EAF906F1 (429374 B).

## Part C - runs (bench: RECON50_DEMO_USD.ini EURUSD M5 Model 4 InpDebugLog=true InpMode=1; window via terminal.ini after verified-close, proven per run by the journal line; journals local, unpushed)

C1 Run 1 on T1 (RECON62-B13R1; window proven: EURUSD,M5 testing from 2026.08.26 00:00 to 2026.09.10 00:00).
- DONE PASSED; 563338 ticks, 3168 bars; final balance 10474.64 (== RECON62). Journal 6463447 B, 34257 lines.
- (a) Filed-trade table, dates first, all 7 match RECON62 entry (time+price) and exit (time+reason+price): 8/28 SHORT 1.16466 / 11:40 POI_BODY_BREAK 1.16439 (deal #2/#3); 9/1 LONG 1.16024 / 17:50 SL 1.15975 (deal #4/#5); 9/4 LONG 1.16019 / 23:55 DAY_CLOSE 1.16129 (deal #6/#7); 9/7 LONG 1.16138 / 10:50 TP_TOUCH 1.16200 (deal #8/#9); 9/7 LONG 1.16264 / 17:10 TP_TOUCH 1.16315 (deal #10/#11); 9/8 SHORT 1.16205 / 10:40 TP_TOUCH 1.16102 (deal #12/#13); 9/8 SHORT 1.16220 / 17:30 SL 1.16274 (deal #14/#15). No extra takes.
- (b) Must-never-take check (register section C): 9/4 10:40 SHORT, 9/1 15:30, 8/27 evening SHORT, 8/28 16:25, 8/28 NY news bar, 9/8 16:45 - all silent (whole-journal SIGNAL count is 7, all valid takes above). None took.
- (c) Counts: SIGNAL 7, deal # 14, MTEXIT 7; ABORT LTF_MISALIGN 16, FRESH_OPP_FVG 6, SESSION_CLOSED 9, FRESH_VETO 3, FRESH_OB_DEAD 9, TP_RR_FAIL 4, DIV_FALLBACK 3, NO_TP_TARGET 1; UJALIGN_NOMATCH 0, UJALIGN_BYPASS 0, SEEDBIAS_REFUSED 0, FRESHVETO 3, CONFIRM_STRUCT_FAIL 167.
- STOP-A: 7/7, no section-C take, balance 10474.64 - PASSES. Bench confirmed (not moved); T1 exonerated. Run 2 proceeds.

C2 Run 2 on T2 (RECON62-B13R2; R1 leftover closed gracefully first, verified gone; window still EU, re-verified; WMI RC=0; window proven: EURUSD,M5 testing from 2026.08.26 00:00 to 2026.09.10 00:00).
- DONE PASSED; 563338 ticks, 3168 bars; final balance 10000.00 (flat - zero takes). Journal 5595553 B, 29611 lines.
- (a) Table: all 7 RECON62 takes missing (whole-journal SIGNAL count 0, deals 0, MTEXIT 0). No extra takes.
- (b) Section C: all six silent (nothing fired at all).
- (c) Counts: SIGNAL 0, deal # 0, MTEXIT 0; ABORT SUB_1R 76, SESSION_CLOSED 10, FRESH_OPP_FVG 1, LTF_MISALIGN 3, FRESH_OB_DEAD 3, TP_RR_FAIL 3, DIV_FALLBACK 1; UJALIGN_NOMATCH 10, UJALIGN_BYPASS 0, SEEDBIAS_REFUSED 0, FRESHVETO 0, CONFIRM_STRUCT_FAIL 31.
- T2 is the losing layer. Run 3 skipped (never swapped, never compiled, never run).

## Part D - D1 only (B-12 D-searches stand as no-ruling-found; which V8 change killed each take, raw + one plain line)

- 8/28 10:05 SHORT D-VWAP. `6770 UJALIGN_NOMATCH bar=09:55 dir=SHORT m15=1.0` + `6790 CONFIRMPOLL bar=10:00 ... confirm=1` + `6804 UJALIGN_NOMATCH bar=10:00 dir=SHORT m15=1.0` (seed S1->S3 at 10:00, never promoted). Plain: the 15-minute guard cut both the seed bar and the confirmation bar - guard kill.
- 9/1 17:35 LONG M-VWAP. `11300 ABORT SUB_1R S4 Yearly-POC` + `11384 ABORT SUB_1R S4` (holder killed twice pre-take) + `11440 SUPPRESSED HELD S1 M-VWAP` + `11443 CONFIRMPOLL 17:30 confirm=1` (seed never confirmed). Plain: SUB_1R killed the holder line twice, then the take seed died unconfirmed - SUB_1R kill.
- 9/4 16:00 LONG Y-POC. `16649 ABORT SUB_1R S3 Yearly-POC` (+A6REFUSED + S3->ABORT). Plain: SUB_1R killed it in zone-wait before any confirmation.
- 9/7 09:20 LONG W-POC. `17594 ABORT SUB_1R S4` + `17664 ABORT SUB_1R S4 09:20` (+UJALIGN_NOMATCH 09:10 17643 in between). Plain: SUB_1R killed the armed holder twice - SUB_1R kill (guard also returned NOMATCH once).
- 9/7 16:45 LONG W-POC. Only SUPPRESSED LONG-vs-SHORT-holder rows in-window (18407/18419/18451, holder SHORT S1); no LONG seed/armed rows. Plain: no LONG setup formed in-window - absent (holder side was SHORT).
- 9/8 10:10 SHORT M-POC. `19555 S3->S4` + `19560 UJALIGN_NOMATCH bar=10:05 m15=1.0`. Plain: armed S4, entry pass exited at the 15-minute return - guard kill.
- 9/8 17:00 SHORT M-POC. `20259 ABORT SUB_1R S4` + `20356 S3->S4` + `20362 S4->S5` + `20416 SLNONFIRE RR_FAIL r=0.26` + `20417 ABORT TP_RR_FAIL S5` (reached S5, refused R 0.26). Plain: SUB_1R killed the first arming; the re-seed reached S5 and died at the R-gate.
- Tally: SUB_1R abort (76 journal-wide, zero in T1) is the dominant V8 killer; the 15-minute guard (10 NOMATCH) cut the 8/28 + 9/8am entry passes; the S5 R-gate took the 9/8pm re-seed. No death row shows a trend-direction flip versus Run 1 (confirmed-only read not implicated by any row); the HTFEngine change is not implicated by any row either. No fix proposed.

## Part E - ALWAYS restore (whatever happened above)

E1 Copy-Item literal of all four .preB13 files; SHAs equal their .preB13 (EA F04AF9C3, HTFEngine D5FD5B06, FlowLogic.ex5 634183D2, EA.ex5 F3D3F240); EA and HTFEngine git diff --no-index vs .preB13 both empty.
E2 Recompiled FlowLogic then the EA (both match restored sources): FlowLogic 0 errors, 0 warnings, 5338 ms, ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90 (not 634183D2 - stated plainly: same source, fresh toolchain stamp); EA 0 errors, 0 warnings, 6477 ms, ex5 D7DEA92375D8DADB38E8A8B5667DF7891D65C6EA6F4B5DD5F47C76D2B338DC96 (451818 B; not F3D3F240 - same reason).
E3 Config terminal.ini [Tester] restored to June (Symbol=USDJPY, 1780272000/1781308800, independent read); core.autocrlf still true; no terminal running.

### Journal-code glossary (codes cited above, few words each)
- ALERT SRJ SIGNAL: entry signal. MTEXIT (DAY_CLOSE/POI_BODY_BREAK/SL/TP_TOUCH): managed exit + reason. deal/order: broker fills. ANCHOR_ELECT/SEED: election/seed. SIDE1T_SEEDBIAS (CONSIDER/REJECT-BIAS-TIMING): seed-bias verdict. SIDE1C_BOTHDIRS: direction check. STATE S1-S4 (+S5 edge): lifecycle. SUPPRESSED: holder record. CONFIRMPOLL/CONFIRM_STRUCT_FAIL (A_OPP/C_TOUCH/B_BODY): confirmation poll/gate fails. UJALIGN_PASS/NOMATCH: 15m alignment. LEGTOUCH/UJTOUCHSEEN: touch path. SWINGPICK/SLSRC/SLIMB/SLIMBWALK/A6TERM/SEL52CTX/SLEXT47/SLORIGPV/SLEXT481: stop family. FRESHSKIP: freshness skip. SIDE1C_YIELD/PREEMPT: contender moves. POIREPLACE: anchor replace. SIDE1H_WOULDPREEMPT: preempt check. UJRESEED: reseed. CQDRECHECK: divergence recheck. SIDE1O_ELIGSTATE (rLive/livePass): eligibility + live R. SIDE1Q_CQDKILL/SIDE1R_RGATE/SIDE1W_CQDWINDOW: CQD gate family. SLNONFIRE (RR_FAIL/wouldFire): no-fire. ABORT (SUB_1R/TP_RR_FAIL/FRESH_VETO/LTF_MISALIGN/...): abort + reason. A6REFUSED/STAND-DOWN: refusal. FRESHVETO: freshness veto. UJDEFERABORT: deferred abort. UJPOOLCOV/UJPROBE/IDCHANGE/UJM15ROW: pool/probe/identity. XOB-PROMOCENSUS: promotion census. BIASCENSUS/ZONECENSUS/WS161_CENSUS: end censuses. HEARTBEAT: wrapper progress.

## Final disk state
- EA source F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582; HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; FlowLogic.ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90 (from restored 956BF3E3 source); EA.ex5 D7DEA92375D8DADB38E8A8B5667DF7891D65C6EA6F4B5DD5F47C76D2B338DC96 (from restored F04AF9C3 source). Both .ex5 files match their sources.
- EA, include, indicator sources and journals: uncommitted, unpushed; only the two Part-F files ship. No skill, AGENTS.md, planner-context or git-config change in this relay.

## Carried note (for the planner)
- Losing layer: T2 (V8, commit 8e061b1) - Run 2 on the byte-exact V8 tree takes 0 of 7 on the identical feed (balance flat 10000.00), while Run 1 on T1 takes 7/7 with exact balance 10474.64. Dominant killer is the V8 SUB_1R abort (76x, zero in T1); the 15-minute guard cut two entry passes; no row implicates the confirmed-only read or the HTFEngine change. Run 3 (T3) never ran per the relay's skip rule.
- A3 content answer: today's HTFEngine does NOT differ from HEAD in content (hash-object equals f35b02bd; endings only).
- Branch note: 4a20e5f + 59fd96e stay local-only on builder/B-11 / builder/B-10, unpushed; builder/B-13 was cut from f11a71a as listed. Merge or push on his word.

(End of file)
