$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON4-FIXS2POLL'
$Ini=Join-Path $Work 'RECON1_P1.ini'
$H='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$Root='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06'
$Term='C:\Program Files\Dukascopy MetaTrader 5\terminal64.exe'
$StatusPath=Join-Path $Work ($Run + '_STATUS.txt')
$DonePath=Join-Path $Work ($Run + '_DONE.txt')
$O=New-Object System.Collections.Generic.List[string]
$O.Add('RUN=' + $Run); $O.Add('WRAPPER=V2-MANUAL'); $O.Add('INI=' + $Ini)
$O.Add('INI_EXISTS=' + (Test-Path -LiteralPath $Ini).ToString())
$O.Add('TERM_EXISTS=' + (Test-Path -LiteralPath $Term).ToString())
$busy=$false
try { $procs=Get-Process -Name 'terminal64' -ErrorAction Stop; if($procs.Count -gt 0){ $busy=$true } } catch { $busy=$false }
$O.Add('TERMINAL_BUSY=' + $busy.ToString())
$day=Get-Date -Format 'yyyyMMdd'
$Tlog=Join-Path $Root ('Tester\logs\' + $day + '.log')
$O.Add('JOURNAL=' + $Tlog)
$pre=0
try { $fs=[IO.File]::Open($Tlog,'Open','Read','ReadWrite'); $sr=New-Object IO.StreamReader($fs); $c=0; while($null -ne ($sr.ReadLine())){ $c++ }; $sr.Close(); $pre=$c } catch { $pre=0 }
$O.Add('PRE_JOURNAL_LINES=' + $pre)
if($busy){ $O.Add('REFUSED_TERMINAL_BUSY'); $O.Add('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')); [IO.File]::WriteAllLines($StatusPath,$O,(New-Object Text.UTF8Encoding($true))); [IO.File]::WriteAllLines($DonePath,@('RUN='+$Run,'RESULT=REFUSED_TERMINAL_BUSY','DONE='+(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')),(New-Object Text.UTF8Encoding($true))); 'REFUSED_BUSY'; exit }
$p=Start-Process -FilePath $Term -ArgumentList ('/config:' + $Ini) -PassThru
$O.Add('PID=' + $p.Id); $O.Add('LAUNCHED_AT=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')); $O.Add('STAGE=RUNNING')
[IO.File]::WriteAllLines($StatusPath,$O,(New-Object Text.UTF8Encoding($true)))
'LAUNCHED terminal PID=' + $p.Id + ' PRE=' + $pre
