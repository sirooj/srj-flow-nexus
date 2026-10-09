# BUILDER RESULT B-137 - Own-body break exit KEPT (lot drift accounted, both owed exits hit, June fully identical)

Trader summary: your two exits now come out of the machine. The 28 August short leaves at the 11:35 open (1.16464, your price) and the 1 September long leaves at the 17:50 open (1.15987, your line exactly). Every entry sits on the same candle at the same price, and every other exit is untouched on both test windows. The 0.01 lot trims are just arithmetic: the earlier 28 August exit banks less (the short closes about 25 points lower in profit), so the account reads a little lower and the sizer floors three later entries one step down. Your rules never mention lot size, and the size formula reproduces every entry on both runs to the lot step. This build is kept.

## Relay order (B-137, lane A2-EXIT 4 of 6)

- Part 0 fresh start on builder/B-136 at e9ac3ad88d7a523cc52c606baa758e29a409fdfc (backup remote verified exact; builder/B-137 cut here; no remote B-137 before push). Relay skill loaded whole (83 lines); strategy skill verified byte-identical to the B-135 whole read (diff EMPTY) with pins re-grepped; .agents stub never opened.
- Part B banking: s23 L23, s36 L36, s78 L78, s28 tail L28, EXACT-PRICE-NO-LENIENCY L34, NO-OVERFIT L60, NO-CASCADE L205; register section E must-keep line L65 (`all section-A takes reproduce (entry/bar)`). Append nothing.
- Part R: R1 sizer located (kept EA:11201-11219: riskMoney = ACCOUNT_EQUITY × InpRiskPercent(1.0, EA:28)/100; lossPerLot = slDist/tickSize × tickValue; lots = floor(raw/step) × step; LOTDIAG print). R2 table below: all 7 entries ACCOUNTED on both runs (formula reproduces floored volume from each run's rebuilt account value; slPts and entry prices identical). R3: no NOT ACCOUNTED row, proceed. R4 correction with account values (trial A1 −$2.38 vs kept +$61.88; deal-4 balance 9997.62 vs 10061.88).
- Part K: K1 backups .preB137 (kept SHAs); K2 .B136BRK copied over (SHA 585093BF verified; 56-line diff textually identical to the B-136 K DIFF); K3 one compile, 0 errors 0 warnings, EX5 AB159DE7 (differs from B-136's 2F5199D1, so T1(b) ran fresh).
- Part T: T0 per launch (no terminal64; .preB137 content copies; dates written + read back; script launches; wrapper killed after verify; PID-verified watchers; short polls). T1(b) RECON62-B137 PASSED 19:50:10: R-a passed (14 deals; sides/dates/times/prices identical; volumes R2-ACCOUNTED), R-b passed (both MTEXITs exactly as predicted, src=OWNBODY), R-c passed (no new deal; 7/7 entries identical but ACCOUNTED volumes; exactly 2 ownBrk=1 rows). T2 JUNE0525-B137 PASSED 19:55:37: FULLY identical incl. volumes (10 deals; 0 ownBrk=1 rows). T3 configs restored + verified; trial EA/EX5 stay on disk as the new kept build. Verdict KEPT.
- Part X: CONTEXT X1 + X2, HANDOFF X3 (KEPT), ledger 1282 (tag B137-BRK-OWNBODY-KEEP + R4 correction), pointer (KEPT, lane closed, Next fixed), register A1/A2/A4/A5 NOTEs. Strategy skill untouched.
- Part F: this result + slice + ledger + pointer + CONTEXT + HANDOFF + register + ROWPACK files staged by explicit path; commit + push via backup + ls-remote check. Reply KEPT.

## Part R - lot-size accounting (R1 code raw in slice; rows: deal | kept acct | kept formula | kept deal | trial acct | trial formula | trial deal | verdict)

- Formula (kept EA:11201-11219): lots = floor((ACCOUNT_EQUITY × 1.0/100) / ((slDist/tickSize) × tickValue) / 0.01) × 0.01; tick value $1/pt/lot solved from deal 2 (equity exactly 10000.00, rawLots 2.3810, slPts 42 → lossPerLot $42.00). Deposit 10000 (run ini + terminal.ini); no commission/swap rows on either run. Quantum check: rawLots prints 4dp, so implied-vs-rebuilt tolerance per row = 0.0001 × slPts × 100.
- deal 2: kept 10000.00 → 2.38 → 2.38 | trial 10000.00 → 2.38 → 2.38 | ACCOUNTED (diffs +0.20/+0.20, tol $0.42).
- deal 4: kept 10061.88 → 2.05 → 2.05 | trial 9997.62 → 2.04 → 2.04 | ACCOUNTED (−0.22/−0.15, tol $0.49). slPts 49 = 49, entry 1.16024 = 1.16024.
- deal 6: kept 9961.43 → 0.57 → 0.57 | trial 9922.14 → 0.57 → 0.57 | ACCOUNTED (+0.81/+0.54, tol $1.72). slPts 172, entry 1.16019.
- deal 8: kept 10024.13 → 2.50 → 2.50 | trial 9984.84 → 2.49 → 2.49 | ACCOUNTED (−0.13/−0.04, tol $0.40). slPts 40, entry 1.16138.
- deal 10: kept 10181.63 → 3.91 → 3.91 | trial 10141.71 → 3.90 → 3.90 | ACCOUNTED (−0.03/+0.11, tol $0.26). slPts 26, entry 1.16264.
- deal 12: kept 10381.04 → 1.95 → 1.95 | trial 10340.61 → 1.95 → 1.95 | ACCOUNTED (+0.07/+0.22, tol $0.53). slPts 53, entry 1.16205.
- deal 14: kept 10581.89 → 1.95 → 1.95 | trial 10541.46 → 1.95 → 1.95 | ACCOUNTED (−0.05/−0.12, tol $0.54). slPts 54, entry 1.16220.
- R4: trial A1 P/L = 2.38 × 100000 × (1.16466 − 1.16467) = −$2.38 vs kept +$61.88 → deal-4 account 9997.62 vs 10061.88 (−$64.26). MTEXIT-exit basis: 1.16464 vs 1.16439 = 25pts less profit on the short; deal-fill basis 27pts. B-136's "leaves more money" is reversed and withdrawn; profit never grades (NO-OVERFIT s60), no verdict changes.

## Part K - re-apply (no new edit)

- K1 .preB137: EA 90240F23-64char, EX5 6CFD3A46 (verified). K2: .B136BRK → EA, SHA 585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6 verified; 56-line diff identical to B-136 K DIFF (compared programmatically, DIFF-EQUAL=True). K3: 0 errors, 0 warnings; EX5 AB159DE742F8EE9CF3FD2C1A4AE7A08A6CEE744728206B5325004FFCCBFB6FE9 (≠ 2F5199D1 → T1(b)).

## Part T - runs

- T0 (each launch): terminal64 0 (leftovers stopped by PID 24204/23624); .preB137 copies (terminal.ini.preB137 + Charts.preB137/20 files, pre-existing from the restore point); [Tester] dates+symbol written + read back (EURUSD 1787702400/1788998400; USDJPY 1779667200/1781308800); script-file WMI launches (PIDs 21508/18752, RC=0); STATUS window verified (PRE_JOURNAL_LINES 1065738/1137751; terminals 24204/23624; server from 2026.08.26/2026.05.25); wrappers killed (terminals survived); watchers PID-verified (22036/20532); short DONE polls.
- T1(b) RECON62-B137 (day log j1065739-1137751, DONE=PASSED 19:50:10, ~3 min): 14 deals #2-15. deal 2 identical. deal 3: buy 28Aug 11:35 1.16467 2.38, MTEXIT bar=11:30 BREAK D-POC 1.16451 exit=1.16464 src=OWNBODY (J1081877; +3pt lag class, reported raw). deal 4: buy 17:35 1.16024 2.04 (ACCOUNTED). deal 5: sell 1Sep 17:50 1.15987 2.04, MTEXIT bar=17:45 BREAK Y-POC 1.15987 exit=1.15987 src=OWNBODY (J1096036; deal = exit exactly). deals 6/7 identical (DAY_CLOSE 23:55 1.16129). deal 8: 2.49 (ACCOUNTED). deal 9: same price/time 2.49. deal 10: 3.9 (ACCOUNTED). deal 11: same price/time 3.9. deals 12-15 fully identical. R-a passed (volumes ACCOUNTED). R-b passed (both MTEXITs verbatim as predicted). R-c passed (no new deal; ENTRY_TICKET/EXECUTED 7/7 identical but ACCOUNTED volumes — same fills/slPts/tpPts/tickets/magics; ownBrk=1 rows exactly J1081864 A1-11:30 + J1096031 A2-17:45). No GATE/REFUSED/start_time warnings.
- T2 JUNE0525-B137 (j1137752-EOF, DONE=PASSED 19:55:37): 10 deals #2-11, every column identical to DEALS_JUNE0525-B131 (incl. volumes 1.08/3.75/3.15/0.34/5.63; MTEXITs 20:05 TP / 09:55 TP / 10:40 SL / 19:15 TP / 15:20 TP; known 4 June fire unchanged). ownBrk=1 rows in segment: 0. STOP checks all pass.
- T3: terminal.ini + Charts restored from .preB137 (4082A94F verified, 20 files); trial EA 585093BF + EX5 AB159DE7 stay on disk as the new kept build (64-char SHAs below).

## Part X - records (grep first, append once, verify count 1)

- X1 CONTEXT §4: appended the B137 lesson line (relay text verbatim). Verified count 1.
- X2 §5: appended the planner-stated B-137 line. Verified count 1.
- X3 HANDOFF §3: appended with verdict KEPT. Verified count 1.
- X4 Ledger 1282, tag B137-BRK-OWNBODY-KEEP (R1-R4, K2, T1/T2, KEPT + R4 correction). Verified `1282.`-class 1, `1281.` = 1.
- X5 Pointer (35-line cap): KEPT; EA/EX5 SHAs 64-char; `Lane: none open (A2-EXIT closed KEPT at B-137, 4 relays)`; stale Next fixed (4 June parked; SILENT6 parked); goal open.
- X6 Register: A1 + A2 exit NOTEs, A4 + A5 volume NOTEs (EA 585093BF). Strategy skill untouched (s36 machine 11:40 stays as written; no new words).

## Part F - file, push, reply

- F1 this result. F2 slice (R1 raw, R2 table, K2 diff, T tables; under 600 lines). F2b: ROWPACK_RECON62-B137_W1/_W2/_W3.csv (whole 1.11 MB split by week per the 900 KB rule) + ROWPACK_JUNE0525-B137.csv (842 KB) + DEALS csvs + per-day folders + EXITS-B137/ (12) + INDEX_B137.md (mapped from INDEX_B131 by datetime+tag+occurrence; 3 P3 spot-checks byte-identical True).
- F3 ledger 1282. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF, register, ROWPACK files (never EA/ex5/indicator/includes/logs/journals/inis/profiles/backups/scripts).
- F6 commit + push via backup + ls-remote check. Reply KEPT.

## Final disk state (KEPT turn; trial build is the new kept build)

- EA `585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6` + EX5 `AB159DE742F8EE9CF3FD2C1A4AE7A08A6CEE744728206B5325004FFCCBFB6FE9` (matching pair on disk; prior kept EA/EX5 in .preB137). Indicator src/ex5 + HTFEngine at gate SHAs, untouched. terminal.ini 4082A94F + Charts restored (no terminal64). Strategy skill, journal CSV, spec, FINDING, kit files untouched. Helper scripts unstaged. No Ex5/source committed.

## Carried note

- None (KEPT; R-a's replacement rule worked as specified — volumes R2-ACCOUNTED, T1/T2 green).

(End of file)
