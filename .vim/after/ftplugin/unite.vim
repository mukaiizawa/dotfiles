" normal mode
nmap <buffer> i     <Plug>(unite_insert_enter)
nmap <buffer> I     <Plug>(unite_insert_head)
nmap <buffer> A     <Plug>(unite_append_end)
nmap <buffer> <C-l> <Plug>(unite_redraw)
nmap <buffer> <C-h> <Plug>(unite_delete_backward_path)
nmap <buffer> gg    <Plug>(unite_cursor_top)
nmap <buffer> G     <Plug>(unite_cursor_bottom)
nmap <buffer> G     <Plug>(unite_cursor_bottom)
nmap <buffer> j     <Plug>(unite_loop_cursor_down)
nmap <buffer> k     <Plug>(unite_loop_cursor_up)
nmap <buffer> <CR>  <Plug>(unite_do_default_action)

" insert mode
imap <buffer> <CR> <Plug>(unite_do_default_action)
