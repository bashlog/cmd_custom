@echo off

for /f "eol=C tokens=3 delims= " %i in ('wmic os get caption') do @set ver=%i

if /I 8.1 EQU %ver% (slmgr /ipk GCRJD-8NW9H-F2CDX-CCM8D-9D6T9)
if /I win10pro EQU %1 (slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX)

slmgr /skms kms.z.localme