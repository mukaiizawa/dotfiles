set background=dark
hi clear
if exists("syntax_on")
  syntax reset
en
let g:colors_name = "shin-dark-term"

hi Comment        ctermfg=120   cterm=NONE
hi Constant       ctermfg=123   cterm=NONE
hi String         ctermfg=217   cterm=NONE
hi Character      ctermfg=13    cterm=NONE
hi Number         ctermfg=229   cterm=NONE
hi Boolean        ctermfg=123   cterm=BOLD
hi float          ctermfg=229   cterm=NONE
hi Identifier     ctermfg=123   cterm=NONE
hi Constant       ctermfg=123   cterm=NONE
hi Function       ctermfg=222   cterm=NONE
hi Statement      ctermfg=208   cterm=NONE
hi Exception      ctermfg=197   cterm=NONE
hi PreProc        ctermfg=222   cterm=NONE
hi Type           ctermfg=123
hi Structure      ctermfg=208   cterm=BOLD
hi Special        ctermfg=123
hi Delimiter      ctermfg=14    cterm=BOLD
hi SpecialComment ctermfg=120
hi Underlined     ctermfg=33
hi Ignore         ctermfg=197
hi Error          ctermfg=197   ctermbg=235 cterm=NONE
hi Todo           ctermfg=197   ctermbg=235 cterm=NONE

hi ColorColumn                  ctermbg=237
hi Conceal        ctermfg=244
hi Cursor         ctermfg=BLACK ctermbg=WHITE
hi CursorIM                     ctermbg=RED
hi CursorLine                   ctermbg=237 cterm=NONE
hi CursorLineNr   ctermfg=222
hi DiffAdd        ctermfg=BLACK ctermbg=2
hi DiffChange     ctermfg=BLACK ctermbg=3
hi DiffDelete     ctermfg=BLACK ctermbg=6
hi DiffText       ctermfg=BLACK ctermbg=7
hi Folded         ctermfg=244   ctermbg=237
hi LineNr         ctermfg=244
hi MatchParen     ctermfg=BLACK ctermbg=208
hi NonText        ctermfg=244   ctermbg=235
hi Normal         ctermfg=231   ctermbg=235
hi Pmenu          ctermfg=231   ctermbg=244
hi PmenuSbar                    ctermbg=232
hi PmenuSel       ctermfg=45    ctermbg=232 cterm=BOLD
hi PmenuThumb     ctermfg=232
hi Search         ctermfg=229   ctermbg=244
hi SpecialKey     ctermfg=244
hi StatusLine     ctermfg=231   ctermbg=235 cterm=BOLD
hi StatusLineNC   ctermfg=239               cterm=BOLD
hi Title          ctermfg=197
hi VertSplit      ctermfg=239               cterm=BOLD
hi Visual         ctermfg=255   ctermbg=20  cterm=BOLD
hi WildMenu       ctermfg=45    ctermbg=232 cterm=BOLD
