/*
 * Permutator for Heap's algorithm.
 */
class Permutator<E> implements Iterator<E[]> {

  /*
   *  var a = new Integer[] { 1, 2, 3 };
   *  Permutator<Integer> it = new Permutator<>(a);
   *  while (it.hasNext()) {
   *    wr.writeLine(it.next());
   *  }
   *
   * => [2, 1, 3]
   *    [3, 1, 2]
   *    [1, 3, 2]
   *    [2, 3, 1]
   *    [3, 2, 1]
   *    [1, 2, 3]
   *
   */

  E[] o, p;
  int sp;
  int[] stack;

  private void swap (int i, int j) { E e = p[i]; p[i] = p[j]; p[j] = e; }

  public Permutator(E[] args) {
    stack = new int[args.length];    // Arrays.fill(stack, 0);
    o = args;
    p = Arrays.copyOf(o, stack.length);
  }

  /*
   * Returns true if the iteration has more elements.
   */
  @Override
  public boolean hasNext() {
    return o != null;
  }

  /*
   * Increments the iterator's index by one and returns the next permutation.
   */
  @Override
  public E[] next() {
    while (sp < stack.length) {
      if (stack[sp] < sp) {
        if (sp % 2 == 0) swap(0, sp);
        else swap(stack[sp], sp);
        stack[sp]++;
        sp = 0;
        return p;
      } else {
        stack[sp] = 0;
        sp++;
      }
    }
    p = o;
    o = null;
    return p;
  }

}
