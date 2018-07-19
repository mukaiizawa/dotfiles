Tutorial date

# 基本
Date,
Calendar,
SimpleDateFormat,
Locale
辺りを理解していれば簡単な日付操作が可能。

java8以降が使用できる環境であれば、スレッドセーフなDateTimeFormatterを使用できる。

## 書式指定子
SimpleDateFormatにて以下の書式指定子が使用できる。

文字, 日付または時刻のコンポーネント,     例
-------------------------------------------------------------------------------
G,    紀元,                               AD
y,    年,                                 1996; 96
Y,    暦週の基準年,                       2009; 09
M,    年における月(状況依存),             July; Jul; 07
L,    年における月(スタンドアロン形式),   July; Jul; 07
w,    年における週,                       27
W,    月における週,                       2
D,    年における日,                       189
d,    月における日,                       10
F,    月における曜日,                     2
E,    曜日の名前,                         Tuesday; Tue
u,    曜日の番号(1 =月曜、...、7 =日曜),  1
a,    午前/午後,                          AM; PM
H,    一日における時(0 - 23),             0
k,    一日における時(1 - 24),             24
K,    午前/午後の時(0 - 11),              0
h,    午前/午後の時(1 - 12),              12
m,    分,                                 30
s,    秒,                                 55
S,    ミリ秒,                             978
z,    タイムゾーン,                       Pacific Standard Time; PST; GMT-08:00
Z,    タイムゾーン,                       -0800
X,    タイムゾーン,                       -08; -0800; -08:00

## 日付を文字列に変換する
new SimpleDateFormat("yyyyMMdd").format(new Date())
new SimpleDateFormat("GGGGy年", new Locale("ja", "JP", "JP")).format(new Date())
SimpleDateFormatのformatメソッドを用いて、
Dateオブジェクトを書式を指定して文字列に変換できる。
第2引数にロケールを渡すことにより、そのロケールに応じた出力が得られる。

## 文字列から日付に変換する
new SimpleDateFormat("yyyyMMdd").parse("19990101")
SimpleDateFormatのparseメソッドを用いて、
文字列から日付に変換することができる。
変換に失敗した時はParseExceptionが発生する。

# 応用
日付操作の基本的な事項を組み合わせることにより、様々な処理が可能。

## 西暦から和暦への変換
new SimpleDateFormat("GGGGy年M月d日", new Locale("ja", "JP", "JP")).format(
    new SimpleDateFormat("yyyyMMdd").parse("19990101"));
基本の内容を用いて和暦から西暦に変換する。
SimpleDateFormat.parseを用いて文字列からDateオブジェクトに変換する。
SimpleDateFormat.formatを用いてDateオブジェクトを指定した書式の文字列に変換する。
ここで、Localeを日本に指定し和暦に対応した変換ができる。
Gが4つ未満の場合は英字一文字で表示される。
GGGG: 平成
G: H
