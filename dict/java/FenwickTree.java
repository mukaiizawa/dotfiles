/*
 * A Fenwick tree or binary indexed tree (BIT).
 */
class FenwickTree {

  private long[] tree;

  public FenwickTree(int len) {
    tree = new long[len];
  }

  public FenwickTree(long[] vals) {
    tree = vals.clone();
    for (int i = 0; i < tree.length; i++) {
      long val = tree[i];
      for (int j = 1; (i & j) != 0; j <<= 1) val += tree[i ^ j];
      tree[i] = val;
    }
  }

  public int length() {
    return tree.length;
  }

  public long get(int i) {
    long result = tree[i];
    for (int j = 1; (i & j) != 0; j <<= 1) result -= tree[i ^ j];
    return result;
  }

  public void set(int i, long val) {
    add(i, val - get(i));
  }

  public void add(int i, long n) {
    do {
      tree[i] += n;
      i |= i + 1;
    } while (i < tree.length);
  }

  /*
   * Computes the sum of the given range `[0,end)`.
   */
  public long sum(int end) {
    long result = 0;
    while (end > 0) {
      result += tree[end - 1];
      end &= end - 1;
    }
    return result;
  }

  /*
   * Computes the sum of the given range `[start,end)`.
   */
  public long sum(int start, int end) {
    return sum(end) - sum(start);
  }

  /*
   * Computes the total sum.
   */
  public long sum() {
    return sum(length());
  }

}
