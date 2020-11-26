" user defined file type.
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.m setfiletype mulk
  au! BufRead,BufNewFile *.p setfiletype paren
augroup END
