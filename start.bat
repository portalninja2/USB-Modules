del update-file.bat
mkdir Scripts\modules
@echo off
:Auswahlmenue
@title USB-Stick-Menue
cls
echo.
echo Treffe eine Auswahl
echo =================================
echo.
if exist Scripts\modules\backup.bat echo [B]BackUP Manager
if exist apps\Start.exe echo [P]Programme
echo [g]Get Modules
echo.

set asw=0
set /p asw="Bitte eine Auswahl treffen: "

if exist Scripts\modules\backup.bat if %asw%==b goto BackUP
if exist apps\Start.exe if %asw%==p goto portable
if %asw%==g goto getModules
if %asw%==exit goto END
if %asw%==update goto update
if %asw%==rmodules goto rmodules
if %asw%==info goto info
if %asw%==init goto init

goto end

:getModules
curl --output Scripts\modules\modules-store.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/get-modules.bat --ssl-no-revoke
start Scripts\modules\modules-store.bat
goto END

:BackUP
start Scripts\modules\backup.bat
goto END

:portable
start apps\Start.exe
goto END

:END
echo bye
exit

:update
del Scripts\modules\modules-store
curl --output update-file.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/update-file.bat --ssl-no-revoke
start update-file.bat
goto END
exit

:rmodules
del Scripts\modules\backup.bat
goto END
exit

:info
cls
@title Informations
echo .
echo Informations
echo ===========================================================================
echo.
echo Script created by Dennis B.
echo GitHub: https://github.com/portalninja2/
echo Email: dennis@systemcomb.de
echo Published Copys of this script are not allowed!
echo.
echo ===========================================================================
echo Hidden Commands:
echo.
echo [update] -- Will update the core features
echo [rmodules] -- Will remove all Modules, can be installed without data loss
echo [init] -- Will initialize the FileSystem
echo.
echo ===========================================================================
pause
goto Auswahlmenue

:init
mkdir Dokumente
mkdir Bilder
mkdir Videos
mkdir BackUP's
mkdir Scripts
mkdir Musik
mkdir Zip's
mkdir apps
mkdir Scripts\vorgefertigt
mkdir Scripts\modules
mkdir Scripts\bearbeitung
mkdir Scripts\fertig
mkdir Scripts\neu
mkdir BackUP's\local
mkdir BackUP's\remote
pause
goto Auswahlmenue
