Pythonチュートリアル

# 概要
プログラミング言語Pythonの機能を例を交えて述べる。

対象のPytonは3系とする。

# スクリプトファイルの実行法
Pythonのインタープリタにファイル名を渡すことにより、スクリプトファイルを実行することができる。

# 代入
`=`を用いることにより、左辺の変数に右辺の値を代入する。

    >>> x = 10
    >>> x
    10

# 算術演算

    >>> 1 + 2
    3
    >>> 1 - 2
    -1
    >>> 4 * 5
    20
    >>> 7 / 5
    1.4
    >>> 7 // 5
    1
    >>> 4 ** 2
    16

# 配列

    >>> a = [1, 2, 3, 4, 5]
    >>> a
    [1, 2, 3, 4, 5]
    >>> a[0]
    1
    >>> a[1] = 10
    >>> a
    [1, 10, 3, 4, 5]
    >>> len(a)
    5
    >>> a[0:2]
    [1, 10]
    >>> a[:3]
    [1, 10, 3]
    >>> a[3:]
    [4, 5]
    >>> a[:-3]
    [1, 10]

# 辞書

    >>> dic = {'key1': 1, 'key2': 2}
    >>> dic['key1']
    1
    >>> dic['key3'] = 3
    >>> dic
    {'key1': 1, 'key2': 2, 'key3': 3}

# 条件分岐
## 真偽値
Pythonでは次に列挙するオブジェクト以外はすべて真と見做される。

- None
- False
- 数値型の零
- 空のシーケンスまたはコレクション

また、それぞれの代表値`True`および`False`が定義されている。

## ブール演算子

    x or y
    x and y
    not x

## 比較演算子

    x < y
    x <= y
    x > y
    x >= y
    x == y
    x != y
    x is y
    x is not y

## if文

    if i < 3
        print("smaller than 3")
    elif i < 5:
        print("3 or more but smaller than 5")
    else:
        print("greater than 5")

# 反復
## for文

    for i in [0, 1, 2]
        print(i)

## 内包表記

    >>> [ x ** 2 for x in range(0, 10) ]
    [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

    >>> [ x ** 2 for x in range(0, 10) if x % 2 == 0 ]
    [0, 4, 16, 36, 64]

# 関数定義

    >>> def hello():
    ...     print("Hello Python")
    >>> hello()
    Hello Python
