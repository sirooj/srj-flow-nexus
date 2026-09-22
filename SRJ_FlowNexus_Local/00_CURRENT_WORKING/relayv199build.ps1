# relayv199build.ps1 - assemble BUILDER_RELAY_COUNCIL_v199-EXT1LIVE-CLEAR35.md (machine-pulled quotes + live digests; NO build/run)
$ErrorActionPreference = 'Stop'
$MQL = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$Pkt = Join-Path $MQL 'SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$EA = Join-Path $MQL 'Experts\SRJ_FlowNexus_EA.mq5'
$Rel = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v199-EXT1LIVE-CLEAR35.md'
$Rel198 = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v198-EXT1LIVE-RECLEAR34.md'
$Seg49 = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON49-EXT1LIVE-V35_JOURNAL.log'
if (Test-Path -LiteralPath $Rel) { throw 'collision: v199 relay exists' }
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
# whole-line pulls (disk, zero transcription)
$P001 = $pkt[0]; $P003 = $pkt[2]; $P005 = $pkt[4]; $P007 = $pkt[6]; $P009 = $pkt[8]
$P048 = $pkt[47]; $P054 = $pkt[53]; $P058 = $pkt[57]
# L46b tail extract (disk)
$tailAnchor = 'No new verdicts this round; Opus still out.'
$ti = $pkt[45].IndexOf($tailAnchor)
if ($ti -lt 0) { throw 'L46 tail anchor' }
$P046btail = $pkt[45].Substring($ti)
"TAIL_OK len=$($P046btail.Length)"
# span asserts (each new-span 1x in packet)
$spans = @(
  @('P011', 'On the v36 ext1 arm the selector is bypassed (s1x_sel=2, L9); this paragraph governs the else-arm fallback only.'),
  @('P013', 'A3 (09-08 16:40-bar fire) decline SUPERSEDED by the v36 live kill (no signal to decline; kill-all decline recorded as history), A1 (08-28 16:20-bar fire'),
  @('P015a', 'LIVE under the v36 rule'),
  @('P015b', 'graded at runtime this run'),
  @('P015c', 'the live run prints 6 TP_ELECT fire rows of 11 TP_ELECT rows total per section 4 (A3 non-fire at runtime);'),
  @('P020', '| 1.38 at runtime, passes R-gate; decline unchanged;'),
  @('P025', '| 0.68 live R-gate kill at runtime, no fire, no SIGNAL;'),
  @('P028a', 'run live on the S5 path this run.'),
  @('P028b', 'LIVE source-changed bars under this rule:'),
  @('P028c1', 'Five other fires print identical because live stop already equals s1px there (resolved by prints'),
  @('P028c2', 'never pre-accepted).'),
  @('P028d', '(liveSel=2 arm: slLive==pxExt1 mandatory)'),
  @('P028e1', 'A3 live stop 1.16359 (superseding the archived 1.16274)'),
  @('P028e2', 'with archived actual R 1.62 (superseded at runtime by 0.68)'),
  @('P028f', 'live ext1 adoption precedes the veto with refusal unchanged'),
  @('P030a', 'E-hunk executes the section-1 rule with one declared slRef live write'),
  @('P030b', 'THREE carried insertions A+B+C plus the new E-hunk'),
  @('P030c', 'section-1 rule EXECUTED by the E-hunk)'),
  @('P034a', 'plus 2-ext1-arm (slLive==pxExt1 mandatory, guard plus domain rechecked offline);'),
  @('P034b1', 'No assignment to the live path except the L9 E-hunk slRef write under this authorization.'),
  @('P034b2', 'AdoptOff held (dormant block inert, InpAdoptExt1=false), OrderSend 0 (measured this turn).'),
  @('P034b3', 'Live activation executes under this authorization (E-hunk); nothing further without token.'),
  @('P036', 'liveSel=2 (ext1 arm) likewise prints 0 (selector-fired incumbent required; reported, never graded)'),
  @('P038a', 'plus the L9 E-hunk (new, tag -v36), except the two explicitly named STAGE-1-bound RHS expressions,'),
  @('P038b', 'with the SOLE exception of the L9 E-hunk slRef write declared and gated here);'),
  @('P040a', 'this run settles at runtime'),
  @('P040b', 'never by output proximity (A3 kill ordered resolution-then-veto, proven by the absent SIGNAL);'),
  @('P042a', 'Actual-path baseline: 6 TP_ELECT fire rows of 11 TP_ELECT rows total (A3 prints R 0.68 non-fire),'),
  @('P042b', '(A1 fire-but-declined among them; the live run prints 6 fire rows (A3 non-fire at runtime)'),
  @('P042c', 'the section-2 post-activation count 6 prints at runtime (conditioned'),
  @('P042d', '6 TP_ELECT fire rows; A3 TP_ELECT row prints R 0.68 non-fire with no SIGNAL 16:45:01 (runtime grades, archived 1.62 row superseded as the live value'),
  @('P042e', 'the 6 TP_ELECT fire rows plus the A3 0.68 non-fire row, the A1 record-at-C plus self-consistency,'),
  @('P046a1', 'Opus-v179 B-7 ADOPTED as the L9 E-hunk (this relay)'),
  @('P046a2', 'existing L9661-L9665 selector effect-identical in the else arm under the L9 E-hunk (Opus-v179 B-7 adopted here).'),
  @('P046d', 'this run proves at runtime; the carried probe joins still settle'),
  @('P046e', 'items 5-6 adopted in v36 (guard inline; domain conjunct)'),
  @('P046f', 'items 3/6 answered-or-adopted (discovery boundary recorded; side-guard adopted in v36)'),
  @('P050a', 'post-MathFloor, unformatted lots value (the L10110 operand; not a pre-floor predicate)'),
  @('P050b', 'no floor-refusal expected at Deposit 10000 USD; any belowMin=1 halts with operands'),
  @('P050c', 'with flooredLots at or above volMin and no ABORT/A6REFUSED lot pair on any bar;'),
  @('P050d', 'with PRE-SEND lots plus deal present (9/4 executes at USD scale)'),
  @('P056a', '(8 rows curTp 1.16364 at 10:05-10:40, all 9 pasted whole v198)'),
  @('P056b', 'explicit Stage-1/Stage-3 check this run: T1 10:45 curTp == MTEXIT exit 1.16459; T2 16:25 curTp == MTEXIT exit 1.16416'),
  @('P056c', '(want/anti/htf* ride as ungraded context, never a grading rule)')
)
foreach ($p in $spans) { Assert-Pkt $p[1] $p[0] }
# EA regions (disk) + key anchors
$SEL = Get-Range 9663 9673 'SEL'
$GUARD = Get-Range 2578 2581 'GUARD'
$S5 = Get-Range 8779 8790 'S5'
$PUB = Get-Range 5494 5497 'PUB'
$RES = Get-Range 2795 2826 'RES'
$VETO = Get-Range 7682 7697 'VETO'
$SIDE = Get-Range 7705 7710 'SIDE'
$INP57 = $ea[56]; $INP71 = $ea[70]
$DORM = Get-Range 8807 8813 'DORM'
foreach ($q in @(@($SEL, 'probe_bSaved = true;', 'SEL'), @($GUARD, 'return ((dir == DIR_LONG) ? (refV < curPx) : (refV > curPx));', 'GUARD'), @($S5, 'if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))', 'S5'), @($PUB, 'g_sl41_def = sl41_def;', 'PUB'), @($RES, 'hasX1 = 1; px = v; slot = s;', 'RES'), @($VETO, 'SessionAlreadyUsed(sess, barTime)', 'VETO'), @($SIDE, 'g_dir           = S2ResolveLive', 'SIDE'), @($DORM, 'if(InpAdoptExt1 && InpDebugLog)', 'DORM'))) {
  if (-not $q[0].Contains($q[1])) { throw "EA anchor $($q[2])" }
}
if (-not $INP57.Contains('input double InpMinRewardRisk   = 1.0;')) { throw 'INP57' }
if (-not $INP71.Contains('input bool   InpAdoptExt1       = false;')) { throw 'INP71' }
"EA_OK=10 regions"
# live digests (measured inside this run)
"PKT_PRE_DIGEST_LEN=$($Pkt.Length) EA_PRE_DIGEST_LEN=$($EA.Length)"
$MQL = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$Pkt = Join-Path $MQL 'SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$EA = Join-Path $MQL 'Experts\SRJ_FlowNexus_EA.mq5'
$Seg49 = Join-Path $MQL 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON49-EXT1LIVE-V35_JOURNAL.log'
$ph = (Get-FileHash -LiteralPath $Pkt -Algorithm SHA256).Hash
$pb = (Get-Item -LiteralPath $Pkt).Length
$eh = (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
$eb = (Get-Item -LiteralPath $EA).Length
$sh = (Get-FileHash -LiteralPath $Seg49 -Algorithm SHA256).Hash
$sb = (Get-Item -LiteralPath $Seg49).Length
if ($sh -ne '48E3F4145F123838FD895A801A2BF185D7F6D9C485A23196BF7AB0F1D4152C1A') { throw "seg49 drift $sh" }
"DIGESTS pkt=$ph/$pb ea=$eh/$eb seg49=OK/$sb"
$out = @()
$out += 'CODE REVIEW REQUEST - v199 - 2026-09-20 (CLEARANCE 35: packet v36 turns the ext1 adoption LIVE via the E-hunk plus the USD envelope plus v36 text residuals; behavior change plus envelope change, one build plus one run)'
$out += ''
$out += 'Project brief (standing - read first):'
$out += '- Money: LIVE selector change confined to the E-hunk (one declared slRef write at the former selector site; fallback effect-identical). Alert-only EA (OrderSend count 0, measured this turn). No live trades. No funded money moves on any verdict here. The run needs dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.'
$out += '- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.'
$out += '- History: packet v30-v35 plus relays v193-v198 on disk; v198 unanimous ACCEPT spent on the v35 build plus RECON49 run (triple-key spent). This v36 is drafted on his B-first plus USD orders (B = live-activation relay, builder recommendation, veto-able).'
$out += '- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.'
$out += ''
$out += 'Change (one plain sentence): clear PACKET_EXT1LIVE-001 v36 by name for exactly one live build (E-hunk tag -v36 on the carried A/B/C/D1/D2 literals, tags -v28/-v32) plus one run RECON50-EXT1LIVE-V36 under the new USD envelope, with G1-G4 graded as amended in L50/L52/L54/L56.'
$out += ''
$out += 'Money (standing): live selector delta confined to the E-hunk. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.'
$out += 'Same-session note: this seat remembers the v198 prompt, so this page carries the v36 deltas plus the cited EA regions whole. Unchanged packet lines (35/58) were proven byte-identical by the v36 draft checks this turn (23 amended indices, 35 identical, ellipsis 0); prior texts ride by reference: v198 relay (2BCDBA8F/52026 B/42 lines; twin 5/5, morning rows 9/9) plus v35 packet (22475D22/165814 B/58 lines) plus the v198 verdicts (Luna ACCEPT key-1 spent, Sonnet advisory ACCEPT, GLM ACCEPT - triple-key spent on the v35 build plus RECON49 run).'
$out += 'File / function / lines: E-hunk replaces EA L9663-L9667 (5-line selector) with the conditional pasted at P009; B at L9668 unchanged; guard SlimbProtectiveSideOk at EA L2578-L2581; producer SrjResolveExt1 at EA L2795-L2826 with ComputeSlReference publication at L5494-L5497 from the S5 call at L8779; veto/session block EA L7682-L7697; side assignment EA L7708; inputs EA L57/L71; dormant S5 block EA L8807-L8813. Source digests (measured this turn, packet after last write, EA pre-build): EA @@EAHASH@@ / @@EABYTES@@ B; packet @@PKTHASH@@ / @@PKTBYTES@@ B / 58 lines.'
$out += 'Seat packaging: identical text to Luna plus Astra; keys volunteered only; either seat halts on a checkable discrepancy with line numbers.'
$out += ''
$out += 'DELTA TWIN (23 amended packet lines: 8 whole plus 15 new-span extracts, each asserted 1x against the packet this turn; 35 identical lines proven byte-identical by the draft checks; ellipsis 0; old v35 text rides 22475D22):'
$out += 'P001 (= packet L1, WHOLE): ' + $P001
$out += 'P003 (= packet L3, WHOLE): ' + $P003
$out += 'P005 (= packet L5, WHOLE): ' + $P005
$out += 'P007 (= packet L7, WHOLE): ' + $P007
$out += 'P009 (= packet L9 E-hunk, WHOLE): ' + $P009
$out += 'P011 (= packet L11, new span): ' + $spans[0][1]
$out += 'P013 (= packet L13, new span): ' + $spans[1][1]
$out += 'P015 (= packet L15, new spans): ' + $spans[2][1] + ' + ' + $spans[3][1] + ' + ' + $spans[4][1]
$out += 'P020 (= packet L20, new span): ' + $spans[5][1]
$out += 'P025 (= packet L25, new span): ' + $spans[6][1]
$out += 'P028 (= packet L28, new spans): ' + $spans[7][1] + ' + ' + $spans[8][1] + ' + ' + $spans[9][1] + ' + ' + $spans[10][1] + ' + ' + $spans[11][1] + ' + ' + $spans[12][1] + ' + ' + $spans[13][1] + ' + ' + $spans[14][1]
$out += 'P030 (= packet L30, new spans): ' + $spans[15][1] + ' + ' + $spans[16][1] + ' + ' + $spans[17][1]
$out += 'P034 (= packet L34, new spans): ' + $spans[18][1] + ' + ' + $spans[19][1] + ' + ' + $spans[20][1] + ' + ' + $spans[21][1]
$out += 'P036 (= packet L36, new span): ' + $spans[22][1]
$out += 'P038 (= packet L38, new spans): ' + $spans[23][1] + ' + ' + $spans[24][1]
$out += 'P040 (= packet L40, new spans): ' + $spans[25][1] + ' + ' + $spans[26][1]
$out += 'P042 (= packet L42, new spans): ' + $spans[27][1] + ' + ' + $spans[28][1] + ' + ' + $spans[29][1] + ' + ' + $spans[30][1] + ' + ' + $spans[31][1]
$out += 'P046 (= packet L46, new spans plus filed tail): ' + $spans[32][1] + ' + ' + $spans[33][1] + ' + ' + $spans[34][1] + ' + ' + $spans[35][1] + ' + ' + $spans[36][1] + ' + TAIL: ' + $P046btail
$out += 'P048 (= packet L48, WHOLE): ' + $P048
$out += 'P050 (= packet L50, new spans): ' + $spans[37][1] + ' + ' + $spans[38][1] + ' + ' + $spans[39][1] + ' + ' + $spans[40][1]
$out += 'P054 (= packet L54, WHOLE): ' + $P054
$out += 'P056 (= packet L56, new spans): ' + $spans[41][1] + ' + ' + $spans[42][1] + ' + ' + $spans[43][1]
$out += 'P058 (= packet L58, WHOLE): ' + $P058
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
$out += ''
$out += 'A3 ROWS (carried by reference, presence-asserted this turn): SLEXT481 S5 seq-13 row (ext1Slot 91, slExt1 1.16359) plus STOPRESOLVE seq-13 parts 1-3 (rLive 1.6229508196718447, rExt1 0.6780821917805907, wouldGate 0, actualGate 1) plus SIDE1E/SIDE1X pair (r0 1.62, r1 0.68, livePass 1) plus TP_ELECT R 1.62 bar 16:40 latchBar 16:45 plus SIGNAL 16:45:01 SHORT Monthly-POC ride v196/v198 plus the RECON49 segment (48E3F414/7244639 B/37361 lines, re-hashed this turn); the v36 run must show their runtime counterparts (SIDE1X liveStop 1.16359, TP_ELECT 0.68, zero SIGNAL 16:45:01).'
$out += ''
$out += 'RUN-COST: one live build (E-hunk tag -v36 on carried A/B/C/D1/D2, STAGE-1 exact-diff gated) plus one tester run RECON50-EXT1LIVE-V36, ceiling 90 minutes, new envelope (RECON50_DEMO_USD: RECON44_DEMO_P1 bytes with Currency JPY to USD, Deposit 10000, same Symbol/Period/Model/Leverage/inputs, same window 08-26 to 09-09, InpMode 1, InpDebugLog=true), same terminal. Build and run only on dual-key clear plus his run word plus token. No commit without token.'
$out += 'NOVEL-EVIDENCE: this run returns what no prior run did, named against RECON49 (V35, JPY, counterfactual-only): (a) E-hunk live kill of A3 at runtime (no SIGNAL 16:45:01, TP_ELECT 0.68, SIDE1X liveStop 1.16359, probe_sel=2 with slLive==pxExt1); (b) USD deal-level takes 4/4 with the 9/4 take executing; (c) lot-independent signal-path no-drift vs RECON49; (d) exit-bar equality as an explicit check. Takes 4/4 at deal level moves takes; the A3 kill moves precision.'
$out += ''
$out += 'Question (one, specific): clear PACKET_EXT1LIVE-001 v36 by name for exactly one live build plus one run under the envelope above, with G1-G4 graded as amended - accept, amend-with-delta, or halt, with line numbers.'
$out += 'Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.'
$out += 'Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.'
$out += 'Answer form: plain accept / amend-with-delta / halt, with line numbers, plus analytic answers.'
$out += 'Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.'
$out += 'Nothing else is asked. Thank you.'
$body = ($out -join "`n")
$body = $body.Replace('@@PKTHASH@@', $ph).Replace('@@PKTBYTES@@', "$pb").Replace('@@EAHASH@@', $eh).Replace('@@EABYTES@@', "$eb")
if ($body.Contains('@@')) { throw 'placeholder remains' }
foreach ($lbl in @('P001 (', 'P003 (', 'P005 (', 'P007 (', 'P009 (', 'P011 (', 'P013 (', 'P015 (', 'P020 (', 'P025 (', 'P028 (', 'P030 (', 'P034 (', 'P036 (', 'P038 (', 'P040 (', 'P042 (', 'P046 (', 'P048 (', 'P050 (', 'P054 (', 'P056 (', 'P058 (')) {
  $c = ([regex]::Matches($body, [regex]::Escape($lbl))).Count
  if ($c -ne 1) { throw "plabel $lbl count=$c" }
}
"PLABELS_OK=23"
foreach ($req in @('Analytic ask A (standing):', 'Analytic ask B (standing, code relays):', 'Answer form:', 'Verification split:', 'Question (one, specific):', 'Project brief (standing - read first):', 'RUN-COST:', 'NOVEL-EVIDENCE:')) {
  if (-not $body.Contains($req)) { throw "missing $req" }
}
"COMPLETENESS_OK=8"
if (([regex]::Matches($body, '\.\.\.')).Count -ne 0) { throw 'ellipsis' }
"ELLIPSIS_OK=0"
$ref = [IO.File]::ReadAllBytes($Rel198)
$useCRLF = ($ref | Where-Object { $_ -eq 13 }).Count -gt 0
"REF198_CRLF=$useCRLF"
if ($useCRLF) { $rlines = $body -split "`n"; [IO.File]::WriteAllLines($Rel, $rlines) } else { [IO.File]::WriteAllText($Rel, ($body + "`n"), (New-Object Text.UTF8Encoding($false))) }
$rh = (Get-FileHash -LiteralPath $Rel -Algorithm SHA256).Hash
$rb = (Get-Item -LiteralPath $Rel).Length
$rc = ([IO.File]::ReadAllLines($Rel)).Count
"POST_RELAY hash=$rh bytes=$rb lines=$rc"
