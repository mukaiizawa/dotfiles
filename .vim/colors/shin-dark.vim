set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark"

" :help group-name

" Comment
highlight Comment        guifg=#A6F02E

" Constant
highlight Constant       guifg=#87CEEB
highlight String         guifg=#FFAAAA
highlight Character      guifg=#DB7093
highlight Number         guifg=#FADD5A
highlight Boolean        guifg=#87CEEB gui=BOLD
highlight Float          guifg=#FADD5A

" Identifier
highlight Identifier     guifg=#A4E1F9
highlight Function       guifg=#FAD07A

" Statement
highlight Statement      guifg=#E67A45
highlight Exception      guifg=#F86060 gui=BOLD

" Preproc
highlight PreProc        guifg=#FAD07A

" Type
highlight Type           guifg=#87CEEB
highlight Structure      guifg=#E67A45 gui=BOLD

" Special
highlight Special        guifg=#87CEEB
highlight Delimiter      guifg=#40E0DB gui=BOLD
highlight SpecialComment guifg=#A6F02E

" Underlined
highlight Underlined     guifg=#FAD07A

" Ignore
highlight Ignore         guifg=#FF0000

" Error
highlight Error          guifg=#F86060 guibg=#303030 gui=BOLD

" Todo
highlight Todo           guifg=#F86060 guibg=#303030 gui=BOLD

" :help highlight-groups

highlight Normal         guifg=#FFFFFF guibg=#303030
highlight NonText        guifg=#666666 guibg=#303030

" curcor
highlight Cursor         guifg=#000000 guibg=#FFFFFF
highlight CursorIM                     guibg=#FF0000
highlight CursorLine                   guibg=#404040
highlight ColorColumn                  guibg=#404040

" diff
highlight DiffAdd        guifg=#000000 guibg=#F8B500
highlight DiffChange     guifg=#000000 guibg=#FFAAAA
highlight DiffDelete     guifg=#666666 guibg=#505050
highlight DiffText       guifg=#000000 guibg=#D0D0D0

" number
highlight LineNr         guifg=#AAAAAA
highlight CursorLineNr   guifg=#FAD07A gui=BOLD

" conceal
highlight Conceal        guifg=#666666
highlight SpecialKey     guifg=#666666

highlight Directory      guifg=#40E0DB
highlight Folded         guifg=#AAAAAA guibg=#404040
highlight MatchParen     guifg=#000000 guibg=#FD971F gui=BOLD
highlight Search         guifg=#FAD07A guibg=#888888 gui=BOLD
highlight Title          guifg=#F86060
highlight Visual         guifg=#FFFFFF guibg=#3399FF gui=BOLD
highlight VertSplit      guifg=#666666               gui=BOLD

" pop up menu
highlight Pmenu          guifg=#FFFFFF guibg=#303030
highlight PmenuSel       guifg=#66D9EF guibg=#000000 gui=BOLD
highlight PmenuSbar                    guibg=#101010
highlight PmenuThumb     guifg=#101010
highlight WildMenu       guifg=#66D9EF guibg=#000000 gui=BOLD

" statusline
highlight StatusLine     guifg=#FFFFFF guibg=#4A4A4A gui=BOLD
highlight StatusLineNC   guifg=#808080               gui=BOLD

" for tab page
highlight TabLine        guifg=#CCCCCC guibg=#666666
highlight TabLineFill                  guibg=#666666
highlight TabLineSel     guifg=#EEEEEE guibg=#666666
