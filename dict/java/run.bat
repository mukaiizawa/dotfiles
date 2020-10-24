@ECHO off
CD /D %~DP0
SETLOCAL ENABLEDELAYEDEXPANSION

REM set CLASSPATH=.;C:/foo/bar/xxx.jar
javac -encoding utf8 x.java
java x

pause
