math.h

# 概要
math.hには種々の算術関数が定義されている。

# 丸め処理
    double ceil(double n)
    float ceilf(float n)
    long double ceill(long double n)
    double floor(double n)
    float floorf(float n)
    long double floorl(long double n)
`ceil`、`floor`はそれぞれ引数の天井関数、床関数で丸めた値を返す。

# 対数の計算
    double log(double n)
    float logf(float n)
    long double logl(long double n)
    double log10(double n)
    float log10f(float n)
    long double log10l(long double n)
`log`、`log10`はそれぞれ引数の自然対数、常用対数を計算して返す。
