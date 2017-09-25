set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-black"

" :help group-name

" Comment
highlight Comment        guifg=#86C224

" Constant
highlight Constant       guifg=#5E90A4
highlight String         guifg=#B9ABA6
highlight Character      guifg=#db7093
highlight Number         guifg=#AF9A3E
highlight Boolean        guifg=#5E90A4 gui=bold
highlight Float          guifg=#AF9A3E

" Identifier
highlight Identifier     guifg=#5D7681
highlight Function       guifg=#e1bb6d

" Statement
highlight Statement      guifg=#AF6845
highlight Exception      guifg=#C84D4D gui=bold

" Preproc
highlight PreProc        guifg=#e1bb6d

" Type
highlight Type           guifg=#5E90A4
highlight Structure      guifg=#AF6845 gui=bold

" Special
highlight Special        guifg=#5E90A4
highlight Delimiter      guifg=#5D7681 gui=bold
highlight SpecialComment guifg=#86C224

" Underlined
highlight Underlined     guifg=#e1bb6d

" Ignore
highlight Ignore         guifg=#ff0000

" Error
highlight Error          guifg=#C84D4D guibg=#000000 gui=bold

" Todo
highlight Todo           guifg=#C84D4D guibg=#000000 gui=bold

" :help highlight-groups

highlight Normal        guifg=#7E8E91 guibg=#000000
highlight NonText       guifg=#666666 guibg=#000000

" curcor
highlight Cursor        guifg=#000000 guibg=#7E8E91
highlight CursorIM                    guibg=#ff0000
highlight CursorLine                  guibg=#191C1D
highlight ColorColumn                 guibg=#191C1D

" diff
highlight DiffAdd       guifg=#000000 guibg=#f8b500
highlight DiffChange    guifg=#000000 guibg=#B9ABA6
highlight DiffDelete    guifg=#666666 guibg=#505050
highlight DiffText      guifg=#000000 guibg=#d0d0d0

" number
highlight LineNr        guifg=#aaaaaa
highlight CursorLineNr  guifg=#e1bb6d gui=bold

" conceal
highlight Conceal       guifg=#666666
highlight SpecialKey    guifg=#666666

highlight Directory     guifg=#5D7681
highlight Folded        guifg=#aaaaaa guibg=#191C1D
highlight MatchParen    guifg=#000000 guibg=#fd971f gui=bold
highlight Search        guifg=#e1bb6d guibg=#191C1D gui=bold
highlight Title         guifg=#C84D4D
highlight Visual        guifg=#aaaaaa guibg=#191C1D gui=bold
highlight VertSplit     guifg=#666666               gui=bold

" pop up menu
highlight Pmenu         guifg=#7E8E91 guibg=#000000
highlight PmenuSel      guifg=#66d9ef guibg=#000000 gui=bold
highlight PmenuSbar                   guibg=#101010
highlight PmenuThumb    guifg=#101010
highlight WildMenu      guifg=#66d9ef guibg=#000000 gui=bold

" statusline
highlight StatusLine    guifg=#aaaaaa guibg=#191C1D gui=bold
highlight StatusLineNC  guifg=#7E8E91               gui=bold

" for tab page
highlight TabLine       guifg=#cccccc guibg=#666666
highlight TabLineFill                 guibg=#666666
highlight TabLineSel    guifg=#eeeeee guibg=#666666
