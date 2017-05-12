map(function)

# 概要
jQueryオブジェクトの持つエレメントの集合を別のエレメントの集合に写像する。
メソッドチェーンでの中間操作に使える。

# 使用例
## 指定したjQueryオブジェクトのエレメントの集合をテキストの集合に写像
    $(this)
    .map(function(i, e) {return $(e).text()});