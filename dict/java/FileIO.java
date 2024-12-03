import java.io.*;
import java.nio.charset.*;
import java.nio.file.*;
import java.util.*;
import java.util.stream.*;

// charset

  Charset ms932 = Charset.forName("MS932");
  Charset utf8 = StandardCharsets.UTF_8;

// Files api

  Files.copy(Paths.get("./in.txt"), Paths.get("./out.txt"));

  Files.write(Paths.get("./out.txt"), Files.readAllLines(Paths.get("./in.txt")));

  for (String line: Files.readAllLines(Paths.get("./foo.txt"))) {
    // line...
  }

  try (BufferedReader rd = Files.newBufferedReader(Paths.get("./in.txt"), ms932);
      BufferedWriter wr = Files.newBufferedWriter(Paths.get("./out.txt"), ms932))
  {
    String line;
    while ((line = rd.readLine()) != null) {
        wr.write(line);
        wr.newLine();
    }
  }
