@echo off
setlocal enabledelayedexpansion
call sub0.bat

set str=ERROR
for /l %%i in (1, 1, 19) do set str=!str! %str%

:loop
echo %str%
set /a a = %random% %% 5
timeout /t %a% > nul
goto loop
