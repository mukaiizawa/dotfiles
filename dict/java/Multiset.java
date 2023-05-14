/*
 * Multiset data structure.
 */
class Multiset<E> {

  private int size;
  private TreeMap<E, Integer> table;

  /*
   * Constructor
   *
   *     Multiset<Long> ms = new Multiset<>(new Comparator<Long>() {
   *       public int compare(Long o1, Long o2) {
   *         return o1.compareTo(o2);
   *       }
   *     });
   */
  public Multiset(Comparator<? super E> cmp) {
    table = new TreeMap<>(cmp);
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
  public int count(E val) {
    if (table.containsKey(val)) return table.get(val);
    return 0;
  }

  /*
   * Return the set corresponding to the multiset.
   */
  public Set<E> set() {
    return table.keySet();
  }

  /*
   * Same as `add(val, 1)`.
   */
  public Multiset<E> add(E val) {
    return add(val, 1);
  }

  /*
   * Add `n` elements `val`.
   */
  public Multiset<E> add(E val, int n) {
    table.put(val, table.getOrDefault(val, 0) + n);
    size += n;
    return this;
  }

  /*
   * Same as `remove(val, 1)`.
   */
  public Multiset<E> remove(E val) {
    return remove(val, 1);
  }

  /*
   * Delete `n` elements `val`.
   * If the number of elements to be deleted is greater than the actual number, delete them all and do not treat it as an error
   */
  public Multiset<E> remove(E val, int n) {
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
  public Optional<E> lower(E val) {
    return Optional.ofNullable(table.lowerKey(val));
  }

  /*
   * Returns the least element in this set strictly greater than the given element, or null if there is no such element.
   */
  public Optional<E> higher(E val) {
    return Optional.ofNullable(table.higherKey(val));
  }

  /*
   * Returns the least element in this set greater than or equal to the given element, or null if there is no such element.
   */
  public Optional<E> ceiling(E val) {
    return Optional.ofNullable(table.ceilingKey(val));
  }

  /*
   * Returns the greatest element in this set less than or equal to the given element, or null if there is no such element.
   */
  public Optional<E> floor(E val) {
    return Optional.ofNullable(table.floorKey(val));
  }

  /*
   * Returns a sorted array corresponding to the multiset.
   */
  public List<E> toArray() {
    int i = 0;
    List<E> lis = new ArrayList<>();
    for (E val: set())
      for (int s = 0, e = count(val); s < e; s++) lis.add(val);
    return lis;
  }

  /*
   * Returns the i-th elements of this multiset.
   */
  public E get(int i) {
    int j = 0;
    for (E val: set()) {
      for (int s = 0, e = count(val); s < e; s++) {
        if (j == i) return val;
        j++;
      }
    }
    return null;
  }

}
