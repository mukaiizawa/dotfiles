/*
 * Multiset data structure.
 */
class Multiset {

  private int size;
  private TreeMap<Long, Integer> table;

  public Multiset() {
    table = new TreeMap<>();
  }

  /*
   * Returns the number of elements in the multiset.
   */
  public int size() {
    return size;
  }

  /*
   * Returns the number of elements `val` present in the multiset.
   */
  public int count(long val) {
    if (table.containsKey(val)) return table.get(val);
    return 0;
  }

  /*
   * Return the set corresponding to the multiset.
   */
  public Set<Long> set() {
    return table.keySet();
  }

  /*
   * Same as `add(val, 1)`.
   */
  public Multiset add(long val) {
    return add(val, 1);
  }

  /*
   * Add `n` elements `val`.
   */
  public Multiset add(long val, int n) {
    table.put(val, table.getOrDefault(val, 0) + n);
    size += n;
    return this;
  }

  /*
   * Same as `remove(val, 1)`.
   */
  public Multiset remove(long val) {
    return remove(val, 1);
  }

  /*
   * Delete `n` elements `val`.
   * If the number of elements to be deleted is greater than the actual number, delete them all and do not treat it as an error
   */
  public Multiset remove(long val, int n) {
    int curr = count(val);
    int next = curr - n;
    if (next > 0) {
      table.put(val, next);
      size -= n;
    } else {
      table.remove(val);
      size -= curr;
    }
    return this;
  }

  /*
   * Returns the greatest element in this set strictly less than the given element, or null if there is no such element.
   */
  public long lower(long val) {
    return table.lowerKey(val);
  }

  /*
   * Returns the least element in this set strictly greater than the given element, or null if there is no such element.
   */
  public long higher(long val) {
    return table.higherKey(val);
  }

  /*
   * Returns the least element in this set greater than or equal to the given element, or null if there is no such element.
   */
  public long ceiling(long val) {
    return table.ceilingKey(val);
  }

  /*
   * Returns the greatest element in this set less than or equal to the given element, or null if there is no such element.
   */
  public long floor(long val) {
    return table.floorKey(val);
  }

  /*
   * Returns a sorted array corresponding to the multiset.
   */
  public long[] toArray() {
    int i = 0;
    long[] ret = new long[size];
    for (long val: set())
      for (int s = 0, e = count(val); s < e; s++) ret[i++] = val;
    return ret;
  }

}
