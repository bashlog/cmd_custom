@echo off
setlocal EnableDelayedExpansion

del temp.txt
del veryhuo.vcf

set /a line=1
for /f "tokens=1,2,3 delims=," %%a in (veryhuo.csv) do (
	if !line! gtr 1 (
		(echo BEGIN:VCARD)       >> temp.txt
		(echo VERSION:3.0)		 >> temp.txt
		(echo N:%%a;%%b;;;)		 >> temp.txt
		(echo FN:%%a%%b)		 >> temp.txt
		(echo TEL;TYPE=CELL:%%c) >> temp.txt
		REM (echo ORG:%%c)			 >> temp.txt
		REM (echo TITLE:%%d)		 >> temp.txt
		(echo END:VCARD)		 >> temp.txt
	)
	set /a line+=1
)

ren temp.txt veryhuo.vcf

