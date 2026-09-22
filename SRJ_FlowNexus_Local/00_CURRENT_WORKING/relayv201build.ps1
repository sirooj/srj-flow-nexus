# relayv201build.ps1 - assemble BUILDER_RELAY_COUNCIL_v201-EXT1LIVE-CLEAR37.md (v38 deltas; machine-pulled; NO build/run)
$ErrorActionPreference = 'Stop'
$MQL = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$Pkt = Join-Path $MQL 'SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$EA = Join-Path $MQL 'Experts\SRJ_FlowNexus_EA.mq5'
$Rel = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v201-EXT1LIVE-CLEAR37.md'
$Rel200 = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v200-EXT1LIVE-CLEAR36.md'
$Seg49 = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON49-EXT1LIVE-V35_JOURNAL.log'
if (Test-Path -LiteralPath $Rel) { throw 'collision: v201 relay exists' }
"COLLISION_OK=absent"
$pkt = [IO.File]::ReadAllLines($Pkt)
if ($pkt.Count -ne 58) { throw "pkt lines $($pkt.Count)" }
$ea = [IO.File]::ReadAllLines($EA)
function Get-Range($a, $b, $tag) {
  $r = $ea[($a - 1)..($b - 1)] -join "`n"
  if (($r -split "`n").Count -ne ($b - $a + 1)) { throw "range $tag" }
  return $r
}
function Assert-Pkt($s, $tag) {
  foreach ($ch in $s.ToCharArray()) { if ([int]$ch -gt 127) { throw "nonascii $tag" } }
  $c = 0; foreach ($ln in $pkt) { $c += ([regex]::Matches($ln, [regex]::Escape($s))).Count }
  if ($c -ne 1) { throw "pkt-hits!=1 $tag count=$c" }
  "SPAN_OK $tag"
}
$P001 = $pkt[0]; $P058 = $pkt[57]
$ti = $pkt[45].IndexOf('Luna-V200: ACCEPT on v37')
if ($ti -lt 0) { throw 'L46 tail anchor' }
$P046tail = $pkt[45].Substring($ti)
"TAIL_OK len=$($P046tail.Length)"
$p13i = $pkt[12].IndexOf('declines preserved')
if ($p13i -lt 0) { throw 'P013 anchor' }
$P013full = $pkt[12].Substring($p13i)
"P013_OK len=$($P013full.Length)"
$spans = @(
  @('P003a', 'tag -v37, sole new strategy stop-state write slRef at the former selector site'),
  @('P003b', 'PLUS one run RECON50-EXT1LIVE-V38 under the RECON50_DEMO_USD envelope'),
  @('P003c', 'Astra outstanding, waiver on his word'),
  @('P009a', '(LIVE replacement, tag -v37;'),
  @('P009b', 'currentPrice local L8754 single-write'),
  @('P030', 'FIVE carried literals A/B/C/D1/D2 plus the new E-hunk'),
  @('P038a', 'plus the L9 E-hunk (new literal v2, tag -v37), except'),
  @('P042a', 'RECON49-segment comparison per the whitelist contract below (archive 8B2ED676 retained as the RECON47-era method reference);'),
  @('P042b', 'the baseline source is the RECON49 segment named here so the comparator cannot drift (archive 8B2ED676 superseded for v38 runs);'),
  @('P042c', 'SIDE1X liveStop prints the adopted ext1 1.16299 iff the guard holds else the fallback stop'),
  @('P048', 'E-hunk carries tag -v37'),
  @('P050', 'Expected artifact at USD scale: tight-stop bars may print the volMax cap (EA L10114-L10115); capped lots grade as artifacts with volMax filed at build, never divergence.'),
  @('P058a', 'C spans L9674 single 9628B line.'),
  @('P058b', 'plus the carried A/B/C presence (C-span L9674 cited, halt-on-absence) above'),
  @('P058c', 'Run inputs: InpMode 1, InpDebugLog=true'),
  @('P058d', 'With InpDebugLog=false the globals hold defaults (g_sl41_def=0), ext1Take is false')
)
foreach ($p in $spans) { Assert-Pkt $p[1] $p[0] }
$SEL = Get-Range 9663 9673 'SEL'
$GUARD = Get-Range 2578 2581 'GUARD'
$S5 = Get-Range 8779 8790 'S5'
$PUB = Get-Range 5494 5497 'PUB'
$RES = Get-Range 2795 2826 'RES'
$VETO = Get-Range 7682 7697 'VETO'
$SIDE = Get-Range 7705 7710 'SIDE'
$INP57 = $ea[56]; $INP71 = $ea[70]
$DORM = Get-Range 8807 8813 'DORM'
$LOTCAP = Get-Range 10108 10115 'LOTCAP'
foreach ($q in @(@($SEL, 'probe_bSaved = true;', 'SEL'), @($GUARD, 'return ((dir == DIR_LONG) ? (refV < curPx) : (refV > curPx));', 'GUARD'), @($S5, 'if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))', 'S5'), @($PUB, 'g_sl41_def = sl41_def;', 'PUB'), @($RES, 'hasX1 = 1; px = v; slot = s;', 'RES'), @($VETO, 'SessionAlreadyUsed(sess, barTime)', 'VETO'), @($SIDE, 'g_dir           = S2ResolveLive', 'SIDE'), @($DORM, 'if(InpAdoptExt1 && InpDebugLog)', 'DORM'), @($LOTCAP, 'Lot size capped at volMax', 'LOTCAP'))) {
  if (-not $q[0].Contains($q[1])) { throw "EA anchor $($q[2])" }
}
"EA_OK=10 regions"
$MQL2 = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$Pkt2 = Join-Path $MQL2 'SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$EA2 = Join-Path $MQL2 'Experts\SRJ_FlowNexus_EA.mq5'
$Seg2 = Join-Path $MQL2 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON49-EXT1LIVE-V35_JOURNAL.log'
$ph = (Get-FileHash -LiteralPath $Pkt2 -Algorithm SHA256).Hash
$pb = (Get-Item -LiteralPath $Pkt2).Length
$eh = (Get-FileHash -LiteralPath $EA2 -Algorithm SHA256).Hash
$eb = (Get-Item -LiteralPath $EA2).Length
$sh = (Get-FileHash -LiteralPath $Seg2 -Algorithm SHA256).Hash
if ($sh -ne '48E3F4145F123838FD895A801A2BF185D7F6D9C485A23196BF7AB0F1D4152C1A') { throw "seg49 drift $sh" }
"DIGESTS pkt=$ph/$pb ea=$eh/$eb seg49=OK"
$out = @()
$out += 'CODE REVIEW REQUEST - v201 - 2026-09-20 (CLEARANCE 37: packet v38 folds the v200 deltas - tag roll, run rename, cite map, whitelist wiring, splice restructure, volMax note; one live build plus one run)'
$out += ''
$out += 'Project brief (standing - read first):'
$out += '- Money: LIVE selector change confined to the E-hunk v2 (currentPrice-finite conjunct added, tag -v37; one declared slRef write at the former selector site; fallback effect-identical). Alert-only EA (OrderSend count 0, measured this turn). No live trades. No funded money moves on any verdict here. The run needs dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.'
$out += '- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.'
$out += '- History: packet v30-v37 plus relays v193-v200 on disk; v200 round Luna-ACCEPT on v37 plus Sonnet/GLM advisory (amend on GLM, zero halts), Astra outstanding with waiver on his word. This v38 folds all three seats deltas as text.'
$out += '- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.'
$out += ''
$out += 'Change (one plain sentence): clear PACKET_EXT1LIVE-001 v38 by name for exactly one live build (E-hunk literal v2 tag -v37 on the carried A/B/C/D1/D2 literals, tags -v28/-v32) plus one run RECON50-EXT1LIVE-V38 under the new USD envelope, with G1-G4 graded as amended in L50/L52/L54/L56.'
$out += ''
$out += 'Money (standing): live selector delta confined to the E-hunk. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.'
$out += 'Session: CONTINUE previous council session (short/delta form; same-session note names v200).'
$out += 'Same-session note: this seat remembers the v200 prompt, so this page carries the v38 deltas plus the cited EA regions whole. Unchanged packet lines (48/58) were proven byte-identical by the v38 draft checks this turn (10 amended indices, 48 identical, ellipsis 0); prior texts ride by reference: v200 relay (AF43BACC/27886 B/149 lines; delta-twin 14/23) plus v37 packet (17C43C22/162201 B/58 lines) plus the v200 verdicts (Luna ACCEPT, Sonnet/GLM advisory amend, zero halts, filed whole 1x each; Luna v36-amend re-paste byte-identical duplicate, not filed twice; no Astra ruling pasted, waiver on his word).'
$out += 'File / function / lines: E-hunk literal v2 tag -v37 replaces EA L9663-L9667 with the amended conditional pasted at P009; B at L9668 unchanged (currentPrice-finite conjunct added); guard SlimbProtectiveSideOk at EA L2578-L2581; producer SrjResolveExt1 at EA L2795-L2826 with ComputeSlReference publication at L5494-L5497 from the S5 call at L8780; veto/session block EA L7682-L7697; side assignment EA L7708; inputs EA L57/L71; dormant S5 block EA L8807-L8813; lot cap EA L10114-L10115. Source digests (measured this turn, packet after last write, EA pre-build): EA @@EAHASH@@ / @@EABYTES@@ B; packet @@PKTHASH@@ / @@PKTBYTES@@ B / 58 lines.'
$out += 'Seat packaging: identical text to Luna plus Astra; keys volunteered only; either seat halts on a checkable discrepancy with line numbers.'
$out += ''
$out += 'DELTA TWIN (10 amended packet lines: 2 whole plus 8 new-span extracts, each asserted 1x against the packet this turn; 48 identical lines proven byte-identical by the draft checks; ellipsis 0; old v37 text rides 17C43C22):'
$out += 'P001 (= packet L1, WHOLE): ' + $P001
$out += 'P003 (= packet L3, new spans): ' + $spans[0][1] + ' + ' + $spans[1][1] + ' + ' + $spans[2][1]
$out += 'P009 (= packet L9 E-hunk v2, new spans): ' + $spans[3][1] + ' + ' + $spans[4][1]
$out += 'P030 (= packet L30, new span): ' + $spans[5][1]
$out += 'P038 (= packet L38, new span): ' + $spans[6][1]
$out += 'P042 (= packet L42, new spans): ' + $spans[7][1] + ' + ' + $spans[8][1] + ' + ' + $spans[9][1]
$out += 'P046 (= packet L46, filed tail): TAIL: ' + $P046tail
$out += 'P048 (= packet L48, new span): ' + $spans[10][1]
$out += 'P050 (= packet L50, new span): ' + $spans[11][1]
$out += 'P058 (= packet L58, WHOLE): ' + $P058
$out += 'P013 (= packet L13, sentence-boundary span, relay-side fix per GLM Ask A-9): ' + $P013full
$out += ''
$out += 'EA EVIDENCE (whole contiguous regions, pulled from disk this turn, byte-exact):'
$out += '[SEL EA L9663-L9673]'
$out += $SEL
$out += '[GUARD EA L2578-L2581]'
$out += $GUARD
$out += '[S5 EA L8779-L8790]'
$out += $S5
$out += '[PUB EA L5494-L5497]'
$out += $PUB
$out += '[RESOLVER EA L2795-L2826]'
$out += $RES
$out += '[VETO EA L7682-L7697]'
$out += $VETO
$out += '[SIDE EA L7705-L7710]'
$out += $SIDE
$out += '[INPUTS EA L57 + L71]'
$out += $INP57
$out += $INP71
$out += '[DORMANT EA L8807-L8813]'
$out += $DORM
$out += '[LOTCAP EA L10108-L10115]'
$out += $LOTCAP
$out += ''
$out += 'A3 ROWS (carried by reference, presence-asserted this turn): SLEXT481 S5 seq-13 row (ext1Slot 91, slExt1 1.16359) plus STOPRESOLVE seq-13 parts 1-3 (rLive 1.6229508196718447, rExt1 0.6780821917805907, wouldGate 0, actualGate 1) plus SIDE1E/SIDE1X pair (r0 1.62, r1 0.68, livePass 1) plus TP_ELECT R 1.62 bar 16:40 latchBar 16:45 plus SIGNAL 16:45:01 SHORT Monthly-POC ride v196/v200 plus the RECON49 segment (48E3F414/7244639 B/37361 lines, re-hashed this turn); the v38 run must show their runtime counterparts (SIDE1X liveStop 1.16359, TP_ELECT 0.68, zero SIGNAL 16:45:01).'
$out += ''
$out += 'RUN-COST: one live build (E-hunk literal v2 tag -v37 on carried A/B/C/D1/D2, STAGE-1 exact-diff gated with A/B/C presence) plus one tester run RECON50-EXT1LIVE-V38, ceiling 90 minutes, new envelope (RECON50_DEMO_USD: RECON44_DEMO_P1 bytes with Currency JPY to USD, Deposit 10000 unchanged, same Symbol/Period/Model/Leverage/inputs, same window 08-26 to 09-09, InpMode 1, InpDebugLog=true - live arm authorized only under it), same terminal. Build and run only on dual-key clear plus his run word plus token. No commit without token.'
$out += 'NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON49 (V35, JPY, counterfactual-only): (a) E-hunk live kill of A3 at runtime (no SIGNAL 16:45:01, TP_ELECT 0.68, SIDE1X liveStop 1.16359, probe_sel=2 with slLive==pxExt1); (b) USD send-preparation-complete takes 4/4 with the 9/4 take completing the chain; (c) lot-independent signal-path no-drift vs RECON49 under the whitelist contract (selection/gate invariance only); (d) exit-bar equality as an explicit check. Takes move at send-preparation-complete level; the A3 kill moves precision.'
$out += ''
$out += 'Question (one, specific): clear PACKET_EXT1LIVE-001 v38 by name for exactly one live build plus one run under the envelope above, with G1-G4 graded as amended - accept, amend-with-delta, or halt, with line numbers.'
$out += 'Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.'
$out += 'Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.'
$out += 'Answer form: plain accept / amend-with-delta / halt, with line numbers, plus analytic answers.'
$out += 'Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.'
$out += 'Nothing else is asked. Thank you.'
$body = ($out -join "`n")
$body = $body.Replace('@@PKTHASH@@', $ph).Replace('@@PKTBYTES@@', "$pb").Replace('@@EAHASH@@', $eh).Replace('@@EABYTES@@', "$eb")
if ($body.Contains('@@')) { throw 'placeholder remains' }
foreach ($lbl in @('P001 (', 'P003 (', 'P009 (', 'P030 (', 'P038 (', 'P042 (', 'P046 (', 'P048 (', 'P050 (', 'P058 (', 'P013 (')) {
  $c = ([regex]::Matches($body, [regex]::Escape($lbl))).Count
  if ($c -ne 1) { throw "plabel $lbl count=$c" }
}
"PLABELS_OK=11"
foreach ($req in @('Analytic ask A (standing):', 'Analytic ask B (standing, code relays):', 'Answer form:', 'Verification split:', 'Question (one, specific):', 'Project brief (standing - read first):', 'RUN-COST:', 'NOVEL-EVIDENCE:', 'Session: CONTINUE previous council session')) {
  if (-not $body.Contains($req)) { throw "missing $req" }
}
"COMPLETENESS_OK=9"
if (([regex]::Matches($body, '\.\.\.')).Count -ne 0) { throw 'ellipsis' }
"ELLIPSIS_OK=0"
$ref = [IO.File]::ReadAllBytes($Rel200)
$useCRLF = ($ref | Where-Object { $_ -eq 13 }).Count -gt 0
"REF200_CRLF=$useCRLF"
if ($useCRLF) { $rlines = $body -split "`n"; [IO.File]::WriteAllLines($Rel, $rlines) } else { [IO.File]::WriteAllText($Rel, ($body + "`n"), (New-Object Text.UTF8Encoding($false))) }
$rh = (Get-FileHash -LiteralPath $Rel -Algorithm SHA256).Hash
$rb = (Get-Item -LiteralPath $Rel).Length
$rc = ([IO.File]::ReadAllLines($Rel)).Count
"POST_RELAY hash=$rh bytes=$rb lines=$rc"
