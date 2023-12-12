@ECHO off
CD /D %~DP0

REM set CLASSPATH=.;C:/foo/bar/xxx.jar
javac -encoding utf8 Main.java
java Main %1 %2 %3 %4 %5 %6 %7 %8 %9

REM JEP 330: Launch Single-File Source-Code Programs
java Main.java %1 %2 %3 %4 %5 %6 %7 %8 %9
