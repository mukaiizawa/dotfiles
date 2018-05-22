" user defined file type.
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.p setfiletype paren
  au! BufRead,BufNewFile *.m setfiletype mulk
  au! BufRead,BufNewFile *.mod setfiletype modula2
  au! BufRead,BufNewFile *.xmd setfiletype xmd
augroup END
