GRADE EU0525TD-B241D: KEEP entries exact 13/14; KEEP exits exact 12/14; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
# BUILDER RESULT B-248A - MEASURED (banking): 19 June valid + late-divergence reading
Trader summary: Your 19 June long is banked valid with the 15:45 open, and your 10 June evening long still waits for your setup-class ruling. The machine entered at 15:50, one candle after your 15:45, because its divergence latch only turned on at the 15:45 bar. The machine reads its divergence lines from the CQD indicator; it does not work them out itself, and nothing in it waits for the next candle to close.
## Relay order (B-248A addendum; MEASURED)
- Part B banked rules/54 verbatim (counts 0) + index + register NOTE + READ/REGISTER A/C/D/E regen (sha 47cab1c3) + ledger 1395 (all landed in B-248; verified ALREADY on this branch, nothing re-appended).
- Part G: truth K19JUN (15:45 open 1.14644, jl 22285746); grader patch (2 hunks); kept baselines re-graded on new truth (EU 13/14, RECON 7/7).
- Part R (EU-B248D cut, TOOLS/job_r_b248a.py): DIV19JUN_B248A.csv (90 rows); R2: EA reads CQD verdict buffer (iCustom EA:12465; latch EA:7024-7049, D130 EA:10394; no next-close wait NOT FOUND); R3: HTF10JUN_B248A.csv (ht=1/1/-1; London levels + sweeps; sweepTag=0).
- Part X/F: EU_FIX_PLAN F4a/F4b (landed in B-248); review batch carries both items (B-248 file).
## Final disk state
- No source touched by this addendum (banking + reading only). Kept build on disk per B-248 T4 restore.
## Carried note
- (a) The EA reads the CQD indicator's lines (it does not work out divergence itself). (b) No step in the EA waits for the second swing to be confirmed (NOT FOUND); the one-candle lateness sits between the CQD publish timing and the EA's settled reads.
- Next: B-248B (10 Jun valid, swing-confirm banking).
