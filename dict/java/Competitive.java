import java.util.*;
import java.io.*;
import java.math.*;
import java.util.function.*;

public class Main {

  private static ExReader rd = new ExReader(System.in);
  private static ExWriter wr = new ExWriter(System.out);

  static class Solver implements Runnable {

    public void solve() {
      var N = rd.readInt();
    }

    @Override
    public void run() {
      try {
        solve();
      } catch (Throwable e) {
        throw e;
      } finally {
        wr.close();
      }
    }

  }

  static class ExReader {

    private static int MAX_SIZE = 1024;
    private InputStream in;
    private byte[] buf;
    private int p;
    private int size;

    private int digitVal(int ch) { return ch - '0'; }
    private boolean isDigit(int val) { return 0x30 <= val && val <= 0x39; }
    private boolean isPrint(int val) { return 0x20 < val && val < 0x7f; }

    public ExReader(InputStream in) {
      this.in = in;
      buf = new byte[MAX_SIZE];
      fetch();
    }

    private int fetch() {
      try {
        p = 0;
        if (size == -1) throw new Exception("EOF reached");
        return size = in.read(buf);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    }

    public int readByte() {
      if (p == size)
        if (fetch() == -1) return -1;
      return buf[p++];
    }

    public int readInt() {
      return (int)readLong();
    }

    public long readLong() {
      int ch;
      long val = 0;
      boolean negate = false;
      if (isDigit(ch = readByte())) val = digitVal(ch);
      else if (ch == '-') negate = true;
      else if (ch != '+') throw new IllegalStateException("unexpected token");
      while (isDigit(ch = readByte())) val = val * 10 + digitVal(ch);
      return negate? -val: val;
    }

    public int[] readInt(int n) {
      int[] a = new int[n];
      for (int i = 0; i < n; i++) a[i] = readInt();
      return a;
    }

    public long[] readLong(int n) {
      long[] a = new long[n];
      for (int i = 0; i < n; i++) a[i] = readLong();
      return a;
    }

    public int[][] readInt(int n, int m) {
      int[][] a = new int[n][m];
      for (int i = 0; i < n; i++) a[i] = readInt(m);
      return a;
    }

    public long[][] readLong(int n, int m) {
      long[][] a = new long[n][m];
      for (int i = 0; i < n; i++) a[i] = readLong(m);
      return a;
    }

    public String readString() {
      int ch;
      StringBuilder buf = new StringBuilder();
      while (isPrint(ch = readByte())) buf.append((char)ch);
      return buf.toString();
    }

  }

  static class ExWriter {

    private PrintStream out;

    public ExWriter(PrintStream out) {
      this.out = new PrintStream(out, false);
    }

    public void writeLine(Object x) { out.println(x); }
    public void writeLine(Object[] x) { writeLine(Arrays.toString(x)); }
    public void writeLine(int[] x) { writeLine(Arrays.toString(x)); }
    public void writeLine(int[][] x) { writeLine(Arrays.deepToString(x)); }
    public void writeLine(long[] x) { writeLine(Arrays.toString(x)); }
    public void writeLine(long[][] x) { writeLine(Arrays.deepToString(x)); }

    public void close() {
      try {
        flush();
        out.close();
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    }

    public void flush() { out.flush(); }

  }

  /*
   * String to digit array.
   */
  static int[] string2digits(String val) {
    int[] digits = new int[val.length()];
    for (int i = 0; i < digits.length; i++) digits[i] = val.charAt(i) - '0';
    return digits;
  }

  /*
   * Make two dimenional int array.
   */
  static int[][] make2dia(int h, int w, int v) {
    int[][] a = new int[h][w];
    for (int[] r: a) Arrays.fill(r, v);
    return a;
  }

  /*
   * Make two dimenional long array.
   */
  static long[][] make2dia(int h, int w, long v) {
    long[][] a = new long[h][w];
    for (long[] r: a) Arrays.fill(r, v);
    return a;
  }

  /*
   * Computes an array of whether each number from 0 to n (inclusive) is prime:
   *     sievePrimes(5) = [false, false, true, true, false, true]
   */
  static boolean[] sievePrimes(int n) {
    boolean[] primes = new boolean[n + 1];
    if (n >= 2) primes[2] = true;
    for (int i = 3; i <= n; i += 2) primes[i] = true;
    for (int i = 3, e = (int)Math.floor(Math.sqrt(n)); i <= e; i += 2) {
      if (primes[i])
        for (int j = i * 3; j <= n; j += i << 1) primes[j] = false;
    }
    return primes;
  }

  public static void main(String[] args) {
    Thread.setDefaultUncaughtExceptionHandler((t, e) -> {
      e.printStackTrace();
      System.exit(1);
    });
    new Thread(null, new Solver(), "", 64 * 1048576L).start();
  }

}
