VBAチュートリアル

# 概要
VBAの基礎を網羅することを目的とするチュートリアルを記す。
また、評価結果を`=>`で表すことがある。

# 特徴
VBAには次のような特徴がある。
- 大文字小文字を区別しない
- 文を複数行にわたり記述する際は場合は行末に`_`を付ける必要がある

# コメント
    ' comment
`'`から行末までがコメントと見做される。
多言語における複数行コメントはない。

# 宣言
    Dim var As Integer
変数は`Dim 変数名 as 変数の型`として宣言する。
専ら次の型が使用される。
- Boolean(ブール型)
- Integer(整数型)
- Long(長い整数型)
- Double(浮動小数点数型)
- Date(日付型)
- String(文字列)
この他に、ユーザ定義型を定義して使用することが可能。

# 数値
算術演算の例を示す。
    Dim i as Integer
    i = 1 + 1
    => 2
    i = 1 - 1
    => 0
    i = 1 * 1
    => 0
    i = 1 / 1
    => 1
    i = 1 \ 1    ' 商
    => 1
    i = 1 mod 1    ' 余り
    => 0
C言語におけるインクリメント/デクリメント演算子はない。

# 文字列
VBAではダブルクォートで囲まれた文字の列を文字列と見做す。
## 文字列の結合
    "a" & "b"
    => "ab"
文字列の結合は`&`演算子で行う。
## 文字列の長さ取得
    Len(src as String)
Lenは文字列srcの長さを取得する。
## 部分文字列の取得
    Left(src as String, i As Integer)
    Right(src as String, i As Integer)
    Mid(src as String, i As Integer)
    Mid(src as String, i As Integer, n as Integer)
Leftはsrc先頭からi文字目までの部分文字列を取得する。
Rightはsrcの最後からi番目までの文字列を取得する。
Left、Rightともに、次の場合はそれぞれ特定の値が返る。
- iが0の場合: 空文字列
- iがsrcの長さを超える場合: src
Midはsrcのi番目からn文字取得する。
nが指定されていない場合は最後まで取得する。
ただし、iが0以下の場合はエラーとなる。
## 文字列の配列を文字列へ結合
    Join(arr As String()) As String
    Join(arr As String(), separator As String) As String
Joinは文字列の配列の各要素をseparatorで結合した文字列を返す。
separatorが省略された場合は、半角スペース` `が指定されたものと見做す。
## 文字列を文字列の配列に分割
    Split(src As String) As String()
    Split(src As String, separator As String) As String()
Splitは、文字列srcを区切り文字separatorで分割した配列を返す。
separatorが省略された場合は、半角スペース` `が指定されたものと見做す。
## 部分文字列の検索
    InStr(src As String, substr as String)
InStrは部分文字列substrが文字列srcに一致する位置を返す。
部分文字列が存在しない場合は0を返す。

# 配列
## 配列の宣言
    Dim arr() As Integer
変数名称の直後に`()`を付けると配列と見做される。
    Dim arr(10) As Integer
ただし、要素数を指定すると静的配列となり、宣言以降要素数を変更できない。
## 配列の要素の参照
    arr(0)
i番目の要素を参照するには`変数名(i)`とする。
## 配列の要素への代入
    arr(0) = 1
i番目の要素に値を代入するには`変数名(i) = 値`とする。
## 配列の最大の要素番号取得
    UBound(arr)
UBoundで配列の長さを取得できる。
繰り返しので配列をイテレートするとき等に使用する。
## 配列の大きさの変更
    Redim Preserve 配列名(要素数)
配列の大きさはRedimステートメントで変更できる。
Preserveは省略可能で、その場合は要素数を変更する前の配列の内容が破棄される。

# 条件分岐
    If 述語 Then
        処理
    End If
If文は述語を満たす場合、処理を行う。
また、Else節を設ける場合は次のようにする。
    If 述語 Then
        処理1
    Else
        処理2
    End If
また、複数の分岐を行う場合はElseIf節を使用する。
    If 述語 Then
        ...
    ElseIf 述語 Then
        ...
    End If

# 反復
## For文
    For i = 0 To 4
        処理
    Next
指定回数繰り返す場合はFor文が使用できる。
For文では反復の度に初期値から1ずつインクリメントされる。
### For Step文
    For i = 5 To 2 Step -2
        処理
    Next
Step節を追加することによりその値を指定できる。
For文はStepに1を指定したものに他ならない。
### For Each文
    For Each i In Range("A1", "A3")
        処理
    Next
For Each文ではコレクションをイテレートするときに便利である。
主に、配列、Worksheets、Range等のコレクションに対して使用する。
### For文から脱出
    For i = 0 To 4
        ...
        Exit For
        ...
    Next
Forステートメントから脱出するにはExitステートメントにForを指定する。
### For文のスキップ
    For i = 0 To 4
        ...
        GoTo Label
        ...
        Label:
    Next
所謂他言語におけるcontinue文はVBAには存在しない。
そのためGoTo文を使用して大域脱出する。

## Do Loop文
    Do
        処理
    Loop
Do Loop文は処理を反復し続ける。
### Do While Loop文
    Do While 述語
        処理
    Loop
Do While Loop文は述語を満たす間繰り返す。
### Do Untile Loop文
    Do Untile 述語
        処理
    Loop
Do Untile Loop文は述語をを満たしていない間繰り返す。
### Do Loop While文
    Do
        処理
    Loop While 述語
Do Loop While文は処理を行った後に述語を評価する点を除いて、
Do While Loop文と同じである。
### Do Loop Untile文
    Do
        処理
    Loop Untile 述語
Do Loop Untile文は処理を行った後に述語を評価する点を除いて、
Do Untile Loop文と同じである。
### Do Loop文の終了
    Do
        ...
        Exit Do
        ...
    Loop
Doステートメントから脱出するにはExitステートメントにDoを指定する。

# ユーザ定義型
## ユーザ定義型の定義
    Type 型名称
        var1 As Integer
        var2 As Integer
        ...
    End Type
新しく型を定義するにはTypeを使用する。
## ユーザ定義型の使用
    Dim 名称 As 型名称 
ユーザ定義型も定義した後はプリミティブの型と同じように使用できる。
## ユーザ定義型のフィールドの参照
    変数.フィールド名称
ドット演算子を使用して、ユーザ定義型のフィールドへアクセスできる。
## ユーザ定義型のフィールドに代入
    変数.フィールド名称 = 値
参照先に代入演算子`=`を用いて値を設定できる。

# 手続き
VBAには値を返す手続きとそうでないものとで呼称と、構文が異なる。
前者をFunctionプロシージャといい、後者をSubプロシージャという。
## Functionプロシージャ
    Function f1(param1 As Integer) As Integer
        処理
    End Function
例として仮引数param1を受け取り、Integer型の値を返す関数f1を示す。
関数の返り値は`f1 = val`のように、
関数名に値を代入することにより設定される。
### 関数のスコープについて
Functionの前にその関数のスコープを指定することができる。
指定できる識別子は次の通り。
    識別子  スコープ
    ----------------------------------------
    Public  すべてのモジュールから参照可能
    Private このモジュールのみから参照可能
    Public  クラスモジュールからのみ参照可能
### 実引数の参照渡し/値渡し
仮引数宣言の先頭にByValまたはByRefを付与することができる。
省略した場合は常にByRefが指定されたとものと見做される。
### オプショナル引数の指定について
仮引数宣言の先頭に`Optional`を付与することにより、
オプションナル引数として宣言することができる。
オプショナル引数を作成する場合は次の点に留意しなければならない。
- 以降の仮引数もオプショナル引数にしなければならない
- 他の仮引数にParamArray宣言がある場合は指定できない
また、初期値を型宣言の後に指定することが可能。
以下にわざとらしい使用例を示す。
    Function addN(x as Integer, Optional y as Integer = 1)
        addN = x + y
    End Function
    addN(1)
    => 2
    addN(1, 2)
    => 3
### 可変長引数について
仮引数宣言の先頭に`ParamArray`を付与することにより、
可変長引数を定義できる。
複数の引数を指定する場合、次の点に留意しなければならない。
- ParamArrayは最後のみ指定可能
- ParamArrayを指定した仮引数はバリアント型の配列となる
- 次のキーワードを同時に指定できない(ByRef、ByVal、Optional)
- 他の仮引数にOptionalを指定できない
以下にわざとらしい使用例を示す。
    Function sumAll(ParamArray args()) as Integer
        Dim i As Integer
        sumAll = 0
        For i = 0 To UBound(args)
            sumAll = sumAll + args(i)
        Next i
    End Function
    sumAll(1, 2, 3, 4)
    => 10
### 関数を抜ける
    Exit Function
関数を抜けるにはExitステートメントにFunctionを指定する。
## Subプロシージャ
    Sub name(引数のリスト)
        処理
    End Sub
Subプロシージャは値を返さない点を除いて、
Functionプロシージャと同じである。
大きく次の点が異なる。
- 引数リストの後に値を返す記述が書けない
- Subステートメントから脱出する際はExitステートメントにSubを指定する。

# その他
## 変数宣言の強制可
    Option Explicit
モジュールの先頭に`Option Explicit`を記載することにより、
変数宣言が矯正される。
