set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark"

" :help group-name "{{{
" Comment
highlight Comment        guifg=#a6f02e
" Constant
highlight Constant       guifg=#87ceeb
highlight String         guifg=#ffaaaa
highlight Character      guifg=#db7093
highlight Number         guifg=#fadd5a
highlight Boolean        guifg=#87ceeb gui=bold
highlight Float          guifg=#fadd5a
" Identifier
highlight Identifier     guifg=#87ceeb
highlight Function       guifg=#fad07a
" Statement
highlight Statement      guifg=#cc7833
highlight Exception      guifg=#f86060 gui=bold
" Preproc
highlight PreProc        guifg=#fad07a
" Type
highlight Type           guifg=#87ceeb
highlight Structure      guifg=#cc7833
" Special
highlight Special        guifg=#87ceeb
highlight Delimiter      guifg=#40e0db gui=bold
highlight SpecialComment guifg=#a6f02e
" Underlined
highlight Underlined     guifg=#00bfff
" Ignore
highlight Ignore         guifg=#ff0000
" Error
highlight Error          guifg=#66d9ef guibg=#202020 gui=bold
" Todo
highlight Todo           guifg=#66d9ef guibg=#202020 gui=bold
" }}}
" :help highlight-groups "{{{

highlight Normal        guifg=#ffffff guibg=#303030
highlight NonText       guifg=#666666 guibg=#303030

" curcor
highlight Cursor        guifg=#000000 guibg=#ffffff
highlight CursorIM                    guibg=#ff0000
highlight CursorLine                  guibg=#404040

" diff
highlight DiffAdd       guifg=#000000 guibg=#f8b500
highlight DiffChange    guifg=#000000 guibg=#ffaaaa
highlight DiffDelete    guifg=#666666 guibg=#505050
highlight DiffText      guifg=#000000 guibg=#d0d0d0

" number
highlight LineNr        guifg=#aaaaaa
highlight CursorLineNr  guifg=#fad07a gui=bold

" conceal
highlight Conceal       guifg=#666666
highlight SpecialKey    guifg=#666666

highlight Directory     guifg=#40e0db
highlight Folded        guifg=#aaaaaa guibg=#404040
highlight MatchParen    guifg=#ffffff guibg=#880000
highlight Search        guifg=#fad07a guibg=#888888 gui=bold
highlight Title         guifg=#f86060
highlight Visual        guifg=#fad07a guibg=#505050 gui=bold
highlight VertSplit     guifg=#666666               gui=bold

" pop up menu
highlight Pmenu         guifg=#ffffff guibg=#303030
highlight PmenuSel      guifg=#66d9ef guibg=#000000 gui=bold
highlight PmenuSbar                   guibg=#101010
highlight PmenuThumb    guifg=#101010
highlight WildMenu      guifg=#66d9ef guibg=#000000 gui=bold

" statusline
highlight StatusLine    guifg=#ffffff guibg=#4a4a4a gui=bold
highlight StatusLineNC  guifg=#808080               gui=bold

" for tab
highlight TabLine       guifg=#cccccc guibg=#666666
highlight TabLineFill                 guibg=#666666
highlight TabLineSel    guifg=#eeeeee guibg=#666666

" }}}

