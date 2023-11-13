@echo off
@title Notizen
cls

:menu
cls
echo.
echo Treffe eine Auswahl
echo =================================
echo.
echo [A]Notizen ansehen
echo [C]Notizen erstellen
echo [RM]Alle Noitzen entfernen
echo.

set menu=0
set /p menu="Treffe deine Auswahl: "

if %menu%==a goto show
if %menu%==c goto create
if %menu%==rm goto remove
if %menu%==back goto end

goto menu

:show
cls
type Dokumente\Notizen.txt
pause
goto menu

:create
cls
set t=0
set /p t="Titel: "

set n=0
set /p n="Notiz: "

set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%

echo ============================================================================== >> Dokumente\Notizen.txt
echo Titel: %t% >> Dokumente\Notizen.txt
echo. >> Dokumente\Notizen.txt
echo Notiz: %n% >> Dokumente\Notizen.txt
echo --- >> Dokumente\Notizen.txt
echo Datum: %DD%.%MM%.%YYYY% >> Dokumente\Notizen.txt
echo Uhrzeit: %hr%:%min% Uhr>> Dokumente\Notizen.txt
echo. >> Dokumente\Notizen.txt
pause
goto menu

:remove
cls
set YYYY=%date:~-4%
set MM=%date:~-7,2%
set DD=%date:~-10,2%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set min=%time:~3,2%
set sek=%time:~6,2%

move Dokumente\Notizen.txt BackUP's\local\
ren BackUP's\local\Notizen.txt %YYYY%-%MM%-%DD%_%hr%-%min%_Notizen-BackUP.txt
del Dokumente\Notizen.txt

goto menu

:end
start USB-Modules.bat
exit
