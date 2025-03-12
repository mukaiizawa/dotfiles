@echo off

set csc=C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe 
del *.exe > nul 2>&1

%csc% /nologo /out:run.exe /main:Main Main.cs Lib1.cs Lib2.cs

REM with reference
REM %csc% /nologo /out:run.exe /reference:System.Data.SQLite.dll /main:Main Main.cs Lib1.cs Lib2.cs

IF %ERRORLEVEL% == 0 (
  run
)
