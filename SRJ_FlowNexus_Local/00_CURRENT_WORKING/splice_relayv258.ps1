# Splice v258 relay: byte-exact code regions (EA post-build tree) + segment rows into markers; then battery asserts. Console prints counts/hashes only.
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$PKT = Join-Path 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS' 'PACKET_P-EVICT-1.md'
$SEG59 = Join-Path $H 'RECON59-EVICT-V1_JOURNAL.log'
$SEG57 = Join-Path $H 'RECON57-DEMOGUARD-V1_JOURNAL.log'
$RELPATH = Join-Path $H 'BUILDER_RELAY_COUNCIL_v258-RESQUAT-SOLVE.md'
$eaLines = Get-Content -LiteralPath $EA
$jb59 = Get-Content -LiteralPath $SEG59
$jb57 = Get-Content -LiteralPath $SEG57
$draftLines = Get-Content -LiteralPath $RELPATH
'PRE_EA_LINES=' + $eaLines.Count
'PRE_REL_LINES=' + $draftLines.Count
function HasOnce($lines, $m) { return @($lines | Where-Object { $_.Contains($m) }).Count }
function RangeOf($lines, $a, $b) { return @($lines[($a - 1)..($b - 1)]) }
function RowsOf($lines, $nums) { $o = @(); foreach ($n in $nums) { $o += $lines[$n - 1] }; return $o }
$marks = @('<<C1-EA6267-6330>>','<<C2-EA1716-1729>>','<<C3-EA1803-1818>>','<<C4-EA7457-7568>>','<<C5-EA7629-7686>>','<<C6-EA7710-7757>>','<<C7-EA7760-7792>>','<<C8-EA8793-8822>>','<<C9a-EA10156-10166>>','<<C9b-EA10253-10258>>','<<W1-SEG59-11160-62>>','<<W2-SEG59-11164-11204>>','<<W3-SEG59-11229>>','<<W4-SEG59-11373-11401>>','<<W5-SEG59-11438>>','<<W6-SEG57-8140-8280>>')
foreach ($mk in $marks) { 'MARK_' + $mk + '=' + (HasOnce $draftLines $mk) }
$blocks = @{}
$blocks['<<C1-EA6267-6330>>'] = @('--- EA 6267-6330 ResetSequence+GoAbort (64) ---') + (RangeOf $eaLines 6267 6330) + @('--- end C1 ---')
$blocks['<<C2-EA1716-1729>>'] = @('--- EA 1716-1729 LogState+LogAbort (14) ---') + (RangeOf $eaLines 1716 1729) + @('--- end C2 ---')
$blocks['<<C3-EA1803-1818>>'] = @('--- EA 1803-1818 SessionAlreadyUsed+MarkSessionUsed (16) ---') + (RangeOf $eaLines 1803 1818) + @('--- end C3 ---')
$blocks['<<C4-EA7457-7568>>'] = @('--- EA 7457-7568 reseed-statement+transfer (112) ---') + (RangeOf $eaLines 7457 7568) + @('--- end C4 ---')
$blocks['<<C5-EA7629-7686>>'] = @('--- EA 7629-7686 T73 veto census (58) ---') + (RangeOf $eaLines 7629 7686) + @('--- end C5 ---')
$blocks['<<C6-EA7710-7757>>'] = @('--- EA 7710-7757 IDLE seed block (48) ---') + (RangeOf $eaLines 7710 7757) + @('--- end C6 ---')
$blocks['<<C7-EA7760-7792>>'] = @('--- EA 7760-7792 R2 void (33) ---') + (RangeOf $eaLines 7760 7792) + @('--- end C7 ---')
$blocks['<<C8-EA8793-8822>>'] = @('--- EA 8793-8822 S5 disposition post-evict (30) ---') + (RangeOf $eaLines 8793 8822) + @('--- end C8 ---')
$blocks['<<C9a-EA10156-10166>>'] = @('--- EA 10156-10166 alert-only mark (11) ---') + (RangeOf $eaLines 10156 10166) + @('--- end C9a ---')
$blocks['<<C9b-EA10253-10258>>'] = @('--- EA 10253-10258 take mark (6) ---') + (RangeOf $eaLines 10253 10258) + @('--- end C9b ---')
$blocks['<<W1-SEG59-11160-62>>'] = @('--- SEG59 16:55 abort triple (3) ---') + (RowsOf $jb59 @(11160,11161,11162)) + @('--- end W1 ---')
$blocks['<<W2-SEG59-11164-11204>>'] = @('--- SEG59 17:00 reseed chain (7) ---') + (RowsOf $jb59 @(11164,11167,11172,11173,11181,11202,11204)) + @('--- end W2 ---')
$blocks['<<W3-SEG59-11229>>'] = @('--- SEG59 17:00 HELD (1) ---') + (RowsOf $jb59 @(11229)) + @('--- end W3 ---')
$blocks['<<W4-SEG59-11373-11401>>'] = @('--- SEG59 17:30+17:35 HELD (2) ---') + (RowsOf $jb59 @(11373,11401)) + @('--- end W4 ---')
$blocks['<<W5-SEG59-11438>>'] = @('--- SEG59 17:50 death (1) ---') + (RowsOf $jb59 @(11438)) + @('--- end W5 ---')
$blocks['<<W6-SEG57-8140-8280>>'] = @('--- SEG57 winning shape (14) ---') + (RowsOf $jb57 @(8140,8141,8151,8152,8153,8154,8197,8198,8200,8268,8271,8272,8275,8277)) + @('--- end W6 ---')
$checks = @(
  @('<<C1-EA6267-6330>>',64,'void ResetSequence()'),
  @('<<C2-EA1716-1729>>',14,'void LogState'),
  @('<<C3-EA1803-1818>>',16,'bool SessionAlreadyUsed'),
  @('<<C4-EA7457-7568>>',112,'DetectPoiRetest is read-only'),
  @('<<C5-EA7629-7686>>',58,'Suppression census. DIAGNOSTIC ONLY'),
  @('<<C6-EA7710-7757>>',48,'if(g_state == ST_IDLE)'),
  @('<<C7-EA7760-7792>>',33,'ST_S5_GATE_CHECK && g_anchorBarTime'),
  @('<<C8-EA8793-8822>>',30,'if(!divOk)'),
  @('<<C9a-EA10156-10166>>',11,'MODE_ALERT_ONLY'),
  @('<<C9b-EA10253-10258>>',6,'MarkSessionUsed(g_sessionAtEntry'),
  @('<<W1-SEG59-11160-62>>',3,'2026.09.01 16:55:00'),
  @('<<W2-SEG59-11164-11204>>',7,'2026.09.01 17:00:00'),
  @('<<W3-SEG59-11229>>',1,'SUPPRESSED bar=2026.09.01 17:00'),
  @('<<W4-SEG59-11373-11401>>',2,'SUPPRESSED bar=2026.09.01 17:3'),
  @('<<W5-SEG59-11438>>',1,'2026.09.01 17:50:00'),
  @('<<W6-SEG57-8140-8280>>',14,'2026.09.01 17:3')
)
$fail = 0
foreach ($ck in $checks) {
  $body = $blocks[$ck[0]]
  $inner = @($body | Where-Object { -not ($_.StartsWith('--- EA') -or $_.StartsWith('--- SEG') -or $_.StartsWith('--- end')) })
  $okN = ($inner.Count -eq $ck[1])
  $okF = (@($inner | Where-Object { $_.Contains($ck[2]) }).Count -ge 1)
  if (-not $okN) { 'CHECKFAIL_N ' + $ck[0] + ' got=' + $inner.Count + ' want=' + $ck[1]; $fail++ }
  if (-not $okF) { 'CHECKFAIL_F ' + $ck[0]; $fail++ }
}
'CHECKS_FAIL=' + $fail
if ($fail -gt 0) { 'SPLICE_HALTED'; exit 1 }
$new = @()
foreach ($rl in $draftLines) { if ($blocks.ContainsKey($rl.Trim())) { $new += $blocks[$rl.Trim()] } else { $new += $rl } }
$new | Set-Content -LiteralPath $RELPATH -Encoding utf8
'POST_REL_LINES=' + (Get-Content -LiteralPath $RELPATH).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $RELPATH | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $RELPATH | Where-Object { $_.Contains('...') }).Count
'EA_HASH=' + (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
'EA_BYTES=' + (Get-Item -LiteralPath $EA).Length
'PKT_HASH=' + (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
'PKT_BYTES=' + (Get-Item -LiteralPath $PKT).Length
'REL_HASH=' + (Get-FileHash -LiteralPath $RELPATH -Algorithm SHA256).Hash
'REL_BYTES=' + (Get-Item -LiteralPath $RELPATH).Length
'S59_HASH=' + (Get-FileHash -LiteralPath $SEG59 -Algorithm SHA256).Hash
'S57_HASH=' + (Get-FileHash -LiteralPath $SEG57 -Algorithm SHA256).Hash
$raw = [System.IO.File]::ReadAllBytes($RELPATH)
'NONASCII_BYTES=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
