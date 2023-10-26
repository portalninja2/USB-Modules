@echo off
mkdir Scripts\modules
cls

@title GetModules
:getModules
cls
echo.
echo Treffe eine Auswahl
echo =================================
echo.
echo [B]BackUP - Modul
echo [PI]Programm Installazion - Modul
echo [I]ISO Download - Modul
echo [P]Ping - Modul
echo [G]GitClone - Modul
echo [S]Shutdown - Modul
echo.

set mdasw=0
set /p mdasw="Bitte trffe eine Auswahl: "

if %mdasw%==b goto BackUP
if %mdasw%==pi goto programm
if %mdasw%==i goto ISO
if %mdasw%==p goto ping
if %mdasw%==g goto gitclone 
if %mdasw%==s goto shutdown 
if %mdasw%==back goto :END

:BackUP
cls
curl --output Scripts\modules\backup.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/backup.bat --ssl-no-revoke
echo fertig
pause
goto getModules

:END
start USB-Modules.bat
echo bye
exit
