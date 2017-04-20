@Echo off
ECHO May I make a symbolic link ? Yes[y]/No[n]
SET /P ANSWER=">> "
if /i {%ANSWER%}=={y} (GOTO :yes)
if /i {%ANSWER%}=={yes} (GOTO :yes)
if /i {%ANSWER%}=={n} (GOTO :no)
if /i {%ANSWER%}=={no} (GOTO :no)

:no
ECHO It is interrupted. & pause > nul & EXIT

:yes
ECHO Type user name.
SET /P HOME=">> "
REM N.B mklink:  (to)  (from)
MKLINK /D "C:\users\%HOME%\.vim"        "C:\users\%HOME%\dotfiles\.vim"
MKLINK /D "C:\users\%HOME%\vimfiles"    "C:\users\%HOME%\dotfiles\.vim"
MKLINK /D "C:\users\%HOME%\userbin"    "C:\users\%HOME%\dotfiles\bin"
MKLINK    "C:\users\%HOME%\_vimrc"      "C:\users\%HOME%\dotfiles\.vimrc"
MKLINK    "C:\users\%HOME%\_gvimrc"     "C:\users\%HOME%\dotfiles\.gvimrc"

REM mklink    "C:\users\%HOME%\.vimrc"      "C:\users\%HOME%\dotfiles\.minvimrc"
REM mklink    "C:\users\%HOME%\.vimshrc"    "C:\users\%HOME%\dotfiles\.vimshrc"
REM mklink    "C:\users\%HOME%\.gitignore"  "C:\users\%HOME%\dotfiles\.gitignore"
REM mklink    "C:\users\%HOME%\.gitconfig"  "C:\users\%HOME%\dotfiles\.gitconfig"
 
ECHO It finished. & pause > nul & EXIT
