GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
GRADE RECON62-B244D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B244D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 1; trades 18
# BUILDER RESULT B-244 - RESTORED (EURUSD): dead-revival guard reads alive, 25 Jun fires, D3
Trader summary: Your 25 June short still goes through. The test confirmed the renewal block is your 10:00 block, but that block carries no killed mark anywhere: the early kill only flips a shared flag and never writes the block itself dead, and the live kill skips blocks that never turned on. So the guard reads it alive and the revival goes ahead exactly as before. One new evening take fired after the morning refusal; it needs your eyes. The change is undone.
## Relay order (B-244 F1/F2 25 June 4 of 6; RESTORED D3 NO-GAIN)
- Part 0 on builder/B-244 cut at 26e74a6 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 26e74a6, status 1083 (+B-243 artifacts ACCOUNTED, listed), gated diff EMPTY, kept SHAs + tini b64523fc touch-class ([Tester]/[TickLoad] intact, RECON dates), tick STATIC (10-06 18678468), no terminal64, ledger ^1390=1 ^1391=0. Relay tag/file numbering normalized B-243->B-244 (branch/ledger/runs are B-244; B-243 strings are slips, owned here).
- Part B: no new rule words (43 L7/L16 + 46 L4/L7 + 3.4 counts 1; line numbers verified).
- Part K0 (map in slice): H3 placeable at S3 site; S4 kill exists; code6 writer + guard mapped; per-block dead field COrderblock.isValid exists; renewal OB identity trial-measured. K0 passes (buildability, not outcome).
- Part K (K1 rule check in slice, no conflict): H4a at S4 pre (EA:8381) + H4b guard reads renewalOB->isValid in both branches (ImbalanceMgr). Backups .preB244 reconstructed from verified keeps (byte-exact). Braces EA +2/+2, Imb +2/+2; tags [B244S4] 1 + [B244RV] 2 prints. Flow compile 0 errors + 3 pre-existing warnings; EA 0/0. Trial EA 3a365eff/1683655e + Flow 662ebe05 + Imb fc4408f1; .B244K verified pre-run.
- Part T (EA + Flow ex5 pre/post both runs): RECON62-B244D window JL 7320959 verified, PASSED, grade 7/7-6/7-0 (T2 gate passes); EU0525TD-B244D window JL 8366145 verified, PASSED, grade 13/13-12/13-4 + machine 10 Jun 18:55. Cuts once per segment (TOOLS/job_cut_b244.py; regex repairs owned). D3 NO-GAIN.
- Part T6 (KILL_B244.csv, 1262 session rows + 10 FRESHCOUNT): 10:15 RV id5747 dead0 (renewal OB IS 5747); 10:35/10:40 S4 ob0/fvg1/opp0 adv1 HOLD; no S4 kill row (adv1). Deal diff: RECON none; EU 10 Jun pair gone + 18:55 machine pair new.
- Part T4 restored EA/Flow/Imb + 17 charts + tini from .preB244, SHAs verified; .B244K unstaged.
## Final disk state
- Kept: EA 18a1d49b/d85cf7d2 + Flow 61177aa5 + 5 includes + POI d47a0e68/04fcd8a5, terminal.ini b64523fc (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B244.md (10 Jun 18:55 item).
## Record checklist (grep-verified in staged files)
- X ledger 1391 + fixplan State B-244 + pointer State B-244 + Lane 4/6: FOUND
- T DEALS_B244D x2 + cuts + grades + KILL: FOUND
- Q batch 18:55 item (record-first): FOUND
## Carried note
- The next road is a per-block kill mark for H1b kills (so the guard can see them), or another 25 June road entirely.
- Next: planner decides on the record.
