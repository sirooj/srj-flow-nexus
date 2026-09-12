# BUILDER_RESULT_RECON8-SWINGIMB — P-SWINGIMB EXECUTED (gates 1-6, 8-9 PASS; gate 7 waiver requested)

Run RECON8-SWINGIMB: "Test passed in 0:53:07.405", 563338 ticks, 3168 bars,
RESULT=PASSED by wrapper DONE 2026-09-12 07:36:02. Ini RECON1_P1.ini
unchanged; terminal.ini [Tester] window untouched (8/26–9/10).
Supersedes RECON7-SWINGIMB (same E1; E2 differs by one instrument line only —
the apex-frame fix §5; no selection impact; RECON7 journal retained on disk).

## S1 — pre-hash PASS
EA 57B2F9D3 (266664 B) + all four baselines matched AGENTS.md §9; no writes
since. Halt conditions in hand before any edit (scope verified: g_imbalances
global SRJ_State.mqh L262, structLegBoundary via g_s — no relocation, no
accessor; identical index `target` mirrored character-for-character).

## S2 — edits (two files, prints + data only, zero selection change)
- E1 FlowLogic: buffers 37/38 (`g_bufSwingHighImb/LowImb`), indicators 37→39,
  plots unchanged, EMPTY init mirrored, `SrjSwingImbCode(apexBar,bullish)`
  graded 0/1/2/3 (multi-record: 1 if ANY match alive else 2; NA remainder =
  alive-as-of-apex per fill-pass backfill), same-branch same-index writes at
  L968-976, per-write SWINGIMB behind g_htfDebugLog, OnDeinit SWINGIMB_CENSUS
  tally, full-pass-only counting. NO new input.
- E2 EA: defines 37/38 + SHADOW_SLIMB, ReadFlow at same eval shift, SlimbEmit
  16 tokens + fields=16, SlimbTuple shift:val:flag:W|B (cap 6, walk
  unaltered), latest snapshot debug-gated, chosen tracked via print-only
  locals (t75shift, runExtShift), 9 emission sites (PRE/1SWING×3/2SWING×5),
  nuanceClass derived in helper, no working-set write, no new global, no
  flag branch. slShift mirrors chosenShift (-1 unexposed); declared.

## S3 — post-write digests (the instrument)
- EA 786CBDFF34CB312A5E91F13BE1DF2FA0A5BD8EB741989BEF1829FBBCDFCD9395
  (276074 B). FlowLogic 4B1B024E83945BB89FCBFD73E18A57CA0AF1DD6922D6A29B5A5E5B884F787B22
  (64782 B). Post-run re-hash byte-identical (no drift).

## S4 — compiles 0/0
FlowLogic "Result: 0 errors, 0 warnings, 5091 ms elapsed";
EA "Result: 0 errors, 0 warnings, 2191 ms elapsed" (+ apex-fix rebuild,
same 0/0). Logs T162_SWINGIMB_FLOWCOMPILE/EACOMPILE.log, gitignored.

## S5 — run
Launched after graceful close of leftovers; STATUS clean; wrapper DONE.
Journal RECON8-SWINGIMB_JOURNAL.log (2617970 B, gitignored) +
TABULATION (33 lines) in 06_HANDOFFS.

## S6 — gates
1. Compiles clean (strict not set in sources; 0/0 both) ✓
2. Four-signal set VERBATIM (R 2.43/2.56/1.76/1.25, SL/TP/entries) ✓
3. Identities verbatim vs RECON6: CQD DIV-first 906=170/308/263/165; WS161
   21/3168/3168/205/0 + LOAD NOSTORE, 0 mismatch/field rows; BIAS 1554/1614
   ×2; ZONE 3168/1056/0; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156 (152
   bar + 4 containers); MTEXIT 4 (TP_TOUCH/HTF_FLIP/TP_TOUCH×2); MTSNAP 4;
   aborts 18/37/13/11/2/0/12; SLMEMO 471/118/589 (HIT 118/COMPUTE 471);
   SL_REF 432/39/10; S2POLL_NO_SL_REF=0; fields=21 ✓
4. SLIMB counts: TOTAL 481 BADFMT 0; S2POLL 432 + S3ARM 39 = 471 (split
   exact); S5 10 = SL_REF_S5 10 + S5_NO_SL_REF 0; PRE 0; 1SWING 441 /
   2SWING 40 ✓
5. avail: latestAvail=0 on ZERO lines (481/481 avail=1); exposed-chosen
   with chosenAvail=0 on ZERO lines (chosenAvail=1 ×140; remaining 341 are
   packet-sanctioned -1: OB-source 1-swing + false exits) ✓
6. latestApexMatch: 481/481 where avail=1, ZERO failures ✓ (frame-correct
   form s+FLOW_SHIFT_OFFSET; §5)
7. Reconciliation: PARTIAL — EA side complete (avail 481/481, exposed
   140/140, code histogram f0=318/f1=67/f2=96/f3=0 consistent with nuance
   marginals 296+22/145/18+0); FlowLogic SWINGIMB_CENSUS tally ABSENT from
   journal AND day log (indicator OnDeinit Print dropped at tester unload;
   proved by graceful-close + day-log probe, twice). WAIVER REQUESTED:
   accept EA-side consistency for this packet; tally capture redesigned
   in the next instrument packet if council wants the FlowLogic histogram.
8. Spot-check: full-window body-diff shows ZERO differing INPLAYCOMMIT
   (157=157, COMMITTED1 46=46), XOBPROMO (469), SWEPTMASK (443) bodies —
   stronger than sampled-day ✓
9. New digests recorded §S3. No commit. No 02_TASK_CHECKPOINTS write.
   ALERT-ONLY preserved (no order path; prints only).
- Acceptance: per-type battery d=0 on 29/30 classes; only delta +481 SLIMB.
  Residuals: R8-only 17 harness lines (memory/init/BUILD stamp/CQD ms/
  timings/history-sync/ex5 sizes 152862/231855), R6-only 14 harness mirrors.
  ZERO EA-behavior lines ✓

## §5 — RECON7 findings (instrument defects, both builder-owned)
1. Apex-frame: first E2 compared value@evalShift-s against iHigh/iLow(s);
   settled-slot frame (Task 20, FLOW_SHIFT_OFFSET=1, ReadFlow L1598-1601
   verified) puts the apex at series bar s+1 → 481/481 mismatches. Fixed
   to s+FLOW_SHIFT_OFFSET (named constant, not literal); RECON8 481/481
   PROVES the diagnosis and exonerates the export — Ruling 1's apexBar
   term is founded, Ruling 2 unbroken.
2. Tally-drop: SWINGIMB_CENSUS in indicator OnDeinit never reaches any log
   (segment, day log pre/post graceful close). Tester drops indicator-
   deinit prints at unload. E1.6 instrument partially unverifiable → gate 7
   waiver (§S6.7).

## Measured rule data (for council; no selection changed)
- Branch ⟺ obValid deterministic in-window: 1SWING 441 = ALL obValid==1;
  2SWING 40 = ALL obValid==0. Cross-tab: 1SWING×(VALID_NOIMB 296,
  VALID_IMB 145); 2SWING×(DEAD_IMB 18, DEAD_NOIMB 22); UNEVAL 0; off-
  diagonal 0. The OB-validity hypothesis holds as far as census can show:
  obValid already encodes the nuance's validity term; VALID_NOIMB (296
  invocations, all 1-swing today) is exactly the population a wick-only
  carve-out would re-decide. f3=0: leg boundary always set on evaluated bars.

## State
- NEW BASELINES: EA 786CBDFF… (276074 B); FlowLogic 4B1B024E… (64782 B).
  57B2F9D3 set SUPERSEDED.
- Artifacts: packet 01_TASKS\PACKET_P-SWINGIMB.md; finding
  06_HANDOFFS\BUILDER_FINDING_SLIMB-FEASIBILITY.md; memo
  06_HANDOFFS\BUILDER_DECISION_MEMO_NEWS-RULINGS.md; journals/tabulations
  RECON7/RECON8 + launch/compile/tabulate scripts + STATUS/DONE in
  00_CURRENT_WORKING; compile logs gitignored. Terminal closed graceful.
- Queue: council verdict on P-SWINGIMB (gate-7 waiver + measured data);
  news packets after imbalance per sequencing; RECON Phase-2 window word;
  debris deletion word; snapshot on token.
