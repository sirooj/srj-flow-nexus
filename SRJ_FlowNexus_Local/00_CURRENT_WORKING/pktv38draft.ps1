# pktv38draft.ps1 - DRAFT v37-to-v38 packet amend (folds v200 deltas; tag roll; ASCII-only; NO EA edit, NO build, NO run)
$ErrorActionPreference = 'Stop'
$Pkt = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$raw = [IO.File]::ReadAllBytes($Pkt)
$hasBom = ($raw.Length -ge 3 -and $raw[0] -eq 0xEF -and $raw[1] -eq 0xBB -and $raw[2] -eq 0xBF)
"PRE_BOM=$hasBom"
$crCount = ($raw | Where-Object { $_ -eq 13 }).Count
if ($crCount -ne 0) { throw "CR found $crCount" }
if ($raw[$raw.Length - 1] -ne 10) { throw 'no trailing LF' }
"PRE_LF_ONLY=true"
$pre = [IO.File]::ReadAllLines($Pkt)
if ($pre.Count -ne 58) { throw "count $($pre.Count)" }
"PRE_LINES=58"
$preHash = (Get-FileHash -LiteralPath $Pkt -Algorithm SHA256).Hash
if ($preHash -ne '17C43C22C7E1DA0D8A44A7F883B54D7727526BEC5675E2A2C14CB9A3660935F9') { throw "pre-hash drift $preHash" }
if ($raw.Length -ne 162201) { throw "pre-bytes drift $($raw.Length)" }
"PRE_HASH_OK=17C43C22 PRE_BYTES=162201"
$heads = @{0='# PACKET_EXT1LIVE-001 v37 DRAFT'; 2='Status: AUTHORED-unbuilt. Nothing builds'; 8='E-hunk (LIVE replacement, tag -v36; r'; 29='## 3. Live form (E-hunk executes the '; 37='Pre-build gates (STAGE-0/1, halt-with-d'; 41='v36 runtime target: 6 TP_ELECT fire r'; 45='Monotone-adverse-only adoption stays a '; 47='## 6. Goal layer (v36 - E-hunk LIVE ac'; 49='D1 lot-floor proof print (NEW pure inse'; 57='STAGE-0/1 and novel evidence (halt-with'}
foreach ($k in $heads.Keys) { if (-not $pre[$k].StartsWith($heads[$k])) { throw "head L$($k+1)" } }
"PRE_DRIFT_OK=10 lines"
[string[]]$lines = $pre.Clone()
function Assert-Ascii($s, $tag) { foreach ($ch in $s.ToCharArray()) { if ([int]$ch -gt 127) { throw "nonascii $tag U+$(([int]$ch).ToString('X4'))" } } }
function Count-Hits($line, $old) { return ([regex]::Matches($line, [regex]::Escape($old))).Count }
function Rep1($idx, $old, $new, $tag) {
  Assert-Ascii $old "old-$tag"; Assert-Ascii $new "new-$tag"
  $c = Count-Hits $lines[$idx] $old
  if ($c -ne 1) { throw "hits!=1 $tag L$($idx+1) count=$c" }
  $lines[$idx] = $lines[$idx].Replace($old, $new)
  "REP_OK $tag"
}
$lines[0] = @'
# PACKET_EXT1LIVE-001 v38 DRAFT - live the ext1 stop (LIVE activation E-hunk tag -v37) + USD envelope + goal layer (v38 folds Luna-V200-ACCEPT (cite-fix folded, residuals recorded) plus Sonnet-V200-advisory-ACCEPT (splice corroborated, NaN noted, AskB carried) plus GLM-V200-advisory-AMEND (triage cite-map, C-presence gate, tag roll, whitelist wiring, splice restructure, P013 relay-side, P030 count, volMax note, plus asks) as text (same-round advisory; dual-key plus run word plus token still owed for v38, Astra outstanding with waiver on his word); v38 amends v37 (10 lines: L1 version register; L3 tag roll plus run rename plus fold basis; L9 tag roll plus L8754 cite; L30 carried-literals count; L38 tag roll plus canonical annotation; L42 8B2ED676 repoints plus A2 live values; L46 v200 dispositions; L48 tag roll; L50 volMax note; L58 cite map plus C-presence gate plus splice restructure plus silent-disable note); E-hunk literal v2 carries tag -v37 (literal-roll precedent, true: D1 literal v2 rolled -v31 to -v32; the v37 L1 precedent cite is withdrawn as false); A/B/C/D1/D2 literals unchanged, tags stay -v28/-v32; run RECON50-EXT1LIVE-V38 tracks the packet; v37 folds Luna/Sonnet/GLM-V199 amends as text with v37 amending v36 (14 lines, E-hunk new tag -v36, USD envelope, runtime kill, whitelist, census); earlier folds ride v37 L1 under 17C43C22C7E1DA0D8A44A7F883B54D7727526BEC5675E2A2C14CB9A3660935F9)
'@
Assert-Ascii $lines[0] 'full-L1'
"FULL_OK=L1"
Rep1 2 'tag -v36, sole new live write slRef at the former selector site' 'tag -v37, sole new strategy stop-state write slRef at the former selector site' 'L3a-tag'
Rep1 2 'PLUS one run RECON50-EXT1LIVE-V36 under the RECON50_DEMO_USD envelope' 'PLUS one run RECON50-EXT1LIVE-V38 under the RECON50_DEMO_USD envelope' 'L3b-run'
Rep1 2 'submitted for clearance against received review material (Luna-V198-001 ACCEPT key-1 plus Sonnet-V198 advisory ACCEPT plus GLM-V198-001 ACCEPT on v35 (same-round advisory; dual-key plus run word plus token still owed for v36))' 'submitted for clearance against received review material (Luna-V199-amend plus Sonnet-V199-amend plus GLM-V199-amend folded as v37 text; v200 round Luna-ACCEPT plus Sonnet-advisory-ACCEPT plus GLM-advisory-AMEND on v37 (same-round advisory; dual-key plus run word plus token still owed for v38; Astra outstanding, waiver on his word))' 'L3c-basis'
Rep1 8 '(LIVE replacement, tag -v36;' '(LIVE replacement, tag -v37;' 'L9a-tag'
Rep1 8 'currentPrice local L8753 single-write' 'currentPrice local L8754 single-write' 'L9b-L8754'
Rep1 29 'THREE carried insertions A+B+C plus the new E-hunk' 'FIVE carried literals A/B/C/D1/D2 plus the new E-hunk' 'L30a-five'
Rep1 37 'plus the L9 E-hunk (new, tag -v36), except' 'plus the L9 E-hunk (new literal v2, tag -v37), except' 'L38a-tag'
Rep1 57 'exit-site canonical range is EA L11169-L11204 (EXITVERDICT L11169-L11180 through MTEXIT L11192 plus MtLifeEmit)' 'exit-site canonical range is EA L11169-L11204 (EXITVERDICT L11169-L11180 through MTEXIT L11192 plus MtLifeEmit) (landed numbers; current map: EXITVERDICT L11172, MTEXIT L11194, MtLifeEmit call L11201)' 'L58b-canon'
Rep1 41 'diagnostic-contract comparison (archive 8B2ED676 comparison per the contract below;' 'diagnostic-contract comparison (RECON49-segment comparison per the whitelist contract below (archive 8B2ED676 retained as the RECON47-era method reference);' 'L42a-method'
Rep1 41 'the baseline source is archive 8B2ED676 named here so the comparator cannot drift;' 'the baseline source is the RECON49 segment named here so the comparator cannot drift (archive 8B2ED676 superseded for v38 runs);' 'L42b-baseline'
Rep1 41 'A2 (SIDE1X/STOPRESOLVE values move with adoption, veto refusal unchanged, slot==13);' 'A2 (SIDE1X liveStop prints the adopted ext1 1.16299 iff the guard holds else the fallback stop, STOPRESOLVE live-side fields follow, veto refusal unchanged, slot==13);' 'L42c-A2live'
Rep1 45 'P048 tail carries no deal language on disk (GLM-1 scope note, nothing to amend). Council may amend-with-delta on any line; builder invents nothing.' 'P048 tail carries no deal language on disk (GLM-1 scope note, nothing to amend). Luna-V200: ACCEPT on v37 (8 notes: cite-fix folded here, residuals recorded). Sonnet-V200: advisory ACCEPT (splice corroborated, NaN analysis noted, AskB carried future). GLM-V200: AMEND (deltas 1-8 plus asks folded here; tag-roll credited with the false precedent withdrawn; C-hazard disproven on disk with presence gated; byte story reconciled: 613044 already carries A/B/C per RECON48 3-part rows, +999B is D1v2+D2 only). Luna v36-amend re-pasted byte-identical to V199-001 (duplicate trip, not filed twice). Council may amend-with-delta on any line; builder invents nothing.' 'L46a-v200'
Rep1 47 'E-hunk carries tag -v36' 'E-hunk carries tag -v37' 'L48a-tag'
Rep1 49 'any DEAL row in the tester report halts as an adherence failure' 'any DEAL row in the tester report halts as an adherence failure. Expected artifact at USD scale: tight-stop bars may print the volMax cap (EA L10114-L10115); capped lots grade as artifacts with volMax filed at build, never divergence.' 'L50a-volmax'
Rep1 57 'all read this block;' 'all read this block; Cite map (landed to current 7C247F45): S5 call L8779 to L8780, currentPrice L8753 to L8754, tpTarget new L8755, R-gate L9670-72 to L9671-73, selector L9661-65 to L9663-67, A-comment L9618 to L9620, walk L9632 to L9634, lot floor/abort L10109/L10110 to L10110/L10112, PRE-SEND L10119 to L10121, EXITVERDICT L11169 to L11172, MTEXIT L11192 to L11194, OnTick dedupe/call L11214/L11217 to L11216/L11219; producer/guard/S1-core/inputs/dormant/struct cites hold verbatim (byte-verified regions); C spans L9674 single 9628B line.' 'L58a-citemap'
Rep1 57 'exact-diff gate checks the build tree against the four v32 literals above' 'exact-diff gate checks the build tree against the four v32 literals plus the carried A/B/C presence (C-span L9674 cited, halt-on-absence) above' 'L58b-presence'
Rep1 57 'STAGE-1 asserts pre-run)., InpMode 1, InpDebugLog=true - SEEDDIAG is gated on it' 'STAGE-1 asserts pre-run). Run inputs: InpMode 1, InpDebugLog=true - SEEDDIAG is gated on it' 'L58c-splice'
Rep1 57 '(STAGE-1 asserts pre-run).' '(STAGE-1 asserts pre-run). With InpDebugLog=false the globals hold defaults (g_sl41_def=0), ext1Take is false, and the selector silently reverts to the old arms (fail-safe feature-disable, deployment consequence recorded).' 'L58d-silentsdisable'
$ea = [IO.File]::ReadAllLines($EA)
$old5 = @('         int s1x_sel = -1;', '         if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;', '         else if(s1x_s1slot >= 0) s1x_sel = 1;', '         if(s1x_sel == 0) slRef = s1x_s0px;', '         else if(s1x_sel == 1) slRef = s1x_s1px;')
for ($k = 0; $k -lt 5; $k++) { if ($ea[9662 + $k] -ne $old5[$k]) { throw "EA L$((9663+$k)) mismatch" } }
"EA_OLDVERBATIM_OK=5"
foreach ($q in @('MathIsValidNumber(currentPrice) && SlimbProtectiveSideOk', 's1x_sel = 2', 'slRef = g_sl41_px')) {
  if ((Count-Hits $lines[8] $q) -ne 1) { throw "E-hunk quote $q" }
}
"EA_NEWVERBATIM_OK=3"
$ident = @(4,6,10,12,14,16,18,19,20,21,22,23,24,25,26,27,31,33,35,39,43,51,53) + @(1,3,5,7,9,11,13,15,17,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56)
foreach ($i in $ident) { if ($lines[$i] -ne $pre[$i]) { throw "twin-drift idx $i" } }
"TWIN_IDENTICAL=48"
"TWIN_AMENDED=10"
$all = $lines -join "`n"
$ell = ([regex]::Matches($all, '\.\.\.')).Count
"ELLIPSIS=$ell"
if ($ell -ne 0) { throw 'ellipsis' }
"---DIGEST-CENSUS---"
[regex]::Matches($all, '[0-9A-F]{8,}') | Group-Object Value | Sort-Object Name | ForEach-Object { "$($_.Count)x $($_.Name)" }
"---LEFTOVER-SWEEP---"
foreach ($pat in @('tag -v36', 'tag stays -v36', 'amended-within-set', 'RECON50-EXT1LIVE-V36', 'Actual-path baseline', 'deal present', 'at deal level', 'proven by the absent SIGNAL', 'same envelope RECON44', 'D3 spends no run time', '7 TP_ELECT fire rows', 'FUTURE', 'counterfactual', 'print-only', 'RECON44_DEMO_P1', 'JPY', '9C79FC1E', 'InpAdoptExt1=false', '22475D22', 'counterfactual D3', 'L9662-L9663 predicates', 'currentPrice local L8753', 'pre-run)., InpMode')) {
  $hits = @()
  for ($i = 0; $i -lt 58; $i++) { if ($lines[$i].Contains($pat)) { $hits += "L$($i+1)" } }
  "$pat => $($hits -join ',')"
}
$enc = New-Object Text.UTF8Encoding($hasBom)
[IO.File]::WriteAllText($Pkt, (($lines -join "`n") + "`n"), $enc)
$post = Get-FileHash -LiteralPath $Pkt -Algorithm SHA256
$bytes = (Get-Item -LiteralPath $Pkt).Length
"POST_HASH=$($post.Hash) POST_BYTES=$bytes POST_LINES=$(([IO.File]::ReadAllLines($Pkt)).Count)"
