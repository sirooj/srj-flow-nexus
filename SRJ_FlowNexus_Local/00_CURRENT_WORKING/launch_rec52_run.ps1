# Launch RECON52-EXITMODEL2-V12 (2026-09-21; RUN on Luna-V226 ACCEPT + key LUNA-V225-P-EXITMODEL2-V12-CLR-20260922 on PACKET_P-EXITMODEL-2 v12 plus Kimi ACCEPT, GLM halt withdrawn disk-disproved, Sonnet tier question answered on record; his run word + build word banked, commit token-gated and not granted).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON52-EXITMODEL2-V12'
$Ini = Join-Path $Work 'RECON50_DEMO_USD.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# v12 packet (EA DA975803/616591/11236 post-S2, 0/0 log EXITMODEL2-V12_EACOMPILE).
# Same envelope as RECON51 (RECON50_DEMO_USD ini, the RECON51 Dukascopy terminal+machine,
# InpMode 1, 08-26 to 09-10, InpDebugLog=true). Ceiling 90 min, wrapper-only. ONE build
# (done) + ONE run. Timeout REPORT+HALT. No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
