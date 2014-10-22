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
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    }
      \ }
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-jp/vimdoc-ja'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Unite, VimFiler, VimShell "{{{
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:unite_source_rec_min_cache_files = 300
let g:unite_source_rec_max_cache_files = 30000
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
" }}}

" Setting "{{{

" for System "{{{
set encoding=utf-8
set wildmenu
set showcmd
set iminsert=0
set imsearch=0
set cmdheight=2
set history=10000
set helplang=ja
set backspace=start,eol,indent
"}}}

" for Window "{{{
set laststatus=2
set showmatch
set title
set number
set ruler
set nowrap
"}}}

" for File "{{{
set nobackup
set noswapfile
set noundofile
set viminfo=
set nrformats-=octal
set fileencoding=utf-8
set foldmethod=marker
"}}}

" for Search,Substitute "{{{
set hlsearch
set wrapscan
set smartcase
set ignorecase
"}}}

" for Tab,Indent "{{{
set tabstop=2
set autoindent
set smartindent
set noexpandtab
set shiftwidth=2
set showtabline=2
set tabpagemax=300
set list
set listchars=tab:->,eol:<,trail:>
"}}}

"}}}

" Key Map " {{{
nnoremap s  <NOP>
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sq :<C-u>q<CR>

nnoremap <Up>     4<C-w>-
nnoremap <Down>  30<C-w>+
nnoremap <Right>  4<C-w>>
nnoremap <Left>   4<C-w><

nnoremap <S-u> <C-r>

nmap n nzz
nmap N Nzz
nnoremap <SPACE>   <C-f>zz
vnoremap <SPACE>   <C-f>zz
nnoremap <S-SPACE> <C-b>zz
vnoremap <S-SPACE> <C-b>zz

nnoremap <F3> :<C-u>e ~/dotfiles/.vimrc<CR>
nnoremap <F4> :<C-u>e ~/dotfiles/.gvimrc<CR>
nnoremap <F5> :<C-u>source ~/dotfiles/.vimrc<CR>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
" }}}

" Map to NOP "{{{
nnoremap Q <NOP>
nnoremap } <NOP>
nnoremap { <NOP>
nnoremap ZZ <NOP>
nnoremap <Home> <NOP>
nnoremap <End> <NOP>
nnoremap <Insert> <NOP>
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>

nnoremap <C-e> <NOP>
nnoremap <C-d> <NOP>
nnoremap <C-f> <NOP>
nnoremap <C-y> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-b> <NOP>
" }}}

" Map for Surround "{{{
nnoremap gs' wbi'<Esc>ea'<Esc>
nnoremap gs" wbi"<Esc>ea"<Esc>
nnoremap gs< wbi<<Esc>ea><Esc>
nnoremap gs> wbi<<Esc>ea><Esc>
nnoremap gs( wbi(<Esc>ea)<Esc>
nnoremap gs) wbi(<Esc>ea)<Esc>
nnoremap gs{ wbi{<Esc>ea}<Esc>
nnoremap gs} wbi{<Esc>ea}<Esc>
vnoremap gs' c''<Esc>hp
vnoremap gs" c""<Esc>hp
vnoremap gs< c<><Esc>hp
vnoremap gs> c<><Esc>hp
vnoremap gs( c()<Esc>hp
vnoremap gs) c()<Esc>hp
vnoremap gs{ c{}<Esc>hp
vnoremap gs} c{}<Esc>hp
"}}}

" Key Map For Plugin "{{{
nmap gci <Plug>(caw:i:toggle)
vmap gci <Plug>(caw:i:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)
nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

vnoremap <silent>co :ContinuousNumber <C-a><CR>

nnoremap <silent>mb    :<C-u>Unite bookmark<CR>
nnoremap <silent>mba   :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent>mru   :<C-u>Unite  -start-insert file_mru<CR>
nnoremap <silent><C-f> :<C-u>UniteWithBufferDir -start-insert file_rec<CR>
nnoremap <silent>ms    :<C-u>VimShellBufferDir<CR>
nnoremap <silent>msv   :<C-u>VimShellBufferDir -split<CR>
nnoremap <silent>mst   :<C-u>VimShellTab<CR>
nnoremap <silent>msi   :<C-u>VimShellInteractive<CR>
nnoremap <silent>mss   :<C-u>%VimShellSendString<CR>
nnoremap <silent>mf    :<C-u>VimFilerBufferDir -status -find<CR>
nnoremap <silent>mft   :<C-u>VimFilerBufferDir -status -find -tab<CR>
nnoremap <silent>mfv   :<C-u>VimFilerBufferDir -status -find -split<CR>
nnoremap <silent>mfd   :<C-u>VimFilerBufferDir -status -find -tab -double<CR>

"}}}



