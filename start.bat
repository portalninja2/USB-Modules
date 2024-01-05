del update-file.bat
mkdir Scripts\modules
@echo off

set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%

echo ############################################################################>>Scripts\modules\datas\logs.txt
echo geoeffnet am: %DD%.%MM%.%YYYY%>>Scripts\modules\datas\logs.txt
echo geoffnet um: %hr%:%min%:%sek%>>Scripts\modules\datas\logs.txt
echo geoffnet von: %userprofile%>>Scripts\modules\datas\logs.txt
echo.
:Auswahlmenue
SET /p colors=<Scripts\modules\Color.txt
color %colors%
@title USB-Stick-Menue
cls
echo ======================================
echo Wilkommen auf dem USB Stick
echo ======================================
echo.
echo Module: 
echo.
if exist Scripts\modules\backup.bat echo [B]BackUP Manager
if exist Scripts\modules\command-line.bat echo [C]command-line
if exist apps\Start.exe echo [P]Programme
if exist Scripts\modules\notes.bat echo [N]Notes
if exist Scripts\modules\tasks.bat echo [T]Aufgaben
if exist Scripts\modules\ping-module.bat echo [PI]pings
if exist Scripts\modules\web-modul.bat echo [W]Webseiten
if exist Scripts\modules\telefonbuch.bat echo [K]Telefonbuch
if exist Scripts\modules\shortcuts-open.bat echo [S]Shortcuts
SET /p menu=<Scripts\modules\1.txt
echo --------------------------------------

if %menu%==0 echo.
if %menu%==0 echo System
if %menu%==0 echo.
if %menu%==0 echo [g]Get Modules
if %menu%==0 echo [help] Hilfe
if %menu%==0 echo [exit] Bye
if %menu%==0 echo --------------------------------------
if %menu%==0 echo.

if %menu%==2 echo.
if %menu%==2 echo Settings
if %menu%==2 echo.
if %menu%==2 echo [set-color] Default Color
if %menu%==2 echo [set-panic] Apps to be closed in Panic
if %menu%==2 echo [set-standard] Set the enter Shortcut
if %menu%==2 echo [set-menu] set your Downbar
if %menu%==2 echo --------------------------------------
if %menu%==2 echo.
SET /p asw=<Scripts\modules\standard.txt
set /p asw="Bitte eine Auswahl treffen: "

if exist Scripts\modules\backup.bat if %asw%==b goto BackUP
if exist Scripts\modules\command-line.bat if %asw%==c goto command
if exist apps\Start.exe if %asw%==p goto portable
if exist Scripts\modules\notes.bat if %asw%==n goto note
if exist Scripts\modules\ping-module.bat if %asw%==pi goto ping
if exist Scripts\modules\tasks.bat if %asw%==t goto tasks
if exist Scripts\modules\web-modul.bat if %asw%==w goto web
if exist Scripts\modules\telefonbuch.bat if %asw%==k goto tel
if exist Scripts\modules\shortcuts-open.bat if %asw%==s goto so 
if exist Scripts\modules\shortcuts.bat if %asw%==set-shortcut goto ss
if %asw%==g goto getModules
if %asw%==exit goto END
if %asw%==update goto bruch
if %asw%==rmodules goto rmodules
if %asw%==info goto info
if %asw%==init goto init
if %asw%==destroy goto destroy
if %asw%==rmdatas goto rmdatas
if %asw%==remove goto remove
if %asw%==version goto version
if %asw%==help goto help
if %asw%==set-color goto settings
if %asw%==set-standard goto standard
if %asw%==ex start explorer
if %asw%==lock goto lock
if %asw%==folder goto folder
if %asw%==log goto log
if %asw%==folder-log goto flog
if %asw%==panic goto panic
if %asw%==set-panic goto set-panic
if %asw%==set-menu goto set-menu


goto Auswahlmenue

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

:note
start Scripts\modules\notes.bat
goto END

:command
start Scripts\modules\command-line.bat
goto END

:ping
start \Scripts\modules\ping-module.bat
goto END

:tasks
start \Scripts\modules\tasks.bat
goto END

:web
start \Scripts\modules\web-modul.bat
goto END

:tel
start \Scripts\modules\telefonbuch.bat
goto END

:so
start \Scripts\modules\shortcuts-open.bat
goto END

:ss
start \Scripts\modules\shortcuts.bat
goto END

:lock
start Scripts\modules\lock
goto Auswahlmenue

:folder
Scripts\modules\folder.bat
goto Auswahlmenue

:log
cls
type Scripts\modules\datas\logs.txt
pause
goto Auswahlmenue

:flog
cls
type Dokumente\logs.txt
pause
goto Auswahlmenue

:set-panic
set /p panic="panic close app: "
echo taskkill /IM %panic%.exe>>Scripts\modules\datas\panic\panictasks.bat
goto Auswahlmenue

:set-menu
echo.
cls
echo -----------------Menu-----------------
echo [0] System
echo [1] Secret (coming soon)
echo [2] Settings
echo [3] Help (Coming Soon)
echo [false] Downbar off
echo.
set /p menu="Set your menu Style: "
del Scripts\modules\1.txt
echo %menu%>>Scripts\modules\1.txt
goto Auswahlmenue

:panic
start Scripts\modules\datas\panic\panictasks.bat
goto Auswahlmenue

:help
@title help
cls
echo Help:
echo =========================================================
echo System:
echo.
echo [back] goes back
echo [version] get version and History
echo [remove] Get a remove menu
echo [info] Get info about the program
echo [init] create all default folders again
echo ---------------------------------------------------------
echo Settings: 
echo.
if exist Scripts\modules\shortcuts.bat echo [set-shortcut] Settings for Shortcuts (create - remove)
echo [set-color] Settings for colors in CMD
echo ---------------------------------------------------------
echo Others
echo.
echo [destroy] panic destroy
echo [ex] opens the explorer
echo =========================================================
echo Info: 
echo.
echo all command are written with lowercase letters
echo.
pause >nul
goto Auswahlmenue


:settings
cls
echo 0 = Schwarz
echo 1 = Blau
echo 2 = Gruen
echo 3 = Tuerkis
echo 4 = rot
echo 5 = Lila
echo 6 = Gelb
echo 7 = Hellgrau
echo 8 = Grau
echo 9 = Hellblau
echo A = Hellgruen
echo B = Hellturkis
echo C = Hellrot
echo D = Helllila
echo E = Hellgelb
echo F = Weiß
echo.
set color=7
set /p color="Setze deine Farbe: "
color %color%
del Scripts\modules\Color.txt
echo %color% >> Scripts\modules\Color.txt

goto Auswahlmenue

:standard
cls
echo set-color = Color settings
echo "[shortcut for module]" = start the Module
echo. 
set standard=set-color
set /p standard="Setze deine Standard Auswahl: "
del Scripts\modules\standard.txt
echo %standard% >> Scripts\modules\standard.txt

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

:bruch
cls
echo Dies ist eine TestUmgebung, es gibt keine Update funktionen
echo.
pause

goto Auswahlmenue

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
if exist Scripts\modules\tasks.bat echo [AUFGABEN] remove all tasks
if exist Scripts\modules\notes.bat echo [NOTES] remove all Notes
if exist Scripts\modules\web-modul.bat echo [WEBSITES] remove all Websites
if exist Scripts\modules\telefonbuch.bat echo [CONTACTS] remove all contacts
if exist Scripts\modules\shortcuts.bat echo [SHORTCUTS] remove all shortcuts
echo.

set mentf=0
set /p mentf="Triff deine Auswahl: "

if %mentf%==all goto rmdatas
if %mentf%==app goto rmapps
if %mentf%==backup goto rmbackups
if %mentf%==aufgaben goto not-found
if %mentf%==notes goto not-found
if %mentf%==websites goto not-found
if %mentf%==contacts goto not-found
if %mentf%==shortcuts goto not-found
if %mentf%==back goto remove

goto not-found

:not-found
cls
echo 404 Not found
echo.
timeout 2
goto modulerd

:moduler
cls
echo Module
echo  =============================================
echo.
echo [all] Alle Module entfernen
if exist apps\Start.exe echo [app] removes the App Module
if exist Scripts\modules\backup.bat echo [backup] remove BackUP Module
if exist Scripts\modules\command-line.bat echo [command] remove Command-Line Module
if exist Scripts\modules\ping-module.bat echo [ping] remove ping-module
echo.

set rmm=0
set /p rmm="Triff eine Auswahl: "

if %rmm%==all goto rmodules
if %rmm%==app goto rmmapp
if %rmm%==backup goto rmmbackup
if %rmm%==command goto rmcommand
if %rmm%==back goto remove
if %rmm%==ping goto rmmping

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

:rmcommand
del Scripts\modules\command-line.bat
del Scripts\modules\back.bat
goto remove

:rmmping
del Scripts\modules\ping-module.bat
goto remove

:info
cls
@title Informations
echo Informations
echo ===========================================================================
echo.
echo Script created by Dennis B.
echo GitHub: https://github.com/portalninja2/
echo Email: dennis@systemcomb.de
echo Published Copys of this script are not allowed!
echo.
echo all Command are written on down letters!
echo.
echo ===========================================================================
echo Hidden Commands:
echo.
echo [update] -- Will update the core features
echo [rmodules] -- Will remove all Modules, can be installed without data loss
echo [init] -- Will initialize the FileSystem
echo [remove] -- To remove different Datas
echo [version] -- To get Informations about the Version of the Software
echo [info] -- for Informations
echo [destroy] -- Panic Destroy the FileSystem
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

:version
cls
@title Version
echo Current Version
echo ==============================================================
echo 1.4.3 Lot of Bug Fixes
echo ==============================================================
echo.
echo Last Versions:
echo ##############################################################
echo 1.4.1 Setup Script changed
echo 1.4.0 Major (More Modules, more stuff)
echo 1.3.8 Two new Modules (Beta) where added
echo 1.3.6 Task Module added
echo 1.3.5 Ping Module added
echo 1.3.4 improvments
echo 1.3.3 new Module (Notes) added
echo 1.3.2 new Module (command-line) added
echo 1.3.1 Some fixes
echo 1.3.0 new Module (programs pack_def) added 
echo --------------------------------------------------------------
echo Version 1.2.15 - "Versions" bugfixes
echo 1.2.14 - "Versions" added
echo 1.2.13 - Module Apps prep + remove menu added
echo 1.2.12 - Command destroy added
echo 1.2.2-1.2.11 - Bugfixes
echo 1.2.1 - Module BackUP's feature - Folder added
echo 1.2.0 - Module Store added
echo --------------------------------------------------------------
echo 1.1.9 - Bugfixes
echo 1.1.8 - Bugfixes
echo 1.1.7 - Bugfixes
echo 1.1.6 - BackUP added
echo 1.1.5 - "Updates" feature added
echo 1.1.4 - "info" added
echo 1.1.2 - Bugfixes
echo 1.1.1 - Bugfixes
echo 1.1.0 - New Menu / Modules added
echo --------------------------------------------------------------
echo 1.0.4 - Idea with modules
echo 1.0.3-1.0.7 - Bugfixes
echo 1.0.2 - Features: Notes, Passwords, Ping added
echo 1.0.1 - Folder creating added
echo 1.0.0 - InstallScript
echo ##############################################################
echo.
echo created by Dennis B.
echo Copys of these Scripts are not allowed
echo.
pause >nul
goto Auswahlmenue

:settings
curl --output Scripts\modules\settings.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/settings.bat --ssl-no-revoke
curl --output Scripts\modules\standard.txt https://raw.githubusercontent.com/portalninja2/USB-Modules/main/standard.txt --ssl-no-revoke
curl --output Scripts\modules\Color.txt https://raw.githubusercontent.com/portalninja2/USB-Modules/main/Color.xt --ssl-no-revoke

:shortcuts
curl --output Scripts\modules\shortcut-open.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/shortcuts-open.bat --ssl-no-revoke
curl --output Scripts\modules\shortcut.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/shortcuts.bat --ssl-no-revoke
