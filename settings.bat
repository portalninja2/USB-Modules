@title settings
@echo off

:settings
set asw=back
set /p asw="Choose: "

if %asw%==color goto color

goto settings

:color
