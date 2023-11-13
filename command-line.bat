@echo off
@title Command Line
cd Scripts\modules\
:Command

set asw=0
set /p asw="Gebe deinen Command ein: "

%asw%
goto Command
