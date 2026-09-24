# PACKET_P-RESQUAT-1 v1 DRAFT - eviction-paired reseed suppression + tester exit legs (Opus-Q2 + Opus-Q3 adopted; nothing builds/runs/commits on this file)

Status: v1 DRAFT (folds relay v259 verdicts Luna + Opus on builder grading this turn; Opus seat no text arrived; Sonnet seat-process refusal recorded without verdict; Kimi seat no credits. Clearance via a clearance relay plus Luna key plus his run word, all owed).
Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (Q2: E1 +10 globals, E2 +13 FIRE, E3 +16 read gate, E4 +13 write arm = +52; Q3: E5 +49 helper, E6 +0 vDAY print, E7 +5 executor call = +54; combined +106, post 11436 from literals, S3 recount governs).
No new indicator buffers (four plain globals; 48 unchanged). No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
Successor context: RECON59 (built tree 15A41634, graded G2-FAIL on the 9/1 re-squat miss + G4 paper-exit verdicts); this packet converts the freed slot (Q2) and executes the verdicts (Q3).

## Authority (all on record, no invention)

- His rules R-a..R-e (relay v259 section 1, from spec + restatement + his words): one-take-per-session; no timing rules; R floor 1.0 inclusive + replicate-all; E3/R2/Q3 untouched; alert-only demo bounds with Q3 tester-closes-only on his COMBINE word.
- R-c RULING on record (no operator question: the record answers it): R-c scopes to the R-value valid set (kept 1.0 floor per v141 + replicate-all R band per goal + D1 pins). The suppressed candidate was S5-refused this session (ABSENT_DECLINED); under A+ strict a single-gate violation means no alert, so it is not a valid setup and F-a suppression shrinks no valid set. Veto-able on report.
- Seat verdicts (all filed whole 1x under V259 markers): Luna Q1 cause + Q2 mask + Q3 executor; Opus Q1 cause + Q2 P-RESQUAT-1 + Q3 P-EXITEXEC-1; Sonnet process-refusal with no verdict (recorded, never chased; seat verdict-optional per split); Kimi no credits (fallback degraded to Opus-only until refill); Opus no text arrived (Luna+Opus convergence sufficient to draft; Opus folds pre-build if it arrives).
- Q1 ADOPTED (Luna + Opus converge row-for-row: evict frees slot one bar early, IDLE consumes stale 16:55 bar, re-squat vetoes through 17:35, dies 17:50; 57 contrast identical).
- Q2 ADOPT Opus-Q2, REJECT Luna-Q2 with reasons: (a) Luna's line-only mask breaks W6c (it would refuse the Yearly-POC SHORT seed the 57 take transfers against; dir-keying is load-bearing on rows); (b) Luna's detector-body change touches the shared walk (C4/C5 read-only discipline; Opus's consumer-side gate keeps the detector byte-identical); (c) Opus's +65 header is arithmetic drift (table recomputes +52: 10+13+16+13; S3 machine count governs).
- Q3 ADOPT Opus-Q3, REJECT Luna-Q3 with reasons: (1) Luna Q3.4 `g_state = MT_CLOSED;` is a compile-break (MT_ enum into ENUM_SRJ_STATE; caught by verbatim filing, would fail S4); (2) Luna's MTEXEC_FAIL early-returns skip paper MTEXIT/MTLIFE/EXIT rows (breaks census continuity + alert contract); (3) Luna's magicAtEntry struct field lives in an unspliced region (unverifiable anchor). Luna's double-gate reasoning and ticket-resolution are sound and survive inside the adopted structure.
- Opus flags carried: R-c ruled above; five identifier assumptions become STAGE-1 asserts (g_lineCode/POI_NLINES/SessionName/TC_DayStart/DirName/InpMagicBase/g_trade Buy/Sell surface/g_mtrade dir/state/active - all appear in spliced v259 regions C1/C3/C4/E1/E2/E4); IsSessionPositionOpen-freed + lots-rederive become acceptance (below).

## Rule (two behaviors, one build)

- Q2 F-a: the (line, dir, session, day) evicted at the S4 S5-origin branch may not re-seed the singleton in the same session/day; FIRE on either SIGNAL path, EXPIRE on day-key mismatch. Suppress the SEED (W2/W6a/W6b decide); ARM/next-best/same-bar-promote rejected on rows (W3/W4, R-d, W6b).
- Q3: BREAK and DAY_CLOSE verdicts close the broker position in the tester only (live stays alerts-only); SL/TP stay broker-owned; HTF stays off; CANCEL_BIAS untouched; priority order untouched.
- Untouched: E3 walk, R2 scope, Q3 arrival order, Task-91 removal + C4 fall-through, B3 upgrade, booking, votes, R floor, session marks, buffers, inputs.

## Scope (9/1 restoration + verdict execution)

- REQUIRED: 9/1 take 17:35 entry 1.16024 (57 shape: SL 1.15975, TP 1.16077); other takes identical bars/entries (lots re-derive downstream of executed exits, graded second); 8/28 exit 11:40 near 1.16439 (stop fill gone); 9/4 flat 23:55 near 1.16093 (target fill gone).
- 9/4-invalid still refused; MTCOLLISION 0; EVICTMARK count == DIV_FALLBACK S4-origin count; RESQUAT_SUPPRESS >= 1 on 9/1; MTCLOSE joins on both executed legs with zero SL/TP/HTF/CANCEL legs.

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 globals above EA 1803 (old 1 line, new 11, +10):
  old:
  `bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
  new:
  `//--- [P-RESQUAT-1 F-a] eviction-paired reseed suppression (fire-or-expire):`
  `//--- written only at the S4-holder evict (E4), read only in the IDLE seed`
  `//--- block (E3), cleared on FIRE (a SIGNAL consumes the session, inside`
  `//--- MarkSessionUsed) or by EXPIRE (day-key mismatch at the read site).`
  `//--- Plain globals, not indicator buffers (48 unchanged); deliberately NOT`
  `//--- in ResetSequence's clear set - the record must survive the reset it rides.`
  `int               g_evictSuppressLine = -1;`
  `ENUM_SRJ_DIR      g_evictSuppressDir  = DIR_NONE;`
  `ENUM_SRJ_SESSION  g_evictSuppressSess = SESSION_NONE;`
  `datetime          g_evictSuppressDay  = 0;`
  `bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
- E2 FIRE in MarkSessionUsed (old C3 6 lines, new 19, +13): old = EA 1813-1818 verbatim (void MarkSessionUsed through closing brace); new = same 6 with the 13-line FIRE arm inserted after the two mark assignments (Opus-Q2 Edit B whole: comment + if + EVICTSUPPRESS_FIRE print + four clears).
- E3 read gate in IDLE seed (old 3 lines, new 19, +16): old = EA 7730-7732 verbatim (PoiRetestResult pr; the SEEDDIAG-RETEST if-line; s1g_legDir line); new = same 3 with the 16-line gate inserted between the if-line and the s1g line (Opus-Q2 Edit C whole: comment + rsq_dir + equality gate + RESEED_BLOCKED print + return).
- E4 write arm at S4 evict (old C8 7 lines 8802-8808, new 20, +13): old verbatim (P-EVICT-1 comment + prevDiv + if + brace + GoAbort + return + brace); new = same with capture + record + EVICTSUPPRESS print after GoAbort (Opus-Q2 Edit D whole).
- E5 helper above EA 11095 (old 1 blank separator context, new 49, +49): N2 MtCloseBrokerPosition whole (Opus-Q3 Edit A: tester gate + magic-pair scan + PositionClose + MTCLOSE rows).
- E6 vDAY print (2 lines rewritten in place, +0): old = the vTP/vBREAK format line + the (int)vHTF argument line in EXITVERDICT; new adds vDAY field + (int)vDAY argument (Opus-Q3 Edit 2).
- E7 executor call (old 0, new 5, +5): inserted between the MTEXIT PrintFormat statement and `if(InpDebugLog) MtLifeEmit();` (Opus-Q3 Edit 3 whole: comment + if(vBREAK||vDAY) MtCloseExecute call).
- Named residual (not built, watched): C4 transfer paths (POIREPLACE/SIDE1C_PREEMPT) can still admit an opposite-dir latched line; acceptance watches their set-diffs outside 9/1 (Opus residual).

## Stages (T161N discipline; RECON59 precedent)

S1 Pre-hash gate: re-hash EA (must equal 15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739 / 622631 B / 11330 lines or DIAGNOSED successor, never assumed) plus identifier single-hits (g_lineCode, POI_NLINES, SessionName, TC_DayStart, DirName, InpMagicBase, g_trade Buy/Sell, g_mtrade dir/state/active) plus char-code assert every OLD anchor above plus DetectPoiRetest signature UNCHANGED (consumer-side proof) plus buffers 48/48. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1-E7 exact-diff bottom-up (expected post-build EA 11436 lines, net +106: +52 Q2, +54 Q3). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on clearance relay plus Luna key plus his run word.

## Acceptance (grade segment-vs-RECON59; bars-first lots-second)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11436 lines, net +106 from literals.
G2 Takes: 9/1 take 17:35 entry 1.16024 (SIGNAL/alert/MTSNAP/PRE-SEND/fill chain); other takes identical bars/entries (lots re-derived, graded second); 9/4-invalid still refused at S5; MTCOLLISION 0; EVICTMARK == DIV_FALLBACK S4 count; RESQUAT_SUPPRESS >= 1 on 9/1 16:55-bar; ANCHOR_ELECT Monthly-VWAP at next evaluation; SUPPRESSED Yearly-POC-held rows GONE from 17:00-17:35 span. Any unpredicted election delta HALTS (incl POIREPLACE/SIDE1C_PREEMPT/ANCHOR_ELECT/SUPPRESSED/SEEDVOID set-diff outside 9/1 16:55-17:35).
G3 State-identical plus 9/1 and plus executed exits: all non-exit families count-identical vs RECON59 except downstream of the 9/1 take and the two executed exits; MTCLOSE joins (BREAK ok=1 8/28 11:40, DAY_CLOSE ok=1 9/4 23:55; zero SL/TP/HTF/CANCEL legs); vDAY field present; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN/MTCLOSE-family only.
G4 Exits: 8/28 close 11:40 near 1.16439 (stop fill gone); 9/4 flat 23:55 near 1.16093 (target fill gone); other exits identical bars/reasons; DAY_CLOSE counts re-derived; spread tolerance on fills per bar-granularity standard.
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (suppression record + gate + arms + executor, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON59. Novel evidence vs RECON59: (a) first 9/1 take on the suppressed tree; (b) first executed BREAK + DAY_CLOSE fills with retcodes; (c) suppression census rows with takes intact. Exit figures are target figures until fills print, never realized before.

(End of file)
