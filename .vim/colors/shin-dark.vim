set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycol"

" :help group-name

"Comment
highlight Comment				guifg=#00ff00
"Constant
highlight Constant			guifg=#00ffff
highlight String				guifg=#ee22aa
highlight Character			guifg=#ff00ff
highlight Number				guifg=#ffff44
highlight Boolean				guifg=#00ffff
highlight Float					guifg=#ffff44
"Identifier
highlight Identifier		guifg=#22ccee
highlight Function			guifg=#c0c0c0
"Statement
highlight Statement			guifg=#cc6622 gui=bold
highlight Keyword				guifg=#cc0000 gui=bold
highlight Exception			guifg=#cc0000 gui=bold
"Preproc
highlight PreProc				guifg=#ffff44
"Type
highlight Type					guifg=#00ffff
highlight Structure			guifg=#cc6622
"Special
highlight Special				guifg=#00ffff
"Underlined
highlight Underlined		guifg=#0000ff
"Ignore
highlight Ignore				guifg=#ff0000
"Error
highlight Error					guifg=#ffffff guibg=#ff0000
"Todo
highlight Todo					guifg=#ffffff guibg=#ff0000


" :help highlight-groups

highlight Conseal				guifg=#606060 guibg=#000004
highlight Cursor				guifg=#000000 guibg=#ffffff
highlight CursorIM									 	guibg=#ff0000
highlight Directory 		guifg=#00ffff guibg=#000004
highlight LineNr				guifg=#ffff00 guibg=#000004
highlight MatchParen		guifg=#ffffff	guibg=#880000
highlight NonText				guifg=#606060 guibg=#000004
highlight Normal				guifg=#ffffff guibg=#000004
highlight Search				guifg=#000000 guibg=#ff00ff
highlight SpecialKey		guifg=#606060 guibg=#000004
highlight StatusLine		guifg=#000000 guibg=#ffffff gui=bold
highlight StatusLineNC	guifg=#aaaaaa guibg=#000000
" Å™StatusLineNC fgÇ∆bgÇÃèàóùÇ™ãtÇ…Ç»
