@Echo off
SET /P ANSWER="May I make a symbolic link ? (Y/N)"
if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)
if /i {%ANSWER%}=={n} (goto :no)
if /i {%ANSWER%}=={no} (goto :no)

:no
echo It is interrupted. & pause > nul & exit

:yes
mklink /D "C:\users\user-name\vimfiles" "C:\users\user-name\dotfiles\.vim"
mklink /D "C:\users\user-name\.vim" "C:\users\user-name\dotfiles\.vim"
mklink    "C:\users\user-name\_vimrc"    "C:\users\user-name\dotfiles\.vimrc"
mklink    "C:\users\user-name\_gvimrc"   "C:\users\user-name\dotfiles\.gvimrc"
 
echo It finished. & pause > nul & exit

