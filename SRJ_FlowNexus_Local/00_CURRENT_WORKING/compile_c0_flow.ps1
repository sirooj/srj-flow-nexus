$exe='C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe'
$src='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$log='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T162_C0_FLOWCOMPILE.log'
$a1='/compile:' + $src
$a2='/log:' + $log
& $exe $a1 $a2
'EXIT=' + $LASTEXITCODE
