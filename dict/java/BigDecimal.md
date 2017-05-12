Class BigDecimal

java.lang.Object
  java.lang.Number
    java.math.BigDecimal

# 概要
BigDecimalは変更が不可能な、任意精度の符号付き小数を表す。
BigDecimalは、任意精度の「スケールなしの整数値」と、
32ビット整数の「スケール」で構成される。
BigDecimalで表される数値は(unscaledValue×10-scale)となる。
また、演算する際の丸めのモードを指定することができる。
丸めモードの指定にはRoundingMode enum(RoundingMode.HALF_UPなど)の列挙型をしようすること。
同じ数値でも表現が異なる(スケールが異なる)可能性があるため、
算術および丸めの規則は、数値的な結果と、結果の表現に使用するスケールの両方を指定する必要がある。

# 丸めに用いるenum
以下に主要な丸めモードを示す。
RoundingMode.CEILING 天井関数による丸めを行う。
RoundingMode.DOWN 切り捨てによる丸めを行う。
RoundingMode.FLOOR 床関数による丸めを行う。
RoundingMode.HALF_DOWN 五捨六入による丸めを行う。
RoundingMode.HALF_EVEN いわゆる銀行丸めを行う。
RoundingMode.HALF_UP 四捨五入による丸めを行う。
RoundingMode.UP 切り上げによる丸めを行う。

# BigDecimalに備わる定数
static BigDecimal ZERO 0を表す。
static BigDecimal ONE 1を表す。
static BigDecimal TEN 10を表す。

# 丸めの例
特定の丸めモードで入力を1桁に丸めた結果を示す。

INPUT UP DOWN CEILING FLOOR HALF_UP HALF_DOWN  HALF_EVEN
--------------------------------------------------------
 5.5   6   5    6       5     6         5         6
 2.5   3   2    3       2     3         2         2
 1.6   2   1    2       1     2         2         2
 1.1   2   1    2       1     1         1         1
 1.0   1   1    1       1     1         1         1
-1.0  -1  -1   -1      -1    -1        -1        -1
-1.1  -2  -1   -1      -2    -1        -1        -1
-1.6  -2  -1   -1      -2    -2        -2        -2
-2.5  -3  -2   -2      -3    -3        -2        -2
-5.5  -6  -5   -5      -6    -6        -5        -6
 
# BigDecimalの生成
以下に主要なコンストラクタを示す。
文字列から生成することが多い。
また、doubleから生成することは推奨されていない。
BigDecimal(int val)
BigDecimal(String val)

# 演算
## スケールの設定
BigDecimal setScale(int newScale)
BigDecimal setScale(int newScale, RoundingMode roundingMode)
スケールのみの設定、スケールと丸めモードの同時指定ができる。
## 加算
BigDecimal add(BigDecimal augend)
## 減算
BigDecimal subtract(BigDecimal subtrahend)
## 乗算
BigDecimal multiply(BigDecimal multiplicand)
## 除算
除算実行時にはスケールと丸めモードを指定すること。
BigDecimal divide(BigDecimal divisor, RoundingMode roundingMode)
BigDecimal divide(BigDecimal divisor, int scale, RoundingMode roundingMode)  
## 剰余
BigDecimal remainder(BigDecimal divisor)

# 値の比較を行う
値の比較にはcompareToメソッドを用いる。
int compareTo(BigDecimal val)
このBigDecimalの数値がvalより小さい場合は-1、等しい場合は0、大きい場合は1を返す。

# 絶対値取得
BigDecimal abs()

# 文字列に変換
BigDecimalには3つの表示用のメソッドが用意されている。
String toEngineeringString(): 指数が必要な場合、技術表記法で、このBigDecimalの文字列表現を返す。
String toPlainString(): 指数フィールドなしで、このBigDecimalの文字列表現を返す。
String toString(): 指数が必要な場合、科学表記法で、このBigDecimalの文字列表現を返す。
## 実行例
input       toPlainString()  toString()  toEngineeringString()
--------------------------------------------------------------
0                 0             0                0
0.0               0.0           0.0              0.0
0.000001          0.000001      0.000001         0.000001
0.0000001         0.0000001     1E-7           100E-9
0.0000001234      0.0000001234  1.234E-7       123.4E-9