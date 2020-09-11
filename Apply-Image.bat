@echo off

@powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

@diskpart /s %~dp0\CreatePartition_Acer.txt

@Dism /Apply-Image /ImageFile:%1 /Index:%2 /ApplyDir:W:\

@copy %~dp0\kms.bat W:\Users\Public\Desktop

bcdboot W:\Windows /s S: /f UEFI