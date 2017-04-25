stdlib.h

# 概要
stdlib.hには汎用性の高い一般的な関数やマクロが定義されている。

# 領域の確保
    void *calloc(size_t n, size_t size)
callocは大きさがsizeのn個の要素文の領域を確保し、
その領域を0で初期化する。
確保した領域が不要になったらfreeで開放する必要がある。
返り値は確保したメモリ領域へのポインタである。
領域の確保に失敗した場合はNULLポインタが返る。
なお、返り値は使用する方にキャストしてから使うこと。

# メモリの解放
    void free(void *p)
freeはポインタpがさすメモリ領域を解放する。
pがNULLの場合は何もしない。

# 文字列から数字に変換
    double atof(const char *string);
    int atoi(const char *string);
文字列から数値に変換するにはatoiを用いる。
バッファーオーバーフローした場合の動作は未定義である。
atofを使用する場合は別途math.hをインクルードする必要がある。
逆変換が必要な場合にはstdio.hのsprintfを参照のこと。
