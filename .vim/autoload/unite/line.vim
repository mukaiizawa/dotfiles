vim9script

export def GatherCandidates(args: list<any>, ctx: dict<any>): list<dict<any>>
  var target = get(ctx, 'origin_bufnr', bufnr('%'))
  var lines = getbufline(target, 1, '$')
  var items: list<dict<any>> = []
  var format = '%' .. len(string(len(lines))) .. 'd: %s'

  for idx in range(len(lines))
    add(items, {
      word: lines[idx],
      abbr: printf(format, idx + 1, substitute(lines[idx], '\s\+$', '', '')),
      data: {
        bufnr: target,
        line: idx + 1,
      },
    })
  endfor

  return items
enddef
