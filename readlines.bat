@ echo off
set TEXT_T=%1
set OUTFILE_T=%2
for /f "eol= tokens=* skip=1 delims= usebackq"  %%i in (%TEXT_T%) do (echo %%i,%TEXT_T%) >> OUTFILE_T