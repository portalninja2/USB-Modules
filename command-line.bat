@echo off
@title command-line
color 09
cd Scripts\modules\
echo.
echo you can type "?" for help
echo.

:Command
set asw=cls
set /p asw=Gebe deinen Command ein: 
if "%asw%" == "green" goto green
if "%asw%" == "blue" goto blue
if "%asw%" == "?" goto help

if "%asw%" == "desktop" goto desktop
if "%asw%" == "documents" goto documents
if "%asw%" == "home" goto home
if "%asw%" == "usb" goto usb



:cmd
%asw%
goto Command

:green
color a
goto Command

:blue
color 09
goto Command

:desktop
cd /d %SystemDrive%\Users\%USERNAME%\Desktop
goto Command

:documents
cd /d %SystemDrive%\Users\%USERNAME%\Documents
goto Command

:home
cd /d %USERPROFILE%
goto Command

:usb
set drive=D
set /p drive="Drive: "
cd /d "%drive%:\Scripts\modules"
goto Command

:help
cls
echo help
echo =======================================================================
echo.
echo colors:
echo - green
echo - blue
echo.
echo paths
echo.
echo - desktop
echo - documents
echo - home
echo - usb (goes to home)
echo.
echo others:
echo - ? (help)

goto Command

