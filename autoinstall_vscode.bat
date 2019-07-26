@echo off
REM install vscode
@D:\Web_Downloads\VSCodeSetup-x64-1.22.1.exe
PAUSE
IF NOT EXIST %USERPROFILE%\AppData\Roaming\Code\User (
    md %USERPROFILE%\AppData\Roaming\Code\User
)
Copy D:\Appliations\settings.json %USERPROFILE%\AppData\Roaming\Code\User
PAUSE