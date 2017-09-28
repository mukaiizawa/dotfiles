set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "shin-light"

highlight Comment      guifg=#FF5050
highlight Constant     guifg=#00884C
highlight Identifier   guifg=#B07800
highlight Statement    guifg=#80A030 gui=BOLD 
highlight PreProc      guifg=#0090A0
highlight Special      guifg=#8040F0
highlight Type         guifg=#B06C58               gui=BOLD 
highlight Underlined   guifg=#0000CC
highlight Error        guifg=#F8F8F8 guibg=#4040FF gui=BOLD 
highlight Todo         guifg=#0080F0               gui=BOLD

highlight Cursor       guifg=#FFFFFF guibg=#0080F0
highlight CursorIM     guifg=#FFFFFF guibg=#8040FF
highlight CursorLine                 guibg=#FFE4D4
highlight DiffAdd      guifg=#FF2020 guibg=#EAF2B0
highlight DiffChange   guifg=#208040 guibg=#C0F0D0
highlight DiffDelete   guifg=#FF2020 guibg=#EAF2B0
highlight DiffText     guifg=#2850A0 guibg=#C0D0F0
highlight Directory    guifg=#7050FF
highlight ErrorMsg     guifg=#F8F8F8 guibg=#4040FF gui=BOLD
highlight Folded       guifg=#804030 guibg=#FFE4D4
highlight IncSearch    guifg=#404040 guibg=#E0E040
highlight LineNr       guifg=#E0B090
highlight ModeMsg      guifg=#D06000
highlight MoreMsg      guifg=#0090A0
highlight NonText      guifg=#A05040               gui=BOLD
highlight Normal       guifg=#404040 guibg=#FFF4E8
highlight Question     guifg=#8000FF
highlight Search       guifg=#544060 guibg=#F0C0FF
highlight StatusLine   guifg=#F8F8F8 guibg=#904838 gui=BOLD
highlight StatusLineNC guifg=#C0B0A0 guibg=#904838 gui=BOLD
highlight VertSplit    guifg=#F8F8F8 guibg=#904838 gui=NONE
highlight Visual       guifg=#804020 guibg=#FFC0A0
highlight WarningMsg   guifg=#F8F8F8 guibg=#4040FF gui=BOLD
highlight WildMenu     guifg=#F8F8F8 guibg=#FF3030 gui=BOLD
