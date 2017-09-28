set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark"

highlight Comment        guifg=#A6F02E
highlight Constant       guifg=#87CEEB
highlight String         guifg=#FFAAAA
highlight Character      guifg=#DB7093
highlight Number         guifg=#FADD5A
highlight Boolean        guifg=#87CEEB gui=BOLD
highlight Float          guifg=#FADD5A
highlight Identifier     guifg=#A4E1F9
highlight Function       guifg=#FAD07A
highlight Statement      guifg=#E67A45
highlight Exception      guifg=#F86060 gui=BOLD
highlight PreProc        guifg=#FAD07A
highlight Type           guifg=#87CEEB
highlight Structure      guifg=#E67A45 gui=BOLD
highlight Special        guifg=#87CEEB
highlight Delimiter      guifg=#40E0DB gui=BOLD
highlight SpecialComment guifg=#A6F02E
highlight Underlined     guifg=#FAD07A
highlight Ignore         guifg=#FF0000
highlight Error          guifg=#F86060 guibg=#303030 gui=BOLD
highlight Todo           guifg=#F86060 guibg=#303030 gui=BOLD

highlight Normal         guifg=#FFFFFF guibg=#303030
highlight NonText        guifg=#666666 guibg=#303030

highlight ColorColumn                  guibg=#404040
highlight Conceal        guifg=#666666
highlight Cursor         guifg=#000000 guibg=#FFFFFF
highlight CursorIM                     guibg=#FF0000
highlight CursorLine                   guibg=#404040
highlight CursorLineNr   guifg=#FAD07A gui=BOLD
highlight DiffAdd        guifg=#000000 guibg=#F8B500
highlight DiffChange     guifg=#000000 guibg=#FFAAAA
highlight DiffDelete     guifg=#666666 guibg=#505050
highlight DiffText       guifg=#000000 guibg=#D0D0D0
highlight Directory      guifg=#40E0DB
highlight Folded         guifg=#AAAAAA guibg=#404040
highlight LineNr         guifg=#AAAAAA
highlight MatchParen     guifg=#000000 guibg=#FD971F gui=BOLD
highlight Pmenu          guifg=#FFFFFF guibg=#303030
highlight PmenuSbar                    guibg=#101010
highlight PmenuSel       guifg=#66D9EF guibg=#000000 gui=BOLD
highlight PmenuThumb     guifg=#101010
highlight Search         guifg=#FAD07A guibg=#888888 gui=BOLD
highlight SpecialKey     guifg=#666666
highlight StatusLine     guifg=#FFFFFF guibg=#4A4A4A gui=BOLD
highlight StatusLineNC   guifg=#808080               gui=BOLD
highlight TabLine        guifg=#CCCCCC guibg=#666666
highlight TabLineFill                  guibg=#666666
highlight TabLineSel     guifg=#EEEEEE guibg=#666666
highlight Title          guifg=#F86060
highlight VertSplit      guifg=#666666               gui=BOLD
highlight Visual         guifg=#FFFFFF guibg=#3399FF gui=BOLD
highlight WildMenu       guifg=#66D9EF guibg=#000000 gui=BOLD
