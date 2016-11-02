" Display
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions+=c
set cursorline
set visualbell t_vb=

colorscheme shin-dark
syntax on

" Mouse
set mouse=a
set nomousefocus
set mousehide

if has("win32")
  au GUIEnter * simalt ~x
  set guifont=MS_Gothic:h12:cSHIFTJIS 
  set linespace=1
  set columns=80
  set lines=25
  set cmdheight=2
  set ambiwidth=double
elseif has("mac")
  set guifont=Monaco:h14
elseif has("unix")
  set guifont=DejaVu\ Sans\ Mono\ 10.5
endif

