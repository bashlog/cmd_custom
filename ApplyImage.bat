@echo off
rem == ApplyImage.bat ==

rem == These commands deploy a specified Windows
rem    image file to the Windows partition, and configure
rem    the system partition.

rem    Usage:   ApplyImage WimFileName 
rem    Example: ApplyImage E:\Images\ThinImage.wim ==

rem == Set high-performance power scheme to speed deployment ==
rem @wmic logicaldisk get name,volumename
rem set /p temp=ÊäÈë»º´æÄ¿Â¼£º
rem diskpart /s %temp%CreatePartitions-UEFI.txt
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
set /p ver=Windows°æ±¾£º
set /p wim_ver=Wim_ÅÌ·û£¨ÎÞÃ°ºÅ£©£º
if %ver%==10 (
    rem == Apply the image to the Windows partition ==
    @dism /Apply-Image /ImageFile:%wim_ver%:\sources\install.wim /Index:5 /ApplyDir:W:\
    @robocopy %wim_ver%:\groupp W:\Windows\system32\GroupPolicy /e /b /copy:dt /xj
    REM @dism /image:W:\ /add-driver /driver:"C:\import_Drivers" /Recurse /ForceUnsigned
    rem == Copy boot files to the System partition ==
    @W:\Windows\System32\bcdboot W:\Windows /s S:
    rem == Copy the Windows RE image to the
    rem    Windows RE Tools partition ==
    md R:\Recovery\WindowsRE
    @xcopy /h W:\Windows\System32\Recovery\Winre.wim R:\Recovery\WindowsRE\

    rem == Register the location of the recovery tools ==
    @W:\Windows\System32\Reagentc /Setreimage /Path R:\Recovery\WindowsRE /Target W:\Windows

    rem == Verify the configuration status of the images. ==
    @W:\Windows\System32\Reagentc /Info /Target W:\Windows
)
if %ver%==7 (
    @dism /Apply-Image /ImageFile:C:\temp\install_win7-sp1-vl.wim /Index:1 /ApplyDir:W:\ 
    @dism /image:W:\ /add-driver /driver:"C:\temp\win7_driver_inf" /Recurse /ForceUnsigned
    @bcdboot W:\Windows
)
PAUSE
exit