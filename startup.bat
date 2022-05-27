:: ===========================================================================================================
:: @file        startup.bat
:: @brief       Custom start-up batch file for my current work PC
:: @author      Craig Richards
:: @date        08.12.2010
:: @version     1.0
:: @usage       startup.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/startup.bat
:: @reference   https://ss64.com/nt/subst.html
:: @requirement https://www.thegeekstuff.com/scripts/puttycm.zip
:: @changelog   1.1. Added the like to create a "virtual" drive for the putty keys
:: @note        This script must be run in a command window with administrator rights.
:: @test        OK
:: @todo        The script should check if the requirements exist.
:: @todo        The existence of files and directories should be checked.
:: ===========================================================================================================

@ECHO OFF

CALL :HELP

IF %ERRORLEVEL% EQU 0 (
    ECHO %DATE% %TIME% >> C:\Login.txt

    :: Firewall Authentication
    TELNET 192.168.46.1 259
    TELNET 192.168.35.1 259

    :: Load PuTTYCM
    START PUTTYCM.exe
    START /MIN NOTEPAD++.exe C:\Today.txt
    START /MIN CMD.exe

    :: Create a "Virtual Drive"
    :: Associate a path with a drive letter
    SUBST K: "%%\Tulletss\Keys"
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
            ECHO [BRIEF] Custom start-up batch file for my current work PC
            ECHO [USAGE] startup.bat
            EXIT /B 1
        )
    )
    EXIT /B 0