" user defined file type.
if exists("did_load_filetypes")
  finish
en
aug filetypedetect
  au! BufRead,BufNewFile *.m setfiletype mulk
  au! BufRead,BufNewFile *.p setfiletype paren
aug END
