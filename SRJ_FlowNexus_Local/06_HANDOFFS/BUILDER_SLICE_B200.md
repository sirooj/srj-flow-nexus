# BUILDER SLICE B-200 - raw rows and code spots (under 600 lines)

Base: builder/B-200 cut at fda20f4 (backup exact, = builder/B-199 head). Reads: job_*_b200*.py (packs + committed files, never the day log after the cut). Trial: ONE-EXEC + B200POT/B200SESS (RESTORED on P3-10-July + promotion placement). Relay B-200 + his B-200 goal-map words, same session.

## Start gate
```
log-1 fda20f4e924aecc2ca3b7472bdac0b6c433fa970 (backup exact). Branch builder/B-200 cut here (rev-parse HEAD = fda20f4 + branch builder/B-200 after cut, re-checked before commit below). Push via backup, never origin.
status 1117 (dirty tree as B-199 ACCOUNTED). git diff fda20f4 EMPTY on pointer/RESULT_B199/SLICE_B199/register/both skills/CONTEXT/HANDOFF/ledger. Journal rows 332/333 bytes 163225 ACCOUNTED.
Disk: EA 986a7dba, IND a8201128, SESS 16573a5b, ex5 3b96541a/c82f175e, terminal.ini a5834591 + Profiles 578/578 = .preB198 (post-commit touch: 2 ini counters + 2 chart re-saves, restored, named). No terminal64. Ledger ^1345.=1 ^1346.=0 pre. Python 3.13.16 (py absent).
Trial SHAs post-compile = pre-launch: EA src 340a7ab4, ex5 4b0f806b; IND ex5 c82f175e untouched.
```

## Part B banking (verbatim, typos his)
```
His goal-map words 2026-10-13 (skill B-200 section 0->1; journal row 334 UNSTAGED, bytes 163706): "I found out that the July 10th is invalid on the live actual chart. This is another my mistake of backtesting using the raw chart. On the live chart, the CQD divergence, the latest upon entry, there is no bearish divergence. The current task is to make the journal and detection to be more robust so that we won't guess of what the actual cause, logical cause rule of why a certain setup is rejected or invalid. I have told this to the builder agent midway because I just realized this. So after this, the task is to make the journal or the report on the CSV and the upcoming website report. on PDF, etc., to be more robust because we just recently guessed of what is the probable cause of what makes the EA refuse to take the July 10th GU setup. And then after this, the next step is another blind test. And then if that is passed, then I would like to back test from June all the way until till date. And then another test run from the beginning of the year till date. This is the goal map."
GOAL-MAP paraphrase (marked so): (1) journal + detection robust; (2) CSV, website, PDF (O3); (3) blind test; (4) June to date; (5) year to date. 10 July part restates B-199B.
```

## Part K code spots (EA only; locate by text, line numbers B-199's as relayed)
```
[B-200 ONEEXEC] helper block before EvaluateClosedBar (struct SOnePot ~30 fields incl. ENUM members per SManagedTrade precedent; g_pots[] no-cap; print-plumbing globals g_b200Shift/BarTime/tallies/prevSess-enum/prevDay; ABORT_ONE_TAKE_LOST define; snapshot/restore/park/remove/rule-map/probe/print helpers; N1-six save/restore per birth-probe precedent EA:8834).
Bar-top: g_b200Shift/BarTime set + B200SESS close block (sess/day change; tallies reset; cross-session parked discarded with ONE_TAKE_LOST END rows; live persists).
GoAbort-central END (after B182DecPrint): rule map + probes + tally by class.
UJRESEED (EA:8430 block): B200ParkOld + BORN-new before kept writes (foreground identical).
PREEMPT split (EA:8467): b200_s1pre (S1+opConf, kept, END-old HIS L51) vs b200_s2x (park-old + BORN-new, kept re-point).
YIELD (EA:9037 block): park-old + BORN-new before kept swap.
HOLDEXPIRE deleted (EA:8980 block, 5 lines, matched braces). RESEEDBLK gate deleted (EA:8708-8715, INDEX-INVALID guard kept).
Refusal tallies (EA:8663-WINDOW/8678-SESSION/8682-RETEST one-line increments, print-only).
Seed BORN (after ANCHOR_ELECT, inside IDLE block). Promotion (after IDLE close, top-level; BUG: past seed-block early returns - see defects).
ALIVE (after B196BAR close; foreground-only; InpDebugLog+inWindow+held).
Order guard + ORDER (before ALERT branch; latched signal values; gates on file).
P2: braces 0/0; markers once per site; compile 0 errors 0 warnings (14494ms).
```

## Part T runs (one session; dates written + read back each; leftovers stopped by PID)
```
RECON62-B200 WMI 15:30:27 term 21120 PRE 14859210; window EURUSD read back; ex5 pre 4b0f806b/c82f175e; launcher killed post-verify (EURUSD replay); pass 0:03:52 DONE PASSED 15:36:17 (563338/3168 fingerprint). B200POT 659 in segment.
JUNE0525-B200 WMI term 21540 PRE 15918995; launcher killed; pass 0:03:47 DONE PASSED 15:44:09 (740873/4320). DONE stamps corrected to log time (owned x3).
GBP0629-B200 WMI 21528 term 22300 PRE 16897288; slow start (terminal up 15:50, owned); launcher killed post-verify (GBPUSD replay); pass 0:05:44 DONE PASSED 15:56:07 (1386092/4320).
ex5 post-batch IDENTICAL. D: ~129 GiB free. No terminal64 at close.
Filed tables: RECON 14/14, JUNE 8/8, GBP 2/2 byte-IDENTICAL DEALS (hashes in grade log). STOP: none (no ADDS/MOVES/lost; tags present; ex5 stable).
Cut: markers at journal lines 14859211/15918996/16897289 (PRE+1 exact); CUT_B200 x3 + 9 window packs + 41 day files + 3 DEALS; TAGSET 49 (B196 vocab + B200POT/B200SESS).
```

## Part P proof (cut only)
```
P1: 234 END rows (69/79/86, all HIS-RULE) join 1:1 (A6REFUSED/B182DEC/B196SLOT-ABORT/PREEMPT; 5 S1pre-PREEMPT pairs + 1 A6-dedup duplicate hand-verified after joiner fix). Genuinely unmatched: none. PROVEN.
P2: 0 2025-dbar rows file-wide (orientation). Trial names regular-bullish 14:15 (ALIVE LONG 14:30 pl=1516; UJPROBE latestNZ=1 14:25-14:55) + regular-bearish 14:00 (ALIVE SHORT 14:20 pl=1430; CQDRECHECK pattern kept). PROVEN.
P3: 10 July NO END row (seed parked 14:25 dormant; verdicts across UJPROBE/CONFIRMPOLL/REGIMECENSUS/ALIVE-LONG rows, none ending the seed) -> NOT PROVEN as written. 4 June PROMO pl=1121 + triple PROVEN. 2 June silent rows PROVEN. 9 June LTF/fresh ENDs PROVEN. 2 Sep TP_RR + FOMC verdicts PROVEN. 6 July TP_ELECT R=0.50/0.03/0.25 + 1R-FLOOR ENDs PROVEN. A rows ORDER 12/12 PROVEN. P3 NOT PROVEN (one check).
P4: MACHINE-ONLY ends 0/0/0 (HOLDER_EXPIRED 0 rows vs 16 kept; YIELD prints kept x5; RESEED 74/PREEMPT 12 foreground-identical). Removal dynamics: +6 RESEED/+10 LTF/-4 SEEDBIAS (persist-past-expiry evaluations dying HIS gates; takes untouched). Nothing left to name.
Verdict: T no STOP + P1/P2 PROVEN + P3 partial -> RESTORED with reason first.
```

## Defects owned (filed here; hunk text in .B200K + this slice)
```
D1 promotion unreachable: promotion block sits past the seed block's early returns (WINDOW/SESSION/RETEST returns exit before it); IDLE+no-retest bars never promote. Parked potentials never resume (F3 SHORT parked 14:25 dormant to close; ONE_TAKE_LOST-from-promotion 0 rows). Fix: move the promotion call into the no-retest path (fall through to evaluation below); one-block move, no recompile spent (one-compile rule kept).
D2 P3-10-July literal-END unsatisfiable: no HIS or MACHINE end exists at 14:50 for a regime-NONE persisting seed (S1WAIT retains by his rule); demanding ev=END there contradicts K2's taxonomy. Re-scope to content-proof (ALIVE/divergence/touch/regime rows at 14:50 exist).
D3 joiner regex order (side-after-rule) missed PREEMPT matches; corrected + hand-verified all 6.
D4 DONE stamps guessed ahead twice + GBP slow start; corrected to log time same turn.
```

## Records
```
X1 CONTEXT-4 +1 (B200 lesson 0->1 verbatim). X1b section 5 +1 Brain B-200 (0->1).
X2 HANDOFF-3 +1 B-200 arc (0->1, RESTORED). X3 ledger 1346 (0->1, ^1345. stays 1; banking bytes 163706).
X4 pointer rewritten (32 lines). F5 stages 8 files (no ROWPACK on RESTORED). F6 rev-parse/push/ls-remote.
Trial kept: .B200K + compile_b200_ea/restore logs + CUT_B200/ROWPACK-B200/STATUS/DONE/inis/scripts, all unstaged.
```
(End of slice)
