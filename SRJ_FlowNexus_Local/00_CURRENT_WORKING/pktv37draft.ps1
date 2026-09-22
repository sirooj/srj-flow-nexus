# pktv37draft.ps1 - DRAFT v36-to-v37 packet amend (folds Luna/Sonnet/GLM v199 amends; ASCII-only; NO EA edit, NO build, NO run)
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
if ($preHash -ne '4FD5DB43EB20BB14733E8326429B62580741E4153821A7EE99274B4E1D135BE0') { throw "pre-hash drift $preHash" }
if ($raw.Length -ne 157178) { throw "pre-bytes drift $($raw.Length)" }
"PRE_HASH_OK=4FD5DB43 PRE_BYTES=157178"
$heads = @{0='# PACKET_EXT1LIVE-001 v36 DRAFT'; 6='Live rule (executes on the S5 path unde'; 8='E-hunk (LIVE replacement, tag -v36; r'; 27='R-gate constant 1.0 (EA L57 compiled de'; 33='slLive, gateConst, currentPrice, and ac'; 37='Pre-build gates (STAGE-0/1, halt-with-d'; 39='## 4. Acceptance (grade lines; actual p'; 41='Actual-path baseline: 6 TP_ELECT fire r'; 45='Monotone-adverse-only adoption stays a '; 49='D1 lot-floor proof print (NEW pure inse'; 51='D2 17:00 seed-miss print (two wraps D2'; 53='D3 16:45 live-activation (LIVE rule, E'; 55='D4 8/28 exit-layer join (no new code - '; 57='STAGE-0/1 and novel evidence (halt-with'}
foreach ($k in $heads.Keys) { if (-not $pre[$k].StartsWith($heads[$k])) { throw "head L$($k+1)" } }
"PRE_DRIFT_OK=14 lines"
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
# PACKET_EXT1LIVE-001 v37 DRAFT - live the ext1 stop (LIVE activation E-hunk, literal amended) + USD envelope + goal layer (v37 folds Luna-V199-1-9 (scope sentence, G1 split, stop-state reword, currentPrice conjunct, DIR_NONE sound, corroboration reword, runtime-target rename, invariance note, hazard note) plus Luna-AskB1-4 (architecture declined, envelope-requirement adopted, D1 adequate, D2 future) plus Sonnet-V199-critical-1-2 (derivation precedence, domain set) plus Sonnet-A2-note plus Sonnet-AskB carried plus GLM-V199-1-7 (deal reword, derivation carve-out, domain ledger, RECON49 whitelist contract, T2 sl, enum relabel plus 13/13 prediction, s1x census gate) plus GLM-AskA-8-12 (cite map, relay-side P013, G2 clause, N-2 widening, Deposit word) plus GLM-AskB-a-e (carve-out adopted, sel-2 kept, ini digests, seed home, declines standing) as text (same-round advisory; dual-key plus run word plus token still owed for v37, Astra ruling outstanding); v37 amends v36 (14 lines: L1 version register; L7 scope sentence plus currentPrice conjunct plus S5-call cite; L9 conjunct plus stop-state reword; L28 A2 conditional sel; L34 derivation carve-out plus hazard note; L38 domain set plus enum relabel plus 13/13 prediction; L40 corroboration reword; L42 runtime-target rename plus RECON49 whitelist contract; L46 v199 dispositions; L50 G1 split plus send-preparation reword; L52 G2 non-fire-return clause; L54 N-2 widening; L56 T2 sl plus USD execution note; L58 triage refresh plus census gate plus ini digests plus scope assert plus Deposit word plus invariance note plus text-check add plus adherence DEAL-halt); E-hunk literal amended (currentPrice-finite conjunct), tag stays -v36 (amended-within-set precedent: D1 literal v2 kept tag -v32); A/B/C/D1/D2 literals unchanged, tags stay -v28/-v32); v36 folds Luna-V198-1-7 plus Sonnet-V198 close plus GLM-V198-residuals-1-5 as text with v36 amending v35 (23 lines, E-hunk new tag -v36, USD envelope RECON50_DEMO_USD, runtime kill, exit-bar check, adherence filed); earlier folds ride v36 L1 under 4FD5DB43EB20BB14733E8326429B62580741E4153821A7EE99274B4E1D135BE0)
'@
Assert-Ascii $lines[0] 'full-L1'
"FULL_OK=L1"
Rep1 6 'Live rule (executes on the S5 path under this authorization):' 'Live rule (executes on the S5 path under this authorization, and only with effective InpDebugLog=true (publication-gated producer)):' 'L7a-scope'
Rep1 6 'and finite slExt1 (MathIsValidNumber(g_sl41_px)) and SlimbProtectiveSideOk(g_dir, g_sl41_px, currentPrice) holds' 'and finite slExt1 (MathIsValidNumber(g_sl41_px)) and finite currentPrice (MathIsValidNumber(currentPrice)) and SlimbProtectiveSideOk(g_dir, g_sl41_px, currentPrice) holds' 'L7b-conjunct'
Rep1 6 'published at L5496-97 from the L8779 S5 call' 'published at L5496-97 from the L8780 S5 call (landed cite L8779, mapped in L58)' 'L7c-call'
Rep1 8 'bool ext1Take = ((g_dir == DIR_LONG || g_dir == DIR_SHORT) && g_sl41_def == 1 && MathIsValidNumber(g_sl41_px) && SlimbProtectiveSideOk(g_dir, g_sl41_px, currentPrice));' 'bool ext1Take = ((g_dir == DIR_LONG || g_dir == DIR_SHORT) && g_sl41_def == 1 && MathIsValidNumber(g_sl41_px) && MathIsValidNumber(currentPrice) && SlimbProtectiveSideOk(g_dir, g_sl41_px, currentPrice));' 'L9a-conjunct'
Rep1 8 'Sole new live write: slRef on the ext1 arm (declared and gated here;' 'Sole new strategy stop-state write: slRef on the ext1 arm (`s1x_sel=2` is local arm metadata, declared and gated here;' 'L9b-stopstate'
Rep1 27 'vetoed before latch (no TP_ELECT row; live ext1 adoption precedes the veto with refusal unchanged)' 'vetoed before latch (no TP_ELECT row; the E-hunk conjunction evaluates at runtime (SHORT, defined slot-13 ext1) with refusal unchanged; sel prints 2 iff the guard holds on the runtime currentPrice, else the fallback sel)' 'L28a-A2'
Rep1 33 'derives liveSel from the printed s0/s1 inputs per the L9662-L9663 predicates' 'derives liveSel from the printed s0/s1 inputs per the L9664-L9665 predicates with ext1Take precedence (on liveSel=2 the derivation recomputes the E-hunk conjunction from printed dir/ext1Defined/pxExt1/currentPrice plus slLive==pxExt1; sel=0/1/-1 rows derive as before)' 'L34a-carveout'
Rep1 33 'AdoptOff held (dormant block inert, InpAdoptExt1=false), OrderSend 0 (measured this turn).' 'AdoptOff held (dormant block inert, InpAdoptExt1=false), OrderSend 0 (measured this turn). The dormant block stays a configuration hazard if InpAdoptExt1 is ever enabled (two ext1 writers); frozen false here.' 'L34b-hazard'
Rep1 37 'liveSel in {-1,0,1}, gates in' 'liveSel in {-1,0,1,2}, gates in' 'L38a-domain'
Rep1 37 '2026.09.08 16:40 fire (A3 declined); run-time cross-check' '2026.09.08 16:40 non-fire at runtime under the E-hunk (gate kill, A3 decline superseded); run-time cross-check' 'L38b-enum'
Rep1 37 'the archive 13 is the pre-build prediction.' 'the archive 13 is the pre-build prediction. The v36 sel prediction: all 13 C-reaching defined-ext1 rows print sel=2 under the guard (predicted 10 value-identical with A1/A2/A3 changed) - resolved by prints, never pre-accepted.' 'L38c-13sel2'
Rep1 39 '(A3 kill ordered resolution-then-veto, proven by the absent SIGNAL);' '(A3 kill ordered resolution-then-veto; no SIGNAL corroborates the preceding TP_ELECT non-fire);' 'L40a-corrob'
Rep1 41 'Actual-path baseline: 6 TP_ELECT fire rows of 11 TP_ELECT rows total (A3 prints R 0.68 non-fire),' 'v36 runtime target: 6 TP_ELECT fire rows of 11 TP_ELECT rows total (A3 prints R 0.68 non-fire),' 'L42a-target'
Rep1 41 'diverges from archive 8B2ED676 under the comparison contract' 'diverges from the RECON49 segment under the v36 comparison contract (archive 8B2ED676 superseded for this run) with the enumerated whitelist: A1 (SIGNAL/TP_ELECT R 1.48 to 1.38, sl 1.16503 to 1.16508); A3 (SIGNAL 16:45:01 absent, TP_ELECT R 1.62 to 0.68 non-fire, SIDE1X liveStop 1.16274 to 1.16359); lot rows (8/28 16:25 and 9/4 16:00 ABORT/A6REFUSED pairs absent at USD scale; PRE-SEND completes for the A1 bar and the 9/4 bar and is absent with the killed A3 take-chain); A2 (SIDE1X/STOPRESOLVE values move with adoption, veto refusal unchanged, slot==13); 8/27 17:00 (sel resolved by prints, non-fire expected); T2 (MTLIFE sl 1.16503 to 1.16508); everything else row-for-row against RECON49' 'L42b-whitelist'
Rep1 45 'e declined standing (trade-id field, LOTDIAG tick stamp). Council may amend-with-delta on any line; builder invents nothing.' 'e declined standing (trade-id field, LOTDIAG tick stamp). Luna-V199: 1 scope-sentence ADOPTED (L7+L58, debug-gated-producer premise disk-true), 2 SPLIT adopted (L50 halt vs acceptance), 3 reword adopted (L9 stop-state write), 4 conjunct adopted (L9+L7, 0.0-failsafe noted), 5 recorded sound (DIR_NONE closed), 6 reword adopted (L40 corroboration), 7 rename adopted (L42a runtime target), 8 report-guidance recorded (L58c lot/signal separation), 9 hazard note adopted (L34b2); AskB1 architecture declined for v36 (new writers need own token, B-2 minimal scope adopted), AskB2 envelope-requirement adopted, AskB3 recorded (D1 adequate), AskB4 recorded (G2 future). Sonnet-V199: critical-1/2 adopted (L34 derivation precedence, L38 domain), A2-note adopted (L28 conditional sel), AskB carried future (ext1Take probe field, needs literal plus token). GLM-V199-1-7 adopted (L50/L58 deal reword; L34 carve-out; L38 domain; L42 RECON49 whitelist contract; L56 T2 sl; L38 enum relabel plus 13/13 prediction; L58 s1x census gate); GLM AskA 8 cite-map adopted (L58), 9 relay-side (v200 P013 fuller span), 10 G2-clause adopted (L52), 11 N-2 widening adopted (L54), 12 Deposit word adopted (L58c); AskB a adopted as the carve-out, b recorded (keep sel-2 plus census), c adopted (L58 ini digests), d recorded (seed-packet home), e declined standing. P048 tail carries no deal language on disk (GLM-1 scope note, nothing to amend). Council may amend-with-delta on any line; builder invents nothing.' 'L46a-v199'
Rep1 49 'Acceptance G1 (USD envelope): every lot-calc bar prints LOTDIAG with belowMin=0 (no floor-refusal expected at Deposit 10000 USD; any belowMin=1 halts with operands);' 'Acceptance G1 (USD envelope) has two separate clauses. Halt clause: any belowMin=1 row halts with operands (belowMin=1 means post-floor lots below volMin and is incompatible with the acceptance clause). Acceptance clause: every lot-calc bar prints LOTDIAG with belowMin=0 (no floor-refusal expected at Deposit 10000 USD);' 'L50a-split'
Rep1 49 'with PRE-SEND lots plus deal present (9/4 executes at USD scale)' 'with PRE-SEND present at flooredLots at or above volMin and no same-tick ABORT/A6REFUSED pair (the 9/4 take completes the send-preparation chain at USD scale); any DEAL row in the tester report halts as an adherence failure' 'L50b-sendprep'
Rep1 51 'filed IDLE precondition (v30 SEL54STAGE bar=2026.09.08 17:00 stage=S2POLL state=IDLE)' 'filed IDLE precondition (v30 SEL54STAGE bar=2026.09.08 17:00 stage=S2POLL state=IDLE) (v36 state path: the 9/4 same-day 09:25 non-fire evaluation precedes the 10:35 S1-head evaluation, supporting the non-fire-to-IDLE return on filed rows)' 'L52a-idlepath'
Rep1 53 'never counterfactual; flips means fire-status only: A1 R 1.48 to 1.38 with status unchanged; only A3 status flips).' 'never counterfactual; flips means fire-status only: A1 R 1.48 to 1.38 with status unchanged; only A3 status flips; N-2 producer-equality conditioning widens in kind from shadow fidelity to live-selection truth, the E-hunk consuming g_sl41_* directly).' 'L54a-widen'
Rep1 55 'SIGNAL 16:25:00 entry 1.16430 sl 1.16503 tp 1.16322' 'SIGNAL 16:25:00 entry 1.16430 sl 1.16508 (expected E-hunk consequence on A1) tp 1.16322' 'L56a-T2sl'
Rep1 55 'TP_TOUCH closeBar 16:25 exit 1.16416; lot-refused on tester, declined under his kill-all)' 'TP_TOUCH closeBar 16:25 exit 1.16416; executes at USD scale, declined under his kill-all (expected finding))' 'L56b-T2exec'
Rep1 57 'STAGE-0 read-only triage DONE in this packet - lot site EA L10096-L10129, S1 site EA L7677-L7715, R-gate EA L9670-L9672, exit site EA L11024-L11204, struct EA L1913-L1918, SessionName EA L1701, inWindow EA L6611-L6612, all read this turn;' 'STAGE-0 read-only triage RE-DONE in v37 on the pre-build tree 7C247F45 - lot site EA L10108-L10121 (volMin decl L10108, floor L10110, LOTDIAG L10111, abort L10112, PRE-SEND L10121; riskMoney L10098, tickSize L10101, lossPerLot L10105, lots L10106), S1 site EA L7677-L7715 (D2a wrap L7681, D2c L7696, D2b L7700, all present), R-gate EA L9671-L9673 (slDist/tpDist/tpOk), exit site EA L11172-L11201 (EXITVERDICT L11172, MTEXIT L11194, MtLifeEmit call L11201), struct EA L1913-L1918 (r.found=false L1918), guard EA L2578-L2581, producer SrjResolveExt1 L2795-L2826 plus ComputeSlReference L5291-L5497 (publish L5494-L5497), S5 call L8780, currentPrice L8754, tpTarget L8755, S5 slRef decl L8766, selector L9663-L9669 (B L9668), veto L7682-L7697, side L7708, inputs L57/L71, dormant L8807-L8813, OnTick L11212-L11219 (dedupe L11216, call L11219); SessionName decl L1701 plus inWindow L6612 carried (D2 scope symbols verified present at L7681-L7700); all read this block;' 'L58a-triage'
Rep1 57 'domain conjunct plus guard call plus s1x_sel=2 text-checked; B L9668 unchanged);' 'domain conjunct plus guard call plus currentPrice-finite conjunct plus s1x_sel=2 text-checked; B L9668 unchanged; s1x_sel reader census outside L9663-L9669 expects probe-B only, halt on any live consumer);' 'L58b-textcheck'
Rep1 57 'RECON44_DEMO_P1 bytes with Currency JPY to USD; Deposit 10000; same Symbol/Period/Model/Leverage/inputs; STAGE-1 byte-asserts the single-line delta)' 'RECON44_DEMO_P1 bytes with Currency JPY to USD; Deposit 10000 (unchanged); same Symbol/Period/Model/Leverage/inputs; STAGE-1 byte-asserts the single-line delta plus both ini digests (RECON44 plus RECON50)). The live arm is authorized only under effective InpDebugLog=true (STAGE-1 asserts pre-run).' 'L58c-scope'
Rep1 57 'lot-independent signal-path no-drift vs RECON49' 'lot-independent signal-path no-drift vs RECON49 (selection/gate invariance only; lot/deal rows grade separately under G1, never as signal drift)' 'L58d-invar'
Rep1 57 'USD deal-level takes 4/4 with the 9/4 15:55 take executing' 'USD send-preparation-complete takes 4/4 with the 9/4 15:55 take completing the chain' 'L58e-sendprep'
Rep1 57 'Takes join 4/4 at deal level moves takes;' 'Takes join 4/4 at send-preparation-complete level moves takes;' 'L58f-level'
Rep1 57 'STAGE-1 re-confirms digest plus confinement post-build, else halt.' 'STAGE-1 re-confirms digest plus confinement post-build, else halt. Any DEAL row in the tester report halts as an adherence failure (OrderSend 0).' 'L58g-dealhalt'
$ea = [IO.File]::ReadAllLines($EA)
$old5 = @('         int s1x_sel = -1;', '         if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;', '         else if(s1x_s1slot >= 0) s1x_sel = 1;', '         if(s1x_sel == 0) slRef = s1x_s0px;', '         else if(s1x_sel == 1) slRef = s1x_s1px;')
for ($k = 0; $k -lt 5; $k++) { if ($ea[9662 + $k] -ne $old5[$k]) { throw "EA L$((9663+$k)) mismatch" } }
"EA_OLDVERBATIM_OK=5"
foreach ($q in @('MathIsValidNumber(currentPrice) && SlimbProtectiveSideOk', 's1x_sel = 2', 'slRef = g_sl41_px')) {
  if ((Count-Hits $lines[8] $q) -ne 1) { throw "E-hunk quote $q" }
}
"EA_NEWVERBATIM_OK=3"
$ident = @(2,4,10,12,14,16,18,19,20,21,22,23,24,25,29,31,35,43,47) + @(1,3,5,7,9,11,13,15,17,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56)
foreach ($i in $ident) { if ($lines[$i] -ne $pre[$i]) { throw "twin-drift idx $i" } }
"TWIN_IDENTICAL=44"
"TWIN_AMENDED=14"
$all = $lines -join "`n"
$ell = ([regex]::Matches($all, '\.\.\.')).Count
"ELLIPSIS=$ell"
if ($ell -ne 0) { throw 'ellipsis' }
"---DIGEST-CENSUS---"
[regex]::Matches($all, '[0-9A-F]{8,}') | Group-Object Value | Sort-Object Name | ForEach-Object { "$($_.Count)x $($_.Name)" }
"---LEFTOVER-SWEEP---"
foreach ($pat in @('Actual-path baseline', 'deal present', 'at deal level', 'proven by the absent SIGNAL', 'same envelope RECON44', 'D3 spends no run time', '7 TP_ELECT fire rows', 'FUTURE', 'counterfactual', 'print-only', 'RECON44_DEMO_P1', 'JPY', '9C79FC1E', 'InpAdoptExt1=false', 'v36', '22475D22', 'counterfactual D3', 'L9662-L9663 predicates', 'L8779 S5 call', 'L34 liveSel domain')) {
  $hits = @()
  for ($i = 0; $i -lt 58; $i++) { if ($lines[$i].Contains($pat)) { $hits += "L$($i+1)" } }
  "$pat => $($hits -join ',')"
}
$enc = New-Object Text.UTF8Encoding($hasBom)
[IO.File]::WriteAllText($Pkt, (($lines -join "`n") + "`n"), $enc)
$post = Get-FileHash -LiteralPath $Pkt -Algorithm SHA256
$bytes = (Get-Item -LiteralPath $Pkt).Length
"POST_HASH=$($post.Hash) POST_BYTES=$bytes POST_LINES=$(([IO.File]::ReadAllLines($Pkt)).Count)"
