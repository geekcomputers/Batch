@echo off

REM The above command turns off the output for the script

REM Script Name		: putty_backup.bat
REM Author				: Craig Richards
REM Created			: 19th-January-2011
REM Last Modified	: 17th-October-2011
REM Version				: 1.1
REM Modifications		: 1.1 - Craig Richards - 13th September 2011 - Edited the script to create variables for the filename and the registry key
REM				  			Also used the Windows environment variables %SYSTEMDRIVE% and %USERPROFILE%
REM							%SYSTEMDRIVE% = Drive containing Windows root directory usually c:\
REM							%USERPROFILE% = C:\Documents and Settings\Username
REM
REM Description		: This is used to backup all my PuTTY settings out of the registry

REM Variable Settings

REM This will create a variable called date, the format is DD-MM-YYYY

For /f "tokens=1,2,3 delims=/ " %%a in ('date /t') do (set date=%%a-%%b-%%c)

REM This sets the variable for the backup file name

set bck_file=putty.%date%.reg

REM This sets the variable for the registry key that is getting backed up

set regkey=HKEY_CURRENT_USER\Software\SimonTatham\PuTTY

REM Main Program

REM The /e is for part of the registry, in this case the key listed above in the variable regkey
REM The /a is for ASCII output, if you omit the /a the file will be twice a large

regedit /ea %SYSTEMDRIVE%\%bck_file% %regkey%
regedit /ea "%USERPROFILE%\My Documents\My Dropbox\%bck_file%" %regkey%
