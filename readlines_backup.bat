@ echo off
set TEXT_T=text1.txt
for /f "eol= tokens=* delims= usebackq" %%i in (%TEXT_T%) do (echo %%i,%TEXT_T%) >> outfile.txt