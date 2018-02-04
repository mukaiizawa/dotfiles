@ECHO off
CD /D %~DP0
SETLOCAL ENABLEDELAYEDEXPANSION

REM requires administrator rights

SETX /M JAVA_HOME "C:\Program Files\Java\jdk1.8.0_92"
SETX /M PATH "%PATH%;C:\Program Files\Java\jdk1.8.0_92\bin"
