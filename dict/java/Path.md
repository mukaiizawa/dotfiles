Interface Path

java.nio.file

All Superinterfaces:
- Comparable<Path>
- Iterable<Path>
- Watchable

# 概要
Pathはファイルシステム内のファイルを特定するために使用可能なオブジェクトである。
特定したPathに対する操作はともにFilesクラスで用意されている。
version1.7で追加された。

# Pathインスタンスの生成
Pathはインターフェースであり、コンストラクタはない。
主なインスタンスの生成はPathsクラスのstaticなgetメソッドを使用する。
    static Path get(String first, String... more)
引数をファイルシステムのパス区切り文字で結合する。
例えば`/foo/bar/buzz`といったパスを表す場合。
    Path path = Paths.get("/foo", "bar", "buzz")
のようにして生成する。

# ファイル名称の取得
    Path getFileName()
getFileNameはこのオブジェクトのファイル名称を取得する。
このオブジェクトがディレクトリを表している場合は、ディレクトリ名称を取得する。

# 親ディレクトリの取得
    Path getParent()
getParentはこのオブジェクトの親ディレクトリを取得する。
このオブジェクトに親ディレクトリがない場合はnullを返す。

# ルートディレクトリの取得
    Path getRoot()
getRootはこのオブジェクトのルートディレクトリを取得する。
このオブジェクトがルートを持たない場合はnullを返す。

# 絶対パスか判定
    Path isAbsolute()
このオブジェクトが絶対パスか判定する。

# 絶対パスか判定
    Path isAbsolute()
このオブジェクトが絶対パスか判定する。

# パスの結合
    Path resolve(Path other)
    Path resolve(String other)
resolveはこのオブジェクトの子として、otherを結合する。
otherが文字列の場合はPathに変換してから結合を行う。

# 文字列取得
    String toString()
toStringはこのオブジェクトの文字列表現を取得する。
このPathオブジェクトを生成したときの文字列と必ずしも一致するとは限らない。

# ファイルオブジェクト取得
    File toFile()
toFileはこのオブジェクトをFileオブジェクトに変換する。
ただし、`File toPath()`により生成されたPathオブジェクトが
必ずしも、もとのFileオブジェクトと一致するとは限らない。
