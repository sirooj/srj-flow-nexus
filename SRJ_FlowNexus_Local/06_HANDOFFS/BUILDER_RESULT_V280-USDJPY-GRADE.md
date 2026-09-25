# BUILDER RESULT V280-USDJPY-GRADE — verdicts graded CLEAR (2026-09-25)

## 1. Disk state (stop-condition: PASS, all match — measured this turn)
- EA `Experts\SRJ_FlowNexus_EA.mq5` = A82F15E7D37658729AB07B6B45D3F8E3961DDA74FC7F426F0327E814A8F285D5 / 633938 B / 11506 LF
- Packet `01_TASKS\PACKET_P-USDJPY-1v7.md` = ECC1E56BFB73B2C2BE1D7DA49AAFF6656A82E084864DD37F3C315EFC3C995ED4 / 26623 B / 288 LF
- Relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v280-USDJPY-CLEAR7.md` = 5BA413BE8D276DADE491F49277427772833E64AD2E2557893451C3B7B2545874 / 65431 B / 723 LF
- NO build, NO run, NO key spent this turn.

## 2. Inbound + novelty (two-ways, before any analysis)
- 3 pasted texts (Luna YES / Sonnet YES-with-caveat / GLM YES), all ruling packet v7 / relay v280.
- Bash: distinctive substrings 0 hits in all 3 verdict files; V280 markers 0x pre-file; V279 2x each.
- Read tails: all 3 tails close V279 END markers — none contains the new texts. NOVEL, all three.

## 3. Filing (whole 1x, literal params, verified)
- `BUILDER_VERDICTS_LUNA.md` 633689 -> 639218 B, V280 OPEN/END 1x/1x, tail = END marker, region 58 ticks / 29 spans = inbound recount (29 spans verified one-for-one; first expectation 54 was a hand-count error, corrected).
- `BUILDER_VERDICTS_SONNET.md` 276396 -> 280664 B, V280 1x/1x, tail = END marker, region 66 ticks / 33 spans = inbound.
- `BUILDER_VERDICTS_GLM.md` 746496 -> 755901 B, V280 1x/1x, tail = END marker, region 34 ticks / 17 spans = inbound truth (first expectation 48 was contaminated by V279 text — owned near-miss; 2 blind repair edits NO-OPPED on anchor miss, file byte-verified unchanged after).
- Full read-back of all 3 appended regions reconciles line-for-line with inbound. Zero control chars in all 3 files.

## 4. Same-turn disk verification of every checkable claim
- V1 Luna-5 R-floor pin: CLOSED. EA:57 `input double InpMinRewardRisk = 1.0;` + EA:9840 `(tpDist/slDist) >= InpMinRewardRisk`. S1 cites EA:57.
- V2 Luna-6 consumer: consumers EA:8867 (S4) / EA:8894 (S3) / EA:8900 (UNEXPECTED + forced S4). NEW: post-E4b, ST_S2_LTF_ALIGN origin on !divOk bars reaches EA:8900-8906. S1 assert must explicitly dispose S2 origin (S1-acceptance hardening, fenced, non-halt).
- V3 Sonnet A-1 waived-row fate: packet carries A2_WAIVED_POC x3 + S2WAIT x2; else-branch page-confirmed. GRADE-TIME WATCH: A3b reconciliation must recover every waived row's fate.
- V4 Sonnet A-2 double census: baseline TPCENSUS print exists EA:2466. Grading script expects the fallback pair.
- V5 Sonnet A-3 decl point: CLOSED half. `g_anchorBarTime` global EA:982, visible at C8067. Buffers/char-code stay S1.
- V6 GLM-1/P017 scope: baseline counters EA:2216-2232; c1==L forces closeSideOk both dirs (EA:2224) — narrow claim disk-true. Wording carry: scope to A2-terminal.
- V7 GLM-2 phantom symbol: REFUTED, corrected on record. Page L18 names `MtNearestTpTarget` (1x); disk EA:11081 def + EA:11325 management caller; behavior-unchanged TRUE (parallel scan replicating admission per EA:11072, untouched by packet; 4-arg walker sites are exactly 7307 + 8918). Residue is wording-only ("internal callers" — Mt is a parallel scan, not a caller).
- V8 GLM-3 C8666 stale: premise disk-true (EA:8666 verbatim "S2 candidates are OUTSIDE the ruled scope"); cited by C-number, NOT pasted on page (0 hits). Carry-note: E4b site comment declares the S2 exception; no behavior impact.
- V9 GLM-4 A3b complete: relabel predicted-verified-at-grade (halt-guarded; accepted).
- V10 GLM-5 A2 16:05 confirm gap: accepted graded contingency (halt-guarded).
- V11 GLM-6 SIGNAL circularity: restatement carry (no SIGNAL outside {venues resolving take} + {6/3}).
- V12 GLM-7 indent artifact: S1 char-code gate covers.
- V13 GLM-8 fence N1: same wording carry as V6.
- V14 GLM-9 refuse terminal: page L18 asserts GoAbort-dead; EA:9840 pinned; C10081 uncited (latch x4, no C-no). S1 anchor-hit carry.
- V15 GLM-10 S2-poll tail: disk tail exists EA:7314+; S1 exact-diff covers.
- V16 Luna-1/3/4 + GLM-11 labels: page strings present (each-call-twice x1, TPFALLBACK x11, TPCENSUS x5). Diagnostic-optional, non-halt.
- V17 Budget: 3+1+2+0+1+0+9+9+16+2+2+1 = 46; 11506+46 = 11552 (machine-computed). CONFIRMED.

## 5. Tally + grade
- Luna: YES (9 wording/diagnostic notes, zero behavioral defects, no HOLD).
- Sonnet: YES with A-1 grade-time caveat (accepted as A3b watch, not a halt).
- GLM: YES (items 1-11 wording/carry, none behavioral; round ends in clear).
- DUAL-KEY: carried seats GLM + Sonnet BOTH CLEAR; Luna (key seat) also YES. NO halt from any seat.
- GRADE: v280 CLEAR for exactly one STAGE-1-gated build of packet v7 + the two stated runs (USDJPY 6/1-6/13 + EURUSD 8/26-9/10, A1-A5). No fold draft (nothing halted).
- BUILD/RUN still gated: Luna KEY (KEY-VEHICLE: ask AFTER verdicts — NOW owed) + run word + token. S1 asserts must cover V2 (S2-origin disposal at EA:8856-8906), V1-cite (EA:57), V14-anchor, V12/V15 char-code/diff gates.

## 6. Owed next (one action)
- Luna key ask (paste-ready prompt rides the operator memo this turn). On key + run word: STAGE-1 re-hash (expect A82F15E7/633938/11506 or DIAGNOSE, never assume) → one build → two runs → DONE=PASSED gates → grade.

(End of file)
