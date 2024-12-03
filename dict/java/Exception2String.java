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
