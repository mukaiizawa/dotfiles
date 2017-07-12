Recipe Generic

# 概要
javaの総称型についてまとめる。

# 仮型引数の定義
クラスに仮型引数を定義することにより、
オブジェクト宣言時に決定される型を前提にしたコーディングが可能となる。
`ArrayList`の例を示す。
    public class ArrayList<E> {
        public boolean add(E e) {
        }

        public E get(int index) {
        }
        ...
    }
また、メソッド限定のスコープで総称型を宣言することも可能。
その場合は、戻り値の型の前に総称型を宣言する。
    public <T> T get() {
        ...
    }
上記の例は、総称型`T`を宣言した返り値が`T`のメソッド`get`を宣言している。
同様に、コンストラクタ限定のスコープでも総称型を用いることができる。

# 型変数のバインド
クラスに総称型が定義されている場合はオブジェクトの宣言時にその総称型を指定する。
これを実型引数と呼ぶ。
    ArrayList<String> lis = new ArrayList<>();
上記の例は`ArrayList`のオブジェクトを作成するときに、
実型引数に`String`型を指定している。
また、右辺の`<>`はダイヤモンド演算子といい、型推論できる場合に省略できる。

# 境界ワイルドカード
javaには総称型の実型引数に指定できる型を限定する機能がある。
これを境界ワイルドカードという。
よく使う境界ワイルドカードに`extends`がある。
    public ArrayList<? extends Number> lis;
上記はクラス`Number`を継承した実型引数を指定している。
ワイルドカードにはインターフェースを指定することも可能。
複数のクラス、インターフェースを指定する場合は次の例のように`&`を使用する。
    public ArrayList<? extends Number & Interface1 & Interface2> lis;
ただし、複数指定する場合でクラスが含まれている場合は先頭に記述しなければならない。