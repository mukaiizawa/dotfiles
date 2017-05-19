" user defined file type.
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.p setfiletype paren
  au! BufRead,BufNewFile *.m setfiletype mulk
augroup END
