:: ===========================================================================================================
:: @file        logOff.bat
:: @brief       Custom log off batch script for my current work PC
:: @author      Craig Richards
:: @date        15.03.2011
:: @version     1.0
:: @usage       logOff.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/logOff.bat
:: @reference   http://technet.microsoft.com/en-us/sysinternals/bb897443
:: @changelog   1.1. Changed hard coded path from C:\Documents and Settings\my name to %USERPROFILE%
:: @changelog   1.1. Changed the hard coded path for drive to %HOMEDRIVE%
:: @changelog   1.2. Added the section to call my python script to compress my puttylogs when I log off the machine
:: @test        X
:: @todo        The existence of files and directories should be checked.
:: ===========================================================================================================

@ECHO OFF

CALL :HELP

IF %ERRORLEVEL% EQU 0 (
    :: Clear all temporary internet files
    %windir%\System32\RunDLL32.exe InetCpl.cpl,ClearMyTracksByProcess 8

    :: Clear IE History
    %windir%\System32\RunDLL32.exe InetCpl.cpl,ClearMyTracksByProcess 1

    :: Remove all files from %TEMP%
    SDELETE -S %TEMP%/*.*

    :: Remove list of recently opened documents.
    SDELETE "%USERPROFILE%\Recent\*.*"

    :: Clears DNS records and resets TCP/IP
    IPCONFIG /FLUSHDNS

    :: Compress the days putty logs
    PYTHON PuttyLogs.py

    :: Log the date/time
    ECHO %DATE% %TIME% >> %HOMEDRIVE%\logOff.txt

    :: If the user enters the 'Y' character, the PC will be shut down.
    CHOICE /C SELECT /M "Are you sure you want to continue? [Y]/[N]"
    :: If the user enters the 'Y' character, the PC will be shut down.
    IF %ERRORLEVEL% EQU 1 CALL :SHUTDOWN
    :: If the user enters the 'N' character, the PC will not be shut down.
    IF %ERRORLEVEL% EQU 2 CALL :CONTINUE
)

GOTO :EOF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   This function allows the PC to be turned off.
:: @parameter  None
:: @return     None
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SHUTDOWN
    :: Log off my machine
    SHUTDOWN -L -F
    EXIT /B 0

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   This function prints a message on the screen because the PC is not turned off.
:: @parameter  None
:: @return     None
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:CONTINUE
    ECHO "Continue..."
    EXIT /B 0

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   This function prints the help menu on the screen.
:: @parameter  None
:: @return     Returns 1 if the help menu is displayed.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:HELP
    FOR %%H IN (/h /help -help -h) DO (
        IF /I "%~1" EQU "%%~H" (
            ECHO.
            ECHO [BRIEF] Custom log off batch script for my current work PC
            ECHO [USAGE] logOff.bat
            EXIT /B 1
        )
    )
    EXIT /B 0
