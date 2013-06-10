@echo off

REM Script Name		: whereis.cmd
REM Author				: Craig Richards
REM Created			: 3rd-April-2013
REM Last Modified	: 
REM Version				: 1.0
REM Modifications		: 

REM	 Description		: Shows where a program is .i.e whereis java

@echo on

@for %%e in (%PATHEXT%) do @for %%i in (%1%%e) do @if NOT "%%~$PATH:i"=="" echo %%~$PATH:i