# Splice v263: packet-v4 twin + extended fence table + battery. Console prints counts/hashes only.
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$FLOW = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$PKT = Join-Path 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS' 'PACKET_P-RESQUAT-1.md'
$V263 = Join-Path $H 'BUILDER_RELAY_COUNCIL_v263-RESQUAT-CLEAR4.md'
$eaLines = Get-Content -LiteralPath $EA
$flowLines = Get-Content -LiteralPath $FLOW
$pktLines = Get-Content -LiteralPath $PKT
$draftV263 = Get-Content -LiteralPath $V263
'PKT_LINES=' + $pktLines.Count
'RELAY_PRE_LINES=' + $draftV263.Count
function HasOnce($lines, $m) { return @($lines | Where-Object { $_.Contains($m) }).Count }
'TWIN_MARK=' + (HasOnce $draftV263 '<<PACKET-TWIN>>')
'FENCE_MARK=' + (HasOnce $draftV263 '<<FENCE-TABLE>>')
function CH($lines, $pat) { return @($lines | Where-Object { $_.Contains($pat) }).Count }
$pktHash8 = (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash.Substring(0,8)
$pktBytes = (Get-Item -LiteralPath $PKT).Length
$pktCount = $pktLines.Count
$ft = @()
$ft += '--- FENCE TABLE (machine counts on pre-build tree 15A41634/11330; FlowLogic buffers) ---'
$ft += ('twin | packet ' + $pktHash8 + '/' + $pktBytes + '/' + $pktCount)
$fences = @('bool SessionAlreadyUsed','void MarkSessionUsed','MarkSessionUsed(','branch=RETEST inWin=1','s1g_legDir = pr.isLong','squatter GC','EvaluateManagedTrade ==========================','vTP=%d vBREAK=%s vHTF=%d scope=%d','vDAY=%d','(int)vHTF, (int)MT_EXIT_SCOPE,','if(InpDebugLog) MtLifeEmit();','g_lineCode','POI_NLINES','SessionName','TC_DayStart','DirName','InpMagicBase','ENUM_SRJ_DIR','ENUM_SRJ_SESSION','DIR_NONE','SESSION_NONE','CTrade g_trade','g_mtrade','vBREAK','nextOpenPx','InpMode','MODE_EXECUTE','ResultRetcode','Trade.mqh','GetCorrectFillingMode','SetExpertMagicNumber','PositionGetTicket','MQLInfoInteger(MQL_TESTER)','g_trade.Buy','g_trade.Sell','PositionClose','MTCLOSE','MTEXEC','MtCloseExecute','MtCloseBrokerPosition','EVICTSUPPRESS','RESEED_BLOCKED','EVICTSUPPRESS_FIRE','EVICT_FILTER','excludeMask','g_evictSuppressLine','DetectPoiRetest','ABORT_DIV_FALLBACK','#define ABORT_DIV_FALLBACK')
foreach ($fp in $fences) { $ft += ('fence | ' + $fp + ' | ' + (CH $eaLines $fp)) }
$ft += ('fence | FlowLogic indicator_buffers | ' + (CH $flowLines 'indicator_buffers'))
$ft += ('fence | FlowLogic SetIndexBuffer(48 | ' + (CH $flowLines 'SetIndexBuffer(48'))
$ft += '--- end fence table ---'
'FENCE_ROWS=' + $ft.Count
$twin = @('--- PACKET P-RESQUAT-1 v4 TWIN BEGIN ---') + $pktLines + @('--- PACKET P-RESQUAT-1 v4 TWIN END ---')
'TWIN_LINES=' + $twin.Count
$inner = @($twin | Where-Object { -not ($_.StartsWith('--- PACKET')) })
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
foreach ($bl in $draftV263) {
  if ($bl.Trim() -eq '<<PACKET-TWIN>>') { $built += $twin }
  elseif ($bl.Trim() -eq '<<FENCE-TABLE>>') { $built += $ft }
  else { $built += $bl }
}
$built | Set-Content -LiteralPath $V263 -Encoding utf8
'POST_V263_LINES=' + (Get-Content -LiteralPath $V263).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('...') }).Count
'Q1_LINE=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('Q1 verdict:') }).Count
'Q2_LINE=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('Q2 verdict:') }).Count
'EA_HASH=' + (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
'PKT_HASH=' + (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
'V263_HASH=' + (Get-FileHash -LiteralPath $V263 -Algorithm SHA256).Hash
'V263_BYTES=' + (Get-Item -LiteralPath $V263).Length
$raw = [System.IO.File]::ReadAllBytes($V263)
'NONASCII_BYTES=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
