set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark-term"

" :help group-name

" Comment
highlight Comment        ctermfg=120   cterm=NONE

" Constant
highlight Constant       ctermfg=123   cterm=NONE
highlight String         ctermfg=217   cterm=NONE
highlight Character      ctermfg=13    cterm=NONE
highlight Number         ctermfg=229   cterm=NONE
highlight Boolean        ctermfg=123   cterm=bold
highlight float          ctermfg=229   cterm=NONE

" Identifier
highlight Identifier     ctermfg=123   cterm=NONE
highlight Constant       ctermfg=123   cterm=NONE
highlight Function       ctermfg=222   cterm=NONE

" Statement
highlight Statement      ctermfg=172   cterm=NONE
highlight Exception      ctermfg=161   cterm=NONE

" Preproc
highlight PreProc        ctermfg=222   cterm=NONE

" Type
highlight Type           ctermfg=123
highlight Structure      ctermfg=172

" Special
highlight Special        ctermfg=123
highlight Delimiter      ctermfg=14    cterm=bold
highlight SpecialComment ctermfg=120

" Underlined
highlight Underlined     ctermfg=33

" Ignore
highlight Ignore         ctermfg=161

" Error
highlight Error          ctermfg=161   ctermbg=235 cterm=NONE

" Todo
highlight Todo           ctermfg=161   ctermbg=235 cterm=NONE

" :help highlight-groups

highlight Normal         ctermfg=231   ctermbg=235
highlight NonText        ctermfg=244   ctermbg=235

" diff
highlight DiffAdd        ctermfg=black ctermbg=2
highlight DiffChange     ctermfg=black ctermbg=3
highlight DiffDelete     ctermfg=black ctermbg=6
highlight DiffText       ctermfg=black ctermbg=7

" number
highlight LineNr         ctermfg=244

highlight Folded         ctermfg=244   ctermbg=237
highlight Search         ctermfg=229   ctermbg=244
highlight Visual                       ctermbg=242
highlight VertSplit      ctermfg=239               cterm=bold

" pop up menu
highlight Pmenu          ctermfg=231   ctermbg=244
highlight PmenuSel       ctermfg=45    ctermbg=232 cterm=bold
highlight PmenuSbar                    ctermbg=232
highlight PmenuThumb     ctermfg=232
highlight WildMenu       ctermfg=45    ctermbg=232 cterm=bold

" statusline
highlight StatusLine     ctermfg=231   ctermbg=235 cterm=bold
highlight StatusLineNC   ctermfg=239               cterm=bold

