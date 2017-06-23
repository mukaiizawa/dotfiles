prev(), prev(expr)

# 概要
要素集合の各要素の直前の要素をすべて抽出する。
引数には条件式を指定し、結果セットから更に絞込みを行うことも可能。

# 使用例
## クリックされた要素の直前の要素にCSSクラスを追加する
    $("button").on("click", function () {
      $(this).prev().addClass("added");
    })

# 参照
prevAll()
next()
parent()
