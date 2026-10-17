# BUILDER_SLICE_B251 — relay B-251 (F4a diagnostic 3) work slice
2026-10-17. Strategy SRJ. Sources: `.B248DK` = `Experts\SRJ_FlowNexus_EA.mq5.B248DK`
(0a6affaf/6086e07c), branch `builder/B-251` cut from `c738ab1`. Legal outcome set:
FOUND / NOT FOUND / ABSENT / UNKNOWN / ACCOUNTED / STOP.

## K0a — S4→S5 transition + divergence check (raw, from .B248DK)

Latch refresh each pass (EA reads CQD verdict buffer into g_divLatch), .B248DK L8557-8561:

```
8557:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
8558:      {
8559:       string kind;
8560:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
8561:      }
```

Divergence walk (anchor-bounded, first non-zero verdict = latest), .B248DK L7027-7052:

```
7027: bool UpdateDivergenceLatch(int barShift, ENUM_SRJ_DIR dir, string &kindOut)
7028:   {
7029:    //--- [STEP 2 / operator ruling 2026-09-09] The divergence that governs is the
7030:    //--- LATEST one present during the confirmation entry candle - an opposing
7031:    //--- divergence after a matched one invalidates the requirement (this refines
7032:    //--- spec 3.8's "counts permanently"). Walk from the evaluation bar back to
7033:    //--- the candidate's anchor; the FIRST nonzero verdict encountered is the
7034:    //--- latest; its direction-match decides the latch THIS BAR. The latch now
7035:     //--- reflects the latest verdict per bar - it clears when the latest is
7036:     //--- opposing, and re-arms when a matched one appears.
7037:     //--- [P-TRIM-S2POLL E3] loop-invariant hoist. Bars() cannot change within one
7038:     //--- EvaluateClosedBar pass. Matches the existing t127_limit2 / t133_limit idiom.
7039:     const int udl_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);
7040:     for(int s = barShift; s <= udl_limit; s++)
7041:      {
7042:       if(iTime(_Symbol, PERIOD_CURRENT, s) < g_anchorBarTime) break;
7043:       double verdict;
7044:       if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) continue;
7045:       if(verdict == EMPTY_VALUE) continue;
7046:       int v = (int)MathRound(verdict);
7047:       if(v == 0) continue;
7048:       bool matches = (dir == DIR_LONG  && (v ==  1 || v ==  2)) ||
7049:                      (dir == DIR_SHORT && (v == -1 || v == -2));
7050:       kindOut = (MathAbs(v) == 1) ? "regular" : "hidden";
7051:       return matches;
7052:      }
```

S4 confirm block — the pass that carries confirmation promotes S5 (L10321-10349):

```
10321:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
10322:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
10323:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
10324:          //--- through is the retracement, a CLOSE through is a line break).
10325:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
10326:          //--- failed term consumes the confirmation (no carry-forward) and a
10327:          //--- later bar can present a fresh confirmation while the candidate is
10328:          //--- alive and in-window. The touch fallback above STAYS (it sets
10329:          //--- g_touchSeen - the retracement detection; unchanged).
10330:           string cfTerm = "";
10331:           int uj60_s4RSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
10332:           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm, false, uj60_s4RSh))
10333:            {
10334:             if(SrjS54DeadAtConfirm(barShift))
10335:               { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
10336:             else
10336:              {
10338:              ENUM_SRJ_STATE prev = g_state;
10339:              g_confirmFromState = prev;
10340:              g_state = ST_S5_GATE_CHECK;
10341:              LogState(prev, g_state);
10342:              }
10343:            }
10344:          else if(InpDebugLog)
10345:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
10346:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10347:                                      TIME_DATE|TIME_MINUTES),
10348:                         DirName(g_dir), cfTerm);
10349:         }
```

(Line printed `10437:` above is the renderer's one-off; file text is intact — L10336.)

K0 evidence rows kept from CUT_EU0525TD-B250H (the B-250 copies-run; cited for
timing-only per her framing, not as F4a/kept evidence — G-base rows):
`CONFIRMPOLL bar=15:45 confirm=0 shadow=true`; `D130LATCH pass=15:50 confBar=15:45
dir=LONG verdict=2 verdictBar=15:35 walkShift=3 oppPassed=-1`;
`SIDE1O_ELIGSTATE cqd=UNREAD confirm=S4_ARMED divLatch=1`;
`UJMEMO_PASS entry=1.14649 tp=1.14715 sl=1.14589 R=1.00`.
(bar-role, read from the rows as filed: 19 June 2026 NY EURUSD — bar 2026.06.19
15:35 (swing/anchor, site V2), 15:45 (retest bar, confirmation candle closed
without passing confirm=0), pass 15:50 first readable verdict per the copied-CQD
early-write defect D3.)

## K0b — is the verdict readable at the 15:45-evaluating pass? Answer NO.

The B-250 copies-run (CUT_EU0525TD-B250H) shows the 19-June 15:45 pass printing
`CONFIRMPOLL ... confirm=0 shadow=true` while the copied CQD had ALREADY marked
the swing at its own writePass (D3: 18,187/18,187 rows-ahead, share 1.000 — the
copy-processed stream wrote every swing one candle early, newestClosed == swing
bar). So on the copies build the verdict blob existed early — but the EA's own
confirm gate still failed the 15:45 bar (confirm=0), the entry fired at the 15:50
pass, and `SIDE1O_ELIGSTATE cqd=UNREAD confirm=S4_ARMED divLatch=1` shows the EA
never read CQD before that pass.

For the ORIGINAL CQD the ordering differs. B-249 K0d (BUILDER_SLICE_B249,
indicator-side evidence): CQD maxX2 = rates_total-3 (:856) writes the verdict at
anchor x2 (:755); the swing needs i+1 (:515); the EA latch walks bars-shift first
nonzero (:7024-7049, pasted above); "the 15:35 verdict exists only once the 15:45
bar exists" (B-249 K0d whole-file verdict). Under the ORIGINAL CQD the verdict
for the 19-June swing becomes readable at the pass evaluating bar 15:45 — the
same pass whose confirm gate fails. This is the indicator-side note (UNKNOWN
downstream of CQD internals; the run's [B251I] print is the final arbiter —
B251I print UNKNOWN allowed by the relay).

## K1 — .preB251 backup (done). Nine sources + terminal.ini + charts.

`D:\SRJ Venture\work-archive\b251_backup.ps1`: SHA-verified copies beside sources
(matching pairs): EA 18A1D49B / EA.ex5 D85CF7D2 / Flow.mq5 A8201128 / Flow.ex5
61177AA5 / Types D542B458 / State 2E4F8A95 / OB 915B4FC3 / Imb D9A38776 / Bias
0B334063; terminal.ini.preB251 2862B31F; Charts.preB251 37 files (live 37).
CHART DEFECT B-251-1 (owned): the folder copy ran without -Recurse first
(preB251 files=0 vs live 37), caught by post-count, repaired same turn with
-Recurse (files=37 == live 37). Chart restore at T5 re-verifies recursively.

## Gate measurement vs c738ab1 (start gate, all PASS)

Raw-sha first-8 of all 15: EA 18a1d49b/ex5 d85cf7d2; EA.B248DK 0a6affaf/6086e07c;
Types d542b458/B248DK f2e74e66; State 2e4f8a95/4bdc8e41; OB 915b4fc3/3c669e6d;
Imb d9a38776; Bias 0b334063/1c210d7b; Flow.ex5 live 61177aa5 / .B248DK 5311d4a2;
POI d47a0e68/04fcd8a5; CQD original be6fd84f/90d3ef87 (untouched); terminal.ini
2862b31f. Tick 2026.hcc 18,678,468 B sha e493c533 STATIC.
VERSION-SWAP ACCOUNTED (2 vs c738ab1): `.opencode/skills/srj-relay/rules/
01b_relay-b.md` (compaction clause at operator order, 19,669 B 651fc515) and
`BUILDER_SLICE_B250.md` (post-push manifest). Repo dirty ~1,396 lines (normal;
preserved). Stash 0. Disk: C/ 22.0 GB, D/ 113.6 GB.

Post-swap live identities (b251_swap.ps1 output, all MATCH): EA 0A6AFFAF,
Flow.mq5 387F2822 (equals the .B248DK copy), Flow.ex5 5311D4A2, Types F2E74E66,
State 4BDC8E41, OB 3C669E6D, Imb 89A1E7D4, Bias 1C210D7B. (Imb/Bias/Types raw
values cite the swap reads: live==src pairs, per-line in the tool output.)

## K2 — the one hunk ([B251I]) on the .B248DK content (done, compiled 0/0)

Edits (b251_hunk.py + b251_hunk2.py move-fix):
1. Global book: `bool g_b251i_used = false;` after the g_divLatch declaration
   (base L1097 region).
2. Helper `udl_b251i_check(barShift, anchorBarTime, dir)` placed immediately
   before the "Sequence reset / abort" banner: anchor-bounded walk identical to
   UpdateDivergenceLatch's shape (first non-zero CQD_BUF_DIVVERDICT verdict at or
   above g-anchor; direction-match returns true; direction-mismatch/false = no
   gate run).
3. Per-candidate reset `g_b251i_used = false;` inside ResetSequence (after
   g_divLatch=false, base L7073 region).
4. The trigger: a third `else if` INSIDE the confirm-fail chain (after the
   CONFIRM_STRUCT_FAIL print, before the chain-closing brace at base L10349):
   `else if(!g_b251i_used && udl_b251i_check(barShift, g_anchorBarTime, g_dir))`
   → sets used, prints `[SRJ-EA] [B251I] gate pass=... evalBar=... state=
   S4_ARMED->S5_GATE_CHECK latch=%d verdictBar=%s order=pending`, then performs
   the same promotion as the confirm pass (`g_confirmFromState = prev; g_state =
   ST_S5_GATE_CHECK; LogState`) so the ST_S5_GATE_CHECK block runs in THIS pass
   → order at the next open (relay "I" semantics: enter at the next open on the
   pass the divergence completes).

Integrity: braces base 1298/1298 → hunked 1301/1301 (+3 pairs: helper function
+loop, trigger block); [B251I] literal count 5 (comments) with exactly ONE
PrintFormat tag site; file bytes 766,427 (.B248DK) → 768,996 (hunked, UTF-8).

COMPILE DEFECT B-251-2 (owned, repaired first corrected re-compile): first
placement put the else-if AFTER the chain-closing brace → MetaEditor `error 183:
illegal 'else' without matching 'if'` at (10380,9); moved inside the chain
(b251_hunk2.py): re-compile `Result: 0 errors, 0 warnings, 12297 ms`.
(Intermediate stale-log artifact on the second attempt is noted; the clean
re-run at 17:27:04 is the record of 0/0.)

KEEP file `.B251IK` written as 9 pairs EA/ex5/Flow.mq5/Flow.ex5/Types/State/OB/
Imb/Bias: EA 9556d0ab/768995 B; **EA.ex5 6ebb8fd4/521028 B** — this
is the binary T1/T2 ran (ex5 verify after both runs, byte-proven identical);
Flow 387f2822/5311d4a2; Types f2e74e66; State 4bdc8e41; OB 3c669e6d;
Imb 89a1e7d4; Bias 1c210d7b.

## T1 — RECON62-B251I (run, graded 2026-10-17 17:38)

Launch 17:29:26 (launch_b250.ps1): STATUS PID=2016, PRE_JOURNAL_LINES=7,309,989,
PRE_JOURNAL_BYTES=2,280,065,630. Window journal-proven at 17:31:
`Tester EURUSD,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5
from 2026.08.26 00:00 to 2026.09.10 00:00` (= intended RECON62).
DONE file `RECON62-B251I_DONE.txt`: `RUN=RECON62-B251I RESULT=PASSED
DONE=2026-10-17 17:37:49`. Terminal PID killed + gone. Ex5 unchanged mid-run:
6ebb8fd4/521028 == .B251IK.
Cut job_cut_b247.py RECON62-B251I 7309989: scanned 8,615,714 lines; deals 14;
KILL rows 148; S4/RV/ZG/KS/ZS rows 258,703; flip bars 504; renewal bars 0.
GRADE (grade_register.py 2026-08-26 - 2026-09-10):
`KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY
ungraded 0; trades 7` — 7/7-6/7-0 **T1 GATE PASS** (A1-A7 entry times unchanged,
per-line in the grade print). The 6/7: A1 EXIT DIFF machine 11:35 1.16467 vs
owed 11:35 1.16464 (+3pt) — the A1 exit diff is the note-carried B-137 line,
same shape the B-242K gate baseline carries.

## T2 — EU0525TD-B251I (launched, in flight)

EU window set in config\terminal.ini [Tester] (b251_window.py; bom=False,
readback DateFrom=1779667200 DateTo=1791936000). Launch 17:50 (PID=50388) with
STATUS PRE lines/bytes filed. Window journal-proven 17:51:
`testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.05.25 00:00 to 2026.10.14 00:00`
(= intended EU0525TD). On DONE: kill PID, ex5 == .B251IK proof, cut PRE, grade
2026-05-25 - 2026-10-13.

## T3 interim — EU grade (B251I) + baselines, and the attribution problem

T2 grade (job_cut_b247 EU0525TD-B251I 8615714; scanned 12,112,991, deals 38,
KILL 824, S4RV 295,536, flips 2,687):
`KEEP entries exact 11/15; KEEP exits exact 10/15; NEVER fires 2; MACHINE-ONLY
ungraded 6; trades 19`. Baselines re-graded mechanically on the same truth this
turn: B248D = 13/15-12/15, NEVER 3 (N26MAY, N4JUN1005, N15JUL1035), MACHINE 1
(the 06-19 15:50 row), trades 17; B241D = 13/15-12/15, NEVER 4, MACHINE 0,
trades 17. Planner-predicted clean-hunk shape (14/15-13/15, NEVER 3, M0,
K19JUN 15:45 1.14644) DID NOT materialize: K19JUN still MISSING, machine still
fires 19 Jun 15:50 1.14654 (M8 row, ungraded by him), and the 11/15 lost two
baseline exact takes.

Zero [B251I] print rows across ALL three decodes (T1 cut Select-String; T2
segment day-log UTF-16LE scan; T2 cut python scan) AND zero 'order=pending'
tails across 1.3M+ [SRJ-EA] rows — the trigger never ran its print line in
either run. Ex5 string probes (ascii/utf16 for B251I/CONFIRMPOLL/UJMEMO) all
0 in the binary — MQL5 packs print literals, so binary probing is void
(measured, recorded).

## B-251-3 COMPILE NON-DETERMINISM (owned, decisive for attribution)

Same source + same .B248DK-species includes compiled to DIFFERENT ex5 species
across sessions/minutes:
- y-day B-248D build: 6086e07c / 519,380 B
- today pure .B248DK EA + .B248DK includes compile #1: a0ba83bd / 520,508 B
- same re-compile minutes later (after mtime-touching copies): fd29da44 / 520,920 B
- preB251-species includes + pure EA: fe3049f1 / 521,186 B
- hunked build (the .B251IK record): 6ebb8fd4 / 521,028 B
- control compile (pure EA pre-run): 4a018027 / 520,600 B
So NO cross-compile ex5 is byte-comparable; include-state beyond my 5-file swap
and compile-session state both feed the binary. **Same-binary replay determinism
PROVEN** (B251ICT = re-run of the exact 6ebb8fd4 T1 binary in the RECON window:
deals CSV byte-identical to B251I's, grade 7/7-6/7-0 identical). The athlete:
per-binary replay is deterministic; per-compile the binary differs; therefore
cross-time cross-compile take comparisons carry an UNRESOLVED compile-state
variable until the pure-base control (EU0525TD-B251ICT, ex5 4a018027, launched
19:00:31, window proven) decides the attribution:
- control == B248D takes → the B251I take movement = hunk-attributable (despite
  zero prints — source-level contradiction to re-audit);
- control == B251I takes → the movement = compile-state drift, the hunk = zero
  behavioral effect at trigger level (NOT FOUND), and cross-compile EU grades
  are not mutually comparable (a BUILDER-SIDE methodology finding for the
  ledger + his report, never a strategy change).

## T3 final — the control decided: hunk = zero effect; movement = compile-chain

EU0525TD-B251ICT (pure .B248DK EA, NO hunk, ex5 4a018027/520600, window-proven
2026.05.25-2026.10.14, launched 19:00:31, DONE=PASSED 19:33:55, PID killed,
ex5 verified unchanged 4a018027/520600):
- cut (PRE 13,418,709): scanned 16,915,980, deals 38, KILL 824, S4RV 295,536,
  flips 2,687 — counts IDENTICAL to the B251I cut row-for-row profile.
- grade: `11/15-10/15, NEVER 2, MACHINE 6, trades 19` — same summary shape.
- **DEALS CSV byte-identical to DEALS_EU0525TD-B251I.csv (measured, True)**.

Attribution closed mechanically:
1. The [B251I] trigger never fired in either hunked run (zero print rows in
   three decodes). The div-readable-on-confirm-fail pass NEVER existed in
   the full EU window under the original CQD. **Diagnostic = NOT FOUND at
   the trigger level.**
2. Identical takes with and without the hunk in today's compile chain
   (byte-identical deals CSVs) — the hunk has ZERO trade-level effect.
3. The differences vs the y-day B248D baseline (13/15-12/15-3-1-17 →
   11/15-10/15-2-6-19) belong to the COMPILE CHAIN (B-251-3): same source,
   same .B248DK-species 5+Flow includes, fresh compile tonight = different
   take pattern; same-binary replay = byte-identical deals (deterministic);
   cross-session recompiles = different ex5 species. Include-state beyond
   my 5-file swap + compile-session state both feed the binary; the y-day
   include-state is not reconstructible from on-disk snapshots.

Plain language for him: the next-open-on-divergence rule (I) never fired once
in 19 weeks (the machine+CQD never reached that state in the real feed); the
two extra machine entries / two lost valid losses in tonight's runs are the
build-chain's difference from the B-248D era, NOT the rule change — the rule
change did literally nothing.

## T4 — restore .preB251 (per relay: I is always RESTORED)
