stdio.h

# 概要
stdio.hには入出力関係の関数が定義されている。

# バッファのフラッシュ
    int fflush(FILE *fp);
fpが指すファイルポインタへの出力バッファをフラッシュする。
出力バッファ以外のファイルポインタを受け取った場合の動作は未定義。
引数がNULLの時はすべてのストリームに対してフラッシュを行う。
成功時は0を、そうでなければEOFを返す。

# 汎用出力
    int fprintf(FILE * restrict stream, const char * restrict format, ...);
fprintfはstreamにformatに従った書式で書き込みを行う。
書き込みに成功した場合は書き出された文字数を返す。
失敗した場合は負の数が返る。

# 標準出力に出力
    int printf(const char * restrict format, ...);
printfはfprintfのstreamに標準出力を指定したものと同じである。

# バッファに出力
    int sprintf(char * restrict s, const char * restrict format, ...);
sが指す領域に書き込む。
また、出力の最後には終端文字が含まれる。
sprintfの動作は出力がsが指す領域であることを除いてprintfと同じである。
ただし、返り値の書き込んだ文字数には終端文字を含めない。

# ファイル終端判定
    int feof(FILE *stream);
streamが指すストリームが終端に達しているか判定する。

# 変換指定子について
よく使うものを挙げる。
これですべてではない。
    指定子, 処理
    ----------------------------------------
    d, int 型の引数を 10 進符号付き整数に変換する
    u, unsigned int 型の引数を 10 進符号無し整数に変換する
    o, unsigned int 型の引数を 8 進符号無し整数に変換する
    x, unsigned int 型の引数を 16 進符号無し整数に変換する
    f, double 型の引数を小数形式浮動小数点数に変換する
    a, double 型の引数を 16 進浮動小数点に変換する
    c, int 型の引数を 一端 unsigned char 型に変換し，変換結果の文字を書き込む
    s, 文字配列の先頭要素へのポインタを文字列に変換する
    p, void 型へのポインタを処理系定義の方法で表示文字の並びに変換する
    n, 整数変数に出力済み文字数を格納する (引数は符号付き整数型へのポインタ)
    %, '%' を出力する
