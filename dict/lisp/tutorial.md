Lispチュートリアル

# pathname
    ;; pathname からファイル名を取得
    (file-namestring #P"/tmp/hoge.tgz")
    ;; => "hoge.tgz"

    ;; pathname から拡張子を取得
    (pathname-type #P"/tmp/hoge.tgz")
    ;; => "tgz"

    ;; pathname からファイル名(拡張子無し)を取得
    (pathname-name #P"/tmp/hoge.tgz")
    ;; => "hoge"

    ;; pathname からディレクトリを取得
    (pathname-directory #P"/tmp/hoge.tgz")
    ;; => (:ABSOLUTE "tmp")

    (pathname-directory #P"tmp/hoge.tgz")
    ;; => (:RELATIVE "tmp")

    ;; pathname からドライブレターを取得
    (pathname-device #P"D:/tmp/hoge.tgz")
    ;; => "D"

# format
    ;; Standard
    (format nil "~S" "hello") ;; => "\"hello\"" 
    (format nil "~10S" "hello") ;; => "\"hello\"   " 
    (format nil "~10@S" "hello") ;; => "   \"hello\"" 
    (format nil "~S" nil) ;; => "NIL"
    (format nil "~:S" nil) ;; => "()" 

    ;; Aesthetic
    (format nil "~A" "hello") ;; => "hello" 
    (format nil "~10A" "hello") ;; => "hello     " 
    (format nil "~10@A" "hello") ;; => "     hello" 
    (format nil "~A" nil) ;; => "NIL"
    (format nil "~:A" nil) ;; => "()" 

    ;; Character
    (format nil "~C" #\Space)

    ;; Newline
    (format nil "~3%")

    ;; Fresh-line
    (format nil "~3&")

    ;; Page
    (format nil "~3|")

    ;; Tilde
    (format nil "~3~") ;; => "~~~"

    ;; Output with conmma
    (format nil "~:D" 1000000) ;; => "1,000,000"

    ;; Radix Control
    (format nil "~2R" 10) ;; => "1010"
    (format nil "~4R" 10) ;; => "22"
    (format nil "~8R" 10) ;; => "12"
    (format nil "~10R" 10) ;; => "10"
    (format nil "~16R" 10) ;; => "A"

    ;; Cardinal, Ordinal, Roman
    (format nil "~R" 4) ;; => "four"
    (format nil "~:R" 4) ;; => "fourth"
    (format nil "~@R" 4) ;; => "IV"

    ;; Decimal
    (format nil "~8D" 12345) ;; "   12345" 
    (format nil "~:D" 10000) ;; => "10,000"

    ;; Binary
    (format nil "~B" 10) ;; => "1010"

    ;; Octal
    (format nil "~O" 10) ;; => "12"

    ;; Hexadecimal
    (format nil "~X" 10) ;; => "A"

    ;; Floating-Point
    (format nil "~10F" 3.0) ;; => "       3.0" 
    (format nil "~,5F" 3.0) ;; => "3.00000" 
    (format nil "~10,5F" 3.0) ;; => "   3.00000" 

    ;; Exponential
    (format nil "~10,4E" 637.5) ;; => " 6.3750E+2" 

    ;; List Iteration
    (format nil "(~{~A ~})" '(one two three))
    ;; => "(ONE TWO THREE )"
    (format nil "(~{~A~^, ~})" '(one two three))
    ;; => "(ONE, TWO, THREE)"

    ;; Case Conversion
    (format nil "before:~A, after:~1:*~(~A~)" "ASDF")
    ;; =>  "before:ASDF, after:asdf" 
    (format nil "before:~A, after:~1:*~@(~A~)" "ASDF")
    ;; =>  "before:ASDF, after:Asdf" 
    (format nil "before:~A, after:~1:*~:@(~A~)" "ASDF")
    ;; =>  "before:ASDF, after:ASDF" 

    ;; Justification
    (format nil "~10<foo~;bar~>") ;;=> "foo    bar" 
    (format nil "~10:<foo~;bar~>") ;;=> "  foo  bar" 
    (format nil "~10<foobar~>") ;; => "    foobar" 
    (format nil "~10:<foobar~>") ;; => "    foobar" 
    (format nil "~10:@<foo~;bar~>") ;;=> "  foo bar " 
    (format nil "~10@<foobar~>") ;; => "foobar    " 
    (format nil "~10:@<foobar~>") ;; => "  foobar  " 


# clos
## クラス定義
    (defclass KnightTour ()
     ((size :accessor .size)
      (board :accessor .board)
      (visit-count :accessor .visit-count)
      (curr-row :accessor .curr-row)
      (curr-col :accessor .curr-col)))

## メソッド定義
    (defmethod .init ((kt KnightTour) size row col)
      (setf (.size kt) size
            (.curr-row kt) row
            (.curr-col kt) col
            (.board kt) (make-array (list (.size kt) (.size kt))
                                    :initial-element nil)
            (.visit-count kt) 0
            (aref (.board kt) row col) (.visit-count kt))
      kt)
