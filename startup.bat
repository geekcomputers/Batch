@echo off

REM The above command turns off the output for the script

REM Script Name		: start-up.bat
REM Author				: Craig Richards
REM Created			: 08th-December-2010
REM Last Modified	: 14th-May-2012
REM Version				: 1.1
REM Modifications		: 1.1 - 14th-May-2012
REM							: 1.1 - Added the like to create a "virtual" drive for the putty keys
REM
REM	 Description		: Custom start-up batch file for my current work PC

echo %DATE% %TIME% >> u:\login.txt

REM Firewall Authentication
REM =======================

telnet 192.168.46.1 259
telnet 192.168.35.1 259

REM Load PuTTYCM
REM ============

start puttycm.exe

start /min notepad++ today.txt

start /min cmd.exe

REM Create a "Virtual Drive" - 1.2

subst k: "%dropbox%\Tulletts\Keys"
