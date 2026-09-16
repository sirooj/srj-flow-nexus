# Count per region + boundary lines (read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V80DE_WHOLE.md'
$CL = [System.IO.File]::ReadAllLines($COMP, $utf8)
$f = 0; $g = 0; $firstF = ''; $lastF = ''; $firstG = ''; $lastG = ''
foreach ($l in $CL) {
  if ($l.StartsWith('8428:')) { $firstF = $l }
  if ($l.StartsWith('8459:')) { $lastF = $l }
  if ($l.StartsWith('9389:')) { $firstG = $l }
  if ($l.StartsWith('9461:')) { $lastG = $l }
  if ($l.Length -gt 4 -and $l[0] -ge [char]48 -and $l[0] -le [char]57) {
    $p = $l.IndexOf(': ')
    if ($p -gt 0) {
      $n = 0
      if ([int]::TryParse($l.Substring(0, $p), [ref]$n)) {
        if ($n -ge 8428 -and $n -le 8459) { $f = $f + 1 }
        if ($n -ge 9389 -and $n -le 9461) { $g = $g + 1 }
      }
    }
  }
}
'F-COUNT={0} G-COUNT={1}' -f $f, $g
'FIRST-F={0}' -f $firstF.Substring(0, [Math]::Min(80, $firstF.Length))
'LAST-F={0}' -f $lastF.Substring(0, [Math]::Min(80, $lastF.Length))
'FIRST-G={0}' -f $firstG.Substring(0, [Math]::Min(80, $firstG.Length))
'LAST-G={0}' -f $lastG.Substring(0, [Math]::Min(80, $lastG.Length))
