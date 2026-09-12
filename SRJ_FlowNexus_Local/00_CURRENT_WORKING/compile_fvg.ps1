$exe='C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe'
$fl='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$ea='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
& $exe ('/compile:'+$fl) ('/log:c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T162_FVG_FLOWCOMPILE.log')
'FLOW_EXIT=' + $LASTEXITCODE
& $exe ('/compile:'+$ea) ('/log:c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T162_FVG_EACOMPILE.log')
'EA_EXIT=' + $LASTEXITCODE
