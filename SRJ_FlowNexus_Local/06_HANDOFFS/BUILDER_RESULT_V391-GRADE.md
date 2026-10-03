# BUILDER RESULT V391-GRADE - Sonnet + GLM + Luna verdicts filed, graded, folded to v3/V392

Round: V391 / packet P-RECON78-UJ-EXEC-1 v2 (SHA-256 `676F25C2C36776DBBEF0BC4F6E4DFDF8E46F5FE03367C60FECFA57DFBF3152A6`, 24719 B / 201 L).
No EA edit, build, tester run, commit, push, or live action in this block. RECON78 one-run grant stays consumed.

## 1 - Intake and binding

- Three complete replies pasted by the operator, novelty-proven unfiled (bash count-asserts: `V391`, `RECON78-UJ-EXEC-1`, `UJTPMODIFY`, `MTTPSYNC`, `676F25C2`, `v391-UJ-EXEC-1` all 0 hits in all three verdict files; plus Read tails).
- Filed verbatim, once each: Luna `BUILDER_VERDICTS_LUNA.md` OPEN 17258 / END 17494; Sonnet `BUILDER_VERDICTS_SONNET.md` OPEN 6436 / END 6551; GLM `BUILDER_VERDICTS_GLM.md` OPEN 9856 / END 9977. One OPEN/END pair each. One staging repair owned: a single transcribed Sonnet sentence corrected to the pasted bytes (`contradict P027 and P152`) before grading.
- Binding: Sonnet header names relay v391 + packet v2 explicitly; GLM names packet v2 + round V391 (CONTINUE) explicitly. Luna carries no version token and binds by content: its Q3 (June 11 S4_ARMED/LTFFLIP/UJDEFERABORT arbitration) exists only in V391 (V390 asked Q1/Q2 only), and it cites packet sections 6-8 matching the v2 P-block.
- Completeness: all three carry Q1/Q2/Q3 verdict lines, Ask A + Ask B, per-question closes, no build/run/key grant. Sonnet refusal rule never fired (all seats ruled).

## 2 - Grades

- Q1 broker-target sync: CONFIRM 3/3 (Sonnet conditional on a bounded packet for the crossed-branch + retry rules). Diagnosis settled: retarget touches only `g_mtrade.tpRef`; TP_TOUCH never calls broker sync; broker TP 160.723/159.900 survived on both instances. Mechanism settled to same-bar `PositionModify` at the retarget branch (Sonnet + GLM agree; Luna's managed-close fallback parked - it contradicts pinned broker-owned handling P024/P150-P152 and P027 exact-fill semantics, and needs an operator word to revive).
- Q2 16:15 refusal: SPLIT. Proximate refusal CONFIRMED 3/3 (`SEEDBIAS_REFUSED` at the 16:05 pass; the June 5 16:05 ABORT row exists on disk at SEG 13694 - the packet's P015 prose is supported, only the row exhibit was missing). Defect attribution SUSTAINED DISSENT (Sonnet, rule 19): the gate is input-correct on disk (UJPROV epoch tuple at 16:05; no UJRESEED anywhere on June 5 in 10 run-wide hits; seedBiasAl 0 at 16:05 then 1 with seedBT 16:45 at the 16:50 pass per SIDE1R_RGATE SEG 14043; the 6/9 09:45 keep carries the byte-identical epoch tuple and was also killed). Code cannot separate valid-16:15 from keep-silent-6/9 on these rows. No Q2 code edit. Owed: his 5m-series review of the 16:00 bar (was Al=0 rule-correct), plus print-only exhibits in v3.
- Q3 14:40 arbitration: CONFIRM 3/3, narrowed to the 14:35 pass (Sonnet's overreach correction adopted: 14:20-14:30 bars stay context, not defect instances - the SHORT was not yet flipped there). Mechanism: `wouldPreempt` is hardcoded to `(g_state == ST_S2_LTF_ALIGN)` at EA 7841, so an S4_ARMED holder vetoes every challenger by construction; the flip-killed holder vetoed before its deferred abort applied. Correction: same-pass reorder or pending-abort eligibility (GLM form b / Sonnet re-admit after UJDEFERAPPLY); stale `uj_saAbort` already clears at EA 8475. Downstream LONG confirmation + 14:40 deal remain unproven until a future run.

## 3 - Disk-proven page defects carried to v3 (both seats caught; Luna did not)

- P201 trailer stale (`total 132 lines` on a 201-line file; 132 + 69 spliced Q3 lines = 201). Fix in v3; twin of v2 stays byte-exact.
- P187 June-4 ABORT row spliced into the June-5 sequence unannotated; v3 exhibits the June-5 16:05 ABORT (SEG 13694-13695) instead.
- P009/register staleness: register section B header still reads NONE taken and row 1 keeps the v28/v29 cause although RECON78 took London 09:45; row 2 Refuse cell still cites R63 while RECON78 refused at 16:05 SEEDBIAS_REFUSED. v3 carries explicit old-to-new register corrections; applied only after V392 clears.
- EA has zero `PositionModify` (two-pattern count) with `CTrade g_trade` present once: the sync leg is absent, not broken.

## 4 - Fold

Packet `01_TASKS/PACKET_P-RECON78-UJ-EXEC-1v3.md` + relay `06_HANDOFFS/BUILDER_RELAY_COUNCIL_v392-UJ-EXEC-2.md` drafted same block (implementation review: Q1 sync spec, Q2 print-only + operator 5m question, Q3 same-pass reorder, full source exhibits, actual-deal predicates). Order per Sonnet: Q1 sync, then Q2 prints, then Q3 re-admission. Build/run/key words still need his explicit word plus a Luna key after V392 clears. Alert-only.
