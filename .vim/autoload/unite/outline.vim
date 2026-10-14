vim9script

# Add filetype-specific patterns here to support classes, functions, etc.
var patterns: dict<string> = {
  markdown: '\C^\s*#\{1,6}\%(\s\|$\)',
  html: '\c^\s*<h[1-6]\%(\s\|>\)',
}

export def GatherCandidates(args: list<any>, ctx: dict<any>): list<dict<any>>
  var target = get(ctx, 'origin_bufnr', bufnr('%'))
  var filetype = getbufvar(target, '&filetype')
  var pattern = get(patterns, filetype, '')
  if empty(pattern)
    return []
  endif
  # Reuse line candidates to preserve line numbers and buffer jump behavior.
  var items = unite#line#GatherCandidates(args, ctx)
  return filter(items, (_, item) => item.word =~ pattern)
enddef
