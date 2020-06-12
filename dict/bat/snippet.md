コードスニペット

# 概要
バッチファイルでよく使用する典型的なコード編を記述する。

# カレントディレクトリの取得
カレントディレクトリは環境変数CDに保持されている。

    > ECHO %CD%
    C:\

# バッチファイルの起動ディレクトリ
バッチファイルの起動ディレクトリは次の変数で保持されている。
    %~DP0

バッチファイル起動時にCDと組み合わせて現在のディレクトリに移動しておくと便利。
    CD /D %~DP0

# コマンドライン引数
バッチファイルを起動時に半角スペース区切りで
コマンドライン引数を渡すことができる。
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

# 終了状態の確認
直前のコマンドの終了状態は次のようにして取得できる。
    IF NOT %ERRORLEVEL% == 0 (
        ECHO ERROR OCCURED
        PAUSE
        EXIT 1
    )

また、次のように記述することにより、終了状態の確認を再利用可能。
    CALL :Foo
    CALL :CheckError
    EXIT 0
    REM ...
    :Foo
    REM ...
    :CheckError
    IF NOT %ERRORLEVEL% == 0 (
        ECHO ERROR OCCURED
        PAUSE
        EXIT 1
    )
    EXIT /B 0

EXITに/Bフラグを付けることにより、呼び出しもとに戻れる。

終了ラベルを定義して、GOTOでジャンプすると可読性が高くなる場合もある。

    IF NOT %ERRORLEVEL% == 0 GOTO end_batch

# パスの確認 
javaにパスが通っているか確認する例を示す。
    WHERE /Q java.exe
    IF NOT %ERRORLEVEL% == 0 (
      ECHO required java.exe
      PAUSE
      EXIT 1
    )

# 環境変数の永続化
SETXを利用すると永続的な環境変数の更新を行える。

SETXの利用には管理者権限が必要なので注意すること。
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
