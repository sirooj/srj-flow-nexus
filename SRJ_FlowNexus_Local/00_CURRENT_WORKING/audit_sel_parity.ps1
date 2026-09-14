$src='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$txt=[System.IO.File]::ReadAllText($src)
$names=@('StringFormat(', 'PrintFormat(')
$checked=0; $mism=0; $rep=@()
$i=0
while($i -lt $txt.Length){
  $nxt=-1; $nm=''
  foreach($n in $names){ $k=$txt.IndexOf($n,$i); if($k -ge 0 -and ($nxt -lt 0 -or $k -lt $nxt)){ $nxt=$k; $nm=$n } }
  if($nxt -lt 0){ break }
  $p=$nxt+$nm.Length-1
  $depth=0; $inStr=$false; $j=$p; $argsBegin=$p+1; $end=-1
  while($j -lt $txt.Length){
    $ch=$txt[$j]
    if($ch -eq '"'){ $inStr = -not $inStr }
    elseif(-not $inStr){
      if($ch -eq '('){ $depth++ }
      elseif($ch -eq ')'){ $depth--; if($depth -eq 0){ $end=$j; break } }
    }
    $j++
  }
  $lineNo=($txt.Substring(0,$nxt) -split "`n").Count
  if($end -lt 0){ $rep+=('UNBALANCED line='+$lineNo); $i=$nxt+1; continue }
  $argStr=$txt.Substring($argsBegin, $end-$argsBegin)
  $parts=@(); $d2=0; $inS=$false; $cur=''
  foreach($ch in $argStr.ToCharArray()){
    if($ch -eq '"'){ $inS = -not $inS; $cur+=$ch }
    elseif($ch -eq '(' -and -not $inS){ $d2++; $cur+=$ch }
    elseif($ch -eq ')' -and -not $inS){ $d2--; $cur+=$ch }
    elseif($ch -eq ',' -and -not $inS -and $d2 -eq 0){ $parts+=$cur; $cur='' }
    else { $cur+=$ch }
  }
  $parts+=$cur
  $fmt=$parts[0].Trim()
  if($fmt.StartsWith('"') -and $fmt.EndsWith('"') -and $fmt.Length -ge 2){ $fmt=$fmt.Substring(1,$fmt.Length-2) }
  $specs=([regex]::Matches($fmt,'%(?:%%|[-+0-9.]*[diuoxXfFeEgGcrs])'))
  $nSpec=0
  foreach($m in $specs){ if($m.Value -ne '%%'){ $nSpec++ } }
  $nArgs=$parts.Count-1
  $checked++
  if($nSpec -ne $nArgs){ $mism++; $rep+=('MISMATCH line='+$lineNo+' spec='+$nSpec+' args='+$nArgs) }
  $i=$end+1
}
'PARITY_CHECKED='+$checked
'PARITY_MISMATCH='+$mism
$rep | Select-Object -First 40
