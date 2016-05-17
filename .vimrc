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

" Initialization "{{{

if !1 | finish | endif
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


"}}}
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
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Yggdroot/indentLine'
call neobundle#end()
filetype plugin indent on


"}}}


" =======================================
" Note:
" A fundamental setting bigins from here.
" It is applicable to .minvimrc.
" =======================================

" Setting "
" Setting for System "{{{

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


"}}}
" Setting for Display "{{{

set number
set nowrap                     " When off lines will not wrap and only part of long lines will be displayed.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one. 
set foldmethod=marker
set splitright
set list
set listchars=tab:->,eol:<,trail:>
set backspace=start,eol,indent


"}}}
" Setting for Status line, Tab page "{{{

set title
set cmdheight=2                " Number of screen lines to use for the command-line.
set laststatus=2               " Always, window show status.
set showtabline=2              " Always, tab page labels show status.
set tabline=%t
set statusline=%F%#Exception#%m%r%##\ %=\ %{&ft}\ %{&fenc}\ %{CurrentFileformat()}\ [%{CurrentLine()},%{CurrentCol()}]
set tabpagemax=300


"}}}
" Setting for File "{{{

set noundofile
set viminfo=                   " Not use viminfo file.
set nobackup
set noswapfile


"}}}
" Setting for Search,Substitute "{{{

set hlsearch                   " When search word, highlight all its matches.
set wrapscan
set ignorecase                 " The case of normal letters is ignored.
set smartcase                  " Override the ignorecase option if the search pattern contains uppercase charachers.


"}}}
" Setting for Tab,Indent "{{{

set autoindent
set tabstop=2                  " Number of spaces that a <Tab> in the file counts for.
set smartindent
set expandtab
set shiftwidth=2


"}}}

" Mapping "
" Mapping to NOP "{{{

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
nnoremap dj <NOP>
nnoremap dk <NOP>
nnoremap dl <NOP>
nnoremap ch <NOP>
nnoremap cj <NOP>
nnoremap ck <NOP>
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


"}}}
" Mapping for Tab, Window "{{{

nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sr <C-w>r
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>q<CR>


"}}}
" Mapping for Surround "{{{

" =========================================
" Note: You can surround with these symble.
" Symbol: '', "", **
" Brackets: <>,(),{},[]
" =========================================

" Surround with symble. "{{{

nnoremap s' wbi'<Esc>ea'<Esc>
nnoremap s" wbi"<Esc>ea"<Esc>
nnoremap s* wbi*<Esc>ea*<Esc>
nnoremap s< wbi<<Esc>ea><Esc>
nnoremap s> wbi<<Esc>ea><Esc>
nnoremap s( wbi(<Esc>ea)<Esc>
nnoremap s) wbi(<Esc>ea)<Esc>
nnoremap s{ wbi{<Esc>ea}<Esc>
nnoremap s} wbi{<Esc>ea}<Esc>
nnoremap s[ wbi[<Esc>ea]<Esc>
nnoremap s] wbi[<Esc>ea]<Esc>


"}}}
" Surround with print "{{{

nnoremap sp :<C-u>PrintSurround<CR>
vnoremap sp :PrintSurround<CR>


"}}}
" Delete surround. "{{{

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


"}}}
" Change surround from ' to something. "{{{

nnoremap s'" f'r",r"
nnoremap s'* f'r*,r*
nnoremap s'< f'r>,r<
nnoremap s'> f'r>,r<
nnoremap s'( f'r),r(
nnoremap s') f'r),r(
nnoremap s'{ f'r},r{
nnoremap s'} f'r},r{
nnoremap s'[ f'r],r[
nnoremap s'] f'r],r[


"}}}
" Change surround from " to something. "{{{

nnoremap s"' f"r',r'
nnoremap s"* f"r*,r*
nnoremap s"< f"r>,r<
nnoremap s"> f"r>,r<
nnoremap s"( f"r),r(
nnoremap s") f"r),r(
nnoremap s"{ f"r},r{
nnoremap s"} f"r},r{
nnoremap s"[ f"r],r[
nnoremap s"] f"r],r[


"}}}
" Change surround from * to something. "{{{

nnoremap s*' f*r',r'
nnoremap s*" f*r",r"
nnoremap s*< f*r>,r<
nnoremap s*> f*r>,r<
nnoremap s*( f*r),r(
nnoremap s*) f*r),r(
nnoremap s*{ f*r},r{
nnoremap s*} f*r},r{
nnoremap s*[ f*r],r[
nnoremap s*] f*r],r[


"}}}
" Change surround from < > to something. "{{{

nnoremap s<' f>r'F<r'
nnoremap s<" f>r"F<r"
nnoremap s<* f>r*F<r*
nnoremap s<( f>r)F<r(
nnoremap s<) f>r)F<r(
nnoremap s<{ f>r}F<r{
nnoremap s<} f>r}F<r{
nnoremap s<[ f>r]F<r[
nnoremap s<] f>r]F<r[

nnoremap s>' f>r'F<r'
nnoremap s>" f>r"F<r"
nnoremap s>* f>r*F<r*
nnoremap s>( f>r)F<r(
nnoremap s>) f>r)F<r(
nnoremap s>{ f>r}F<r{
nnoremap s>} f>r}F<r{
nnoremap s>[ f>r]F<r[
nnoremap s>] f>r]F<r[


"}}}
" Change surround from ( ) to something. "{{{

nnoremap s(' f)r'F(r'
nnoremap s(" f)r"F(r"
nnoremap s(* f)r*F(r*
nnoremap s(< f)r>F(r<
nnoremap s(> f)r>F(r<
nnoremap s({ f)r}F(r{
nnoremap s(} f)r}F(r{
nnoremap s([ f)r]F(r[
nnoremap s(] f)r]F(r[

nnoremap s)' f)r'F(r'
nnoremap s)" f)r"F(r"
nnoremap s)* f)r*F(r*
nnoremap s)< f)r>F(r<
nnoremap s)> f)r>F(r<
nnoremap s){ f)r}F(r{
nnoremap s)} f)r}F(r{
nnoremap s)[ f)r]F(r[
nnoremap s)] f)r]F(r[


"}}}
" Change surround from { } to something. "{{{

nnoremap s{' f}r'F{r'
nnoremap s{" f}r"F{r"
nnoremap s{* f}r*F{r*
nnoremap s{< f}r>F{r<
nnoremap s{> f}r>F{r<
nnoremap s{( f}r)F{r(
nnoremap s{) f}r)F{r(
nnoremap s{[ f}r]F{r[
nnoremap s{] f}r]F{r[

nnoremap s}' f}r'F{r'
nnoremap s}" f}r"F{r"
nnoremap s}* f}r*F{r*
nnoremap s}< f}r>F{r<
nnoremap s}> f}r>F{r<
nnoremap s}( f}r)F{r(
nnoremap s}) f}r)F{r(
nnoremap s}[ f}r]F{r[
nnoremap s}] f}r]F{r[


"}}}
" Change surround from [ ] to something. "{{{

nnoremap s[' f]r'F[r'
nnoremap s[" f]r"F[r"
nnoremap s[* f]r*F[r*
nnoremap s[< f]r>F[r<
nnoremap s[> f]r>F[r<
nnoremap s[( f]r)F[r(
nnoremap s[) f]r)F[r(
nnoremap s[{ f]r}F[r{
nnoremap s[} f]r}F[r{

nnoremap s]' f]r'F[r'
nnoremap s]" f]r"F[r"
nnoremap s]* f]r*F[r*
nnoremap s]< f]r>F[r<
nnoremap s]> f]r>F[r<
nnoremap s]( f]r)F[r(
nnoremap s]) f]r)F[r(
nnoremap s]{ f]r}F[r{
nnoremap s]} f]r}F[r{


"}}}


"}}}
" Mapping for Calling External Program {{{

" Execute current buffer with clisp.
if executable('clisp')
  nnoremap <silent>gcl  :<C-u>lcd %:h<CR> :!clisp -i %<CR>
else
  nnoremap <silent>gcl  :<C-u>echo "clisp: command not found"<CR>
endif

" Execute current buffer with ccl.
if executable('wx86cl64')
  nnoremap <silent>gcw  :<C-u>lcd %:h<CR> :!wx86cl64 --terminal-encoding cp932 --load  % --eval "(ccl:quit)"<CR>
elseif executable('lx86cl64')
  nnoremap <silent>gcw  :<C-u>lcd %:h<CR> :!lx86cl64 --terminal-encoding cp932 --load  % --eval "(ccl:quit)"<CR>
else
  nnoremap <silent>gcw  :<C-u>echo "ccl: command not found"<CR>
endif

" Execute current buffer with sbcl.
if executable('sbcl')
  nnoremap <silent>gcs  :<C-u>lcd %:h<CR> :!sbcl --script %<CR>
else
  nnoremap <silent>gcs  :<C-u>echo "sbcl: command not found"<CR>
endif


"}}}
" Mapping for Insert Mode "{{{

" End insert mode with jj.
inoremap jj <Esc>

" IM turn off automatically when leaving Insert mode.
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

if exists("*strftime")
  " insert date
  inoremap <C-d> <Esc>:InsertDate<CR>
else
  echo "not exists strftime"
endif


"}}}
" Mapping for etc "{{{

" Redo changes which were undone with U key.
nnoremap U  <C-r>

" Toggle option
nnoremap <Space>/ :set hlsearch!<CR>
nnoremap <Space>n :set number!<CR>
nnoremap <Space>w :set wrap!<CR>

" Yank or Paste with clipboard
nnoremap <S-Insert> "*p
nnoremap <C-Insert> "*y
vnoremap <S-Insert> "*p
vnoremap <C-Insert> "*y

" Redraw at center of window.
nmap * *zz
nmap # #zz
nmap n nzz
nmap N Nzz
nmap g, g,zz
nmap g; g;zz

" Cursor motion
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

" Change directory to carrent buffer directory.
nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>

" Toggle a buffer which edit the one befor.
nnoremap <silent>mm :e #<CR>

" Edit vimrc, gvimrc.
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>

" Reroad vimrc.
nnoremap <F5> :<C-u>source $MYVIMRC<CR>


"}}}


" ======================================
" Note:
" It is noapplicable to .minvimrc.
" An expansive setting bigins from here
" ======================================

" Setting of Plugin.
"  Unite "{{{

let g:unite_no_default_keymappings = 1
let g:unite_source_rec_min_cache_files = 100
let g:unite_source_rec_max_cache_files = 200
let g:unite_source_rec_async_command = 'files -A'


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

" =============================================================
" Note: if executable ag.exe, execute grep command with ag.exe
" =============================================================
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"}}}
"  Unite menu "{{{

if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

" Diff "{{{

let g:unite_source_menu_menus.Diff = {
      \  "command_candidates" : [
      \      [ "diffoff     "  , "windo diffoff | set nowrap | set foldmethod=marker" ],
      \      [ "diffthis    "  , "diffthis" ],
      \      [ "diffupdate  "  , "diffupdate" ],
      \      [ "diffbuffers "  , "windo diffthis" ],
      \  ]
      \}


"}}}
" Edit "{{{

let g:unite_source_menu_menus.Edit = {
      \  "command_candidates" : [
      \      [ "vimrc         :<F3>"  , "edit $MYVIMRC " ],
      \      [ "gvimrc        :<F4>"  , "edit $MYGVIMRC" ],
      \  ]
      \}


"}}}
" Search "{{{

let g:unite_source_menu_menus.Search = {
      \  "command_candidates" : [
      \      [ "file/mru      :mru" , "Unite file_mru" ],
      \      [ "directory/mru :mrd" , "Unite directory_mru" ],
      \  ]
      \}


"}}}
" NeoBundle "{{{

let g:unite_source_menu_menus.NeoBundle = {
      \   "command_candidates" : [
      \       [ "NeoBundleLog"         , "NeoBundleLog" ],
      \       [ "NeoBundleList"        , "NeoBundleList" ],
      \       [ "NeoBundleClean"       , "NeoBundleClean" ],
      \       [ "NeoBundleCheck"       , "NeoBundleCheck" ],
      \       [ "NeoBundleUpdate"      , "NeoBundleUpdate" ],
      \       [ "NeoBundleInstall"     , "NeoBundleInstall" ],
      \       [ "NeoBundleCheckUpdate" , "NeoBundleCheckUpdate" ],
      \   ]
      \ }


"}}}
" Encoding "{{{

let g:unite_source_menu_menus.Encoding = {
      \ "command_candidates" : [
      \      [ "utf8"    , "setlocal fenc=Utf8"    ],
      \      [ "cp932"   , "setlocal fenc=cp932"   ],
      \      [ "euc "    , "setlocal fenc=euc"     ],
      \      [ "euc-jp"  , "setlocal fenc=euc-jp"  ],
      \      [ "utf16"   , "setlocal fenc=utf16"   ],
      \      [ "utf16-be", "setlocal fenc=utf16be" ],
      \      [ "jis"     , "setlocal fenc=jis"     ],
      \      [ "sjis"    , "setlocal fenc=sjis"    ],
      \      [ "unicode" , "setlocal fenc=unicode" ],
      \      [ "utf8     -re edit" , "e ++enc=Utf8"    ],
      \      [ "cp932    -re edit" , "e ++enc=cp932"   ],
      \      [ "euc      -re edit" , "e ++enc=euc"     ],
      \      [ "euc-jp   -re edit" , "e ++enc=euc-jp"  ],
      \      [ "utf16    -re edit" , "e ++enc=utf16"   ],
      \      [ "utf16-be -re edit" , "e ++enc=utf16be" ],
      \      [ "jis      -re edit" , "e ++enc=jis"     ],
      \      [ "sjis     -re edit" , "e ++enc=sjis"    ],
      \      [ "unicode  -re edit" , "e ++enc=unicode" ],
      \  ]
      \
      \ }


"}}}
" Format "{{{

let g:unite_source_menu_menus.Format = {
      \  "command_candidates" : [
      \      ["Windows CR LF" , "setlocal fileformat=dos"   ],
      \      ["Mac     CR"    , "setlocal fileformat=mac"   ],
      \      ["Unix    LF"    , "setlocal fileformat=unix"  ],
      \      ["Windows CR LF -re edit" , "e ++ff=dos"  ],
      \      ["Mac     CR    -re edit" , "e ++ff=mac"  ],
      \      ["Unix    LF    -re edit" , "e ++ff=unix" ],
      \  ]
      \
      \ }

"}}}
" Toggle Option "{{{
let g:unite_source_menu_menus.Toggle_Option ={
      \  "command_candidates" : [
      \      ["Toggle number     : <Space>n", "set number!"],
      \      ["Toggle hlsearch   : <Space>/", "set hlsearch!"],
      \      ["Toggle wrap       : <Space>w", "set wrap!"],
      \      ["Toggle IndentLine : <Space>i", "IndentLinesToggle"],
      \  ]
      \ }
"}}}
" Trim "{{{
let g:unite_source_menu_menus.Trim ={
      \  "command_candidates" : [
      \      ["Trim ", "%s///g"],
      \  ]
      \ }
"}}}
" Startup "{{{
" ==============================================
" Note: The font was block written using figlet.
" ==============================================

function! UniteStartup()
      if argc()==0 && bufnr('$')==1 

      \  Unite
      \  output:echo:":":!
      \  output:echo:"===:Edit:===":! menu:Edit
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:"===:Search:===":! menu:Search
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:"===:Neobundle:===":! menu:NeoBundle
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":::::::::::::::::::::.##.::::::::::::::::::":!
      \  output:echo:"::::::::::::::::::::.####.:::::::::::::::::":!
      \  output:echo:"::::::::::::::::::.########.:::::::::::::::":!
      \  output:echo:"::::::::::::::::.############.:::::::::::::":!
      \  output:echo:"::::::::::_____################________::::":!
      \  output:echo:":::::::::///////////######/////////////':::":!
      \  output:echo:"::::::::::.|/////|##########.////////':::::":!
      \  output:echo:"::::::::.##|/////|########.////////'#.:::::":!
      \  output:echo:"::::::.####|/////|######.////////'#####.:::":!
      \  output:echo:"::::.######|/////|####.////////'#########.:":!
      \  output:echo:":::########|/////|##.////////'#############":!
      \  output:echo:"::::`######|/////|_////////'#############':":!
      \  output:echo:"::::::`####|////////_/|//'#############':::":!
      \  output:echo:"::::::::`##|///////|_|/'#############':::::":!
      \  output:echo:"::::::::::`|////////_/|/_________/|':::::::":!
      \  output:echo:":::::::::::|/////'#|:|||:,_,:,_,:||:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:":!
      \  output:echo:":::::::::::|////'##|:|||:|||:|||:||::::_|:::::::_|::_|:::::_|_|_|::_|::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:":!
      \  output:echo:":::::::::::|///':`#|:|||:|||:|||:||:::::_|:::::_|::::::::::::_|::::_|_|::_|_|::_|_|_|::::_|::_|_|::::_|_|::::_|:::::_|::::_|_|::::::_|_|_|:":!
      \  output:echo:":::::::::::|/'::::`|_|/|_|/|_|/|_|/::::::_|:::_|::::_|:::::::_|::::_|::_|::_|::_|::::_|::_|_|::::::_|::::_|:::_|:::_|:::_|_____|::_|::::_|:":!
      \  output:echo:"::::::::::::::::::::`####'::::::::::::::::_|:_|:::::_|:::::::_|::::_|::::::_|::_|::::_|::_|::::::::_|::::_|::::_|:_|::::_|::::::::_|::::_|:":!
      \  output:echo:":::::::::::::::::::::`##'::::::::::::::::::_|:::::::_|:::::_|_|_|::_|::::::_|::_|_|_|::::_|::::::::::_|_|:::::::_|::::::::_|_|_|::::_|_|_|:":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|::":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  neomru/directory
      \  neomru/file
      \  -hide-source-names
      \  -no-split
      \  -no-wrap

       endif
endfunction


" ===========================================================
" Note: If you want to start with 'quick match', append this.
" ===========================================================
" \  -quick-match

"}}}

command! UniteStartup call UniteStartup()
augroup startupMenu
  autocmd!
  " autocmd VimEnter * nested if argc() == 0 && bufnr('$') == 1 | :UniteStartup | endif
  autocmd VimEnter * nested :UniteStartup
  " autocmd GUIEnter * nested bnext
augroup END


"}}}
"  NeoMru "{{{
let g:neomru#file_mru_limit = 2500
let g:neomru#directory_mru_limit = 500
let g:neomru#update_interval = 10       " 10 seconds 

"}}}
"  VimFiler "{{{

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

"}}}
"  QuickRun "{{{

" ================================================
" Note:
" Define key mapping to execute quickrun as 'mq'.
" Therefore, repeal defaults key mappings.
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
"  IndentLine "{{{

let g:indentLine_char = '|'


" ============================================================
" Note:
" This variable specify a list of file types.
" When opening these types of files, the plugin is enabled by
" default.
" ============================================================
let g:indentLine_fileType = [
      \ 'c',
      \ 'jsp',
      \ 'html',
      \]


"}}}
"  caw "{{{

let g:caw_no_default_keymappings = 1

"}}}

" Mapping of Plugin.
" Unite "{{{

" colorsheme
nnoremap <silent>mc    :<C-u>Unite colorscheme -auto-preview<CR>

" file_rec
nnoremap <silent>mrf   :<C-u>UniteWithBufferDir file_rec<CR>

" grep
nnoremap <silent>mg    :<C-u>lcd %:h<CR> :Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent>mgg   :<C-u>UniteResume search-buffer<CR>

" line
nnoremap <silent>ml    :<C-u>Unite line -no-wrap<CR>

" menu
nnoremap <silent>me    :<C-u>Unite menu<CR> 

" register
nnoremap <silent>mre   :<C-u>Unite register<CR>

"}}}
" NeoMRU "{{{

nnoremap <silent>mru   :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd   :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>

"}}}
" VimFiler "{{{

nnoremap <silent>mf    :<C-u>VimFilerBufferDir -create<CR>

"}}}
" VimShell "{{{

nnoremap <silent>ms    :<C-u>VimShellBufferDir<CR>
nnoremap <silent>mst   :<C-u>VimShellTab<CR>
nnoremap <silent>msi   :<C-u>VimShellInteractive<CR>
nnoremap <silent>mss   :<C-u>%VimShellSendString<CR>

"}}}
" Quick Run "{{{

nnoremap <silent>mq    :<C-u>QuickRun<CR>

"}}}
" ContinuousNumber "{{{

vnoremap <silent>gco    :ContinuousNumber <C-a><CR>

"}}}
" IndentLine "{{{

nnoremap <Space>i      :<C-u>IndentLinesToggle<CR>

"}}}
" caw"{{{
nmap gci <Plug>(caw:hatpos:toggle)
nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)

vmap gci <Plug>(caw:hatpos:toggle)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

"}}}
" open-browser"{{{
nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)

nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

"}}}


" vim: foldmethod=marker
