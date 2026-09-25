$exe='C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe'
$src1='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$log1='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\DAY2355-V4_EACOMPILE.log'
& $exe ('/compile:' + $src1) ('/log:' + $log1)
'EXIT_EA=' + $LASTEXITCODE
$src2='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$log2='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\DAY2355-V4_FLOWCOMPILE.log'
& $exe ('/compile:' + $src2) ('/log:' + $log2)
'EXIT_FLOW=' + $LASTEXITCODE
