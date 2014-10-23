set background=dark
hi clear
if exists("syntax_on")
syntax reset
endif
let g:colors_name = "shin-dark"

" :help group-name "{{{
"Comment
highlight Comment				guifg=#00ff00
"Constant
highlight Constant			guifg=#00eeee
highlight String				guifg=#99ff33
highlight Character			guifg=#db7093
highlight Number				guifg=#eeee00
highlight Boolean				guifg=#00eeee gui=bold
highlight Float					guifg=#eeee00
"Identifier
highlight Identifier		guifg=#22ccee gui=bold
highlight Function			guifg=#cccccc gui=bold
"Statement
highlight Statement			guifg=#cc6622 gui=bold
highlight Conditional		guifg=#bb6633 gui=bold
highlight Repeat				guifg=#cc6633 gui=bold
highlight Label					guifg=#ff9933 gui=bold
highlight Operator			guifg=#eeeeee gui=bold
highlight Keyword				guifg=#cc0000 gui=bold
highlight Exception			guifg=#cc0000 gui=bold
"Preproc
highlight PreProc				guifg=#eeee00 gui=bold
"Type
highlight Type					guifg=#66eeee gui=bold
highlight StorageClass	guifg=#00ffff gui=bold
highlight Structure			guifg=#cc6622 gui=bold
"Special
highlight Special				guifg=#00eeee gui=bold
"Underlined
highlight Underlined		guifg=#00bfff
"Ignore
highlight Ignore				guifg=#ff0000
"Error
highlight Error					guifg=#ffffff guibg=#cc0000
"Todo
highlight Todo					guifg=#ffffff guibg=#cc0000
" }}}

" :help highlight-groups "{{{
highlight Conceal				guifg=#808080 guibg=#000004
highlight Cursor				guifg=#000000 guibg=#ffffff
highlight CursorIM									 	guibg=#ff0000
highlight Directory 		guifg=#00eeee guibg=#000004
highlight LineNr				guifg=#ffff00 guibg=#000004
highlight MatchParen		guifg=#ffffff	guibg=#880000
highlight NonText				guifg=#808080 guibg=#000004
highlight Normal				guifg=#f0f0f0 guibg=#000004
highlight Search				guifg=#000000 guibg=#66ff99
highlight SpecialKey		guifg=#808080 guibg=#000004
highlight StatusLine		guifg=#000000 guibg=#eeeeee gui=bold
" Note. The guifg and the guibg of a 'StatusLineNC' are reverse.
highlight StatusLineNC	guifg=#888888 guibg=#000000
" }}}

" help: highlight-default "{{{
highlight Folded guifg=#c0c0c0 guibg=#303030
" }}}
