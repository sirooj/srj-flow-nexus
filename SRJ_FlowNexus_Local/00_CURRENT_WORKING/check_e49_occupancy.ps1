$j='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON18-ADOPT1A_JOURNAL.log'
$pairs=@(@('2026.09.04 10:35',168),@('2026.09.04 15:55',408),@('2026.09.07 16:40',21),@('2026.09.08 16:40',817))
foreach($p in $pairs){
  $bar=$p[0]; $slot=$p[1]
  $pat='\[SRJ-EA\] SLADDER fields=19 bar='+[regex]::Escape($bar)+' .*?rungSlot=(\d+)'
  $slots=@((Select-String -LiteralPath $j -Pattern $pat | ForEach-Object { [int]$_.Matches[0].Groups[1].Value }))
  $hit=($slots -contains $slot)
  ($bar+' refSlot='+$slot+' nRungs='+$slots.Count+' min='+($slots|Measure-Object -Minimum).Minimum+' max='+($slots|Measure-Object -Maximum).Maximum+' shiftMember='+$hit)
}
