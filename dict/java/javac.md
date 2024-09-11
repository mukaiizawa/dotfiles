javac

# SYNOPSIS

    javac OPTIONS FILE ...

# OPTIONS

    -encoding ENCODING
        ソースコードのエンコーディングをENCODINGに指定する。

# EXAMPLES
ファイルエンコーディングがutf8のMain.javaをコンパイルする。

    $ javac -encoding utf8 Main.java

FILEには`@file`の形式で、コンパイルするファイルの一覧をファイルで指定することができる。
そのため、jarをコンパイルする場合になど有用である。

    # Unix
    $ find ./src/ -type f -name "*.java" > sources.txt
    # Windows
    $ where /r %basename% *.java > sources.txt
    $ javac -encoding UTF8 -classpath ./lib @sources.txt
