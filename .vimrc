vim9script

if !has('gui_running')
  if has('win32') || has('win64')
    colorscheme default
  else
    set t_Co=256
    colorscheme shin-dark-term
  endif
endif

plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'mukaiizawa/vim9-filer'
Plug 'mukaiizawa/vim9-unite'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
plug#end()
filetype plugin indent on
syntax enable

set autoindent
set backspace=start,eol,indent
set colorcolumn=100
set cmdheight=2
set complete=.,b,u,s~/dotfiles/word/en,s~/dotfiles/word/it
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=marker
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,utf-16le
set fileformat=unix
set fileformats=unix,dos,mac
set formatoptions+=roqjM
set formatoptions-=tc
set history=2000
set helplang=en
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set listchars=tab:->,eol:<,trail:>
set list
set laststatus=2
set nrformats-=octal
set nobackup
set noswapfile
set noundofile
set nowrap
set number
set printoptions=wrap:y,number:y
set showcmd
set smartcase
set smartindent
set showmatch
set splitright
set showtabline=2
set statusline=%!status_line#Build()
set shiftwidth=2
set tabline=%t
set title
set tabpagemax=100
set tabstop=2
set viminfo=
set wildmenu
set wrapscan

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

nnoremap # #zz
nnoremap ( {
nnoremap ) }
nnoremap * *zz
nnoremap <F1> :windo diffthis<CR>
nnoremap <F2> :windo diffoff!<CR>
nnoremap <F3> :<C-u>e $MYVIMRC<CR>
nnoremap <F4> :<C-u>e $MYGVIMRC<CR>
nnoremap <F5> :<C-u>source $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYGVIMRC<CR>
nnoremap <S-Insert> "+p
nnoremap <Space><Space> zz
nnoremap <Space>j Lzz
nnoremap <Space>k Hzz
nnoremap <silent><Space>f :<C-u>FilerBufferDir<CR>
nnoremap <expr> <silent><Space>h &wrap ? 'g0' : '0'
nnoremap <expr> <silent><Space>l &wrap ? 'g$' : '$'
nnoremap <silent><Space>s :lcd %:h<CR>:vs<CR>:terminal ++curwin<CR>
nnoremap <silent><Space>w :set wrap!<CR>
nnoremap <silent>md :<C-u>Unite dir<CR>
nnoremap <silent>mf :<C-u>Unite file<CR>
nnoremap <silent>mh :<C-u>Unite help<CR>
nnoremap <silent>ml :<C-u>Unite line<CR>
nnoremap <silent>mm :<C-u>Unite menu<CR>
nnoremap <silent>mq :<C-u>Unite quickfix<CR>
nnoremap <silent>mr :<C-u>Unite repo<CR>
nnoremap <silent>mx :<C-u>lcd %:h<CR> :QuickRun<CR>
nnoremap <silent>my :<C-u>Unite yank<CR>
nnoremap <silent>sq :<C-u>q<CR>
nnoremap N Nzz
nnoremap U  <C-r>
nnoremap Y y$
nnoremap gcd  :<C-u>lcd %:h<CR>:pwd<CR>
nnoremap gf :vs<CR>gF
nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap sb :e #<CR>
nnoremap sd" f"x,x
nnoremap sd' f'x,x
nnoremap sd( f)xF(x
nnoremap sd) f)xF(x
nnoremap sd* f*x,x
nnoremap sd< f>xF<x
nnoremap sd> f>xF<x
nnoremap sd[ f]xF[x
nnoremap sd] f]xF[x
nnoremap sd` f`x,x
nnoremap sd{ f}xF{x
nnoremap sd} f}xF{x
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sp :<C-u>DebugPrint<CR>
nnoremap sr <C-w>r
nnoremap ss <C-w>s
nnoremap st :<C-u>tabnew<CR>
nnoremap sv <C-w>v
nnoremap zc zM

vnoremap ( {
vnoremap ) }
vnoremap / y/<C-r>"<CR>zz
vnoremap <C-Insert> "+y
vnoremap <S-Insert> "+p
vnoremap <Space>h 0
vnoremap <Space>j Lzz
vnoremap <Space>k Hzz
vnoremap <Space>l $
vnoremap gzc :<C-u>call folds#InsertMarkersForSelection()<CR>
vnoremap j gj
vnoremap k gk
vnoremap sp :DebugPrint<CR>

inoremap <C-d> <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <C-e> <C-r>=execute('message')<CR><ESC>:message clear<CR>
inoremap <C-l> <C-n>
inoremap <Tab> <C-v><Tab>
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

tnoremap <Esc> <C-w>N

var local_vimrc = expand('~/.vimrc.local')
if filereadable(local_vimrc)
  execute 'source ' .. fnameescape(local_vimrc)
endif
