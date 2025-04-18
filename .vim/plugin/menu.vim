" menu.vim

fu! GetRandomElement(array)
    return a:array[rand() % len(a:array)]
endfunction

fu! GetStartUpList()
  let action = "Unite neomru/file -hide-source-names -no-split -no-wrap -start-insert"
  let result = []
  " banner
  let banner = readfile($HOME . '/dotfiles/startup.banner')
  for line in banner
    call add(result, [line, action])
  endfo
  let logo = readfile($HOME . '/dotfiles/startup.logo')
  let win_height = &lines
  let win_width = &columns
  if has('win32') || has('win64')
    let win_height = 46
    let win_width = 230
  en
  let padding_top = win_height - len(banner) - len(logo) - 7
  let padding_left = repeat(" ", win_width - 50)
  while padding_top > 0
    call add(result, ["", action])
    let padding_top = padding_top - 1
  endw
  " logo
  for line in logo
    call add(result, [padding_left . line, action])
  endfo
  " quote
  for line in split(GetRandomElement(readfile($HOME . '/dotfiles/startup.quotes')), "	")
    call add(result, [line, action])
  endfor
  retu result
endf

if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
en

let g:unite_source_menu_menus.Setting = {
      \  "command_candidates" : [
      \      ["vimrc", "edit $MYVIMRC"],
      \      ["gvimrc", "edit $MYGVIMRC"],
      \  ]
      \}

let g:unite_source_menu_menus.Search = {
      \  "command_candidates" : [
      \      ["file/mru      :mru", "Unite file_mru"],
      \      ["directory/mru :mrd", "Unite directory_mru"],
      \  ]
      \}

let g:unite_source_menu_menus.Native2ascii = {
      \   "command_candidates" : [
      \       ["native2ascii", "%!native2ascii"],
      \       ["native2ascii -reverse", "%!native2ascii -reverse"],
      \   ]
      \ }

let g:unite_source_menu_menus.Encoding = {
      \ "command_candidates" : [
      \      ["utf8", "setlocal fenc=Utf8"],
      \      ["cp932", "setlocal fenc=cp932"],
      \      ["euc-jp", "setlocal fenc=euc-jp"],
      \      ["utf16", "setlocal fenc=utf16"],
      \      ["utf16-be", "setlocal fenc=utf16be"],
      \      ["sjis", "setlocal fenc=sjis"],
      \      ["latin1", "setlocal fenc=latin1"],
      \      ["utf8     -re edit", "e ++enc=Utf8"],
      \      ["cp932    -re edit", "e ++enc=cp932"],
      \      ["euc-jp   -re edit", "e ++enc=euc-jp"],
      \      ["utf16    -re edit", "e ++enc=utf16"],
      \      ["utf16-be -re edit", "e ++enc=utf16be"],
      \      ["sjis     -re edit", "e ++enc=sjis"],
      \      ["latin1   -re edit", "e ++enc=latin1"],
      \  ]
      \
      \ }

let g:unite_source_menu_menus.Format = {
      \  "command_candidates" : [
      \      ["Windows CR LF", "setlocal fileformat=dos"],
      \      ["Mac     CR"    , "setlocal fileformat=mac"],
      \      ["Unix    LF"    , "setlocal fileformat=unix"],
      \      ["Windows CR LF -re edit", "e ++ff=dos"],
      \      ["Mac     CR    -re edit", "e ++ff=mac"],
      \      ["Unix    LF    -re edit", "e ++ff=unix"],
      \  ]
      \
      \ }

let g:unite_source_menu_menus.ShiftWidth = {
      \  "command_candidates" : [
      \      ["2", "setlocal shiftwidth=2"],
      \      ["4", "setlocal shiftwidth=4"],
      \      ["8"    , "setlocal shiftwidth=8"]
      \  ]
      \ }

let g:unite_source_menu_menus.Substitute = {
      \  "command_candidates" : [
      \      ["Remove ", "%s///g"],
      \  ]
      \ }

let g:unite_source_menu_menus.StartupLogo = {
      \  "command_candidates" : GetStartUpList(),
      \ }

fu! UniteStartup()
  if argc() == 0 && bufnr('$') == 1 
    Unite menu:StartupLogo -hide-source-names -no-split -no-wrap -no-start-insert
  en
endf

com! UniteStartup call UniteStartup()
aug startupMenu
  au!
  au VimEnter * nested :UniteStartup
aug END
