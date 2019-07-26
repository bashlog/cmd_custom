@echo off

@diskpart /s %~dp0\Format-C_Volume.txt

@Dism /Apply-Image /ImageFile:%1 /Index:%2 /ApplyDir:W:\ /CheckIntegrity /Verify

@copy %~dp0\kms.bat W:\Users\Public\Desktop

rem @robocopy Z:\2019-03-17_Acer_computer_Backups\zuCeLue_duo_ver\GroupPolicy_1903 W:\Windows\System32\GroupPolicy /E /B /COPY:DT /XJ /R:5 /W:10

bcdboot W:\Windows /s S: /f UEFI