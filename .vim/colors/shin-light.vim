set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "shin-light"

hi Comment      guifg=#FF5050
hi Constant     guifg=#00884C
hi Identifier   guifg=#B07800
hi Statement    guifg=#80A030 gui=BOLD 
hi PreProc      guifg=#0090A0
hi Special      guifg=#8040F0
hi Type         guifg=#B06C58               gui=BOLD 
hi Underlined   guifg=#0000CC
hi Error        guifg=#F8F8F8 guibg=#4040FF gui=BOLD 
hi Todo         guifg=#0080F0               gui=BOLD

hi Cursor       guifg=#FFFFFF guibg=#0080F0
hi CursorIM     guifg=#FFFFFF guibg=#8040FF
hi CursorLine                 guibg=#FFE4D4
hi DiffAdd      guifg=#FF2020 guibg=#EAF2B0
hi DiffChange   guifg=#208040 guibg=#C0F0D0
hi DiffDelete   guifg=#FF2020 guibg=#EAF2B0
hi DiffText     guifg=#2850A0 guibg=#C0D0F0
hi Directory    guifg=#7050FF
hi ErrorMsg     guifg=#F8F8F8 guibg=#4040FF gui=BOLD
hi Folded       guifg=#804030 guibg=#FFE4D4
hi IncSearch    guifg=#404040 guibg=#E0E040
hi LineNr       guifg=#E0B090
hi ModeMsg      guifg=#D06000
hi MoreMsg      guifg=#0090A0
hi NonText      guifg=#A05040               gui=BOLD
hi Normal       guifg=#404040 guibg=#FFF4E8
hi Question     guifg=#8000FF
hi Search       guifg=#544060 guibg=#F0C0FF
hi StatusLine   guifg=#F8F8F8 guibg=#904838 gui=BOLD
hi StatusLineNC guifg=#C0B0A0 guibg=#904838 gui=BOLD
hi VertSplit    guifg=#F8F8F8 guibg=#904838 gui=NONE
hi Visual       guifg=#804020 guibg=#FFC0A0
hi WarningMsg   guifg=#F8F8F8 guibg=#4040FF gui=BOLD
hi WildMenu     guifg=#F8F8F8 guibg=#FF3030 gui=BOLD
