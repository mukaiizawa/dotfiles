@ECHO off

REM process kill

SETLOCAL ENABLEDELAYEDEXPANSION

SET PID=%1

if %PID% == '' (
  ECHO required process id
  EXIT 1
)

taskkill /f /pid %1

EXIT 0
