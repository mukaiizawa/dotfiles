" html.vim

setl cpt+=s~/dotfiles/word/java

" add accessor
nn <buffer> sa ^t mawv;"ty;wve"nyG{o
      \ public <C-r>t get<C-r>n<ESC>,3l~A() {<CR>
      \   return this.<C-r>n;<CR>
      \ }<CR><Esc>{=ap}o
      \ public void set<C-r>n<Esc>,3l~A(<C-r>t <C-r>n) {<CR>
      \   this.<C-r>n = <C-r>n;<CR>
      \ }<CR><Esc>{=ap}`a

" emmet
if exists('g:user_emmet_settings')
  let g:user_emmet_settings.java = {
        \   'snippets': {
        \       'main': "public static void main(String[] args) {\n\t|\n}",
        \       'if': "if (|) {\n}",
        \       'fori': "for (int i = 0; i < |; i++) {\n}",
        \       'forj': "for (int j = 0; j < |; j++) {\n}",
        \       'fork': "for (int k = 0; k < |; k++) {\n}",
        \       'while': "while (|) {\n}",
        \   }
        \ }
en
