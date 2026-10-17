# BUILDER_SLICE_B252 - raw evidence for relay B-252 (replay-only)

All outputs re-derived the same turn as this filing: fc.exe /b byte compares, grade_register.py grades,
CUT-log proof lines, hash re-reads. Environment inventories are on disk as staged CSVs
(REPORT/ENV_B252_*.csv, REPORT/INCLUDES_B252.csv) - judged from there, not from prose.

## 1. Byte compares (fc.exe /b, verbatim verdict lines)

```
fc DEALS_RECON62-B252R0A.csv vs DEALS_RECON62-B242K.csv: FC: no differences encountered
fc DEALS_EU0525TD-B252R0A.csv vs DEALS_EU0525TD-B241D.csv: FC: no differences encountered
fc DEALS_RECON62-B252R1.csv vs DEALS_RECON62-B248D.csv: FC: no differences encountered
fc DEALS_EU0525TD-B252R1.csv vs DEALS_EU0525TD-B248D.csv: FC: no differences encountered
fc DEALS_EU0525TD-B252R1.csv vs DEALS_EU0525TD-B251ICT.csv: 845 differing bytes from 0000050D; DE...B251ICT.CSV longer than DE...B252R1.csv
```

## 2. CUT-log launch proofs (all four runs; L-numbered lines pulled by Select-String)

```
=== RECON62-B252R0A
L16: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00
L27: expert file added: Experts\SRJ_FlowNexus_EA.ex5. 520996 bytes loaded
L46:   InpCqdName=SRJ_CQD_TickBased_MT5
L87: program file added: \Indicators\SRJ_CQD_TickBased_MT5.ex5. 53471 bytes loaded
L91: program file added: \Indicators\SRJ_FlowLogic.ex5. 275873 bytes loaded
=== EU0525TD-B252R0A
L16: testing of ... from 2026.05.25 00:00 to 2026.10.14 00:00
L27: expert file added: ... 520996 bytes loaded
L46:   InpCqdName=SRJ_CQD_TickBased_MT5
L87: \Indicators\SRJ_CQD_TickBased_MT5.ex5. 53471 bytes loaded
L91: \Indicators\SRJ_FlowLogic.ex5. 275873 bytes loaded
=== RECON62-B252R1
L16: testing of ... from 2026.08.26 00:00 to 2026.09.10 00:00
L27: expert file added: ... 519412 bytes loaded
L46:   InpCqdName=SRJ_CQD_TickBased_MT5
L87: \Indicators\SRJ_CQD_TickBased_MT5.ex5. 53471 bytes loaded
L91: \Indicators\SRJ_FlowLogic.ex5. 281703 bytes loaded
=== EU0525TD-B252R1
L16: testing of ... from 2026.05.25 00:00 to 2026.10.14 00:00
L27: expert file added: ... 519412 bytes loaded
L46:   InpCqdName=SRJ_CQD_TickBased_MT5
L87: \Indicators\SRJ_CQD_TickBased_MT5.ex5. 53471 bytes loaded
L91: \Indicators\SRJ_FlowLogic.ex5. 281703 bytes loaded
```

Species arithmetic: EA sent 520,996 = 520,964 (D85CF7D2) + 32; EA sent 519,412 = 519,380 (6086E07C) + 32;
Flow sent 275,873 = 275,840 (61177AA5) + 33; Flow sent 281,703 = 281,670 (5311D4A2) + 33;
CQD base sent 53,471 = disk 53,430 + 41. Overhead is species-constant.

## 3. DONE stamps (verbatim)

```
RUN=RECON62-B252R0A RESULT=PASSED DONE=2026-10-17 20:50:56
RUN=EU0525TD-B252R0A RESULT=PASSED DONE=2026-10-17 21:32:47
RUN=RECON62-B252R1 RESULT=PASSED DONE=2026-10-17 21:52:20
RUN=EU0525TD-B252R1 RESULT=PASSED DONE=2026-10-17 22:31:37
```

## 4. Grades (grade_register.py, verbatim GRADE lines + exception rows)

```
GRADE RECON62-B252R0A: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
  A1 EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt) - register A row 1 + NOTE B-137
GRADE RECON62-B252R1: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
  (same A-table)
GRADE EU0525TD-B252R0A: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
  N25JUN FIRES - register C 0625-EU-INVALID
  N26MAY FIRES - his 2026-10-15 review item 1 (verbatim)
  N4JUN1005 FIRES - his 2026-10-15 review item 3 (verbatim)
  N15JUL1035 FIRES - his 2026-10-15 review item 6 (verbatim)
  K19JUN MISSING - his 2026-10-16 B-248A rules/54 (valid; entry 15:45 open)
  K10JUN MISSING - his 2026-10-16 B-248B rules/55 (valid)
  W28JUL WATCH SILENT - rules/43 question, register C NOTE B-223
GRADE EU0525TD-B252R1: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 3; MACHINE-ONLY ungraded 1; trades 17
  M12 UNGRADED BY HIM - 2026-06-19 buy 15:50 1.14654, exit 15:51 1.14716 (the K19JUN pair, on record)
```

## 5. Scanner (R1-EU cut, verbatim)

```
scanned 27009282; deals 34; KILL rows 824; S4/RV/ZG/KS/ZS rows 277353
flip bars 2687; renewal bars 0
DEALS + KILL + S4RV rows written
```

Day log 20261017.log 8,720,848,370 B; R1-EU segment start PRE_LINES=23,568,798 PRE_BYTES=7,542,719,544.

## 6. Restore proofs (post-copy hash re-reads, verbatim)

```
term64: 0
EA now: D85CF7D2 len=520964
Flow now: 61177AA5 len=275840
term.ini now: 2862B31F len=20481
charts: diffcount=0 (mirror vs Charts.preB252); dst files=37 bytes=1679192; quar files=6
```

Quarantined run-era chart saves (kept in Temp, never deleted):
`C:\Users\winar\AppData\Local\Temp\opencode\srj-quar-charts-b252\Default\` - chart01.chr 91,514 B,
chart02.chr 91,512 B, chart03.chr 91,512 B, chart04.chr 91,512 B, chart05.chr 408,220 B, order.wnd 106 B.

## 7. Pre-flight gate snapshots (from ledger 1412 + Part 0)

- Inventory coverage note: no separate ENV CSV exists for RECON62-B252R0A - its environment proof is the byte-exact replay itself (same-machine, same-env run reproducing B-242K); inventories file the void run, the EU replay, and both R1 installs (the species-swap leg).

- Branch `builder/B-252` cut at 641d28d; ls-remote verified; kept state on disk 10/10 MATCH; tick static e493c533.
- R1 binaries FOUND as `.B248DK` copies; `.preB252` content copies: EA d85cf7d2, Flow 61177aa5, terminal.ini.preB252 2862b31f, Charts.preB252 37 files 1,679,192 B.
- INCLUDES_B252.csv: 31 rows; non-kept include families named (Trade/Arrays/StdLib + SRJ extras, SHA-filled); none with mtime later than the y-day build era.
- Run inis carry the one-key override `InpCqdName=SRJ_CQD_TickBased_MT5` in [TesterInputs] (the ledger-1412 rule: pin EVERY terminal-held drifted input).
