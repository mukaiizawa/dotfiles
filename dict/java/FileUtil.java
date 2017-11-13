import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * ファイルユーティリティ
 */
public class FileUtil {

  /**
   * 拡張子取得
   * 返り値にはドットは含まない。
   * @param path パス
   * @return 拡張子
   */
  public String getExtension(Path path) {
    String fileName = path.getFileName().toString();
    int extensionIndex = fileName.lastIndexOf(".");
    return fileName.substring(extensionIndex + 1);
  }

  /**
   * ベース名取得
   * ファイル名のうち、拡張子を除いたものを返す。
   * @param path パス
   * @return ベース名
   */
  public String getBaseName(Path path) {
    String fileName = path.getFileName().toString();
    return fileName.substring(0, fileName.lastIndexOf("."));
  }

  /**
   * ファイルサイズ取得処理
   * 引数がディレクトリの場合はその中のファイルサイズの総和を返す。
   * @param path ファイルサイズ取得対象のパス
   * @param acc アキュムレーター
   * @return ディレクトリ内のファイルの総サイズ
   */
  public long getSize(Path path) {
    try {
      if (!Files.isDirectory(path)) return Files.size(path);
      return Files.list(path).map(child -> getSize(child))
        .reduce(0L, (x1, x2) -> x1 + x2);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * ファイルコピー処理
   * ファイルが既に存在する場合はエラーと見做す。
   * @param src コピー元
   * @param dest コピー先
   */
  public void copy(Path src, Path dest) {
    try {
      Files.copy(src, dest);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * ディレクトリ作成処理
   * 途中のパスがない場合は自動的に作成する。
   * @param dir 作成するディレクトリ
   */
  public Path mkdir(Path dir) {
    try {
      Files.createDirectories(dir);
      return dir;
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * ディレクトリ内のファイルパス取得処理
   * @param dir ディレクトリ
   * @return ディレクトリ内のパスのリスト
   */
  public List<Path> getChildren(Path dir) {
    if (!Files.isDirectory(dir)) return Collections.emptyList();
    return Arrays.stream(dir.toFile().listFiles())
      .map(x -> x.toPath())
      .collect(Collectors.toList());
  }

  /**
   * ファイル削除
   * ファイルがない場合は何もせずに戻る。
   * ディレクトリが指定された場合は下位のファイルも再帰的に削除する。
   * @param path 削除するファイルのパス
   */
  public void delete(Path path) {
    try {
      if (!Files.exists(path)) return;
      else if (Files.isDirectory(path))
        for (File f: path.toFile().listFiles()) delete(f.toPath());
      Files.delete(path);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * ZIPファイル生成
   * ディレクトリを引数に受け取り、
   * @param src 圧縮対象ディレクトリ
   * @param dest ZIP出力先パス
   */
  public void makeZIP(Path src, Path dest) {
    try {
      Map<String, Object> env = new HashMap<>();
      env.put("create", "true");
      try (FileSystem fs = FileSystems.newFileSystem(
            new URI("jar", dest.toUri().toString(), null)
            , env
            , ClassLoader.getSystemClassLoader()))
      {
        Files.walkFileTree(src, new SimpleFileVisitor<Path>() {
          @Override
          public FileVisitResult preVisitDirectory(Path dir
              , BasicFileAttributes attrs)
          {
            mkdir(fs.getPath(
                  src.getFileName().toString()
                  , src.relativize(dir).toString()));
            return FileVisitResult.CONTINUE;
          }
          @Override
          public FileVisitResult visitFile(Path copyFrom
              , BasicFileAttributes attrs) throws IOException
          {
            Path copyTo = fs.getPath(
                src.getFileName().toString()
                , src.relativize(copyFrom).toString());
            Files.copy(copyFrom, copyTo, StandardCopyOption.COPY_ATTRIBUTES);
            return FileVisitResult.CONTINUE;
          }});
      }
    } catch (URISyntaxException e) {
      throw new IllegalStateException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static void main(String[] args) {
    FileUtil fu = new FileUtil();
    Path p = Paths.get("foo", "bar", "example.txt");
    assert fu.getExtension(p).equals("txt");
    assert fu.getBaseName(p).equals("example");
  }

}
