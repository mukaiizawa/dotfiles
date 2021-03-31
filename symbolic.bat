@Echo off
REM N.B mklink:  (to)  (from)
echo "%HOMEDRIVE%%HOMEPATH%\.vim"
MKLINK /D "%HOMEDRIVE%%HOMEPATH%\.vim"     "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
MKLINK /D "%HOMEDRIVE%%HOMEPATH%\vimfiles" "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
MKLINK /D "%HOMEDRIVE%%HOMEPATH%\userbin"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\bin"
MKLINK    "%HOMEDRIVE%%HOMEPATH%\_vimrc"   "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc"
MKLINK    "%HOMEDRIVE%%HOMEPATH%\_gvimrc"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\.gvimrc"

ECHO It finished. & pause > nul & EXIT
