VBA Dictionaryオブジェクト

# 概要
VBAに組み込まれている辞書オブジェクトについてまとめる。

# 宣言
    Dim map As Object
    Set map = CreateObject("Scripting.Dictionary")
宣言及び生成は上述のように行う。

# 要素の追加
    map.Add key, val
    map.Item(key) = val
Addメソッドは辞書に要素を追加する。
第一引数にキー値keyを、第二引数にキー値に結びつける値valを指定する。
既にキー値が登録されている場合はエラーとなる。
Itemプロパティを使用して設定追加する場合は、
既に要素が登録されてる場合でも上書きする。
また、Itemプロパティは省略可能。
そのため、次のように書ける。
    map(key) = val

# 要素の削除
    map.Remove(key)
Removeはキー値keyに結びつく値を削除する。
結びつく値が存在しない場合はエラーが発生する。

# 要素数の取得
    map.Count
Countプロパティは辞書に登録されている要素の数を返す。

# キー値の存在確認
    map.Exists(key)
辞書にキー値が登録されているか否か判定する。

# キー値の配列の取得
    map.Keys
辞書に登録されているキー値をすべてを要素に持つような配列を取得する。
