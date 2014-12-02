scriptencoding utf-8
syntax enable

" Initialization "{{{
if !1 | finish | endif
if has('vim_starting')
  set nocompatible
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
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    }
      \ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Yggdroot/indentLine'

" Colorscheme "{{{
" famous colorsheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
"}}}

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

"}}}
" Setting for Window "{{{
set ruler
set title
set number
set nowrap                     " When off lines will not wrap and only part of long lines will be displayed.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one. 
set cmdheight=2                " Number of screen lines to use for the command-line.
set laststatus=2               " Always, window show status.
set showtabline=2              " Always, tab page labels show status.
set tabpagemax=300
set backspace=start,eol,indent

"}}}
" Setting for File "{{{
set nobackup
set noswapfile
set noundofile
set viminfo=                   " Not use viminfo file.
set fileencoding=utf-8
set foldmethod=marker

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
set list
set listchars=tab:->,eol:<,trail:>

"}}}

" Mapping "
" Mapping to NOP "{{{
nnoremap Q <NOP>
nnoremap } <NOP>
nnoremap { <NOP>
nnoremap zd <NOP>
nnoremap zD <NOP>
nnoremap zE <NOP>
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

vnoremap s <NOP>

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
nnoremap sn gt
nnoremap sp gT
nnoremap sq :<C-u>q<CR>

" change current window height(width).
nnoremap <Up>     4<C-w>-
nnoremap <Down>  30<C-w>+
nnoremap <Right>  4<C-w>>
nnoremap <Left>   4<C-w><

"}}}
" Mapping for Surround "{{{

" =========================================
" Note: You can surround with these symble.
" Quotation: '', "", **
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
nnoremap sd[ f]xF[x

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
" Mapping for etc "{{{

" End insert mode with jj.
inoremap jj <Esc>

" IM turn off automatically when leaving Insert mode.
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

" Redo changes which were undone with U key.
nnoremap U  <C-r>

" toggle
nnoremap <Space>/ :set hlsearch!<CR>
nnoremap <Space>n :set number!<CR>
nnoremap <Space>w :set wrap!<CR>

" Redraw at center of window.
nmap n nzz
nmap N Nzz
nmap g, g,zz

" cursor
nnoremap <Space>h 0
nnoremap <Space>l $
nnoremap <Space>j <C-f>zz
nnoremap <Space>k <C-b>zz
nnoremap <Space><Space> zz
vnoremap <Space>h 0
vnoremap <Space>l $
vnoremap <Space>j <C-f>zz
vnoremap <Space>k <C-b>zz

" Change directory to carrent buffer directory.
nnoremap gcd  :<C-u>lcd %:h<CR> :pwd<CR>

" Toggle a buffer which edit the one befor.
nnoremap <silent>mm :e #<CR>


" Execute current buffer with clisp.
if executable('clisp')
    nnoremap <silent>gcl  :<C-u>lcd %:h<CR> :!clisp -i %<CR>
else
  nnoremap <silent>gcl  :<C-u>echo "clisp: command not found"<CR>
endif

" Edit vimrc, gvimrc.
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>

" Read vimrc.
nnoremap <F5> :<C-u>source $MYVIMRC<CR>


" ================================================
" Note: If executable ctags.exe, create tags file.
" ================================================
if executable('ctags')
  nnoremap tt :<C-u>lcd %:h<CR> :!ctags -R<CR>
else
  nnoremap tt :<C-u>echo "ctags: command not found"<CR>
endif

"}}}


" ======================================
" Note:
" It is noapplicable to .minvimrc.
" An expansive setting bigins from here
" ======================================

" Setting of Plugin.
"  Unite "{{{

let g:unite_source_rec_min_cache_files = 50
let g:unite_source_rec_max_cache_files = 2000
let g:unite_source_rec_async_command = 'files -A'


call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'no_empty': 1,
      \   'candidate_icon': '*',
      \   'marked_icon': '@',
      \   'direction': 'topleft',
      \   'cursor_line_time': 0.0,
      \   'cursor_line_highlight': 'Visual',
      \   'prompt': '> ',
      \ })


" =============================================================
" Note: if executable ag.exe, execute grep command with ag.exe
" =============================================================
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom_default_action('directory', 'vimfiler')



"}}}
"  Unite.menu "{{{

if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif


" Edit
let g:unite_source_menu_menus.Edit = {
      \  "command_candidates" : [
      \      [ "vimrc         :<F3>"  , "edit $MYVIMRC " ],
      \      [ "gvimrc        :<F4>"  , "edit $MYGVIMRC" ],
      \  ]
      \}

" Search
let g:unite_source_menu_menus.Search = {
      \  "command_candidates" : [
      \      [ "file/mru      :mru" , "Unite file_mru" ],
      \      [ "directory/mru :mrd" , "Unite directory_mru" ],
      \  ]
      \}

" NeoBundle
let g:unite_source_menu_menus.NeoBundle = {
      \  "command_candidates" : [
      \      [ "NeoBundleLog" , "NeoBundleLog" ],
      \      [ "NeoBundleList" , "NeoBundleList" ],
      \      [ "NeoBundleClean" , "NeoBundleClean" ],
      \      [ "NeoBundleCheck" , "NeoBundleCheck" ],
      \      [ "NeoBundleInstall" , "NeoBundleInstall" ],
      \      [ "NeoBundleCheckUpdate" , "NeoBundleUpdate" ],
      \  ]
      \}

" file encoding
let g:unite_source_menu_menus.File_Encoding = {
      \  "command_candidates" : [
      \      ["utf8", "set fenc=Utf8"],
      \      ["cp932", "set fenc=cp932"],
      \      ["euc", "set fenc=euc"],
      \      ["utf16", "set fenc=utf16"],
      \      ["utf16-be", "set fenc=utf16be"],
      \      ["jis", "set fenc=jis"],
      \      ["sjis", "set fenc=sjis"],
      \      ["unicode", "set fenc=unicode"],
      \  ]
      \ }

" toggle option
let g:unite_source_menu_menus.Toggle_Option ={
      \  "command_candidates" : [
      \      ["Toggle number     :<Space>n", "set number!"],
      \      ["Toggle hlsearch   :<Space>/", "set hlsearch!"],
      \      ["Toggle wrap       :<Space>w", "set wrap!"],
      \      ["Toggle IndentLine :<Space>i", "IndentLinesToggle"],
      \  ]
      \ }

" ==============================================
" Note: The font was block written using figlet.
" ==============================================
command! UniteStartup
      \  Unite
      \  output:echo:":":!
      \  output:echo:"===:Edit:===":! menu:Edit
      \  output:echo:":":!
      \  output:echo:"===:Search:===":! menu:Search
      \  output:echo:":":!
      \  output:echo:"===:Neobundle:===":! menu:NeoBundle
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":":!
      \  output:echo:":::::::::::::::::::::.##.:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::::::::::::.####.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::::::::::.########.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::::::::.############.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::_____################________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:":::::::::///////////######/////////////'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::.|/////|##########.////////'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::.##|/////|########.////////'#.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::.####|/////|######.////////'#####.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::.######|/////|####.////////'#########.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:":::########|/////|##.////////'#############:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::`######|/////|_////////'#############'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::`####|////////_/|//'#############'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::`##|///////|_|/'.############'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:"::::::::::`|////////_/|/_________/|'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:":::::::::::|///////|:|||:'_.'._.'||:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|::":!
      \  output:echo:":::::::::::|/////'#|:|||:|||:|||:||:::::::::_|:::::::::_|::_|::::::_|_|_|::_|::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|::":!
      \  output:echo:":::::::::::|///'`##|:|||:|||:|||:||::::::::::_|:::::::_|:::::::::::::_|::::_|_|::_|_|::_|_|_|::::_|::_|_|::::_|_|::::_|::::::::_|:::_|_|::::::_|_|_|::":!
      \  output:echo:":::::::::::|/'::::`|_|/|_|/|_|/|_|/:::::::::::_|:::::_|::::_|::::::::_|::::_|::_|::_|::_|::::_|::_|_|::::::_|::::_|:::_|::::::_|::_|_____|::_|::::_|::":!
      \  output:echo:"::::::::::::::::::::`####'::::::::::::::::::::::_|::_|:::::_|::::::::_|::::_|::::::_|::_|::::_|::_|::::::::_|::::_|:::::_|::_|::::_|::::::::_|::::_|::":!
      \  output:echo:":::::::::::::::::::::`##':::::::::::::::::::::::::_|:::::::_|::::::_|_|_|::_|::::::_|::_|_|_|::::_|::::::::::_|_|:::::::::_|::::::::_|_|_|::::_|_|_|::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
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

" ===========================================================
" Note: If you want to start with 'quick match', append this.
" ===========================================================
" \  -quick-match

augroup startupMenu
  autocmd!
  autocmd VimEnter * nested :UniteStartup
augroup END


"}}}
"  Unite-Outline "{{{

call unite#custom#profile('source/outline', 'context', {
      \   'winwidth' : 30,
      \   'direction' : 'botright',
      \ })

let g:unite_source_outline_filetype_options = {
      \ '*': {
      \   'auto_update': 1,
      \   'auto_update_event': 'write',
      \ },
      \
      \ 'cpp': {
      \   'auto_update': 0,
      \ },
      \
      \}

"}}}
"  NeoMru "{{{
let g:neomru#file_mru_limit = 500
let g:neomru#directory_mru_limit = 1000
let g:neomru#update_interval = 10    " 10 seconds 

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

set splitright

let g:quickrun_config = {
      \  '_' : {
      \    'split': 'vertical',
      \  },
      \
      \  'c' : {
      \    'hook/time/enable': 1,
      \  },
      \
      \  'lisp' : {
      \    'runner' : 'vimproc',
      \    'runner/vimproc/updatetime': 10,
      \    'hook/time/enable': 1,
      \  },
      \
      \  'java' : {
      \    'runner' : 'vimproc',
      \    'runner/vimproc/updatetime': 10,
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

" menu
nnoremap <silent>me    :<C-u>Unite menu<CR> 

" bookmark
nnoremap <silent>mb    :<C-u>Unite bookmark<CR> 
nnoremap <silent>mba   :<C-u>UniteBookmarkAdd<CR> 

" colorsheme
nnoremap <silent>mc    :<C-u>Unite colorscheme -auto-preview<CR>

" grep
nnoremap <silent>mg    :<C-u>lcd %:h<CR> :Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent>mgg   :<C-u>UniteResume search-buffer<CR>

" tag
nnoremap <silent>mt    :<C-u>Unite tag -auto-preview<CR>

" outline
nnoremap <silent>mo    :<C-u>Unite -vertical outline<CR>

" register
nnoremap <silent>mre   :<C-u>Unite register<CR>

" file_rec
nnoremap <silent><C-f> :<C-u>UniteWithBufferDir file_rec<CR>

"}}}
" NeoMRU "{{{

nnoremap <silent>mru   :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd   :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>

"}}}
" VimFiler "{{{

nnoremap <silent>mf    :<C-u>VimFilerBufferDir<CR>
nnoremap <silent>mfv   :<C-u>VimFilerBufferDir -split<CR>
nnoremap <silent>mfd   :<C-u>VimFilerBufferDir -double<CR>

"}}}
" VimShell "{{{

nnoremap <silent>ms    :<C-u>VimShellBufferDir -split<CR>
nnoremap <silent>mst   :<C-u>VimShellTab<CR>
nnoremap <silent>msi   :<C-u>VimShellInteractive<CR>
nnoremap <silent>mss   :<C-u>%VimShellSendString<CR>

"}}}
" Quick Run "{{{

nnoremap <silent>mq    :<C-u>QuickRun<CR>

"}}}
" ContinuousNumber "{{{

vnoremap <silent>co :ContinuousNumber <C-a><CR>

"}}}
" IndentLine "{{{

nnoremap <Space>i :IndentLinesToggle<CR>

"}}}
" caw"{{{
nmap gci <Plug>(caw:i:toggle)
nmap gca <Plug>(caw:a:toggle)
nmap gcc <Plug>(caw:wrap:toggle)

vmap gci <Plug>(caw:i:toggle)
vmap gca <Plug>(caw:a:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

"}}}
" open-browser"{{{
nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)

nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

"}}}


