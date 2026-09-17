# CODE REVIEW REQUEST — v139 — 2026-09-17 (trace evidence CORRECTED: relay typo owned, rows machine-pulled; same text to EVERY model)

Change (one plain sentence): v138's row table carried my transcription typo and is withdrawn as evidence — the rows below are pulled byte-verbatim from the journal by script, and on the corrected rows the selection traces 3/3.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` / S5 shadow+reference emission / L9657-9686 (byte-exact fence in v136 `B11F53F9` and v138 `8ACC2498`, unchanged; rewire L9556-9604 same)
Source digest: SHA256 `E5B97B36` / 597425 B (landed, committed, both remotes verified).

What was wrong (owned, no hiding): v138 typed row 3 as liveR=0.02 with an invented token that exists nowhere in code or log — the journal row reads liveR=0.05. Both seats flagged the resulting contradiction correctly against the page they were given; the page was wrong, not the code. Correction method this time: the six rows below were written into this file by script straight from the archive, never retyped — verify them against `RECON45_EXTRACT.txt` (SIDE1X rows lines 5, 8, 17; shadow rows journal-only) and the archive (`70CE840F`) yourself by matching text.

Complete code, verbatim, no elisions: none re-carried — unchanged since the two byte-exact fences; the only code fact used (SIDE1X liveStop==slRef rewired value; ruleStop==s1-read by construction at emission) is quoted from lines already filed whole.

Run rows, raw (machine-pulled, byte-verbatim):
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.08.28 16:20 dir=SHORT s0px=1.16503 s0slot=5 s0imb=1 s1px=1.16508 s1slot=118 s1imb=0 sel=0 r0=0.19 r1=0.18 liveSl=1.16503 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.08.28 16:20 dir=SHORT entry=1.16430 liveStop=1.16503 ruleStop=1.16508 ruleSlot=118 ruleImb=0 liveTp=1.16416 liveR=0.19 livePass=0
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.04 10:35 dir=SHORT s0px=1.16289 s0slot=1 s0imb=2 s1px=1.16299 s1slot=13 s1imb=2 sel=0 r0=0.54 r1=0.38 liveSl=1.16289 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.04 10:35 dir=SHORT entry=1.16265 liveStop=1.16289 ruleStop=1.16299 ruleSlot=13 ruleImb=2 liveTp=1.16252 liveR=0.54 livePass=0
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.08 16:40 dir=SHORT s0px=1.16274 s0slot=4 s0imb=1 s1px=1.16359 s1slot=91 s1imb=2 sel=0 r0=0.05 r1=0.02 liveSl=1.16274 livePass=0
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.08 16:40 dir=SHORT entry=1.16213 liveStop=1.16274 ruleStop=1.16359 ruleSlot=91 ruleImb=2 liveTp=1.16210 liveR=0.05 livePass=0

Check per bar (rule: s0 iff s0imb>0 else s1): all three bars show s0imb>0, sel=0, liveStop==s0px, liveR==r0. Corrected row 3: liveStop=1.16274==s0px with liveR=0.05==r0 — consistent, like the other two. Luna's structural point stands as filed (ruleStop is always the s1 read by construction — it was never the selection evidence; the evidence is liveStop==s0px plus liveR==r0).

Question (one, specific): on these corrected rows, does the trace evidence close the stopfix proving with no run, or is a flip-window run still required — any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
