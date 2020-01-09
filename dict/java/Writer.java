import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * ファイル出力
 */
public class Writer {

  public static void write(String s) throws IOException {
    try (PrintWriter pw = new PrintWriter(new BufferedWriter(
            new OutputStreamWriter(new FileOutputStream(new File("file"))
              , "UTF-8")))) // "SJIS"
    {
      pw.println(s);
    } catch (IOException e) {
      throw e;
    }
  }

}
