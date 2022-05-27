:: ===========================================================================================================
:: @file        whereis.bat
:: @brief       Shows where a program is .i.e whereis java
:: @author      Craig Richards
:: @date        03.03.2013
:: @version     1.0
:: @syntax      whereis.bat <program name>
:: @usage       whereis.bat java
:: @see         https://github.com/sebetci/geekcomputers/Batch/whereis.bat
:: @test        OK
:: @todo        Notify the client if the program is not present in the system path.
:: ===========================================================================================================

@ECHO OFF

:: The HELP function is called.
CALL :HELP

IF %ERRORLEVEL% EQU 0 (
    @FOR %%E IN (%PATHEXT%) DO @FOR %%I IN (%1%%E) DO @IF NOT "%%~$PATH:I"=="" (
        ECHO %%~$PATH:I
        GOTO :EOF
    )
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
            ECHO [BRIEF] Shows where a program is .i.e whereis java
            ECHO [USAGE] whereis.bat ^<program name^>
            EXIT /B 1
        )
    )
    EXIT /B 0