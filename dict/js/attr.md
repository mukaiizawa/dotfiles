attr()

# 概要
要素の属性値の参照、更新ができる。

# 使用例
## 指定した属性の値の取得
attr(name)で最初の要素の属性nameの値を取得する。
一番最初のimg要素のsrc属性の値を取得する例を示す。
    $("img").attr("src")
## 指定した属性に値を設定
attr(name, val)で最初の要素の属性nameに値valを設定する。
一番最初のimg要素のsrc属性に値foo.pngを設定する例を示す。
    $("img").attr("src", "foo.png")

# 注意事項
仕様によりinputのvalue属性や、
任意の要素の任意の属性値の参照設定が可能だが、
それぞれ専用のval(), addClass()/removeClass()が推奨されている。

# 参照
removeAttr()
val()
addClass()
removeClass()
