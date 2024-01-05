@echo off
@title Telefonbuch

if exist Scripts\modules\datas (goto menu) else (mkdir Scripts\modules\datas\)
if exist Scripts\modules\datas\tel (goto menu) else (mkdir Scripts\modules\datas\tel)

:menu
SET /p colors=<Scripts\modules\Color.txt
color %colors%
cls
echo.
echo Telefonbuch
echo ==================================================
echo.
echo [C]Kontakt hinzufuegen
echo [A]Kontakte ansehen
echo.

set asw=a
set /p asw="Treffe eine Auswahl: "

if %asw%==c goto create
if %asw%==a goto show
if %asw%==back goto end

:create
echo.
set title=Titel
set /p title="Nachname: "

echo -------------------------------------

set title2=Titel2
set /p title2="Vorname: "

echo -------------------------------------

set nummer=Keine-Festnetznummer
set /p nummer="Telefonnummer: "

echo -------------------------------------

set hnummer=Keine-Handynummer
set /p hnummer="Handynummer: "

echo -------------------------------------


set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%


echo ################################################################## >> Scripts\modules\datas\tel\"%title%".tsk
echo. >> Scripts\modules\datas\tel\"%title%".tsk
echo Name: %title% >> Scripts\modules\datas\tel\"%title%".tsk
echo Vorname: %title2% >> Scripts\modules\datas\tel\"%title%".tsk
echo Telefonnummer: %nummer% >> Scripts\modules\datas\tel\"%title%".tsk
echo Handynummer: %hnummer% >> Scripts\modules\datas\tel\"%title%".tsk
echo. >> Scripts\modules\datas\tel\"%title%".tsk

goto menu

:show
if exist "Scripts\modules\datas\tel\*.tsk" (goto anyways) else (goto notask)

:anyways
cls
for /f "delims=?" %%i in ('dir /b /a /s "Scripts\modules\datas\tel\*.tsk" "Scripts\modules\datas\tel\*.date"') do @echo %%~ni>>"Scripts\modules\datas\tel\tasks.tsks"
echo Telefonbuch: 
echo ###################################################
echo.
type Scripts\modules\datas\tel\tasks.tsks
echo.
del Scripts\modules\datas\tel\tasks.tsks

:dialog
set show=back
set /p show="Zu welchem brauchst du Details: "
cls

if exist Scripts\modules\datas\tel\"%show%".tsk (type Scripts\modules\datas\tel\"%show%".tsk) else (goto no)
echo.
pause

goto menu


:notasks
echo.
echo ###################################
echo Du hast keine Kontakte ;(
timeout 3
goto menu

:no
cls
echo.
echo Dieser Kontakt existiert nicht!
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
