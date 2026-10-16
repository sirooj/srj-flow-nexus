GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
GRADE RECON62-B249E: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B249E: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 3; MACHINE-ONLY ungraded 1; trades 17
GRADE RECON62-B249F: KEEP entries exact 2/7; KEEP exits exact 1/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 2
GRADE EU0525TD-B249F: NOT RUN (T3 gate: RECON-F 2/7)
# BUILDER RESULT B-249 - RESTORED (EURUSD): flip-renewal holds 25 Jun, loses 8 Oct; CQD diagnostic gated by kept crash
Trader summary: Your 25 June short stays refused and your 10 June long is now taken exactly. Your 8 October short still does not fire: letting killed blocks validate again did not bring back the bias flip that used to revive the flag. Your 19 June long still enters at 15:50: the test build crashed on 3 September on an old zone-list fault, before it ever reached June, so nothing about the 15:45 entry was measured. Every other take is unchanged. Both changes are undone.
## Relay order (B-249 EU-CLEAN 5 of 6; RESTORED)
- Part 0 on builder/B-249 cut at bce89a0 (backup exact; builder/B-249 absent pre-cut). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 bce89a0, gated diff EMPTY, kept + 9 .B248DK verified, tick STATIC 18678468, no terminal64, ledger ^1395-1397 =1, ^1398=0, C 16.5GB D 160GB. Tini touch-class ACCOUNTED. Part B: ALREADY_BANKED a5f79dc.
- Part G on today's truth: EU-B241D 13/15-12/15-4 + K19JUN/K10JUN MISSING; RECON-B242K 7/7-6/7-0; EU-B248D = EU-B248C = EU-B247B 13/15-12/15-3 + M12 (M8 graduated to K10JUN EXACT); RECON-B248D 7/7. G2 MATCH (K10JUN EXACT favorable unlisted). G3 fix: kept never fired 15:50 (M12 on kill-mark builds only) - carried note.
- Part K0 (TOOLS/job_k0_b249.py): K0a first differing bar 11:25 (kept code-8 flip; B248D none; 10:50 KS skips first); K0b ABSENT (no flip 10:00-10:50 either cut); K0c marker map on .B248DK; K0d INDICATOR-SIDE (CQD maxX2 = rates_total-3 writes 15:35 verdict once 15:45 exists; EA reads s=barShift down, no next-close wait).
- Part S: N25JUN silent via 5747-bearish-KS-held (in-bias); K8OCT lost only via missing 11:25 flip; all other rows B-vs-kept identical -> E SEPARATES, no STOP. Rule check quoted, no conflict.
- Part K/T: E = .B248DK + [B249E] validation-without-rearm split (2 sites; raw in slice); braces +2/+2; markers once per site; compiles 0/0 + 3 pre-existing warnings; .B249EK 9 verified (EA 8aa3869a, Flow cbcd25c7, OB 7b6f2a05). RECON-E PASSED 7/7-6/7-0; EU-E PASSED 13/15-12/15-3 + M12 (Test passed 0:41:28). F = E + renamed CQD copy (maxX2 -2, B249F print; his file untouched; diff = 2 hunks); compiles 0/0; .B249FK 11 verified (CQD 80f9ba95/4d46112a). RECON-F PASSED 2/7-1/7-0 (A1/A2 only) -> EU-F NOT RUN. ex5 pre/post all runs identical. Cuts once per run (b247 + B249 regex); grades raw in slice.
- Part T5: E 13/15 (K8OCT worse than kept) -> E RESTORED, first diff named (10:50 KS skip vs kept silent activation; 11:25 flip missing). F always restored; 19 Jun entry unmeasured. T6 restore verified (kept SHAs, 31 charts, tini, no terminal64). .B249EK/.B249FK unstaged. T7 fills: entries at bar open +/- spread (A1 +3pt FILL-EXACT stands).
## Final disk state
- Restored: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Types d542b458 + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5, terminal.ini from .preB249, 31 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B249.md (M12 defect; 10 Jun VALID/OPEN carried; 19 Jun closed).
## Record checklist (grep-verified in staged files)
- X ledger 1398 + pointer State B-249 + Lane 5/6: FOUND
- X EU_FIX_PLAN F2+F4a State B-249: FOUND
- G grades raw (6 files): FOUND in slice
- T DEALS x3 + cuts + grades + fill: FOUND
- Q batch M12 + carried: FOUND
## Carried note
- G3 fix: REVIEW_BATCH_B248 item 2's "machine-only on kept" is wrong: DEALS_EU0525TD-B241D.csv has no 19 June deal; the 15:50 deal fires only on kill-mark builds (B247B/B248D/B248C/B249E). Batch files are history, not edited.
- Cleanup manifest (his order): after push, delete EU0525TD-B248D + EU0525TD-B248C CUTs (superseded by B249 trial cuts); keep B249 cuts, kept baselines B242K/B241D, today's logs; manifest + free GB here.
- Next roads: flip-input restoration (counters/refOk gating starved by frozen validation, not the mark field); B176 T1 slot crash guard (kept code, timing-triggered); F4a/F4b open. No question to him.
- Next: planner decides.
