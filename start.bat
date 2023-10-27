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
if %asw%==destroy goto destroy
if %asw%==rmdatas goto rmdatas
if %asw%==remove goto remove

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
goto Auswahlmenue

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
del apps\Start.exe
goto remove

:destroy
@title Selfdestroy
echo Selbstzerstörung in:
timeout 1
echo 10
timeout 1
echo 9
timeout 1
echo 8
timeout 1
echo 7
timeout 1
echo 6
timeout 1
echo 5
timeout 1
echo 4
timeout 1
echo 3
timeout 1
echo 2
timeout 1
echo 1
echo Selbstzerstörung wurde gestartet
timeout 1
del apps
del BackUP's
del Bilder
del Dokumente
del Musik
del Scripts
del Videos
del Zip's
timeout 20
del *

:rmdatas
@title RemoveModuleDatas
rmdir /s apps\PortableApps\
rmdir /s apps\Documents\
del apps\PortableApps\*
del BackUP's\*
del BackUP's\local\*
del BackUP's\remote\*
mkdir BackUP's\local\
mkdir BackUP's\remote
echo Fertig
pause 
goto Auswahlmenue

:remove
cls
@title Daten entfernen
echo Daten zum entfernen:
echo =============================================
echo.
echo [1]USB Daten
echo [2]ModulDaten
echo [3]Module
echo.

set entf=0
set /p entf="Triff eine Auswahl: "

if %entf%==1 goto usb
if %entf%==2 goto modulerd
if %entf%==3 goto moduler
if %entf%==back goto Auswahlmenue

goto remove

:usb
cls
echo USB - Daten
echo  =============================================
echo.
echo [C] Custom (Ordner auswaehlen)
echo [all] Alle Daten (von dem System)
echo.

set uentf=0
set /p uentf="Waehle deine Daten aus: "

if %uentf%==c goto customentf
if %uentf%==all goto destroy
if %uentf%==back goto remove

goto USB

:modulerd
cls
echo Modul - Daten
echo  =============================================
echo.
echo [all] Alle Modul Daten
if exist apps\Start.exe echo [APP] remove App Installations
if exist Scripts\modules\backup.bat echo [BACKUP] remove all BackUP's
echo.

set mentf=0
set /p mentf="Triff deine Auswahl: "

if %mentf%==all goto rmdatas
if %mentf%==app goto rmapps
if %mentf%==backup goto rmbackups
if %mentf%==back goto remove

goto modulerd
:moduler
cls
echo Module
echo  =============================================
echo.
echo [all] Alle Module entfernen
if exist apps\Start.exe echo [app] removes the App Module
if exist Scripts\modules\backup.bat echo [backup] remove BackUP Module
echo.

set rmm=0
set /p rmm="Triff eine Auswahl: "

if %rmm%==all goto rmodules
if %rmm%==app goto rmmapp
if %rmm%==backup goto rmmbackup
if %rmm%==back goto remove

goto moduler

:customentf
set centf=0
set /p centf="Ordner der entfernt werden soll: "
del %centf%
rmdir %centf%
goto remove

:rmapps
rmdir /s apps\PortableApps\
rmdir /s apps\Documents\
del apps\PortableApps\*
goto remove

:rmbackups
del BackUP's\*
del BackUP's\local\*
del BackUP's\remote\*
mkdir BackUP's\local\
mkdir BackUP's\remote
goto remove

:rmmapp
del apps\Start.exe
goto remove

:rmmbackup
del Scripts\modules\backup.bat
goto remove 

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
