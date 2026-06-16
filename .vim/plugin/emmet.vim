vim9script

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
