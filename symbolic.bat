@echo off
rem n.b mklink:  (to)  (from)
echo "%HOMEDRIVE%%HOMEPATH%\.vim"
mklink /D "%HOMEDRIVE%%HOMEPATH%\.claude"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\.claude"
mklink /D "%HOMEDRIVE%%HOMEPATH%\.vim"     "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
mklink /D "%HOMEDRIVE%%HOMEPATH%\vimfiles" "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vim"
mklink    "%HOMEDRIVE%%HOMEPATH%\_vimrc"   "%HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc"
mklink    "%HOMEDRIVE%%HOMEPATH%\_gvimrc"  "%HOMEDRIVE%%HOMEPATH%\dotfiles\.gvimrc"
