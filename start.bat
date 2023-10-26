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
echo [g]Get Modules
echo.

set asw=0
set /p asw="Bitte eine Auswahl treffen: "

if exist Scripts\modules\backup.bat if %asw%==b goto BackUP
if %asw%==g goto getModules
if %asw%==exit goto END
if %asw%==update goto update
if %asw%==rmodules goto rmodules
if %asw%==info goto info

goto end

:getModules
curl --output Scripts\modules\modules-store.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/get-modules.bat --ssl-no-revoke
start Scripts\modules\modules-store.bat
goto END

:BackUP
start Scripts\modules\backup.bat
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
echo.
echo ===========================================================================
pause
goto Auswahlmenue
