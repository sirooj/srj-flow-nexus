# CODE REVIEW REQUEST — v143 — 2026-09-17 (TP fork: per-setup mapping vs family-pass; absence evidence; same text to EVERY model)

Change (one plain sentence): rule which fork returns his three family-TP trades — per-setup family mapping that leaves the 9/4 edge killed, or family-pass that fires 9/4 matching his take — given the family lines are priced in-run but not direction-valid at any of the three kill bars.

File / function / lines: no new code — `Experts\SRJ_FlowNexus_EA.mq5` TP selector carried whole in v142 (`06_HANDOFFS\BUILDER_RELAY_COUNCIL_v142-TP-PREFERENCE.md`, 195 lines, `66C07CCB`: L2217-2238 + L2249-2263 + L2265-2393, landed `E5B97B36`/597425/11127, committed, both remotes verified). Operative evidence for THIS relay is the six rows below, all machine-pulled byte-verbatim from RECON45 (archive `70CE840F`).
Source digest: SHA256 `E5B97B36` / 597425 B.

Rows, raw (machine-pulled, byte-verbatim):
[SRJ-EA] TPCENSUS #95 bar=2026.08.28 10:00 dir=SHORT close=1.16466 winner=YPML best=1.16459 distPts=7 empties=0 admitted= PDL:102 ASL:11 LOL:37 NYL:102 PML:7 YASL:11 YNYL:102 YPML:7 Monthly-POC:1042 Monthly-VWAP:602 Quarterly-POC:2132 Quarterly-VWAP:1588 Yearly-POC:1067 Yearly-VWAP:144 FOMC-POC:1098 FOMC-VWAP:793 
[SRJ-EA] TPCENSUS #102 bar=2026.08.28 11:35 dir=SHORT close=1.16455 winner=Daily-POC best=1.16451 distPts=4 empties=0 admitted= PDL:91 LOL:39 NYL:91 YNYL:91 Daily-POC:4 Monthly-POC:1031 Monthly-VWAP:588 Quarterly-POC:2121 Quarterly-VWAP:1574 Yearly-POC:1056 Yearly-VWAP:133 FOMC-POC:1087 FOMC-VWAP:780 
[SRJ-EA] TPCENSUS #348 bar=2026.09.07 09:15 dir=LONG close=1.16135 winner=YPMH best=1.16158 distPts=23 empties=0 admitted= PDH:196 ASH:65 LOH:8 NYH:135 PMH:23 YASH:65 YLOH:167 YLOL:53 YNYH:135 YPMH:23 Yearly-VWAP:180 
[SRJ-EA] TPCENSUS #376 bar=2026.09.07 16:40 dir=LONG close=1.16261 winner=YNYH best=1.16270 distPts=9 empties=0 admitted= PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 Yearly-VWAP:54 
[SRJ-EA] TPCENSUS #329 bar=2026.09.04 15:55 dir=LONG close=1.16018 winner=YLOL best=1.16188 distPts=170 empties=0 admitted= PDH:394 ASH:313 ASL:206 LOH:284 LOL:170 NYH:252 PMH:361 PML:234 YASH:313 YASL:206 YLOH:284 YLOL:170 YNYH:283 YPMH:361 YPML:234 Yearly-VWAP:297 
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.04 15:55 dir=LONG entry=1.16018 sl=1.15847 tp=1.16188 R=0.99

Read: Daily-POC is priced in-run (14 census rows) but absent at the 8/28 10:00 kill bar with empties=0 — above entry or single-bar read-fail; later priced 1.16451 at 11:35 (row 2) against his 1.16380, so his line matches no buffer at the kill bar. Weekly-VWAP is priced in-run (60 rows) but absent at both 9/7 kill bars with empties=0 — below entry or read-fail. The 9/4 15:55 census (rows 5-6, answering the review seat's caution): winner is the YLOL session line at 170pts, the ONLY family line admitted is Yearly-VWAP at 298pts, the held anchor sits below close out-of-direction — so admitting the anchor changes nothing (edge holds at 0.99), while a family-pass fires 9/4 at about 1.74, matching his booked take. Corrections to v142 answers, credited: the Luna line numbers are relay-relative, unmapped to file; the review seat's anchor-identity is wrong on 8/28 (anchor is Daily-VWAP, his target Daily-POC is not the anchor) though its arithmetic verifies clean.

Question (one, specific): which fork — per-setup family mapping with 9/4 staying a killed edge, or family-pass with 9/4 firing to match his take — with line numbers in the carried v142 code?

Answer form: plain fork choice + line numbers, or discrepancy with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
