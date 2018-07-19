import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.chrono.JapaneseChronology;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;

/**
 * 日付ユーティリティ
 * java8以降
 */
public class XDateUtil {

  private static DateTimeFormatter yyyyMMdd =
    DateTimeFormatter.ofPattern("uuuuMMdd");

  private static DateTimeFormatter yyyyMMddHHmm =
    DateTimeFormatter.ofPattern("uuuuMMddHHmm");

  private static DateTimeFormatter ggggymd =
    DateTimeFormatter.ofPattern("Gy年M月d日")
    .withChronology(JapaneseChronology.INSTANCE);

  /**
   * システム時刻の取得
   * yyyyMMddの書式でシステム時刻を取得する。
   * @return システム時刻
   */
  public String getSysTime() {
    return OffsetDateTime.now().format(yyyyMMdd);
  }

  /**
   * システム時刻の取得
   * yyyyMMddHHmmの書式でシステム時刻を取得する。
   * @return システム時刻
   */
  public String getSysTimeDetail() {
    return OffsetDateTime.now().format(yyyyMMddHHmm);
  }

  /**
   * 日数の差の計算
   * @param minuend 被減数(yyyyMMdd)
   * @param subtrahend 減数(yyyyMMdd)
   * @return 日数の差
   * @throws Exception 処理に失敗した場合
   */
  public long subtract(String minuend, String subtrahend) {
    return Duration.between(LocalDate.parse(minuend, yyyyMMdd).atTime(0, 0, 0)
        , LocalDate.parse(subtrahend, yyyyMMdd).atTime(0, 0, 0)).toDays();
  }

  /**
   * 前日取得
   * @param date 有効開始日(yyyyMMdd)
   * @return 引数が{@code FIRST_VALID_DATE_FROM}の場合、空文字列
   *         そうでない場合、引数の前日を表す文字列(yyyyMMdd)
   */
  public String yesterdayOf(String date) {
    return LocalDate.parse(date, yyyyMMdd).plusDays(-1).format(yyyyMMdd);
  }

  /**
   * 西暦を表す文字列(yyyyMMdd)の和暦変換処理
   * @param date 和暦に変換する対象の文字列(yyyyMMdd)
   * @return 引数の和暦表現
   */
  public String toJapanese(String date) {
    return LocalDate.parse(date, yyyyMMdd).format(ggggymd);
  }

  public static void main(String[] args) {
    XDateUtil du = new XDateUtil();
    assert du.subtract("19000101", "19000102") == 1;
    assert du.yesterdayOf("19000103").equals("19000102");
    assert du.toJapanese("19920722").equals("平成4年7月22日");
  }

}
