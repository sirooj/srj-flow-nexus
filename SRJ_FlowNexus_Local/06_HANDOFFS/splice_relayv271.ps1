# Splice relay v271 (mechanical build: packet twin + disk code region + segment rows; all counts asserted beside output).
$Hdir = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$Tdir = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS'
$pkt = Join-Path $Tdir 'PACKET_P-DAY2355-1.md'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$seg = Join-Path $Hdir 'RECON60-RESQUAT-V12_JOURNAL.log'
$res = Join-Path $Hdir 'BUILDER_RESULT_RECON60-RESQUAT-V12.md'
$tab = Join-Path $Hdir 'RECON60-RESQUAT-V12_TABULATION.txt'
$out = Join-Path $Hdir 'BUILDER_RELAY_COUNCIL_v271-DAY2355-CLEAR1.md'
if (Test-Path -LiteralPath $out) { 'RELAY_EXISTS_HALT'; exit 1 }
$pl = Get-Content -LiteralPath $pkt
$el = Get-Content -LiteralPath $ea
$sl = Get-Content -LiteralPath $seg
'PRECOUNT_PKT=' + $pl.Count
'PRECOUNT_EA=' + $el.Count
'PRECOUNT_SEG=' + $sl.Count
if (-not $el[11428].Contains('dayMarks[dc] <= barTime)')) { 'CTL_EA_ANCHOR_HALT'; exit 1 }
if ($el[11422].Contains('for(int dc')) { 'CTL_EA_ALIGN_HALT'; exit 1 }
'CTL_OK=anchor-11429-present align-11423-absent'
function Digest8($pp) { return ((Get-FileHash -LiteralPath $pp -Algorithm SHA256).Hash).Substring(0, 8) }
$eaD = Digest8 $ea
$eaB = (Get-Item -LiteralPath $ea).Length
$eaL = (Get-Content -LiteralPath $ea).Count
$pktD = Digest8 $pkt
$pktB = (Get-Item -LiteralPath $pkt).Length
$pktL = (Get-Content -LiteralPath $pkt).Count
$resD = Digest8 $res
$resB = (Get-Item -LiteralPath $res).Length
$resL = (Get-Content -LiteralPath $res).Count
$tabD = Digest8 $tab
$tabB = (Get-Item -LiteralPath $tab).Length
$tabL = (Get-Content -LiteralPath $tab).Count
$segD = Digest8 $seg
$segB = (Get-Item -LiteralPath $seg).Length
$segL = (Get-Content -LiteralPath $seg).Count
'DIGESTS=ea:' + $eaD + '/' + $eaB + '/' + $eaL + ' pkt:' + $pktD + '/' + $pktB + '/' + $pktL + ' res:' + $resD + '/' + $resB + '/' + $resL + ' tab:' + $tabD + '/' + $tabB + '/' + $tabL + ' seg:' + $segD + '/' + $segB + '/' + $segL
$px = @()
for ($ii = 0; $ii -lt $pl.Count; $ii++) { $nn = '{0:D3}' -f ($ii + 1); $px += ('P' + $nn + ': ' + $pl[$ii]) }
'TWIN_PCOUNT=' + $px.Count
$normP = @($pl)
$normB = @()
foreach ($pp in $px) { $normB += $pp.Substring(6) }
if ($normP.Count -gt 0 -and $normP[$normP.Count - 1] -eq '') { $normP = $normP[0..($normP.Count - 2)] }
if ($normB.Count -gt 0 -and $normB[$normB.Count - 1] -eq '') { $normB = $normB[0..($normB.Count - 2)] }
$onlyA = @($normB | Where-Object { $normP -notcontains $_ })
$onlyB = @($normP | Where-Object { $normB -notcontains $_ })
'TWIN_DIFF=' + ($onlyA.Count + $onlyB.Count)
if (($onlyA.Count + $onlyB.Count) -ne 0) { 'TWIN_HALT'; exit 1 }
$cx = @()
for ($ln = 11424; $ln -le 11472; $ln++) { $cx += ('C' + $ln + ': ' + $el[$ln - 1]) }
'CODE_LINES=' + $cx.Count
$mclose = @($sl | Where-Object { $_.Contains('MTCLOSE') -and $_.Contains('2026.09.04 23:55') })
'mclose=' + $mclose.Count
if ($mclose.Count -ne 1) { 'ROW_MTCLOSE_HALT'; exit 1 }
$mexit = @($sl | Where-Object { $_.Contains('MTEXIT') -and $_.Contains('2026.09.04 23:55') })
'mexit=' + $mexit.Count
if ($mexit.Count -ne 1) { 'ROW_MTEXIT_HALT'; exit 1 }
$deal7 = @($sl | Where-Object { $_.Contains('deal performed') -and $_.Contains('[#7 ') })
'deal7=' + $deal7.Count
if ($deal7.Count -ne 1) { 'ROW_DEAL7_HALT'; exit 1 }
$fri = @($sl | Where-Object { $_ -match 'Core 04\t2026\.09\.04 23:55' })
'FRI16=' + $fri.Count
if ($fri.Count -ne 16) { 'ROW_FRI_HALT'; exit 1 }
$tx = @()
$tx += 'CODE REVIEW REQUEST - v271 - 2026-09-25 (PACKET_P-DAY2355-1 v2: exact 23:55-open day-close fill; nothing builds or spends on this verdict alone)'
$tx += 'Seats: identical text to Luna + GLM (his free-low-tier-only word for this small fix; frontier Opus + Astra excluded on his word, waiver-class precedent v270 ledger 720/724/733). Keys come only from the key seat; this relay demands none.'
$tx += '%%BRIEF%%'
$tx += 'Change (one plain sentence): clear PACKET_P-DAY2355-1 v2 by name for exactly one build (E1 4-line day-mark lookahead as pasted, STAGE-1 exact-diff gated) plus one scoped run (Friday 9/4 00:00 to Monday 9/8 00:00, acceptance A1-A3 as stated).'
$tx += ('File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 / EvaluateManagedTrade / EA 11424-11472 (trigger block + price + executor, contiguous ' + $cx.Count + ' lines, zero elisions)')
$tx += ('Source digest: ' + $eaD + ' / ' + $eaB + ' B / ' + $eaL + ' lines (measured after last write; tree unmodified since the RECON60 build)')
$tx += ('Priors (labeled, never unattributed): RECON60 result ' + $resD + '/' + $resB + '/' + $resL + ' + tabulation ' + $tabD + '/' + $tabB + '/' + $tabL + ' (7 takes, Monday-fill defect in rows below); packet v1 F4739FA2/6030/57 superseded untransported; v225 weekend semantic retired for DAY_CLOSE by his 2026-09-25 word.')
$tx += ('Packet v2 twin (P-prefixed ' + $px.Count + ' lines, prefix-stripped bodies diff 0 vs ' + $pktD + '/' + $pktB + '/' + $pktL + ', asserted above):')
foreach ($pp in $px) { $tx += $pp }
$tx += 'Complete code, verbatim, no elisions (C-prefixed with true disk line numbers; anchor + alignment controls asserted above; proposed insert rides in the packet twin above, not as disk code):'
foreach ($cc in $cx) { $tx += $cc }
$tx += ('Run rows, raw (mechanical pulls from ' + $segD + '/' + $segB + '/' + $segL + ' with hit counts beside each row):')
$tx += ('MTCLOSE-DAY_CLOSE hits=1: ' + $mclose[0].Substring($mclose[0].IndexOf('Core')))
$tx += ('MTEXIT-DAY_CLOSE hits=1: ' + $mexit[0].Substring($mexit[0].IndexOf('Core')))
$tx += ('DEAL-7 hits=1: ' + $deal7[0].Substring($deal7[0].IndexOf('Core')))
$tx += 'FRIDAY-2355-EVAL hits=16 (first 2 shown, all 16 counted above):'
$tx += ('  sample: ' + $fri[0].Substring($fri[0].IndexOf('Core')))
$tx += ('  sample: ' + $fri[1].Substring($fri[1].IndexOf('Core')))
$tx += 'Question Q1 (one, specific): does the pasted E1 insert fire the DAY_CLOSE verdict at the Friday 23:55:00 evaluation and execute exactly the 23:55 open, with Monday fallback preserved and every other leg untouched?'
$tx += 'Verdict Q1: ___ (plain yes / no / discrepancy, with line numbers)'
$tx += 'Analytic ask A (standing): name every defect, gap, or imprecision seen in the page, each with line numbers - freetext, no length limit.'
$tx += 'Analytic ask B (standing): state any better mechanism seen for the stated goal, with the code lines it would touch.'
$tx += 'Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.'
$tx += 'Nothing else is asked. Thank you.'
$tx | Set-Content -LiteralPath $out -Encoding utf8
'WROTE_LINES=' + $tx.Count
'POSTCOUNT_FILE=' + (Get-Content -LiteralPath $out).Count
$back2 = Get-Content -LiteralPath $out
'RT_MTCLOSE=' + @($back2 | Where-Object { $_.Contains('MTCLOSE bar=2026.09.04 23:55') }).Count
'RT_BRIEFPH=' + @($back2 | Where-Object { $_.Contains('%%BRIEF%%') }).Count
'RT_ELLIPSIS=' + @($back2 | Where-Object { $_.Contains('...') }).Count
