# BUILDER SLICE B-55 - raw rows behind D1-D3, E1-E7, G1, R1 and S1 (payloads only; EA read-only, one tester launch)

## 0.4 gate (diff-empty proof + disk SHAs)
- git diff 72c6f43 -- ten files: EMPTY. Ledger tail 1197 single hit; journal 1061 lines.
- Disk: EA 63B18C1F (680981 B) / ex5 B0D4AA9E; FlowLogic 956BF3E3 / ex5 27B5F272; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; HTFEngine D5FD5B06; terminal.ini 450ACB4A (pre-E/restored); j24 AC07557F (52748 lines); j23 75B7321C (79267 lines); MARKER source 79859EDC (89118 B) / ex5 f0890c0b (119732 B) first record. All MATCH. No terminal64 at gate.

## D1 run headers, DAYLOG raw (Tester/logs/20261006.log UTF-16)
j23 run: 390832 history check started; 390845 `EURUSD,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00`; 390847 ticks synchronized already; 390858 deposit 10000 leverage 1:100; 390865 history synchronized 2024.01.02-2026.09.10; 390868 ticks synchronized 2026.06.01-2026.09.09; 390869 cache 126136 contains 123050 (2025.01.02-2026.08.25); 390870 history begins 2025.01.02; 390872 testing started with inputs; 390874 InpPoiMarkerName=SRJ_POI_Marker; 390871 `EURUSD,M5 ...: generating based on real ticks`; 390910 marker ex5 119766 bytes added; 390914 POI handle=10 err=0; 390915 CQD ex5; 390919 FlowLogic ex5 236533 bytes; 390924-390986 H1/H4/M15 caches+begins.
RUNSTART_J23 = 2026.08.26 EURUSD M5 real-ticks.
j24 run: 470099 history check; 470100/470104 history begins 2020.10.28; 470101-470106 tick download completed; 470112 `USDJPY,M5 ...: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00`; 470125 deposit/leverage; 470131 27 bytes synchronize; 470132 history synchronized 2025.01.02-2026.09.10; 470135 ticks synchronized 2026.06.01-2026.09.09; 470136 cache 108060 contains 105180 (2025.01.02-2026.05.29); 470138 `USDJPY,M5 ...: generating based on real ticks`; 470139 testing started; 470141 InpPoiMarkerName; 470177 marker ex5; 470181 POI handle=10 err=0; 470191-470192 H1; 470216 CQD tick-sync wait; 471993 XOB backfill t=2026.05.28; 472235-472238 H4/M15; 473989 WARN 4014 (push only).
RUNSTART_J24 = 2026.06.01 USDJPY M5 real-ticks.
J23_FIRST_LONGLINE (j23:2561 2026.08.26 09:05 UJDTTERMS bar=2026.08.26 09:00 Daily-POC=... Daily-VWAP=... Weekly-POC=... Weekly-VWAP=... [truncated in row; A2 counts prove Monthly-POC first same row :2561]) + FIRST-YPOC same row :2561 (Yearly present day one).

## D2 marker spans (located by text; line numbers this report only)
a) Anchor bars: slots carry anchorType (Marker:1966 MONTHLY etc.); per-bar trueStart = AnchorStartFor(bt, anchorType) (Marker:1693); TickCore:351-389: WEEKLY :367-373 Sunday-open (`TC_Dow(ds); // 0 = Sunday = FX week open`), MONTHLY :375-377 day-1, session-shifted server time. Plain: each slot re-derives its period start from the bar time every bar.
b) EMPTY writes: buffers default EMPTY (Marker:1292-1303 BlankAllBuffers); per-bar per-slot, if !valid[s] both buffers + g_L stay EMPTY (Marker:1786-1794); values kept only if poc/vwap > 0 (:1796-1866, g_show-gated for Buf, ungated for g_L). Plain: a line is empty when its slot is invalid or its POC/VWAP never computed positive.
c) Bar limits: g_L sized to rates_total (Marker:1274-1288 EnsureLineStore); per-bar slot fill runs the evaluated bars; no max-bars/lookback input on the marker (inputs: seed/bin/weight :80-82, FOMC times :85, alerts :88-90, colours :92-98, visibility :101-112 all true, panel :115+). History reach = tick/chart history available (A3 synchronized from 2025), not a 3000 cap (3000 is FlowLogic/EA-side). Plain: the marker reads as far back as history exists; empty early-June M/W is slot validity, not a bar cap.
d) EA iCustom inputs (EA:11218-11219): InpPoiMarkerName="SRJ_POI_Marker" (EA:23), InpPoi_UseSeed=true, InpPoi_BinPips=0.1, InpPoi_WeightMode=WEIGHT_TICKCOUNT. Values via ReadBuf1/CopyBuffer shift-1 (EA:1986-1992).
- Anchor-bar finding per slot type: no dedicated finder beyond AnchorStartFor + slot POC/VWAP snapshot accumulators (SnapshotPoc/SnapshotVwap Marker:1570-1571; slot engine floor/seam/checkpoint Marker:1698-1711; ResolveValidity Marker:1714+: inWin + SlotHasCompleteHistory + floor/seam gates).

## D3 terminal.ini Max bars: no "Max bars in chart" key in terminal.ini (grep: only [Tester]/Agents/MarketWatch/Stats/Deals/IndicatorPropertyPage sections carry Symbol/Period keys; full key list searched). D3 = key absent on record (chart bar caps live in the terminal UI options, not this file).

## A2 tables (whole-file counts + first/last row-dates, journal lines)
j24: M-POC 0, M-VWAP 0, Y/Q/FOMC 0/0/0/0/0/0; W-POC 957 (first j24:23186 2026.06.08, last :44654 2026.06.12); W-VWAP 992 (:23186 2026.06.08 - :44638 2026.06.12); D-POC 2658 (:3866 2026.06.02 - :44639 2026.06.12); D-VWAP 1875 (:3866 2026.06.02 - :44638 2026.06.12). Alert short-codes j24: [D-POC] 83, [D-VWAP] 39, [W-POC] 25 (first :23210 bar 2026.06.08 09:30), [W-VWAP] 23, [M-POC]/[M-VWAP] 0.
j23: all 12 present 8/26-9/09 (M-POC 1746/M-VWAP 1631/W-POC 2385/W-VWAP 1695/D-POC 2366/D-VWAP 2168/Y-POC 2032/Y-VWAP 1850/Q 1205+1205/FOMC 1223+1410; first :2561 2026.08.26, last :63854-63880 2026.09.09).

## E1 [Tester] before/after (only line 419 changed; 874 lines both)
Before: DateFrom=1780272000 (with Expert=SRJ_FlowNexus_EA.ex5 Symbol=USDJPY Period=5 DateRange=3 ... DateTo=1781308800). After: DateFrom=1779667200 (rest byte-identical, verified by diff: single line 419).
Copy terminal.ini.preB55 SHA 450ACB4A (== live pre-edit).

## E2 launch + j25 save
- Launcher mirror of B-38 (launch_june0525_b55_run.ps1, WMI from file per B-28; RunName JUNE0525-B55, same USDJPY_DEMO_JUNE.ini Model=4 InpDebugLog=true InpMode=1, ToDate unchanged). WMI_PID=784 RC=0, 02:16:10. STATUS PRE_JOURNAL_LINES=0, PID=4012; window verified 02:16:30 (`testing of ... from 2026.05.25 00:00 to 2026.06.13 00:00`); wrapper kept (DONE writer), short polls.
- DONE 02:20:36: PASSED, 740873 ticks, 4320 bars, balance 10324.99, 0:03:47. DAYLOG = Tester/logs/20261007.log (single run in file; testing-of :13/:40). j25 = full copy: 06_HANDOFFS/JUNE0525-B55_JOURNAL.log SHA A747E55C (30588928 B, 79772 lines), DAYLOG start line 1.

## E4 J25_LINES_DAYS (UJDTTERMS per day 6/01-6/12; Y=both, P=one, N=none; Q/Y/FOMC all N all days)
6/01: D-Y W-Y M-Y; 6/02: D-Y W-Y M-Y; 6/03: D-Y W-Y M-Y; 6/04: D-Y W-Y M-Y; 6/05: D-Y W-Y M-Y; 6/06: N; 6/07: N; 6/08: D-Y W-Y M-Y; 6/09: D-Y W-Y M-Y; 6/10: D-Y W-Y M-Y (6-line row, e.g. 6/10 14:15 bar: Daily+Weekly+Monthly LHIT); 6/11: D-Y W-Y M-Y; 6/12: D-Y W-Y M-Y. (6/06-6/07 weekend CLOSED.)

## E5 16:00 rows (j25; UJDTTERMS all six LHIT; H/L; hits; alert; SEED/STATE)
- UJDTTERMS bar=16:00 (j25:39625): Daily-POC=LHIT + Daily-VWAP=LHIT + Weekly-POC=LHIT + Weekly-VWAP=LHIT + Monthly-POC=LHIT + Monthly-VWAP=LHIT.
- S3INPLAY 16:00: barLo=159.726 barHi=160.262 close=160.034 (same H/L/C as j24).
- Alert 16:05 pass (j25:39452): `Alert: USDJPY M5 - POI RETEST LONG at 159.885 [M-POC +5]` (M-POC best rank + 5 more = all six).
- RETESTBOOK 16:00 hits=6 Daily-POC:r10:dL Daily-VWAP:r11:dL Weekly-POC:r8:dL Weekly-VWAP:r9:dL Monthly-POC:r6:dL Monthly-VWAP:r7:dL (j25:39624); RETESTDIAG inside all six (j25:39626); CONFIRMPOLL anchor Monthly-POC LONG bodyDir=0 body=182pts touchAttr=0 confirm=0 (j25:39627); UJPROBE 16:00 ltf=-1.0 (j25:39457).
- Seed path 16:05 pass: NO seed event on j25 (LONG Monthly-POC candidate already alive: seeded 15:25 j25:38989, S1->S2->S3 at 15:50 j25:39065-39066; UJPROBE 16:00 ltf=-1.0 j25:39457). 16:05 pass on the live S3 candidate: LTFFLIP (j25:39460) + UJLTFHOLD Fix F11 LTF-opposed hold (j25:39462) + FRESHSKIP PRE_BINDING (j25:39463...); S3 waiting rows 16:10-16:50; 17:30 S3->S4 (j25:42710); 18:30 ABORT FRESH_OB_DEAD + STAND-DOWN + S4->ABORT (j25:44601/44603/44604). NO A6FIRED/ENTRY/deal on 5 June in j25.
- J25_LEVELS_1600: M POC TOUCHED_1600 (touch 159.885; absolute line value not printed), M VWAP TOUCHED_1600 (hits=6 + LHIT), W POC TOUCHED_1600, W VWAP TOUCHED_1600, D POC TOUCHED_1600, D VWAP TOUCHED_1600 (all six LHIT + inside + alert; absolutes not printed except touch price).
- J25_0506 = NO_FIRE. First blocking row: UJLTFHOLD Fix F11 at 16:05 (j25:39462 `UJLTFHOLD bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A_OPP - LTF opposed, hold (Fix F11)`, preceded by LTFFLIP :39460); candidate held in S3 to 17:30 ARM, died ABORT FRESH_OB_DEAD 18:30 without firing.

## E6 J25_1106 = SAME
- j25:64560 A6FIRED bar=14:35 tp=160.587 r=2.74 sl=160.501; :64571 deal #10 buy 14:40:22 at 160.530; :64690 deal #11 sell 15:23:06 at 160.588; :64710 MTEXIT 15:20 TP_TOUCH entry=160.524 exit=160.587; CONFIRMPOLL 14:35 confirm=1 (:64248), A2RECLAIM x3, S2->S3->S4->S5 same 14:40:22 pass. Identical to j24 (ref 160.524, TP 15:20).

## E7 deals j24 vs j25 6/01-6/12 (by date/time/side/price, not ticket)
- j24: 6/03 09:10 LONG 159.932->159.983; 6/04 09:55 SHORT 159.868->159.920; 6/05 16:55 LONG 160.120->160.298 (deal #6/#7); 6/09 16:55:03 LONG 160.209->160.194; 6/11 14:40:22 LONG 160.530->160.588.
- j25: 6/03 09:10 LONG (deal #4/#5) KEPT; 6/04 09:55 SHORT (deal #6/#7) KEPT; 6/05 NO deals (16:55 machine LONG GONE - never seeded past S3-hold, ABORT FRESH_OB_DEAD 18:30); 6/09 16:55:03 LONG (deal #8/#9) KEPT; 6/11 14:40:22 LONG (deal #10/#11) KEPT.
- 5/25-5/29 separately (not graded): one pair - 5/27 15:35 LONG tp=160.723 (deal #2 buy 159.344, deal #3 sell 159.535; A6FIRED r=9.67 sl=159.197).
- E8: diagnosis only, no register write (none made).

## G1 June register cells (row, date, time, side, verdict, source run; MAP_THIN iff source is j24 or a run started 2026.06.01)
- B1 5 June 09:45 SHORT, NOT VALID (his words) / dead-seed path: sources RECON76/77 + B-40 j24-note (j24 SEEDBIAS_REFUSED) + j18 (B-34, June 6/01-6/13 window per ledger 1175). MAP_THIN (j24 + j18 both 6/01-start runs; the refusal rows live on the thin map).
- B2 5 June 16:15 LONG, owed-missed (R63) / kill path (B-34 j18, 6/01-start): sources R63 QO + j18 kill rows; B-52 j24 rows (kill shape). MAP_THIN (j18 + j24, both 6/01 starts).
- B3 11 June 14:40 LONG, TAKEN must-keep (B-52, j24 fire): sources RECON78/63/71 (prior) + j24 + j25 (B-55 E6 SAME). MAP_THIN for the refusal-era cells (RECON78/B-51 rows from pre-B-38 6/01 runs); the TAKEN verdict itself rides j24/j25 CURRENT rows (Daily lines, map-independent for this entry: confirm+fire need no M/W).
- C-row 3 June 09:10 LONG, VALID-taken (his 4-valid word; RECON72 took it): source RECON72 (window unrecorded for start date) + j24 deal #2 (B-38 C2 same-as-j22). MAP_THIN (j24 graded it same-as-j22 on the thin map).
- THIN_MAP_CELLS = 4 (B1, B2, B3, C-3June). No register edit (G1 is read-only).

## R1 new lines (not in B-53 R1 paste; section + ruling)
- §1:28 UNIVERSAL day-close ("recorded on the previous session" + 23:55 execution pin; exits, not profiles).
- §2:51 SETUP DEFINED (COMPLETED setups: arrival-order protects confirmed-executed only).
- §5:86 PRIOR-CLOSE-IRRELEVANT (prior candle never judges; 14:35 break-then-reclaim instance).
- §5:91 REFINE-ONLY ("previous EU test range date is already correct" + RECON62 anchor).
- §8:112 CONFIRMATION-CANONICAL (touch-or-break, zero tolerance).
- §8:115 GATE-AUTHORIZATION (no gate without his pin).
- §9:123 RECORD-FIRST (planner questions = defect).
- §14:155 0605LDN-WORKED-BEFORE ("builds previously... successfully executed", withdrawn by §15 NOT-VALID).
- RULES_PERIOD = NONE (no verbatim on developing-current vs previous-completed profile; nearest adjacent: §5:82 previous-day sweep freshness (B-53-pasted) + §2:51 COMPLETED-setups (about setups, not profiles)).

## S1 STATE print gates (EA text)
- LogState (EA:1806-1812): `if(!InpDebugLog) return;` then STATE print. Gate = InpDebugLog true (true in j23/j24: UJDTTERMS everywhere).
- LogAbort (EA:1814-1819): NO gate (always prints ABORT row).
- No once-per-key dedupe, no throttle, no per-bar caps, no tester-only flags in either function.
- STATE_PRINT_GATES = InpDebugLog=true only (LogAbort ungated). Not NONE -> no parking (SILENT6 ends stay UNKNOWN; logs complete per B-54 S3 counts).

(End of slice)
