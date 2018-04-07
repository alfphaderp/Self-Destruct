@echo off
setlocal enabledelayedexpansion

set str=ERROR
for /l %%i in (1, 1, 19) do set str=!str! %str%

title %str%
for /l %%i in (1, 1, 30) do echo %str%
