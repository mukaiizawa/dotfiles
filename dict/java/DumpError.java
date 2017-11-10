Snippets dump error

/**
 * エラー情報のダンプ用文字列取得
 */
public static String errToString(Exception e) {
  if (e == null) return "";
  StringWriter sw = new StringWriter();
  PrintWriter pw = new PrintWriter(sw);
  e.printStackTrace(pw);
  pw.flush();
  return sw.toString();
}
