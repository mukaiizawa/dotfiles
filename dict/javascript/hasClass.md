hasClass()

# 概要
すべての要素のうち、指定したCSSクラスを持つ要素が1つでもあれば真を返す。

# 使用例
## 指定したCSSクラスが存在するか判定する
p要素のうち、CSSクラスにclass1を持つものがある場合に処理を行う。
    if ($("p").hasClass("class1")) {
        ...
    }

# 参照
removeClass()
