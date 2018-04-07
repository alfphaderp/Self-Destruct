rem This file attempts to abort the self destruct sequence by aborting active shutdowns and killing processes

@echo off

shutdown /a
taskkill /f /im wscript.exe
taskkill /f /im cmd.exe
