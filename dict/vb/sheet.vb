' sheet

' シートの追加
Worksheets.Add

' 指定したシートの後にシートの追加
Worksheets.Add after:=Worksheets("sheet1")

' 先頭にシートを追加
Worksheets.Add Before := Worksheets(1)

' 末尾にシートを追加
Worksheets.Add after:=Worksheets(Worksheets.Count)

' 追加したシートの名称変更
Worksheets.Add(after:=Worksheets(Worksheets.Count)).Name("sheet2")

' シート名一覧の取得(put imidiate window and press enter)
For Each i In ThisWorkbook.Sheets: debug.print i.name : next i
