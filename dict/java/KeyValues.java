/*
 * Key and values data structure.
 */
class KeyValues<K, V> {

  /*
   * // initializations
   * KeyValues<String, Integer> kv = new KeyValues<>();
   *
   * // operations
   * kv.put("even", 0);
   * kv.put("odd", 1);
   * kv.put("even", 2);
   * wr.writeLine(kv.toString()); // => { even: 0 2, odd: 1 };
   * if (kv.containsKey("even")) {
   * }
   * if (kv.containsValue(0)) {
   * }
   *
   * // iterations
   * for (String key: kv.keySet()) {
   *   wr.writeLine(key);
   *   for (Integer val: kv.get(key)) {
   *     wr.writeLine(val);
   *   }
   * }
   *
   */

  private Map<K, List<V>> map;

  /*
   * Constructs an empty HashMap
   */
  public <K, V> KeyValues() {
    map = new HashMap<>();
  }

  /*
   * Removes all of the mappings from this map (optional operation). The map will be empty after this call returns.
   */
  public void clear() {
    map.clear();
  }

 /*
  * Returns true if this map contains a mapping for the specified key.
  */
  public boolean containsKey(Object key) {
    return map.containsKey(key);
  }

 /*
  * Returns true if this map maps one or more keys to the specified value.
  */
  public boolean containsValue(Object value) {
    return map.keySet().stream().anyMatch(x -> map.get(x).contains(value));
  }

  /*
   * Returns the values to which the specified key is mapped, or empty list if this map contains no mapping for the key.
   */
  public List<V> get(Object key) {
    if (map.containsKey(key)) return map.get(key);
    return Collections.emptyList();
  }

  /*
   * Returns true if this map contains no key-values mappings.
   */
  public boolean isEmpty() {
    return map.isEmpty();
  }

  /*
   * Returns a Set view of the keys contained in this map.
   */
  public Set<K> keySet() {
    return map.keySet();
  }

  /*
   * Associates the specified value with the specified key in this map.
   */
  public void put(K key, V val) {
    if (containsKey(key)) map.get(key).add(val);
    else {
      List<V> lis = new ArrayList<>();
      lis.add(val);
      map.put(key, lis);
    }
  }

  /*
   * Returns a string representation of this map.
   */
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder().append("{\n");
    for (K key: keySet()) {
      sb.append("  ").append(key).append(":");
      for (V val: get(key)) sb.append(" ").append(val);
      sb.append("\n");
    }
    return sb.append("}\n").toString();
  }

}
