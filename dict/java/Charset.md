Class Charset

java.lang.Object
  java.nio.charset.Charset

# 概要
このクラスには、デコーダやエンコーダを作成するメソッドや、
文字セットに関連付けられたさまざまな名前を取得するメソッドが存在する。
このクラスのインスタンスは不変である。

# インスタンスの取得
    public static Charset forName(String charsetName)
インスタンスを取得するにはコンストラクタを使用せずに文字列で指定する。
よく使いそうな文字コードを示す。
- UTF-8
- Shift_JIS
- windows-31j
java7以降は、標準で使用可能文字コードに限り、
StandardCharsetsクラスの定数を用いることができる。
    StandardCharsets.UTF_8
