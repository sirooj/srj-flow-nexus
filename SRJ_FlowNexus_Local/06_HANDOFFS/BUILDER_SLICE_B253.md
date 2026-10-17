# BUILDER_SLICE_B253 — relay B-253 evidence (F4a 5 of 6; verdict RESTORED)

## 1. K0 located code (call order within one new-bar pass)
- New-bar census: `2026.08.26 01:05:00 [SRJ-EA] 2026.08.26 01:05:00 CQD DIV verdict=+1 shift=2 bar=2026.08.26 00:55` (EA L7809 census; loops barShift..barShift+1 each pass).
- Latch walk + verdict consume: `[SRJ-EA] B196DIV bar=2026.08.27 17:00 dir=SHORT kind=hidden side=bear dbar=2026.08.27 16:45 latch=0` (raw RECON62-B253 row).
- S4 confirm gate (by text): IsConfirmationCandle(barShift,...) then S5 promote; S5 div walk; B182DEC fire; entry = next open (P-NEXTOPEN block; fill = the forming bar).
- Verdict readability one pass late: `2026.06.19 15:45:01 CQD DIV verdict=+2 shift=2 bar=2026.06.19 15:35` (writePass=15:40, read at the next pass).

## 2. The 15:45:01 target pass (B-253 EU cut, raw)
- `L1067533| 2026.06.19 15:45:01 [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.19 15:40 dir=LONG term=A_OPP`
- Neighbor fails same shape: 15:40:02 bar=15:35 A_OPP; 15:50:00 bar=15:45 C_TOUCH; 15:55:00 bar=15:50 A_OPP.
- Promo rows elsewhere (refused cases are correct refusals — verdict against dir): `15:30:01 evalBar=15:25 verdict=-1.0 regular x2=15:05`, `16:05:00 evalBar=16:00 verdict=-1.0 regular x2=15:50`.
- NO B253DR row at evalBar=15:40 — the B_BODY-only call-site gate refused A_OPP before the helper ran. THE HUNK MISSED ITS TARGET.

## 3. The hunk
- Helper `B253TrySwingConfirmPromo(const int barShift)` inserted before the Step-7 latch block (def at L7030; walk from barShift+1 newest-first on the CQD verdict buffer; promote on `b253Vs == barShift + 1` + direction match; S5 flip + LogState). [B253DR] markers = 3 tokens, one hunk; braces delta 0 vs .preB253.
- Call site: S4 else-branch after the CONFIRM_STRUCT_FAIL print — `if(cfTerm == "B_BODY" && ...) B253TrySwingConfirmPromo(barShift)` (the narrow gate that missed A_OPP — my own wrong branch, owned).

## 4. Compile + keep (K2)
- Compile (mt5 tool): 0 errors / 0 warnings (15.7 s). Keep: src .B253K `4d5fd60f`; ex5 .B253K `3f9045cc` (521,368). Backups before the edit: `.preB253` src `18a1d49b` / ex5 `d85cf7d2`.

## 5. Launches + window + input headers (raw)
- RECON62-B253: PID 36632, `testing ... from 2026.08.26 00:00 to 2026.09.10 00:00`; header `InpCqdName=SRJ_CQD_TickBased_MT5`; DONE PASSED 01:25:14; ex5 before/after `3f9045cc` 521,368 (unchanged).
- EU0525TD-B253: PID 40672, `testing ... from 2026.05.25 00:00 to 2026.10.14 00:00`; header `InpCqdName=SRJ_CQD_TickBased_MT5`; DONE PASSED 02:07:04 (~28.5 min); ex5 unchanged.
- Cutter defect + fix (owned): TOOLS/job_cut_b252.py had DAYLOG hard-coded `20261017.log` (B-252's day), so the first RECON cut streamed 3.2 GB of yesterday's log and died at the 300 s timeout (bogus partial CUT deleted). `job_cut_b253.py` takes the day log as argv[3]; both segments cut clean from `20261018.log` (RECON 1,045,138 lines / 14 deals; EU 3,217,808 lines / 40 deals).
- Watcher false-DONE (owned): the EU watcher relaunch used `-PreBytes 0`, which disables the stale-tail floor (watch_run.ps1 L53 short-circuit); its 25 s false DONE was cleared and watcher 2 relaunched with `-PreBytes 308099536` carried the run to the real DONE.

## 6. Grades raw (grader lines; full tables in ROWPACK/DEALS_*.csv)
- RECON62-B253: `KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7` — identical shape to the B-252 RECON baseline (A1 +3pt = the banked B-137 note).
- EU0525TD-B253: `KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 3; trades 20` — baseline shape identical; deals diff vs EU0525TD-B252R0A = +6 / -0 (three promo pairs).
- K19JUN = MISSING (owed 15:45 1.14644; the machine's pair stayed 15:50 buy 1.14654 / 15:51 sell 1.14716).

## 7. T5 EQSWING (F4b measure-only) + T4 rows
- REPORT/EQSWING_B253.csv: unique pair verdicts RECON 906 + EU 8,043 = 8,949; EQ-YES 133 (RECON 19 / EU 114); NODATA 5,809 (B196BAR OHLC coverage gaps listed, never guessed); 33 EQ-YES rows intersect a deal date (incl. 08-28 A1 date with +1 x2=10:05, 09-01 A2 date, 09-04 A3 date, 10-08 K8OCT date).
- REPORT/DIVREAD_B253.csv: the three promo-added machine pairs (M20 08-10 buy 09:50 hidden +2 x2=09:40; M22 08-11 buy 14:40 regular +1 x2=14:30; M24 08-24 buy 18:40 hidden +2 x2=18:30) + the 19 June no-move row (cfTerm=A_OPP gate refusal).

## 8. Timing + size
- Timeline: launch 01:21 RECON, PASS cuts+grade ~01:25-01:35; EU launch 01:38, DONE 02:07, cut+grade ~02:10-02:20; records 02:2x-02:5x.
- Verification scratch: Temp/opencode/srj-* (patch, brace, window, cut, scan, mirror scripts; ASCII-only).




