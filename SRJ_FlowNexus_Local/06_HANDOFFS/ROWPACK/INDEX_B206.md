# INDEX_B206 - register rows to pack lines (seed, confirmation, divergence latch, entry; NONE where absent)
Pack lines are WEEK-file qualified (Wn:pack_line); pack_line restarts per week file. seed = B201FROM at the entry pass for the take side; confirmation = CONFIRMPOLL confirm=1 at the confirmation bar; divergence = B182DEC latch row at the entry bar; entry = DEAL row. EURUSD scope per his order (B/C/F rows measured but held unpublished; full record in local commit 594aef9).
- A1 (RECON62-B206T 2026-08-28 SHORT): seed 1:7656, confirmation 1:7590, divergence 1:7652, entry 1:7658
- A2 (RECON62-B206T 2026-09-01 LONG): seed 2:6680, confirmation 2:6610, divergence 2:6674, entry 2:6682
- A3 (RECON62-B206T 2026-09-04 LONG): seed 2:16669, confirmation 2:16606, divergence 2:16663, entry 2:16671
- A4 (RECON62-B206T 2026-09-07 LONG): seed 3:248, confirmation 3:181, divergence 3:243, entry 3:250
- A5 (RECON62-B206T 2026-09-07 LONG): seed 3:3322, confirmation 3:3257, divergence 3:3317, entry 3:3324
- A6 (RECON62-B206T 2026-09-08 SHORT): seed 3:5232, confirmation 3:5155, divergence 3:5226, entry 3:5234
- A7 (RECON62-B206T 2026-09-08 SHORT): seed 3:7743, confirmation 3:7675, divergence 3:7739, entry 3:7745
