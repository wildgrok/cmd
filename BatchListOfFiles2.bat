REM SETLOCAL ENABLEEXTENSIONS&SETLOCAL DISABLEDELAYEDEXPANSION
set /p s=FileSearch, type '-' to refresh lookup list: ||GOTO:EOF
if .%s% NEQ .- echo.&findstr %s% "%~f0"&PAUSE&GOTO:EOF
findstr /b /c:"@REM....&" "%~f0">"%~f0.txt"
dir /s/b c:\ 1>>"%~f0.txt"&move /Y "%~f0.txt" "%~f0"
GOTO:EOF