scriptencoding utf-8

if !has('gui_running')
  if has('win32') || has ('win64')
    colorscheme default
  else
    set t_Co=256
    colorscheme shin-dark-term
  endif
endif
syntax enable

if !1 | finish | endif
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

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
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Yggdroot/indentLine'
call neobundle#end()
filetype plugin indent on

set encoding=utf-8
set wildmenu
set showcmd
set iminsert=0
set imsearch=0
set helplang=en
set history=2000
set nrformats-=octal
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp
set fileformat=unix
set fileformats=unix,dos
set printoptions=wrap:y,number:y
set number
set nowrap
set showmatch
set foldmethod=marker
set splitright
set list
set listchars=tab:->,eol:<,trail:>
set backspace=start,eol,indent
set title
set cursorline
set colorcolumn=80
set cmdheight=2
set laststatus=2
set showtabline=2
set tabline=%t
set statusline=%F%#Exception#%m%r%##\ %=\ %{&ft}\ %{&fenc}\ %{CurrentFileformat()}\ [%{CurrentLine()},%{CurrentCol()}]
set tabpagemax=300
set noundofile
set viminfo=
set nobackup
set noswapfile
set hlsearch
set wrapscan
set ignorecase
set smartcase
set autoindent
set tabstop=2
set smartindent
set expandtab
set shiftwidth=2
set formatoptions-=tc
set formatoptions+=roqj

nnoremap <C-d> <NOP>
nnoremap <C-e> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-y> <NOP>
nnoremap <Del> <NOP>
nnoremap <Insert> <NOP>
nnoremap <Space> <NOP>
nnoremap Q <NOP>
nnoremap ZZ <NOP>
nnoremap ch <NOP>
nnoremap cj <NOP>
nnoremap ck <NOP>
nnoremap cl <NOP>
nnoremap dh <NOP>
nnoremap dj <NOP>
nnoremap dk <NOP>
nnoremap dl <NOP>
nnoremap s  <NOP>
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>q<CR>

" surround delete
nnoremap sd' f'x,x
nnoremap sd" f"x,x
nnoremap sd* f*x,x
nnoremap sd< f>xF<x
nnoremap sd> f>xF<x
nnoremap sd( f)xF(x
nnoremap sd) f)xF(x
nnoremap sd{ f}xF{x
nnoremap sd} f}xF{x
nnoremap sd[ f]xF[x
nnoremap sd] f]xF[x

inoremap jj <Esc>
inoremap <C-l> <C-n>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
inoremap <Tab> <C-v><Tab>
nnoremap U  <C-r>
nnoremap <Space>w :set wrap!<CR>
nnoremap <S-Insert> "*p
nnoremap <C-Insert> "*y
vnoremap <S-Insert> "*p
vnoremap <C-Insert> "*y
vnoremap / y/<C-r>"<CR>
nnoremap Y y$
nnoremap <Space>h 0
nnoremap <Space>l $
nnoremap <Space>j Lzz
nnoremap <Space>k Hzz
nnoremap <Space><Space> zz
vnoremap <Space>h 0
vnoremap <Space>l $
vnoremap <Space>j Lzz
vnoremap <Space>k Hzz
nnoremap ) }
nnoremap ( {
nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>
nnoremap <silent>mm :e #<CR>
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>
nnoremap <F5> :<C-u>source $MYVIMRC<CR>

set completefunc=CompleteWords
inoremap <C-k> <C-x><C-u>

" unite
let g:html_number_lines = 0
let g:unite_no_default_keymappings = 1
let g:unite_source_rec_min_cache_files = 100
let g:unite_source_rec_max_cache_files = 200
call unite#custom#profile('default', 'context', {
      \   'start_insert' : 1,
      \   'no_wrap' : 1,
      \   'prompt' : '> ',
      \   'marked_icon' : '@',
      \   'candidate_icon' : '*',
      \   'direction' : 'topleft',
      \   'cursor_line_time' : 0.0,
      \   'cursor_line_highlight' : 'Visual',
      \ })
call unite#custom_default_action('directory', 'vimfiler')
call unite#custom#source('neomru/file', 'ignore_pattern','**/dict/*.*')

" NeoMRU
let g:neomru#file_mru_limit = 1000
let g:neomru#directory_mru_limit = 500
let g:neomru#directory_mru_ignore_pattern = ''

" vimfiler
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''
let g:vimfiler_directory_display_top = 1
let g:vimfiler_tree_leaf_icon = '|'
let g:vimfiler_tree_opened_icon = '-'
let g:vimfiler_tree_closed_icon = '+'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = 'X'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_indentation = 1
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto-expand' : 1,
      \ 'auto-cd' : 1,
      \ 'find' : 1,
      \ 'status' : 1,
      \ })

" quickrun
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
      \  '_' : {
      \    'split': 'vertical',
      \    'outputter/buffer/close_on_empty' :1
      \  },
      \  'c' : {
      \    'hook/time/enable': 1,
      \    'type': executable('clang')? 'c/clang':
      \            executable('gcc')? 'c/gcc': '',
      \  },
      \  'lisp' : {
      \    'type': executable('lx86cl64')? 'lisp/ccll':
      \            executable('wx86cl64')? 'lisp/cclw':
      \            executable('clisp')? 'lisp/clisp':
      \            executable('sbcl')? 'lisp/sbcl': '',
      \    'hook/time/enable': 1,
      \  },
      \  'lisp/sbcl' : {
      \   'command' : 'sbcl',
      \   'cmdopt' : '--script',
      \ },
      \  'lisp/ccll' : {
      \   'command' : 'lx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \  'lisp/cclw' : {
      \   'command' : 'wx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \  'lisp/clisp': {
      \   'command': 'clisp',
      \ },
      \  'java' : {
      \    'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s'
      \               , '%c -Dfile.encoding=UTF8 %s:t:r %a'],
      \    'hook/time/enable': 1,
      \  },
      \  'python' : {
      \    'type' : executable('python3')? 'python/python3': 'python/python2',
      \  },
      \  'python/python3': {
      \   'command': 'python3',
      \ },
      \  'python/python2': {
      \   'command': 'python',
      \ },
      \}

" indentLine
let g:indentLine_char = '|'
let g:indentLine_fileType = ['']

" caw
let g:caw_no_default_keymappings = 1

" plugin mapping
nnoremap sp :<C-u>PrintSurround<CR>
vnoremap sp :PrintSurround<CR>
inoremap <C-d> <Esc>:InsertDate<CR>
nnoremap <silent>mc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent>me :<C-u>Unite menu<CR> 
nnoremap <silent>ml :<C-u>Unite line -no-wrap<CR>
nnoremap <silent>mrl :<C-u>Unite help -no-wrap -no-empty -horizontal<CR>
nnoremap <silent>mru :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>
nnoremap <silent>mf :<C-u>VimFilerBufferDir -create<CR>
nnoremap <silent>ms :<C-u>VimShellBufferDir<CR>
nnoremap <silent>mq :<C-u>lcd %:h<CR> :<C-u>QuickRun<CR>
vnoremap <silent>gco :ContinuousNumber <C-a><CR>
nnoremap <Space>i :<C-u>IndentLinesToggle<CR>
nmap gci <Plug>(caw:hatpos:toggle)
nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
vmap gci <Plug>(caw:hatpos:toggle)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)
nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)
nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)
