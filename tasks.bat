@echo off
@title Aufgaben

if exist Scripts\modules\datas (goto menu) else (mkdir Scripts\modules\datas\)
if exist Scripts\modules\datas\un (goto menu) else (mkdir Scripts\modules\datas\un)

:menu
SET /p colors=<Scripts\modules\Color.txt
color %colors%
cls
echo.
echo Aufgaben
echo ==================================================
echo.
echo [C]Aufgabe anlegen
echo [A]Aufgaben ansehen
echo [F]Aufgabe als erledigt makieren
echo [U]Aufgabe als unerledigt makieren
echo [D]Aufgabe entfernen
echo.

set asw=c
set /p asw="Treffe eine Auswahl: "

if %asw%==c goto create
if %asw%==a goto show
if %asw%==f goto finish
if %asw%==d goto remove
if %asw%==u goto unerledigt
if %asw%==back goto end

:create
echo.
set title=Titel
set /p title="Setze deinen Titel: "

echo -------------------------------------

set note=Keine-Bemerkung
set /p note="Setze eine Bemerkung (optional): "

echo -------------------------------------

set duration=Kein-Zeitziel
set /p duration="Bis wann muss es erledigt sein (optional): "

echo -------------------------------------

set username=unknown
set /p username="Angelegt von: (optional): "

echo -------------------------------------

set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%


echo ################################################################## >> Scripts\modules\datas\un\"%title%".tsk
echo. >> Scripts\modules\datas\un\"%title%".tsk
echo Aufgabe: %title% >> Scripts\modules\datas\un\"%title%".tsk
echo Bemerkung: %note% >> Scripts\modules\datas\un\"%title%".tsk
echo Bis: %duration% >> Scripts\modules\datas\un\"%title%".tsk
echo. >> Scripts\modules\datas\un\"%title%".tsk
echo System: >> Scripts\modules\datas\un\"%title%".tsk
echo -------- >> Scripts\modules\datas\un\"%title%".tsk
echo Erstellt am: %DD%-%MM%-%YYYY% >> Scripts\modules\datas\un\"%title%".tsk
echo um: %hr%:%min%:%sek% Uhr >> Scripts\modules\datas\un\"%title%".tsk
echo Erstellt von: %username% >> Scripts\modules\datas\un\"%title%".tsk
echo. >> Scripts\modules\datas\un\"%title%".tsk

goto menu

:show
if exist "\Scripts\modules\datas\un\*.tsk" (goto anyways) else (goto final)

:anyways
cls
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\un\*.tsk" "\Scripts\modules\datas\un\*.date"') do @echo %%~ni>>"Scripts\modules\datas\un\tasks.tsks"
echo Unerledigt: 
echo ###################################################
echo.
type Scripts\modules\datas\un\tasks.tsks
echo.
del Scripts\modules\datas\un\tasks.tsks

if exist "\Scripts\modules\datas\erledigt\*.tsk" (goto final) else (goto dialog)

:final
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\erledigt\*.tsk" "\Scripts\modules\datas\erledigt\*.date"') do @echo %%~ni>>"Scripts\modules\datas\erledigt\tasks.tsks"
echo.
echo Erledigt: 
echo ###################################################
echo.
type Scripts\modules\datas\erledigt\tasks.tsks
echo.
echo ---------------------------------------------------
del Scripts\modules\datas\erledigt\tasks.tsks

:dialog
set show=back
set /p show="Zu welchem brauchst du Details (unerledigt): "
cls

if exist Scripts\modules\datas\un\"%show%".tsk (type Scripts\modules\datas\un\"%show%".tsk) else (goto no)
echo.
pause

goto menu


:notasks
echo.
echo ###################################
echo Super, du hast keine Aufgaben
timeout 3
goto menu

:no
cls
echo.
echo Diese Aufgabe existiert nicht!
echo.
timeout 3
goto menu

:finish
if exist Scripts\modules\datas\erledigt (goto finish1) else (mkdir Scripts\modules\datas\erledigt)

:finish1
echo.
set fi=back
set /p fi="Welche Aufgabe ist erledigt: "

if exist Scripts\modules\datas\un\"%fi%".tsk (goto p3) else (goto no)

:p3
move Scripts\modules\datas\un\"%fi%".tsk Scripts\modules\datas\erledigt\"%fi%".tsk
del Scripts\modules\datas\un\"%fi%".tsk

goto menu

:unerledigt
set un=back
set /p un="Welche Aufgabe ist unerledigt: "

if exist Scripts\modules\datas\erledigt\"%un%".tsk (goto un1) else (goto no)

:un1
move Scripts\modules\datas\erledigt\"%un%".tsk Scripts\modules\datas\un\"%un%".tsk
del Scripts\modules\datas\erledigt\"%un%".tsk

goto menu

echo.

:remove
echo.
set rm=back
set /p rm="Welche Aufgabe soll entfernt werden: "

if exist Scripts\modules\datas\un\"%rm%".tsk or Scripts\modules\datas\erledigt\"%rm%".tsk (goto p4) else (goto no)

:p4
del Scripts\modules\datas\un\"%rm%".tsk
del Scripts\modules\datas\erledigt\"%rm%".tsk

goto menu

:end
start USB-Modules.bat
exit
