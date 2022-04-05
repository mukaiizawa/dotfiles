MinGWのインストール

# MinGW の導入方法
MinGW の導入方法には、以下の方法がある。

    MinGW を直接インストールする (コマンドプロンプトから利用する場合)
    MSYS2 からインストールする (シェルなども含めて環境構築する場合)

MinGW は Windows に gcc などの開発環境を導入するものであるが、MSYS2 は bash などシェル周辺の Linux 環境を構築するものである。MSYS2 はパッケージマネージャを備えており、それを通して MinGW を導入することができる。

## install option

    Version:
        GCC のバージョン。特に理由がない限り最新版でいいだろう（2021-10-01 時点の最新は 8.1.0）
    Architecture:
        ターゲットシステムのアーキテクチャ。 i686 か x86_64 のいずれかを選択する。 x86_64 が64ビット版なのでご注意を
    Thread:
        スレッドモデル。
        posix:
             特に理由がないのであれば posix でいいだろう
        win32:
            win32 は Windows ネイティブ関数を使っていて速いのだが C++ 11 以降の thread, mutex, future が使えなくなる。
    Exception:
        例外処理ハンドリング。アーキテクチャによって以下を選択できる。
        i686
            dwarf :
                DWARF
            sjlj :
                SetJump/LongJump
        x86_64
            seh :
                Structured Exception Handling （Windows ネイティブ。おすすめ）
            sjlj :
                SetJump/LongJump

# オフラインインストール
オンラインインストーラーがエラーで実行できないことがある。

その場合、以下のURLからzipをダウンロードするとよい。

    https://sourceforge.net/projects/mingw-w64/files/
