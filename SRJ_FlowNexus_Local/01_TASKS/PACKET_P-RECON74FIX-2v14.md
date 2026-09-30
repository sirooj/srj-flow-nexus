# PACKET_P-RECON74FIX-2 v14 DRAFT - reseed-provenance telemetry (zero behavior; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v14 DRAFT (his Rebuild order 2026-09-30 + V354 rulings + RECON74 T2 reference rows; design: reseed-provenance carriage with observability, zero behavior change; base = v28 tree E516EBFF/684070/12291; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (4 insert sites below; indicator + FlowLogic untouched). No new indicator buffers, no new inputs, no new handles (all new lines read existing state/calls only); one new file-scope datetime + one set + one print + one clear (all 4 inserts, zero deleted lines).

## Authority (his words verbatim + disk, no invention)

- His Rebuild order (2026-09-30, verbatim: "Rebuild but refer to the older more correct build"). Amended point: the restoration reference is the v26 RECON74 behavior (T2 6/5 09:45 SHORT 159.948 R2.00 via BYPASS+PREBIND at the 09:40-bar, result file + segment rows below); the structural delta that lost it is the B2 kill (zero kills on v26, kills every SHORT seed on v28). Scope note: restore the 09:45 admission path while KEEPING the 8-June kill (T4 invalid winner must stay dead per NO-OVERFIT) - the exemption mechanism rides council route + key + run word, in that order.
- His touch-or-break rule (strategy s7, verbatim: "keep it either valid retest rouch or break with a candle body close", typos his): recorded as the E2 predicate candidate, PARKED with cause (one behavior change per round + EU sibling check attached; v14 is behavior-neutral by construction).
- V354 rulings ride by reference (Luna+GLM tallied: Q1 (a) kill-stands, Q2 union-(c) with (b) named changes; Sol trial + Sonnet advisory dispositioned; relay v354 330BEA9D/12935/90). GLM B-1 anti-flip shape + B-2 wrapper alternative + B-3 pins parked future; Luna B hardenings parked; Sonnet counterfactual parked pending chart.
- EU run ABORTED standing; the EU check rides a future word + key scope, never this packet.

## Record-first trail (spec + restatement + findings + journal + segments searched before council)

- Spec Part A v4.2: confirmation geometry lives in his later words (strategy s7 touch-or-break); section references ride the E2 round, never this telemetry round.
- Findings: RECON76 result (R05 reseed then R06 kill same pass; 09:40-bar confirm=1 on v26 feed identical) + V353 dissent dispositions (sess scope EA-6934/8045, no-prototype, 13 callers, S1-implies-anchor) + V354 dissent dispositions (R07 relabeled, estimate corrected).
- Segments: RECON74-V11-UJ (B802287F/7348717/37765; T2 route rows below) + RECON76-V28-UJ (FB7C37F9/6162087/32026; R05/R06 same-pass kill + 8/6 kill preserved).
- Journal: no new rows rule these venues (register B1-3 stand; UJ section turns to takes only through council-cleared packets).

## Death chains (reference behavior, all on-segment)

- REF-74-T2 (v26, 6/5 London SHORT 09:45 open 159.948 R2.00, TP_TOUCH 12:15): 09:05 REJECTed seed SURVIVED (S2SEEDBIAS_KILL 0x run-wide); S1->S2 via live promotion; 09:40-bar CONFIRM (oppCandle=1 bodyDir=1 body=7pts touchAttr=1 confirm=1); BYPASS 09:40 (m15=1.0) + PREBIND 09:40 -> ADMIT. Balance 10711.87.
- KILL-76 (v28, same venue, missed): H1 reseed 09:15 (al=0 ok=1, single row) then S2SEEDBIAS_KILL same pass (sb=0 inferred from the else-if predicate; the kill row carries bar/dir/poi only); kills at 09:30/09:35 bars (segment-resident, unspliced in v356 rows R01-R09); seed dead before the 09:45 pass so the 09:40-bar confirm never evaluates. Delta vs REF-74-T2 = the B2 kill alone (reads stable across builds: LTF-bullish both runs; indicator bytes untouched 956BF3E3).
- KEEP-76-68 (v28, 8 June SHORT silent): REJECT + S2SEEDBIAS_KILL 09:25 + ABORT SEEDBIAS_REFUSED (state S2_LTF_ALIGN). Must stay dead through every future round (NO-OVERFIT); v26's T4 invalid win (R3.47) never returns.

## Edit set (exact anchors; STAGE-1 censuses each; all inserts, zero deletions; convention: NET per site = added lines)

- FIX CARRY-DECL (provenance home, uj_memo block EA-302 class; splits memo_valid/anchor cosmetically, groups with memo_barTime EA-305 by role): insert the file-scope datetime after the memo-valid line.
```mql5-old-CARRY-DECL
bool     uj_memo_valid = false;
```
```mql5-new-CARRY-DECL
bool     uj_memo_valid = false;
datetime g_ujOpReseedBarTime = 0;
```
- FIX CARRY-SET (H1 post-overwrite; barTime in scope: EA-6931 EvaluateClosedBar param + v13-new-H1 g_anchorBarTime line + same clock as UJRESEED-bar (sole call EA-12280 passes barShift=1 with barTime==iTime(1))): record the reseed bar time.
```mql5-old-CARRY-SET
                 uj_memo_valid = false;
                }
```
```mql5-new-CARRY-SET
                 uj_memo_valid = false;
                 g_ujOpReseedBarTime = barTime;
                }
```
- FIX CARRY-PROV (S2 edge, before the B2 condition; barShift/g_dir/s1g_seedBiasAl in scope per the neighboring lines): print the provenance value at the decision.
```mql5-old-CARRY-PROV
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
```
```mql5-new-CARRY-PROV
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl);
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
```
(Specifiers 4 = arguments 4; unset reads 1970.01.01 00:00 = never-reseeded, self-describing.)
- FIX CARRY-CLEAR (admission consumes provenance; barTime in scope per the neighboring assignment): reset on admit (fires at tuple publication; a failed send after that point carries no reseed attribution - low impact, alert-only).
```mql5-old-CARRY-CLEAR
      g_mtrade.uj_admitBarTime = barTime;
```
```mql5-new-CARRY-CLEAR
      g_mtrade.uj_admitBarTime = barTime;
      g_ujOpReseedBarTime = 0;
```
- Lifecycle limitation stated openly (not hidden): abort/IDLE paths do NOT clear (no GoAbort touch this round); stale values read as old barTimes (visible-by-design). Reset discipline rides v15 with this evidence (GLM-B4 parked rule honored: demo first). v15 exemption will READ provenance at runtime at the S2 edge (join-insufficient for the exemption predicate); this telemetry round is required, not redundant.
- Settled-rules audit (strategy s6): CARRY lines are declaration/assignment/print only (no gate, no predicate, no promotion, no exit, no booking touch; S5.4/S3.3 run elsewhere; S5 election untouched; confirm-once/post-entry/booking pins unaffected - observation only).

## Acceptance (FIX-2v14 validation on a future UJ 6/1-6/13 run with InpDebugLog=true pinned; STAGE-1 exact-inserts the edit, S3 recounts the surface)

- Takes/balance/signals byte-identical to RECON76 (6/3 + 6/5-16:55, 10027.13, 2 signals; 8 June silent). Any take delta FAILS the round (behavior-neutral proof).
- UJPROV rows: SET evidenced by the same-block UJRESEED row (SET <=> UJRESEED 1:1); value-at-S2 per pass with freshness DERIVED by join to UJRESEED rows (raw value only on the row); S2 evaluation (every S2 pass, not edge-only; branch inputs via join to adjacent S2PROMOTE_M15/S2SEEDBIAS_KILL rows); admit-clear observed on takes where a later S2 pass exists (no dedicated clear print).
- H1-expiry zero (two-pattern proof); 16:15 detector gap carried; EU structural fence (no August run; RECON62 battery at build).
- Rule-vs-takes: nothing moves (telemetry only). Q2 battery: lifecycle demo rows (PROV set/clear/stale census) feed the v15 exemption design.

## Fold map (V354 verdict dispositions; every demand adopted, parked, or refuted)

- Adopted as telemetry: reseed-provenance carriage + S2-edge print + admit-clear (this packet); UJ-RERESEED predicate + arm-offline-derivation as grade procedure (carried, no code).
- Parked with cause: B2 exemption behavior (needs CARRY lifecycle proof from this run + his Rebuild direction + council ruling = v15); E2 touch-or-break predicate (his verbatim rule; needs EU sibling check + council ruling = v15 with exemption); anti-flip guard (needs carriage + his session word); wrapper alternative (own round); memo-reuse REFUTED (uj_memo_valid=false at the SET site proves the memo dead there); margin transparency + pass-summary + N1 exclusion + arm wording + mnemonics glossary (telemetry candidates, future rounds); 8-June counterfactual (needs his 8/6 chart or stays row-based); feed-tolerance policy (needs chart join, already no-divergence on 11 June).
- Refuted/declined with cause: blind v26 revert (returns the 8-June invalid winner; NO-OVERFIT bars it); B2 removal without exemption design (same reason); predicate-only 6/5 fix without the kill question (B_BODY-alone never admits: kill stands upstream).

## Budget recount (mechanical): CARRY-DECL +1 / CARRY-SET +1 / CARRY-PROV +1 / CARRY-CLEAR +1. Total NET +4 vs v28 12291; final tree 12295. EA cites pre-edit v28 throughout (DECL/SET +1 line shifts the S2 span +2, ADMIT +3 post-edit). S3 recount governs at build (no new inputs/buffers/handles - new lines carry none). Site census published: old-context 1x + new 0x at DECL/SET/PROV/CLEAR (battery asserts per old-block).

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~70-75m UJ June window (measured RECON75 55:38 + RECON76 72:30) + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON76: UJPROV rows (no prior run carries reseed provenance; set/clear/stale lifecycle visible per pass at the S2 edge).
