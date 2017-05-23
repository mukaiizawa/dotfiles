cssセレクタの種類

# 概要
cssセレクタの種類についてよく使うものをまとめる。
これらはすべてを網羅しているわけではない。

# 文法
セレクタ指定時の識別子を次のように定義する。
また、必要に応じて末尾に数字を付加する。
要素名: <element>
属性名: <attribute>
属性値名: <value>
id名: <id>
クラス名: <class>
上記の任意のセレクタ: <selector>

# セレクタ
- *
- <element>
- #<id>
- .<class>
- [<attribute>]
- [<attribute>=<value>]
- [<attribute>^=<value>]
- [<attribute>$=<value>]
- [<attribute>*=<value>]
- <selector1><selector2>
- <selector1>, <selector2>
- <selector1> <selector2>
- <selector1> > <selector2>
- <selector1> + <selector2>
- <selector1> ~ <selector2>

## *
すべての要素を対象にする。

## <element>
要素名が<element>であるような要素を対象と見做す。

## #<id>
idが<id>であるような要素を対象と見做す。

## .<class>
クラスが<class>であるような要素を対象と見做す。

## [<attribute>]
属性<attribute>を持つ要素を対象と見做す。

## [<attribute>=<value>]
属性<attribute>の属性値が<value>であるような要素を対象と見做す。

## [<attribute>^=<value>]
属性<attribute>の属性値が<value>から始まるような要素を対象と見做す。

## [<attribute>$=<value>]
属性<attribute>の属性値が<value>で終わるような要素を対象と見做す。

## [<attribute>*=<value>]
属性<attribute>の属性値に<value>を含むような要素を対象と見做す。

## <selector1><selector2>
セレクタ<selector1>及び、<selector2>にマッチする要素を対象と見做す。

## <selector1>, <selector2>
セレクタ<selector1>または、<selector2>にマッチする要素を対象と見做す。

## <selector1> <selector2>
セレクタ<selector1>にマッチする要素の子要素のうち、
セレクタ<selector2>にマッチするものを対象と見做す。

## <selector1> > <selector2>
セレクタ<selector1>にマッチする要素の直近の子要素のうち、
セレクタ<selector2>にマッチするものを対象と見做す。

## <selector1> + <selector2>
セレクタ<selector1>にマッチする要素の直後の要素のうち、
セレクタ<selector2>にマッチするものを対象と見做す。

## <selector1> ~ <selector2>
セレクタ<selector1>にマッチする要素の後の要素のうち、
セレクタ<selector2>にマッチするものを対象と見做す。

# 疑似クラス
- <selector1>:not(<selector2>)
- <selector>:empty
- <selector>:first-child
- <selector>:nth-child(n)
- <selector>:last-child
- <selector>:focus
- <selector>:checked
- <selector>:enabled
- <selector>:disabled
- <selector>:required
- <selector>:optional
- <selector>:read-only
- <selector>:read-write
- <selector>:valid
- <selector>:invalid
- <selector>:link
- <selector>:visited
- <selector>:hover
- <selector>:active

## <selector1>:not(<selector2>)
セレクタ<selector1>にマッチする要素のうち、
セレクタ<selector2>にマッチしない要素を対象と見做す。

## <selector>:empty
子要素がないセレクタ<selector>を表す疑似クラスを表す。

## <selector>:first-child, <selector>:nth-child(n), <selector>:last-child
<selector>にマッチする要素のうち、
一番目/n番目/最後の要素を表す疑似クラス。
nには数字だけではなく次の値を入れることができる。
- odd
- 2n+1
- even
- 2n
- 3n
- 3n+1

## <selector>:focus
セレクタ<selector>にマッチする要素のうち、
フォーカスが当たっている要素を表す疑似クラス。

## <selector>:checked
セレクタ<selector>にマッチする要素のうち、
ラジオボタンやチェックボックスで選択されている状態を表す疑似クラス。

## <selector>:enabled, <selector>:disabled
<selector>にマッチする要素のうち、
disabled="disabled"が指定されていない/いる
要素を表す疑似クラス。

## <selector>:required, <selector>:optional
<selector>にマッチする要素のうち、
required="required"が指定されている/いない
要素を表す疑似クラス。

## <selector>:required, <selector>:optional
<selector>にマッチする要素のうち、
required="required"が指定されている/いない
要素を表す疑似クラス。

## <selector>:read-only, <selector>:read-write
<selector>にマッチする要素のうち、
readonly="readonly"が指定されている/いない
要素を表す疑似クラス。

## <selector>:valid, <selector>:invalid
<selector>にマッチする要素のうち、
入力された値が妥当である/ない
要素を表す疑似クラス。

## <selector>:link, <selector>:visited, <selector>:active, <selector>:hover
これらの疑似クラスは主にaタグでセットで用いられる。
なお、aタグに同時に指定する際には、
これらの疑似クラスの優先順位が同じであることから、
この順番で記述するのがよい。
:link, 未訪問のリンクを表す疑似クラス
:visited, 訪問済みのリンクを表す疑似クラス
:hover, マウスが要素の上に乗ったときに付加される疑似クラス
:active, 要素がアクティブになった際に負荷される疑似クラス
これらの疑似クラスのうち、:hoverと:activeはaタグ以外にもしばしば用いられる。

# 疑似要素
- <selector>::after
- <selector>::before
- <selector>::first-letter
- <selector>::first-line

## <selector>::after, <selector>::before
セレクタがマッチする要素の直前/直後に疑似要素を挿入する。
挿入する際にcontentプロパティを設定する必要がある。
例として、class属性にnoteが指定されてあるようなpタグの直前に
`NOTE'を挿入するcssを示す。
p.note::before { content: "NOTE: ";}

## <selector>::first-letter, <selector>::first-line
セレクタがマッチする要素のうち、
最初の文字/最初の行に疑似要素を挿入する。
例として、pタグの最初の一文字目の左側にマージンをとるcssを示す。
p::first-letter { margin-left: 1em;}
