@echo off

echo Are you sure you want to switch to Ubuntu?
choice /c YN /n -m "(Y/N)
if errorlevel 2 (
  exit /b 
) else (
  REM Set the boot sequence to Ubuntu and reboot
  REM Use the following command to find the uuid
  REM bcdedit /enum firmware
  bcdedit /set {fwbootmgr} bootsequence {9aab830a-c09c-11ef-b976-de11f62be82b}
  shutdown /r /t 0
)
