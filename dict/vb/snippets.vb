' Snippets

' Workbook
'' 現在のブックのパスを取得
ActiveWorkbook.Path    ' C:\foo\bar

'' 現在のブックと同じディレクトリのファイルパス
ActiveWorkbook.Path & "\buzz.txt"    ' C:\foo\bar\buzz.txt

' Worksheet
'' アクティブなシートの取得
ActiveSheet

'' シートの追加
Worksheets.Add

'' 指定したシートの後にシートの追加
Worksheets.Add after:=Worksheets("sheet1")

'' 先頭にシートを追加
Worksheets.Add Before := Worksheets(1)

'' 末尾にシートを追加
Worksheets.Add after:=Worksheets(Worksheets.Count)

'' 追加したシートの名称変更
Worksheets.Add(after:=Worksheets(Worksheets.Count)).Name("sheet2")

'' ブックの全シートを反復処理
For Each s In ThisWorkbook.Worksheets
  s.Cells(1, 1) = "foo"
Next

'' シートの名称を表示する
Sub DisplayName()
  Dim name As Object
  For Each name In Names
    name.Visible = True
  Next
End Sub

'' シート名一覧の取得(put imidiate window and press enter)
For Each i In ThisWorkbook.Sheets: debug.print i.name : next i


' Range
'' 特定のセルを表すRangeオブジェクト
Worksheets("sheet1").Range("A1")
Worksheets("sheet1").Range(Cells(1, 1))

'' 矩形領域を表すRangeオブジェクト
Worksheets("sheet1").Range("A1:B2")
Worksheets("sheet1").Range(Cells(1, 1), Cells(2,2))

'' 複数セルを表すRangeオブジェクト
Worksheets("sheet1").Range("A1,B2")

'' 名前定義のセル範囲
Worksheets("sheet1").Range("名前定義")

'' 複数行を表すRangeオブジェクト
Worksheets("sheet1").Range("1:3") 
Worksheets("sheet1").Range(Rows(1), Rows(3)) 

'' 複数列を表すRangeオブジェクト
Worksheets("sheet1").Range("A:C") 
Worksheets("sheet1").Range(Columns(1), Columns(3)) 

'' すべてのRangetオブジェクト
Worksheets("sheet1").Range(Rows(1), Columns(1)) 

'' 相対位置からRangeを取得
Worksheets("sheet1").Range("A1").Offset(1, 1)

'' セルの値を取得
Worksheets("sheet1").Range("A1").Value

'' セルに値を設定
Worksheets("sheet1").Range("A1").Value = 1

'' セルの値をクリア
Worksheets("sheet1").Range("A1").Clear

'' ハイパーリンクを設定
Worksheets("sheet1").Range("A1").Hyperlinks(1).SubAddress = "'sheet1'!A1"


' 文字列
'' 文字列の比較
ActiveCell.Value = "foo"
ActiveCell.Value <> "foo"

'' 部分文字列の判定(s contains t?)
Function contains(s as String, t as String)
  contains = InStr(s, t) > 0
End Function

'' 文字列を数値に変換
val("32323")

'' 大文字小文字変換
UCase("Excel VBA")
LCase("Excel VBA")
