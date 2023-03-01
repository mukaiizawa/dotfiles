@ECHO off
CD /D %~DP0
SETLOCAL ENABLEDELAYEDEXPANSION

REM set CLASSPATH=.;C:/foo/bar/xxx.jar
javac -encoding utf8 Main.java
java Main

pause
