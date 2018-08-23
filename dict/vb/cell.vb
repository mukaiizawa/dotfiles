' cell

' セルの値を取得
Worksheets("sheet1").Range("A1").Value

' セルに値を設定
Worksheets("sheet1").Range("A1").Value = 1

' セルの値をクリア
Worksheets("sheet1").Range("A1").Clear

' セルが無色の間実行
Dim r as Integer
r = 0
Do While Worksheets("sheet1").Cells(r, 1).Interior.ColorIndex = xlNone
  r = r + 1
  ' ...
Loop
