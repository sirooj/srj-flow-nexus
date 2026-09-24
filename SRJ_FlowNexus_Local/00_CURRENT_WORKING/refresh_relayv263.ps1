# Refresh v263 embedded twin + fence from CURRENT packet; REAL check = embedded-vs-packet diff. Console prints counts/hashes only.
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$FLOW = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$PKT = Join-Path 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS' 'PACKET_P-RESQUAT-1.md'
$V263 = Join-Path $H 'BUILDER_RELAY_COUNCIL_v263-RESQUAT-CLEAR4.md'
$eaLines = Get-Content -LiteralPath $EA
$flowLines = Get-Content -LiteralPath $FLOW
$pktLines = Get-Content -LiteralPath $PKT
$relLines = Get-Content -LiteralPath $V263
function Idx($lines, $m) { $o = @(); for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i].Contains($m)) { $o += $i } }; return $o }
$tb = @(Idx $relLines 'TWIN BEGIN')
$te = @(Idx $relLines 'TWIN END')
$fb = @(Idx $relLines '--- FENCE TABLE')
$fe = @(Idx $relLines '--- end fence table ---')
'TWIN_BEGIN_HITS=' + $tb.Count
'TWIN_END_HITS=' + $te.Count
'FENCE_BEGIN_HITS=' + $fb.Count
'FENCE_END_HITS=' + $fe.Count
if (($tb.Count -ne 1) -or ($te.Count -ne 1) -or ($fb.Count -ne 1) -or ($fe.Count -ne 1)) { 'FENCE_HALTED'; exit 1 }
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
$twin = @('--- PACKET P-RESQUAT-1 v5 TWIN BEGIN ---') + $pktLines + @('--- PACKET P-RESQUAT-1 v5 TWIN END ---')
$built = @()
for ($i = 0; $i -lt $relLines.Count; $i++) {
  if ($i -eq $tb[0]) { $built += $twin }
  elseif (($i -gt $tb[0]) -and ($i -le $te[0])) { continue }
  elseif ($i -eq $fb[0]) { $built += $ft }
  elseif (($i -gt $fb[0]) -and ($i -le $fe[0])) { continue }
  else { $built += $relLines[$i] }
}
$built | Set-Content -LiteralPath $V263 -Encoding utf8
'POST_V263_LINES=' + (Get-Content -LiteralPath $V263).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('...') }).Count
'Q1_LINE=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('Q1 verdict:') }).Count
'Q2_LINE=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('Q2 verdict:') }).Count
'V4_TWIN_HITS=' + @(Get-Content -LiteralPath $V263 | Where-Object { $_.Contains('P-RESQUAT-1 v5 TWIN') }).Count
'V263_HASH=' + (Get-FileHash -LiteralPath $V263 -Algorithm SHA256).Hash
'V263_BYTES=' + (Get-Item -LiteralPath $V263).Length
$raw = [System.IO.File]::ReadAllBytes($V263)
'NONASCII_BYTES=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
