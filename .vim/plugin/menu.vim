function! GetStartUpList()
  let s:path = $HOME . '/dotfiles/startup.logo'
  if !filereadable(s:path)
    call PrintError(printf('GetStartUpList: "%s" is not found.', s:path))
    return []
  endif
  let s:result = []
  let s:lines = readfile(s:path)
  for s:line in s:lines
    call add(s:result, [s:line, "enew"])
  endfor
  return s:result
endfunction


if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

let g:unite_source_menu_menus.Diff = {
      \  "command_candidates" : [
      \      ["diffoff", "windo diffoff | set nowrap | set foldmethod=marker"],
      \      ["diffthis", "diffthis"],
      \      ["diffupdate", "diffupdate"],
      \      ["diffbuffers", "windo diffthis"],
      \  ]
      \}

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

let g:unite_source_menu_menus.NeoBundle = {
      \   "command_candidates" : [
      \       ["NeoBundleLog", "NeoBundleLog"],
      \       ["NeoBundleList", "NeoBundleList"],
      \       ["NeoBundleClean", "NeoBundleClean"],
      \       ["NeoBundleCheck", "NeoBundleCheck"],
      \       ["NeoBundleUpdate", "NeoBundleUpdate"],
      \       ["NeoBundleInstall", "NeoBundleInstall"],
      \       ["NeoBundleCheckUpdate", "NeoBundleCheckUpdate"],
      \   ]
      \ }

let g:unite_source_menu_menus.Encoding = {
      \ "command_candidates" : [
      \      ["utf8", "setlocal fenc=Utf8"],
      \      ["cp932", "setlocal fenc=cp932"],
      \      ["euc", "setlocal fenc=euc"],
      \      ["euc-jp", "setlocal fenc=euc-jp"],
      \      ["utf16", "setlocal fenc=utf16"],
      \      ["utf16-be", "setlocal fenc=utf16be"],
      \      ["jis", "setlocal fenc=jis"],
      \      ["sjis", "setlocal fenc=sjis"],
      \      ["latin1", "setlocal fenc=latin1"],
      \      ["utf8     -re edit", "e ++enc=Utf8"],
      \      ["cp932    -re edit", "e ++enc=cp932"],
      \      ["euc      -re edit", "e ++enc=euc"],
      \      ["euc-jp   -re edit", "e ++enc=euc-jp"],
      \      ["utf16    -re edit", "e ++enc=utf16"],
      \      ["utf16-be -re edit", "e ++enc=utf16be"],
      \      ["jis      -re edit", "e ++enc=jis"],
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

let g:unite_source_menu_menus.Substitute ={
      \  "command_candidates" : [
      \      ["Remove ", "%s///g"],
      \  ]
      \ }

let g:unite_source_menu_menus.StartupLogo ={
      \  "command_candidates" : GetStartUpList()
      \ }

function! UniteStartup()
  if argc()==0 && bufnr('$')==1 
    Unite
          \ output:echo:":":!
          \ output:echo:"===:Edit:===":! menu:Setting
          \ output:echo:":":!
          \ output:echo:"===:Search:===":! menu:Search
          \ output:echo:":":!
          \ output:echo:"===:Neobundle:===":! menu:NeoBundle
          \ output:echo:":":! menu:StartupLogo
          \ output:echo:":":!
          \ neomru/file
          \ output:echo:":":!
          \ -hide-source-names
          \ -no-split
          \ -no-wrap
  endif
endfunction

command! UniteStartup call UniteStartup()
augroup startupMenu
  autocmd!
  autocmd VimEnter * nested :UniteStartup
augroup END
