段組みの実装

# 概要
HTMLで段組みの実装には少々工夫がいる。
2段組みの実装とそれを応用した3段組みの実装を示す。

# 2段組み
2段組みのイメージを以下に示す。
+---------------------------------------+
|               header                  |
|---------------------------------------|
|                  |                    |
|                  |                    |
|                  |                    |
|                  |                    |
|      side        |       main         |
|                  |                    |
|                  |                    |
|                  |                    |
|                  |                    |
|---------------------------------------|
|               footer                  |
+---------------------------------------+

この構造を実現するための基本となるHTMLを示す。
<!DOCTYPE html>
<html>
  <head>
    <style>
.wrapper:after { clear:both; }
header, footer { display:block; height:50px; width:100%; background-color:#ddd }
.side { background-color:#aaa; }
.main { background-color:#888; }
    </style>
  </head>
  <body>
    <header>
      header
    </header>
    <div class="wrapper">
      <div class="side">
        side
      </div>
      <div class="main">
        main
      </div>
    </div>
    <footer>
      footer
    </footer>
  </body>
</html>
HTML5を用いない場合でも、divタグ等を用いて実装できる。

## 幅を固定して表示
body { margin:0 auto; width:700px; }
.side { float:left; width:150px; }
.main { float:left; width:550px; }
サイトの幅を絶対値で指定することにより、段組みを実装できる。
画面が崩れることはないが、横スクロールしないと閲覧できなくなる。

## 幅を可変にして表示
.side { float:left; width:150px; }
.main { margin-left:150px; }
メインコンテンツのみ可変にして2段組みを実装できる。

## コンテンツとサイドメニューの位置の入れ替え
.side { float:right; width:150px; }
.main { margin-right:150px; }
サイドメニューを右にフロートさせ、
メインコンテンツの右側にマージンをとることにより対応可能。
HTMLを書き換える必要がない。

### 左右にマージンを追加
body { margin:0 auto; width:80%; }
コンテンツの左右にマージンを入れたい場合、
その上位の要素(ここではbody)に値を設定すればよい。

# 3段組み
3段組みのイメージを以下に示す。
+---------------------------------------+
|               header                  |
|---------------------------------------|
|          |                 |          |
|          |                 |          |
|          |                 |          |
|          |                 |          |
|  left    |     center      |  right   |
|          |                 |          |
|          |                 |          |
|          |                 |          |
|          |                 |          |
|---------------------------------------|
|               footer                  |
+---------------------------------------+

3段組みは以下のHTMLで実装できる。

<!DOCTYPE html>
<html>
  <head>
    <style>
.wrapper:after { clear:both; }
header, footer { display:block; height:50px; width:100%; background-color:#ddd }
.side-left { float:left; width:150px;}
.side-right { float:right; width:150px; }
.side-right, .side-left { background-color:#aaa; }
.main { margin:0 150px; background-color:#888; }
    </style>
  </head>
  <body>
    <header>
      header
    </header>
    <div class="wrapper">
      <div class="side-left">
        left
      </div>
      <div class="side-right">
        right
      </div>
      <div class="main">
        main
      </div>
    </div>
    <footer>
      footer
    </footer>
  </body>
</html>

基本的には2段組みでの知識の応用である。
マークアップの順番がleft, right, mainの順になっていることに注意せよ。
