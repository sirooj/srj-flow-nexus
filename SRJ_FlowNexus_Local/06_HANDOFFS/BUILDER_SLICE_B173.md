# BUILDER SLICE B-173 - raw rows (R4 census; none separates)

Base: builder/B-172 head 40ff72f on builder/B-173. Gate per result (EMPTY + disclosed +6; counts; SHAs; no terminal64). Kept B-170 packs + T-segments (T1 j3593832+, T2 j4138253+, T3 j4677071+).

## Part B (verify-only)

- L112 CONFIRMATION-CANONICAL; L143-151 relevance→retracement→confirmation; L254-255 B4 + must-never; spec 3.5 (no recency/bar-count) + 3.5.1 (order; fresh retrace+confirm if promoted later) + 3.6 (XOB touch permitted / FVG touch required + that-candle attribution) + 9.7 (0/12); OB-LEVEL-HIS L230-233; MOST-RECENT-XOB-TAG L241-244; L46/L51/L52.

## R1 2405 (rows)

- First naming: `IDCHANGE bar=2026.07.02 08:30 ... xobId=2405->2396 ...` (j=1445393); origin=2405: 0 hits (two patterns over j1078195-1556926, 52 hits total, rows2405 file B-169). Re-points: →2432 10:45, →2475 16:40 (1.33562-1.33684), →2815, →2646, →3029... S3PICK reads incl 18:10 (j=1447675/76).
- Range-match: `UJBARMAP bar=2026.07.02 06:45 o=1.32830 h=1.32832 l=1.32815 c=1.32823 ...` (j=1445011) == 2405 range. Formation print NOT PRINTED. NOT 2475 (his 16:20 XOB, dropped post-17:40, no kill row).
- promoT 07:00 (XOBPROMO raw=1782975600.0); midline NOT PRINTED; bullish old line needs obOpen — NOT PRINTED → number NOT PRINTED. Kill state 18:10: XOBINPLAY hits=0 (W1:6943) + INPLAYCOMMIT SWING (W1:6949).

## R2 PREBIND inputs (raw)

- A1: CONFIRMPOLL `bar=2026.08.28 10:00 anchor=Daily-VWAP dir=SHORT oppCandle=1 bodyDir=1 body=15pts doji=0 touchAttr=1 confirm=1` (W1:5499); ZONEPICK haveXob=1 (2149) haveFvg=0 (W1:5501); B60C cSrc=BOTH rt=09:55 (W1:5503); XOBINPLAY hits=0; S3→S5 10:05 (day pl=5504). Touch SHOWN.
- B2: CONFIRMPOLL `bar=2026.06.05 16:10 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=1 body=49pts doji=0 touchAttr=0 confirm=0` (W2:13276); ZONEPICK haveXob=1 (3308) haveFvg=0 (W2:13278); B60C cSrc=RETEST rt=16:00 (W2:13280); XOBINPLAY hits=0; S3→S5 16:15 (day pl=2129). Touch NOT shown; break unprovable (no line value); gate passed (fire).
- 2/07 trial: CONFIRMPOLL `bar=2026.07.02 18:10 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=2pts doji=0 touchAttr=1 confirm=1` (j=5046656); ZONEPICK haveXob=1 (2405) haveFvg=0 (kept W1:7037); B60C cSrc=BOTH rt=18:10 (kept W1:7046); NOINPLAYFINAL final=0 (j=5046694); S3→S5 18:15 (j=5046700) + `CONFIRM_PREBIND bar=2026.07.02 18:10 dir=LONG poi=Daily-POC` (j=5046701). Touch SHOWN.
- A1 PREBIND `bar=2026.08.28 10:00 dir=SHORT poi=Daily-VWAP` (j=2463267/4021500); B2 PREBIND `bar=2026.06.05 16:10 dir=LONG poi=Monthly-POC` (j=3034160/4595455).

## R3 heads (raw)

- A1: `B162ORIGIN ... bar=2026.08.28 10:00 side=S n=9 origin=2109 range=1.16505-1.16537 formT=2026.08.28 01:00 set=...2109` (W1:5495; 09:55 twin W1:5461); B152PR `z1=2109,S,...,2026.08.28 05:05,1,2026.08.28 05:55,...` (W1:5458). promoT print NOT PRINTED. Alive (in set). Direct NOT PRINTED (XOBINPLAY prints pick 2149 only). Head ≠ pick.
- B2: `B162ORIGIN ... bar=2026.06.05 16:10 side=B n=25 origin=3308 range=159.881-159.916 formT=2026.06.05 14:35 set=...` (W2:13270). Head == pick. Direct hits=0 (XOBINPLAY 16:10: j=997930/3034148/4595442).
- 2/07: `B162ORIGIN ... bar=2026.07.02 18:10 side=B n=8 origin=2367 range=1.32677-1.32799 formT=2026.07.02 00:55 set=...2367` (W1:7020). Head ≠ pick. Direct NOT PRINTED.
- W-L flips: 2/07 leg from bar 17:55 (UJPROBE day pl=1298 ltf=+1.0 after −1.0); comeback 06:45 OUTSIDE. A1 leg from 09:35 (UJBARMAP j=427240/2462956 +1.0→−1.0); A1 commitVia=none → no comeback → n/a. B2 leg from 16:05 (j=997697/3033915 −1.0→+1.0); B2 commitVia=none → n/a.
- A1 INPLAYCOMMIT `bar=2026.08.28 09:55/10:00 ... commitVia=none hits=0` (day pl=320/350); B2 `bar=2026.06.05 16:10 ... commitVia=none hits=0` (day pl=13243).

## S (REPORT/SEPARATOR_B173_JUMP.csv, 66 rows)

- HIS-ZONE-DIRECT: A1 UNKNOWN + B2 UNKNOWN → must-holds fail → DOES NOT SEPARATE; rest same/OTHER-GATE.
- PREBIND-TOUCH-OR-BREAK: A1 same (touch); B2 TAKEN→refused/UNKNOWN (touchAttr=0, break unproven) → must-hold fails; T0702 keeps firing (touch) → DOES NOT SEPARATE.
- HEAD-LIVE: all three heads alive → nothing refused → DOES NOT SEPARATE.
- Overall NONE SEPARATES. No bar-count/distance/size used.

## R5 (filed, no edit)

- HIS-ZONE-DIRECT not buildable (named-zone direct absent; XOBINPLAY pick-only EA:9279). PREBIND-TOUCH-OR-BREAK buildable in principle (terms+touch at EA:9637-pass) but separates nothing. HEAD-LIVE not proven buildable (head = indicator print; B-84). Lane to 3 of 6 on this census.

(End of slice)
