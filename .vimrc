scriptencoding utf-u
syntax enable

" Setting for Runtime " 
if !1 | finish | endif
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundle "{{{
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
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
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'vim-jp/vimdoc-ja'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}
" Unite, VimFiler, VimShell "{{{
let g:loaded_netrwPlugin = 1

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

let g:neomru#file_mru_limit = 500
let g:neomru#directory_mru_limit = 1000

let g:unite_enable_start_insert = 1
let g:unite_source_rec_min_cache_files = 50
let g:unite_source_rec_max_cache_files = 1000
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 200

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom_default_action('source/directory_mru/directory', 'vimfiler')
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
" }}}

" Setting "
" Setting for System "{{{
set encoding=utf-8
set wildmenu
set showcmd
set iminsert=0
set imsearch=0
set helplang=ja
set history=2000
set nrformats-=octal
" }}}
" Setting for Window "{{{
set ruler
set title
set number
set nowrap
set showmatch
set cmdheight=2
set laststatus=2
set showtabline=2
set tabpagemax=300
set backspace=start,eol,indent
" }}}
" Setting for File "{{{
set nobackup
set noswapfile
set noundofile
set viminfo=
set fileencoding=utf-8
set foldmethod=marker
" }}}
" Setting for Search,Substitute "{{{
set hlsearch
set wrapscan
set smartcase
set ignorecase
" }}}
" Setting for Tab,Indent "{{{
set autoindent
set tabstop=2
set smartindent
set expandtab
set shiftwidth=2
set list
set listchars=tab:->,eol:<,trail:>
"}}}

" Mapping "
" Mapping to NOP "{{{
nnoremap Q <NOP>
nnoremap } <NOP>
nnoremap { <NOP>
nnoremap ZZ <NOP>
nnoremap s  <NOP>
nnoremap <C-e> <NOP>
nnoremap <C-d> <NOP>
nnoremap <C-f> <NOP>
nnoremap <C-y> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-b> <NOP>
nnoremap <Space> <NOP>
nnoremap <Home> <NOP>
nnoremap <Home> <NOP>
nnoremap <End> <NOP>
nnoremap <Insert> <NOP>
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
" }}}
" Mapping for Tab, Window "{{{
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
" }}}
" Mapping for Surround "{{{
nnoremap s' wbi'<Esc>ea'<Esc>
nnoremap s" wbi"<Esc>ea"<Esc>
nnoremap s< wbi<<Esc>ea><Esc>
nnoremap s> wbi<<Esc>ea><Esc>
nnoremap s( wbi(<Esc>ea)<Esc>
nnoremap s) wbi<<Esc>ea><Esc>
nnoremap s{ wbi{<Esc>ea}<Esc>
nnoremap s} wbi{<Esc>ea}<Esc>

nnoremap sd' f'x,x
nnoremap sd" f"x,x
nnoremap sd< f>xF<x
nnoremap sd> f>xF<x
nnoremap sd( f)xF(x
nnoremap sd) f)xF(x
nnoremap sd{ f}xF{x
nnoremap sd} f}xF{x

nnoremap s'" f'x,x wbi"<Esc>ea"<Esc>
nnoremap s'< f'x,x wbi<<Esc>ea><Esc>
nnoremap s'> f'x,x wbi<<Esc>ea><Esc>
nnoremap s'( f'x,x wbi(<Esc>ea)<Esc>
nnoremap s') f'x,x wbi(<Esc>ea)<Esc>
nnoremap s'{ f'x,x wbi{<Esc>ea}<Esc>
nnoremap s'} f'x,x wbi{<Esc>ea}<Esc>

nnoremap s"' f"x,x wbi'<Esc>ea'<Esc>
nnoremap s"< f"x,x wbi<<Esc>ea><Esc>
nnoremap s"> f"x,x wbi<<Esc>ea><Esc>
nnoremap s"( f"x,x wbi(<Esc>ea)<Esc>
nnoremap s") f"x,x wbi(<Esc>ea)<Esc>
nnoremap s"{ f"x,x wbi{<Esc>ea}<Esc>
nnoremap s"} f"x,x wbi{<Esc>ea}<Esc>

nnoremap s<' f>xF<x wbi'<Esc>ea'<Esc>
nnoremap s<" f>xF<x wbi"<Esc>ea"<Esc>
nnoremap s<( f>xF<x wbi(<Esc>ea)<Esc>
nnoremap s<) f>xF<x wbi(<Esc>ea)<Esc>
nnoremap s<{ f>xF<x wbi{<Esc>ea}<Esc>
nnoremap s<} f>xF<x wbi{<Esc>ea}<Esc>

nnoremap s>' f>xF<x wbi'<Esc>ea'<Esc>
nnoremap s>" f>xF<x wbi"<Esc>ea"<Esc>
nnoremap s>( f>xF<x wbi(<Esc>ea)<Esc>
nnoremap s>) f>xF<x wbi(<Esc>ea)<Esc>
nnoremap s>{ f>xF<x wbi{<Esc>ea}<Esc>
nnoremap s>} f>xF<x wbi{<Esc>ea}<Esc>

nnoremap s(' f)xF(x wbi'<Esc>ea'<Esc>
nnoremap s(" f)xF(x wbi"<Esc>ea"<Esc>
nnoremap s(< f)xF(x wbi<<Esc>ea><Esc>
nnoremap s(> f)xF(x wbi<<Esc>ea><Esc>
nnoremap s({ f)xF(x wbi{<Esc>ea}<Esc>
nnoremap s(} f)xF(x wbi{<Esc>ea}<Esc>

nnoremap s)' f)xF(x wbi'<Esc>ea'<Esc>
nnoremap s)" f)xF(x wbi"<Esc>ea"<Esc>
nnoremap s)< f)xF(x wbi<<Esc>ea><Esc>
nnoremap s)> f)xF(x wbi<<Esc>ea><Esc>
nnoremap s){ f)xF(x wbi{<Esc>ea}<Esc>
nnoremap s)} f)xF(x wbi{<Esc>ea}<Esc>

nnoremap s{' f}xF{x wbi'<Esc>ea'<Esc>
nnoremap s{" f}xF{x wbi"<Esc>ea"<Esc>
nnoremap s{< f}xF{x wbi<<Esc>ea><Esc>
nnoremap s{> f}xF{x wbi<<Esc>ea><Esc>
nnoremap s{( f}xF{x wbi(<Esc>ea)<Esc>
nnoremap s{) f}xF{x wbi(<Esc>ea)<Esc>

nnoremap s}' f}xF{x wbi'<Esc>ea'<Esc>
nnoremap s}" f}xF{x wbi"<Esc>ea"<Esc>
nnoremap s}< f}xF{x wbi<<Esc>ea><Esc>
nnoremap s}> f}xF{x wbi<<Esc>ea><Esc>
nnoremap s}( f}xF{x wbi(<Esc>ea)<Esc>
nnoremap s}) f}xF{x wbi(<Esc>ea)<Esc>
"}}}
" Mappnig for plugin"{{{

" prefix g
nmap gci <Plug>(caw:i:toggle)
vmap gci <Plug>(caw:i:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)
nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

" prefix m
nnoremap <silent>mb    :<C-u>Unite bookmark<CR>
nnoremap <silent>mba   :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent>mg    :<C-u>lcd %:h<CR> :Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent>mgg   :<C-u>UniteResume search-buffer<CR>
nnoremap <silent>my    :<C-u>Unite history/yank<CR>
nnoremap <silent>mru   :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd   :<C-u>Unite directory_mru<CR>
nnoremap <silent>mre   :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent><C-f> :<C-u>UniteWithBufferDir file_rec<CR>
nnoremap <silent>ms    :<C-u>VimShellBufferDir -split<CR>
nnoremap <silent>mst   :<C-u>VimShellTab<CR>
nnoremap <silent>msi   :<C-u>VimShellInteractive<CR>
nnoremap <silent>mss   :<C-u>%VimShellSendString<CR>
nnoremap <silent>mf    :<C-u>VimFilerBufferDir -status -find<CR>
nnoremap <silent>mft   :<C-u>VimFilerBufferDir -status -find -tab<CR>
nnoremap <silent>mfv   :<C-u>VimFilerBufferDir -status -find -split<CR>
nnoremap <silent>mfd   :<C-u>VimFilerBufferDir -status -find -double<CR>

vnoremap <silent>co :ContinuousNumber <C-a><CR>
"}}}

" Mapping for etc "{{{
nnoremap <S-u> <C-r>
nmap n nzz
nmap N Nzz
nnoremap g, g,zz
nnoremap <Space>h 0
nnoremap <Space>l $
nnoremap <Space>j <C-f>zz
nnoremap <Space>k <C-b>zz
nnoremap <Space><Space> zz
vnoremap <Space>h 0
vnoremap <Space>l $
vnoremap <Space>j <C-f>zz
vnoremap <Space>k <C-b>zz

nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>
nnoremap <silent>mm :e #<CR>
nnoremap <silent>gcl  :<C-u>!clisp -i %<CR>

nnoremap <F3> :<C-u>e ~/dotfiles/.vimrc<CR>
nnoremap <F4> :<C-u>e ~/dotfiles/.gvimrc<CR>
nnoremap <F5> :<C-u>source ~/dotfiles/.vimrc<CR>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
" }}}




