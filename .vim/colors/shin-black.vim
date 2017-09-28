set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-black"

highlight Comment        guifg=#7EA43F
highlight Constant       guifg=#6CA994
highlight String         guifg=#B9ABA6
highlight Character      guifg=#DB7093
highlight Number         guifg=#D1B886
highlight Boolean        guifg=#6CA994 gui=BOLD
highlight Float          guifg=#D1B886
highlight Identifier     guifg=#6CA994
highlight Function       guifg=#D1B886
highlight Statement      guifg=#B77757
highlight Exception      guifg=#C84D4D gui=BOLD
highlight PreProc        guifg=#D1B886
highlight Type           guifg=#6CA994
highlight Structure      guifg=#B77757 gui=BOLD
highlight Special        guifg=#6CA994
highlight Delimiter      guifg=#6CA994 gui=BOLD
highlight SpecialComment guifg=#7EA43F
highlight Underlined     guifg=#D1B886
highlight Ignore         guifg=#FF0000
highlight Error          guifg=#C84D4D guibg=#000000 gui=BOLD
highlight Todo           guifg=#C84D4D guibg=#000000 gui=BOLD

highlight ColorColumn                  guibg=#191C1D
highlight Conceal        guifg=#666666
highlight Cursor         guifg=#000000 guibg=#7E8E91
highlight CursorIM                     guibg=#FF0000
highlight CursorLine                   guibg=#191C1D
highlight CursorLineNr   guifg=#D1B886 gui=BOLD
highlight DiffAdd        guifg=#000000 guibg=#F8B500
highlight DiffChange     guifg=#000000 guibg=#B9ABA6
highlight DiffDelete     guifg=#666666 guibg=#505050
highlight DiffText       guifg=#000000 guibg=#D0D0D0
highlight Directory      guifg=#6CA994
highlight Folded         guifg=#AAAAAA guibg=#191C1D
highlight LineNr         guifg=#AAAAAA
highlight MatchParen     guifg=#000000 guibg=#FD971F gui=BOLD
highlight NonText        guifg=#666666 guibg=#000000
highlight Normal         guifg=#7E8E91 guibg=#000000
highlight Pmenu          guifg=#7E8E91 guibg=#000000
highlight PmenuSbar                    guibg=#101010
highlight PmenuSel       guifg=#66D9EF guibg=#000000 gui=BOLD
highlight PmenuThumb     guifg=#101010
highlight Search         guifg=#E1BB6D guibg=#191C1D gui=BOLD
highlight SpecialKey     guifg=#666666
highlight StatusLine     guifg=#AAAAAA guibg=#191C1D gui=BOLD
highlight StatusLineNC   guifg=#7E8E91               gui=BOLD
highlight TabLine        guifg=#CCCCCC guibg=#666666
highlight TabLineFill                  guibg=#666666
highlight TabLineSel     guifg=#EEEEEE guibg=#666666
highlight Title          guifg=#C84D4D
highlight VertSplit      guifg=#666666               gui=BOLD
highlight Visual         guifg=#AAAAAA guibg=#191C1D gui=BOLD
highlight WildMenu       guifg=#66D9EF guibg=#000000 gui=BOLD
