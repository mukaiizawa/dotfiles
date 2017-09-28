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
