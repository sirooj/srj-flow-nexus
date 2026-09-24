# Splice v3 packet new blocks from filed Opus text (mechanical, no transcription). Console prints counts/hashes only.
$OPUS = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_GLM.md'
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$PKT = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$op = Get-Content -LiteralPath $OPUS
$ea = Get-Content -LiteralPath $EA
$pk = Get-Content -LiteralPath $PKT
'OPUS_LINES=' + $op.Count
'PKT_PRE_LINES=' + $pk.Count
function HasOnce($lines, $m) { return @($lines | Where-Object { $_.Contains($m) }).Count }
function RangeOf($lines, $a, $b) { return @($lines[($a - 1)..($b - 1)]) }
function CH($lines, $pat) { return @($lines | Where-Object { $_.Contains($pat) }).Count }
$marks = @('<<NEWE1>>','<<NEWE2>>','<<NEWE3>>','<<NEWE4>>','<<NEWE5>>')
foreach ($mk in $marks) { 'MARK_' + $mk + '=' + (HasOnce $pk $mk) }
$q = [char]96
function Quoted($lines) { $o = @(); foreach ($l in $lines) { $o += ($q + $l + $q) }; return $o }
$B1 = RangeOf $op 3242 3252
$B2 = RangeOf $op 3258 3276
$B3 = RangeOf $op 3283 3301
$B4 = RangeOf $op 3307 3326
$B5raw = RangeOf $op 3376 3422
$B5map = @()
foreach ($l in $B5raw) { $B5map += ($l -replace 'MTEXEC', 'MTCLOSE') }
$B5 = @('') + $B5map + @($ea[11094])
'COUNT_B1=' + $B1.Count
'COUNT_B2=' + $B2.Count
'COUNT_B3=' + $B3.Count
'COUNT_B4=' + $B4.Count
'COUNT_B5=' + $B5.Count
'FIRST_B1=' + (HasOnce $B1 'eviction-paired reseed suppression')
'FIRST_B2=' + (HasOnce $B2 'void MarkSessionUsed')
'FIRST_B3=' + (HasOnce $B3 'PoiRetestResult pr')
'FIRST_B4=' + (HasOnce $B4 'refused S4 holders abort')
'FIRST_B5=' + (HasOnce $B5 'broker close for the paper-only')
'MTCLOSE_IN_B5=' + (CH $B5 'MTCLOSE')
'MTEXEC_IN_B5=' + (CH $B5 'MTEXEC')
'NONASCII_B=' + @($B1 + $B2 + $B3 + $B4 + $B5 | Where-Object { $_ -match '[^\x00-\x7F]' }).Count
$blocks = @{}
$blocks['<<NEWE1>>'] = Quoted $B1
$blocks['<<NEWE2>>'] = Quoted $B2
$blocks['<<NEWE3>>'] = Quoted $B3
$blocks['<<NEWE4>>'] = Quoted $B4
$blocks['<<NEWE5>>'] = Quoted $B5
$new = @()
foreach ($l in $pk) { if ($blocks.ContainsKey($l.Trim())) { $new += $blocks[$l.Trim()] } else { $new += $l } }
$new | Set-Content -LiteralPath $PKT -Encoding utf8
'POST_PKT_LINES=' + (Get-Content -LiteralPath $PKT).Count
'MARKERS_LEFT=' + @(Get-Content -LiteralPath $PKT | Where-Object { $_.Contains('<<') }).Count
'ELLIPSIS=' + @(Get-Content -LiteralPath $PKT | Where-Object { $_.Contains('...') }).Count
'PKT_HASH=' + (Get-FileHash -LiteralPath $PKT -Algorithm SHA256).Hash
'PKT_BYTES=' + (Get-Item -LiteralPath $PKT).Length
$raw = [System.IO.File]::ReadAllBytes($PKT)
'NONASCII_PKT=' + @($raw | Where-Object { $_ -gt 127 }).Count
'DONE'
