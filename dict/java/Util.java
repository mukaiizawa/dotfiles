import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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

  public static final int SESSION_TIME_OUT = 10 * 60 * 60 * 1000;    // 10 hour

  public static boolean isEmpty(String s) {
    return s == null || s.isEmpty();
  }

  public static boolean isMail(String s) {
    return s.matches("[a-zA-Z0-9!#%&'/=_~`\\*\\+\\?\\{\\}\\^\\$\\-\\|][a-zA-Z0-9!#%&'/=_~`\\.\\*\\+\\?\\{\\}\\^\\$\\-\\|]+@[a-zA-Z0-9!#%&'/=_~`\\*\\+\\?\\{\\}\\^\\$\\-\\|]+(\\.[a-zA-Z0-9!#%&'/=_~`\\*\\+\\?\\{\\}\\^\\$\\-\\|]+)+");
  }

  public static String nvl(String s) {
    return nvl(s, "");
  }

  public static String nvl(String s, String t) {
    if (s == null) return t;
    return s;
  }

  public static String randval(int len) {
    String symbols = "0123456789ABCDEF";
    StringBuilder val = new StringBuilder();
    Random rand = new SecureRandom();
    for (int i = 0; i < len; i++)
      val.append(symbols.charAt(rand.nextInt(symbols.length())));
    return val.toString();
  }

  private static Date min(String s) throws Exception {
    return new SimpleDateFormat("HH:mm").parse(s);
  }

  public static long diffMillSec(Date x, Date y) {
    return Math.abs(x.getTime() - y.getTime());
  }

  public static long diffSec(Date x, Date y) {
    return diffMillSec(x, y) / 1000;
  }

  public static long diffMin(Date x, Date y) {
    return diffSec(x, y) / 60;
  }

  private static void xassert(boolean b) {
    if (!b) throw new IllegalStateException();
  }

  public static void main(String[] args) throws Exception {
    xassert(nvl(null).equals(""));
    xassert(nvl("foo").equals("foo"));
    xassert(nvl(null,"bar").equals("bar"));
    xassert(nvl("foo","bar").equals("foo"));
    xassert(!randval(10).equals(randval(10)));
    xassert(diffMin(min("10:20"), min("11:10")) == 50);
    xassert(diffSec(min("10:20"), min("11:10")) == 50 * 60);
    xassert(diffMillSec(min("10:20"), min("11:10")) == 50 * 60 * 1000);
    System.out.println("pass");
  }

}
