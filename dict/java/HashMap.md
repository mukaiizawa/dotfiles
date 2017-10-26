Class HashMap<K,V>

java.lang.Object
  java.util.AbstractMap<K,V>
    java.util.HashMap<K,V>

# 型パラメータ
K: このマップで保持されるキーの型
V: マップされる値の型

# 概要
HashMapはマップの順序を保証していない。
また、この実装は*synchronized*されない。

# マップの生成
    Map<String, String> m = new HashMap<>();
ジェネリック/クラスのコンストラクタ呼び出しに必要な型引数は、
コンパイラがコンテキストから型引数を推論できる場合にかぎり、
型パラメータの空のセット（<>）で置き換えることができる。（JavaSE7以降）

# 値の追加
    V put(K key, V value)
    void putAll(Map<? extends K,? extends V> m)
値の追加にはputが使える
戻り値はkeyに以前に関連付けられていた値。
keyのマッピングが存在しなかった場合はnull。
ただし、戻り値nullは、マップが以前にnullとkeyを関連付けていたことを示す場合もある。
また、putAllでほかのマップから値を追加することができる。

# 値の取得
    V get(Object key)
    V getOrDefault(Object key, V defaultValue)
getは指定されたキーがマップされている値を返す。
このマップにそのキーのマッピングが含まれていない場合はnullを返す。
戻り値がnullの場合、マップがキーのマッピングを保持していないことを示すとは限らない。
containsKeyメソッドを使うことにより、nullがマップされているのか値がなかったのかを区別できる。
getOrDefaultはキーが存在しない場合にその方のデフォルト値を返すこと以外を除いてgetと同じである。

# 値の置換
    V replace(K key, V value)
指定されたキーが存在する場合にのみ、そのキーの値を置換する。

# 値の有無の確認
    public boolean containsKey(Object key)
    public boolean containsValue(Object value)
containsKey/containsValueは指定のキー/値のマッピングがこのマップに含まれている場合にtrueを返す。
ただし、containsValueは2つ以上の対応するキーがある場合もtrueと見做す。

# 値の削除
    V remove(Object key)
    boolean remove(Object key, Object value)
removeは指定されたキーのマッピングがあればマップから削除する。
値も指定することにより、key/valueが一致した場合にのみ削除する。

# マップのクリア
    public void clear()
すべての要素をマップから削除する。

# サイズの取得
    int size()
このマップ内のキー値マッピングの数を返す。

# マップのイテレート
    for(Map.Entry<String, Object> entry: map.entrySet()) {
        key = entry.getKey();
        value = entry.getValue();
        ...
    }
entrySet()でSetを取得することにより、拡張for文を使用することができる。
Setのキーと値はそれぞれ`getKey()`、`getValue()`を用いて取得する。
