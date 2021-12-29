@echo off

REM The above command turns off the output for the script

REM Script Name		: logoff.bat
REM Author				: Craig Richards
REM Created			: 15th-April-2011
REM Last Modified	: 17th-October-2011
REM Version				: 1.2
REM Modifications		: 1.1 - Changed hard coded path from C:\Documents and Settings\my name to %USERPROFILE%
REM							: 1.1 - Changed the hard coded path for drive to %HOMEDRIVE%
REM							: 1.2 - Added the section to call my python script to compress my puttylogs when I log off the machine
REM
REM Description		: Custom log off batch script for my current work PC

REM Clear all Temporary Internet Files

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

REM Clear IE History

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1

REM Remove all files from %TEMP% - You can get a copy of sdelete here http://technet.microsoft.com/en-us/sysinternals/bb897443

sdelete -s %TEMP%/*.*

REM Remove list of Recently opened documents - You can get a copy of sdelete here http://technet.microsoft.com/en-us/sysinternals/bb897443

sdelete "%USERPROFILE%\Recent\*.*"

REM Clears DNS records and Resets TCP/IP

ipconfig /flushdns

REM Compress the days puttylogs - 1.2 

python puttylogs.py

REM Log the date/time 

echo %DATE% %TIME% >> %HOMEDRIVE%\logoff.txt

REM Log off my machine

shutdown -l -f 
