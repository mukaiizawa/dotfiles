" Display
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions+=c
set visualbell t_vb=
au GUIEnter * simalt ~x
colorscheme shin-dark

" Mouse
set mouse=a
set nomousefocus
set mousehide

if has("win32")
    set guifont=MS_Gothic:h12:cSHIFTJIS 
    set linespace=1
    set columns=80
    set lines=25
    set cmdheight=2
elseif has("mac")
    set guifont=Monaco:h14
endif


