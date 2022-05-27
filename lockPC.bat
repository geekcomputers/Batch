:: ===========================================================================================================
:: @file        lookPC.bat
:: @brief       Lock your PC.
:: @update      27.05.2022
:: @version     1.1
:: @usage       lookPC.bat
:: @see         https://github.com/sebetci/Batch-Script-Basics/blob/master/lockPC.bat
:: @reference   https://community.spiceworks.com/topic/611015-lock-domain-workstation-with-gpo
:: @test        OK
:: @todo        The existence of files and directories should be checked.
:: ===========================================================================================================

@ECHO OFF

IF %ERRORLEVEL% EQU 0 (
    %windir%\System32\RunDLL32.exe User32.dll,LockWorkStation
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
            ECHO [BRIEF] Lock your PC.
            ECHO [USAGE] lockPC.bat
            EXIT /B 1
        )
    )
    EXIT /B 0
