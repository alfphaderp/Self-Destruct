rem This file starts a timer and shuts down after 13 seconds

@echo off
call sub0.bat

timeout /t 10 > nul
shutdown -s -t 3
