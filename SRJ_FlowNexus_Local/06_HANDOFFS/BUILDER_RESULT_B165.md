# BUILDER RESULT B-165 - packs re-cut entry to exit: both missing exits restored, reports re-rendered

Trader summary: the two exits that lived only in the day log are now in the packs. Your 5 June long's 19:15 exit at 160.298 and the 27 May long's 20:05 exit at 159.535 both have their rows, and the setup reports show them instead of NOT PRINTED. Nothing else moved: every other cell is byte-identical, no trade changed, and the old packs stay untouched for the record. The stop-swing rows are packed too now, but they name prices and shifts, never which candle the swing sat on — so that column stays NOT PRINTED rather than guessed. Nothing was changed on the build and nothing was run.

## Relay order (B-165 FIDELITY-B162 3 of 6, text records only, MEASURED)

- Part 0 on builder/B-164 at bfcc451 (ls-remote returned bfcc451cac7a8d1bc15f2ed1285b7a407b7f94b8; builder/B-165 cut here; HEAD builder/B-165 at bfcc451 re-checked after cut). Push via backup, never origin.
- Skills loaded whole (srj-relay 90 lines + srj-strategy 244 lines read raw this turn; Row pack L62-70 + Setup report L72-77 govern; .agents stub never opened).
- Reads in order: pointer; RESULT_B164 + SLICE_B164 whole; RESULT_B163 R3 + SLICE_B163 R3 (renderer-miss class); INDEX_B162; day file ROWPACK/JUNE0525-B162/2026-05-27.csv (present); DEALS_JUNE0525-B162 (present); REPORT/README + SETUPS_JUNE0525-B162 (20 rows) + SETUPS_RECON62-B162 (28 rows) whole; register whole; spec v4.2 whole (396 lines); CONTEXT whole (284 lines); FINDING USDJPY-MISSES + FINDING EXIT-BREAK-RETEST whole. Ledger, AGENTS.md, .clinerules, journal CSV: grep only. Day log Tester/logs/20261011.log: grep only.
- Cutter/renderer located: 00_CURRENT_WORKING/build_rowpack_b162.ps1 (85 lines, read whole) + build_setups_b162.ps1 (92 lines) + build_index_b162.ps1 (54 lines); fixed copies build_rowpack_b165r.ps1 / build_setups_b165r.ps1 / build_index_b165r.ps1 (unstaged; diffs filed raw below).
- Names per 0.4 verified: EA 1617DC1A/ex5 187A7202; indicator 7842A02E/ex5 10880847; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini live CF80083C (ACCOUNTED B-163/B-164, 04:25, unchanged). Runs + markers per B-163. Missing rows per B-163 R3 + B-164 R2f (5 June MTEXIT 19:20:01 pass; 27 May UJRETARGET 914191-2 + MTEXIT 914593 at 20:10:09 pass). Stop-swing tags: SLSRC 526 rows FOUND, SWINGPICK 562 FOUND, SL_REF 573 FOUND (day log counts). New files -B165R (B-162 packs/reports untouched). Lane FIDELITY-B162 3 of 6; tag B165-PACK-EXIT-COMPLETE; ledger 1311; kit PK-2.
- Start gate: log-1 = bfcc451; status 742 lines (dirty tree preserved); git diff bfcc451 EMPTY on every 0.5 path (incl 99_WORKFLOW + every FINDING); disk SHAs match; day log 333,510,990 bytes SHA 8D2AB35F7E88E070D6392C20232E842BBD4870BA6BC8E088FEE3E76727125522, line 541696 = RECON62 marker (563338 ticks Test passed) + journal_line 912768 = 27 May entry DEAL (both quoted raw in slice); log total 1078201 lines (3 trailing housekeeping lines past UJ-END 1078194; markers unmoved). No terminal64. Records: ledger ^1310.=1, B164 tag=1, ^1311.=0; HANDOFF B-164:=1; pointer "first B-163, 2 of 6"=1; CONTEXT B164 line=1 (L196, quoted in slice). No STOP.
- Scope: TEXT RECORDS ONLY, verdict MEASURED. Day-log reads; existing cutter/renderer run offline as fixed copies (diffs filed); new -B165R files; text records. No EA/indicator/include edit, compile, run, launch, B-162 file edit/delete, register edit, EA print, inference, gate, hunk, number, tolerance. Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, ADDED, NOT PRINTED, ACCOUNTED.

## Part B - banking

- No new rule words. Append nothing. (His 27 May answer, if it arrives, is banked by the next relay.)

## Part R1 - why the cutter dropped the rows

- Skill quote (srj-relay L69): "Rows of an open trade are kept from entry to exit even outside the session windows (MTEXIT, exit, day-close and deal rows), so every exit is in the pack."
- Cutter logic raw (build_rowpack_b162.ps1 L23: `function InWin($t) ... 09:00-12:00 / 14:00-19:00`; L53-56: keep if InWin, elsif DEAL always, else keep if server datetime inside an entry→exit pair span; L49-52: server datetime parsed from the row's own `Core 04` stamp).
- B-162 pair ends used the exit DEAL's minute (June pairs L36: 27May end '2026-05-27 20:08', B2 end '2026-06-05 19:16'). An exit row logged on a later server pass than the exit deal fails both gates: B2 MTEXIT at server pass 19:20:01 ("2026-06-05 19:20" not in windows, past pair end); 27 May MTEXIT at 20:10:09 ("2026-05-27 20:10" likewise). The span compared the row's own stamp, so any exit row on a later pass falls out. First cut of the fixed script reproduced the defect class on a broad span (owned: `$pairs += @(())` flattened the span list, keeping window/DEAL rows only; superset failed with 2759 missing; fixed with unary-comma form, superset then 0 missing).
- Census per deal pair (log rows entry DEAL → MTEXIT/UJRETARGET/day-close + next pass; tags = B-162 25 + MTEXIT/UJRET(+)ARGET/MTLIFE/ORDER/BROKER):
  - A1-A7, C-06-03, B3: MTEXIT packed; MTLIFE missing on all 11 trades (tag never listed — MTLIFE rows: A1 428512, A2 456990, A3 493665, A4 498952, A5 503680, A6 511798, A7 516351, 27May 914594, C-06-03 968509, B2 999957, B3 1054435); A3 + UJRETARGET ×2 in log (491064-65) missing (tag).
  - B2: MTEXIT 999956 missing (span) + MTLIFE 999957 missing (span+tag) + UJRETARGET 999816-17 missing (tag).
  - 27May: MTEXIT 914593 + MTLIFE 914594 missing (span) + UJRETARGET 914191-92 missing (tag).
  - ORDER: 44 log rows (gate-decision rows, mostly non-trade candidates), tag never listed → unpacked. BROKER (`[SRJ-EA] BROKER`): 0 rows in log → NOT FOUND globally (UJRETARGET_BROKER rows exist but tag as UJRETARGET).
  - Stop-swing tags in day log: SLSRC 526 FOUND, SWINGPICK 562 FOUND, SL_REF 573 FOUND → all three added.

## Part R2 - re-cut and verify

- Cutter fix (diff raw in slice): trade spans computed from the log's own pass rows — span = entry DEAL server minute → max(exit DEAL minute, trade MTEXIT minute), MTEXIT matched by `entry=<signal ref>`; printed SPAN lines per trade (A1 end 11:35 … A7 end 17:35, 27May end 20:10, C-06-03 end 10:00, B2 end 19:20, B3 end 15:25 — full table in slice). Tag list 25 + 3 stop-swing tags = 28. No minute count added.
- Packs cut from the same day log, same columns, same week splits + day files: RECON62-B165R 31943 rows (W1 7981 / W2 15092 / W3 8870, 11 days); JUNE0525-B165R 42968 rows (W1 11941 / W2 14433 / W3 16594, 15 days).
- Superset check: all 73195 B-162 pack raw rows byte-for-byte in -B165R (MISSING-OR-CHANGED=0, NEW-TOTAL=74911). ADDED = 1716 rows: the 2 MTEXITs (27May j=914593 W1; B2 j=999956 W2) + span-widened exit-pass rows + stop-swing rows in-window (full list by trade/journal_line/tag in slice).
- DEALS confirmed unchanged: 14 RECON + 8 June DEAL rows in -B165R packs (same deals); no new DEALS file written.
- INDEX_B165R.md: seed/conf/latch/entry translated by occurrence (UNMAPPED=0) + exit MTEXIT refs added for all 11 trades (A1 W1:6089 … C-05-27 W1:6876; full table in slice).

## Part R3 - re-rendered setup reports

- SETUPS_RECON62-B165R.csv (28 rows) + SETUPS_JUNE0525-B165R.csv (20 rows), same Part W columns; refs translated B162→B165R (UNMAPPED=0); exit cells recomputed from B165R MTEXIT rows (dash-normalized); origins carried verbatim (a NONE-row recompute artifact was caught and removed — script history in slice).
- Cell diff vs B-162: only B2 (exit_bar 2026-06-05 19:15, exit_price 160.298, exit_src TP_TOUCH + MTEXIT ref) and 27 May (exit_bar 2026-05-27 20:05, exit_price 159.535, exit_src TP_TOUCH + MTEXIT ref) gain exit cells; all other value cells SAME; ref columns translated (+ exit refs appended; one duplicate-ref artifact caught and removed). sl_swing_bar unchanged everywhere: the FOUND stop-swing tags carry values/branch/shifts but no swing-bar-time field (SL_REF: branch/obValid/slRef/distPts/site/zone; SWINGPICK: atShift relative; SLSRC: values) — filling it would be inference, so it stays NOT PRINTED with reason.
- Every EXECUTED row: exit_bar/price/src now carry a pack line — zero EXECUTED rows left NOT PRINTED on exits (verified by scan).
- README appended (B165R addendum line, quoted in slice).

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 appended (relay text verbatim). Count 1.
- X2 HANDOFF section 3 appended after the B-164 line (relay text verbatim). Count 1.
- X3 ledger 1311, tag B165-PACK-EXIT-COMPLETE (R1 census, superset counts, added rows, report cell diff, new-file SHAs). "^1311." = 1.
- X4 pointer rewritten (35-line cap): latest B-165 MEASURED; Lane FIDELITY-B162 (first B-163, 3 of 6); packs of record = -B165R; Next = his 27 May answer; O3 pending kept; goal open.
- X5 register: no edit.

## Part F - file, push, reply

- F1 this result. F2 slice (cutter diff, census table, added rows, report cell diff; under 600 lines).
- F2b the -B165R packs (6 week + 26 day), INDEX_B165R.md, both -B165R reports, README line.
- F3 ledger 1311. F4 pointer.
- F5 stages result, slice, new -B165R pack/day/index/report files, README, ledger, pointer, CONTEXT, HANDOFF (cutter/renderer scripts live in untracked 00_CURRENT_WORKING, unstaged per F5). Never EA, includes, indicator, ex5, journals, logs, inis, profiles, backups.
- F6 commit, push via backup to builder/B-165; ls-remote check must return the commit.
- Reply line: B-165 is done, GitHub branch builder/B-165, commit <short hash>, verdict MEASURED.

## Final disk state (MEASURED turn; B-162 kept build on disk, verified, terminal idle)

- EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + ex5 187A7202 (pair matches); indicator 7842A02E + ex5 10880847 (pair matches); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini live CF80083C (04:25, unchanged, read-only turn); no terminal64. Strategy skill, journal, register, spec, findings, kit files untouched. CONTEXT +1; HANDOFF +1; ledger +1 (1311); pointer rewritten; result + slice new; 6 week + 26 day + INDEX + 2 SETUPS + README new. B-162 packs/reports untouched. No source/ex5 committed.

(No carried note - nothing new needs him; his 27 May answer still owed from B-164.)
