@echo off
@title ISO Downloader
cls
:menu
echo ISO Downloader
echo ====================================
echo [W10] Windows 10 ISO
echo [W11] Windows 11 ISO
echo [WA10] Activation Script
echo [WA11] Activation Script
echo [LU22] Ubuntu 22
echo [LMAK] Manjaro KDE (Arch)
echo [GD] Garuda
echo.

set asw=0
set /p asw="Treffe eine Auswahl: "
if %asw%==w10 goto win10
if %asw%==w11 goto win 11
if %asw%==wa10 goto wina10
if %asw%==wa11 goto wina11
if %asw%==lu22 goto ubuntu
if %asw%==lmak goto manjaro
if %asw%==gd goto Geruda

:win10

echo feritg
pause
goto end


:end
start USB-Modules.bat
exit