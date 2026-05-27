vim9script

export def GatherCandidates(args: list<any>, ctx: dict<any>): list<dict<any>>
  var result: list<dict<any>> = []
  for qf in getqflist()
    var path = qf.bufnr > 0 ? bufname(qf.bufnr) : ''
    var text = get(qf, 'text', '')
    var abbr = printf('%s|%d:%d| %s', empty(path) ? '[No Name]' : path, get(qf, 'lnum', 0), get(qf, 'col', 0), text)
    add(result, {
      word: abbr,
      abbr: abbr,
      data: {
        path: path,
        bufnr: get(qf, 'bufnr', 0),
        line: get(qf, 'lnum', 1),
        col: get(qf, 'col', 1),
      },
    })
  endfor
  return result
enddef
