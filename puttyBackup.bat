:: ===========================================================================================================
:: @file        puttyBackup.bat
:: @brief       This is used to backup all my PuTTY settings out of the registry
:: @author      Craig Richards
:: @date        19.01.2011
:: @version     1.0
:: @usage       puttyBackup.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/puttyBackup.bat
:: @changelog   1.1. Edited the script to create variables for the filename and the registry key.
:: @note        This script must be run in a command window with administrator rights.
:: @test        X
:: @todo        The existence of files and directories should be checked.
:: ===========================================================================================================

@ECHO OFF

CALL :HELP

IF %ERRORLEVEL% EQU 0 (
    :: This will create a variable called date, the format is DD-MM-YYYY
    FOR /F "TOKENS=1,2,3 DELIMS=& " %%A IN ('DATE /T) DO (SET DATE=%%A-%%B-%%C)

    :: This sets the variable for the backup file name
    SET BackupFile = putty.%DATE%.reg

    :: This sets the variable for the registry key that is getting backed up
    SET RegKey=HKEY_CURRENT_USER\Software\SimonTatham\PuTTY

    :: The /e is for part of the registry, in this case the key listed above in the variable regkey
    :: The /a is for ASCII output, if you omit the /a the file will be twice a large
    REGEDIT /EA %SYSTEMDRIVE%\%BackupFile% %RegKey%
    REGEDIT /EA "%HOMEPATH%\Dropbox\%BackupFile%" %RegKey%
)

GOTO :EOF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   This function prints the help menu on the screen.
:: @parameter  None
:: @return     Returns 1 if the help menu is displayed.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:HELP
    FOR %%H IN (/h /help -help -h) DO (
        IF /I "%~1" EQU "%%~H" (
            ECHO.
            ECHO [BRIEF] This is used to backup all my PuTTY settings out of the registry
            ECHO [USAGE] puttyBackup.bat
            EXIT /B 1
        )
    )
    EXIT /B 0