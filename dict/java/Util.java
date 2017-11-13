import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;

/**
 * ユーティリティクラス
 */
public class Util {

  /**
   * エラー情報のダンプ用文字列取得
   * @param e エラー
   * @return スタックトレースの文字列
   */
  public String eToString(Exception e) {
    if (e == null) return "";
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    pw.flush();
    return sw.toString();
  }

  /**
   * 異常終了処理
   * 例外情報を標準出力に出力して終了する。
   * @param e エラー
   */
  public void exit(Exception e) {
    System.out.println(eToString(e));
    System.exit(-1);
  }

  /**
   * オブジェクトのデバッグ向け表現取得処理
   * オブジェクトのgetterをすべて呼び出す。
   * 呼び出されたメソッドの引数が不適切な場合は何もしない。
   * @param obj オブジェクト
   */
  public <T> String describe(T obj) {
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

  public static void  main(String[] args) {
    Util util = new Util();
    System.out.println(args);
  }

}
