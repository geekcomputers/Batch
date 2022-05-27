:: ===========================================================================================================
:: @file        openCMD.bat
:: @brief       Used to get a command shell when you don't have access to the Run dialog box in windows
:: @author      Craig Richards
:: @date        03.11.2011
:: @version     1.0
:: @usage       openCMD.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/openCMD.bat
:: @reference   https://ss64.com/nt/start.html
:: @test        OK
:: ===========================================================================================================

@ECHO OFF

IF %ERRORLEVEL% EQU 0 (
    :: Start a program, command or batch script, opens in a new window.
    START
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
            ECHO [BRIEF] Used to get a command shell when you don't have access to the Run dialog box in windows
            ECHO [USAGE] openCMD.bat
            EXIT /B 1
        )
    )
    EXIT /B 0