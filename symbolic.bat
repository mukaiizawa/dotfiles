@echo off
rem n.b mklink:  (to)  (from)
echo "%homedrive%%homepath%\.vim"
mklink /D "%HOMEDRIVE%%HOMEPATH%\.vim"     "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
mklink /D "%HOMEDRIVE%%HOMEPATH%\vimfiles" "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
mklink /D "%HOMEDRIVE%%HOMEPATH%\userbin"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\bin"
mklink    "%HOMEDRIVE%%HOMEPATH%\_vimrc"   "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc"
mklink    "%HOMEDRIVE%%HOMEPATH%\_gvimrc"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\.gvimrc"
