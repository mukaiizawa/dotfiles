vim9script

def GetRandomElement(items: list<string>): string
  return items[rand() % len(items)]
enddef

export def GatherCandidates(args: list<any>, context: dict<any>): list<dict<any>>
  const action = 'Unite neomru/file -hide-source-names -no-split -no-wrap -start-insert'
  var result: list<dict<any>> = []

  const banner = readfile($HOME .. '/dotfiles/startup.banner')
  for line in banner
    add(result, {
      word: line,
      kind: 'command',
      action__command: action,
    })
  endfor

  const logo = readfile($HOME .. '/dotfiles/startup.logo')
  var win_height = &lines
  var win_width = &columns
  if has('win32') || has('win64')
    win_height = 46
    win_width = 230
  endif

  var padding_top = win_height - len(banner) - len(logo) - 7
  const padding_left = repeat(' ', win_width - 50)
  while padding_top > 0
    add(result, {
      word: '',
      kind: 'command',
      action__command: action,
    })
    padding_top -= 1
  endwhile

  for line in logo
    add(result, {
      word: padding_left .. line,
      kind: 'command',
      action__command: action,
    })
  endfor

  for line in split(GetRandomElement(readfile($HOME .. '/dotfiles/startup.quotes')), "\t")
    add(result, {
      word: line,
      kind: 'command',
      action__command: action,
    })
  endfor

  return result
enddef
