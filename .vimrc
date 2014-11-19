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
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    }
      \ }
NeoBundle 'h1mesuke/unite-outline'
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


" A fundamental setting bigins from here.
"
" ====================================
" Note: It is applicable to .minvimrc.
" ====================================

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

"}}}
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

"}}}
" Setting for File "{{{
set nobackup
set noswapfile
set noundofile
set viminfo=
set fileencoding=utf-8
set foldmethod=marker

"}}}
" Setting for Search,Substitute "{{{
set hlsearch
set wrapscan
set smartcase
set ignorecase

"}}}
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
nnoremap <Up>     4<C-w>-
nnoremap <Down>  30<C-w>+
nnoremap <Right>  4<C-w>>
nnoremap <Left>   4<C-w><

"}}}
" Mapping for Surround "{{{
nnoremap s' wbi'<Esc>ea'<Esc>
nnoremap s" wbi"<Esc>ea"<Esc>
nnoremap s< wbi<<Esc>ea><Esc>
nnoremap s> wbi<<Esc>ea><Esc>
nnoremap s( wbi(<Esc>ea)<Esc>
nnoremap s) wbi(<Esc>ea)<Esc>
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
" Mapping for etc "{{{
nmap n nzz
nmap N Nzz

vmap R r

inoremap jj <Esc>
nnoremap <S-u> <C-r>

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

nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>
nnoremap <F5> :<C-u>source $MYVIMRC<CR>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>


" ================================================
" Note: If executable ctags.exe, create tags file.
" ================================================
if executable('ctags')
  nnoremap tt :<C-u>lcd %:h<CR> :!ctags -R<CR>
else
  nnoremap tt :<C-u>echo "ctags: command not found"<CR>
endif

"}}}


" An expansive setting bigins from here
"
" ======================================
" Note: It is noapplicable to .minvimrc.
" ======================================

" Setting of Plugin.
" Setting for Unite "{{{

let g:unite_source_rec_min_cache_files = 50
let g:unite_source_rec_max_cache_files = 2000
let g:unite_source_rec_async_command = 'files -A'


call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'candidate_icon': '*',
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
" Setting for Unite.menu "{{{

if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

" Edit
let g:unite_source_menu_menus.Edit = {
      \  "command_candidates" : [
      \      [ "vimrc"  , "edit $MYVIMRC"  ],
      \      [ "gvimrc" , "edit $MYGVIMRC" ],
      \  ]
      \}

" Search
let g:unite_source_menu_menus.Search = {
      \  "command_candidates" : [
      \      [ "file/mru" , "Unite file_mru" ],
      \      [ "directory/mru" , "Unite directory_mru" ],
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
      \  output:echo:":::::::::::::::::::::.##.::::::::::::::::::::":!
      \  output:echo:"::::::::::::::::::::.####.:::::::::::::::::::":!
      \  output:echo:"::::::::::::::::::.########.:::::::::::::::::":!
      \  output:echo:"::::::::::::::::.############.:::::::::::::::":!
      \  output:echo:"::::::::::_____################________::::::":!
      \  output:echo:":::::::::///////////######/////////////':::::":!
      \  output:echo:"::::::::::.|/////|##########.////////':::::::":!
      \  output:echo:"::::::::.##|/////|########.////////'#.:::::::":!
      \  output:echo:"::::::.####|/////|######.////////'#####.:::::":!
      \  output:echo:"::::.######|/////|####.////////'#########.:::":!
      \  output:echo:":::########|/////|##.////////'#############::":!
      \  output:echo:"::::`######|/////|_////////'#############':::":!
      \  output:echo:"::::::`####|////////_/|//'#############':::::":!
      \  output:echo:"::::::::`##|///////|_|/'.############':::::::":!
      \  output:echo:"::::::::::`|////////_/|/_________/|':::::::::":!
      \  output:echo:":::::::::::|///////|:|||:'_.'._.'||::::::::::":!
      \  output:echo:":::::::::::|/////'#|:|||:|||:|||:||::::::::::":!
      \  output:echo:":::::::::::|///'`##|:|||:|||:|||:||::::::::::":!
      \  output:echo:":::::::::::|/'::::`|_|/|_|/|_|/|_|/::::::::::":!
      \  output:echo:"::::::::::::::::::::`####':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::|::":!
      \  output:echo:":::::::::::::::::::::`##':::::::::::::::::::_|:::::::::_|::_|::::::_|_|_|::_|::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::_|:::::::_|:::::::::::::_|::::_|_|::_|_|::_|_|_|::::_|::_|_|::::_|_|::::_|::::::::_|:::_|_|::::::_|_|_|::":!
      \  output:echo:"::::::::::::::::::::::::::::::::::::::::::::::_|:::::_|::::_|::::::::_|::::_|::_|::_|::_|::::_|::_|_|::::::_|::::_|:::_|::::::_|::_|_____|::_|::::_|::":!
      \  output:echo:"::::::::::::::::::::::::::::::::::::::::::::::::_|::_|:::::_|::::::::_|::::_|::::::_|::_|::::_|::_|::::::::_|::::_|:::::_|::_|::::_|::::::::_|::::_|::":!
      \  output:echo:"::::::::::::::::::::::::::::::::::::::::::::::::::_|:::::::_|::::::_|_|_|::_|::::::_|::_|_|_|::::_|::::::::::_|_|:::::::::_|::::::::_|_|_|::::_|_|_|::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
      \  output:echo:":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::_|:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::":!
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
" Setting for NeoMru "{{{
let g:neomru#file_mru_limit = 500
let g:neomru#directory_mru_limit = 1000
let g:neomru#update_interval = 1    " 1 seconds 

"}}}
" Setting for VimFiler "{{{

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
" Setting for QuickRun "{{{

" ================================================
" Note:
" Define key mapping to execute quickrun as 'mq'.
" Therefore, repeal defaults key mappings.
" Refer to " Mappnig for Plugin " of " Plefix m ".
" ================================================
let g:quickrun_no_default_key_mappings = 1

let g:quickrun_config = {
      \  '_' : {
      \    'split' : 'vertical',
      \  },
      \
      \  'c' : {
      \    'hook/time/enable' : 1,
      \  },
      \
      \  'lisp' : {
      \    'runner' : 'vimproc',
      \    'runner/vimproc/updatetime' : 10,
      \    'hook/time/enable' : 1,
      \  },
      \
      \  'java' : {
      \    'runner' : 'vimproc',
      \    'runner/vimproc/updatetime' : 10,
      \    'hook/time/enable' : 1,
      \  },
      \
      \  'html' : {
      \    'command' : 'cat',
      \    'exec' : '%c %s',
      \    'outputter' : 'browser',
      \    'hook/output_encode' : 'cp932',
      \  }
      \
      \}

" }}}
" Setting for IndentLine "{{{

let g:indentLine_char = '|'

" ============================================================
" Note:
" This variable specify a list of file types.
" When opening these types of files, the plugin is disabled by
" default.
" ============================================================
let g:indentLine_fileTypeExclude = [
      \  'lisp', 
      \  'unite', 
      \  'java',
      \  'cpp',
      \  'vim',
      \  'txt',
      \]

"}}}
" Setting for caw "{{{

let g:caw_no_default_keymappings = 1

"}}}


" Mappnig for Plugin
" Prefix g "{{{

" for caw.vim
nmap gci <Plug>(caw:i:toggle)
nmap gca <Plug>(caw:a:toggle)
nmap gcc <Plug>(caw:wrap:toggle)

vmap gci <Plug>(caw:i:toggle)
vmap gca <Plug>(caw:a:toggle)
vmap gcc <Plug>(caw:wrap:toggle)

" for open-browser.vim
nmap gw  <Plug>(openbrowser-open)
vmap gw  <Plug>(openbrowser-open)
nmap gww <Plug>(openbrowser-search)
vmap gww <Plug>(openbrowser-search)

"}}}
" Prefix m "{{{

" for Unite
nnoremap <silent>mb    :<C-u>Unite bookmark<CR> 
nnoremap <silent>mba   :<C-u>UniteBookmarkAdd<CR> 
nnoremap <silent>mc    :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent>mg    :<C-u>lcd %:h<CR> :Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent>mgg   :<C-u>UniteResume search-buffer<CR>
nnoremap <silent>mt    :<C-u>Unite tag -auto-preview<CR>
nnoremap <silent>mo    :<C-u>Unite -vertical -no-quit outline<CR>
nnoremap <silent>mre   :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent><C-f> :<C-u>UniteWithBufferDir file_rec<CR>

" for NeoMRU
nnoremap <silent>mru   :<C-u>Unite file_mru<CR>
nnoremap <silent>mrd   :<C-u>NeoMRUReload<CR>:Unite directory_mru<CR>

" for VimShell
nnoremap <silent>ms    :<C-u>VimShellBufferDir -split<CR>
nnoremap <silent>mst   :<C-u>VimShellTab<CR>
nnoremap <silent>msi   :<C-u>VimShellInteractive<CR>
nnoremap <silent>mss   :<C-u>%VimShellSendString<CR>

" for VimFiler
nnoremap <silent>mf    :<C-u>VimFilerBufferDir<CR>
nnoremap <silent>mfv   :<C-u>VimFilerBufferDir -split<CR>
nnoremap <silent>mfd   :<C-u>VimFilerBufferDir -double<CR>

" for Quick Run
nnoremap <silent>mq    :<C-u>QuickRun<CR>

" for ContinuousNumber
vnoremap <silent>co :ContinuousNumber <C-a><CR>

"}}}


