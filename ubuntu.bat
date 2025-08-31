@echo off

echo Are you sure you want to switch to Ubuntu?
choice /c YN /n -m "(Y/N)
if errorlevel 2 (
  exit /b 
) else (
  REM Set the boot sequence to Ubuntu and reboot
  REM Use the following command to find the uuid
  REM bcdedit /enum firmware
  bcdedit /set {fwbootmgr} bootsequence {89a96773-d23f-11ef-bcc1-9ff8695b7d7a}
  shutdown /r /t 0
)
