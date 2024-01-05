@echo off
@title Shortcuts

:menu
SET /p colors=<Scripts\modules\Color.txt
color %colors%
cls
echo.
echo ShortCuts
echo ======================================
echo [C]ShortCut erstellen
echo [S]ShortCut starten
echo [D]Weblink entfernen
echo.

set nav=s
set /p nav="Treffe deine Auswahl: "

if %nav%==s goto start
if %nav%==c goto create
if %nav%==d goto remove
if %nav%==back goto end

goto menu

:start
cls
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\shortcuts\*.bat"') do @echo %%~ni>>"Scripts\modules\datas\shortcuts\short.cut"
echo Links (starten):
echo ============================================
echo.
type Scripts\modules\datas\shortcuts\short.cut
echo.
del Scripts\modules\datas\shortcuts\short.cut

set link=0
set /p link="Treffe deine Auswahl: "

start Scripts\modules\datas\shortcuts\%link%.bat

goto menu


:create
cls
echo.
echo Shortcut hinzufuegen
echo ==============================================
set asw=0
set /p name="Name des Shortcuts: "
echo ----------------------------------------------
set asw2=0
set /p webseite="Shortcut (kompletter Befehl): "
echo.

echo @title off >> Scripts\modules\datas\shortcuts\%name%.bat
echo @title %name% >> Scripts\modules\datas\shortcuts\%name%.bat
echo cls >> Scripts\modules\datas\shortcuts\%name%.bat
echo %webseite% >> Scripts\modules\datas\shortcuts\%name%.bat
echo exit >> Scripts\modules\datas\shortcuts\%name%.bat

goto menu

:remove
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\shortcuts\*.bat"') do @echo %%~ni>>"Scripts\modules\datas\shortcuts\short.cut"
echo Links (entfernen):
echo ============================================
echo.
type Scripts\modules\datas\shortcuts\short.cut
echo.
del Scripts\modules\datas\shortcuts\short.cut

set link=0
set /p link="Treffe deine Auswahl: "

del Scripts\modules\datas\shortcuts\%link%.bat

goto menu

:end 
start USB-Modules.bat
exit