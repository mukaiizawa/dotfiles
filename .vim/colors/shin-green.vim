set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-green"

hi Comment      guifg=#A6F02E
hi Constant     guifg=#A6F02E
hi Identifier   guifg=#A6F02E
hi Statement    guifg=#A6F02E
hi PreProc      guifg=#A6F02E
hi Type         guifg=#A6F02E
hi Structure    guifg=#A6F02E
hi Special      guifg=#A6F02E
hi Underlined   guifg=#A6F02E
hi Ignore       guifg=#A6F02E
hi Error        guifg=#A6F02E guibg=#1E1E1E
hi Todo         guifg=#A6F02E guibg=#1E1E1E

hi ColorColumn                guibg=#404040
hi CursorLine                 guibg=#404040
hi Folded       guifg=#A6F02E guibg=#404040
hi NonText      guifg=#666666 guibg=#1E1E1E
hi Normal       guifg=#A6F02E guibg=#1E1E1E
hi Pmenu        guifg=#A6F02E guibg=#404040
hi PmenuSbar                  guibg=#404040
hi PmenuSel     guifg=#A6F02E guibg=#404040 gui=BOLD
hi PmenuThumb   guifg=#A6F02E
hi Search       guifg=#A6F02E guibg=#666666
hi StatusLine   guifg=#A6F02E guibg=#1E1E1E gui=BOLD
hi StatusLineNC guifg=#666666               gui=BOLD
hi Title        guifg=#A6F02E
hi VertSplit    guifg=#666666 guibg=#1E1E1E gui=BOLD
hi Visual       guifg=#A6F02E guibg=#666666
hi WildMenu     guifg=#66D9EF guibg=#000000 gui=BOLD
