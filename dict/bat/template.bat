@ECHO off
CD /D %~DP0
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO start: %DATE% %TIME%

SET VAR=hello world.
ECHO !VAR!

ECHO end: %DATE% %TIME%
PAUSE
