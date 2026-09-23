# Launch RECON54-SEEDFIX-V1 (2026-09-22; RUN on Luna-V235 ACCEPT + key LUNA-V235-P-SEEDFIX-1-ACCEPT-001 short-on-digest-recorded + Sonnet/Kimi ACCEPT + GLM AMEND-either-path on PACKET_P-SEEDFIX-1 v3; his build+run word banked, commit token-gated and not granted).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON54-SEEDFIX-V1'
$Ini = Join-Path $Work 'RECON50_DEMO_USD.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# v3 packet (EA 3BAC352E/621077/11312 post-S2, 0/0 log SEEDFIX-V1_EACOMPILE).
# Same envelope as RECON53 (RECON50_DEMO_USD ini, InpMode 1, 08-26 to 09-10,
# InpDebugLog=true). Ceiling 90 min, wrapper-only. ONE build (done) + ONE run.
# Timeout REPORT+HALT. No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
