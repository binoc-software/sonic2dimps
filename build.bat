@ECHO OFF

REM // make sure we can write to the file S2Dimps.bin
REM // also make a backup to S2Dimps.prev.bin
IF NOT EXIST S2Dimps.bin goto LABLNOCOPY
IF EXIST S2Dimps.prev.bin del S2Dimps.prev.bin
IF EXIST S2Dimps.prev.bin goto LABLNOCOPY
move /Y S2Dimps.bin S2Dimps.prev.bin
IF EXIST S2Dimps.bin goto LABLERROR3
REM IF EXIST S2Dimps.prev.bin copy /Y S2Dimps.prev.bin S2Dimps.bin
:LABLNOCOPY

REM // delete some intermediate assembler output just in case
IF EXIST s2.p del s2.p
IF EXIST s2.p goto LABLERROR2
IF EXIST s2.h del s2.h
IF EXIST s2.h goto LABLERROR1

REM // clear the output window
cls


REM // run the assembler
REM // -xx shows the most detailed error output
REM // -c outputs a shared file (s2.h)
REM // -A gives us a small speedup
set AS_MSGPATH=win32/msg
set USEANSI=n
"win32/asw" -xx -c -A -E s2.log s2.asm

REM // combine the assembler output into a rom
IF EXIST s2.p "win32/s2p2bin" s2.p S2Dimps.bin s2.h

REM // fix some pointers and things that are impossible to fix from the assembler without un-splitting their data
IF EXIST S2Dimps.bin "win32/fixpointer" s2.h S2Dimps.bin   off_3A294 MapRUnc_Sonic $2D 0 4   word_728C_user Obj5F_MapUnc_7240 2 2 1  

REM REM // fix the rom header (checksum)
IF EXIST S2Dimps.bin "win32/fixheader" S2Dimps.bin


REM // done -- pause if we seem to have failed, then exit
IF NOT EXIST s2.p goto LABLPAUSE
IF EXIST S2Dimps.bin exit /b
:LABLPAUSE
pause


exit /b

:LABLERROR1
echo Failed to build because write access to s2.h was denied.
pause


exit /b

:LABLERROR2
echo Failed to build because write access to s2.p was denied.
pause


exit /b

:LABLERROR3
echo Failed to build because write access to S2Dimps.bin was denied.
pause


