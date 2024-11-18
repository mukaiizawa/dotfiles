コードスニペット

# 変数
## 代入
変数に値を代入するには、SETコマンドを使用する。

  SET VAR=hello world

`=`の間にスペースを挟むとそれ自身を含む値が代入される。

## 参照
変数の値の参照は`%<変数名>%`で行う。ただし、後述する理由で`!<変数名>!`を使用したほうがよい。

# 条件分岐
## IF
IFの使用例を示す。

    IF "x!VAR!"=="x" (
        ...
    )

不可解な動作に悩まされないように上記の記法を用いること。

## IF ELSE

    IF <test> (
        ...
    ) ELSE (
        ...
    )

## ELSE IF

    IF <test> (
        ...
    ) ELSE IF <test> (
        ...
    ) ELSE IF <test> (
        ...
    ) ELSE (
        ...
    )


## NOT
NOTは真偽値を反転させる。

    IF NOT <test> (
        ...
    )

## and / or
バッチファイルにはandやor演算子が存在しない。

そのためIF文を組み合わせるか、GOTO文を使用して同等の処理を行う必要がある。

# カレントディレクトリの取得
カレントディレクトリは環境変数CDに保持されている。

    $ ECHO %CD%
    C:\

# バッチファイルの起動ディレクトリ
バッチファイルの起動ディレクトリは次の変数で保持されている。

    %~DP0

バッチファイル起動時にCDと組み合わせて現在のディレクトリに移動しておくと便利。

    CD /D %~DP0

# コマンドライン引数
## コマンドライン引数の指定
バッチファイルを起動時に半角スペース区切りでコマンドライン引数を渡すことができる。

    cmd arg1 arg2...

コマンドライン引数の区切り文字は半角スペースのほかにも次のものがある。

- セミコロン(;)
- カンマ(,)
- 等号(=)

引数に区切り文字を含めたい場合はダブルクオーテーションでくくる必要がある。

    cmd "arg1" "arg2"...

コマンドライン引数は環境変数

    %0, %1, ...

から取得できる。ただし`%0`は実行中のバッチファイル名称が格納される。

## コマンドライン引数の確認
次のようにしてコマンドライン引数が空でないか確認できる。

    IF "x%1"=="x" (
      ECHO Error -- require arguments
      GOTO usage
    )

# モジュール化
次のようにgoto式を利用すると処理のモジュール化ができる。

    CALL :Foo
    CALL :Bar
    EXIT 0
        ...
    :Foo
    ECHO 1
    EXIT /B 0
    :Bar
    ECHO 2
    EXIT /B 0

EXITに/Bフラグを付けることにより、呼び出し元に戻れる。

# 終了状態の確認
直前のコマンドの終了状態は次のようにして取得できる。

    IF NOT %ERRORLEVEL% == 0 (
        ECHO ERROR OCCURED
        PAUSE
        EXIT 1
    )

次のように終了ラベルを定義して、GOTOでジャンプすると可読性が高くなる場合もある。

    prog1
    IF NOT %ERRORLEVEL% == 0 goto exit1
    prog2
    IF NOT %ERRORLEVEL% == 0 goto exit1
        ...
    ECHO succeed.
    :exit1
    ECHO failed.

# ファイルの存在確認

    SET FILENAME="test.txt"
    IF EXIST %FILENAME% (
        GOTO FILE_EXISTS
    )
    ...
    :FILE_EXISTS
    ECHO Not Found

# 実行可能パスの確認
javaにパスが通っているか確認する例を示す。

    WHERE /Q java.exe
    IF NOT %ERRORLEVEL% == 0 (
      ECHO required java.exe
      PAUSE
      EXIT 1
    )

# 環境変数の永続化
SETXを利用すると永続的な環境変数の更新を行える。

SETXの利用には管理者権限が必要。

    SETX /M JAVA_HOME "C:\Program Files\Java\jdk1.8.0_92"
    SETX /M PATH "%PATH%;C:\Program Files\Java\jdk1.8.0_92\bin"

# 対話型
次のようにgoto文を使用して指定した値が入力されるまでプロンプトを出せる。

    :HOME
    ECHO execute ? y/n
    SET /p c=
    IF "%c%"=="y" GOTO CONTINUE
    IF "%c%"=="n" GOTO END
    ECHO illegal value
    GOTO HOME
    :END

# リダイレクト
## 標準エラー出力のリダイレクト
以下のようにして、標準エラー出力をファイルや、標準出力へリダイレクトできる。

    $ prog > stdout.txt 2> stderr.txt
    $ prog > log.txt 2>&1

## nulデバイスへのリダイレクト
以下のようにしてnulデバイスへリダイレクトするとquietモードのような振る舞いを実現可能。

    $ del *.pdf > nul 2>&1

# 日付と時刻
日付と時刻はそれぞれ環境変数`DATE`と`TIME`から取得できる。

    $ ECHO %DATE%
    2023/11/16
    
    $ ECHO %TIME%
    11:57:54.43

各種値は次のように取得できる。

    SET WKDATE=%DATE:/=%
    SET WKTIME=%TIME: =0%
    SET YYYY=%WKDATE:~0,4%
    SET YY=%WKDATE:~2,2%
    SET MM=%WKDATE:~4,2%
    SET DD=%WKDATE:~6,2%
    SET HH=%WKTIME:~0,2%
    SET MI=%WKTIME:~3,2%
    SET SS=%WKTIME:~6,2%
    SET DATETIME=%YYYY%-%MM%-%DD% %HH%:%MI%:%SS%

## 午前中の判定

    if %TIME:~0,2% LEQ 12 goto end
    start xxx
    :end
