import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Map;
import java.util.HashMap;

/**
 * リソースユーティリティ
 */
public class ResourceUtil {

  private static Map<String, ResourceUtil> instanceMap = new HashMap<>();

  private ResourceBundle rb;

  private ResourceUtil() {
    instanceMap = new HashMap<>();
  }

  private ResourceUtil (String propName) {
    try {
      rb = ResourceBundle.getBundle(propName, Locale.getDefault()
          , new URLClassLoader(new URL[] {
            new File("./").toURI().toURL()
          }));
    } catch (MalformedURLException e) {
      throw new IllegalStateException(e);
    }
  }

  /**
   * このオブジェクトの取得
   * @param propName プロパティファイルの名称
   * @return このオブジェクト
   */
  public static ResourceUtil getInstance(String propName) {
    if (!instanceMap.containsKey(propName))
      instanceMap.put(propName, new ResourceUtil(propName));
    return instanceMap.get(propName);
  }

  /**
   * プロパティファイルの値取得
   * 指定されたプロパティファイルのキー値に対応する値を返す。
   * @param key プロパティのキー
   * @return プロパティの値
   */
  public String getStr(String key) {
    return rb.getString(key);
  }

  /**
   * プロパティファイルの値取得
   * 指定されたプロパティファイルのキー値に対応する値を整数にして返す。
   * @param key プロパティのキー
   * @return プロパティの値
   */
  public int getInt(String key) {
    return Integer.parseInt(getStr(key));
  }

  public static void main(String[] args) {
    // requires test.properties
    ResourceUtil ru = ResourceUtil.getInstance("test");
    System.out.println(ru.getStr("a"));
  }

}
