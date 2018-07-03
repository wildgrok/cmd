@Echo Off
Set _Path=C:\Test Dir1
PushD %_Path%
For /F "Tokens=1 Delims=" %%a In ('Dir /A-D /B *.txt') Do (
Echo %%a
For /F "Usebackq Tokens=1 skip=1 Delims=" %%I In ("%%a") Do >>"%temp%\%%a" Echo.%%I
Move /Y "%temp%\%%a" .\
)
PopD