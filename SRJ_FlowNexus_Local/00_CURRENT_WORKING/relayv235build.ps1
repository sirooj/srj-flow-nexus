# relayv235 build script: assembles BUILDER_RELAY_COUNCIL_v235-VNEXT-CLEAR1.md
# Rule: every pasted byte comes from disk pulls inside this run. Twin is
# generated, never typed. Length asserted on every block before the write.
# ASCII only. Single-quoted strings. No backticks. Echoes in main flow only.

$mql5 = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$ea = $mql5 + '\Experts\SRJ_FlowNexus_EA.mq5'
$panels = $mql5 + '\Include\SRJ\SRJ_Panels.mqh'
$textf = $mql5 + '\Include\SRJ\SRJ_Text.mqh'
$imb = $mql5 + '\Include\SRJ\SRJ_ImbalanceMgr.mqh'
$bias = $mql5 + '\Include\SRJ\SRJ_BiasEngine.mqh'
$pkt = $mql5 + '\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-VNEXT-1.md'
$seg54 = $mql5 + '\SRJ_FlowNexus_Local\06_HANDOFFS\RECON54-SEEDFIX-V1_JOURNAL.log'
$seg51 = $mql5 + '\SRJ_FlowNexus_Local\06_HANDOFFS\RECON51-EXITGATE-V1_JOURNAL.log'
$out = $mql5 + '\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v235-VNEXT-CLEAR1.md'
$NL = [Environment]::NewLine

function Get-Lines($f, $a, $b) {
  $all = Get-Content -LiteralPath $f -Encoding UTF8
  return $all[($a - 1)..($b - 1)]
}

function Get-Hits($f, $pat) {
  $r = Select-String -LiteralPath $f -Pattern $pat -SimpleMatch
  if ($null -eq $r) { return @() }
  return @($r | ForEach-Object { $_.Line })
}

function Get-Hash3($f) {
  $h = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash
  $b = (Get-Item -LiteralPath $f).Length
  $l = (Get-Content -LiteralPath $f).Count
  return @($h, $b, $l)
}

# --- packet twin (mechanical, UTF8 read) ---
$pl = Get-Content -LiteralPath $pkt -Encoding UTF8
if ($pl.Count -ne 114) { Write-Output 'STOP packet lines not 114'; exit 1 }
$twin = @()
for ($i = 0; $i -lt $pl.Count; $i++) {
  $n = $i + 1
  $twin += ('P{0:D3} (= packet L{1}, whole): {2}' -f $n, $n, $pl[$i])
}
if ($twin.Count -ne 114) { Write-Output 'STOP twin count'; exit 1 }
$ph = Get-Hash3 $pkt
Write-Output ('PACKET {0} / {1} / {2}' -f $ph[0].Substring(0,8), $ph[1], $ph[2])

# --- regions (machine slices, byte-verified later) ---
$regions = @()
$regions += @('[[R-E1A-B]]', 'EA L7478-L7507 t78 computation plus WOULDPREEMPT print (E1a reads t78_opp here)')
$regions += Get-Lines $ea 7478 7507
$regions += @('[[R-E1A-E]]')
$regions += @('[[R-E1A2-B]]', 'EA L7521-L7560 preempt transfer (E1 anchors L7531-L7533 inside; POIREPLACE removal comment L7508-L7520 excluded by the ellipsis gate, uncited by this packet)')
$regions += Get-Lines $ea 7521 7560
$regions += @('[[R-E1A2-E]]')
$regions += @('[[R-E1B-B]]', 'EA L2117-L2144 ShadowConfirmPoll plus L2162-L2203 IsConfirmationCandle (E1a calls)')
$regions += Get-Lines $ea 2117 2144
$regions += Get-Lines $ea 2162 2203
$regions += @('[[R-E1B-E]]')
$regions += @('[[R-E3-B]]', 'EA L11088-L11290 EvaluateManagedTrade whole (E3 anchors L11143-L11274 inside)')
$regions += Get-Lines $ea 11088 11290
$regions += @('[[R-E3-E]]')
$regions += @('[[R-E4A-B]]', 'EA L9935-L9978 latch-site veto (E4a anchors L9942-L9950 inside)')
$regions += Get-Lines $ea 9935 9978
$regions += @('[[R-E4A-E]]')
$regions += @('[[R-E4B-B]]', 'EA L7225-L7263 S4 poll plus veto stamp (E4b anchors L7240-L7253 inside)')
$regions += Get-Lines $ea 7225 7263
$regions += @('[[R-E4B-E]]')
$regions += @('[[R-E2A-B]]', 'Panels L12-L36 color plus L188-L260 render (E2a anchor L213-L237 inside)')
$regions += Get-Lines $panels 12 36
$regions += Get-Lines $panels 188 260
$regions += @('[[R-E2A-E]]')
$regions += @('[[R-E2B-B]]', 'Text L42-L71 status line (blank-FVG anchor L51-L63 inside)')
$regions += Get-Lines $textf 42 71
$regions += @('[[R-E2B-E]]')
$regions += @('[[R-E2C-B]]', 'ImbalanceMgr L444-L481 tick recompute (E2b anchor L467-L480 inside)')
$regions += Get-Lines $imb 444 481
$regions += @('[[R-E2C-E]]')
$regions += @('[[R-E2D-B]]', 'BiasEngine L149-L175 checklist plus L214-L263 renewal and flip (reset anchors inside)')
$regions += Get-Lines $bias 149 175
$regions += Get-Lines $bias 214 263
$regions += @('[[R-E2D-E]]')
if ($regions.Count -lt 600) { Write-Output 'STOP regions short'; exit 1 }
Write-Output ('REGIONS lines={0}' -f $regions.Count)

# --- rows (mechanical pulls with count asserts) ---
$rows = @()
$rows += @('[[R-JROWS-B]]')
$jc = 0
function Add-Row($line) {
  $script:jc++
  return ('J{0}: {1}' -f $script:jc, $line)
}
$h1 = Get-Hits $seg54 'RETESTBOOK bar=2026.09.08 16:55 hits=1'
if ($h1.Count -ne 1) { Write-Output 'STOP J 16:55 book54'; exit 1 }
$rows += Add-Row $h1[0]
$h2 = Get-Hits $seg54 'CONFIRMPOLL bar=2026.09.08 16:55 anchor=Weekly-VWAP'
if ($h2.Count -ne 1) { Write-Output 'STOP J confirmpoll54'; exit 1 }
$rows += Add-Row $h2[0]
$h3 = Get-Hits $seg54 'SUPPRESSED bar=2026.09.08 16:55 poi=Monthly-POC dir=SHORT opp=1'
if ($h3.Count -ne 1) { Write-Output 'STOP J suppressed54'; exit 1 }
$rows += Add-Row $h3[0]
$h4 = Get-Hits $seg54 'SIDE1H_WOULDPREEMPT bar=2026.09.08 16:55'
if ($h4.Count -ne 1) { Write-Output 'STOP J wouldpreempt54'; exit 1 }
$rows += Add-Row $h4[0]
$h5 = Get-Hits $seg54 'SIDE1D_BOTHDIRS bar=2026.09.08 16:55'
if ($h5.Count -ne 2) { Write-Output 'STOP J side1d54'; exit 1 }
$rows += Add-Row $h5[0]
$rows += Add-Row $h5[1]
$h6 = Get-Hits $seg54 'S1WAIT bar=2026.09.08 16:55'
if ($h6.Count -ne 1) { Write-Output 'STOP J s1wait54'; exit 1 }
$rows += Add-Row $h6[0]
$h7 = Get-Hits $seg54 'ANCHOR_ELECT bar=2026.09.08 16:45'
if ($h7.Count -ne 1) { Write-Output 'STOP J anchor54'; exit 1 }
$rows += Add-Row $h7[0]
$h8 = Get-Hits $seg51 'CONFIRMPOLL bar=2026.09.08 16:55 anchor=Monthly-POC'
if ($h8.Count -ne 1) { Write-Output 'STOP J confirmpoll51'; exit 1 }
$rows += Add-Row $h8[0]
$h9 = Get-Hits $seg51 'TP_ELECT shadow=true entry=1.16220'
if ($h9.Count -ne 1) { Write-Output 'STOP J elect51'; exit 1 }
$rows += Add-Row $h9[0]
$h10 = Get-Hits $seg51 'SUPPRESSED bar=2026.09.08 16:55'
if ($h10.Count -ne 1) { Write-Output 'STOP J suppressed51'; exit 1 }
$rows += Add-Row $h10[0]
$h11 = Get-Hits $seg54 'FRESHCOUNT #39 '
if ($h11.Count -ne 1) { Write-Output 'STOP J fresh39'; exit 1 }
$rows += Add-Row $h11[0]
$h12 = Get-Hits $seg54 'VETOCLEAR bar=2026.09.04 10:35'
if ($h12.Count -ne 1) { Write-Output 'STOP J veto1035'; exit 1 }
$rows += Add-Row $h12[0]
$h13 = Get-Hits $seg54 'MTEXIT bar=2026.09.04 16:10'
if ($h13.Count -ne 1) { Write-Output 'STOP J mtexit94'; exit 1 }
$rows += Add-Row $h13[0]
$h14 = Get-Hits $seg54 'TP_ELECT shadow=true entry=1.16265'
if ($h14.Count -ne 1) { Write-Output 'STOP J elect1040'; exit 1 }
$rows += Add-Row $h14[0]
$rows += @('[[R-JROWS-E]]')
Write-Output ('ROWS J=1..{0}' -f $jc)

# --- counts and digests (machine) ---
$cAbort = (Get-Hits $seg54 'verdict=ABORT' | Where-Object { $_ -match 'FRESHCOUNT' }).Count
$cVeto = (Get-Hits $seg54 'FRESH_VETO').Count
$cVeto2 = (Get-Hits $seg54 'FRESHVETO').Count
$cDay = (Get-Hits $seg54 'DAY_CLOSE').Count
$cDay2 = (Get-Hits $seg54 'DayClose').Count
$cFlip = (Get-Hits $seg54 'MTFLIP').Count
$cSig = (Get-Hits $seg54 'ALERT SRJ SIGNAL').Count
$cTp = (Get-Hits $seg54 'TP_ELECT').Count
$cX = (Get-Hits $seg54 'SIDE1X_STOPREF').Count
$cLatch = (Get-Hits $seg54 'TP_RR_FAIL_LATCH').Count
$cSnap = (Get-Hits $seg54 'MTSNAP').Count
$cExit = (Get-Hits $seg54 'MTEXIT').Count
$cLife = (Get-Hits $seg54 'MTLIFE').Count
$eh = Get-Hash3 $ea
$s54 = Get-Hash3 $seg54
$s51 = Get-Hash3 $seg51
$rh = Get-Hash3 ($mql5 + '\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON54-SEEDFIX-V1.md')
Write-Output ('COUNTS abort={0} veto={1}/{2} day={3}/{4} flip={5} sig={6} tpelect={7} side1x={8} latch={9} snap={10} mtexit={11} mtlife={12}' -f $cAbort, $cVeto, $cVeto2, $cDay, $cDay2, $cFlip, $cSig, $cTp, $cX, $cLatch, $cSnap, $cExit, $cLife)
Write-Output ('EA {0} / {1} / {2}' -f $eh[0].Substring(0,8), $eh[1], $eh[2])
Write-Output ('SEG54 {0} / {1} / {2}' -f $s54[0].Substring(0,8), $s54[1], $s54[2])
Write-Output ('SEG51 {0} / {1} / {2}' -f $s51[0].Substring(0,8), $s51[1], $s51[2])

$head = @(
'# CODE REVIEW REQUEST - v235 - 2026-09-22 (PACKET_P-VNEXT-1 v1: four behavior fixes from RECON54 data; nothing builds or spends on this verdict alone)',
'',
'## Project brief (standing - read first)',
'',
'- Money: clearance ask for exactly one behavior build (E1 displace plus E2 anchor fallback plus E3 precedence plus E4 veto re-key, STAGE-1 exact-diff gated) plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.',
'- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.',
'- Lineage: seedfix thread closed - V235 CLEAR-CONDITIONAL on relay v234 executed (RECON54 DONE PASSED 2026-09-22 22:02:03, takes 4, result F53B67D9/203, ledger 609). This v-next packet is new scope on his four-item word of 2026-09-22 (16:55 election, pane-anchor plus FVG-validity, day-close leg, veto persistence), undisputed. Prior texts ride labeled with file plus marker plus digest, never as words of any seat.',
'- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.',
'',
'## Change (one plain sentence)',
'',
'Clear PACKET_P-VNEXT-1 v1 by name (E1 confirmed-opposite displacement at S1, E2 anchor-fallback display plus state, E3 B-fork precedence MEANREV, E4 dir-keyed veto) for exactly one build plus one run under RECON50_DEMO_USD with G1-G4 graded as stated.',
'',
'## Money (standing)',
'',
'Behavior build confined to four hunks (EA E1 plus E3 plus E4a plus E4b, Panels E2a, Imbalance E2b). Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.',
'',
'## Session',
'',
'NEW fresh session every time (his order 2026-09-20). Prior texts ride labeled with file plus marker plus digest, never as anyone words.',
'',
'## Packet',
'',
('01_TASKS\PACKET_P-VNEXT-1.md v1 DRAFT: ' + $ph[0] + ' / ' + $ph[1] + ' B / ' + $ph[2] + ' lines (E1 displace plus E2a fallback plus E2b fallback plus E3 precedence plus E4a plus E4b re-key; EA budget plus 9 new minus 1 deleted with 5 modified stated convention; takes swap 4 to 4, not growth). Pre-build tree: ' + $eh[0] + ' / ' + $eh[1] + ' B / ' + $eh[2] + ' lines (v3-built, uncommitted; STAGE-1 halts on drift).'),
'',
'## Seat packaging',
'',
'Identical text to Luna plus Sonnet plus GLM (three seats per the live AGENTS transport line). Keys volunteered only (Luna remains sole key source); any seat halts on a checkable discrepancy with line numbers. v235-round verdicts file under V236 markers (V235 markers hold the seedfix round).',
'',
'## TWIN (v1 packet: all 114 packet-lines quoted whole below, P001-P114; bodies verbatim, generated mechanically from disk bytes)',
'',
'[[TWIN-B]]'
)
$mid = @(
'[[TWIN-E]]',
'',
'## REGIONS (whole contiguous code, byte-exact vs disk, zero elisions)',
''
)
$grules = @(
'## G-RULES (packet v1 G1-G4 operative, carried by reference to the twin above)',
'',
'G1 build 0/0 both targets plus post-hash plus budget (EA plus 9 new minus 1 deleted with 5 modified from literals; Panels plus 16; Imbalance plus 13; State/Sessions/FlowLogic/Text/BiasEngine plus 0). G2 selection deltas (SIDE1C displace fires, 17:00 SHORT takes, 16:40 block plus no pre-16:55 election kept, 9/4 10:35 refused with FRESH_VETO, other 3 takes identical, takes total 4). G3 state (FRESHCOUNT adverse rises itemized, no new alert kinds, flips plus renewals joined, pane side council-read). G4 exits (BREAK on MEANREV zero, DAY_CLOSE on held MEANREV, 9/4 classification recorded as measured).',
'',
'## ROWS (raw journal rows for recompute - J1-J15 mechanical pulls, whole lines)',
''
)
$tail = @(
'',
'## ROW-COUNTS (machine, RECON54 segment unless noted)',
'',
('FRESHCOUNT verdict=ABORT pre-confirmation kills: ' + $cAbort + ' (all S4_ARMED adverse 2, incl 9/4 10:30 fvgDead plus opp). FRESH_VETO rows: ' + $cVeto + ' with FRESHVETO variant ' + $cVeto2 + ' (veto never fired). DAY_CLOSE rows: ' + $cDay + ' (F3 zero; DayClose variant ' + $cDay2 + ' is MTLIFE field names, not exits). MTFLIP rows: ' + $cFlip + '. Baseline families SIGNAL ' + $cSig + ' TP_ELECT ' + $cTp + ' SIDE1X ' + $cX + ' LATCH ' + $cLatch + ' MTSNAP ' + $cSnap + ' MTEXIT ' + $cExit + ' MTLIFE ' + $cLife + '.'),
('Segments: RECON54 ' + $s54[0] + ' / ' + $s54[1] + ' / ' + $s54[2] + '; RECON51 ' + $s51[0] + ' / ' + $s51[1] + ' / ' + $s51[2] + '; result file ' + $rh[0] + ' / ' + $rh[1] + ' / ' + $rh[2] + '.'),
'',
'## DISSENT AND PARKS (open)',
'',
'B fork RULED 2026-09-22 per his word (DAY_CLOSE-minus-5 outranks POI_BODY_BREAK on mean-reversion; Luna direction). 9/4 classifier thread open (E3 measures classification; a BOTH repeat names the classifier as next thread, never misgraded). E2a display verified council-code plus his chart eyes (tester-blind, stated outright). Parked with reasons: regime classifier change, HTF re-enable, B3 same-direction upgrade, shared-result refactor (all v-next-plus, operator-vetoable). His veto on substance stands.',
'',
'## RUN-COST',
'',
'One build (EA four hunks plus two include hunks per packet v1, STAGE-1 exact-diff gated) plus one tester run under RECON50_DEMO_USD, ceiling 90 minutes, explicit values authoritative (InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog true, same terminal). Measured class 52 to 53 minutes wall (RECON53 0:52:48, RECON54 0:52:22); no other run in period. Build and run only on dual-key clear plus his run word plus token. No commit without token.',
'',
'## NOVEL-EVIDENCE',
'',
'This run returns what no prior run did, named against RECON54 (3BAC352E, takes 4 with 10:40 invalid-taken and 17:00 missed): (a) first 17:00 take under the current tree (E1 displacement live); (b) first FRESH_VETO fire plus BOUND-clear extinction (E4 persistence live); (c) first non-blank 2xOB reads plus shifted FRESHCOUNT compositions (E2 fallback live); (d) first DAY_CLOSE exit on a MEANREV hold, or the 9/4 classification rows that name the classifier thread (E3 precedence live). Exit figures are target figures, never realized fills. This run restores exactly one valid take (17:00) and refuses exactly one invalid take (10:40) - rule-fidelity, never profit.',
'',
'## Question (one, specific)',
'',
'Clear PACKET_P-VNEXT-1 v1 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.',
'',
'## Analytic ask A (standing)',
'',
'Name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.',
'',
'## Analytic ask B (standing, code relays)',
'',
'State any better mechanism you see for the stated goal, with the code lines it would touch.',
'',
'## Answer form',
'',
'Plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.',
'',
'## Verification split',
'',
'Rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.',
'',
'Nothing else is asked. Thank you.'
)

$all = @()
$all += $head
$all += $twin
$all += $mid
$all += $regions
$all += $grules
$all += $rows
$all += $tail
if ($all.Count -lt 800) { Write-Output 'STOP assembled short'; exit 1 }
[System.IO.File]::WriteAllLines($out, $all, (New-Object System.Text.UTF8Encoding $false))
$rh2 = Get-Hash3 $out
Write-Output ('WROTE {0} / {1} / {2}' -f $rh2[0].Substring(0,8), $rh2[1], $rh2[2])
