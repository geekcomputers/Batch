@echo off

REM The above command turns off the output for the script

REM Script Name		: itunes.cmd
REM Author				: Craig Richards
REM Created			: 24th-January-2008
REM Last Modified	: 
REM Version				: 1.0
REM Modifications		: 
REM
REM	 Description		: Batch file I used to use to backup my iTunes library on my pc, scheduled via the at command

echo %DATE% >> c:\itunes.log
if exist g:\itunes\ move /Y g:\itunes g:\itunes.%date% 
md g:\itunes\
xcopy /Y /S c:\DOCUME~1\CRAIGR~1\mydocu~1\mymusi~1\itunes\* g:\itunes >> c:\itunes.log
xcopy /Y /S f:\itunes\* g:\itunes >> c:\itunes.log