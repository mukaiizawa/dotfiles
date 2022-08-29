// Lexer template.

import java.util.*;
import java.io.*;
import java.nio.file.*;

public class Lexer {

  int next;
  Reader rd;

  public Lexer(Reader rd)  throws IOException {
    this.rd = rd;
    this.next = rd.read();
  }

  public Character next() {
    if (next == -1) return null;
    return (char)next;
  }

  public Character read() throws IOException {
    Character ch = next();
    if (ch == null) throw new IOException("unexpected EOF");
    next = rd.read();
    return ch;
  }

  static String alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  public boolean isAlpha(Character ch) {
    if (ch == null) return false;
    return alpha.contains(String.valueOf(ch));
  }

  static String symbol = "!\"#$%&'()*+,-./:;<=>?@[]^_`{|}~";
  public boolean isSymbol(Character ch) {
    if (ch == null) return false;
    return symbol.contains(String.valueOf(ch));
  }

  public boolean isAlsym(Character ch) {
    return isAlpha(ch) || isSymbol(ch);
  }

  public String lex() throws IOException {
    Character ch;
    while (!isAlsym(next())) {
      if (next() == null) return null;
      read();
    }
    StringBuilder sb = new StringBuilder();
    if (isAlpha(next())) {
      while (isAlpha(next())) sb.append(read());
    } else {
      while (isSymbol(next())) sb.append(read());
    }
    if (sb.length() <  2 || sb.length() > 8) return lex();
    return sb.toString();
  }

  public static void main(String[] args) throws Exception {
    Lexer lexer;
    Map<String, Integer> table = new HashMap<>();
    // if (args.length == 0) lexer = new Lexer(new InputStreamReader(System.in));
    // else lexer = new Lexer(Files.newBufferedReader(Paths.get(fileName)));
    lexer = new Lexer(Files.newBufferedReader(Paths.get("./Lexer.java")));
    String token;
    while ((token = lexer.lex()) != null) {
      if (table.containsKey(token)) table.put(token, table.get(token) + 1);
      else table.put(token, 1);
    }
    long tokenCount = table.values().stream().mapToInt(Integer::intValue).sum();
    table.entrySet().stream().sorted(Collections.reverseOrder(Map.Entry.comparingByValue())).forEach(x -> {
      System.out.printf("%s	%d	%f\n", x.getKey(), x.getValue(), (double)x.getValue() / tokenCount);
    });
  }

}

