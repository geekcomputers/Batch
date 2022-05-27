:: ===========================================================================================================
:: @file        iTunes.bat
:: @brief       Batch file I used to use to backup my iTunes library on my pc, scheduled via the at command
:: @author      Craig Richards
:: @date        24.01.2008
:: @version     1.0
:: @usage       iTunes.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/iTunes.bat
:: @reference   https://samsoft.org.uk/iTunes/scripts.asp
:: @reference   https://ss64.com/nt/move.html
:: @reference   https://ss64.com/nt/md.html
:: @reference   https://ss64.com/nt/xcopy.html
:: @test        X
:: @todo        Log file must be passed as a parameter from the command line.
:: @todo        For a portable script, the file and directory structure should be arranged.
:: ===========================================================================================================

@ECHO OFF

CALL :HELP

    IF %ERRORLEVEL% EQU 0 (
    :: The following command writes the current date to the C:\iTunes.log file using the %DATE% environment variable.
    ECHO %DATE% >> C:\iTunes.log

    :: If the G:\iTunes\ directory exists
    IF EXIST G:\iTunes\ 
        :: Move a file from one folder to another.
        MOVE /Y G:\iTunes G:\iTunes.%DATE%

    :: Make directory
    MD G:\iTunes\

    :: Copy files and/or directory trees to another folder.
    XCOPY /Y /S C:\DOCUME~1\CRAIGR~1\mydocu~1\mymusi~1\iTunes\* G:\iTunes >> C:\iTunes.log

    :: Copy files and/or directory trees to another folder.
    XCOPY /Y /S F:\iTunes\* G:\iTunes >> C:\iTunes.log
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
            ECHO [BRIEF] Batch file I used to use to backup my iTunes library on my pc, scheduled via the at command
            ECHO [USAGE] iTunes.bat
            EXIT /B 1
        )
    )
    EXIT /B 0