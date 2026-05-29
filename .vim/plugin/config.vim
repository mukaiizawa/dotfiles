vim9script

# caw
g:caw_no_default_keymappings = 1

nmap gca <Plug>(caw:dollarpos:toggle)
nmap gcc <Plug>(caw:wrap:toggle)
nmap gci <Plug>(caw:hatpos:toggle)
vmap gca <Plug>(caw:dollarpos:toggle)
vmap gcc <Plug>(caw:wrap:toggle)
vmap gci <Plug>(caw:hatpos:toggle)

# emmet
g:user_emmet_settings = {
  'variables': {
    'lang': 'ja',
  },
  'html': {
    'indentation': '    ',
    'quote_char': "'",
    'expandos': {
      'ol': 'ol>li',
      'ul': 'ul>li',
      'table': 'table>thead>tr>th*3^^tbody>tr>td*3',
    },
    'default_attributes': {
      'a': {'href': ''},
    },
  },
  'java': {
    'snippets': {
      '!': "public static void main(String[] args) {\n\t|\n}",
      'class': "public class | {\n}",
      'main': "public static void main(String[] args) {\n\t|\n}",
      'if': "if (|) {\n}",
      'fori': "for (int i = 0; i < |; i++) {\n}",
      'forj': "for (int j = 0; j < |; j++) {\n}",
      'fork': "for (int k = 0; k < |; k++) {\n}",
      'while': "while (|) {\n}",
      'switch': "switch (|) {\n\tcase xxx:\n\t\tbreak;\n\tdefault:\n\t\tbreak;\n}",
    },
  },
  'jsp': {
    'expandos': {
      'c:choose': 'c:choose>c:when,c:otherwise',
    },
    'default_attributes': {
      'c:forEach': [{'var': ''}, {'items': '${|}'}, {'varStatus': 'status'}],
      'c:if': {'test': '${|}'},
      'c:out': {'value': '${|}'},
      'c:set': [{'var': ''}, {'value': '${|}'}],
      'c:when': {'test': '${|}'},
    },
  },
  'paren': {
    'snippets': {
      'main': "(function! main (args)\n  (write :hello-world))",
    },
  },
  'python': {
    'snippets': {
      'main': "if __name__ == '__main__':|",
    },
  },
  'sql': {
    'snippets': {
      'case': "case\n  when | then expr\n  else expr\nend",
    },
  },
}

# quickrun
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
