@Echo off
SET /P ANSWER="May I make a symbolic link ? (Y/N)"
if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)
if /i {%ANSWER%}=={n} (goto :no)
if /i {%ANSWER%}=={no} (goto :no)

:no
echo It is interrupted. & pause > nul & exit

:yes
mklink /D "C:\users\shintarou\vimfiles" "C:\users\shintarou\dotfiles\.vim"
mklink /D "C:\users\shintarou\.vim" "C:\users\shintarou\dotfiles\.vim"
mklink    "C:\users\shintarou\_vimrc"    "C:\users\shintarou\dotfiles\.vimrc"
mklink    "C:\users\shintarou\_gvimrc"   "C:\users\shintarou\dotfiles\.gvimrc"
 
echo It finished. & pause > nul & exit

