Class Math

java.lang.Object
  java.lang.Math

# 概要
Mathは指数関数、対数関数、平方根、三角関数などの基本的な算術演算が実装されている。


# 定数
## 円周率
    static double PI
円周率にもっとも近いdouble値。
## ネイピア数
    static double E
ネイピア数にもっとも近いdouble値。

# 丸め処理
    static double ceil(double a)
    static double floor(double a)
    static long round(double a)
ceilは引数を引数の値以上で、負の無限大にもっとも近い整数値を返す。
floorは引数を引数の値以下で、正の無限大にもっとも近い整数値を返す。
roundは引数に最も近い整数を返す。

# 絶対値の取得
    static double abs(double a)
    static float abs(float a)
    static int abs(int a)
    static long abs(long a)
引数の絶対値を返す。

# 累乗の取得
    static double pow(double a, double b)
一つ目の引数を二つ目の引数で累乗した結果を返す。

# 最大値の取得
    static double max(double a, double b)
    static float max(float a, float b)
    static int max(int a, int b)
    static long max(long a, long b)
二つの引数のうち、大きい方を返す。

# 最小値の取得
    static double min(double a, double b)
    static float min(float a, float b)
    static int min(int a, int b)
    static long min(long a, long b)
二つの引数のうち、小さい方を返す。

# 乱数値の取得
    static double random()
0.0以上で1.0未満の値を返す。

# 対数関数
    static double log(double a)
    static double log10(double a)
logは引数の自然対数を返す。
log10引数の10を底とする対数を返す。

# 三角関数
    static double sin(double a)
    static double cos(double a)
    static double tan(double a)
指定された角度(ラジアン)の正弦、余弦、正接を返す。

# 逆三角関数
    static double asin(double a)
    static double acos(double a)
    static double atan(double a)
指定された値の逆正弦、逆余弦、逆正接を返す。

# 双曲線関数
    static double sinh(double x)
    static double cosh(double x)
    static double tanh(double x)
double値の双曲線正弦、双曲線余弦、双曲線正接を返す。
