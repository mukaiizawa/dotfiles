PHPチュートリアル

# 概要
PHPはWeb開発に特化した汎用スクリプト言語でHTMLに埋め込むことも可能。

# コード埋込
PHPのコードをHTML内に埋め込むにはスクリプトを`<?php`と`?>`で挟む。
ただし、PHPのコードのみ記述する場合は末尾の`?>`を省く。

# コメント
## 一行コメント
`#`または`//`から行末まではコメントと見做される。

## 複数行コメント
`/*`と`*/`の間の文字列はコメントと見做される。

# 変数
## 変数名
変数は`$`から始まる英数字とアンダースコアで命名する。

## 代入
代入は代入演算子`=`で行う。
    $var = 1 + 1;

# 数値
## 四則演算
    $sum = 1 + 1;
    $sub = 1 - 1;
    $mul = 1 * 1;
    $div = 1 / 2;
    $fdiv = intval(3 / 2);
    $mod = 3 % 2;
PHPにはインクリメント、デクリメント演算子もある。
    $i++;
    $i--;

# 文字列
## 文字列リテラル
シングルクォートかダブルクォートで囲まれた文字の列は文字列リテラルと見做される。
ただし、ダブルクォート内ではエスケープシーケンスが使用可能。

## 変数展開
文字列内で変数が現れた場合、文字列の中で変数が展開されて結合される。
    $i = 0;
    $str = "a + b = $i";    // "a + b = 0"
ただし、可読性の問題から一般には`{`と`}`で囲む表記を用いる。
    $str = "a + b = {$i}";

## 文字列結合
文字列の結合は`.`演算子で行う。
    $join1 = 'aaa' . 'bbb';

ある配列をデリミタで結合する場合はimplode関数を使用する。
    $join2 = implode(',', array('aaa', 'bbb', 'ccc'));

## 内部文字エンコーディング
内部文字エンコーディングの指定、取得にはmb_internal_encoding関数を使用する。
    mb_internal_encoding("UTF-8");
    mb_internal_encoding();

内部エンコーディング指定時に無効な文字列が渡された場合はfalseが返る。

PHPのマルチバイト文字列のための関数群`mb_...`のうちのいくつかは、最後の省略可能な引数にエンコーディングを指定するための引数が存在するものがある。

## 文字列の長さ取得
文字列の長さ取得はstrlen関数を使用する。
    $length = strlen('abcdef');
    $mb_length = mb_strlen('あいうえお');

## 部分文字列の取得
部分文字列を取得するにはsubstr関数を使用する。
    $substr = substr('abcd', 0, 2);    // => 'ab'
    $substr = mb_substr('あいう', 0, 2);    // => 'あい'

## 文字の取得
文字列から指定した場所の文字を取得するには鍵括弧を用いる。
    $c = "abc"[0]

## 検索
strposは最初にマッチした文字の位置を返す。ただし、文字の数は零から数える。
    $index = strpos('abcd', 'bc');
 
# 条件分岐
ifで条件分岐を行う。
     if (expr) {
         // then
     }

偽の場合に評価する式がある場合はelse節を使用する。
    if (expr) {
        // then
    } else {
        // else
    }

多段分岐する場合はelse ifを使用する。
    if (expr) {
        // ...
    } else if (expr) {
        // ...
    } else {
        // ...
    }

それぞれ条件分岐後の式が単文の場合は括弧を省略可能。

# 反復
## while文
whileは条件式が真の間文を実行する。
    while (expr) {
        // ...
    }

## for文
whileより反復条件を細かく制御するときはforを使用する。
    for (init_expr; continue_clause; update_clause) {
        body_form
    }
    init_expr -- 初期化式
    continue_clause -- 継続判定式
    update_clause -- 更新式
    body_form -- 反復処理本体
forは最初に一度だけ初期化式を実行する。その後、継続判定式が真ならば本体を実行して更新式を実行する。という処理を繰り返す。

# foreach
foreachは連想配列の各要素について反復する。
    foreach ($array as $v) {
          // $v が要素の値
    }
    foreach ($array as $k => $v) {
          // $k が要素のキー、$v が要素の値
    }

# 関数
functionで関数を定義する。
    function sum($v1, $v2) {
      return $v1 + $v2;
    }
    $total = sum(1, 2); // $total = 3
