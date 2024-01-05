@echo off
@title Web-Modul

:menu
SET /p colors=<Scripts\modules\Color.txt
color %colors%
cls
echo.
echo Websites
echo ======================================
echo [C]Weblink erstellen
echo [S]Weblink starten
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
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\web\*.bat"') do @echo %%~ni>>"Scripts\modules\datas\web\websites.wb"
echo Links (starten):
echo ============================================
echo.
type Scripts\modules\datas\web\websites.wb
echo.
del Scripts\modules\datas\web\websites.wb

set link=0
set /p link="Treffe deine Auswahl: "

start Scripts\modules\datas\web\%link%.bat

goto menu


:create
cls
echo.
echo Webseite hinzufuegen
echo ==============================================
set asw=0
set /p name="Name der Webseite: "
echo ----------------------------------------------
set asw2=0
set /p webseite="Adresse der Webseite (ohne https): "
echo.

echo @title off >> Scripts\modules\datas\web\%name%.bat
echo @title %name% >> Scripts\modules\datas\web\%name%.bat
echo cls >> Scripts\modules\datas\web\%name%.bat
echo start https://%webseite% >> Scripts\modules\datas\web\%name%.bat
echo exit >> Scripts\modules\datas\web\%name%.bat

goto menu

:remove
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\web\*.bat"') do @echo %%~ni>>"Scripts\modules\datas\web\websites.wb"
echo Links (entfernen):
echo ============================================
echo.
type Scripts\modules\datas\web\websites.wb
echo.
del Scripts\modules\datas\web\websites.wb

set link=0
set /p link="Treffe deine Auswahl: "

del Scripts\modules\datas\web\%link%.bat

goto menu

:end 
start USB-Modules.bat
exit