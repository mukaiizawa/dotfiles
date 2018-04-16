jQuery

# 概要
jQueryの個人的によく利用するメソッドをまとめる。

# addClass()
すべての要素にCSSクラスを追加する。

すべてのp要素のclass属性値にclass1を追加する例を示す。
    $("p").addClass("class1")

## 参照
removeClass()

# attr()
要素の属性値の取得、設定を行う。

一番最初のimg要素のsrc属性の値を取得する例を示す。
    $("img").attr("src");

一番最初のimg要素のsrc属性に値foo.pngを設定する例を示す。
    $("img").attr("src", "foo.png");

仕様によりinputのvalue属性や、
任意の要素の任意の属性値の参照設定が可能だが、
それぞれ専用のval(), addClass()/removeClass()が推奨されている。

## 参照
removeAttr()
val()
addClass()
removeClass()

# get()
jQueryオブジェクトの持つエレメントすべてを配列で返す。

## 指定したjQueryオブジェクトのテキストを配列で取得
    $(this)
    .find('.class')
    .map(function(i, e) {
      return $(e).text();
    })
    .get()

# hasClass()
すべての要素のうち、指定したCSSクラスを持つ要素が1つでもあれば真を返す。

p要素のうち、CSSクラスにclass1を持つものがある場合に処理を行う。
    if ($("p").hasClass("class1")) {
        ...
    }

## 参照
removeClass()

# hide()
各要素のうち表示状態にあるものを非表示状態にする。
要素がすでに非表示になっている場合は何も起こらない。

## クリックした対象を非表示にする
    $('selector').on("click", function() {
      $(this).hide();
    });

## 参照
show()

# html(), html(val), html(function)
指定した要素のHTMLの取得、書き換えをする。

次のコードは指定した要素のHTML取得する。

対象となるのはセレクタのすべての子要素であることに注意。

また、指定した要素は含まない。対象要素が複数ある場合は最初の要素のみ対象となる。
    $(this).html();

## 指定した要素にHTMLを設定
対象となるのはセレクタのすべての子要素であることに注意。
また、指定した要素は含まない。
    $(this).html(val);

またコールバック関数を指定することにより、
その返り値を設定することができる。
    $(this).html(function () {
      return val;
    });

## 参照
text()

# length
lengthプロパティはjQueryオブジェクトの要素数を返す。

dir要素の数を取得する例を示す。
    $("dir").length

## 注意事項
- lengthはメソッドではない。
- size()は1.8で非推奨となった。

# map(function)
jQueryオブジェクトの持つエレメントの集合を別のエレメントの集合に写像する。

メソッドチェーンでの中間操作に使える。

次のコードは指定したjQueryオブジェクトのエレメントの集合をテキストの集合に写像する。
    $(this).map(function (i, e) {
      return $(e).text()
    });

# prev(), prev(expr)
要素集合の各要素の直前の要素をすべて抽出する。

引数には条件式を指定し、結果セットから更に絞込みを行うことも可能。

次のコードはクリックされた要素の直前の要素にCSSクラスを追加する。
    $("button").on("click", function () {
      $(this).prev().addClass("added");
    })

## 参照
prevAll()
next()
parent()

# removeAttr()
指定した属性を削除する。

removeAttr(name)で属性nameを削除する。

idがidの要素からsrc属性を削除する例を示す。
    $("#id").removeAttr("src")

## 参照
attr()

# removeClass()
すべての要素から指定したCSSクラスを削除する。

すべてのp要素のclass属性値からclass1を削除する例を示す。
    $("p").removeClass("class1")

## 参照
addClass()

# show()

各要素のうち非表示状態にあるものを表示状態にする。

要素がすでに表示になっている場合は何も起こらない。

クリックした対象を非表示にする例を示す。
    $('selector').on("click", function () {
      $(this).hide();
    });

## 参照
hide()

# text(), text(val), text(function)
指定した要素のtextの取得、書き換えをする。

また、複数要素がある場合は実装依存（改行やスペース）で結合が行われる。

次の例は、指定したjQueryオブジェクトのテキストを配列で取得する。

対象要素が複数存在する場合はすべてのtextを結合して値を返す。
    $(this).text()

次の例は、指定したjQueryオブジェクトにテキストを設定する。

対象要素が複数存在する場合はすべての対象にtextを設定する。また、挿入されるtextはHTMLエスケープされることに注意。
    $(this).text(val)

htmlと同様にコールバック関数の返り値を用いて値を設定することも可能。
    $(this).text(function () {
      return val;
    })

## 参照
html()
