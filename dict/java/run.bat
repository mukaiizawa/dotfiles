@ECHO off
CD /D %~DP0
SETLOCAL ENABLEDELAYEDEXPANSION

GOTO main

:usage
ECHO.
ECHO run FILE
ECHO 	指定したjavaファイルをコンパイルし、実行します。
ECHO 	実行するにはjdkへのパスが通っている必要があります。
ECHO 	FILE -- コンパイルして実行するjavaファイル
ECHO.
ECHO 使用例
ECHO run Test
ECHO.
GOTO end_batch

:main
IF "x%1"=="x" (
  GOTO usage
)

javac -encoding utf8 %1.java
java %1

pause

:end_batch
