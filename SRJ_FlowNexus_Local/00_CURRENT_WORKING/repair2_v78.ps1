# Repair LUNA-CORE the same way (pure .NET UTF-8).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$LUN = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$R78 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v78-FORCEFIT-CLOSEDSET.md'
function getlines($f) { return [System.IO.File]::ReadAllLines($f, $utf8) }
$lunL = getlines $LUN
$o = -1
for ($i = 0; $i -lt $lunL.Count; $i++) {
  if ($lunL[$i].Contains('V77-C1-CLOSEDSET-01')) { $o = $i; break }
}
$a = -1
for ($i = $o; $i -lt $lunL.Count; $i++) {
  if ($lunL[$i].Contains('## Ask 2')) { $a = $i; break }
}
$b = -1
for ($i = $a + 1; $i -lt $lunL.Count; $i++) {
  if ($lunL[$i].Contains('## Ask 3')) { $b = $i; break }
}
'pull-range={0}-{1}' -f $a, $b
$fresh = $lunL[$a..($b - 1)]
$rel = getlines $R78
$out = New-Object System.Collections.Generic.List[string]
$mode = ''
foreach ($ln in $rel) {
  if ($ln.StartsWith('### D. Luna')) { $mode = 'lun'; $out.Add($ln); $out.Add(''); foreach ($x in $fresh) { $out.Add($x) }; continue }
  if ($mode -eq 'lun') {
    if ($ln.Contains('Asks (LUNA rules')) { $mode = ''; $out.Add($ln); continue }
    continue
  }
  $out.Add($ln)
}
[System.IO.File]::WriteAllLines($R78, $out.ToArray(), $utf8)
'wrote-lines={0}' -f $out.Count
