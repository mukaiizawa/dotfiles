Snippets dump object

/**
 * メソッド名称がgetを含む場合メソッドを呼び出す。
 * 呼び出されたメソッドの引数が不適切な場合は何もしない。
 */
public <T> String dump(T obj) {
    String buf = "";
    for(Method m: obj.getClass().getDeclaredMethods()) {
        if (m.getName().startsWith("get")) {
            try {
                buf += m.getName() + ":" + m.invoke(obj);
            } catch (Exception e) {
            }
        }
    }
    return buf;
}
