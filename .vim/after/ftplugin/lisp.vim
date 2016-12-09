
setlocal nocindent
setlocal lisp
setlocal shiftwidth=4

nnoremap <buffer>gcl  :<C-u>lcd %:h<CR> :!clisp -i %<CR>

if has('win32') || has ('win64')
  nnoremap <buffer>gcw  :<C-u>lcd %:h<CR> :!wx86cl64 --terminal-encoding cp932 --load  % --eval "(ccl:quit)"<CR>
else
  nnoremap <buffer>gcw  :<C-u>lcd %:h<CR> :!lx86cl64 --terminal-encoding cp932 --load  % --eval "(ccl:quit)"<CR>
endif

nnoremap <buffer>gcs  :<C-u>lcd %:h<CR> :!sbcl --sysinit .sbclrc --script %<CR>

" stdlib
setlocal lispwords+=set-macro-character
setlocal lispwords+=set-dispatch-macro-character
setlocal lispwords+=mkstr-if
setlocal lispwords+=mkstr-aif
setlocal lispwords+=let1
setlocal lispwords+=ilet
setlocal lispwords+=ilet*
setlocal lispwords+=ilambda
setlocal lispwords+=alambda
setlocal lispwords+=dostring
setlocal lispwords+=dorange
setlocal lispwords+=with-gensyms
setlocal lispwords+=with-encoding
setlocal lispwords+=surround
setlocal lispwords+=while
setlocal lispwords+=dowhile
setlocal lispwords+=awhile
setlocal lispwords+=doawhile
setlocal lispwords+=for
setlocal lispwords+=aif
setlocal lispwords+=awhen
setlocal lispwords+=acond
setlocal lispwords+=dcond
setlocal lispwords+=getopt
setlocal lispwords+=parse-args
setlocal lispwords+=defexe

" ahead-reader
setlocal lispwords+=with-ahead-reader
setlocal lispwords+=with-string-ahead-reader
setlocal lispwords+=with-open-ahead-reader

" coordinate-manager
setlocal lispwords+=with-coordinates

" database-manager
setlocal lispwords+=deftable
setlocal lispwords+=deftables

" xml-manager
setlocal lispwords+=with-html-output
setlocal lispwords+=:a
setlocal lispwords+=:abbr
setlocal lispwords+=:acronym
setlocal lispwords+=:address
setlocal lispwords+=:applet
setlocal lispwords+=:area
setlocal lispwords+=:article
setlocal lispwords+=:aside
setlocal lispwords+=:audio
setlocal lispwords+=:b
setlocal lispwords+=:base
setlocal lispwords+=:basefont
setlocal lispwords+=:bdi
setlocal lispwords+=:bdo
setlocal lispwords+=:big
setlocal lispwords+=:blockquote
setlocal lispwords+=:body
setlocal lispwords+=:br
setlocal lispwords+=:button
setlocal lispwords+=:canvas
setlocal lispwords+=:caption
setlocal lispwords+=:center
setlocal lispwords+=:cite
setlocal lispwords+=:code
setlocal lispwords+=:col
setlocal lispwords+=:colgroup
setlocal lispwords+=:datalist
setlocal lispwords+=:dd
setlocal lispwords+=:del
setlocal lispwords+=:details
setlocal lispwords+=:dfn
setlocal lispwords+=:dialog
setlocal lispwords+=:dir
setlocal lispwords+=:div
setlocal lispwords+=:dl
setlocal lispwords+=:dt
setlocal lispwords+=:em
setlocal lispwords+=:embed
setlocal lispwords+=:fieldset
setlocal lispwords+=:figcaption
setlocal lispwords+=:figure
setlocal lispwords+=:font
setlocal lispwords+=:footer
setlocal lispwords+=:form
setlocal lispwords+=:frame
setlocal lispwords+=:frameset
setlocal lispwords+=:h1
setlocal lispwords+=:h2
setlocal lispwords+=:h3
setlocal lispwords+=:h4
setlocal lispwords+=:h5
setlocal lispwords+=:h6
setlocal lispwords+=:head
setlocal lispwords+=:header
setlocal lispwords+=:hr
setlocal lispwords+=:html
setlocal lispwords+=:i
setlocal lispwords+=:iframe
setlocal lispwords+=:img
setlocal lispwords+=:input
setlocal lispwords+=:ins
setlocal lispwords+=:kbd
setlocal lispwords+=:keygen
setlocal lispwords+=:label
setlocal lispwords+=:legend
setlocal lispwords+=:li
setlocal lispwords+=:link
setlocal lispwords+=:main
setlocal lispwords+=:mark
setlocal lispwords+=:menu
setlocal lispwords+=:menuitem
setlocal lispwords+=:meta
setlocal lispwords+=:meter
setlocal lispwords+=:nav
setlocal lispwords+=:noframes
setlocal lispwords+=:noscript
setlocal lispwords+=:object
setlocal lispwords+=:ol
setlocal lispwords+=:optgroup
setlocal lispwords+=:option
setlocal lispwords+=:output
setlocal lispwords+=:p
setlocal lispwords+=:param
setlocal lispwords+=:pre
setlocal lispwords+=:progress
setlocal lispwords+=:q
setlocal lispwords+=:rp
setlocal lispwords+=:rt
setlocal lispwords+=:ruby
setlocal lispwords+=:s
setlocal lispwords+=:samp
setlocal lispwords+=:script
setlocal lispwords+=:section
setlocal lispwords+=:select
setlocal lispwords+=:small
setlocal lispwords+=:source
setlocal lispwords+=:span
setlocal lispwords+=:strike
setlocal lispwords+=:strong
setlocal lispwords+=:style
setlocal lispwords+=:sub
setlocal lispwords+=:summary
setlocal lispwords+=:sup
setlocal lispwords+=:table
setlocal lispwords+=:tbody
setlocal lispwords+=:td
setlocal lispwords+=:textarea
setlocal lispwords+=:tfoot
setlocal lispwords+=:th
setlocal lispwords+=:thead
setlocal lispwords+=:title
setlocal lispwords+=:tr
setlocal lispwords+=:track
setlocal lispwords+=:tt
setlocal lispwords+=:u
setlocal lispwords+=:ul
setlocal lispwords+=:var
setlocal lispwords+=:video
setlocal lispwords+=:wbr
setlocal lispwords+=:time

" ltk
setlocal lispwords+=with-ltk
setlocal lispwords+=with-ltk-handlers

