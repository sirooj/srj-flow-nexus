$a='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$L=[IO.File]::ReadAllLines($a)
$keep=@()
for($i=0;$i -lt $L.Count;$i++){ $n=$i+1; if($n -eq 4224){ continue }; $keep+=$L[$i] }
[IO.File]::WriteAllLines($a,$keep)
'REMOVED line 4224 (old gate); new count=' + $keep.Count
