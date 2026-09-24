$relayPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v265-RESQUAT-CLEAR6.md'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
function SubCount($text, $sub) { return ($text.Split(@($sub), [StringSplitOptions]::None).Count - 1) }
function EaSpan($lines, $a, $b) { return ([string]::Join("`r`n", $lines[($a - 1)..($b - 1)])) }
$relayText = [IO.File]::ReadAllText($relayPath)
$pktText = [IO.File]::ReadAllText($pktPath)
$eaLines = [IO.File]::ReadAllLines($eaPath)
$marks = @('<<TWIN>>', '<<CODE_TRADE>>', '<<CODE_S2LIVE>>', '<<CODE_F6629>>', '<<CODE_MTCOLL>>', '<<CODE_E8C>>', '<<CODE_E6DEF>>', '<<CODE_VDAY>>', '<<CODE_E6A>>', '<<CODE_E6B>>', '<<CODE_PRIO>>')
foreach ($m in $marks) { echo "pre $m = $(SubCount $relayText $m)" }
$spans = @{
  '<<CODE_TRADE>>' = (EaSpan $eaLines 239 274)
  '<<CODE_S2LIVE>>' = (EaSpan $eaLines 3949 3956)
  '<<CODE_F6629>>' = (EaSpan $eaLines 6629 6629)
  '<<CODE_MTCOLL>>' = (EaSpan $eaLines 10115 10129)
  '<<CODE_E8C>>' = (EaSpan $eaLines 10236 10241)
  '<<CODE_E6DEF>>' = (EaSpan $eaLines 11105 11105)
  '<<CODE_VDAY>>' = (EaSpan $eaLines 11160 11160)
  '<<CODE_E6A>>' = (EaSpan $eaLines 11272 11272)
  '<<CODE_E6B>>' = (EaSpan $eaLines 11280 11280)
  '<<CODE_PRIO>>' = (EaSpan $eaLines 11283 11301)
}
$relayText = $relayText.Replace('<<TWIN>>', $pktText)
foreach ($k in $spans.Keys) { $relayText = $relayText.Replace($k, $spans[$k]) }
[IO.File]::WriteAllText($relayPath, $relayText)
echo '---post-verify---'
$rt2 = [IO.File]::ReadAllText($relayPath)
echo "twin-1x = $(SubCount $rt2 $pktText)"
foreach ($k in $spans.Keys) { echo "span $k 1x = $(SubCount $rt2 $spans[$k])" }
echo "leftover = $(SubCount $rt2 '<<')"
echo "ellipsis = $(SubCount $rt2 '...')"
echo "bytes = $((Get-Item -LiteralPath $relayPath).Length)"
echo "digest = $((Get-FileHash -LiteralPath $relayPath -Algorithm SHA256).Hash)"
$nlc = ($rt2.Split(@([char]10), [StringSplitOptions]::None).Count - 1); echo "rawsplit-lines = $nlc"
