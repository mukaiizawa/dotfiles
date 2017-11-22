Optional<T>

java.lang.Object
  java.util.Optional<T>

# 概要
null値を持ちうる値を表すコンテナクラス。nullをより安全に用いるためのメソッドが定義されている。

# インスタンスの取得
    static <T> Optional<T> empty()
    static <T> Optional<T> of(T value)
    static <T> Optional<T> ofNullable(T value)
このクラスには公開されたコンストラクタが存在しないためstaticメソッドを用いてインスタンスを取得する。
emptyはnullを表すOptionalオブジェクトを取得する場合に使用する。
ofは引数が非nullであることが分かっている場合に使用する。引数がnullの場合はNullPointerExceptionが発生する。
ofNullableは引数がnullの場合にはemptyの結果を、そうでなければofの結果を返す。

# 値の取得
    T get()
    T orElse(T other)
    T orElseGet(Supplier<? extends T> other)
    <X extends Throwable> T orElseThrow(Supplier<? extends X> exceptionSupplier)
このオブジェクトが保持している値がnullをである可能性の有無などによりメソッドを使い分けることになる。
get、orElseThrowはこのオブジェクトが非null値を表していると期待される場合に使用する。
orElse、orElseGetはnull値を含みうる場合に使用する。

getはこのオブジェクトの表す値を返す。ただし、このオブジェクトがnullを表していた場合はNoSuchElementExceptionを投げる。
orElseはこのオブジェクトが非null値を表していた場合はその値を、そうでなければ引数を返す。
orElseGetは引数にSupplierを指定する点を除いてorElseと同じである。
orElseThrowはこのオブジェクトがnull値を表している場合に引数のオブジェクトを投げること以外getと同じである。
