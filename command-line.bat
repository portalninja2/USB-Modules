@echo off
@title Command Line

:Command

set asw=0
set /p asw="Gebe deinen Command ein: "

if %asw%==back goto back
else

%asw% 
goto Command
pause

:back
USB-Modules.bat
exit
