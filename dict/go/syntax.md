Go言語チュートリアル

# 識別子
Go言語の識別子はUnicodeの文字またはアンダースコアから始まり，
識別子の最初に使われうる文字または数字が任意回続き構成される．
また，以下に示す予約後はユーザ定義識別子としては使えない．
break case chan const continue default defer else fallthrough for func go goto
if import interface map package range return select struct switch type var
Goではキャメルケースを用いる．

# 宣言
## パッケージ宣言
package <identifier>
パッケージは名前空間を分けるためにある．
Go言語の任意のファイルはpackage宣言から始まる．
大文字から始まる識別子はパッケージ外から参照可能と見做す．

## インポート宣言
import (<package>+)
インポート宣言を行うことにより，他のパッケージを使用することが可能．
言語仕様ではインポートするパッケージを表す文字列(インポートパス)が
どこにあるのかは定義していない．
それらの解釈はツールによって異なる．
goツールを用いる場合はパッケージを構成するディレクトリを表す．
また，インポートしたパッケージを使用しないとコンパイルエラーとなる．

## 変数宣言
var宣言は特定の型の変数を作成し，その初期化を行う．
var <identifier> (<type>
            | = <expression>
            | <type> = <expression>)
<expression>が省略される場合はゼロ値が設定される．
型:ゼロ値
-------------
数値:0
真偽値:false
文字列:""
参照型:nil
また，以下のように複数の変数を同時に宣言可能．
var i, j, k int
// <=>
// var i int
// var j int
// var k int
var i, s, b = 0, "str", true
// <=>
// var i int = 0
// var s string = "str"
// var b bool = true

## 定数宣言
const <identifier> (<type>)? = <expression>
const \(
  (<identifier> (<type>)? = <expression>)+
\)
constを用いて定数を宣言可能．
<type>がない場合は，右辺で型推論を行う．

## 省略変数宣言
<identifier> := <expression>
<identifier>の型を<expression>から推論する宣言．

## 型宣言
type <identifier> <type>
型宣言は既存の方と同じ型を持つ新たな名前付きの型を定義する．
<identifier>が大文字から始まる場合，パッケージの外からも参照可能となる．
type Min int
type Sec int
では同じ基底型intを持つ二つの型MinとSecを定義しているが，
両方の方は異なる型と見做される．
型が異なるため，両者間で比較や代入はできない．

# 代入
<identifier> = <expression>
代入は<identifier>の値を<expression>で更新する．

## タプル代入
<identifier>{n} = <expression>{n}
タプル代入を用いると，複数の変数に一度に代入できる．
右辺がすべて評価された後に左辺に代入を行うため，
二つの変数の値を入れ替えるとき等に便利．
x, y = y, x
