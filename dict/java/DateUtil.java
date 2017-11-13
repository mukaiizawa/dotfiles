import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 日付ユーティリティ
 */
public class DateUtil {

  /** 一日を表すミリ秒 */
  public final int SECOND_OF_DAY = 24 * 60 * 60 * 1000;

  private static DateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");

  private static DateFormat yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");

  private static DateFormat ggggymd =
    new SimpleDateFormat("GGGGy年M月d日", new Locale("ja", "JP", "JP"));

  /**
   * システム時刻の取得
   * yyyyMMddの書式でシステム時刻を取得する。
   * @return システム時刻
   */
  public String getSysTime() {
    return yyyyMMdd.format(new Date());
  }

  /**
   * システム時刻の取得
   * yyyyMMddHHmmの書式でシステム時刻を取得する。
   * @return システム時刻
   */
  public String getSysTimeDetail() {
    return yyyyMMddHHmm.format(new Date());
  }

  /**
   * 日数の差の計算
   * @param minuend 被減数
   * @param subtrahend 減数
   * @return 日数の差
   * @throws Exception 処理に失敗した場合
   */
  public int subtract(String minuend, String subtrahend) {
    try {
      return Math.abs((int)(
            (yyyyMMdd.parse(minuend).getTime()
             - yyyyMMdd.parse(subtrahend).getTime()) / SECOND_OF_DAY));
    } catch (ParseException e) {
      throw new IllegalArgumentException(e);
    }
  }

  /**
   * 前日取得
   * @param date 有効開始日(yyyyMMdd)
   * @return 引数が{@code FIRST_VALID_DATE_FROM}の場合、空文字列
   *         そうでない場合、引数の前日を表す文字列(yyyyMMdd)
   */
  public String yesterdayOf(String date) {
    try {
      Calendar cal = Calendar.getInstance();
      cal.setTime(yyyyMMdd.parse(date));
      cal.add(Calendar.DAY_OF_MONTH, -1);
      return yyyyMMdd.format(cal.getTime());
    } catch (ParseException e) {
      throw new IllegalArgumentException(e);
    }
  }

  /**
   * 西暦を表す文字列(yyyyMMdd)の和暦変換処理
   * @param date 和暦に変換する対象の文字列(yyyyMMdd)
   * @return 引数の和暦表現
   */
  public String toJapanese(String date) {
    try {
      return ggggymd.format(yyyyMMdd.parse(date));
    } catch (ParseException e) {
      throw new IllegalArgumentException(e);
    }
  }

  public static void main(String[] args) {
    DateUtil du = new DateUtil();
    assert du.subtract("19000101", "19000102") == 1;
    assert du.yesterdayOf("19000103").equals("19000102");
  }

}
