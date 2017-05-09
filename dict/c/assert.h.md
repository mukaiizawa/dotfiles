assert.h

# 概要
assert.hにはassertマクロが定義されている。

# DEBUG時エラー通知
    void assert(int expr)
assertはexprが偽の場合にプログラムの実行を終了し、
assertが呼ばれた場所を表示する。
マクロ定義`#define NDEBUG`が定義されている場合は動作しない。
