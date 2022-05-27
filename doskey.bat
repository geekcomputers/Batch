:: ===========================================================================================================
:: @file        doskey.bat
:: @brief       Recall and edit commands at the DOS prompt, and create macros.
:: @author      Craig Richards
:: @date        29.03.2013
:: @version     1.7
:: @description Create Aliases for DOS screen
:: @usage       doskey.bat
:: @see         https://github.com/sebetci/geekcomputers/Batch/doskey.bat
:: @reference   https://ss64.com/nt/doskey.html
:: @reference   https://docs.microsoft.com/en-us/windows-hardware/drivers/other-wdk-downloads
:: @reference   https://github.com/geekcomputers/Batch/issues/5
:: @changelog   1.2. Added enable_wireless and disable_wireless
:: @changelog   1.3. Added history alias so I can show the history for the session
:: @changelog   1.4. Added a link to the whereis command file to use the utility
:: @changelog   1.5. Added an alias to start and stop mysql server on notebook, and a shortcut to mysql, may remove and add it to my path
:: @changelog   1.6. Totally changed the script, it now checks that if it running on my netbook, it sets a certain subset of aliases, if any other machine it just creates the generic aliases
:: @changelog   1.7. Added alias for SQLITE
:: @note        The use of DOSKEY command in batch script files (*.cmd, *.bat) is not allowed.
:: @test        OK
:: @todo        How to transfer special system variables to the global path should be investigated.
:: @todo        The existence of files and directories should be checked.
:: ===========================================================================================================

@ECHO OFF

CALL :HELP

IF %ERRORLEVEL% EQU 0 (
  :: If the variable %ComputerName% is GEEKBOOK, the SPECIFIC function is called.
  IF %ComputerName% EQU GEEKBOOK ( CALL :SPECIFIC ) ELSE ( CALL :GENERIC )
)

GOTO :EOF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   This function contains alias definitions that can work on any system.
:: @parameter  None
:: @return     None
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:GENERIC
  :: Display a list of files and subfolders.
  DOSKEY LS=DIR

  :: Clear the screen.
  DOSKEY CLEAR=CLS

  :: Edit command line, recall commands, and create macros
  DOSKEY HISTORY=DOSKEY /h

  :: The whereis.bat script included in this repo is called.
  :: The variable %scripts% represents the directory where this repository is located.
  DOSKEY WHEREIS="%scripts%"\whereis.bat $*

  :: The following alias can be used to open a database file.
  DOSKEY SQLITE=SQLITE3 "%dropbox%"\Databases\sampleDatabase.db

  :: On Windows systems, the %HOMEDRIVE% variable changes to the C:\ directory.
  CD /D %HOMEDRIVE%
  EXIT /B 0

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @function   Some tools (MYSQL, DEVCON.EXE) must be installed on your system for this function to work.
:: @parameter  None
:: @return     None
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SPECIFIC
  :: If MySQL 5.6 is installed on your system, the name of the service will be MYSQL56.
  DOSKEY START_MYSQL=NET START MYSQL56
  DOSKEY STOP_MYSQL=NET STOP MYSQL56
  DOSKEY MYSQL="C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"

  :: The Windows Driver Kit (WDK) installation is required to use the DEVCON.EXE program.
  DOSKEY ENABLE_WIRELESS=DEVCON ENABLE *DEV_001C*
  DOSKEY DISABLE_WIRELESS=DEVCON DISABLE *DEV_001C*

  GOTO :GENERIC
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
            ECHO [BRIEF] Recall and edit commands at the DOS prompt, and create macros.
            ECHO [USAGE] doskey.bat
            EXIT /B 1
        )
    )
    EXIT /B 0