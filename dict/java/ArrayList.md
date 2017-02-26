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
addはListの末尾に要素を追加する。
コレクションが変更された場合はtrueを返す。
引数にindexを指定した場合はその位置に要素を挿入する。
その場合、その位置以降にあった各要素のindexは1増える。
addAllはListの末尾にコレクションを追加する。
追加される順番は追加するコレクションのイテレータに返される順番になる。
引数にindexを指定した場合は、
追加位置以降の要素を追加する要素だけ移動して挿入する。

# 要素の削除
public void clear()
public E remove(int index)
public boolean remove(Object o)
public boolean removeAll(Collection<?> c)
public boolean removeIf(Predicate<? super E> filter)
clearはListの要素をすべて削除する。
removeにindexを私は場合は、indexにある要素を削除しその要素を返す。
removeにオブジェクトを渡した場合は最初に見つかったオブジェクトを削除する。
removeAllはコレクションに含まれる要素すべてを削除する。
removeIfは指定された述語を満たすコレクションの要素をすべて削除する。
remove, removeAll, removeIfは、
指定した要素が含まれていた(即ち、コレクションが変更される)場合trueを返す。

# 要素の取得
public E get(int index)
このListのindexにある要素を取得する。

# 大きさの取得
public int size()
このListの大きさを返す。

# 空か判定
public boolean isEmpty()
このListに要素が存在しない場合にtrueを返す。

# 要素が含まれているか判定
public boolean contains(Object o)
指定した要素がListに存在する場合にtrueを返す。

# ソート
public void sort(Comparator<? super E> c)
このListをComparatorに従いソートする。
引数がnullの場合はこのListの要素の自然順序付けが使用される。
