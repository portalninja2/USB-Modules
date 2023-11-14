@echo off
@title Aufgaben

if exist Scripts\modules\datas ("goto menu") else ("mkdir Scripts\modules\datas\")

:menu
cls
echo.
echo Aufgaben
echo ==================================================
echo.
echo [C]Aufgabe anlegen
echo [A]Aufgaben ansehen
echo [D]Aufgabe entfernen
echo.

set asw=c
set /p asw="Treffe eine Auswahl: "

if %asw%==c goto create
if %asw%==a goto show
if %asw%==d goto remove
if %asw%==back goto end

:create
set title=Titel
set /p title="Setze deinen Titel: "

set note=Keine-Bemerkung
set /p note="Setze eine Bemerkung (optional): "

set duration=Kein-Zeitziel
set /p duration="Bis wann muss es erledigt sein (optional): "

set username=unknown
set /p username="Angelegt von: (optional): "

set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%


echo ################################################################## >> Scripts\modules\datas\"%title%".tsk
echo. >> Scripts\modules\datas\"%title%".tsk
echo Aufgabe: %title% >> Scripts\modules\datas\"%title%".tsk
echo Bemerkung: %note% >> Scripts\modules\datas\"%title%".tsk
echo Bis: %duration% >> Scripts\modules\datas\"%title%".tsk
echo ---- >> Scripts\modules\datas\"%title%".tsk
echo System: >> Scripts\modules\datas\"%title%".tsk
echo Erstellt am: %DD%-%MM%-%YYYY%>> Scripts\modules\datas\"%title%".tsk
echo um: %hr%:%min%:%sek% Uhr >> Scripts\modules\datas\"%title%".tsk
echo. >> Scripts\modules\datas\"%title%".tsk
echo von: %username% >> Scripts\modules\datas\"%title%".tsk
echo. >> Scripts\modules\datas\"%title%".tsk

goto menu

:show
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\*.tsk" "\Scripts\modules\datas\*.date"') do @echo %%~ni>>"Scripts\modules\datas\tasks.tsks"
type Scripts\modules\datas\tasks.tsks
pause
del Scripts\modules\datas\tasks.tsks

set show=back
set /p show="Zu welchem brauchst du Details: "

type Scripts\modules\datas\%show%.tsk
echo.
pause

goto menu

:remove
set rm=back
set /p rm="Welche Aufgabe ist erledigt: "

del Scripts\modules\datas\%rm%.tsk

goto menu

:end
start USB-Modules.bat
exit
