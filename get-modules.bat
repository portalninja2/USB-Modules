@echo off
mkdir Scripts\modules
cls

@title GetModules.bat
:getModules
@title Module Marketplace
cls
echo.
echo Vorgefertigte Module:
echo =================================
echo.
echo [B]BackUP - Modul
echo [PI]Programm Installations - Modul (Wartung)
echo [I]ISO Download - Modul (Wartung)
echo [P]Ping - Modul (Wartung)
echo [G]GitClone - Modul (Wartung)
echo [S]Shutdown - Modul (Wartung)
echo.

set mdasw=0
set /p mdasw="Bitte treffe eine Auswahl: "

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
