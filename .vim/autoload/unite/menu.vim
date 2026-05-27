vim9script

def MenuDefinitions(): dict<any>
  return {
    Native2ascii: {
      items: [
        { word: 'native2ascii', command: '%!native2ascii' },
        { word: 'native2ascii -reverse', command: '%!native2ascii -reverse' },
      ],
    },

    Encoding: {
      items: [
        { word: 'utf8', command: 'setlocal fenc=Utf8' },
        { word: 'cp932', command: 'setlocal fenc=cp932' },
        { word: 'euc-jp', command: 'setlocal fenc=euc-jp' },
        { word: 'utf16', command: 'setlocal fenc=utf16' },
        { word: 'utf16-be', command: 'setlocal fenc=utf16be' },
        { word: 'sjis', command: 'setlocal fenc=sjis' },
        { word: 'latin1', command: 'setlocal fenc=latin1' },
        { word: 'utf8     -re edit', command: 'e ++enc=Utf8' },
        { word: 'cp932    -re edit', command: 'e ++enc=cp932' },
        { word: 'euc-jp   -re edit', command: 'e ++enc=euc-jp' },
        { word: 'utf16    -re edit', command: 'e ++enc=utf16' },
        { word: 'utf16-be -re edit', command: 'e ++enc=utf16be' },
        { word: 'sjis     -re edit', command: 'e ++enc=sjis' },
        { word: 'latin1   -re edit', command: 'e ++enc=latin1' },
      ],
    },

    Format: {
      items: [
        { word: 'Windows CR LF', command: 'setlocal fileformat=dos' },
        { word: 'Mac     CR', command: 'setlocal fileformat=mac' },
        { word: 'Unix    LF', command: 'setlocal fileformat=unix' },
        { word: 'Windows CR LF -re edit', command: 'e ++ff=dos' },
        { word: 'Mac     CR    -re edit', command: 'e ++ff=mac' },
        { word: 'Unix    LF    -re edit', command: 'e ++ff=unix' },
      ],
    },

    ShiftWidth: {
      items: [
        { word: '2', command: 'setlocal shiftwidth=2' },
        { word: '4', command: 'setlocal shiftwidth=4' },
        { word: '8', command: 'setlocal shiftwidth=8' },
      ],
    },
  }
enddef

var menus = MenuDefinitions()

def MenuNames(): list<string>
  return sort(keys(menus))
enddef

def MenuCommand(menu_name: string): string
  return printf("call unite#Start('menu', %s)", string({ picker_args: [menu_name] }))
enddef

def NormalizeCommandCandidate(item: any): dict<any>
  if type(item) != v:t_dict
    return {}
  endif

  var candidate = copy(item)
  var data = get(candidate, 'data', {})
  if !has_key(data, 'command') && has_key(candidate, 'command')
    data.command = candidate.command
  endif
  candidate.data = data
  if !has_key(candidate, 'word')
    candidate.word = get(candidate, 'abbr', data.command)
  endif
  return candidate
enddef

def GatherMenuCandidates(menu_name: string): list<dict<any>>
  var menu = get(menus, menu_name, {})
  var items = get(menu, 'items', [])
  var result: list<dict<any>> = []

  for item in items
    var candidate = NormalizeCommandCandidate(item)
    if empty(candidate) || empty(get(candidate, 'data', {}).command)
      continue
    endif
    add(result, candidate)
  endfor

  return result
enddef

def GatherMenuIndexCandidates(): list<dict<any>>
  var result: list<dict<any>> = []

  for menu_name in MenuNames()
    var menu = menus[menu_name]
    add(result, {
      word: menu_name,
      abbr: get(menu, 'description', menu_name),
      data: {
        command: MenuCommand(menu_name),
      },
    })
  endfor

  return result
enddef

export def GatherCandidates(args: list<any> = [], ctx: dict<any> = {}): list<dict<any>>
  if empty(args)
    return GatherMenuIndexCandidates()
  endif

  return GatherMenuCandidates(args[0])
enddef
