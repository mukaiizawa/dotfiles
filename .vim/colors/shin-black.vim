set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-black"

" :help group-name

" Comment
highlight Comment        guifg=#7EA43F

" Constant
highlight Constant       guifg=#6CA994
highlight String         guifg=#B9ABA6
highlight Character      guifg=#DB7093
highlight Number         guifg=#D1B886
highlight Boolean        guifg=#6CA994 gui=bold
highlight Float          guifg=#D1B886

" Identifier
highlight Identifier     guifg=#6CA994
highlight Function       guifg=#D1B886

" Statement
highlight Statement      guifg=#B77757
highlight Exception      guifg=#C84D4D gui=bold

" Preproc
highlight PreProc        guifg=#D1B886

" Type
highlight Type           guifg=#6CA994
highlight Structure      guifg=#B77757 gui=bold

" Special
highlight Special        guifg=#6CA994
highlight Delimiter      guifg=#6CA994 gui=bold
highlight SpecialComment guifg=#7EA43F

" Underlined
highlight Underlined     guifg=#D1B886

" Ignore
highlight Ignore         guifg=#FF0000

" Error
highlight Error          guifg=#C84D4D guibg=#000000 gui=bold

" Todo
highlight Todo           guifg=#C84D4D guibg=#000000 gui=bold

" :help highlight-groups

highlight Normal        guifg=#7E8E91 guibg=#000000
highlight NonText       guifg=#666666 guibg=#000000

" curcor
highlight Cursor        guifg=#000000 guibg=#7E8E91
highlight CursorIM                    guibg=#FF0000
highlight CursorLine                  guibg=#191C1D
highlight ColorColumn                 guibg=#191C1D

" diff
highlight DiffAdd       guifg=#000000 guibg=#F8B500
highlight DiffChange    guifg=#000000 guibg=#B9ABA6
highlight DiffDelete    guifg=#666666 guibg=#505050
highlight DiffText      guifg=#000000 guibg=#D0D0D0

" number
highlight LineNr        guifg=#AAAAAA
highlight CursorLineNr  guifg=#D1B886 gui=bold

" conceal
highlight Conceal       guifg=#666666
highlight SpecialKey    guifg=#666666

highlight Directory     guifg=#6CA994
highlight Folded        guifg=#AAAAAA guibg=#191C1D
highlight MatchParen    guifg=#000000 guibg=#FD971F gui=bold
highlight Search        guifg=#E1BB6D guibg=#191C1D gui=bold
highlight Title         guifg=#C84D4D
highlight Visual        guifg=#AAAAAA guibg=#191C1D gui=bold
highlight VertSplit     guifg=#666666               gui=bold

" pop up menu
highlight Pmenu         guifg=#7E8E91 guibg=#000000
highlight PmenuSel      guifg=#66D9EF guibg=#000000 gui=bold
highlight PmenuSbar                   guibg=#101010
highlight PmenuThumb    guifg=#101010
highlight WildMenu      guifg=#66D9EF guibg=#000000 gui=bold

" statusline
highlight StatusLine    guifg=#AAAAAA guibg=#191C1D gui=bold
highlight StatusLineNC  guifg=#7E8E91               gui=bold

" for tab page
highlight TabLine       guifg=#CCCCCC guibg=#666666
highlight TabLineFill                 guibg=#666666
highlight TabLineSel    guifg=#EEEEEE guibg=#666666
