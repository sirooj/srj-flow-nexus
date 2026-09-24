$relayPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v266-RESQUAT-CLEAR7.md'
$pktPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
function SubCount($text, $sub) { return ($text.Split(@($sub), [StringSplitOptions]::None).Count - 1) }
function EaSpan($lines, $a, $b) { return ([string]::Join("`r`n", $lines[($a - 1)..($b - 1)])) }
$relayText = [IO.File]::ReadAllText($relayPath)
$pktText = [IO.File]::ReadAllText($pktPath)
$eaLines = [IO.File]::ReadAllLines($eaPath)
$marks = @('<<TWIN>>', '<<CODE_LATCH>>', '<<CODE_T78>>', '<<CODE_B3USE>>', '<<CODE_B3LOOP>>', '<<CODE_B3RET>>', '<<CODE_E6OPEN>>', '<<CODE_E6CLOSE>>')
foreach ($m in $marks) { echo "pre $m = $(SubCount $relayText $m)" }
$spans = @{
  '<<CODE_LATCH>>' = (EaSpan $eaLines 7734 7746)
  '<<CODE_T78>>' = (EaSpan $eaLines 7544 7549)
  '<<CODE_B3USE>>' = (EaSpan $eaLines 7588 7599)
  '<<CODE_B3LOOP>>' = (EaSpan $eaLines 2010 2010)
  '<<CODE_B3RET>>' = (EaSpan $eaLines 2027 2027)
  '<<CODE_E6OPEN>>' = (EaSpan $eaLines 11271 11271)
  '<<CODE_E6CLOSE>>' = (EaSpan $eaLines 11281 11281)
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
