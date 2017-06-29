stdlib.h

# 概要
stdlib.hには汎用性の高い一般的な関数やマクロが定義されている。

# 領域の確保
    void *calloc(size_t n, size_t size)
    void *malloc(size_t size)
    void *realloc(void *ptr, size_t size);
`calloc`は大きさが`size`の`n`個の要素分の領域を確保し、
その領域を0で初期化する。
`malloc`は大きさが`size`バイトのメモリ領域を確保して返す。
ただし、確保した領域は0クリアされない。
`calloc`, `malloc`で確保した領域が不要になったら`free`で開放する必要がある。
返り値は確保したメモリ領域へのポインタである。
領域の確保に失敗した場合は`NULL`ポインタが返る。
`realloc`は`ptr`のメモリ領域を、 
指定したサイズに変更して再度割り当てる。
`ptr`が`NULL`の場合は`malloc`と同じ動作となる。
返り値は、メモリの領域の確保に成功した場合はその領域へのポインタ、
失敗した場合は`NULL`が返る。
ただし、成功時に返される領域はptrが指していた領域と同じであるとは限らない。

# メモリの解放
    void free(void *p)
`free`はポインタpがさすメモリ領域を解放する。
`p`が`NULL`の場合は何もしない。

# 文字列から数字に変換
    double atof(const char *string);
    int atoi(const char *string);
文字列から数値に変換するには`atoi`を用いる。
バッファーオーバーフローした場合の動作は未定義である。
`atof`を使用する場合は別途math.hをインクルードする必要がある。
数字から文字列へ変換が必要な場合にはstdio.hの`sprintf`を参照のこと。
