Class Files

java.nio.file

java.lang.Object
  java.nio.file.Files

# 概要
このクラスは、Pathに対するstaticなメソッドで構成されている。
version1.7で追加された。

# ファイルからストリームへ書き出し
    static long copy(Path source, OutputStream out)
        throws IOException
すべてのバイトをファイルsourceから出力ストリームoutにコピーする。
書き込み中に入出力エラーが発生した場合はIOExceptionを投げる。
その場合は直ちに出力ストリームを閉じること。
読み込んだバイト数を返す。

# ストリームからファイルへ書き込み
    static long copy(InputStream in, Path target, CopyOption... options)
        throws IOException
すべての入力ストリームinをtargetへ書き込む。
このメソッドが正常終了した場合は、ストリームは終端をさす。
読み書き中にエラーが発生した場合はIOExceptionを投げる。
その場合、直ちに入力ストリームを閉じること。
デフォルトでは、コピー先にファイルが既に存在する場合はエラーとなる。
ただし、後述するコピーオプションを指定することにより上書き可能。
読み込んだバイト数を返す。

# ファイルからファイルへコピー
    static Path copy(Path source, Path target, CopyOption... options)
        throws IOException
ファイルsourceをファイルtargetにコピーする。
コピーオプションは上のcopyメソッドに同じ。

# ファイルの作成
    static Path createFile(Path path, FileAttribute<?>... attrs)
        throws IOException
新しい空のファイルを作成する。
ファイルがすでに存在する場合はFileAlreadyExistsExceptionを投げる。
作成したファイルを表すパスを返す。

# ディレクトリの作成
    static Path createDirectory(Path dir, FileAttribute<?>... attrs)
        throws IOException
    static Path createDirectories(Path dir, FileAttribute<?>... attrs)
        throws IOException
createDirectoryはdirが表すディレクトリを作成する。
dirよりも親のディレクトリが存在しない場合はエラーとなる。
createDirectoriesはdirを作成するために存在していなければならないディレクトリを
すべて作成してからdirを作成する。
createDirectoriesはdirを作成する前に、
途中のディレクトリの作成中に例外を投げることもある。
その場合、作成したディレクトリはそのままとなる。
作成したディレクトリを表すパスオブジェクトを返す。

# ファイルの削除
    static void delete(Path path)
        throws IOException
    static boolean deleteIfExists(Path path)
        throws IOException
deleteはファイルを削除する。
ファイルが存在しない場合はNoSuchFileExceptionが投げられる。
ファイルがシンボリックリンクだった場合はリンクのみ削除される。
ファイルがディレクトリの場合は、ディレクトリが空の場合のみ削除される。
空でないディレクトリは削除できないため、
再帰的にファイルを削除する場合は次のようにする必要がある。
ただし、使用するには`Files list`を使用するため、
version1.8以上でなければならない。
    public void deleteFiles(Path path) throws IOException {
      if(!Files.exists(path)) {
        return;
      } else if (Files.isDirectory(path)) {
        Files.list(path).forEach(child -> deleteFiles(child));
      }
      Files.delete(path);
    }
deleteIfExistsは削除するファイルが存在しなくても、
NoSuchFileExceptionを投げない点を除いてdeleteと同じである。
返り値は、削除したか否かを表す。

# ファイルの存在判定
    static boolean exists(Path path, LinkOption... options)
    static boolean notExists(Path path, LinkOption... options)
existsはこのファイルが存在するか判定する。
ファイルが存在する場合は真を返す。
この判定結果は動的なもので、後続の処理でも保証されるわけではない。
また、デフォルトではシンボリックリンクは辿られる。
ただし、ファイルの存在確認ができなかった場合は偽を返す。
notExistsは存在確認ができた場合はexistを否定した結果を返す。
ただし、exists同様、存在確認ができなかった場合は偽を返す。
以上をまとめると次のようになる。
    存在確認できたか否か 存在するか否か exists notExists
    ----------------------------------------------------
    true                 true           true   false
    true                 false          false  true 
    false                true           false  false
    false                false          false  false
存在の確認が出来たか否かによって結果が変わるため、
目的に応じて2つのメソッドを使い分ける必要がある。

# ファイルか判定
    static boolean isDirectory(Path path, LinkOption... options)
ファイルがディレクトリか否か判定する。
デフォルトではファイルがシンボリックリンクだった場合は辿る。

# ファイルサイズの取得
    static long size(Path path) throws IOException
ファイルのサイズをバイト数で返す。
pathがファイルでない場合は実装依存となる。

# ファイルの移動
    static Path move(Path source, Path target, CopyOption... options)
        throws IOException
ファイルsourceをファイルtargetへ移動する。
## 使用例
ファイルの名前を「newname」に変更する。
     Path source = ...
     Files.move(source, source.resolveSibling("newname"));
ファイルを新しいディレクトリに移動する。
同じファイルが既に存在していた場合は上書きする。
     Path source = ...
     Path newdir = ...
     Files.move(source, newdir.resolve(source.getFileName()), REPLACE_EXISTING);

# ファイルの読み取り
    static byte[] readAllBytes(Path path) throws IOException
    static List<String> readAllLines(Path path, Charset cs) throws IOException
readAllBytesはファイルを読み込み、byte型の配列として返す。
正常終了、異常終了に関わらずストリームは閉じる。
このメソッドは大きなファイルに対して使用してはならない。
readAllLinesはファイルを一行単位で読み込み、
その結果をリストとして返す点を除いてreadAllBytesと同じである。
readAllLinesは一行が長いファイルに対して使用してはならない。
version1.8の段階で改行と見做される文字は次の通り。
- `\u000D\u000A`(CRLF)
- `\u000D`(CR)
- `\u000A`(LF)

# Streamの作成
    static Stream<Path> list(Path dir) throws IOException
ディレクトリdir内のエントリを要素に持つ遅延設定Streamを返す。
dir内のPathがディレクトリを表す場合でも再帰的ではない。

# 指定するオプションについて
## LinkOption
    NOFOLLOW_LINKS
シンボリックリンクを辿らない。

## CopyOption
    REPLACE_EXISTING
ファイルが存在する場合は、
ファイルが空でないディレクトリでなければ置換する。
ファイルが存在し、シンボリックリンクである場合は、
リンクのターゲットではなくシンボリックリンク自身が置換される。
