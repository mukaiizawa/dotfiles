Interface Stream<K,V>

java.lang.Object
  java.util.stream

# 概要
java8で追加されたStreamのAPIを用いることにより、
streamを実装しているクラスを用いる際に従来のコードを簡略化できることがある。

# Streamの生成方法
## 文字列から生成
    "foo".chars();
## Listから生成
    list.stream();
##  配列から生成
    Arrays.stream(arr);
## Mapから生成
    map.entrySet().stream();
Mapから生成されるstreamの型はStream<Entry<...>>であり、他と異なることに注意。
なお、stream中ではgetKey()とgetValue()を用いてMapのキーと値にアクセスする。
## Streamクラスのofメソッドから作成
    Stream.of("a", "b", "c")

# 中間操作
## 写像
mapを使用すると、すべての要素を写像できる。
    stream
      .map(x -> x * 2)
      .collect(Collectors.toList());
上の例は、すべての要素を二倍する。

## ソート処理
soretedにComparatorを渡すことにより、その条件でソートを行うことができる。
### ソートキーを指定する関数の指定によるソート
Comparator.comparing()
comparingは関数型を引数に受け取るため、
複数のシンタックスを用いることができる。
メソッド参照形式を用いた記述例を以下に示す。
    stream
      .sorted(Comparator.comparing(Car::getSpeed))
ラムダ式を用いた記述例を以下に示す。
    stream
      .sorted(Comparator.comparing(x -> x.getStr().length()))
### デフォルトのソート条件によるソート
Comparatableを実装済みのクラスのstreamをソートするときは
- Comparator.naturalOrder(): 昇順
- Comparator.reverseOrder(): 降順 
を用いることができる。
### ソート順の反転
reversedによりソートの逆順を指定できる。
    stream
      .sorted(Comparator.comparing(x -> x.getStr().length()).reversed())
      .collect(Collectors.toList());
### ソート条件の追加
thenComparingによりソート条件を追加できる。
    stream
      .sorted(Comparator.comparing(x -> x.getStr().length())
        .thenComparing(x -> x.getStr2().length())
        .thenComparing(...)
        ...)
      .collect(Collectors.toList());
下のようにメソッド参照を用いた書き方も可能
      .sorted(
          Comparator
          .comparing((Somethig x) -> x.getStatus().getCd())
          .thenComparing(Comparator.comparing(Somethig::getOne).reversed())
          .thenComparing(Comparator.comparing(Somethig::getTwo)))

## フィルタ処理
filterは写像後の値が真になるデータのみ抽出する。
例ではオブジェクトのlengthメソッドが5よりも大きいオブジェクトが抽出される。
    stream
      .filter(x -> x.length() > 5)
      .collect(Collectors.toList());
## 重複の除去
    Stream<T> distinct()
このストリームの重複を取り除いたストリームを返す。
比較は`equals`で行われる。

# 終端操作
## コレクションの生成
### Listの生成
あるオブジェクトのリストからそのオブジェクトのプロパティのリストを生成する例を示す。
    stream
      .map(x -> x.getMember1())
      .collect(Collectors.toList()));
#### MapからListの生成
MapからListへの変換はよくあるため、ここに記す。
値がtrueのキーからなるListの生成例
    map    // Map<String, Boolean>
      .entrySet()
      .stream()
      .filter(x -> x.getValue())
      .map(x -> x.getKey())
      .collect(Collectors.toList()));
### Mapの生成
あるオブジェクトのリストからメンバAをキーに、メンバBを値に持つマップを作成する例を示す。
    stream
      .collect(Collectors.toMap(x -> x.getA(), y -> y.getB()));
### グルーピング化してMapへ
streamの構成要素
あるオブジェクトのリストからオブジェクトのメンバの値でグルーピングした
マップを返す例を示す。
    list
      .stream()
      .collect(Collectors.groupingBy(x -> x.getId()));

## 値の集約
### 最初の要素の取得
    Optional<T> findFirst()
streamの最初の要素を返す。

### 畳み込み
reduceメソッドを用いて畳み込み処理が行える。
畳み込みを行うには初期値を指定する場合はとそうでない場合の二通りの方法がある。
#### 初期値を指定した畳み込み
    <U> U reduce(U identity, BiFunction<U,? super T,U> accumulator
        , BinaryOperator<U> combiner)
最初の引数はいわゆるLispにおける:initial-valueのような振る舞いをする。
    stream
      .reduce("", (x1, x2) -> x1 + "," + x2);
初期値を指定することにより、streamの要素が全くない場合も単位元が返る。
#### 初期値を指定しない畳み込み
    Optional<T> reduce(BinaryOperator<T> accumulator)
最初の引数を指定しない場合Optionalが返る。
orElse(T)を用いることにより、
単位元を指定した時のreduceの振る舞いと同じようにすることもできる。
    stream
      .reduce((x1, x2) -> x1 + "," + x2)
      .orElse("");

### 要素数のカウント
    long count()
このストリームの要素の個数を返す。

### 最大値、最小値の取得
    Optional<T> max(Comparator<? super T> comparator)
    Optional<T> min(Comparator<? super T> comparator)
最大/最小値はそれぞれmax/minを用いて取得できる。
数字の文字のstreamから最大の数字を取得する例を示す。
    stream
      .map(x -> Integer.parseInt(x))
      .min(Comparator.naturalOrder());

### 条件に一致する要素の有無の判定
    boolean anyMatch(Predicate<? super T> predicate)
    boolean noneMatch(Predicate<? super T> predicate)
anyMatchはこのストリームのいずれかの要素が、
指定された述語に一致するか否かを返す。
noneMatchは指定された述語に一致する要素が、
このストリーム内に存在しないか否かを返す。
