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
if exist apps\Start.exe echo [p] PortableApps Backup erstellen

echo.

set basw=0
set /p basw="Triff eine Auswahl: "

if %basw%==c goto lcbackup
if %basw%==p goto pabackup
if %basw%==r goto rcbackup
if exist apps\Start.exe if %basw%==m goto lclbackup
if %basw%==g goto lwbackup
if %basw%==gr goto rwbackup
if %basw%==back goto END

:lcbackup

echo Beta!
set name=0
set /p name="Trage deinen Zusatz Namen ein: "
set "name=LocalUSB-%name%.tar"
set "files=Bilder Dokumente Musik	Scripts	Videos	Zip's USB-Modules.bat"
tar -c -f BackUP's\local\%name% %files%

pause
goto backupmenue

:pabackup
echo Beta!
set name2=0
set /p name2="Trage deinen Zusatz Namen ein: "
set "name2=PortableApps-%name2%.tar"
set "files=apps"
tar -c -f BackUP's\local\%name2% %files%

pause
goto backupmenue

:lclbackup
echo Beta!
set /p name="Trage deinen Zusatz Namen ein: "
set "name=LocalFolder-%name%.tar"

set ordner5=0
set /p ordner5="Trage deinen Ordnerpfad mit dem Laufwerksbuchstaben ein: "

set "files=%ordner5%"
tar -c -f BackUP's\remote\%name% "%files%"
echo Fertig!
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
exit
