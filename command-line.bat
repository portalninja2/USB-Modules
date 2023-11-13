@echo off
@title Command Line

:Command

set asw=0
set /p asw="Gebe deinen Command ein: "

%asw%
pause
goto Command
