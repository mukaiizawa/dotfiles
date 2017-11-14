import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * 先読みリーダー
 */
public class AheadReader extends BufferedReader {

  private static final int EOF = -1;

  private static final IllegalStateException eofReachedException =
    new IllegalStateException("eof reached");

  private List<Character> token;

  private List<Integer> buf;

  /**
   * コンストラクタ
   * {@code Reader}からインスタンスを生成する。
   */
  public AheadReader(Reader r) {
    super(r);
    token = new ArrayList<>();
    buf = new ArrayList<>();
    buf.add(xread());
  }

  /**
   * コンストラクタ
   * 文字列からインスタンスを生成する。
   */
  public AheadReader(String s) {
    this(new InputStreamReader(
          new ByteArrayInputStream(s.getBytes(StandardCharsets.UTF_8))));
  }

  private int xread() {
    try {
      return super.read();
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * EOF到達の判定
   * @return 先読みした結果
   */
  public boolean isReachEOF() {
    return seek() == EOF;
  }

  /**
   * 次の一文字を読み飛ばして返す。
   * @return 先読みした結果
   */
  public int skip() {
    if (isReachEOF()) throw eofReachedException;
    int result = seek();
    buf = buf.subList(1, buf.size());
    seek();
    return result;
  }

  /**
   * 次の一文字をトークンの末尾に追加し、その文字を返す。
   * @return 読み込んだ一文字
   */
  @Override
  public int read() {
    char ch = (char)skip();
    addChar(ch);
    return ch;
  }

  /**
   * 一文字先読み
   * @return 一文字後の文字
   */
  public int seek() {
    return seek(1);
  }

  /**
   * 先読み
   * 指定した文字数先読みして結果を返す。
   * 先読みする字数は一から数える。
   * ストリームの終端に達した場合は{@code AheadReader.EOF}を返す。
   * @param n 先読みする字数
   * @return 先読みした結果
   */
  public int seek(int n) {
    if (n < 1) throw new IllegalArgumentException();
    for (int i = buf.size(); i < n; i++) {
      int ch = xread();
      buf.add(ch);
      if (ch == EOF && i != 0) break;
    }
    int size = buf.size();
    return buf.get((n > size? size: n) - 1);
  }

  /**
   * トークンに文字を追加する。
   */
  public void addChar(char ch) {
    token.add(ch);
  }

  /**
   * トークンの取得
   * 取得後にトークンを初期化する。
   * @return 切り出したトークン
   */
  public String getToken() {
    String result = seekToken();
    token.clear();
    return result;
  }

  /**
   * トークンの取得
   * トークンの初期化は行わない。
   * @return 切り出したトークン
   */
  public String seekToken() {
    return token.stream()
      .map(x -> String.valueOf(x)).reduce("", (x, y) -> x + y);
  }

  /**
   * ストリームのクローズ処理
   */
  @Override
  public void close() {
    try {
      super.close();
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static void main(String[] args) {
    AheadReader ar;
    ar = new AheadReader("123");
    assert ar.seek(3) == '3';
    assert ar.skip() == '1';
    assert ar.seekToken().equals("");
    assert !ar.isReachEOF();
    assert ar.seek() == '2';
    assert ar.seek(2) == '3';
    assert ar.read() == '2';
    assert ar.seekToken().equals("2");
    assert !ar.isReachEOF();
    assert ar.read() == '3';
    assert ar.seekToken().equals("23");
    assert ar.getToken().equals("23");
    assert ar.isReachEOF();
    ar.close();
  }

}
