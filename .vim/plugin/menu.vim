
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

" Diff "{{{

let g:unite_source_menu_menus.Diff = {
      \  "command_candidates" : [
      \      [ "diffoff     "  , "windo diffoff | set nowrap | set foldmethod=marker" ],
      \      [ "diffthis    "  , "diffthis" ],
      \      [ "diffupdate  "  , "diffupdate" ],
      \      [ "diffbuffers "  , "windo diffthis" ],
      \  ]
      \}


"}}}
" Edit "{{{

let g:unite_source_menu_menus.Edit = {
      \  "command_candidates" : [
      \      [ "vimrc         :<F3>"  , "edit $MYVIMRC " ],
      \      [ "gvimrc        :<F4>"  , "edit $MYGVIMRC" ],
      \  ]
      \}


"}}}
" Search "{{{

let g:unite_source_menu_menus.Search = {
      \  "command_candidates" : [
      \      [ "file/mru      :mru" , "Unite file_mru" ],
      \      [ "directory/mru :mrd" , "Unite directory_mru" ],
      \  ]
      \}


"}}}
" NeoBundle "{{{

let g:unite_source_menu_menus.NeoBundle = {
      \   "command_candidates" : [
      \       [ "NeoBundleLog"         , "NeoBundleLog" ],
      \       [ "NeoBundleList"        , "NeoBundleList" ],
      \       [ "NeoBundleClean"       , "NeoBundleClean" ],
      \       [ "NeoBundleCheck"       , "NeoBundleCheck" ],
      \       [ "NeoBundleUpdate"      , "NeoBundleUpdate" ],
      \       [ "NeoBundleInstall"     , "NeoBundleInstall" ],
      \       [ "NeoBundleCheckUpdate" , "NeoBundleCheckUpdate" ],
      \   ]
      \ }


"}}}
" Encoding "{{{

let g:unite_source_menu_menus.Encoding = {
      \ "command_candidates" : [
      \      [ "utf8"    , "setlocal fenc=Utf8"    ],
      \      [ "cp932"   , "setlocal fenc=cp932"   ],
      \      [ "euc "    , "setlocal fenc=euc"     ],
      \      [ "euc-jp"  , "setlocal fenc=euc-jp"  ],
      \      [ "utf16"   , "setlocal fenc=utf16"   ],
      \      [ "utf16-be", "setlocal fenc=utf16be" ],
      \      [ "jis"     , "setlocal fenc=jis"     ],
      \      [ "sjis"    , "setlocal fenc=sjis"    ],
      \      [ "unicode" , "setlocal fenc=unicode" ],
      \      [ "utf8     -re edit" , "e ++enc=Utf8"    ],
      \      [ "cp932    -re edit" , "e ++enc=cp932"   ],
      \      [ "euc      -re edit" , "e ++enc=euc"     ],
      \      [ "euc-jp   -re edit" , "e ++enc=euc-jp"  ],
      \      [ "utf16    -re edit" , "e ++enc=utf16"   ],
      \      [ "utf16-be -re edit" , "e ++enc=utf16be" ],
      \      [ "jis      -re edit" , "e ++enc=jis"     ],
      \      [ "sjis     -re edit" , "e ++enc=sjis"    ],
      \      [ "unicode  -re edit" , "e ++enc=unicode" ],
      \  ]
      \
      \ }


"}}}
" Format "{{{

let g:unite_source_menu_menus.Format = {
      \  "command_candidates" : [
      \      ["Windows CR LF" , "setlocal fileformat=dos"   ],
      \      ["Mac     CR"    , "setlocal fileformat=mac"   ],
      \      ["Unix    LF"    , "setlocal fileformat=unix"  ],
      \      ["Windows CR LF -re edit" , "e ++ff=dos"  ],
      \      ["Mac     CR    -re edit" , "e ++ff=mac"  ],
      \      ["Unix    LF    -re edit" , "e ++ff=unix" ],
      \  ]
      \
      \ }

"}}}
" Toggle Option "{{{

let g:unite_source_menu_menus.Toggle_Option ={
      \  "command_candidates" : [
      \      ["Toggle number     : <Space>n", "set number!"],
      \      ["Toggle hlsearch   : <Space>/", "set hlsearch!"],
      \      ["Toggle wrap       : <Space>w", "set wrap!"],
      \      ["Toggle IndentLine : <Space>i", "IndentLinesToggle"],
      \  ]
      \ }


"}}}
" Trim "{{{

let g:unite_source_menu_menus.Trim ={
      \  "command_candidates" : [
      \      ["Trim ", "%s///g"],
      \  ]
      \ }


"}}}
" StartupLogo "{{{

let g:unite_source_menu_menus.StartupLogo ={
      \  "command_candidates" : GetStartUpList()
      \ }


"}}}

function! UniteStartup()
  if argc()==0 && bufnr('$')==1 

        \ Unite
        \ output:echo:":":!
        \ output:echo:"===:Edit:===":! menu:Edit
        \ output:echo:":":!
        \ output:echo:"===:Search:===":! menu:Search
        \ output:echo:":":!
        \ output:echo:"===:Neobundle:===":! menu:NeoBundle
        \ output:echo:":":! menu:StartupLogo
        \ output:echo:":":!
        \ neomru/directory
        \ neomru/file
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


