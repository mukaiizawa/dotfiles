" user defined file type.
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  autocmd! BufRead,BufNewFile *.m setfiletype mulk
  autocmd! BufRead,BufNewFile *.p setfiletype paren
  autocmd! BufRead,BufNewFile *.rrpt setfiletype json    " RapidReport
augroup END
