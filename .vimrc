scriptencoding utf-8
syntax enable

" Setting for Runtime " 
if !1 | finish | endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimproc', 

call neobundle#end()
filetype plugin indent on
NeoBundleCheck



" System "
set encoding=utf-8
set iminsert=0
set imsearch=0
set wildmenu
set showcmd
set cmdheight=2
set history=10000
set helplang=ja

" Window "
set laststatus=2
set showmatch
set title
set number
set ruler
set nowrap

" File "
set nobackup
set noswapfile
set noundofile
set viminfo=
set encoding=utf-8
set fileencoding=utf-8

" Search,Substitute "
set hlsearch
set ignorecase
set smartcase
set wrapscan

" Tab,Indent "
set noexpandtab
set tabstop=2
set shiftwidth=2
set showtabline=2
set tabpagemax=300
set autoindent
set smartindent
set nocindent
set lisp
set list
set listchars=tab:->,eol:<,trail:>

" Key Map "
nnoremap s <NOP>
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sq :q<CR>

nnoremap <S-u> <C-r>

nnoremap <C-e> <NOP>
nnoremap <C-d> <NOP>
nnoremap <C-f> <NOP>
nnoremap <C-y> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-b> <NOP>
nnoremap <SPACE> <C-f>zz
nnoremap <S-SPACE> <C-b>zz

nnoremap <F3> :e ~/dotfiles/.vimrc<CR>
nnoremap <F4> :e ~/dotfiles/.gvimrc<CR>
nnoremap <F5> :source ~/dotfiles/.vimrc<CR>
inoremap <ESC> <ESC>:set iminsert=0<CR>


" Key Map For Plugin "
" noremap <Plug>(caw:i)
