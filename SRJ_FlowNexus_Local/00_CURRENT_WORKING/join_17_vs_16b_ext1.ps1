$j16='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON16b-SLDEF5_JOURNAL.log'
$j17='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON17-SLDEF6_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON17_GATE7_JOIN.txt'
function Tok($line){ $d=@{}; foreach($m in ([regex]::Matches($line,' ([A-Za-z0-9]+)=(\S+)'))){ $d[$m.Groups[1].Value]=$m.Groups[2].Value }; return $d }
$valKeys=@('ext1Defined','slExt1','ext1Slot','ext1BarTime','ext1Imb','deepestExt','todayXi','baseXi','nuanceXi','fracXi','fracNuXi','anchorXi','filedPx','filedProv','residPts','verdict')
$old=@{}; $new=@{}
foreach($m in (Select-String -LiteralPath $j16 -Pattern '\[SRJ-EA\] SLEXT1 fields=29 bar=(\S+ \S+) site=(\S+)')){ $old[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=(Tok $m.Line) }
foreach($m in (Select-String -LiteralPath $j17 -Pattern '\[SRJ-EA\] SLEXT1 fields=29 bar=(\S+ \S+) site=(\S+)')){ $new[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=(Tok $m.Line) }
$match=0; $mm=@(); $missN=@(); $missO=@()
foreach($k in $old.Keys){
  if(-not $new.ContainsKey($k)){ $missN+=($k); continue }
  $diff=@()
  foreach($tk in $valKeys){ if($old[$k][$tk] -ne $new[$k][$tk]){ $diff+=($tk+':'+$old[$k][$tk]+'->'+$new[$k][$tk]) } }
  if($diff.Count -eq 0){ $match++ } else { $mm+=($k+' ['+($diff -join ',')+']') }
}
foreach($k in $new.Keys){ if(-not $old.ContainsKey($k)){ $missO+=($k) } }
$r=@()
$r+=('E42_VALUE_OLD_N='+($old.Count)+' E42_VALUE_NEW_N='+($new.Count)+' IDENTICAL='+($match)+' MISMATCH='+($mm.Count)+' '+($mm -join ' | ')+' MISS_NEW='+($missN.Count)+' '+($missN -join ' | ')+' MISS_OLD='+($missO.Count)+' '+($missO -join ' | '))
$oldL=@{}; $newL=@{}
foreach($m in (Select-String -LiteralPath $j16 -Pattern '\[SRJ-EA\] (SLEXT1 fields=29 bar=(\S+ \S+) site=\S+ .*)')){ $oldL[$m.Matches[0].Groups[2].Value]=$m.Matches[0].Groups[1].Value }
foreach($m in (Select-String -LiteralPath $j17 -Pattern '\[SRJ-EA\] (SLEXT1 fields=29 bar=(\S+ \S+) site=\S+ .*)')){ $newL[$m.Matches[0].Groups[2].Value]=$m.Matches[0].Groups[1].Value }
$ld=@()
foreach($k in $oldL.Keys){
  if(-not $newL.ContainsKey($k)){ $ld+=($k+' MISSING_IN_17'); continue }
  if($oldL[$k] -ne $newL[$k]){
    $oa=($oldL[$k] -split ' '); $na=($newL[$k] -split ' '); $dd=@()
    for($i=0; $i -lt $oa.Count -and $i -lt $na.Count){ if($oa[$i] -ne $na[$i]){ $dd+=($oa[$i]+'->'+$na[$i]) } }
    $ld+=($k+' ['+($dd -join ',')+']')
  }
}
foreach($k in $newL.Keys){ if(-not $oldL.ContainsKey($k)){ $ld+=($k+' EXTRA_IN_17') } }
$r+=('LINE_DELTA_N='+($ld.Count)+' '+($ld -join ' | '))
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
