/*
 * time measurement
 */
public class TimeMeasurement {

  public static int tarai(int x, int y, int z) {
    if (x <= y) return y;
    return tarai(
        tarai(x - 1, y, z)
        , tarai(y - 1, z, x)
        , tarai(z - 1, x, y));
  }

  public static void main(String[] args) {
    long start = System.nanoTime();    // or currentTimeMillis() [msec]
    tarai(12, 6, 0);
    long end = System.nanoTime();
    System.out.println((end - start)  + "ns");
  }

}
