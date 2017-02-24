The first setup of vim for Windows.

# Dowonload gvimxx.exe from "www.vim.org"

# Install git and Clone "dotfiles" repository from git.
    $ git clone git://github.com/mukaiizawa/dotfiles c:\Users\user-name\dotfiles
or
    $ git clone https://github.com/mukaiizawa/dotfiles c:\Users\user-name\dotfiles

# Install mingw to build "vimproc"
## build vimproc
or download vimproc
[vimproc releases](https://github.com/Shougo/vimproc.vim/releases)

# Execute "symbolic.bat" to make symboliclink.

# Make gitconfig
    $ git config user.name "mukaiizawa"
    $ git config user.email "mukaiizawa@yahoo.co.jp"
    $ git config --global http.proxy http://proxy.example.com:8080

.gitconfig
    [user]
      name = mukaiizawa
      email = mukaiizawa@yahoo.co.jp
    [http]
      proxy = http://proxy.example.com:8080

Cautions!
The path of git is letting it pass. 
