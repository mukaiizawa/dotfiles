Pythonチュートリアル

# 概要
プログラミング言語Pythonの機能を例を交えて述べる。

記述にあたり、評価結果を便宜的に`=>`を用いて表す。

対象のPytonは3系とする。

# スクリプトファイルの実行法
Pythonのインタープリタにファイル名を渡すことにより、スクリプトファイルを実行することができる。

# 代入
`=`を用いることにより、左辺の変数に右辺の値を代入する。

    x = 10

# 真偽値
真偽値は`True`と`False`である。

    t = True
    t
    => True
    f = False
    f
    => False

演算子には`not`、`or`、`and`等がある。

    not t
    => False
    t and f
    => False
    t or f
    => True

# 算術演算
## 和
    1 + 2
    => 3

## 差
    1 - 2
    => -1

## 積
    4 * 5
    => 20

## 商
    7 / 5
    => 1.4

## 冪乗
    4 ** 2
    => 16

# 配列
## リテラル
    a = [1, 2, 3, 4, 5]
    => [1, 2, 3, 4, 5]

## 参照
    a[0]
    => 1

## 更新
    a[1] = 10
    a[1]
    => 1

# 長さ
    len(a)
    => 5

## スライス
    a[0:2]
    => [1, 2]
    a[:3]
    => [1, 2, 3]
    a[3:]
    => [4, 5]
    a[:-3]
    => [1, 2]

# 辞書
## リテラル
    dic = {'key1': val1, 'key2': val2}
    => {'key1': 1, 'key2': 2}

## 参照
    dic[key1]
    => 1

## 更新
    dic[key3] = 3
    dic
    => {'key1': 1, 'key2': 2, 'key3': 3}

# 条件分岐
    if True and True and True:
        print("true")
    else:
        print("false")
    => true

# 反復
    for i in [0, 1, 2]
        print(i)
    => 1
       2
       3

# 関数定義
    def hello():
        print("Hello Python")
    hello()
    => Hello Python
