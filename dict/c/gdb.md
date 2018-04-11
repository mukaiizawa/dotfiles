gdbの使い方

# 概要
gdbはC言語のデバッガである。
ブレークポイント、変数値の表示等、
基本的なデバッグ機能を提供する。

# 使用方法
## プログラムのコンパイル
gdbを使用するには対象の実行可能ファイルを,
gオプションをつけてコンパイルする必要がある。
    $ gcc -g ...
なお、最適化オプションをつけたり、stripしてはいけない。

## gdbの実行
    $ gdb 実行ファイル
とするとgdbのreplが起動する。

### プログラムの実行
    (gdb) r[un] [コマンドライン引数]
runコマンドを使用してプログラムを実行する。
実行時にコマンドライン引数をしていすることも可能。

### ブレークポイントの指定
    (gdb) b[reaak] (行番号 | 関数名 | ファイル名':'行番号)
行番号または、関数名または、ファイル名と行番号を指定した、
ブレークポイントが設定可能。

### ブレークポイントの破棄
    (gdb) d[elete] (行番号 | 関数名 | ファイル名':'行番号)
deleteコマンドにより、設定したブレークポイントを破棄できる。
deleteに引数を与えない場合はすべてのブレークポイントを破棄する。

### ステップ実行
#### step
    (gdb) s[tep] [行数]
stepコマンドは指定行数文ステップ実行を行う。
次の行が関数呼び出しの場合はその関数内に入って中断する。

#### next
    (gdb) n[ext] [行数]
nextコマンドは次の行が関数呼び出しであるか否かに関わらず、
指定行数実行する点を除いてstepと同じである。

#### continue
    (gdb) c[ontinue]
次のブレークポイントに到達または、プログラムが終了するまで実行を行う。

### 変数の表示
    (gdb) p[rint] 変数名
printコマンドを用いて現在の変数の値を表示可能。

### バックトレースの表示
    (gdb) bt
bt(backtrace)コマンドを用いて、バックトレースを表示することができる。

## TUIモード移行
    (gdb) 1
TUIモードに移行

## gdbのhelp
    (gdb) help
gdbのヘルプが確認できる。

# lldbについて
lldbという、gdbに取って代わる次世代のデバッガがある。
以下、[公式サイト](https://lldb.llvm.org/)より引用。
> LLDB is a next generation, high-performance debugger.
> It is built as a set of reusable components which highly leverage existing
> libraries in the larger LLVM Project, such as the Clang expression parser and
> LLVM disassembler.
> LLDB is the default debugger in Xcode on Mac OS X and supports debugging C,
> Objective-C and C++ on the desktop and iOS devices and simulator.
> All of the code in the LLDB project is available under the standard LLVM
> License, an open source "BSD-style" license.
