# Repair v78 appendix: re-extract SONNET-CORE + PKT-S3 via pure .NET UTF-8 (no PS cmdlets).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$SON = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$PKT = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
function getlines($f) { return [System.IO.File]::ReadAllLines($f, $utf8) }
function blocklines($L,$afterMark,$startMark,$endMark) {
  $o = -1
  for ($i = 0; $i -lt $L.Count; $i++) {
    if ($L[$i].Contains($afterMark)) { $o = $i; break }
  }
  if ($o -lt 0) { return @('BLOCK-NOT-FOUND') }
  $a = -1
  for ($i = $o; $i -lt $L.Count; $i++) {
    if ($L[$i].Contains($startMark)) { $a = $i; break }
  }
  if ($a -lt 0) { return @('START-NOT-FOUND') }
  $b = -1
  for ($i = $a + 1; $i -lt $L.Count; $i++) {
    if ($L[$i].Contains($endMark)) { $b = $i; break }
  }
  if ($b -lt 0) { return @('END-NOT-FOUND') }
  return $L[$a..($b - 1)]
}
$sonL = getlines $SON
$sonCore = blocklines $sonL 'answers v77' '**Ask 2' '**Ask 3'
'pulled-sonnet-lines={0}' -f $sonCore.Count
$pktL = getlines $PKT
$pktS3 = blocklines $pktL '' 'acceptance thresholds' 'Type-(ii) counting rule'
'pulled-pkts3-lines={0}' -f $pktS3.Count
$rel = getlines $R78
$out = New-Object System.Collections.Generic.List[string]
$mode = ''
foreach ($ln in $rel) {
  if ($ln.StartsWith('### C. Sonnet')) { $mode = 'son'; foreach ($x in $sonCore) { $out.Add($x) }; continue }
  if ($ln.StartsWith('### D. Luna')) { $mode = ''; $out.Add($ln); continue }
  if ($mode -eq 'son') {
    if ($ln.StartsWith('### D. Luna')) { $mode = ''; $out.Add($ln); continue }
    continue
  }
  if ($ln -eq 'SECTION-NOT-FOUND') {
    foreach ($x in $pktS3) { $out.Add($x) }
    continue
  }
  $out.Add($ln)
}
[System.IO.File]::WriteAllLines($R78, $out.ToArray(), $utf8)
'wrote-lines={0}' -f $out.Count
