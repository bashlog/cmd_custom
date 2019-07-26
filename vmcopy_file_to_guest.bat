@echo off
REM set vmxFile="D:\Virtual_Host\CentOS 7_kms\CentOS 7_kms.vmx" 
set /p vmxFile=please input the path of vmxFile:
REM @"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" start %vmxFile% nogui
rem set /p hostFile=输入要传送的文件：
rem set /p guestPath=输入目的地（包含最后的文件名！）：
REM @"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" -T ws -gu root -gp 123456 CopyFileFromHostToGuest %vmxFile% D:\Share_Samba\py-kms.zip /root/py-kms.zip
REM @"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" -T ws -gu root -gp 123456 CopyFileFromHostToGuest %vmxFile% D:\win_Script\centos.sh /root/centos.sh
REM @"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" -T ws -gu root -gp 123456 CopyFileFromHostToGuest %vmxFile% D:\Share_Samba\kms.sh /root/kms.sh
@"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" -T ws -gu root -gp 123456 runProgramInGuest %vmxFile% -noWait /usr/bin/python2.7 /opt/py-kms/server.py
REM echo D:\win_Script\active_systemAndOffice.ps1 
rem @"C:\Program Files (x86)\VMware\VMware VIX\vmrun.exe" -T ws -gu root -gp 123456 runScriptInGuest %vmxFile% /bin/bash /root/centos.sh 