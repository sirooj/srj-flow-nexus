# pktv38build.ps1 - APPLY E-hunk v2 to EA (STAGE-1 gated; CRLF-preserving; one build only)
$ErrorActionPreference = 'Stop'
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$preH = (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
if ($preH -ne '7C247F459A983F6BD3D234D84DE366C6F3F9B78DC6CDDDB3A0415AA4D295E8A3') { throw "pre-hash drift $preH" }
$preB = (Get-Item -LiteralPath $EA).Length
if ($preB -ne 614043) { throw "pre-bytes drift $preB" }
"PRE_OK=7C247F45/614043"
$text = [IO.File]::ReadAllText($EA)
$parts = $text -split '(\r\n|\n)'
"PARTS=$($parts.Count)"
function Ln($n) { return $parts[($n - 1) * 2] }
function Tm($n) { return $parts[($n - 1) * 2 + 1] }
$old5 = @('         int s1x_sel = -1;', '         if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;', '         else if(s1x_s1slot >= 0) s1x_sel = 1;', '         if(s1x_sel == 0) slRef = s1x_s0px;', '         else if(s1x_sel == 1) slRef = s1x_s1px;')
for ($k = 0; $k -lt 5; $k++) {
  if ((Ln (9663 + $k)) -cne $old5[$k]) { throw "old L$((9663+$k)) content" }
  if ((Tm (9663 + $k)) -cne "`r`n") { throw "old L$((9663+$k)) term" }
}
"OLDVERBATIM_OK=5+CRLF"
$new10 = @('         int s1x_sel = -1;', '         bool ext1Take = ((g_dir == DIR_LONG || g_dir == DIR_SHORT) && g_sl41_def == 1 && MathIsValidNumber(g_sl41_px) && MathIsValidNumber(currentPrice) && SlimbProtectiveSideOk(g_dir, g_sl41_px, currentPrice));', '         if(ext1Take) { slRef = g_sl41_px; s1x_sel = 2; }', '         else', '           {', '            if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;', '            else if(s1x_s1slot >= 0) s1x_sel = 1;', '            if(s1x_sel == 0) slRef = s1x_s0px;', '            else if(s1x_sel == 1) slRef = s1x_s1px;', '           }')
foreach ($ln in $new10) { foreach ($ch in $ln.ToCharArray()) { if ([int]$ch -gt 127) { throw 'nonascii new' } } }
$fbOld = @(); for ($k = 1; $k -lt 5; $k++) { $fbOld += $old5[$k].Trim() }
$fbNew = @(); for ($k = 5; $k -lt 9; $k++) { $fbNew += $new10[$k].Trim() }
for ($k = 0; $k -lt 4; $k++) { if ($fbNew[$k] -cne $fbOld[$k]) { throw "fallback-effect $k" } }
"FALLBACK_EFFECT_OK=4 statements"
foreach ($q in @('MathIsValidNumber(currentPrice) && SlimbProtectiveSideOk', 's1x_sel = 2', 'slRef = g_sl41_px', '(g_dir == DIR_LONG || g_dir == DIR_SHORT)')) {
  $c = 0; foreach ($ln in $new10) { $c += ([regex]::Matches($ln, [regex]::Escape($q))).Count }
  if ($c -ne 1) { throw "newtext $q count=$c" }
}
"TEXTCHECK_OK=4"
function CountAll($arr, $pat) { $c = 0; $hits = @(); for ($i = 0; $i -lt $arr.Count; $i += 2) { if ($arr[$i].Contains($pat)) { $c++; $hits += (($i / 2) + 1) } }; return @($c, $hits) }
foreach ($q in @(@('double probe_inSlRef = slRef;', 'A', 1), @('probe_bSaved = true;', 'B', 1), @('static uint probe_seq = 0;', 'C', 1), @('LOTDIAG bar=', 'D1', 1), @('SEEDDIAG bar=', 'D2', 3))) {
  $r = CountAll $parts $q[0]
  if ($r[0] -ne $q[2]) { throw "presence $($q[1]) count=$($r[0])" }
  "PRESENCE_OK $($q[1])@$($r[1] -join ',')"
}
$r = CountAll $parts 's1x_sel'
$bad = $r[1] | Where-Object { $_ -lt 9663 -or $_ -gt 9669 }
if ($bad.Count -ne 0) { throw "s1x outside $($bad -join ',')" }
"S1X_PRE_OK=$($r[1] -join ',')"
$head = @()
for ($i = 0; $i -lt (9662 * 2); $i++) { $head += $parts[$i] }
$tail = @()
for ($i = 9667 * 2; $i -lt $parts.Count; $i++) { $tail += $parts[$i] }
$newblock = @()
for ($k = 0; $k -lt 10; $k++) { $newblock += $new10[$k]; $newblock += "`r`n" }
$out = $head + $newblock + $tail
[IO.File]::WriteAllText($EA, ($out -join ''), (New-Object Text.UTF8Encoding($false)))
"WRITTEN"
$post = [IO.File]::ReadAllLines($EA)
"POST_LINES=$($post.Count)"
if ($post.Count -ne 11235) { throw 'linecount' }
$pb = [IO.File]::ReadAllBytes($EA)
$lf = ($pb | Where-Object { $_ -eq 10 }).Count; $cr = ($pb | Where-Object { $_ -eq 13 }).Count
"POST_CR=$cr POST_LF=$lf POST_BYTES=$($pb.Length)"
if ($cr -ne 11105 -or $lf -ne 11235) { throw 'terminator-drift' }
$r2 = @(); for ($i = 0; $i -lt $post.Count; $i++) { if ($post[$i].Contains('s1x_sel')) { $r2 += ($i + 1) } }
$bad2 = $r2 | Where-Object { $_ -lt 9663 -or $_ -gt 9674 }
if ($bad2.Count -ne 0) { throw "s1x post outside $($bad2 -join ',')" }
"S1X_POST_OK=$($r2 -join ',')"
if (-not $post[9672].Contains('probe_bSaved = true;')) { throw 'B-moved' }
"B_POST_OK=line9673"
$ph = (Get-FileHash -LiteralPath $EA -Algorithm SHA256).Hash
"POST_HASH=$ph"
