# BUILDER SLICE B-73 - R1-R4 raws and tables (records only; kept EA 6CFE8F8B; CQD src BE6FD84F; no edit/compile/run)

## R1 CQD_BASELINES raws
- R1.1 copies (path, bytes, SHA-256, mtime): Indicators/SRJ_CQD_TickBased_MT5.mq5, 50,555 B, BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (raw; LF-normalized 9C8103A2), mtime 10/06/2026; Indicators/SRJ_CQD_TickBased_MT5.ex5, 53,430 B, 90D3EF87B539776231A3C016CCEEE3ABE6A46653C963FA9751C3998890A84CE3C, mtime 09/09/2026 18:38; Indicators/SRJ_Indicators_V2/SRJ_CQD_TickBased_MT5.ex5, 51,100 B, 72526DA96470E5FA77CC8B4DAEB97EBC7D14FF2AB922053412E9294921D59D70, mtime 08/14/2026 (stale; never loads per B12). No .pre*/.bak/.B*DIAG CQD copies; nothing CQD-source in 01_TASKS (packets only) or Files/ (full-recurse sweep).
- R1.2 SHA hits (ledger + 06_HANDOFFS *.md/*.txt + T161 compile logs; journals: zero hits, full sweep): 4B2D688C - CQD-FRAC-1:8, DIVCON-1:181, 161-I:26, 161-J:22, 161-R ×4, B72 files, ledger:6911 (first dated 2026-09-09 DIVCON-1/CQD-FRAC-1; last ledger 1217); 92F3A62B - 161-J:25/37/75, 161-M/N/O/P, 161-R ×2, EXIT-0817:4, HTFAUDIT:5, XOB-VALIDITY:73, B72 files, ledger:6911 (first 161-J executed baseline 2026-09-09; last ledger 1217); BE6FD84F - 161-R:24/60/88 (creation record 2026-09-09), RECON1:163/172, POST-V30 ×2, V37/V65, BUILD3 relays, 155-RT-A:18, VERDICTS_SLDEF4-5:1557, RECON2/5/SHADOW/GATE results, tabulations, ledger:582/2306/6911, B72 files (first 161-R 2026-09-09; last ledger 1217); 90D3EF87 - B12:7 (2026-10-04 "CQD ex5 (root): 90D3EF87... (53430 B)"; V2 copies differ 939843CC/72526DA9 and do not load) → B72 files (last); AB102C0A - 161-I:17/25/70/74 (executed EA baseline 2026-09-09), 161-J:6/37/79, 161-K:12, EXIT-0817:3, 155-RT-A:47 → SLICE_B72 (last; no ledger hit).
- R1.3 no second SOURCE copy exists (V2 holds ex5 only) → no source-vs-source diff hunks to paste. Disk-vs-pre-edit: NOT equal apart from endings (normalized 9C8103A2 ≠ 4B2D688C; exactly the E5/E6 strict-fractal pair per 161-R:18-20, -2 B). E1-E8 packet-vs-disk: E1 packet `(h[i] > h[i-1] && h[i] > h[i+1])` vs disk L510 `(h[i] >= h[i-1] && h[i] >= h[i+1] && ...)` ABSENT; E2 strict `(l[i] < ...)` vs disk L517 `<=` form ABSENT; E3 strict CQD_High `>` vs disk L526-527 `>=` ABSENT; E4 strict `<` vs disk L536-537 `<=` ABSENT; E5 strict `>` vs disk L547 `>` PRESENT-as-text (pre-existence unattributable on record); E6 strict `<` vs disk L556 `<` PRESENT-as-text (same caveat); E7 insertion `if((!x1PriceFlag && !x1CqdFlag) || ...)` vs disk L732-735 old gate ABSENT; E8 same vs disk L984-987 ABSENT.
- R1.4 per-run loaded ex5 (journals quote root path; V2 never loads per B12): j28 L84, j29 L87, j33 L85, j34 L85, j35 L86, j36 L85, j37 L85 (`\Indicators\SRJ_CQD_TickBased_MT5.ex5. 53471 bytes loaded`), j38 L85, j39 L85, j40 L85 — all identical (53,471 bytes-loaded = 53,430 B file + uniform +41 loader offset, same offset class as EA/FlowLogic/Marker lines). RECON62-j1: no load line (journal NOT FOUND).
- R1.5 provenance: NO record names 90D3EF87 as built-from-BE6FD84F. Closest records: B12:7 (root-ex5 identity, 2026-10-04); T161R 0/0 compile of BE6FD84F source (T161R_CQDCOMPILE.log, no output SHA recorded); 161-R G7 (post-run source re-hash BE6FD84F, ex5 unrecorded). UNRESOLVED ON RECORD — never inferred, never compiled (scope 0.6).

## R2 CQD_REGRESSION raws (s140 + s133)
- RECON62-j1 (s140's named baseline): NOT FOUND by name (no ledger/finding names its file; "(j3)" likewise unidentified; RECON62-Bxx journals are October B-series, s140 is 2026-09-22). SAME/DIFFERENT vs j1 unmeasurable → NO ROW per trade. Earliest print-carrying journal checked: T161H_JOURNAL.log (493 "CQD DIV verdict" prints; RECON62-B10/B57/B58 carry 906 each).
- 1 Sep London 09:40-09:55 (j37, W2 verbatim: "the latest divergence is blue solid which is type 1 bullish"): 0 census prints in window + 0 A6FIRED at 09:45/09:50/09:55 (kept silent both sides).
- s140 consequence: with no j1 baseline no difference can be established → NO regression record filed (report only, never a proposal).

## R3 0604_CQD_ANCHORS raws
- Anchor export: EA census prints verdict bar only (EA:7141 "CQD DIV verdict=%+d shift=%d bar=%s" — one bar, not the x1/x2 pair). CQD anchor prints (x1/x2 "SRJ CQD Div" lines, indicator L740-741) are InpDebugLog-gated; the EA binding passes only inputs #1-#5 (DIVCON-1 §1.2), never input #16 → 0 such lines on j38 (full-journal grep).
- 4 June -2@09:45 (j38:35091) anchors: NO ROW (neither EA nor journal prints the x1/x2 pair; verdict bar 09:45 ≠ anchors). Flag-gate MET/NOT MET unjudgeable on rows. Never reconstructed from bars; nothing run (scope 0.6).

## R4 SUMMARY one-liners
- Disk CQD = BE6FD84F restore baseline (161-R:23-24 + :86-90; P-CQDRESTORE issued + executed 2026-09-09; UNIFY 92F3A62B SUPERSEDED).
- j37 + j38 ran root ex5 = the 90D3EF87 file on disk (identical load lines j28-j40; V2 copy never loads).
- Whether that ex5 carries his flag-gate: UNRESOLVED ON RECORD (its build source unrecorded; the source on disk lacks the gate).
- RECON62-vs-kept per trade: NO ROW (baseline journal not found; s140 files no difference record).
- 4 June anchors: NO ROW (unprinted; never reconstructed).
- STOP-class: none expected, none found. No chart call (0.6; 4 June settled s199; rule settled B-72 R1(c)).

(End of slice)
