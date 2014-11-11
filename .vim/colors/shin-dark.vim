set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark"

" :help group-name "{{{
"Comment
highlight Comment       guifg=#a6f02e
"Constant
highlight Constant      guifg=#66d9ef
highlight String        guifg=#ff9800
highlight Character     guifg=#db7093
highlight Number        guifg=#fadd5a
highlight Boolean       guifg=#66d9ef gui=bold
highlight Float         guifg=#fad07a
"Identifier
highlight Identifier    guifg=#66d9ef
highlight Function      guifg=#c0c0c0
"Statement
highlight Statement     guifg=#cc7833
highlight Keyword       guifg=#cc0000 gui=bold
highlight Exception     guifg=#cc0000 gui=bold
"Preproc
highlight PreProc       guifg=#fad07a
"Type
highlight Type          guifg=#66d9ef
highlight Structure     guifg=#cc7833
"Special
highlight Special       guifg=#40e0db gui=bold
"Underlined
highlight Underlined    guifg=#00bfff
"Ignore
highlight Ignore        guifg=#ff0000
"Error
highlight Error         guifg=#ffffff guibg=#cc0000
"Todo
highlight Todo          guifg=#ffffff guibg=#cc0000
" }}}

" :help highlight-groups "{{{

highlight Normal        guifg=#f0f0f0 guibg=#060606
highlight NonText       guifg=#808080 guibg=#060606

highlight Cursor        guifg=#000000 guibg=#ffffff
highlight CursorLine                  guibg=#111111
highlight LineNr        guifg=#bbbbbb
highlight CursorLineNr  guifg=#fad07a
highlight Conceal       guifg=#808080 guibg=#000004
highlight CursorIM                    guibg=#ff0000
highlight Directory     guifg=#40e0db guibg=#000004
highlight Folded        guifg=#c0c0c0 guibg=#303030
highlight MatchParen    guifg=#ffffff guibg=#880000
highlight Search        guifg=#cc7833 guibg=#a6f02e gui=bold
highlight SpecialKey    guifg=#808080 guibg=#000004
highlight Title         guifg=#ff0000 guibg=#000000
highlight Visual                      guibg=#bbbbbb
highlight VertSplit     guifg=#606060               gui=bold

" pop up menu
highlight Pmenu         guifg=#ffffff guibg=#606060
highlight PmenuSel      guifg=#101010 guibg=#eeeeee
highlight PmenuSbar                   guibg=#080808
highlight PmenuThumb    guifg=#66D9EF
highlight WildMenu      guifg=#101010 guibg=#eeeeee

" for tab
highlight TabLine       guifg=#cccccc guibg=#808080
highlight TabLineFill                 guibg=#404040
highlight TabLineSel    guifg=#eeeeee guibg=#606060

" statusline
highlight StatusLine    guifg=#f0f0f0 guibg=#606060 gui=bold
highlight StatusLineNC  guifg=#666666 guibg=#cccccc gui=bold
" Note. The guifg and the guibg of a 'StatusLineNC' are reverse.
" }}}

