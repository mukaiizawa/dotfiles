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

  private List<Integer> buf;

  public AheadReader(Reader r) {
    super(r);
    buf = new ArrayList<>();
    buf.add(superRead());
  }

  public AheadReader(String s) {
    this(new InputStreamReader(new ByteArrayInputStream(s.getBytes(StandardCharsets.UTF_8))));
  }

  private int superRead() {
    try {
      return super.read();
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public int seek() {
    return seek(1);
  }

  /**
   * 先読み
   * 指定した文字数先読みして結果を返す。
   * 先読みする字数は一から数える。
   * ストリームの終端に達した場合は{@code null}を返す。
   * @param n 先読みする字数
   * @return 先読みした結果
   */
  public int seek(int n) {
    while (buf.size() < n) buf.add(superRead());
    return buf.get(n - 1);
  }

  /**
   * 一文字読み込み
   * 指定した文字数先読みして結果を返す。
   * 先読みする字数は一から数える。
   * ストリームの終端に達した場合は{@code -1}を返す。
   * @param n 先読みする字数
   * @return 先読みした結果
   */
  @Override
  public int read() {
    if (buf.isEmpty()) return superRead();
    int result = buf.get(0);
    buf = buf.subList(1, buf.size());
    return result;
  }

  @Override
  public void close() {
    try {
      super.close();
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static void main(String[] args) {
    AheadReader ar = new AheadReader("1234");
    assert ar.seek(3) == '3';
    assert ar.seek(2) == '2';
    assert ar.read() == '1';
    assert ar.seek(3) == '4';
    assert ar.seek(4) == -1;
    assert ar.seek(4) == -1;
    assert ar.seek(4) == -1;
    ar.close();
  }

}
