vim9script

export def Setup()
  if !exists('g:unite_source_menu_menus')
    g:unite_source_menu_menus = {}
  endif

  g:unite_source_menu_menus.Native2ascii = {
    command_candidates: [
      ['native2ascii', '%!native2ascii'],
      ['native2ascii -reverse', '%!native2ascii -reverse'],
    ],
  }

  g:unite_source_menu_menus.Encoding = {
    command_candidates: [
      ['utf8', 'setlocal fenc=Utf8'],
      ['cp932', 'setlocal fenc=cp932'],
      ['euc-jp', 'setlocal fenc=euc-jp'],
      ['utf16', 'setlocal fenc=utf16'],
      ['utf16-be', 'setlocal fenc=utf16be'],
      ['sjis', 'setlocal fenc=sjis'],
      ['latin1', 'setlocal fenc=latin1'],
      ['utf8     -re edit', 'e ++enc=Utf8'],
      ['cp932    -re edit', 'e ++enc=cp932'],
      ['euc-jp   -re edit', 'e ++enc=euc-jp'],
      ['utf16    -re edit', 'e ++enc=utf16'],
      ['utf16-be -re edit', 'e ++enc=utf16be'],
      ['sjis     -re edit', 'e ++enc=sjis'],
      ['latin1   -re edit', 'e ++enc=latin1'],
    ],
  }

  g:unite_source_menu_menus.Format = {
    command_candidates: [
      ['Windows CR LF', 'setlocal fileformat=dos'],
      ['Mac     CR', 'setlocal fileformat=mac'],
      ['Unix    LF', 'setlocal fileformat=unix'],
      ['Windows CR LF -re edit', 'e ++ff=dos'],
      ['Mac     CR    -re edit', 'e ++ff=mac'],
      ['Unix    LF    -re edit', 'e ++ff=unix'],
    ],
  }

  g:unite_source_menu_menus.ShiftWidth = {
    command_candidates: [
      ['2', 'setlocal shiftwidth=2'],
      ['4', 'setlocal shiftwidth=4'],
      ['8', 'setlocal shiftwidth=8'],
    ],
  }
enddef
