set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shin-dark-term"

" :help group-name "{{{
"Comment
highlight Comment        ctermfg=137
"Constant
highlight Constant       ctermfg=73
highlight String         ctermfg=107
highlight Number         ctermfg=107
"Identifier
highlight Identifier     ctermfg=73  cterm=NONE
highlight Function       ctermfg=221 cterm=NONE
"Statement
highlight Statement      ctermfg=172 cterm=NONE
"Preproc
highlight PreProc        ctermfg=103
highlight Include        ctermfg=173 cterm=NONE
highlight Define         ctermfg=173
"Type
"Special
"Underlined
"Ignore
"Error
highlight Error          ctermfg=221 ctermbg=88
"Todo
highlight Todo           ctermfg=94
" }}}
" :help highlight-groups "{{{

highlight Normal        ctermfg=white ctermbg=234

" curcor
highlight Cursor        ctermfg=0 ctermbg=15
highlight CursorLine    ctermbg=235 cterm=NONE

" number
highlight LineNr        ctermfg=242
highlight CursorLineNr  ctermfg=248

highlight Folded                          ctermbg=256
highlight Search        ctermfg=NONE ctermbg=236 cterm=underline
highlight Title         ctermfg=15
highlight Visual        ctermbg=60

" statusline
highlight StatusLine    guifg=#ffffff guibg=#4a4a4a gui=bold
highlight StatusLineNC  guifg=#808080               gui=bold

" for tab
highlight TabLine       guifg=#cccccc guibg=#666666
highlight TabLineFill                 guibg=#666666
highlight TabLineSel    guifg=#eeeeee guibg=#666666

" }}}

