@echo off

REM Use the following command to find the path to ubuntu
REM bcdedit /enum firmware


echo Are you sure you want to switch to Ubuntu?
choice /c YN /n -m "(Y/N)
if errorlevel 2 (

  exit /b 

) else (

  REM Set the boot sequence to Ubuntu and reboot
  bcdedit /set {fwbootmgr} bootsequence {9aab830a-c09c-11ef-b976-de11f62be82b}

  REM bcdedit /set {bootmgr} path \EFI\ubuntu\shimx64.efi

  shutdown /r /t 0
)
