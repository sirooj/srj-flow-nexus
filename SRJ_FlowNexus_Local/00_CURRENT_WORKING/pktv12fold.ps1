# pktv12fold.ps1 - PACKET_P-EXITMODEL-2 v11 -> v12 fold (V225 round, prose-only, ASCII-only, asserted)
$ErrorActionPreference = 'Stop'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'
$preBytes = [IO.File]::ReadAllBytes($pktPath)
$preHash = (Get-FileHash -LiteralPath $pktPath -Algorithm SHA256).Hash
$enc = [Text.Encoding]::UTF8
$rt = $enc.GetBytes($enc.GetString($preBytes))
$fail = 0
if ($rt.Length -ne $preBytes.Length) { Write-Output 'UTF8-ROUNDTRIP FAIL'; $fail++ }
$txt = $enc.GetString($preBytes)
if ($txt.Contains("`r")) { Write-Output 'CR PRESENT FAIL'; $fail++ }
$lines = $txt -split "`n"
if ($lines.Count -gt 0 -and $lines[$lines.Count-1] -eq '') { $body = $lines[0..($lines.Count-2)]; $eol = $true } else { $body = $lines; $eol = $false }
Write-Output ("PRE lines=" + $body.Count + " bytes=" + $preBytes.Length + " hash=" + $preHash)
if ($body.Count -ne 48) { Write-Output 'PRE-COUNT FAIL'; $fail++ }
if ($preHash -cne '90BAF177DF4BD78BD2DA21262AB30994E4FCFE9678A39B1BEEF14D69C9234403') { Write-Output 'PRE-HASH FAIL'; $fail++ }
$trail = 0; foreach ($l in $body) { if ($l.EndsWith(' ') -or $l.EndsWith("`t")) { $trail++ } }
Write-Output ("PRE-TRAILING-WS=" + $trail)
if ($trail -ne 0) { Write-Output 'PRE-TRAIL FAIL'; $fail++ }
function HitsOf([string]$t, [string]$a) { $c = 0; $p = 0; while (($p = $t.IndexOf($a, $p, [StringComparison]::Ordinal)) -ge 0) { $c++; $p += $a.Length }; return $c }
function SwapOnce([string]$t, [string]$a, [string]$b) { $p = $t.IndexOf($a, [StringComparison]::Ordinal); return $t.Substring(0, $p) + $b + $t.Substring($p + $a.Length) }
$C1aa = 'PACKET_P-EXITMODEL-2 v11 DRAFT - exit model'
$C1ab = 'PACKET_P-EXITMODEL-2 v12 DRAFT - exit model'
$C1ba = '(V224 round: v223 transport returns filed as V224 markers; Luna-38-count disk-disproved, 39/11236 stand)'
$C1bb = '(V224 round: v223 transport returns filed as V224 markers; Luna-38-count disk-disproved, 39/11236 stand) (V225 round: dayN 15-correction plus prose folds; literals untouched, 11236 stands)'
$C2a = 'predicted post-build stays 11236 (V224 machine recount 39/39).'
$C2b = 'predicted post-build stays 11236 (V224 machine recount 39/39). v12 prose-only (zero EA bytes; literals untouched); dayN envelope constant corrected 16 to 15 (V225 three-seat convergence: Luna-G1/A4, GLM-D1, Kimi-D1).'
$C3a = 'filters in this line (Luna-6 V224 prose pin; F1 literal untouched).'
$C3b = 'filters in this line (Luna-6 V224 prose pin; F1 literal untouched). No downstream join may key attribution on the census winner NAME at exact ties (value only; Kimi-A2 V225).'
$C4a = 'joins the Saturday 16:55 mark (Kimi-D2 V224).'
$C4b = 'joins the Saturday 16:55 mark (Kimi-D2 V224). Terminology (Luna-A6 V225): day-close-minus-5 = 16:55-trigger qualification with next-open recorded exit price (never a 16:55 execution); operative language below uses 16:55-trigger.'
$C5a = 'B1-B3 stay parked). Credit by seat.'
$C5b = 'B1-B3 stay parked). Credit by seat. v224-round fold (V225 markers; NO CLEARANCE - Luna AMEND no key, Sonnet substance-only, GLM AMEND no key, Kimi AMEND no key; dual-key needs Luna): dayN 15-correction (TO literal D''2026.09.10 00:00 exclusive-open, 15 dates 08-26 to 09-09; the v11 16-date sentence withdrawn with credit Luna/GLM/Kimi); Luna-A1 causal qual-3; Luna-A2/A3 provenance caveats plus GLM-D3 collision fallback (serial/multiplicity) plus Luna-B1 parked; Luna-A5 nextOpenPx validity (L11047-L11048 next-bar open, fail-soft to evaluated-bar close); Luna-A6/A10 terminology plus model-R plus GLM-D6 gap record (optional his-call); Luna-A7 weekend semantic plus Sonnet weekend considered (mechanism stated, weekend-hold his-call non-blocking); Luna-A8 run-end narrowing plus GLM-D5 REPLACED carve-out; Luna-A9 acknowledged (no fold); Luna-A11 conjunction; Luna-B2/B3 parked; GLM-D1 operand pin plus D2 insertion-side pin plus D4 9/4 carve-out plus A7a pair refs plus A7b TP_RR_FAIL family pin; Kimi-D1 satisfied by the 15-pin plus A2 name-warning plus A7 future-entry-model clause parked; Sonnet-V225 POI-liveness considered (P15 filters unchanged by design; POI win frequency non-increasing vs old fork; no fold) plus tie-flip covered by parked tie family. Credit by seat.'
$C6a = '4 lines stay 4, +1 stands, budget unchanged).'
$C6b = '4 lines stay 4, +1 stands, budget unchanged). Insertion side (GLM-D2 V225): the (d) block inserts immediately after the L11187 close with the L11188 blank retained between block and L11189 print; (d)=+8, 11236 unchanged.'
$C7a = 'S2POLL L7257 iClose rows diagnostic).'
$C7b = 'S2POLL L7257 iClose rows diagnostic). Collision fallback (GLM-D3 V225): on printed close==entry value collision at an admission timestamp, census serial order (S2POLL L7257 call precedes admission L8758 call) and two-row multiplicity disambiguate; close-value rule stays primary. Anchor-collision caveat (Luna-A3 V225): admission rows prove booked value; on exact value collision with another valid candidate, source grades recorded-not-proved, never assumed anchor. Luna-B1 explicit-provenance parked (operator-vetoable code alternative).'
$C8aa = 'ascending, dayN==16 under cap 32'
$C8ab = 'ascending, dayN==15 under cap 32 (SRJ_PILOT_FROM D''2026.08.26 00:00, SRJ_PILOT_TO D''2026.09.10 00:00 exclusive-open, 15 dates 08-26 to 09-09; V225 three-seat correction: Luna-G1/A4, GLM-D1, Kimi-D1)'
$C8ba = 'g_news_init true with dayN==16 (front-loads D1 discovery to S1)'
$C8bb = 'g_news_init true with dayN==15 (envelope constant; runtime asserted at S5/pre-G3 per Luna-2; V225 correction)'
$C8ca = 'holds 16 dates so dayN==16 expected'
$C8cb = 'holds 15 marks under the TO literal so dayN==15 expected (V225 correction; the v11 16-date sentence is withdrawn with credit to the three seats)'
$C8da = 'asserted at S5/pre-G3, not S1 (Luna-2 V224).'
$C8db = 'asserted at S5/pre-G3, not S1 (Luna-2 V224). TP_RR_FAIL_LATCH/S5_RR_SHORTFALL are known RECON51 S5-stage entry-pipeline row kinds (emitters L9947/L9955) graded under G2 clause (i), not an eighth family (GLM-A7b V225); exitReason/state pair cites L10050/L10051 and L11070/L11071 adjacent lines (GLM-A7a V225).'
$C9a = '(G1 cross-note: (d)=8 universal with regime gate removed per his universal rule; budget 11236 stands.)'
$C9b = '(G1 cross-note: (d)=8 universal with regime gate removed per his universal rule; budget 11236 stands.) Attribution conjunction (Luna-A11 V225): every path grants only on ALL its listed evidence jointly (changed target/winner AND TP_RR_FAIL transition; predecessor AND exit-row AND transition AND admission); partial evidence grades unpredicted. Held-trade qual-3 is causal-only (Luna-A1 V225): REQUIRED divergence bar PLUS verdict-change/suppression proof (TP-touch suppressed or target moved across the R-gate); coexistence-only grades unpredicted.'
$C10aa = 'hard preconditions, FAIL G3/G4 if unmet: runtime g_news_init==true, dayN==16, marks strictly ascending'
$C10ab = 'hard preconditions, FAIL G3/G4 if unmet: runtime g_news_init==true, dayN==15, marks strictly ascending (TO-exclusive envelope constant; V225 correction)'
$C10ba = 'the trade stays open at run end - MTLIFE'
$C10bb = 'no F3 DAY_CLOSE row is owed for it (SL/TP/BREAK/HTF can still close) - MTLIFE'
$C10ca = 'Saturday clause (Kimi-D2 V224): a post-Friday-mark fill joins the Saturday 16:55 mark (generated: no dow skip); grades boundary-conformant under the F3 mark-range attribution, never unpredicted.'
$C10cb = 'Saturday clause (Kimi-D2 V224): a post-Friday-mark fill joins the Saturday 16:55 mark (generated: no dow skip); grades boundary-conformant under the F3 mark-range attribution, never unpredicted. Run-end narrowing recorded above (Luna-A8 V225). REPLACED-preemption carve-out (GLM-D5 V225): a mark-passing trade REPLACED at an admission collision on an earlier-or-same bar (L10050, successor F3-bound) grades conformant-exclusion under the Luna-4 enumeration (no DAY_CLOSE row owed for the replaced trade). Weekend semantic (Luna-A7/Sonnet-V225): weekend 16:55 marks evaluate only on trading bars; the first trading-bar evaluation at/after the mark acts (price = weekend-gap nextOpenPx); the Saturday clause is mechanism and grading boundary; weekend-hold alternatives are his-call (veto-able, non-blocking).'
$C11a = 'G4 exit-time deltas compare same-clock datetimes.'
$C11b = 'G4 exit-time deltas compare same-clock datetimes. 9/4 carve-out (GLM-D4 V225): where the 9/4 admission is blocked under F1 (TP_RR_FAIL, no trade), the DAY_CLOSE-absent branch split is not-applicable (recorded, no credit no penalty) and grades under the G2 no-admission branch (clause i). R terminology (Luna-A10/GLM-D6 V225): the 9/4 +0.92R class is R computed from the recorded/model exit price (nextOpenPx), never realized fill R; RECORD alongside (not graded) the R at the mark-bar-close figure to inform his veto on the parked alternative (optional, his call). nextOpenPx validity (Luna-A5 V225): exitPrice is the L11047-L11048 derived figure (next-bar open, fail-soft to evaluated-bar close); G3/G4 grade equality to that derived figure.'
$ops = @(@('OP-C1a',$C1aa,$C1ab),@('OP-C1b',$C1ba,$C1bb),@('OP-C2',$C2a,$C2b),@('OP-C3',$C3a,$C3b),@('OP-C4',$C4a,$C4b),@('OP-C5',$C5a,$C5b),@('OP-C6',$C6a,$C6b),@('OP-C7',$C7a,$C7b),@('OP-C8a',$C8aa,$C8ab),@('OP-C8b',$C8ba,$C8bb),@('OP-C8c',$C8ca,$C8cb),@('OP-C8d',$C8da,$C8db),@('OP-C9',$C9a,$C9b),@('OP-C10a',$C10aa,$C10ab),@('OP-C10b',$C10ba,$C10bb),@('OP-C10c',$C10ca,$C10cb),@('OP-C11',$C11a,$C11b))
$out = $txt
foreach ($op in $ops) {
  $c = HitsOf $out $op[1]
  if ($c -ne 1 -or $op[2].Length -eq 0) { Write-Output ($op[0] + ' HITS=' + $c + ' FAIL'); $fail++ }
  else { Write-Output ($op[0] + ' hits=1 inslen=' + $op[2].Length); $out = SwapOnce $out $op[1] $op[2] }
}
if ($fail -ne 0) { Write-Output 'ABORT-WRITE-NOTHING'; exit 1 }
$nl = ($out -split "`n")
if ($nl.Count -gt 0 -and $nl[$nl.Count-1] -eq '') { $nb = $nl[0..($nl.Count-2)] } else { $nb = $nl }
Write-Output ("POST lines=" + $nb.Count)
if ($nb.Count -ne 48) { Write-Output 'POST-COUNT FAIL'; exit 1 }
$trail2 = 0; foreach ($l in $nb) { if ($l.EndsWith(' ') -or $l.EndsWith("`t")) { $trail2++ } }
Write-Output ("POST-TRAILING-WS=" + $trail2)
if ($trail2 -ne 0) { Write-Output 'POST-TRAIL FAIL'; exit 1 }
if ($out.Contains("`r")) { Write-Output 'POST-CR FAIL'; exit 1 }
$ellipsis = ([regex]::Matches($out, '\.\.\.')).Count
Write-Output ("POST-ELLIPSIS=" + $ellipsis)
if ($ellipsis -ne 0) { Write-Output 'POST-ELLIPSIS FAIL'; exit 1 }
$final = $out
if ($eol -and -not $final.EndsWith("`n")) { $final += "`n" }
[IO.File]::WriteAllBytes($pktPath, $enc.GetBytes($final))
$postHash = (Get-FileHash -LiteralPath $pktPath -Algorithm SHA256).Hash
$postLen = (Get-Item -LiteralPath $pktPath).Length
Write-Output ("POST hash=" + $postHash + " bytes=" + $postLen)
if ($postHash -ceq $preHash) { Write-Output 'HASH-UNCHANGED FAIL'; exit 1 }
Write-Output 'PKT-V12-OK'
