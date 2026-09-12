$a='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$L=[IO.File]::ReadAllLines($a)
foreach($i in @(4221,4222,4223)){ $n=$i - 1; $s=$L[$n]; 'IDX=' + $i + ' LEN=' + $s.Length + ' LEAD=' + ($s.Length - $s.TrimStart().Length) + ' TAIL=' + ($s.Length - $s.TrimEnd().Length) + ' TEXT=[' + $s.Trim() + ']' }
