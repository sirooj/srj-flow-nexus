# CODE REVIEW REQUEST — v140 — 2026-09-17 (cross-run selection proof + TP interaction; same text to EVERY model)

Change (one plain sentence): across two binaries on the same window, the live stop moved onto rule-side values on both flip seeds — the rewire changes live selections as designed — while the cleared TP move shrank both seeds' reward below the flip threshold.

File / function / lines: no code change — `Experts\SRJ_FlowNexus_EA.mq5` rewire L9556-9604 (byte-exact v136 `B11F53F9`, landed `E5B97B36`, committed, both remotes verified); pre-rewire run RECON40 vs post-rewire run RECON45, same 08-26→09-09 window.
Source digest: landed SHA256 `E5B97B36` / 597425 B. Pre-rewire archive `RECON40-STOPSHADOW_JOURNAL.log` (7243113 B); post-rewire archive `70CE840F`.

Complete code, verbatim, no elisions: none re-carried — unchanged since the two byte-exact fences; the claim below rests on run rows, not new code text.

Run rows, raw (machine-pulled, byte-verbatim; DH = 09-04 10:35 SHORT, IE = 09-08 16:55 SHORT):
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.04 10:35 dir=SHORT entry=1.16265 liveStop=1.16379 ruleStop=1.16299 ruleSlot=13 ruleImb=2 liveTp=1.16224 liveR=0.36 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.04 10:35 dir=SHORT entry=1.16265 liveStop=1.16289 ruleStop=1.16299 ruleSlot=13 ruleImb=2 liveTp=1.16252 liveR=0.54 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.08 16:55 dir=SHORT entry=1.16220 liveStop=1.16379 ruleStop=1.16274 ruleSlot=7 ruleImb=1 liveTp=1.16114 liveR=0.67 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.08 16:55 dir=SHORT entry=1.16220 liveStop=1.16274 ruleStop=1.16274 ruleSlot=7 ruleImb=1 liveTp=1.16210 liveR=0.19 livePass=0

Read: DH liveStop 1.16379→1.16289 (rule-side); IE liveStop 1.16379→1.16274 (= rule stop). Both selections MOVED per the cleared design between binaries. Meanwhile liveTp moved against both SHORTs (DH 1.16224→1.16252, tpDist 41→13; IE 1.16114→1.16210, tpDist 106→10) under the separately-cleared promotion — so rule-R went 1.21→0.38 (DH) and 1.96→0.19 (IE): flips undone by TP, not by stops. Net register outcomes 14/14 identical; FL sole fire. Separate finding: DH is NOT his 8/28 setup (date mismatch — candidacy withdrawn; his 8/28 stays unmatched).

Question (one, specific): does cross-run selection-change evidence close the stopfix proving with the flips TP-conditional, and how should the TP-vs-stopfix interaction plus the three calibration misses (8/28 levels, 9/4 one-point R kill, 9/7 POI reads) be ruled — any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
