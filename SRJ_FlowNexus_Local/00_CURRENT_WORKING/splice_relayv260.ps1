# Splice v260: packet twin + fence table + battery. Console prints counts/hashes only.
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$FLOW = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$PKT = Join-Path 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS' 'PACKET_P-RESQUAT-1.md'
$V260 = Join-Path $H 'BUILDER_RELAY_COUNCIL_v260-RESQUAT-CLEAR.md'
$eaLines = Get-Content -LiteralPath $EA
$flowLines = Get-Content -LiteralPath $FLOW
$pktLines = Get-Content -LiteralPath $PKT
$draftV260 = Get-Content -LiteralPath $V260
'PKT_LINES=' + $pktLines.Count
'RELAY_PRE_LINES=' + $draftV260.Count
function HasOnce($lines, $m) { return @($lines | Where-Object { $_.Contains($m) }).Count }
'TWIN_MARK=' + (HasOnce $draftV260 '<<PACKET-TWIN>>')
'FENCE_MARK=' + (HasOnce $draftV260 '<<FENCE-TABLE>>')
function CH($lines, $pat) { return @($lines | Where-Object { $_.Contains($pat) }).Count }
$ft = @()
$ft += '--- FENCE TABLE (machine counts on pre-build tree 15A41634/11330; FlowLogic buffers) ---'
$fences = @('bool SessionAlreadyUsed','void MarkSessionUsed','branch=RETEST inWin=1','s1g_legDir = pr.isLong','squatter GC','EvaluateManagedTrade ==========================','vTP=%d vBREAK=%s vHTF=%d scope=%d','if(InpDebugLog) MtLifeEmit();','g_lineCode','POI_NLINES','SessionName','TC_DayStart','DirName','InpMagicBase','g_trade.Buy','g_trade.Sell','PositionClose','MTCLOSE','EVICTSUPPRESS','RESEED_BLOCKED','RESQUAT_SUPPRESS','EVICTMARK','EVICTCLEAR','EVICT_FILTER','MtCloseBrokerPosition','RsqMark','RsqSuppressed','RsqClear','g_evictSuppressLine','DetectPoiRetest','excludeMask','ABORT_DIV_FALLBACK','#define ABORT_DIV_FALLBACK')
foreach ($fp in $fences) { $ft += ('fence | ' + $fp + ' | ' + (CH $eaLines $fp)) }
$ft += ('fence | FlowLogic indicator_buffers | ' + (CH $flowLines 'indicator_buffers'))
$ft += ('fence | FlowLogic SetIndexBuffer(48 | ' + (CH $flowLines 'SetIndexBuffer(48'))
$ft += '--- end fence table ---'
'FENCE_ROWS=' + $ft.Count
$twin = @('--- PACKET P-RESQUAT-1 v1 TWIN BEGIN ---') + $pktLines + @('--- PACKET P-RESQUAT-1 v1 TWIN END ---')
'TWIN_LINES=' + $twin.Count
$inner = @($twin | Where-Object { -not ($_.StartsWith('--- PACKET')) })
' Twin content lines vs packet: ' + $inner.Count + ' vs ' + $pktLines.Count
$na = @($pktLines | ForEach-Object { $_ -replace "`r", '' })
if ($na.Count -gt 0 -and $na[-1] -eq '') { $na = @($na | Select-Object -SkipLast 1) }
$nb = @($inner | ForEach-Object { $_ -replace "`r", '' })
if ($nb.Count -gt 0 -and $nb[-1] -eq '') { $nb = @($nb | Select-Object -SkipLast 1) }
$mm = 0
$ml = $na.Count
if ($nb.Count -gt $ml) { $ml = $nb.Count }
for ($i = 0; $i -lt $ml; $i++) { $xa = ''; $xb = ''; if ($i -lt $na.Count) { $xa = $na[$i] }; if ($i -lt $nb.Count) { $xb = $nb[$i] }; if ($xa -ne $xb) { $mm++ } }
'TWIN_MISMATCH=' + $mm
if ($mm -gt 0) { 'TWIN_HALTED'; exit 1 }
$built = @()
foreach ($bl in $draftV260) {
  if ($bl.Trim() -eq '<<PACKET-TWIN>>') { $built += $twin }
  elseif ($bl.Trim() -eq '<<FENCE-TABLE>>') { $built += $ft }
  else { $built += $bl }
}
$built | Set-Content -LiteralPath $V260 -Encoding utf8
'POST_V260_LINES=' + (Get-Content -LiteralPath $V260).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $V260 | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $V260 | Where-Object { $_.Contains('...') }).Count
'Q1_LINE=' + @(Get-Content -LiteralPath $V260 | Where-Object { $_.Contains('Q1 verdict:') }).Count
'Q2_LINE=' + @(Get-Content -LiteralPath $V260 | Where-Object { $_.Contains('Q2 verdict:') }).Count
'EA_HASH=' + (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
'PKT_HASH=' + (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
'V260_HASH=' + (Get-FileHash -LiteralPath $V260 -Algorithm SHA256).Hash
'V260_BYTES=' + (Get-Item -LiteralPath $V260).Length
$raw = [System.IO.File]::ReadAllBytes($V260)
'NONASCII_BYTES=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
