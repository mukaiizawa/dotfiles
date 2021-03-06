string.h

# 概要
string.hには文字列操作に関する関数が収録されている。

# 文字列をコピーする
    char *strcpy(char *to, char *from)
`from`から`to`に文字列をコピーする。
`to`には終端文字が含まれている必要がある。
また`from`にはヌル文字もコピーされるため、
バッファーオーバーフローに注意する必要がある。

# 文字列を比較する
    int strcmp(const char *s1, const char *s2);
    int strncmp(const char *s1, const char *s2, size_t n);
`strcmp`は文字列`s1`, `s2`を比較する。
`s1`と`s2`の関係により、次の値が返される。
- s1 < s2 => 負の数
- s1 = s2 => 0
- s1 > s2 => 正の数
`strncmp`は先頭から`n`文字のみ比較すること以外`strcmp`と同じである。

# 文字列から文字列を検索
    char *strstr(const char *s1, const char *s2);
文字列s1から部分文字列s2を検索する。
s1に部分文字列s2が存在する場合は、
最初にマッチしたs2へのポインタを返す。
そうでなければNULLが返る。

# 文字列から文字を検索
    char *strchr(const char *s1, char c);
文字列s1から文字cを検索する。
s1に文字cが存在する場合は、
最初にマッチしたcへのポインタを返す。
そうでなければNULLが返る。

# 文字列の長さを取得
    size_t strlen(const char *s);
sが指す文字列の長さを取得する。
取得する文字列の長さに終端文字は含まない。

# 文字列の連結
    char *strcat(char *s1, char* s2);
strcatはs2が指す文字列のコピーをs1が指す文字列の最後に付加する。
s1の終端文字から書き始め、s2の終端文字まで書き込む。
s1へのポインタを返す。
