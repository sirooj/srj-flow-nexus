# Source check: does the filed v77 Sonnet block itself contain U+00C2?
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$SON = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$LUN = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$PKT = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
foreach ($f in @($SON, $LUN, $PKT)) {
  $t = [System.IO.File]::ReadAllText($f, $utf8)
  $n = 0
  foreach ($c in $t.ToCharArray()) { if ($c -eq [char]0x00C2) { $n = $n + 1 } }
  '{0}: ACIRC={1}' -f (Split-Path -Leaf $f), $n
}
