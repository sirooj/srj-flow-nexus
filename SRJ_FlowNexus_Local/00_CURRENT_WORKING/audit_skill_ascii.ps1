$P = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\.opencode\skills\srj-goal\SKILL.md'
$B = [System.IO.File]::ReadAllBytes($P)
$na = 0
foreach ($by in $B) { if ($by -gt 126) { $na++ } }
echo ('bytes=' + $B.Count + ' nonascii-bytes=' + $na)
$T = [System.IO.File]::ReadAllText($P)
$crlf = ([regex]::Matches($T, "`r`n")).Count
$lf = ([regex]::Matches($T, "`n")).Count
echo ('crlf=' + $crlf + ' lf-total=' + $lf + ' lone-lf=' + ($lf - $crlf))
$L = [System.IO.File]::ReadAllLines($P)
echo ('lines=' + $L.Count)
