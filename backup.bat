@echo off
:backupmenue
@title BackUP Tool
cls
echo BackUP Aktionen:
echo =====================
echo [c] Erstellen eines lokalen BackUP's (Diese Instanz)
echo [r] BackUP von einem Link erstellen
echo [m] BackUP von einem anderen Ordner erstellen
echo [g] BackUP wiederherstellen (lokal)
echo [gr] BackUP wiederherstellen (Remote)

echo.

set basw=0
set /p basw="Triff eine Auswahl: "

if %basw%==c goto lcbackup
if %basw%==r goto rcbackup
if %basw%==g goto lwbackup
if %basw%==gr goto rwbackup
if %basw%==back goto END

:lcbackup

echo Beta!
set name=0
set /p name="Trage deinen Zusatz Namen ein: "
set "name=LocalUSB-%name%.zip"
set "files=apps Bilder Dokumente Musik	Scripts	Videos	Zip's USB-Modules.bat filesystem_script.bat"
tar -c -f BackUP's\local\%name% %files%

pause
goto backupmenue

:rcbackup
echo coming soon
pause
goto backupmenue

:lwbackup
echo coming soon
pause
goto backupmenue

:rwbackup
echo coming soon
pause
goto backupmenue

:END
start USB-Modules.bat
exit
