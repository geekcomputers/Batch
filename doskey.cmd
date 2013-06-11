@echo off

REM The above command turns off the output for the script

REM Script Name		: doskey.cmd
REM Author				: Craig Richards
REM Created			: 29th-March-2013
REM Last Modified	: 16th May 2013
REM Version				: 1.7
REM Modifications		: 1.2 - CR - Added enable_wireless and disable_wireless
REM							: 1.3 - CR - Added history alias so I can show the history for the session
REM							: 1.4 - CR - Added a link to the whereis command file to use the utility
REM							: 1.5 - CR - Added an alias to start and stop mysql server on notebook, and a shortcut to mysql, may remove and add it to my path
REM							: 1.6 - CR - Totally changed the script, it now checks that if it running on my netbook, it sets a certain subset of aliases, if any other machine it just creates the generic aliases
REM							: 1.7 - CR - Added alias for SQLITE

REM	 Description		: Create Aliases for dos screen

if %computername% EQU GEEKBOOK (
  goto Specific
) else (
  goto Generic
)
  
:Generic
DOSKEY ls=dir
DOSKEY clear=cls
DOSKEY history=DOSKEY /h
DOSKEY whereis="%scripts%"\batch\whereis.cmd $*
DOSKEY sqlite=sqlite3 "%dropbox%"\Databases\jarvis.db
cd /d %HOMEDRIVE%
exit /B 1

REM MySQL Start and stopping


:Specific
DOSKEY start_mysql=net start MySQL56
DOSKEY stop_mysql=net stop MySQL56
DOSKEY mysql="c:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"
DOSKEY enable_wireless=devcon enable *DEV_001C*
DOSKEY disable_wireless=devcon disable *DEV_001C*
goto Generic
exit /B 1