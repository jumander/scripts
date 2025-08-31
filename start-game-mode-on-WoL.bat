@echo off
REM create a shortcut to this script and place it in the Start-up folder to run on startup

for /f %%i in ('powershell -Command "(Get-WmiObject -Class Win32_ComputerSystem).WakeupType"') do set WAKEUP=%%i

if "%WAKEUP%"=="7" (
    echo WoL detected
    call game-mode.bat
) else (
    echo Not WoL
    REM change monitor layout
    "C:\Program Files (x86)\MonitorProfileSwitcher/MonitorSwitcher.exe" -load:"C:\Users\johan\AppData\Roaming\MonitorSwitcher\Profiles\Desktop.xml"
)