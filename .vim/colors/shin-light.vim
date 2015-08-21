set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "shin-light"

" :help group-name "{{{
" Syntax group
" Comment
highlight Comment      guifg=#ff5050
" Constant
highlight Constant     guifg=#00884c
" Identifier
highlight Identifier   guifg=#b07800
" Statement
highlight Statement    guifg=#80a030 gui=BOLD 
" Ignore
highlight Ignore       guifg=bg
" Preproc
highlight PreProc      guifg=#0090a0
" Special
highlight Special      guifg=#8040f0
" Type
highlight Type         guifg=#b06c58 gui=BOLD 
" Underlined
highlight Underlined   guifg=blue    gui=UNDERLINE 
" Error
highlight Error        guifg=#f8f8f8 guibg=#4040ff gui=BOLD 
" Todo
highlight Todo         guifg=#0080f0 gui=BOLD,UNDERLINE 
" }}}
" :help highlightghlight-groups "{{{

highlight Normal       guifg=#404040 guibg=#fff4e8
highlight NonText      guifg=#a05040 gui=BOLD

" Cursor
highlight Cursor       guifg=#ffffff guibg=#0080f0
highlight CursorIM     guifg=#ffffff guibg=#8040ff
highlight CursorLine                 guibg=#ffe4d4

" Diff
highlight DiffText     guifg=#2850a0 guibg=#c0d0f0
highlight DiffChange   guifg=#208040 guibg=#c0f0d0
highlight DiffDelete   guifg=#ff2020 guibg=#eaf2b0
highlight DiffAdd      guifg=#ff2020 guibg=#eaf2b0

" number
highlight LineNr       guifg=#e0b090

" conceal
highlight SpecialKey   guifg=#0080ff

" Search
highlight IncSearch    guifg=#404040 guibg=#e0e040 gui=UNDERLINE
highlight Search       guifg=#544060 guibg=#f0c0ff

" Messages
highlight ErrorMsg     guifg=#f8f8f8 guibg=#4040ff gui=BOLD
highlight WarningMsg   guifg=#f8f8f8 guibg=#4040ff gui=BOLD
highlight ModeMsg      guifg=#d06000
highlight MoreMsg      guifg=#0090a0
highlight Question     guifg=#8000ff

" Statusline
highlight StatusLine   guifg=#f8f8f8 guibg=#904838 gui=BOLD
highlight StatusLineNC guifg=#c0b0a0 guibg=#904838 gui=BOLD

" pop up menu
highlight WildMenu     guifg=#f8f8f8 guibg=#ff3030 gui=BOLD

" Other
highlight Directory    guifg=#7050ff
highlight Folded       guifg=#804030 guibg=#ffe4d4
highlight Title        guifg=fg      gui=BOLD
highlight Visual       guifg=#804020 guibg=#ffc0a0
highlight VertSplit    guifg=#f8f8f8 guibg=#904838 gui=NONE

" }}}



