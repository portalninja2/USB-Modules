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
echo [PI]Programm Installations - Modul
echo [C]Command-Line - Modul
echo [N]Notes - Modul
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
if %mdasw%==c goto command-line
if %mdasw%==n goto notes
if %mdasw%==back goto :END

:BackUP
cls
curl --output Scripts\modules\backup.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/backup.bat --ssl-no-revoke
echo fertig
pause
goto getModules

:programm 
cls
curl --output apps\apps.zip https://cloud.systemcomb.de/s/YZxaPJ7j6YPaHEF/download/apps.zip --ssl-no-revoke
echo.
echo #####################################################################################################################################
echo Dateien werden entpackt bitte warten!
cd apps
tar -xf apps.zip
del apps.zip
cd ..

:command-line
cls
curl --output Scripts\modules\back.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/back.bat --ssl-no-revoke
curl --output Scripts\modules\command-line.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/command-line.bat --ssl-no-revoke
echo fertig
pause
goto getModules

:notes
cls
curl --output Scripts\modules\notes.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/notes.bat --ssl-no-revoke
echo fertig
pause
goto getModules

:ping
cls
curl --output Scripts\modules\ping-module.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/ping.bat --ssl-no-revoke
pause
goto getModules

:END
start USB-Modules.bat
echo bye
exit
