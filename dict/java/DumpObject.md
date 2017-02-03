Recipe dump object

# 概要
java.lang.reflect.Method
を用いて動的にオブジェクトのメソッドを取得することにより、
オブジェクトの内容を柔軟に出力することができる。

# オブジェクトのダンプ
    public <T> String dump(T obj) {
      String buf = "";
      for(Method m: obj.getClass().getDeclaredMethods()) {
        if (m.getName().startsWith("get")) {
          try {
            buf += m.getName() + ":" + m.invoke(obj);
          } catch (Exception e) {
            // invoke失敗時は何もしない
          }
        }
      }
      return buf;
    }
メソッド名称がgetを含む場合メソッドを呼び出す。
呼び出されたメソッドの引数が不適切な場合は何もしない。
このメソッドはBeanやEntityを表示するのに優れている。
