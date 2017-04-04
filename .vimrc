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

" Initialization {{{

if !1 | finish | endif
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" }}}
" NeoBundle {{{

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

" }}}

" =======================================
" Note:
" A fundamental setting bigins from here.
" It is applicable to .minvimrc.
" =======================================

" Setting
" Setting for System {{{

set encoding=utf-8            " Sets the character encoding used inside Vim.
set wildmenu                  " When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set showcmd                   " Show (partial) command in the last line of the screen.
set iminsert=0                " 0 :lmap is off and IM is off
set imsearch=0                " 0 :lmap is off and IM is off
set helplang=en
set history=2000
set nrformats-=octal
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp
set fileformat=unix
set fileformats=unix,dos
set printoptions=wrap:y,number:y

" }}}
" Setting for Display {{{

set number
set nowrap                     " When off lines will not wrap and only part of long lines will be displayed.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one. 
set foldmethod=marker
set splitright
set list
set listchars=tab:->,eol:<,trail:>
set backspace=start,eol,indent
set cursorline

" }}}
" Setting for Status line, Tab page {{{

set title
set cmdheight=2                " Number of screen lines to use for the command-line.
set laststatus=2               " Always, window show status.
set showtabline=2              " Always, tab page labels show status.
set tabline=%t
set statusline=%F%#Exception#%m%r%##\ %=\ %{&ft}\ %{&fenc}\ %{CurrentFileformat()}\ [%{CurrentLine()},%{CurrentCol()}]
set tabpagemax=300

" }}}
" Setting for File {{{

set noundofile
set viminfo=                   " Not use viminfo file.
set nobackup
set noswapfile

" }}}
" Setting for Search,Substitute {{{

set hlsearch                   " When search word, highlight all its matches.
set wrapscan
set ignorecase                 " The case of normal letters is ignored.
set smartcase                  " Override the ignorecase option if the search pattern contains uppercase charachers.

" }}}
" Setting for Tab,Indent {{{

set autoindent
set tabstop=2                  " Number of spaces that a <Tab> in the file counts for.
set smartindent
set expandtab
set shiftwidth=2

" }}}

" Mapping
" Mapping to NOP {{{

" normal mode
nnoremap Q <NOP>
nnoremap } <NOP>
nnoremap { <NOP>
nnoremap s  <NOP>
nnoremap zd <NOP>
nnoremap zD <NOP>
nnoremap zE <NOP>
nnoremap ZZ <NOP>
nnoremap dh <NOP>
nnoremap dl <NOP>
nnoremap ch <NOP>
nnoremap cl <NOP>
nnoremap <C-e> <NOP>
nnoremap <C-d> <NOP>
nnoremap <C-y> <NOP>
nnoremap <C-u> <NOP>
nnoremap <Space> <NOP>
nnoremap <Insert> <NOP>
nnoremap <Del> <NOP>

" visual mode
vnoremap s <NOP>
vnoremap <BS> <NOP>
vnoremap <CR> <NOP>

" }}}
" Mapping for Tab, Window {{{

nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>q<CR>

" }}}
" Mapping for Surround {{{

" Surround with print
nnoremap sp :<C-u>PrintSurround<CR>
vnoremap sp :PrintSurround<CR>

" Delete surround
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

" }}}
" Mapping for Insert Mode {{{

" End insert mode with jj.
inoremap jj <Esc>

" IM turn off automatically when leaving Insert mode.
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

" to insert tab
inoremap <Tab> <C-v><Tab>

" Insert date.
if exists("*strftime")
  inoremap <C-d> <Esc>:InsertDate<CR>
else
  echo "not exists strftime"
endif

" }}}
" Mapping the others {{{

" redo changes which were undone with U key
nnoremap U  <C-r>

" toggle `wrap' option
nnoremap <Space>w :set wrap!<CR>

" toggle `eapandtab' option
nnoremap <Space><Tab> :set expandtab!<CR>

" yank or Paste to clipboard
nnoremap <S-Insert> "*p
nnoremap <C-Insert> "*y
vnoremap <S-Insert> "*p
vnoremap <C-Insert> "*y

" serarch with selection
vnoremap / y/<C-r>"<CR>

" redraw at center of window
nmap n nzz
nmap N Nzz
nmap g, g,zz

" map `Y' to behave like a `C'
nnoremap Y y$

" cursor motion
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

" change directory to carrent buffer directory
nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>

" toggle a buffer which edit the one befor
nnoremap <silent>mm :e #<CR>

" edit vimrc, gvimrc
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>

" reroad vimrc
nnoremap <F5> :<C-u>source $MYVIMRC<CR>

" completefunction
set completefunc=CompleteWords
inoremap <C-k> <C-x><C-u>

" }}}


" ======================================
" Note:
" It is noapplicable to .minvimrc.
" An expansive setting bigins from here
" ======================================

" Setting of Plugin.
" 2html {{{

let g:html_number_lines = 0

" }}}
"  Unite {{{

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

" }}}
"  NeoMru {{{

let g:neomru#file_mru_limit = 1000    " default value
let g:neomru#directory_mru_limit = 500    " default value is 1000
let g:neomru#directory_mru_ignore_pattern = ''

" }}}
"  VimFiler {{{

" =============================================================
" Note: Disable netrw.vim and set vimfiler as default explorer.
" =============================================================
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1

" ============================================================================
" Note: This applies on the filenames of candidates.  It's not case sensitive.
" Example: "dot files pattern."
" let g:vimfiler_ignore_pattern = '^\.'
" ============================================================================
let g:vimfiler_ignore_pattern = ''

" ===============================================================
" Note: This variable controls vimfiler sorts directories as top.
" ===============================================================
let g:vimfiler_directory_display_top = 1

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto-expand' : 1,
      \ 'auto-cd' : 1,
      \ 'find' : 1,
      \ 'status' : 1,
      \ })

" set vimfiler's icon
let g:vimfiler_tree_leaf_icon = '|'
let g:vimfiler_tree_opened_icon = '-'
let g:vimfiler_tree_closed_icon = '+'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = 'X'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_tree_indentation = 1

" }}}
"  QuickRun {{{

" ================================================
" Note:
" Define key mapping to execute quickrun as 'mq'.
" Therefore, disable defaults key mappings.
" Refer to " Mappnig for Plugin " of " Plefix m ".
" ================================================
let g:quickrun_no_default_key_mappings = 1


" ==========================================================
" Note:
" --------	------
" Symbol    Result ~
" --------	------
" %%        %
" %c        Command (|quickrun-option-command|)
" %o        Command line option (|quickrun-option-cmdopt|)
" %s        Source (|quickrun-option-src|)
" %a        Script's arguments (|quickrun-option-args|)
" ==========================================================

let g:quickrun_config = {
      \  '_' : {
      \    'split': 'vertical',
      \    'outputter/buffer/close_on_empty' :1
      \  },
      \
      \  'c' : {
      \    'hook/time/enable': 1,
      \    'type': executable('clang')? 'c/clang':
      \            executable('gcc')? 'c/gcc': '',
      \  },
      \
      \  'lisp' : {
      \    'type': executable('lx86cl64')? 'lisp/ccll':
      \            executable('wx86cl64')? 'lisp/cclw':
      \            executable('clisp')? 'lisp/clisp':
      \            executable('sbcl')? 'lisp/sbcl': '',
      \    'hook/time/enable': 1,
      \  },
      \
      \  'lisp/sbcl' : {
      \   'command' : 'sbcl',
      \   'cmdopt' : '--script',
      \ },
      \
      \  'lisp/ccll' : {
      \   'command' : 'lx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \
      \  'lisp/cclw' : {
      \   'command' : 'wx86cl64',
      \   'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
      \ },
      \
      \  'lisp/clisp': {
      \   'command': 'clisp',
      \ },
      \
      \  'java' : {
      \    'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s', '%c -Dfile.encoding=UTF8 %s:t:r %a'],
      \    'hook/time/enable': 1,
      \  },
      \
      \}

" }}}
"  IndentLine {{{

let g:indentLine_char = '|'
let g:indentLine_fileType = ['']

" ============================================================
" Note:
" This variable specify a list of file types.
" When opening these types of files, the plugin is enabled by
" default.
" ============================================================

" }}}
"  caw {{{

" Disable default mapping.
let g:caw_no_default_keymappings = 1

" }}}

" Mapping of Plugin.
" Unite {{{

" colorsheme
nnoremap <silent>mc    :<C-u>Unite colorscheme -auto-preview<CR>

" line
nnoremap <silent>ml    :<C-u>Unite line -no-wrap<CR>

" help
nnoremap <silent>mrl    :<C-u>Unite help -no-wrap -no-empty -horizontal<CR>

" menu
nnoremap <silent>me    :<C-u>Unite menu<CR> 

" }}}
" NeoMRU {{{

nnoremap <silent>mru   :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd   :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>

" }}}
" VimFiler {{{

nnoremap <silent>mf    :<C-u>VimFilerBufferDir -create<CR>

" }}}
" VimShell {{{

nnoremap <silent>ms    :<C-u>VimShellBufferDir<CR>

" }}}
" Quick Run {{{

nnoremap <silent>mq    :<C-u>lcd %:h<CR> :<C-u>QuickRun<CR>

" }}}
" ContinuousNumber {{{

vnoremap <silent>gco    :ContinuousNumber <C-a><CR>

" }}}
" IndentLine {{{

nnoremap <Space>i      :<C-u>IndentLinesToggle<CR>

" }}}
" caw{{{

nmap gci <Plug>(caw:hatpos:toggle)
nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)

vmap gci <Plug>(caw:hatpos:toggle)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

" }}}
" open-browser{{{

nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)

nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

" }}}

" vim: foldmethod=marker
