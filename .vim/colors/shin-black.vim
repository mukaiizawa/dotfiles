set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-black"

hi Comment        guifg=#7EA43F
hi Constant       guifg=#6CA994
hi String         guifg=#B9ABA6
hi Character      guifg=#DB7093
hi Number         guifg=#D1B886
hi Boolean        guifg=#6CA994               gui=BOLD
hi Float          guifg=#D1B886
hi Identifier     guifg=#6CA994
hi Function       guifg=#D1B886
hi Statement      guifg=#B77757
hi Exception      guifg=#C84D4D               gui=BOLD
hi PreProc        guifg=#D1B886
hi Type           guifg=#6CA994
hi Structure      guifg=#B77757               gui=BOLD
hi Special        guifg=#6CA994
hi Delimiter      guifg=#6CA994               gui=BOLD
hi SpecialComment guifg=#7EA43F
hi Underlined     guifg=#D1B886
hi Ignore         guifg=#FF0000
hi Error          guifg=#C84D4D guibg=#000000 gui=BOLD
hi Todo           guifg=#C84D4D guibg=#000000 gui=BOLD

hi ColorColumn                  guibg=#191C1D
hi Conceal        guifg=#666666
hi Cursor         guifg=#000000 guibg=#95A3A5
hi CursorIM                     guibg=#FF0000
hi CursorLine                   guibg=#191C1D
hi CursorLineNr   guifg=#D1B886               gui=BOLD
hi DiffAdd        guifg=#000000 guibg=#F8B500
hi DiffChange     guifg=#000000 guibg=#B9ABA6
hi DiffDelete     guifg=#666666 guibg=#505050
hi DiffText       guifg=#000000 guibg=#D0D0D0
hi Directory      guifg=#6CA994
hi EndOfBuffer    guifg=#000000 guibg=#000000
hi Folded         guifg=#AAAAAA guibg=#191C1D
hi LineNr         guifg=#AAAAAA
hi MatchParen     guifg=#000000 guibg=#FD971F gui=BOLD
hi NonText        guifg=#666666 guibg=#000000
hi Normal         guifg=#95A3A5 guibg=#000000
hi ModeMsg        guifg=#C84D4D               gui=BOLD
hi Pmenu          guifg=#95A3A5 guibg=#000000
hi PmenuSbar                    guibg=#101010
hi PmenuSel       guifg=#66D9EF guibg=#000000 gui=BOLD
hi PmenuThumb     guifg=#101010
hi Search         guifg=#E1BB6D guibg=#191C1D gui=BOLD
hi SpecialKey     guifg=#666666
hi StatusLine     guifg=#AAAAAA guibg=#191C1D gui=BOLD
hi StatusLineNC   guifg=#95A3A5               gui=BOLD
hi TabLine        guifg=#CCCCCC guibg=#666666
hi TabLineFill                  guibg=#666666
hi TabLineSel     guifg=#EEEEEE guibg=#666666
hi Title          guifg=#C84D4D
hi VertSplit      guifg=#666666               gui=BOLD
hi Visual         guifg=#AAAAAA guibg=#191C1D gui=BOLD
hi WildMenu       guifg=#66D9EF guibg=#000000 gui=BOLD
