# pktv11fold.ps1 - PACKET_P-EXITMODEL-2 v10 -> v11 fold (V224 round, ASCII-only, asserted, console proof only)
$ErrorActionPreference = 'Stop'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'
$preBytes = [IO.File]::ReadAllBytes($pktPath)
$preHash = (Get-FileHash -LiteralPath $pktPath -Algorithm SHA256).Hash
$enc = [Text.Encoding]::UTF8
$rt = $enc.GetBytes($enc.GetString($preBytes))
$fail = 0
if (($rt.Length -ne $preBytes.Length)) { Write-Output 'UTF8-ROUNDTRIP FAIL'; $fail++ }
$txt = $enc.GetString($preBytes)
if ($txt.Contains("`r")) { Write-Output 'CR PRESENT FAIL'; $fail++ }
$lines = $txt -split "`n"
if ($lines.Count -gt 0 -and $lines[$lines.Count-1] -eq '') { $body = $lines[0..($lines.Count-2)]; $eol = $true } else { $body = $lines; $eol = $false }
Write-Output ("PRE lines=" + $body.Count + " bytes=" + $preBytes.Length + " hash=" + $preHash)
if ($body.Count -ne 48) { Write-Output 'PRE-COUNT FAIL'; $fail++ }
$trail = 0; foreach ($l in $body) { if ($l.EndsWith(' ') -or $l.EndsWith("`t")) { $trail++ } }
Write-Output ("PRE-TRAILING-WS=" + $trail)
if ($trail -ne 0) { Write-Output 'PRE-TRAIL FAIL'; $fail++ }
function CountHits([string]$t, [string]$a) { $c = 0; $p = 0; while (($p = $t.IndexOf($a, $p, [StringComparison]::Ordinal)) -ge 0) { $c++; $p += $a.Length }; return $c }
function HitsOf([string]$t, [string]$a) { $c = 0; $p = 0; while (($p = $t.IndexOf($a, $p, [StringComparison]::Ordinal)) -ge 0) { $c++; $p += $a.Length }; return $c }
function SwapOnce([string]$t, [string]$a, [string]$b) { $p = $t.IndexOf($a, [StringComparison]::Ordinal); return $t.Substring(0, $p) + $b + $t.Substring($p + $a.Length) }
$A1a = '# PACKET_P-EXITMODEL-2 v10 DRAFT - exit model on his banked direction (nearest booking, no HTF-flip exit, universal day-close-minus-5)'
$A1b = '# PACKET_P-EXITMODEL-2 v11 DRAFT - exit model on his banked direction (nearest booking, no HTF-flip exit, universal day-close-minus-5) (V224 round: v223 transport returns filed as V224 markers; Luna-38-count disk-disproved, 39/11236 stand)'
$A2a = 'No other EXITMODEL/EXITGATE packet on disk is touched.'
$A2b = 'No other EXITMODEL/EXITGATE packet on disk is touched. v11 folds the v223-round verdicts (V224 markers; mapping in ledger 548); predicted post-build stays 11236 (V224 machine recount 39/39).'
$A3a = 'names winner by equality with best - unchanged, grades F1.'
$A3b = 'names winner by equality with best - unchanged, grades F1. Valid = admissible: nearest among candidates surviving the pool-specific filters in this line (Luna-6 V224 prose pin; F1 literal untouched).'
$A4a = 'first-hit break selects the earliest qualifying mark.'
$A4b = 'first-hit break selects the earliest qualifying mark. Timebase (Kimi-D1 V224, disk-corrected): fillBarTime (forming-bar open iTime(0) at admission, L10066), dayMarks[] (server datetimes via TC_ZoneToServer ET, L10338-L10355), and the EvaluateManagedTrade evaluation barTime (once-per-bar closed-bar cadence, L11232-L11242) are all server-clock datetimes - the <= chain is dimensionally homogeneous (marks are converted 16:55 wall times, not bar opens). Weekend marks ARE generated (loop steps every calendar date with no dow skip; only friMarks is Friday-filtered): a post-Friday-mark fill joins the Saturday 16:55 mark (Kimi-D2 V224).'
$A5a = 'mark-join set universal, banked to the strategy skill same turn.'
$A5b = 'mark-join set universal, banked to the strategy skill same turn. v223-round fold (V224 markers; NO CLEARANCE - Luna AMEND no key, Sonnet ACCEPT substance-only, GLM ACCEPT, Kimi AMEND; dual-key needs Luna): Luna-1 38-count WITHDRAWN as disk-disproved (relay R-F1OLD 70-108 = 39/39 non-blank, EA 2321-2359 = 39/39, GLM BASIS-1 plus ledger-546 agree; G-RULES history reworded to v5-superseded-at-v6); Luna-2 S1/runtime split (source construction plus envelope expectation at S1, runtime readiness at S5/G3); Luna-3 admission-row proof rule (TPCENSUS fires inside ComputeNearestTpTarget on the shared currentPrice variable L2369-L2427; canonical booking proof is the admission-call row L8752-L8758 where ref=nextOpenPx=entry, discriminator printed close==MTSNAP entry - J09 close 1.16134 vs J04 entry 1.16135 proves J09 is the S2POLL diagnostic; S2POLL iClose rows L7253-L7257 diagnostic only); Luna-4 sole-closure enumeration (L11205 sole filled-trade path; L10050 REPLACED admission-collision only with F3-bound successor; L11070 CANCEL_BIAS pending-only inside EvaluateManagedTrade); Luna-5 (g) line-3 reworded in place (4 lines stay 4, +1 stands); Luna-6 admissible folded as P15 prose (F1 literal untouched); Luna-B canonical routine PARKED (operator-vetoable); Kimi-D1 timebase pin (disk-corrected) plus Kimi-D2 weekend enumeration/grading plus Kimi-A3 census-tie S1 pin folded; Kimi-D3 comment tightening PARKED for his word; Kimi cursor PARKED; Sonnet-V224 substance-ACCEPT no deltas; GLM-V224 ACCEPT (A1 retired by the (g) reword, A2-A8 non-blocking no fold; B1-B3 stay parked). Credit by seat.'
$A6a = 'Assembled F1 block: 15 physical non-blank lines (1 comment + 1 anchorRank + 6 session loop + 7 POI loop).'
$A6b = 'Assembled F1 block: 15 physical non-blank lines (1 comment + 1 anchorRank + 6 session loop + 7 POI loop). G2 joins admission-stage TPCENSUS rows only (V224 Luna-3 corrected: census shares the booking currentPrice variable inside ComputeNearestTpTarget; canonical row is the admission call L8758, discriminator printed close==MTSNAP entry; S2POLL L7257 iClose rows diagnostic).'
$A7aa = '`// (universal scope: every managed trade) (the conservative stop-first standard; the census logs ALL`'
$A7ab = '`// (universal scope: every managed trade) (the conservative stop-first standard; MTEXIT/MTLIFE record terminal`'
$A7ba = '`// verdicts so the operator can re-judge any instance).`'
$A7bb = '`// exit reasons so the operator can re-judge any instance).`'
$A7ca = 'no re-indent at S2, aligned restatement parked.'
$A7cb = 'no re-indent at S2, aligned restatement parked. (g) line-3 reworded in place at v11 (Luna-5 V224; 4 lines stay 4, +1 stands, budget unchanged).'
$A8a = 'plus tabulate with DONE file.'
$A8b = 'plus tabulate with DONE file. S1 v11 adds (V224, zero bytes): two booking call sites pinned (S2POLL L7253-L7257 ref=iClose diagnostic; admission L8752-L8758 ref=nextOpenPx=entry canonical); census same-variable pin (L2369-L2427 inside ComputeNearestTpTarget); census-tie walk-order pin (session-first L2391/L2402, POI-overwrite LAST-equal L2413; Kimi-A3 V224); sole-closure enumeration (L11205 sole filled-trade exit path; L10050 REPLACED admission-collision only, successor F3-bound; L11070 CANCEL_BIAS pending-unfilled only, same function; Luna-4 V224); day-marks source assert (unconditional per calendar date incl Sat/Sun, no dow skip, L10338-L10355; envelope 08-26 to 09-10 holds 16 dates so dayN==16 expected) with runtime readiness (g_news_init==true, dayN==16, ascending) asserted at S5/pre-G3, not S1 (Luna-2 V224).'
$A9a = 'commit text prepared and identical, commit only on token.'
$A9b = 'commit text prepared and identical, commit only on token. V224 re-affirm: relay R-F1OLD 70-108 machine recount 39/39 non-blank plus EA 2321-2359 39/39 (Luna-1 38-count withdrawn); (g) reword line-neutral; predicted 11236 stands.'
$A10a = 'attributed per bar via TPCENSUS winner==booked plus TP_RR_FAIL rows where R crosses the gate'
$A10b = 'attributed per bar via TPCENSUS winner==booked (admission-stage rows only: printed close==MTSNAP entry discriminates the L8758 admission call from S2POLL L7257 iClose rows; Luna-3 V224 corrected) plus TP_RR_FAIL rows where R crosses the gate'
$A11a = 'no MTEXIT row is owed, the absence grades boundary-conformant (F3 mark-range attribution, not unpredicted).'
$A11b = 'no MTEXIT row is owed, the absence grades boundary-conformant (F3 mark-range attribution, not unpredicted). Saturday clause (Kimi-D2 V224): a post-Friday-mark fill joins the Saturday 16:55 mark (generated: no dow skip); grades boundary-conformant under the F3 mark-range attribution, never unpredicted.'
$A12a = 'deployment bar stays shut (full-journal open, experiment open).'
$A12b = 'deployment bar stays shut (full-journal open, experiment open). Timebase homogeneity (Kimi-D1 V224) is asserted at S1/S5; G4 exit-time deltas compare same-clock datetimes.'
$ops = @(@('OP-A1',$A1a,$A1b),@('OP-A2',$A2a,$A2b),@('OP-A3',$A3a,$A3b),@('OP-A4',$A4a,$A4b),@('OP-A5',$A5a,$A5b),@('OP-A6',$A6a,$A6b),@('OP-A7a',$A7aa,$A7ab),@('OP-A7b',$A7ba,$A7bb),@('OP-A7c',$A7ca,$A7cb),@('OP-A8',$A8a,$A8b),@('OP-A9',$A9a,$A9b),@('OP-A10',$A10a,$A10b),@('OP-A11',$A11a,$A11b),@('OP-A12',$A12a,$A12b))
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
Write-Output 'PKT-V11-OK'
