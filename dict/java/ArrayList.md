Class ArrayList<E>

java.lang.Object
  java.util.AbstractCollection<E>
    java.util.AbstractList<E>
      java.util.ArrayList<E>

# 概要
ArrayListはListインターフェースのサイズの変更可能な配列の実装である。
この実装はsynchronizedされない。

# 値の追加
    public boolean add(E e)
    public void add(int index, E element)
    public boolean addAll(Collection<? extends E> c)
    public boolean addAll(int index, Collection<? extends E> c)
addはリストの末尾に要素を追加する。
コレクションが変更された場合はtrueを返す。
引数にindexを指定した場合はその位置に要素を挿入する。
その場合、その位置以降にあった各要素のindexは1増える。
addAllはリストの末尾にコレクションを追加する。
追加される順番は追加するコレクションのイテレータに返される順番になる。
引数にindexを指定した場合は、
追加位置以降の要素を追加する要素だけ移動して挿入する。

# 要素の削除
    public void clear()
    public E remove(int index)
    public boolean remove(Object o)
    public boolean removeAll(Collection<?> c)
    public boolean removeIf(Predicate<? super E> filter)
clearはリストの要素をすべて削除する。
removeにindexを渡す場合は、indexにある要素を削除しその要素を返す。
removeにオブジェクトを渡した場合は最初に見つかったオブジェクトを削除する。
removeAllはコレクションに含まれる要素すべてを削除する。
removeIfは指定された述語を満たすコレクションの要素をすべて削除する。
remove, removeAll, removeIfは、
指定した要素が含まれていた(即ち、コレクションが変更される)場合trueを返す。

# 要素の取得
    E get(int index)
このリストのindexにある要素を取得する。

# 要素の更新
    set(int index, E element)
このリストの指定された位置にある要素を、指定された要素に置き換える。

# 大きさの取得
    int size()
このリストの大きさを返す。

# 空か判定
    boolean isEmpty()
このリストに要素が存在しない場合にtrueを返す。

# 要素が含まれているか判定
    boolean contains(Object o)
指定した要素がリストに存在する場合にtrueを返す。

# 部分リストの取得
    List<E> subList(int fromIndex, int toIndex)
このリストの部分リストを返す。
fromIndexは零から数える開始位置で、toIndexは自身を含まない終了位置である。
    Arrays.asList(1, 2, 3).subList(0, 1);
    => (1)
    Arrays.asList(1, 2, 3).subList(0, 2);
    => (1 2)

# ソート
    void sort(Comparator<? super E> c)
このリストをComparatorに従いソートする。
引数がnullの場合はこのリストの要素の自然順序付けが使用される。
