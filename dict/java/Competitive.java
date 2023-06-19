import java.util.*;
import java.io.*;
import java.math.*;
import java.util.function.*;
import java.util.stream.*;

public class Main {

  private static ExReader rd = new ExReader(System.in);
  private static ExWriter wr = new ExWriter(System.out);

  static class Solver implements Runnable {

    void solve() {
      var N = rd.readInt();
      var S = rd.readString();
      wr.writeLine(N);
    }

    void swap(int[] a, int i, int j) { int x = a[i]; a[i] = a[j]; a[j] = x; }
    void swap(long[] a, int i, int j) { long x = a[i]; a[i] = a[j]; a[j] = x; }
    void swap(char[] a, int i, int j) { char x = a[i]; a[i] = a[j]; a[j] = x; }
    void swap(Object[] a, int i, int j) { Object x = a[i]; a[i] = a[j]; a[j] = x; }
    int sum(int[] a) { return IntStream.of(a).sum(); }
    long sum(long[] a) { return LongStream.of(a).sum(); }
    int[] sort(int[] a) { Arrays.sort(a); return a; }
    long[] sort(long[] a) { Arrays.sort(a); return a; }
    int[] reverse(int[] a) { return reverse(a, 0, a.length); }
    long[] reverse(long[] a) { return reverse(a, 0, a.length); }
    char[] reverse(char[] a) { return reverse(a, 0, a.length); }
    Object[] reverse(Object[] a) { return reverse(a, 0, a.length); }
    int[] reverse(int[] a, int i) { return reverse(a, i, a.length); }
    long[] reverse(long[] a, int i) { return reverse(a, i, a.length); }
    char[] reverse(char[] a, int i) { return reverse(a, i, a.length); }
    Object[] reverse(Object[] a, int i) { return reverse(a, i, a.length); }
    int[] reverse(int[] a, int i, int j) { for (int k = 0; k < (j - i) / 2; k++) { swap(a, i + k, j - k - 1); } return a; }
    long[] reverse(long[] a, int i, int j) { for (int k = 0; k < (j - i) / 2; k++) { swap(a, i + k, j - k - 1); } return a; }
    char[] reverse(char[] a, int i, int j) { for (int k = 0; k < (j - i) / 2; k++) { swap(a, i + k, j - k - 1); } return a; }
    Object[] reverse(Object[] a, int i, int j) { for (int k = 0; k < (j - i) / 2; k++) { swap(a, i + k, j - k - 1); } return a; }
    int[] slice(int[] a) { return Arrays.copyOfRange(a, 0, a.length); }
    long[] slice(long[] a) { return Arrays.copyOfRange(a, 0, a.length); }
    char[] slice(char[] a) { return Arrays.copyOfRange(a, 0, a.length); }
    Object[] slice(Object[] a) { return Arrays.copyOfRange(a, 0, a.length); }
    int[] slice(int[] a, int i) { return Arrays.copyOfRange(a, i, a.length); }
    long[] slice(long[] a, int i) { return Arrays.copyOfRange(a, i, a.length); }
    char[] slice(char[] a, int i) { return Arrays.copyOfRange(a, i, a.length); }
    Object[] slice(Object[] a, int i) { return Arrays.copyOfRange(a, i, a.length); }
    int[] slice(int[] a, int i, int j) { return Arrays.copyOfRange(a, i, j); }
    long[] slice(long[] a, int i, int j) { return Arrays.copyOfRange(a, i, j); }
    char[] slice(char[] a, int i, int j) { return Arrays.copyOfRange(a, i, j); }
    Object[] slice(Object[] a, int i, int j) { return Arrays.copyOfRange(a, i, j); }
    boolean isEven(int x) { return x % 2 == 0; }
    boolean isEven(long x) { return x % 2 == 0; }
    double log(double x, double y) { return Math.log(y) / Math.log(x); }
    BigInteger bigint(int x) { return bigint(String.valueOf(x)); }
    BigInteger bigint(long x) { return bigint(String.valueOf(x)); }
    BigInteger bigint(String x) { return new BigInteger(x); }

    /*
     * String to digit array.
     */
    int[] string2digits(String val) {
      int[] digits = new int[val.length()];
      for (int i = 0; i < digits.length; i++) digits[i] = val.charAt(i) - '0';
      return digits;
    }

    /*
     * Integer to binary array.
     *     10x11 = 2x1011
     *     int2bina(10) = [0, 1, 0, 1, 0, 0, ...]
     */
    int[] int2binaryArray(int x) {
      int[] bits = new int[32];
      for (int i = 0; i < 32; i++) bits[i] = (x / (1 << i)) % 2;
      return bits;
    }

    /*
     * Integer to n-nary array.
     *     10x11 = 3x102 = 4x23
     *     int2nnary(11, 3) = [2, 0, 1, 0, 0, ...]
     *     int2nnary(11, 4) = [3, 2, 0, 0, ...]
     */
    int[] int2nnaryArray(int x, int radix) {
      int len = (int)log(radix, 1L << 32);
      int[] a = new int[len];
      for (int i = 0, p = 1; i < len; i++) {
        a[i] = (x / p) % radix;
        p *= radix;
      }
      return a;
    }

    /*
     * Make two dimenional int array.
     */
    int[][] make2diArray(int h, int w, int v) {
      int[][] a = new int[h][w];
      for (int[] r: a) Arrays.fill(r, v);
      return a;
    }

    /*
     * Make two dimenional long array.
     */
    long[][] make2dlArray(int h, int w, long v) {
      long[][] a = new long[h][w];
      for (long[] r: a) Arrays.fill(r, v);
      return a;
    }

    /*
     * Computes an array of whether each number from 0 to n (inclusive) is prime:
     *     sievePrimes(5) = [false, false, true, true, false, true]
     */
    boolean[] sievePrimes(int n) {
      boolean[] primes = new boolean[n + 1];
      if (n >= 2) primes[2] = true;
      for (int i = 3; i <= n; i += 2) primes[i] = true;
      for (int i = 3, e = (int)Math.floor(Math.sqrt(n)); i <= e; i += 2) {
        if (primes[i])
          for (int j = i * 3; j <= n; j += i << 1) primes[j] = false;
      }
      return primes;
    }

    /*
     * Calculate the greatest common divisor (GCD) with the Euclidean algorithm.
     */
    long gcd(long a, long b) {
      while (b != 0) {
        long m = a % b;
        a = b;
        b = m;
      }
      return a;
    }

    /*
     * Compute the inversion number of array `a` representing permutations of length `a.length`.
     */
    int inversionNumber(int[] a) {
      int n = 0;
      for (int i = 0; i < a.length; i++)
        for (int j = i - 1; j >= 0 ; j--)
          if (a[i] < a[j]) n++;
      return n;
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

    public String[] readString(int n) {
      String[] a = new String[n];
      for (int i = 0; i < n; i++) a[i] = readString();
      return a;
    }

    public String[][] readString(int n, int m) {
      String[][] a = new String[n][m];
      for (int i = 0; i < n; i++) a[i] = readString(m);
      return a;
    }

  }

  static class ExWriter {

    private PrintStream out;

    public ExWriter(PrintStream out) {
      this.out = new PrintStream(out, false);
    }

    public ExWriter write(Object x) { out.print(x); return this;}
    public ExWriter write(Object[] x) { return write(Arrays.toString(x)); }
    public ExWriter write(int[] x) { return write(Arrays.toString(x)); }
    public ExWriter write(int[][] x) { return write(Arrays.deepToString(x)); }
    public ExWriter write(long[] x) { return write(Arrays.toString(x)); }
    public ExWriter write(long[][] x) { return write(Arrays.deepToString(x)); }
    public ExWriter writeLine() { out.println(); return this; }
    public ExWriter writeLine(Object x) { out.println(x); return this; }
    public ExWriter writeLine(Object[] x) { return writeLine(Arrays.toString(x)); }
    public ExWriter writeLine(int[] x) { return writeLine(Arrays.toString(x)); }
    public ExWriter writeLine(int[][] x) { return writeLine(Arrays.deepToString(x)); }
    public ExWriter writeLine(long[] x) { return writeLine(Arrays.toString(x)); }
    public ExWriter writeLine(long[][] x) { return writeLine(Arrays.deepToString(x)); }
    public ExWriter writeBool(boolean b) { return writeLine(b? "Yes": "No"); }

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

  public static void main(String[] args) {
    Thread.setDefaultUncaughtExceptionHandler((t, e) -> {
      e.printStackTrace();
      System.exit(1);
    });
    new Thread(null, new Solver(), "", 64 * 1048576L).start();
  }

}
