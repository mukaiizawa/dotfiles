scriptencoding utf-8

if !has('gui_running')
  if has('win32') || has ('win64')
    colorscheme default
  else
    set t_Co=256
    colorscheme shin-dark-term
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'vim-jp/vimdoc-ja'
Plug 'Yggdroot/indentLine'
call plug#end()
filetype plugin indent on
syntax enable

set autoindent
set backspace=start,eol,indent
set cmdheight=2
set colorcolumn=80
set completefunc=CompleteWords
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp
set fileformat=unix
set fileformats=unix,dos
set foldmethod=marker
set formatoptions+=roqjM
set formatoptions-=tc
set helplang=en
set history=2000
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set laststatus=2
set list
set listchars=tab:->,eol:<,trail:>
set nobackup
set noswapfile
set noundofile
set nowrap
set nrformats-=octal
set number
set printoptions=wrap:y,number:y
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set splitright
set statusline=%F%#Exception#%m%r%##\ %=\ %{&ft}\ %{&fenc}\ %{CurrentFileformat()}\ [%{CurrentLine()},%{CurrentCol()}]
set tabline=%t
set tabpagemax=300
set tabstop=2
set title
set viminfo=
set wildmenu
set wrapscan

inoremap <C-d> <Esc>:call InsertDate()<CR>
inoremap <C-k> <C-x><C-u>
inoremap <C-l> <C-n>
inoremap <Tab> <C-v><Tab>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
inoremap jj <Esc>
nnoremap ( {
nnoremap ) }
nnoremap <C-Insert> "*y
nnoremap <C-d> <NOP>
nnoremap <C-e> <NOP>
nnoremap <C-u> <NOP>
nnoremap <C-y> <NOP>
nnoremap <Del> <NOP>
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>
nnoremap <F5> :<C-u>source $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYGVIMRC<CR>
nnoremap <Insert> <NOP>
nnoremap <S-Insert> "*p
nnoremap <Space> <NOP>
nnoremap <Space><Space> zz
nnoremap <Space>j Lzz
nnoremap <Space>k Hzz
nnoremap <Space>w :set wrap!<CR>
nnoremap <silent><Space>h :call MoveLeftEnd()<CR>
nnoremap <silent><Space>l :call MoverRightEnd()<CR>
nnoremap <silent><Space>s :call ToggleShiftWidth()<CR>
nnoremap <silent>mm :e #<CR>
nnoremap <silent>sq :<C-u>q<CR>
nnoremap Q <NOP>
nnoremap U  <C-r>
nnoremap Y y$
nnoremap ZZ <NOP>
nnoremap ch <NOP>
nnoremap cj <NOP>
nnoremap ck <NOP>
nnoremap cl <NOP>
nnoremap dh <NOP>
nnoremap dj <NOP>
nnoremap dk <NOP>
nnoremap dl <NOP>
nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>
nnoremap j gj
nnoremap k gk
nnoremap s  <NOP>
nnoremap sd" f"x,x
nnoremap sd' f'x,x
nnoremap sd( f)xF(x
nnoremap sd) f)xF(x
nnoremap sd* f*x,x
nnoremap sd< f>xF<x
nnoremap sd> f>xF<x
nnoremap sd[ f]xF[x
nnoremap sd] f]xF[x
nnoremap sd{ f}xF{x
nnoremap sd} f}xF{x
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap ss <C-w>s
nnoremap st :<C-u>tabnew<CR>
nnoremap sv <C-w>v
vnoremap ( {
vnoremap ) }
vnoremap / y/<C-r>"<CR>
vnoremap <C-Insert> "*y
vnoremap <S-Insert> "*p
vnoremap <Space>h 0
vnoremap <Space>j Lzz
vnoremap <Space>k Hzz
vnoremap <Space>l $
vnoremap j gj
vnoremap k gk

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
      \   'cursor_line_time' : '0.0',
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
      \  'safe' : 0,
      \  'auto-expand' : 1,
      \  'auto-cd' : 1,
      \  'find' : 1,
      \  'status' : 1,
      \ })

" quickrun
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {
      \ '_' : {
      \   'split': 'vertical',
      \   'outputter/buffer/close_on_empty' :1
      \ },
      \ 'c' : {
      \   'hook/time/enable': 1,
      \   'type': executable('clang')? 'c/clang':
      \           executable('gcc')? 'c/gcc': '',
      \ },
      \ 'java' : {
      \   'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s'
      \              , '%c -ea -Dfile.encoding=UTF8 %s:t:r %a'],
      \   'hook/time/enable': 1,
      \ },
      \ 'lisp' : {
      \   'type': executable('lx86cl64')? 'lisp/ccll':
      \           executable('wx86cl64')? 'lisp/cclw':
      \           executable('clisp')? 'lisp/clisp':
      \           executable('sbcl')? 'lisp/sbcl': '',
      \   'hook/time/enable': 1,
      \ },
      \ 'lisp/sbcl' : {
      \  'command' : 'sbcl',
      \  'cmdopt' : '--script',
      \ },
      \ 'lisp/ccll' : {
      \   'command' : 'lx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \ 'lisp/cclw' : {
      \   'command' : 'wx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \ 'lisp/clisp': {
      \   'command': 'clisp',
      \ },
      \ 'markdown' : {
      \   'command': 'xmdrd',
      \ },
      \ 'paren' : {
      \   'command': 'paren',
      \   'exec': '%c -f%s',
      \ },
      \ 'python' : {
      \   'type' : executable('python3')? 'python/python3': 'python/python2',
      \ },
      \ 'python/python3': {
      \  'command': 'python3',
      \ },
      \ 'python/python2': {
      \   'command': 'python',
      \ },
      \ 'xmd': {
      \   'command': 'xmdrd',
      \ },
      \}

" indentLine
let g:indentLine_char = '|'
let g:indentLine_fileType = ['']

" caw
let g:caw_no_default_keymappings = 1

" plugin mapping
nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
nmap gci <Plug>(caw:hatpos:toggle)
nmap gw  <Plug>(openbrowser-open)
nmap gww <Plug>(openbrowser-search)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)
vmap gci <Plug>(caw:hatpos:toggle)
vmap gw  <Plug>(openbrowser-open)
vmap gww <Plug>(openbrowser-search)

nnoremap <silent>mc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent>me :<C-u>Unite menu<CR> 
nnoremap <silent>mf :<C-u>VimFilerBufferDir -create<CR>
nnoremap <silent>ml :<C-u>Unite line -no-wrap<CR>
nnoremap <silent>mq :<C-u>lcd %:h<CR> :<C-u>QuickRun<CR>
nnoremap <silent>mrd :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>
nnoremap <silent>mrl :<C-u>Unite help -no-wrap -no-empty -horizontal<CR>
nnoremap <silent>mru :<C-u>Unite file_mru<CR>
nnoremap <silent>ms :<C-u>VimShellBufferDir<CR>
vnoremap <silent>gco :ContinuousNumber<CR>

nnoremap <Space>i :<C-u>IndentLinesToggle<CR>

nnoremap sp :<C-u>PrintSurround<CR>
vnoremap sp :PrintSurround<CR>
