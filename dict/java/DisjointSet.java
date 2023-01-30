/* 
 * Disjoint-set data structure - Library (Java)
 * 
 * Copyright (c) 2021 Project Nayuki. (MIT License)
 * https://www.nayuki.io/page/disjoint-set-data-structure
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * - The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 * - The Software is provided "as is", without warranty of any kind, express or
 *   implied, including but not limited to the warranties of merchantability,
 *   fitness for a particular purpose and noninfringement. In no event shall the
 *   authors or copyright holders be liable for any claim, damages or other
 *   liability, whether in an action of contract, tort or otherwise, arising from,
 *   out of or in connection with the Software or the use or other dealings in the
 *   Software.
 */


/* 
 * Disjoint sets.
 */
class DisjointSet {

  private int setCount;
  private int[] parents, sizes;

  /*
   * Constructs a new set containing the given number of singleton sets:
   * new DisjointSet(3) = {{0}, {1}, {2}}.
   */
  public DisjointSet(int n) {
    parents = new int[n];
    sizes   = new int[n];
    for (int i = 0; i < n; i++) {
      parents[i] = i;
      sizes  [i] = 1;
    }
    setCount = n;
  }

  private int getRepr(int i) {
    int parent = parents[i];
    while (true) {
      int grandparent = parents[parent];
      if (grandparent == parent) return parent;
      parents[i] = grandparent;  // Partial path compression
      i = parent;
      parent = grandparent;
    }
  }

  /*
   * Returns the number of disjoint sets overall.
   */
  public int size() {
    return setCount;
  }

  /*
   * Returns the size of the set that the given element is a member of.
   */
  public int getElementCount(int i) {
    return sizes[getRepr(i)];
  }

  /*
   * Tests whether the given two elements are members of the same set.
   */
  public boolean areInSameSet(int i, int j) {
    return getRepr(i) == getRepr(j);
  }

  /*
   * Merges together the sets that the given two elements belong to.
   * If the two elements belong to different sets, then the two sets are merged and the method returns true.
   * Otherwise they belong in the same set, nothing is changed and the method returns false.
   */
  public boolean merge(int i, int j) {
    int repr0 = getRepr(i);
    int repr1 = getRepr(j);
    if (repr0 == repr1) return false;
    if (sizes[repr0] < sizes[repr1]) {
      int temp = repr0;
      repr0 = repr1;
      repr1 = temp;
    }
    parents[repr1] = repr0;
    sizes[repr0] += sizes[repr1];
    sizes[repr1] = 0;
    setCount--;
    return true;
  }

}
