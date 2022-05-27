:: ===========================================================================================================
:: @file        defragment.bat
:: @brief       The batch file I used to use to schedule a defrag of the c:\, using the AT command
:: @update      27.05.2022
:: @version     1.1
:: @usage       defragment.bat
:: @see         https://github.com/sebetci/Batch-Script-Basics/blob/master/defragment.bat
:: @reference   https://ss64.com/nt/defrag.html
:: @note        This script must be run in a command window with administrator rights.
:: @test        OK
:: @todo        Log file must be passed as a parameter from the command line.
:: @todo        The existence of drivers should be checked.
:: ===========================================================================================================

@ECHO OFF

:: The HELP function is called.
CALL :HELP

IF %ERRORLEVEL% EQU 0 (
    :: Defragment hard drive volumes.
    DEFRAG C: >> C:\Defragment.log
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
            ECHO [BRIEF] The batch file I used to use to schedule a defrag of the c:\, using the AT command
            ECHO [USAGE] defragment.bat
            EXIT /B 1
        )
    )
    EXIT /B 0