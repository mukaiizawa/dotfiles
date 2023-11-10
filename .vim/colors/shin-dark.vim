set background=dark
hi clear
if exists("syntax_on")
  syntax reset
en
let g:colors_name = "shin-dark"

hi Comment        guifg=#A6F02E
hi Constant       guifg=#87CEEB
hi String         guifg=#FFAAAA
hi Character      guifg=#DB7093
hi Number         guifg=#FADD5A
hi Boolean        guifg=#87CEEB               gui=BOLD
hi Float          guifg=#FADD5A
hi Identifier     guifg=#A4E1F9
hi Function       guifg=#FAD07A
hi Statement      guifg=#E67A45
hi Exception      guifg=#F86060               gui=BOLD
hi PreProc        guifg=#FAD07A
hi Type           guifg=#87CEEB
hi Structure      guifg=#E67A45               gui=BOLD
hi Special        guifg=#87CEEB
hi Delimiter      guifg=#40E0DB               gui=BOLD
hi SpecialComment guifg=#A6F02E
hi Underlined     guifg=#FAD07A
hi Ignore         guifg=#FF0000
hi Error          guifg=#F86060 guibg=#303030 gui=BOLD
hi Todo           guifg=#F86060 guibg=#303030 gui=BOLD

hi ColorColumn                  guibg=#404040
hi Conceal        guifg=#666666
hi Cursor         guifg=#000000 guibg=#FFFFFF
hi CursorIM                     guibg=#FF0000
hi CursorLine                   guibg=#404040
hi CursorLineNr   guifg=#FAD07A               gui=BOLD
hi EndOfBuffer    guifg=#303030 guibg=#303030
hi DiffAdd        guifg=#000000 guibg=#F8B500
hi DiffChange     guifg=#000000 guibg=#FFAAAA
hi DiffDelete     guifg=#666666 guibg=#505050
hi DiffText       guifg=#000000 guibg=#D0D0D0
hi Directory      guifg=#40E0DB
hi Folded         guifg=#AAAAAA guibg=#404040
hi LineNr         guifg=#AAAAAA
hi MatchParen     guifg=#000000 guibg=#FD971F gui=BOLD
hi NonText        guifg=#666666 guibg=#303030
hi Normal         guifg=#FFFFFF guibg=#303030
hi ModeMsg        guifg=#F86060               gui=BOLD
hi Pmenu          guifg=#FFFFFF guibg=#303030
hi PmenuSbar                    guibg=#101010
hi PmenuSel       guifg=#66D9EF guibg=#000000 gui=BOLD
hi PmenuThumb     guifg=#101010
hi Search         guifg=#FAD07A guibg=#888888 gui=BOLD
hi SpecialKey     guifg=#666666
hi StatusLine     guifg=#FFFFFF guibg=#4A4A4A gui=BOLD
hi StatusLineNC   guifg=#808080               gui=BOLD
hi TabLine        guifg=#CCCCCC guibg=#666666
hi TabLineFill                  guibg=#666666
hi TabLineSel     guifg=#EEEEEE guibg=#666666
hi Terminal       guifg=#A6F02E guibg=#303030
hi Title          guifg=#F86060               gui=BOLD
hi VertSplit      guifg=#666666               gui=BOLD
hi Visual         guifg=#FFFFFF guibg=#3399FF gui=BOLD
hi WildMenu       guifg=#66D9EF guibg=#000000 gui=BOLD
