set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-green"

highlight Comment      guifg=#A6F02E
highlight Constant     guifg=#A6F02E
highlight Identifier   guifg=#A6F02E
highlight Statement    guifg=#A6F02E
highlight PreProc      guifg=#A6F02E
highlight Type         guifg=#A6F02E
highlight Structure    guifg=#A6F02E
highlight Special      guifg=#A6F02E
highlight Underlined   guifg=#A6F02E
highlight Ignore       guifg=#A6F02E
highlight Error        guifg=#A6F02E
highlight Todo         guifg=#A6F02E

highlight Normal       guifg=#A6F02E guibg=#1E1E1E
highlight NonText      guifg=#666666 guibg=#1E1E1E
highlight CursorLine                 guibg=#404040
highlight ColorColumn                guibg=#404040
highlight StatusLine   guifg=#A6F02E guibg=#1E1E1E gui=BOLD
highlight StatusLineNC guifg=#666666               gui=BOLD
highlight VertSplit    guifg=#666666 guibg=#1E1E1E gui=BOLD
