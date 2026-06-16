vim9script

g:quickrun_no_default_key_mappings = 1
g:quickrun_config = {
  '_': {
    'split': 'vertical',
    'outputter/buffer/close_on_empty': 1,
  },
  'c': {
    'hook/time/enable': 1,
    'type': executable('clang') ? 'c/clang' :
            executable('gcc') ? 'c/gcc' : '',
  },
  'cs': {
    'runmode': 'simple',
    'command': 'csc',
    'exec': [
      '%c /nologo %s > nul',
      '%s:p:r.exe %a',
      ':call delete("%S:p:r.exe")',
    ],
    'tempfile': '{tempname()}.cs',
  },
  'java': {
    'exec': [
      'javac -J-Dfile.encoding=UTF8 %o %s',
      '%c -ea -Dfile.encoding=UTF8 %s:t:r %a',
    ],
    'hook/time/enable': 1,
  },
  'javascript': {
    'command': 'cscript',
    'exec': '%c %s',
  },
  'lisp': {
    'type': executable('sbcl') ? 'lisp/sbcl' :
            executable('lx86cl64') ? 'lisp/ccll' :
            executable('wx86cl64') ? 'lisp/cclw' :
            executable('clisp') ? 'lisp/clisp' : '',
    'hook/time/enable': 1,
  },
  'lisp/sbcl': {
    'command': 'sbcl',
    'exec': '%c --noinform --non-interactive --load %s',
  },
  'lisp/ccll': {
    'command': 'lx86cl64',
    'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
  },
  'lisp/cclw': {
    'command': 'wx86cl64',
    'exec': '%c -K utf8 -l %s -e "(ccl:quit)"',
  },
  'lisp/clisp': {
    'command': 'clisp',
  },
  'markdown': {
    'command': 'paren',
    'input': '%{expand("%:p")}',
    'outputter': 'file',
    'outputter/file/name': '%{expand("%:r")}.html',
    'exec': '%c md2html.p',
  },
  'paren': {
    'command': 'paren',
    'exec': '%c %s',
  },
}
