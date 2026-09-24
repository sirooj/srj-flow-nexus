$relayPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v264-RESQUAT-CLEAR5.md'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
function SubCount($text, $sub) { return ($text.Split(@($sub), [StringSplitOptions]::None).Count - 1) }
function EaSpan($lines, $a, $b) { return ([string]::Join("`r`n", $lines[($a - 1)..($b - 1)])) }
$relayText = [IO.File]::ReadAllText($relayPath)
$pktText = [IO.File]::ReadAllText($pktPath)
$eaLines = [IO.File]::ReadAllLines($eaPath)
$marks = @('<<TWIN>>', '<<CODE_E7>>', '<<CODE_DAY>>', '<<CODE_SL>>', '<<CODE_TP>>', '<<CODE_BRK>>')
foreach ($m in $marks) { echo "pre $m = $(SubCount $relayText $m)" }
$spans = @{
  '<<CODE_E7>>' = (EaSpan $eaLines 11283 11301)
  '<<CODE_DAY>>' = (EaSpan $eaLines 11261 11268)
  '<<CODE_SL>>' = (EaSpan $eaLines 11166 11169)
  '<<CODE_TP>>' = (EaSpan $eaLines 11186 11187)
  '<<CODE_BRK>>' = (EaSpan $eaLines 11229 11235)
}
$relayText = $relayText.Replace('<<TWIN>>', $pktText)
foreach ($k in $spans.Keys) { $relayText = $relayText.Replace($k, $spans[$k]) }
[IO.File]::WriteAllText($relayPath, $relayText)
echo '---post-verify---'
$rt2 = [IO.File]::ReadAllText($relayPath)
echo "twin-contained-1x = $(SubCount $rt2 $pktText)"
foreach ($k in $spans.Keys) { echo "span $k contained-1x = $(SubCount $rt2 $spans[$k])" }
echo "leftover-markers = $(SubCount $rt2 '<<')"
echo "ellipsis = $(SubCount $rt2 '...')"
$oldBlock = EaSpan $eaLines 11294 11301
$eaFull = [IO.File]::ReadAllText($eaPath)
echo "E7-8line-block in EA = $(SubCount $eaFull $oldBlock)"
echo "E7-8line-block in relay = $(SubCount $rt2 $oldBlock)"
echo "relay bytes = $((Get-Item -LiteralPath $relayPath).Length)"
echo "relay digest = $((Get-FileHash -LiteralPath $relayPath -Algorithm SHA256).Hash)"
$nlcount = ($rt2.Split(@([char]10), [StringSplitOptions]::None).Count - 1); echo "relay rawsplit-lines = $nlcount"
echo '---MTEXIT other hits---'
Select-String -LiteralPath $eaPath -Pattern 'MTEXIT bar=' -SimpleMatch | Select-Object LineNumber, Line
