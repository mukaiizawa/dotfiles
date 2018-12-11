' book

' 現在のブックのパスを取得
ActiveWorkbook.Path    ' C:\foo\bar

' 現在のブックと同じディレクトリのファイルパス
ActiveWorkbook.Path & "\buzz.txt"    ' C:\foo\bar\buzz.txt
