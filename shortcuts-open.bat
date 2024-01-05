:start
@echo off
@title Shortcuts
SET /p colors=<Scripts\modules\Color.txt
color %colors%
cls
for /f "delims=?" %%i in ('dir /b /a /s "\Scripts\modules\datas\shortcuts\*.bat"') do @echo %%~ni>>"Scripts\modules\datas\shortcuts\short.cut"
echo Shortcuts:
echo ============================================
echo.
type Scripts\modules\datas\shortcuts\short.cut
echo.
del Scripts\modules\datas\shortcuts\short.cut

set link=0
set /p link="Treffe deine Auswahl: "

start Scripts\modules\datas\shortcuts\%link%.bat

start USB-Modules.bat
exit