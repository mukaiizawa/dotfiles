set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "shin-light"

" :help group-name

" Comment
highlight Comment      guifg=#FF5050

" Constant
highlight Constant     guifg=#00884C

" Identifier
highlight Identifier   guifg=#B07800

" Statement
highlight Statement    guifg=#80A030 gui=BOLD 

" Ignore
highlight Ignore       guifg=BG

" Preproc
highlight PreProc      guifg=#0090A0

" Special
highlight Special      guifg=#8040F0

" Type
highlight Type         guifg=#B06C58 gui=BOLD 

" Underlined
highlight Underlined   guifg=BLUE    gui=UNDERLINE 

" Error
highlight Error        guifg=#F8F8F8 guibg=#4040FF gui=BOLD 

" Todo
highlight Todo         guifg=#0080F0 gui=BOLD,UNDERLINE 


" :help highlightghlighT-GROUPS

highlight Normal       guifg=#404040 guibg=#FFF4E8
highlight NonText      guifg=#A05040 gui=BOLD

" Cursor
highlight Cursor       guifg=#FFFFFF guibg=#0080F0
highlight CursorIM     guifg=#FFFFFF guibg=#8040FF
highlight CursorLine                 guibg=#FFE4D4

" Diff
highlight DiffText     guifg=#2850A0 guibg=#C0D0F0
highlight DiffChange   guifg=#208040 guibg=#C0F0D0
highlight DiffDelete   guifg=#FF2020 guibg=#EAF2B0
highlight DiffAdd      guifg=#FF2020 guibg=#EAF2B0

" Number
highlight LineNr       guifg=#E0B090

" Conceal
highlight SpecialKey   guifg=#0080FF

" Search
highlight IncSearch    guifg=#404040 guibg=#E0E040 gui=UNDERLINE
highlight Search       guifg=#544060 guibg=#F0C0FF

" Messages
highlight ErrorMsg     guifg=#F8F8F8 guibg=#4040FF gui=BOLD
highlight WarningMsg   guifg=#F8F8F8 guibg=#4040FF gui=BOLD
highlight ModeMsg      guifg=#D06000
highlight MoreMsg      guifg=#0090A0
highlight Question     guifg=#8000FF

" Statusline
highlight StatusLine   guifg=#F8F8F8 guibg=#904838 gui=BOLD
highlight StatusLineNC guifg=#C0B0A0 guibg=#904838 gui=BOLD

" pop up menu
highlight WildMenu     guifg=#F8F8F8 guibg=#FF3030 gui=BOLD

" Other
highlight Directory    guifg=#7050FF
highlight Folded       guifg=#804030 guibg=#FFE4D4
highlight Visual       guifg=#804020 guibg=#FFC0A0
highlight VertSplit    guifg=#F8F8F8 guibg=#904838 gui=NONE
