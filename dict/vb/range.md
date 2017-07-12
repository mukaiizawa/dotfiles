Range

# 概要
Excel VBAにおけるセル操作の基本を記す。
Excelの基本要素はセルであり、
その基本要素を取得する方法を理解することが大事である。
Excel VBAにはそれを取得する様々な方法が用意されてる。

# Rangeオブジェクトへの参照の取得
Rangeオブジェクトへの参照を取得するには大きく次の方法が存在する。
- WorkSheetオブジェクトのRangeプロパティ
- WorkSheetオブジェクトのCellsプロパティ
- RangeオブジェクトのOffsetプロパティ
## WorkSheetオブジェクトのRangeプロパティから取得
    WorkSheets("sheet1").Range(...)
WorkSheetオブジェクトのRangeプロパティからRangeオブジェクトを取得できる。
いくつか使用例を挙げる。
    Range("A1")
    => A1セル
    Range("A1:B2")
    => A1からB2の領域
    Range("A1,B2")
    => A1及びB2セル
    Range("A1", "B3")
    => A1～B3セル範囲
    Range(Cells(1, 1))
    => A1セル
    Range(Cells(1, 1), Cells(2,2))
    => A1～B2セル範囲
    Range("名前定義")
    => 名前定義のセル範囲
    Range(Rows(1), Rows(3)) 
    => 1～3行の範囲
    Range(Columns(1), Columns(3)) 
    => 1～3列の範囲
    Range("1:3") 
    => 1～3行の範囲
    Range("A:C") 
    => 1～3列の範囲
    Range(Rows(1), Columns(1)) 
    => 全セル
## WorkSheetオブジェクトのCellsプロパティから取得
    WorkSheets("sheet1").Cells(...)
WorkSheetオブジェクトのCellsプロパティからRangeオブジェクトを取得できる。
いくつか使用例を挙げる。
    Cells(1, 1)
    => A1セル
    Cells(2, 2)
    => A2セル
    Cells
    => 全セル
Cellsでは単一またはすべてのセルを表すRangeしか取得できない。
## RangeオブジェクトのOffsetプロパティから取得
    Range(...).Offset(...)
RangeオブジェクトのCellsプロパティからRangeオブジェクトを取得できる。
Offsetプロパティの構文については後述する。

## RangeかCellsか
よく巷で議論になるため、個人的なメモとしてまとめる。
次のような基準で考えればよいかもしれない。
- 単一のセルとして操作する場合はCells
- Rangeの引数が定数で指定できないような場合はCells
- 上記以外はRange

## Rangeでしかできないこと
主に次のような場合にはRangeを使用せざるを得ない。
- 複数の独立した領域の指定
- 開始と終了による範囲指定
- 名前で定義された領域の指定
