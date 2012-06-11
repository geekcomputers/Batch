@echo off

REM The above command turns off the output for the script

REM Script Name		: lockpc.bat
REM Author				: Craig Richards
REM Created			: 08th-December-2010
REM Last Modified	: 
REM Version				: 1.0
REM Modifications		: 
REM
REM	 Description		: This simple batchfile will lock your PC once clicked upon.  You can schedule this via the at scheduler to lock the file at a specified time

Rundll32.exe User32.dll,LockWorkStation
