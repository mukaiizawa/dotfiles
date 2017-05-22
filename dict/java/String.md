Class String

java.lang.Object
  java.util.string

# 概要
Stringは文字列を表すクラスである。
ダブルクォートで囲まれた文字列リテラルはすべてStringクラスのインスタンスと見做される。
Stringはイミュータブルなクラスで、一度作成すると変更されることはない。

# 文字列の長さを取得
    int length()
返される長さはUnicode単位の長さとなる。

# 文字列を大文字/小文字に変換
    String toUpperCase()
    String toLowerCase()
レシーバを大文字/小文字に変換する。

# 文字列から文字の取得
    char charAt(int index)
文字列からindex番目の文字を取得する。
ただし、indexは0から数える。

# 文字列から文字のシーケンス取得
    public char[] toCharArray()
レシーバを文字の配列にして返す。

# 文字列から部分文字列の取得
    public String substring(int beginIndex)
    public String substring(int beginIndex, int endIndex)
substringはレシーバから部分文字列を取得する。
beginIndex, endIndexはそれぞれ0からカウントする。
endIndexを指定しない場合はbeginIndex以降の部分文字列が返される。
endIndexを指定した場合は、
beginIndexからendIndex-1までの部分文字列を返す。
したがって返される文字列の長さlengthは
length = endIndex - beginIndex
となる。

# 文字列の比較
    int compareTo(String str)
それぞれの文字列のUnicode値を用いて比較を行う。
レシーバがstrよりも辞書順的に前にある場合は負の値が返される。
等しい場合は0が返される。
レシーバがstrよりも辞書順的に後にある場合は正の値が返される。

# 文字列の検索
    boolean contains(CharSequence s)
    boolean matches(String regex)
containsはレシーバが文字のシーケンスを含む場合にtrueを返す。
そうでなければfalseを返す。
matchesは指定した文字列が正規表現と完全にマッチした場合にtrueを返す。
そうでなければfalseを返す。
matchesは部分一致ではtrueは返らないことに注意せよ。

# 文字列の置換
    String replaceFirst(String regex, String replacement)
    String replaceAll(String regex, String replacement)
    String replace(CharSequence target, CharSequence replacement)
replaceFirstとreplaceAllは正規表現を用いてマッチした文字列を置換する用途に使える。
replaceFirstはマッチした最初の部分文字列を置換するのに対して、
replaceAllはすべてのマッチした部分文字列を置換するという点で異なる。
replaceは正規表現を用いずにchar値のシーケンスからchar値のシーケンスへ変換する目的で使える。

# 文字列の分割
    String[] split(String regex)
    String[] split(String regex, int limit)
文字列を指定された正規表現に一致する位置で分割する。
一致する部分文字列がない場合は、長さが1のレシーバ自身を格納した配列となる。
limitは返される配列の長さの上限を表す。
limitに自然数が指定された場合は、長さがlimit以下の配列が返される。
このことは、分割はたかだかlimit-1回しか行われないことを意味する。
limitが負の場合は返される配列の長さは制限されない。
limitが0の場合は末尾にある空文字列が取り除かれる以外は負の場合と同じである。
limitを指定しないsplitはlimitに0を指定したsplitと同じ動作をする。

receiver, regex, limit, result
-----------------------------------------
"a:b:c",  ":",   -1,   ["a", "b", "c"]
"a:b:c",  ":",    0,   ["a", "b", "c"]
"a:b:c",  ":",    1,   ["a", "b:c"]
"a:b::",  ":",   -1,   ["a", "b", "", ""]
"a:b::",  ":",    0,   ["a", "b"]
"a:b::",  ":",    1,   ["a", "b::"]

# 文字列の結合
    static String join(CharSequence delimiter, Iterable<? extends CharSequence> elements)
elementsをdelimiterを用いて結合する。
    List<String> strings = new ArrayList<>();
    strings.add("Java");
    strings.add("is");
    strings.add("cool");
    String.join(" ", strings);
    => "Java is cool"
このメソッドはJava8以降にのみ使用できる。
elementがnullの場合は"null"が文字列に結合される。
