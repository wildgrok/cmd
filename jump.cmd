@echo off
set source=\\corpintranet\RMIS\Outbound
if exist "%source%\*.txt" goto RUNSCRIPT 
goto EOF

:RUNSCRIPT 
echo I see files
:EOF