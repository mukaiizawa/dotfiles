
setlocal iskeyword=33,38,42,43,45,47-58,60-90,97-122,_

" stdlib
syn keyword lispFunc with-gensyms
syn keyword lispFunc with-encoding
syn keyword lispFunc alambda
syn keyword lispFunc surround
syn keyword lispFunc dostring
syn keyword lispFunc dorange
syn keyword lispFunc while
syn keyword lispFunc dowhile
syn keyword lispFunc for
syn keyword lispFunc aif
syn keyword lispFunc awhen
syn keyword lispFunc awhile
syn keyword lispFunc doawhile
syn keyword lispFunc aand
syn keyword lispFunc acond
syn keyword lispFunc dcond
syn keyword lispFunc defexe
syn keyword lispFunc canonical-letargs
syn keyword lispFunc before
syn keyword lispFunc after
syn keyword lispFunc last1
syn keyword lispFunc single?
syn keyword lispFunc alist?
syn keyword lispFunc append1
syn keyword lispFunc conc1
syn keyword lispFunc mklist
syn keyword lispFunc iota
syn keyword lispFunc longer?
syn keyword lispFunc filter
syn keyword lispFunc group
syn keyword lispFunc flatten
syn keyword lispFunc prune
syn keyword lispFunc multiple-value-find-if
syn keyword lispFunc before?
syn keyword lispFunc after?
syn keyword lispFunc last-member
syn keyword lispFunc most
syn keyword lispFunc maprec
syn keyword lispFunc memoize
syn keyword lispFunc compose
syn keyword lispFunc repeat
syn keyword lispFunc empty?
syn keyword lispFunc blank?
syn keyword lispFunc mkstr
syn keyword lispFunc mksym
syn keyword lispFunc mkkey
syn keyword lispFunc explode
syn keyword lispFunc string->list
syn keyword lispFunc list->string
syn keyword lispFunc string->byte
syn keyword lispFunc byte->string
syn keyword lispFunc replstr
syn keyword lispFunc trimstr
syn keyword lispFunc format-string
syn keyword lispFunc guess-encoding
syn keyword lispFunc stdin
syn keyword lispFunc stdout
syn keyword lispFunc show-hash
syn keyword lispFunc princln
syn keyword lispFunc println
syn keyword lispFunc echo
syn keyword lispFunc input-int
syn keyword lispFunc input-str
syn keyword lispFunc input-char
syn keyword lispFunc read-as-list
syn keyword lispFunc dir-pathname?
syn keyword lispFunc pathname-as-directory
syn keyword lispFunc directory-wildcard
syn keyword lispFunc file-exists?
syn keyword lispFunc pathname-as-file
syn keyword lispFunc parent-directory
syn keyword lispFunc read-from
syn keyword lispFunc write-to
syn keyword lispFunc write-to!
syn keyword lispFunc mkdir
syn keyword lispFunc mkfile
syn keyword lispFunc mkfile!
syn keyword lispFunc ls
syn keyword lispFunc mapfile
syn keyword lispFunc run-on?
syn keyword lispFunc parse-int
syn keyword lispFunc parse-sym
syn keyword lispFunc getopt
syn keyword lispFunc expand-hyphen
syn keyword lispFunc executable
syn keyword lispFunc exit
syn keyword lispFunc call
syn keyword lispFunc args
syn keyword lispFunc usage
syn keyword lispKey :keyword
syn keyword lispKey :extension
syn keyword lispKey :external-format
syn keyword lispKey :enc :utf-8 :uft-16 :cp932 :euc-jp
syn keyword lispKey :ff :unix :windows :CR :CRLF
syn keyword lispKey :print-object
syn keyword lispKey :vector
syn keyword lispKey :capitalize
syn keyword lispKey :recursive
syn keyword lispKey :left :right :float :padding
syn keyword lispKey :title :desc :opts :foot

" ahead-reader
syn keyword lispFunc with-ahead-reader
syn keyword lispFunc with-string-ahead-reader
syn keyword lispFunc with-open-ahead-reader

" database-manager
syn keyword lispFunc deftable
syn keyword lispFunc deftables

" xml-manager
syn keyword lispFunc with-html-output
syn keyword lispKey :a
syn keyword lispKey :abbr
syn keyword lispKey :acronym
syn keyword lispKey :address
syn keyword lispKey :applet
syn keyword lispKey :area
syn keyword lispKey :article
syn keyword lispKey :aside
syn keyword lispKey :audio
syn keyword lispKey :b
syn keyword lispKey :base
syn keyword lispKey :basefont
syn keyword lispKey :bdi
syn keyword lispKey :bdo
syn keyword lispKey :big
syn keyword lispKey :blockquote
syn keyword lispKey :body
syn keyword lispKey :br
syn keyword lispKey :button
syn keyword lispKey :canvas
syn keyword lispKey :caption
syn keyword lispKey :center
syn keyword lispKey :cite
syn keyword lispKey :code
syn keyword lispKey :col
syn keyword lispKey :colgroup
syn keyword lispKey :datalist
syn keyword lispKey :dd
syn keyword lispKey :del
syn keyword lispKey :details
syn keyword lispKey :dfn
syn keyword lispKey :dialog
syn keyword lispKey :dir
syn keyword lispKey :div
syn keyword lispKey :dl
syn keyword lispKey :dt
syn keyword lispKey :em
syn keyword lispKey :embed
syn keyword lispKey :fieldset
syn keyword lispKey :figcaption
syn keyword lispKey :figure
syn keyword lispKey :font
syn keyword lispKey :footer
syn keyword lispKey :form
syn keyword lispKey :frame
syn keyword lispKey :frameset
syn keyword lispKey :h1
syn keyword lispKey :h2
syn keyword lispKey :h3
syn keyword lispKey :h4
syn keyword lispKey :h5
syn keyword lispKey :h6
syn keyword lispKey :head
syn keyword lispKey :header
syn keyword lispKey :hr
syn keyword lispKey :html
syn keyword lispKey :i
syn keyword lispKey :iframe
syn keyword lispKey :img
syn keyword lispKey :input
syn keyword lispKey :ins
syn keyword lispKey :kbd
syn keyword lispKey :keygen
syn keyword lispKey :label
syn keyword lispKey :legend
syn keyword lispKey :li
syn keyword lispKey :link
syn keyword lispKey :main
syn keyword lispKey :mark
syn keyword lispKey :menu
syn keyword lispKey :menuitem
syn keyword lispKey :meta
syn keyword lispKey :meter
syn keyword lispKey :nav
syn keyword lispKey :noframes
syn keyword lispKey :noscript
syn keyword lispKey :object
syn keyword lispKey :ol
syn keyword lispKey :optgroup
syn keyword lispKey :option
syn keyword lispKey :output
syn keyword lispKey :p
syn keyword lispKey :param
syn keyword lispKey :pre
syn keyword lispKey :progress
syn keyword lispKey :q
syn keyword lispKey :rp
syn keyword lispKey :rt
syn keyword lispKey :ruby
syn keyword lispKey :s
syn keyword lispKey :samp
syn keyword lispKey :script
syn keyword lispKey :section
syn keyword lispKey :select
syn keyword lispKey :small
syn keyword lispKey :source
syn keyword lispKey :span
syn keyword lispKey :strike
syn keyword lispKey :strong
syn keyword lispKey :style
syn keyword lispKey :sub
syn keyword lispKey :summary
syn keyword lispKey :sup
syn keyword lispKey :table
syn keyword lispKey :tbody
syn keyword lispKey :td
syn keyword lispKey :textarea
syn keyword lispKey :tfoot
syn keyword lispKey :th
syn keyword lispKey :thead
syn keyword lispKey :title
syn keyword lispKey :tr
syn keyword lispKey :track
syn keyword lispKey :tt
syn keyword lispKey :u
syn keyword lispKey :ul
syn keyword lispKey :var
syn keyword lispKey :video
syn keyword lispKey :wbr
syn keyword lispKey :time

" predicates
syn keyword lispFunc adjustable-array?
syn keyword lispFunc alpha-char?
syn keyword lispFunc alphanumeric?
syn keyword lispFunc array-has-fill-pointer?
syn keyword lispFunc array-in-bounds?
syn keyword lispFunc array?
syn keyword lispFunc bit-vector?
syn keyword lispFunc both-case?
syn keyword lispFunc bound?
syn keyword lispFunc char-greater?
syn keyword lispFunc char-less?
syn keyword lispFunc char-not-greater?
syn keyword lispFunc char-not-less?
syn keyword lispFunc character?
syn keyword lispFunc compiled-function?
syn keyword lispFunc complex?
syn keyword lispFunc cons?
syn keyword lispFunc constant?
syn keyword lispFunc digit-char?
syn keyword lispFunc end?
syn keyword lispFunc equal?
syn keyword lispFunc even?
syn keyword lispFunc fbound?
syn keyword lispFunc float?
syn keyword lispFunc function?
syn keyword lispFunc graphic-char?
syn keyword lispFunc hash-table?
syn keyword lispFunc input-stream?
syn keyword lispFunc integer?
syn keyword lispFunc interactive-stream?
syn keyword lispFunc keyword?
syn keyword lispFunc list?
syn keyword lispFunc logbit?
syn keyword lispFunc lower-case?
syn keyword lispFunc minus?
syn keyword lispFunc next-method?
syn keyword lispFunc number?
syn keyword lispFunc odd?
syn keyword lispFunc open-stream?
syn keyword lispFunc output-stream?
syn keyword lispFunc package?
syn keyword lispFunc pathname-match?
syn keyword lispFunc pathname?
syn keyword lispFunc plus?
syn keyword lispFunc random-state?
syn keyword lispFunc rational?
syn keyword lispFunc readtable?
syn keyword lispFunc real?
syn keyword lispFunc rempro?
syn keyword lispFunc simple-bit-vector?
syn keyword lispFunc simple-string?
syn keyword lispFunc simple-vector?
syn keyword lispFunc slot-bound?
syn keyword lispFunc slot-exists?
syn keyword lispFunc special-operator?
syn keyword lispFunc standard-char?
syn keyword lispFunc stream?
syn keyword lispFunc string-greater?
syn keyword lispFunc string-less?
syn keyword lispFunc string-not-greater?
syn keyword lispFunc string-not-less?
syn keyword lispFunc string?
syn keyword lispFunc subset?
syn keyword lispFunc subtype?
syn keyword lispFunc symbol?
syn keyword lispFunc tail?
syn keyword lispFunc type?
syn keyword lispFunc upper-case?
syn keyword lispFunc vector-po?
syn keyword lispFunc vector?
syn keyword lispFunc wild-pathname?
syn keyword lispFunc y-or-n?
syn keyword lispFunc yes-or-no?
syn keyword lispFunc zero?
syn keyword lispFunc eq?
syn keyword lispFunc eql?
syn keyword lispFunc symbol?
syn keyword lispFunc null?

