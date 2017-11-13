/**
 * 文字列ユーティリティ
 */
public class StringUtil {

  /**
   * nullまたは空文字列か判定
   * @param str 検証対象
   * @return nullまたは空文字列か否か
   */
  public boolean isEmpty(String str) {
    return str == null || str.isEmpty();
  }

  /**
   * マルチバイト文字の有無判定
   * @param str 検証対象
   * @return マルチバイト文字が含まれているか否か
   */
  public boolean hasMultiByteChar(String str) {
    for (char c: str.toCharArray())
      if (String.valueOf(c).getBytes().length >= 2) return true;
    return false;
  }

  /**
   * 数字の列か判定
   * 小数や、符号付きの数字の列は数字とは見做さない。
   * @param str 検証対象
   * @return 数字の列か否か
   */
  public boolean isNumeric(String str) {
    return str.matches("[0-9]+");
  }

  public static void main(String[] args) {
    StringUtil su = new StringUtil();
    assert su.isEmpty(null);
    assert su.isEmpty("");
    assert !su.isEmpty("abc");
    assert su.hasMultiByteChar("あいう");
    assert !su.hasMultiByteChar("abc");
    assert su.isNumeric("333");
    assert !su.isNumeric("aa");
  }

}
