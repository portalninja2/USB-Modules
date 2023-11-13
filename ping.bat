@echo off
@title ping-module

:haupt
cls
echo.
echo Treffe eine Auswahl
echo =================================
echo.
echo [G]google
echo [C]cloudflare
echo [Y]YouTube
echo [M]Microsoft
echo [cp]Custom ping
echo.

set h=0
set /p h="Treffe eine Auswahl: "

if %h%==g goto google
if %h%==c goto cloudflare
if %h%==y goto youtube
if %h%==m goto microsoft
if %h%==cp goto cp
if %h%==back goto end

goto haupt

:google
ping -a google.com
pause
goto haupt 

:cloudflare
ping -a cloudflare.com
pause
goto haupt

:youtube
ping -a youtube.de
pause
goto haupt

:microsoft
ping -a microsoft.com
pause
goto haupt

:cp
cls
set ping=0
set /p ping="Adresse: "

ping -a %ping%
pause
goto haupt
:vl

:cl
cls
echo.
echo ===================================================
echo.
echo [c]Listeneintrag aendern
echo.
if not exist Scripts\modules\slot01.bat echo [01] Name: SL01 / ID: SlotID01
if exist Scripts\modules\slot01.bat echo Name: %sl01n% / ID: SlotID01

:add
set name=0
set /p name="Bitte trage den Namen des Pings ein: "

set address=0
set /p address="Bitte trage die Adresse ein: "

set slotid=0
set /p slotid="Bitte trage die SlotID ein: "

set sl01n=%name%

echo name: %name% - ID: %slotid% >> list.txt
echo %name% >> %name%

echo @echo off >> Scripts\modules\%slotid%.bat
echo @title %name% >> Scripts\modules\%slotid%.bat
echo. >> Scripts\modules\%slotid%.bat
echo :ping >> Scripts\modules\%slotid%.bat
echo ping -a %address% >> Scripts\modules\%slotid%.bat

pause


:end 
start USB-Modules.bat
exit
