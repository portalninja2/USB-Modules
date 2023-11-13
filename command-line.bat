@echo off
@title command-line
color 09
cd Scripts\modules\
:Command

set asw=0
set /p asw="Gebe deinen Command ein: "

%asw%
goto Command
