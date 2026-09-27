# BUILDER_RESULT_V318-GRADE (2026-09-27; V318 verdicts graded same turn + V317-line fold v6/v319 drafted battery-pending)

## 1. Tally (dual-key: either seat halts; Sonnet none, parked advisory)

- IQ1v11: Luna CONFIRM + Astra OBJECT + GLM CONFIRM = 2-1 CONFIRM-majority, HALT (Astra blocks).
- IQ2v11: Luna CONFIRM + Astra OBJECT + GLM CONFIRM = 2-1 CONFIRM-majority, HALT (Astra blocks).
- Overall: HALTED. No build, no run, no key spent, none asked. Next: v6 packet + v319 relay drafted below, battery then transport ask on a later turn (draft/transport never mixed).

## 2. Filing proof (same turn; novelty pre-counts all 0/0)

- Luna V318-IMPL2-3 OPEN/END 1x/1x (file 829868 -> 835578).
- Astra V318-IMPL2-3 OPEN/END 1x/1x (file 1156089 -> 1163816).
- GLM V318-IMPL2-3 OPEN/END 1x/1x (file 1093070 -> 1100100).
- Tails read back verbatim; git diff insertions-only (+177/0 across the three files).

## 3. Disk verification of every checkable dissent claim (same turn; machine counts only)

- Astra #1 (memo provenance vs fire TP): HOLDS structural. Guard v5 P025 checks anchor+dir only (page-confirmed); UJADMIT publishes fire entry/SL/TP + memo wsrc/wday/wgen/wage (P045, page-confirmed); memo is single-slot, bar-stamped, written per pass (EA 7451-7457 poll route, 10374-10386 fire fallback, cleared every bar at 11962); uj_winnerSource rewritten by EVERY election (sole write EA 2401; calls 2488/2495/2503/11349/11356/11367). Permits fire-TP-X + memo-provenance-Y (same anchor+dir re-arm class). Remedy adopted: A9 publishes live fire provenance at admission (Astra's own proposed mechanism). Ordering proof: OnTick memo-clear 11962, probe 11963, entry pipeline 11964 (election->memo->fire->admit inline), managed loop 11969 (Mt elections post-admission); census uses locals (no UpdateBest call in 25xx-11xxx); so live uj_winnerSource at the pre-UJADMIT snapshot == fire election winner.
- Astra #2 (signal/fill pairs): HOLDS. P154 pins 09:05 signal only; P155 pins fill 09:45 only. Fold pins 6/3 09:05/09:10 (R01 ALERT at 09:10 pass + R02 MTSNAP bar=09:05) and 6/5am 09:40/09:45 (R07 CONFIRMPOLL bar=09:40 at 09:45 pass + latch C10409-C10410 + evaluated-bar convention R02/R07).
- Astra #3 (A-FB bar conflation): HOLDS, plus builder correction. Latch C10409-C10410 assigns fill=shift0/signal=barShift at the admission edge; evaluated-bar convention (R02, R07) puts the 16:15-pass admission at signalBarTime=16:10, fillBarTime=16:15. v5's "(signal-bar time 16:05)" WITHDRAWN as a mislabeled bar (owned defect): 16:05-bar-evaluated-at-16:10 is the fallback election-witness context (R09/R10 base-empty), never the admission record fields.
- Astra #4 (two touch predicates): HOLDS, disk-proven. Touch sets at TWO sites: leg path EA 8900-8904 (no print) and opposite-dir path EA 8924-8925 (E print). Progression-without-row is real, so the P156 alternative is not redundant prose. Fold: E2 prints at the leg setter (same row shape + anchor key) + single predicate (row with dir+anchor match at bar <= signal bar, on/before the signal pass); P156 alternative WITHDRAWN as redundant-after-fix (every setter prints).
- Astra #5 (findings gaps): HOLDS in part. Fold findings-v2 adds UJ-SIGNALBAR (wrong signal bar), UJ-IDENTITY (wrong direction/candidate), UJ-SUB1R (admitted tuple fails grade 1R recompute outside fallback); UJ-NOTOUCH redefined as touch UNPROVEN (row absent); UJ-DUPADMIT stays admissions-only; UJ-TIMEBASE stays wrong-fill; multiple findings may attach, one resolution per venue; a missing row fails the proof, never asserts non-occurrence.
- Astra #6 (UJ-FBDEAD phase): HOLDS. Fold: event = fallback election at the admission pass (16:15 pass evaluating 16:10): elects-nothing (-> NO_TP_TARGET path, no TPFALLBACK row) or sub-1R (-> SUB_1R abort row); linkage = pass time + LONG + anchor chain rows; never-reaching-fallback still fails, distinguished as UJ-NOPROMO vs UJ-FBDEAD by chain position.
- Astra #7a (MTSNAP R swap label): HOLDS. MTSNAP EA 10413-10421 carries no R field; the swap is on UJADMIT EA 10429. Relabeled (also answers GLM A1).
- Astra #7b (rf readFail): HOLDS. P111/P114/P117 emit 1 = read success. Relay wording corrected to read-success flags.
- GLM A2: HOLDS (same area as Astra #3/#6) -> A-FB rewrite above.
- GLM A3: HOLDS -> S2PROMOTE pins candidate-scoped (dir+poi+sess: SHORT/Daily-POC/LONDON).
- GLM A4: HELD but SUPERSEDED by a deeper builder catch (below): the 09:30-signal probe row EXISTS 1x in RECON71 (spliced as R18, mechanical 1x pull) AND its m15=-1.0 SHORT-aligned vote FIRES Fix C one pass before the v5 pin. No seat caught the trigger consequence.
- GLM A5: HOLDS -> R05 relabeled as retired-path tree-digest fact (S1 pre-hash), WITNESS definition amended to admit tree-digest facts.
- GLM A6: HALF-HOLDS. Byte-compare: A3 old fence EXACT (P22==EA10394, P23==EA10395, refuting the A-side -1 claim); B3b +1 space (P83-87 vs EA2567-2571), B3c +1 space (P94-96 vs EA2511-2513), E-old +2 spaces (P143-145 vs EA8924-8926). v6 re-emits all three byte-exact. STAGE-1 would have failed closed, never drifted.
- GLM A7: CLOSED by cite (SrjUjAssert1R EA-11768, UjDbl EA-11750, both disk-read; compile fail-closed stands).
- GLM A8: CLOSED (barShift in scope at the touch book, used EA 8909).
- GLM A9: HOLDS -> one-sentence reachability dependency added to A-POIV (+ mirrored A-FB note).
- GLM A10: NOTED (B2 shadows the C11363 skip; behavior identical, log-noise only; siting kept, dead-branch recorded for next audit).
- GLM A11: VERIFIED (v5 +46 recount matches GLM's independent recount exactly).
- Luna 1 (containing-M15): ADOPTED -> "containing-M15 time mapping" everywhere (packet P151 already honest-labeled; relay IQ1 line corrected).
- Luna 2 (surface): ADOPTED -> "external-interface surface unchanged" (no new buffers/inputs/handles/EA-side mirror).
- Luna 3 (memo narrower than tuple): ANSWERED structurally by A9 (memo stays evidence/liveness; admission provenance now fire-bound; doctrine sentence in v6).
- Luna B + GLM B1/B2/B3: STANDING RECORDED (centralization declined with cause; rank-parity fail-open-on-rename noted for a future audit; D-dedup declined with cause). No change this round.

## 4. Builder self-audit catch (no seat flagged it; caught by same-turn disk verification)

- v5 pinned "S2PROMOTE_M15 exactly once at 09:35". REFUTED on disk: the same SHORT/Daily-POC/LONDON candidate sat in S2WAIT seven straight passes 09:05-09:45 (journal census); the 09:30-signal probe (R18, m15=-1.0 == SHORT want) satisfies Fix C's edge at the 09:35 pass, one pass before the pin. S2WAIT bar=09:30 row (same pass, same candidate) proves the block ran there.
- Corrected pin: S2PROMOTE_M15 exactly once at 09:30-signal (candidate-scoped). Downstream PRESERVED: CONFIRMPOLL series is all-0 through eval-09:35 with first confirm=1 at eval-09:40 (journal series), so confirmation still lands 09:40 and fire still 09:45 (signalBarTime=09:40). S3 window widens by one bar (entry 09:35 pass); fail-closed on any S3 kill (-> UJ-NOADMIT). R06 stays (UJPROBE prints unconditionally every bar, EA 11963); R08 stays WITNESS (no S2WAIT 09:35).
- Owned as a builder defect (v5 pin authored without the R18 check); withdrawn above, corrected in v6, carried into v319 visibly.

## 5. Fold disposition (v6 packet + v319 relay, drafted same turn, battery + transport-ask on a later turn)

- Code delta vs v5 (all else carried byte-identical): A9 fire-provenance carriers + pre-UJADMIT snapshot + UJADMIT fire-wsrc swap (+6); E2 leg-setter UJTOUCHSEEN print with anchor key (+1); E print anchor field (0, line swap); A7 new-side fire carriers (0). v6 code net +53 (46 + 6 + 1, script-recounted from fences).
- Acceptance delta: pairs pinned (09:05/09:10, 09:40/09:45, 14:35/14:40 kept, 16:10/16:15 corrected); single touch predicate + correlation; findings-v2; UJ-FBDEAD precise event; R18 added; R05 relabeled; byte-exact old fences (B3b/B3c/E); signature/scope cites; reachability sentences; Luna wording; withdrawn-error list explicit.
- Withdrawn v5 lines (owned, never re-asked): S2PROMOTE-at-09:35; A-FB signal-bar-16:05; P156 progression alternative; MTSNAP-R label; readFail-flags label; containing-M15-source phrasing; bare surface-unchanged phrasing.

## 6. Gate statement

- Dual-key HALT stands (Astra OBJECT x2). No build, no run, no key, no money, no live activation authorized or spent. Next build still needs a new Luna key + council-cleared packet + his run word. EU sibling, quarantine questions, push credentials, and debris word remain owed him per the pointer.

## 7. Resume prompt (verbatim; new session starts here if compacted)

Resume SRJ Flow Nexus with relay v319 DRAFT-green UNTRANSPORTED (new session, awaiting transport ask + his carry + verdicts): EA 14C7476C/660687/11975 UNCHANGED (nothing built) + packet IMPL-2 v6 082F1EF2/27202/194 + relay v319 677736D2/62647/535; NO build, NO run, NO key spent (next build needs a new Luna key + council-cleared implementation packet + his run word); verdicts V318 filed whole (Luna IQ1v11-CONFIRM/IQ2v11-CONFIRM + Astra IQ1v11-OBJECT/IQ2v11-OBJECT + GLM IQ1v11-CONFIRM/IQ2v11-CONFIRM; Sonnet none); v319 carries IQ1v12/IQ2v12 (A9 fire-provenance + E2 touch print + corrected 09:30/16:10 pins + findings-v2) battery-green. On his pasted verdicts, same turn: novelty-check (bash count-asserts PLUS Read tail) + file whole 1x under V319 headers (markers 1x/1x + git content proof + tail read-back) + grade per-question with tally (dual-key: either seat halts) + same-turn disk verification of every checkable dissent claim + next fold draft if halted (battery-green packet + relay) + result commit + ledger + pointer + index. Stop-and-report mismatch condition: if EA hash is not 14C7476C/660687/11975 STOP and report BLOCKED with measured values before any grade.

(End of file)
