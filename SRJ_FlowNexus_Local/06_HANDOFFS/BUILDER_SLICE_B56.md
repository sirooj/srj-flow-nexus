# BUILDER SLICE B-56 - raw rows behind C1, T1-T3, F1-F4, G1 (payloads only; EA read-only, terminal.ini + no launch... one launch? No: B-56 launches nothing. C1 config only.)

## 0.4 gate (diff-empty proof + disk SHAs)
- git diff 3d25980 -- ten files: EMPTY. Ledger tail 1198 single hit; journal 1061 lines.
- Disk: EA 63B18C1F (680981 B) / ex5 B0D4AA9E; FlowLogic 956BF3E3 / ex5 27B5F272; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; HTFEngine D5FD5B06; MARKER 79859EDC (89118 B) / ex5 f0890c0b (119732 B); terminal.ini 450ACB4A (pre-C); j24 AC07557F (52748 lines); j23 75B7321C (79267 lines); j25 A747E55C (79772 lines, uncommitted). All MATCH. No terminal64 at gate.

## C1 [Tester] before/after (line 419 only; 874 lines both)
Before: Expert=Experts\SRJ_FlowNexus_EA.ex5 / Symbol=USDJPY / Period=5 / DateRange=3 / DateFrom=1780272000 / DateTo=1781308800 (+ Currency=USD ...). After: DateFrom=1779667200, rest byte-identical (python diff: single line 419). Copy terminal.ini.preB56 SHA 450ACB4A (== live pre-edit). New terminal.ini SHA 88a0deb1 (= STD_JUNE ini). C2: no launch; preB56 stays untracked.

## T1 marker spans (located by text; line numbers this report only)
a) Seed: InpUseSeed (Marker:80 default true; EA passes InpPoi_UseSeed) reads SRJ_SEED_<SYMBOL>.bin + SRJ_CKPT_<SYMBOL>.bin (Marker:2045-2046 SEED_FileName/CkptName; 2048-2055 SEEDFILE print with common/local existence; 2057-2089 SEED_Read -> PARSED print :2080-2086, refusal panel :2067-2076). Adopted slots per SEED_SLOT rows (j23:113-117: D/W/M/Q/Y kinds with filePeriodStart + hostPeriod). Used instead of ticks for pre-seam history (adoptSeamMs :2089; SEAM_REACHABLE probe :2170-2181; REFUSED path :2189-2201). Without it (or refused): "RUN SRJ_POI_Seeder FIRST" panel + Q/Y truncated (Marker:2161-2168 `InpUseSeed is FALSE. Quarterly and Yearly truncated.`). Plain: the seed file backfills long-period slots; refused/absent seed = Q/Y truncated.
b) Validity: buffers default EMPTY (Marker:1292-1303); per-bar per-slot !valid[s] -> EMPTY (Marker:1786-1794); values kept iff poc/vwap > 0 (:1796-1866). valid[s] needs inWin (periodStart set, bt >= it :1660-1679) + SlotHasCompleteHistory (:1681+: AnchorStartFor per bar :1693, engine floor/seam/checkpoint :1698-1711) + ResolveValidity gates (:1714+: inWin, complete history, floor/seam). Plain: a slot is valid only inside its period with complete history behind the anchor.
c) Bar reach: g_L sized to rates_total (Marker:1274-1288); per-bar slot fill over evaluated bars; no max-bars/lookback input on the marker (inputs :80-85 seed/bin/weight/FOMC, :88-112 alerts/colours/visibility). History reach = available tick/chart history (j24 synchronized from 2025). Plain: the marker reads as far back as history exists; no 3000 cap on its side.
d) EA iCustom (EA:11218-11219): InpPoiMarkerName="SRJ_POI_Marker" (EA:23), InpPoi_UseSeed, InpPoi_BinPips=0.1, InpPoi_WeightMode=WEIGHT_TICKCOUNT; values CopyBuffer shift-1 (EA:1986-1992).

## T2 seed files on disk (name, size, date)
- Common\Files: SRJ_SEED_EURUSD.bin 216116 B 8/20 (+ CKPT 10267420 B same date); SRJ_SEED_GBPUSD.bin 177932 B 9/07 (+ CKPT 8401180 B); SRJ_SEED_USDJPY.bin 194384 B 9/07 (+ CKPT 8401180 B).
- MQL5\Files: SRJ_SEED_GBPUSD.bin 199928 B, SRJ_SEED_USDJPY.bin 274148 B, SRJ_CKPT_GBPUSD.bin 3055900 B, SRJ_CKPT_USDJPY.bin 3055900 B (no EURUSD pair locally; runs used common=YES local=NO).
- SEED_FILES = per symbol above (USDJPY seed built 9/07, seam 2026.06.09 per j24 PARSED row; EURUSD built 8/20, seam 2026.06.26). Slot coverage from SEED_SLOT rows (j23: D 6/26, W 6/21, M 6/01, Q 4/01, Y 1/01 period starts).

## T3 tick month files (Bases\Dukascopy-demo-mt5-1\ticks)
- EURUSD: 202309 (3952340 B) ... 202411, gap 202412-202603, 202604-202610 (+ticks.dat). TICKS_FIRST EURUSD = 202309.
- USDJPY: 202309 (4411452 B) continuous through 202610 (+ticks.dat). TICKS_FIRST USDJPY = 202309.

## T4 verdicts
- LINE_HISTORY per family: D = TICKS (served every run from day one where traded); W = TICKS (start-date-gated completeness; seed adopts pre-seam when accepted); M = TICKS (same gating); Q = SEED (truncated without it, Marker:2166); Y = SEED (same); FOMC = EVENT-anchor (InpFomcTimesServer 2026.07.29; empty while anchor in future).
- YQF_USDJPY = Q/Y refused seed (j24 PARSED then REFUSED SEAM_UNREACHABLE seam 2026.06.09, FINAL accepted=NO); FOMC anchor 7/29 after the June window. Cites: j24:108-112, Marker:2161-2168.
- RECON62_DEPENDS = j23's day-one all-12 ride SRJ_SEED_EURUSD.bin (Common, built 8/20, seam 6/26 reachable, depth to 6/01) plus ticks synchronized from 2025. Plain: without that seed file the run would lose Quarterly and Yearly (marker truncates them), while Monthly/Weekly/Daily build from ticks with start-date-gated completeness - so yes, RECON62 would lose lines if the seed file were missing.

## F1 F11 span (EA:7430-7499, located by text "Fix F11")
7430: `if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)` (scope S3..S5).
7438-7440: live LTF-align invariant per bar (CheckLtfAlign; UPSTREAM_UNREADY abort on read fail).
7441-7448: LTFFLIP print when LTF turns against locked direction (diagnostic print).
7488-7494: `if((uj_hm15r && uj_hm15 == uj_want) || uj_hcarve)` -> UJLTFHOLD print (m15==want => mode=M15 else CARVE + IsConfirmationCandle term); else :7495-7499 deferred abort flag (Fix S-a, UJDEFERABORT print).
- F11_RULE plain: at S3-S5, an LTF-opposed candidate is HELD (not aborted) when the 15m agrees with it or the bar confirms (carve term); otherwise its abort is deferred past evaluation. The hold re-evaluates every bar; nothing latches it.
- LTF = 5-minute structure bias buffer (FL_BUF_LTF_BIAS via CheckLtfAlign EA:2427-2434); m15 = 15m bias (FL_BUF_HTF_LOW) with rf read flag; term = M15 (15m agreed) or CARVE + IsConfirmationCandle fail-term (bar confirmed).

## F2 authorization trail
- Ledger "F11"/"LTF opposed" hits: packet/process refs only (V243 fold, v11 draft, v24 "F11 acceptance", v406 fold; earliest :6317 V243 2026-09-23) - none quote the operator. "LTF opposed": 0 hits anywhere. Journal: 0 hits. Skill: 0 hits. Findings: 0 hits. Packets (01_TASKS): 229 hits, all code pastes (earliest P-RECON78-UJ-EXEC-1v10:140 UJLTFHOLD source line) - none quote the operator.
- Strategy 5m/LTF words (new pastes only; rest cited B-53/54/55): preamble :8 (EA judged against rules here, never reverse) + :12 (pins bind SRJ takes); §1:29 day-close flip-against-hold experiment (trend setups hold flips); §1:32 revision-source (POI lines rank exits).
- F11_PIN = NONE (no verbatim of his authorizes holding a setup while the LTF opposes; nearest banked: §8:116 5M-FLIP-KILL kills the potential on flip, §11:139 5M-BIAS-AT-ENTRY refuses entry-against-bias, §8 Q4 holds AFTER entry only).

## F3 impact counts (UJLTFHOLD rows; report only)
- j24: 44 rows (6/02 x9, 6/03 x3, 6/09 x23, 6/10 x2, 6/12 x7; none 6/05 - j24 seed died at S2).
- j23: 84 rows (8/26 x12, 8/27 x10, 8/28 x5, 8/31 x23, 9/01 x8, 9/02 x13, 9/03 x4, 9/07 x2, 9/09 x7).
- j25: 63 rows (5/29 x2, 6/01 x6, 6/02 x13, 6/03 x3, 6/05 x1, 6/08 x6, 6/09 x23, 6/10 x2, 6/12 x7).
- F11_ON_REGISTER: A1 N (8/28 holds are 15:55+ other-session setups, post 10:05 fire); A2 N (no LONG holds 9/01); A3 N (no 9/04 holds); A4 N; A5 N (no LONG holds 9/07; 2 holds are SHORT); A6 N; A7 N (no 9/08 holds); B2 Y on j25 only (16:05 Monthly-POC hold j25:39462 = the setup itself; N on j24 - died S2); B3 N (no 6/11 holds; fired clean). List as stated; raw 8/28 rows + j25:39462 in slice (B-55 E5).

## F4 j25 16:00-16:20 MCAND rows + candle values + CONFIRM_LONG on Monthly-POC
- S3INPLAY H/L/C j25: 16:05 159.992/160.086/160.008 (:39815); 16:10 159.981/160.062/160.058 (:39995); 16:15 160.022/160.082/160.073 (:40174). Opens NOT_LOGGED.
- CONFIRMPOLL 16:10 anchor Monthly-POC (j25:39990): oppCandle=1 bodyDir=1 body=49pts touchAttr=0 confirm=0. Applied EA:2366-2391: A oppCandle pass, A2 (needs c1 vs L - c1 NOT_LOGGED absolute, skip), B body pass, C touch FAILS (touchAttr=0).
- CONFIRM_1610_M = FAILS C_TOUCH (16:10 never touched Monthly-POC; same shape as Daily C_TOUCH fail B-54).

## G1 FULLMAP_CELLS (j25 outcome per cell)
- B1 6/05 09:45 SHORT NOT-VALID: j25 NO_FIRE (no A6FIRED/ENTRY/deal 09:40-09:50 rows) = SAME (stays out, correctly).
- B2 6/05 16:15 LONG owed: j25 NO_FIRE (F11 hold 16:05 -> ABORT FRESH_OB_DEAD 18:30; no 16:15 entry) = SAME (still owed/missed).
- B3 11/06 14:40 LONG TAKEN: j25 SAME fire (deal #10 buy 160.530, #11 sell 160.588, MTEXIT 15:20 160.524->160.587) = SAME.
- C-3June 6/03 09:10 LONG VALID: j25 deal #4 buy 09:10 159.932 = SAME.
- G2 MAP NOTE appended (count 0, verbatim at end of section B; brackets filled SAME x4).

(End of slice)
