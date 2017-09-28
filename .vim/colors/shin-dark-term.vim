set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark-term"

highlight Comment        ctermfg=120   cterm=NONE
highlight Constant       ctermfg=123   cterm=NONE
highlight String         ctermfg=217   cterm=NONE
highlight Character      ctermfg=13    cterm=NONE
highlight Number         ctermfg=229   cterm=NONE
highlight Boolean        ctermfg=123   cterm=BOLD
highlight float          ctermfg=229   cterm=NONE
highlight Identifier     ctermfg=123   cterm=NONE
highlight Constant       ctermfg=123   cterm=NONE
highlight Function       ctermfg=222   cterm=NONE
highlight Statement      ctermfg=208   cterm=NONE
highlight Exception      ctermfg=197   cterm=NONE
highlight PreProc        ctermfg=222   cterm=NONE
highlight Type           ctermfg=123
highlight Structure      ctermfg=208   cterm=BOLD
highlight Special        ctermfg=123
highlight Delimiter      ctermfg=14    cterm=BOLD
highlight SpecialComment ctermfg=120
highlight Underlined     ctermfg=33
highlight Ignore         ctermfg=197
highlight Error          ctermfg=197   ctermbg=235 cterm=NONE
highlight Todo           ctermfg=197   ctermbg=235 cterm=NONE

highlight ColorColumn                  ctermbg=237
highlight Conceal        ctermfg=244
highlight Cursor         ctermfg=BLACK ctermbg=WHITE
highlight CursorIM                     ctermbg=RED
highlight CursorLine                   ctermbg=237 cterm=NONE
highlight CursorLineNr   ctermfg=222
highlight DiffAdd        ctermfg=BLACK ctermbg=2
highlight DiffChange     ctermfg=BLACK ctermbg=3
highlight DiffDelete     ctermfg=BLACK ctermbg=6
highlight DiffText       ctermfg=BLACK ctermbg=7
highlight Folded         ctermfg=244   ctermbg=237
highlight LineNr         ctermfg=244
highlight MatchParen     ctermfg=BLACK ctermbg=208
highlight NonText        ctermfg=244   ctermbg=235
highlight Normal         ctermfg=231   ctermbg=235
highlight Pmenu          ctermfg=231   ctermbg=244
highlight PmenuSbar                    ctermbg=232
highlight PmenuSel       ctermfg=45    ctermbg=232 cterm=BOLD
highlight PmenuThumb     ctermfg=232
highlight Search         ctermfg=229   ctermbg=244
highlight SpecialKey     ctermfg=244
highlight StatusLine     ctermfg=231   ctermbg=235 cterm=BOLD
highlight StatusLineNC   ctermfg=239               cterm=BOLD
highlight Title          ctermfg=197
highlight VertSplit      ctermfg=239               cterm=BOLD
highlight Visual         ctermfg=255   ctermbg=20  cterm=BOLD
highlight WildMenu       ctermfg=45    ctermbg=232 cterm=BOLD
