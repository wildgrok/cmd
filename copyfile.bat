@echo off
set source=\\corpintranet\prdprelude
set destination=\\ccl1nt\prelude6\Data\IMPORT

if exist "%source%\DU*" call :RUNSCRIPT
goto EOF

:RUNSCRIPT
rem Main Program, gets DateTimestamp for each DU file in source directory,
rem then runs FINDFILE to move/cleanup for each DateTimestamp found
set FILE=
for /F %%a in ('dir "%source%\DU*.*" /B') do (
  set FILE=%%a
  call :DTStamp
  call :FINDFILE
  )

:DTStamp
rem get DateTimestamp
set DateTime=%FILE:~2%
exit /b

:FINDFILE
rem if file found, move it and set "Found" to "T"
set FOUND=F
if exist "%source%\AP%DateTime%" (
  set FILE=AP%DateTime%
  call :MOVEIT
  )
if exist "%source%\VOID%DateTime%" (
  set FILE=VOID%DateTime%
  call :MOVEIT
  )
if exist "%source%\CDAP%DateTime%" (
  set FILE=CDAP%DateTime%
  call :MOVEIT
  )

rem clean up DU file
if %FOUND%==T del "%source%\DU%DateTime%"
goto :EOF

:MOVEIT
rem echo %FILE% file FOUND! Moving file to %destination%...
copy /Y "%source%\%FILE%" "%destination%\%FILE%" >NUL
del "%source%\%FILE%"
set FOUND=T
exit /b

goto EOF

:EOF
