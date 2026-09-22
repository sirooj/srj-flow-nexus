# splice_relayv225.ps1 - build v225 relay from v12 packet + v224 template (asserted, console proof only)
$ErrorActionPreference = 'Stop'
$base = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$pktPath = Join-Path $base 'SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'
$tplPath = Join-Path $base 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v224-EXITMODEL2-CLEAR11.md'
$outPath = Join-Path $base 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v225-EXITMODEL2-CLEAR12.md'
$eaPath = Join-Path $base 'Experts\SRJ_FlowNexus_EA.mq5'
$fail = 0
if (Test-Path -LiteralPath $outPath) { Write-Output 'OUT-EXISTS FAIL'; exit 1 }
$enc = [Text.Encoding]::UTF8
function ReadClean([string]$p, [string]$tag) {
  $b = [IO.File]::ReadAllBytes($p); $t = $enc.GetString($b)
  $rt = $enc.GetBytes($t); if ($rt.Length -ne $b.Length) { Write-Output ($tag + '-UTF8 FAIL'); exit 1 }
  $t = $t -replace "`r", ''
  $ls = $t -split "`n"
  if ($ls.Count -gt 0 -and $ls[$ls.Count-1] -eq '') { return $ls[0..($ls.Count-2)] } else { return $ls }
}
$pkt = ReadClean $pktPath 'PKT'; $tpl = ReadClean $tplPath 'TPL'; $ea = ReadClean $eaPath 'EA'
Write-Output ("PKT lines=" + $pkt.Count + " TPL lines=" + $tpl.Count + " EA lines=" + $ea.Count)
if ($pkt.Count -ne 48) { Write-Output 'PKT-COUNT FAIL'; $fail++ }
if ($tpl.Count -ne 243) { Write-Output 'TPL-COUNT FAIL'; $fail++ }
if ($ea.Count -ne 11248) { Write-Output 'EA-COUNT FAIL'; $fail++ }
$eah = (Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash
Write-Output ("EA hash=" + $eah)
if ($eah -cne 'E6E908312DAE49086032F0AFBE6F2A6755A7404DC17803A7E8E7ECA4B7688B64') { Write-Output 'EA-HASH FAIL'; $fail++ }
function PrefixRows($lines, [string]$pre) { $hits = @(); for ($k = 0; $k -lt $lines.Count; $k++) { if ($lines[$k].StartsWith($pre, [StringComparison]::Ordinal)) { $hits += $k } }; return $hits }
function FindMark($lines, $mark) { for ($k = 0; $k -lt $lines.Count; $k++) { if ($lines[$k] -ceq $mark) { return $k } } return -1 }
$tb = FindMark $tpl '[[TWIN-B]]'; $te = FindMark $tpl '[[TWIN-E]]'
if ($tb -lt 0 -or $te -lt 0 -or (($te - $tb - 1) -ne 48)) { Write-Output 'TWIN-SPAN FAIL'; $fail++ }
$pkth = (Get-FileHash -LiteralPath $pktPath -Algorithm SHA256).Hash
$pktLen = (Get-Item -LiteralPath $pktPath).Length
Write-Output ("PKT12 hash=" + $pkth + " bytes=" + $pktLen)
if ($pkth -ceq '90BAF177DF4BD78BD2DA21262AB30994E4FCFE9678A39B1BEEF14D69C9234403') { Write-Output 'PKT-UNCHANGED FAIL'; $fail++ }
$twin = @()
for ($i = 1; $i -le 48; $i++) {
  $n = $i.ToString('D2'); $pl = $pkt[$i-1]
  if ($pl -eq '') { $twin += ('P' + $n + ' (= packet L' + $i + ', whole):') } else { $twin += ('P' + $n + ' (= packet L' + $i + ', whole): ' + $pl) }
}
Write-Output ("TWIN built=" + $twin.Count)
$L1 = 'CODE REVIEW REQUEST - v225 - 2026-09-21 (PACKET_P-EXITMODEL-2 v12: dayN-15 correction plus admission-row collision fallback plus causal qual-3 plus nextOpenPx validity plus 16:55-trigger terminology plus v214-v225 amend-deltas; nothing builds or spends on this verdict alone)'
$L6 = '- History: exit thread - v224 relay (1495BBED3C736938E166BA5578D8ACAB94593A2BE13AB0893274F1D1D659B8CC/55765/243, TRANSPORTED, superseded by this v225) drew Luna AMEND-WITH-DELTA plus Sonnet substance-only (no verdict by split) plus GLM AMEND-WITH-DELTA plus Kimi AMEND-WITH-DELTA (all filed whole 1x each under V225 markers; V224 markers hold the v223 round - mapping in ledger 549; zero halts, NO CLEARANCE - dual-key needs Luna). This v12 folds prose-only (zero EA bytes; F1/F2/F3 literals untouched; budget 11236 stands) with credit by seat: dayN 15-correction with three-seat credit (Luna-G1/A4, GLM-D1, Kimi-D1; TO literal exclusive-open, v11 16-date sentence withdrawn); Luna-A1 causal qual-3 plus A2/A3 provenance caveats plus A5 nextOpenPx validity plus A6/A10 terminology plus model-R plus A7 weekend semantic plus A8 run-end narrowing plus A11 conjunction (A9 acknowledged no fold; B1/B2/B3 parked code alternatives); GLM-D1 operand pin plus D2 insertion-side pin plus D3 collision fallback plus D4 9/4 carve-out plus D5 REPLACED carve-out plus D6 gap record optional plus A7a/A7b pins (B loop-start pin parked); Kimi-D1 satisfied by the 15-pin plus A2 name-warning plus A7 future clause parked; Sonnet-V225 POI-liveness considered and answered (P15 filters unchanged by design; POI win frequency non-increasing vs old fork) plus tie-flip covered by parked tie family plus weekend as business-rule his-call. Stored-mark helper, BOOKCENSUS, mark-bar-close figure, suppressed-vDAY flag, B1-action-side, full-rollback-gating, aligned-restatement, tie-flag, explicit tie key, precomputed mark, runtime input, early-break scan, unconditional-vDAY, debug-print, reducer tie provenance, call-site tie comment, canonical TP routine, (d) comment tightening, admission provenance, causal held-trade record, trigger-price split, loop-start pin, future entry-model clause stay parked code alternatives, operator-vetoable. Prior texts ride labeled, never as words of any seat.'
$L9 = 'Change (one plain sentence): clear PACKET_P-EXITMODEL-2 v12 by name for exactly one build (F1 unified-nearest booking with tie-break plus admission-row proof rule plus F2 HTF-exit off plus universal F3 16:55-trigger leg with vHTF guard plus explicit HTF-before-DAY_CLOSE chain plus enum comma plus reworded (g) comment, STAGE-1 exact-diff gated, F0 record fold zero bytes) plus one run under the RECON51 envelope with G1-G4 graded as stated.'
$L13 = 'Packet: 01_TASKS\PACKET_P-EXITMODEL-2.md v12 DRAFT: ' + $pkth + ' / ' + $pktLen + ' B / 48 lines (F0 fold incl v214-v225 deltas, F1 booking plus admission-row rule, F2 gate, universal F3 16:55-trigger leg, G1-G4, cost). Pre-build tree: E6E908312DAE49086032F0AFBE6F2A6755A7404DC17803A7E8E7ECA4B7688B64 / 615309 B / 11248 lines (v3.8-built, uncommitted; STAGE-1 halts on drift).'
$L14 = 'Seat packaging: identical text to Luna plus Sonnet plus GLM plus Kimi; keys volunteered only (Luna remains sole key source); any seat halts on a checkable discrepancy with line numbers. v225-round verdicts file under V226 markers (V225 markers hold this v224 round).'
$TW = 'TWIN (v12 packet: all 48 packet-lines quoted whole below, P01-P48; ellipsis 0):'
$GR = 'G-RULES (packet v12 G1-G4 operative, carried by reference to P40-P43 above): G1 build 0/0 plus post-hash plus exact-diff-primary budget (F1 39-to-15 net -24 - V224 machine recount stands; F3 +12 with (a) comma net 0, (d)=8 universal and (f) 5-for-4, (g) line-3 reword line-neutral; F2 net 0; predicted post-build 11236 physical; dayN==15 envelope constant (TO D''2026.09.10 00:00 exclusive-open, 15 dates; V225 three-seat correction); S1 uses-census plus two-call-sites plus census-tie plus sole-closure plus TP_RR_FAIL-family plus format plus day-marks-plus-weekend plus L2246 plus call-cadence plus flip-emitter plus dc-absence plus function-name asserts; S3 re-audit; runtime readiness (g_news_init, dayN, ascending) at S5/pre-G3; nextOpenPx validity L11047-L11048); G2 seven-family identity frozen (SIGNAL, TP_ELECT, SIDE1X, SIDE1E, STOPRESOLVE, SEEDDIAG, SESSION_LIMIT) with TP_ELECT/TPCENSUS/LOTDIAG-signal-lots/MTSNAP-tp exempt exactly where the winner changes plus the v11 admission-row rule (printed close==MTSNAP entry discriminates the L8758 admission call from S2POLL L7257 iClose rows, which grade diagnostic; on value collision serial/multiplicity disambiguate; tie-name divergence graded by value; anchor-collision recorded-not-proved) plus causal qual-3 (divergence bar PLUS verdict-change/suppression proof) plus canonical join (same admission+bar+direction AND changed target/winner AND TP_RR_FAIL transition, same-admission TP-shift path, or demonstrable predecessor chain with REQUIRED predecessor AND exit-row AND transition AND admission fields; outside fails; partial evidence unpredicted); G3 deltas per P42 with hard preconditions (dayN==15) plus general conditional plus 9/4 branch split plus earlier-or-same alignment plus non-exhaustive sets plus EXITVERDICT drift-or-absence plus universal MTEXIT-MTLIFE join plus Friday/Monday figures plus Saturday clause plus weekend semantic plus 9/8 fill pin plus 9/7-pm DAY_CLOSE candidacy plus narrowed run-end plus REPLACED carve-out; G4 goal join per P43 with hard preconditions plus 9/4 split branch plus 9/4 carve-out plus third-outcome rule plus model-R class plus gap record plus timebase homogeneity plus nextOpenPx validity plus 8/28-pm and 9/7-pm grades, deployment bar shut.'
$DS = 'DISSENT AND PARKS (open): stored-mark helper, BOOKCENSUS, mark-bar-close figure, suppressed-vDAY flag, B1-action-side, full-rollback-gating, aligned-restatement, tie-flag, explicit tie key, precomputed mark, runtime input, early-break scan, unconditional-vDAY, debug-print, reducer tie provenance, call-site tie comment, canonical TP routine, (d) comment tightening, admission provenance (Luna-B1), causal held-trade record (Luna-B2), trigger-price split (Luna-B3), loop-start pin (GLM-B), future entry-model clause (Kimi-A7) stay parked code alternatives, operator-vetoable; regime-classification divergence diagnosed not retuned; MtNearestTpTarget anchor-skip vs admission anchor-admit recorded not aligned (anchor-wins proved by admission rows; on value collision recorded-not-proved); result file must show POI participation in winner==booked rows plus terminal/account/mode/benchmark plus R-class basis plus predecessor chains plus gap record (grading instructions); TPCENSUS ties name POI by overwrite while booking keeps session (disk-proved divergence, graded by value; no join keys on name at ties); Luna-V225 item-A9 acknowledged (EXITVERDICT gap, no fold); Sonnet-V225 POI-liveness answered (no fold); GLM-A7c-e wording-only (no fold); Kimi-A3-A8 notes recorded (no fold). His veto on the G2 substance grade stands.'
$RC = 'RUN-COST: one build (F1/F2/F3 literals per packet v12, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, same envelope as RECON51 (RECON50_DEMO_USD, the RECON51 account, InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal). Build and run only on dual-key clear plus his run word plus token. No commit without token.'
$NV = 'NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON51 (E6E90831, takes 7/7): (a) first nearest-booking run with admission-row winner==booked proof on non-anchor admissions (close==entry discriminator with serial fallback; J09/J10 S2POLL rows diagnostic; anchor-wins by admission rows; ties graded by value); (b) first no-flip run with MTFLIP-zero plus split 9/4 DAY_CLOSE measured against his hold in model-R; (c) first universal 16:55-trigger run with conditional mark-joined DAY_CLOSE rows (9/4, 8/28-pm, 9/7-pm conditional) plus the 9/8-pm pinned boundary, Friday/Monday figures, Saturday clause, weekend semantic, narrowed run-end, REPLACED carve-out, and EXITVERDICT drift; (d) R-gate/selection effects attributed bar-for-bar under the v12 causal join key with predecessor witnesses, never hidden. Exit= figures are target figures, never realized fills.'
$QQ = 'Question (one, specific): clear PACKET_P-EXITMODEL-2 v12 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.'
$newStrings = @($L1,$L6,$L9,$L13,$L14,$TW,$GR,$DS,$RC,$NV,$QQ)
foreach ($s in $newStrings) { if ($s.Length -eq 0) { Write-Output 'EMPTY-NEW FAIL'; $fail++ } }
Write-Output ("NEWLEN L1=" + $L1.Length + " L6=" + $L6.Length + " GR=" + $GR.Length + " DS=" + $DS.Length)
$defs = @(@('P-L1','CODE REVIEW REQUEST - v224'),@('P-L6','- History: exit thread - v223 relay'),@('P-L9','Change (one plain sentence):'),@('P-L13','Packet: 01_TASKS\PACKET_P-EXITMODEL-2.md v11 DRAFT:'),@('P-L14','Seat packaging:'),@('P-TW','TWIN (v11 packet:'),@('P-GR','G-RULES '),@('P-DS','DISSENT AND PARKS '),@('P-RC','RUN-COST:'),@('P-NV','NOVEL-EVIDENCE:'),@('P-QQ','Question (one, specific):'))
$rows = @{}
foreach ($d in $defs) { $h = @(PrefixRows $tpl $d[1]); if ($h.Count -ne 1) { Write-Output ($d[0] + ' HITS=' + $h.Count + ' FAIL'); $fail++ } else { Write-Output ($d[0] + ' row=' + $h[0]); $rows[$d[0]] = $h[0] } }
$regs = @(@('R-F1OLD',2321,2359),@('R-F2OLD',129,132),@('R-F3ENUM',151,161),@('R-F3NAME',259,272),@('R-VDECL',11087,11090),@('R-HDR',11030,11032),@('R-HTF',11165,11187),@('R-RET',11202,11210),@('R-DAYDEF',10330,10342))
$marks = @('[[R-F1OLD-B]]','[[R-F1OLD-E]]','[[R-F2OLD-B]]','[[R-F2OLD-E]]','[[R-F3ENUM-B]]','[[R-F3ENUM-E]]','[[R-F3NAME-B]]','[[R-F3NAME-E]]','[[R-VDECL-B]]','[[R-VDECL-E]]','[[R-HDR-B]]','[[R-HDR-E]]','[[R-HTF-B]]','[[R-HTF-E]]','[[R-RET-B]]','[[R-RET-E]]','[[R-DAYDEF-B]]','[[R-DAYDEF-E]]','[[TWIN-B]]','[[TWIN-E]]','[[R-JROWS-B]]','[[R-JROWS-E]]')
foreach ($m in $marks) { $c = 0; foreach ($l in $tpl) { if ($l -ceq $m) { $c++ } }; if ($c -ne 1) { Write-Output ('MARK ' + $m + ' HITS=' + $c + ' FAIL'); $fail++ } }
foreach ($g in $regs) {
  $a = $g[1]; $b = $g[2]; $want = @(); for ($k = $a; $k -le $b; $k++) { $want += $ea[$k-1] }
  $ob = '[[' + $g[0] + '-B]]'; $oe = '[[' + $g[0] + '-E]]'
  $ib = FindMark $tpl $ob; $ie = FindMark $tpl $oe
  if ($ib -lt 0 -or $ie -lt 0 -or (($ie - $ib - 1) -ne $want.Count)) { Write-Output ($g[0] + '-SPAN FAIL'); $fail++; continue }
  $mm = 0; for ($k = 0; $k -lt $want.Count; $k++) { if ($tpl[$ib+1+$k] -cne $want[$k]) { $mm++ } }
  Write-Output ($g[0] + ' lines=' + $want.Count + ' mism=' + $mm)
  if ($mm -ne 0) { Write-Output ($g[0] + ' FAIL'); $fail++ }
}
if ($fail -ne 0) { Write-Output 'ABORT-WRITE-NOTHING'; exit 1 }
$out = @()
for ($k = 0; $k -lt $tpl.Count; $k++) { $out += $tpl[$k] }
$out[$rows['P-L1']] = $L1; $out[$rows['P-L6']] = $L6; $out[$rows['P-L9']] = $L9; $out[$rows['P-L13']] = $L13; $out[$rows['P-L14']] = $L14
$out[$rows['P-TW']] = $TW; $out[$rows['P-GR']] = $GR; $out[$rows['P-DS']] = $DS; $out[$rows['P-RC']] = $RC; $out[$rows['P-NV']] = $NV; $out[$rows['P-QQ']] = $QQ
$ntb = FindMark $out '[[TWIN-B]]'; $nte = FindMark $out '[[TWIN-E]]'
$head = @(); for ($k = 0; $k -le $ntb; $k++) { $head += $out[$k] }
$tail = @(); for ($k = $nte; $k -lt $out.Count; $k++) { $tail += $out[$k] }
$final = $head + $twin + $tail
Write-Output ("OUT lines=" + $final.Count)
if ($final.Count -ne 243) { Write-Output 'OUT-COUNT FAIL'; exit 1 }
$trail = 0; foreach ($l in $final) { if ($l.EndsWith(' ') -or $l.EndsWith("`t")) { $trail++ } }
Write-Output ("OUT-TRAILING-WS=" + $trail)
if ($trail -ne 0) { Write-Output 'OUT-TRAIL FAIL'; exit 1 }
$txt = ($final -join "`n")
$ellipsis = ([regex]::Matches($txt, '\.\.\.')).Count
Write-Output ("OUT-ELLIPSIS=" + $ellipsis)
if ($ellipsis -ne 0) { Write-Output 'OUT-ELLIPSIS FAIL'; exit 1 }
$mm2 = 0; for ($i = 1; $i -le 48; $i++) { $n = $i.ToString('D2'); $pre = 'P' + $n + ' (= packet L' + $i + ', whole):'; $ln = $final[$ntb+1+$i-1]; if (-not $ln.StartsWith($pre, [StringComparison]::Ordinal)) { $mm2++ } else { $bd = $ln.Substring($pre.Length); $pb = $pkt[$i-1]; if ($pb -eq '') { if ($bd -ne '') { $mm2++ } } else { if ($bd -ne (' ' + $pb)) { $mm2++ } } } }
Write-Output ("TWIN-VERIFY mism=" + $mm2)
if ($mm2 -ne 0) { Write-Output 'TWIN-VERIFY FAIL'; exit 1 }
$tb2 = [IO.File]::ReadAllBytes($tplPath)
$trailCRLF = ($tb2.Length -ge 2 -and $tb2[$tb2.Length-2] -eq 13 -and $tb2[$tb2.Length-1] -eq 10)
Write-Output ("TPL-TRAILCRLF=" + $trailCRLF)
$crlfTxt = ($final -join "`r`n")
if ($trailCRLF) { $crlfTxt += "`r`n" }
[IO.File]::WriteAllBytes($outPath, $enc.GetBytes($crlfTxt))
$oh = (Get-FileHash -LiteralPath $outPath -Algorithm SHA256).Hash
$ol = (Get-Item -LiteralPath $outPath).Length
$olc = (Get-Content -LiteralPath $outPath).Count
Write-Output ("OUT hash=" + $oh + " bytes=" + $ol + " lines=" + $olc)
if ($olc -ne 243) { Write-Output 'OUT-READBACK-COUNT FAIL'; exit 1 }
Write-Output 'RELAY-V225-OK'
