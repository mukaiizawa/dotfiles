Class BigDecimal

java.lang.Object
  java.lang.Number
    java.math.BigDecimal

# 概要
BigDecimalは変更が不可能な、任意精度の符号付き小数を表す。

BigDecimalは任意精度の「スケールなしの整数値」と32ビット整数の「スケール」で構成される。

BigDecimalで表される数値は(unscaledValue×10-scale)となる。

また、演算する際の丸めのモードを指定することができる。

丸めモードの指定にはRoundingMode enum(RoundingMode.HALF_UPなど)の列挙型を使用すること。

同じ数値でも表現が異なる(スケールが異なる)可能性があるため、算術および丸めの規則は数値的な結果と結果の表現に使用するスケールの両方を指定する必要がある。

# 丸めに用いるenum
以下に主要な丸めモードを示す。
    値                     処理内容
    -------------------------------------------------
    RoundingMode.CEILING   天井関数による丸めを行う。
    RoundingMode.DOWN      切り捨てによる丸めを行う。
    RoundingMode.FLOOR     床関数による丸めを行う。
    RoundingMode.HALF_DOWN 五捨六入による丸めを行う。
    RoundingMode.HALF_EVEN いわゆる銀行丸めを行う。
    RoundingMode.HALF_UP   四捨五入による丸めを行う。
    RoundingMode.UP        切り上げによる丸めを行う。

# BigDecimalに備わる定数
    フィールド名           値
    ---------------------------------
    static BigDecimal ZERO 0を表す。
    static BigDecimal ONE  1を表す。
    static BigDecimal TEN  10を表す。

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
    BigDecimal(int val)
    BigDecimal(String val)
doubleを受け取るコンストラクタも存在するが、非推奨である。

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
    int compareTo(BigDecimal val)

値の比較には`compareTo`メソッドを用いる。

このBigDecimalの数値がvalより小さい場合は-1、等しい場合は0、大きい場合は1を返す。

# 絶対値取得
    BigDecimal abs()

# 文字列に変換
    String toEngineeringString()
    String toPlainString()
    String toString()
BigDecimalには3つの表示用のメソッドが用意されている。
上から順に次の処理を行う。
- 指数が必要な場合、技術表記法で、このBigDecimalの文字列表現を返す。
- 指数フィールドなしで、このBigDecimalの文字列表現を返す。
- 指数が必要な場合、科学表記法で、このBigDecimalの文字列表現を返す。
実行例を示す。

    input       toPlainString()  toString()  toEngineeringString()
    --------------------------------------------------------------
    0                 0             0                0
    0.0               0.0           0.0              0.0
    0.000001          0.000001      0.000001         0.000001
    0.0000001         0.0000001     1E-7           100E-9
    0.0000001234      0.0000001234  1.234E-7       123.4E-9

# 整数に変換
    int intValue()
    int intValueExact() throws ArithmeticException
intValueはこの値を整数値を取得する。
intValueExactはこの値が整数でない場合は、
エラーを発生させるという点を除いてintValueと同じである。
