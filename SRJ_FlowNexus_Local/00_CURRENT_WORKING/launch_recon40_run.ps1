# Launch RECON40-STOPSHADOW (filed 2026-09-16; RUN on his word "RECON40-STOPSHADOW").
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON40-STOPSHADOW'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# LUNA-V110-STOPREF-SHADOW-001 (Luna CLEAR-by-name print-only S1-STOPREF-SHADOW-001;
# NO tokens; run word SPENT here). Build EA 8CFBDC7A/589206 (SIDE1X shadow at S5 site;
# all null-effect, both compile 0/0 fresh logs); FlowLogic 3606BFB4 untouched.
# Same ini/range (Model=4 real-ticks, InpDebugLog=true, 08-26 to 09-09, same
# terminal+machine, spread live-floating as all prior runs). Ceiling 90 min,
# wrapper-only. ONE build (done, do NOT rebuild) + ONE run. No third run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
